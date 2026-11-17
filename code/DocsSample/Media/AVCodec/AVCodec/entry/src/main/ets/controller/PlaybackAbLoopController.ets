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

import player from 'libplayer.so';
import Logger from '../common/utils/Logger';
import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel';
import { SeekRequestController, SeekRequestResult } from './SeekRequestController';

const TAG: string = 'PlaybackAbLoopController';
const AB_LOOP_CHECK_INTERVAL_MS: number = 50;
const AB_LOOP_TOLERANCE_US: number = 150000;

export class PlaybackAbLoopController {
  private startUs: number = -1;
  private endUs: number = -1;
  private enabled: boolean = false;
  private seekPending: boolean = false;
  private timer: number = 0;
  private generation: number = 0;
  private model: PlaybackViewModel;
  private seekRequests: SeekRequestController;
  private requestSeek: (positionUs: number) => Promise<SeekRequestResult>;
  private showToast: (message: Resource) => void;
  private isStoppingState: () => boolean;
  private onStateChanged: (startUs: number, endUs: number, enabled: boolean) => void;

  constructor(model: PlaybackViewModel, seekRequests: SeekRequestController,
    requestSeek: (positionUs: number) => Promise<SeekRequestResult>,
    showToast: (message: Resource) => void,
    isStopping: () => boolean,
    onStateChanged: (startUs: number, endUs: number, enabled: boolean) => void) {
    this.model = model;
    this.seekRequests = seekRequests;
    this.requestSeek = requestSeek;
    this.showToast = showToast;
    this.isStoppingState = isStopping;
    this.onStateChanged = onStateChanged;
  }

  getStartUs(): number {
    return this.startUs;
  }

  getEndUs(): number {
    return this.endUs;
  }

  isEnabled(): boolean {
    return this.enabled;
  }

  setStart(): void {
    if (this.model.durationUs <= 0) {
      return;
    }
    this.startUs = this.currentPositionUs();
    this.enabled = false;
    this.endUs = -1;
    this.seekPending = false;
    this.notifyState();
    this.showToast($r('app.string.playback_ab_start_set'));
  }

  setEnd(): void {
    if (this.model.durationUs <= 0 || this.startUs < 0) {
      this.showToast($r('app.string.playback_ab_start_required'));
      return;
    }
    const positionUs: number = this.currentPositionUs();
    if (positionUs <= this.startUs) {
      this.showToast($r('app.string.playback_ab_end_invalid'));
      return;
    }
    this.endUs = positionUs;
    this.enabled = true;
    this.seekPending = false;
    this.startMonitor();
    this.notifyState();
    this.showToast($r('app.string.playback_ab_enabled'));
  }

  reset(): void {
    ++this.generation;
    this.startUs = -1;
    this.endUs = -1;
    this.enabled = false;
    this.seekPending = false;
    this.stopMonitor();
    this.notifyState();
  }

  check(): void {
    if (this.seekRequests.isBusy() || this.model.isSeeking || this.isStopping()) {
      return;
    }
    if (!this.enabled || this.startUs < 0 || this.endUs <= this.startUs) {
      return;
    }
    const info = player.getPlaybackInfo();
    if (info.state !== player.PlayerState.PLAYING) {
      return;
    }
    const positionUs: number = Math.max(0, Math.min(info.durationUs, info.positionUs));
    if (this.seekPending) {
      if (positionUs + AB_LOOP_TOLERANCE_US < this.endUs) {
        this.seekPending = false;
      }
      return;
    }
    if (positionUs + AB_LOOP_TOLERANCE_US < this.endUs) {
      return;
    }
    this.seekPending = true;
    const generation: number = this.generation;
    Logger.info(TAG, 'A-B loop reached B, seek to A: ' + this.startUs);
    this.requestSeek(this.startUs).then((result: SeekRequestResult): void => {
      if (generation !== this.generation) {
        return;
      }
      if (result === 'failed') {
        this.reset();
      } else {
        this.seekPending = false;
      }
    });
  }

  private currentPositionUs(): number {
    const info = player.getPlaybackInfo();
    return Math.max(0, Math.min(info.durationUs, info.positionUs));
  }

  private isStopping(): boolean {
    return this.isStoppingState() || this.model.state === player.PlayerState.STOPPING;
  }

  private startMonitor(): void {
    this.stopMonitor();
    this.timer = setInterval((): void => {
      if (this.enabled) {
        this.check();
      }
    }, AB_LOOP_CHECK_INTERVAL_MS);
  }

  private stopMonitor(): void {
    if (this.timer !== 0) {
      clearInterval(this.timer);
      this.timer = 0;
    }
  }

  private notifyState(): void {
    this.onStateChanged(this.startUs, this.endUs, this.enabled);
  }
}
