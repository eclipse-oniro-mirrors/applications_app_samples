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

import { PlaybackHistoryModel, getPlaybackTitle } from '../model/PlaybackHistoryModel';
import Logger from '../common/utils/Logger';

const TAG: string = 'PlaybackHistoryCoordinator';
const HISTORY_INTERVAL_US: number = 2000000;

class PlaybackHistorySession {
  public path: string;
  public savedPositionUs: number = -1;

  constructor(path: string) {
    this.path = path;
  }
}

// 保存策略只依赖历史模型；回调在异步保存结束后通知调用方读取最新记录。
export class PlaybackHistoryCoordinator {
  private history: PlaybackHistoryModel;
  private onChanged: () => void;
  private active: PlaybackHistorySession | undefined = undefined;

  constructor(history: PlaybackHistoryModel, onChanged: () => void) {
    this.history = history;
    this.onChanged = onChanged;
  }

  // 每次起播建立独立身份，同URI重播也不复用已保存位置。
  activate(path: string): void {
    this.active = new PlaybackHistorySession(path);
  }

  // 阻止后续进度写入，已经提交的保存仍按原源收尾。
  release(): void {
    this.active = undefined;
  }

  // 恢复位置只读取当前起播源，并遵守显式设置。
  getResumePosition(durationUs: number, enabled: boolean): number {
    return this.active === undefined ? 0 :
      this.history.getResumePosition(this.active.path, durationUs, enabled);
  }

  // 普通进度按成功位置限流，强制保存沿用模型的立即重试规则。
  async persistProgress(positionUs: number, durationUs: number, force: boolean = false): Promise<void> {
    const session: PlaybackHistorySession | undefined = this.active;
    if (session === undefined || !Number.isFinite(durationUs) || durationUs <= 0 ||
      !Number.isFinite(positionUs) || positionUs < 0) { return; }
    if (!force && session.savedPositionUs >= 0 &&
      Math.abs(positionUs - session.savedPositionUs) < HISTORY_INTERVAL_US) { return; }
    const saved: boolean = await this.history.update(session.path, getPlaybackTitle(session.path),
      positionUs, durationUs, force);
    if (saved && session === this.active) { session.savedPositionUs = positionUs; }
    this.onChanged();
  }

  // 调用时捕获完成源；最终保存可与下一项播放并行。
  async complete(durationUs: number, readCompletedDuration: () => number): Promise<void> {
    const session: PlaybackHistorySession | undefined = this.active;
    if (session === undefined) { return; }
    if (!Number.isFinite(durationUs) || durationUs <= 0) {
      try {
        durationUs = readCompletedDuration();
      } catch (error) { Logger.warn(TAG, `Read completed playback duration failed: ${String(error)}`); }
    }
    try {
      await this.history.markCompleted(session.path, durationUs);
    } catch (error) { Logger.warn(TAG, `Complete playback history failed: ${String(error)}`); }
    await this.flush();
    this.onChanged();
  }

  // 最终保存记录失败，调用方可先完成界面清理和续播。
  async flush(): Promise<void> {
    try {
      if (!await this.history.flush()) { Logger.warn(TAG, 'Final playback history save is still pending'); }
    } catch (error) { Logger.warn(TAG, `Flush playback history failed: ${String(error)}`); }
  }
}
