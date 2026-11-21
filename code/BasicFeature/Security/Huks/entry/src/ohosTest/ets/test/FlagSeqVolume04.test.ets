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

export default function flagSeqVolume04Test() {
  describe('FlagSeqVolume04', () => {

    /**
     * @tc.name   testFlagSeq0146
     * @tc.number SUB_Huks_FLSQ_0146
     * @tc.desc   合法：整数 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0146 begin');
      Flag.set(88);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(88));
      expect(result).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(88));
      expect(Flag.value).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0146 end');
    });

    /**
     * @tc.name   testFlagSeq0147
     * @tc.number SUB_Huks_FLSQ_0147
     * @tc.desc   合法：整数 89
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0147 begin');
      Flag.set(89);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(89));
      expect(result).assertEqual(89);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(89));
      expect(Flag.value).assertEqual(89);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0147 end');
    });

    /**
     * @tc.name   testFlagSeq0148
     * @tc.number SUB_Huks_FLSQ_0148
     * @tc.desc   合法：整数 90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0148 begin');
      Flag.set(90);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(90));
      expect(result).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(90));
      expect(Flag.value).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0148 end');
    });

    /**
     * @tc.name   testFlagSeq0149
     * @tc.number SUB_Huks_FLSQ_0149
     * @tc.desc   合法：整数 91
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0149 begin');
      Flag.set(91);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(91));
      expect(result).assertEqual(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(91));
      expect(Flag.value).assertEqual(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0149 end');
    });

    /**
     * @tc.name   testFlagSeq0150
     * @tc.number SUB_Huks_FLSQ_0150
     * @tc.desc   合法：整数 92
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0150 begin');
      Flag.set(92);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(92));
      expect(result).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(92));
      expect(Flag.value).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0150 end');
    });

    /**
     * @tc.name   testFlagSeq0151
     * @tc.number SUB_Huks_FLSQ_0151
     * @tc.desc   合法：整数 93
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0151 begin');
      Flag.set(93);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(93));
      expect(result).assertEqual(93);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(93));
      expect(Flag.value).assertEqual(93);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0151 end');
    });

    /**
     * @tc.name   testFlagSeq0152
     * @tc.number SUB_Huks_FLSQ_0152
     * @tc.desc   合法：整数 94
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0152 begin');
      Flag.set(94);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(94));
      expect(result).assertEqual(94);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(94));
      expect(Flag.value).assertEqual(94);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0152 end');
    });

    /**
     * @tc.name   testFlagSeq0153
     * @tc.number SUB_Huks_FLSQ_0153
     * @tc.desc   合法：整数 95
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0153 begin');
      Flag.set(95);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(95));
      expect(result).assertEqual(95);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(95));
      expect(Flag.value).assertEqual(95);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0153 end');
    });

    /**
     * @tc.name   testFlagSeq0154
     * @tc.number SUB_Huks_FLSQ_0154
     * @tc.desc   合法：整数 96
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0154 begin');
      Flag.set(96);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(96));
      expect(Flag.value).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0154 end');
    });

    /**
     * @tc.name   testFlagSeq0155
     * @tc.number SUB_Huks_FLSQ_0155
     * @tc.desc   合法：整数 97
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0155 begin');
      Flag.set(97);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(97));
      expect(result).assertEqual(97);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(97));
      expect(Flag.value).assertEqual(97);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0155 end');
    });

    /**
     * @tc.name   testFlagSeq0156
     * @tc.number SUB_Huks_FLSQ_0156
     * @tc.desc   合法：整数 98
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0156 begin');
      Flag.set(98);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(98));
      expect(result).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(98));
      expect(Flag.value).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0156 end');
    });

    /**
     * @tc.name   testFlagSeq0157
     * @tc.number SUB_Huks_FLSQ_0157
     * @tc.desc   合法：整数 99
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0157 begin');
      Flag.set(99);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(99));
      expect(result).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(99));
      expect(Flag.value).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0157 end');
    });

    /**
     * @tc.name   testFlagSeq0158
     * @tc.number SUB_Huks_FLSQ_0158
     * @tc.desc   合法：整数 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0158 begin');
      Flag.set(100);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(100));
      expect(Flag.value).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0158 end');
    });

    /**
     * @tc.name   testFlagSeq0159
     * @tc.number SUB_Huks_FLSQ_0159
     * @tc.desc   合法：整数 101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0159 begin');
      Flag.set(101);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(101));
      expect(result).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(101));
      expect(Flag.value).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0159 end');
    });

    /**
     * @tc.name   testFlagSeq0160
     * @tc.number SUB_Huks_FLSQ_0160
     * @tc.desc   合法：整数 102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0160 begin');
      Flag.set(102);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(102));
      expect(result).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(102));
      expect(Flag.value).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0160 end');
    });

    /**
     * @tc.name   testFlagSeq0161
     * @tc.number SUB_Huks_FLSQ_0161
     * @tc.desc   合法：整数 103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0161 begin');
      Flag.set(103);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(103));
      expect(result).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(103));
      expect(Flag.value).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0161 end');
    });

    /**
     * @tc.name   testFlagSeq0162
     * @tc.number SUB_Huks_FLSQ_0162
     * @tc.desc   合法：整数 104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0162 begin');
      Flag.set(104);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(104));
      expect(result).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(104));
      expect(Flag.value).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0162 end');
    });

    /**
     * @tc.name   testFlagSeq0163
     * @tc.number SUB_Huks_FLSQ_0163
     * @tc.desc   合法：整数 105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0163 begin');
      Flag.set(105);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(105));
      expect(result).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(105));
      expect(Flag.value).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0163 end');
    });

    /**
     * @tc.name   testFlagSeq0164
     * @tc.number SUB_Huks_FLSQ_0164
     * @tc.desc   合法：整数 106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0164 begin');
      Flag.set(106);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(106));
      expect(result).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(106));
      expect(Flag.value).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0164 end');
    });

    /**
     * @tc.name   testFlagSeq0165
     * @tc.number SUB_Huks_FLSQ_0165
     * @tc.desc   合法：整数 107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0165 begin');
      Flag.set(107);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(107));
      expect(result).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(107));
      expect(Flag.value).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0165 end');
    });

    /**
     * @tc.name   testFlagSeq0166
     * @tc.number SUB_Huks_FLSQ_0166
     * @tc.desc   合法：整数 108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0166 begin');
      Flag.set(108);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(108));
      expect(result).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(108));
      expect(Flag.value).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0166 end');
    });

    /**
     * @tc.name   testFlagSeq0167
     * @tc.number SUB_Huks_FLSQ_0167
     * @tc.desc   合法：整数 109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0167 begin');
      Flag.set(109);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(109));
      expect(result).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(109));
      expect(Flag.value).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0167 end');
    });

    /**
     * @tc.name   testFlagSeq0168
     * @tc.number SUB_Huks_FLSQ_0168
     * @tc.desc   合法：整数 110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0168 begin');
      Flag.set(110);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(110));
      expect(result).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(110));
      expect(Flag.value).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0168 end');
    });

    /**
     * @tc.name   testFlagSeq0169
     * @tc.number SUB_Huks_FLSQ_0169
     * @tc.desc   合法：整数 111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0169 begin');
      Flag.set(111);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(111));
      expect(result).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(111));
      expect(Flag.value).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0169 end');
    });

    /**
     * @tc.name   testFlagSeq0170
     * @tc.number SUB_Huks_FLSQ_0170
     * @tc.desc   合法：整数 112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0170 begin');
      Flag.set(112);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(112));
      expect(result).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(112));
      expect(Flag.value).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0170 end');
    });

    /**
     * @tc.name   testFlagSeq0171
     * @tc.number SUB_Huks_FLSQ_0171
     * @tc.desc   合法：整数 113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0171 begin');
      Flag.set(113);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(113));
      expect(result).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(113));
      expect(Flag.value).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0171 end');
    });

    /**
     * @tc.name   testFlagSeq0172
     * @tc.number SUB_Huks_FLSQ_0172
     * @tc.desc   合法：整数 114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0172 begin');
      Flag.set(114);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(114));
      expect(result).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(114));
      expect(Flag.value).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0172 end');
    });

    /**
     * @tc.name   testFlagSeq0173
     * @tc.number SUB_Huks_FLSQ_0173
     * @tc.desc   合法：整数 115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0173 begin');
      Flag.set(115);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(115));
      expect(result).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(115));
      expect(Flag.value).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0173 end');
    });

    /**
     * @tc.name   testFlagSeq0174
     * @tc.number SUB_Huks_FLSQ_0174
     * @tc.desc   合法：整数 116
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0174 begin');
      Flag.set(116);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(116));
      expect(result).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(116));
      expect(Flag.value).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0174 end');
    });

    /**
     * @tc.name   testFlagSeq0175
     * @tc.number SUB_Huks_FLSQ_0175
     * @tc.desc   合法：整数 117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0175 begin');
      Flag.set(117);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(117));
      expect(result).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(117));
      expect(Flag.value).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0175 end');
    });

    /**
     * @tc.name   testFlagSeq0176
     * @tc.number SUB_Huks_FLSQ_0176
     * @tc.desc   合法：整数 118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0176 begin');
      Flag.set(118);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(118));
      expect(result).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(118));
      expect(Flag.value).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0176 end');
    });

    /**
     * @tc.name   testFlagSeq0177
     * @tc.number SUB_Huks_FLSQ_0177
     * @tc.desc   合法：整数 119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0177 begin');
      Flag.set(119);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(119));
      expect(result).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(119));
      expect(Flag.value).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0177 end');
    });

    /**
     * @tc.name   testFlagSeq0178
     * @tc.number SUB_Huks_FLSQ_0178
     * @tc.desc   合法：整数 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0178 begin');
      Flag.set(120);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(120));
      expect(Flag.value).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0178 end');
    });

    /**
     * @tc.name   testFlagSeq0179
     * @tc.number SUB_Huks_FLSQ_0179
     * @tc.desc   合法：整数 121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0179 begin');
      Flag.set(121);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(121));
      expect(result).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(121));
      expect(Flag.value).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0179 end');
    });

    /**
     * @tc.name   testFlagSeq0180
     * @tc.number SUB_Huks_FLSQ_0180
     * @tc.desc   合法：整数 122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0180 begin');
      Flag.set(122);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(122));
      expect(result).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(122));
      expect(Flag.value).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0180 end');
    });

    /**
     * @tc.name   testFlagSeq0181
     * @tc.number SUB_Huks_FLSQ_0181
     * @tc.desc   合法：整数 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0181 begin');
      Flag.set(123);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(123));
      expect(result).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(123));
      expect(Flag.value).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0181 end');
    });

    /**
     * @tc.name   testFlagSeq0182
     * @tc.number SUB_Huks_FLSQ_0182
     * @tc.desc   合法：整数 124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0182 begin');
      Flag.set(124);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(124));
      expect(result).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(124));
      expect(Flag.value).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0182 end');
    });

    /**
     * @tc.name   testFlagSeq0183
     * @tc.number SUB_Huks_FLSQ_0183
     * @tc.desc   合法：整数 125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0183 begin');
      Flag.set(125);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(125));
      expect(result).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(125));
      expect(Flag.value).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0183 end');
    });

    /**
     * @tc.name   testFlagSeq0184
     * @tc.number SUB_Huks_FLSQ_0184
     * @tc.desc   合法：整数 126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0184 begin');
      Flag.set(126);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(126));
      expect(result).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(126));
      expect(Flag.value).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0184 end');
    });

    /**
     * @tc.name   testFlagSeq0185
     * @tc.number SUB_Huks_FLSQ_0185
     * @tc.desc   合法：整数 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0185 begin');
      Flag.set(127);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(127));
      expect(result).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(127));
      expect(Flag.value).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0185 end');
    });

    /**
     * @tc.name   testFlagSeq0186
     * @tc.number SUB_Huks_FLSQ_0186
     * @tc.desc   合法：整数 128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0186 begin');
      Flag.set(128);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(128));
      expect(result).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(128));
      expect(Flag.value).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0186 end');
    });

    /**
     * @tc.name   testFlagSeq0187
     * @tc.number SUB_Huks_FLSQ_0187
     * @tc.desc   合法：整数 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0187 begin');
      Flag.set(129);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(129));
      expect(result).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(129));
      expect(Flag.value).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0187 end');
    });

    /**
     * @tc.name   testFlagSeq0188
     * @tc.number SUB_Huks_FLSQ_0188
     * @tc.desc   合法：整数 130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0188 begin');
      Flag.set(130);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(130));
      expect(result).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(130));
      expect(Flag.value).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0188 end');
    });

    /**
     * @tc.name   testFlagSeq0189
     * @tc.number SUB_Huks_FLSQ_0189
     * @tc.desc   合法：整数 131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0189 begin');
      Flag.set(131);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(131));
      expect(result).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(131));
      expect(Flag.value).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0189 end');
    });

    /**
     * @tc.name   testFlagSeq0190
     * @tc.number SUB_Huks_FLSQ_0190
     * @tc.desc   合法：整数 132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0190 begin');
      Flag.set(132);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(132));
      expect(result).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(132));
      expect(Flag.value).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0190 end');
    });

    /**
     * @tc.name   testFlagSeq0191
     * @tc.number SUB_Huks_FLSQ_0191
     * @tc.desc   合法：整数 133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0191 begin');
      Flag.set(133);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(133));
      expect(result).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(133));
      expect(Flag.value).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0191 end');
    });

    /**
     * @tc.name   testFlagSeq0192
     * @tc.number SUB_Huks_FLSQ_0192
     * @tc.desc   合法：整数 134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0192 begin');
      Flag.set(134);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(134));
      expect(result).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(134));
      expect(Flag.value).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0192 end');
    });

    /**
     * @tc.name   testFlagSeq0193
     * @tc.number SUB_Huks_FLSQ_0193
     * @tc.desc   合法：整数 135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0193 begin');
      Flag.set(135);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(135));
      expect(result).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(135));
      expect(Flag.value).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0193 end');
    });

    /**
     * @tc.name   testFlagSeq0194
     * @tc.number SUB_Huks_FLSQ_0194
     * @tc.desc   合法：整数 136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0194 begin');
      Flag.set(136);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(136));
      expect(result).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(136));
      expect(Flag.value).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0194 end');
    });

    /**
     * @tc.name   testFlagSeq0195
     * @tc.number SUB_Huks_FLSQ_0195
     * @tc.desc   合法：整数 137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0195 begin');
      Flag.set(137);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(137));
      expect(result).assertEqual(137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(137));
      expect(Flag.value).assertEqual(137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0195 end');
    });

    /**
     * @tc.name   testFlagSeq0196
     * @tc.number SUB_Huks_FLSQ_0196
     * @tc.desc   合法：整数 138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0196 begin');
      Flag.set(138);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(138));
      expect(result).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(138));
      expect(Flag.value).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0196 end');
    });

    /**
     * @tc.name   testFlagSeq0197
     * @tc.number SUB_Huks_FLSQ_0197
     * @tc.desc   合法：整数 139
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0197 begin');
      Flag.set(139);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(139));
      expect(result).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(139));
      expect(Flag.value).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0197 end');
    });

    /**
     * @tc.name   testFlagSeq0198
     * @tc.number SUB_Huks_FLSQ_0198
     * @tc.desc   合法：整数 140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0198 begin');
      Flag.set(140);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(140));
      expect(result).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(140));
      expect(Flag.value).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0198 end');
    });

    /**
     * @tc.name   testFlagSeq0199
     * @tc.number SUB_Huks_FLSQ_0199
     * @tc.desc   合法：整数 141
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0199 begin');
      Flag.set(141);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(141));
      expect(result).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(141));
      expect(Flag.value).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0199 end');
    });

    /**
     * @tc.name   testFlagSeq0200
     * @tc.number SUB_Huks_FLSQ_0200
     * @tc.desc   合法：整数 142
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0200 begin');
      Flag.set(142);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(142));
      expect(result).assertEqual(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(142));
      expect(Flag.value).assertEqual(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0200 end');
    });

    /**
     * @tc.name   testFlagSeq0201
     * @tc.number SUB_Huks_FLSQ_0201
     * @tc.desc   合法：整数 143
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0201 begin');
      Flag.set(143);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(143));
      expect(result).assertEqual(143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(143));
      expect(Flag.value).assertEqual(143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0201 end');
    });

    /**
     * @tc.name   testFlagSeq0202
     * @tc.number SUB_Huks_FLSQ_0202
     * @tc.desc   合法：整数 144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0202 begin');
      Flag.set(144);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(144));
      expect(result).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(144));
      expect(Flag.value).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0202 end');
    });

    /**
     * @tc.name   testFlagSeq0203
     * @tc.number SUB_Huks_FLSQ_0203
     * @tc.desc   合法：整数 145
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0203 begin');
      Flag.set(145);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(145));
      expect(result).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(145));
      expect(Flag.value).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0203 end');
    });

    /**
     * @tc.name   testFlagSeq0204
     * @tc.number SUB_Huks_FLSQ_0204
     * @tc.desc   合法：整数 146
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0204 begin');
      Flag.set(146);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(146));
      expect(result).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(146));
      expect(Flag.value).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0204 end');
    });


    /**
     * @tc.name   testFlagSeq0205
     * @tc.number SUB_Huks_FLSQ_0205
     * @tc.desc   uint32 最大值 4294967295 原样读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0205 begin');
      Flag.set(4294967295);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4294967295));
      expect(result).assertEqual(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(4294967295));
      expect(Flag.value).assertEqual(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0205 end');
    });

  });
}
