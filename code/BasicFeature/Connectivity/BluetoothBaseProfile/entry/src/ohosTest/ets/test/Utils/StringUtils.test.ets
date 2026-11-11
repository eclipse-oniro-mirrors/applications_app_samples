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
import { StringUtils } from 'library';

/**
 * Test suite for StringUtils.
 * @since 26.0.0
 */
export default function stringUtilsTest(): void {
  describe('StringUtilsTest', () => {
    // ==================== 首字母大小写（2 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_0100
     * @tc.name: testStringUtils0001
     * @tc.desc: Capitalize the first character and keep the tail untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0001', 0, () => {
      expect(StringUtils.capitalize('bluetooth')).assertEqual('Bluetooth');
      expect(StringUtils.capitalize('A2dp')).assertEqual('A2dp');
      expect(StringUtils.capitalize('1device')).assertEqual('1device');
      expect(StringUtils.capitalize('')).assertEqual('');
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
      expect(StringUtils.uncapitalize('Bluetooth')).assertEqual('bluetooth');
      expect(StringUtils.uncapitalize('HfpService')).assertEqual('hfpService');
      expect(StringUtils.uncapitalize('')).assertEqual('');
      expect(StringUtils.uncapitalize('a')).assertEqual('a');
    });

    // ==================== 命名风格转换（5 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_0300
     * @tc.name: testStringUtils0003
     * @tc.desc: Convert snake and kebab sources into camel case.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0003', 0, () => {
      expect(StringUtils.toCamelCase('hello_world_foo')).assertEqual('helloWorldFoo');
      expect(StringUtils.toCamelCase('device-name-card')).assertEqual('deviceNameCard');
      expect(StringUtils.toCamelCase('BluetoothDeviceCard')).assertEqual('bluetoothDeviceCard');
      expect(StringUtils.toCamelCase('single')).assertEqual('single');
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
      expect(StringUtils.toSnakeCase('toCamelCase')).assertEqual('to_camel_case');
      expect(StringUtils.toSnakeCase('device_name')).assertEqual('device_name');
      expect(StringUtils.toSnakeCase('Headset Device')).assertEqual('headset_device');
      expect(StringUtils.toSnakeCase('ABC')).assertEqual('abc');
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
      expect(StringUtils.toKebabCase('device_name')).assertEqual('device-name');
      expect(StringUtils.toKebabCase('MediaControlPanel')).assertEqual('media-control-panel');
      expect(StringUtils.toKebabCase('already-kebab')).assertEqual('already-kebab');
      expect(StringUtils.toKebabCase('Audio Video')).assertEqual('audio-video');
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
      expect(StringUtils.toCamelCase('')).assertEqual('');
      expect(StringUtils.toSnakeCase('')).assertEqual('');
      expect(StringUtils.toKebabCase('')).assertEqual('');
      expect(StringUtils.toCamelCase('   ')).assertEqual('   ');
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
      expect(StringUtils.toSnakeCase('a__b---c')).assertEqual('a_b_c');
      expect(StringUtils.toCamelCase('  padded  word')).assertEqual('paddedWord');
      expect(StringUtils.toKebabCase('HTTPServer')).assertEqual('httpserver');
      expect(StringUtils.toCamelCase('HTTPServer')).assertEqual('httpserver');
    });

    // ==================== 包含与前后缀（3 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_0800
     * @tc.name: testStringUtils0008
     * @tc.desc: Detect a substring at the head, middle, tail and absence.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0008', 0, () => {
      expect(StringUtils.contains('Bluetooth Headset', 'Headset')).assertTrue();
      expect(StringUtils.contains('Bluetooth Headset', 'Bluetooth')).assertTrue();
      expect(StringUtils.contains('Bluetooth Headset', 'watch')).assertFalse();
      expect(StringUtils.contains('', 'a')).assertFalse();
      expect(StringUtils.contains('abc', '')).assertFalse();
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
      expect(StringUtils.startsWith('A2dpSource', 'A2dp')).assertTrue();
      expect(StringUtils.startsWith('A2dpSource', 'Source')).assertFalse();
      expect(StringUtils.startsWith('A2dpSource', 'A2dpSource')).assertTrue();
      expect(StringUtils.startsWith('', 'a')).assertFalse();
      expect(StringUtils.startsWith('abc', '')).assertFalse();
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
      expect(StringUtils.endsWith('A2dpSource', 'Source')).assertTrue();
      expect(StringUtils.endsWith('aaaa', 'aa')).assertTrue();
      expect(StringUtils.endsWith('A2dpSource', 'A2dp')).assertFalse();
      expect(StringUtils.endsWith('', 'a')).assertFalse();
      expect(StringUtils.endsWith('abc', '')).assertFalse();
    });

    // ==================== 计数与重复（3 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1100
     * @tc.name: testStringUtils0011
     * @tc.desc: Count overlapping and separated occurrences of a needle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0011', 0, () => {
      expect(StringUtils.countOccurrences('hello world', 'o')).assertEqual(2);
      expect(StringUtils.countOccurrences('aaaa', 'aa')).assertEqual(3);
      expect(StringUtils.countOccurrences('abc', 'z')).assertEqual(0);
      expect(StringUtils.countOccurrences('', 'a')).assertEqual(0);
      expect(StringUtils.countOccurrences('abc', '')).assertEqual(0);
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
      expect(StringUtils.repeat('ab', 3)).assertEqual('ababab');
      expect(StringUtils.repeat('x', 1)).assertEqual('x');
      expect(StringUtils.repeat('-', 10).length).assertEqual(10);
      expect(StringUtils.repeat('abc', 2)).assertEqual('abcabc');
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
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      expect(StringUtils.repeat('ab', -3)).assertEqual('');
      expect(StringUtils.repeat('', 5)).assertEqual('');
      expect(StringUtils.repeat('ab', 0).length).assertEqual(0);
    });

    // ==================== 反转与去空白（2 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1400
     * @tc.name: testStringUtils0014
     * @tc.desc: Reverse ordinary, single character and symmetric text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0014', 0, () => {
      expect(StringUtils.reverse('abc')).assertEqual('cba');
      expect(StringUtils.reverse('a')).assertEqual('a');
      expect(StringUtils.reverse('Headset')).assertEqual('tesdaeH');
      expect(StringUtils.reverse('')).assertEqual('');
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
      expect(StringUtils.removeWhitespace('a b\tc\nd')).assertEqual('abcd');
      expect(StringUtils.removeWhitespace('   ')).assertEqual('');
      expect(StringUtils.removeWhitespace('nospace')).assertEqual('nospace');
      expect(StringUtils.removeWhitespace('')).assertEqual('');
    });

    // ==================== 随机串生成（3 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1600
     * @tc.name: testStringUtils0016
     * @tc.desc: Produce an alphanumeric token of the requested length.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0016', 0, () => {
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
      expect(token.length).assertEqual(16);
      expect(alnum).assertTrue();
      expect(StringUtils.generateRandomString(0)).assertEqual('');
      expect(StringUtils.generateRandomString(4).length).assertEqual(4);
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
      const first: string = StringUtils.generateRandomString(20);
      const second: string = StringUtils.generateRandomString(20);
      expect(first.length).assertEqual(20);
      expect(second.length).assertEqual(20);
      expect(first === second).assertFalse();
      expect(first.indexOf(' ') === -1).assertTrue();
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
      const hex: string = StringUtils.generateHexString(12);
      let validHex: boolean = true;
      for (let i: number = 0; i < hex.length; i++) {
        const code: number = hex.charCodeAt(i);
        const valid: boolean = (code >= 48 && code <= 57) || (code >= 97 && code <= 102);
        if (!valid) {
          validHex = false;
        }
      }
      expect(hex.length).assertEqual(12);
      expect(validHex).assertTrue();
      expect(StringUtils.generateHexString(0)).assertEqual('');
      expect(StringUtils.generateHexString(8).toUpperCase().length).assertEqual(8);
    });

    // ==================== 哈希（2 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_1900
     * @tc.name: testStringUtils0019
     * @tc.desc: Hash identical texts to the same non negative integer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0019', 0, () => {
      expect(StringUtils.hashCode('abc')).assertEqual(193485963);
      expect(StringUtils.hashCode('abc')).assertEqual(StringUtils.hashCode('abc'));
      expect(StringUtils.hashCode('Headset')).assertEqual(1664233309);
      expect(StringUtils.hashCode('abc') > 0).assertTrue();
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
      expect(StringUtils.hashCode('abd')).assertEqual(193485964);
      expect(StringUtils.hashCode('abc') === StringUtils.hashCode('abd')).assertFalse();
      expect(StringUtils.hashCode('')).assertEqual(0);
      expect(StringUtils.hashCode('a')).assertEqual(177670);
    });

    // ==================== 空白判定与安全长度（3 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_2100
     * @tc.name: testStringUtils0021
     * @tc.desc: Treat null, undefined and whitespace as blank content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0021', 0, () => {
      expect(StringUtils.isBlank(null)).assertTrue();
      expect(StringUtils.isBlank(undefined)).assertTrue();
      expect(StringUtils.isBlank('')).assertTrue();
      expect(StringUtils.isBlank('   ')).assertTrue();
      expect(StringUtils.isBlank('x')).assertFalse();
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
      expect(StringUtils.isNotBlank('Headset')).assertTrue();
      expect(StringUtils.isNotBlank(' x ')).assertTrue();
      expect(StringUtils.isNotBlank(' ')).assertFalse();
      expect(StringUtils.isNotBlank(null)).assertFalse();
      expect(StringUtils.isNotBlank(undefined)).assertFalse();
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
      expect(StringUtils.safeLength('abc')).assertEqual(3);
      expect(StringUtils.safeLength('')).assertEqual(0);
      expect(StringUtils.safeLength(null)).assertEqual(0);
      expect(StringUtils.safeLength(undefined)).assertEqual(0);
    });

    // ==================== 截断与填充（3 条） ====================

    /*
     * @tc.number: SUB_STRING_UTILS_2400
     * @tc.name: testStringUtils0024
     * @tc.desc: Truncate long text to the limit and keep short text intact.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStringUtils0024', 0, () => {
      expect(StringUtils.truncate('Bluetooth', 5)).assertEqual('Bl...');
      expect(StringUtils.truncate('Bluetooth', 5).length).assertEqual(5);
      expect(StringUtils.truncate('abc', 10)).assertEqual('abc');
      expect(StringUtils.truncate('abcdefgh', 8)).assertEqual('abcdefgh');
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
      expect(StringUtils.truncate('abcdefghij', 6, '->')).assertEqual('abcd->');
      expect(StringUtils.truncate('abcdefghij', 6, '->').length).assertEqual(6);
      expect(StringUtils.truncate('ab', 6, '->')).assertEqual('ab');
      expect(StringUtils.truncate('', 6)).assertEqual('');
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
      expect(StringUtils.pad('7', 3)).assertEqual('  7');
      expect(StringUtils.pad('ab', 5)).assertEqual('   ab');
      expect(StringUtils.pad('abc', 2)).assertEqual('abc');
      expect(StringUtils.pad('7', 3).length).assertEqual(3);
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
      expect(StringUtils.pad('7', 3, '0', false)).assertEqual('700');
      expect(StringUtils.pad('ab', 5, '-', false)).assertEqual('ab---');
      expect(StringUtils.pad('ab', 5, '-')).assertEqual('---ab');
      expect(StringUtils.pad('ab', 5, '-', false).length).assertEqual(5);
    });
  });
}
