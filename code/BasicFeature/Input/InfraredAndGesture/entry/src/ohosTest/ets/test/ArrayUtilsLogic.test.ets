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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ArrayUtils } from 'common';
import { NumericVectorFactory } from './helper/NumericVectorFactory';

/**
 * ArrayUtils logic suite.
 *
 * Scope: isEmpty / isNotEmpty / firstOrDefault / lastOrDefault / contains /
 * sum / average / minOrNull / maxOrNull / chunk / unique / removeElement.
 *
 * Inputs are produced by helper/NumericVectorFactory, so no long array literal
 * is hand written. Expected aggregate values come from the closed-form formulas
 * of the same helper (arithmeticSum / constantSum / powersSum / triangularSum /
 * matrixRowSum / matrixColumnSum / matrixTotalSum / countInRange / maxOf /
 * minOf / distinctCount); the suite never re-runs the production loop, which
 * keeps the oracle independent from the implementation under test.
 *
 * Exact integer aggregates use assertEqual. Averages that may carry a binary
 * representation error use assertClose with a fixed tolerance, so every case
 * stays repeatable and independent of time and randomness.
 *
 * Branches that are not covered on purpose:
 *   - The AppLogger.warn branches of average / minOrNull / maxOrNull / chunk
 *     only write a log line, so they are covered indirectly by asserting the
 *     documented fallback value and that no exception escapes.
 *   - unique de-duplicates object elements by reference; this suite proves the
 *     value semantics with numeric vectors, the reference semantics follow
 *     from the same Set implementation.
 */

/** Hilog domain reserved for the ArrayUtils logic tests. */
const DOMAIN: number = 0xF822;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_ArrayUtils_';

/** Integer fallback returned by firstOrDefault when the array is empty. */
const DEFAULT_INT: number = -1;
/** Second integer fallback used to prove the caller value is echoed. */
const DEFAULT_OTHER: number = 12345;
/** String fallback returned by the string specialisations. */
const DEFAULT_TEXT: string = 'meeting-room-a';
/** Second string fallback used to prove the caller value is echoed. */
const DEFAULT_TEXT_OTHER: string = 'meeting-room-b';
/** Marker value the vector factory never generates. */
const ABSENT_VALUE: number = 999999;

/** Absolute tolerance for exactly representable binary fractions. */
const BINARY_DELTA: number = 1e-12;
/** Absolute tolerance for decimal fractions that are not binary exact. */
const DECIMAL_DELTA: number = 1e-9;

/** Small chunk size used by the remainder checks. */
const CHUNK_SIZE_THREE: number = 3;
/** Chunk size that exactly divides the twelve element vectors. */
const CHUNK_SIZE_FOUR: number = 4;
/** Cardinality of the twelve element vectors used all over the suite. */
const TWELVE: number = 12;
/** Cardinality of the ten element vectors. */
const TEN: number = 10;
/** Cardinality of the eight element vectors. */
const EIGHT: number = 8;
/** Cardinality of the six element vectors. */
const SIX: number = 6;
/** Cardinality of the five element vectors. */
const FIVE: number = 5;
/** Cardinality of the four element vectors. */
const FOUR: number = 4;
/** Cardinality of the three element vectors. */
const THREE: number = 3;
/** Cardinality of the two element vectors. */
const TWO: number = 2;
/** Injective multiplier used to build vectors with distinct values. */
const UNIQUE_FACTOR: number = 7;
/** Injective multiplier used to build the mirrored distinct vector. */
const UNIQUE_FACTOR_B: number = 11;
/** Repeat count used by the repeatEach based duplicate vectors. */
const REPEAT_TIMES: number = 3;
/** Base of the power vectors. */
const POWER_BASE: number = 2;
/** Base of the second power vector. */
const POWER_BASE_THREE: number = 3;
/** Amplitude of the zigzag vectors. */
const ZIGZAG_AMPLITUDE: number = 5;
/** Alternating value pair, low half. */
const ALTERNATE_LOW: number = 1;
/** Alternating value pair, high half. */
const ALTERNATE_HIGH: number = 10;
/** Constant value used by the constant vectors. */
const CONSTANT_VALUE: number = 7;
/** Negative constant value used by the negative constant vectors. */
const NEGATIVE_CONSTANT: number = -4;
/** Seed of the first matrix vector. */
const MATRIX_SEED: number = 1;
/** Seed of the second matrix vector. */
const MATRIX_SEED_LOW: number = -5;
/** Row count of the matrices. */
const MATRIX_ROWS: number = 3;
/** Column count of the matrices. */
const MATRIX_COLS: number = 4;
/** Row count of the matrix that exactly fills four chunks of three. */
const WIDE_MATRIX_ROWS: number = 2;
/** Column count of the wide matrix, so the flattened length is a multiple of three. */
const WIDE_MATRIX_COLS: number = 6;
/** Inclusive lower bound of the range counting probes. */
const RANGE_LOW: number = 0;
/** Inclusive upper bound of the range counting probes. */
const RANGE_HIGH: number = 10;

/**
 * Builds the twelve element ascending vector used as the primary fixture.
 * The closed-form sum is obtained through arithmeticSum, never by summing here.
 */
function ascendingTwelve(): number[] {
  return NumericVectorFactory.ascending(TWELVE, 1, 1);
}

/**
 * Builds the twelve element descending vector, its reverse.
 */
function descendingTwelve(): number[] {
  return NumericVectorFactory.descending(TWELVE, TWELVE, 1);
}

/**
 * Builds a duplicate free vector whose length is the given count and whose
 * values are count, 2*count, ... so that every element is distinct and the
 * insertion order is observable.
 */
function distinctVector(count: number): number[] {
  return NumericVectorFactory.ascending(count, 1, 1);
}

/**
 * Builds a vector whose values repeat exactly twice: each element appears in
 * the original block and again in the mirrored block.
 */
function doubledVector(values: number[]): number[] {
  return NumericVectorFactory.interleave(values, values);
}

/**
 * Counts how many elements a flattened chunk matrix holds. Used to prove chunk
 * neither drops nor duplicates elements.
 */
function totalChunkElements(matrix: number[][]): number {
  let total: number = 0;
  for (const row of matrix) {
    total += row.length;
  }
  return total;
}

/**
 * Returns true when the given chunk matrix has no empty chunk, which is what a
 * positive or fallback chunk size must guarantee.
 */
function hasNoEmptyChunk(matrix: number[][]): boolean {
  for (const row of matrix) {
    if (row.length === 0) {
      return false;
    }
  }
  return true;
}

/**
 * Returns the length of the last chunk of a non empty chunk matrix.
 */
function lastChunkLength(matrix: number[][]): number {
  if (matrix.length === 0) {
    return 0;
  }
  return matrix[matrix.length - 1].length;
}

