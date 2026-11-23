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

export default function phoneVolume09Test() {
  describe('PhoneVolume09Test', () => {

    /**
     * @tc.name   testPhoneVolume09Anchor01
     * @tc.number SUB_Contact_PHONEV_0609
     * @tc.desc   全段覆盖锚点：13012345678 为真，200 前缀与 10 位短号均拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume09Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume09Anchor01 begin');
      const actual: boolean = PhoneNumberValidator.isValid('13012345678');
      const negative: boolean = PhoneNumberValidator.isValid('12' + '012345678');
      const boundary: boolean = PhoneNumberValidator.isValid('1301234567');
      expect(actual).assertTrue();
      expect(negative).assertFalse();
      expect(boundary).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume09Anchor01 end');
    });
    /**
     * @tc.name   testPhoneVolume090610
     * @tc.number SUB_Contact_PHONEV_0610
     * @tc.desc   全段覆盖：合法前缀 130 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090610 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090610 end');
    });

    /**
     * @tc.name   testPhoneVolume090611
     * @tc.number SUB_Contact_PHONEV_0611
     * @tc.desc   全段覆盖：合法前缀 131 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090611 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13112345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090611 end');
    });

    /**
     * @tc.name   testPhoneVolume090612
     * @tc.number SUB_Contact_PHONEV_0612
     * @tc.desc   全段覆盖：合法前缀 132 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090612 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13212345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090612 end');
    });

    /**
     * @tc.name   testPhoneVolume090613
     * @tc.number SUB_Contact_PHONEV_0613
     * @tc.desc   全段覆盖：合法前缀 133 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090613', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090613 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13312345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090613 end');
    });

    /**
     * @tc.name   testPhoneVolume090614
     * @tc.number SUB_Contact_PHONEV_0614
     * @tc.desc   全段覆盖：合法前缀 134 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090614', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090614 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13412345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090614 end');
    });

    /**
     * @tc.name   testPhoneVolume090615
     * @tc.number SUB_Contact_PHONEV_0615
     * @tc.desc   全段覆盖：合法前缀 135 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090615 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13512345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090615 end');
    });

    /**
     * @tc.name   testPhoneVolume090616
     * @tc.number SUB_Contact_PHONEV_0616
     * @tc.desc   全段覆盖：合法前缀 136 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090616', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090616 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13612345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090616 end');
    });

    /**
     * @tc.name   testPhoneVolume090617
     * @tc.number SUB_Contact_PHONEV_0617
     * @tc.desc   全段覆盖：合法前缀 137 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090617', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090617 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13712345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090617 end');
    });

    /**
     * @tc.name   testPhoneVolume090618
     * @tc.number SUB_Contact_PHONEV_0618
     * @tc.desc   全段覆盖：合法前缀 138 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090618', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090618 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13812345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090618 end');
    });

    /**
     * @tc.name   testPhoneVolume090619
     * @tc.number SUB_Contact_PHONEV_0619
     * @tc.desc   全段覆盖：合法前缀 139 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090619', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090619 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('13912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090619 end');
    });

    /**
     * @tc.name   testPhoneVolume090620
     * @tc.number SUB_Contact_PHONEV_0620
     * @tc.desc   全段覆盖：合法前缀 140 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090620 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090620 end');
    });

    /**
     * @tc.name   testPhoneVolume090621
     * @tc.number SUB_Contact_PHONEV_0621
     * @tc.desc   全段覆盖：合法前缀 141 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090621', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090621 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14112345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090621 end');
    });

    /**
     * @tc.name   testPhoneVolume090622
     * @tc.number SUB_Contact_PHONEV_0622
     * @tc.desc   全段覆盖：合法前缀 144 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090622', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090622 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14412345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090622 end');
    });

    /**
     * @tc.name   testPhoneVolume090623
     * @tc.number SUB_Contact_PHONEV_0623
     * @tc.desc   全段覆盖：合法前缀 145 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090623', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090623 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14512345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090623 end');
    });

    /**
     * @tc.name   testPhoneVolume090624
     * @tc.number SUB_Contact_PHONEV_0624
     * @tc.desc   全段覆盖：合法前缀 146 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090624', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090624 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14612345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090624 end');
    });

    /**
     * @tc.name   testPhoneVolume090625
     * @tc.number SUB_Contact_PHONEV_0625
     * @tc.desc   全段覆盖：合法前缀 147 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090625', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090625 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14712345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090625 end');
    });

    /**
     * @tc.name   testPhoneVolume090626
     * @tc.number SUB_Contact_PHONEV_0626
     * @tc.desc   全段覆盖：合法前缀 148 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090626', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090626 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14812345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090626 end');
    });

    /**
     * @tc.name   testPhoneVolume090627
     * @tc.number SUB_Contact_PHONEV_0627
     * @tc.desc   全段覆盖：合法前缀 149 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090627', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090627 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('14912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090627 end');
    });

    /**
     * @tc.name   testPhoneVolume090628
     * @tc.number SUB_Contact_PHONEV_0628
     * @tc.desc   全段覆盖：合法前缀 150 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090628', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090628 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090628 end');
    });

    /**
     * @tc.name   testPhoneVolume090629
     * @tc.number SUB_Contact_PHONEV_0629
     * @tc.desc   全段覆盖：合法前缀 151 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090629', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090629 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15112345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090629 end');
    });

    /**
     * @tc.name   testPhoneVolume090630
     * @tc.number SUB_Contact_PHONEV_0630
     * @tc.desc   全段覆盖：合法前缀 152 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090630 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15212345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090630 end');
    });

    /**
     * @tc.name   testPhoneVolume090631
     * @tc.number SUB_Contact_PHONEV_0631
     * @tc.desc   全段覆盖：合法前缀 153 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090631', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090631 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15312345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090631 end');
    });

    /**
     * @tc.name   testPhoneVolume090632
     * @tc.number SUB_Contact_PHONEV_0632
     * @tc.desc   全段覆盖：合法前缀 155 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090632', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090632 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15512345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090632 end');
    });

    /**
     * @tc.name   testPhoneVolume090633
     * @tc.number SUB_Contact_PHONEV_0633
     * @tc.desc   全段覆盖：合法前缀 156 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090633', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090633 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15612345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090633 end');
    });

    /**
     * @tc.name   testPhoneVolume090634
     * @tc.number SUB_Contact_PHONEV_0634
     * @tc.desc   全段覆盖：合法前缀 157 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090634', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090634 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15712345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090634 end');
    });

    /**
     * @tc.name   testPhoneVolume090635
     * @tc.number SUB_Contact_PHONEV_0635
     * @tc.desc   全段覆盖：合法前缀 158 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090635', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090635 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15812345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090635 end');
    });

    /**
     * @tc.name   testPhoneVolume090636
     * @tc.number SUB_Contact_PHONEV_0636
     * @tc.desc   全段覆盖：合法前缀 159 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090636', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090636 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('15912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090636 end');
    });

    /**
     * @tc.name   testPhoneVolume090637
     * @tc.number SUB_Contact_PHONEV_0637
     * @tc.desc   全段覆盖：合法前缀 162 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090637', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090637 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('16212345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090637 end');
    });

    /**
     * @tc.name   testPhoneVolume090638
     * @tc.number SUB_Contact_PHONEV_0638
     * @tc.desc   全段覆盖：合法前缀 165 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090638', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090638 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('16512345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090638 end');
    });

    /**
     * @tc.name   testPhoneVolume090639
     * @tc.number SUB_Contact_PHONEV_0639
     * @tc.desc   全段覆盖：合法前缀 166 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090639', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090639 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('16612345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090639 end');
    });

    /**
     * @tc.name   testPhoneVolume090640
     * @tc.number SUB_Contact_PHONEV_0640
     * @tc.desc   全段覆盖：合法前缀 167 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090640 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('16712345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090640 end');
    });

    /**
     * @tc.name   testPhoneVolume090641
     * @tc.number SUB_Contact_PHONEV_0641
     * @tc.desc   全段覆盖：合法前缀 170 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090641', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090641 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090641 end');
    });

    /**
     * @tc.name   testPhoneVolume090642
     * @tc.number SUB_Contact_PHONEV_0642
     * @tc.desc   全段覆盖：合法前缀 171 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090642', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090642 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17112345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090642 end');
    });

    /**
     * @tc.name   testPhoneVolume090643
     * @tc.number SUB_Contact_PHONEV_0643
     * @tc.desc   全段覆盖：合法前缀 172 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090643', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090643 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17212345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090643 end');
    });

    /**
     * @tc.name   testPhoneVolume090644
     * @tc.number SUB_Contact_PHONEV_0644
     * @tc.desc   全段覆盖：合法前缀 173 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090644', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090644 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17312345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090644 end');
    });

    /**
     * @tc.name   testPhoneVolume090645
     * @tc.number SUB_Contact_PHONEV_0645
     * @tc.desc   全段覆盖：合法前缀 174 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090645 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17412345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090645 end');
    });

    /**
     * @tc.name   testPhoneVolume090646
     * @tc.number SUB_Contact_PHONEV_0646
     * @tc.desc   全段覆盖：合法前缀 175 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090646', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090646 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17512345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090646 end');
    });

    /**
     * @tc.name   testPhoneVolume090647
     * @tc.number SUB_Contact_PHONEV_0647
     * @tc.desc   全段覆盖：合法前缀 176 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090647', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090647 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17612345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090647 end');
    });

    /**
     * @tc.name   testPhoneVolume090648
     * @tc.number SUB_Contact_PHONEV_0648
     * @tc.desc   全段覆盖：合法前缀 177 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090648 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17712345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090648 end');
    });

    /**
     * @tc.name   testPhoneVolume090649
     * @tc.number SUB_Contact_PHONEV_0649
     * @tc.desc   全段覆盖：合法前缀 178 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090649', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090649 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('17812345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090649 end');
    });

    /**
     * @tc.name   testPhoneVolume090650
     * @tc.number SUB_Contact_PHONEV_0650
     * @tc.desc   全段覆盖：合法前缀 180 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090650 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090650 end');
    });

    /**
     * @tc.name   testPhoneVolume090651
     * @tc.number SUB_Contact_PHONEV_0651
     * @tc.desc   全段覆盖：合法前缀 181 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090651', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090651 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18112345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090651 end');
    });

    /**
     * @tc.name   testPhoneVolume090652
     * @tc.number SUB_Contact_PHONEV_0652
     * @tc.desc   全段覆盖：合法前缀 182 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090652', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090652 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18212345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090652 end');
    });

    /**
     * @tc.name   testPhoneVolume090653
     * @tc.number SUB_Contact_PHONEV_0653
     * @tc.desc   全段覆盖：合法前缀 183 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090653', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090653 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18312345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090653 end');
    });

    /**
     * @tc.name   testPhoneVolume090654
     * @tc.number SUB_Contact_PHONEV_0654
     * @tc.desc   全段覆盖：合法前缀 184 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090654', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090654 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18412345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090654 end');
    });

    /**
     * @tc.name   testPhoneVolume090655
     * @tc.number SUB_Contact_PHONEV_0655
     * @tc.desc   全段覆盖：合法前缀 185 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090655', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090655 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18512345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090655 end');
    });

    /**
     * @tc.name   testPhoneVolume090656
     * @tc.number SUB_Contact_PHONEV_0656
     * @tc.desc   全段覆盖：合法前缀 186 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090656', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090656 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18612345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090656 end');
    });

    /**
     * @tc.name   testPhoneVolume090657
     * @tc.number SUB_Contact_PHONEV_0657
     * @tc.desc   全段覆盖：合法前缀 187 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090657', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090657 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18712345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090657 end');
    });

    /**
     * @tc.name   testPhoneVolume090658
     * @tc.number SUB_Contact_PHONEV_0658
     * @tc.desc   全段覆盖：合法前缀 188 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090658', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090658 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18812345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090658 end');
    });

    /**
     * @tc.name   testPhoneVolume090659
     * @tc.number SUB_Contact_PHONEV_0659
     * @tc.desc   全段覆盖：合法前缀 189 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090659', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090659 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('18912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090659 end');
    });

    /**
     * @tc.name   testPhoneVolume090660
     * @tc.number SUB_Contact_PHONEV_0660
     * @tc.desc   全段覆盖：合法前缀 190 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090660 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090660 end');
    });

    /**
     * @tc.name   testPhoneVolume090661
     * @tc.number SUB_Contact_PHONEV_0661
     * @tc.desc   全段覆盖：合法前缀 191 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090661', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090661 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19112345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090661 end');
    });

    /**
     * @tc.name   testPhoneVolume090662
     * @tc.number SUB_Contact_PHONEV_0662
     * @tc.desc   全段覆盖：合法前缀 192 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090662', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090662 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19212345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090662 end');
    });

    /**
     * @tc.name   testPhoneVolume090663
     * @tc.number SUB_Contact_PHONEV_0663
     * @tc.desc   全段覆盖：合法前缀 193 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090663', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090663 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19312345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090663 end');
    });

    /**
     * @tc.name   testPhoneVolume090664
     * @tc.number SUB_Contact_PHONEV_0664
     * @tc.desc   全段覆盖：合法前缀 195 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090664', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090664 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19512345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090664 end');
    });

    /**
     * @tc.name   testPhoneVolume090665
     * @tc.number SUB_Contact_PHONEV_0665
     * @tc.desc   全段覆盖：合法前缀 196 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090665 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19612345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090665 end');
    });

    /**
     * @tc.name   testPhoneVolume090666
     * @tc.number SUB_Contact_PHONEV_0666
     * @tc.desc   全段覆盖：合法前缀 197 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090666', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090666 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19712345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090666 end');
    });

    /**
     * @tc.name   testPhoneVolume090667
     * @tc.number SUB_Contact_PHONEV_0667
     * @tc.desc   全段覆盖：合法前缀 198 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090667', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090667 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19812345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090667 end');
    });

    /**
     * @tc.name   testPhoneVolume090668
     * @tc.number SUB_Contact_PHONEV_0668
     * @tc.desc   全段覆盖：合法前缀 199 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090668', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090668 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1212345678');
      const result: boolean = PhoneNumberValidator.isValid('19912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090668 end');
    });

    /**
     * @tc.name   testPhoneVolume090669
     * @tc.number SUB_Contact_PHONEV_0669
     * @tc.desc   段边缘：非法前缀 129 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090669', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090669 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('12912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090669 end');
    });

    /**
     * @tc.name   testPhoneVolume090670
     * @tc.number SUB_Contact_PHONEV_0670
     * @tc.desc   段边缘：非法前缀 142 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090670 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('14212345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090670 end');
    });

    /**
     * @tc.name   testPhoneVolume090671
     * @tc.number SUB_Contact_PHONEV_0671
     * @tc.desc   段边缘：非法前缀 143 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090671', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090671 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('14312345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090671 end');
    });

    /**
     * @tc.name   testPhoneVolume090672
     * @tc.number SUB_Contact_PHONEV_0672
     * @tc.desc   段边缘：非法前缀 154 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090672', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090672 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('15412345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090672 end');
    });

    /**
     * @tc.name   testPhoneVolume090673
     * @tc.number SUB_Contact_PHONEV_0673
     * @tc.desc   段边缘：非法前缀 160 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090673', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090673 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('16012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090673 end');
    });

    /**
     * @tc.name   testPhoneVolume090674
     * @tc.number SUB_Contact_PHONEV_0674
     * @tc.desc   段边缘：非法前缀 161 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090674', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090674 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('16112345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090674 end');
    });

    /**
     * @tc.name   testPhoneVolume090675
     * @tc.number SUB_Contact_PHONEV_0675
     * @tc.desc   段边缘：非法前缀 163 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090675', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090675 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('16312345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090675 end');
    });

    /**
     * @tc.name   testPhoneVolume090676
     * @tc.number SUB_Contact_PHONEV_0676
     * @tc.desc   段边缘：非法前缀 164 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090676', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090676 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('16412345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090676 end');
    });

    /**
     * @tc.name   testPhoneVolume090677
     * @tc.number SUB_Contact_PHONEV_0677
     * @tc.desc   段边缘：非法前缀 168 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090677', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090677 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('16812345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090677 end');
    });

    /**
     * @tc.name   testPhoneVolume090678
     * @tc.number SUB_Contact_PHONEV_0678
     * @tc.desc   段边缘：非法前缀 169 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090678', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090678 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('16912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090678 end');
    });

    /**
     * @tc.name   testPhoneVolume090679
     * @tc.number SUB_Contact_PHONEV_0679
     * @tc.desc   段边缘：非法前缀 179 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090679', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090679 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('17912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090679 end');
    });

    /**
     * @tc.name   testPhoneVolume090680
     * @tc.number SUB_Contact_PHONEV_0680
     * @tc.desc   段边缘：非法前缀 194 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090680 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('19412345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090680 end');
    });

    /**
     * @tc.name   testPhoneVolume090681
     * @tc.number SUB_Contact_PHONEV_0681
     * @tc.desc   段边缘：非法前缀 200 + 尾号 12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090681', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090681 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('20012345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090681 end');
    });

    /**
     * @tc.name   testPhoneVolume090682
     * @tc.number SUB_Contact_PHONEV_0682
     * @tc.desc   边界：130 前缀 + 7 位尾号（10 位）低于尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090682', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090682 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('1301234567');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090682 end');
    });

    /**
     * @tc.name   testPhoneVolume090683
     * @tc.number SUB_Contact_PHONEV_0683
     * @tc.desc   边界：199 为最大合法前缀，200 为最小非法对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090683', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090683 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('20012345678');
      const result: boolean = PhoneNumberValidator.isValid('19912345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090683 end');
    });

    /**
     * @tc.name   testPhoneVolume090684
     * @tc.number SUB_Contact_PHONEV_0684
     * @tc.desc   非法：前缀后混入字母 a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume090684', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090684 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('13012345678');
      const result: boolean = PhoneNumberValidator.isValid('13a12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume090684 end');
    });

  });
}
