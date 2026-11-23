/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import transcoder, { TranscodeRequest, TranscodeStatus } from 'libtranscoder.so';
import player from 'libplayer.so';
import recorder from 'librecorder.so';
import { LocalizedText } from '../common/LocalizedText';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator } from '../model/MediaTaskCoordinator';
import { MediaSessionStore } from '../model/MediaSessionStore';
import { MediaReports } from '../model/MediaSessionReport';
import { TranscodeFilesModel, TranscodeHistoryEntry } from '../model/TranscodeFilesModel';
import { TranscodeTaskSnapshot } from '../model/TranscodeTaskSnapshot';
import { idleTranscodeStatus } from '../model/TranscodeStatusModel';
import { TranscodeExecution, TranscodeExecutionResult } from './TranscodeExecutionContext';
import { TranscodeFileCloser } from './TranscodeFileCloser';
import type { TranscodeHistoryCleanup } from '../model/TranscodeFilesModel';

const PROGRESS_INTERVAL_MS: number = 250;
type TranscodeCloseStage = 'files.close' | 'history.close';

// 任务持有输入和输出直到收尾结束。进度回调在任务有效期内同步调用。
export class TranscodeExecutionController {
  private cancelRequested: boolean = false;
  private task: TranscodeExecution | undefined = undefined;
  private nativeRunning: boolean = false;
  private pollTimer: number = 0;

  async run(context: common.Context, uri: string, title: string, snapshot: TranscodeTaskSnapshot,
    onPreflight: (status: TranscodeStatus) => void,
    onProgress: (status: TranscodeStatus) => void): Promise<TranscodeExecutionResult | undefined> {
    if (this.task !== undefined || player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active ||
      !MediaFileActivity.beginTranscode()) { return undefined; }
    try {
      this.cancelRequested = false;
      const task: TranscodeExecution =
        new TranscodeExecution(context.filesDir, uri, title, snapshot, MediaTaskCoordinator.current());
      this.task = task;
      try {
        await this.prepareExecution(context, task, onPreflight);
        await this.runExecution(task, onProgress);
      } catch (error) {
        const failure: Error = error as Error;
        this.recordExecutionFailure(task, failure.message || JSON.stringify(error));
      }
      await this.finishExecution(context, task);
      return task.result();
    } finally {
      this.stopPolling();
      this.task = undefined;
      MediaFileActivity.endTranscode();
    }
  }

  cancel(): void {
    const task: TranscodeExecution | undefined = this.task;
    if (task === undefined || this.cancelRequested) { return; }
    this.cancelRequested = true;
    if (task.lease !== undefined) { MediaTaskCoordinator.cancelling(task.lease); }
    if (this.nativeRunning) { transcoder.cancel(); }
  }

  isActive(): boolean { return this.task !== undefined; }

  stopPolling(): void {
    if (this.pollTimer !== 0) { clearInterval(this.pollTimer); this.pollTimer = 0; }
  }

  private async prepareExecution(context: common.Context, task: TranscodeExecution,
    onPreflight: (status: TranscodeStatus) => void): Promise<void> {
    if (!await fileIo.access(task.directory)) { await fileIo.mkdir(task.directory); }
    const directoryStat: fileIo.Stat = await fileIo.lstat(task.directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) {
      throw new Error('Unsafe output directory');
    }
    task.allocateArtifactId(await fileIo.listFile(task.directory));
    await MediaSessionStore.begin(context, { id: task.sessionId, operation: 'transcode', startedAt: Date.now() });
    if (this.cancelRequested) { return; }
    task.input = await fileIo.open(task.sourceUri, fileIo.OpenMode.READ_ONLY);
    try {
      const sourceStat: fileIo.Stat = await fileIo.stat(task.input.fd);
      task.sourceIdentity = MediaReports.inputSnapshot(task.sourceUri, sourceStat.size, sourceStat.mtime);
    } catch (_error) { /* 无法读取素材属性时继续转码，报告不参与素材基线比较。 */ }
    const request: TranscodeRequest = task.snapshot.request(task.input.fd, 0);
    if (this.cancelRequested) { return; }
    const inspection: Promise<TranscodeStatus> = transcoder.inspect(request);
    const preflight: TranscodeStatus = await inspection;
    if (this.cancelRequested) { return; }
    if (preflight.state !== 2) { throw new Error(preflight.detail || 'Source preflight failed'); }
    onPreflight(preflight);
    if (!task.snapshot.validRange(preflight.durationUs)) {
      throw new Error(LocalizedText.get($r('app.string.transcode_range_invalid')));
    }
    task.output = await fileIo.open(task.partialPath,
      fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC | fileIo.OpenMode.NOFOLLOW);
  }