export default function arrayUtilsLogicTest() {
  describe('ArrayUtilsLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0100
     * @tc.name      testArrayUtils0001
     * @tc.desc      Verify isEmpty reports null, undefined and empty arrays as empty and non empty vectors as filled.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.isEmpty<number>(null)).assertTrue();
      expect(ArrayUtils.isEmpty<number>(undefined)).assertTrue();
      expect(ArrayUtils.isEmpty<number>([])).assertTrue();
      // A single element is already a non empty array.
      expect(ArrayUtils.isEmpty<number>([0])).assertFalse();
      expect(ArrayUtils.isEmpty<number>(ascendingTwelve())).assertFalse();
      // A vector holding only falsy values is still a filled array.
      expect(ArrayUtils.isEmpty<number>(NumericVectorFactory.constant(THREE, 0))).assertFalse();
      expect(ArrayUtils.isEmpty<string>([''])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0101
     * @tc.name      testArrayUtils0002
     * @tc.desc      Verify isNotEmpty is the exact inverse of isEmpty for every fixture shape.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.isNotEmpty<number>(null)).assertFalse();
      expect(ArrayUtils.isNotEmpty<number>(undefined)).assertFalse();
      expect(ArrayUtils.isNotEmpty<number>([])).assertFalse();
      expect(ArrayUtils.isNotEmpty<number>([0])).assertTrue();
      expect(ArrayUtils.isNotEmpty<number>(ascendingTwelve())).assertTrue();
      // The two probes must disagree on every input.
      expect(ArrayUtils.isEmpty<number>(null) !== ArrayUtils.isNotEmpty<number>(null)).assertTrue();
      expect(ArrayUtils.isEmpty<number>([]) !== ArrayUtils.isNotEmpty<number>([])).assertTrue();
      expect(ArrayUtils.isEmpty<number>(ascendingTwelve())
        !== ArrayUtils.isNotEmpty<number>(ascendingTwelve())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0102
     * @tc.name      testArrayUtils0003
     * @tc.desc      Verify isEmpty and isNotEmpty stay inverse across every generated vector family.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const families: number[][] = [
        ascendingTwelve(),
        descendingTwelve(),
        NumericVectorFactory.constant(FIVE, CONSTANT_VALUE),
        NumericVectorFactory.alternating(SIX, ALTERNATE_LOW, ALTERNATE_HIGH),
        NumericVectorFactory.multiples(FIVE, 3),
        NumericVectorFactory.powers(POWER_BASE, SIX),
        NumericVectorFactory.primes(FIVE),
        NumericVectorFactory.fibonacci(EIGHT),
        NumericVectorFactory.triangular(FOUR),
        NumericVectorFactory.zigzag(FIVE, ZIGZAG_AMPLITUDE)
      ];
      for (const family of families) {
        expect(family.length).assertLarger(0);
        expect(ArrayUtils.isEmpty<number>(family)).assertFalse();
        expect(ArrayUtils.isNotEmpty<number>(family)).assertTrue();
      }
      // Ten families, all non empty, so ten positive probes were made.
      expect(families.length).assertEqual(TEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0103
     * @tc.name      testArrayUtils0004
     * @tc.desc      Verify firstOrDefault returns the leading element of every non empty vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // ascending(12, 1, 1) starts at 1, descending(12, 12, 1) starts at 12.
      expect(ArrayUtils.firstOrDefault<number>(ascendingTwelve(), DEFAULT_INT)).assertEqual(1);
      expect(ArrayUtils.firstOrDefault<number>(descendingTwelve(), DEFAULT_INT)).assertEqual(TWELVE);
      // constant(5, 7) repeats 7, multiples(5, 3) starts at 0.
      expect(ArrayUtils.firstOrDefault<number>(NumericVectorFactory.constant(FIVE, CONSTANT_VALUE), DEFAULT_INT))
        .assertEqual(CONSTANT_VALUE);
      expect(ArrayUtils.firstOrDefault<number>(NumericVectorFactory.multiples(FIVE, 3), DEFAULT_INT)).assertEqual(0);
      // powers(2, 6) starts at 1, primes(5) starts at 2.
      expect(ArrayUtils.firstOrDefault<number>(NumericVectorFactory.powers(POWER_BASE, SIX), DEFAULT_INT))
        .assertEqual(1);
      expect(ArrayUtils.firstOrDefault<number>(NumericVectorFactory.primes(FIVE), DEFAULT_INT)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0104
     * @tc.name      testArrayUtils0005
     * @tc.desc      Verify firstOrDefault returns the fallback for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.firstOrDefault<number>(null, DEFAULT_INT)).assertEqual(DEFAULT_INT);
      expect(ArrayUtils.firstOrDefault<number>(undefined, DEFAULT_INT)).assertEqual(DEFAULT_INT);
      expect(ArrayUtils.firstOrDefault<number>([], DEFAULT_INT)).assertEqual(DEFAULT_INT);
      // The caller supplied fallback is echoed verbatim, not normalized.
      expect(ArrayUtils.firstOrDefault<number>([], DEFAULT_OTHER)).assertEqual(DEFAULT_OTHER);
      expect(ArrayUtils.firstOrDefault<number>(null, DEFAULT_OTHER)).assertEqual(DEFAULT_OTHER);
      expect(ArrayUtils.firstOrDefault<number>(undefined, DEFAULT_OTHER)).assertEqual(DEFAULT_OTHER);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0105
     * @tc.name      testArrayUtils0006
     * @tc.desc      Verify lastOrDefault returns the trailing element of every non empty vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // ascending(12, 1, 1) ends at 12, descending(12, 12, 1) ends at 1.
      expect(ArrayUtils.lastOrDefault<number>(ascendingTwelve(), DEFAULT_INT)).assertEqual(TWELVE);
      expect(ArrayUtils.lastOrDefault<number>(descendingTwelve(), DEFAULT_INT)).assertEqual(1);
      // triangular(4) is 1, 3, 6, 10 so the last element is ten.
      expect(ArrayUtils.lastOrDefault<number>(NumericVectorFactory.triangular(FOUR), DEFAULT_INT)).assertEqual(TEN);
      // fibonacci(8) is 0, 1, 1, 2, 3, 5, 8, 13 so the last element is thirteen.
      expect(ArrayUtils.lastOrDefault<number>(NumericVectorFactory.fibonacci(EIGHT), DEFAULT_INT)).assertEqual(13);
      // powers(2, 6) ends at 2^5 = 32.
      expect(ArrayUtils.lastOrDefault<number>(NumericVectorFactory.powers(POWER_BASE, SIX), DEFAULT_INT))
        .assertEqual(32);
      // zigzag(5, 5) ends on the positive amplitude because the count is odd.
      expect(ArrayUtils.lastOrDefault<number>(NumericVectorFactory.zigzag(FIVE, ZIGZAG_AMPLITUDE), DEFAULT_INT))
        .assertEqual(ZIGZAG_AMPLITUDE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0106
     * @tc.name      testArrayUtils0007
     * @tc.desc      Verify lastOrDefault returns the fallback for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.lastOrDefault<number>(null, DEFAULT_INT)).assertEqual(DEFAULT_INT);
      expect(ArrayUtils.lastOrDefault<number>(undefined, DEFAULT_INT)).assertEqual(DEFAULT_INT);
      expect(ArrayUtils.lastOrDefault<number>([], DEFAULT_INT)).assertEqual(DEFAULT_INT);
      expect(ArrayUtils.lastOrDefault<number>([], DEFAULT_OTHER)).assertEqual(DEFAULT_OTHER);
      expect(ArrayUtils.lastOrDefault<number>(null, DEFAULT_OTHER)).assertEqual(DEFAULT_OTHER);
      // On a single element array the first and the last element coincide.
      const single: number[] = [42];
      expect(ArrayUtils.firstOrDefault<number>(single, DEFAULT_INT)).assertEqual(42);
      expect(ArrayUtils.lastOrDefault<number>(single, DEFAULT_INT)).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0107
     * @tc.name      testArrayUtils0008
     * @tc.desc      Verify firstOrDefault and lastOrDefault agree on single element and symmetric vectors.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // A constant vector has the same head and tail.
      const constant: number[] = NumericVectorFactory.constant(EIGHT, CONSTANT_VALUE);
      expect(ArrayUtils.firstOrDefault<number>(constant, DEFAULT_INT)).assertEqual(CONSTANT_VALUE);
      expect(ArrayUtils.lastOrDefault<number>(constant, DEFAULT_INT)).assertEqual(CONSTANT_VALUE);
      // A one element vector has the same head and tail.
      const single: number[] = NumericVectorFactory.ascending(1, 5, 1);
      expect(single.length).assertEqual(1);
      expect(ArrayUtils.firstOrDefault<number>(single, DEFAULT_INT))
        .assertEqual(ArrayUtils.lastOrDefault<number>(single, DEFAULT_INT));
      // A strictly increasing vector has a smaller head than tail.
      const ascending: number[] = ascendingTwelve();
      expect(ArrayUtils.firstOrDefault<number>(ascending, DEFAULT_INT))
        .assertLess(ArrayUtils.lastOrDefault<number>(ascending, DEFAULT_INT));
      // A strictly decreasing vector is the other way round.
      const descending: number[] = descendingTwelve();
      expect(ArrayUtils.firstOrDefault<number>(descending, DEFAULT_INT))
        .assertLarger(ArrayUtils.lastOrDefault<number>(descending, DEFAULT_INT));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0108
     * @tc.name      testArrayUtils0009
     * @tc.desc      Verify the string specialisations echo string fallbacks instead of numeric ones.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.firstOrDefault<string>(null, DEFAULT_TEXT)).assertEqual(DEFAULT_TEXT);
      expect(ArrayUtils.firstOrDefault<string>([], DEFAULT_TEXT)).assertEqual(DEFAULT_TEXT);
      expect(ArrayUtils.lastOrDefault<string>(undefined, DEFAULT_TEXT)).assertEqual(DEFAULT_TEXT);
      expect(ArrayUtils.lastOrDefault<string>([], DEFAULT_TEXT)).assertEqual(DEFAULT_TEXT);
      // The second fallback is returned when it is the one supplied.
      expect(ArrayUtils.firstOrDefault<string>([], DEFAULT_TEXT_OTHER)).assertEqual(DEFAULT_TEXT_OTHER);
      expect(ArrayUtils.lastOrDefault<string>(null, DEFAULT_TEXT_OTHER)).assertEqual(DEFAULT_TEXT_OTHER);
      // A filled string vector returns its real element, not the fallback.
      const rooms: string[] = [DEFAULT_TEXT, DEFAULT_TEXT_OTHER];
      expect(ArrayUtils.firstOrDefault<string>(rooms, 'x')).assertEqual(DEFAULT_TEXT);
      expect(ArrayUtils.lastOrDefault<string>(rooms, 'x')).assertEqual(DEFAULT_TEXT_OTHER);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0109
     * @tc.name      testArrayUtils0010
     * @tc.desc      Verify contains finds present elements and rejects absent ones across vector families.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // ascending(12, 1, 1) holds 1..12 inclusive.
      const ascending: number[] = ascendingTwelve();
      expect(ArrayUtils.contains<number>(ascending, 1)).assertTrue();
      expect(ArrayUtils.contains<number>(ascending, 6)).assertTrue();
      expect(ArrayUtils.contains<number>(ascending, TWELVE)).assertTrue();
      expect(ArrayUtils.contains<number>(ascending, 0)).assertFalse();
      expect(ArrayUtils.contains<number>(ascending, 13)).assertFalse();
      expect(ArrayUtils.contains<number>(ascending, ABSENT_VALUE)).assertFalse();
      // A constant vector contains only its constant value.
      const constant: number[] = NumericVectorFactory.constant(FIVE, CONSTANT_VALUE);
      expect(ArrayUtils.contains<number>(constant, CONSTANT_VALUE)).assertTrue();
      expect(ArrayUtils.contains<number>(constant, CONSTANT_VALUE + 1)).assertFalse();
      // primes(5) is 2, 3, 5, 7, 11 so four is absent.
      const primes: number[] = NumericVectorFactory.primes(FIVE);
      expect(ArrayUtils.contains<number>(primes, 11)).assertTrue();
      expect(ArrayUtils.contains<number>(primes, 4)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0110
     * @tc.name      testArrayUtils0011
     * @tc.desc      Verify contains returns false for null, undefined and empty inputs without throwing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.contains<number>(null, 0)).assertFalse();
      expect(ArrayUtils.contains<number>(undefined, 0)).assertFalse();
      expect(ArrayUtils.contains<number>([], 0)).assertFalse();
      // Even a value that would be present in a filled array is rejected.
      expect(ArrayUtils.contains<number>(null, 1)).assertFalse();
      expect(ArrayUtils.contains<number>([], 1)).assertFalse();
      // An explicit undefined element still cannot match an empty array.
      expect(ArrayUtils.contains<number>(undefined, ABSENT_VALUE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s, empty input contains probes are all false', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0111
     * @tc.name      testArrayUtils0012
     * @tc.desc      Verify contains agrees with the inclusive range element set of a generated vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vector: number[] = ascendingTwelve();
      // Every integer of the documented range is present, everything else is not.
      for (let value: number = RANGE_LOW; value <= TWELVE + 1; value++) {
        const expected: boolean = value >= 1 && value <= TWELVE;
        expect(ArrayUtils.contains<number>(vector, value)).assertEqual(expected);
      }
      // countInRange(1..12) counts twelve hits inside [1, 12].
      expect(NumericVectorFactory.countInRange(vector, 1, TWELVE) + 0).assertEqual(TWELVE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0112
     * @tc.name      testArrayUtils0013
     * @tc.desc      Verify sum equals the closed-form arithmetic sum for ascending and descending vectors.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // ascending(12, 1, 1) sums to 12*1 + 1*12*11/2 = 78.
      expect(ArrayUtils.sum(ascendingTwelve())).assertEqual(NumericVectorFactory.arithmeticSum(TWELVE, 1, 1));
      expect(ArrayUtils.sum(ascendingTwelve())).assertEqual(78);
      // ascending(10, 0, 3) sums to 0 + 3*10*9/2 = 135.
      expect(ArrayUtils.sum(NumericVectorFactory.ascending(TEN, 0, 3)))
        .assertEqual(NumericVectorFactory.arithmeticSum(TEN, 0, 3));
      // ascending(8, -4, 2) sums to 8*(-4) + 2*8*7/2 = -32 + 56 = 24.
      expect(ArrayUtils.sum(NumericVectorFactory.ascending(EIGHT, -4, 2)))
        .assertEqual(NumericVectorFactory.arithmeticSum(EIGHT, -4, 2));
      // The descending vector is the reverse of the ascending one, same sum.
      expect(ArrayUtils.sum(descendingTwelve())).assertEqual(NumericVectorFactory.arithmeticSum(TWELVE, TWELVE, -1));
      expect(ArrayUtils.sum(descendingTwelve())).assertEqual(ArrayUtils.sum(ascendingTwelve()));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0113
     * @tc.name      testArrayUtils0014
     * @tc.desc      Verify sum equals the closed-form constant and powers sums.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // constant(5, 7) sums to 35.
      expect(ArrayUtils.sum(NumericVectorFactory.constant(FIVE, CONSTANT_VALUE)))
        .assertEqual(NumericVectorFactory.constantSum(FIVE, CONSTANT_VALUE));
      expect(ArrayUtils.sum(NumericVectorFactory.constant(FIVE, CONSTANT_VALUE))).assertEqual(35);
      // A negative constant sums to the closed-form negative total.
      expect(ArrayUtils.sum(NumericVectorFactory.constant(SIX, NEGATIVE_CONSTANT)))
        .assertEqual(NumericVectorFactory.constantSum(SIX, NEGATIVE_CONSTANT));
      // powers(2, 6) is 1+2+4+8+16+32 = 63.
      expect(ArrayUtils.sum(NumericVectorFactory.powers(POWER_BASE, SIX)))
        .assertEqual(NumericVectorFactory.powersSum(POWER_BASE, SIX));
      expect(ArrayUtils.sum(NumericVectorFactory.powers(POWER_BASE, SIX))).assertEqual(63);
      // powers(3, 5) is 1+3+9+27+81 = 121.
      expect(ArrayUtils.sum(NumericVectorFactory.powers(POWER_BASE_THREE, FIVE)))
        .assertEqual(NumericVectorFactory.powersSum(POWER_BASE_THREE, FIVE));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0114
     * @tc.name      testArrayUtils0015
     * @tc.desc      Verify sum equals the closed-form triangular sum and the multiple vector sum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // triangular(4) is 1, 3, 6, 10 summing to 20 = 4*5*6/6.
      expect(ArrayUtils.sum(NumericVectorFactory.triangular(FOUR)))
        .assertEqual(NumericVectorFactory.triangularSum(FOUR));
      expect(ArrayUtils.sum(NumericVectorFactory.triangular(FOUR))).assertEqual(20);
      // triangular(6) sums to 6*7*8/6 = 56.
      expect(ArrayUtils.sum(NumericVectorFactory.triangular(SIX)))
        .assertEqual(NumericVectorFactory.triangularSum(SIX));
      // multiples(5, 3) is 0, 3, 6, 9, 12 summing to 30.
      expect(ArrayUtils.sum(NumericVectorFactory.multiples(FIVE, 3)))
        .assertEqual(NumericVectorFactory.arithmeticSum(FIVE, 0, 3));
      // multiples(4, 10) is 0, 10, 20, 30 summing to 60.
      expect(ArrayUtils.sum(NumericVectorFactory.multiples(FOUR, 10))).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0115
     * @tc.name      testArrayUtils0016
     * @tc.desc      Verify sum of a zigzag vector cancels out for even counts and keeps one amplitude for odd counts.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // An even length zigzag has as many positive as negative terms.
      expect(ArrayUtils.sum(NumericVectorFactory.zigzag(SIX, ZIGZAG_AMPLITUDE))).assertEqual(0);
      expect(ArrayUtils.sum(NumericVectorFactory.zigzag(TWELVE, ZIGZAG_AMPLITUDE))).assertEqual(0);
      // An odd length zigzag keeps exactly one positive amplitude.
      expect(ArrayUtils.sum(NumericVectorFactory.zigzag(FIVE, ZIGZAG_AMPLITUDE))).assertEqual(ZIGZAG_AMPLITUDE);
      expect(ArrayUtils.sum(NumericVectorFactory.zigzag(THREE, ZIGZAG_AMPLITUDE))).assertEqual(ZIGZAG_AMPLITUDE);
      // The alternating pair takes have a closed-form total too.
      expect(ArrayUtils.sum(NumericVectorFactory.alternating(SIX, ALTERNATE_LOW, ALTERNATE_HIGH)))
        .assertEqual(NumericVectorFactory.arithmeticSum(THREE, ALTERNATE_LOW, 0)
          + NumericVectorFactory.constantSum(THREE, ALTERNATE_HIGH));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0116
     * @tc.name      testArrayUtils0017
     * @tc.desc      Verify sum returns zero for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.sum(null)).assertEqual(0);
      expect(ArrayUtils.sum(undefined)).assertEqual(0);
      expect(ArrayUtils.sum([])).assertEqual(0);
      // The empty sum equals the closed-form sum of a zero length vector.
      expect(ArrayUtils.sum([])).assertEqual(NumericVectorFactory.constantSum(0, CONSTANT_VALUE));
      // A single element array sums to that element.
      expect(ArrayUtils.sum(NumericVectorFactory.ascending(1, 42, 1))).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0117
     * @tc.name      testArrayUtils0018
     * @tc.desc      Verify sum of the flattened matrix equals the closed-form matrix total.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrix: number[][] = NumericVectorFactory.matrix(MATRIX_ROWS, MATRIX_COLS, MATRIX_SEED);
      const flat: number[] = NumericVectorFactory.flatten(matrix);
      expect(flat.length).assertEqual(MATRIX_ROWS * MATRIX_COLS);
      expect(ArrayUtils.sum(flat)).assertEqual(NumericVectorFactory.matrixTotalSum(MATRIX_SEED, MATRIX_ROWS, MATRIX_COLS));
      // Summing row by row reproduces the same total through the row formula.
      let rowTotal: number = 0;
      for (let row: number = 0; row < MATRIX_ROWS; row++) {
        const rowValues: number[] = matrix[row];
        const rowSum: number = ArrayUtils.sum(rowValues);
        expect(rowSum).assertEqual(NumericVectorFactory.matrixRowSum(MATRIX_SEED, MATRIX_COLS, row));
        rowTotal += rowSum;
      }
      expect(rowTotal).assertEqual(ArrayUtils.sum(flat));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0118
     * @tc.name      testArrayUtils0019
     * @tc.desc      Verify a mirrored vector keeps the source length and sum, an interleave with itself doubles both, and repeatEach by three triples both.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const mirrored: number[] = NumericVectorFactory.mirror(source);
      expect(mirrored.length).assertEqual(source.length);
      expect(ArrayUtils.sum(mirrored)).assertEqual(ArrayUtils.sum(source));
      // Interleaving the vector with itself doubles the sum and the length.
      const doubled: number[] = doubledVector(source);
      expect(doubled.length).assertEqual(source.length * TWO);
      expect(ArrayUtils.sum(doubled)).assertEqual(ArrayUtils.sum(source) * TWO);
      // repeatEach multiplies both the length and the sum by the repeat count.
      const repeated: number[] = NumericVectorFactory.repeatEach(source, REPEAT_TIMES);
      expect(repeated.length).assertEqual(source.length * REPEAT_TIMES);
      expect(ArrayUtils.sum(repeated)).assertEqual(ArrayUtils.sum(source) * REPEAT_TIMES);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0119
     * @tc.name      testArrayUtils0020
     * @tc.desc      Verify average equals the closed-form mean for ascending, constant and power vectors.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // The mean of ascending(12, 1, 1) is 78/12 = 6.5.
      const ascendingMean: number = NumericVectorFactory.arithmeticSum(TWELVE, 1, 1) / TWELVE;
      expect(ArrayUtils.average(ascendingTwelve())).assertClose(ascendingMean, BINARY_DELTA);
      expect(ArrayUtils.average(ascendingTwelve())).assertClose(6.5, BINARY_DELTA);
      // The mean of a constant vector is the constant itself.
      expect(ArrayUtils.average(NumericVectorFactory.constant(FIVE, CONSTANT_VALUE)))
        .assertClose(CONSTANT_VALUE, BINARY_DELTA);
      expect(ArrayUtils.average(NumericVectorFactory.constant(SIX, NEGATIVE_CONSTANT)))
        .assertClose(NEGATIVE_CONSTANT, BINARY_DELTA);
      // The mean of powers(2, 6) is 63/6 = 10.5.
      const powerMean: number = NumericVectorFactory.powersSum(POWER_BASE, SIX) / SIX;
      expect(ArrayUtils.average(NumericVectorFactory.powers(POWER_BASE, SIX))).assertClose(powerMean, DECIMAL_DELTA);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0120
     * @tc.name      testArrayUtils0021
     * @tc.desc      Verify average returns zero for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.average(null)).assertEqual(0);
      expect(ArrayUtils.average(undefined)).assertEqual(0);
      expect(ArrayUtils.average([])).assertEqual(0);
      // The empty average is the neutral value, not NaN and not the sentinel.
      expect(Number.isNaN(ArrayUtils.average([]))).assertFalse();
      expect(ArrayUtils.average([]) === 0).assertTrue();
      // A single element vector averages to that element.
      expect(ArrayUtils.average(NumericVectorFactory.constant(1, CONSTANT_VALUE)))
        .assertClose(CONSTANT_VALUE, BINARY_DELTA);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0121
     * @tc.name      testArrayUtils0022
     * @tc.desc      Verify average of a perfectly symmetric vector equals its centre value when the sum is exact.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // zigzag over an even count sums to zero, so the mean is exactly zero.
      expect(ArrayUtils.average(NumericVectorFactory.zigzag(SIX, ZIGZAG_AMPLITUDE))).assertEqual(0);
      // alternating(6, 1, 10) is 1,10,1,10,1,10 summing to 33, mean 5.5.
      expect(ArrayUtils.average(NumericVectorFactory.alternating(SIX, ALTERNATE_LOW, ALTERNATE_HIGH)))
        .assertClose(5.5, BINARY_DELTA);
      // The mean of a negative constant vector is that negative constant.
      expect(ArrayUtils.average(NumericVectorFactory.constant(FOUR, NEGATIVE_CONSTANT)))
        .assertClose(NEGATIVE_CONSTANT, BINARY_DELTA);
      // A floating vector keeps its exact mean when the elements are binary exact.
      expect(ArrayUtils.average([0.5, 0.5, 1.5, 1.5])).assertClose(1, BINARY_DELTA);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0122
     * @tc.name      testArrayUtils0023
     * @tc.desc      Verify minOrNull matches the closed-form minimum of every generated vector family.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const families: number[][] = [
        ascendingTwelve(),
        descendingTwelve(),
        NumericVectorFactory.constant(FIVE, CONSTANT_VALUE),
        NumericVectorFactory.constant(FIVE, NEGATIVE_CONSTANT),
        NumericVectorFactory.alternating(SIX, ALTERNATE_LOW, ALTERNATE_HIGH),
        NumericVectorFactory.multiples(FIVE, 3),
        NumericVectorFactory.powers(POWER_BASE, SIX),
        NumericVectorFactory.primes(FIVE),
        NumericVectorFactory.fibonacci(EIGHT),
        NumericVectorFactory.triangular(FOUR),
        NumericVectorFactory.zigzag(FIVE, ZIGZAG_AMPLITUDE)
      ];
      for (const family of families) {
        const expected: number | null = NumericVectorFactory.minOf(family);
        const actual: number | null = ArrayUtils.minOrNull(family);
        expect(expected !== null).assertTrue();
        if (expected !== null && actual !== null) {
          expect(actual).assertEqual(expected);
        } else {
          // Both sides must share the null branch, which never happens here.
          expect(actual).assertNull();
        }
      }
      expect(families.length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0123
     * @tc.name      testArrayUtils0024
     * @tc.desc      Verify minOrNull returns null for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.minOrNull(null)).assertNull();
      expect(ArrayUtils.minOrNull(undefined)).assertNull();
      expect(ArrayUtils.minOrNull([])).assertNull();
      // The helper returns null for the same empty input, keeping the oracle aligned.
      expect(NumericVectorFactory.minOf([])).assertNull();
      // A single element vector returns that element, never null.
      expect(ArrayUtils.minOrNull(NumericVectorFactory.constant(1, 42))).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0124
     * @tc.name      testArrayUtils0025
     * @tc.desc      Verify maxOrNull matches the closed-form maximum of every generated vector family.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const families: number[][] = [
        ascendingTwelve(),
        descendingTwelve(),
        NumericVectorFactory.constant(FIVE, CONSTANT_VALUE),
        NumericVectorFactory.constant(FIVE, NEGATIVE_CONSTANT),
        NumericVectorFactory.alternating(SIX, ALTERNATE_LOW, ALTERNATE_HIGH),
        NumericVectorFactory.multiples(FIVE, 3),
        NumericVectorFactory.powers(POWER_BASE_THREE, FIVE),
        NumericVectorFactory.primes(FIVE),
        NumericVectorFactory.fibonacci(EIGHT),
        NumericVectorFactory.triangular(FOUR),
        NumericVectorFactory.zigzag(FIVE, ZIGZAG_AMPLITUDE)
      ];
      for (const family of families) {
        const expected: number | null = NumericVectorFactory.maxOf(family);
        const actual: number | null = ArrayUtils.maxOrNull(family);
        expect(expected !== null).assertTrue();
        if (expected !== null && actual !== null) {
          expect(actual).assertEqual(expected);
        } else {
          expect(actual).assertNull();
        }
      }
      // Spot check: the powers vector peaks at the last element.
      expect(ArrayUtils.maxOrNull(NumericVectorFactory.powers(POWER_BASE_THREE, FIVE))).assertEqual(81);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0125
     * @tc.name      testArrayUtils0026
     * @tc.desc      Verify maxOrNull returns null for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.maxOrNull(null)).assertNull();
      expect(ArrayUtils.maxOrNull(undefined)).assertNull();
      expect(ArrayUtils.maxOrNull([])).assertNull();
      expect(NumericVectorFactory.maxOf([])).assertNull();
      // A single element vector returns that element, never null.
      expect(ArrayUtils.maxOrNull(NumericVectorFactory.constant(1, NEGATIVE_CONSTANT)))
        .assertEqual(NEGATIVE_CONSTANT);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0126
     * @tc.name      testArrayUtils0027
     * @tc.desc      Verify minOrNull is never larger than maxOrNull and both are real elements of the vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vector: number[] = NumericVectorFactory.zigzag(TWELVE, ZIGZAG_AMPLITUDE);
      const min: number | null = ArrayUtils.minOrNull(vector);
      const max: number | null = ArrayUtils.maxOrNull(vector);
      expect(min !== null).assertTrue();
      expect(max !== null).assertTrue();
      if (min !== null && max !== null) {
        expect(min <= max).assertTrue();
        expect(min).assertEqual(-ZIGZAG_AMPLITUDE);
        expect(max).assertEqual(ZIGZAG_AMPLITUDE);
      }
      // Both extremes must be present in the source vector.
      expect(ArrayUtils.contains<number>(vector, -ZIGZAG_AMPLITUDE)).assertTrue();
      expect(ArrayUtils.contains<number>(vector, ZIGZAG_AMPLITUDE)).assertTrue();
      // The arithmetic mean of the symmetric vector sits between the extremes.
      const mean: number = ArrayUtils.average(vector);
      expect(mean >= -ZIGZAG_AMPLITUDE).assertTrue();
      expect(mean <= ZIGZAG_AMPLITUDE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0127
     * @tc.name      testArrayUtils0028
     * @tc.desc      Verify minOrNull and maxOrNull agree with the closed-form limits of the matrix rows.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrix: number[][] = NumericVectorFactory.matrix(MATRIX_ROWS, MATRIX_COLS, MATRIX_SEED_LOW);
      const flat: number[] = NumericVectorFactory.flatten(matrix);
      expect(ArrayUtils.minOrNull(flat)).assertEqual(NumericVectorFactory.minOf(flat));
      expect(ArrayUtils.maxOrNull(flat)).assertEqual(NumericVectorFactory.maxOf(flat));
      // The first element is the minimum of a row-major increasing matrix.
      expect(ArrayUtils.minOrNull(flat)).assertEqual(MATRIX_SEED_LOW);
      // The last element is the maximum.
      expect(ArrayUtils.maxOrNull(flat))
        .assertEqual(NumericVectorFactory.matrixValue(MATRIX_SEED_LOW, MATRIX_COLS, MATRIX_ROWS - 1, MATRIX_COLS - 1));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0128
     * @tc.name      testArrayUtils0029
     * @tc.desc      Verify chunk splits an evenly divisible vector into equal sized chunks without loss.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const chunks: number[][] = ArrayUtils.chunk(source, CHUNK_SIZE_FOUR);
      // 12 elements in chunks of 4 give exactly 3 chunks.
      expect(chunks.length).assertEqual(TWELVE / CHUNK_SIZE_FOUR);
      for (const row of chunks) {
        expect(row.length).assertEqual(CHUNK_SIZE_FOUR);
      }
      // No element is dropped or duplicated by the split.
      expect(totalChunkElements(chunks)).assertEqual(source.length);
      expect(hasNoEmptyChunk(chunks)).assertTrue();
      // The chunks must be consecutive slices of the source vector.
      expect(chunks[0][0]).assertEqual(1);
      expect(chunks[0][3]).assertEqual(4);
      expect(chunks[1][0]).assertEqual(5);
      expect(chunks[2][3]).assertEqual(TWELVE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0129
     * @tc.name      testArrayUtils0030
     * @tc.desc      Verify the last chunk of a non divisible vector keeps only the remainder elements.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const chunks: number[][] = ArrayUtils.chunk(source, FIVE);
      // 12 elements in chunks of 5 give 3 chunks: 5, 5 and 2.
      expect(chunks.length).assertEqual(3);
      expect(chunks[0].length).assertEqual(FIVE);
      expect(chunks[1].length).assertEqual(FIVE);
      expect(chunks[2].length).assertEqual(TWO);
      expect(lastChunkLength(chunks)).assertEqual(source.length % FIVE);
      expect(totalChunkElements(chunks)).assertEqual(source.length);
      // The reminder keeps the tail of the vector.
      expect(chunks[2][0]).assertEqual(11);
      expect(chunks[2][1]).assertEqual(TWELVE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0130
     * @tc.name      testArrayUtils0031
     * @tc.desc      Verify a chunk size of zero falls back to one and yields single element chunks.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const chunks: number[][] = ArrayUtils.chunk(source, 0);
      // The fallback size one produces one chunk per element.
      expect(chunks.length).assertEqual(source.length);
      for (const row of chunks) {
        expect(row.length).assertEqual(1);
      }
      expect(totalChunkElements(chunks)).assertEqual(source.length);
      // The flattened chunks reproduce the source order exactly.
      for (let index: number = 0; index < source.length; index++) {
        expect(chunks[index][0]).assertEqual(source[index]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0131
     * @tc.name      testArrayUtils0032
     * @tc.desc      Verify a negative chunk size also falls back to one instead of looping or throwing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const withMinusOne: number[][] = ArrayUtils.chunk(source, -1);
      expect(withMinusOne.length).assertEqual(source.length);
      // Every other negative size collapses onto the same fallback.
      const withMinusFive: number[][] = ArrayUtils.chunk(source, -5);
      expect(withMinusFive.length).assertEqual(withMinusOne.length);
      expect(totalChunkElements(withMinusFive)).assertEqual(totalChunkElements(withMinusOne));
      // A negative size and a zero size behave identically.
      const withZero: number[][] = ArrayUtils.chunk(source, 0);
      expect(withMinusOne.length).assertEqual(withZero.length);
      expect(hasNoEmptyChunk(withMinusOne)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0132
     * @tc.name      testArrayUtils0033
     * @tc.desc      Verify chunk returns an empty chunk list for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.chunk<number>(null, CHUNK_SIZE_THREE).length).assertEqual(0);
      expect(ArrayUtils.chunk<number>(undefined, CHUNK_SIZE_THREE).length).assertEqual(0);
      expect(ArrayUtils.chunk<number>([], CHUNK_SIZE_THREE).length).assertEqual(0);
      // Even a negative size on an empty input yields no chunks.
      expect(ArrayUtils.chunk<number>([], -1).length).assertEqual(0);
      // A single element vector gives exactly one chunk of one element.
      const single: number[][] = ArrayUtils.chunk(NumericVectorFactory.constant(1, CONSTANT_VALUE), FIVE);
      expect(single.length).assertEqual(1);
      expect(single[0].length).assertEqual(1);
      expect(single[0][0]).assertEqual(CONSTANT_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0133
     * @tc.name      testArrayUtils0034
     * @tc.desc      Verify chunk of a matrix flattened vector matches the reference bucket generator.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrix: number[][] = NumericVectorFactory.matrix(WIDE_MATRIX_ROWS, WIDE_MATRIX_COLS, MATRIX_SEED);
      const flat: number[] = NumericVectorFactory.flatten(matrix);
      expect(flat.length).assertEqual(WIDE_MATRIX_ROWS * WIDE_MATRIX_COLS);
      const chunks: number[][] = ArrayUtils.chunk(flat, CHUNK_SIZE_THREE);
      const expectedBuckets: number[][] = NumericVectorFactory.buckets(flat, CHUNK_SIZE_THREE);
      expect(chunks.length).assertEqual(expectedBuckets.length);
      for (let index: number = 0; index < chunks.length; index++) {
        expect(chunks[index].length).assertEqual(expectedBuckets[index].length);
        for (let inner: number = 0; inner < chunks[index].length; inner++) {
          expect(chunks[index][inner]).assertEqual(expectedBuckets[index][inner]);
        }
      }
      // A chunk size larger than the vector keeps everything in a single chunk.
      const oversized: number[][] = ArrayUtils.chunk(flat, flat.length + 1);
      expect(oversized.length).assertEqual(1);
      expect(oversized[0].length).assertEqual(flat.length);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0134
     * @tc.name      testArrayUtils0035
     * @tc.desc      Verify unique keeps the first occurrence of every value and drops later duplicates.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const doubled: number[] = doubledVector(source);
      expect(doubled.length).assertEqual(TWELVE * TWO);
      const unique: number[] = ArrayUtils.unique(doubled);
      // Twelve distinct values survive the de-duplication.
      expect(unique.length).assertEqual(NumericVectorFactory.distinctCount(doubled));
      expect(unique.length).assertEqual(TWELVE);
      // The surviving values are the first occurrences, in source order.
      for (let index: number = 0; index < source.length; index++) {
        expect(unique[index]).assertEqual(source[index]);
        expect(unique[index]).assertEqual(ArrayUtils.firstOrDefault<number>(source, DEFAULT_INT) + index);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0135
     * @tc.name      testArrayUtils0036
     * @tc.desc      Verify unique preserves the order of first appearance for a non sorted vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // interleave(ascending(6,1,1), ascending(3,10,1)) is 1,10,2,11,3,12,4,5,6.
      const first: number[] = NumericVectorFactory.ascending(SIX, 1, 1);
      const second: number[] = NumericVectorFactory.ascending(THREE, 10, 1);
      const interleaved: number[] = NumericVectorFactory.interleave(first, second);
      const unique: number[] = ArrayUtils.unique(interleaved);
      // Every value of the interleaved vector is already distinct.
      expect(unique.length).assertEqual(interleaved.length);
      for (let index: number = 0; index < interleaved.length; index++) {
        expect(unique[index]).assertEqual(interleaved[index]);
      }
      // A constant vector collapses onto a single element.
      expect(ArrayUtils.unique(NumericVectorFactory.constant(EIGHT, CONSTANT_VALUE)).length).assertEqual(1);
      // repeatEach of a distinct vector keeps every distinct value once.
      const repeated: number[] = NumericVectorFactory.repeatEach(first, REPEAT_TIMES);
      expect(repeated.length).assertEqual(SIX * REPEAT_TIMES);
      expect(ArrayUtils.unique(repeated).length).assertEqual(SIX);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0136
     * @tc.name      testArrayUtils0037
     * @tc.desc      Verify unique of an already distinct vector returns a same-length vector with the same values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      expect(NumericVectorFactory.distinctCount(source)).assertEqual(source.length);
      const unique: number[] = ArrayUtils.unique(source);
      expect(unique.length).assertEqual(source.length);
      expect(ArrayUtils.sum(unique)).assertEqual(ArrayUtils.sum(source));
      // The interleaved distinct vector also keeps its cardinality. Both columns
      // start at different non zero offsets so they cannot share any value.
      const distinctPair: number[] = NumericVectorFactory.interleave(
        NumericVectorFactory.ascending(SIX, 1, UNIQUE_FACTOR),
        NumericVectorFactory.ascending(SIX, 2, UNIQUE_FACTOR_B));
      expect(NumericVectorFactory.distinctCount(distinctPair)).assertEqual(distinctPair.length);
      expect(ArrayUtils.unique(distinctPair).length).assertEqual(distinctPair.length);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0137
     * @tc.name      testArrayUtils0038
     * @tc.desc      Verify unique returns an empty vector for null, undefined and empty inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.unique<number>(null).length).assertEqual(0);
      expect(ArrayUtils.unique<number>(undefined).length).assertEqual(0);
      expect(ArrayUtils.unique<number>([]).length).assertEqual(0);
      // An empty result array is genuinely empty, not a filled placeholder.
      expect(ArrayUtils.isEmpty<number>(ArrayUtils.unique([]))).assertTrue();
      // A single element vector keeps exactly that element.
      const single: number[] = ArrayUtils.unique(NumericVectorFactory.constant(1, ABSENT_VALUE));
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual(ABSENT_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0138
     * @tc.name      testArrayUtils0039
     * @tc.desc      Verify removeElement removes the first hit, reports true and shortens the array by one.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const beforeSum: number = ArrayUtils.sum(source);
      expect(ArrayUtils.removeElement(source, 6)).assertTrue();
      expect(source.length).assertEqual(TWELVE - 1);
      expect(ArrayUtils.contains<number>(source, 6)).assertFalse();
      // Exactly the removed element disappears from the sum.
      expect(ArrayUtils.sum(source)).assertEqual(beforeSum - 6);
      // Removing the head and the tail is supported as well.
      const head: number[] = ascendingTwelve();
      expect(ArrayUtils.removeElement(head, 1)).assertTrue();
      expect(ArrayUtils.firstOrDefault<number>(head, DEFAULT_INT)).assertEqual(2);
      const tail: number[] = ascendingTwelve();
      expect(ArrayUtils.removeElement(tail, TWELVE)).assertTrue();
      expect(ArrayUtils.lastOrDefault<number>(tail, DEFAULT_INT)).assertEqual(TWELVE - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0139
     * @tc.name      testArrayUtils0040
     * @tc.desc      Verify removeElement removes only the first duplicate and leaves later copies untouched.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = doubledVector(NumericVectorFactory.ascending(FOUR, 1, 1));
      // The vector is 1,1,2,2,3,3,4,4.
      expect(source.length).assertEqual(FOUR * TWO);
      expect(ArrayUtils.removeElement(source, 2)).assertTrue();
      expect(source.length).assertEqual(FOUR * TWO - 1);
      // One copy of two survives, the other one is gone.
      expect(ArrayUtils.contains<number>(source, 2)).assertTrue();
      expect(ArrayUtils.unique(source).length).assertEqual(FOUR);
      // Removing the last copy as well empties the value from the vector.
      expect(ArrayUtils.removeElement(source, 2)).assertTrue();
      expect(ArrayUtils.contains<number>(source, 2)).assertFalse();
      // A third removal reports a miss.
      expect(ArrayUtils.removeElement(source, 2)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0140
     * @tc.name      testArrayUtils0041
     * @tc.desc      Verify removeElement reports a miss and keeps the array intact when the value is absent.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const beforeSum: number = ArrayUtils.sum(source);
      expect(ArrayUtils.removeElement(source, ABSENT_VALUE)).assertFalse();
      expect(source.length).assertEqual(TWELVE);
      expect(ArrayUtils.sum(source)).assertEqual(beforeSum);
      // A value outside the closed range of the vector is a miss too.
      expect(ArrayUtils.removeElement(source, 0)).assertFalse();
      expect(ArrayUtils.removeElement(source, TWELVE + 1)).assertFalse();
      // The vector still contains every original element.
      expect(ArrayUtils.contains<number>(source, 1)).assertTrue();
      expect(ArrayUtils.contains<number>(source, TWELVE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0141
     * @tc.name      testArrayUtils0042
     * @tc.desc      Verify removeElement reports a miss on null, undefined and empty inputs without throwing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUtils0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayUtils0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.removeElement<number>(null, 1)).assertFalse();
      expect(ArrayUtils.removeElement<number>(undefined, 1)).assertFalse();
      expect(ArrayUtils.removeElement<number>([], 1)).assertFalse();
      expect(ArrayUtils.removeElement<number>([], ABSENT_VALUE)).assertFalse();
      // A single element vector loses its only element and becomes empty.
      const single: number[] = NumericVectorFactory.constant(1, CONSTANT_VALUE);
      expect(ArrayUtils.removeElement(single, CONSTANT_VALUE)).assertTrue();
      expect(single.length).assertEqual(0);
      expect(ArrayUtils.isEmpty<number>(single)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0142
     * @tc.name      testArrayUtils0043
     * @tc.desc      Verify chunk keeps all twelve elements, removeElement drops the first element so the copy keeps eleven elements whose sum shrinks by that element, and unique never grows the copy.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrix: number[][] = NumericVectorFactory.matrix(WIDE_MATRIX_ROWS, WIDE_MATRIX_COLS, MATRIX_SEED);
      const flat: number[] = NumericVectorFactory.flatten(matrix);
      const chunks: number[][] = ArrayUtils.chunk(flat, CHUNK_SIZE_FOUR);
      // The chunk split never changes the element count.
      expect(totalChunkElements(chunks)).assertEqual(flat.length);
      // Removing one element from the flat copy shortens the length by exactly one.
      const copy: number[] = NumericVectorFactory.flatten(matrix);
      const firstValue: number = ArrayUtils.firstOrDefault<number>(copy, DEFAULT_INT);
      expect(ArrayUtils.removeElement(copy, firstValue)).assertTrue();
      expect(copy.length).assertEqual(flat.length - 1);
      // De-duplicating the copy cannot increase the length.
      expect(ArrayUtils.unique(copy).length <= copy.length).assertTrue();
      expect(ArrayUtils.sum(copy)).assertEqual(ArrayUtils.sum(flat) - firstValue);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0143
     * @tc.name      testArrayUtils0044
     * @tc.desc      Verify sum divided by length equals average for every generated vector family.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const families: number[][] = [
        ascendingTwelve(),
        descendingTwelve(),
        NumericVectorFactory.constant(SIX, CONSTANT_VALUE),
        NumericVectorFactory.multiples(FIVE, 3),
        NumericVectorFactory.powers(POWER_BASE, SIX),
        NumericVectorFactory.fibonacci(EIGHT),
        NumericVectorFactory.triangular(FOUR),
        NumericVectorFactory.zigzag(SIX, ZIGZAG_AMPLITUDE)
      ];
      for (const family of families) {
        const mean: number = ArrayUtils.average(family);
        const derived: number = ArrayUtils.sum(family) / family.length;
        expect(mean).assertClose(derived, DECIMAL_DELTA);
        // The mean always sits between the extremes.
        const min: number | null = ArrayUtils.minOrNull(family);
        const max: number | null = ArrayUtils.maxOrNull(family);
        if (min !== null && max !== null) {
          expect(mean >= min).assertTrue();
          expect(mean <= max).assertTrue();
        }
      }
      expect(families.length).assertEqual(EIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0144
     * @tc.name      testArrayUtils0045
     * @tc.desc      Verify removeElement can drain a whole vector down to the empty state.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      // Draining in ascending order visits every original element exactly once.
      for (let value: number = 1; value <= TWELVE; value++) {
        expect(ArrayUtils.removeElement(source, value)).assertTrue();
        expect(source.length).assertEqual(TWELVE - value);
      }
      expect(source.length).assertEqual(0);
      expect(ArrayUtils.isEmpty<number>(source)).assertTrue();
      expect(ArrayUtils.sum(source)).assertEqual(0);
      expect(ArrayUtils.average(source)).assertEqual(0);
      expect(ArrayUtils.minOrNull(source)).assertNull();
      expect(ArrayUtils.maxOrNull(source)).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0145
     * @tc.name      testArrayUtils0046
     * @tc.desc      Verify every generated vector family satisfies contains, minOrNull, maxOrNull and unique against the helper minimum, maximum and distinct count.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const families: number[][] = [
        ascendingTwelve(),
        descendingTwelve(),
        NumericVectorFactory.primes(FIVE),
        NumericVectorFactory.powers(POWER_BASE, SIX),
        NumericVectorFactory.fibonacci(EIGHT),
        NumericVectorFactory.triangular(FOUR),
        NumericVectorFactory.alternating(SIX, ALTERNATE_LOW, ALTERNATE_HIGH),
        NumericVectorFactory.zigzag(SIX, ZIGZAG_AMPLITUDE)
      ];
      for (const family of families) {
        const min: number | null = NumericVectorFactory.minOf(family);
        const max: number | null = NumericVectorFactory.maxOf(family);
        expect(min !== null).assertTrue();
        expect(max !== null).assertTrue();
        if (min !== null && max !== null) {
          // Both extremes must be reported and must really be present.
          expect(ArrayUtils.minOrNull(family)).assertEqual(min);
          expect(ArrayUtils.maxOrNull(family)).assertEqual(max);
          expect(ArrayUtils.contains<number>(family, min)).assertTrue();
          expect(ArrayUtils.contains<number>(family, max)).assertTrue();
        }
        // unique never grows the vector.
        const distinct: number[] = ArrayUtils.unique(family);
        expect(distinct.length).assertEqual(NumericVectorFactory.distinctCount(family));
        expect(distinct.length <= family.length).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0146
     * @tc.name      testArrayUtils0047
     * @tc.desc      Verify the range based count over a generated vector agrees with the number of contains hits.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vector: number[] = ascendingTwelve();
      // countInRange over the full closed interval reports twelve elements.
      expect(NumericVectorFactory.countInRange(vector, 1, TWELVE)).assertEqual(TWELVE);
      expect(NumericVectorFactory.countInRange(vector, 3, 7)).assertEqual(FIVE);
      // Walking the range and probing with contains gives the same tally.
      let hits: number = 0;
      for (let value: number = 3; value <= 7; value++) {
        if (ArrayUtils.contains<number>(vector, value)) {
          hits++;
        }
      }
      expect(hits).assertEqual(NumericVectorFactory.countInRange(vector, 3, 7));
      // An empty window counts nothing.
      expect(NumericVectorFactory.countInRange(vector, 20, 30)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0147
     * @tc.name      testArrayUtils0048
     * @tc.desc      Verify the row sums, manually extracted column sums and column extremes of a three by four matrix match the closed-form values, and the flattened total matches matrixTotalSum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrix: number[][] = NumericVectorFactory.matrix(MATRIX_ROWS, MATRIX_COLS, MATRIX_SEED);
      const flat: number[] = NumericVectorFactory.flatten(matrix);
      // Summing each row reproduces the closed-form row sum.
      for (let row: number = 0; row < MATRIX_ROWS; row++) {
        expect(ArrayUtils.sum(matrix[row]))
          .assertEqual(NumericVectorFactory.matrixRowSum(MATRIX_SEED, MATRIX_COLS, row));
      }
      // Summing each column with the vector helpers reproduces the column sum.
      for (let col: number = 0; col < MATRIX_COLS; col++) {
        const column: number[] = [];
        for (let row: number = 0; row < MATRIX_ROWS; row++) {
          column.push(matrix[row][col]);
        }
        expect(ArrayUtils.sum(column))
          .assertEqual(NumericVectorFactory.matrixColumnSum(MATRIX_SEED, MATRIX_ROWS, MATRIX_COLS, col));
        expect(ArrayUtils.maxOrNull(column))
          .assertEqual(NumericVectorFactory.matrixValue(MATRIX_SEED, MATRIX_COLS, MATRIX_ROWS - 1, col));
        expect(ArrayUtils.minOrNull(column))
          .assertEqual(NumericVectorFactory.matrixValue(MATRIX_SEED, MATRIX_COLS, 0, col));
      }
      expect(ArrayUtils.sum(flat)).assertEqual(NumericVectorFactory.matrixTotalSum(MATRIX_SEED, MATRIX_ROWS, MATRIX_COLS));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0148
     * @tc.name      testArrayUtils0049
     * @tc.desc      Verify the empty-array contract is identical for every method that accepts a missing input.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // Documented empty behaviour, asserted once for all three missing shapes.
      expect(ArrayUtils.isEmpty<number>(null)).assertTrue();
      expect(ArrayUtils.isEmpty<number>(undefined)).assertTrue();
      expect(ArrayUtils.isEmpty<number>([])).assertTrue();
      expect(ArrayUtils.sum(null)).assertEqual(0);
      expect(ArrayUtils.sum(undefined)).assertEqual(0);
      expect(ArrayUtils.sum([])).assertEqual(0);
      expect(ArrayUtils.average(null)).assertEqual(0);
      expect(ArrayUtils.average(undefined)).assertEqual(0);
      expect(ArrayUtils.average([])).assertEqual(0);
      expect(ArrayUtils.minOrNull(null)).assertNull();
      expect(ArrayUtils.minOrNull(undefined)).assertNull();
      expect(ArrayUtils.minOrNull([])).assertNull();
      expect(ArrayUtils.maxOrNull(null)).assertNull();
      expect(ArrayUtils.maxOrNull(undefined)).assertNull();
      expect(ArrayUtils.maxOrNull([])).assertNull();
      expect(ArrayUtils.unique<number>(null).length).assertEqual(0);
      expect(ArrayUtils.unique<number>(undefined).length).assertEqual(0);
      expect(ArrayUtils.unique<number>([]).length).assertEqual(0);
      expect(ArrayUtils.chunk<number>(null, CHUNK_SIZE_THREE).length).assertEqual(0);
      expect(ArrayUtils.chunk<number>(undefined, CHUNK_SIZE_THREE).length).assertEqual(0);
      expect(ArrayUtils.chunk([], CHUNK_SIZE_THREE).length).assertEqual(0);
      expect(ArrayUtils.contains(null, 0)).assertFalse();
      expect(ArrayUtils.removeElement(null, 0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0149
     * @tc.name      testArrayUtils0050
     * @tc.desc      Verify the vector factory keeps helping expectations independent from the production loops.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // The closed-form formulas must match the concrete generated vectors.
      const ascending: number[] = ascendingTwelve();
      expect(NumericVectorFactory.arithmeticSum(TWELVE, 1, 1)).assertEqual(78);
      expect(ArrayUtils.sum(ascending)).assertEqual(78);
      expect(NumericVectorFactory.powersSum(POWER_BASE, SIX)).assertEqual(63);
      expect(NumericVectorFactory.triangularSum(FOUR)).assertEqual(20);
      expect(NumericVectorFactory.constantSum(FIVE, CONSTANT_VALUE)).assertEqual(35);
      // maxOf and minOf on a single element vector return that element.
      const single: number[] = NumericVectorFactory.constant(1, CONSTANT_VALUE);
      expect(NumericVectorFactory.maxOf(single)).assertEqual(CONSTANT_VALUE);
      expect(NumericVectorFactory.minOf(single)).assertEqual(CONSTANT_VALUE);
      // distinctCount of a constant vector is one.
      expect(NumericVectorFactory.distinctCount(NumericVectorFactory.constant(EIGHT, CONSTANT_VALUE))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0150
     * @tc.name      testArrayUtils0051
     * @tc.desc      Verify the fibonacci and prime vectors keep their documented prefixes when read through the helpers.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const fibonacci: number[] = NumericVectorFactory.fibonacci(EIGHT);
      expect(fibonacci.length).assertEqual(EIGHT);
      expect(ArrayUtils.firstOrDefault<number>(fibonacci, DEFAULT_INT)).assertEqual(0);
      expect(ArrayUtils.contains<number>(fibonacci, 13)).assertTrue();
      expect(ArrayUtils.contains<number>(fibonacci, 12)).assertFalse();
      // The generator and the closed-form helper agree element by element.
      for (let index: number = 0; index < fibonacci.length; index++) {
        expect(fibonacci[index]).assertEqual(NumericVectorFactory.fibonacciValue(index));
      }
      const primes: number[] = NumericVectorFactory.primes(FIVE);
      expect(primes.length).assertEqual(FIVE);
      expect(ArrayUtils.firstOrDefault<number>(primes, DEFAULT_INT)).assertEqual(2);
      expect(ArrayUtils.lastOrDefault<number>(primes, DEFAULT_INT)).assertEqual(11);
      // Every element of the prime vector is prime by construction.
      for (const value of primes) {
        expect(NumericVectorFactory.isPrime(value)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0151
     * @tc.name      testArrayUtils0052
     * @tc.desc      Verify repeated calls on the same vector are deterministic and do not mutate the input.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0052';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      const lengthBefore: number = source.length;
      const sumBefore: number = ArrayUtils.sum(source);
      // Pure probes must return the same answer on every call.
      expect(ArrayUtils.sum(source)).assertEqual(ArrayUtils.sum(source));
      expect(ArrayUtils.average(source)).assertEqual(ArrayUtils.average(source));
      expect(ArrayUtils.minOrNull(source)).assertEqual(ArrayUtils.minOrNull(source));
      expect(ArrayUtils.maxOrNull(source)).assertEqual(ArrayUtils.maxOrNull(source));
      expect(ArrayUtils.unique(source).length).assertEqual(ArrayUtils.unique(source).length);
      expect(ArrayUtils.chunk(source, CHUNK_SIZE_THREE).length)
        .assertEqual(ArrayUtils.chunk(source, CHUNK_SIZE_THREE).length);
      // None of the probes above may have touched the source vector.
      expect(source.length).assertEqual(lengthBefore);
      expect(ArrayUtils.sum(source)).assertEqual(sumBefore);
      expect(ArrayUtils.isEmpty<number>(source)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0152
     * @tc.name      testArrayUtils0053
     * @tc.desc      Verify removeElement mutates only the target copy while the factory rebuilds a pristine vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayUtils0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayUtils0053';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: number[] = ascendingTwelve();
      const second: number[] = ascendingTwelve();
      expect(ArrayUtils.sum(first)).assertEqual(ArrayUtils.sum(second));
      expect(ArrayUtils.removeElement(first, 1)).assertTrue();
      // The second copy is untouched because the factory allocated it separately.
      expect(first.length).assertEqual(TWELVE - 1);
      expect(second.length).assertEqual(TWELVE);
      expect(ArrayUtils.contains<number>(second, 1)).assertTrue();
      expect(ArrayUtils.contains<number>(first, 1)).assertFalse();
      expect(ArrayUtils.sum(second) - ArrayUtils.sum(first)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_ARRAY_0153
     * @tc.name      testArrayUtils0054
     * @tc.desc      Verify firstOrDefault and lastOrDefault stay correct after the vector is shortened twice.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayUtils0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayUtils0054';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = ascendingTwelve();
      expect(ArrayUtils.removeElement(source, 1)).assertTrue();
      expect(ArrayUtils.firstOrDefault<number>(source, DEFAULT_INT)).assertEqual(2);
      expect(ArrayUtils.removeElement(source, TWELVE)).assertTrue();
      expect(ArrayUtils.lastOrDefault<number>(source, DEFAULT_INT)).assertEqual(TWELVE - 1);
      // After the two edits ten elements remain and the sum drops by 1 + 12.
      expect(source.length).assertEqual(TWELVE - 2);
      expect(ArrayUtils.sum(source)).assertEqual(78 - 1 - TWELVE);
      // Chunking the shortened vector loses nothing.
      expect(totalChunkElements(ArrayUtils.chunk(source, CHUNK_SIZE_THREE))).assertEqual(source.length);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
