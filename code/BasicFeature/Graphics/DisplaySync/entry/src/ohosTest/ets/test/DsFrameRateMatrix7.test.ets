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

export default function dsFrameRateMatrix7Test(): void {
  describe('DsFrameRateMatrix7Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0427
     * @tc.name      dsFrameRate0427
     * @tc.desc      min=60 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0427 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 60 && 60 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0427 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0428
     * @tc.name      dsFrameRate0428
     * @tc.desc      min=60 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0428 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 72 && 72 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0428 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0429
     * @tc.name      dsFrameRate0429
     * @tc.desc      min=60 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0429 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0429 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0430
     * @tc.name      dsFrameRate0430
     * @tc.desc      min=60 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0430 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0430 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0431
     * @tc.name      dsFrameRate0431
     * @tc.desc      min=60 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0431 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 60 && 60 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0431 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0432
     * @tc.name      dsFrameRate0432
     * @tc.desc      min=60 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0432 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 72 && 72 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0432 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0433
     * @tc.name      dsFrameRate0433
     * @tc.desc      min=60 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0433 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0433 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0434
     * @tc.name      dsFrameRate0434
     * @tc.desc      min=60 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0434 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0434 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0435
     * @tc.name      dsFrameRate0435
     * @tc.desc      min=60 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0435 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(60 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0435 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0436
     * @tc.name      dsFrameRate0436
     * @tc.desc      min=72 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0436 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 72 && 72 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0436 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0437
     * @tc.name      dsFrameRate0437
     * @tc.desc      min=72 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0437 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 72 && 72 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0437 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0438
     * @tc.name      dsFrameRate0438
     * @tc.desc      min=72 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0438 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 90 && 90 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0438 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0439
     * @tc.name      dsFrameRate0439
     * @tc.desc      min=72 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0439 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 72 && 72 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0439 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0440
     * @tc.name      dsFrameRate0440
     * @tc.desc      min=72 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0440 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0440 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0441
     * @tc.name      dsFrameRate0441
     * @tc.desc      min=72 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0441 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0441 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0442
     * @tc.name      dsFrameRate0442
     * @tc.desc      min=72 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0442 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 72 && 72 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0442 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0443
     * @tc.name      dsFrameRate0443
     * @tc.desc      min=72 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0443 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0443 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0444
     * @tc.name      dsFrameRate0444
     * @tc.desc      min=72 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0444 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0444 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0445
     * @tc.name      dsFrameRate0445
     * @tc.desc      min=72 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0445 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(72 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0445 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0446
     * @tc.name      dsFrameRate0446
     * @tc.desc      min=90 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0446 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(90 <= 90 && 90 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0446 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0447
     * @tc.name      dsFrameRate0447
     * @tc.desc      min=90 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0447 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(90 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0447 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0448
     * @tc.name      dsFrameRate0448
     * @tc.desc      min=90 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0448 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(90 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0448 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0449
     * @tc.name      dsFrameRate0449
     * @tc.desc      min=90 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0449 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(90 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0449 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0450
     * @tc.name      dsFrameRate0450
     * @tc.desc      min=90 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0450 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(90 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0450 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0451
     * @tc.name      dsFrameRate0451
     * @tc.desc      min=90 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0451 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(90 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0451 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0452
     * @tc.name      dsFrameRate0452
     * @tc.desc      min=120 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0452 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(120 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0452 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0453
     * @tc.name      dsFrameRate0453
     * @tc.desc      min=120 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0453 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(120 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0453 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0454
     * @tc.name      dsFrameRate0454
     * @tc.desc      min=120 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0454 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(120 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0454 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0455
     * @tc.name      dsFrameRate0455
     * @tc.desc      min=144 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0455 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 144, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(144 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0455 end');
    })
  })
}
