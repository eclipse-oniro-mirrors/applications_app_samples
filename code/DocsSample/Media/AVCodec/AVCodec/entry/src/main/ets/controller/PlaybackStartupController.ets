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
import { BusinessError } from '@kit.BasicServicesKit';
import player, { PlaybackResult, PlaybackStartResult } from 'libplayer.so';
import { PlayerSettingsModel } from '../model/PlayerSettingsModel';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaReports, MediaInputIdentity } from '../model/MediaSessionReport';
import { MediaSessionStore } from '../model/MediaSessionStore';
import Logger from '../common/utils/Logger';

export type PlaybackStartupKind = 'started' | 'releasing' | 'rejected' | 'close_pending';
export type PlaybackStartupError = 'open' | 'empty' | 'busy' | 'invalid';
export type PlaybackStartupReason = PlaybackStartupError | 'none' | 'close_unconfirmed';

// 工厂限定状态与原因的组合，调用方只需按结果类别决定后续动作。
export class PlaybackStartupResult {
  public readonly kind: PlaybackStartupKind;
  public readonly reason: PlaybackStartupReason;

  private constructor(kind: PlaybackStartupKind, reason: PlaybackStartupReason) {
    this.kind = kind;
    this.reason = reason;
  }

  // Native受理，完成回调持有资源归还责任。
  static started(): PlaybackStartupResult { return new PlaybackStartupResult('started', 'none'); }
  // Native尚未释放，禁止同步关闭输入。
  static releasing(error: PlaybackStartupError): PlaybackStartupResult {
    return new PlaybackStartupResult('releasing', error);
  }
  // 起播失败且资源已归还，可以开始下一任务。
  static rejected(error: PlaybackStartupError): PlaybackStartupResult {
    return new PlaybackStartupResult('rejected', error);
  }
  // 关闭结果不明，保留File与租约并阻止后续任务。
  static closePending(): PlaybackStartupResult {
    return new PlaybackStartupResult('close_pending', 'close_unconfirmed');
  }
}

class PlaybackStartupAttempt {
  private context: common.Context | undefined;
  private lease: MediaTaskLease;
  private retainedInputs: Map<number, fileIo.File>;
  private input: fileIo.File | undefined = undefined;
  private closeAttempted: boolean = false;
  private closed: boolean = false;
  private completionHandled: boolean = false;
  private nativeOwnsLease: boolean = false;
  private sourceIdentity: MediaInputIdentity | undefined = undefined;

  constructor(context: common.Context | undefined, lease: MediaTaskLease, retainedInputs: Map<number, fileIo.File>) {
    this.context = context;
    this.lease = lease;
    this.retainedInputs = retainedInputs;
  }

  run(path: string, settings: PlayerSettingsModel, smartFluency: boolean,
    prepare: (lease: MediaTaskLease) => void,
    completed: (result: PlaybackResult, cleanupPending: boolean) => void): Promise<PlaybackStartupResult> {
    let result: PlaybackStartupResult = PlaybackStartupResult.rejected('open');
    let operation: Promise<PlaybackStartResult> | undefined = undefined;
    try {
      this.beginReport();
      this.input = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
      const stat: fileIo.Stat = fileIo.statSync(this.input.fd);
      this.sourceIdentity = MediaReports.inputSnapshot(path, stat.size, stat.mtime);
      if (stat.size > 0) {
        prepare(this.lease);
        operation = player.playAsync(settings.createPlayOptions({
          inputFileFd: this.input.fd,
          inputFileOffset: 0,
          inputFileSize: stat.size,
          isSmartFluencySupported: smartFluency
        }), (completion: PlaybackResult): void => this.complete(completion, completed));
      } else { result = PlaybackStartupResult.rejected('empty'); }
    } catch (error) {
      Logger.error('PlaybackStartup', 'Launch failed: ' + String(error));
      this.nativeOwnsLease = player.getState() !== player.PlayerState.IDLE;
      result = this.failedResult('open');
    }
    if (operation === undefined) {
      return Promise.resolve(result).then((startupResult: PlaybackStartupResult): PlaybackStartupResult =>
        this.finish(startupResult));
    }
    return operation.then((launch: PlaybackStartResult): PlaybackStartupResult => {
      this.nativeOwnsLease = launch.completionOwned && !this.completionHandled;
      if (launch.started && !this.completionHandled && MediaTaskCoordinator.owns(this.lease) &&
        MediaTaskCoordinator.currentPhase() !== 'cancelling') {
        MediaTaskCoordinator.running(this.lease);
        result = PlaybackStartupResult.started();
      } else {
        result = this.completionHandled && !this.closed ? PlaybackStartupResult.closePending() :
          this.failedResult('invalid');
      }
      return result;
    }).catch((error: Error): PlaybackStartupResult => {
      Logger.error('PlaybackStartup', 'Launch failed: ' + String(error));
      this.nativeOwnsLease = player.getState() !== player.PlayerState.IDLE;
      return this.failedResult('open');
    }).then((startupResult: PlaybackStartupResult): PlaybackStartupResult => this.finish(startupResult));
  }

