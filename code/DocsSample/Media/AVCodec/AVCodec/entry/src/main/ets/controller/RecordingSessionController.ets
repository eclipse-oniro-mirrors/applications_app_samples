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
import { RecordingHistoryModel, RecordingSegmentInfo } from '../model/RecordingHistoryModel';
import Logger from '../common/utils/Logger';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaSessionStore } from '../model/MediaSessionStore';
import { RecordingClock } from '../model/RecordingClock';
import { RecordingMetadataReader } from './RecordingMetadataReader';
import { RecordingOutputCheck } from '../model/RecordingOutputValidation';

export interface RecordingResultInfo {
  sessionId: string;
  recordedAt: number;
  durationSeconds: number;
  title: string;
  primaryUri: string;
  secondaryUri: string;
  complete: boolean;
  validation?: RecordingOutputCheck[];
  segments?: RecordingSegmentInfo[];
}

export enum RecordingPhase { PREPARING, READY, RECORDING, PAUSED, FINALIZING, FINISHED, FAILED }

export class RecordingSessionController {
  public phase: RecordingPhase = RecordingPhase.PREPARING;
  private sessionId: string = '';
  private clock: RecordingClock = new RecordingClock();
  private pauseTask: Promise<boolean> | undefined = undefined;
  private finishTask: Promise<RecordingResultInfo | undefined> | undefined = undefined;
  private lease: MediaTaskLease | undefined = undefined;

  constructor() {
    this.sessionId = recorder.getDiagnostics().sessionId;
    const active: MediaTaskLease | undefined = MediaTaskCoordinator.current();
    if (active?.kind === 'recording') { this.lease = active; }
  }

  mark(stage: string, result: string = 'ok'): void { recorder.markStage(this.sessionId, stage, result); }
  ready(): void { if (this.phase === RecordingPhase.PREPARING) { this.phase = RecordingPhase.READY; } }
  start(): boolean {
    if (this.phase !== RecordingPhase.READY || !recorder.startNative()) { return false; }
    this.clock.start();
    this.phase = RecordingPhase.RECORDING;
    if (this.lease !== undefined) { MediaTaskCoordinator.running(this.lease); }
    return true;
  }

  finish(context: common.UIAbilityContext, data: CameraDataModel, stopCamera: () => Promise<void>,
    releaseCamera: () => Promise<void>): Promise<RecordingResultInfo | undefined> {
    if (this.finishTask === undefined) {
      this.phase = RecordingPhase.FINALIZING;
      if (this.lease !== undefined) { MediaTaskCoordinator.cancelling(this.lease); }
      this.finishTask = this.finalize(context, data, stopCamera, releaseCamera);
    }
    return this.finishTask;
  }

  elapsedSeconds(): number { return this.clock.seconds(); }

  setPaused(paused: boolean): Promise<boolean> {
    if (this.pauseTask !== undefined) { return this.pauseTask; }
    if (this.phase !== RecordingPhase.RECORDING && this.phase !== RecordingPhase.PAUSED) {
      return Promise.resolve(false);
    }
    this.pauseTask = this.changePause(paused);
    void this.pauseTask.finally((): void => { this.pauseTask = undefined; });
    return this.pauseTask;
  }

  private async changePause(paused: boolean): Promise<boolean> {
    try {
      const response = await recorder.setPaused(this.sessionId, paused);
      if (response.code !== 0) { return false; }
      this.clock.pause(paused);
      if (this.phase !== RecordingPhase.FINALIZING) {
        this.phase = paused ? RecordingPhase.PAUSED : RecordingPhase.RECORDING;
      }
      return true;
    } catch (error) {
      Logger.warn('RecordingSession', 'Pause failed: ' + JSON.stringify(error));
      return false;
    }
  }

  private async closeFile(fd: number): Promise<boolean> {
    if (fd < 0) { return true; }
    try {
      await fileIo.close(fd);
      return true;
    } catch (_error) {
      this.mark('files.close_failed', 'close_failed');
      return false;
    }
  }

