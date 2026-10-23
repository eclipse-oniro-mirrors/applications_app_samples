/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import recorder from 'librecorder.so';
import { CameraDataModel } from '../model/CameraDataModel';
import { RecordingHistoryModel } from '../model/RecordingHistoryModel';
import { RecordingReport, RecordingReportStore } from '../model/RecordingReportStore';
import { RecorderDiagnosticsModel } from '../model/RecorderDiagnosticsModel';
import { RecordingMetadataReader } from './RecordingMetadataReader';
import { LocalizedText } from '../common/LocalizedText';
import Logger from '../common/utils/Logger';

export enum RecordingPhase { PREPARING, READY, RECORDING, FINALIZING, FINISHED, FAILED }

export class RecordingSessionController {
  phase: RecordingPhase = RecordingPhase.PREPARING;
  private sessionId: string = '';
  private startedAt: number = 0;
  private finishTask: Promise<RecordingReport | undefined> | undefined = undefined;

  constructor() { this.sessionId = recorder.getDiagnostics().sessionId; }

  mark(stage: string, result: string = 'ok'): void { recorder.markStage(this.sessionId, stage, result); }
  ready(): void { if (this.phase === RecordingPhase.PREPARING) { this.phase = RecordingPhase.READY; } }
  start(): boolean {
    if (this.phase !== RecordingPhase.READY || !recorder.startNative()) { return false; }
    this.startedAt = Date.now();
    this.phase = RecordingPhase.RECORDING;
    return true;
  }

  finish(context: common.UIAbilityContext, data: CameraDataModel, stopCamera: () => Promise<void>,
    releaseCamera: () => Promise<void>): Promise<RecordingReport | undefined> {
    if (this.finishTask === undefined) {
      this.phase = RecordingPhase.FINALIZING;
      this.finishTask = this.finalize(context, data, stopCamera, releaseCamera);
    }
    return this.finishTask;
  }

  private async closeFile(fd: number): Promise<boolean> {
    if (fd < 0) { return true; }
    try { await fileIo.close(fd); return true; }
    catch (_error) { this.mark('files.close_failed', 'close_failed'); return false; }
  }

  private async finalize(context: common.UIAbilityContext, data: CameraDataModel,
    stopCamera: () => Promise<void>, releaseCamera: () => Promise<void>): Promise<RecordingReport | undefined> {
    const duration: number = this.startedAt > 0 ? (Date.now() - this.startedAt) / 1000 : 0;
    this.mark('stop.requested');
    let nativeReleased: boolean = false;
    try {
      await stopCamera();
    } catch (_error) {
      this.mark('camera.failed', 'stop_failed');
      await releaseCamera();
    }
    // StopStart 失败或异步任务提交失败时，仍需尝试执行会等待资源释放的 StopEnd。
    try { await recorder.stopBeginNative(); }
    catch (error) { Logger.warn('RecordingSession', 'Stop begin failed: ' + JSON.stringify(error)); }
    try {
      await recorder.stopEndNative();
    } catch (error) {
      Logger.warn('RecordingSession', 'Stop end failed: ' + JSON.stringify(error));
    } finally {
      const finalSnapshot = recorder.getDiagnostics();
      nativeReleased = finalSnapshot.sessionId === this.sessionId &&
        finalSnapshot.timeline.some((event): boolean => event.stage === 'native.released');
      // fd 仍可能被 Native 持有时不关闭，避免后台写入已复用的描述符。
      if (nativeReleased) {
        const primaryClosed: boolean = await this.closeFile(data.outputfd);
        const secondaryClosed: boolean = await this.closeFile(data.secondaryOutputfd);
        data.outputfd = -1;
        data.secondaryOutputfd = -1;
        if (primaryClosed && secondaryClosed) { this.mark('files.closed'); }
      }
      await releaseCamera();
      this.mark('camera.released');
    }
    if (!nativeReleased) { throw new Error('Native recorder release was not confirmed'); }
    const diagnostics = recorder.getDiagnostics();
    const report: RecordingReport = {
      version: 1, sessionId: diagnostics.sessionId, recordedAt: Date.now(), durationSeconds: duration,
      title: data.outputTitle,
      primaryUri: diagnostics.primary.fileBytes > 0 && diagnostics.primary.frames > 0 ? data.outputUri : '',
      secondaryUri: diagnostics.secondary.fileBytes > 0 && diagnostics.secondary.frames > 0 ? data.secondaryOutputUri : '',
      primaryDump: data.primaryDumpPath, secondaryDump: data.secondaryDumpPath,
      diagnostics: diagnostics, fileMetadata: '', text: ''
    };
    this.phase = diagnostics.failure.stage.length > 0 ||
      (diagnostics.endReason.length > 0 && diagnostics.endReason !== 'user_stop') ?
      RecordingPhase.FAILED : RecordingPhase.FINISHED;
    report.text = RecordingReportStore.text(report);
    // 先落最终快照，再查询成品元数据；查询失败仍能打开本次报告。
    try { await RecordingReportStore.save(context, report); }
    catch (error) {
      report.persistenceFailed = true;
      Logger.warn('RecordingSession', 'Report persistence failed: ' + JSON.stringify(error));
    }
    try {
      const history = new RecordingHistoryModel();
      await history.load(context);
      await history.add(report.primaryUri, report.title, report.secondaryUri, report.recordedAt, duration,
        RecorderDiagnosticsModel.streamSummary(diagnostics.primary, -1),
        report.secondaryUri.length > 0 ? RecorderDiagnosticsModel.streamSummary(diagnostics.secondary, -1) : '',
        report.sessionId);
    } catch (error) { Logger.warn('RecordingSession', 'History persistence failed: ' + JSON.stringify(error)); }
    return report;
  }

  static async enrich(context: common.Context, report: RecordingReport): Promise<RecordingReport> {
    if (report.fileMetadata.length > 0) { return report; }
    const metadata: string[] = [];
    metadata.push(await RecordingMetadataReader.read(report.primaryUri,
      LocalizedText.get($r('app.string.recorder_primary'))));
    metadata.push(await RecordingMetadataReader.read(report.secondaryUri,
      LocalizedText.get($r('app.string.recorder_secondary'))));
    report.fileMetadata = metadata.filter((line: string): boolean => line.length > 0).join(String.fromCharCode(10));
    report.text = RecordingReportStore.text(report);
    await RecordingReportStore.save(context, report);
    report.persistenceFailed = false;
    return report;
  }
}
