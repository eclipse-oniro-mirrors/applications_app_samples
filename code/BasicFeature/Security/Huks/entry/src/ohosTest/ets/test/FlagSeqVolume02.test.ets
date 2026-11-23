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
const LOG_TAG: string = '[SampleTest]';

export default function flagSeqVolume02Test() {
  describe('FlagSeqVolume02', () => {

    /**
     * @tc.name   testFlagSeq0026
     * @tc.number SUB_Huks_FLSQ_0026
     * @tc.desc   合法/非法：整数 -30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0026 begin');
      Flag.set(-30);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-30));
      expect(result).assertEqual(-30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-30));
      expect(Flag.value).assertEqual(-30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0026 end');
    });

    /**
     * @tc.name   testFlagSeq0027
     * @tc.number SUB_Huks_FLSQ_0027
     * @tc.desc   合法/非法：整数 -29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0027 begin');
      Flag.set(-29);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-29));
      expect(result).assertEqual(-29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-29));
      expect(Flag.value).assertEqual(-29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0027 end');
    });

    /**
     * @tc.name   testFlagSeq0028
     * @tc.number SUB_Huks_FLSQ_0028
     * @tc.desc   合法/非法：整数 -28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0028 begin');
      Flag.set(-28);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-28));
      expect(result).assertEqual(-28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-28));
      expect(Flag.value).assertEqual(-28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0028 end');
    });

    /**
     * @tc.name   testFlagSeq0029
     * @tc.number SUB_Huks_FLSQ_0029
     * @tc.desc   合法/非法：整数 -27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0029 begin');
      Flag.set(-27);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-27));
      expect(result).assertEqual(-27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-27));
      expect(Flag.value).assertEqual(-27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0029 end');
    });

    /**
     * @tc.name   testFlagSeq0030
     * @tc.number SUB_Huks_FLSQ_0030
     * @tc.desc   合法/非法：整数 -26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0030 begin');
      Flag.set(-26);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-26));
      expect(result).assertEqual(-26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-26));
      expect(Flag.value).assertEqual(-26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0030 end');
    });

    /**
     * @tc.name   testFlagSeq0031
     * @tc.number SUB_Huks_FLSQ_0031
     * @tc.desc   合法/非法：整数 -25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0031 begin');
      Flag.set(-25);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-25));
      expect(result).assertEqual(-25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-25));
      expect(Flag.value).assertEqual(-25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0031 end');
    });

    /**
     * @tc.name   testFlagSeq0032
     * @tc.number SUB_Huks_FLSQ_0032
     * @tc.desc   合法/非法：整数 -24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0032 begin');
      Flag.set(-24);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-24));
      expect(result).assertEqual(-24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-24));
      expect(Flag.value).assertEqual(-24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0032 end');
    });

    /**
     * @tc.name   testFlagSeq0033
     * @tc.number SUB_Huks_FLSQ_0033
     * @tc.desc   合法/非法：整数 -23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0033 begin');
      Flag.set(-23);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-23));
      expect(result).assertEqual(-23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-23));
      expect(Flag.value).assertEqual(-23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0033 end');
    });

    /**
     * @tc.name   testFlagSeq0034
     * @tc.number SUB_Huks_FLSQ_0034
     * @tc.desc   合法/非法：整数 -22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0034 begin');
      Flag.set(-22);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-22));
      expect(result).assertEqual(-22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-22));
      expect(Flag.value).assertEqual(-22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0034 end');
    });

    /**
     * @tc.name   testFlagSeq0035
     * @tc.number SUB_Huks_FLSQ_0035
     * @tc.desc   合法/非法：整数 -21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0035 begin');
      Flag.set(-21);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-21));
      expect(result).assertEqual(-21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-21));
      expect(Flag.value).assertEqual(-21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0035 end');
    });

    /**
     * @tc.name   testFlagSeq0036
     * @tc.number SUB_Huks_FLSQ_0036
     * @tc.desc   合法/非法：整数 -20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0036 begin');
      Flag.set(-20);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-20));
      expect(result).assertEqual(-20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-20));
      expect(Flag.value).assertEqual(-20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0036 end');
    });

    /**
     * @tc.name   testFlagSeq0037
     * @tc.number SUB_Huks_FLSQ_0037
     * @tc.desc   合法/非法：整数 -19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0037 begin');
      Flag.set(-19);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-19));
      expect(result).assertEqual(-19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-19));
      expect(Flag.value).assertEqual(-19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0037 end');
    });

    /**
     * @tc.name   testFlagSeq0038
     * @tc.number SUB_Huks_FLSQ_0038
     * @tc.desc   合法/非法：整数 -18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0038 begin');
      Flag.set(-18);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-18));
      expect(result).assertEqual(-18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-18));
      expect(Flag.value).assertEqual(-18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0038 end');
    });

    /**
     * @tc.name   testFlagSeq0039
     * @tc.number SUB_Huks_FLSQ_0039
     * @tc.desc   合法/非法：整数 -17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0039 begin');
      Flag.set(-17);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-17));
      expect(result).assertEqual(-17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-17));
      expect(Flag.value).assertEqual(-17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0039 end');
    });

    /**
     * @tc.name   testFlagSeq0040
     * @tc.number SUB_Huks_FLSQ_0040
     * @tc.desc   合法/非法：整数 -16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0040 begin');
      Flag.set(-16);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-16));
      expect(result).assertEqual(-16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-16));
      expect(Flag.value).assertEqual(-16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0040 end');
    });

    /**
     * @tc.name   testFlagSeq0041
     * @tc.number SUB_Huks_FLSQ_0041
     * @tc.desc   合法/非法：整数 -15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0041 begin');
      Flag.set(-15);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-15));
      expect(result).assertEqual(-15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-15));
      expect(Flag.value).assertEqual(-15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0041 end');
    });

    /**
     * @tc.name   testFlagSeq0042
     * @tc.number SUB_Huks_FLSQ_0042
     * @tc.desc   合法/非法：整数 -14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0042 begin');
      Flag.set(-14);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-14));
      expect(result).assertEqual(-14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-14));
      expect(Flag.value).assertEqual(-14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0042 end');
    });

    /**
     * @tc.name   testFlagSeq0043
     * @tc.number SUB_Huks_FLSQ_0043
     * @tc.desc   合法/非法：整数 -13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0043 begin');
      Flag.set(-13);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-13));
      expect(result).assertEqual(-13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-13));
      expect(Flag.value).assertEqual(-13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0043 end');
    });

    /**
     * @tc.name   testFlagSeq0044
     * @tc.number SUB_Huks_FLSQ_0044
     * @tc.desc   合法/非法：整数 -12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0044 begin');
      Flag.set(-12);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-12));
      expect(result).assertEqual(-12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-12));
      expect(Flag.value).assertEqual(-12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0044 end');
    });

    /**
     * @tc.name   testFlagSeq0045
     * @tc.number SUB_Huks_FLSQ_0045
     * @tc.desc   合法/非法：整数 -11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0045 begin');
      Flag.set(-11);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-11));
      expect(result).assertEqual(-11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-11));
      expect(Flag.value).assertEqual(-11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0045 end');
    });

    /**
     * @tc.name   testFlagSeq0046
     * @tc.number SUB_Huks_FLSQ_0046
     * @tc.desc   合法/非法：整数 -10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0046 begin');
      Flag.set(-10);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-10));
      expect(result).assertEqual(-10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-10));
      expect(Flag.value).assertEqual(-10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0046 end');
    });

    /**
     * @tc.name   testFlagSeq0047
     * @tc.number SUB_Huks_FLSQ_0047
     * @tc.desc   合法/非法：整数 -9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0047 begin');
      Flag.set(-9);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-9));
      expect(result).assertEqual(-9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-9));
      expect(Flag.value).assertEqual(-9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0047 end');
    });

    /**
     * @tc.name   testFlagSeq0048
     * @tc.number SUB_Huks_FLSQ_0048
     * @tc.desc   合法/非法：整数 -8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0048 begin');
      Flag.set(-8);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-8));
      expect(result).assertEqual(-8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-8));
      expect(Flag.value).assertEqual(-8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0048 end');
    });

    /**
     * @tc.name   testFlagSeq0049
     * @tc.number SUB_Huks_FLSQ_0049
     * @tc.desc   合法/非法：整数 -7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0049 begin');
      Flag.set(-7);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-7));
      expect(result).assertEqual(-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-7));
      expect(Flag.value).assertEqual(-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0049 end');
    });

    /**
     * @tc.name   testFlagSeq0050
     * @tc.number SUB_Huks_FLSQ_0050
     * @tc.desc   合法/非法：整数 -6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0050 begin');
      Flag.set(-6);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-6));
      expect(result).assertEqual(-6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-6));
      expect(Flag.value).assertEqual(-6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0050 end');
    });

    /**
     * @tc.name   testFlagSeq0051
     * @tc.number SUB_Huks_FLSQ_0051
     * @tc.desc   合法/非法：整数 -5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0051 begin');
      Flag.set(-5);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-5));
      expect(result).assertEqual(-5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-5));
      expect(Flag.value).assertEqual(-5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0051 end');
    });

    /**
     * @tc.name   testFlagSeq0052
     * @tc.number SUB_Huks_FLSQ_0052
     * @tc.desc   合法/非法：整数 -4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0052 begin');
      Flag.set(-4);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-4));
      expect(result).assertEqual(-4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-4));
      expect(Flag.value).assertEqual(-4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0052 end');
    });

    /**
     * @tc.name   testFlagSeq0053
     * @tc.number SUB_Huks_FLSQ_0053
     * @tc.desc   合法/非法：整数 -3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0053 begin');
      Flag.set(-3);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-3));
      expect(result).assertEqual(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-3));
      expect(Flag.value).assertEqual(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0053 end');
    });

    /**
     * @tc.name   testFlagSeq0054
     * @tc.number SUB_Huks_FLSQ_0054
     * @tc.desc   合法/非法：整数 -2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0054 begin');
      Flag.set(-2);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-2));
      expect(result).assertEqual(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-2));
      expect(Flag.value).assertEqual(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0054 end');
    });

    /**
     * @tc.name   testFlagSeq0055
     * @tc.number SUB_Huks_FLSQ_0055
     * @tc.desc   合法/非法：整数 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0055 begin');
      Flag.set(-1);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-1));
      expect(Flag.value).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0055 end');
    });

    /**
     * @tc.name   testFlagSeq0056
     * @tc.number SUB_Huks_FLSQ_0056
     * @tc.desc   合法/非法：整数 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0056 begin');
      Flag.set(0);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(0));
      expect(Flag.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0056 end');
    });

    /**
     * @tc.name   testFlagSeq0057
     * @tc.number SUB_Huks_FLSQ_0057
     * @tc.desc   合法/非法：整数 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0057 begin');
      Flag.set(1);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1));
      expect(Flag.value).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0057 end');
    });

    /**
     * @tc.name   testFlagSeq0058
     * @tc.number SUB_Huks_FLSQ_0058
     * @tc.desc   合法/非法：整数 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0058 begin');
      Flag.set(2);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(2));
      expect(Flag.value).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0058 end');
    });

    /**
     * @tc.name   testFlagSeq0059
     * @tc.number SUB_Huks_FLSQ_0059
     * @tc.desc   合法/非法：整数 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0059 begin');
      Flag.set(3);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(3));
      expect(Flag.value).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0059 end');
    });

    /**
     * @tc.name   testFlagSeq0060
     * @tc.number SUB_Huks_FLSQ_0060
     * @tc.desc   合法/非法：整数 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0060 begin');
      Flag.set(4);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(4));
      expect(Flag.value).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0060 end');
    });

    /**
     * @tc.name   testFlagSeq0061
     * @tc.number SUB_Huks_FLSQ_0061
     * @tc.desc   合法/非法：整数 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0061 begin');
      Flag.set(5);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(5));
      expect(Flag.value).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0061 end');
    });

    /**
     * @tc.name   testFlagSeq0062
     * @tc.number SUB_Huks_FLSQ_0062
     * @tc.desc   合法/非法：整数 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0062 begin');
      Flag.set(6);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(6));
      expect(Flag.value).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0062 end');
    });

    /**
     * @tc.name   testFlagSeq0063
     * @tc.number SUB_Huks_FLSQ_0063
     * @tc.desc   合法/非法：整数 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0063 begin');
      Flag.set(7);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(7));
      expect(result).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(7));
      expect(Flag.value).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0063 end');
    });

    /**
     * @tc.name   testFlagSeq0064
     * @tc.number SUB_Huks_FLSQ_0064
     * @tc.desc   合法/非法：整数 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0064 begin');
      Flag.set(8);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(8));
      expect(Flag.value).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0064 end');
    });

    /**
     * @tc.name   testFlagSeq0065
     * @tc.number SUB_Huks_FLSQ_0065
     * @tc.desc   合法/非法：整数 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0065 begin');
      Flag.set(9);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(9));
      expect(result).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(9));
      expect(Flag.value).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0065 end');
    });

    /**
     * @tc.name   testFlagSeq0066
     * @tc.number SUB_Huks_FLSQ_0066
     * @tc.desc   合法/非法：整数 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0066 begin');
      Flag.set(10);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(10));
      expect(Flag.value).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0066 end');
    });

    /**
     * @tc.name   testFlagSeq0067
     * @tc.number SUB_Huks_FLSQ_0067
     * @tc.desc   合法/非法：整数 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0067 begin');
      Flag.set(11);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(11));
      expect(result).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(11));
      expect(Flag.value).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0067 end');
    });

    /**
     * @tc.name   testFlagSeq0068
     * @tc.number SUB_Huks_FLSQ_0068
     * @tc.desc   合法/非法：整数 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0068 begin');
      Flag.set(12);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(12));
      expect(Flag.value).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0068 end');
    });

    /**
     * @tc.name   testFlagSeq0069
     * @tc.number SUB_Huks_FLSQ_0069
     * @tc.desc   合法/非法：整数 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0069 begin');
      Flag.set(13);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13));
      expect(result).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(13));
      expect(Flag.value).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0069 end');
    });

    /**
     * @tc.name   testFlagSeq0070
     * @tc.number SUB_Huks_FLSQ_0070
     * @tc.desc   合法/非法：整数 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0070 begin');
      Flag.set(14);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(14));
      expect(result).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(14));
      expect(Flag.value).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0070 end');
    });

    /**
     * @tc.name   testFlagSeq0071
     * @tc.number SUB_Huks_FLSQ_0071
     * @tc.desc   合法/非法：整数 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0071 begin');
      Flag.set(15);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15));
      expect(result).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(15));
      expect(Flag.value).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0071 end');
    });

    /**
     * @tc.name   testFlagSeq0072
     * @tc.number SUB_Huks_FLSQ_0072
     * @tc.desc   合法/非法：整数 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0072 begin');
      Flag.set(16);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(16));
      expect(Flag.value).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0072 end');
    });

    /**
     * @tc.name   testFlagSeq0073
     * @tc.number SUB_Huks_FLSQ_0073
     * @tc.desc   合法/非法：整数 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0073 begin');
      Flag.set(17);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(17));
      expect(result).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(17));
      expect(Flag.value).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0073 end');
    });

    /**
     * @tc.name   testFlagSeq0074
     * @tc.number SUB_Huks_FLSQ_0074
     * @tc.desc   合法/非法：整数 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0074 begin');
      Flag.set(18);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(18));
      expect(result).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(18));
      expect(Flag.value).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0074 end');
    });

    /**
     * @tc.name   testFlagSeq0075
     * @tc.number SUB_Huks_FLSQ_0075
     * @tc.desc   合法/非法：整数 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0075 begin');
      Flag.set(19);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(19));
      expect(result).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(19));
      expect(Flag.value).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0075 end');
    });

    /**
     * @tc.name   testFlagSeq0076
     * @tc.number SUB_Huks_FLSQ_0076
     * @tc.desc   合法/非法：整数 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0076 begin');
      Flag.set(20);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(20));
      expect(Flag.value).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0076 end');
    });

    /**
     * @tc.name   testFlagSeq0077
     * @tc.number SUB_Huks_FLSQ_0077
     * @tc.desc   合法/非法：整数 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0077 begin');
      Flag.set(21);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(21));
      expect(result).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(21));
      expect(Flag.value).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0077 end');
    });

    /**
     * @tc.name   testFlagSeq0078
     * @tc.number SUB_Huks_FLSQ_0078
     * @tc.desc   合法/非法：整数 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0078 begin');
      Flag.set(22);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22));
      expect(result).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(22));
      expect(Flag.value).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0078 end');
    });

    /**
     * @tc.name   testFlagSeq0079
     * @tc.number SUB_Huks_FLSQ_0079
     * @tc.desc   合法/非法：整数 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0079 begin');
      Flag.set(23);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(23));
      expect(result).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(23));
      expect(Flag.value).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0079 end');
    });

    /**
     * @tc.name   testFlagSeq0080
     * @tc.number SUB_Huks_FLSQ_0080
     * @tc.desc   合法/非法：整数 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0080 begin');
      Flag.set(24);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(24));
      expect(result).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(24));
      expect(Flag.value).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0080 end');
    });

    /**
     * @tc.name   testFlagSeq0081
     * @tc.number SUB_Huks_FLSQ_0081
     * @tc.desc   合法/非法：整数 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0081 begin');
      Flag.set(25);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(25));
      expect(result).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(25));
      expect(Flag.value).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0081 end');
    });

    /**
     * @tc.name   testFlagSeq0082
     * @tc.number SUB_Huks_FLSQ_0082
     * @tc.desc   合法/非法：整数 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0082 begin');
      Flag.set(26);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(26));
      expect(result).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(26));
      expect(Flag.value).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0082 end');
    });

    /**
     * @tc.name   testFlagSeq0083
     * @tc.number SUB_Huks_FLSQ_0083
     * @tc.desc   合法/非法：整数 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0083 begin');
      Flag.set(27);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(27));
      expect(result).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(27));
      expect(Flag.value).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0083 end');
    });

    /**
     * @tc.name   testFlagSeq0084
     * @tc.number SUB_Huks_FLSQ_0084
     * @tc.desc   合法/非法：整数 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0084 begin');
      Flag.set(28);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(28));
      expect(result).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(28));
      expect(Flag.value).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0084 end');
    });


    /**
     * @tc.name   testFlagSeq0085
     * @tc.number SUB_Huks_FLSQ_0085
     * @tc.desc   int32 最小值 -2147483648 原样读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0085 begin');
      Flag.set(-2147483648);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-2147483648));
      expect(result).assertEqual(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(-2147483648));
      expect(Flag.value).assertEqual(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0085 end');
    });

  });
}
