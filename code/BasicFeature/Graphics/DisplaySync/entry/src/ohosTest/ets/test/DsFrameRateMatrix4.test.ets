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
import { bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySync]';

export default function dsFrameRateMatrix4Test(): void {
  describe('DsFrameRateMatrix4Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0214
     * @tc.name      dsFrameRate0214
     * @tc.desc      min=10 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0214 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 90, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 90 && 90 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0214 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0215
     * @tc.name      dsFrameRate0215
     * @tc.desc      min=10 expected=10 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0215 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0215 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0216
     * @tc.name      dsFrameRate0216
     * @tc.desc      min=10 expected=15 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0216 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0216 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0217
     * @tc.name      dsFrameRate0217
     * @tc.desc      min=10 expected=20 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0217 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0217 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0218
     * @tc.name      dsFrameRate0218
     * @tc.desc      min=10 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0218 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0218 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0219
     * @tc.name      dsFrameRate0219
     * @tc.desc      min=10 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0219 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 30, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 30 && 30 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0219 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0220
     * @tc.name      dsFrameRate0220
     * @tc.desc      min=10 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0220 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 48, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 48 && 48 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0220 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0221
     * @tc.name      dsFrameRate0221
     * @tc.desc      min=10 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0221 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 60, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 60 && 60 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0221 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0222
     * @tc.name      dsFrameRate0222
     * @tc.desc      min=10 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0222 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 72, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 72 && 72 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0222 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0223
     * @tc.name      dsFrameRate0223
     * @tc.desc      min=10 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0223 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0223 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0224
     * @tc.name      dsFrameRate0224
     * @tc.desc      min=10 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0224 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0224 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0225
     * @tc.name      dsFrameRate0225
     * @tc.desc      min=10 expected=10 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0225 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0225 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0226
     * @tc.name      dsFrameRate0226
     * @tc.desc      min=10 expected=15 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0226 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0226 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0227
     * @tc.name      dsFrameRate0227
     * @tc.desc      min=10 expected=20 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0227 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0227 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0228
     * @tc.name      dsFrameRate0228
     * @tc.desc      min=10 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0228 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0228 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0229
     * @tc.name      dsFrameRate0229
     * @tc.desc      min=10 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0229 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 30, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 30 && 30 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0229 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0230
     * @tc.name      dsFrameRate0230
     * @tc.desc      min=10 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0230 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 48, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 48 && 48 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0230 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0231
     * @tc.name      dsFrameRate0231
     * @tc.desc      min=10 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0231 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 60, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 60 && 60 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0231 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0232
     * @tc.name      dsFrameRate0232
     * @tc.desc      min=10 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0232 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 72, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 72 && 72 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0232 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0233
     * @tc.name      dsFrameRate0233
     * @tc.desc      min=10 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0233 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0233 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0234
     * @tc.name      dsFrameRate0234
     * @tc.desc      min=10 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0234 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0234 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0235
     * @tc.name      dsFrameRate0235
     * @tc.desc      min=10 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0235 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0235 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0236
     * @tc.name      dsFrameRate0236
     * @tc.desc      min=15 expected=15 max=15 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0236 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 15 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 15).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0236 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0237
     * @tc.name      dsFrameRate0237
     * @tc.desc      min=15 expected=15 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0237 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0237 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0238
     * @tc.name      dsFrameRate0238
     * @tc.desc      min=15 expected=20 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0238 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0238 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0239
     * @tc.name      dsFrameRate0239
     * @tc.desc      min=15 expected=15 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0239 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0239 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0240
     * @tc.name      dsFrameRate0240
     * @tc.desc      min=15 expected=20 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0240 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0240 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0241
     * @tc.name      dsFrameRate0241
     * @tc.desc      min=15 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0241 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0241 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0242
     * @tc.name      dsFrameRate0242
     * @tc.desc      min=15 expected=15 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0242 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0242 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0243
     * @tc.name      dsFrameRate0243
     * @tc.desc      min=15 expected=20 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0243 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0243 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0244
     * @tc.name      dsFrameRate0244
     * @tc.desc      min=15 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0244 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0244 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0245
     * @tc.name      dsFrameRate0245
     * @tc.desc      min=15 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0245 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 30, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 30 && 30 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0245 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0246
     * @tc.name      dsFrameRate0246
     * @tc.desc      min=15 expected=15 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0246 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0246 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0247
     * @tc.name      dsFrameRate0247
     * @tc.desc      min=15 expected=20 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0247 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0247 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0248
     * @tc.name      dsFrameRate0248
     * @tc.desc      min=15 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0248 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0248 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0249
     * @tc.name      dsFrameRate0249
     * @tc.desc      min=15 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0249 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 30, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 30 && 30 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0249 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0250
     * @tc.name      dsFrameRate0250
     * @tc.desc      min=15 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0250 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 48, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 48 && 48 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0250 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0251
     * @tc.name      dsFrameRate0251
     * @tc.desc      min=15 expected=15 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0251 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0251 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0252
     * @tc.name      dsFrameRate0252
     * @tc.desc      min=15 expected=20 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0252 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0252 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0253
     * @tc.name      dsFrameRate0253
     * @tc.desc      min=15 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0253 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0253 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0254
     * @tc.name      dsFrameRate0254
     * @tc.desc      min=15 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0254 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 30, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 30 && 30 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0254 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0255
     * @tc.name      dsFrameRate0255
     * @tc.desc      min=15 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0255 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 48, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 48 && 48 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0255 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0256
     * @tc.name      dsFrameRate0256
     * @tc.desc      min=15 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0256 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 60, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 60 && 60 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0256 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0257
     * @tc.name      dsFrameRate0257
     * @tc.desc      min=15 expected=15 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0257 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0257 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0258
     * @tc.name      dsFrameRate0258
     * @tc.desc      min=15 expected=20 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0258 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0258 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0259
     * @tc.name      dsFrameRate0259
     * @tc.desc      min=15 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0259 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0259 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0260
     * @tc.name      dsFrameRate0260
     * @tc.desc      min=15 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0260 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 30, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 30 && 30 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0260 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0261
     * @tc.name      dsFrameRate0261
     * @tc.desc      min=15 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0261 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 48, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 48 && 48 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0261 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0262
     * @tc.name      dsFrameRate0262
     * @tc.desc      min=15 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0262 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 60, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 60 && 60 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0262 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0263
     * @tc.name      dsFrameRate0263
     * @tc.desc      min=15 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0263 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 72, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 72 && 72 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0263 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0264
     * @tc.name      dsFrameRate0264
     * @tc.desc      min=15 expected=15 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0264 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0264 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0265
     * @tc.name      dsFrameRate0265
     * @tc.desc      min=15 expected=20 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0265 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0265 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0266
     * @tc.name      dsFrameRate0266
     * @tc.desc      min=15 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0266 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0266 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0267
     * @tc.name      dsFrameRate0267
     * @tc.desc      min=15 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0267 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 30, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 30 && 30 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0267 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0268
     * @tc.name      dsFrameRate0268
     * @tc.desc      min=15 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0268 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 48, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 48 && 48 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0268 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0269
     * @tc.name      dsFrameRate0269
     * @tc.desc      min=15 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0269 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 60, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 60 && 60 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0269 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0270
     * @tc.name      dsFrameRate0270
     * @tc.desc      min=15 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0270 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 72, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 72 && 72 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0270 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0271
     * @tc.name      dsFrameRate0271
     * @tc.desc      min=15 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0271 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 90, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 90 && 90 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0271 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0272
     * @tc.name      dsFrameRate0272
     * @tc.desc      min=15 expected=15 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0272 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0272 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0273
     * @tc.name      dsFrameRate0273
     * @tc.desc      min=15 expected=20 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0273 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0273 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0274
     * @tc.name      dsFrameRate0274
     * @tc.desc      min=15 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0274 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0274 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0275
     * @tc.name      dsFrameRate0275
     * @tc.desc      min=15 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0275 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 30, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 30 && 30 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0275 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0276
     * @tc.name      dsFrameRate0276
     * @tc.desc      min=15 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0276 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 48, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 48 && 48 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0276 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0277
     * @tc.name      dsFrameRate0277
     * @tc.desc      min=15 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0277 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 60, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 60 && 60 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0277 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0278
     * @tc.name      dsFrameRate0278
     * @tc.desc      min=15 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0278 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 72, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 72 && 72 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0278 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0279
     * @tc.name      dsFrameRate0279
     * @tc.desc      min=15 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0279 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0279 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0280
     * @tc.name      dsFrameRate0280
     * @tc.desc      min=15 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0280 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0280 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0281
     * @tc.name      dsFrameRate0281
     * @tc.desc      min=15 expected=15 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0281 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 15, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 15 && 15 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0281 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0282
     * @tc.name      dsFrameRate0282
     * @tc.desc      min=15 expected=20 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0282 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 20, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 20 && 20 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0282 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0283
     * @tc.name      dsFrameRate0283
     * @tc.desc      min=15 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0283 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 24, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 24 && 24 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0283 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0284
     * @tc.name      dsFrameRate0284
     * @tc.desc      min=15 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0284 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 30, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 30 && 30 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0284 end');
    })
  })
}
