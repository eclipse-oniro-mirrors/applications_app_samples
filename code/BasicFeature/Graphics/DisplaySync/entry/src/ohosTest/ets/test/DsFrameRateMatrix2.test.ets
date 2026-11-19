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

export default function dsFrameRateMatrix2Test(): void {
  describe('DsFrameRateMatrix2Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0072
     * @tc.name      dsFrameRate0072
     * @tc.desc      min=1 expected=24 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0072 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 24, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 24 && 24 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0072 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0073
     * @tc.name      dsFrameRate0073
     * @tc.desc      min=1 expected=30 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0073 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 30, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 30 && 30 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0073 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0074
     * @tc.name      dsFrameRate0074
     * @tc.desc      min=1 expected=48 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0074 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 48, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 48 && 48 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0074 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0075
     * @tc.name      dsFrameRate0075
     * @tc.desc      min=1 expected=60 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0075 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 60 && 60 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0075 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0076
     * @tc.name      dsFrameRate0076
     * @tc.desc      min=1 expected=72 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0076 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 72, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 72 && 72 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0076 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0077
     * @tc.name      dsFrameRate0077
     * @tc.desc      min=1 expected=90 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0077 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 90, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 90 && 90 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0077 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0078
     * @tc.name      dsFrameRate0078
     * @tc.desc      min=1 expected=120 max=120 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0078 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 120, max: 120 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 120 && 120 <= 120).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0078 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0079
     * @tc.name      dsFrameRate0079
     * @tc.desc      min=1 expected=1 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0079 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 1, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 1 && 1 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0079 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0080
     * @tc.name      dsFrameRate0080
     * @tc.desc      min=1 expected=5 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0080 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 5, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 5 && 5 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0080 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0081
     * @tc.name      dsFrameRate0081
     * @tc.desc      min=1 expected=10 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0081 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 10, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 10 && 10 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0081 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0082
     * @tc.name      dsFrameRate0082
     * @tc.desc      min=1 expected=15 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0082 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 15, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 15 && 15 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0082 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0083
     * @tc.name      dsFrameRate0083
     * @tc.desc      min=1 expected=20 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0083 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 20, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 20 && 20 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0083 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0084
     * @tc.name      dsFrameRate0084
     * @tc.desc      min=1 expected=24 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0084 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 24, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 24 && 24 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0084 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0085
     * @tc.name      dsFrameRate0085
     * @tc.desc      min=1 expected=30 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0085 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 30, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 30 && 30 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0085 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0086
     * @tc.name      dsFrameRate0086
     * @tc.desc      min=1 expected=48 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0086 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 48, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 48 && 48 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0086 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0087
     * @tc.name      dsFrameRate0087
     * @tc.desc      min=1 expected=60 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0087 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 60 && 60 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0087 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0088
     * @tc.name      dsFrameRate0088
     * @tc.desc      min=1 expected=72 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0088 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 72, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 72 && 72 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0088 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0089
     * @tc.name      dsFrameRate0089
     * @tc.desc      min=1 expected=90 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0089 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 90, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 90 && 90 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0089 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0090
     * @tc.name      dsFrameRate0090
     * @tc.desc      min=1 expected=120 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0090 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 120, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 120 && 120 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0090 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0091
     * @tc.name      dsFrameRate0091
     * @tc.desc      min=1 expected=144 max=144 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0091 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 1, expected: 144, max: 144 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(1 <= 144 && 144 <= 144).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0091 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0092
     * @tc.name      dsFrameRate0092
     * @tc.desc      min=5 expected=5 max=5 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0092 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 5 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 5).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0092 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0093
     * @tc.name      dsFrameRate0093
     * @tc.desc      min=5 expected=5 max=10 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0093 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 10 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 10).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0093 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0094
     * @tc.name      dsFrameRate0094
     * @tc.desc      min=5 expected=10 max=10 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0094 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 10 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 10).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0094 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0095
     * @tc.name      dsFrameRate0095
     * @tc.desc      min=5 expected=5 max=15 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0095 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 15 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 15).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0095 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0096
     * @tc.name      dsFrameRate0096
     * @tc.desc      min=5 expected=10 max=15 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0096 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 15 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 15).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0096 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0097
     * @tc.name      dsFrameRate0097
     * @tc.desc      min=5 expected=15 max=15 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0097 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 15 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 15).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0097 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0098
     * @tc.name      dsFrameRate0098
     * @tc.desc      min=5 expected=5 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0098 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0098 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0099
     * @tc.name      dsFrameRate0099
     * @tc.desc      min=5 expected=10 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0099 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0099 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0100
     * @tc.name      dsFrameRate0100
     * @tc.desc      min=5 expected=15 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0100 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0100 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0101
     * @tc.name      dsFrameRate0101
     * @tc.desc      min=5 expected=20 max=20 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0101 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 20 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 20).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0101 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0102
     * @tc.name      dsFrameRate0102
     * @tc.desc      min=5 expected=5 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0102 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0102 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0103
     * @tc.name      dsFrameRate0103
     * @tc.desc      min=5 expected=10 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0103 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0103 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0104
     * @tc.name      dsFrameRate0104
     * @tc.desc      min=5 expected=15 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0104 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0104 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0105
     * @tc.name      dsFrameRate0105
     * @tc.desc      min=5 expected=20 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0105 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0105 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0106
     * @tc.name      dsFrameRate0106
     * @tc.desc      min=5 expected=24 max=24 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0106 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 24 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 24).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0106 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0107
     * @tc.name      dsFrameRate0107
     * @tc.desc      min=5 expected=5 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0107 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0107 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0108
     * @tc.name      dsFrameRate0108
     * @tc.desc      min=5 expected=10 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0108 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0108 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0109
     * @tc.name      dsFrameRate0109
     * @tc.desc      min=5 expected=15 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0109 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0109 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0110
     * @tc.name      dsFrameRate0110
     * @tc.desc      min=5 expected=20 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0110 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0110 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0111
     * @tc.name      dsFrameRate0111
     * @tc.desc      min=5 expected=24 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0111 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0111 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0112
     * @tc.name      dsFrameRate0112
     * @tc.desc      min=5 expected=30 max=30 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0112 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 30, max: 30 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 30 && 30 <= 30).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0112 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0113
     * @tc.name      dsFrameRate0113
     * @tc.desc      min=5 expected=5 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0113 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0113 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0114
     * @tc.name      dsFrameRate0114
     * @tc.desc      min=5 expected=10 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0114 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0114 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0115
     * @tc.name      dsFrameRate0115
     * @tc.desc      min=5 expected=15 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0115 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0115 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0116
     * @tc.name      dsFrameRate0116
     * @tc.desc      min=5 expected=20 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0116 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0116 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0117
     * @tc.name      dsFrameRate0117
     * @tc.desc      min=5 expected=24 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0117 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0117 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0118
     * @tc.name      dsFrameRate0118
     * @tc.desc      min=5 expected=30 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0118 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 30, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 30 && 30 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0118 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0119
     * @tc.name      dsFrameRate0119
     * @tc.desc      min=5 expected=48 max=48 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0119 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 48, max: 48 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 48 && 48 <= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0119 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0120
     * @tc.name      dsFrameRate0120
     * @tc.desc      min=5 expected=5 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0120 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0120 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0121
     * @tc.name      dsFrameRate0121
     * @tc.desc      min=5 expected=10 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0121 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0121 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0122
     * @tc.name      dsFrameRate0122
     * @tc.desc      min=5 expected=15 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0122 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0122 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0123
     * @tc.name      dsFrameRate0123
     * @tc.desc      min=5 expected=20 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0123 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0123 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0124
     * @tc.name      dsFrameRate0124
     * @tc.desc      min=5 expected=24 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0124 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0124 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0125
     * @tc.name      dsFrameRate0125
     * @tc.desc      min=5 expected=30 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0125 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 30, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 30 && 30 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0125 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0126
     * @tc.name      dsFrameRate0126
     * @tc.desc      min=5 expected=48 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0126 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 48, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 48 && 48 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0126 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0127
     * @tc.name      dsFrameRate0127
     * @tc.desc      min=5 expected=60 max=60 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0127 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 60, max: 60 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 60 && 60 <= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0127 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0128
     * @tc.name      dsFrameRate0128
     * @tc.desc      min=5 expected=5 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0128 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0128 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0129
     * @tc.name      dsFrameRate0129
     * @tc.desc      min=5 expected=10 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0129 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0129 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0130
     * @tc.name      dsFrameRate0130
     * @tc.desc      min=5 expected=15 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0130 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0130 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0131
     * @tc.name      dsFrameRate0131
     * @tc.desc      min=5 expected=20 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0131 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0131 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0132
     * @tc.name      dsFrameRate0132
     * @tc.desc      min=5 expected=24 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0132 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0132 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0133
     * @tc.name      dsFrameRate0133
     * @tc.desc      min=5 expected=30 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0133 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 30, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 30 && 30 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0133 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0134
     * @tc.name      dsFrameRate0134
     * @tc.desc      min=5 expected=48 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0134 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 48, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 48 && 48 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0134 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0135
     * @tc.name      dsFrameRate0135
     * @tc.desc      min=5 expected=60 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0135 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 60, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 60 && 60 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0135 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0136
     * @tc.name      dsFrameRate0136
     * @tc.desc      min=5 expected=72 max=72 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0136 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 72, max: 72 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 72 && 72 <= 72).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0136 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0137
     * @tc.name      dsFrameRate0137
     * @tc.desc      min=5 expected=5 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0137 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 5, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 5 && 5 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0137 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0138
     * @tc.name      dsFrameRate0138
     * @tc.desc      min=5 expected=10 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0138 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 10, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 10 && 10 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0138 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0139
     * @tc.name      dsFrameRate0139
     * @tc.desc      min=5 expected=15 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0139 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 15, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 15 && 15 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0139 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0140
     * @tc.name      dsFrameRate0140
     * @tc.desc      min=5 expected=20 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0140 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 20, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 20 && 20 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0140 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0141
     * @tc.name      dsFrameRate0141
     * @tc.desc      min=5 expected=24 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0141 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 24, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 24 && 24 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0141 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_FRAME_RATE_0142
     * @tc.name      dsFrameRate0142
     * @tc.desc      min=5 expected=30 max=90 的合法帧率区间可设置且实例可用
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsFrameRate0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0142 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      ds.setExpectedFrameRateRange({ min: 5, expected: 30, max: 90 });
      const kind: string = typeof ds;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + kind);
      expect(kind).assertEqual('object');
      const startType: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a2=' + startType);
      expect(startType).assertEqual('function');
      const stopType: string = typeof ds.stop;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a3=' + stopType);
      expect(stopType).assertEqual('function');
      expect(5 <= 30 && 30 <= 90).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsFrameRate0142 end');
    })
  })
}
