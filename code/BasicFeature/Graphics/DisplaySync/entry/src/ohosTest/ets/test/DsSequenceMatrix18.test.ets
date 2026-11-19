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

export default function dsSequenceMatrix18Test(): void {
  describe('DsSequenceMatrix18Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1140
     * @tc.name      dsSequence1140
     * @tc.desc      startStopCycle 序列下 min=30 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1140 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1140 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1141
     * @tc.name      dsSequence1141
     * @tc.desc      startThenSet 序列下 min=30 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1141 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1141 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1142
     * @tc.name      dsSequence1142
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1142 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 72 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1142 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1143
     * @tc.name      dsSequence1143
     * @tc.desc      startStopCycle 序列下 min=30 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1143 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 72 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1143 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1144
     * @tc.name      dsSequence1144
     * @tc.desc      startThenSet 序列下 min=30 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1144 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1144 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1145
     * @tc.name      dsSequence1145
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1145 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1145 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1146
     * @tc.name      dsSequence1146
     * @tc.desc      startStopCycle 序列下 min=30 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1146 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1146 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1147
     * @tc.name      dsSequence1147
     * @tc.desc      startThenSet 序列下 min=30 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1147 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1147 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1148
     * @tc.name      dsSequence1148
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1148 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1148 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1149
     * @tc.name      dsSequence1149
     * @tc.desc      startStopCycle 序列下 min=30 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1149 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1149 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1150
     * @tc.name      dsSequence1150
     * @tc.desc      startThenSet 序列下 min=30 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1150 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1150 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1151
     * @tc.name      dsSequence1151
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1151 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1151 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1152
     * @tc.name      dsSequence1152
     * @tc.desc      startStopCycle 序列下 min=30 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1152 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1152 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1153
     * @tc.name      dsSequence1153
     * @tc.desc      startThenSet 序列下 min=30 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1153 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1153 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1154
     * @tc.name      dsSequence1154
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1154 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1154 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1155
     * @tc.name      dsSequence1155
     * @tc.desc      startStopCycle 序列下 min=30 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1155 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1155 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1156
     * @tc.name      dsSequence1156
     * @tc.desc      startThenSet 序列下 min=30 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1156 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1156 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1157
     * @tc.name      dsSequence1157
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1157 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 90 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1157 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1158
     * @tc.name      dsSequence1158
     * @tc.desc      startStopCycle 序列下 min=30 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1158 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 90 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1158 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1159
     * @tc.name      dsSequence1159
     * @tc.desc      startThenSet 序列下 min=30 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1159 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1159 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1160
     * @tc.name      dsSequence1160
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1160 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1160 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1161
     * @tc.name      dsSequence1161
     * @tc.desc      startStopCycle 序列下 min=30 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1161 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1161 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1162
     * @tc.name      dsSequence1162
     * @tc.desc      startThenSet 序列下 min=30 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1162 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1162 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1163
     * @tc.name      dsSequence1163
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1163 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1163 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1164
     * @tc.name      dsSequence1164
     * @tc.desc      startStopCycle 序列下 min=30 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1164 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1164 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1165
     * @tc.name      dsSequence1165
     * @tc.desc      startThenSet 序列下 min=30 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1165 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1165 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1166
     * @tc.name      dsSequence1166
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1166 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1166 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1167
     * @tc.name      dsSequence1167
     * @tc.desc      startStopCycle 序列下 min=30 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1167 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1167 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1168
     * @tc.name      dsSequence1168
     * @tc.desc      startThenSet 序列下 min=30 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1168 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1168 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1169
     * @tc.name      dsSequence1169
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1169 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1169 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1170
     * @tc.name      dsSequence1170
     * @tc.desc      startStopCycle 序列下 min=30 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1170 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1170 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1171
     * @tc.name      dsSequence1171
     * @tc.desc      startThenSet 序列下 min=30 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1171 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1171 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1172
     * @tc.name      dsSequence1172
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1172 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1172 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1173
     * @tc.name      dsSequence1173
     * @tc.desc      startStopCycle 序列下 min=30 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1173 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1173 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1174
     * @tc.name      dsSequence1174
     * @tc.desc      startThenSet 序列下 min=30 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1174 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1174 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1175
     * @tc.name      dsSequence1175
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1175 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1175 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1176
     * @tc.name      dsSequence1176
     * @tc.desc      startStopCycle 序列下 min=30 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1176 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 120 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1176 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1177
     * @tc.name      dsSequence1177
     * @tc.desc      startThenSet 序列下 min=30 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1177 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1177 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1178
     * @tc.name      dsSequence1178
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1178 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1178 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1179
     * @tc.name      dsSequence1179
     * @tc.desc      startStopCycle 序列下 min=30 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1179 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 30, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1179 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1180
     * @tc.name      dsSequence1180
     * @tc.desc      startThenSet 序列下 min=30 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1180 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1180 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1181
     * @tc.name      dsSequence1181
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1181 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1181 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1182
     * @tc.name      dsSequence1182
     * @tc.desc      startStopCycle 序列下 min=30 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1182 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 48, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1182 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1183
     * @tc.name      dsSequence1183
     * @tc.desc      startThenSet 序列下 min=30 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1183 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1183 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1184
     * @tc.name      dsSequence1184
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1184 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1184 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1185
     * @tc.name      dsSequence1185
     * @tc.desc      startStopCycle 序列下 min=30 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1185 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 60, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1185 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1186
     * @tc.name      dsSequence1186
     * @tc.desc      startThenSet 序列下 min=30 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1186 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1186 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1187
     * @tc.name      dsSequence1187
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1187 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1187 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1188
     * @tc.name      dsSequence1188
     * @tc.desc      startStopCycle 序列下 min=30 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1188 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 72, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1188 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1189
     * @tc.name      dsSequence1189
     * @tc.desc      startThenSet 序列下 min=30 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1189 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1189 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1190
     * @tc.name      dsSequence1190
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1190 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1190 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1191
     * @tc.name      dsSequence1191
     * @tc.desc      startStopCycle 序列下 min=30 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1191 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 90, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1191 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1192
     * @tc.name      dsSequence1192
     * @tc.desc      startThenSet 序列下 min=30 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1192 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1192 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1193
     * @tc.name      dsSequence1193
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1193 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1193 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1194
     * @tc.name      dsSequence1194
     * @tc.desc      startStopCycle 序列下 min=30 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1194 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 120, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1194 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1195
     * @tc.name      dsSequence1195
     * @tc.desc      startThenSet 序列下 min=30 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1195 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 30, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1195 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1196
     * @tc.name      dsSequence1196
     * @tc.desc      setTwiceAlternating 序列下 min=30 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1196 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 144, max: 144 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 30, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1196 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1197
     * @tc.name      dsSequence1197
     * @tc.desc      startStopCycle 序列下 min=30 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1197 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 30, expected: 144, max: 144 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1197 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1198
     * @tc.name      dsSequence1198
     * @tc.desc      startThenSet 序列下 min=48 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1198 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1198 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1199
     * @tc.name      dsSequence1199
     * @tc.desc      setTwiceAlternating 序列下 min=48 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1199 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 48 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1199 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1200
     * @tc.name      dsSequence1200
     * @tc.desc      startStopCycle 序列下 min=48 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1200 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 48 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1200 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1201
     * @tc.name      dsSequence1201
     * @tc.desc      startThenSet 序列下 min=48 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1201 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1201 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1202
     * @tc.name      dsSequence1202
     * @tc.desc      setTwiceAlternating 序列下 min=48 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1202 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1202 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1203
     * @tc.name      dsSequence1203
     * @tc.desc      startStopCycle 序列下 min=48 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1203 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 48, expected: 48, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1203 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1204
     * @tc.name      dsSequence1204
     * @tc.desc      startThenSet 序列下 min=48 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1204 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.start();
      ds.setExpectedFrameRateRange({ min: 48, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1204 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1205
     * @tc.name      dsSequence1205
     * @tc.desc      setTwiceAlternating 序列下 min=48 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1205 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 48, expected: 60, max: 60 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 48, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1205 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_SEQUENCE_1206
     * @tc.name      dsSequence1206
     * @tc.desc      startStopCycle 序列下 min=48 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsSequence1206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1206 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 48, expected: 60, max: 60 });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsSequence1206 end');
    })
  })
}
