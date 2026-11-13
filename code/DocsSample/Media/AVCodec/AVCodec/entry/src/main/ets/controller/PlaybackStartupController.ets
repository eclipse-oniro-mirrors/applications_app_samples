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
import player, { PlaybackResult } from 'libplayer.so';
import { PlayerSettingsModel } from '../model/PlayerSettingsModel';
import { MediaFileActivity } from '../model/MediaFileActivity';
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaReports } from '../model/MediaSessionReport';
import { MediaSessionStore } from '../model/MediaSessionStore';
import Logger from '../common/utils/Logger';

export interface PlaybackStartupResult {
  started: boolean;
  nativeOwnsLease: boolean;
  error: string;
}

export class PlaybackStartupController {
  static launch(context: common.Context | undefined, path: string, settings: PlayerSettingsModel,
    smartFluency: boolean, prepare: (lease: MediaTaskLease) => void,
    completed: (result: PlaybackResult) => void): PlaybackStartupResult {
    const result: PlaybackStartupResult = { started: false, nativeOwnsLease: false, error: '' };
    if (!MediaFileActivity.beginLaunch()) { result.error = 'busy'; return result; }
    const lease: MediaTaskLease | undefined = MediaTaskCoordinator.acquire('playback');
    if (lease === undefined) { MediaFileActivity.endLaunch(); result.error = 'busy'; return result; }
    let input: fileIo.File | undefined = undefined;
    let closed: boolean = false;
    const closeInput = (): void => {
      if (input === undefined || closed) { return; }
      try { fileIo.closeSync(input); closed = true; }
      catch (error) { Logger.error('PlaybackStartup', 'Close input failed: ' + String(error)); }
    };
    try {
      if (context !== undefined) {
        void MediaSessionStore.begin(context, { id: lease.id, operation: 'playback', startedAt: lease.startedAt })
          .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
      }
      input = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
      const size: number = fileIo.statSync(input.fd).size;
      if (size <= 0) { result.error = 'empty'; return result; }
      prepare(lease);
      result.started = player.play(settings.createPlayOptions({ inputFileFd: input.fd, inputFileOffset: 0,
        inputFileSize: size, isSmartFluencySupported: smartFluency }), (completion: PlaybackResult): void => {
        closeInput();
        try {
          if (context !== undefined && MediaTaskCoordinator.owns(lease)) {
            void MediaSessionStore.finish(context, lease.id,
              MediaReports.playback(lease.id, player.getCompletedPlaybackInfo(), completion.reason))
              .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
          }
        } catch (error) { Logger.warn('PlaybackStartup', 'Session report: ' + String(error)); }
        finally { MediaTaskCoordinator.release(lease); }
        completed(completion);
      });
      // 初始化失败也可能仍在异步释放；完成回调到达前保留fd和任务租约。
      result.nativeOwnsLease = result.started || player.getState() !== player.PlayerState.IDLE;
      if (result.started) { MediaTaskCoordinator.running(lease); }
      else if (result.nativeOwnsLease) { MediaTaskCoordinator.cancelling(lease); }
      return result;
    } catch (error) {
      result.error = 'open';
      Logger.error('PlaybackStartup', 'Launch failed: ' + String(error));
      result.nativeOwnsLease = player.getState() !== player.PlayerState.IDLE;
      return result;
    } finally {
      if (!result.nativeOwnsLease) {
        closeInput();
        if (context !== undefined) {
          const report = MediaReports.base(lease.id, 'playback', 'failed');
          report.error = MediaReports.error('playback.prepare', -1, 'Playback preparation did not complete');
          void MediaSessionStore.finish(context, lease.id, report)
            .catch((error: Error): void => Logger.warn('PlaybackStartup', error.message));
        }
        MediaTaskCoordinator.release(lease);
      }
      MediaFileActivity.endLaunch();
    }
  }
}