  private async runExecution(task: TranscodeExecution, onProgress: (status: TranscodeStatus) => void): Promise<void> {
    if (this.cancelRequested) {
      task.status = idleTranscodeStatus();
      task.status.state = 3;
      task.status.stage = 'cancelled';
      task.notice = LocalizedText.get($r('app.string.transcode_cancelled'));
      return;
    }
    if (task.input === undefined || task.output === undefined) { throw new Error('Missing transcode files'); }
    const request: TranscodeRequest = task.snapshot.request(task.input.fd, task.output.fd);
    const completion: Promise<TranscodeStatus> = transcoder.start(request);
    this.nativeRunning = true;
    if (task.lease !== undefined) { MediaTaskCoordinator.running(task.lease); }
    this.pollTimer = setInterval((): void => {
      if (this.task === task && this.nativeRunning) { onProgress(transcoder.getStatus()); }
    }, PROGRESS_INTERVAL_MS);
    try {
      task.status = await completion;
    } finally {
      this.nativeRunning = false;
      this.stopPolling();
    }
    if (task.status.state === 2) {
      task.notice = LocalizedText.get($r('app.string.transcode_complete'));
    } else if (task.status.state === 3) {
      task.notice = LocalizedText.get($r('app.string.transcode_cancelled'));
    } else {
      task.notice = LocalizedText.get($r('app.string.transcode_failed')) + ' ' +
        task.status.detail + ' (' + task.status.errorCode + ')';
    }
  }

  private recordExecutionFailure(task: TranscodeExecution, detail: string): void {
    if (task.status.state < 2 || (task.status.state === 2 && task.resultPath.length === 0)) {
      task.status = idleTranscodeStatus();
      task.status.state = 4;
      task.status.stage = 'files';
      task.status.detail = detail;
    }
    task.notice = LocalizedText.get($r('app.string.transcode_failed')) + ' ' + detail;
  }

  private async finishExecution(context: common.Context, task: TranscodeExecution): Promise<void> {
    this.stopPolling();
    const inputClosed: boolean = await TranscodeFileCloser.close(task.input);
    const outputClosed: boolean = await TranscodeFileCloser.close(task.output);
    if (!inputClosed || !outputClosed) {
      this.markClosePending(task, 'files.close');
    } else {
      await this.publishOutput(task);
    }
    if (task.status.state >= 2 && task.id.length > 0) {
      await this.persistExecution(task);
    }
    try {
      if (!task.closePending) {
        await MediaSessionStore.finish(context, task.sessionId,
          MediaReports.transcode(task.sessionId, task.status, task.snapshot.configuration, task.sourceIdentity));
      }
    } catch (error) {
      task.notice += ' ' + JSON.stringify(error);
    }
  }

  private async publishOutput(task: TranscodeExecution): Promise<void> {
    if (task.status.state === 2) {
      try {
        await fileIo.rename(task.partialPath, task.outputPath);
        task.resultPath = task.outputPath;
      } catch (error) {
        this.recordExecutionFailure(task, (error as Error).message || JSON.stringify(error));
      }
    }
    if (task.output !== undefined && task.resultPath.length === 0) {
      await fileIo.unlink(task.partialPath).catch((): void => {});
    }
  }

  private async persistExecution(task: TranscodeExecution): Promise<void> {
    const entry: TranscodeHistoryEntry = {
      id: task.id,
      createdAt: Date.now(),
      title: task.title,
      configuration: task.snapshot.configuration,
      status: task.status,
      hasFile: task.resultPath.length > 0
    };
    task.entry = entry;
    const cleanup: TranscodeHistoryCleanup = { closePending: false };
    try {
      await TranscodeFilesModel.persist(task.directory, entry, cleanup);
    } catch (_error) {
      task.notice += ` ${LocalizedText.get($r('app.string.transcode_history_failed'))}`;
      if (cleanup.closePending && !task.closePending) {
        this.markClosePending(task, 'history.close');
      }
    }
  }

  private markClosePending(task: TranscodeExecution, stage: TranscodeCloseStage): void {
    const detail: string = LocalizedText.get($r('app.string.transcode_close_unconfirmed'));
    if (stage === 'files.close' && (task.status.state === 2 || task.status.detail.length === 0)) {
      task.status.state = 4;
      task.status.detail = detail;
    }
    task.status.cleanupStage = stage;
    task.status.cleanupCode = -1;
    task.notice = task.status.detail === detail ? detail : `${task.notice} ${detail}`;
    task.closePending = true;
  }

}
