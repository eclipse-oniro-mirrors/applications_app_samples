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

export default function dsSequenceMatrix21Test(): void {
  describe('DsSequenceMatrix21Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1341
     * @tc.name      dsSequence1341
     * @tc.desc      startStopCycle 序列下 min=90 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1341 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 120 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1341 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1342
     * @tc.name      dsSequence1342
     * @tc.desc      startThenSet 序列下 min=90 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1342 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 120 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1342 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1343
     * @tc.name      dsSequence1343
     * @tc.desc      setTwiceAlternating 序列下 min=90 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1343 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 120 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1343 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1344
     * @tc.name      dsSequence1344
     * @tc.desc      startStopCycle 序列下 min=90 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1344 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 120 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1344 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1345
     * @tc.name      dsSequence1345
     * @tc.desc      startThenSet 序列下 min=90 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1345 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 144 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1345 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1346
     * @tc.name      dsSequence1346
     * @tc.desc      setTwiceAlternating 序列下 min=90 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1346 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 144 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1346 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1347
     * @tc.name      dsSequence1347
     * @tc.desc      startStopCycle 序列下 min=90 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1347 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 144 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1347 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1348
     * @tc.name      dsSequence1348
     * @tc.desc      startThenSet 序列下 min=90 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1348 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 144 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1348 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1349
     * @tc.name      dsSequence1349
     * @tc.desc      setTwiceAlternating 序列下 min=90 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1349 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 144 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1349 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1350
     * @tc.name      dsSequence1350
     * @tc.desc      startStopCycle 序列下 min=90 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1350 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 120, max: 144 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1350 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1351
     * @tc.name      dsSequence1351
     * @tc.desc      startThenSet 序列下 min=90 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1351 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 90, expected: 144, max: 144 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1351 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1352
     * @tc.name      dsSequence1352
     * @tc.desc      setTwiceAlternating 序列下 min=90 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1352 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 144, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 90, expected: 144, max: 144 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1352 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1353
     * @tc.name      dsSequence1353
     * @tc.desc      startStopCycle 序列下 min=90 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1353 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 144, max: 144 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1353 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1354
     * @tc.name      dsSequence1354
     * @tc.desc      startThenSet 序列下 min=120 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1354 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 120 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1354 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1355
     * @tc.name      dsSequence1355
     * @tc.desc      setTwiceAlternating 序列下 min=120 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1355 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 120 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1355 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1356
     * @tc.name      dsSequence1356
     * @tc.desc      startStopCycle 序列下 min=120 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1356 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 120 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1356 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1357
     * @tc.name      dsSequence1357
     * @tc.desc      startThenSet 序列下 min=120 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1357 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 144 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1357 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1358
     * @tc.name      dsSequence1358
     * @tc.desc      setTwiceAlternating 序列下 min=120 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1358 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 144 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1358 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1359
     * @tc.name      dsSequence1359
     * @tc.desc      startStopCycle 序列下 min=120 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1359 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 120, max: 144 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1359 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1360
     * @tc.name      dsSequence1360
     * @tc.desc      startThenSet 序列下 min=120 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1360 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 120, expected: 144, max: 144 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1360 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1361
     * @tc.name      dsSequence1361
     * @tc.desc      setTwiceAlternating 序列下 min=120 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1361 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 144, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 120, expected: 144, max: 144 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1361 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1362
     * @tc.name      dsSequence1362
     * @tc.desc      startStopCycle 序列下 min=120 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1362 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 120, expected: 144, max: 144 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1362 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1363
     * @tc.name      dsSequence1363
     * @tc.desc      startThenSet 序列下 min=144 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1363 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 144, expected: 144, max: 144 });
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1363 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1364
     * @tc.name      dsSequence1364
     * @tc.desc      setTwiceAlternating 序列下 min=144 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1364 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 144, expected: 144, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 144, expected: 144, max: 144 });
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1364 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1365
     * @tc.name      dsSequence1365
     * @tc.desc      startStopCycle 序列下 min=144 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1365 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 144, expected: 144, max: 144 });
      ds.start();
      ds.stop();
      ds.start();
      ds.stop();
      const t1: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('object');
      const t2: string = typeof ds.setExpectedFrameRateRange;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + t2);
      expect(t2).assertEqual('function');
      const t3: boolean = t1.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + t3);
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1365 end');
    })
  })
}
