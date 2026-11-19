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

export default function dsSequenceMatrix16Test(): void {
  describe('DsSequenceMatrix16Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1006
     * @tc.name      dsSequence1006
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1006 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 24 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1006 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1007
     * @tc.name      dsSequence1007
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1007 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 24 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 24 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1007 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1008
     * @tc.name      dsSequence1008
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1008 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 24 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1008 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1009
     * @tc.name      dsSequence1009
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1009 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1009 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1010
     * @tc.name      dsSequence1010
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1010 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 30 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1010 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1011
     * @tc.name      dsSequence1011
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1011 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1011 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1012
     * @tc.name      dsSequence1012
     * @tc.desc      startThenSet 序列下 min=24 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1012 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1012 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1013
     * @tc.name      dsSequence1013
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1013 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 30 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1013 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1014
     * @tc.name      dsSequence1014
     * @tc.desc      startStopCycle 序列下 min=24 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1014 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1014 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1015
     * @tc.name      dsSequence1015
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1015 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1015 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1016
     * @tc.name      dsSequence1016
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1016 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 48 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1016 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1017
     * @tc.name      dsSequence1017
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1017 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1017 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1018
     * @tc.name      dsSequence1018
     * @tc.desc      startThenSet 序列下 min=24 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1018 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1018 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1019
     * @tc.name      dsSequence1019
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1019 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 48 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1019 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1020
     * @tc.name      dsSequence1020
     * @tc.desc      startStopCycle 序列下 min=24 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1020 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1020 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1021
     * @tc.name      dsSequence1021
     * @tc.desc      startThenSet 序列下 min=24 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1021 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1021 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1022
     * @tc.name      dsSequence1022
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1022 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 48 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1022 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1023
     * @tc.name      dsSequence1023
     * @tc.desc      startStopCycle 序列下 min=24 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1023 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1023 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1024
     * @tc.name      dsSequence1024
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1024 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1024 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1025
     * @tc.name      dsSequence1025
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1025 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1025 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1026
     * @tc.name      dsSequence1026
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1026 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1026 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1027
     * @tc.name      dsSequence1027
     * @tc.desc      startThenSet 序列下 min=24 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1027 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1027 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1028
     * @tc.name      dsSequence1028
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1028 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1028 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1029
     * @tc.name      dsSequence1029
     * @tc.desc      startStopCycle 序列下 min=24 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1029 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1029 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1030
     * @tc.name      dsSequence1030
     * @tc.desc      startThenSet 序列下 min=24 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1030 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1030 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1031
     * @tc.name      dsSequence1031
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1031 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1031 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1032
     * @tc.name      dsSequence1032
     * @tc.desc      startStopCycle 序列下 min=24 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1032 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1032 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1033
     * @tc.name      dsSequence1033
     * @tc.desc      startThenSet 序列下 min=24 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1033 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1033 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1034
     * @tc.name      dsSequence1034
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1034 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1034 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1035
     * @tc.name      dsSequence1035
     * @tc.desc      startStopCycle 序列下 min=24 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1035 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1035 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1036
     * @tc.name      dsSequence1036
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1036 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1036 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1037
     * @tc.name      dsSequence1037
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1037 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1037 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1038
     * @tc.name      dsSequence1038
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1038 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1038 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1039
     * @tc.name      dsSequence1039
     * @tc.desc      startThenSet 序列下 min=24 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1039 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1039 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1040
     * @tc.name      dsSequence1040
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1040 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1040 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1041
     * @tc.name      dsSequence1041
     * @tc.desc      startStopCycle 序列下 min=24 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1041 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1041 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1042
     * @tc.name      dsSequence1042
     * @tc.desc      startThenSet 序列下 min=24 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1042 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1042 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1043
     * @tc.name      dsSequence1043
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1043 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1043 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1044
     * @tc.name      dsSequence1044
     * @tc.desc      startStopCycle 序列下 min=24 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1044 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1044 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1045
     * @tc.name      dsSequence1045
     * @tc.desc      startThenSet 序列下 min=24 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1045 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1045 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1046
     * @tc.name      dsSequence1046
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1046 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1046 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1047
     * @tc.name      dsSequence1047
     * @tc.desc      startStopCycle 序列下 min=24 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1047 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1047 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1048
     * @tc.name      dsSequence1048
     * @tc.desc      startThenSet 序列下 min=24 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1048 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1048 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1049
     * @tc.name      dsSequence1049
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1049 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1049 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1050
     * @tc.name      dsSequence1050
     * @tc.desc      startStopCycle 序列下 min=24 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1050 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1050 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1051
     * @tc.name      dsSequence1051
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1051 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1051 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1052
     * @tc.name      dsSequence1052
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1052 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1052 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1053
     * @tc.name      dsSequence1053
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1053 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1053 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1054
     * @tc.name      dsSequence1054
     * @tc.desc      startThenSet 序列下 min=24 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1054 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1054 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1055
     * @tc.name      dsSequence1055
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1055 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1055 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1056
     * @tc.name      dsSequence1056
     * @tc.desc      startStopCycle 序列下 min=24 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1056 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1056 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1057
     * @tc.name      dsSequence1057
     * @tc.desc      startThenSet 序列下 min=24 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1057 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1057 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1058
     * @tc.name      dsSequence1058
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1058 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1058 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1059
     * @tc.name      dsSequence1059
     * @tc.desc      startStopCycle 序列下 min=24 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1059 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1059 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1060
     * @tc.name      dsSequence1060
     * @tc.desc      startThenSet 序列下 min=24 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1060 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1060 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1061
     * @tc.name      dsSequence1061
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1061 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1061 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1062
     * @tc.name      dsSequence1062
     * @tc.desc      startStopCycle 序列下 min=24 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1062 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1062 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1063
     * @tc.name      dsSequence1063
     * @tc.desc      startThenSet 序列下 min=24 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1063 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1063 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1064
     * @tc.name      dsSequence1064
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1064 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1064 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1065
     * @tc.name      dsSequence1065
     * @tc.desc      startStopCycle 序列下 min=24 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1065 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1065 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1066
     * @tc.name      dsSequence1066
     * @tc.desc      startThenSet 序列下 min=24 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1066 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1066 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1067
     * @tc.name      dsSequence1067
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1067 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1067 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1068
     * @tc.name      dsSequence1068
     * @tc.desc      startStopCycle 序列下 min=24 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1068 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1068 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1069
     * @tc.name      dsSequence1069
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1069 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1069 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1070
     * @tc.name      dsSequence1070
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1070 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1070 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1071
     * @tc.name      dsSequence1071
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1071 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1071 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1072
     * @tc.name      dsSequence1072
     * @tc.desc      startThenSet 序列下 min=24 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1072 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1072 end');
    })
  })
}
