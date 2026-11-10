/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BluetoothConstants, ValidationUtils } from 'library';

/**
 * Test suite for ValidationUtils.
 * @since 26.0.0
 */
export default function validationUtilsTest(): void {
  describe('ValidationUtilsTest', () => {
    // ==================== MAC 地址校验（4 条） ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0100
     * @tc.name: testValidationUtils0001
     * @tc.desc: Accept a colon separated MAC address of mixed letter case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0001', 0, () => {
      const result = ValidationUtils.validateMacAddress('00:11:22:33:44:FF');
      expect(result.isValid).assertTrue();
      expect(result.errorCode).assertEqual(0);
      expect(result.errorMessage).assertEqual('');
      expect(ValidationUtils.validateMacAddress('00:11:22:33:44:55').isValid).assertTrue();
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
      const dash = ValidationUtils.validateMacAddress('aa-bb-cc-dd-ee-ff');
      expect(dash.isValid).assertTrue();
      expect(dash.errorCode).assertEqual(0);
      expect(ValidationUtils.validateMacAddress('A1-B2-C3-D4-E5-F6').isValid).assertTrue();
      expect(ValidationUtils.validateMacAddress('aa:bb-cc:dd-ee:ff').isValid).assertTrue();
      expect(ValidationUtils.validateMacAddress('aabbccddeeff').isValid).assertFalse();
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
      const short = ValidationUtils.validateMacAddress('00:11:22:33:44');
      expect(short.isValid).assertFalse();
      expect(short.errorMessage).assertEqual('Invalid MAC format');
      expect(short.errorCode).assertEqual(2);
      expect(ValidationUtils.validateMacAddress('00:11:22:33:44:GG').isValid).assertFalse();
      expect(ValidationUtils.validateMacAddress('not-a-mac').errorCode).assertEqual(2);
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
      const empty = ValidationUtils.validateMacAddress('');
      expect(empty.isValid).assertFalse();
      expect(empty.errorMessage).assertEqual('MAC address is empty');
      expect(empty.errorCode).assertEqual(1);
      expect(ValidationUtils.validateMacAddress(':').errorCode).assertEqual(2);
    });

    // ==================== UUID 校验（4 条） ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0500
     * @tc.name: testValidationUtils0005
     * @tc.desc: Accept a canonical hyphenated UUID in lower case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0005', 0, () => {
      const result = ValidationUtils.validateUuid('00112233-4455-6677-8899-aabbccddeeff');
      expect(result.isValid).assertTrue();
      expect(result.errorCode).assertEqual(0);
      expect(result.errorMessage).assertEqual('');
      expect(ValidationUtils.validateUuid('123e4567-e89b-12d3-a456-42661417404d').isValid).assertTrue();
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
      const upper = ValidationUtils.validateUuid('123E4567-E89B-12D3-A456-42661417404D');
      expect(upper.isValid).assertTrue();
      expect(upper.errorCode).assertEqual(0);
      expect(upper.errorMessage).assertEqual('');
      expect(ValidationUtils.validateUuid('00112233445566778899AABBCCDDEEFF').isValid).assertFalse();
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
      const cut = ValidationUtils.validateUuid('123e4567-e89b-12d3-a456');
      expect(cut.isValid).assertFalse();
      expect(cut.errorMessage).assertEqual('Invalid UUID format');
      expect(cut.errorCode).assertEqual(2);
      expect(ValidationUtils.validateUuid('not-uuid').errorCode).assertEqual(2);
      expect(ValidationUtils.validateUuid('00112233-4455-6677-8899-aabbccddeefg').isValid).assertFalse();
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
      const empty = ValidationUtils.validateUuid('');
      expect(empty.isValid).assertFalse();
      expect(empty.errorMessage).assertEqual('UUID is empty');
      expect(empty.errorCode).assertEqual(1);
      expect(ValidationUtils.validateUuid('').errorCode).assertEqual(1);
    });

    // ==================== 设备名校验（2 条） ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_0900
     * @tc.name: testValidationUtils0009
     * @tc.desc: Approve ordinary and single character device names.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0009', 0, () => {
      const result = ValidationUtils.validateDeviceName('BT-Headset');
      expect(result.isValid).assertTrue();
      expect(result.errorCode).assertEqual(0);
      expect(result.errorMessage).assertEqual('');
      expect(ValidationUtils.validateDeviceName('A').isValid).assertTrue();
      expect(ValidationUtils.validateDeviceName('中文设备名').isValid).assertTrue();
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
      let base: string = '';
      for (let i: number = 0; i < BluetoothConstants.MAX_DEVICE_NAME_LENGTH; i++) {
        base = base + 'a';
      }
      const empty = ValidationUtils.validateDeviceName('');
      expect(empty.errorMessage).assertEqual('Device name is empty');
      expect(empty.errorCode).assertEqual(1);
      expect(ValidationUtils.validateDeviceName(base).isValid).assertTrue();
      expect(base.length).assertEqual(BluetoothConstants.MAX_DEVICE_NAME_LENGTH);
      const tooLong = ValidationUtils.validateDeviceName(base + 'b');
      expect(tooLong.isValid).assertFalse();
      expect(tooLong.errorMessage).assertEqual('Device name too long');
      expect(tooLong.errorCode).assertEqual(2);
    });

    // ==================== RSSI 与音量校验（4 条） ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1100
     * @tc.name: testValidationUtils0011
     * @tc.desc: Accept RSSI values inside the supported signal window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0011', 0, () => {
      const mid = ValidationUtils.validateRssi(-50);
      expect(mid.isValid).assertTrue();
      expect(mid.errorCode).assertEqual(0);
      expect(mid.errorMessage).assertEqual('');
      expect(ValidationUtils.validateRssi(0).isValid).assertTrue();
      expect(ValidationUtils.validateRssi(-120).isValid).assertTrue();
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
      const weak = ValidationUtils.validateRssi(-121);
      expect(weak.isValid).assertFalse();
      expect(weak.errorMessage).assertEqual('RSSI out of range');
      expect(weak.errorCode).assertEqual(1);
      expect(ValidationUtils.validateRssi(1).isValid).assertFalse();
      expect(ValidationUtils.validateRssi(100).errorCode).assertEqual(1);
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
      const half = ValidationUtils.validateVolume(50);
      expect(half.isValid).assertTrue();
      expect(half.errorCode).assertEqual(0);
      expect(half.errorMessage).assertEqual('');
      expect(ValidationUtils.validateVolume(0).isValid).assertTrue();
      expect(ValidationUtils.validateVolume(100).isValid).assertTrue();
      expect(ValidationUtils.validateVolume(101).isValid).assertFalse();
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
      const limited = ValidationUtils.validateVolume(16, 15);
      expect(limited.isValid).assertFalse();
      expect(limited.errorMessage).assertEqual('Volume out of range');
      expect(limited.errorCode).assertEqual(1);
      expect(ValidationUtils.validateVolume(15, 15).isValid).assertTrue();
      expect(ValidationUtils.validateVolume(-1, 15).isValid).assertFalse();
      expect(ValidationUtils.validateVolume(60, 127).isValid).assertTrue();
    });

    // ==================== 电话与 IP 校验（4 条） ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1500
     * @tc.name: testValidationUtils0015
     * @tc.desc: Accept plain, prefixed and bracketed phone spellings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0015', 0, () => {
      const plain = ValidationUtils.validatePhoneNumber('13800138000');
      expect(plain.isValid).assertTrue();
      expect(plain.errorCode).assertEqual(0);
      expect(plain.errorMessage).assertEqual('');
      expect(ValidationUtils.validatePhoneNumber('+86 138-0013-8000').isValid).assertTrue();
      expect(ValidationUtils.validatePhoneNumber('(010) 1234 5678').isValid).assertTrue();
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
      const short = ValidationUtils.validatePhoneNumber('123');
      expect(short.isValid).assertFalse();
      expect(short.errorMessage).assertEqual('Invalid phone format');
      expect(short.errorCode).assertEqual(2);
      expect(ValidationUtils.validatePhoneNumber('abcdefgh').isValid).assertFalse();
      expect(ValidationUtils.validatePhoneNumber('13800138000x').errorCode).assertEqual(2);
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
      const empty = ValidationUtils.validatePhoneNumber('');
      expect(empty.isValid).assertFalse();
      expect(empty.errorMessage).assertEqual('Phone number is empty');
      expect(empty.errorCode).assertEqual(1);
      expect(ValidationUtils.validatePhoneNumber('   ').errorCode).assertEqual(2);
      expect(ValidationUtils.validatePhoneNumber('   ').isValid).assertFalse();
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
      const lan = ValidationUtils.validateIpAddress('192.168.1.1');
      expect(lan.isValid).assertTrue();
      expect(lan.errorCode).assertEqual(0);
      expect(lan.errorMessage).assertEqual('');
      expect(ValidationUtils.validateIpAddress('0.0.0.0').isValid).assertTrue();
      expect(ValidationUtils.validateIpAddress('255.255.255.255').isValid).assertTrue();
      expect(ValidationUtils.validateIpAddress('256.1.1.1').isValid).assertFalse();
      expect(ValidationUtils.validateIpAddress('192.168.1').errorCode).assertEqual(2);
      expect(ValidationUtils.validateIpAddress('').errorMessage).assertEqual('IP address is empty');
    });

    // ==================== 通用非空、范围与长度校验（2 条） ====================

    /*
     * @tc.number: SUB_VALIDATION_UTILS_1900
     * @tc.name: testValidationUtils0019
     * @tc.desc: Require visible characters and name the offending field.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testValidationUtils0019', 0, () => {
      const filled = ValidationUtils.validateNonEmpty('Headset', 'deviceName');
      expect(filled.isValid).assertTrue();
      expect(filled.errorCode).assertEqual(0);
      expect(filled.errorMessage).assertEqual('');
      const blank = ValidationUtils.validateNonEmpty('   ', 'deviceName');
      expect(blank.isValid).assertFalse();
      expect(blank.errorMessage).assertEqual('deviceName is required');
      expect(blank.errorCode).assertEqual(1);
      expect(ValidationUtils.validateNonEmpty('', 'macAddress').errorMessage)
        .assertEqual('macAddress is required');
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
      const inside = ValidationUtils.validateRange(5, 1, 10, 'level');
      expect(inside.isValid).assertTrue();
      expect(ValidationUtils.validateRange(1, 1, 10, 'level').isValid).assertTrue();
      expect(ValidationUtils.validateRange(10, 1, 10, 'level').isValid).assertTrue();
      const outside = ValidationUtils.validateRange(0, 1, 10, 'level');
      expect(outside.isValid).assertFalse();
      expect(outside.errorMessage).assertEqual('level out of range [1, 10]');
      expect(outside.errorCode).assertEqual(1);
      const shortText = ValidationUtils.validateLength('a', 2, 5, 'code');
      expect(shortText.isValid).assertFalse();
      expect(shortText.errorMessage).assertEqual('code length must be 2-5');
      expect(ValidationUtils.validateLength('abcde', 2, 5, 'code').isValid).assertTrue();
      expect(ValidationUtils.validateLength('', 0, 5, 'code').isValid).assertFalse();
    });
  });
}