  private finish(result: PlaybackStartupResult): PlaybackStartupResult {
    if (!this.nativeOwnsLease && !this.completionHandled) {
      if (this.closeInput()) {
        this.finishFailedReport();
        MediaTaskCoordinator.release(this.lease);
      } else { result = PlaybackStartupResult.closePending(); }
    }
    return result;
  }

  private failedResult(error: PlaybackStartupError): PlaybackStartupResult {
    if (!this.nativeOwnsLease) { return PlaybackStartupResult.rejected(error); }
    MediaTaskCoordinator.cancelling(this.lease);
    return PlaybackStartupResult.releasing(error);
  }

  private closeInput(): boolean {
    if (this.input === undefined || this.closed) { return true; }
    if (this.closeAttempted) { return false; }
    this.closeAttempted = true;
    try {
      fileIo.closeSync(this.input);
      this.closed = true;
    } catch (error) {
      if ((error as BusinessError).code === 13900008) { this.closed = true; return true; }
      // 关闭结果不明时保留File和租约，不重试可能已被复用的fd。
      this.retainedInputs.set(this.input.fd, this.input);
      MediaTaskCoordinator.cancelling(this.lease);
      Logger.error('PlaybackStartup', 'Close input failed: ' + String(error));
    }
    return this.closed;
  }

  private complete(result: PlaybackResult, completed: (result: PlaybackResult, cleanupPending: boolean) => void): void {
    if (this.completionHandled) { return; }
    this.completionHandled = true;
    if (!this.closeInput()) { completed(result, true); return; }
    try {
      if (this.context !== undefined && MediaTaskCoordinator.owns(this.lease)) {
        void MediaSessionStore.finish(this.context, this.lease.id,
          MediaReports.playback(this.lease.id, player.getCompletedPlaybackInfo(), result.reason, this.sourceIdentity))
          .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
      }
    } catch (error) { Logger.warn('PlaybackStartup', 'Session report: ' + String(error)); } finally {
      MediaTaskCoordinator.release(this.lease);
    }
    completed(result, false);
  }

  private beginReport(): void {
    if (this.context === undefined) { return; }
    void MediaSessionStore.begin(this.context, {
      id: this.lease.id,
      operation: 'playback',
      startedAt: this.lease.startedAt
    }).catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
  }

  private finishFailedReport(): void {
    if (this.context === undefined) { return; }
    try {
      const report = MediaReports.base(this.lease.id, 'playback', 'failed');
      report.error = MediaReports.error('playback.prepare', -1, 'Playback preparation did not complete');
      void MediaSessionStore.finish(this.context, this.lease.id, report)
        .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
    } catch (error) { Logger.warn('PlaybackStartup', 'Failed session report: ' + String(error)); }
  }
}

export class PlaybackStartupController {
  private static unconfirmedInputs: Map<number, fileIo.File> = new Map<number, fileIo.File>();

  // prepare先交接输入与租约，异步启动期间保持占用，完成回调负责归还。
  static async launch(context: common.Context | undefined, path: string, settings: PlayerSettingsModel,
    smartFluency: boolean, prepare: (lease: MediaTaskLease) => void,
    completed: (result: PlaybackResult, cleanupPending: boolean) => void): Promise<PlaybackStartupResult> {
    if (PlaybackStartupController.unconfirmedInputs.size > 0) { return PlaybackStartupResult.closePending(); }
    if (!MediaFileActivity.beginLaunch()) { return PlaybackStartupResult.rejected('busy'); }
    try {
      const lease: MediaTaskLease | undefined = MediaTaskCoordinator.acquire('playback');
      if (lease === undefined) { return PlaybackStartupResult.rejected('busy'); }
      return await new PlaybackStartupAttempt(context, lease, PlaybackStartupController.unconfirmedInputs)
        .run(path, settings, smartFluency, prepare, completed);
    } finally { MediaFileActivity.endLaunch(); }
  }
}
