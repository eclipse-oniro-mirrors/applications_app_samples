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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BasicUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_BasicUtil]';

export default function basicUtilLogicTest() {
  describe('BasicUtilLogicTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilLogicTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilLogicTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASIC_0100
     * @tc.name      testStringChecks0001
     * @tc.desc      Verify the string check helpers report missing, empty, blank
     *               and normal text correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringChecks0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringChecks0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isEmptyString(undefined)).assertTrue();
      expect(BasicUtil.isEmptyString('')).assertTrue();
      expect(BasicUtil.isEmptyString('a')).assertFalse();
      expect(BasicUtil.isBlank(' ')).assertTrue();
      expect(BasicUtil.isBlank('a b')).assertFalse();
      expect(BasicUtil.trimSafe(undefined)).assertEqual('');
      expect(BasicUtil.trimSafe('  x  ')).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASIC_0200
     * @tc.name      testStringTransforms0001
     * @tc.desc      Verify capitalize and reverseString transform text as expected,
     *               including empty input and double reversal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTransforms0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringTransforms0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.capitalize('geofence')).assertEqual('Geofence');
      expect(BasicUtil.capitalize('')).assertEqual('');
      expect(BasicUtil.capitalize('aBc')).assertEqual('ABc');
      expect(BasicUtil.reverseString('abc')).assertEqual('cba');
      expect(BasicUtil.reverseString('')).assertEqual('');
      expect(BasicUtil.reverseString(BasicUtil.reverseString('abc'))).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASIC_0300
     * @tc.name      testCountOccurrences0001
     * @tc.desc      Verify countOccurrences counts non-overlapping matches and
     *               returns zero for empty or absent targets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCountOccurrences0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCountOccurrences0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.countOccurrences('aXbXc', 'X')).assertEqual(2);
      expect(BasicUtil.countOccurrences('aaa', 'aa')).assertEqual(1);
      expect(BasicUtil.countOccurrences('abc', '')).assertEqual(0);
      expect(BasicUtil.countOccurrences('abc', 'z')).assertEqual(0);
      expect(BasicUtil.countOccurrences('', 'a')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASIC_0400
     * @tc.name      testNumberHelpers0001
     * @tc.desc      Verify clamp bounds values into the range, randomInt handles
     *               inverted and single value ranges and stays inside the range,
     *               and isPositiveNumber rejects non positive values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.clamp(5, 1, 10)).assertEqual(5);
      expect(BasicUtil.clamp(-3, 1, 10)).assertEqual(1);
      expect(BasicUtil.clamp(99, 1, 10)).assertEqual(10);
      expect(BasicUtil.clamp(1, 1, 10)).assertEqual(1);
      expect(BasicUtil.randomInt(1, 1)).assertEqual(1);
      expect(BasicUtil.randomInt(5, 3)).assertEqual(3);
      const randomValue: number = BasicUtil.randomInt(1, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'randomInt(1, 100) returned ' + randomValue);
      expect(randomValue >= 1).assertTrue();
      expect(randomValue <= 100).assertTrue();
      expect(BasicUtil.isPositiveNumber(1)).assertTrue();
      expect(BasicUtil.isPositiveNumber(0)).assertFalse();
      expect(BasicUtil.isPositiveNumber(-1)).assertFalse();
      expect(BasicUtil.isPositiveNumber(NaN)).assertFalse();
      expect(BasicUtil.isPositiveNumber(Infinity)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASIC_0500
     * @tc.name      testFormatPercent0001
     * @tc.desc      Verify formatPercent converts ratios into percent text with the
     *               requested fraction digits and the percent suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatPercent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatPercent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const defaultDigits: string = BasicUtil.formatPercent(0.256);
      hilog.info(DOMAIN, TAG, '%{public}s', 'formatPercent(0.256) returned ' + defaultDigits);
      expect(defaultDigits).assertEqual('25.6%');
      expect(BasicUtil.formatPercent(0.5, 2)).assertEqual('50.00%');
      expect(BasicUtil.formatPercent(0)).assertEqual('0.0%');
      expect(BasicUtil.formatPercent(1)).assertEqual('100.0%');
      expect(defaultDigits.endsWith('%')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASIC_0600
     * @tc.name      testValidationHelpers0001
     * @tc.desc      Verify the email, mobile phone and ID card validation helpers
     *               accept valid texts and reject malformed ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isValidEmail('a@b.com')).assertTrue();
      expect(BasicUtil.isValidEmail('bad')).assertFalse();
      expect(BasicUtil.isValidEmail('a@b')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('13800138000')).assertTrue();
      expect(BasicUtil.isValidPhoneCN('12800138000')).assertFalse();
      expect(BasicUtil.isValidPhoneCN('1380013800')).assertFalse();
      expect(BasicUtil.isValidIdCardCN('11010519491231002X')).assertTrue();
      expect(BasicUtil.isValidIdCardCN('11010519491231002x')).assertTrue();
      expect(BasicUtil.isValidIdCardCN('11010519491231002')).assertFalse();
      expect(BasicUtil.isValidIdCardCN('110105194912310021')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASIC_0700
     * @tc.name      testArrayHelpers0001
     * @tc.desc      Verify removeDuplicates keeps the first appearance order,
     *               safeJoin drops blank entries and booleanToFlag maps booleans
     *               onto numeric flags.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const deduplicated: string[] = BasicUtil.removeDuplicates(['a', 'b', 'a', 'c', 'b']);
      hilog.info(DOMAIN, TAG, '%{public}s', 'deduplicated length: ' + deduplicated.length);
      expect(deduplicated.length).assertEqual(3);
      expect(deduplicated[0]).assertEqual('a');
      expect(deduplicated[1]).assertEqual('b');
      expect(deduplicated[2]).assertEqual('c');
      expect(BasicUtil.removeDuplicates([]).length).assertEqual(0);
      expect(BasicUtil.safeJoin(['a', '', 'b'], '-')).assertEqual('a-b');
      expect(BasicUtil.safeJoin(['', '', ''], '-')).assertEqual('');
      expect(BasicUtil.safeJoin(['x'], ',')).assertEqual('x');
      expect(BasicUtil.booleanToFlag(true)).assertEqual(1);
      expect(BasicUtil.booleanToFlag(false)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
