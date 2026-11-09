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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the NumberUtils helpers under test from the library HAR package.
import { NumberUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';
// The tolerance used when comparing floating point helper output.
const EPSILON: number = 1e-9;
// The widened tolerance used by radian and degree round trips.
const EPSILON_WIDE: number = 1e-5;
// The kilo boundary used by the file size ladder.
const KILO: number = 1024;
// The mega boundary used by the file size ladder.
const MEGA: number = 1024 * 1024;
// The giga boundary used by the file size ladder.
const GIGA: number = 1024 * 1024 * 1024;
// One full turn expressed in degrees.
const FULL_TURN_DEGREES: number = 360;
// One full turn expressed in radians.
const FULL_TURN_RADIANS: number = 2 * Math.PI;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every advanced case of the NumberUtilsAdvancedSuite suite.
export default function numberUtilsAdvancedTest() {
  // Group the cases under the "NumberUtilsAdvancedSuite" describe block.
  describe('NumberUtilsAdvancedSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumberUtilsAdvancedSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0100
     * @tc.name      testFiniteNumberAccept0001
     * @tc.desc      Verify isFiniteNumber accepts every ordinary finite numeric literal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFiniteNumberAccept0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFiniteNumberAccept0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The literals that must be reported as finite numbers.
      const accepted: number[] = [0, 1, -1, 2.5, -2.5, 0.0001, -0.0001, 1024, -1024, 1e6, -1e6, 1e-6];
      // Walk every accepted literal and confirm the predicate.
      for (let i: number = 0; i < accepted.length; i++) {
        // Record the literal under test.
        const value: number = accepted[i];
        // Print the current input so a failure is traceable from hilog alone.
        logCase(TAG, 'input=' + value.toString());
        // The predicate must report every listed literal as finite.
        expect(NumberUtils.isFiniteNumber(value)).assertTrue();
        // The predicate must agree with the negation of the platform check.
        expect(NumberUtils.isFiniteNumber(value)).assertEqual(!isNaN(value) && isFinite(value));
      }
      // Exactly twelve literals were exercised by this case.
      expect(accepted.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0200
     * @tc.name      testFiniteNumberReject0002
     * @tc.desc      Verify isFiniteNumber rejects NaN, both infinities and their computed forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFiniteNumberReject0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFiniteNumberReject0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The literal NaN value.
      const nanValue: number = NaN;
      // The positive infinity value.
      const positiveInfinity: number = Infinity;
      // The negative infinity value.
      const negativeInfinity: number = -Infinity;
      // The quotient that produces positive infinity.
      const dividedByZero: number = 1 / 0;
      // The quotient that produces negative infinity.
      const negativeDividedByZero: number = -1 / 0;
      // The product that degenerates into NaN.
      const infinityTimesZero: number = Infinity * 0;
      // The square root of a negative literal which degenerates into NaN.
      const negativeRoot: number = Math.sqrt(-1);
      // The rejection vectors in evaluation order.
      const rejected: number[] = [nanValue, positiveInfinity, negativeInfinity, dividedByZero,
        negativeDividedByZero, infinityTimesZero, negativeRoot, NaN, Infinity, -Infinity];
      // Walk every rejected vector and confirm the predicate.
      for (let i: number = 0; i < rejected.length; i++) {
        // Record the vector under test.
        const value: number = rejected[i];
        // Print the current class of the value so the failure mode is readable.
        logCase(TAG, 'index=' + i.toString() + ', isNaN=' + isNaN(value).toString() +
          ', isInfinity=' + (!isNaN(value) && !isFinite(value)).toString());
        // The predicate must reject the value.
        expect(NumberUtils.isFiniteNumber(value)).assertFalse();
      }
      // Exactly ten rejection vectors were exercised by this case.
      expect(rejected.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0300
     * @tc.name      testClampLadder0003
     * @tc.desc      Verify clamp returns the bound, the value or the opposite bound for a fixed window.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampLadder0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClampLadder0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The inclusive lower bound used by every vector.
      const min: number = 10;
      // The inclusive upper bound used by every vector.
      const max: number = 20;
      // The inputs below the window, all of which must clamp to the minimum.
      const below: number[] = [-1000, -1, 0, 5, 9, 9.5, 9.999];
      // The inputs inside the window, all of which must be returned untouched.
      const inside: number[] = [10, 12, 15, 17.25, 19, 19.999, 20];
      // The inputs above the window, all of which must clamp to the maximum.
      const above: number[] = [20.001, 21, 50, 100, 1000, 1e6, 1e9];
      // Confirm every below-window input collapses onto the lower bound.
      for (let i: number = 0; i < below.length; i++) {
        // Record the input under test.
        const value: number = below[i];
        // Print the current vector so a failure is traceable from hilog alone.
        logCase(TAG, 'clamp(' + value.toString() + ', 10, 20)');
        // The value must collapse onto the minimum.
        expect(NumberUtils.clamp(value, min, max)).assertEqual(min);
      }
      // Confirm every in-window input is returned unchanged.
      for (let i: number = 0; i < inside.length; i++) {
        // Record the input under test.
        const value: number = inside[i];
        // Print the current vector so a failure is traceable from hilog alone.
        logCase(TAG, 'clamp(' + value.toString() + ', 10, 20)');
        // The value must survive the clamp untouched.
        expect(NumberUtils.clamp(value, min, max)).assertEqual(value);
      }
      // Confirm every above-window input collapses onto the upper bound.
      for (let i: number = 0; i < above.length; i++) {
        // Record the input under test.
        const value: number = above[i];
        // Print the current vector so a failure is traceable from hilog alone.
        logCase(TAG, 'clamp(' + value.toString() + ', 10, 20)');
        // The value must collapse onto the maximum.
        expect(NumberUtils.clamp(value, min, max)).assertEqual(max);
      }
      // The three ladders together cover exactly twenty one vectors.
      expect(below.length + inside.length + above.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0400
     * @tc.name      testClampWindowShapes0004
     * @tc.desc      Verify clamp handles degenerate and inverted windows without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClampWindowShapes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testClampWindowShapes0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single point window collapses every input onto that point.
      logCase(TAG, 'clamp(7, 5, 5)');
      expect(NumberUtils.clamp(7, 5, 5)).assertEqual(5);
      // The same single point window keeps values already below it at the point.
      logCase(TAG, 'clamp(3, 5, 5)');
      expect(NumberUtils.clamp(3, 5, 5)).assertEqual(5);
      // The same single point window keeps the point itself untouched.
      logCase(TAG, 'clamp(5, 5, 5)');
      expect(NumberUtils.clamp(5, 5, 5)).assertEqual(5);
      // A window spanning negative and positive values clamps a large negative input.
      logCase(TAG, 'clamp(-900, -100, 100)');
      expect(NumberUtils.clamp(-900, -100, 100)).assertEqual(-100);
      // The same symmetric window clamps a large positive input.
      logCase(TAG, 'clamp(900, -100, 100)');
      expect(NumberUtils.clamp(900, -100, 100)).assertEqual(100);
      // The same symmetric window keeps zero untouched.
      logCase(TAG, 'clamp(0, -100, 100)');
      expect(NumberUtils.clamp(0, -100, 100)).assertEqual(0);
      // An inverted window reports the maximum first, so a mid value collapses onto the maximum.
      logCase(TAG, 'clamp(50, 100, 0)');
      expect(NumberUtils.clamp(50, 100, 0)).assertEqual(0);
      // An inverted window pushes every negative input above the minimum onto the maximum.
      logCase(TAG, 'clamp(-5, 100, 0)');
      expect(NumberUtils.clamp(-5, 100, 0)).assertEqual(0);
      // An inverted window leaves a value above the first bound at the maximum.
      logCase(TAG, 'clamp(200, 100, 0)');
      expect(NumberUtils.clamp(200, 100, 0)).assertEqual(0);
      // A window derived from the full kilo range clamps at the absolute boundary.
      logCase(TAG, 'clamp(MEGA, 0, KILO)');
      expect(NumberUtils.clamp(MEGA, 0, KILO)).assertEqual(KILO);
      // A fractional window keeps the fractional value intact.
      logCase(TAG, 'clamp(0.5, 0.25, 0.75)');
      expect(NumberUtils.clamp(0.5, 0.25, 0.75)).assertEqual(0.5);
      // The same fractional window clamps a value below the fractional lower bound.
      logCase(TAG, 'clamp(0.1, 0.25, 0.75)');
      expect(NumberUtils.clamp(0.1, 0.25, 0.75)).assertEqual(0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0500
     * @tc.name      testRoundHalfUpLadder0005
     * @tc.desc      Verify round shifts the value by the requested power-of-ten factor.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundHalfUpLadder0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testRoundHalfUpLadder0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Rounding to zero places behaves like Math.round.
      logCase(TAG, 'round(1.4, 0)');
      expect(NumberUtils.round(1.4, 0)).assertEqual(1);
      // Rounding to zero places moves the half value upwards.
      logCase(TAG, 'round(1.5, 0)');
      expect(NumberUtils.round(1.5, 0)).assertEqual(2);
      // Rounding to zero places moves 2.5 upwards as well.
      logCase(TAG, 'round(2.5, 0)');
      expect(NumberUtils.round(2.5, 0)).assertEqual(3);
      // Rounding to zero places keeps an exact integer untouched.
      logCase(TAG, 'round(42, 0)');
      expect(NumberUtils.round(42, 0)).assertEqual(42);
      // One decimal place truncates the trailing digits downwards.
      logCase(TAG, 'round(1.234, 1)');
      expect(NumberUtils.round(1.234, 1)).assertEqual(1.2);
      // One decimal place lifts the second digit upwards.
      logCase(TAG, 'round(1.256, 1)');
      expect(NumberUtils.round(1.256, 1)).assertEqual(1.3);
      // Two decimal places keep a two digit fraction untouched.
      logCase(TAG, 'round(1.005, 2)');
      expect(NumberUtils.round(1.005, 2)).assertEqual(1.01);
      // Two decimal places round the third digit downwards.
      logCase(TAG, 'round(3.14159, 2)');
      expect(NumberUtils.round(3.14159, 2)).assertEqual(3.14);
      // Three decimal places keep the leading fraction digits.
      logCase(TAG, 'round(2.71828, 3)');
      expect(NumberUtils.round(2.71828, 3)).assertEqual(2.718);
      // Four decimal places push the fourth digit upwards.
      logCase(TAG, 'round(0.00005, 4)');
      expect(NumberUtils.round(0.00005, 4)).assertEqual(0.0001);
      // Five decimal places preserve five leading fraction digits.
      logCase(TAG, 'round(0.123456, 5)');
      expect(NumberUtils.round(0.123456, 5)).assertEqual(0.12346);
      // Six decimal places shrink a value that is already rounded.
      logCase(TAG, 'round(0.5, 6)');
      expect(NumberUtils.round(0.5, 6)).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0600
     * @tc.name      testRoundNegativeLadder0006
     * @tc.desc      Verify round applies the same half-away-from-zero rule to negative inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundNegativeLadder0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testRoundNegativeLadder0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A negative half value rounds away from zero.
      logCase(TAG, 'round(-1.5, 0)');
      expect(NumberUtils.round(-1.5, 0)).assertEqual(-1);
      // A negative value under the half boundary rounds towards zero.
      logCase(TAG, 'round(-1.4, 0)');
      expect(NumberUtils.round(-1.4, 0)).assertEqual(-1);
      // A second negative half value rounds away from zero.
      logCase(TAG, 'round(-2.5, 0)');
      expect(NumberUtils.round(-2.5, 0)).assertEqual(-2);
      // An exact negative integer survives the round trip.
      logCase(TAG, 'round(-42, 0)');
      expect(NumberUtils.round(-42, 0)).assertEqual(-42);
      // One decimal place rounds a negative value towards zero.
      logCase(TAG, 'round(-1.234, 1)');
      expect(NumberUtils.round(-1.234, 1)).assertEqual(-1.2);
      // One decimal place rounds a negative value away from zero.
      logCase(TAG, 'round(-1.256, 1)');
      expect(NumberUtils.round(-1.256, 1)).assertEqual(-1.3);
      // Two decimal places keep the negative sign and trim the tail.
      logCase(TAG, 'round(-3.14159, 2)');
      expect(NumberUtils.round(-3.14159, 2)).assertEqual(-3.14);
      // Three decimal places keep three fraction digits on a negative value.
      logCase(TAG, 'round(-2.71828, 3)');
      expect(NumberUtils.round(-2.71828, 3)).assertEqual(-2.718);
      // Four decimal places keep a tiny negative half on the zero side of the boundary.
      logCase(TAG, 'round(-0.00005, 4)');
      expect(NumberUtils.round(-0.00005, 4)).assertEqual(0);
      // Negative zero input stays at zero.
      logCase(TAG, 'round(-0, 2)');
      expect(NumberUtils.round(-0, 2)).assertEqual(0);
      // A negative value below the grid collapses onto zero.
      logCase(TAG, 'round(-0.0001, 2)');
      expect(NumberUtils.round(-0.0001, 2)).assertEqual(0);
      // A tiny positive value below the grid collapses onto zero as well.
      logCase(TAG, 'round(0.0001, 2)');
      expect(NumberUtils.round(0.0001, 2)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0700
     * @tc.name      testFileSizeByteBand0007
     * @tc.desc      Verify fileSizeText prints raw byte counts for inputs below the kilo boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeByteBand0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFileSizeByteBand0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The byte counts that must be printed as plain integers with the byte unit.
      const bytes: number[] = [0, 1, 2, 9, 10, 99, 100, 511, 512, 1000, 1022, 1023];
      // Walk every byte count inside the band.
      for (let i: number = 0; i < bytes.length; i++) {
        // Record the count under test.
        const value: number = bytes[i];
        // Print the current input so a failure is traceable from hilog alone.
        logCase(TAG, 'fileSizeText(' + value.toString() + ')');
        // The helper must print the raw count behind the byte unit.
        expect(NumberUtils.fileSizeText(value)).assertEqual(value.toString() + ' B');
      }
      // Exactly twelve byte counts were exercised by this case.
      expect(bytes.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0800
     * @tc.name      testFileSizeKiloBand0008
     * @tc.desc      Verify fileSizeText switches to kilobytes exactly at the kilo boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeKiloBand0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFileSizeKiloBand0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The boundary value itself switches to the kilo unit.
      logCase(TAG, 'fileSizeText(1024)');
      expect(NumberUtils.fileSizeText(KILO)).assertEqual('1 KB');
      // One and a half kilo renders with two decimals.
      logCase(TAG, 'fileSizeText(1536)');
      expect(NumberUtils.fileSizeText(1536)).assertEqual('1.5 KB');
      // Exactly two kilo keeps the integer form.
      logCase(TAG, 'fileSizeText(2048)');
      expect(NumberUtils.fileSizeText(2 * KILO)).assertEqual('2 KB');
      // Three kilo plus a fraction renders two decimals.
      logCase(TAG, 'fileSizeText(3200)');
      expect(NumberUtils.fileSizeText(3200)).assertEqual('3.13 KB');
      // Ten kilo renders the integer form.
      logCase(TAG, 'fileSizeText(10240)');
      expect(NumberUtils.fileSizeText(10 * KILO)).assertEqual('10 KB');
      // One hundred kilo renders the integer form.
      logCase(TAG, 'fileSizeText(102400)');
      expect(NumberUtils.fileSizeText(100 * KILO)).assertEqual('100 KB');
      // Half a mega stays inside the kilo band just below the boundary.
      logCase(TAG, 'fileSizeText(524288)');
      expect(NumberUtils.fileSizeText(MEGA / 2)).assertEqual('512 KB');
      // One kilo minus one byte stays in the byte band.
      logCase(TAG, 'fileSizeText(1023)');
      expect(NumberUtils.fileSizeText(KILO - 1)).assertEqual('1023 B');
      // One mega minus one byte stays in the kilo band.
      logCase(TAG, 'fileSizeText(1048575)');
      expect(NumberUtils.fileSizeText(MEGA - 1)).assertEqual('1024 KB');
      // An odd count renders the truncated third decimal.
      logCase(TAG, 'fileSizeText(1300)');
      expect(NumberUtils.fileSizeText(1300)).assertEqual('1.27 KB');
      // A count of 1200 byte renders one decimal place only.
      logCase(TAG, 'fileSizeText(1200)');
      expect(NumberUtils.fileSizeText(1200)).assertEqual('1.17 KB');
      // A count of 2047 byte stays just under two kilo.
      logCase(TAG, 'fileSizeText(2047)');
      expect(NumberUtils.fileSizeText(2047)).assertEqual('2 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_0900
     * @tc.name      testFileSizeMegaGigaBand0009
     * @tc.desc      Verify fileSizeText switches to megabytes and gigabytes at their boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileSizeMegaGigaBand0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFileSizeMegaGigaBand0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Exactly one mega switches to the mega unit.
      logCase(TAG, 'fileSizeText(1048576)');
      expect(NumberUtils.fileSizeText(MEGA)).assertEqual('1 MB');
      // One and a half mega renders two decimals.
      logCase(TAG, 'fileSizeText(1572864)');
      expect(NumberUtils.fileSizeText(MEGA + MEGA / 2)).assertEqual('1.5 MB');
      // Two point five mega renders two decimals.
      logCase(TAG, 'fileSizeText(2621440)');
      expect(NumberUtils.fileSizeText(MEGA * 2.5)).assertEqual('2.5 MB');
      // Ten mega renders the integer form.
      logCase(TAG, 'fileSizeText(10485760)');
      expect(NumberUtils.fileSizeText(10 * MEGA)).assertEqual('10 MB');
      // One hundred mega renders the integer form.
      logCase(TAG, 'fileSizeText(104857600)');
      expect(NumberUtils.fileSizeText(100 * MEGA)).assertEqual('100 MB');
      // Half a giga stays inside the mega band.
      logCase(TAG, 'fileSizeText(536870912)');
      expect(NumberUtils.fileSizeText(GIGA / 2)).assertEqual('512 MB');
      // Exactly one giga switches to the giga unit.
      logCase(TAG, 'fileSizeText(1073741824)');
      expect(NumberUtils.fileSizeText(GIGA)).assertEqual('1 GB');
      // Two giga renders the integer form.
      logCase(TAG, 'fileSizeText(2147483648)');
      expect(NumberUtils.fileSizeText(GIGA * 2)).assertEqual('2 GB');
      // One giga minus one byte stays in the mega band.
      logCase(TAG, 'fileSizeText(1073741823)');
      expect(NumberUtils.fileSizeText(GIGA - 1)).assertEqual('1024 MB');
      // Negative inputs report the dash placeholder.
      logCase(TAG, 'fileSizeText(-1)');
      expect(NumberUtils.fileSizeText(-1)).assertEqual('-');
      // Large negative inputs report the dash placeholder as well.
      logCase(TAG, 'fileSizeText(-1048576)');
      expect(NumberUtils.fileSizeText(-MEGA)).assertEqual('-');
      // Negative zero is not below zero and prints as the byte band.
      logCase(TAG, 'fileSizeText(-0)');
      expect(NumberUtils.fileSizeText(-0)).assertEqual('0 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1000
     * @tc.name      testDurationMsText0010
     * @tc.desc      Verify durationMsText keeps exactly one decimal place for every magnitude.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationMsText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDurationMsText0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero milliseconds renders the integer form behind the millisecond unit.
      logCase(TAG, 'durationMsText(0)');
      expect(NumberUtils.durationMsText(0)).assertEqual('0 ms');
      // A fraction below a tenth of a millisecond collapses onto zero.
      logCase(TAG, 'durationMsText(0.04)');
      expect(NumberUtils.durationMsText(0.04)).assertEqual('0 ms');
      // A fraction of exactly one tenth keeps one decimal place.
      logCase(TAG, 'durationMsText(0.1)');
      expect(NumberUtils.durationMsText(0.1)).assertEqual('0.1 ms');
      // A quarter millisecond rounds down to two tenths.
      logCase(TAG, 'durationMsText(0.25)');
      expect(NumberUtils.durationMsText(0.25)).assertEqual('0.3 ms');
      // A half millisecond rounds to five tenths.
      logCase(TAG, 'durationMsText(0.5)');
      expect(NumberUtils.durationMsText(0.5)).assertEqual('0.5 ms');
      // One millisecond renders the integer form.
      logCase(TAG, 'durationMsText(1)');
      expect(NumberUtils.durationMsText(1)).assertEqual('1 ms');
      // One and a quarter millisecond rounds to three tenths.
      logCase(TAG, 'durationMsText(1.25)');
      expect(NumberUtils.durationMsText(1.25)).assertEqual('1.3 ms');
      // Fifteen point five millisecond keeps one decimal place.
      logCase(TAG, 'durationMsText(15.5)');
      expect(NumberUtils.durationMsText(15.5)).assertEqual('15.5 ms');
      // One hundred milliseconds renders the integer form.
      logCase(TAG, 'durationMsText(100)');
      expect(NumberUtils.durationMsText(100)).assertEqual('100 ms');
      // One thousand milliseconds renders the integer form.
      logCase(TAG, 'durationMsText(1000)');
      expect(NumberUtils.durationMsText(1000)).assertEqual('1000 ms');
      // Sixty thousand milliseconds renders the integer form.
      logCase(TAG, 'durationMsText(60000)');
      expect(NumberUtils.durationMsText(60000)).assertEqual('60000 ms');
      // One hour in milliseconds renders the integer form.
      logCase(TAG, 'durationMsText(3600000)');
      expect(NumberUtils.durationMsText(3600000)).assertEqual('3600000 ms');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1100
     * @tc.name      testThousandSeparatorsGrouping0011
     * @tc.desc      Verify thousandSeparators inserts one comma per three integer digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThousandSeparatorsGrouping0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testThousandSeparatorsGrouping0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero stays a single digit.
      logCase(TAG, 'thousandSeparators(0)');
      expect(NumberUtils.thousandSeparators(0)).assertEqual('0');
      // A single digit stays untouched.
      logCase(TAG, 'thousandSeparators(7)');
      expect(NumberUtils.thousandSeparators(7)).assertEqual('7');
      // Two digits stay untouched.
      logCase(TAG, 'thousandSeparators(42)');
      expect(NumberUtils.thousandSeparators(42)).assertEqual('42');
      // Three digits stay untouched.
      logCase(TAG, 'thousandSeparators(999)');
      expect(NumberUtils.thousandSeparators(999)).assertEqual('999');
      // Four digits collect one comma.
      logCase(TAG, 'thousandSeparators(1000)');
      expect(NumberUtils.thousandSeparators(1000)).assertEqual('1,000');
      // Five digits collect one comma.
      logCase(TAG, 'thousandSeparators(12345)');
      expect(NumberUtils.thousandSeparators(12345)).assertEqual('12,345');
      // Six digits collect one comma.
      logCase(TAG, 'thousandSeparators(999999)');
      expect(NumberUtils.thousandSeparators(999999)).assertEqual('999,999');
      // Seven digits collect two commas.
      logCase(TAG, 'thousandSeparators(1234567)');
      expect(NumberUtils.thousandSeparators(1234567)).assertEqual('1,234,567');
      // Nine digits collect three commas.
      logCase(TAG, 'thousandSeparators(123456789)');
      expect(NumberUtils.thousandSeparators(123456789)).assertEqual('123,456,789');
      // Thirteen digits collect four commas.
      logCase(TAG, 'thousandSeparators(1234567890123)');
      expect(NumberUtils.thousandSeparators(1234567890123)).assertEqual('1,234,567,890,123');
      // The kilo boundary collects one comma.
      logCase(TAG, 'thousandSeparators(1024)');
      expect(NumberUtils.thousandSeparators(KILO)).assertEqual('1,024');
      // The mega boundary collects two commas.
      logCase(TAG, 'thousandSeparators(1048576)');
      expect(NumberUtils.thousandSeparators(MEGA)).assertEqual('1,048,576');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1200
     * @tc.name      testThousandSeparatorsFractionSign0012
     * @tc.desc      Verify thousandSeparators keeps the minus sign and truncates the fraction part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThousandSeparatorsFractionSign0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testThousandSeparatorsFractionSign0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A negative four digit value keeps the leading minus sign.
      logCase(TAG, 'thousandSeparators(-1000)');
      expect(NumberUtils.thousandSeparators(-1000)).assertEqual('-1,000');
      // A negative seven digit value keeps the leading minus sign.
      logCase(TAG, 'thousandSeparators(-1234567)');
      expect(NumberUtils.thousandSeparators(-1234567)).assertEqual('-1,234,567');
      // A negative value below one thousand stays a plain signed digit string.
      logCase(TAG, 'thousandSeparators(-999)');
      expect(NumberUtils.thousandSeparators(-999)).assertEqual('-999');
      // A negative single digit stays a plain signed digit string.
      logCase(TAG, 'thousandSeparators(-7)');
      expect(NumberUtils.thousandSeparators(-7)).assertEqual('-7');
      // The fraction part is truncated before the grouping.
      logCase(TAG, 'thousandSeparators(1234.99)');
      expect(NumberUtils.thousandSeparators(1234.99)).assertEqual('1,234');
      // The fraction part is truncated on a negative input as well.
      logCase(TAG, 'thousandSeparators(-1234.99)');
      expect(NumberUtils.thousandSeparators(-1234.99)).assertEqual('-1,234');
      // A fraction below one thousand never reaches the comma boundary.
      logCase(TAG, 'thousandSeparators(999.9)');
      expect(NumberUtils.thousandSeparators(999.9)).assertEqual('999');
      // A fraction above the first boundary collects one comma.
      logCase(TAG, 'thousandSeparators(1000.9)');
      expect(NumberUtils.thousandSeparators(1000.9)).assertEqual('1,000');
      // Negative zero is not below zero and therefore loses the sign.
      logCase(TAG, 'thousandSeparators(-0)');
      expect(NumberUtils.thousandSeparators(-0)).assertEqual('0');
      // A value between zero and one truncates onto zero.
      logCase(TAG, 'thousandSeparators(0.5)');
      expect(NumberUtils.thousandSeparators(0.5)).assertEqual('0');
      // A negative value between zero and one truncates onto negative zero.
      logCase(TAG, 'thousandSeparators(-0.5)');
      expect(NumberUtils.thousandSeparators(-0.5)).assertEqual('0');
      // The giga boundary collects four commas.
      logCase(TAG, 'thousandSeparators(1073741824)');
      expect(NumberUtils.thousandSeparators(GIGA)).assertEqual('1,073,741,824');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1300
     * @tc.name      testParseIntSafeValid0013
     * @tc.desc      Verify parseIntSafe accepts decimal literals with signs and surrounding blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafeValid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParseIntSafeValid0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The fallback value that must never be reported by an accepted literal.
      const fallback: number = -999;
      // A plain zero literal parses to zero.
      logCase(TAG, 'parseIntSafe("0")');
      expect(NumberUtils.parseIntSafe('0', fallback)).assertEqual(0);
      // A plain integer literal parses to its value.
      logCase(TAG, 'parseIntSafe("42")');
      expect(NumberUtils.parseIntSafe('42', fallback)).assertEqual(42);
      // A negative literal keeps its sign.
      logCase(TAG, 'parseIntSafe("-42")');
      expect(NumberUtils.parseIntSafe('-42', fallback)).assertEqual(-42);
      // An explicit plus sign is accepted.
      logCase(TAG, 'parseIntSafe("+42")');
      expect(NumberUtils.parseIntSafe('+42', fallback)).assertEqual(42);
      // Leading blanks are skipped by the parser.
      logCase(TAG, 'parseIntSafe("   42")');
      expect(NumberUtils.parseIntSafe('   42', fallback)).assertEqual(42);
      // Trailing blanks are ignored by the parser.
      logCase(TAG, 'parseIntSafe("42   ")');
      expect(NumberUtils.parseIntSafe('42   ', fallback)).assertEqual(42);
      // Blanks around a signed literal are skipped.
      logCase(TAG, 'parseIntSafe("  -7  ")');
      expect(NumberUtils.parseIntSafe('  -7  ', fallback)).assertEqual(-7);
      // A trailing fraction part is truncated by the integer parser.
      logCase(TAG, 'parseIntSafe("42.9")');
      expect(NumberUtils.parseIntSafe('42.9', fallback)).assertEqual(42);
      // Trailing text after the digits is ignored.
      logCase(TAG, 'parseIntSafe("42px")');
      expect(NumberUtils.parseIntSafe('42px', fallback)).assertEqual(42);
      // A leading zero literal is parsed with radix ten.
      logCase(TAG, 'parseIntSafe("007")');
      expect(NumberUtils.parseIntSafe('007', fallback)).assertEqual(7);
      // A common hexadecimal looking literal is parsed with radix ten.
      logCase(TAG, 'parseIntSafe("0x10")');
      expect(NumberUtils.parseIntSafe('0x10', fallback)).assertEqual(0);
      // A large six digit literal parses to its exact value.
      logCase(TAG, 'parseIntSafe("123456")');
      expect(NumberUtils.parseIntSafe('123456', fallback)).assertEqual(123456);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1400
     * @tc.name      testParseIntSafeFallback0014
     * @tc.desc      Verify parseIntSafe returns the caller fallback for every non numeric literal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafeFallback0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParseIntSafeFallback0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The literals that must all collapse onto the fallback value.
      const rejected: string[] = ['', ' ', 'abc', 'x1', '-', '+', '.', '.5', '-.5', 'e5', '1e5', 'NaN',
        'Infinity', '-Infinity', 'null', 'undefined', '  ', '\t'];
      // Walk every rejected literal with a positive fallback.
      for (let i: number = 0; i < rejected.length; i++) {
        // Record the literal under test.
        const text: string = rejected[i];
        // Print the current literal so a failure is traceable from hilog alone.
        logCase(TAG, 'parseIntSafe("' + text + '", 7)');
        // The parser must report the fallback for the rejected literal.
        expect(NumberUtils.parseIntSafe(text, 7)).assertEqual(7);
      }
      // The same literal collapses onto a zero fallback.
      logCase(TAG, 'parseIntSafe("abc", 0)');
      expect(NumberUtils.parseIntSafe('abc', 0)).assertEqual(0);
      // The same literal collapses onto a negative fallback.
      logCase(TAG, 'parseIntSafe("abc", -1)');
      expect(NumberUtils.parseIntSafe('abc', -1)).assertEqual(-1);
      // The fallback is reported verbatim for a blank literal.
      logCase(TAG, 'parseIntSafe("   ", 42)');
      expect(NumberUtils.parseIntSafe('   ', 42)).assertEqual(42);
      // Eighteen rejected literals were exercised by this case.
      expect(rejected.length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1500
     * @tc.name      testParseFloatSafeValid0015
     * @tc.desc      Verify parseFloatSafe accepts fractions, exponents and signed decimal literals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseFloatSafeValid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParseFloatSafeValid0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The fallback value that must never be reported by an accepted literal.
      const fallback: number = -1;
      // A plain fraction parses to its exact value.
      logCase(TAG, 'parseFloatSafe("1.5")');
      expect(NumberUtils.parseFloatSafe('1.5', fallback)).assertEqual(1.5);
      // A negative fraction keeps its sign.
      logCase(TAG, 'parseFloatSafe("-1.5")');
      expect(NumberUtils.parseFloatSafe('-1.5', fallback)).assertEqual(-1.5);
      // An explicit plus sign is accepted on a fraction.
      logCase(TAG, 'parseFloatSafe("+2.25")');
      expect(NumberUtils.parseFloatSafe('+2.25', fallback)).assertEqual(2.25);
      // A leading dot fraction is accepted.
      logCase(TAG, 'parseFloatSafe(".5")');
      expect(NumberUtils.parseFloatSafe('.5', fallback)).assertEqual(0.5);
      // A trailing dot fraction is accepted.
      logCase(TAG, 'parseFloatSafe("5.")');
      expect(NumberUtils.parseFloatSafe('5.', fallback)).assertEqual(5);
      // A positive exponent literal is accepted.
      logCase(TAG, 'parseFloatSafe("1e3")');
      expect(NumberUtils.parseFloatSafe('1e3', fallback)).assertEqual(1000);
      // A negative exponent literal is accepted.
      logCase(TAG, 'parseFloatSafe("1e-3")');
      expect(NumberUtils.parseFloatSafe('1e-3', fallback)).assertEqual(0.001);
      // A signed mantissa with an exponent is accepted.
      logCase(TAG, 'parseFloatSafe("-2.5e2")');
      expect(NumberUtils.parseFloatSafe('-2.5e2', fallback)).assertEqual(-250);
      // Leading blanks are skipped by the float parser.
      logCase(TAG, 'parseFloatSafe("   3.75")');
      expect(NumberUtils.parseFloatSafe('   3.75', fallback)).assertEqual(3.75);
      // Trailing text after the digits is ignored.
      logCase(TAG, 'parseFloatSafe("3.75kg")');
      expect(NumberUtils.parseFloatSafe('3.75kg', fallback)).assertEqual(3.75);
      // A plain integer literal parses into a float of the same value.
      logCase(TAG, 'parseFloatSafe("42")');
      expect(NumberUtils.parseFloatSafe('42', fallback)).assertEqual(42);
      // A zero fraction keeps its sign-free zero value.
      logCase(TAG, 'parseFloatSafe("0.0")');
      expect(NumberUtils.parseFloatSafe('0.0', fallback)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1600
     * @tc.name      testParseFloatSafeFallback0016
     * @tc.desc      Verify parseFloatSafe returns the caller fallback for literal-free text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseFloatSafeFallback0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParseFloatSafeFallback0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The literals that must all collapse onto the fallback value.
      const rejected: string[] = ['', ' ', 'abc', 'x', '-', '+', '.', 'e3', 'NaN', 'Infinity',
        '-Infinity', 'null', 'undefined'];
      // Walk every rejected literal with a fraction fallback.
      for (let i: number = 0; i < rejected.length; i++) {
        // Record the literal under test.
        const text: string = rejected[i];
        // Print the current literal so a failure is traceable from hilog alone.
        logCase(TAG, 'parseFloatSafe("' + text + '", 0.5)');
        // The parser must report the fallback for the rejected literal.
        expect(NumberUtils.parseFloatSafe(text, 0.5)).assertEqual(0.5);
      }
      // The same literal collapses onto a zero fallback.
      logCase(TAG, 'parseFloatSafe("abc", 0)');
      expect(NumberUtils.parseFloatSafe('abc', 0)).assertEqual(0);
      // The same literal collapses onto a large fallback.
      logCase(TAG, 'parseFloatSafe("abc", 1e6)');
      expect(NumberUtils.parseFloatSafe('abc', 1e6)).assertEqual(1e6);
      // The same literal collapses onto a tiny fallback.
      logCase(TAG, 'parseFloatSafe("abc", 1e-6)');
      expect(NumberUtils.parseFloatSafe('abc', 1e-6)).assertEqual(1e-6);
      // Thirteen rejected literals were exercised by this case.
      expect(rejected.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1700
     * @tc.name      testAngleConversionTable0017
     * @tc.desc      Verify toDegrees and toRadians agree on the canonical quarter turn table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAngleConversionTable0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testAngleConversionTable0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The angle in radians that converts to zero degrees.
      logCase(TAG, 'toDegrees(0)');
      expect(NumberUtils.toDegrees(0)).assertEqual(0);
      // A quarter turn in radians converts to ninety degrees.
      logCase(TAG, 'toDegrees(pi/2)');
      expect(Math.abs(NumberUtils.toDegrees(Math.PI / 2) - 90) < EPSILON).assertTrue();
      // A half turn in radians converts to one hundred eighty degrees.
      logCase(TAG, 'toDegrees(pi)');
      expect(NumberUtils.toDegrees(Math.PI)).assertEqual(180);
      // A full turn in radians converts to three hundred sixty degrees.
      logCase(TAG, 'toDegrees(2pi)');
      expect(Math.abs(NumberUtils.toDegrees(FULL_TURN_RADIANS) - FULL_TURN_DEGREES) < EPSILON).assertTrue();
      // A negative quarter turn converts to minus ninety degrees.
      logCase(TAG, 'toDegrees(-pi/2)');
      expect(Math.abs(NumberUtils.toDegrees(-Math.PI / 2) + 90) < EPSILON).assertTrue();
      // Zero degrees converts back to zero radians.
      logCase(TAG, 'toRadians(0)');
      expect(NumberUtils.toRadians(0)).assertEqual(0);
      // Ninety degrees converts to a quarter turn in radians.
      logCase(TAG, 'toRadians(90)');
      expect(Math.abs(NumberUtils.toRadians(90) - Math.PI / 2) < EPSILON).assertTrue();
      // One hundred eighty degrees converts to a half turn in radians.
      logCase(TAG, 'toRadians(180)');
      expect(Math.abs(NumberUtils.toRadians(180) - Math.PI) < EPSILON).assertTrue();
      // Three hundred sixty degrees converts to one full turn in radians.
      logCase(TAG, 'toRadians(360)');
      expect(Math.abs(NumberUtils.toRadians(FULL_TURN_DEGREES) - FULL_TURN_RADIANS) < EPSILON).assertTrue();
      // Minus ninety degrees converts to a negative quarter turn.
      logCase(TAG, 'toRadians(-90)');
      expect(Math.abs(NumberUtils.toRadians(-90) + Math.PI / 2) < EPSILON).assertTrue();
      // A moderately large angle round trips through both conversions.
      logCase(TAG, 'toDegrees(toRadians(137))');
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(137)) - 137) < EPSILON_WIDE).assertTrue();
      // A small angle round trips through both conversions within the wide tolerance.
      logCase(TAG, 'toRadians(toDegrees(0.25))');
      expect(Math.abs(NumberUtils.toRadians(NumberUtils.toDegrees(0.25)) - 0.25) < EPSILON_WIDE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1800
     * @tc.name      testAngleConversionLargeSweep0018
     * @tc.desc      Verify toDegrees and toRadians are linear across a wide sweep of magnitudes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAngleConversionLargeSweep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testAngleConversionLargeSweep0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The degrees sweep used by the linearity checks.
      const degrees: number[] = [-720, -360, -180, -90, -45, -1, 0, 1, 15, 30, 45, 60, 90, 120, 180,
        270, 360, 720, 1080, 3600];
      // Walk every degree value and check the two directional conversions.
      for (let i: number = 0; i < degrees.length; i++) {
        // Record the degree value under test.
        const value: number = degrees[i];
        // Convert once into radians.
        const radians: number = NumberUtils.toRadians(value);
        // Print the intermediate value so a failure is traceable from hilog alone.
        logCase(TAG, 'degrees=' + value.toString() + ', radians=' + radians.toString());
        // Doubling the degrees must double the radians.
        expect(Math.abs(NumberUtils.toRadians(value * 2) - radians * 2) < EPSILON_WIDE).assertTrue();
        // Converting the radians back must restore the degrees.
        expect(Math.abs(NumberUtils.toDegrees(radians) - value) < EPSILON_WIDE).assertTrue();
        // Negating the degrees must negate the radians.
        expect(Math.abs(NumberUtils.toRadians(-value) + radians) < EPSILON_WIDE).assertTrue();
      }
      // The sweep covered exactly twenty degree values.
      expect(degrees.length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_1900
     * @tc.name      testPercentTextTable0019
     * @tc.desc      Verify percentText scales the ratio by one hundred and appends the percent sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentTextTable0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPercentTextTable0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A zero ratio renders zero percent.
      logCase(TAG, 'percentText(0, 0)');
      expect(NumberUtils.percentText(0, 0)).assertEqual('0%');
      // A full ratio renders one hundred percent.
      logCase(TAG, 'percentText(1, 0)');
      expect(NumberUtils.percentText(1, 0)).assertEqual('100%');
      // A half ratio renders fifty percent.
      logCase(TAG, 'percentText(0.5, 0)');
      expect(NumberUtils.percentText(0.5, 0)).assertEqual('50%');
      // A quarter ratio renders twenty five percent.
      logCase(TAG, 'percentText(0.25, 0)');
      expect(NumberUtils.percentText(0.25, 0)).assertEqual('25%');
      // A ratio of a fifth renders twenty percent.
      logCase(TAG, 'percentText(0.2, 0)');
      expect(NumberUtils.percentText(0.2, 0)).assertEqual('20%');
      // A ratio of a tenth renders ten percent.
      logCase(TAG, 'percentText(0.1, 0)');
      expect(NumberUtils.percentText(0.1, 0)).assertEqual('10%');
      // One decimal place keeps the truncated fraction.
      logCase(TAG, 'percentText(0.123, 1)');
      expect(NumberUtils.percentText(0.123, 1)).assertEqual('12.3%');
      // Two decimal places keep two fraction digits after the scaling.
      logCase(TAG, 'percentText(0.1234, 2)');
      expect(NumberUtils.percentText(0.1234, 2)).assertEqual('12.34%');
      // Three decimal places keep three fraction digits after the scaling.
      logCase(TAG, 'percentText(0.98765, 3)');
      expect(NumberUtils.percentText(0.98765, 3)).assertEqual('98.765%');
      // A ratio above one renders above one hundred percent.
      logCase(TAG, 'percentText(1.5, 0)');
      expect(NumberUtils.percentText(1.5, 0)).assertEqual('150%');
      // A ratio above two renders above two hundred percent.
      logCase(TAG, 'percentText(2.25, 1)');
      expect(NumberUtils.percentText(2.25, 1)).assertEqual('225%');
      // A tiny ratio collapses onto zero percent at zero places.
      logCase(TAG, 'percentText(0.001, 0)');
      expect(NumberUtils.percentText(0.001, 0)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_2000
     * @tc.name      testPercentTextSignAndSweep0020
     * @tc.desc      Verify percentText keeps negative signs and stays monotonic across a ratio sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPercentTextSignAndSweep0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPercentTextSignAndSweep0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A negative quarter ratio keeps the minus sign.
      logCase(TAG, 'percentText(-0.25, 0)');
      expect(NumberUtils.percentText(-0.25, 0)).assertEqual('-25%');
      // A negative full ratio keeps the minus sign.
      logCase(TAG, 'percentText(-1, 0)');
      expect(NumberUtils.percentText(-1, 0)).assertEqual('-100%');
      // A negative ratio with decimals keeps sign and precision.
      logCase(TAG, 'percentText(-0.123, 1)');
      expect(NumberUtils.percentText(-0.123, 1)).assertEqual('-12.3%');
      // A negative zero ratio loses the sign.
      logCase(TAG, 'percentText(-0, 2)');
      expect(NumberUtils.percentText(-0, 2)).assertEqual('0%');
      // A tiny negative ratio collapses onto zero.
      logCase(TAG, 'percentText(-0.001, 0)');
      expect(NumberUtils.percentText(-0.001, 0)).assertEqual('0%');
      // A ratio slightly above one hundred percent rounds down.
      logCase(TAG, 'percentText(1.004, 1)');
      expect(NumberUtils.percentText(1.004, 1)).assertEqual('100.4%');
      // A ratio with five fraction digits truncates at two places.
      logCase(TAG, 'percentText(0.456789, 2)');
      expect(NumberUtils.percentText(0.456789, 2)).assertEqual('45.68%');
      // A ratio with an exact third renders three fraction digits.
      logCase(TAG, 'percentText(1 / 3, 3)');
      expect(NumberUtils.percentText(1 / 3, 3)).assertEqual('33.333%');
      // Two thirds renders two fraction digits after rounding up.
      logCase(TAG, 'percentText(2 / 3, 2)');
      expect(NumberUtils.percentText(2 / 3, 2)).assertEqual('66.67%');
      // Four fifths renders eighty percent.
      logCase(TAG, 'percentText(0.8, 0)');
      expect(NumberUtils.percentText(0.8, 0)).assertEqual('80%');
      // Three quarters renders seventy five percent.
      logCase(TAG, 'percentText(0.75, 0)');
      expect(NumberUtils.percentText(0.75, 0)).assertEqual('75%');
      // Nine tenths renders ninety percent.
      logCase(TAG, 'percentText(0.9, 0)');
      expect(NumberUtils.percentText(0.9, 0)).assertEqual('90%');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_2100
     * @tc.name      testRandomIntInclusiveBounds0021
     * @tc.desc      Verify randomInt never escapes the inclusive bounds across a wide sampling loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntInclusiveBounds0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testRandomIntInclusiveBounds0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The inclusive bounds that are sampled repeatedly.
      const mins: number[] = [0, 0, 1, -5, -100, 10, 1000, -1000];
      // The inclusive upper bounds that pair with the lower bounds above.
      const maxs: number[] = [0, 1, 1, 5, -50, 10, 2000, 1000];
      // The number of draws performed for every bound pair.
      const draws: number = 8;
      // Walk every bound pair and sample it repeatedly.
      for (let i: number = 0; i < mins.length; i++) {
        // Record the pair under test.
        const min: number = mins[i];
        // Record the inclusive upper bound under test.
        const max: number = maxs[i];
        // Print the current pair so a failure is traceable from hilog alone.
        logCase(TAG, 'randomInt(' + min.toString() + ', ' + max.toString() + ')');
        // Draw the configured number of samples for the current pair.
        for (let d: number = 0; d < draws; d++) {
          // Draw one sample from the pair.
          const sample: number = NumberUtils.randomInt(min, max);
          // Every sample must stay inside the inclusive window.
          expect(sample >= min && sample <= max).assertTrue();
          // Every sample must be an integer.
          expect(Math.floor(sample)).assertEqual(sample);
        }
      }
      // Eight bound pairs were sampled eight times each.
      expect(mins.length * draws).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUMX_2200
     * @tc.name      testHelperCompositionChain0022
     * @tc.desc      Verify the helpers compose without losing precision in a formatting chain.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testHelperCompositionChain0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testHelperCompositionChain0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A byte count is first clamped and then rendered.
      logCase(TAG, 'fileSizeText(clamp(2000, 0, 1024))');
      expect(NumberUtils.fileSizeText(NumberUtils.clamp(2000, 0, KILO))).assertEqual('1 KB');
      // A parsed literal feeds the grouping helper directly.
      logCase(TAG, 'thousandSeparators(parseIntSafe("1234567", 0))');
      expect(NumberUtils.thousandSeparators(NumberUtils.parseIntSafe('1234567', 0)))
        .assertEqual('1,234,567');
      // A parsed float feeds the percent helper directly.
      logCase(TAG, 'percentText(parseFloatSafe("0.125", 0), 1)');
      expect(NumberUtils.percentText(NumberUtils.parseFloatSafe('0.125', 0), 1)).assertEqual('12.5%');
      // A rounded angle feeds the degree conversion directly.
      logCase(TAG, 'toDegrees(toRadians(round(45.678, 1)))');
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(NumberUtils.round(45.678, 1))) - 45.7) <
        EPSILON_WIDE).assertTrue();
      // An invalid literal feeds the percent helper through the fallback path.
      logCase(TAG, 'percentText(parseFloatSafe("abc", 0.5), 0)');
      expect(NumberUtils.percentText(NumberUtils.parseFloatSafe('abc', 0.5), 0)).assertEqual('50%');
      // A clamped duration feeds the millisecond text helper.
      logCase(TAG, 'durationMsText(clamp(1234.56, 0, 1000))');
      expect(NumberUtils.durationMsText(NumberUtils.clamp(1234.56, 0, 1000))).assertEqual('1000 ms');
      // A clamped ratio feeds the percent helper.
      logCase(TAG, 'percentText(clamp(1.5, 0, 1), 0)');
      expect(NumberUtils.percentText(NumberUtils.clamp(1.5, 0, 1), 0)).assertEqual('100%');
      // A negative byte count keeps the placeholder through the clamp of zero width.
      logCase(TAG, 'fileSizeText(clamp(-5, -10, 10))');
      expect(NumberUtils.fileSizeText(NumberUtils.clamp(-5, -10, 10))).assertEqual('-');
      // A rounded byte count reaches the kilo boundary.
      logCase(TAG, 'fileSizeText(round(1024.4, 0))');
      expect(NumberUtils.fileSizeText(NumberUtils.round(1024.4, 0))).assertEqual('1 KB');
      // A rounded negative byte count stays in the byte band.
      logCase(TAG, 'fileSizeText(round(-0.4, 0))');
      expect(NumberUtils.fileSizeText(NumberUtils.round(-0.4, 0))).assertEqual('0 B');
      // A parsed integer feeds the byte ladder through the kilo boundary.
      logCase(TAG, 'fileSizeText(parseIntSafe("2048", 0))');
      expect(NumberUtils.fileSizeText(NumberUtils.parseIntSafe('2048', 0))).assertEqual('2 KB');
      // A rounded ratio feeds the percent helper with two decimals.
      logCase(TAG, 'percentText(round(0.12345, 3), 1)');
      expect(NumberUtils.percentText(NumberUtils.round(0.12345, 3), 1)).assertEqual('12.3%');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
