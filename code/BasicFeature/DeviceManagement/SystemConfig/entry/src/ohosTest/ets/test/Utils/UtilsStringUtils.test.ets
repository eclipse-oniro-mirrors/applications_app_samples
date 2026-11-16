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

import { describe, it, expect } from '@ohos/hypium';
import { StringUtils } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// String utilities test suite
// ========================================

/**
 * String utilities test suite.
 * Verifies the correctness of each string-processing method in the StringUtils class.
 */
export default function utilsStringUtilsTest(): void {
  describe('UtilsStringUtilsTest', () => {

    // ========================================
    // Positive cases - case and naming conversion
    // ========================================

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0100
     * @tc.name testUtilsStringUtils0001
     * @tc.desc Verify capitalizing the first letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0001: begin');
      const result: string = StringUtils.capitalize('hello');
      expect(result).assertEqual('Hello');
      expect(result.length).assertEqual(5);
      expect(StringUtils.capitalize('a')).assertEqual('A');
      expect(StringUtils.capitalize('Hello')).assertEqual('Hello');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0001: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0200
     * @tc.name testUtilsStringUtils0002
     * @tc.desc Verify conversion to camelCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0002: begin');
      const result: string = StringUtils.toCamelCase('hello_world');
      expect(result).assertEqual('helloWorld');
      expect(result.indexOf('_')).assertEqual(-1);
      expect(StringUtils.toCamelCase('foo_bar_baz')).assertEqual('fooBarBaz');
      expect(StringUtils.toCamelCase('')).assertEqual('');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0002: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0300
     * @tc.name testUtilsStringUtils0003
     * @tc.desc Verify conversion to snake_case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0003: begin');
      const result: string = StringUtils.toSnakeCase('helloWorld');
      expect(result).assertEqual('hello_world');
      expect(result.indexOf('W')).assertEqual(-1);
      expect(StringUtils.toSnakeCase('fooBarBaz')).assertEqual('foo_bar_baz');
      expect(StringUtils.toSnakeCase('')).assertEqual('');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0003: end');
    });

    // ========================================
    // Positive cases - lookup and operations
    // ========================================

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0400
     * @tc.name testUtilsStringUtils0004
     * @tc.desc Verify the contains check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0004: begin');
      expect(StringUtils.contains('hello world', 'world')).assertEqual(true);
      expect(StringUtils.contains('hello world', 'xyz')).assertEqual(false);
      expect(StringUtils.contains('hello world', '')).assertEqual(false);
      expect(StringUtils.contains('', 'test')).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0004: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0500
     * @tc.name testUtilsStringUtils0005
     * @tc.desc Verify the prefix check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0005: begin');
      expect(StringUtils.startsWith('hello world', 'hello')).assertEqual(true);
      expect(StringUtils.startsWith('hello world', 'world')).assertEqual(false);
      expect(StringUtils.startsWith('hello world', '')).assertEqual(false);
      expect(StringUtils.startsWith('', 'test')).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0005: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0600
     * @tc.name testUtilsStringUtils0006
     * @tc.desc Verify the suffix check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0006: begin');
      expect(StringUtils.endsWith('hello world', 'world')).assertEqual(true);
      expect(StringUtils.endsWith('hello world', 'hello')).assertEqual(false);
      expect(StringUtils.endsWith('hello world', '')).assertEqual(false);
      expect(StringUtils.endsWith('', 'test')).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0006: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0700
     * @tc.name testUtilsStringUtils0007
     * @tc.desc Verify repeating a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0007: begin');
      const result: string = StringUtils.repeat('ab', 3);
      expect(result).assertEqual('ababab');
      expect(result.length).assertEqual(6);
      expect(StringUtils.repeat('x', 1)).assertEqual('x');
      expect(StringUtils.repeat('', 5)).assertEqual('');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0007: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0800
     * @tc.name testUtilsStringUtils0008
     * @tc.desc Verify reversing a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0008: begin');
      const result: string = StringUtils.reverse('hello');
      expect(result).assertEqual('olleh');
      expect(result.length).assertEqual(5);
      expect(StringUtils.reverse('')).assertEqual('');
      expect(StringUtils.reverse('a')).assertEqual('a');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0008: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_0900
     * @tc.name testUtilsStringUtils0009
     * @tc.desc Verify removing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0009: begin');
      const result: string = StringUtils.removeWhitespace('h e l l o');
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
      expect(StringUtils.removeWhitespace('hello')).assertEqual('hello');
      expect(StringUtils.removeWhitespace('  a b  ')).assertEqual('ab');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0009: end');
    });

    // ========================================
    // Positive cases - generation and hashing
    // ========================================

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_1000
     * @tc.name testUtilsStringUtils0010
     * @tc.desc Verify the length of a generated random string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0010: begin');
      const result: string = StringUtils.generateRandomString(10);
      expect(result.length).assertEqual(10);
      const result2: string = StringUtils.generateRandomString(20);
      expect(result2.length).assertEqual(20);
      expect(result === result2).assertFalse();
      expect(StringUtils.generateRandomString(0)).assertEqual('');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0010: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_1100
     * @tc.name testUtilsStringUtils0011
     * @tc.desc Verify the hash value is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0011: begin');
      const hash1: number = StringUtils.hashCode('test');
      const hash2: number = StringUtils.hashCode('test');
      expect(hash1).assertEqual(hash2);
      expect(hash1 === 0).assertEqual(false);
      expect(hash1).assertLarger(0);
      const hash3: number = StringUtils.hashCode('different');
      expect(hash3 === hash1).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0011: end');
    });

    // ========================================
    // Boundary cases
    // ========================================

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_1200
     * @tc.name testUtilsStringUtils0012
     * @tc.desc Verify the empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0012: begin');
      const result: string = StringUtils.capitalize('');
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(StringUtils.uncapitalize('Hello')).assertEqual('hello');
      expect(StringUtils.uncapitalize('')).assertEqual('');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0012: end');
    });

    /**
     * @tc.number SUB_UTILS_STRING_UTILS_1300
     * @tc.name testUtilsStringUtils0013
     * @tc.desc Verify zero repetitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsStringUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0013: begin');
      const result: string = StringUtils.repeat('hello', 0);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
      expect(StringUtils.repeat('test', -1)).assertEqual('');
      expect(StringUtils.repeat('', 10)).assertEqual('');
      hilog.info(DOMAIN, TAG, 'testUtilsStringUtils0013: end');
    });
  });
}
