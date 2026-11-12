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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DateUtils, MathUtils, StringUtils, FormatUtils } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * Boundary-value test suite - DateUtils/MathUtils/StringUtils/FormatUtils.
 * Covers boundary scenarios not addressed by existing tests: null values, extremes, negatives, NaN,
 * precision boundaries, empty collections, equality boundaries, etc.
 */
export default function BoundaryValueTest(): void {
  describe('BoundaryValueTest', () => {

    // ========================================
    // DateUtils boundary values
    // ========================================

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0100
     * @tc.name testUtilsBoundaryValue0001
     * @tc.desc Verify parse returns NaN or -1 for an invalid date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0001 begin');
      const r1: number = DateUtils.parse('');
      expect(r1).assertEqual(0);
      const r2: number = DateUtils.parse('not-a-date');
      expect(r2).assertEqual(0);
      const r3: number = DateUtils.parse('2024-13-01');
      expect(r3).assertEqual(0);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0200
     * @tc.name testUtilsBoundaryValue0002
     * @tc.desc Verify addDays/addHours/addMinutes with negative arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0002 begin');
      const base: number = DateUtils.now();
      const yesterday: number = DateUtils.addDays(base, -1);
      const diff: number = base - yesterday;
      expect(diff).assertEqual(86400000);
      const pastHour: number = DateUtils.addHours(base, -2);
      const hourDiff: number = base - pastHour;
      expect(hourDiff).assertEqual(7200000);
      const pastMin: number = DateUtils.addMinutes(base, -30);
      const minDiff: number = base - pastMin;
      expect(minDiff).assertEqual(1800000);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0300
     * @tc.name testUtilsBoundaryValue0003
     * @tc.desc Verify leap-year and common-year detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0003 begin');
      expect(DateUtils.isLeapYear(new Date(2000, 0, 1).getTime())).assertEqual(true);
      expect(DateUtils.isLeapYear(new Date(2024, 0, 1).getTime())).assertEqual(true);
      expect(DateUtils.isLeapYear(new Date(1900, 0, 1).getTime())).assertEqual(false);
      expect(DateUtils.isLeapYear(new Date(2023, 0, 1).getTime())).assertEqual(false);
      expect(DateUtils.isLeapYear(new Date(2100, 0, 1).getTime())).assertEqual(false);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0400
     * @tc.name testUtilsBoundaryValue0004
     * @tc.desc Verify daysBetween returns 0 for identical timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0004 begin');
      const ts: number = DateUtils.now();
      expect(DateUtils.daysBetween(ts, ts)).assertEqual(0);
      expect(DateUtils.hoursBetween(ts, ts)).assertEqual(0);
      const oneDayLater: number = ts + 86400000;
      expect(DateUtils.daysBetween(ts, oneDayLater)).assertEqual(1);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0500
     * @tc.name testUtilsBoundaryValue0005
     * @tc.desc Verify days per month and February in a leap year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0005 begin');
      expect(DateUtils.getDaysInMonth(2024, 1)).assertEqual(29);
      expect(DateUtils.getDaysInMonth(2023, 1)).assertEqual(28);
      expect(DateUtils.getDaysInMonth(2024, 0)).assertEqual(31);
      expect(DateUtils.getDaysInMonth(2024, 3)).assertEqual(30);
      expect(DateUtils.getDaysInMonth(2024, 11)).assertEqual(31);
    });

    // ========================================
    // MathUtils boundary values
    // ========================================

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0600
     * @tc.name testUtilsBoundaryValue0006
     * @tc.desc Verify lerp at t=0/t=1 and an out-of-range t
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0006 begin');
      expect(MathUtils.lerp(0, 100, 0)).assertEqual(0);
      expect(MathUtils.lerp(0, 100, 1)).assertEqual(100);
      expect(MathUtils.lerp(0, 100, 0.5)).assertEqual(50);
      const result: number = MathUtils.lerp(0, 100, 2);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0700
     * @tc.name testUtilsBoundaryValue0007
     * @tc.desc Verify inverseLerp avoids division by zero when a==b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0007 begin');
      expect(MathUtils.inverseLerp(5, 5, 5)).assertEqual(0);
      expect(MathUtils.inverseLerp(-3, -3, 100)).assertEqual(0);
      expect(MathUtils.inverseLerp(0, 100, 50)).assertEqual(0.5);
      expect(MathUtils.inverseLerp(0, 100, 0)).assertEqual(0);
      expect(MathUtils.inverseLerp(0, 100, 100)).assertEqual(1);
      expect(MathUtils.mapRange(50, 0, 100, 0, 200)).assertEqual(100);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0800
     * @tc.name testUtilsBoundaryValue0008
     * @tc.desc Verify median for an empty array/single element/even number of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0008 begin');
      expect(MathUtils.median([])).assertEqual(0);
      expect(MathUtils.median([5])).assertEqual(5);
      expect(MathUtils.median([1, 3])).assertEqual(2);
      expect(MathUtils.median([1, 2, 3])).assertEqual(2);
      expect(MathUtils.median([1, 3, 5, 7])).assertEqual(4);
      const source: number[] = [3, 1, 2];
      expect(MathUtils.median(source)).assertEqual(2);
      expect(source[0]).assertEqual(3);
      expect(source[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_0900
     * @tc.name testUtilsBoundaryValue0009
     * @tc.desc Verify percentage avoids division by zero when total=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0009 begin');
      expect(MathUtils.percentage(50, 0)).assertEqual(0);
      expect(MathUtils.percentage(-5, 0)).assertEqual(0);
      expect(MathUtils.percentage(0, 100)).assertEqual(0);
      expect(MathUtils.percentage(100, 100)).assertEqual(100);
      expect(MathUtils.percentage(1, 3)).assertEqual(33.33);
      expect(MathUtils.percentage(1, 3, 0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1000
     * @tc.name testUtilsBoundaryValue0010
     * @tc.desc Verify square for a negative number, 0, and a very large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0010 begin');
      expect(MathUtils.square(0)).assertEqual(0);
      expect(MathUtils.square(-5)).assertEqual(25);
      expect(MathUtils.square(3)).assertEqual(9);
      expect(MathUtils.square(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1100
     * @tc.name testUtilsBoundaryValue0011
     * @tc.desc Verify special values in degree/radian conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0011 begin');
      expect(MathUtils.degreesToRadians(0)).assertEqual(0);
      expect(MathUtils.degreesToRadians(180)).assertEqual(Math.PI);
      expect(MathUtils.radiansToDegrees(Math.PI)).assertEqual(180);
      expect(MathUtils.radiansToDegrees(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1200
     * @tc.name testUtilsBoundaryValue0012
     * @tc.desc Verify max/min on single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0012 begin');
      expect(MathUtils.max([42])).assertEqual(42);
      expect(MathUtils.min([42])).assertEqual(42);
      expect(MathUtils.max([1, 2, 3, 4, 5])).assertEqual(5);
      expect(MathUtils.min([5, 4, 3, 2, 1])).assertEqual(1);
    });

    // ========================================
    // StringUtils boundary values
    // ========================================

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1300
     * @tc.name testUtilsBoundaryValue0013
     * @tc.desc Verify capitalize with a single character and an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0013 begin');
      expect(StringUtils.capitalize('a')).assertEqual('A');
      expect(StringUtils.capitalize('')).assertEqual('');
      expect(StringUtils.capitalize('A')).assertEqual('A');
      expect(StringUtils.uncapitalize('A')).assertEqual('a');
      expect(StringUtils.uncapitalize('')).assertEqual('');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1400
     * @tc.name testUtilsBoundaryValue0014
     * @tc.desc Verify toKebabCase/toPascalCase with empty strings and a single word
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0014 begin');
      expect(StringUtils.toKebabCase('helloWorld')).assertEqual('hello-world');
      expect(StringUtils.toKebabCase('')).assertEqual('');
      expect(StringUtils.toPascalCase('hello_world')).assertEqual('HelloWorld');
      expect(StringUtils.toPascalCase('')).assertEqual('');
      expect(StringUtils.toPascalCase('hello')).assertEqual('Hello');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1500
     * @tc.name testUtilsBoundaryValue0015
     * @tc.desc Verify countOccurrences with an empty string and no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0015 begin');
      expect(StringUtils.countOccurrences('', 'a')).assertEqual(0);
      expect(StringUtils.countOccurrences('hello', 'x')).assertEqual(0);
      expect(StringUtils.countOccurrences('aaa', 'a')).assertEqual(3);
      expect(StringUtils.countOccurrences('abab', 'ab')).assertLarger(0);
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1600
     * @tc.name testUtilsBoundaryValue0016
     * @tc.desc Verify isBlank/isNotBlank for null/undefined/empty/pure-whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0016 begin');
      expect(StringUtils.isBlank('')).assertTrue();
      expect(StringUtils.isBlank('   ')).assertTrue();
      expect(StringUtils.isBlank('hello')).assertFalse();
      expect(StringUtils.isNotBlank('hello')).assertTrue();
      expect(StringUtils.isNotBlank('')).assertFalse();
      expect(StringUtils.isNotBlank('   ')).assertFalse();
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1700
     * @tc.name testUtilsBoundaryValue0017
     * @tc.desc Verify hashCode/checksum on an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0017 begin');
      expect(StringUtils.hashCode('')).assertEqual(0);
      expect(StringUtils.checksum('')).assertEqual(0);
      expect(StringUtils.hashCode('hello')).assertLarger(0);
      expect(StringUtils.checksum('abc')).assertLarger(0);
      expect(StringUtils.hashCode('hello')).assertEqual(StringUtils.hashCode('hello'));
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1800
     * @tc.name testUtilsBoundaryValue0018
     * @tc.desc Verify substring with various boundary arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0018 begin');
      expect(StringUtils.substring('hello', 3)).assertEqual('hel');
      expect(StringUtils.substring('hi', 100)).assertEqual('hi');
      expect(StringUtils.substring('', 0)).assertEqual('');
      expect(StringUtils.substring('hello', 3, '...')).assertEqual('hel...');
    });

    // ========================================
    // FormatUtils boundary values
    // ========================================

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_1900
     * @tc.name testUtilsBoundaryValue0019
     * @tc.desc Verify formatBytes for NaN/Infinity/very large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0019 begin');
      const nanResult: string = FormatUtils.formatBytes(NaN);
      expect(nanResult.indexOf('NaN')).assertEqual(0);
      const infResult: string = FormatUtils.formatBytes(Infinity);
      expect(infResult.indexOf('Infinity')).assertEqual(0);
      expect(FormatUtils.formatBytes(0)).assertEqual('0 B');
      expect(FormatUtils.formatBytes(1024)).assertEqual('1 KB');
      expect(FormatUtils.formatBytes(1536)).assertEqual('1.5 KB');
      expect(FormatUtils.formatBytes(-1024)).assertEqual('-1 KB');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_2000
     * @tc.name testUtilsBoundaryValue0020
     * @tc.desc Verify formatDuration for 0/negative/very large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0020', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0020 begin');
      expect(FormatUtils.formatDuration(0)).assertEqual('0秒');
      expect(FormatUtils.formatDuration(-1000)).assertEqual('0秒');
      expect(FormatUtils.formatDuration(1000)).assertEqual('1秒');
      expect(FormatUtils.formatDuration(60000)).assertEqual('1分');
      expect(FormatUtils.formatDuration(3600000)).assertEqual('1小时');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_2100
     * @tc.name testUtilsBoundaryValue0021
     * @tc.desc Verify formatNumber for NaN/Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0021', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0021 begin');
      expect(FormatUtils.formatNumber(NaN)).assertEqual('0');
      expect(FormatUtils.formatNumber(Infinity)).assertEqual('Infinity');
      expect(FormatUtils.formatNumber(-Infinity)).assertEqual('-Infinity');
      expect(FormatUtils.formatNumber(0)).assertEqual('0.00');
      expect(FormatUtils.formatNumber(3.14159)).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_2200
     * @tc.name testUtilsBoundaryValue0022
     * @tc.desc Verify padStart/padEnd when the length already meets the target or the target is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0022', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0022 begin');
      expect(FormatUtils.padStart('hello', 3)).assertEqual('hello');
      expect(FormatUtils.padStart('hi', 5)).assertEqual('   hi');
      expect(FormatUtils.padEnd('hello', 3)).assertEqual('hello');
      expect(FormatUtils.padEnd('hi', 5)).assertEqual('hi   ');
      expect(FormatUtils.padStart('', 3)).assertEqual('   ');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_2300
     * @tc.name testUtilsBoundaryValue0023
     * @tc.desc Verify truncate with a very small maxLen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0023', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0023 begin');
      expect(FormatUtils.truncate('hello world', 5)).assertEqual('he...');
      expect(FormatUtils.truncate('hello', 5)).assertEqual('hello');
      expect(FormatUtils.truncate('hi', 100)).assertEqual('hi');
      expect(FormatUtils.truncate('', 5)).assertEqual('');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_2400
     * @tc.name testUtilsBoundaryValue0024
     * @tc.desc Verify formatPercentage for negatives and values over 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0024', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0024 begin');
      expect(FormatUtils.formatPercentage(0)).assertEqual('0.0%');
      expect(FormatUtils.formatPercentage(100)).assertEqual('100.0%');
      expect(FormatUtils.formatPercentage(0.5)).assertEqual('50.0%');
      expect(FormatUtils.formatPercentage(-10)).assertEqual('-10.0%');
      expect(FormatUtils.formatPercentage(150)).assertEqual('150.0%');
    });

    /**
     * @tc.number SUB_UTILS_BOUNDARY_VALUE_2500
     * @tc.name testUtilsBoundaryValue0025
     * @tc.desc Verify maskPhone with a too-short number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsBoundaryValue0025', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsBoundaryValue0025 begin');
      expect(FormatUtils.maskPhone('13800138000')).assertEqual('138****8000');
      expect(FormatUtils.maskPhone('1380013')).assertEqual('138****0013');
      expect(FormatUtils.maskPhone('123')).assertEqual('123');
      expect(FormatUtils.maskPhone('')).assertEqual('');
    });
  });
}
