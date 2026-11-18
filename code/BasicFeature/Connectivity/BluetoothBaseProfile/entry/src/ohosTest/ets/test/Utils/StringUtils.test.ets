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
import { StringUtils } from 'library';

/**
 * Test suite for StringUtils.
 * @since 26.0.0
 */
export default function stringUtilsTest(): void {
  describe('StringUtilsTest', () => {
    // ==================== first character mother large small write (2 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_0100
     * @tc.name: testStringUtils0001
     * @tc.desc: Capitalize the first character and keep the tail untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0001', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0001',
        '#1 assert ' + "expect(StringUtils.capitalize('bluetooth')).assertEqual('Bluetooth')");
      expect(StringUtils.capitalize('bluetooth')).assertEqual('Bluetooth');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0001',
        '#2 assert ' + "expect(StringUtils.capitalize('A2dp')).assertEqual('A2dp')");
      expect(StringUtils.capitalize('A2dp')).assertEqual('A2dp');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0001',
        '#3 assert ' + "expect(StringUtils.capitalize('1device')).assertEqual('1device')");
      expect(StringUtils.capitalize('1device')).assertEqual('1device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0001',
        '#4 assert ' + "expect(StringUtils.capitalize('')).assertEqual('')");
      expect(StringUtils.capitalize('')).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0001', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_0200
     * @tc.name: testStringUtils0002
     * @tc.desc: Uncapitalize an upper case head and pass empty text through.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0002', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0002',
        '#1 assert ' + "expect(StringUtils.uncapitalize('Bluetooth')).assertEqual('bluetooth')");
      expect(StringUtils.uncapitalize('Bluetooth')).assertEqual('bluetooth');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0002',
        '#2 assert ' + "expect(StringUtils.uncapitalize('HfpService')).assertEqual('hfpService')");
      expect(StringUtils.uncapitalize('HfpService')).assertEqual('hfpService');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0002',
        '#3 assert ' + "expect(StringUtils.uncapitalize('')).assertEqual('')");
      expect(StringUtils.uncapitalize('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0002',
        '#4 assert ' + "expect(StringUtils.uncapitalize('a')).assertEqual('a')");
      expect(StringUtils.uncapitalize('a')).assertEqual('a');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0002', 'end');
    });

    // ==================== naming style convert (5 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_0300
     * @tc.name: testStringUtils0003
     * @tc.desc: Convert snake and kebab sources into camel case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0003', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0003',
        '#1 assert ' + "expect(StringUtils.toCamelCase('hello_world_foo')).assertEqual('helloWorldFoo')");
      expect(StringUtils.toCamelCase('hello_world_foo')).assertEqual('helloWorldFoo');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0003',
        '#2 assert ' + "expect(StringUtils.toCamelCase('device-name-card')).assertEqual('deviceNameCard')");
      expect(StringUtils.toCamelCase('device-name-card')).assertEqual('deviceNameCard');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0003',
        '#3 assert ' + "expect(StringUtils.toCamelCase('BluetoothDeviceCard')).assertEqual('bluetoothDeviceCard')");
      expect(StringUtils.toCamelCase('BluetoothDeviceCard')).assertEqual('bluetoothDeviceCard');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0003',
        '#4 assert ' + "expect(StringUtils.toCamelCase('single')).assertEqual('single')");
      expect(StringUtils.toCamelCase('single')).assertEqual('single');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0003', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_0400
     * @tc.name: testStringUtils0004
     * @tc.desc: Split Pascal boundaries into lower case snake identifiers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0004', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0004',
        '#1 assert ' + "expect(StringUtils.toSnakeCase('toCamelCase')).assertEqual('to_camel_case')");
      expect(StringUtils.toSnakeCase('toCamelCase')).assertEqual('to_camel_case');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0004',
        '#2 assert ' + "expect(StringUtils.toSnakeCase('device_name')).assertEqual('device_name')");
      expect(StringUtils.toSnakeCase('device_name')).assertEqual('device_name');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0004',
        '#3 assert ' + "expect(StringUtils.toSnakeCase('Headset Device')).assertEqual('headset_device')");
      expect(StringUtils.toSnakeCase('Headset Device')).assertEqual('headset_device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0004',
        '#4 assert ' + "expect(StringUtils.toSnakeCase('ABC')).assertEqual('abc')");
      expect(StringUtils.toSnakeCase('ABC')).assertEqual('abc');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0004', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_0500
     * @tc.name: testStringUtils0005
     * @tc.desc: Join separated words with a single hyphen in kebab case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0005', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0005',
        '#1 assert ' + "expect(StringUtils.toKebabCase('device_name')).assertEqual('device-name')");
      expect(StringUtils.toKebabCase('device_name')).assertEqual('device-name');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0005',
        '#2 assert ' + "expect(StringUtils.toKebabCase('MediaControlPanel')).assertEqual('media-control-panel')");
      expect(StringUtils.toKebabCase('MediaControlPanel')).assertEqual('media-control-panel');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0005',
        '#3 assert ' + "expect(StringUtils.toKebabCase('already-kebab')).assertEqual('already-kebab')");
      expect(StringUtils.toKebabCase('already-kebab')).assertEqual('already-kebab');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0005',
        '#4 assert ' + "expect(StringUtils.toKebabCase('Audio Video')).assertEqual('audio-video')");
      expect(StringUtils.toKebabCase('Audio Video')).assertEqual('audio-video');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0005', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_0600
     * @tc.name: testStringUtils0006
     * @tc.desc: Return the source unchanged for empty and blank conversions.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0006', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0006',
        '#1 assert ' + "expect(StringUtils.toCamelCase('')).assertEqual('')");
      expect(StringUtils.toCamelCase('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0006',
        '#2 assert ' + "expect(StringUtils.toSnakeCase('')).assertEqual('')");
      expect(StringUtils.toSnakeCase('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0006',
        '#3 assert ' + "expect(StringUtils.toKebabCase('')).assertEqual('')");
      expect(StringUtils.toKebabCase('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0006',
        '#4 assert ' + "expect(StringUtils.toCamelCase(' ')).assertEqual(' ')");
      expect(StringUtils.toCamelCase('   ')).assertEqual('   ');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0006', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_0700
     * @tc.name: testStringUtils0007
     * @tc.desc: Repeat separators and mixed boundaries into stable words.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0007', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0007',
        '#1 assert ' + "expect(StringUtils.toSnakeCase('a__b---c')).assertEqual('a_b_c')");
      expect(StringUtils.toSnakeCase('a__b---c')).assertEqual('a_b_c');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0007',
        '#2 assert ' + "expect(StringUtils.toCamelCase(' padded word')).assertEqual('paddedWord')");
      expect(StringUtils.toCamelCase('  padded  word')).assertEqual('paddedWord');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0007',
        '#3 assert ' + "expect(StringUtils.toKebabCase('HTTPServer')).assertEqual('httpserver')");
      expect(StringUtils.toKebabCase('HTTPServer')).assertEqual('httpserver');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0007',
        '#4 assert ' + "expect(StringUtils.toCamelCase('HTTPServer')).assertEqual('httpserver')");
      expect(StringUtils.toCamelCase('HTTPServer')).assertEqual('httpserver');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0007', 'end');
    });

    // ==================== package contain and prefix and suffix (3 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_0800
     * @tc.name: testStringUtils0008
     * @tc.desc: Detect a substring at the head, middle, tail and absence.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0008', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0008',
        '#1 assert ' + "expect(StringUtils.contains('Bluetooth Headset', 'Headset')).assertTrue()");
      expect(StringUtils.contains('Bluetooth Headset', 'Headset')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0008',
        '#2 assert ' + "expect(StringUtils.contains('Bluetooth Headset', 'Bluetooth')).assertTrue()");
      expect(StringUtils.contains('Bluetooth Headset', 'Bluetooth')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0008',
        '#3 assert ' + "expect(StringUtils.contains('Bluetooth Headset', 'watch')).assertFalse()");
      expect(StringUtils.contains('Bluetooth Headset', 'watch')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0008',
        '#4 assert ' + "expect(StringUtils.contains('', 'a')).assertFalse()");
      expect(StringUtils.contains('', 'a')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0008',
        '#5 assert ' + "expect(StringUtils.contains('abc', '')).assertFalse()");
      expect(StringUtils.contains('abc', '')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0008', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_0900
     * @tc.name: testStringUtils0009
     * @tc.desc: Match only prefixes anchored at the first character.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0009', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0009',
        '#1 assert ' + "expect(StringUtils.startsWith('A2dpSource', 'A2dp')).assertTrue()");
      expect(StringUtils.startsWith('A2dpSource', 'A2dp')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0009',
        '#2 assert ' + "expect(StringUtils.startsWith('A2dpSource', 'Source')).assertFalse()");
      expect(StringUtils.startsWith('A2dpSource', 'Source')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0009',
        '#3 assert ' + "expect(StringUtils.startsWith('A2dpSource', 'A2dpSource')).assertTrue()");
      expect(StringUtils.startsWith('A2dpSource', 'A2dpSource')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0009',
        '#4 assert ' + "expect(StringUtils.startsWith('', 'a')).assertFalse()");
      expect(StringUtils.startsWith('', 'a')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0009',
        '#5 assert ' + "expect(StringUtils.startsWith('abc', '')).assertFalse()");
      expect(StringUtils.startsWith('abc', '')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0009', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_1000
     * @tc.name: testStringUtils0010
     * @tc.desc: Match suffixes anchored at the last character.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0010', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0010',
        '#1 assert ' + "expect(StringUtils.endsWith('A2dpSource', 'Source')).assertTrue()");
      expect(StringUtils.endsWith('A2dpSource', 'Source')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0010',
        '#2 assert ' + "expect(StringUtils.endsWith('xxxx', 'xx')).assertTrue()");
      expect(StringUtils.endsWith('xxxx', 'xx')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0010',
        '#3 assert ' + "expect(StringUtils.endsWith('A2dpSource', 'A2dp')).assertFalse()");
      expect(StringUtils.endsWith('A2dpSource', 'A2dp')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0010',
        '#4 assert ' + "expect(StringUtils.endsWith('', 'a')).assertFalse()");
      expect(StringUtils.endsWith('', 'a')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0010',
        '#5 assert ' + "expect(StringUtils.endsWith('abc', '')).assertFalse()");
      expect(StringUtils.endsWith('abc', '')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0010', 'end');
    });

    // ==================== count number and weight repeat (3 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1100
     * @tc.name: testStringUtils0011
     * @tc.desc: Count overlapping and separated occurrences of a needle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0011', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0011',
        '#1 assert ' + "expect(StringUtils.countOccurrences('hello world', 'o')).assertEqual(2)");
      expect(StringUtils.countOccurrences('hello world', 'o')).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0011',
        '#2 assert ' + "expect(StringUtils.countOccurrences('xxxx', 'xx')).assertEqual(3)");
      expect(StringUtils.countOccurrences('xxxx', 'xx')).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0011',
        '#3 assert ' + "expect(StringUtils.countOccurrences('abc', 'z')).assertEqual(0)");
      expect(StringUtils.countOccurrences('abc', 'z')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0011',
        '#4 assert ' + "expect(StringUtils.countOccurrences('', 'a')).assertEqual(0)");
      expect(StringUtils.countOccurrences('', 'a')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0011',
        '#5 assert ' + "expect(StringUtils.countOccurrences('abc', '')).assertEqual(0)");
      expect(StringUtils.countOccurrences('abc', '')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0011', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_1200
     * @tc.name: testStringUtils0012
     * @tc.desc: Repeat a fragment a positive number of times.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0012', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0012',
        '#1 assert ' + "expect(StringUtils.repeat('ab', 3)).assertEqual('ababab')");
      expect(StringUtils.repeat('ab', 3)).assertEqual('ababab');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0012',
        '#2 assert ' + "expect(StringUtils.repeat('x', 1)).assertEqual('x')");
      expect(StringUtils.repeat('x', 1)).assertEqual('x');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0012',
        '#3 assert ' + "expect(StringUtils.repeat('-', 10).length).assertEqual(10)");
      expect(StringUtils.repeat('-', 10).length).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0012',
        '#4 assert ' + "expect(StringUtils.repeat('abc', 2)).assertEqual('abcabc')");
      expect(StringUtils.repeat('abc', 2)).assertEqual('abcabc');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0012', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_1300
     * @tc.name: testStringUtils0013
     * @tc.desc: Yield empty text for non positive or blank repeat requests.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0013', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0013',
        '#1 assert ' + "expect(StringUtils.repeat('ab', 0)).assertEqual('')");
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0013',
        '#2 assert ' + "expect(StringUtils.repeat('ab', -3)).assertEqual('')");
      expect(StringUtils.repeat('ab', -3)).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0013',
        '#3 assert ' + "expect(StringUtils.repeat('', 5)).assertEqual('')");
      expect(StringUtils.repeat('', 5)).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0013',
        '#4 assert ' + "expect(StringUtils.repeat('ab', 0).length).assertEqual(0)");
      expect(StringUtils.repeat('ab', 0).length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0013', 'end');
    });

    // ==================== reverse and remove whitespace (2 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1400
     * @tc.name: testStringUtils0014
     * @tc.desc: Reverse ordinary, single character and symmetric text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0014', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0014',
        '#1 assert ' + "expect(StringUtils.reverse('abc')).assertEqual('cba')");
      expect(StringUtils.reverse('abc')).assertEqual('cba');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0014',
        '#2 assert ' + "expect(StringUtils.reverse('a')).assertEqual('a')");
      expect(StringUtils.reverse('a')).assertEqual('a');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0014',
        '#3 assert ' + "expect(StringUtils.reverse('Headset')).assertEqual('tesdaeH')");
      expect(StringUtils.reverse('Headset')).assertEqual('tesdaeH');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0014',
        '#4 assert ' + "expect(StringUtils.reverse('')).assertEqual('')");
      expect(StringUtils.reverse('')).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0014', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_1500
     * @tc.name: testStringUtils0015
     * @tc.desc: Strip spaces, tabs and line breaks out of mixed text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0015', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0015',
        '#1 assert ' + "expect(StringUtils.removeWhitespace('a b\\tc\\nd')).assertEqual('abcd')");
      expect(StringUtils.removeWhitespace('a b\tc\nd')).assertEqual('abcd');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0015',
        '#2 assert ' + "expect(StringUtils.removeWhitespace(' ')).assertEqual('')");
      expect(StringUtils.removeWhitespace('   ')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0015',
        '#3 assert ' + "expect(StringUtils.removeWhitespace('nospace')).assertEqual('nospace')");
      expect(StringUtils.removeWhitespace('nospace')).assertEqual('nospace');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0015',
        '#4 assert ' + "expect(StringUtils.removeWhitespace('')).assertEqual('')");
      expect(StringUtils.removeWhitespace('')).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0015', 'end');
    });

    // ==================== random string generate (3 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1600
     * @tc.name: testStringUtils0016
     * @tc.desc: Produce an alphanumeric token of the requested length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0016', 'begin');
      const token: string = StringUtils.generateRandomString(16);
      let alnum: boolean = true;
      for (let i: number = 0; i < token.length; i++) {
        const code: number = token.charCodeAt(i);
        const valid: boolean = (code >= 48 && code <= 57) || (code >= 65 && code <= 90) ||
          (code >= 97 && code <= 122);
        if (!valid) {
          alnum = false;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0016',
        '#1 ' + "token.length" + ' = ' + JSON.stringify(token.length));
      expect(token.length).assertEqual(16);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0016',
        '#2 ' + "alnum" + ' = ' + JSON.stringify(alnum));
      expect(alnum).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0016',
        '#3 assert ' + "expect(StringUtils.generateRandomString(0)).assertEqual('')");
      expect(StringUtils.generateRandomString(0)).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0016',
        '#4 assert ' + "expect(StringUtils.generateRandomString(4).length).assertEqual(4)");
      expect(StringUtils.generateRandomString(4).length).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0016', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_1700
     * @tc.name: testStringUtils0017
     * @tc.desc: Draw different tokens from the generator on repeated calls.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0017', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0017', 'begin');
      const first: string = StringUtils.generateRandomString(20);
      const second: string = StringUtils.generateRandomString(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0017',
        '#1 ' + "first.length" + ' = ' + JSON.stringify(first.length));
      expect(first.length).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0017',
        '#2 ' + "second.length" + ' = ' + JSON.stringify(second.length));
      expect(second.length).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0017',
        '#3 ' + "first === second" + ' = ' + JSON.stringify(first === second));
      expect(first === second).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0017',
        '#4 assert ' + "expect(first.indexOf(' ') === -1).assertTrue()");
      expect(first.indexOf(' ') === -1).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0017', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_1800
     * @tc.name: testStringUtils0018
     * @tc.desc: Restrict hexadecimal output to lower case hex digits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0018', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0018', 'begin');
      const hex: string = StringUtils.generateHexString(12);
      let validHex: boolean = true;
      for (let i: number = 0; i < hex.length; i++) {
        const code: number = hex.charCodeAt(i);
        const valid: boolean = (code >= 48 && code <= 57) || (code >= 97 && code <= 102);
        if (!valid) {
          validHex = false;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0018',
        '#1 ' + "hex.length" + ' = ' + JSON.stringify(hex.length));
      expect(hex.length).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0018',
        '#2 ' + "validHex" + ' = ' + JSON.stringify(validHex));
      expect(validHex).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0018',
        '#3 assert ' + "expect(StringUtils.generateHexString(0)).assertEqual('')");
      expect(StringUtils.generateHexString(0)).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0018',
        '#4 assert ' + "expect(StringUtils.generateHexString(8).toUpperCase().length).assertEqual(8)");
      expect(StringUtils.generateHexString(8).toUpperCase().length).assertEqual(8);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0018', 'end');
    });

    // ==================== ha hope (2 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1900
     * @tc.name: testStringUtils0019
     * @tc.desc: Hash identical texts to the same non negative integer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0019', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0019', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0019',
        '#1 assert ' + "expect(StringUtils.hashCode('abc')).assertEqual(193485963)");
      expect(StringUtils.hashCode('abc')).assertEqual(193485963);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0019',
        '#2 assert ' + "expect(StringUtils.hashCode('abc')).assertEqual(StringUtils.hashCode('abc'))");
      expect(StringUtils.hashCode('abc')).assertEqual(StringUtils.hashCode('abc'));
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0019',
        '#3 assert ' + "expect(StringUtils.hashCode('Headset')).assertEqual(1664233309)");
      expect(StringUtils.hashCode('Headset')).assertEqual(1664233309);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0019',
        '#4 assert ' + "expect(StringUtils.hashCode('abc') > 0).assertTrue()");
      expect(StringUtils.hashCode('abc') > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0019', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_2000
     * @tc.name: testStringUtils0020
     * @tc.desc: Separate neighbouring texts and report zero for empty input.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0020', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0020', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0020',
        '#1 assert ' + "expect(StringUtils.hashCode('abd')).assertEqual(193485964)");
      expect(StringUtils.hashCode('abd')).assertEqual(193485964);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0020',
        '#2 assert ' + "expect(StringUtils.hashCode('abc') === StringUtils.hashCode('abd')).assertFalse()");
      expect(StringUtils.hashCode('abc') === StringUtils.hashCode('abd')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0020',
        '#3 assert ' + "expect(StringUtils.hashCode('')).assertEqual(0)");
      expect(StringUtils.hashCode('')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0020',
        '#4 assert ' + "expect(StringUtils.hashCode('a')).assertEqual(177670)");
      expect(StringUtils.hashCode('a')).assertEqual(177670);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0020', 'end');
    });

    // ==================== whitespace judge specify and safe all length degree (3 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_2100
     * @tc.name: testStringUtils0021
     * @tc.desc: Treat null, undefined and whitespace as blank content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0021', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0021', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0021',
        '#1 assert ' + "expect(StringUtils.isBlank(null)).assertTrue()");
      expect(StringUtils.isBlank(null)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0021',
        '#2 assert ' + "expect(StringUtils.isBlank(undefined)).assertTrue()");
      expect(StringUtils.isBlank(undefined)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0021',
        '#3 assert ' + "expect(StringUtils.isBlank('')).assertTrue()");
      expect(StringUtils.isBlank('')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0021',
        '#4 assert ' + "expect(StringUtils.isBlank(' ')).assertTrue()");
      expect(StringUtils.isBlank('   ')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0021',
        '#5 assert ' + "expect(StringUtils.isBlank('x')).assertFalse()");
      expect(StringUtils.isBlank('x')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0021', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_2200
     * @tc.name: testStringUtils0022
     * @tc.desc: Require at least one visible character for a non blank text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0022', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0022', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0022',
        '#1 assert ' + "expect(StringUtils.isNotBlank('Headset')).assertTrue()");
      expect(StringUtils.isNotBlank('Headset')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0022',
        '#2 assert ' + "expect(StringUtils.isNotBlank(' x ')).assertTrue()");
      expect(StringUtils.isNotBlank(' x ')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0022',
        '#3 assert ' + "expect(StringUtils.isNotBlank(' ')).assertFalse()");
      expect(StringUtils.isNotBlank(' ')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0022',
        '#4 assert ' + "expect(StringUtils.isNotBlank(null)).assertFalse()");
      expect(StringUtils.isNotBlank(null)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0022',
        '#5 assert ' + "expect(StringUtils.isNotBlank(undefined)).assertFalse()");
      expect(StringUtils.isNotBlank(undefined)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0022', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_2300
     * @tc.name: testStringUtils0023
     * @tc.desc: Read the length without throwing on absent values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0023', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0023', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0023',
        '#1 assert ' + "expect(StringUtils.safeLength('abc')).assertEqual(3)");
      expect(StringUtils.safeLength('abc')).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0023',
        '#2 assert ' + "expect(StringUtils.safeLength('')).assertEqual(0)");
      expect(StringUtils.safeLength('')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0023',
        '#3 assert ' + "expect(StringUtils.safeLength(null)).assertEqual(0)");
      expect(StringUtils.safeLength(null)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0023',
        '#4 assert ' + "expect(StringUtils.safeLength(undefined)).assertEqual(0)");
      expect(StringUtils.safeLength(undefined)).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0023', 'end');
    });

    // ==================== cut disconnect and pad (3 cases) ====================

    /*
     * @tc.number: SUB_STRING_UTILS_2400
     * @tc.name: testStringUtils0024
     * @tc.desc: Truncate long text to the limit and keep short text intact.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0024', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0024', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0024',
        '#1 assert ' + "expect(StringUtils.truncate('Bluetooth', 5)).assertEqual('Bl...')");
      expect(StringUtils.truncate('Bluetooth', 5)).assertEqual('Bl...');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0024',
        '#2 assert ' + "expect(StringUtils.truncate('Bluetooth', 5).length).assertEqual(5)");
      expect(StringUtils.truncate('Bluetooth', 5).length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0024',
        '#3 assert ' + "expect(StringUtils.truncate('abc', 10)).assertEqual('abc')");
      expect(StringUtils.truncate('abc', 10)).assertEqual('abc');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0024',
        '#4 assert ' + "expect(StringUtils.truncate('abcdefgh', 8)).assertEqual('abcdefgh')");
      expect(StringUtils.truncate('abcdefgh', 8)).assertEqual('abcdefgh');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0024', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_2500
     * @tc.name: testStringUtils0025
     * @tc.desc: Honour a custom suffix when cutting the tail off.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0025', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0025', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0025',
        '#1 assert ' + "expect(StringUtils.truncate('abcdefghij', 6, '->')).assertEqual('abcd->')");
      expect(StringUtils.truncate('abcdefghij', 6, '->')).assertEqual('abcd->');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0025',
        '#2 assert ' + "expect(StringUtils.truncate('abcdefghij', 6, '->').length).assertEqual(6)");
      expect(StringUtils.truncate('abcdefghij', 6, '->').length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0025',
        '#3 assert ' + "expect(StringUtils.truncate('ab', 6, '->')).assertEqual('ab')");
      expect(StringUtils.truncate('ab', 6, '->')).assertEqual('ab');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0025',
        '#4 assert ' + "expect(StringUtils.truncate('', 6)).assertEqual('')");
      expect(StringUtils.truncate('', 6)).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0025', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_2600
     * @tc.name: testStringUtils0026
     * @tc.desc: Pad on the left with spaces up to the target width.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0026', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0026', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0026',
        '#1 assert ' + "expect(StringUtils.pad('7', 3)).assertEqual(' 7')");
      expect(StringUtils.pad('7', 3)).assertEqual('  7');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0026',
        '#2 assert ' + "expect(StringUtils.pad('ab', 5)).assertEqual(' ab')");
      expect(StringUtils.pad('ab', 5)).assertEqual('   ab');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0026',
        '#3 assert ' + "expect(StringUtils.pad('abc', 2)).assertEqual('abc')");
      expect(StringUtils.pad('abc', 2)).assertEqual('abc');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0026',
        '#4 assert ' + "expect(StringUtils.pad('7', 3).length).assertEqual(3)");
      expect(StringUtils.pad('7', 3).length).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0026', 'end');
    });

    /*
     * @tc.number: SUB_STRING_UTILS_2700
     * @tc.name: testStringUtils0027
     * @tc.desc: Pad on the right with a chosen filler character.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStringUtils0027', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0027', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0027',
        '#1 assert ' + "expect(StringUtils.pad('7', 3, '0', false)).assertEqual('700')");
      expect(StringUtils.pad('7', 3, '0', false)).assertEqual('700');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0027',
        '#2 assert ' + "expect(StringUtils.pad('ab', 5, '-', false)).assertEqual('ab---')");
      expect(StringUtils.pad('ab', 5, '-', false)).assertEqual('ab---');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0027',
        '#3 assert ' + "expect(StringUtils.pad('ab', 5, '-')).assertEqual('---ab')");
      expect(StringUtils.pad('ab', 5, '-')).assertEqual('---ab');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testStringUtils0027',
        '#4 assert ' + "expect(StringUtils.pad('ab', 5, '-', false).length).assertEqual(5)");
      expect(StringUtils.pad('ab', 5, '-', false).length).assertEqual(5);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testStringUtils0027', 'end');
    });
  });
}
