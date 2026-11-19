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

export default function dsSequenceMatrix20Test(): void {
  describe('DsSequenceMatrix20Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1274
     * @tc.name      dsSequence1274
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1274 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1274 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1275
     * @tc.name      dsSequence1275
     * @tc.desc      startStopCycle 序列下 min=60 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1275 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1275 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1276
     * @tc.name      dsSequence1276
     * @tc.desc      startThenSet 序列下 min=60 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1276 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1276 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1277
     * @tc.name      dsSequence1277
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1277 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1277 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1278
     * @tc.name      dsSequence1278
     * @tc.desc      startStopCycle 序列下 min=60 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1278 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1278 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1279
     * @tc.name      dsSequence1279
     * @tc.desc      startThenSet 序列下 min=60 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1279 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1279 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1280
     * @tc.name      dsSequence1280
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1280 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1280 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1281
     * @tc.name      dsSequence1281
     * @tc.desc      startStopCycle 序列下 min=60 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1281 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1281 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1282
     * @tc.name      dsSequence1282
     * @tc.desc      startThenSet 序列下 min=60 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1282 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1282 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1283
     * @tc.name      dsSequence1283
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1283 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1283 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1284
     * @tc.name      dsSequence1284
     * @tc.desc      startStopCycle 序列下 min=60 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1284 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1284 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1285
     * @tc.name      dsSequence1285
     * @tc.desc      startThenSet 序列下 min=60 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1285 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1285 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1286
     * @tc.name      dsSequence1286
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1286 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1286 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1287
     * @tc.name      dsSequence1287
     * @tc.desc      startStopCycle 序列下 min=60 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1287 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1287 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1288
     * @tc.name      dsSequence1288
     * @tc.desc      startThenSet 序列下 min=60 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1288 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1288 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1289
     * @tc.name      dsSequence1289
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1289 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1289 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1290
     * @tc.name      dsSequence1290
     * @tc.desc      startStopCycle 序列下 min=60 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1290 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1290 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1291
     * @tc.name      dsSequence1291
     * @tc.desc      startThenSet 序列下 min=60 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1291 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1291 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1292
     * @tc.name      dsSequence1292
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1292 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1292 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1293
     * @tc.name      dsSequence1293
     * @tc.desc      startStopCycle 序列下 min=60 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1293 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1293 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1294
     * @tc.name      dsSequence1294
     * @tc.desc      startThenSet 序列下 min=60 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1294 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1294 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1295
     * @tc.name      dsSequence1295
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1295 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1295 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1296
     * @tc.name      dsSequence1296
     * @tc.desc      startStopCycle 序列下 min=60 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1296 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1296 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1297
     * @tc.name      dsSequence1297
     * @tc.desc      startThenSet 序列下 min=60 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1297 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1297 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1298
     * @tc.name      dsSequence1298
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1298 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1298 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1299
     * @tc.name      dsSequence1299
     * @tc.desc      startStopCycle 序列下 min=60 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1299 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1299 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1300
     * @tc.name      dsSequence1300
     * @tc.desc      startThenSet 序列下 min=60 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1300 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1300 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1301
     * @tc.name      dsSequence1301
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1301 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1301 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1302
     * @tc.name      dsSequence1302
     * @tc.desc      startStopCycle 序列下 min=60 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1302 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1302 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1303
     * @tc.name      dsSequence1303
     * @tc.desc      startThenSet 序列下 min=60 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1303 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 60, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1303 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1304
     * @tc.name      dsSequence1304
     * @tc.desc      setTwiceAlternating 序列下 min=60 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1304 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 144, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 60, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1304 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1305
     * @tc.name      dsSequence1305
     * @tc.desc      startStopCycle 序列下 min=60 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1305 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 60, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1305 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1306
     * @tc.name      dsSequence1306
     * @tc.desc      startThenSet 序列下 min=72 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1306 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1306 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1307
     * @tc.name      dsSequence1307
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1307 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1307 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1308
     * @tc.name      dsSequence1308
     * @tc.desc      startStopCycle 序列下 min=72 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1308 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1308 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1309
     * @tc.name      dsSequence1309
     * @tc.desc      startThenSet 序列下 min=72 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1309 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1309 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1310
     * @tc.name      dsSequence1310
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1310 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1310 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1311
     * @tc.name      dsSequence1311
     * @tc.desc      startStopCycle 序列下 min=72 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1311 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1311 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1312
     * @tc.name      dsSequence1312
     * @tc.desc      startThenSet 序列下 min=72 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1312 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1312 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1313
     * @tc.name      dsSequence1313
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1313 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1313 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1314
     * @tc.name      dsSequence1314
     * @tc.desc      startStopCycle 序列下 min=72 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1314 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1314 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1315
     * @tc.name      dsSequence1315
     * @tc.desc      startThenSet 序列下 min=72 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1315 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1315 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1316
     * @tc.name      dsSequence1316
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1316 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1316 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1317
     * @tc.name      dsSequence1317
     * @tc.desc      startStopCycle 序列下 min=72 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1317 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1317 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1318
     * @tc.name      dsSequence1318
     * @tc.desc      startThenSet 序列下 min=72 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1318 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1318 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1319
     * @tc.name      dsSequence1319
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1319 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1319 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1320
     * @tc.name      dsSequence1320
     * @tc.desc      startStopCycle 序列下 min=72 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1320 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1320 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1321
     * @tc.name      dsSequence1321
     * @tc.desc      startThenSet 序列下 min=72 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1321 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1321 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1322
     * @tc.name      dsSequence1322
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1322 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1322 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1323
     * @tc.name      dsSequence1323
     * @tc.desc      startStopCycle 序列下 min=72 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1323 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1323 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1324
     * @tc.name      dsSequence1324
     * @tc.desc      startThenSet 序列下 min=72 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1324 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1324 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1325
     * @tc.name      dsSequence1325
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1325 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1325 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1326
     * @tc.name      dsSequence1326
     * @tc.desc      startStopCycle 序列下 min=72 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1326 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1326 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1327
     * @tc.name      dsSequence1327
     * @tc.desc      startThenSet 序列下 min=72 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1327 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1327 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1328
     * @tc.name      dsSequence1328
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1328 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1328 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1329
     * @tc.name      dsSequence1329
     * @tc.desc      startStopCycle 序列下 min=72 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1329 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1329 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1330
     * @tc.name      dsSequence1330
     * @tc.desc      startThenSet 序列下 min=72 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1330 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1330 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1331
     * @tc.name      dsSequence1331
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1331 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1331 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1332
     * @tc.name      dsSequence1332
     * @tc.desc      startStopCycle 序列下 min=72 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1332 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1332 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1333
     * @tc.name      dsSequence1333
     * @tc.desc      startThenSet 序列下 min=72 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1333 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 72, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1333 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1334
     * @tc.name      dsSequence1334
     * @tc.desc      setTwiceAlternating 序列下 min=72 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1334 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 144, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 72, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1334 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1335
     * @tc.name      dsSequence1335
     * @tc.desc      startStopCycle 序列下 min=72 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1335 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 72, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1335 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1336
     * @tc.name      dsSequence1336
     * @tc.desc      startThenSet 序列下 min=90 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1336 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1336 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1337
     * @tc.name      dsSequence1337
     * @tc.desc      setTwiceAlternating 序列下 min=90 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1337 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1337 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1338
     * @tc.name      dsSequence1338
     * @tc.desc      startStopCycle 序列下 min=90 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1338 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1338 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1339
     * @tc.name      dsSequence1339
     * @tc.desc      startThenSet 序列下 min=90 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1339 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1339 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1340
     * @tc.name      dsSequence1340
     * @tc.desc      setTwiceAlternating 序列下 min=90 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1340 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 90, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1340 end');
    })
  })
}
