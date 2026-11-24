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

export default function phoneReal02Test() {
  describe('PhoneReal02Test', () => {

    /**
     * @tc.name   testPhoneReal020001
     * @tc.number SUB_Contact_PHONER_0051
     * @tc.desc   13x 段逐前缀：130 加 8 位尾号 13012345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020001 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13012345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12012345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1301234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020001 end');
    });

    /**
     * @tc.name   testPhoneReal020002
     * @tc.number SUB_Contact_PHONER_0052
     * @tc.desc   13x 段逐前缀：131 加 8 位尾号 13112345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020002 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13112345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12112345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1311234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020002 end');
    });

    /**
     * @tc.name   testPhoneReal020003
     * @tc.number SUB_Contact_PHONER_0053
     * @tc.desc   13x 段逐前缀：132 加 8 位尾号 13212345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020003 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13212345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12212345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1321234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020003 end');
    });

    /**
     * @tc.name   testPhoneReal020004
     * @tc.number SUB_Contact_PHONER_0054
     * @tc.desc   13x 段逐前缀：133 加 8 位尾号 13312345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020004 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13312345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12312345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1331234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020004 end');
    });

    /**
     * @tc.name   testPhoneReal020005
     * @tc.number SUB_Contact_PHONER_0055
     * @tc.desc   13x 段逐前缀：134 加 8 位尾号 13412345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020005 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13412345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12412345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1341234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020005 end');
    });

    /**
     * @tc.name   testPhoneReal020006
     * @tc.number SUB_Contact_PHONER_0056
     * @tc.desc   13x 段逐前缀：135 加 8 位尾号 13512345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020006 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13512345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12512345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1351234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020006 end');
    });

    /**
     * @tc.name   testPhoneReal020007
     * @tc.number SUB_Contact_PHONER_0057
     * @tc.desc   13x 段逐前缀：136 加 8 位尾号 13612345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020007 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13612345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12612345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1361234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020007 end');
    });

    /**
     * @tc.name   testPhoneReal020008
     * @tc.number SUB_Contact_PHONER_0058
     * @tc.desc   13x 段逐前缀：137 加 8 位尾号 13712345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020008 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13712345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12712345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1371234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020008 end');
    });

    /**
     * @tc.name   testPhoneReal020009
     * @tc.number SUB_Contact_PHONER_0059
     * @tc.desc   13x 段逐前缀：138 加 8 位尾号 13812345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020009 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13812345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12812345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1381234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020009 end');
    });

    /**
     * @tc.name   testPhoneReal020010
     * @tc.number SUB_Contact_PHONER_0060
     * @tc.desc   13x 段逐前缀：139 加 8 位尾号 13912345678 命中 13[0-9]，规则应为 true；同尾号 12x 前缀为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020010 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13912345678');
      const illegalPrefix: boolean = PhoneNumberValidator.isValid('12912345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1391234567');
      expect(actual).assertTrue();
      expect(illegalPrefix).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020010 end');
    });

    /**
     * @tc.name   testPhoneReal020011
     * @tc.number SUB_Contact_PHONER_0061
     * @tc.desc   14x 段：140 加 8 位尾号 14000000000 命中 14[01456879]，应为 true；141 因字符类含 1 同样命中应为 true；142/143 同尾号不在字符类内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020011 begin');
      const actual: boolean = PhoneNumberValidator.isValid('14000000000');
      const trap141: boolean = PhoneNumberValidator.isValid('14100000000');
      const illegal142: boolean = PhoneNumberValidator.isValid('14200000000');
      const illegal143: boolean = PhoneNumberValidator.isValid('14300000000');
      expect(actual).assertTrue();
      expect(trap141).assertTrue();
      expect(illegal142).assertFalse();
      expect(illegal143).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020011 end');
    });

    /**
     * @tc.name   testPhoneReal020012
     * @tc.number SUB_Contact_PHONER_0062
     * @tc.desc   14x 段：144 加 8 位尾号 14411111111 命中 14[01456879]，应为 true；141 因字符类含 1 同样命中应为 true；142/143 同尾号不在字符类内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020012 begin');
      const actual: boolean = PhoneNumberValidator.isValid('14411111111');
      const trap141: boolean = PhoneNumberValidator.isValid('14111111111');
      const illegal142: boolean = PhoneNumberValidator.isValid('14211111111');
      const illegal143: boolean = PhoneNumberValidator.isValid('14311111111');
      expect(actual).assertTrue();
      expect(trap141).assertTrue();
      expect(illegal142).assertFalse();
      expect(illegal143).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020012 end');
    });

    /**
     * @tc.name   testPhoneReal020013
     * @tc.number SUB_Contact_PHONER_0063
     * @tc.desc   14x 段：145 加 8 位尾号 14522222222 命中 14[01456879]，应为 true；141 因字符类含 1 同样命中应为 true；142/143 同尾号不在字符类内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020013 begin');
      const actual: boolean = PhoneNumberValidator.isValid('14522222222');
      const trap141: boolean = PhoneNumberValidator.isValid('14122222222');
      const illegal142: boolean = PhoneNumberValidator.isValid('14222222222');
      const illegal143: boolean = PhoneNumberValidator.isValid('14322222222');
      expect(actual).assertTrue();
      expect(trap141).assertTrue();
      expect(illegal142).assertFalse();
      expect(illegal143).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020013 end');
    });

    /**
     * @tc.name   testPhoneReal020014
     * @tc.number SUB_Contact_PHONER_0064
     * @tc.desc   14x 段：146 加 8 位尾号 14633333333 命中 14[01456879]，应为 true；141 因字符类含 1 同样命中应为 true；142/143 同尾号不在字符类内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020014 begin');
      const actual: boolean = PhoneNumberValidator.isValid('14633333333');
      const trap141: boolean = PhoneNumberValidator.isValid('14133333333');
      const illegal142: boolean = PhoneNumberValidator.isValid('14233333333');
      const illegal143: boolean = PhoneNumberValidator.isValid('14333333333');
      expect(actual).assertTrue();
      expect(trap141).assertTrue();
      expect(illegal142).assertFalse();
      expect(illegal143).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020014 end');
    });

    /**
     * @tc.name   testPhoneReal020015
     * @tc.number SUB_Contact_PHONER_0065
     * @tc.desc   14x 段：147 加 8 位尾号 14744444444 命中 14[01456879]，应为 true；141 因字符类含 1 同样命中应为 true；142/143 同尾号不在字符类内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020015 begin');
      const actual: boolean = PhoneNumberValidator.isValid('14744444444');
      const trap141: boolean = PhoneNumberValidator.isValid('14144444444');
      const illegal142: boolean = PhoneNumberValidator.isValid('14244444444');
      const illegal143: boolean = PhoneNumberValidator.isValid('14344444444');
      expect(actual).assertTrue();
      expect(trap141).assertTrue();
      expect(illegal142).assertFalse();
      expect(illegal143).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020015 end');
    });

    /**
     * @tc.name   testPhoneReal020016
     * @tc.number SUB_Contact_PHONER_0066
     * @tc.desc   15x 段：150 加 8 位尾号 15011111111 命中 15[0-35-9]，规则应为 true；154 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020016 begin');
      const actual: boolean = PhoneNumberValidator.isValid('15011111111');
      const illegal154: boolean = PhoneNumberValidator.isValid('15411111111');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1501111111');
      expect(actual).assertTrue();
      expect(illegal154).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020016 end');
    });

    /**
     * @tc.name   testPhoneReal020017
     * @tc.number SUB_Contact_PHONER_0067
     * @tc.desc   15x 段：151 加 8 位尾号 15122222222 命中 15[0-35-9]，规则应为 true；154 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020017 begin');
      const actual: boolean = PhoneNumberValidator.isValid('15122222222');
      const illegal154: boolean = PhoneNumberValidator.isValid('15422222222');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1512222222');
      expect(actual).assertTrue();
      expect(illegal154).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020017 end');
    });

    /**
     * @tc.name   testPhoneReal020018
     * @tc.number SUB_Contact_PHONER_0068
     * @tc.desc   15x 段：152 加 8 位尾号 15233333333 命中 15[0-35-9]，规则应为 true；154 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020018 begin');
      const actual: boolean = PhoneNumberValidator.isValid('15233333333');
      const illegal154: boolean = PhoneNumberValidator.isValid('15433333333');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1523333333');
      expect(actual).assertTrue();
      expect(illegal154).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020018 end');
    });

    /**
     * @tc.name   testPhoneReal020019
     * @tc.number SUB_Contact_PHONER_0069
     * @tc.desc   15x 段：153 加 8 位尾号 15344444444 命中 15[0-35-9]，规则应为 true；154 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020019 begin');
      const actual: boolean = PhoneNumberValidator.isValid('15344444444');
      const illegal154: boolean = PhoneNumberValidator.isValid('15444444444');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1534444444');
      expect(actual).assertTrue();
      expect(illegal154).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020019 end');
    });

    /**
     * @tc.name   testPhoneReal020020
     * @tc.number SUB_Contact_PHONER_0070
     * @tc.desc   15x 段：155 加 8 位尾号 15555555555 命中 15[0-35-9]，规则应为 true；154 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020020 begin');
      const actual: boolean = PhoneNumberValidator.isValid('15555555555');
      const illegal154: boolean = PhoneNumberValidator.isValid('15455555555');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1555555555');
      expect(actual).assertTrue();
      expect(illegal154).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020020 end');
    });

    /**
     * @tc.name   testPhoneReal020021
     * @tc.number SUB_Contact_PHONER_0071
     * @tc.desc   16x 段：162 加 8 位尾号 16212345678 命中 16[2567]，规则应为 true；160/161 同尾号不在号段内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020021 begin');
      const actual: boolean = PhoneNumberValidator.isValid('16212345678');
      const illegal160: boolean = PhoneNumberValidator.isValid('16012345678');
      const illegal161: boolean = PhoneNumberValidator.isValid('16112345678');
      expect(actual).assertTrue();
      expect(illegal160).assertFalse();
      expect(illegal161).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020021 end');
    });

    /**
     * @tc.name   testPhoneReal020022
     * @tc.number SUB_Contact_PHONER_0072
     * @tc.desc   16x 段：165 加 8 位尾号 16512345678 命中 16[2567]，规则应为 true；163/164 同尾号不在号段内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020022 begin');
      const actual: boolean = PhoneNumberValidator.isValid('16512345678');
      const illegal163: boolean = PhoneNumberValidator.isValid('16312345678');
      const illegal164: boolean = PhoneNumberValidator.isValid('16412345678');
      expect(actual).assertTrue();
      expect(illegal163).assertFalse();
      expect(illegal164).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020022 end');
    });

    /**
     * @tc.name   testPhoneReal020023
     * @tc.number SUB_Contact_PHONER_0073
     * @tc.desc   16x 段：166 加 8 位尾号 16612345678 命中 16[2567]，规则应为 true；168/169 同尾号不在号段内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020023 begin');
      const actual: boolean = PhoneNumberValidator.isValid('16612345678');
      const illegal168: boolean = PhoneNumberValidator.isValid('16812345678');
      const illegal169: boolean = PhoneNumberValidator.isValid('16912345678');
      expect(actual).assertTrue();
      expect(illegal168).assertFalse();
      expect(illegal169).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020023 end');
    });

    /**
     * @tc.name   testPhoneReal020024
     * @tc.number SUB_Contact_PHONER_0074
     * @tc.desc   16x 段：167 加 8 位尾号 16787654321 命中 16[2567]，规则应为 true；160/161 同尾号不在号段内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020024 begin');
      const actual: boolean = PhoneNumberValidator.isValid('16787654321');
      const illegal160: boolean = PhoneNumberValidator.isValid('16087654321');
      const illegal161: boolean = PhoneNumberValidator.isValid('16187654321');
      expect(actual).assertTrue();
      expect(illegal160).assertFalse();
      expect(illegal161).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020024 end');
    });

    /**
     * @tc.name   testPhoneReal020025
     * @tc.number SUB_Contact_PHONER_0075
     * @tc.desc   16x 段：165 加 8 位尾号 16598765432 命中 16[2567]，规则应为 true；163/164 同尾号不在号段内为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020025 begin');
      const actual: boolean = PhoneNumberValidator.isValid('16598765432');
      const illegal163: boolean = PhoneNumberValidator.isValid('16398765432');
      const illegal164: boolean = PhoneNumberValidator.isValid('16498765432');
      expect(actual).assertTrue();
      expect(illegal163).assertFalse();
      expect(illegal164).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020025 end');
    });

    /**
     * @tc.name   testPhoneReal020026
     * @tc.number SUB_Contact_PHONER_0076
     * @tc.desc   17x 段：170 加 8 位尾号 17012345678 命中 17[0-8]，规则应为 true；179 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020026 begin');
      const actual: boolean = PhoneNumberValidator.isValid('17012345678');
      const illegal179: boolean = PhoneNumberValidator.isValid('17912345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1701234567');
      expect(actual).assertTrue();
      expect(illegal179).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020026 end');
    });

    /**
     * @tc.name   testPhoneReal020027
     * @tc.number SUB_Contact_PHONER_0077
     * @tc.desc   17x 段：171 加 8 位尾号 17111111111 命中 17[0-8]，规则应为 true；179 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020027 begin');
      const actual: boolean = PhoneNumberValidator.isValid('17111111111');
      const illegal179: boolean = PhoneNumberValidator.isValid('17911111111');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1711111111');
      expect(actual).assertTrue();
      expect(illegal179).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020027 end');
    });

    /**
     * @tc.name   testPhoneReal020028
     * @tc.number SUB_Contact_PHONER_0078
     * @tc.desc   17x 段：172 加 8 位尾号 17222222222 命中 17[0-8]，规则应为 true；179 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020028 begin');
      const actual: boolean = PhoneNumberValidator.isValid('17222222222');
      const illegal179: boolean = PhoneNumberValidator.isValid('17922222222');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1722222222');
      expect(actual).assertTrue();
      expect(illegal179).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020028 end');
    });

    /**
     * @tc.name   testPhoneReal020029
     * @tc.number SUB_Contact_PHONER_0079
     * @tc.desc   17x 段：173 加 8 位尾号 17333333333 命中 17[0-8]，规则应为 true；179 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020029 begin');
      const actual: boolean = PhoneNumberValidator.isValid('17333333333');
      const illegal179: boolean = PhoneNumberValidator.isValid('17933333333');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1733333333');
      expect(actual).assertTrue();
      expect(illegal179).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020029 end');
    });

    /**
     * @tc.name   testPhoneReal020030
     * @tc.number SUB_Contact_PHONER_0080
     * @tc.desc   17x 段：174 加 8 位尾号 17444444444 命中 17[0-8]，规则应为 true；179 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020030 begin');
      const actual: boolean = PhoneNumberValidator.isValid('17444444444');
      const illegal179: boolean = PhoneNumberValidator.isValid('17944444444');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1744444444');
      expect(actual).assertTrue();
      expect(illegal179).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020030 end');
    });

    /**
     * @tc.name   testPhoneReal020031
     * @tc.number SUB_Contact_PHONER_0081
     * @tc.desc   18x 段：180 加 8 位尾号 18012345678 命中 18[0-9]，规则应为 true；10x 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020031 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18012345678');
      const illegal10x: boolean = PhoneNumberValidator.isValid('10012345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1801234567');
      expect(actual).assertTrue();
      expect(illegal10x).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020031 end');
    });

    /**
     * @tc.name   testPhoneReal020032
     * @tc.number SUB_Contact_PHONER_0082
     * @tc.desc   18x 段：181 加 8 位尾号 18112345678 命中 18[0-9]，规则应为 true；10x 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020032 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18112345678');
      const illegal10x: boolean = PhoneNumberValidator.isValid('10112345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1811234567');
      expect(actual).assertTrue();
      expect(illegal10x).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020032 end');
    });

    /**
     * @tc.name   testPhoneReal020033
     * @tc.number SUB_Contact_PHONER_0083
     * @tc.desc   18x 段：182 加 8 位尾号 18212345678 命中 18[0-9]，规则应为 true；10x 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020033 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18212345678');
      const illegal10x: boolean = PhoneNumberValidator.isValid('10212345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1821234567');
      expect(actual).assertTrue();
      expect(illegal10x).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020033 end');
    });

    /**
     * @tc.name   testPhoneReal020034
     * @tc.number SUB_Contact_PHONER_0084
     * @tc.desc   18x 段：183 加 8 位尾号 18312345678 命中 18[0-9]，规则应为 true；10x 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020034 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18312345678');
      const illegal10x: boolean = PhoneNumberValidator.isValid('10312345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1831234567');
      expect(actual).assertTrue();
      expect(illegal10x).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020034 end');
    });

    /**
     * @tc.name   testPhoneReal020035
     * @tc.number SUB_Contact_PHONER_0085
     * @tc.desc   18x 段：184 加 8 位尾号 18412345678 命中 18[0-9]，规则应为 true；10x 同尾号不在号段内为 false，7 位尾号为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020035 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18412345678');
      const illegal10x: boolean = PhoneNumberValidator.isValid('10412345678');
      const sevenTail: boolean = PhoneNumberValidator.isValid('1841234567');
      expect(actual).assertTrue();
      expect(illegal10x).assertFalse();
      expect(sevenTail).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020035 end');
    });

    /**
     * @tc.name   testPhoneReal020036
     * @tc.number SUB_Contact_PHONER_0086
     * @tc.desc   19x 段：190 加 8 位尾号 19011111111 命中 19[0-35-9]，规则应为 true；194 同尾号与 200 同尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020036 begin');
      const actual: boolean = PhoneNumberValidator.isValid('19011111111');
      const illegal194: boolean = PhoneNumberValidator.isValid('19411111111');
      const illegal200: boolean = PhoneNumberValidator.isValid('20011111111');
      expect(actual).assertTrue();
      expect(illegal194).assertFalse();
      expect(illegal200).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020036 end');
    });

    /**
     * @tc.name   testPhoneReal020037
     * @tc.number SUB_Contact_PHONER_0087
     * @tc.desc   19x 段：191 加 8 位尾号 19122222222 命中 19[0-35-9]，规则应为 true；194 同尾号与 200 同尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020037 begin');
      const actual: boolean = PhoneNumberValidator.isValid('19122222222');
      const illegal194: boolean = PhoneNumberValidator.isValid('19422222222');
      const illegal200: boolean = PhoneNumberValidator.isValid('20022222222');
      expect(actual).assertTrue();
      expect(illegal194).assertFalse();
      expect(illegal200).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020037 end');
    });

    /**
     * @tc.name   testPhoneReal020038
     * @tc.number SUB_Contact_PHONER_0088
     * @tc.desc   19x 段：192 加 8 位尾号 19233333333 命中 19[0-35-9]，规则应为 true；194 同尾号与 200 同尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020038 begin');
      const actual: boolean = PhoneNumberValidator.isValid('19233333333');
      const illegal194: boolean = PhoneNumberValidator.isValid('19433333333');
      const illegal200: boolean = PhoneNumberValidator.isValid('20033333333');
      expect(actual).assertTrue();
      expect(illegal194).assertFalse();
      expect(illegal200).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020038 end');
    });

    /**
     * @tc.name   testPhoneReal020039
     * @tc.number SUB_Contact_PHONER_0089
     * @tc.desc   19x 段：193 加 8 位尾号 19344444444 命中 19[0-35-9]，规则应为 true；194 同尾号与 200 同尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020039 begin');
      const actual: boolean = PhoneNumberValidator.isValid('19344444444');
      const illegal194: boolean = PhoneNumberValidator.isValid('19444444444');
      const illegal200: boolean = PhoneNumberValidator.isValid('20044444444');
      expect(actual).assertTrue();
      expect(illegal194).assertFalse();
      expect(illegal200).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020039 end');
    });

    /**
     * @tc.name   testPhoneReal020040
     * @tc.number SUB_Contact_PHONER_0090
     * @tc.desc   19x 段：195 加 8 位尾号 19555555555 命中 19[0-35-9]，规则应为 true；194 同尾号与 200 同尾号均为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020040 begin');
      const actual: boolean = PhoneNumberValidator.isValid('19555555555');
      const illegal194: boolean = PhoneNumberValidator.isValid('19455555555');
      const illegal200: boolean = PhoneNumberValidator.isValid('20055555555');
      expect(actual).assertTrue();
      expect(illegal194).assertFalse();
      expect(illegal200).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020040 end');
    });

    /**
     * @tc.name   testPhoneReal020041
     * @tc.number SUB_Contact_PHONER_0091
     * @tc.desc   全数字非法号段抽样：100 加 8 位尾号不在任何号段，规则应为 false；130 同尾号为 true 对照，空串为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020041 begin');
      const illegal: boolean = PhoneNumberValidator.isValid('10012345678');
      const legal: boolean = PhoneNumberValidator.isValid('13012345678');
      const empty: boolean = PhoneNumberValidator.isValid('');
      expect(illegal).assertFalse();
      expect(legal).assertTrue();
      expect(empty).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020041 end');
    });

    /**
     * @tc.name   testPhoneReal020042
     * @tc.number SUB_Contact_PHONER_0092
     * @tc.desc   全数字非法号段抽样：110 加 8 位尾号不在任何号段，规则应为 false；138 同尾号为 true 对照，空串为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020042 begin');
      const illegal: boolean = PhoneNumberValidator.isValid('11012345678');
      const legal: boolean = PhoneNumberValidator.isValid('13812345678');
      const empty: boolean = PhoneNumberValidator.isValid('');
      expect(illegal).assertFalse();
      expect(legal).assertTrue();
      expect(empty).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020042 end');
    });

    /**
     * @tc.name   testPhoneReal020043
     * @tc.number SUB_Contact_PHONER_0093
     * @tc.desc   全数字非法号段抽样：120 加 8 位尾号不在任何号段，规则应为 false；131 同尾号为 true 对照，空串为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020043 begin');
      const illegal: boolean = PhoneNumberValidator.isValid('12012345678');
      const legal: boolean = PhoneNumberValidator.isValid('13112345678');
      const empty: boolean = PhoneNumberValidator.isValid('');
      expect(illegal).assertFalse();
      expect(legal).assertTrue();
      expect(empty).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020043 end');
    });

    /**
     * @tc.name   testPhoneReal020044
     * @tc.number SUB_Contact_PHONER_0094
     * @tc.desc   全数字非法号段抽样：129 加 8 位尾号不在任何号段，规则应为 false；132 同尾号为 true 对照，空串为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020044 begin');
      const illegal: boolean = PhoneNumberValidator.isValid('12912345678');
      const legal: boolean = PhoneNumberValidator.isValid('13212345678');
      const empty: boolean = PhoneNumberValidator.isValid('');
      expect(illegal).assertFalse();
      expect(legal).assertTrue();
      expect(empty).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020044 end');
    });

    /**
     * @tc.name   testPhoneReal020045
     * @tc.number SUB_Contact_PHONER_0095
     * @tc.desc   全数字非法号段抽样：142 加 8 位尾号不在 14[01456879] 字符类内，规则应为 false；133 同尾号为 true 对照，空串为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020045 begin');
      const illegal: boolean = PhoneNumberValidator.isValid('14212345678');
      const legal: boolean = PhoneNumberValidator.isValid('13312345678');
      const empty: boolean = PhoneNumberValidator.isValid('');
      expect(illegal).assertFalse();
      expect(legal).assertTrue();
      expect(empty).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020045 end');
    });

    /**
     * @tc.name   testPhoneReal020046
     * @tc.number SUB_Contact_PHONER_0096
     * @tc.desc   表基线 v1：号码 13800138000 前缀 138 加 8 位尾号，规则应为 true；该行长度为 11 位常量；相邻变体 12800138000 为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020046 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13800138000');
      const variant: boolean = PhoneNumberValidator.isValid('12800138000');
      const length: number = '13800138000'.length;
      expect(actual).assertTrue();
      expect(variant).assertFalse();
      expect(length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020046 end');
    });

    /**
     * @tc.name   testPhoneReal020047
     * @tc.number SUB_Contact_PHONER_0097
     * @tc.desc   表基线 v1：客服短号 10086 总长 5 位不满足 8 位尾号，规则应为 false；该行长度为 5 位常量；扩展变体 1008612345 前缀仍非法为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020047 begin');
      const actual: boolean = PhoneNumberValidator.isValid('10086');
      const variant: boolean = PhoneNumberValidator.isValid('1008612345');
      const length: number = '10086'.length;
      expect(actual).assertFalse();
      expect(variant).assertFalse();
      expect(length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020047 end');
    });

    /**
     * @tc.name   testPhoneReal020048
     * @tc.number SUB_Contact_PHONER_0098
     * @tc.desc   表基线 v1：号码 13000000000 前缀 130 加 8 位尾号，规则应为 true；该行长度为 11 位常量；相邻变体 1300000000 为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020048 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13000000000');
      const variant: boolean = PhoneNumberValidator.isValid('1300000000');
      const length: number = '13000000000'.length;
      expect(actual).assertTrue();
      expect(variant).assertFalse();
      expect(length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020048 end');
    });

    /**
     * @tc.name   testPhoneReal020049
     * @tc.number SUB_Contact_PHONER_0099
     * @tc.desc   表基线 v1：号码 12345678901 虽为 11 位但前缀 123 不在任何号段，规则应为 false；该行长度为 11 位常量；相邻变体 1234567890 为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020049 begin');
      const actual: boolean = PhoneNumberValidator.isValid('12345678901');
      const variant: boolean = PhoneNumberValidator.isValid('1234567890');
      const length: number = '12345678901'.length;
      expect(actual).assertFalse();
      expect(variant).assertFalse();
      expect(length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020049 end');
    });

    /**
     * @tc.name   testPhoneReal020050
     * @tc.number SUB_Contact_PHONER_0100
     * @tc.desc   表基线 v1：号码 19912345678 前缀 199 加 8 位尾号，规则应为 true；该行长度为 11 位常量；相邻变体 19412345678 为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneReal020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020050 begin');
      const actual: boolean = PhoneNumberValidator.isValid('19912345678');
      const variant: boolean = PhoneNumberValidator.isValid('19412345678');
      const length: number = '19912345678'.length;
      expect(actual).assertTrue();
      expect(variant).assertFalse();
      expect(length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneReal020050 end');
    });
  });
}
