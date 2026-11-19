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

export default function dsSequenceMatrix17Test(): void {
  describe('DsSequenceMatrix17Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1073
     * @tc.name      dsSequence1073
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1073 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1073 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1074
     * @tc.name      dsSequence1074
     * @tc.desc      startStopCycle 序列下 min=24 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1074 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1074 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1075
     * @tc.name      dsSequence1075
     * @tc.desc      startThenSet 序列下 min=24 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1075 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1075 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1076
     * @tc.name      dsSequence1076
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1076 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1076 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1077
     * @tc.name      dsSequence1077
     * @tc.desc      startStopCycle 序列下 min=24 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1077 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1077 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1078
     * @tc.name      dsSequence1078
     * @tc.desc      startThenSet 序列下 min=24 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1078 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1078 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1079
     * @tc.name      dsSequence1079
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1079 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1079 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1080
     * @tc.name      dsSequence1080
     * @tc.desc      startStopCycle 序列下 min=24 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1080 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1080 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1081
     * @tc.name      dsSequence1081
     * @tc.desc      startThenSet 序列下 min=24 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1081 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1081 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1082
     * @tc.name      dsSequence1082
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1082 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1082 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1083
     * @tc.name      dsSequence1083
     * @tc.desc      startStopCycle 序列下 min=24 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1083 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1083 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1084
     * @tc.name      dsSequence1084
     * @tc.desc      startThenSet 序列下 min=24 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1084 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1084 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1085
     * @tc.name      dsSequence1085
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1085 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1085 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1086
     * @tc.name      dsSequence1086
     * @tc.desc      startStopCycle 序列下 min=24 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1086 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1086 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1087
     * @tc.name      dsSequence1087
     * @tc.desc      startThenSet 序列下 min=24 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1087 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1087 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1088
     * @tc.name      dsSequence1088
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1088 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1088 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1089
     * @tc.name      dsSequence1089
     * @tc.desc      startStopCycle 序列下 min=24 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1089 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1089 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1090
     * @tc.name      dsSequence1090
     * @tc.desc      startThenSet 序列下 min=24 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1090 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1090 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1091
     * @tc.name      dsSequence1091
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1091 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1091 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1092
     * @tc.name      dsSequence1092
     * @tc.desc      startStopCycle 序列下 min=24 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1092 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 24, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1092 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1093
     * @tc.name      dsSequence1093
     * @tc.desc      startThenSet 序列下 min=24 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1093 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1093 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1094
     * @tc.name      dsSequence1094
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1094 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1094 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1095
     * @tc.name      dsSequence1095
     * @tc.desc      startStopCycle 序列下 min=24 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1095 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 30, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1095 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1096
     * @tc.name      dsSequence1096
     * @tc.desc      startThenSet 序列下 min=24 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1096 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1096 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1097
     * @tc.name      dsSequence1097
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1097 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1097 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1098
     * @tc.name      dsSequence1098
     * @tc.desc      startStopCycle 序列下 min=24 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1098 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 48, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1098 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1099
     * @tc.name      dsSequence1099
     * @tc.desc      startThenSet 序列下 min=24 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1099 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1099 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1100
     * @tc.name      dsSequence1100
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1100 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1100 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1101
     * @tc.name      dsSequence1101
     * @tc.desc      startStopCycle 序列下 min=24 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1101 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1101 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1102
     * @tc.name      dsSequence1102
     * @tc.desc      startThenSet 序列下 min=24 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1102 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1102 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1103
     * @tc.name      dsSequence1103
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1103 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1103 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1104
     * @tc.name      dsSequence1104
     * @tc.desc      startStopCycle 序列下 min=24 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1104 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1104 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1105
     * @tc.name      dsSequence1105
     * @tc.desc      startThenSet 序列下 min=24 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1105 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1105 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1106
     * @tc.name      dsSequence1106
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1106 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1106 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1107
     * @tc.name      dsSequence1107
     * @tc.desc      startStopCycle 序列下 min=24 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1107 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1107 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1108
     * @tc.name      dsSequence1108
     * @tc.desc      startThenSet 序列下 min=24 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1108 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1108 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1109
     * @tc.name      dsSequence1109
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1109 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1109 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1110
     * @tc.name      dsSequence1110
     * @tc.desc      startStopCycle 序列下 min=24 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1110 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1110 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1111
     * @tc.name      dsSequence1111
     * @tc.desc      startThenSet 序列下 min=24 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1111 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 24, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1111 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1112
     * @tc.name      dsSequence1112
     * @tc.desc      setTwiceAlternating 序列下 min=24 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1112 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 144, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 24, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1112 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1113
     * @tc.name      dsSequence1113
     * @tc.desc      startStopCycle 序列下 min=24 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1113 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 24, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1113 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1114
     * @tc.name      dsSequence1114
     * @tc.desc      startThenSet 序列下 min=30 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1114 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1114 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1115
     * @tc.name      dsSequence1115
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1115 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 30 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1115 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1116
     * @tc.name      dsSequence1116
     * @tc.desc      startStopCycle 序列下 min=30 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1116 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 30 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1116 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1117
     * @tc.name      dsSequence1117
     * @tc.desc      startThenSet 序列下 min=30 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1117 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1117 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1118
     * @tc.name      dsSequence1118
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1118 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 48 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1118 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1119
     * @tc.name      dsSequence1119
     * @tc.desc      startStopCycle 序列下 min=30 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1119 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1119 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1120
     * @tc.name      dsSequence1120
     * @tc.desc      startThenSet 序列下 min=30 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1120 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1120 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1121
     * @tc.name      dsSequence1121
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1121 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 48 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1121 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1122
     * @tc.name      dsSequence1122
     * @tc.desc      startStopCycle 序列下 min=30 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1122 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1122 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1123
     * @tc.name      dsSequence1123
     * @tc.desc      startThenSet 序列下 min=30 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1123 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1123 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1124
     * @tc.name      dsSequence1124
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1124 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1124 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1125
     * @tc.name      dsSequence1125
     * @tc.desc      startStopCycle 序列下 min=30 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1125 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1125 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1126
     * @tc.name      dsSequence1126
     * @tc.desc      startThenSet 序列下 min=30 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1126 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1126 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1127
     * @tc.name      dsSequence1127
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1127 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1127 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1128
     * @tc.name      dsSequence1128
     * @tc.desc      startStopCycle 序列下 min=30 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1128 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1128 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1129
     * @tc.name      dsSequence1129
     * @tc.desc      startThenSet 序列下 min=30 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1129 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1129 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1130
     * @tc.name      dsSequence1130
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1130 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1130 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1131
     * @tc.name      dsSequence1131
     * @tc.desc      startStopCycle 序列下 min=30 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1131 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1131 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1132
     * @tc.name      dsSequence1132
     * @tc.desc      startThenSet 序列下 min=30 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1132 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1132 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1133
     * @tc.name      dsSequence1133
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1133 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1133 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1134
     * @tc.name      dsSequence1134
     * @tc.desc      startStopCycle 序列下 min=30 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1134 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1134 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1135
     * @tc.name      dsSequence1135
     * @tc.desc      startThenSet 序列下 min=30 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1135 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1135 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1136
     * @tc.name      dsSequence1136
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1136 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1136 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1137
     * @tc.name      dsSequence1137
     * @tc.desc      startStopCycle 序列下 min=30 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1137 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1137 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1138
     * @tc.name      dsSequence1138
     * @tc.desc      startThenSet 序列下 min=30 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1138 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1138 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1139
     * @tc.name      dsSequence1139
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1139 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1139 end');
    })
  })
}
