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
import { BluetoothConstants, ValidationUtils } from 'library';

/**
 * Test suite for ValidationUtils.
 * @since 26.0.0
 */
export default function validationUtilsTest(): void {
  describe('ValidationUtilsTest', () => {
    // ==================== MAC ground address validation (4 cases) ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0100
     * @tc.name: testValidationUtils0001
     * @tc.desc: Accept a colon separated MAC address of mixed letter case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0001', 'begin');
      const result = ValidationUtils.validateMacAddress('00:11:22:33:44:FF');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0001',
        '#1 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0001',
        '#2 ' + "result.errorCode" + ' = ' + JSON.stringify(result.errorCode));
      expect(result.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0001',
        '#3 ' + "result.errorMessage" + ' = ' + JSON.stringify(result.errorMessage));
      expect(result.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0001',
        '#4 assert ' + "expect(ValidationUtils.validateMacAddress('00:11:22:33:44:55').isValid).assertTrue()");
      expect(ValidationUtils.validateMacAddress('00:11:22:33:44:55').isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0001', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0200
     * @tc.name: testValidationUtils0002
     * @tc.desc: Accept the hyphen separated MAC spelling as well.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0002', 'begin');
      const dash = ValidationUtils.validateMacAddress('1a-2b-3c-4d-5e-6f');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0002',
        '#1 ' + "dash.isValid" + ' = ' + JSON.stringify(dash.isValid));
      expect(dash.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0002',
        '#2 ' + "dash.errorCode" + ' = ' + JSON.stringify(dash.errorCode));
      expect(dash.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0002',
        '#3 assert ' + "expect(ValidationUtils.validateMacAddress('A1-B2-C3-D4-E5-F6').isValid).assertTrue()");
      expect(ValidationUtils.validateMacAddress('A1-B2-C3-D4-E5-F6').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0002',
        '#4 assert ' + "expect(ValidationUtils.validateMacAddress('1a:2b-3c:4d-5e:6f').isValid).assertTrue()");
      expect(ValidationUtils.validateMacAddress('1a:2b-3c:4d-5e:6f').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0002',
        '#5 assert ' + "expect(ValidationUtils.validateMacAddress('aabbccddeeff').isValid).assertFalse()");
      expect(ValidationUtils.validateMacAddress('aabbccddeeff').isValid).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0002', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0300
     * @tc.name: testValidationUtils0003
     * @tc.desc: Reject malformed MAC text with the format error code.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0003', 'begin');
      const short = ValidationUtils.validateMacAddress('00:11:22:33:44');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0003',
        '#1 ' + "short.isValid" + ' = ' + JSON.stringify(short.isValid));
      expect(short.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0003',
        '#2 ' + "short.errorMessage" + ' = ' + JSON.stringify(short.errorMessage));
      expect(short.errorMessage).assertEqual('Invalid MAC format');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0003',
        '#3 ' + "short.errorCode" + ' = ' + JSON.stringify(short.errorCode));
      expect(short.errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0003',
        '#4 assert ' + "expect(ValidationUtils.validateMacAddress('00:11:22:33:44:GG').isValid).assertFalse()");
      expect(ValidationUtils.validateMacAddress('00:11:22:33:44:GG').isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0003',
        '#5 assert ' + "expect(ValidationUtils.validateMacAddress('not-a-mac').errorCode).assertEqual(2)");
      expect(ValidationUtils.validateMacAddress('not-a-mac').errorCode).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0003', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0400
     * @tc.name: testValidationUtils0004
     * @tc.desc: Report the empty error before any format check for MAC.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0004', 'begin');
      const empty = ValidationUtils.validateMacAddress('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0004',
        '#1 ' + "empty.isValid" + ' = ' + JSON.stringify(empty.isValid));
      expect(empty.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0004',
        '#2 ' + "empty.errorMessage" + ' = ' + JSON.stringify(empty.errorMessage));
      expect(empty.errorMessage).assertEqual('MAC address is empty');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0004',
        '#3 ' + "empty.errorCode" + ' = ' + JSON.stringify(empty.errorCode));
      expect(empty.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0004',
        '#4 assert ' + "expect(ValidationUtils.validateMacAddress(':').errorCode).assertEqual(2)");
      expect(ValidationUtils.validateMacAddress(':').errorCode).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0004', 'end');
    });

    // ==================== UUID validation (4 cases) ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0500
     * @tc.name: testValidationUtils0005
     * @tc.desc: Accept a canonical hyphenated UUID in lower case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0005', 'begin');
      const result = ValidationUtils.validateUuid('00112233-4455-6677-8899-aabbccddeeff');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0005',
        '#1 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0005',
        '#2 ' + "result.errorCode" + ' = ' + JSON.stringify(result.errorCode));
      expect(result.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0005',
        '#3 ' + "result.errorMessage" + ' = ' + JSON.stringify(result.errorMessage));
      expect(result.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0005',
        '#4 assert ' +
        "expect(ValidationUtils.validateUuid('123e4567-e89b-12d3-a456-42661417404d').isValid).assertTrue()");
      expect(ValidationUtils.validateUuid('123e4567-e89b-12d3-a456-42661417404d').isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0005', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0600
     * @tc.name: testValidationUtils0006
     * @tc.desc: Accept upper case UUID characters without normalising them.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0006', 'begin');
      const upper = ValidationUtils.validateUuid('123E4567-E89B-12D3-A456-42661417404D');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0006',
        '#1 ' + "upper.isValid" + ' = ' + JSON.stringify(upper.isValid));
      expect(upper.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0006',
        '#2 ' + "upper.errorCode" + ' = ' + JSON.stringify(upper.errorCode));
      expect(upper.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0006',
        '#3 ' + "upper.errorMessage" + ' = ' + JSON.stringify(upper.errorMessage));
      expect(upper.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0006',
        '#4 assert ' +
        "expect(ValidationUtils.validateUuid('00112233445566778899AABBCCDDEEFF').isValid).assertFalse()");
      expect(ValidationUtils.validateUuid('00112233445566778899AABBCCDDEEFF').isValid).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0006', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0700
     * @tc.name: testValidationUtils0007
     * @tc.desc: Reject truncated or unparsable UUID payloads.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0007', 'begin');
      const cut = ValidationUtils.validateUuid('123e4567-e89b-12d3-a456');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0007',
        '#1 ' + "cut.isValid" + ' = ' + JSON.stringify(cut.isValid));
      expect(cut.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0007',
        '#2 ' + "cut.errorMessage" + ' = ' + JSON.stringify(cut.errorMessage));
      expect(cut.errorMessage).assertEqual('Invalid UUID format');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0007',
        '#3 ' + "cut.errorCode" + ' = ' + JSON.stringify(cut.errorCode));
      expect(cut.errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0007',
        '#4 assert ' + "expect(ValidationUtils.validateUuid('not-uuid').errorCode).assertEqual(2)");
      expect(ValidationUtils.validateUuid('not-uuid').errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0007',
        '#5 assert ' +
        "expect(ValidationUtils.validateUuid('00112233-4455-6677-8899-aabbccddeefg').isValid).assertFalse()");
      expect(ValidationUtils.validateUuid('00112233-4455-6677-8899-aabbccddeefg').isValid).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0007', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0800
     * @tc.name: testValidationUtils0008
     * @tc.desc: Flag an absent UUID with the dedicated empty error code.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0008', 'begin');
      const empty = ValidationUtils.validateUuid('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0008',
        '#1 ' + "empty.isValid" + ' = ' + JSON.stringify(empty.isValid));
      expect(empty.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0008',
        '#2 ' + "empty.errorMessage" + ' = ' + JSON.stringify(empty.errorMessage));
      expect(empty.errorMessage).assertEqual('UUID is empty');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0008',
        '#3 ' + "empty.errorCode" + ' = ' + JSON.stringify(empty.errorCode));
      expect(empty.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0008',
        '#4 assert ' + "expect(ValidationUtils.validateUuid('').errorCode).assertEqual(1)");
      expect(ValidationUtils.validateUuid('').errorCode).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0008', 'end');
    });

    // ==================== device name validation (2 cases) ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0900
     * @tc.name: testValidationUtils0009
     * @tc.desc: Approve ordinary and single character device names.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0009', 'begin');
      const result = ValidationUtils.validateDeviceName('BT-Headset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0009',
        '#1 ' + "result.isValid" + ' = ' + JSON.stringify(result.isValid));
      expect(result.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0009',
        '#2 ' + "result.errorCode" + ' = ' + JSON.stringify(result.errorCode));
      expect(result.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0009',
        '#3 ' + "result.errorMessage" + ' = ' + JSON.stringify(result.errorMessage));
      expect(result.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0009',
        '#4 assert ' + "expect(ValidationUtils.validateDeviceName('A').isValid).assertTrue()");
      expect(ValidationUtils.validateDeviceName('A').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0009',
        '#5 assert ' + "expect(ValidationUtils.validateDeviceName('中文设备名').isValid).assertTrue()");
      expect(ValidationUtils.validateDeviceName('中文设备名').isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0009', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1000
     * @tc.name: testValidationUtils0010
     * @tc.desc: Enforce the maximum device name length constant.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0010', 'begin');
      let base: string = '';
      for (let i: number = 0; i < BluetoothConstants.MAX_DEVICE_NAME_LENGTH; i++) {
        base = base + 'a';
      }
      const empty = ValidationUtils.validateDeviceName('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0010',
        '#1 ' + "empty.errorMessage" + ' = ' + JSON.stringify(empty.errorMessage));
      expect(empty.errorMessage).assertEqual('Device name is empty');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0010',
        '#2 ' + "empty.errorCode" + ' = ' + JSON.stringify(empty.errorCode));
      expect(empty.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0010',
        '#3 assert ' + "expect(ValidationUtils.validateDeviceName(base).isValid).assertTrue()");
      expect(ValidationUtils.validateDeviceName(base).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0010',
        '#4 ' + "base.length" + ' = ' + JSON.stringify(base.length));
      expect(base.length).assertEqual(BluetoothConstants.MAX_DEVICE_NAME_LENGTH);
      const tooLong = ValidationUtils.validateDeviceName(base + 'b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0010',
        '#5 ' + "tooLong.isValid" + ' = ' + JSON.stringify(tooLong.isValid));
      expect(tooLong.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0010',
        '#6 ' + "tooLong.errorMessage" + ' = ' + JSON.stringify(tooLong.errorMessage));
      expect(tooLong.errorMessage).assertEqual('Device name too long');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0010',
        '#7 ' + "tooLong.errorCode" + ' = ' + JSON.stringify(tooLong.errorCode));
      expect(tooLong.errorCode).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0010', 'end');
    });

    // ==================== RSSI and volume validation (4 cases) ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1100
     * @tc.name: testValidationUtils0011
     * @tc.desc: Accept RSSI values inside the supported signal window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0011', 'begin');
      const mid = ValidationUtils.validateRssi(-50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0011',
        '#1 ' + "mid.isValid" + ' = ' + JSON.stringify(mid.isValid));
      expect(mid.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0011',
        '#2 ' + "mid.errorCode" + ' = ' + JSON.stringify(mid.errorCode));
      expect(mid.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0011',
        '#3 ' + "mid.errorMessage" + ' = ' + JSON.stringify(mid.errorMessage));
      expect(mid.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0011',
        '#4 assert ' + "expect(ValidationUtils.validateRssi(0).isValid).assertTrue()");
      expect(ValidationUtils.validateRssi(0).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0011',
        '#5 assert ' + "expect(ValidationUtils.validateRssi(-120).isValid).assertTrue()");
      expect(ValidationUtils.validateRssi(-120).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0011', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1200
     * @tc.name: testValidationUtils0012
     * @tc.desc: Reject RSSI readings beyond both ends of the window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0012', 'begin');
      const weak = ValidationUtils.validateRssi(-121);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0012',
        '#1 ' + "weak.isValid" + ' = ' + JSON.stringify(weak.isValid));
      expect(weak.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0012',
        '#2 ' + "weak.errorMessage" + ' = ' + JSON.stringify(weak.errorMessage));
      expect(weak.errorMessage).assertEqual('RSSI out of range');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0012',
        '#3 ' + "weak.errorCode" + ' = ' + JSON.stringify(weak.errorCode));
      expect(weak.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0012',
        '#4 assert ' + "expect(ValidationUtils.validateRssi(1).isValid).assertFalse()");
      expect(ValidationUtils.validateRssi(1).isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0012',
        '#5 assert ' + "expect(ValidationUtils.validateRssi(100).errorCode).assertEqual(1)");
      expect(ValidationUtils.validateRssi(100).errorCode).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0012', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1300
     * @tc.name: testValidationUtils0013
     * @tc.desc: Validate volume against the implicit hundred step scale.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0013', 'begin');
      const half = ValidationUtils.validateVolume(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0013',
        '#1 ' + "half.isValid" + ' = ' + JSON.stringify(half.isValid));
      expect(half.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0013',
        '#2 ' + "half.errorCode" + ' = ' + JSON.stringify(half.errorCode));
      expect(half.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0013',
        '#3 ' + "half.errorMessage" + ' = ' + JSON.stringify(half.errorMessage));
      expect(half.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0013',
        '#4 assert ' + "expect(ValidationUtils.validateVolume(0).isValid).assertTrue()");
      expect(ValidationUtils.validateVolume(0).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0013',
        '#5 assert ' + "expect(ValidationUtils.validateVolume(100).isValid).assertTrue()");
      expect(ValidationUtils.validateVolume(100).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0013',
        '#6 assert ' + "expect(ValidationUtils.validateVolume(101).isValid).assertFalse()");
      expect(ValidationUtils.validateVolume(101).isValid).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0013', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1400
     * @tc.name: testValidationUtils0014
     * @tc.desc: Honour a custom ceiling when validating the volume level.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0014', 'begin');
      const limited = ValidationUtils.validateVolume(16, 15);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0014',
        '#1 ' + "limited.isValid" + ' = ' + JSON.stringify(limited.isValid));
      expect(limited.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0014',
        '#2 ' + "limited.errorMessage" + ' = ' + JSON.stringify(limited.errorMessage));
      expect(limited.errorMessage).assertEqual('Volume out of range');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0014',
        '#3 ' + "limited.errorCode" + ' = ' + JSON.stringify(limited.errorCode));
      expect(limited.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0014',
        '#4 assert ' + "expect(ValidationUtils.validateVolume(15, 15).isValid).assertTrue()");
      expect(ValidationUtils.validateVolume(15, 15).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0014',
        '#5 assert ' + "expect(ValidationUtils.validateVolume(-1, 15).isValid).assertFalse()");
      expect(ValidationUtils.validateVolume(-1, 15).isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0014',
        '#6 assert ' + "expect(ValidationUtils.validateVolume(60, 127).isValid).assertTrue()");
      expect(ValidationUtils.validateVolume(60, 127).isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0014', 'end');
    });

    // ==================== phone and IP validation (4 cases) ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1500
     * @tc.name: testValidationUtils0015
     * @tc.desc: Accept plain, prefixed and bracketed phone spellings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0015', 'begin');
      const plain = ValidationUtils.validatePhoneNumber('13800138000');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0015',
        '#1 ' + "plain.isValid" + ' = ' + JSON.stringify(plain.isValid));
      expect(plain.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0015',
        '#2 ' + "plain.errorCode" + ' = ' + JSON.stringify(plain.errorCode));
      expect(plain.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0015',
        '#3 ' + "plain.errorMessage" + ' = ' + JSON.stringify(plain.errorMessage));
      expect(plain.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0015',
        '#4 assert ' + "expect(ValidationUtils.validatePhoneNumber('+86 138-0013-8000').isValid).assertTrue()");
      expect(ValidationUtils.validatePhoneNumber('+86 138-0013-8000').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0015',
        '#5 assert ' + "expect(ValidationUtils.validatePhoneNumber('(010) 1234 5678').isValid).assertTrue()");
      expect(ValidationUtils.validatePhoneNumber('(010) 1234 5678').isValid).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0015', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1600
     * @tc.name: testValidationUtils0016
     * @tc.desc: Reject letters and too short digit runs as phone numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0016', 'begin');
      const short = ValidationUtils.validatePhoneNumber('123');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0016',
        '#1 ' + "short.isValid" + ' = ' + JSON.stringify(short.isValid));
      expect(short.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0016',
        '#2 ' + "short.errorMessage" + ' = ' + JSON.stringify(short.errorMessage));
      expect(short.errorMessage).assertEqual('Invalid phone format');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0016',
        '#3 ' + "short.errorCode" + ' = ' + JSON.stringify(short.errorCode));
      expect(short.errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0016',
        '#4 assert ' + "expect(ValidationUtils.validatePhoneNumber('abcdefgh').isValid).assertFalse()");
      expect(ValidationUtils.validatePhoneNumber('abcdefgh').isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0016',
        '#5 assert ' + "expect(ValidationUtils.validatePhoneNumber('13800138000x').errorCode).assertEqual(2)");
      expect(ValidationUtils.validatePhoneNumber('13800138000x').errorCode).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0016', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1700
     * @tc.name: testValidationUtils0017
     * @tc.desc: Distinguish empty phone input from malformed phone input.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0017', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0017', 'begin');
      const empty = ValidationUtils.validatePhoneNumber('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0017',
        '#1 ' + "empty.isValid" + ' = ' + JSON.stringify(empty.isValid));
      expect(empty.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0017',
        '#2 ' + "empty.errorMessage" + ' = ' + JSON.stringify(empty.errorMessage));
      expect(empty.errorMessage).assertEqual('Phone number is empty');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0017',
        '#3 ' + "empty.errorCode" + ' = ' + JSON.stringify(empty.errorCode));
      expect(empty.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0017',
        '#4 assert ' + "expect(ValidationUtils.validatePhoneNumber(' ').errorCode).assertEqual(2)");
      expect(ValidationUtils.validatePhoneNumber('   ').errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0017',
        '#5 assert ' + "expect(ValidationUtils.validatePhoneNumber(' ').isValid).assertFalse()");
      expect(ValidationUtils.validatePhoneNumber('   ').isValid).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0017', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1800
     * @tc.name: testValidationUtils0018
     * @tc.desc: Check IPv4 octets and reject values above the byte ceiling.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0018', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0018', 'begin');
      const lan = ValidationUtils.validateIpAddress('192.168.1.1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#1 ' + "lan.isValid" + ' = ' + JSON.stringify(lan.isValid));
      expect(lan.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#2 ' + "lan.errorCode" + ' = ' + JSON.stringify(lan.errorCode));
      expect(lan.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#3 ' + "lan.errorMessage" + ' = ' + JSON.stringify(lan.errorMessage));
      expect(lan.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#4 assert ' + "expect(ValidationUtils.validateIpAddress('0.0.0.0').isValid).assertTrue()");
      expect(ValidationUtils.validateIpAddress('0.0.0.0').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#5 assert ' + "expect(ValidationUtils.validateIpAddress('255.255.255.255').isValid).assertTrue()");
      expect(ValidationUtils.validateIpAddress('255.255.255.255').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#6 assert ' + "expect(ValidationUtils.validateIpAddress('256.1.1.1').isValid).assertFalse()");
      expect(ValidationUtils.validateIpAddress('256.1.1.1').isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#7 assert ' + "expect(ValidationUtils.validateIpAddress('192.168.1').errorCode).assertEqual(2)");
      expect(ValidationUtils.validateIpAddress('192.168.1').errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0018',
        '#8 assert ' + "expect(ValidationUtils.validateIpAddress('').errorMessage).assertEqual('IP address is empty')");
      expect(ValidationUtils.validateIpAddress('').errorMessage).assertEqual('IP address is empty');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0018', 'end');
    });

    // ==================== general non empty, range range and length degree validation (2 cases) ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1900
     * @tc.name: testValidationUtils0019
     * @tc.desc: Require visible characters and name the offending field.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0019', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0019', 'begin');
      const filled = ValidationUtils.validateNonEmpty('Headset', 'deviceName');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0019',
        '#1 ' + "filled.isValid" + ' = ' + JSON.stringify(filled.isValid));
      expect(filled.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0019',
        '#2 ' + "filled.errorCode" + ' = ' + JSON.stringify(filled.errorCode));
      expect(filled.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0019',
        '#3 ' + "filled.errorMessage" + ' = ' + JSON.stringify(filled.errorMessage));
      expect(filled.errorMessage).assertEqual('');
      const blank = ValidationUtils.validateNonEmpty('   ', 'deviceName');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0019',
        '#4 ' + "blank.isValid" + ' = ' + JSON.stringify(blank.isValid));
      expect(blank.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0019',
        '#5 ' + "blank.errorMessage" + ' = ' + JSON.stringify(blank.errorMessage));
      expect(blank.errorMessage).assertEqual('deviceName is required');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0019',
        '#6 ' + "blank.errorCode" + ' = ' + JSON.stringify(blank.errorCode));
      expect(blank.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0019',
        '#7 assert ' +
        "expect(ValidationUtils.validateNonEmpty('', 'macAddress').errorMessage) .assertEqual('macAddress is require" +
        "d')");
      expect(ValidationUtils.validateNonEmpty('', 'macAddress').errorMessage)
        .assertEqual('macAddress is required');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0019', 'end');
    });

    /*
     * @tc.number: SUB_VALIDATION_UTILS_2000
     * @tc.name: testValidationUtils0020
     * @tc.desc: Bound numeric ranges and string lengths with field messages.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testValidationUtils0020', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0020', 'begin');
      const inside = ValidationUtils.validateRange(5, 1, 10, 'level');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#1 ' + "inside.isValid" + ' = ' + JSON.stringify(inside.isValid));
      expect(inside.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#2 assert ' + "expect(ValidationUtils.validateRange(1, 1, 10, 'level').isValid).assertTrue()");
      expect(ValidationUtils.validateRange(1, 1, 10, 'level').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#3 assert ' + "expect(ValidationUtils.validateRange(10, 1, 10, 'level').isValid).assertTrue()");
      expect(ValidationUtils.validateRange(10, 1, 10, 'level').isValid).assertTrue();
      const outside = ValidationUtils.validateRange(0, 1, 10, 'level');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#4 ' + "outside.isValid" + ' = ' + JSON.stringify(outside.isValid));
      expect(outside.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#5 ' + "outside.errorMessage" + ' = ' + JSON.stringify(outside.errorMessage));
      expect(outside.errorMessage).assertEqual('level out of range [1, 10]');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#6 ' + "outside.errorCode" + ' = ' + JSON.stringify(outside.errorCode));
      expect(outside.errorCode).assertEqual(1);
      const shortText = ValidationUtils.validateLength('a', 2, 5, 'code');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#7 ' + "shortText.isValid" + ' = ' + JSON.stringify(shortText.isValid));
      expect(shortText.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#8 ' + "shortText.errorMessage" + ' = ' + JSON.stringify(shortText.errorMessage));
      expect(shortText.errorMessage).assertEqual('code length must be 2-5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#9 assert ' + "expect(ValidationUtils.validateLength('abcde', 2, 5, 'code').isValid).assertTrue()");
      expect(ValidationUtils.validateLength('abcde', 2, 5, 'code').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testValidationUtils0020',
        '#10 assert ' + "expect(ValidationUtils.validateLength('', 0, 5, 'code').isValid).assertFalse()");
      expect(ValidationUtils.validateLength('', 0, 5, 'code').isValid).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testValidationUtils0020', 'end');
    });
  });
}
