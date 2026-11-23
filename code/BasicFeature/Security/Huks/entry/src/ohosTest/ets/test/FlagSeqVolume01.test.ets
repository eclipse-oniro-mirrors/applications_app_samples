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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Flag } from '../../../main/ets/pages/Index';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';

export default function flagSeqVolume01Test() {
  describe('FlagSeqVolume01', () => {

    /**
     * @tc.name   testFlagSeq0001
     * @tc.number SUB_Huks_FLSQ_0001
     * @tc.desc   非法：负整数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0001 begin');
      Flag.set(-2);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-2));
      expect(result).assertEqual(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-2));
      expect(Flag.value).assertEqual(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0001 end');
    });

    /**
     * @tc.name   testFlagSeq0002
     * @tc.number SUB_Huks_FLSQ_0002
     * @tc.desc   边界：-1 是最小负入口值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0002 begin');
      Flag.set(-1);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-1));
      expect(Flag.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0002 end');
    });

    /**
     * @tc.name   testFlagSeq0003
     * @tc.number SUB_Huks_FLSQ_0003
     * @tc.desc   边界：零值为入口未置位的默认状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0003 begin');
      Flag.set(0);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(0));
      expect(Flag.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0003 end');
    });

    /**
     * @tc.name   testFlagSeq0004
     * @tc.number SUB_Huks_FLSQ_0004
     * @tc.desc   合法：1（旧密钥入口值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0004 begin');
      Flag.set(1);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1));
      expect(Flag.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0004 end');
    });

    /**
     * @tc.name   testFlagSeq0005
     * @tc.number SUB_Huks_FLSQ_0005
     * @tc.desc   合法：2（新密钥入口值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0005 begin');
      Flag.set(2);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(2));
      expect(Flag.value).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0005 end');
    });

    /**
     * @tc.name   testFlagSeq0006
     * @tc.number SUB_Huks_FLSQ_0006
     * @tc.desc   合法：3（最小访问控制入口值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0006 begin');
      Flag.set(3);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(3));
      expect(Flag.value).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0006 end');
    });

    /**
     * @tc.name   testFlagSeq0007
     * @tc.number SUB_Huks_FLSQ_0007
     * @tc.desc   非法：未定义入口值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0007 begin');
      Flag.set(4);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(4));
      expect(Flag.value).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0007 end');
    });

    /**
     * @tc.name   testFlagSeq0008
     * @tc.number SUB_Huks_FLSQ_0008
     * @tc.desc   合法：小整数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0008 begin');
      Flag.set(7);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(7));
      expect(result).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(7));
      expect(Flag.value).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0008 end');
    });

    /**
     * @tc.name   testFlagSeq0009
     * @tc.number SUB_Huks_FLSQ_0009
     * @tc.desc   合法：两位数十进制值 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0009 begin');
      Flag.set(10);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(10));
      expect(Flag.value).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0009 end');
    });

    /**
     * @tc.name   testFlagSeq0010
     * @tc.number SUB_Huks_FLSQ_0010
     * @tc.desc   合法：100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0010 begin');
      Flag.set(100);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(100));
      expect(Flag.value).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0010 end');
    });

    /**
     * @tc.name   testFlagSeq0011
     * @tc.number SUB_Huks_FLSQ_0011
     * @tc.desc   合法：1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0011 begin');
      Flag.set(1000);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1000));
      expect(result).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1000));
      expect(Flag.value).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0011 end');
    });

    /**
     * @tc.name   testFlagSeq0012
     * @tc.number SUB_Huks_FLSQ_0012
     * @tc.desc   边界：int32 最大值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0012 begin');
      Flag.set(2147483647);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2147483647));
      expect(result).assertEqual(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(2147483647));
      expect(Flag.value).assertEqual(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0012 end');
    });

    /**
     * @tc.name   testFlagSeq0013
     * @tc.number SUB_Huks_FLSQ_0013
     * @tc.desc   边界：uint32 最大值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0013 begin');
      Flag.set(4294967295);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4294967295));
      expect(result).assertEqual(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(4294967295));
      expect(Flag.value).assertEqual(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0013 end');
    });

    /**
     * @tc.name   testFlagSeq0014
     * @tc.number SUB_Huks_FLSQ_0014
     * @tc.desc   极值：Number.MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0014 begin');
      Flag.set(9007199254740991);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(9007199254740991));
      expect(result).assertEqual(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(9007199254740991));
      expect(Flag.value).assertEqual(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0014 end');
    });

    /**
     * @tc.name   testFlagSeq0015
     * @tc.number SUB_Huks_FLSQ_0015
     * @tc.desc   合法：小数 1.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0015 begin');
      Flag.set(1.5);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1.5));
      expect(result).assertEqual(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1.5));
      expect(Flag.value).assertEqual(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0015 end');
    });

    /**
     * @tc.name   testFlagSeq0016
     * @tc.number SUB_Huks_FLSQ_0016
     * @tc.desc   非法：负小数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0016 begin');
      Flag.set(-0.5);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-0.5));
      expect(result).assertEqual(-0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-0.5));
      expect(Flag.value).assertEqual(-0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0016 end');
    });

    /**
     * @tc.name   testFlagSeq0017
     * @tc.number SUB_Huks_FLSQ_0017
     * @tc.desc   合法：圆周率近似值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0017 begin');
      Flag.set(3.14159);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3.14159));
      expect(result).assertEqual(3.14159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(3.14159));
      expect(Flag.value).assertEqual(3.14159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0017 end');
    });

    /**
     * @tc.name   testFlagSeq0018
     * @tc.number SUB_Huks_FLSQ_0018
     * @tc.desc   边界：极小正数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0018 begin');
      Flag.set(0.000001);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.000001));
      expect(result).assertEqual(0.000001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(0.000001));
      expect(Flag.value).assertEqual(0.000001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0018 end');
    });

    /**
     * @tc.name   testFlagSeq0019
     * @tc.number SUB_Huks_FLSQ_0019
     * @tc.desc   极值：超出安全整数范围
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0019 begin');
      Flag.set(1e+21);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1e+21));
      expect(result).assertEqual(1e+21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1e+21));
      expect(Flag.value).assertEqual(1e+21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0019 end');
    });

    /**
     * @tc.name   testFlagSeq0020
     * @tc.number SUB_Huks_FLSQ_0020
     * @tc.desc   非法：NaN 存读保持 NaN 语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0020 begin');
      Flag.set(Number.NaN);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isNaN(Flag.value)));
      expect(Number.isNaN(Flag.value)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result));
      expect(result === result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0020 end');
    });

    /**
     * @tc.name   testFlagSeq0021
     * @tc.number SUB_Huks_FLSQ_0021
     * @tc.desc   Number.MAX_VALUE 置位读回一致，再置 0 覆盖生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0021 begin');
      Flag.set(Number.MAX_VALUE);
      const first: number = Flag.value;
      Flag.set(0);
      const second: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), String(Number.MAX_VALUE));
      expect(first).assertEqual(Number.MAX_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(0));
      expect(second).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first === second), String(false));
      expect(first === second).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0021 end');
    });

  });
}
