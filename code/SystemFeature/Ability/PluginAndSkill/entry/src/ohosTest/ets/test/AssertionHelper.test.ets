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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { AssertionHelper, AssertionResult, AssertionSummary } from '../../../main/ets/util/AssertionHelper';

export default function assertionHelperTest(): void {
  describe('AssertionHelperTest', (): void => {
    beforeAll(() => { })
    beforeEach(() => { })
    afterEach(() => { })
    afterAll(() => { })

    // ==================== assertEqual (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_0100
     * @tc.name: testAssertEqual0001
     * @tc.desc: Verify assertEqual returns passed when values are equal.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEqual0001', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEqual('hello', 'hello');
      expect(result.passed).assertTrue();
      expect(result.expected).assertEqual('hello');
      expect(result.actual).assertEqual('hello');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_0200
     * @tc.name: testAssertEqual0002
     * @tc.desc: Verify assertEqual returns failed when values are different.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEqual0002', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEqual('hello', 'world');
      expect(result.passed).assertFalse();
      expect(result.expected).assertEqual('world');
      expect(result.actual).assertEqual('hello');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_0300
     * @tc.name: testAssertEqual0003
     * @tc.desc: Verify assertEqual uses custom message when provided.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEqual0003', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEqual('a', 'b', 'custom message');
      expect(result.passed).assertFalse();
      expect(result.message).assertEqual('custom message');
      expect(result.assertionType).assertEqual('assertEqual');
      done();
    });

    // ==================== assertNotEqual (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_0400
     * @tc.name: testAssertNotEqual0004
     * @tc.desc: Verify assertNotEqual returns passed when values are different.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotEqual0004', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotEqual('hello', 'world');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello');
      expect(result.assertionType).assertEqual('assertNotEqual');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_0500
     * @tc.name: testAssertNotEqual0005
     * @tc.desc: Verify assertNotEqual returns failed when values are equal.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotEqual0005', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotEqual('same', 'same');
      expect(result.passed).assertFalse();
      expect(result.expected).assertEqual('not same');
      expect(result.message.length).assertLarger(0);
      done();
    });

    // ==================== assertTrue (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_0600
     * @tc.name: testAssertTrue0006
     * @tc.desc: Verify assertTrue returns passed when value is true.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertTrue0006', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertTrue(true);
      expect(result.passed).assertTrue();
      expect(result.expected).assertEqual('true');
      expect(result.actual).assertEqual('true');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_0700
     * @tc.name: testAssertTrue0007
     * @tc.desc: Verify assertTrue returns failed when value is false.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertTrue0007', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertTrue(false);
      expect(result.passed).assertFalse();
      expect(result.expected).assertEqual('true');
      expect(result.actual).assertEqual('false');
      done();
    });

    // ==================== assertFalse (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_0800
     * @tc.name: testAssertFalse0008
     * @tc.desc: Verify assertFalse returns passed when value is false.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertFalse0008', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertFalse(false);
      expect(result.passed).assertTrue();
      expect(result.expected).assertEqual('false');
      expect(result.actual).assertEqual('false');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_0900
     * @tc.name: testAssertFalse0009
     * @tc.desc: Verify assertFalse returns failed when value is true.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertFalse0009', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertFalse(true);
      expect(result.passed).assertFalse();
      expect(result.expected).assertEqual('false');
      expect(result.actual).assertEqual('true');
      done();
    });

    // ==================== assertContains (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_1000
     * @tc.name: testAssertContains0010
     * @tc.desc: Verify assertContains returns passed when text contains substring.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertContains0010', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertContains('hello world', 'world');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello world');
      expect(result.assertionType).assertEqual('assertContains');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_1100
     * @tc.name: testAssertContains0011
     * @tc.desc: Verify assertContains returns failed when text does not contain substring.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertContains0011', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertContains('hello', 'xyz');
      expect(result.passed).assertFalse();
      expect(result.expected).assertEqual("contains 'xyz'");
      expect(result.message.length).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_1200
     * @tc.name: testAssertContains0012
     * @tc.desc: Verify assertContains handles empty substring.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertContains0012', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertContains('hello', '');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello');
      expect(result.expected).assertEqual("contains ''");
      done();
    });

    // ==================== assertNotContains (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_1300
     * @tc.name: testAssertNotContains0013
     * @tc.desc: Verify assertNotContains returns passed when text does not contain substring.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotContains0013', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotContains('hello', 'xyz');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello');
      expect(result.assertionType).assertEqual('assertNotContains');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_1400
     * @tc.name: testAssertNotContains0014
     * @tc.desc: Verify assertNotContains returns failed when text contains substring.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotContains0014', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotContains('hello world', 'world');
      expect(result.passed).assertFalse();
      expect(result.expected).assertEqual("not contains 'world'");
      expect(result.message.length).assertLarger(0);
      done();
    });

    // ==================== assertGreaterThan (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_1500
     * @tc.name: testAssertGreaterThan0015
     * @tc.desc: Verify assertGreaterThan returns passed when actual is greater.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertGreaterThan0015', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertGreaterThan(10, 5);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('10');
      expect(result.expected).assertEqual('> 5');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_1600
     * @tc.name: testAssertGreaterThan0016
     * @tc.desc: Verify assertGreaterThan returns failed when values are equal.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertGreaterThan0016', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertGreaterThan(5, 5);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('5');
      expect(result.assertionType).assertEqual('assertGreaterThan');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_1700
     * @tc.name: testAssertGreaterThan0017
     * @tc.desc: Verify assertGreaterThan returns failed when actual is less.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertGreaterThan0017', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertGreaterThan(3, 5);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('3');
      expect(result.expected).assertEqual('> 5');
      done();
    });

    // ==================== assertGreaterOrEqual (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_1800
     * @tc.name: testAssertGreaterOrEqual0018
     * @tc.desc: Verify assertGreaterOrEqual returns passed when actual is greater.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertGreaterOrEqual0018', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertGreaterOrEqual(10, 5);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('10');
      expect(result.expected).assertEqual('>= 5');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_1900
     * @tc.name: testAssertGreaterOrEqual0019
     * @tc.desc: Verify assertGreaterOrEqual returns passed when values are equal.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertGreaterOrEqual0019', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertGreaterOrEqual(5, 5);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('5');
      expect(result.assertionType).assertEqual('assertGreaterOrEqual');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_2000
     * @tc.name: testAssertGreaterOrEqual0020
     * @tc.desc: Verify assertGreaterOrEqual returns failed when actual is less.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertGreaterOrEqual0020', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertGreaterOrEqual(3, 5);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('3');
      expect(result.expected).assertEqual('>= 5');
      done();
    });

    // ==================== assertLessThan (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_2100
     * @tc.name: testAssertLessThan0021
     * @tc.desc: Verify assertLessThan returns passed when actual is less.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertLessThan0021', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertLessThan(3, 5);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('3');
      expect(result.expected).assertEqual('< 5');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_2200
     * @tc.name: testAssertLessThan0022
     * @tc.desc: Verify assertLessThan returns failed when values are equal.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertLessThan0022', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertLessThan(5, 5);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('5');
      expect(result.assertionType).assertEqual('assertLessThan');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_2300
     * @tc.name: testAssertLessThan0023
     * @tc.desc: Verify assertLessThan returns failed when actual is greater.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertLessThan0023', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertLessThan(10, 5);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('10');
      expect(result.expected).assertEqual('< 5');
      done();
    });

    // ==================== assertLessOrEqual (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_2400
     * @tc.name: testAssertLessOrEqual0024
     * @tc.desc: Verify assertLessOrEqual returns passed when actual is less.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertLessOrEqual0024', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertLessOrEqual(3, 5);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('3');
      expect(result.expected).assertEqual('<= 5');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_2500
     * @tc.name: testAssertLessOrEqual0025
     * @tc.desc: Verify assertLessOrEqual returns passed when values are equal.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertLessOrEqual0025', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertLessOrEqual(5, 5);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('5');
      expect(result.assertionType).assertEqual('assertLessOrEqual');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_2600
     * @tc.name: testAssertLessOrEqual0026
     * @tc.desc: Verify assertLessOrEqual returns failed when actual is greater.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertLessOrEqual0026', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertLessOrEqual(10, 5);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('10');
      expect(result.expected).assertEqual('<= 5');
      done();
    });

    // ==================== assertNotEmpty (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_2700
     * @tc.name: testAssertNotEmpty0027
     * @tc.desc: Verify assertNotEmpty returns passed for non-empty string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotEmpty0027', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotEmpty('hello');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello');
      expect(result.expected).assertEqual('non-empty');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_2800
     * @tc.name: testAssertNotEmpty0028
     * @tc.desc: Verify assertNotEmpty returns failed for empty string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotEmpty0028', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotEmpty('');
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('');
      expect(result.assertionType).assertEqual('assertNotEmpty');
      done();
    });

    // ==================== assertEmpty (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_2900
     * @tc.name: testAssertEmpty0029
     * @tc.desc: Verify assertEmpty returns passed for empty string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEmpty0029', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEmpty('');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('');
      expect(result.expected).assertEqual('empty');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_3000
     * @tc.name: testAssertEmpty0030
     * @tc.desc: Verify assertEmpty returns failed for non-empty string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEmpty0030', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEmpty('hello');
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('hello');
      expect(result.assertionType).assertEqual('assertEmpty');
      done();
    });

    // ==================== assertNull (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_3100
     * @tc.name: testAssertNull0031
     * @tc.desc: Verify assertNull returns passed for null value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNull0031', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNull(null);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('null');
      expect(result.expected).assertEqual('null');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_3200
     * @tc.name: testAssertNull0032
     * @tc.desc: Verify assertNull returns passed for undefined value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNull0032', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNull(undefined);
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('undefined');
      expect(result.assertionType).assertEqual('assertNull');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_3300
     * @tc.name: testAssertNull0033
     * @tc.desc: Verify assertNull returns failed for non-null value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNull0033', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNull('value');
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('value');
      expect(result.expected).assertEqual('null');
      done();
    });

    // ==================== assertNotNull (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_3400
     * @tc.name: testAssertNotNull0034
     * @tc.desc: Verify assertNotNull returns passed for non-null value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotNull0034', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotNull('value');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('value');
      expect(result.expected).assertEqual('non-null');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_3500
     * @tc.name: testAssertNotNull0035
     * @tc.desc: Verify assertNotNull returns failed for null value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotNull0035', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotNull(null);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('null');
      expect(result.assertionType).assertEqual('assertNotNull');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_3600
     * @tc.name: testAssertNotNull0036
     * @tc.desc: Verify assertNotNull returns failed for undefined value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertNotNull0036', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertNotNull(undefined);
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('undefined');
      expect(result.expected).assertEqual('non-null');
      done();
    });

    // ==================== assertMatchesPattern (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_3700
     * @tc.name: testAssertMatchesPattern0037
     * @tc.desc: Verify assertMatchesPattern returns passed when text matches pattern.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertMatchesPattern0037', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertMatchesPattern('hello123', '[a-z]+[0-9]+');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello123');
      expect(result.expected).assertEqual('matches /[a-z]+[0-9]+/');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_3800
     * @tc.name: testAssertMatchesPattern0038
     * @tc.desc: Verify assertMatchesPattern returns failed when text does not match pattern.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertMatchesPattern0038', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertMatchesPattern('hello', '^[0-9]+$');
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('hello');
      expect(result.assertionType).assertEqual('assertMatchesPattern');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_3900
     * @tc.name: testAssertMatchesPattern0039
     * @tc.desc: Verify assertMatchesPattern with custom message.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertMatchesPattern0039', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertMatchesPattern('test', 'xyz', 'custom msg');
      expect(result.passed).assertFalse();
      expect(result.message).assertEqual('custom msg');
      expect(result.expected).assertEqual('matches /xyz/');
      done();
    });

    // ==================== assertStartsWith (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_4000
     * @tc.name: testAssertStartsWith0040
     * @tc.desc: Verify assertStartsWith returns passed when text starts with prefix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertStartsWith0040', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertStartsWith('hello world', 'hello');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello world');
      expect(result.expected).assertEqual("starts with 'hello'");
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_4100
     * @tc.name: testAssertStartsWith0041
     * @tc.desc: Verify assertStartsWith returns failed when text does not start with prefix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertStartsWith0041', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertStartsWith('hello', 'world');
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('hello');
      expect(result.assertionType).assertEqual('assertStartsWith');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_4200
     * @tc.name: testAssertStartsWith0042
     * @tc.desc: Verify assertStartsWith with empty prefix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertStartsWith0042', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertStartsWith('hello', '');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello');
      expect(result.expected).assertEqual("starts with ''");
      done();
    });

    // ==================== assertEndsWith (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_4300
     * @tc.name: testAssertEndsWith0043
     * @tc.desc: Verify assertEndsWith returns passed when text ends with suffix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEndsWith0043', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEndsWith('hello world', 'world');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello world');
      expect(result.expected).assertEqual("ends with 'world'");
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_4400
     * @tc.name: testAssertEndsWith0044
     * @tc.desc: Verify assertEndsWith returns failed when text does not end with suffix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEndsWith0044', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEndsWith('hello', 'world');
      expect(result.passed).assertFalse();
      expect(result.actual).assertEqual('hello');
      expect(result.assertionType).assertEqual('assertEndsWith');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_4500
     * @tc.name: testAssertEndsWith0045
     * @tc.desc: Verify assertEndsWith with empty suffix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertEndsWith0045', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const result: AssertionResult = helper.assertEndsWith('hello', '');
      expect(result.passed).assertTrue();
      expect(result.actual).assertEqual('hello');
      expect(result.expected).assertEqual("ends with ''");
      done();
    });

    // ==================== getResults (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_4600
     * @tc.name: testGetResults0046
     * @tc.desc: Verify getResults returns empty array when no assertions recorded.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetResults0046', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const results: AssertionResult[] = helper.getResults();
      expect(results.length).assertEqual(0);
      expect(Array.isArray(results)).assertTrue();
      expect(results.toString()).assertEqual('');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_4700
     * @tc.name: testGetResults0047
     * @tc.desc: Verify getResults returns all recorded assertions.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetResults0047', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertEqual('b', 'c');
      const results: AssertionResult[] = helper.getResults();
      expect(results.length).assertEqual(2);
      expect(results[0].passed).assertTrue();
      expect(results[1].passed).assertFalse();
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_4800
     * @tc.name: testGetResults0048
     * @tc.desc: Verify getResults returns a copy that does not affect original.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetResults0048', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('test', 'test');
      const results1: AssertionResult[] = helper.getResults();
      const results2: AssertionResult[] = helper.getResults();
      expect(results1.length).assertEqual(results2.length);
      expect(results1[0].assertionType).assertEqual(results2[0].assertionType);
      expect(results1 === results2).assertFalse();
      done();
    });

    // ==================== getFailedResults (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_4900
     * @tc.name: testGetFailedResults0049
     * @tc.desc: Verify getFailedResults returns empty when all assertions pass.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailedResults0049', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertTrue(true);
      const failed: AssertionResult[] = helper.getFailedResults();
      expect(failed.length).assertEqual(0);
      expect(Array.isArray(failed)).assertTrue();
      expect(failed.toString()).assertEqual('');
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_5000
     * @tc.name: testGetFailedResults0050
     * @tc.desc: Verify getFailedResults returns only failed assertions.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailedResults0050', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'b');
      helper.assertTrue(true);
      helper.assertFalse(true);
      const failed: AssertionResult[] = helper.getFailedResults();
      expect(failed.length).assertEqual(2);
      expect(failed[0].passed).assertFalse();
      expect(failed[1].passed).assertFalse();
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_5100
     * @tc.name: testGetFailedResults0051
     * @tc.desc: Verify getFailedResults returns all when all assertions fail.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailedResults0051', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'b');
      helper.assertNotEqual('x', 'x');
      const failed: AssertionResult[] = helper.getFailedResults();
      expect(failed.length).assertEqual(2);
      expect(failed[0].assertionType).assertEqual('assertEqual');
      expect(failed[1].assertionType).assertEqual('assertNotEqual');
      done();
    });

    // ==================== summarize (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_5200
     * @tc.name: testSummarize0052
     * @tc.desc: Verify summarize returns zero values when no assertions recorded.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarize0052', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      const summary: AssertionSummary = helper.summarize();
      expect(summary.totalAssertions).assertEqual(0);
      expect(summary.passedAssertions).assertEqual(0);
      expect(summary.failedAssertions).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_5300
     * @tc.name: testSummarize0053
     * @tc.desc: Verify summarize calculates correct statistics for mixed results.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarize0053', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertEqual('b', 'c');
      helper.assertTrue(true);
      const summary: AssertionSummary = helper.summarize();
      expect(summary.totalAssertions).assertEqual(3);
      expect(summary.passedAssertions).assertEqual(2);
      expect(summary.failedAssertions).assertEqual(1);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_5400
     * @tc.name: testSummarize0054
     * @tc.desc: Verify summarize calculates correct pass rate.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSummarize0054', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertEqual('b', 'b');
      helper.assertEqual('c', 'd');
      helper.assertEqual('e', 'f');
      const summary: AssertionSummary = helper.summarize();
      expect(summary.totalAssertions).assertEqual(4);
      expect(summary.passedAssertions).assertEqual(2);
      expect(summary.passRate).assertEqual(50);
      done();
    });

    // ==================== generateReport (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_5500
     * @tc.name: testGenerateReport0055
     * @tc.desc: Verify generateReport includes all sections when there are failures.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0055', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'b');
      const report: string = helper.generateReport();
      expect(report.length).assertLarger(0);
      expect(report.indexOf('Assertion Report') >= 0).assertTrue();
      expect(report.indexOf('Failed Assertions') >= 0).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_5600
     * @tc.name: testGenerateReport0056
     * @tc.desc: Verify generateReport excludes failed section when all pass.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0056', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      const report: string = helper.generateReport();
      expect(report.length).assertLarger(0);
      expect(report.indexOf('Assertion Report') >= 0).assertTrue();
      expect(report.indexOf('Failed Assertions') < 0).assertTrue();
      done();
    });

    // ==================== clear (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_5700
     * @tc.name: testClear0057
     * @tc.desc: Verify clear resets all recorded assertions.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testClear0057', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'b');
      helper.assertTrue(false);
      expect(helper.getTotalCount()).assertEqual(2);
      helper.clear();
      expect(helper.getTotalCount()).assertEqual(0);
      expect(helper.getResults().length).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_5800
     * @tc.name: testClear0058
     * @tc.desc: Verify clear allows fresh start for new assertions.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testClear0058', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'b');
      helper.clear();
      helper.assertTrue(true);
      const results: AssertionResult[] = helper.getResults();
      expect(results.length).assertEqual(1);
      expect(results[0].assertionType).assertEqual('assertTrue');
      expect(results[0].passed).assertTrue();
      done();
    });

    // ==================== getTotalCount (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_5900
     * @tc.name: testGetTotalCount0059
     * @tc.desc: Verify getTotalCount returns zero initially.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetTotalCount0059', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      expect(helper.getTotalCount()).assertEqual(0);
      expect(helper.getPassCount()).assertEqual(0);
      expect(helper.getFailCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_6000
     * @tc.name: testGetTotalCount0060
     * @tc.desc: Verify getTotalCount increments with each assertion.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetTotalCount0060', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertEqual('b', 'c');
      helper.assertTrue(true);
      expect(helper.getTotalCount()).assertEqual(3);
      expect(helper.getPassCount()).assertEqual(2);
      expect(helper.getFailCount()).assertEqual(1);
      done();
    });

    // ==================== getPassCount (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_6100
     * @tc.name: testGetPassCount0061
     * @tc.desc: Verify getPassCount returns correct count when all pass.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetPassCount0061', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertTrue(true);
      helper.assertFalse(false);
      expect(helper.getPassCount()).assertEqual(3);
      expect(helper.getFailCount()).assertEqual(0);
      expect(helper.getTotalCount()).assertEqual(3);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_6200
     * @tc.name: testGetPassCount0062
     * @tc.desc: Verify getPassCount returns correct count for mixed results.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetPassCount0062', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertEqual('b', 'c');
      helper.assertTrue(true);
      helper.assertFalse(true);
      expect(helper.getPassCount()).assertEqual(2);
      expect(helper.getFailCount()).assertEqual(2);
      expect(helper.getTotalCount()).assertEqual(4);
      done();
    });

    // ==================== getFailCount (2 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_6300
     * @tc.name: testGetFailCount0063
     * @tc.desc: Verify getFailCount returns correct count when all fail.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailCount0063', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'b');
      helper.assertNotEqual('x', 'x');
      helper.assertTrue(false);
      expect(helper.getFailCount()).assertEqual(3);
      expect(helper.getPassCount()).assertEqual(0);
      expect(helper.getTotalCount()).assertEqual(3);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_6400
     * @tc.name: testGetFailCount0064
     * @tc.desc: Verify getFailCount returns zero when all pass.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailCount0064', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertTrue(true);
      expect(helper.getFailCount()).assertEqual(0);
      expect(helper.getPassCount()).assertEqual(2);
      expect(helper.getTotalCount()).assertEqual(2);
      done();
    });

    // ==================== getPassRate (3 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_6500
     * @tc.name: testGetPassRate0065
     * @tc.desc: Verify getPassRate returns zero when no assertions recorded.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetPassRate0065', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      expect(helper.getPassRate()).assertEqual(0);
      expect(helper.getTotalCount()).assertEqual(0);
      expect(helper.getPassCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_6600
     * @tc.name: testGetPassRate0066
     * @tc.desc: Verify getPassRate returns 100 when all assertions pass.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetPassRate0066', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertTrue(true);
      helper.assertFalse(false);
      expect(helper.getPassRate()).assertEqual(100);
      expect(helper.getPassCount()).assertEqual(3);
      expect(helper.getTotalCount()).assertEqual(3);
      done();
    });

    /*
     * @tc.number: SUB_ASSERT_6700
     * @tc.name: testGetPassRate0067
     * @tc.desc: Verify getPassRate calculates correct percentage for mixed results.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetPassRate0067', 0, async (done: Function) => {
      const helper: AssertionHelper = AssertionHelper.getInstance();
      helper.clear();
      helper.assertEqual('a', 'a');
      helper.assertEqual('b', 'c');
      helper.assertTrue(true);
      helper.assertFalse(true);
      expect(helper.getPassRate()).assertEqual(50);
      expect(helper.getPassCount()).assertEqual(2);
      expect(helper.getTotalCount()).assertEqual(4);
      done();
    });

    // ==================== getInstance (1 用例) ====================

    /*
     * @tc.number: SUB_ASSERT_6800
     * @tc.name: testGetInstance0068
     * @tc.desc: Verify getInstance returns singleton instance.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetInstance0068', 0, async (done: Function) => {
      const instance1: AssertionHelper = AssertionHelper.getInstance();
      instance1.clear();
      instance1.assertEqual('test', 'test');
      const instance2: AssertionHelper = AssertionHelper.getInstance();
      const count1: number = instance1.getTotalCount();
      const count2: number = instance2.getTotalCount();
      expect(count1).assertEqual(count2);
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);
      done();
    });
  });
}
