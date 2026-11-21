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

export default function phoneExtremeVolume01Test() {
  describe('PhoneExtremeVolume01Test', () => {

    /**
     * @tc.name   testPhoneExtremeVolume01Anchor01
     * @tc.number SUB_Contact_PHONEX_0001
     * @tc.desc   500 位尾号前缀匹配通过，同长非法前缀拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume01Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume01Anchor01 begin');
      const longTail: string = '13' + '0'.repeat(498);
      const longIllegal: string = '12' + '0'.repeat(498);
      const longLegal: boolean = PhoneNumberValidator.isValid(longTail);
      const longRejected: boolean = PhoneNumberValidator.isValid(longIllegal);
      expect(longLegal).assertTrue();
      expect(longRejected).assertFalse();
      expect(longTail.length).assertEqual(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume01Anchor01 end');
    });
    /**
     * @tc.name   testPhoneExtremeVolume010002
     * @tc.number SUB_Contact_PHONEX_0002
     * @tc.desc   极值：130 前缀 + 9 位尾号（总长 11），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010002 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010002 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010003
     * @tc.number SUB_Contact_PHONEX_0003
     * @tc.desc   极值：130 前缀 + 22 位尾号（总长 24），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010003 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010003 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010004
     * @tc.number SUB_Contact_PHONEX_0004
     * @tc.desc   极值：130 前缀 + 35 位尾号（总长 37），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010004 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010004 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010005
     * @tc.number SUB_Contact_PHONEX_0005
     * @tc.desc   极值：130 前缀 + 48 位尾号（总长 50），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010005 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010006
     * @tc.number SUB_Contact_PHONEX_0006
     * @tc.desc   极值：130 前缀 + 61 位尾号（总长 63），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010006 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000' +
        '0000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000' +
        '0000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010006 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010007
     * @tc.number SUB_Contact_PHONEX_0007
     * @tc.desc   极值：130 前缀 + 74 位尾号（总长 76），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010007 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010007 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010008
     * @tc.number SUB_Contact_PHONEX_0008
     * @tc.desc   极值：130 前缀 + 87 位尾号（总长 89），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010008 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010008 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010009
     * @tc.number SUB_Contact_PHONEX_0009
     * @tc.desc   极值：130 前缀 + 100 位尾号（总长 102），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010009 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000' +
        '0000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010009 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010010
     * @tc.number SUB_Contact_PHONEX_0010
     * @tc.desc   极值：130 前缀 + 113 位尾号（总长 115），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010010 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000' +
        '00000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000' +
        '00000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010010 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010011
     * @tc.number SUB_Contact_PHONEX_0011
     * @tc.desc   极值：130 前缀 + 126 位尾号（总长 128），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010011 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010011 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010012
     * @tc.number SUB_Contact_PHONEX_0012
     * @tc.desc   极值：130 前缀 + 139 位尾号（总长 141），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010012 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010012 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010013
     * @tc.number SUB_Contact_PHONEX_0013
     * @tc.desc   极值：130 前缀 + 152 位尾号（总长 154），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010013 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000' +
        '00000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010013 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010014
     * @tc.number SUB_Contact_PHONEX_0014
     * @tc.desc   极值：130 前缀 + 165 位尾号（总长 167），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010014 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000' +
        '0000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010014 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010015
     * @tc.number SUB_Contact_PHONEX_0015
     * @tc.desc   极值：130 前缀 + 178 位尾号（总长 180），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010015 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000' +
        '000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000' +
        '000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010015 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010016
     * @tc.number SUB_Contact_PHONEX_0016
     * @tc.desc   极值：130 前缀 + 191 位尾号（总长 193），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010016 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010016 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010017
     * @tc.number SUB_Contact_PHONEX_0017
     * @tc.desc   极值：130 前缀 + 204 位尾号（总长 206），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010017 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010017 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010018
     * @tc.number SUB_Contact_PHONEX_0018
     * @tc.desc   极值：130 前缀 + 217 位尾号（总长 219），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010018 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000' +
        '000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010018 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010019
     * @tc.number SUB_Contact_PHONEX_0019
     * @tc.desc   极值：130 前缀 + 230 位尾号（总长 232），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010019 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000' +
        '00000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000' +
        '00000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010019 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010020
     * @tc.number SUB_Contact_PHONEX_0020
     * @tc.desc   极值：130 前缀 + 243 位尾号（总长 245），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010020 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010020 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010021
     * @tc.number SUB_Contact_PHONEX_0021
     * @tc.desc   极值：130 前缀 + 256 位尾号（总长 258），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010021 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010021 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010022
     * @tc.number SUB_Contact_PHONEX_0022
     * @tc.desc   极值：130 前缀 + 269 位尾号（总长 271），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010022 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010022 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010023
     * @tc.number SUB_Contact_PHONEX_0023
     * @tc.desc   极值：130 前缀 + 282 位尾号（总长 284），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010023 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010023 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010024
     * @tc.number SUB_Contact_PHONEX_0024
     * @tc.desc   极值：130 前缀 + 295 位尾号（总长 297），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010024 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000' +
        '000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000' +
        '000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010024 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010025
     * @tc.number SUB_Contact_PHONEX_0025
     * @tc.desc   极值：130 前缀 + 308 位尾号（总长 310），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010025 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010025 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010026
     * @tc.number SUB_Contact_PHONEX_0026
     * @tc.desc   极值：130 前缀 + 321 位尾号（总长 323），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010026 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010026 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010027
     * @tc.number SUB_Contact_PHONEX_0027
     * @tc.desc   极值：130 前缀 + 334 位尾号（总长 336），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010027 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010027 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010028
     * @tc.number SUB_Contact_PHONEX_0028
     * @tc.desc   极值：130 前缀 + 347 位尾号（总长 349），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010028 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010028 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010029
     * @tc.number SUB_Contact_PHONEX_0029
     * @tc.desc   极值：130 前缀 + 360 位尾号（总长 362），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010029 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000' +
        '000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000' +
        '000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010029 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010030
     * @tc.number SUB_Contact_PHONEX_0030
     * @tc.desc   极值：130 前缀 + 373 位尾号（总长 375），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010030 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010030 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010031
     * @tc.number SUB_Contact_PHONEX_0031
     * @tc.desc   极值：130 前缀 + 386 位尾号（总长 388），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010031 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010031 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010032
     * @tc.number SUB_Contact_PHONEX_0032
     * @tc.desc   极值：130 前缀 + 399 位尾号（总长 401），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010032 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000' +
        '000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000' +
        '000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010032 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010033
     * @tc.number SUB_Contact_PHONEX_0033
     * @tc.desc   极值：130 前缀 + 412 位尾号（总长 414），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010033 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010033 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010034
     * @tc.number SUB_Contact_PHONEX_0034
     * @tc.desc   极值：130 前缀 + 425 位尾号（总长 427），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010034 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000' +
        '000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000' +
        '000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010034 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010035
     * @tc.number SUB_Contact_PHONEX_0035
     * @tc.desc   极值：130 前缀 + 438 位尾号（总长 440），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010035 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000' +
        '0000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010035 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010036
     * @tc.number SUB_Contact_PHONEX_0036
     * @tc.desc   极值：130 前缀 + 451 位尾号（总长 453），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010036 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010036 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010037
     * @tc.number SUB_Contact_PHONEX_0037
     * @tc.desc   极值：130 前缀 + 464 位尾号（总长 466），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010037 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000' +
        '000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000' +
        '000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010037 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010038
     * @tc.number SUB_Contact_PHONEX_0038
     * @tc.desc   极值：130 前缀 + 477 位尾号（总长 479），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010038 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010038 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010039
     * @tc.number SUB_Contact_PHONEX_0039
     * @tc.desc   极值：130 前缀 + 490 位尾号（总长 492），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010039 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010039 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010040
     * @tc.number SUB_Contact_PHONEX_0040
     * @tc.desc   极值：130 前缀 + 503 位尾号（总长 505），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010040 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010040 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010041
     * @tc.number SUB_Contact_PHONEX_0041
     * @tc.desc   极值：130 前缀 + 516 位尾号（总长 518），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010041 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000' +
        '00000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010041 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010042
     * @tc.number SUB_Contact_PHONEX_0042
     * @tc.desc   极值：130 前缀 + 529 位尾号（总长 531），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010042 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000' +
        '000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000' +
        '000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010042 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010043
     * @tc.number SUB_Contact_PHONEX_0043
     * @tc.desc   极值：130 前缀 + 542 位尾号（总长 544），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010043 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000000000' +
        '0000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010043 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010044
     * @tc.number SUB_Contact_PHONEX_0044
     * @tc.desc   极值：130 前缀 + 555 位尾号（总长 557），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010044 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000000000' +
        '00000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000000' +
        '0000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010044 end');
    });

    /**
     * @tc.name   testPhoneExtremeVolume010045
     * @tc.number SUB_Contact_PHONEX_0045
     * @tc.desc   极值：130 前缀 + 568 位尾号（总长 570），前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneExtremeVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010045 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000000000' +
        '000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000000000' +
        '000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneExtremeVolume010045 end');
    });


  });
}