  private async finalize(context: common.UIAbilityContext, data: CameraDataModel,
    stopCamera: () => Promise<void>, releaseCamera: () => Promise<void>): Promise<RecordingResultInfo | undefined> {
    if (this.pauseTask !== undefined) { await this.pauseTask; }
    const duration: number = this.elapsedSeconds();
    this.mark('stop.requested');
    let nativeReleased: boolean = false;
    let primaryClosed: boolean = false;
    let secondaryClosed: boolean = false;
    try {
      await stopCamera();
    } catch (_error) {
      this.mark('camera.failed', 'stop_failed');
      await releaseCamera();
    }
    // StopStart失败或异步任务提交失败时，仍需尝试执行会等待资源释放的StopEnd。
    try {
      await recorder.stopBeginNative();
    } catch (error) {
      Logger.warn('RecordingSession', 'Stop begin failed: ' + JSON.stringify(error));
    }
    try {
      await recorder.stopEndNative();
    } catch (error) {
      Logger.warn('RecordingSession', 'Stop end failed: ' + JSON.stringify(error));
    } finally {
      const finalSnapshot = recorder.getDiagnostics();
      nativeReleased = finalSnapshot.sessionId === this.sessionId &&
        finalSnapshot.timeline.some((event): boolean => event.stage === 'native.released');
      // fd仍可能被Native持有时不关闭，避免后台写入已复用的描述符。
      if (nativeReleased) {
        primaryClosed = await this.closeFile(data.outputfd);
        secondaryClosed = await this.closeFile(data.secondaryOutputfd);
        data.outputfd = -1;
        data.secondaryOutputfd = -1;
        if (primaryClosed && secondaryClosed) { this.mark('files.closed'); }
      }
      await releaseCamera();
      this.mark('camera.released');
    }
    if (!nativeReleased) { throw new Error('Native recorder release was not confirmed'); }
    const diagnostics = recorder.getDiagnostics();
    if (this.lease !== undefined) { MediaTaskCoordinator.release(this.lease); }
    if (this.lease !== undefined) {
      await MediaSessionStore.finish(context, this.lease.id)
        .catch((error: Error): void => Logger.warn('RecordingSession', error.message));
    }
    const result: RecordingResultInfo = {
      sessionId: diagnostics.sessionId, recordedAt: Date.now(), durationSeconds: duration,
      title: data.outputTitle,
      primaryUri: diagnostics.primary.fileBytes > 0 && diagnostics.primary.frames > 0 ? data.outputUri : '',
      secondaryUri: diagnostics.secondary.fileBytes > 0 && diagnostics.secondary.frames > 0 ? data.secondaryOutputUri : '',
      complete: primaryClosed && secondaryClosed && diagnostics.primary.frames > 0 &&
        (!data.enableDualOutput || diagnostics.secondary.frames > 0) &&
        diagnostics.failure.stage.length === 0 &&
        (diagnostics.endReason.length === 0 || diagnostics.endReason === 'user_stop')
    };
    result.validation = [await RecordingMetadataReader.validate(data.outputUri, false, {
      width: diagnostics.primary.width, height: diagnostics.primary.height, hasAudio: data.recordAudio,
      durationMs: duration * 1000, fileBytes: diagnostics.primary.fileBytes
    }, primaryClosed)];
    if (data.enableDualOutput) {
      result.validation.push(await RecordingMetadataReader.validate(data.secondaryOutputUri, true, {
        width: diagnostics.secondary.width, height: diagnostics.secondary.height, hasAudio: data.recordAudio,
        durationMs: duration * 1000, fileBytes: diagnostics.secondary.fileBytes
      }, secondaryClosed));
    }
    this.phase = result.complete ? RecordingPhase.FINISHED : RecordingPhase.FAILED;
    try {
      const history = new RecordingHistoryModel();
      await history.load(context);
      await history.add(result.primaryUri, result.title, result.secondaryUri, result.recordedAt, duration,
        result.sessionId, result.complete, data.recordingGroupId, result.validation);
    } catch (error) { Logger.warn('RecordingSession', 'History persistence failed: ' + JSON.stringify(error)); }
    return result;
  }
}
