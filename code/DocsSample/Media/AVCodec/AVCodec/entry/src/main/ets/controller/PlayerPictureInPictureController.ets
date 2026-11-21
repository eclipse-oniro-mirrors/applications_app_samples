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

import { PiPWindow } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import player from 'libplayer.so';
import Logger from '../common/utils/Logger';

const TAG: string = 'Player_PiP';

export interface PlayerPictureInPictureCallbacks {
  onActiveChanged: (active: boolean) => void;
  onPlaybackChanged: () => void;
  onSeekBySeconds: (seconds: number) => void;
  getPlaybackSession: () => number;
  setPaused: (paused: boolean) => boolean;
  onBackgroundChanged: (enabled: boolean) => void;
}

export type BackgroundPlaybackResult = 'enabled' | 'disabled' | 'cancelled' | 'cleanup_pending' | 'failed';

// 窗口请求绑定播放代次；停止立即使回调失效，再等待系统调用结束后关闭窗口。
export class PlayerPictureInPictureController {
  private pipController: PiPWindow.PiPController | undefined = undefined;
  private active: boolean = false;
  private lastSyncedPlaybackState: number = -1;
  private resumePlaybackAfterStart: boolean = false;
  private callbacks: PlayerPictureInPictureCallbacks;
  private revision: number = 0;
  private playbackSession: number = -1;
  private pendingStart: Promise<boolean> | undefined = undefined;
  private pendingStop: Promise<void> | undefined = undefined;
  private cleanupRequired: boolean = false;
  private backgroundRequested: boolean = false;
  private backgroundEnabled: boolean = false;
  private backgroundRevision: number = 0;

  constructor(callbacks: PlayerPictureInPictureCallbacks) { this.callbacks = callbacks; }

  get isCreated(): boolean { return this.pipController !== undefined; }
  get isBackgroundRequested(): boolean { return this.backgroundRequested; }
  get backgroundRequestRevision(): number { return this.backgroundRevision; }
  get shouldKeepPlaybackOnPageDisappear(): boolean { return this.active || this.resumePlaybackAfterStart; }

  // 同一播放的重复启动共用请求，停止收尾期间拒绝新启动。
  start(context: common.Context | undefined, componentController: XComponentController): Promise<boolean> {
    const session: number = this.callbacks.getPlaybackSession();
    if (context === undefined || session < 0 || this.pendingStop !== undefined) { return Promise.resolve(false); }
    if (this.pendingStart !== undefined) {
      if (session === this.playbackSession) { return this.pendingStart; }
      void this.stop();
      return Promise.resolve(false);
    }
    if (this.active && session === this.playbackSession) { return Promise.resolve(true); }
    if (this.active) { void this.stop(); return Promise.resolve(false); }
    if (this.pipController !== undefined && (this.cleanupRequired || session !== this.playbackSession)) {
      void this.stop();
      return Promise.resolve(false);
    }
    this.playbackSession = session;
    const revision: number = ++this.revision;
    const pending: Promise<boolean> = this.startRequest(context, componentController, revision, session)
      .finally((): void => { if (this.pendingStart === pending) { this.pendingStart = undefined; } });
    this.pendingStart = pending;
    return pending;
  }

  private async startRequest(context: common.Context, componentController: XComponentController,
    revision: number, session: number): Promise<boolean> {
    try {
      const controller: PiPWindow.PiPController = await this.prepareController(context, componentController);
      if (!this.isCurrent(revision, session)) { return await this.discardStart(controller, revision); }
      this.registerEvents(controller, revision, session);
      this.resumePlaybackAfterStart = player.getState() === player.PlayerState.PLAYING;
      this.setActive(true);
      player.setBackgroundPlaybackEnabled(true);
      this.lastSyncedPlaybackState = -1;
      await controller.startPiP();
      if (!this.isCurrent(revision, session)) { return await this.discardStart(controller, revision); }
      controller.setAutoStartEnabled(this.backgroundEnabled);
      this.resumePlaybackIfNeeded();
      this.callbacks.onPlaybackChanged();
      this.syncPlaybackState();
      return true;
    } catch (error) {
      if (this.pipController !== undefined) { await this.closeController(this.pipController); }
      if (revision === this.revision) { this.resetPlaybackPolicy(); }
      Logger.error(TAG, 'Start picture-in-picture failed: ' + JSON.stringify(error));
      return false;
    }
  }

