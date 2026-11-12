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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ObjectUtils, RandomUtils } from 'photopickersendable';

/**
 * Local mirror of the metadata record consumed by ObjectUtils.
 * The HAR does not re-export the original interface, so the cases rely on the
 * identical structural shape.
 */
interface MetadataPair {
  key: string;
  value: string;
}

/** Letter pool expected by the random string helper, digits and symbols excluded. */
const LETTER_POOL: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
/** Digit pool expected by the random digits helper. */
const DIGIT_POOL: string = '0123456789';
/** Lowercase hexadecimal pool expected by the random color helper. */
const HEX_POOL: string = '0123456789abcdef';
/** Placeholder rendered by toStringSafe for missing values. */
const UNKNOWN_TEXT: string = '[unknown]';

/**
 * Builds one metadata pair with explicit typing.
 * @param pairKey Key text of the pair.
 * @param pairValue Value text of the pair.
 * @returns The typed pair.
 */
function makePair(pairKey: string, pairValue: string): MetadataPair {
  const pair: MetadataPair = { key: pairKey, value: pairValue };
  return pair;
}

/**
 * Registers the unit cases of ObjectUtils and RandomUtils.
 */
export default function objectRandomUtilsTest() {
  describe('ObjectRandomUtilsTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0100
     * @tc.name      testObjRandom0001
     * @tc.desc      Verify isNullish flags only missing values and toStringSafe
     *               renders numbers and booleans while degrading missing input
     *               to the unknown placeholder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjRandom0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Undefined is nullish.
      expect(ObjectUtils.isNullish(undefined)).assertTrue();
      // Explicit null is nullish.
      expect(ObjectUtils.isNullish(null)).assertTrue();
      // An empty string still carries a value.
      expect(ObjectUtils.isNullish('')).assertFalse();
      // A non empty string is not nullish.
      expect(ObjectUtils.isNullish('text')).assertFalse();
      // Missing values render as the unknown placeholder.
      expect(ObjectUtils.toStringSafe(undefined)).assertEqual(UNKNOWN_TEXT);
      // Explicit null renders as the same placeholder.
      expect(ObjectUtils.toStringSafe(null)).assertEqual(UNKNOWN_TEXT);
      // Strings are handed back unchanged.
      expect(ObjectUtils.toStringSafe('kept')).assertEqual('kept');
      // Whole numbers render through the decimal form.
      expect(ObjectUtils.toStringSafe(42)).assertEqual('42');
      // Negative fractions keep the sign and the fraction.
      expect(ObjectUtils.toStringSafe(-3.5)).assertEqual('-3.5');
      // Booleans render through the lowercase literal.
      expect(ObjectUtils.toStringSafe(true)).assertEqual('true');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0200
     * @tc.name      testObjRandom0002
     * @tc.desc      Verify keys, size and isEmptyObject degrade missing records to
     *               empty results, treat an empty list as empty and expose the
     *               ordered keys of a populated record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjRandom0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A missing record has no key at all.
      expect(ObjectUtils.keys(undefined).length).assertEqual(0);
      // An explicit null record has no key either.
      expect(ObjectUtils.keys(null).length).assertEqual(0);
      // A missing record carries no entry.
      expect(ObjectUtils.size(null)).assertEqual(0);
      // A missing record counts as empty.
      expect(ObjectUtils.isEmptyObject(undefined)).assertTrue();
      // A defined record without entries counts as empty.
      expect(ObjectUtils.isEmptyObject([])).assertTrue();
      // Build a two entry record with a stable order.
      const record: MetadataPair[] = [makePair('album', 'camera'), makePair('count', '3')];
      // The first key follows the record order.
      expect(ObjectUtils.keys(record)[0]).assertEqual('album');
      // The second key follows the record order.
      expect(ObjectUtils.keys(record)[1]).assertEqual('count');
      // The populated record holds exactly two entries.
      expect(ObjectUtils.size(record)).assertEqual(2);
      // The populated record is not empty.
      expect(ObjectUtils.isEmptyObject(record)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0300
     * @tc.name      testObjRandom0003
     * @tc.desc      Verify hasKey reports both present keys with different letter
     *               cases, misses unknown keys, treats the lookup as case
     *               sensitive and degrades missing records to false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjRandom0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Build a record whose two keys differ only by letter case.
      const record: MetadataPair[] = [makePair('key', 'v1'), makePair('Key', 'v2')];
      // The lowercase key is present.
      expect(ObjectUtils.hasKey(record, 'key')).assertTrue();
      // The capitalized key is present as well.
      expect(ObjectUtils.hasKey(record, 'Key')).assertTrue();
      // An unknown key is missed.
      expect(ObjectUtils.hasKey(record, 'missing')).assertFalse();
      // The lookup is case sensitive, so the all upper key is missed.
      expect(ObjectUtils.hasKey(record, 'KEY')).assertFalse();
      // A missing record has no key.
      expect(ObjectUtils.hasKey(null, 'key')).assertFalse();
      // An undefined record has no key either.
      expect(ObjectUtils.hasKey(undefined, 'key')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0400
     * @tc.name      testObjRandom0004
     * @tc.desc      Verify jsonEquals compares ordered key value pairs, rejects a
     *               swapped order, a changed value and a shorter record, and
     *               treats two missing records as equal empty ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjRandom0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Build two records with the same pairs in the same order.
      const left: MetadataPair[] = [makePair('a', '1'), makePair('b', '2')];
      const right: MetadataPair[] = [makePair('a', '1'), makePair('b', '2')];
      // Identical ordered pairs are equal.
      expect(ObjectUtils.jsonEquals(left, right)).assertTrue();
      // Build a record with the same pairs in swapped order.
      const swapped: MetadataPair[] = [makePair('b', '2'), makePair('a', '1')];
      // The comparison is order sensitive.
      expect(ObjectUtils.jsonEquals(left, swapped)).assertFalse();
      // Build a record with one changed value.
      const changedValue: MetadataPair[] = [makePair('a', '1'), makePair('b', '9')];
      // A single value difference breaks the equality.
      expect(ObjectUtils.jsonEquals(left, changedValue)).assertFalse();
      // Build a record with only the first entry.
      const shorter: MetadataPair[] = [makePair('a', '1')];
      // A length difference breaks the equality.
      expect(ObjectUtils.jsonEquals(left, shorter)).assertFalse();
      // Two missing records resolve to empty lists and compare equal.
      expect(ObjectUtils.jsonEquals(null, undefined)).assertTrue();
      // Two empty lists compare equal as well.
      expect(ObjectUtils.jsonEquals([], [])).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0500
     * @tc.name      testObjRandom0005
     * @tc.desc      Verify defaultIfNullish keeps defined values including the
     *               empty string, replaces missing values with the fallback and
     *               accepts an empty fallback, plus the zero rendering of
     *               toStringSafe.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjRandom0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A defined value always wins over the fallback.
      expect(ObjectUtils.defaultIfNullish('given', 'fallback')).assertEqual('given');
      // Undefined is replaced by the fallback.
      expect(ObjectUtils.defaultIfNullish(undefined, 'fallback')).assertEqual('fallback');
      // Null is replaced by the fallback as well.
      expect(ObjectUtils.defaultIfNullish(null, 'fallback')).assertEqual('fallback');
      // The empty string is a defined value and is kept as is.
      expect(ObjectUtils.defaultIfNullish('', 'fallback')).assertEqual('');
      // An empty fallback is applied literally for missing input.
      expect(ObjectUtils.defaultIfNullish(undefined, '')).assertEqual('');
      // The number zero renders as a single digit and not as a placeholder.
      expect(ObjectUtils.toStringSafe(0)).assertEqual('0');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0600
     * @tc.name      testObjRandom0006
     * @tc.desc      Verify renderPairs joins ordered pairs as 'key: value' text
     *               separated by commas, renders an empty value as an empty tail
     *               and degrades missing or empty records to an empty line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjRandom0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A missing record renders as an empty line.
      expect(ObjectUtils.renderPairs(null)).assertEqual('');
      // An undefined record renders as an empty line too.
      expect(ObjectUtils.renderPairs(undefined)).assertEqual('');
      // A record without entries renders as an empty line.
      expect(ObjectUtils.renderPairs([])).assertEqual('');
      // Build a two entry record and check the joined line.
      const two: MetadataPair[] = [makePair('album', 'camera'), makePair('count', '3')];
      // The pairs are joined in order with the fixed separator.
      expect(ObjectUtils.renderPairs(two)).assertEqual('album: camera, count: 3');
      // Build a one entry record with an empty value.
      const one: MetadataPair[] = [makePair('flag', '')];
      // The empty value keeps the key prefix and ends the line there.
      expect(ObjectUtils.renderPairs(one)).assertEqual('flag: ');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0700
     * @tc.name      testObjRandom0007
     * @tc.desc      Verify randomInt returns whole numbers inside the inclusive
     *               range for a negative lower bound, resolves a degenerate
     *               range to its single value and normalizes a swapped pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjRandom0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Sample the inclusive range across the lower and upper bounds.
      for (let index: number = 0; index < 60; index++) {
        // Read one sample of the negative to positive range.
        const value: number = RandomUtils.randomInt(-3, 7);
        // Every sample is a whole number inside the inclusive bounds.
        expect(value >= -3 && value <= 7 && Number.isInteger(value)).assertTrue();
      }
      // A degenerate range has only one possible answer.
      expect(RandomUtils.randomInt(5, 5)).assertEqual(5);
      // A swapped pair still produces values of the normalized range.
      for (let index: number = 0; index < 30; index++) {
        // Read one sample with the bounds given in reverse order.
        const value: number = RandomUtils.randomInt(9, 4);
        // Every sample stays inside the four to nine window.
        expect(value >= 4 && value <= 9 && Number.isInteger(value)).assertTrue();
      }
      // A single point range resolves to that point.
      expect(RandomUtils.randomInt(0, 0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0800
     * @tc.name      testObjRandom0008
     * @tc.desc      Verify randomInt on a two value range only produces the two
     *               endpoints and reaches both of them across repeated samples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjRandom0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Track whether the lower endpoint was sampled.
      let seenZero: boolean = false;
      // Track whether the upper endpoint was sampled.
      let seenOne: boolean = false;
      // Sample the two value range often enough to hit both sides.
      for (let index: number = 0; index < 40; index++) {
        // Read one sample of the zero to one range.
        const value: number = RandomUtils.randomInt(0, 1);
        // Only the two endpoints are allowed, nothing between or outside.
        expect(value === 0 || value === 1).assertTrue();
        // Record the lower endpoint.
        if (value === 0) {
          seenZero = true;
        }
        // Record the upper endpoint.
        if (value === 1) {
          seenOne = true;
        }
      }
      // The lower endpoint was reached at least once.
      expect(seenZero).assertTrue();
      // The upper endpoint was reached at least once as well.
      expect(seenOne).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_0900
     * @tc.name      testObjRandom0009
     * @tc.desc      Verify randomString produces the requested length using only
     *               letter pool characters, keeps single character output short
     *               and degrades non positive lengths to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjRandom0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Generate a long random string.
      const value: string = RandomUtils.randomString(24);
      // The output carries exactly the requested characters.
      expect(value.length).assertEqual(24);
      // Every character belongs to the letter pool, digits and symbols excluded.
      for (let index: number = 0; index < value.length; index++) {
        // Read the current character.
        const character: string = value.charAt(index);
        // The character must be one of the fifty two letters.
        expect(LETTER_POOL.indexOf(character) >= 0).assertTrue();
      }
      // A single character request produces one character.
      expect(RandomUtils.randomString(1).length).assertEqual(1);
      // A zero length request produces the empty string.
      expect(RandomUtils.randomString(0)).assertEqual('');
      // A negative length request produces the empty string as well.
      expect(RandomUtils.randomString(-3)).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_1000
     * @tc.name      testObjRandom0010
     * @tc.desc      Verify randomDigits produces a digit only string and degrades
     *               a non positive length, and that randomHexColor returns a
     *               seven character lowercase hex color with the leading hash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjRandom0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Generate a twelve digit random string.
      const digits: string = RandomUtils.randomDigits(12);
      // The output carries exactly twelve digits.
      expect(digits.length).assertEqual(12);
      // Every character is a decimal digit.
      for (let index: number = 0; index < digits.length; index++) {
        // Read the current character.
        const character: string = digits.charAt(index);
        // The character must sit inside the digit pool.
        expect(DIGIT_POOL.indexOf(character) >= 0).assertTrue();
      }
      // A non positive length yields the empty string.
      expect(RandomUtils.randomDigits(0)).assertEqual('');
      // Generate a random hex color.
      const color: string = RandomUtils.randomHexColor();
      // The color text is exactly seven characters long.
      expect(color.length).assertEqual(7);
      // The color text starts with the required hash.
      expect(color.charAt(0)).assertEqual('#');
      // The remaining six characters are lowercase hexadecimal digits.
      for (let index: number = 1; index < color.length; index++) {
        // Read the current character.
        const character: string = color.charAt(index);
        // The character must sit inside the lowercase hex pool.
        expect(HEX_POOL.indexOf(character) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_1100
     * @tc.name      testObjRandom0011
     * @tc.desc      Verify randomBoolean produces both truth values across a
     *             sample run, that randomItem only returns pool elements and
     *               reaches every pool element, and that an empty pool degrades
     *             to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjRandom0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Count the sampled true values.
      let trueCount: number = 0;
      // Count the sampled false values.
      let falseCount: number = 0;
      // Sample the boolean helper fifty times.
      for (let index: number = 0; index < 50; index++) {
        // Read one boolean sample.
        const value: boolean = RandomUtils.randomBoolean();
        // Accumulate the truth counts.
        if (value) {
          trueCount = trueCount + 1;
        } else {
          falseCount = falseCount + 1;
        }
      }
      // Every sample was counted exactly once.
      expect(trueCount + falseCount).assertEqual(50);
      // The true side was reached, so the helper is not constant false.
      expect(trueCount > 0).assertTrue();
      // The false side was reached, so the helper is not constant true.
      expect(falseCount > 0).assertTrue();
      // Build a three element pool for the item helper.
      const pool: string[] = ['alpha', 'beta', 'gamma'];
      // Track which pool elements were sampled.
      let seenAlpha: boolean = false;
      let seenBeta: boolean = false;
      let seenGamma: boolean = false;
      // Sample the pool often enough to reach every element.
      for (let index: number = 0; index < 40; index++) {
        // Read one sampled element.
        const item: string = RandomUtils.randomItem(pool);
        // Record which element was returned.
        if (item === 'alpha') {
          seenAlpha = true;
        } else if (item === 'beta') {
          seenBeta = true;
        } else if (item === 'gamma') {
          seenGamma = true;
        } else {
          // Any element outside the pool fails the case immediately.
          expect(false).assertTrue();
        }
      }
      // All three pool elements were reached.
      expect(seenAlpha && seenBeta && seenGamma).assertTrue();
      // An empty pool degrades to the empty string.
      expect(RandomUtils.randomItem([])).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_1200
     * @tc.name      testObjRandom0012
     * @tc.desc      Verify shuffleCopy returns a new array holding the same
     *               elements, leaves the source array untouched and handles the
     *               empty and single element inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjRandom0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Build a five element source in a stable order.
      const input: string[] = ['a', 'b', 'c', 'd', 'e'];
      // Shuffle a copy of the source.
      const result: string[] = RandomUtils.shuffleCopy(input);
      // The result holds the same number of elements.
      expect(result.length).assertEqual(5);
      // The result is a new array and not the source reference.
      expect(result !== input).assertTrue();
      // The source kept its original order in the first position.
      expect(input[0]).assertEqual('a');
      // The source kept its original order in the last position.
      expect(input[4]).assertEqual('e');
      // Sort a copy of the result to restore the canonical order.
      const sorted: string[] = result.slice(0);
      sorted.sort();
      // Every position of the sorted result matches the sorted source content.
      for (let index: number = 0; index < input.length; index++) {
        // Compare the sorted result with the expected letter.
        expect(sorted[index]).assertEqual(input[index]);
      }
      // An empty input produces an empty copy.
      expect(RandomUtils.shuffleCopy([]).length).assertEqual(0);
      // A single element input produces a single element copy with the value kept.
      const single: string[] = RandomUtils.shuffleCopy(['x']);
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual('x');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJRANDOM_1300
     * @tc.name      testObjRandom0013
     * @tc.desc      Verify uuid returns the dashed thirty six character form with
     *               hyphens at the standard positions, only hexadecimal content
     *               elsewhere and a different value on every call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjRandom0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Generate the first identifier.
      const first: string = RandomUtils.uuid();
      // Generate a second identifier for the difference check.
      const second: string = RandomUtils.uuid();
      // The dashed form carries thirty six characters.
      expect(first.length).assertEqual(36);
      // The first hyphen sits at the standard position.
      expect(first.charAt(8)).assertEqual('-');
      // The second hyphen sits at the standard position.
      expect(first.charAt(13)).assertEqual('-');
      // The third hyphen sits at the standard position.
      expect(first.charAt(18)).assertEqual('-');
      // The fourth hyphen sits at the standard position.
      expect(first.charAt(23)).assertEqual('-');
      // Every remaining character is a hexadecimal digit in either case.
      for (let index: number = 0; index < first.length; index++) {
        // Read the current character.
        const character: string = first.charAt(index);
        // Skip the four separator positions.
        if (character === '-') {
          continue;
        }
        // The character must be a hexadecimal digit, case insensitive.
        expect(HEX_POOL.indexOf(character.toLowerCase()) >= 0).assertTrue();
      }
      // Two successive calls return different identifiers.
      expect(first !== second).assertTrue();
    });
  });
}
