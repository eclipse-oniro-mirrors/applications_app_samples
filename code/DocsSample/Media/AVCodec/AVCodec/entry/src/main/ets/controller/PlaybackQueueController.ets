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

import { PlaybackMode, nextPlaybackIndex } from '../model/PlaybackModeModel';

export interface PlaybackQueueRequest {
  index: number;
  path: string;
  positionUs: number;
  revision: number;
  selection: number;
}

@Observed
export class PlaybackQueueController {
  private entries: string[] = [];
  private selectedIndex: number = -1;
  private pending: PlaybackQueueRequest | undefined = undefined;
  private revision: number = 0;
  private selection: number = 0;

  get paths(): string[] { return this.entries.slice(); }
  get index(): number { return this.selectedIndex; }
  get pendingIndex(): number { return this.pending?.index ?? -1; }
  get version(): number { return this.revision; }

  // 返回独立数组，调用方不能通过展示快照修改队列。
  replace(paths: string[], index: number = -1): void {
    this.entries = paths.slice();
    this.selectedIndex = index >= 0 && index < paths.length ? index : -1;
    ++this.revision;
    this.clearPending();
  }

  // 清空同时取消尚未起播的目标。
  clear(): void { this.replace([]); }

  // 新来源等待旧任务结束时，仅设置待播目标。
  replaceSource(path: string, deferred: boolean): void {
    this.replace([path], deferred ? -1 : 0);
    if (deferred) { this.requestSwitch(0, -1); }
  }

  // 追加不改变版本，已等待的有效目标仍可继续。
  append(path: string): void {
    if (path.length > 0 && this.entries.indexOf(path) < 0) { this.entries.push(path); }
  }

  // 仅在目标有效时更新当前项。
  select(index: number): boolean {
    if (index < 0 || index >= this.entries.length) { return false; }
    this.selectedIndex = index;
    return true;
  }

  // 空闲导入队列时保留当前项，尚无当前项则选择首项。
  selectDefault(): string | undefined {
    if (this.selectedIndex < 0) { this.select(0); }
    return this.entries[this.selectedIndex];
  }

  // 停止期间的新选择替换旧请求，版本与选择号均在队列内部维护。
  requestSwitch(index: number, positionUs: number = 0): boolean {
    if (index < 0 || index >= this.entries.length || this.entries[index].length === 0) { return false; }
    this.pending = {
      index: index,
      path: this.entries[index],
      positionUs: positionUs,
      revision: this.revision,
      selection: ++this.selection
    };
    return true;
  }

  // 取出后仍可校验请求身份；新的选择、清空或替换会使其失效。
  takePending(): PlaybackQueueRequest | undefined {
    const request: PlaybackQueueRequest | undefined = this.pending;
    this.pending = undefined;
    return request;
  }

  clearPending(): void { this.pending = undefined; ++this.selection; }

  isCurrent(request: PlaybackQueueRequest): boolean {
    return request.revision === this.revision && request.selection === this.selection &&
      this.entries[request.index] === request.path;
  }

  next(mode: PlaybackMode): number {
    return nextPlaybackIndex(mode, this.selectedIndex, this.entries.length);
  }

  adjacent(direction: number, mode: PlaybackMode): number {
    const count: number = this.entries.length;
    if (this.selectedIndex < 0 || this.selectedIndex >= count || direction === 0) { return -1; }
    let target: number = this.selectedIndex + (direction > 0 ? 1 : -1);
    if (mode === PlaybackMode.REPEAT_ALL) { target = (target + count) % count; }
    return target >= 0 && target < count ? target : -1;
  }
}
