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

// Import the number helpers under test from the library HAR package.
import { NumberUtils } from 'library';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The inclusive lower bound fed to the randomInt range loop.
const RANDOM_MIN: number = 3;
// The inclusive upper bound fed to the randomInt range loop.
const RANDOM_MAX: number = 9;
// The iteration count of the randomInt range loop required by the case matrix.
const RANDOM_RANGE_ROUNDS: number = 50;
// The iteration count of the randomInt boundary sweep used to observe both endpoints.
const RANDOM_BOUND_ROUNDS: number = 300;
// The epsilon used by the angle round trip hard float assertion.
const ANGLE_EPSILON: number = 1e-9;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every on-device logic test case of the number helpers.
export default function numberUtilsTest() {
  // Group the cases under the "NumberUtilsSuite" describe block.
  describe('NumberUtilsSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumberUtilsSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0100
     * @tc.name      testNumIsFinite0001
     * @tc.desc      Verify isFiniteNumber rejects NaN and the two infinities and accepts ordinary finite numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumIsFinite0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumIsFinite0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Check the NaN input against the finite guard.
      const nanResult: boolean = NumberUtils.isFiniteNumber(NaN);
      // Log the NaN input result.
      logCase(TAG, 'isFiniteNumber(NaN): ' + nanResult);
      // Expect the NaN input to be rejected as non finite.
      expect(nanResult).assertFalse();

      // Check the positive Infinity input against the finite guard.
      const posInfResult: boolean = NumberUtils.isFiniteNumber(Infinity);
      // Log the positive Infinity input result.
      logCase(TAG, 'isFiniteNumber(Infinity): ' + posInfResult);
      // Expect the positive Infinity input to be rejected as non finite.
      expect(posInfResult).assertFalse();

      // Check the negative Infinity input against the finite guard.
      const negInfResult: boolean = NumberUtils.isFiniteNumber(-Infinity);
      // Log the negative Infinity input result.
      logCase(TAG, 'isFiniteNumber(-Infinity): ' + negInfResult);
      // Expect the negative Infinity input to be rejected as non finite.
      expect(negInfResult).assertFalse();

      // Check an ordinary integer against the finite guard.
      const intResult: boolean = NumberUtils.isFiniteNumber(42);
      // Log the ordinary integer result.
      logCase(TAG, 'isFiniteNumber(42): ' + intResult);
      // Expect the ordinary integer to be accepted as finite.
      expect(intResult).assertTrue();

      // Check an ordinary fraction against the finite guard.
      const fracResult: boolean = NumberUtils.isFiniteNumber(3.14);
      // Log the ordinary fraction result.
      logCase(TAG, 'isFiniteNumber(3.14): ' + fracResult);
      // Expect the ordinary fraction to be accepted as finite.
      expect(fracResult).assertTrue();

      // Check zero against the finite guard.
      const zeroResult: boolean = NumberUtils.isFiniteNumber(0);
      // Log the zero input result.
      logCase(TAG, 'isFiniteNumber(0): ' + zeroResult);
      // Expect zero to be accepted as finite.
      expect(zeroResult).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0200
     * @tc.name      testNumClamp0001
     * @tc.desc      Verify clamp pins values below or above the range to the bounds, keeps in range values and passes NaN through.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumClamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumClamp0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Clamp a value below the range onto the lower bound.
      const lowResult: number = NumberUtils.clamp(-5, 0, 100);
      // Log the lower bound result.
      logCase(TAG, 'clamp(-5, 0, 100): ' + lowResult);
      // Expect the below range value to be pinned onto the lower bound.
      expect(lowResult).assertEqual(0);

      // Clamp a value above the range onto the upper bound.
      const highResult: number = NumberUtils.clamp(150, 0, 100);
      // Log the upper bound result.
      logCase(TAG, 'clamp(150, 0, 100): ' + highResult);
      // Expect the above range value to be pinned onto the upper bound.
      expect(highResult).assertEqual(100);

      // Keep a value that already sits inside the range unchanged.
      const insideResult: number = NumberUtils.clamp(42, 0, 100);
      // Log the inside range result.
      logCase(TAG, 'clamp(42, 0, 100): ' + insideResult);
      // Expect the inside range value to pass through unchanged.
      expect(insideResult).assertEqual(42);

      // A NaN value fails both bound comparisons and is returned unchanged.
      const nanResult: number = NumberUtils.clamp(NaN, 0, 100);
      // Log the NaN passthrough result through its NaN flag.
      logCase(TAG, 'clamp(NaN, 0, 100) isNaN: ' + isNaN(nanResult));
      // Expect the NaN input to stay NaN after clamping.
      expect(isNaN(nanResult)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0300
     * @tc.name      testNumRound0001
     * @tc.desc      Verify round shifts the decimal point, rounds half up and returns the expected digits for several place counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumRound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumRound0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Round a pi based fraction to two decimal places.
      const twoPlaces: number = NumberUtils.round(3.14159, 2);
      // Log the two decimal rounding result.
      logCase(TAG, 'round(3.14159, 2): ' + twoPlaces);
      // Expect the two decimal rounding result to equal 3.14.
      expect(twoPlaces).assertEqual(3.14);
      // Hard float assertion: the two decimal result sits within 1e-9 of 3.14.
      expect(Math.abs(twoPlaces - 3.14) < 1e-9).assertTrue();

      // Round the same fraction to four decimal places.
      const fourPlaces: number = NumberUtils.round(3.14159, 4);
      // Log the four decimal rounding result.
      logCase(TAG, 'round(3.14159, 4): ' + fourPlaces);
      // Expect the four decimal rounding result to equal 3.1416.
      expect(fourPlaces).assertEqual(3.1416);

      // Round a three decimal fraction down to one decimal place.
      const onePlace: number = NumberUtils.round(123.456, 1);
      // Log the one decimal rounding result.
      logCase(TAG, 'round(123.456, 1): ' + onePlace);
      // Expect the one decimal rounding result to equal 123.5.
      expect(onePlace).assertEqual(123.5);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0400
     * @tc.name      testNumFileSize0001
     * @tc.desc      Verify fileSizeText selects the B, KB, MB and GB units at the exact unit boundaries and reports a dash for negative sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFileSize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumFileSize0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Zero bytes stay inside the byte unit.
      const zeroText: string = NumberUtils.fileSizeText(0);
      // Log the zero byte text.
      logCase(TAG, 'fileSizeText(0): ' + zeroText);
      // Expect zero bytes to render with the B unit.
      expect(zeroText).assertEqual('0 B');

      // One byte below the kilo boundary keeps the byte unit.
      const byteText: string = NumberUtils.fileSizeText(1023);
      // Log the byte unit text.
      logCase(TAG, 'fileSizeText(1023): ' + byteText);
      // Expect 1023 bytes to render with the B unit.
      expect(byteText).assertEqual('1023 B');

      // Exactly one kilo switches the text into the KB unit.
      const kbText: string = NumberUtils.fileSizeText(1024);
      // Log the kilobyte unit text.
      logCase(TAG, 'fileSizeText(1024): ' + kbText);
      // Expect 1024 bytes to render as 1 KB.
      expect(kbText).assertEqual('1 KB');

      // Exactly one mega switches the text into the MB unit.
      const mbText: string = NumberUtils.fileSizeText(1048576);
      // Log the megabyte unit text.
      logCase(TAG, 'fileSizeText(1048576): ' + mbText);
      // Expect 1048576 bytes to render as 1 MB.
      expect(mbText).assertEqual('1 MB');

      // Exactly one giga switches the text into the GB unit.
      const gbText: string = NumberUtils.fileSizeText(1073741824);
      // Log the gigabyte unit text.
      logCase(TAG, 'fileSizeText(1073741824): ' + gbText);
      // Expect 1073741824 bytes to render as 1 GB.
      expect(gbText).assertEqual('1 GB');

      // A negative size has no meaningful unit text.
      const negText: string = NumberUtils.fileSizeText(-1);
      // Log the negative size text.
      logCase(TAG, 'fileSizeText(-1): ' + negText);
      // Expect the negative size to fall back to the dash placeholder.
      expect(negText).assertEqual('-');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0500
     * @tc.name      testNumDuration0001
     * @tc.desc      Verify durationMsText rounds sub-millisecond values to one decimal place and appends the ms unit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumDuration0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumDuration0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // A two decimal millisecond value keeps exactly one decimal place.
      const matrixText: string = NumberUtils.durationMsText(123.44);
      // Log the matrix input text.
      logCase(TAG, 'durationMsText(123.44): ' + matrixText);
      // Expect the matrix input to render as 123.4 ms.
      expect(matrixText).assertEqual('123.4 ms');

      // A zero span renders as 0 ms.
      const zeroText: string = NumberUtils.durationMsText(0);
      // Log the zero span text.
      logCase(TAG, 'durationMsText(0): ' + zeroText);
      // Expect the zero span to render as 0 ms.
      expect(zeroText).assertEqual('0 ms');

      // A value rounding up at the decimal boundary becomes the whole value.
      const roundedUpText: string = NumberUtils.durationMsText(59.96);
      // Log the rounded up span text.
      logCase(TAG, 'durationMsText(59.96): ' + roundedUpText);
      // Expect the rounded up span to render as 60 ms.
      expect(roundedUpText).assertEqual('60 ms');

      // A four digit span keeps one decimal place after the integer part.
      const largeText: string = NumberUtils.durationMsText(1234.56);
      // Log the four digit span text.
      logCase(TAG, 'durationMsText(1234.56): ' + largeText);
      // Expect the four digit span to render as 1234.6 ms.
      expect(largeText).assertEqual('1234.6 ms');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0600
     * @tc.name      testNumThousand0001
     * @tc.desc      Verify thousandSeparators groups digits in threes with commas, keeps zero and short values plain and preserves the minus sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumThousand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumThousand0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Seven digits split into three comma separated groups.
      const sevenText: string = NumberUtils.thousandSeparators(1234567);
      // Log the seven digit text.
      logCase(TAG, 'thousandSeparators(1234567): ' + sevenText);
      // Expect the seven digit value to render with two commas.
      expect(sevenText).assertEqual('1,234,567');

      // Zero renders without any separator.
      const zeroText: string = NumberUtils.thousandSeparators(0);
      // Log the zero text.
      logCase(TAG, 'thousandSeparators(0): ' + zeroText);
      // Expect zero to render as the plain digit.
      expect(zeroText).assertEqual('0');

      // A negative value keeps the minus sign in front of the groups.
      const negText: string = NumberUtils.thousandSeparators(-1234);
      // Log the negative text.
      logCase(TAG, 'thousandSeparators(-1234): ' + negText);
      // Expect the negative value to render with the minus sign and one comma.
      expect(negText).assertEqual('-1,234');

      // A three digit value renders without any separator.
      const threeText: string = NumberUtils.thousandSeparators(100);
      // Log the three digit text.
      logCase(TAG, 'thousandSeparators(100): ' + threeText);
      // Expect the three digit value to render as the plain digits.
      expect(threeText).assertEqual('100');

      // A round million keeps every zero padded group.
      const millionText: string = NumberUtils.thousandSeparators(1000000);
      // Log the round million text.
      logCase(TAG, 'thousandSeparators(1000000): ' + millionText);
      // Expect the round million to render as 1,000,000.
      expect(millionText).assertEqual('1,000,000');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0700
     * @tc.name      testNumParseInt0001
     * @tc.desc      Verify parseIntSafe parses a pure integer, falls back for empty or non numeric text and parses the leading digits of a mixed text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumParseInt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumParseInt0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // A pure integer text parses into the integer value.
      const pureResult: number = NumberUtils.parseIntSafe('42', -1);
      // Log the pure integer result.
      logCase(TAG, "parseIntSafe('42', -1): " + pureResult);
      // Expect the pure integer text to parse into 42.
      expect(pureResult).assertEqual(42);

      // An empty text parses to NaN and falls back to the default value.
      const emptyResult: number = NumberUtils.parseIntSafe('', -1);
      // Log the empty text result.
      logCase(TAG, "parseIntSafe('', -1): " + emptyResult);
      // Expect the empty text to fall back to the default value.
      expect(emptyResult).assertEqual(-1);

      // A non numeric text parses to NaN and falls back to the default value.
      const garbageResult: number = NumberUtils.parseIntSafe('abc', -1);
      // Log the non numeric text result.
      logCase(TAG, "parseIntSafe('abc', -1): " + garbageResult);
      // Expect the non numeric text to fall back to the default value.
      expect(garbageResult).assertEqual(-1);

      // A mixed text parses its leading digits per ECMAScript parseInt semantics.
      // Note: parseInt('12x') returns 12 and not NaN, so the fallback is not used for this input.
      const mixedResult: number = NumberUtils.parseIntSafe('12x', -1);
      // Log the mixed text result.
      logCase(TAG, "parseIntSafe('12x', -1): " + mixedResult);
      // Expect the mixed text to parse its leading integer part of 12.
      expect(mixedResult).assertEqual(12);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0800
     * @tc.name      testNumParseFloat0001
     * @tc.desc      Verify parseFloatSafe parses a pure decimal, falls back for empty or non numeric text and parses the leading float of a mixed text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumParseFloat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumParseFloat0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // A pure decimal text parses into the float value.
      const pureResult: number = NumberUtils.parseFloatSafe('3.9', -1);
      // Log the pure decimal result.
      logCase(TAG, "parseFloatSafe('3.9', -1): " + pureResult);
      // Expect the pure decimal text to parse into 3.9.
      expect(pureResult).assertEqual(3.9);

      // A non numeric text parses to NaN and falls back to the default value.
      const garbageResult: number = NumberUtils.parseFloatSafe('abc', -1);
      // Log the non numeric text result.
      logCase(TAG, "parseFloatSafe('abc', -1): " + garbageResult);
      // Expect the non numeric text to fall back to the default value.
      expect(garbageResult).assertEqual(-1);

      // An empty text parses to NaN and falls back to the default value.
      const emptyResult: number = NumberUtils.parseFloatSafe('', -1);
      // Log the empty text result.
      logCase(TAG, "parseFloatSafe('', -1): " + emptyResult);
      // Expect the empty text to fall back to the default value.
      expect(emptyResult).assertEqual(-1);

      // A mixed text parses its leading float part per ECMAScript parseFloat semantics.
      // Note: parseFloat('2.5xyz') returns 2.5 and not NaN, so the fallback is not used for this input.
      const mixedResult: number = NumberUtils.parseFloatSafe('2.5xyz', -1);
      // Log the mixed text result.
      logCase(TAG, "parseFloatSafe('2.5xyz', -1): " + mixedResult);
      // Expect the mixed text to parse its leading float part of 2.5.
      expect(mixedResult).assertEqual(2.5);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_0900
     * @tc.name      testNumAngle0001
     * @tc.desc      Verify the degree to radian to degree round trip lands back on the original angle within a 1e-9 tolerance.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAngle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumAngle0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Round trip 180 degrees through radians and back into degrees.
      const roundTrip: number = NumberUtils.toDegrees(NumberUtils.toRadians(180));
      // Log the round trip result.
      logCase(TAG, 'toDegrees(toRadians(180)): ' + roundTrip);
      // Hard float assertion: the round trip sits within 1e-9 of 180.
      expect(Math.abs(roundTrip - 180) < ANGLE_EPSILON).assertTrue();

      // Convert 90 degrees into radians for the half pi check.
      const rad90: number = NumberUtils.toRadians(90);
      // Log the 90 degree radian value.
      logCase(TAG, 'toRadians(90): ' + rad90);
      // Hard float assertion: 90 degrees lands within 1e-12 of half pi.
      expect(Math.abs(rad90 - Math.PI / 2) < 1e-12).assertTrue();

      // Convert pi radians back into degrees.
      const degFromPi: number = NumberUtils.toDegrees(Math.PI);
      // Log the pi radian degree value.
      logCase(TAG, 'toDegrees(PI): ' + degFromPi);
      // Hard float assertion: pi radians lands within 1e-12 of 180 degrees.
      expect(Math.abs(degFromPi - 180) < 1e-12).assertTrue();

      // Convert zero degrees into radians.
      const rad0: number = NumberUtils.toRadians(0);
      // Log the zero degree radian value.
      logCase(TAG, 'toRadians(0): ' + rad0);
      // Expect the zero conversion to stay exactly zero.
      expect(rad0).assertEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_1000
     * @tc.name      testNumPercent0001
     * @tc.desc      Verify percentText scales the ratio by one hundred, honours the decimal places and appends the percent sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumPercent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumPercent0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // The matrix ratio renders with two decimal places.
      const matrixText: string = NumberUtils.percentText(0.1234, 2);
      // Log the matrix ratio text.
      logCase(TAG, 'percentText(0.1234, 2): ' + matrixText);
      // Expect the matrix ratio to render as 12.34%.
      expect(matrixText).assertEqual('12.34%');

      // A zero ratio renders without any fraction digits.
      const zeroText: string = NumberUtils.percentText(0, 2);
      // Log the zero ratio text.
      logCase(TAG, 'percentText(0, 2): ' + zeroText);
      // Expect the zero ratio to render as 0%.
      expect(zeroText).assertEqual('0%');

      // A full ratio renders as one hundred percent.
      const fullText: string = NumberUtils.percentText(1, 2);
      // Log the full ratio text.
      logCase(TAG, 'percentText(1, 2): ' + fullText);
      // Expect the full ratio to render as 100%.
      expect(fullText).assertEqual('100%');

      // A half ratio without decimal places renders as 50%.
      const halfText: string = NumberUtils.percentText(0.5, 0);
      // Log the half ratio text.
      logCase(TAG, 'percentText(0.5, 0): ' + halfText);
      // Expect the half ratio to render as 50%.
      expect(halfText).assertEqual('50%');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_NUM_1100
     * @tc.name      testNumRandom0001
     * @tc.desc      Verify randomInt returns integral samples inside the inclusive range over 50 draws and hits both boundary values over a longer sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumRandom0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNumRandom0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Track whether every range loop sample stays inside the inclusive bounds.
      let allInRange: boolean = true;
      // Track whether every range loop sample is an integral value.
      let allIntegral: boolean = true;
      // Run the 50 draw range loop required by the case matrix.
      for (let i: number = 0; i < RANDOM_RANGE_ROUNDS; i++) {
        // Draw one random sample from the inclusive range.
        const sample: number = NumberUtils.randomInt(RANDOM_MIN, RANDOM_MAX);
        // Fold the lower and upper range check into the tracked flag.
        allInRange = allInRange && sample >= RANDOM_MIN && sample <= RANDOM_MAX;
        // Fold the integrality check into the tracked flag.
        allIntegral = allIntegral && Math.floor(sample) === sample;
      }
      // Log the range loop outcome.
      logCase(TAG, 'range loop in range: ' + allInRange + ', integral: ' + allIntegral);
      // Expect every one of the 50 samples to stay inside [3, 9].
      expect(allInRange).assertTrue();
      // Expect every one of the 50 samples to be an integral value.
      expect(allIntegral).assertTrue();

      // Track the smallest observed value, seeded from the upper bound.
      let seenMin: number = RANDOM_MAX;
      // Track the largest observed value, seeded from the lower bound.
      let seenMax: number = RANDOM_MIN;
      // Run a longer boundary sweep so both endpoints are observed with overwhelming probability.
      for (let i: number = 0; i < RANDOM_BOUND_ROUNDS; i++) {
        // Draw one random sample for the boundary sweep.
        const sample: number = NumberUtils.randomInt(RANDOM_MIN, RANDOM_MAX);
        // Update the smallest observed value when the sample dips below it.
        if (sample < seenMin) {
          // Store the new smallest observed value.
          seenMin = sample;
        }
        // Update the largest observed value when the sample rises above it.
        if (sample > seenMax) {
          // Store the new largest observed value.
          seenMax = sample;
        }
      }
      // Log the observed boundary window.
      logCase(TAG, 'boundary sweep seen min: ' + seenMin + ', seen max: ' + seenMax);
      // Expect the inclusive lower boundary to be hit by the sweep.
      expect(seenMin).assertEqual(RANDOM_MIN);
      // Expect the inclusive upper boundary to be hit by the sweep.
      expect(seenMax).assertEqual(RANDOM_MAX);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { numberUtilsTest };
