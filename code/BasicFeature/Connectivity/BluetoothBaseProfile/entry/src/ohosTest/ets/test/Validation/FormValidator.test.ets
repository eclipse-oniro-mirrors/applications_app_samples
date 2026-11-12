/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { FormValidator, ValidationUtils } from 'library';

/**
 * Test suite for FormValidator.
 * @since 26.0.0
 */
export default function formValidatorTest(): void {
  describe('FormValidatorTest', () => {
    // ==================== rule registration (4 cases) ====================

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0100
     * @tc.name: testFormValidator0001
     * @tc.desc: Pass an empty form when no rule has been registered.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0001', 0, () => {
      const validator = new FormValidator();
      const result = validator.validate({ 'deviceName': 'Watch' });
      expect(validator.getRuleCount()).assertEqual(0);
      expect(validator.hasRule('deviceName')).assertFalse();
      expect(result.isValid).assertTrue();
      expect(result.fieldCount).assertEqual(0);
      expect(result.errors.size).assertEqual(0);
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0200
     * @tc.name: testFormValidator0002
     * @tc.desc: Count and look up rules after they are registered.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0002', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.addRule({ fieldName: 'macAddress', required: true });
      expect(validator.getRuleCount()).assertEqual(2);
      expect(validator.hasRule('deviceName')).assertTrue();
      expect(validator.hasRule('macAddress')).assertTrue();
      expect(validator.hasRule('timeout')).assertFalse();
      expect(validator.validate({ 'deviceName': 'Watch', 'macAddress': '00:11:22:33:44:55' }).isValid)
        .assertTrue();
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0300
     * @tc.name: testFormValidator0003
     * @tc.desc: Keep both rules when the same field is registered twice.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0003', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'code', required: true });
      validator.addRule({ fieldName: 'code', required: false, minLength: 4 });
      expect(validator.getRuleCount()).assertEqual(2);
      expect(validator.hasRule('code')).assertTrue();
      const result = validator.validate({ 'code': 'ab' });
      expect(result.isValid).assertFalse();
      expect(result.fieldCount).assertEqual(2);
      expect(result.errors.get('code')).assertEqual('code too short (min 4)');
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0400
     * @tc.name: testFormValidator0004
     * @tc.desc: Drop every rule that points at the removed field name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0004', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'macAddress', required: true });
      validator.addRule({ fieldName: 'macAddress', required: false, minLength: 17 });
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.removeRule('macAddress');
      expect(validator.getRuleCount()).assertEqual(1);
      expect(validator.hasRule('macAddress')).assertFalse();
      expect(validator.hasRule('deviceName')).assertTrue();
      expect(validator.validate({ 'deviceName': 'Watch' }).isValid).assertTrue();
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0500
     * @tc.name: testFormValidator0005
     * @tc.desc: Reset the rule list to the initial empty state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0005', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.addRule({ fieldName: 'macAddress', required: true });
      validator.clearRules();
      expect(validator.getRuleCount()).assertEqual(0);
      expect(validator.hasRule('deviceName')).assertFalse();
      expect(validator.hasRule('macAddress')).assertFalse();
      expect(validator.validate({}).isValid).assertTrue();
      validator.clearRules();
      expect(validator.getRuleCount()).assertEqual(0);
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0600
     * @tc.name: testFormValidator0006
     * @tc.desc: Remove an unknown field name without touching other rules.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0006', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.removeRule('notRegistered');
      expect(validator.getRuleCount()).assertEqual(1);
      expect(validator.hasRule('deviceName')).assertTrue();
      expect(validator.validate({}).isValid).assertFalse();
      const result = validator.validate({ 'deviceName': 'Speaker' });
      expect(result.isValid).assertTrue();
      expect(result.errors.size).assertEqual(0);
    });

    // ==================== required and length rules (5 cases) ====================

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0700
     * @tc.name: testFormValidator0007
     * @tc.desc: Report the required error when the field is absent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0007', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      const result = validator.validate({});
      expect(result.isValid).assertFalse();
      expect(result.errors.size).assertEqual(1);
      expect(result.errors.get('deviceName')).assertEqual('deviceName is required');
      expect(result.fieldCount).assertEqual(1);
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0800
     * @tc.name: testFormValidator0008
     * @tc.desc: Treat whitespace only input as a missing required value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0008', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      const blank = validator.validate({ 'deviceName': '   ' });
      expect(blank.isValid).assertFalse();
      expect(blank.errors.get('deviceName')).assertEqual('deviceName is required');
      expect(validator.validate({ 'deviceName': 'x' }).isValid).assertTrue();
      expect(validator.validate({ 'deviceName': ' ' }).errors.size).assertEqual(1);
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_0900
     * @tc.name: testFormValidator0009
     * @tc.desc: Apply the length bound to an absent optional field.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0009', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'timeout', required: false, minLength: 4 });
      const absent = validator.validate({});
      expect(absent.isValid).assertFalse();
      expect(absent.errors.get('timeout')).assertEqual('timeout too short (min 4)');
      expect(absent.errors.size).assertEqual(1);
      expect(absent.fieldCount).assertEqual(1);
      expect(validator.validate({ 'timeout': '1s' }).isValid).assertFalse();
      expect(validator.validate({ 'timeout': '1000' }).isValid).assertTrue();
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1000
     * @tc.name: testFormValidator0010
     * @tc.desc: Enforce the lower length bound at its exact boundary.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0010', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'code', required: true, minLength: 3 });
      const short = validator.validate({ 'code': 'ab' });
      expect(short.isValid).assertFalse();
      expect(short.errors.get('code')).assertEqual('code too short (min 3)');
      expect(validator.validate({ 'code': 'abc' }).isValid).assertTrue();
      expect(validator.validate({ 'code': 'abcd' }).isValid).assertTrue();
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1100
     * @tc.name: testFormValidator0011
     * @tc.desc: Enforce the upper length bound and prefer the short error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0011', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'name', required: true, minLength: 3, maxLength: 5 });
      const long = validator.validate({ 'name': 'abcdef' });
      expect(long.isValid).assertFalse();
      expect(long.errors.get('name')).assertEqual('name too long (max 5)');
      expect(long.errors.size).assertEqual(1);
      expect(validator.validate({ 'name': 'abcde' }).isValid).assertTrue();
      const short = validator.validate({ 'name': 'ab' });
      expect(short.errors.get('name')).assertEqual('name too short (min 3)');
    });

    // ==================== regex and custom rules (3 cases) ====================

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1200
     * @tc.name: testFormValidator0012
     * @tc.desc: Apply a digit pattern and report the format error text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0012', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'pin', required: true, pattern: /^\d{4}$/ });
      const bad = validator.validate({ 'pin': '12a4' });
      expect(bad.isValid).assertFalse();
      expect(bad.errors.get('pin')).assertEqual('pin format invalid');
      expect(validator.validate({ 'pin': '1234' }).isValid).assertTrue();
      expect(validator.validate({ 'pin': '12345' }).isValid).assertFalse();
      expect(validator.validate({ 'pin': '12' }).errors.size).assertEqual(1);
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1300
     * @tc.name: testFormValidator0013
     * @tc.desc: Route a custom validator failure into the field error map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0013', 0, () => {
      const validator = new FormValidator();
      validator.addRule({
        fieldName: 'macAddress',
        required: true,
        customValidator: (v: string) => ValidationUtils.validateMacAddress(v)
      });
      const bad = validator.validate({ 'macAddress': 'zz:zz:zz:zz:zz:zz' });
      expect(bad.isValid).assertFalse();
      expect(bad.errors.get('macAddress')).assertEqual('Invalid MAC format');
      expect(bad.errors.size).assertEqual(1);
      expect(validator.validate({ 'macAddress': '00:11:22:33:44:55' }).isValid).assertTrue();
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1400
     * @tc.name: testFormValidator0014
     * @tc.desc: Skip the custom validator while the field stays empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0014', 0, () => {
      const validator = new FormValidator();
      validator.addRule({
        fieldName: 'timeout',
        required: false,
        customValidator: (v: string) => ValidationUtils.validateNonEmpty(v, 'timeout')
      });
      const empty = validator.validate({});
      expect(empty.isValid).assertTrue();
      expect(empty.errors.size).assertEqual(0);
      expect(empty.fieldCount).assertEqual(1);
      expect(validator.validate({ 'timeout': '30' }).isValid).assertTrue();
    });

    // ==================== multi field aggregate total (2 cases) ====================

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1500
     * @tc.name: testFormValidator0015
     * @tc.desc: Accumulate one error per failing field in a single pass.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0015', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.addRule({ fieldName: 'macAddress', required: true });
      validator.addRule({ fieldName: 'pin', required: true });
      const result = validator.validate({ 'deviceName': 'Watch' });
      expect(result.isValid).assertFalse();
      expect(result.errors.size).assertEqual(2);
      expect(result.errors.get('macAddress')).assertEqual('macAddress is required');
      expect(result.errors.get('pin')).assertEqual('pin is required');
      expect(result.fieldCount).assertEqual(3);
      expect(result.errors.has('deviceName')).assertFalse();
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1600
     * @tc.name: testFormValidator0016
     * @tc.desc: Keep error text out of the map for a fully valid form.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0016', 0, () => {
      const validator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true, minLength: 2, maxLength: 20 });
      validator.addRule({ fieldName: 'pin', required: true, pattern: /^\d{6}$/ });
      const result = validator.validate({ 'deviceName': 'BT Speaker', 'pin': '123456' });
      expect(result.isValid).assertTrue();
      expect(result.errors.size).assertEqual(0);
      expect(result.fieldCount).assertEqual(2);
      expect(result.errors.has('pin')).assertFalse();
    });

    // ==================== preset validator (2 cases) ====================

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1700
     * @tc.name: testFormValidator0017
     * @tc.desc: Verify the preset device form rejects missing name and MAC.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0017', 0, () => {
      const validator = FormValidator.createBluetoothDeviceValidator();
      expect(validator.getRuleCount()).assertEqual(2);
      expect(validator.hasRule('deviceName')).assertTrue();
      expect(validator.hasRule('macAddress')).assertTrue();
      const empty = validator.validate({});
      expect(empty.isValid).assertFalse();
      expect(empty.errors.get('deviceName')).assertEqual('deviceName is required');
      expect(empty.errors.get('macAddress')).assertEqual('macAddress is required');
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1800
     * @tc.name: testFormValidator0018
     * @tc.desc: Accept a complete device form and reject a malformed MAC.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0018', 0, () => {
      const validator = FormValidator.createBluetoothDeviceValidator();
      const good = validator.validate({ 'deviceName': 'BT-Headset', 'macAddress': '00:11:22:33:44:FF' });
      expect(good.isValid).assertTrue();
      expect(good.errors.size).assertEqual(0);
      expect(good.fieldCount).assertEqual(2);
      const bad = validator.validate({ 'deviceName': 'BT-Headset', 'macAddress': 'bad-mac' });
      expect(bad.isValid).assertFalse();
      expect(bad.errors.get('macAddress')).assertEqual('Invalid MAC format');
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_1900
     * @tc.name: testFormValidator0019
     * @tc.desc: Validate the preset connection configuration timeout field.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFormValidator0019', 0, () => {
      const validator = FormValidator.createConnectionConfigValidator();
      expect(validator.getRuleCount()).assertEqual(3);
      const good = validator.validate({ 'deviceId': 'dev_1', 'profileType': 'A2DP', 'timeout': '3000' });
      expect(good.isValid).assertTrue();
      expect(good.errors.size).assertEqual(0);
      expect(good.fieldCount).assertEqual(3);
    });

    /*
     * @tc.number: SUB_FORM_VALIDATOR_2000
     * @tc.name: testFormValidator0020
     * @tc.desc: Reject negative or unparsable timeouts in the preset form.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFormValidator0020', 0, () => {
      const validator = FormValidator.createConnectionConfigValidator();
      const nan = validator.validate({ 'deviceId': 'dev_1', 'profileType': 'HFP', 'timeout': 'abc' });
      expect(nan.isValid).assertFalse();
      expect(nan.errors.get('timeout')).assertEqual('Invalid timeout');
      expect(validator.validate({ 'deviceId': 'dev_1', 'profileType': 'HFP', 'timeout': '-1' })
        .errors.get('timeout')).assertEqual('Invalid timeout');
      const missing = validator.validate({ 'profileType': 'HFP' });
      expect(missing.errors.get('deviceId')).assertEqual('deviceId is required');
      expect(missing.errors.size).assertEqual(1);
      expect(missing.errors.has('timeout')).assertFalse();
      expect(validator.validate({ 'deviceId': 'd', 'profileType': 'HFP' }).isValid).assertTrue();
    });
  });
}
