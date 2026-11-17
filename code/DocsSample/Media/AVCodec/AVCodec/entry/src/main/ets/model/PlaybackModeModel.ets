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

export enum PlaybackMode {
  SEQUENTIAL = 0,
  REPEAT_ONE = 1,
  REPEAT_ALL = 2,
  SHUFFLE = 3
}

// 仅在自然播放结束时计算下一项；用户停止和播放错误均不推进队列。
export function nextPlaybackIndex(mode: PlaybackMode, current: number, count: number,
  random: number = Math.random()): number {
  if (count <= 0 || current < 0 || current >= count) {
    return -1;
  }
  if (mode === PlaybackMode.REPEAT_ONE) {
    return current;
  }
  if (mode === PlaybackMode.REPEAT_ALL) {
    return (current + 1) % count;
  }
  if (mode === PlaybackMode.SHUFFLE) {
    if (count === 1) {
      return 0;
    }
    const candidate: number = Math.min(count - 2, Math.floor(Math.max(0, random) * (count - 1)));
    return candidate >= current ? candidate + 1 : candidate;
  }
  return current + 1 < count ? current + 1 : -1;
}
