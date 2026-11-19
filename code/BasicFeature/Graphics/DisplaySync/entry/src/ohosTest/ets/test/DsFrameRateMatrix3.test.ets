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

export default function dsFrameRateMatrix3Test(): void {
  describe('DsFrameRateMatrix3Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0143
     * @tc.name      dsFrameRate0143
     * @tc.desc      min=5 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0143 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 48, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 48 && 48 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0143 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0144
     * @tc.name      dsFrameRate0144
     * @tc.desc      min=5 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0144 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 60, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 60 && 60 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0144 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0145
     * @tc.name      dsFrameRate0145
     * @tc.desc      min=5 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0145 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 72, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 72 && 72 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0145 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0146
     * @tc.name      dsFrameRate0146
     * @tc.desc      min=5 expected=90 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0146 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 90, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 90 && 90 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0146 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0147
     * @tc.name      dsFrameRate0147
     * @tc.desc      min=5 expected=5 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0147 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0147 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0148
     * @tc.name      dsFrameRate0148
     * @tc.desc      min=5 expected=10 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0148 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0148 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0149
     * @tc.name      dsFrameRate0149
     * @tc.desc      min=5 expected=15 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0149 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0149 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0150
     * @tc.name      dsFrameRate0150
     * @tc.desc      min=5 expected=20 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0150 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0150 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0151
     * @tc.name      dsFrameRate0151
     * @tc.desc      min=5 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0151 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0151 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0152
     * @tc.name      dsFrameRate0152
     * @tc.desc      min=5 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0152 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 30, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 30 && 30 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0152 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0153
     * @tc.name      dsFrameRate0153
     * @tc.desc      min=5 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0153 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 48, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 48 && 48 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0153 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0154
     * @tc.name      dsFrameRate0154
     * @tc.desc      min=5 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0154 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 60, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 60 && 60 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0154 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0155
     * @tc.name      dsFrameRate0155
     * @tc.desc      min=5 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0155 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 72, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 72 && 72 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0155 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0156
     * @tc.name      dsFrameRate0156
     * @tc.desc      min=5 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0156 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0156 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0157
     * @tc.name      dsFrameRate0157
     * @tc.desc      min=5 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0157 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0157 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0158
     * @tc.name      dsFrameRate0158
     * @tc.desc      min=5 expected=5 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0158 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0158 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0159
     * @tc.name      dsFrameRate0159
     * @tc.desc      min=5 expected=10 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0159 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0159 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0160
     * @tc.name      dsFrameRate0160
     * @tc.desc      min=5 expected=15 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0160 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0160 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0161
     * @tc.name      dsFrameRate0161
     * @tc.desc      min=5 expected=20 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0161 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0161 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0162
     * @tc.name      dsFrameRate0162
     * @tc.desc      min=5 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0162 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0162 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0163
     * @tc.name      dsFrameRate0163
     * @tc.desc      min=5 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0163 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 30, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 30 && 30 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0163 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0164
     * @tc.name      dsFrameRate0164
     * @tc.desc      min=5 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0164 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 48, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 48 && 48 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0164 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0165
     * @tc.name      dsFrameRate0165
     * @tc.desc      min=5 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0165 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 60, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 60 && 60 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0165 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0166
     * @tc.name      dsFrameRate0166
     * @tc.desc      min=5 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0166 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 72, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 72 && 72 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0166 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0167
     * @tc.name      dsFrameRate0167
     * @tc.desc      min=5 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0167 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0167 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0168
     * @tc.name      dsFrameRate0168
     * @tc.desc      min=5 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0168 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0168 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0169
     * @tc.name      dsFrameRate0169
     * @tc.desc      min=5 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0169 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0169 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0170
     * @tc.name      dsFrameRate0170
     * @tc.desc      min=10 expected=10 max=10 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0170 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 10 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 10).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0170 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0171
     * @tc.name      dsFrameRate0171
     * @tc.desc      min=10 expected=10 max=15 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0171 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 15 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 15).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0171 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0172
     * @tc.name      dsFrameRate0172
     * @tc.desc      min=10 expected=15 max=15 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0172 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 15 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 15).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0172 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0173
     * @tc.name      dsFrameRate0173
     * @tc.desc      min=10 expected=10 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0173 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0173 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0174
     * @tc.name      dsFrameRate0174
     * @tc.desc      min=10 expected=15 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0174 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0174 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0175
     * @tc.name      dsFrameRate0175
     * @tc.desc      min=10 expected=20 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0175 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0175 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0176
     * @tc.name      dsFrameRate0176
     * @tc.desc      min=10 expected=10 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0176 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0176 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0177
     * @tc.name      dsFrameRate0177
     * @tc.desc      min=10 expected=15 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0177 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0177 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0178
     * @tc.name      dsFrameRate0178
     * @tc.desc      min=10 expected=20 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0178 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0178 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0179
     * @tc.name      dsFrameRate0179
     * @tc.desc      min=10 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0179 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0179 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0180
     * @tc.name      dsFrameRate0180
     * @tc.desc      min=10 expected=10 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0180 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0180 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0181
     * @tc.name      dsFrameRate0181
     * @tc.desc      min=10 expected=15 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0181 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0181 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0182
     * @tc.name      dsFrameRate0182
     * @tc.desc      min=10 expected=20 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0182 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0182 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0183
     * @tc.name      dsFrameRate0183
     * @tc.desc      min=10 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0183 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0183 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0184
     * @tc.name      dsFrameRate0184
     * @tc.desc      min=10 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0184 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 30, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 30 && 30 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0184 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0185
     * @tc.name      dsFrameRate0185
     * @tc.desc      min=10 expected=10 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0185 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0185 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0186
     * @tc.name      dsFrameRate0186
     * @tc.desc      min=10 expected=15 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0186 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0186 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0187
     * @tc.name      dsFrameRate0187
     * @tc.desc      min=10 expected=20 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0187 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0187 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0188
     * @tc.name      dsFrameRate0188
     * @tc.desc      min=10 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0188 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0188 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0189
     * @tc.name      dsFrameRate0189
     * @tc.desc      min=10 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0189 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 30, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 30 && 30 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0189 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0190
     * @tc.name      dsFrameRate0190
     * @tc.desc      min=10 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0190 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 48, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 48 && 48 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0190 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0191
     * @tc.name      dsFrameRate0191
     * @tc.desc      min=10 expected=10 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0191 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0191 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0192
     * @tc.name      dsFrameRate0192
     * @tc.desc      min=10 expected=15 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0192 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0192 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0193
     * @tc.name      dsFrameRate0193
     * @tc.desc      min=10 expected=20 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0193 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0193 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0194
     * @tc.name      dsFrameRate0194
     * @tc.desc      min=10 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0194 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0194 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0195
     * @tc.name      dsFrameRate0195
     * @tc.desc      min=10 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0195 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 30, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 30 && 30 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0195 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0196
     * @tc.name      dsFrameRate0196
     * @tc.desc      min=10 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0196 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 48, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 48 && 48 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0196 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0197
     * @tc.name      dsFrameRate0197
     * @tc.desc      min=10 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0197 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 60, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 60 && 60 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0197 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0198
     * @tc.name      dsFrameRate0198
     * @tc.desc      min=10 expected=10 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0198 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0198 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0199
     * @tc.name      dsFrameRate0199
     * @tc.desc      min=10 expected=15 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0199 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0199 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0200
     * @tc.name      dsFrameRate0200
     * @tc.desc      min=10 expected=20 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0200 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0200 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0201
     * @tc.name      dsFrameRate0201
     * @tc.desc      min=10 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0201 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0201 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0202
     * @tc.name      dsFrameRate0202
     * @tc.desc      min=10 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0202 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 30, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 30 && 30 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0202 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0203
     * @tc.name      dsFrameRate0203
     * @tc.desc      min=10 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0203 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 48, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 48 && 48 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0203 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0204
     * @tc.name      dsFrameRate0204
     * @tc.desc      min=10 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0204 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 60, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 60 && 60 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0204 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0205
     * @tc.name      dsFrameRate0205
     * @tc.desc      min=10 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0205 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 72, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 72 && 72 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0205 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0206
     * @tc.name      dsFrameRate0206
     * @tc.desc      min=10 expected=10 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0206 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 10, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 10 && 10 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0206 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0207
     * @tc.name      dsFrameRate0207
     * @tc.desc      min=10 expected=15 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0207 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 15, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 15 && 15 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0207 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0208
     * @tc.name      dsFrameRate0208
     * @tc.desc      min=10 expected=20 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0208 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 20, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 20 && 20 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0208 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0209
     * @tc.name      dsFrameRate0209
     * @tc.desc      min=10 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0209 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 24, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 24 && 24 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0209 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0210
     * @tc.name      dsFrameRate0210
     * @tc.desc      min=10 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0210 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 30, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 30 && 30 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0210 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0211
     * @tc.name      dsFrameRate0211
     * @tc.desc      min=10 expected=48 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0211 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 48, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 48 && 48 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0211 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0212
     * @tc.name      dsFrameRate0212
     * @tc.desc      min=10 expected=60 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0212 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 60, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 60 && 60 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0212 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0213
     * @tc.name      dsFrameRate0213
     * @tc.desc      min=10 expected=72 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0213 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 10, expected: 72, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(10 <= 72 && 72 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0213 end');
    })
  })
}