  private async prepareController(context: common.Context,
    componentController: XComponentController): Promise<PiPWindow.PiPController> {
    if (this.pipController !== undefined) { return this.pipController; }
    const mediaInfo = player.getMediaInfo();
    const controller: PiPWindow.PiPController = await PiPWindow.create({
      context: context,
      componentController: componentController,
      templateType: PiPWindow.PiPTemplateType.VIDEO_PLAY,
      contentWidth: mediaInfo.video.width > 0 ? mediaInfo.video.width : 16,
      contentHeight: mediaInfo.video.height > 0 ? mediaInfo.video.height : 9
    });
    this.pipController = controller;
    return controller;
  }

  // 取消也覆盖仍在创建的窗口；晚返回的系统操作不能重新打开后台播放。
  stop(): Promise<void> {
    if (this.pendingStop !== undefined) { return this.pendingStop; }
    ++this.backgroundRevision;
    this.backgroundRequested = false;
    this.setBackgroundEnabled(false);
    ++this.revision;
    this.resetPlaybackPolicy();
    const pending: Promise<void> = this.stopRequest().finally((): void => {
      if (this.pendingStop === pending) { this.pendingStop = undefined; }
    });
    this.pendingStop = pending;
    return pending;
  }

  private async stopRequest(): Promise<void> {
    await Promise.resolve(this.pendingStart);
    if (this.pipController !== undefined) { await this.closeController(this.pipController); }
  }

  private async discardStart(controller: PiPWindow.PiPController, revision: number): Promise<boolean> {
    await this.closeController(controller);
    if (revision === this.revision) { this.resetPlaybackPolicy(); }
    return false;
  }

  private async closeController(controller: PiPWindow.PiPController): Promise<void> {
    this.cleanupRequired = true;
    this.removeEvents(controller);
    let autoStartDisabled: boolean = false;
    try {
      controller.setAutoStartEnabled(false);
      autoStartDisabled = true;
    } catch (error) { Logger.error(TAG, 'Disable PiP auto-start failed: ' + JSON.stringify(error)); }
    try {
      if (await controller.isPiPActive()) { await controller.stopPiP(); }
      if (autoStartDisabled && this.pipController === controller) {
        this.pipController = undefined;
        this.cleanupRequired = false;
      }
    } catch (error) { Logger.error(TAG, 'Stop picture-in-picture failed: ' + JSON.stringify(error)); }
  }

  private removeEvents(controller: PiPWindow.PiPController): void {
    try { controller.off('stateChange'); } catch (error) {
      Logger.warn(TAG, 'Remove PiP state listener failed: ' + JSON.stringify(error));
    }
    try { controller.off('controlEvent'); } catch (error) {
      Logger.warn(TAG, 'Remove PiP control listener failed: ' + JSON.stringify(error));
    }
  }

  // 后台策略只在当前窗口可用后生效，后续开关或停止使旧请求失效。
  async setBackgroundPlayback(enabled: boolean, context: common.Context | undefined,
    componentController: XComponentController): Promise<BackgroundPlaybackResult> {
    const revision: number = ++this.backgroundRevision;
    const session: number = this.callbacks.getPlaybackSession();
    this.backgroundRequested = enabled;
    if (!enabled) { return this.disableBackgroundPlayback(); }
    if (this.cleanupRequired || this.pendingStop !== undefined) {
      this.backgroundRequested = false;
      return 'cleanup_pending';
    }
    if (session < 0) { this.backgroundRequested = false; return 'cancelled'; }
    const ready: boolean = this.pipController !== undefined && this.pendingStart === undefined &&
      session === this.playbackSession;
    const started: boolean = ready || await this.start(context, componentController);
    if (revision !== this.backgroundRevision) { return 'cancelled'; }
    if (session !== this.callbacks.getPlaybackSession()) {
      this.backgroundRequested = false;
      return 'cancelled';
    }
    if (!started || this.cleanupRequired || this.pendingStop !== undefined) {
      this.backgroundRequested = false;
      return this.cleanupRequired ? 'cleanup_pending' : 'failed';
    }
    try {
      this.pipController?.setAutoStartEnabled(true);
      this.setBackgroundEnabled(true);
      return 'enabled';
    } catch (error) {
      Logger.error(TAG, 'Enable background playback failed: ' + JSON.stringify(error));
      this.backgroundRequested = false;
      this.setBackgroundEnabled(false);
      void this.stop();
      return 'failed';
    }
  }

