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

import { PiPWindow } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'
import player from 'libplayer.so'
import Logger from '../common/utils/Logger'

const TAG: string = 'Player_PiP'

export interface PlayerPictureInPictureCallbacks {
  onActiveChanged: (active: boolean) => void;
  onPlaybackChanged: () => void;
  onSeekBySeconds: (seconds: number) => void;
  isBackgroundPlaybackEnabled: () => boolean;
}

/** 集中管理系统画中画窗口、播放控制事件和控件状态同步。 */
export class PlayerPictureInPictureController {
  private pipController: PiPWindow.PiPController | undefined = undefined;
  private active: boolean = false;
  private lastSyncedPlaybackState: number = -1;
  private resumePlaybackAfterStart: boolean = false;
  private callbacks: PlayerPictureInPictureCallbacks;

  constructor(callbacks: PlayerPictureInPictureCallbacks) {
    this.callbacks = callbacks;
  }

  get isCreated(): boolean {
    return this.pipController !== undefined;
  }

  get shouldKeepPlaybackOnPageDisappear(): boolean {
    return this.active || this.resumePlaybackAfterStart;
  }

  /** 启动 PiP；失败时恢复普通后台播放策略并返回 false。 */
  async start(context: common.Context | undefined, componentController: XComponentController): Promise<boolean> {
    if (context === undefined) {
      return false;
    }
    try {
      if (this.pipController === undefined) {
        const mediaInfo = player.getMediaInfo();
        const width: number = mediaInfo.video.width > 0 ? mediaInfo.video.width : 16;
        const height: number = mediaInfo.video.height > 0 ? mediaInfo.video.height : 9;
        this.pipController = await PiPWindow.create({
          context: context,
          componentController: componentController,
          templateType: PiPWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: width,
          contentHeight: height
        });
        this.registerEvents();
      }

      this.resumePlaybackAfterStart = player.getState() === player.PlayerState.PLAYING;
      this.setActive(true);
      // PiP 存续期间继续解码；否则页面进入后台时可能暂停播放。
      player.setBackgroundPlaybackEnabled(true);
      this.lastSyncedPlaybackState = -1;
      await this.pipController.startPiP();
      this.pipController.setAutoStartEnabled(this.callbacks.isBackgroundPlaybackEnabled());
      this.resumePlaybackIfNeeded();
      this.callbacks.onPlaybackChanged();
      this.syncPlaybackState();
      return true;
    } catch (error) {
      this.resetAfterStartFailure();
      Logger.error(TAG, 'Start picture-in-picture failed: ' + JSON.stringify(error));
      return false;
    }
  }

  async stop(): Promise<void> {
    if (this.pipController === undefined) {
      return;
    }
    try {
      if (await this.pipController.isPiPActive()) {
        await this.pipController.stopPiP();
      }
    } catch (error) {
      Logger.error(TAG, 'Stop picture-in-picture failed: ' + JSON.stringify(error));
    }
    this.setActive(false);
    this.lastSyncedPlaybackState = -1;
    player.setBackgroundPlaybackEnabled(this.callbacks.isBackgroundPlaybackEnabled());
  }

  setAutoStartEnabled(enabled: boolean): void {
    if (this.pipController !== undefined) {
      this.pipController.setAutoStartEnabled(enabled);
    }
  }

  syncPlaybackState(): void {
    if (!this.active || this.pipController === undefined) {
      return;
    }
    const playbackState: number = player.getState();
    if (playbackState !== player.PlayerState.PLAYING && playbackState !== player.PlayerState.PAUSED) {
      return;
    }
    if (playbackState === this.lastSyncedPlaybackState) {
      return;
    }
    const pipStatus: PiPWindow.PiPControlStatus = playbackState === player.PlayerState.PLAYING
      ? PiPWindow.PiPControlStatus.PLAY
      : PiPWindow.PiPControlStatus.PAUSE;
    try {
      this.pipController.updatePiPControlStatus(PiPWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipStatus);
      this.lastSyncedPlaybackState = playbackState;
    } catch (error) {
      Logger.warn(TAG, 'Update PiP playback status failed: ' + JSON.stringify(error));
    }
  }

  private registerEvents(): void {
    if (this.pipController === undefined) {
      return;
    }
    this.pipController.on('stateChange', (state: PiPWindow.PiPState) => {
      this.setActive(state === PiPWindow.PiPState.STARTED);
      if (state === PiPWindow.PiPState.STARTED) {
        // 启动回调可能晚于 Ability 后台回调，及时恢复 PiP 的后台播放状态。
        player.setBackgroundPlaybackEnabled(true);
        this.resumePlaybackIfNeeded();
        this.lastSyncedPlaybackState = -1;
        this.callbacks.onPlaybackChanged();
        this.syncPlaybackState();
      }
      if (state === PiPWindow.PiPState.STOPPED) {
        this.lastSyncedPlaybackState = -1;
        this.resumePlaybackAfterStart = false;
        player.setBackgroundPlaybackEnabled(this.callbacks.isBackgroundPlaybackEnabled());
      }
    });
    this.pipController.on('controlEvent', (event: PiPWindow.ControlEventParam) => {
      if (event.controlType === PiPWindow.PiPControlType.VIDEO_PLAY_PAUSE) {
        this.handlePlayPause(event.status);
      } else if (event.controlType === PiPWindow.PiPControlType.FAST_FORWARD) {
        this.callbacks.onSeekBySeconds(15);
      } else if (event.controlType === PiPWindow.PiPControlType.FAST_BACKWARD) {
        this.callbacks.onSeekBySeconds(-15);
      }
    });
  }

  private handlePlayPause(targetStatus: PiPWindow.PiPControlStatus | undefined): void {
    const playbackState: number = player.getState();
    // 按系统传入的目标状态执行，重复事件不会反复切换播放状态。
    if (targetStatus === PiPWindow.PiPControlStatus.PLAY &&
      playbackState === player.PlayerState.PAUSED) {
      if (!player.resume()) {
        Logger.warn(TAG, 'PiP resume was rejected, state: ' + playbackState);
      }
    } else if (targetStatus === PiPWindow.PiPControlStatus.PAUSE &&
      playbackState === player.PlayerState.PLAYING) {
      if (!player.pause()) {
        Logger.warn(TAG, 'PiP pause was rejected, state: ' + playbackState);
      }
    }
    this.callbacks.onPlaybackChanged();
    this.syncPlaybackState();
  }

  private resumePlaybackIfNeeded(): void {
    if (!this.resumePlaybackAfterStart) {
      return;
    }
    const playbackState: number = player.getState();
    if (playbackState === player.PlayerState.PAUSED) {
      if (!player.resume()) {
        Logger.warn(TAG, 'PiP startup resume was rejected, state: ' + playbackState);
        return;
      }
    } else if (playbackState !== player.PlayerState.PLAYING) {
      return;
    }
    this.resumePlaybackAfterStart = false;
  }

  private resetAfterStartFailure(): void {
    this.setActive(false);
    this.lastSyncedPlaybackState = -1;
    this.resumePlaybackAfterStart = false;
    player.setBackgroundPlaybackEnabled(this.callbacks.isBackgroundPlaybackEnabled());
  }

  private setActive(active: boolean): void {
    this.active = active;
    this.callbacks.onActiveChanged(active);
  }
}
