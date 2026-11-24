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

export default function phoneReal01Test() {
  describe('PhoneReal01Test', () => {

    /**
     * @tc.name   testPhoneReal010001
     * @tc.number SUB_Contact_PHONER_0001
     * @tc.desc   运营商基线：联通 13012345678 前缀 130 命中 13x 号段且后随 8 位数字，规则应为 true；同尾号换 12x 非法前缀与去掉一位的 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010001 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13012345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12012345678');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1301234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010001 end');
    });

    /**
     * @tc.name   testPhoneReal010002
     * @tc.number SUB_Contact_PHONER_0002
     * @tc.desc   运营商基线：联通 13123456789 前缀 131 命中 13x 号段且后随 8 位数字，规则应为 true；同尾号换 142 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010002 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13123456789');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('14223456789');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1312345678');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010002 end');
    });

    /**
     * @tc.name   testPhoneReal010003
     * @tc.number SUB_Contact_PHONER_0003
     * @tc.desc   运营商基线：联通 13234567890 前缀 132 命中 13x 号段且后随 8 位数字，规则应为 true；同尾号换 154 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010003 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13234567890');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('15434567890');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1323456789');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010003 end');
    });

    /**
     * @tc.name   testPhoneReal010004
     * @tc.number SUB_Contact_PHONER_0004
     * @tc.desc   运营商基线：电信 13345678901 前缀 133 命中 13x 号段且后随 8 位数字，规则应为 true；同尾号换 161 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010004 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13345678901');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('16145678901');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1334567890');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010004 end');
    });

    /**
     * @tc.name   testPhoneReal010005
     * @tc.number SUB_Contact_PHONER_0005
     * @tc.desc   运营商基线：电信 15356789012 前缀 153 命中 15x 号段且后随 8 位数字，规则应为 true；同尾号换 194 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010005 begin');
      const actual: boolean = PhoneNumberValidator.isValid('15356789012');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('19456789012');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1535678901');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010005 end');
    });

    /**
     * @tc.name   testPhoneReal010006
     * @tc.number SUB_Contact_PHONER_0006
     * @tc.desc   运营商基线：电信 18067890123 前缀 180 命中 18x 号段且后随 8 位数字，规则应为 true；同尾号换 129 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010006 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18067890123');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12967890123');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1806789012');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010006 end');
    });

    /**
     * @tc.name   testPhoneReal010007
     * @tc.number SUB_Contact_PHONER_0007
     * @tc.desc   运营商基线：移动 13578901234 前缀 135 命中 13x 号段且后随 8 位数字，规则应为 true；同尾号换 128 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010007 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13578901234');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12878901234');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1357890123');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010007 end');
    });

    /**
     * @tc.name   testPhoneReal010008
     * @tc.number SUB_Contact_PHONER_0008
     * @tc.desc   运营商基线：移动 13889012345 前缀 138 命中 13x 号段且后随 8 位数字，规则应为 true；同尾号换 143 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010008 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13889012345');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('14389012345');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1388901234');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010008 end');
    });

    /**
     * @tc.name   testPhoneReal010009
     * @tc.number SUB_Contact_PHONER_0009
     * @tc.desc   运营商基线：移动 15990123456 前缀 159 命中 15x 号段且后随 8 位数字，规则应为 true；同尾号换 168 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010009 begin');
      const actual: boolean = PhoneNumberValidator.isValid('15990123456');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('16890123456');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1599012345');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010009 end');
    });

    /**
     * @tc.name   testPhoneReal010010
     * @tc.number SUB_Contact_PHONER_0010
     * @tc.desc   运营商基线：移动 18701234567 前缀 187 命中 18x 号段且后随 8 位数字，规则应为 true；同尾号换 179 非法前缀与 10 位短号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010010 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18701234567');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('17901234567');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1870123456');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010010 end');
    });

    /**
     * @tc.name   testPhoneReal010011
     * @tc.number SUB_Contact_PHONER_0011
     * @tc.desc   尾号档位：固定前缀 138 加全 0 尾号 13800000000，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010011 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13800000000');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12800000000');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1380000000');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010011 end');
    });

    /**
     * @tc.name   testPhoneReal010012
     * @tc.number SUB_Contact_PHONER_0012
     * @tc.desc   尾号档位：固定前缀 138 加全 9 尾号 13899999999，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010012 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13899999999');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12899999999');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1389999999');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010012 end');
    });

    /**
     * @tc.name   testPhoneReal010013
     * @tc.number SUB_Contact_PHONER_0013
     * @tc.desc   尾号档位：固定前缀 138 加顺子尾号 12345678，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010013 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13812345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12812345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1381234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010013 end');
    });

    /**
     * @tc.name   testPhoneReal010014
     * @tc.number SUB_Contact_PHONER_0014
     * @tc.desc   尾号档位：固定前缀 138 加倒序尾号 87654321，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010014 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13887654321');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12887654321');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1388765432');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010014 end');
    });

    /**
     * @tc.name   testPhoneReal010015
     * @tc.number SUB_Contact_PHONER_0015
     * @tc.desc   尾号档位：固定前缀 138 加回文尾号 12344321，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010015 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13812344321');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12812344321');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1381234432');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010015 end');
    });

    /**
     * @tc.name   testPhoneReal010016
     * @tc.number SUB_Contact_PHONER_0016
     * @tc.desc   尾号档位：固定前缀 138 加重复尾号 11111111，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010016 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13811111111');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12811111111');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1381111111');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010016 end');
    });

    /**
     * @tc.name   testPhoneReal010017
     * @tc.number SUB_Contact_PHONER_0017
     * @tc.desc   尾号档位：固定前缀 138 加交替尾号 12121212，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010017 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13812121212');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12812121212');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1381212121');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010017 end');
    });

    /**
     * @tc.name   testPhoneReal010018
     * @tc.number SUB_Contact_PHONER_0018
     * @tc.desc   尾号档位：固定前缀 138 加生日尾号 19900101，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010018 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13819900101');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12819900101');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1381990010');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010018 end');
    });

    /**
     * @tc.name   testPhoneReal010019
     * @tc.number SUB_Contact_PHONER_0019
     * @tc.desc   尾号档位：固定前缀 138 加质数串尾号 31415926，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010019 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13831415926');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12831415926');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1383141592');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010019 end');
    });

    /**
     * @tc.name   testPhoneReal010020
     * @tc.number SUB_Contact_PHONER_0020
     * @tc.desc   尾号档位：固定前缀 138 加随机尾号 95271146，规则应为 true；同尾号 12x 前缀与 7 位尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010020 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13895271146');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12895271146');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1389527114');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010020 end');
    });

    /**
     * @tc.name   testPhoneReal010021
     * @tc.number SUB_Contact_PHONER_0021
     * @tc.desc   边界：10 位号码 1301234567 后随仅 7 位数字，不满足 8 位尾号，规则应为 false；11 位合法号码为 true，9 位更短号码为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010021 begin');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1301234567');
      const elevenDigit: boolean = PhoneNumberValidator.isValid('13012345678');
      const nineDigit: boolean = PhoneNumberValidator.isValid('130123456');
      expect(tenDigit).assertFalse();
      expect(elevenDigit).assertTrue();
      expect(nineDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010021 end');
    });

    /**
     * @tc.name   testPhoneReal010022
     * @tc.number SUB_Contact_PHONER_0022
     * @tc.desc   边界：11 位号码 13012345678 前缀与 8 位尾号齐全，规则应为 true；10 位为 false，12 位按前缀匹配语义仍为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010022 begin');
      const elevenDigit: boolean = PhoneNumberValidator.isValid('13012345678');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1301234567');
      const twelveDigit: boolean = PhoneNumberValidator.isValid('130123456789');
      expect(elevenDigit).assertTrue();
      expect(tenDigit).assertFalse();
      expect(twelveDigit).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010022 end');
    });

    /**
     * @tc.name   testPhoneReal010023
     * @tc.number SUB_Contact_PHONER_0023
     * @tc.desc   边界：12 位号码 130123456789 前缀合法且后随 9 位数字，规则无行尾锚定应为 true；12 位非法前缀 120123456789 为 false，11 位为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010023 begin');
      const twelveDigit: boolean = PhoneNumberValidator.isValid('130123456789');
      const illegalTwelve: boolean = PhoneNumberValidator.isValid('120123456789');
      const elevenDigit: boolean = PhoneNumberValidator.isValid('13012345678');
      expect(twelveDigit).assertTrue();
      expect(illegalTwelve).assertFalse();
      expect(elevenDigit).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010023 end');
    });

    /**
     * @tc.name   testPhoneReal010024
     * @tc.number SUB_Contact_PHONER_0024
     * @tc.desc   边界：空串无前缀且无尾号，规则应为 false；单字符 '1' 为 false，11 位合法号码为 true 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010024 begin');
      const empty: boolean = PhoneNumberValidator.isValid('');
      const singleChar: boolean = PhoneNumberValidator.isValid('1');
      const legal: boolean = PhoneNumberValidator.isValid('13012345678');
      expect(empty).assertFalse();
      expect(singleChar).assertFalse();
      expect(legal).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010024 end');
    });

    /**
     * @tc.name   testPhoneReal010025
     * @tc.number SUB_Contact_PHONER_0025
     * @tc.desc   边界：单字符 '1' 不足以构成任何合法前缀，规则应为 false；'13' 与 '130' 均不足 8 位尾号同为 false，11 位合法号码为 true 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010025 begin');
      const singleChar: boolean = PhoneNumberValidator.isValid('1');
      const twoChar: boolean = PhoneNumberValidator.isValid('13');
      const threeChar: boolean = PhoneNumberValidator.isValid('130');
      const legal: boolean = PhoneNumberValidator.isValid('13012345678');
      expect(singleChar).assertFalse();
      expect(twoChar).assertFalse();
      expect(threeChar).assertFalse();
      expect(legal).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010025 end');
    });

    /**
     * @tc.name   testPhoneReal010026
     * @tc.number SUB_Contact_PHONER_0026
     * @tc.desc   非法值：14a00000000 前缀含字母 a，不在 14[01456879] 字符类内，规则应为 false；全数字 14000000000 为 true，10 位含字母版本为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010026 begin');
      const withLetter: boolean = PhoneNumberValidator.isValid('14a00000000');
      const digitVersion: boolean = PhoneNumberValidator.isValid('14000000000');
      const shortLetter: boolean = PhoneNumberValidator.isValid('14a0000000');
      expect(withLetter).assertFalse();
      expect(digitVersion).assertTrue();
      expect(shortLetter).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010026 end');
    });

    /**
     * @tc.name   testPhoneReal010027
     * @tc.number SUB_Contact_PHONER_0027
     * @tc.desc   非法值：1300000000! 前缀后仅 7 位数字加感叹号，不足 8 位数字，规则应为 false；干净 11 位为 true，9 位加感叹号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010027 begin');
      const withBang: boolean = PhoneNumberValidator.isValid('1300000000!');
      const clean: boolean = PhoneNumberValidator.isValid('13000000000');
      const shortBang: boolean = PhoneNumberValidator.isValid('130000000!');
      expect(withBang).assertFalse();
      expect(clean).assertTrue();
      expect(shortBang).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010027 end');
    });

    /**
     * @tc.name   testPhoneReal010028
     * @tc.number SUB_Contact_PHONER_0028
     * @tc.desc   非法值：前导空格 ' 13000000000' 使行首无法命中任何前缀，规则应为 false；干净 11 位为 true，空串为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010028 begin');
      const leadingSpace: boolean = PhoneNumberValidator.isValid(' 13000000000');
      const clean: boolean = PhoneNumberValidator.isValid('13000000000');
      const empty: boolean = PhoneNumberValidator.isValid('');
      expect(leadingSpace).assertFalse();
      expect(clean).assertTrue();
      expect(empty).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010028 end');
    });

    /**
     * @tc.name   testPhoneReal010029
     * @tc.number SUB_Contact_PHONER_0029
     * @tc.desc   非法值陷阱：尾随空格 '13000000000 ' 前 11 位已构成合法前缀加 8 位尾号，规则无行尾锚定（前缀匹配）应为 true；前导空格与前导负号版本均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010029 begin');
      const trailingSpace: boolean = PhoneNumberValidator.isValid('13000000000 ');
      const leadingSpace: boolean = PhoneNumberValidator.isValid(' 13000000000');
      const leadingDash: boolean = PhoneNumberValidator.isValid('-13000000000');
      expect(trailingSpace).assertTrue();
      expect(leadingSpace).assertFalse();
      expect(leadingDash).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010029 end');
    });

    /**
     * @tc.name   testPhoneReal010030
     * @tc.number SUB_Contact_PHONER_0030
     * @tc.desc   非法值：前导负号 -13000000000 使行首无法命中任何前缀，规则应为 false；干净 11 位为 true，单负号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010030 begin');
      const leadingDash: boolean = PhoneNumberValidator.isValid('-13000000000');
      const clean: boolean = PhoneNumberValidator.isValid('13000000000');
      const singleDash: boolean = PhoneNumberValidator.isValid('-');
      expect(leadingDash).assertFalse();
      expect(clean).assertTrue();
      expect(singleDash).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010030 end');
    });

    /**
     * @tc.name   testPhoneReal010031
     * @tc.number SUB_Contact_PHONER_0031
     * @tc.desc   极值：'13'+'0'.repeat(100) 总长 102，前缀 130 命中且后随 99 位数字，规则前缀匹配应为 true；'12' 前缀同长对照为 false；输入长度恒为 102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010031 begin');
      const longNumber: string = '13' + '0'.repeat(100);
      const longIllegal: string = '12' + '0'.repeat(100);
      const actual: boolean = PhoneNumberValidator.isValid(longNumber);
      const illegalResult: boolean = PhoneNumberValidator.isValid(longIllegal);
      const length: number = longNumber.length;
      expect(actual).assertTrue();
      expect(illegalResult).assertFalse();
      expect(length).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010031 end');
    });

    /**
     * @tc.name   testPhoneReal010032
     * @tc.number SUB_Contact_PHONER_0032
     * @tc.desc   极值：'13'+'0'.repeat(1000) 总长 1002，前缀 130 命中且后随 1000 位数字，规则前缀匹配应为 true；'12' 前缀同长对照为 false；输入长度恒为 1002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010032 begin');
      const longNumber: string = '13' + '0'.repeat(1000);
      const longIllegal: string = '12' + '0'.repeat(1000);
      const actual: boolean = PhoneNumberValidator.isValid(longNumber);
      const illegalResult: boolean = PhoneNumberValidator.isValid(longIllegal);
      const length: number = longNumber.length;
      expect(actual).assertTrue();
      expect(illegalResult).assertFalse();
      expect(length).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010032 end');
    });

    /**
     * @tc.name   testPhoneReal010033
     * @tc.number SUB_Contact_PHONER_0033
     * @tc.desc   极值：'13'+'9'.repeat(500) 总长 502，前缀 139 命中且后随 500 位数字，规则前缀匹配应为 true；'12' 前缀同长对照为 false；输入长度恒为 502
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010033 begin');
      const longNumber: string = '13' + '9'.repeat(500);
      const longIllegal: string = '12' + '9'.repeat(500);
      const actual: boolean = PhoneNumberValidator.isValid(longNumber);
      const illegalResult: boolean = PhoneNumberValidator.isValid(longIllegal);
      const length: number = longNumber.length;
      expect(actual).assertTrue();
      expect(illegalResult).assertFalse();
      expect(length).assertEqual(502);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010033 end');
    });

    /**
     * @tc.name   testPhoneReal010034
     * @tc.number SUB_Contact_PHONER_0034
     * @tc.desc   极值：'19'+'9'.repeat(998) 总长 1000，前缀 199 命中且后随 998 位数字，规则前缀匹配应为 true；'12' 前缀同长对照为 false；输入长度恒为 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010034 begin');
      const longNumber: string = '19' + '9'.repeat(998);
      const longIllegal: string = '12' + '9'.repeat(998);
      const actual: boolean = PhoneNumberValidator.isValid(longNumber);
      const illegalResult: boolean = PhoneNumberValidator.isValid(longIllegal);
      const length: number = longNumber.length;
      expect(actual).assertTrue();
      expect(illegalResult).assertFalse();
      expect(length).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010034 end');
    });

    /**
     * @tc.name   testPhoneReal010035
     * @tc.number SUB_Contact_PHONER_0035
     * @tc.desc   极值：'12'+'0'.repeat(1000) 总长 1002，前缀 12 不在任何号段，超长也不应命中，规则应为 false；'13' 前缀同长对照为 true；输入长度恒为 1002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010035 begin');
      const longIllegal: string = '12' + '0'.repeat(1000);
      const longLegal: string = '13' + '0'.repeat(1000);
      const illegalResult: boolean = PhoneNumberValidator.isValid(longIllegal);
      const legalResult: boolean = PhoneNumberValidator.isValid(longLegal);
      const length: number = longIllegal.length;
      expect(illegalResult).assertFalse();
      expect(legalResult).assertTrue();
      expect(length).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010035 end');
    });

    /**
     * @tc.name   testPhoneReal010036
     * @tc.number SUB_Contact_PHONER_0036
     * @tc.desc   组合：合法前缀 130 加全 0 尾号 13000000000，规则应为 true；相邻非法前缀 120 同尾号为 false；10 位短号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010036 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13000000000');
      const neighbor: boolean = PhoneNumberValidator.isValid('12000000000');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1300000000');
      expect(actual).assertTrue();
      expect(neighbor).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010036 end');
    });

    /**
     * @tc.name   testPhoneReal010037
     * @tc.number SUB_Contact_PHONER_0037
     * @tc.desc   组合：合法前缀 199 加顺子尾号 19912345678，规则应为 true；相邻非法前缀 194 同尾号为 false；10 位短号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010037 begin');
      const actual: boolean = PhoneNumberValidator.isValid('19912345678');
      const neighbor: boolean = PhoneNumberValidator.isValid('19412345678');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1991234567');
      expect(actual).assertTrue();
      expect(neighbor).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010037 end');
    });

    /**
     * @tc.name   testPhoneReal010038
     * @tc.number SUB_Contact_PHONER_0038
     * @tc.desc   组合：合法前缀 162 加倒序尾号 16287654321，规则应为 true；相邻非法前缀 161 同尾号为 false；10 位短号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010038 begin');
      const actual: boolean = PhoneNumberValidator.isValid('16287654321');
      const neighbor: boolean = PhoneNumberValidator.isValid('16187654321');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1628765432');
      expect(actual).assertTrue();
      expect(neighbor).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010038 end');
    });

    /**
     * @tc.name   testPhoneReal010039
     * @tc.number SUB_Contact_PHONER_0039
     * @tc.desc   组合：合法前缀 177 加重复尾号 17711111111，规则应为 true；相邻非法前缀 179 同尾号为 false；10 位短号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010039 begin');
      const actual: boolean = PhoneNumberValidator.isValid('17711111111');
      const neighbor: boolean = PhoneNumberValidator.isValid('17911111111');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1771111111');
      expect(actual).assertTrue();
      expect(neighbor).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010039 end');
    });

    /**
     * @tc.name   testPhoneReal010040
     * @tc.number SUB_Contact_PHONER_0040
     * @tc.desc   组合：合法前缀 188 加交替尾号 18898765432，规则应为 true；相邻非法前缀 128 同尾号为 false；10 位短号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010040 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18898765432');
      const neighbor: boolean = PhoneNumberValidator.isValid('12898765432');
      const tenDigit: boolean = PhoneNumberValidator.isValid('1889876543');
      expect(actual).assertTrue();
      expect(neighbor).assertFalse();
      expect(tenDigit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010040 end');
    });

    /**
     * @tc.name   testPhoneReal010041
     * @tc.number SUB_Contact_PHONER_0041
     * @tc.desc   重复调用幂等：13012345678 连续两次调用结果均为 true 且彼此相等，不同号码 12012345678 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010041 begin');
      const first: boolean = PhoneNumberValidator.isValid('13012345678');
      const second: boolean = PhoneNumberValidator.isValid('13012345678');
      const other: boolean = PhoneNumberValidator.isValid('12012345678');
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(first === second).assertTrue();
      expect(other).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010041 end');
    });

    /**
     * @tc.name   testPhoneReal010042
     * @tc.number SUB_Contact_PHONER_0042
     * @tc.desc   重复调用幂等：15399999999 连续三次调用结果均为 true 且两两相等，相邻非法前缀 15499999999 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010042 begin');
      const first: boolean = PhoneNumberValidator.isValid('15399999999');
      const second: boolean = PhoneNumberValidator.isValid('15399999999');
      const third: boolean = PhoneNumberValidator.isValid('15399999999');
      const neighbor: boolean = PhoneNumberValidator.isValid('15499999999');
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(third).assertTrue();
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(neighbor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010042 end');
    });

    /**
     * @tc.name   testPhoneReal010043
     * @tc.number SUB_Contact_PHONER_0043
     * @tc.desc   重复调用幂等：非法前缀 14212345678 连续三次调用结果均为 false 且彼此相等，相邻合法前缀 14012345678 为 true 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010043 begin');
      const first: boolean = PhoneNumberValidator.isValid('14212345678');
      const second: boolean = PhoneNumberValidator.isValid('14212345678');
      const third: boolean = PhoneNumberValidator.isValid('14212345678');
      const neighbor: boolean = PhoneNumberValidator.isValid('14012345678');
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(third).assertFalse();
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(neighbor).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010043 end');
    });

    /**
     * @tc.name   testPhoneReal010044
     * @tc.number SUB_Contact_PHONER_0044
     * @tc.desc   重复调用幂等：16200000000 连续两次调用结果均为 true 且彼此相等，相邻非法前缀 16000000000 为 false 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010044 begin');
      const first: boolean = PhoneNumberValidator.isValid('16200000000');
      const second: boolean = PhoneNumberValidator.isValid('16200000000');
      const other: boolean = PhoneNumberValidator.isValid('16000000000');
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(first === second).assertTrue();
      expect(other).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010044 end');
    });

    /**
     * @tc.name   testPhoneReal010045
     * @tc.number SUB_Contact_PHONER_0045
     * @tc.desc   重复调用幂等：空串连续两次调用结果均为 false 且彼此相等，合法号码 13000000000 为 true 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010045 begin');
      const first: boolean = PhoneNumberValidator.isValid('');
      const second: boolean = PhoneNumberValidator.isValid('');
      const legal: boolean = PhoneNumberValidator.isValid('13000000000');
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(first === second).assertTrue();
      expect(legal).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010045 end');
    });

    /**
     * @tc.name   testPhoneReal010046
     * @tc.number SUB_Contact_PHONER_0046
     * @tc.desc   混合哨兵：合法 13012345678 应为 true，非法前缀 12012345678 应为 false，边界 10 位 1301234567 应为 false，且合法与非法结果互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010046 begin');
      const legal: boolean = PhoneNumberValidator.isValid('13012345678');
      const illegal: boolean = PhoneNumberValidator.isValid('12012345678');
      const boundary: boolean = PhoneNumberValidator.isValid('1301234567');
      expect(legal).assertTrue();
      expect(illegal).assertFalse();
      expect(boundary).assertFalse();
      expect(legal === illegal).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010046 end');
    });

    /**
     * @tc.name   testPhoneReal010047
     * @tc.number SUB_Contact_PHONER_0047
     * @tc.desc   混合哨兵：合法 19912345678 应为 true，非法前缀 19412345678 应为 false，边界空串应为 false，且合法与非法结果互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010047 begin');
      const legal: boolean = PhoneNumberValidator.isValid('19912345678');
      const illegal: boolean = PhoneNumberValidator.isValid('19412345678');
      const boundary: boolean = PhoneNumberValidator.isValid('');
      expect(legal).assertTrue();
      expect(illegal).assertFalse();
      expect(boundary).assertFalse();
      expect(legal === illegal).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010047 end');
    });

    /**
     * @tc.name   testPhoneReal010048
     * @tc.number SUB_Contact_PHONER_0048
     * @tc.desc   混合哨兵：合法 16666666666 应为 true，非法前缀 16866666666 应为 false，边界 10 位 1666666666 应为 false，且非法与边界同为拒绝关系
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010048 begin');
      const legal: boolean = PhoneNumberValidator.isValid('16666666666');
      const illegal: boolean = PhoneNumberValidator.isValid('16866666666');
      const boundary: boolean = PhoneNumberValidator.isValid('1666666666');
      expect(legal).assertTrue();
      expect(illegal).assertFalse();
      expect(boundary).assertFalse();
      expect(illegal === boundary).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010048 end');
    });

    /**
     * @tc.name   testPhoneReal010049
     * @tc.number SUB_Contact_PHONER_0049
     * @tc.desc   混合哨兵：合法 15712345678 应为 true，非法前缀 15412345678 应为 false，边界 10 位 1571234567 应为 false，且合法与边界结果互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010049 begin');
      const legal: boolean = PhoneNumberValidator.isValid('15712345678');
      const illegal: boolean = PhoneNumberValidator.isValid('15412345678');
      const boundary: boolean = PhoneNumberValidator.isValid('1571234567');
      expect(legal).assertTrue();
      expect(illegal).assertFalse();
      expect(boundary).assertFalse();
      expect(legal === boundary).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010049 end');
    });

    /**
     * @tc.name   testPhoneReal010050
     * @tc.number SUB_Contact_PHONER_0050
     * @tc.desc   混合哨兵：合法 14412345678 应为 true，非法前缀 14312345678 应为 false，边界 10 位 1441234567 应为 false，两者结果互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010050 begin');
      const legal: boolean = PhoneNumberValidator.isValid('14412345678');
      const illegal: boolean = PhoneNumberValidator.isValid('14312345678');
      const boundary: boolean = PhoneNumberValidator.isValid('1441234567');
      expect(legal).assertTrue();
      expect(illegal).assertFalse();
      expect(boundary).assertFalse();
      expect(legal === illegal).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal010050 end');
    });
  });
}
