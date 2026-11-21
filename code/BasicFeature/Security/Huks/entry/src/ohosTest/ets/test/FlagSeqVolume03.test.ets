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

export default function flagSeqVolume03Test() {
  describe('FlagSeqVolume03', () => {

    /**
     * @tc.name   testFlagSeq0086
     * @tc.number SUB_Huks_FLSQ_0086
     * @tc.desc   合法：整数 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0086 begin');
      Flag.set(29);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(29));
      expect(result).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(29));
      expect(Flag.value).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0086 end');
    });

    /**
     * @tc.name   testFlagSeq0087
     * @tc.number SUB_Huks_FLSQ_0087
     * @tc.desc   合法：整数 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0087 begin');
      Flag.set(30);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(30));
      expect(result).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(30));
      expect(Flag.value).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0087 end');
    });

    /**
     * @tc.name   testFlagSeq0088
     * @tc.number SUB_Huks_FLSQ_0088
     * @tc.desc   合法：整数 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0088 begin');
      Flag.set(31);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(31));
      expect(result).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(31));
      expect(Flag.value).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0088 end');
    });

    /**
     * @tc.name   testFlagSeq0089
     * @tc.number SUB_Huks_FLSQ_0089
     * @tc.desc   合法：整数 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0089 begin');
      Flag.set(32);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(32));
      expect(result).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(32));
      expect(Flag.value).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0089 end');
    });

    /**
     * @tc.name   testFlagSeq0090
     * @tc.number SUB_Huks_FLSQ_0090
     * @tc.desc   合法：整数 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0090 begin');
      Flag.set(33);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(33));
      expect(result).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(33));
      expect(Flag.value).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0090 end');
    });

    /**
     * @tc.name   testFlagSeq0091
     * @tc.number SUB_Huks_FLSQ_0091
     * @tc.desc   合法：整数 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0091 begin');
      Flag.set(34);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(34));
      expect(result).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(34));
      expect(Flag.value).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0091 end');
    });

    /**
     * @tc.name   testFlagSeq0092
     * @tc.number SUB_Huks_FLSQ_0092
     * @tc.desc   合法：整数 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0092 begin');
      Flag.set(35);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(35));
      expect(result).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(35));
      expect(Flag.value).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0092 end');
    });

    /**
     * @tc.name   testFlagSeq0093
     * @tc.number SUB_Huks_FLSQ_0093
     * @tc.desc   合法：整数 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0093 begin');
      Flag.set(36);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(36));
      expect(Flag.value).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0093 end');
    });

    /**
     * @tc.name   testFlagSeq0094
     * @tc.number SUB_Huks_FLSQ_0094
     * @tc.desc   合法：整数 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0094 begin');
      Flag.set(37);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(37));
      expect(result).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(37));
      expect(Flag.value).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0094 end');
    });

    /**
     * @tc.name   testFlagSeq0095
     * @tc.number SUB_Huks_FLSQ_0095
     * @tc.desc   合法：整数 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0095 begin');
      Flag.set(38);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(38));
      expect(result).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(38));
      expect(Flag.value).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0095 end');
    });

    /**
     * @tc.name   testFlagSeq0096
     * @tc.number SUB_Huks_FLSQ_0096
     * @tc.desc   合法：整数 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0096 begin');
      Flag.set(39);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(39));
      expect(result).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(39));
      expect(Flag.value).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0096 end');
    });

    /**
     * @tc.name   testFlagSeq0097
     * @tc.number SUB_Huks_FLSQ_0097
     * @tc.desc   合法：整数 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0097 begin');
      Flag.set(40);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(40));
      expect(result).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(40));
      expect(Flag.value).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0097 end');
    });

    /**
     * @tc.name   testFlagSeq0098
     * @tc.number SUB_Huks_FLSQ_0098
     * @tc.desc   合法：整数 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0098 begin');
      Flag.set(41);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(41));
      expect(result).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(41));
      expect(Flag.value).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0098 end');
    });

    /**
     * @tc.name   testFlagSeq0099
     * @tc.number SUB_Huks_FLSQ_0099
     * @tc.desc   合法：整数 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0099 begin');
      Flag.set(42);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(42));
      expect(result).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(42));
      expect(Flag.value).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0099 end');
    });

    /**
     * @tc.name   testFlagSeq0100
     * @tc.number SUB_Huks_FLSQ_0100
     * @tc.desc   合法：整数 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0100 begin');
      Flag.set(43);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(43));
      expect(result).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(43));
      expect(Flag.value).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0100 end');
    });

    /**
     * @tc.name   testFlagSeq0101
     * @tc.number SUB_Huks_FLSQ_0101
     * @tc.desc   合法：整数 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0101 begin');
      Flag.set(44);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(44));
      expect(result).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(44));
      expect(Flag.value).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0101 end');
    });

    /**
     * @tc.name   testFlagSeq0102
     * @tc.number SUB_Huks_FLSQ_0102
     * @tc.desc   合法：整数 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0102 begin');
      Flag.set(45);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(45));
      expect(result).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(45));
      expect(Flag.value).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0102 end');
    });

    /**
     * @tc.name   testFlagSeq0103
     * @tc.number SUB_Huks_FLSQ_0103
     * @tc.desc   合法：整数 46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0103 begin');
      Flag.set(46);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(46));
      expect(result).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(46));
      expect(Flag.value).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0103 end');
    });

    /**
     * @tc.name   testFlagSeq0104
     * @tc.number SUB_Huks_FLSQ_0104
     * @tc.desc   合法：整数 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0104 begin');
      Flag.set(47);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(47));
      expect(result).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(47));
      expect(Flag.value).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0104 end');
    });

    /**
     * @tc.name   testFlagSeq0105
     * @tc.number SUB_Huks_FLSQ_0105
     * @tc.desc   合法：整数 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0105 begin');
      Flag.set(48);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(48));
      expect(result).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(48));
      expect(Flag.value).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0105 end');
    });

    /**
     * @tc.name   testFlagSeq0106
     * @tc.number SUB_Huks_FLSQ_0106
     * @tc.desc   合法：整数 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0106 begin');
      Flag.set(49);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(49));
      expect(result).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(49));
      expect(Flag.value).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0106 end');
    });

    /**
     * @tc.name   testFlagSeq0107
     * @tc.number SUB_Huks_FLSQ_0107
     * @tc.desc   合法：整数 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0107 begin');
      Flag.set(50);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(50));
      expect(result).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(50));
      expect(Flag.value).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0107 end');
    });

    /**
     * @tc.name   testFlagSeq0108
     * @tc.number SUB_Huks_FLSQ_0108
     * @tc.desc   合法：整数 51
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0108 begin');
      Flag.set(51);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(51));
      expect(result).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(51));
      expect(Flag.value).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0108 end');
    });

    /**
     * @tc.name   testFlagSeq0109
     * @tc.number SUB_Huks_FLSQ_0109
     * @tc.desc   合法：整数 52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0109 begin');
      Flag.set(52);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(52));
      expect(result).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(52));
      expect(Flag.value).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0109 end');
    });

    /**
     * @tc.name   testFlagSeq0110
     * @tc.number SUB_Huks_FLSQ_0110
     * @tc.desc   合法：整数 53
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0110 begin');
      Flag.set(53);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(53));
      expect(result).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(53));
      expect(Flag.value).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0110 end');
    });

    /**
     * @tc.name   testFlagSeq0111
     * @tc.number SUB_Huks_FLSQ_0111
     * @tc.desc   合法：整数 54
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0111 begin');
      Flag.set(54);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(54));
      expect(result).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(54));
      expect(Flag.value).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0111 end');
    });

    /**
     * @tc.name   testFlagSeq0112
     * @tc.number SUB_Huks_FLSQ_0112
     * @tc.desc   合法：整数 55
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0112 begin');
      Flag.set(55);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(55));
      expect(result).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(55));
      expect(Flag.value).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0112 end');
    });

    /**
     * @tc.name   testFlagSeq0113
     * @tc.number SUB_Huks_FLSQ_0113
     * @tc.desc   合法：整数 56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0113 begin');
      Flag.set(56);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(56));
      expect(result).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(56));
      expect(Flag.value).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0113 end');
    });

    /**
     * @tc.name   testFlagSeq0114
     * @tc.number SUB_Huks_FLSQ_0114
     * @tc.desc   合法：整数 57
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0114 begin');
      Flag.set(57);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(57));
      expect(result).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(57));
      expect(Flag.value).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0114 end');
    });

    /**
     * @tc.name   testFlagSeq0115
     * @tc.number SUB_Huks_FLSQ_0115
     * @tc.desc   合法：整数 58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0115 begin');
      Flag.set(58);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(58));
      expect(result).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(58));
      expect(Flag.value).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0115 end');
    });

    /**
     * @tc.name   testFlagSeq0116
     * @tc.number SUB_Huks_FLSQ_0116
     * @tc.desc   合法：整数 59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0116 begin');
      Flag.set(59);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(59));
      expect(result).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(59));
      expect(Flag.value).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0116 end');
    });

    /**
     * @tc.name   testFlagSeq0117
     * @tc.number SUB_Huks_FLSQ_0117
     * @tc.desc   合法：整数 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0117 begin');
      Flag.set(60);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(60));
      expect(result).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(60));
      expect(Flag.value).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0117 end');
    });

    /**
     * @tc.name   testFlagSeq0118
     * @tc.number SUB_Huks_FLSQ_0118
     * @tc.desc   合法：整数 61
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0118 begin');
      Flag.set(61);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(61));
      expect(result).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(61));
      expect(Flag.value).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0118 end');
    });

    /**
     * @tc.name   testFlagSeq0119
     * @tc.number SUB_Huks_FLSQ_0119
     * @tc.desc   合法：整数 62
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0119 begin');
      Flag.set(62);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(62));
      expect(result).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(62));
      expect(Flag.value).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0119 end');
    });

    /**
     * @tc.name   testFlagSeq0120
     * @tc.number SUB_Huks_FLSQ_0120
     * @tc.desc   合法：整数 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0120 begin');
      Flag.set(63);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(63));
      expect(result).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(63));
      expect(Flag.value).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0120 end');
    });

    /**
     * @tc.name   testFlagSeq0121
     * @tc.number SUB_Huks_FLSQ_0121
     * @tc.desc   合法：整数 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0121 begin');
      Flag.set(64);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(64));
      expect(Flag.value).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0121 end');
    });

    /**
     * @tc.name   testFlagSeq0122
     * @tc.number SUB_Huks_FLSQ_0122
     * @tc.desc   合法：整数 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0122 begin');
      Flag.set(65);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65));
      expect(result).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(65));
      expect(Flag.value).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0122 end');
    });

    /**
     * @tc.name   testFlagSeq0123
     * @tc.number SUB_Huks_FLSQ_0123
     * @tc.desc   合法：整数 66
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0123 begin');
      Flag.set(66);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(66));
      expect(result).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(66));
      expect(Flag.value).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0123 end');
    });

    /**
     * @tc.name   testFlagSeq0124
     * @tc.number SUB_Huks_FLSQ_0124
     * @tc.desc   合法：整数 67
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0124 begin');
      Flag.set(67);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(67));
      expect(result).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(67));
      expect(Flag.value).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0124 end');
    });

    /**
     * @tc.name   testFlagSeq0125
     * @tc.number SUB_Huks_FLSQ_0125
     * @tc.desc   合法：整数 68
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0125 begin');
      Flag.set(68);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(68));
      expect(result).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(68));
      expect(Flag.value).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0125 end');
    });

    /**
     * @tc.name   testFlagSeq0126
     * @tc.number SUB_Huks_FLSQ_0126
     * @tc.desc   合法：整数 69
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0126 begin');
      Flag.set(69);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(69));
      expect(result).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(69));
      expect(Flag.value).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0126 end');
    });

    /**
     * @tc.name   testFlagSeq0127
     * @tc.number SUB_Huks_FLSQ_0127
     * @tc.desc   合法：整数 70
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0127 begin');
      Flag.set(70);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(70));
      expect(result).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(70));
      expect(Flag.value).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0127 end');
    });

    /**
     * @tc.name   testFlagSeq0128
     * @tc.number SUB_Huks_FLSQ_0128
     * @tc.desc   合法：整数 71
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0128 begin');
      Flag.set(71);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(71));
      expect(result).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(71));
      expect(Flag.value).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0128 end');
    });

    /**
     * @tc.name   testFlagSeq0129
     * @tc.number SUB_Huks_FLSQ_0129
     * @tc.desc   合法：整数 72
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0129 begin');
      Flag.set(72);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(72));
      expect(result).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(72));
      expect(Flag.value).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0129 end');
    });

    /**
     * @tc.name   testFlagSeq0130
     * @tc.number SUB_Huks_FLSQ_0130
     * @tc.desc   合法：整数 73
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0130 begin');
      Flag.set(73);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(73));
      expect(result).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(73));
      expect(Flag.value).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0130 end');
    });

    /**
     * @tc.name   testFlagSeq0131
     * @tc.number SUB_Huks_FLSQ_0131
     * @tc.desc   合法：整数 74
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0131 begin');
      Flag.set(74);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(74));
      expect(result).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(74));
      expect(Flag.value).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0131 end');
    });

    /**
     * @tc.name   testFlagSeq0132
     * @tc.number SUB_Huks_FLSQ_0132
     * @tc.desc   合法：整数 75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0132 begin');
      Flag.set(75);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(75));
      expect(result).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(75));
      expect(Flag.value).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0132 end');
    });

    /**
     * @tc.name   testFlagSeq0133
     * @tc.number SUB_Huks_FLSQ_0133
     * @tc.desc   合法：整数 76
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0133 begin');
      Flag.set(76);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(76));
      expect(Flag.value).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0133 end');
    });

    /**
     * @tc.name   testFlagSeq0134
     * @tc.number SUB_Huks_FLSQ_0134
     * @tc.desc   合法：整数 77
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0134 begin');
      Flag.set(77);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(77));
      expect(result).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(77));
      expect(Flag.value).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0134 end');
    });

    /**
     * @tc.name   testFlagSeq0135
     * @tc.number SUB_Huks_FLSQ_0135
     * @tc.desc   合法：整数 78
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0135 begin');
      Flag.set(78);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(78));
      expect(result).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(78));
      expect(Flag.value).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0135 end');
    });

    /**
     * @tc.name   testFlagSeq0136
     * @tc.number SUB_Huks_FLSQ_0136
     * @tc.desc   合法：整数 79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0136 begin');
      Flag.set(79);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(79));
      expect(result).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(79));
      expect(Flag.value).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0136 end');
    });

    /**
     * @tc.name   testFlagSeq0137
     * @tc.number SUB_Huks_FLSQ_0137
     * @tc.desc   合法：整数 80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0137 begin');
      Flag.set(80);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(80));
      expect(result).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(80));
      expect(Flag.value).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0137 end');
    });

    /**
     * @tc.name   testFlagSeq0138
     * @tc.number SUB_Huks_FLSQ_0138
     * @tc.desc   合法：整数 81
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0138 begin');
      Flag.set(81);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(81));
      expect(result).assertEqual(81);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(81));
      expect(Flag.value).assertEqual(81);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0138 end');
    });

    /**
     * @tc.name   testFlagSeq0139
     * @tc.number SUB_Huks_FLSQ_0139
     * @tc.desc   合法：整数 82
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0139 begin');
      Flag.set(82);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(82));
      expect(result).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(82));
      expect(Flag.value).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0139 end');
    });

    /**
     * @tc.name   testFlagSeq0140
     * @tc.number SUB_Huks_FLSQ_0140
     * @tc.desc   合法：整数 83
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0140 begin');
      Flag.set(83);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(83));
      expect(result).assertEqual(83);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(83));
      expect(Flag.value).assertEqual(83);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0140 end');
    });

    /**
     * @tc.name   testFlagSeq0141
     * @tc.number SUB_Huks_FLSQ_0141
     * @tc.desc   合法：整数 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0141 begin');
      Flag.set(84);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(84));
      expect(result).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(84));
      expect(Flag.value).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0141 end');
    });

    /**
     * @tc.name   testFlagSeq0142
     * @tc.number SUB_Huks_FLSQ_0142
     * @tc.desc   合法：整数 85
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0142 begin');
      Flag.set(85);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(85));
      expect(result).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(85));
      expect(Flag.value).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0142 end');
    });

    /**
     * @tc.name   testFlagSeq0143
     * @tc.number SUB_Huks_FLSQ_0143
     * @tc.desc   合法：整数 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0143 begin');
      Flag.set(86);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(86));
      expect(result).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(86));
      expect(Flag.value).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0143 end');
    });

    /**
     * @tc.name   testFlagSeq0144
     * @tc.number SUB_Huks_FLSQ_0144
     * @tc.desc   合法：整数 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0144 begin');
      Flag.set(87);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(87));
      expect(result).assertEqual(87);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(87));
      expect(Flag.value).assertEqual(87);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0144 end');
    });


    /**
     * @tc.name   testFlagSeq0145
     * @tc.number SUB_Huks_FLSQ_0145
     * @tc.desc   int32 最大值 2147483647 原样读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0145 begin');
      Flag.set(2147483647);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2147483647));
      expect(result).assertEqual(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(2147483647));
      expect(Flag.value).assertEqual(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0145 end');
    });

  });
}
