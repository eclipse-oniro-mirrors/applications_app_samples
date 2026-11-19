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
import player, { PlaybackResult } from 'libplayer.so';
import { PlayerSettingsModel } from '../model/PlayerSettingsModel';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaReports, MediaInputIdentity } from '../model/MediaSessionReport';
import { MediaSessionStore } from '../model/MediaSessionStore';
import Logger from '../common/utils/Logger';

export interface PlaybackStartupResult {
  started: boolean;
  nativeOwnsLease: boolean;
  error: string;
  cleanupPending?: boolean;
}

export class PlaybackStartupController {
  private static unconfirmedInputs: Map<number, fileIo.File> = new Map<number, fileIo.File>();

  static launch(context: common.Context | undefined, path: string, settings: PlayerSettingsModel,
    smartFluency: boolean, prepare: (lease: MediaTaskLease) => void,
    completed: (result: PlaybackResult, cleanupPending: boolean) => void): PlaybackStartupResult {
    const result: PlaybackStartupResult = { started: false, nativeOwnsLease: false, error: '' };
    if (PlaybackStartupController.unconfirmedInputs.size > 0) {
      result.error = 'close_unconfirmed'; result.cleanupPending = true; return result;
    }
    if (!MediaFileActivity.beginLaunch()) { result.error = 'busy'; return result; }
    const lease: MediaTaskLease | undefined = MediaTaskCoordinator.acquire('playback');
    if (lease === undefined) { MediaFileActivity.endLaunch(); result.error = 'busy'; return result; }
    let input: fileIo.File | undefined = undefined;
    let closed: boolean = false;
    let closeAttempted: boolean = false;
    let completionHandled: boolean = false;
    let sourceIdentity: MediaInputIdentity | undefined = undefined;
    const closeInput = (): boolean => {
      if (input === undefined || closed) { return true; }
      if (closeAttempted) { return false; }
      closeAttempted = true;
      try {
        fileIo.closeSync(input);
        closed = true;
      } catch (error) {
        if ((error as BusinessError).code === 13900008) { closed = true; return true; }
        // 关闭结果不明时保留File和租约，不重试可能已被复用的fd。
        PlaybackStartupController.unconfirmedInputs.set(input.fd, input);
        result.cleanupPending = true;
        MediaTaskCoordinator.cancelling(lease);
        Logger.error('PlaybackStartup', 'Close input failed: ' + String(error));
      }
      return closed;
    };
    try {
      if (context !== undefined) {
        void MediaSessionStore.begin(context, { id: lease.id, operation: 'playback', startedAt: lease.startedAt })
          .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
      }
      input = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
      const stat: fileIo.Stat = fileIo.statSync(input.fd);
      const size: number = stat.size;
      sourceIdentity = MediaReports.inputSnapshot(path, size, stat.mtime);
      if (size <= 0) { result.error = 'empty'; return result; }
      prepare(lease);
      result.started = player.play(settings.createPlayOptions({
        inputFileFd: input.fd,
        inputFileOffset: 0,
        inputFileSize: size,
        isSmartFluencySupported: smartFluency
      }), (completion: PlaybackResult): void => {
        if (completionHandled) { return; }
        completionHandled = true;
        if (!closeInput()) { completed(completion, true); return; }
        try {
          if (context !== undefined && MediaTaskCoordinator.owns(lease)) {
            void MediaSessionStore.finish(context, lease.id,
              MediaReports.playback(lease.id, player.getCompletedPlaybackInfo(), completion.reason, sourceIdentity))
              .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
          }
        } catch (error) {
          Logger.warn('PlaybackStartup', 'Session report: ' + String(error));
        } finally {
          MediaTaskCoordinator.release(lease);
        }
        completed(completion, false);
      });
      // 初始化失败也可能仍在异步释放；完成回调到达前保留fd和任务租约。
      result.nativeOwnsLease = result.started || player.getState() !== player.PlayerState.IDLE;
      if (result.started) {
        MediaTaskCoordinator.running(lease);
      } else if (result.nativeOwnsLease) {
        MediaTaskCoordinator.cancelling(lease);
      }
      return result;
    } catch (error) {
      result.error = 'open';
      Logger.error('PlaybackStartup', 'Launch failed: ' + String(error));
      result.nativeOwnsLease = player.getState() !== player.PlayerState.IDLE;
      return result;
    } finally {
      if (!result.nativeOwnsLease && !completionHandled) {
        if (closeInput()) {
          if (context !== undefined) {
            const report = MediaReports.base(lease.id, 'playback', 'failed');
            report.error = MediaReports.error('playback.prepare', -1, 'Playback preparation did not complete');
            void MediaSessionStore.finish(context, lease.id, report)
              .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
          }
          MediaTaskCoordinator.release(lease);
        } else { result.error = 'close_unconfirmed'; }
      }
      MediaFileActivity.endLaunch();
    }
  }
}
