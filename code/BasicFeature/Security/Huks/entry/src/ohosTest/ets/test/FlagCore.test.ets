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

// 逻辑层 路由标志主题：pages/Index 导出 Flag 静态类的六维用例。
// 期望值来源：状态推演（Flag 为静态透传容器，set 后读回一致；语义域 1/2/3 对应
// NewKey/OldKey/MinAccessControl 三个视图，0 为初始态）；beforeEach/afterEach 复位为 0。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Flag } from '../../../main/ets/pages/Index';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Huks]';

export default function flagCore() {
  describe('HuksFlagCore', () => {
    beforeEach(() => {
      Flag.set(0);
    });

    afterEach(() => {
      Flag.set(0);
    });

    /**
     * @tc.number SUB_Huks_FLAG_0001
     * @tc.name testFlag0001
     * @tc.desc 合法值：语义域 1/2/3 均能置位并读回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testFlag0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0001 begin');
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0001 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0002
     * @tc.name testFlag0002
     * @tc.desc 合法值：复位后初始态为 0，set(0) 后仍为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testFlag0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0002 begin');
      hilog.info(DOMAIN, TAG, 'initial=%{public}d expected=0', Flag.value);
      expect(Flag.value).assertEqual(0);
      Flag.set(0);
      expect(Flag.value).assertEqual(0);
      Flag.set(1);
      Flag.set(0);
      expect(Flag.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0002 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0003
     * @tc.name testFlag0003
     * @tc.desc 合法值：置位后连续两次读回稳定
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testFlag0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0003 begin');
      Flag.set(1);
      const first: number = Flag.value;
      const second: number = Flag.value;
      hilog.info(DOMAIN, TAG, 'first=%{public}d second=%{public}d', first, second);
      expect(first).assertEqual(1);
      expect(second).assertEqual(1);
      expect(first === second).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0003 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0004
     * @tc.name testFlag0004
     * @tc.desc 合法值：2 与 3 交替置位，断言类型覆盖相等与不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testFlag0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0004 begin');
      Flag.set(2);
      expect(Flag.value === 2).assertTrue();
      Flag.set(3);
      expect(Flag.value === 3).assertTrue();
      Flag.set(2);
      expect(Flag.value === 3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0004 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0005
     * @tc.name testFlag0005
     * @tc.desc 边界值：语义域端点 0/1/3 置位读回正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0005 begin');
      Flag.set(0);
      expect(Flag.value).assertEqual(0);
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0005 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0006
     * @tc.name testFlag0006
     * @tc.desc 边界值：1→2→3 逐级置位，混合相等与不等断言逐级读回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0006 begin');
      Flag.set(1);
      expect(Flag.value === 1).assertTrue();
      Flag.set(2);
      expect(Flag.value === 2).assertTrue();
      expect(Flag.value === 1).assertFalse();
      Flag.set(3);
      expect(Flag.value === 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0006 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0007
     * @tc.name testFlag0007
     * @tc.desc 边界值：超语义域值 4 原样存储，随后语义值 3 正常覆盖
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0007 begin');
      Flag.set(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}d expected=4', Flag.value);
      expect(Flag.value).assertEqual(4);
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0007 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0008
     * @tc.name testFlag0008
     * @tc.desc 非法值：负数 -1 与 -100 原样存储，可被后续置位覆盖
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0008 begin');
      Flag.set(-1);
      expect(Flag.value).assertEqual(-1);
      Flag.set(-100);
      expect(Flag.value).assertEqual(-100);
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0008 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0009
     * @tc.name testFlag0009
     * @tc.desc 非法值：NaN 原样存储且可被语义值覆盖恢复
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0009 begin');
      Flag.set(NaN);
      expect(Number.isNaN(Flag.value)).assertTrue();
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      expect(Number.isNaN(Flag.value)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0009 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0010
     * @tc.name testFlag0010
     * @tc.desc 非法值：小数 2.5 与 -0.5 原样存储
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0010 begin');
      Flag.set(2.5);
      expect(Flag.value).assertEqual(2.5);
      Flag.set(-0.5);
      expect(Flag.value).assertEqual(-0.5);
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0010 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0011
     * @tc.name testFlag0011
     * @tc.desc 极值：MAX_SAFE_INTEGER 与 MIN_SAFE_INTEGER 原样存储
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0011 begin');
      Flag.set(Number.MAX_SAFE_INTEGER);
      expect(Flag.value).assertEqual(Number.MAX_SAFE_INTEGER);
      Flag.set(Number.MIN_SAFE_INTEGER);
      expect(Flag.value).assertEqual(Number.MIN_SAFE_INTEGER);
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0011 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0012
     * @tc.name testFlag0012
     * @tc.desc 极值：MAX_VALUE 与其相反数原样存储
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlag0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0012 begin');
      Flag.set(Number.MAX_VALUE);
      expect(Flag.value).assertEqual(Number.MAX_VALUE);
      Flag.set(-Number.MAX_VALUE);
      expect(Flag.value).assertEqual(-Number.MAX_VALUE);
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0012 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0013
     * @tc.name testFlag0013
     * @tc.desc 组合值：1→2→3→0 覆盖序列终值 0，每步读回正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0013 begin');
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      Flag.set(0);
      expect(Flag.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0013 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0014
     * @tc.name testFlag0014
     * @tc.desc 组合值：同值重复置位幂等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0014 begin');
      Flag.set(1);
      Flag.set(1);
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      Flag.set(2);
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      expect(Flag.value === 1).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0014 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0015
     * @tc.name testFlag0015
     * @tc.desc 组合值：正负交替覆盖，末次写入生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0015 begin');
      Flag.set(-5);
      expect(Flag.value).assertEqual(-5);
      Flag.set(5);
      expect(Flag.value).assertEqual(5);
      Flag.set(-5);
      expect(Flag.value).assertEqual(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0015 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0016
     * @tc.name testFlag0016
     * @tc.desc 状态：置位后连续三次读回无漂移
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0016 begin');
      Flag.set(2);
      const r1: number = Flag.value;
      const r2: number = Flag.value;
      const r3: number = Flag.value;
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(2);
      expect(r3).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0016 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0017
     * @tc.name testFlag0017
     * @tc.desc 状态：置 3 后复位为 0，再置 1 正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0017 begin');
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      Flag.set(0);
      expect(Flag.value).assertEqual(0);
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0017 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0018
     * @tc.name testFlag0018
     * @tc.desc 状态：用例起始态为 0，置 2 后读回 2，复位后回到 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0018 begin');
      hilog.info(DOMAIN, TAG, 'start=%{public}d expected=0', Flag.value);
      expect(Flag.value).assertEqual(0);
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      Flag.set(0);
      expect(Flag.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0018 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0019
     * @tc.name testFlag0019
     * @tc.desc 组合值：2→3→1 交替置位，读回值在相邻两值间互斥
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0019 begin');
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      Flag.set(3);
      expect(Flag.value === 3).assertTrue();
      expect(Flag.value === 2).assertFalse();
      Flag.set(1);
      expect(Flag.value === 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0019 end');
    });

    /**
     * @tc.number SUB_Huks_FLAG_0020
     * @tc.name testFlag0020
     * @tc.desc 状态：三个语义值反复置位读回，末值稳定
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlag0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0020 begin');
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      Flag.set(1);
      expect(Flag.value).assertEqual(1);
      Flag.set(2);
      expect(Flag.value).assertEqual(2);
      Flag.set(3);
      expect(Flag.value).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlag0020 end');
    });
  });
}
