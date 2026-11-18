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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0001', 'begin');
      const validator: FormValidator = new FormValidator();
      const result = validator.validate({ 'deviceName': 'Watch' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0001',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(0)");
      expect(validator.getRuleCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0001',
        '#2 assert ' + "expect(validator.hasRule('deviceName')).assertFalse()");
      expect(validator.hasRule('deviceName')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0001',
        '#3 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0001',
        '#4 ' + "result.fieldCount" + ' = ' + JSON.stringify(result.fieldCount));
      expect(result.fieldCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0001',
        '#5 ' + "result.errors.size" + ' = ' + JSON.stringify(result.errors.size));
      expect(result.errors.size).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0002', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.addRule({ fieldName: 'macAddress', required: true });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0002',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(2)");
      expect(validator.getRuleCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0002',
        '#2 assert ' + "expect(validator.hasRule('deviceName')).assertTrue()");
      expect(validator.hasRule('deviceName')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0002',
        '#3 assert ' + "expect(validator.hasRule('macAddress')).assertTrue()");
      expect(validator.hasRule('macAddress')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0002',
        '#4 assert ' + "expect(validator.hasRule('timeout')).assertFalse()");
      expect(validator.hasRule('timeout')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0002',
        '#5 assert ' +
        "expect(validator.validate({ 'deviceName': 'Watch', 'macAddress': '00:11:22:33:44:55' }).isValid) .assertTru" +
        "e()");
      expect(validator.validate({ 'deviceName': 'Watch', 'macAddress': '00:11:22:33:44:55' }).isValid)
        .assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0003', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'code', required: true });
      validator.addRule({ fieldName: 'code', required: false, minLength: 4 });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0003',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(2)");
      expect(validator.getRuleCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0003',
        '#2 assert ' + "expect(validator.hasRule('code')).assertTrue()");
      expect(validator.hasRule('code')).assertTrue();
      const result = validator.validate({ 'code': 'ab' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0003',
        '#3 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0003',
        '#4 ' + "result.fieldCount" + ' = ' + JSON.stringify(result.fieldCount));
      expect(result.fieldCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0003',
        '#5 assert ' + "expect(result.errors.get('code')).assertEqual('code too short (min 4)')");
      expect(result.errors.get('code')).assertEqual('code too short (min 4)');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0004', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'macAddress', required: true });
      validator.addRule({ fieldName: 'macAddress', required: false, minLength: 17 });
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.removeRule('macAddress');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0004',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(1)");
      expect(validator.getRuleCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0004',
        '#2 assert ' + "expect(validator.hasRule('macAddress')).assertFalse()");
      expect(validator.hasRule('macAddress')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0004',
        '#3 assert ' + "expect(validator.hasRule('deviceName')).assertTrue()");
      expect(validator.hasRule('deviceName')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0004',
        '#4 assert ' + "expect(validator.validate({ 'deviceName': 'Watch' }).isValid).assertTrue()");
      expect(validator.validate({ 'deviceName': 'Watch' }).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0005', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.addRule({ fieldName: 'macAddress', required: true });
      validator.clearRules();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0005',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(0)");
      expect(validator.getRuleCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0005',
        '#2 assert ' + "expect(validator.hasRule('deviceName')).assertFalse()");
      expect(validator.hasRule('deviceName')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0005',
        '#3 assert ' + "expect(validator.hasRule('macAddress')).assertFalse()");
      expect(validator.hasRule('macAddress')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0005',
        '#4 assert ' + "expect(validator.validate({}).isValid).assertTrue()");
      expect(validator.validate({}).isValid).assertTrue();
      validator.clearRules();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0005',
        '#5 assert ' + "expect(validator.getRuleCount()).assertEqual(0)");
      expect(validator.getRuleCount()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0006', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.removeRule('notRegistered');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0006',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(1)");
      expect(validator.getRuleCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0006',
        '#2 assert ' + "expect(validator.hasRule('deviceName')).assertTrue()");
      expect(validator.hasRule('deviceName')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0006',
        '#3 assert ' + "expect(validator.validate({}).isValid).assertFalse()");
      expect(validator.validate({}).isValid).assertFalse();
      const result = validator.validate({ 'deviceName': 'Speaker' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0006',
        '#4 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0006',
        '#5 ' + "result.errors.size" + ' = ' + JSON.stringify(result.errors.size));
      expect(result.errors.size).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0007', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      const result = validator.validate({});
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0007',
        '#1 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0007',
        '#2 ' + "result.errors.size" + ' = ' + JSON.stringify(result.errors.size));
      expect(result.errors.size).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0007',
        '#3 assert ' + "expect(result.errors.get('deviceName')).assertEqual('deviceName is required')");
      expect(result.errors.get('deviceName')).assertEqual('deviceName is required');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0007',
        '#4 ' + "result.fieldCount" + ' = ' + JSON.stringify(result.fieldCount));
      expect(result.fieldCount).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0008', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      const blank = validator.validate({ 'deviceName': '   ' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0008',
        '#1 ' + "blank.isValid" + ' = ' + JSON.stringify(blank.isValid));
      expect(blank.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0008',
        '#2 assert ' + "expect(blank.errors.get('deviceName')).assertEqual('deviceName is required')");
      expect(blank.errors.get('deviceName')).assertEqual('deviceName is required');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0008',
        '#3 assert ' + "expect(validator.validate({ 'deviceName': 'x' }).isValid).assertTrue()");
      expect(validator.validate({ 'deviceName': 'x' }).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0008',
        '#4 assert ' + "expect(validator.validate({ 'deviceName': ' ' }).errors.size).assertEqual(1)");
      expect(validator.validate({ 'deviceName': ' ' }).errors.size).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0009', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'timeout', required: false, minLength: 4 });
      const absent = validator.validate({});
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0009',
        '#1 ' + "absent.isValid" + ' = ' + JSON.stringify(absent.isValid));
      expect(absent.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0009',
        '#2 assert ' + "expect(absent.errors.get('timeout')).assertEqual('timeout too short (min 4)')");
      expect(absent.errors.get('timeout')).assertEqual('timeout too short (min 4)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0009',
        '#3 ' + "absent.errors.size" + ' = ' + JSON.stringify(absent.errors.size));
      expect(absent.errors.size).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0009',
        '#4 ' + "absent.fieldCount" + ' = ' + JSON.stringify(absent.fieldCount));
      expect(absent.fieldCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0009',
        '#5 assert ' + "expect(validator.validate({ 'timeout': '1s' }).isValid).assertFalse()");
      expect(validator.validate({ 'timeout': '1s' }).isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0009',
        '#6 assert ' + "expect(validator.validate({ 'timeout': '1000' }).isValid).assertTrue()");
      expect(validator.validate({ 'timeout': '1000' }).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0010', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'code', required: true, minLength: 3 });
      const short = validator.validate({ 'code': 'ab' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0010',
        '#1 ' + "short.isValid" + ' = ' + JSON.stringify(short.isValid));
      expect(short.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0010',
        '#2 assert ' + "expect(short.errors.get('code')).assertEqual('code too short (min 3)')");
      expect(short.errors.get('code')).assertEqual('code too short (min 3)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0010',
        '#3 assert ' + "expect(validator.validate({ 'code': 'abc' }).isValid).assertTrue()");
      expect(validator.validate({ 'code': 'abc' }).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0010',
        '#4 assert ' + "expect(validator.validate({ 'code': 'abcd' }).isValid).assertTrue()");
      expect(validator.validate({ 'code': 'abcd' }).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0011', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'name', required: true, minLength: 3, maxLength: 5 });
      const long = validator.validate({ 'name': 'abcdef' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0011',
        '#1 ' + "long.isValid" + ' = ' + JSON.stringify(long.isValid));
      expect(long.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0011',
        '#2 assert ' + "expect(long.errors.get('name')).assertEqual('name too long (max 5)')");
      expect(long.errors.get('name')).assertEqual('name too long (max 5)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0011',
        '#3 ' + "long.errors.size" + ' = ' + JSON.stringify(long.errors.size));
      expect(long.errors.size).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0011',
        '#4 assert ' + "expect(validator.validate({ 'name': 'abcde' }).isValid).assertTrue()");
      expect(validator.validate({ 'name': 'abcde' }).isValid).assertTrue();
      const short = validator.validate({ 'name': 'ab' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0011',
        '#5 assert ' + "expect(short.errors.get('name')).assertEqual('name too short (min 3)')");
      expect(short.errors.get('name')).assertEqual('name too short (min 3)');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0012', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'pin', required: true, pattern: /^\d{4}$/ });
      const bad = validator.validate({ 'pin': '12a4' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0012',
        '#1 ' + "bad.isValid" + ' = ' + JSON.stringify(bad.isValid));
      expect(bad.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0012',
        '#2 assert ' + "expect(bad.errors.get('pin')).assertEqual('pin format invalid')");
      expect(bad.errors.get('pin')).assertEqual('pin format invalid');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0012',
        '#3 assert ' + "expect(validator.validate({ 'pin': '1234' }).isValid).assertTrue()");
      expect(validator.validate({ 'pin': '1234' }).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0012',
        '#4 assert ' + "expect(validator.validate({ 'pin': '12345' }).isValid).assertFalse()");
      expect(validator.validate({ 'pin': '12345' }).isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0012',
        '#5 assert ' + "expect(validator.validate({ 'pin': '12' }).errors.size).assertEqual(1)");
      expect(validator.validate({ 'pin': '12' }).errors.size).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0013', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({
        fieldName: 'macAddress',
        required: true,
        customValidator: (v: string) => ValidationUtils.validateMacAddress(v)
      });
      const bad = validator.validate({ 'macAddress': 'zz:zz:zz:zz:zz:zz' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0013',
        '#1 ' + "bad.isValid" + ' = ' + JSON.stringify(bad.isValid));
      expect(bad.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0013',
        '#2 assert ' + "expect(bad.errors.get('macAddress')).assertEqual('Invalid MAC format')");
      expect(bad.errors.get('macAddress')).assertEqual('Invalid MAC format');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0013',
        '#3 ' + "bad.errors.size" + ' = ' + JSON.stringify(bad.errors.size));
      expect(bad.errors.size).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0013',
        '#4 assert ' + "expect(validator.validate({ 'macAddress': '00:11:22:33:44:55' }).isValid).assertTrue()");
      expect(validator.validate({ 'macAddress': '00:11:22:33:44:55' }).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0014', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({
        fieldName: 'timeout',
        required: false,
        customValidator: (v: string) => ValidationUtils.validateNonEmpty(v, 'timeout')
      });
      const empty = validator.validate({});
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0014',
        '#1 ' + "empty.isValid" + ' = ' + JSON.stringify(empty.isValid));
      expect(empty.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0014',
        '#2 ' + "empty.errors.size" + ' = ' + JSON.stringify(empty.errors.size));
      expect(empty.errors.size).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0014',
        '#3 ' + "empty.fieldCount" + ' = ' + JSON.stringify(empty.fieldCount));
      expect(empty.fieldCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0014',
        '#4 assert ' + "expect(validator.validate({ 'timeout': '30' }).isValid).assertTrue()");
      expect(validator.validate({ 'timeout': '30' }).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0015', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true });
      validator.addRule({ fieldName: 'macAddress', required: true });
      validator.addRule({ fieldName: 'pin', required: true });
      const result = validator.validate({ 'deviceName': 'Watch' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0015',
        '#1 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0015',
        '#2 ' + "result.errors.size" + ' = ' + JSON.stringify(result.errors.size));
      expect(result.errors.size).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0015',
        '#3 assert ' + "expect(result.errors.get('macAddress')).assertEqual('macAddress is required')");
      expect(result.errors.get('macAddress')).assertEqual('macAddress is required');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0015',
        '#4 assert ' + "expect(result.errors.get('pin')).assertEqual('pin is required')");
      expect(result.errors.get('pin')).assertEqual('pin is required');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0015',
        '#5 ' + "result.fieldCount" + ' = ' + JSON.stringify(result.fieldCount));
      expect(result.fieldCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0015',
        '#6 assert ' + "expect(result.errors.has('deviceName')).assertFalse()");
      expect(result.errors.has('deviceName')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0015', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0016', 'begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule({ fieldName: 'deviceName', required: true, minLength: 2, maxLength: 20 });
      validator.addRule({ fieldName: 'pin', required: true, pattern: /^\d{6}$/ });
      const result = validator.validate({ 'deviceName': 'BT Speaker', 'pin': '123456' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0016',
        '#1 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0016',
        '#2 ' + "result.errors.size" + ' = ' + JSON.stringify(result.errors.size));
      expect(result.errors.size).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0016',
        '#3 ' + "result.fieldCount" + ' = ' + JSON.stringify(result.fieldCount));
      expect(result.fieldCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0016',
        '#4 assert ' + "expect(result.errors.has('pin')).assertFalse()");
      expect(result.errors.has('pin')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0017', 'begin');
      const validator = FormValidator.createBluetoothDeviceValidator();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0017',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(2)");
      expect(validator.getRuleCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0017',
        '#2 assert ' + "expect(validator.hasRule('deviceName')).assertTrue()");
      expect(validator.hasRule('deviceName')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0017',
        '#3 assert ' + "expect(validator.hasRule('macAddress')).assertTrue()");
      expect(validator.hasRule('macAddress')).assertTrue();
      const empty = validator.validate({});
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0017',
        '#4 ' + "empty.isValid" + ' = ' + JSON.stringify(empty.isValid));
      expect(empty.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0017',
        '#5 assert ' + "expect(empty.errors.get('deviceName')).assertEqual('deviceName is required')");
      expect(empty.errors.get('deviceName')).assertEqual('deviceName is required');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0017',
        '#6 assert ' + "expect(empty.errors.get('macAddress')).assertEqual('macAddress is required')");
      expect(empty.errors.get('macAddress')).assertEqual('macAddress is required');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0018', 'begin');
      const validator = FormValidator.createBluetoothDeviceValidator();
      const good = validator.validate({ 'deviceName': 'BT-Headset', 'macAddress': '00:11:22:33:44:FF' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0018',
        '#1 ' + "good.isValid" + ' = ' + JSON.stringify(good.isValid));
      expect(good.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0018',
        '#2 ' + "good.errors.size" + ' = ' + JSON.stringify(good.errors.size));
      expect(good.errors.size).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0018',
        '#3 ' + "good.fieldCount" + ' = ' + JSON.stringify(good.fieldCount));
      expect(good.fieldCount).assertEqual(2);
      const bad = validator.validate({ 'deviceName': 'BT-Headset', 'macAddress': 'bad-mac' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0018',
        '#4 ' + "bad.isValid" + ' = ' + JSON.stringify(bad.isValid));
      expect(bad.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0018',
        '#5 assert ' + "expect(bad.errors.get('macAddress')).assertEqual('Invalid MAC format')");
      expect(bad.errors.get('macAddress')).assertEqual('Invalid MAC format');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0018', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0019', 'begin');
      const validator = FormValidator.createConnectionConfigValidator();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0019',
        '#1 assert ' + "expect(validator.getRuleCount()).assertEqual(3)");
      expect(validator.getRuleCount()).assertEqual(3);
      const good = validator.validate({ 'deviceId': 'dev_1', 'profileType': 'A2DP', 'timeout': '3000' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0019',
        '#2 ' + "good.isValid" + ' = ' + JSON.stringify(good.isValid));
      expect(good.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0019',
        '#3 ' + "good.errors.size" + ' = ' + JSON.stringify(good.errors.size));
      expect(good.errors.size).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0019',
        '#4 ' + "good.fieldCount" + ' = ' + JSON.stringify(good.fieldCount));
      expect(good.fieldCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0019', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0020', 'begin');
      const validator = FormValidator.createConnectionConfigValidator();
      const nan = validator.validate({ 'deviceId': 'dev_1', 'profileType': 'HFP', 'timeout': 'abc' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0020',
        '#1 ' + "nan.isValid" + ' = ' + JSON.stringify(nan.isValid));
      expect(nan.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0020',
        '#2 assert ' + "expect(nan.errors.get('timeout')).assertEqual('Invalid timeout')");
      expect(nan.errors.get('timeout')).assertEqual('Invalid timeout');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0020',
        '#3 assert ' +
        "expect(validator.validate({ 'deviceId': 'dev_1', 'profileType': 'HFP', 'timeout': '-1' }) .errors.get('time" +
        "out')).assertEqual('Invalid timeout')");
      expect(validator.validate({ 'deviceId': 'dev_1', 'profileType': 'HFP', 'timeout': '-1' })
        .errors.get('timeout')).assertEqual('Invalid timeout');
      const missing = validator.validate({ 'profileType': 'HFP' });
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0020',
        '#4 assert ' + "expect(missing.errors.get('deviceId')).assertEqual('deviceId is required')");
      expect(missing.errors.get('deviceId')).assertEqual('deviceId is required');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0020',
        '#5 ' + "missing.errors.size" + ' = ' + JSON.stringify(missing.errors.size));
      expect(missing.errors.size).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0020',
        '#6 assert ' + "expect(missing.errors.has('timeout')).assertFalse()");
      expect(missing.errors.has('timeout')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFormValidator0020',
        '#7 assert ' + "expect(validator.validate({ 'deviceId': 'd', 'profileType': 'HFP' }).isValid).assertTrue()");
      expect(validator.validate({ 'deviceId': 'd', 'profileType': 'HFP' }).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFormValidator0020', 'end');
    });
  });
}
