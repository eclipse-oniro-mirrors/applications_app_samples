/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { displaySync } from '@kit.ArkGraphics2D';
import { expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

export async function probeFrames(fps: number, removeWhileRunning: boolean): Promise<displaySync.IntervalInfo[]> {
  const ds: displaySync.DisplaySync = displaySync.create();
  const frames: displaySync.IntervalInfo[] = [];
  let timer: number = -1;
  let onFrame: (info: displaySync.IntervalInfo) => void = () => {};
  try {
    ds.setExpectedFrameRateRange({ min: 1, max: 120, expected: fps });
    const received: Promise<void> = new Promise<void>((resolve, reject) => {
      onFrame = (info: displaySync.IntervalInfo): void => {
        frames.push({ timestamp: info.timestamp, targetTimestamp: info.targetTimestamp });
        if (frames.length >= 4) {
          resolve();
        }
      };
      timer = setTimeout(() => reject(new Error('DisplaySync 未收到四帧真实回调')), 3000);
    });
    ds.on('frame', onFrame);
    ds.start();
    await received;
    if (removeWhileRunning) {
      ds.off('frame', onFrame);
    } else {
      ds.stop();
    }
    // 允许已派发的回调完成，再验证后续帧不会继续投递。
    await new Promise<void>((resolve) => setTimeout(resolve, 80));
    const before: number = frames.length;
    await new Promise<void>((resolve) => setTimeout(resolve, 150));
    hilog.info(0xF811, '[Sample_DisplaySync]', '停止或退订前=%{public}d 后=%{public}d', before, frames.length);
    expect(frames.length).assertEqual(before);
    return frames;
  } finally {
    clearTimeout(timer);
    try {
      ds.stop();
    } finally {
      ds.off('frame', onFrame);
    }
  }
}
