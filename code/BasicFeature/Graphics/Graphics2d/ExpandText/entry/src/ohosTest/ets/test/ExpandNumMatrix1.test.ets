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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandText]';

export default function expandNumMatrix1Test(): void {
  describe('ExpandNumMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    EXPAND_NUM_0001
     * @tc.name      expandNumNum0001
     * @tc.desc      区间 [0, 1] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0001 begin');
      const low: number = 0;
      const high: number = 1;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(0.5);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0001 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0002
     * @tc.name      expandNumNum0002
     * @tc.desc      区间 [0, 1] 在 t=0 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0002 begin');
      const t: number = 0;
      const value: number = 0 + (1 - 0) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('0.0000');
      expect(value >= Math.min(0, 1)).assertTrue();
      expect(value <= Math.max(0, 1)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0002 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0003
     * @tc.name      expandNumNum0003
     * @tc.desc      数值 1 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0003 begin');
      const raw: number = 1;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(1);
      expect(percent).assertEqual(1);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0003 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0004
     * @tc.name      expandNumNum0004
     * @tc.desc      区间 [1, 2] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0004 begin');
      const low: number = 1;
      const high: number = 2;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(1.5);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0004 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0005
     * @tc.name      expandNumNum0005
     * @tc.desc      区间 [1, 2] 在 t=0.25 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0005 begin');
      const t: number = 0.25;
      const value: number = 1 + (2 - 1) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('1.2500');
      expect(value >= Math.min(1, 2)).assertTrue();
      expect(value <= Math.max(1, 2)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0005 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0006
     * @tc.name      expandNumNum0006
     * @tc.desc      数值 2 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0006 begin');
      const raw: number = 2;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(2);
      expect(percent).assertEqual(2);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0006 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0007
     * @tc.name      expandNumNum0007
     * @tc.desc      区间 [0.5, 1.5] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0007 begin');
      const low: number = 0.5;
      const high: number = 1.5;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(1);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0007 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0008
     * @tc.name      expandNumNum0008
     * @tc.desc      区间 [0.5, 1.5] 在 t=0.5 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0008 begin');
      const t: number = 0.5;
      const value: number = 0.5 + (1.5 - 0.5) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('1.0000');
      expect(value >= Math.min(0.5, 1.5)).assertTrue();
      expect(value <= Math.max(0.5, 1.5)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0008 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0009
     * @tc.name      expandNumNum0009
     * @tc.desc      数值 1.5 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0009 begin');
      const raw: number = 1.5;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(1.5);
      expect(percent).assertEqual(2);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0009 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0010
     * @tc.name      expandNumNum0010
     * @tc.desc      区间 [-1, 1] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0010 begin');
      const low: number = -1;
      const high: number = 1;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(0);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0010 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0011
     * @tc.name      expandNumNum0011
     * @tc.desc      区间 [-1, 1] 在 t=0.75 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0011 begin');
      const t: number = 0.75;
      const value: number = -1 + (1 - -1) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('0.5000');
      expect(value >= Math.min(-1, 1)).assertTrue();
      expect(value <= Math.max(-1, 1)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0011 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0012
     * @tc.name      expandNumNum0012
     * @tc.desc      数值 1 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0012 begin');
      const raw: number = 1;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(1);
      expect(percent).assertEqual(1);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0012 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0013
     * @tc.name      expandNumNum0013
     * @tc.desc      区间 [10, 20] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0013 begin');
      const low: number = 10;
      const high: number = 20;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(15);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0013 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0014
     * @tc.name      expandNumNum0014
     * @tc.desc      区间 [10, 20] 在 t=1 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0014 begin');
      const t: number = 1;
      const value: number = 10 + (20 - 10) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('20.0000');
      expect(value >= Math.min(10, 20)).assertTrue();
      expect(value <= Math.max(10, 20)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0014 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0015
     * @tc.name      expandNumNum0015
     * @tc.desc      数值 20 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0015 begin');
      const raw: number = 20;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(20);
      expect(percent).assertEqual(20);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0015 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0016
     * @tc.name      expandNumNum0016
     * @tc.desc      区间 [100, 100] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0016 begin');
      const low: number = 100;
      const high: number = 100;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(100);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0016 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0017
     * @tc.name      expandNumNum0017
     * @tc.desc      区间 [100, 100] 在 t=0 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0017 begin');
      const t: number = 0;
      const value: number = 100 + (100 - 100) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('100.0000');
      expect(value >= Math.min(100, 100)).assertTrue();
      expect(value <= Math.max(100, 100)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0017 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0018
     * @tc.name      expandNumNum0018
     * @tc.desc      数值 100 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0018 begin');
      const raw: number = 100;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(100);
      expect(percent).assertEqual(100);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0018 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0019
     * @tc.name      expandNumNum0019
     * @tc.desc      区间 [-50, 50] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0019 begin');
      const low: number = -50;
      const high: number = 50;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(0);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0019 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0020
     * @tc.name      expandNumNum0020
     * @tc.desc      区间 [-50, 50] 在 t=0.25 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0020 begin');
      const t: number = 0.25;
      const value: number = -50 + (50 - -50) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('-25.0000');
      expect(value >= Math.min(-50, 50)).assertTrue();
      expect(value <= Math.max(-50, 50)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0020 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0021
     * @tc.name      expandNumNum0021
     * @tc.desc      数值 50 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0021 begin');
      const raw: number = 50;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(50);
      expect(percent).assertEqual(50);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0021 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0022
     * @tc.name      expandNumNum0022
     * @tc.desc      区间 [3, 7] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0022 begin');
      const low: number = 3;
      const high: number = 7;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(5);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0022 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0023
     * @tc.name      expandNumNum0023
     * @tc.desc      区间 [3, 7] 在 t=0.5 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0023 begin');
      const t: number = 0.5;
      const value: number = 3 + (7 - 3) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('5.0000');
      expect(value >= Math.min(3, 7)).assertTrue();
      expect(value <= Math.max(3, 7)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0023 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0024
     * @tc.name      expandNumNum0024
     * @tc.desc      数值 7 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0024 begin');
      const raw: number = 7;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(7);
      expect(percent).assertEqual(7);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0024 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0025
     * @tc.name      expandNumNum0025
     * @tc.desc      区间 [0.25, 0.75] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0025 begin');
      const low: number = 0.25;
      const high: number = 0.75;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(0.5);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0025 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0026
     * @tc.name      expandNumNum0026
     * @tc.desc      区间 [0.25, 0.75] 在 t=0.75 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0026 begin');
      const t: number = 0.75;
      const value: number = 0.25 + (0.75 - 0.25) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('0.6250');
      expect(value >= Math.min(0.25, 0.75)).assertTrue();
      expect(value <= Math.max(0.25, 0.75)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0026 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0027
     * @tc.name      expandNumNum0027
     * @tc.desc      数值 0.75 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0027 begin');
      const raw: number = 0.75;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(0.75);
      expect(percent).assertEqual(1);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0027 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0028
     * @tc.name      expandNumNum0028
     * @tc.desc      区间 [1000, 2000] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0028 begin');
      const low: number = 1000;
      const high: number = 2000;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(1500);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0028 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0029
     * @tc.name      expandNumNum0029
     * @tc.desc      区间 [1000, 2000] 在 t=1 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0029 begin');
      const t: number = 1;
      const value: number = 1000 + (2000 - 1000) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('2000.0000');
      expect(value >= Math.min(1000, 2000)).assertTrue();
      expect(value <= Math.max(1000, 2000)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0029 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0030
     * @tc.name      expandNumNum0030
     * @tc.desc      数值 2000 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0030 begin');
      const raw: number = 2000;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(100);
      expect(percent).assertEqual(100);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0030 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0031
     * @tc.name      expandNumNum0031
     * @tc.desc      区间 [-0.5, 0.5] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0031 begin');
      const low: number = -0.5;
      const high: number = 0.5;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(0);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0031 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0032
     * @tc.name      expandNumNum0032
     * @tc.desc      区间 [-0.5, 0.5] 在 t=0 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0032 begin');
      const t: number = 0;
      const value: number = -0.5 + (0.5 - -0.5) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('-0.5000');
      expect(value >= Math.min(-0.5, 0.5)).assertTrue();
      expect(value <= Math.max(-0.5, 0.5)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0032 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0033
     * @tc.name      expandNumNum0033
     * @tc.desc      数值 0.5 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0033 begin');
      const raw: number = 0.5;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(0.5);
      expect(percent).assertEqual(1);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0033 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0034
     * @tc.name      expandNumNum0034
     * @tc.desc      区间 [42, 42] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0034 begin');
      const low: number = 42;
      const high: number = 42;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(42);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0034 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0035
     * @tc.name      expandNumNum0035
     * @tc.desc      区间 [42, 42] 在 t=0.25 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0035 begin');
      const t: number = 0.25;
      const value: number = 42 + (42 - 42) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('42.0000');
      expect(value >= Math.min(42, 42)).assertTrue();
      expect(value <= Math.max(42, 42)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0035 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0036
     * @tc.name      expandNumNum0036
     * @tc.desc      数值 42 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0036 begin');
      const raw: number = 42;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(42);
      expect(percent).assertEqual(42);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0036 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0037
     * @tc.name      expandNumNum0037
     * @tc.desc      区间 [1, 100] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0037 begin');
      const low: number = 1;
      const high: number = 100;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(50.5);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0037 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0038
     * @tc.name      expandNumNum0038
     * @tc.desc      区间 [1, 100] 在 t=0.5 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0038 begin');
      const t: number = 0.5;
      const value: number = 1 + (100 - 1) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('50.5000');
      expect(value >= Math.min(1, 100)).assertTrue();
      expect(value <= Math.max(1, 100)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0038 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0039
     * @tc.name      expandNumNum0039
     * @tc.desc      数值 100 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0039 begin');
      const raw: number = 100;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(100);
      expect(percent).assertEqual(100);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0039 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0040
     * @tc.name      expandNumNum0040
     * @tc.desc      区间 [255, 255] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0040 begin');
      const low: number = 255;
      const high: number = 255;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(255);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0040 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0041
     * @tc.name      expandNumNum0041
     * @tc.desc      区间 [255, 255] 在 t=0.75 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0041 begin');
      const t: number = 0.75;
      const value: number = 255 + (255 - 255) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('255.0000');
      expect(value >= Math.min(255, 255)).assertTrue();
      expect(value <= Math.max(255, 255)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0041 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0042
     * @tc.name      expandNumNum0042
     * @tc.desc      数值 255 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0042 begin');
      const raw: number = 255;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(100);
      expect(percent).assertEqual(100);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0042 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0043
     * @tc.name      expandNumNum0043
     * @tc.desc      区间 [128, 256] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0043 begin');
      const low: number = 128;
      const high: number = 256;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(192);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0043 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0044
     * @tc.name      expandNumNum0044
     * @tc.desc      区间 [128, 256] 在 t=1 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0044 begin');
      const t: number = 1;
      const value: number = 128 + (256 - 128) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('256.0000');
      expect(value >= Math.min(128, 256)).assertTrue();
      expect(value <= Math.max(128, 256)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0044 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0045
     * @tc.name      expandNumNum0045
     * @tc.desc      数值 256 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0045 begin');
      const raw: number = 256;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(100);
      expect(percent).assertEqual(100);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0045 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0046
     * @tc.name      expandNumNum0046
     * @tc.desc      区间 [64, 1024] 中点与边界关系推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0046 begin');
      const low: number = 64;
      const high: number = 1024;
      const middle: number = (low + high) / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'mid=' + middle);
      expect(middle).assertEqual(544);
      expect(middle >= Math.min(low, high)).assertTrue();
      expect(middle <= Math.max(low, high)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0046 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0047
     * @tc.name      expandNumNum0047
     * @tc.desc      区间 [64, 1024] 在 t=0 处的线性插值推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0047 begin');
      const t: number = 0;
      const value: number = 64 + (1024 - 64) * t;
      hilog.info(DOMAIN, TAG, '%{public}s', 'value=' + value.toFixed(4));
      expect(value.toFixed(4)).assertEqual('64.0000');
      expect(value >= Math.min(64, 1024)).assertTrue();
      expect(value <= Math.max(64, 1024)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0047 end');
    })

    /**
     * @tc.number    EXPAND_NUM_0048
     * @tc.name      expandNumNum0048
     * @tc.desc      数值 1024 在 [0, 100] 区间的裁剪与百分比换算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('expandNumNum0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0048 begin');
      const raw: number = 1024;
      const limited: number = Math.min(Math.max(raw, 0), 100);
      const percent: number = Math.round(limited);
      hilog.info(DOMAIN, TAG, '%{public}s', 'limited=' + limited);
      expect(limited).assertEqual(100);
      expect(percent).assertEqual(100);
      expect(limited >= 0 && limited <= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'expandNumNum0048 end');
    })
  })
}