  private disableBackgroundPlayback(): BackgroundPlaybackResult {
    this.setBackgroundEnabled(false);
    if (this.pendingStart !== undefined) { void this.stop(); return 'disabled'; }
    if (this.pipController === undefined) { return 'disabled'; }
    if (this.cleanupRequired || this.pendingStop !== undefined) { return 'cleanup_pending'; }
    try {
      this.pipController.setAutoStartEnabled(false);
      return 'disabled';
    } catch (error) {
      Logger.error(TAG, 'Disable background playback failed: ' + JSON.stringify(error));
      void this.stop();
      return 'failed';
    }
  }

  private setBackgroundEnabled(enabled: boolean): void {
    this.backgroundEnabled = enabled;
    this.callbacks.onBackgroundChanged(enabled);
    player.setBackgroundPlaybackEnabled(this.active || enabled);
  }

  // 仅同步当前窗口的播放状态，忽略旧窗口和旧播放的通知。
  syncPlaybackState(): void {
    if (!this.active || this.pipController === undefined ||
      !this.isCurrent(this.revision, this.playbackSession)) { return; }
    const state: number = player.getState();
    if (state !== player.PlayerState.PLAYING && state !== player.PlayerState.PAUSED) { return; }
    if (state === this.lastSyncedPlaybackState) { return; }
    const status: PiPWindow.PiPControlStatus = state === player.PlayerState.PLAYING ?
      PiPWindow.PiPControlStatus.PLAY : PiPWindow.PiPControlStatus.PAUSE;
    try {
      this.pipController.updatePiPControlStatus(PiPWindow.PiPControlType.VIDEO_PLAY_PAUSE, status);
      this.lastSyncedPlaybackState = state;
    } catch (error) { Logger.warn(TAG, 'Update PiP playback status failed: ' + JSON.stringify(error)); }
  }

  private registerEvents(controller: PiPWindow.PiPController, revision: number, session: number): void {
    this.removeEvents(controller);
    controller.on('stateChange', (state: PiPWindow.PiPState): void => {
      if (this.isCurrent(revision, session) && controller === this.pipController) { this.handleState(state); }
    });
    controller.on('controlEvent', (event: PiPWindow.ControlEventParam): void => {
      if (!this.isCurrent(revision, session) || controller !== this.pipController) { return; }
      if (event.controlType === PiPWindow.PiPControlType.VIDEO_PLAY_PAUSE) {
        this.handlePlayPause(event.status);
      } else if (event.controlType === PiPWindow.PiPControlType.FAST_FORWARD) {
        this.callbacks.onSeekBySeconds(15);
      } else if (event.controlType === PiPWindow.PiPControlType.FAST_BACKWARD) {
        this.callbacks.onSeekBySeconds(-15);
      }
    });
  }

  private handleState(state: PiPWindow.PiPState): void {
    if (state === PiPWindow.PiPState.STARTED) {
      this.setActive(true);
      player.setBackgroundPlaybackEnabled(true);
      this.resumePlaybackIfNeeded();
      this.lastSyncedPlaybackState = -1;
      this.callbacks.onPlaybackChanged();
      this.syncPlaybackState();
    }
    if (state === PiPWindow.PiPState.STOPPED) {
      if (this.pendingStart !== undefined) { void this.stop(); } else { this.resetPlaybackPolicy(); }
    }
    if (state === PiPWindow.PiPState.ERROR) { void this.stop(); }
  }

  private handlePlayPause(status: PiPWindow.PiPControlStatus | undefined): void {
    if (status === PiPWindow.PiPControlStatus.PLAY) {
      this.callbacks.setPaused(false);
    } else if (status === PiPWindow.PiPControlStatus.PAUSE) {
      this.callbacks.setPaused(true);
    }
    this.callbacks.onPlaybackChanged();
    this.syncPlaybackState();
  }

  private resumePlaybackIfNeeded(): void {
    if (!this.resumePlaybackAfterStart) { return; }
    if (this.callbacks.setPaused(false)) { this.resumePlaybackAfterStart = false; }
  }

  private isCurrent(revision: number, session: number): boolean {
    return !this.cleanupRequired && revision === this.revision && session >= 0 &&
      session === this.callbacks.getPlaybackSession();
  }

  private resetPlaybackPolicy(): void {
    this.resumePlaybackAfterStart = false;
    this.lastSyncedPlaybackState = -1;
    this.setActive(false);
    const enabled: boolean = this.backgroundEnabled && this.pipController !== undefined &&
      !this.cleanupRequired && this.playbackSession === this.callbacks.getPlaybackSession();
    if (!enabled) { this.backgroundRequested = false; }
    this.setBackgroundEnabled(enabled);
  }

  private setActive(active: boolean): void { this.active = active; this.callbacks.onActiveChanged(active); }
}
