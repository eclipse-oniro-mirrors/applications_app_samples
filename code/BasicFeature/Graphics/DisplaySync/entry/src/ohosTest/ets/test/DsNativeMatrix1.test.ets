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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { displaySync } from '@kit.ArkGraphics2D';
import { probeFrames } from '../util/DisplaySyncProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySync]';

export default function dsNativeMatrix1Test(): void {
  describe('DsNativeMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0001
     * @tc.name      dsNative0001
     * @tc.desc      30fps 注册真实 frame 回调，验证时间戳、停止及解除监听效果
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0001 begin');
      const frames: displaySync.IntervalInfo[] = await probeFrames(30, false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + JSON.stringify(frames));
      expect(frames.length >= 4).assertTrue();
      for (let index: number = 0; index < frames.length; index++) {
        expect(frames[index].timestamp > 0).assertTrue();
        expect(frames[index].targetTimestamp > frames[index].timestamp).assertTrue();
        if (index > 0) {
          expect(frames[index].timestamp > frames[index - 1].timestamp).assertTrue();
        }
      }
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0001 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_NATIVE_0002
     * @tc.name      dsNative0002
     * @tc.desc      60fps 注册真实 frame 回调，验证时间戳、停止及解除监听效果
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsNative0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0002 begin');
      const frames: displaySync.IntervalInfo[] = await probeFrames(60, true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'frames=' + JSON.stringify(frames));
      expect(frames.length >= 4).assertTrue();
      for (let index: number = 0; index < frames.length; index++) {
        expect(frames[index].timestamp > 0).assertTrue();
        expect(frames[index].targetTimestamp > frames[index].timestamp).assertTrue();
        if (index > 0) {
          expect(frames[index].timestamp > frames[index - 1].timestamp).assertTrue();
        }
      }
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsNative0002 end');
    })
  })
}
