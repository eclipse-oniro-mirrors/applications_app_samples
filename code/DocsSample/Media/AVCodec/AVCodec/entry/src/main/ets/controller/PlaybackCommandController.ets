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

import { PlaybackCommandState } from './PlaybackFlowState';
import { PlaybackFlowRuntime } from './PlaybackFlowRuntime';
import { SeekRequestController, SeekRequestResult } from './SeekRequestController';
import Logger from '../common/utils/Logger';

export interface PlaybackControlSnapshot {
  active: boolean;
  dragging: boolean;
  thermalWarning: boolean;
}

export type PlaybackControlEventType = 'seek_started' | 'seek_updated' | 'seek_settled' | 'seek_failed' |
  'busy' | 'updated' | 'paused' | 'resumed' | 'frame_step_failed';

export interface PlaybackControlEvent {
  type: PlaybackControlEventType;
  positionUs?: number;
  showPrompt?: boolean;
}

// 同步快照只读取页面输入，事件只更新展示；异步Seek的结果归属由控制器核对。
export interface PlaybackControlHost {
  getSnapshot: () => PlaybackControlSnapshot;
  onEvent: (event: PlaybackControlEvent) => void;
}

export class PlaybackCommandController {
  private state: PlaybackCommandState;
  private seeks: SeekRequestController;
  private host: PlaybackControlHost;
  private runtime: PlaybackFlowRuntime;
  private seekRevision: number = 0;

  constructor(state: PlaybackCommandState, seeks: SeekRequestController, host: PlaybackControlHost,
    runtime: PlaybackFlowRuntime) {
    this.state = state;
    this.seeks = seeks;
    this.host = host;
    this.runtime = runtime;
  }

  // 播放中提交Seek，停止、离页、重播或后续请求均使旧结果失效。
  async seek(targetUs: number): Promise<SeekRequestResult> {
    if (!this.canControl()) { return 'cancelled'; }
    const revision: number = ++this.seekRevision;
    const session: number = this.state.session;
    const commandRevision: number = this.state.commandRevision;
    this.host.onEvent({ type: 'seek_started', positionUs: targetUs });
    const pending: Promise<SeekRequestResult> = this.seeks.request(targetUs);
    this.host.onEvent({ type: 'seek_updated' });
    const result: SeekRequestResult = await pending;
    if (revision !== this.seekRevision || session !== this.state.session ||
      commandRevision !== this.state.commandRevision || !this.canControl()) { return result; }
    this.host.onEvent({ type: 'seek_updated' });
    const snapshot: PlaybackControlSnapshot = this.host.getSnapshot();
    if (!this.seeks.isBusy() && !snapshot.dragging) {
      this.host.onEvent({ type: 'seek_settled' });
      this.runtime.restoreAfterSeek(this.state.requestedSpeed, snapshot.thermalWarning);
      this.host.onEvent({ type: 'updated' });
    }
    if (result === 'failed') { this.host.onEvent({ type: 'seek_failed' }); }
    return result;
  }

  // Seek期间只更新期望倍速，最后一次有效Seek结束后再应用。
  setSpeed(speed: number): void {
    if (!this.canControl() || !Number.isFinite(speed) || speed <= 0) { return; }
    this.state.setRequestedSpeed(speed);
    if (!this.seeks.isBusy()) { this.runtime.setSpeed(speed); }
    this.host.onEvent({ type: 'updated' });
  }

  // 暂停和继续共用Seek互斥规则，提示资源由页面处理。
  togglePause(showPrompt: boolean = false): void {
    this.setPaused(this.runtime.getState() !== this.runtime.pausedState, showPrompt);
  }

  // 系统事件表达目标状态，重复暂停或继续不会反向切换。
  setPaused(paused: boolean, showPrompt: boolean = false): boolean {
    if (!this.canControl()) { return false; }
    if (this.seeks.isBusy()) { this.host.onEvent({ type: 'busy' }); return false; }
    const state: number = this.runtime.getState();
    if (state !== this.runtime.playingState && state !== this.runtime.pausedState) { return false; }
    if (paused === (state === this.runtime.pausedState)) {
      this.host.onEvent({ type: 'updated' });
      return true;
    }
    if (!this.runtime.setPaused(paused)) {
      Logger.error('PlaybackCommand', paused ? 'Pause playback failed' : 'Resume playback failed');
      return false;
    }
    this.host.onEvent({ type: paused ? 'paused' : 'resumed', showPrompt: showPrompt });
    return true;
  }

  // 单帧跳转先暂停，再复用Seek的互斥和结果归属检查。
  async stepFrame(targetUs: number): Promise<SeekRequestResult> {
    if (!this.canControl()) { return 'cancelled'; }
    if (this.seeks.isBusy()) { this.host.onEvent({ type: 'busy' }); return 'cancelled'; }
    if (!this.setPaused(true)) {
      this.host.onEvent({ type: 'frame_step_failed' });
      return 'failed';
    }
    return await this.seek(targetUs);
  }

  private canControl(): boolean { return this.state.canControl && this.host.getSnapshot().active; }
}
