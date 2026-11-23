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
import { PhoneNumberValidator } from '../../../main/ets/utils/PhoneNumberValidator';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function phoneBoundaryVolume02Test() {
  describe('PhoneBoundaryVolume02Test', () => {
    /**
     * @tc.name   testPhoneBoundaryVolume010039
     * @tc.number SUB_Contact_PHONEB_0039
     * @tc.desc   前缀边缘：130 合法，120 非法对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010039 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010039 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010040
     * @tc.number SUB_Contact_PHONEB_0040
     * @tc.desc   非法：前导空格（^ 锚定阻断）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010040 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('  13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010040 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010041
     * @tc.number SUB_Contact_PHONEB_0041
     * @tc.desc   边界：尾部空格不阻断前缀匹配（无 $ 锚定语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010041 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010041 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010042
     * @tc.number SUB_Contact_PHONEB_0042
     * @tc.desc   非法：中间空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010042 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('13 00000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010042 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010043
     * @tc.number SUB_Contact_PHONEB_0043
     * @tc.desc   非法：前导制表符（^ 锚定阻断）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010043 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('	13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010043 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010044
     * @tc.number SUB_Contact_PHONEB_0044
     * @tc.desc   边界：尾部换行不阻断前缀匹配（无 $ 锚定语义）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010044 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000\n');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010044 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010045
     * @tc.number SUB_Contact_PHONEB_0045
     * @tc.desc   非法：空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010045 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010045 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010046
     * @tc.number SUB_Contact_PHONEB_0046
     * @tc.desc   补齐：长度边界总长 31，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010046 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010046 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010047
     * @tc.number SUB_Contact_PHONEB_0047
     * @tc.desc   补齐：长度边界总长 32，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010047 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010047 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010048
     * @tc.number SUB_Contact_PHONEB_0048
     * @tc.desc   补齐：长度边界总长 33，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010048 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010048 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010049
     * @tc.number SUB_Contact_PHONEB_0049
     * @tc.desc   补齐：长度边界总长 34，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010049 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010049 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010050
     * @tc.number SUB_Contact_PHONEB_0050
     * @tc.desc   补齐：长度边界总长 35，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010050 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010050 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010051
     * @tc.number SUB_Contact_PHONEB_0051
     * @tc.desc   补齐：长度边界总长 36，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010051 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010051 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010052
     * @tc.number SUB_Contact_PHONEB_0052
     * @tc.desc   补齐：长度边界总长 37，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010052 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010052 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010053
     * @tc.number SUB_Contact_PHONEB_0053
     * @tc.desc   补齐：长度边界总长 38，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010053 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010053 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010054
     * @tc.number SUB_Contact_PHONEB_0054
     * @tc.desc   补齐：长度边界总长 39，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010054 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010054 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010055
     * @tc.number SUB_Contact_PHONEB_0055
     * @tc.desc   补齐：长度边界总长 40，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010055 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010055 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010056
     * @tc.number SUB_Contact_PHONEB_0056
     * @tc.desc   补齐：长度边界总长 41，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010056 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010056 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010057
     * @tc.number SUB_Contact_PHONEB_0057
     * @tc.desc   补齐：长度边界总长 42，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010057 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010057 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010058
     * @tc.number SUB_Contact_PHONEB_0058
     * @tc.desc   补齐：长度边界总长 43，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010058 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010058 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010059
     * @tc.number SUB_Contact_PHONEB_0059
     * @tc.desc   补齐：长度边界总长 44，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010059 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010059 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010060
     * @tc.number SUB_Contact_PHONEB_0060
     * @tc.desc   补齐：长度边界总长 45，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010060 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010060 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010061
     * @tc.number SUB_Contact_PHONEB_0061
     * @tc.desc   补齐：长度边界总长 46，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010061 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010061 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010062
     * @tc.number SUB_Contact_PHONEB_0062
     * @tc.desc   补齐：长度边界总长 47，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010062 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010062 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010063
     * @tc.number SUB_Contact_PHONEB_0063
     * @tc.desc   补齐：长度边界总长 48，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010063 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010063 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010064
     * @tc.number SUB_Contact_PHONEB_0064
     * @tc.desc   补齐：长度边界总长 49，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010064 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010064 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010065
     * @tc.number SUB_Contact_PHONEB_0065
     * @tc.desc   补齐：长度边界总长 50，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010065 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000' +
        '0000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010065 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010066
     * @tc.number SUB_Contact_PHONEB_0066
     * @tc.desc   补齐：长度边界总长 51，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010066 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000' +
        '0000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010066 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010067
     * @tc.number SUB_Contact_PHONEB_0067
     * @tc.desc   补齐：长度边界总长 52，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010067 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000' +
        '00000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010067 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010068
     * @tc.number SUB_Contact_PHONEB_0068
     * @tc.desc   补齐：长度边界总长 53，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010068 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000' +
        '00000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010068 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010069
     * @tc.number SUB_Contact_PHONEB_0069
     * @tc.desc   补齐：长度边界总长 54，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010069 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000' +
        '000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010069 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010070
     * @tc.number SUB_Contact_PHONEB_0070
     * @tc.desc   补齐：长度边界总长 55，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010070 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000' +
        '000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010070 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010071
     * @tc.number SUB_Contact_PHONEB_0071
     * @tc.desc   补齐：长度边界总长 56，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010071 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000' +
        '0000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010071 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010072
     * @tc.number SUB_Contact_PHONEB_0072
     * @tc.desc   补齐：长度边界总长 57，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010072 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000' +
        '0000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010072 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010073
     * @tc.number SUB_Contact_PHONEB_0073
     * @tc.desc   补齐：长度边界总长 58，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010073 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000' +
        '00000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000' +
        '00000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010073 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010074
     * @tc.number SUB_Contact_PHONEB_0074
     * @tc.desc   补齐：长度边界总长 59，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010074 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000' +
        '00000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000' +
        '00000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010074 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010075
     * @tc.number SUB_Contact_PHONEB_0075
     * @tc.desc   补齐：长度边界总长 60，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010075 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000' +
        '000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000' +
        '000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010075 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010076
     * @tc.number SUB_Contact_PHONEB_0076
     * @tc.desc   补齐：长度边界总长 61，前缀匹配语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010076 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000' +
        '000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000' +
        '000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010076 end');
    });
  });
}
