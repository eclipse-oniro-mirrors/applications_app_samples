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

export default function dsFrameRateMatrix5Test(): void {
  describe('DsFrameRateMatrix5Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0285
     * @tc.name      dsFrameRate0285
     * @tc.desc      min=15 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0285 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 48, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 48 && 48 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0285 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0286
     * @tc.name      dsFrameRate0286
     * @tc.desc      min=15 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0286 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 60, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 60 && 60 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0286 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0287
     * @tc.name      dsFrameRate0287
     * @tc.desc      min=15 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0287 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 72, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 72 && 72 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0287 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0288
     * @tc.name      dsFrameRate0288
     * @tc.desc      min=15 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0288 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0288 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0289
     * @tc.name      dsFrameRate0289
     * @tc.desc      min=15 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0289 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0289 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0290
     * @tc.name      dsFrameRate0290
     * @tc.desc      min=15 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0290 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 15, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(15 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0290 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0291
     * @tc.name      dsFrameRate0291
     * @tc.desc      min=20 expected=20 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0291 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0291 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0292
     * @tc.name      dsFrameRate0292
     * @tc.desc      min=20 expected=20 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0292 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0292 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0293
     * @tc.name      dsFrameRate0293
     * @tc.desc      min=20 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0293 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0293 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0294
     * @tc.name      dsFrameRate0294
     * @tc.desc      min=20 expected=20 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0294 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0294 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0295
     * @tc.name      dsFrameRate0295
     * @tc.desc      min=20 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0295 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0295 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0296
     * @tc.name      dsFrameRate0296
     * @tc.desc      min=20 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0296 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 30, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 30 && 30 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0296 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0297
     * @tc.name      dsFrameRate0297
     * @tc.desc      min=20 expected=20 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0297 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0297 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0298
     * @tc.name      dsFrameRate0298
     * @tc.desc      min=20 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0298 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0298 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0299
     * @tc.name      dsFrameRate0299
     * @tc.desc      min=20 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0299 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 30, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 30 && 30 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0299 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0300
     * @tc.name      dsFrameRate0300
     * @tc.desc      min=20 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0300 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 48, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 48 && 48 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0300 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0301
     * @tc.name      dsFrameRate0301
     * @tc.desc      min=20 expected=20 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0301 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0301 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0302
     * @tc.name      dsFrameRate0302
     * @tc.desc      min=20 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0302 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0302 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0303
     * @tc.name      dsFrameRate0303
     * @tc.desc      min=20 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0303 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 30, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 30 && 30 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0303 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0304
     * @tc.name      dsFrameRate0304
     * @tc.desc      min=20 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0304 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 48, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 48 && 48 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0304 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0305
     * @tc.name      dsFrameRate0305
     * @tc.desc      min=20 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0305 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 60, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 60 && 60 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0305 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0306
     * @tc.name      dsFrameRate0306
     * @tc.desc      min=20 expected=20 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0306 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0306 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0307
     * @tc.name      dsFrameRate0307
     * @tc.desc      min=20 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0307 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0307 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0308
     * @tc.name      dsFrameRate0308
     * @tc.desc      min=20 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0308 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 30, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 30 && 30 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0308 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0309
     * @tc.name      dsFrameRate0309
     * @tc.desc      min=20 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0309 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 48, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 48 && 48 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0309 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0310
     * @tc.name      dsFrameRate0310
     * @tc.desc      min=20 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0310 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 60, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 60 && 60 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0310 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0311
     * @tc.name      dsFrameRate0311
     * @tc.desc      min=20 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0311 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 72, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 72 && 72 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0311 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0312
     * @tc.name      dsFrameRate0312
     * @tc.desc      min=20 expected=20 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0312 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0312 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0313
     * @tc.name      dsFrameRate0313
     * @tc.desc      min=20 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0313 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0313 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0314
     * @tc.name      dsFrameRate0314
     * @tc.desc      min=20 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0314 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 30, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 30 && 30 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0314 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0315
     * @tc.name      dsFrameRate0315
     * @tc.desc      min=20 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0315 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 48, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 48 && 48 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0315 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0316
     * @tc.name      dsFrameRate0316
     * @tc.desc      min=20 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0316 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 60, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 60 && 60 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0316 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0317
     * @tc.name      dsFrameRate0317
     * @tc.desc      min=20 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0317 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 72, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 72 && 72 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0317 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0318
     * @tc.name      dsFrameRate0318
     * @tc.desc      min=20 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0318 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 90, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 90 && 90 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0318 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0319
     * @tc.name      dsFrameRate0319
     * @tc.desc      min=20 expected=20 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0319 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0319 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0320
     * @tc.name      dsFrameRate0320
     * @tc.desc      min=20 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0320 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0320 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0321
     * @tc.name      dsFrameRate0321
     * @tc.desc      min=20 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0321 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 30, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 30 && 30 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0321 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0322
     * @tc.name      dsFrameRate0322
     * @tc.desc      min=20 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0322 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 48, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 48 && 48 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0322 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0323
     * @tc.name      dsFrameRate0323
     * @tc.desc      min=20 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0323 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 60, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 60 && 60 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0323 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0324
     * @tc.name      dsFrameRate0324
     * @tc.desc      min=20 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0324 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 72, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 72 && 72 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0324 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0325
     * @tc.name      dsFrameRate0325
     * @tc.desc      min=20 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0325 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0325 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0326
     * @tc.name      dsFrameRate0326
     * @tc.desc      min=20 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0326 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0326 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0327
     * @tc.name      dsFrameRate0327
     * @tc.desc      min=20 expected=20 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0327 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 20, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 20 && 20 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0327 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0328
     * @tc.name      dsFrameRate0328
     * @tc.desc      min=20 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0328 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 24, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 24 && 24 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0328 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0329
     * @tc.name      dsFrameRate0329
     * @tc.desc      min=20 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0329 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 30, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 30 && 30 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0329 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0330
     * @tc.name      dsFrameRate0330
     * @tc.desc      min=20 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0330 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 48, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 48 && 48 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0330 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0331
     * @tc.name      dsFrameRate0331
     * @tc.desc      min=20 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0331 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 60, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 60 && 60 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0331 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0332
     * @tc.name      dsFrameRate0332
     * @tc.desc      min=20 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0332 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 72, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 72 && 72 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0332 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0333
     * @tc.name      dsFrameRate0333
     * @tc.desc      min=20 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0333 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0333 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0334
     * @tc.name      dsFrameRate0334
     * @tc.desc      min=20 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0334 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0334 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0335
     * @tc.name      dsFrameRate0335
     * @tc.desc      min=20 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0335 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 20, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(20 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0335 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0336
     * @tc.name      dsFrameRate0336
     * @tc.desc      min=24 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0336 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 24 && 24 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0336 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0337
     * @tc.name      dsFrameRate0337
     * @tc.desc      min=24 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0337 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 24 && 24 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0337 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0338
     * @tc.name      dsFrameRate0338
     * @tc.desc      min=24 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0338 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 30 && 30 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0338 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0339
     * @tc.name      dsFrameRate0339
     * @tc.desc      min=24 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0339 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 24 && 24 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0339 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0340
     * @tc.name      dsFrameRate0340
     * @tc.desc      min=24 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0340 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 30 && 30 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0340 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0341
     * @tc.name      dsFrameRate0341
     * @tc.desc      min=24 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0341 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 48 && 48 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0341 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0342
     * @tc.name      dsFrameRate0342
     * @tc.desc      min=24 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0342 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 24 && 24 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0342 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0343
     * @tc.name      dsFrameRate0343
     * @tc.desc      min=24 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0343 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 30 && 30 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0343 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0344
     * @tc.name      dsFrameRate0344
     * @tc.desc      min=24 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0344 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 48 && 48 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0344 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0345
     * @tc.name      dsFrameRate0345
     * @tc.desc      min=24 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0345 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 60 && 60 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0345 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0346
     * @tc.name      dsFrameRate0346
     * @tc.desc      min=24 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0346 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 24 && 24 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0346 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0347
     * @tc.name      dsFrameRate0347
     * @tc.desc      min=24 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0347 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 30 && 30 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0347 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0348
     * @tc.name      dsFrameRate0348
     * @tc.desc      min=24 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0348 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 48 && 48 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0348 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0349
     * @tc.name      dsFrameRate0349
     * @tc.desc      min=24 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0349 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 60 && 60 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0349 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0350
     * @tc.name      dsFrameRate0350
     * @tc.desc      min=24 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0350 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 72 && 72 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0350 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0351
     * @tc.name      dsFrameRate0351
     * @tc.desc      min=24 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0351 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 24 && 24 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0351 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0352
     * @tc.name      dsFrameRate0352
     * @tc.desc      min=24 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0352 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 30 && 30 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0352 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0353
     * @tc.name      dsFrameRate0353
     * @tc.desc      min=24 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0353 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 48 && 48 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0353 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0354
     * @tc.name      dsFrameRate0354
     * @tc.desc      min=24 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0354 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 60 && 60 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0354 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0355
     * @tc.name      dsFrameRate0355
     * @tc.desc      min=24 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0355 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(24 <= 72 && 72 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0355 end');
    })
  })
}
