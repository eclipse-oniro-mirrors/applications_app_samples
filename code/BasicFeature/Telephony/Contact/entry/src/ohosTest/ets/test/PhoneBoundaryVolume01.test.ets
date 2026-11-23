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

export default function phoneBoundaryVolume01Test() {
  describe('PhoneBoundaryVolume01Test', () => {

    /**
     * @tc.name   testPhoneBoundaryVolume01Anchor01
     * @tc.number SUB_Contact_PHONEB_0001
     * @tc.desc   长度 11 位恰达阈值通过，10 位不足拒绝，非法前缀拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume01Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume01Anchor01 begin');
      const atThreshold: boolean = PhoneNumberValidator.isValid('13000000000');
      const belowThreshold: boolean = PhoneNumberValidator.isValid('1300000000');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12000000000');
      expect(atThreshold).assertTrue();
      expect(belowThreshold).assertFalse();
      expect(illegalPrefix).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume01Anchor01 end');
    });
    /**
     * @tc.name   testPhoneBoundaryVolume010002
     * @tc.number SUB_Contact_PHONEB_0002
     * @tc.desc   长度边界：总长 1，前缀 13 + 0 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010002 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12');
      const result: boolean = PhoneNumberValidator.isValid('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010002 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010003
     * @tc.number SUB_Contact_PHONEB_0003
     * @tc.desc   长度边界：总长 2，前缀 13 + 0 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010003 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12');
      const result: boolean = PhoneNumberValidator.isValid('13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010003 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010004
     * @tc.number SUB_Contact_PHONEB_0004
     * @tc.desc   长度边界：总长 3，前缀 13 + 1 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010004 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120');
      const result: boolean = PhoneNumberValidator.isValid('130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010004 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010005
     * @tc.number SUB_Contact_PHONEB_0005
     * @tc.desc   长度边界：总长 4，前缀 13 + 2 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010005 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200');
      const result: boolean = PhoneNumberValidator.isValid('1300');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010005 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010006
     * @tc.number SUB_Contact_PHONEB_0006
     * @tc.desc   长度边界：总长 5，前缀 13 + 3 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010006 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000');
      const result: boolean = PhoneNumberValidator.isValid('13000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010006 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010007
     * @tc.number SUB_Contact_PHONEB_0007
     * @tc.desc   长度边界：总长 6，前缀 13 + 4 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010007 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000');
      const result: boolean = PhoneNumberValidator.isValid('130000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010007 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010008
     * @tc.number SUB_Contact_PHONEB_0008
     * @tc.desc   长度边界：总长 7，前缀 13 + 5 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010008 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000');
      const result: boolean = PhoneNumberValidator.isValid('1300000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010008 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010009
     * @tc.number SUB_Contact_PHONEB_0009
     * @tc.desc   长度边界：总长 8，前缀 13 + 6 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010009 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010009 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010010
     * @tc.number SUB_Contact_PHONEB_0010
     * @tc.desc   长度边界：总长 9，前缀 13 + 7 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010010 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010010 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010011
     * @tc.number SUB_Contact_PHONEB_0011
     * @tc.desc   长度边界：总长 10，前缀 13 + 8 位尾号不足 8 位尾数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010011 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010011 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010012
     * @tc.number SUB_Contact_PHONEB_0012
     * @tc.desc   长度边界：总长 11，前缀 13 + 9 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010012 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010012 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010013
     * @tc.number SUB_Contact_PHONEB_0013
     * @tc.desc   长度边界：总长 12，前缀 13 + 10 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010013 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010013 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010014
     * @tc.number SUB_Contact_PHONEB_0014
     * @tc.desc   长度边界：总长 13，前缀 13 + 11 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010014 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010014 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010015
     * @tc.number SUB_Contact_PHONEB_0015
     * @tc.desc   长度边界：总长 14，前缀 13 + 12 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010015 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010015 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010016
     * @tc.number SUB_Contact_PHONEB_0016
     * @tc.desc   长度边界：总长 15，前缀 13 + 13 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010016 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010016 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010017
     * @tc.number SUB_Contact_PHONEB_0017
     * @tc.desc   长度边界：总长 16，前缀 13 + 14 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010017 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010017 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010018
     * @tc.number SUB_Contact_PHONEB_0018
     * @tc.desc   长度边界：总长 17，前缀 13 + 15 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010018 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010018 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010019
     * @tc.number SUB_Contact_PHONEB_0019
     * @tc.desc   长度边界：总长 18，前缀 13 + 16 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010019 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010019 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010020
     * @tc.number SUB_Contact_PHONEB_0020
     * @tc.desc   长度边界：总长 19，前缀 13 + 17 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010020 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010020 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010021
     * @tc.number SUB_Contact_PHONEB_0021
     * @tc.desc   长度边界：总长 20，前缀 13 + 18 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010021 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010021 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010022
     * @tc.number SUB_Contact_PHONEB_0022
     * @tc.desc   长度边界：总长 21，前缀 13 + 19 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010022 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010022 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010023
     * @tc.number SUB_Contact_PHONEB_0023
     * @tc.desc   长度边界：总长 22，前缀 13 + 20 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010023 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010023 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010024
     * @tc.number SUB_Contact_PHONEB_0024
     * @tc.desc   长度边界：总长 23，前缀 13 + 21 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010024 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010024 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010025
     * @tc.number SUB_Contact_PHONEB_0025
     * @tc.desc   长度边界：总长 24，前缀 13 + 22 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010025 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010025 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010026
     * @tc.number SUB_Contact_PHONEB_0026
     * @tc.desc   长度边界：总长 25，前缀 13 + 23 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010026 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010026 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010027
     * @tc.number SUB_Contact_PHONEB_0027
     * @tc.desc   长度边界：总长 26，前缀 13 + 24 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010027 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010027 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010028
     * @tc.number SUB_Contact_PHONEB_0028
     * @tc.desc   长度边界：总长 27，前缀 13 + 25 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010028 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010028 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010029
     * @tc.number SUB_Contact_PHONEB_0029
     * @tc.desc   长度边界：总长 28，前缀 13 + 26 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010029 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1200000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('1300000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010029 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010030
     * @tc.number SUB_Contact_PHONEB_0030
     * @tc.desc   长度边界：总长 29，前缀 13 + 27 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010030 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010030 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010031
     * @tc.number SUB_Contact_PHONEB_0031
     * @tc.desc   长度边界：总长 30，前缀 13 + 28 位尾号达到 8 位尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010031 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('120000000000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('130000000000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010031 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010032
     * @tc.number SUB_Contact_PHONEB_0032
     * @tc.desc   前缀边缘：129 低于 130 下限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010032 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('12900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010032 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010033
     * @tc.number SUB_Contact_PHONEB_0033
     * @tc.desc   前缀边缘：130 为 13x 段下限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010033 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('12900000000');
      const result: boolean = PhoneNumberValidator.isValid('13000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010033 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010034
     * @tc.number SUB_Contact_PHONEB_0034
     * @tc.desc   前缀边缘：139/140 分属两段但均合法，结果同为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010034 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('14000000000');
      const result: boolean = PhoneNumberValidator.isValid('13900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010034 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010035
     * @tc.number SUB_Contact_PHONEB_0035
     * @tc.desc   前缀边缘：200 高于 199 上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010035 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('19900000000');
      const result: boolean = PhoneNumberValidator.isValid('20000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010035 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010036
     * @tc.number SUB_Contact_PHONEB_0036
     * @tc.desc   前缀边缘：199 为 19x 段上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010036 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('20000000000');
      const result: boolean = PhoneNumberValidator.isValid('19900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010036 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010037
     * @tc.number SUB_Contact_PHONEB_0037
     * @tc.desc   前缀边缘：110 不属于任何号段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010037 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('11000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010037 end');
    });

    /**
     * @tc.name   testPhoneBoundaryVolume010038
     * @tc.number SUB_Contact_PHONEB_0038
     * @tc.desc   前缀边缘：120 不属于任何号段
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneBoundaryVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010038 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13000000000');
      const result: boolean = PhoneNumberValidator.isValid('12000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneBoundaryVolume010038 end');
    });


  });
}
