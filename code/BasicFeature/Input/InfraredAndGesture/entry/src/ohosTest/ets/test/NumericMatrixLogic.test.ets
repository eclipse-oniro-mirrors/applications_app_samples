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
import { ArrayUtils, NumberUtils } from 'common';
import { NumericVectorFactory } from './helper/NumericVectorFactory';

/**
 * 数值聚合与矩阵专项逻辑补充套件。
 *
 * 覆盖范围：ArrayUtils 的 sum / average / minOrNull / maxOrNull / chunk / unique，
 *          NumberUtils 的 isInRange / clamp / toFixedString，以及以矩阵为单位的多维聚合。
 *
 * 输入来源：全部向量由 helper/NumericVectorFactory 生成
 *          （ascending / descending / constant / alternating / multiples / powers /
 *          primes / fibonacci / triangular / zigzag / matrix / flatten /
 *          repeatEach / mirror / interleave / buckets），不手写长字面量。
 *
 * 期望口径：所有期望值都来自 NumericVectorFactory 的闭式公式
 *          （arithmeticSum / constantSum / powersSum / triangularSum /
 *          matrixRowSum / matrixColumnSum / matrixTotalSum / countInRange /
 *          maxOf / minOf / distinctCount），测试侧不复制被测实现的累加循环。
 *          平均值用固定常量容差 assertAbsDiff 比较，避免二进制表示误差。
 *
 * 明确不覆盖的分支：AppLogger.warn 只写日志没有返回值，空数组的告警日志无法从
 *          外部观测，只能通过“返回 0 / 返回 null / 返回空数组且不抛异常”间接覆盖；
 *          unique 对对象元素按引用去重（Set 语义）不在本套件范围，数值向量已足够
 *          覆盖值语义的去重契约。
 */

/** Hilog domain reserved for the numeric matrix logic tests. */
const DOMAIN: number = 0xF827;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_NumericMatrix_';

/** Absolute tolerance used by every floating point comparison. */
const EPSILON: number = 1e-9;
/** Cardinality of the twenty element vectors. */
const TWENTY: number = 20;
/** Cardinality of the sixteen element vectors. */
const SIXTEEN: number = 16;
/** Cardinality of the twelve element vectors. */
const TWELVE: number = 12;
/** Cardinality of the ten element vectors. */
const TEN: number = 10;
/** Cardinality of the nine element vectors. */
const NINE: number = 9;
/** Cardinality of the eight element vectors. */
const EIGHT: number = 8;
/** Cardinality of the seven element vectors. */
const SEVEN: number = 7;
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
/** Cardinality of the one element vectors. */
const ONE: number = 1;
/** Start value of the primary ascending fixture. */
const PRIMARY_START: number = 1;
/** Step of the primary ascending fixture. */
const PRIMARY_STEP: number = 1;
/** Start value of the descending fixture. */
const DESCENDING_START: number = 20;
/** Step of the descending fixture. */
const DESCENDING_STEP: number = 1;
/** Constant value repeated by the constant fixture. */
const CONSTANT_VALUE: number = 7;
/** Alternate low value of the alternating fixture. */
const ALTERNATE_LOW: number = 1;
/** Alternate high value of the alternating fixture. */
const ALTERNATE_HIGH: number = 10;
/** Factor of the multiples fixture. */
const MULTIPLE_FACTOR: number = 3;
/** Base of the power fixture. */
const POWER_BASE: number = 2;
/** Base of the second power fixture, already coprime with the first. */
const POWER_BASE_THREE: number = 3;
/** Amplitude of the zigzag fixture. */
const ZIGZAG_AMPLITUDE: number = 5;
/** Repeat count of the repeatEach fixture. */
const REPEAT_TIMES: number = 3;
/** Injective multiplier used to build strictly distinct vectors. */
const UNIQUE_FACTOR: number = 7;
/** Second injective multiplier used by the mirrored distinct vector. */
const UNIQUE_FACTOR_B: number = 11;

/** Row count of the square three by three matrix. */
const MATRIX_3_ROWS: number = 3;
/** Column count of the square three by three matrix. */
const MATRIX_3_COLS: number = 3;
/** Row count of the four by five matrix. */
const MATRIX_4_ROWS: number = 4;
/** Column count of the four by five matrix. */
const MATRIX_4_COLS: number = 5;
/** Row count of the ten by ten matrix. */
const MATRIX_10_ROWS: number = 10;
/** Column count of the ten by ten matrix. */
const MATRIX_10_COLS: number = 10;
/** Seed of the first matrix fixture. */
const MATRIX_SEED: number = 1;
/** Seed of the zero based matrix fixture. */
const MATRIX_SEED_ZERO: number = 0;
/** Seed of the negative matrix fixture. */
const MATRIX_SEED_NEGATIVE: number = -5;
/** Seed of the wide matrix fixture. */
const MATRIX_SEED_WIDE: number = 100;
/** Row count of the wide matrix used by the column probes. */
const MATRIX_WIDE_ROWS: number = 5;
/** Column count of the wide matrix used by the column probes. */
const MATRIX_WIDE_COLS: number = 6;

/** Inclusive lower bound of the range probes. */
const RANGE_LOW: number = 0;
/** Inclusive upper bound of the range probes. */
const RANGE_HIGH: number = 10;
/** Inclusive lower bound of the negative range probes. */
const NEGATIVE_RANGE_LOW: number = -8;
/** Inclusive upper bound of the negative range probes. */
const NEGATIVE_RANGE_HIGH: number = -2;
/** Inclusive lower bound of the wide range probes. */
const WIDE_RANGE_LOW: number = 100;
/** Inclusive upper bound of the wide range probes. */
const WIDE_RANGE_HIGH: number = 200;

/** Chunk size that exactly divides the twelve element vectors. */
const CHUNK_SIZE_FOUR: number = 4;
/** Chunk size that leaves a shorter trailing chunk. */
const CHUNK_SIZE_FIVE: number = 5;
/** Chunk size larger than the whole vector. */
const CHUNK_SIZE_HUGE: number = 100;
/** Fraction digits used by the fixed string probes. */
const DIGITS_TWO: number = 2;
/** Zero fraction digits used by the fixed string probes. */
const DIGITS_ZERO: number = 0;
/** Three fraction digits used by the fixed string probes. */
const DIGITS_THREE: number = 3;

/** One combination matrix entry: a generated vector plus its closed-form metrics. */
interface VectorCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Cardinality handed to the generator. */
  count: number;
  /** First element of the generated arithmetic sequence. */
  start: number;
  /** Difference between two neighbouring elements. */
  step: number;
}

/** One matrix fixture: dimensions, seed and the generated row-major data. */
interface MatrixCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Row count of the matrix. */
  rows: number;
  /** Column count of the matrix. */
  cols: number;
  /** Seed of the first element. */
  seed: number;
  /** Row-major matrix generated by the factory. */
  data: number[][];
}

/** One chunk expectation: chunk size plus the derived segment layout. */
interface ChunkCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Requested chunk size. */
  size: number;
  /** Total number of elements in the source vector. */
  count: number;
}

/**
 * Pads or truncates the absolute difference check to a fixed tolerance.
 * Returns true when |actual - expected| stays inside {@link EPSILON}.
 */
function isClose(actual: number, expected: number): boolean {
  const diff: number = actual - expected;
  return diff <= EPSILON && diff >= -EPSILON;
}

/**
 * Returns the closed-form arithmetic expectation of the primary fixture.
 */
function primarySum(): number {
  return NumericVectorFactory.arithmeticSum(TWENTY, PRIMARY_START, PRIMARY_STEP);
}

/**
 * Returns the number of chunks a vector of the given length produces.
 * ceil(count / size), computed without touching the production implementation.
 */
function expectedChunkCount(count: number, size: number): number {
  const effectiveSize: number = size > 0 ? size : ONE;
  return Math.ceil(count / effectiveSize);
}

/**
 * Returns the number of elements in chunk index i of a vector with count elements.
 * Every chunk is full except possibly the last one.
 */
function expectedChunkLength(count: number, size: number, index: number): number {
  const effectiveSize: number = size > 0 ? size : ONE;
  const fullChunks: number = Math.floor(count / effectiveSize);
  if (index < fullChunks) {
    return effectiveSize;
  }
  return count - fullChunks * effectiveSize;
}

/**
 * Sums the chunk lengths of a chunk matrix. Used to prove chunk neither drops
 * nor duplicates elements relative to the source vector.
 */
function totalChunkedElements(chunks: number[][]): number {
  let total: number = 0;
  for (const chunk of chunks) {
    total += chunk.length;
  }
  return total;
}

/**
 * Extracts column col of a row-major matrix. This deliberately uses a plain
 * index walk instead of any production helper so the column oracle stays
 * independent from the class under test.
 */
function extractColumn(matrix: number[][], col: number): number[] {
  const column: number[] = [];
  for (let rowIndex: number = 0; rowIndex < matrix.length; rowIndex++) {
    const row: number[] = matrix[rowIndex];
    if (col < row.length) {
      column.push(row[col]);
    }
  }
  return column;
}

/**
 * Returns true when every element of the vector lies inside the inclusive range.
 */
function allInsideRange(values: number[], min: number, max: number): boolean {
  for (const value of values) {
    if (!NumberUtils.isInRange(value, min, max)) {
      return false;
    }
  }
  return true;
}

/**
 * Returns true when the vector holds no duplicated value.
 */
function hasNoDuplicate(values: number[]): boolean {
  return ArrayUtils.unique<number>(values).length === values.length;
}

/**
 * Builds the three by three matrix used by the small square probes.
 */
function smallMatrix(): MatrixCase {
  const data: number[][] = NumericVectorFactory.matrix(MATRIX_3_ROWS, MATRIX_3_COLS, MATRIX_SEED);
  return { label: '3x3', rows: MATRIX_3_ROWS, cols: MATRIX_3_COLS, seed: MATRIX_SEED, data: data };
}

/**
 * Builds the four by five matrix used by the rectangular probes.
 */
function rectangularMatrix(): MatrixCase {
  const data: number[][] = NumericVectorFactory.matrix(MATRIX_4_ROWS, MATRIX_4_COLS, MATRIX_SEED);
  return { label: '4x5', rows: MATRIX_4_ROWS, cols: MATRIX_4_COLS, seed: MATRIX_SEED, data: data };
}

/**
 * Builds the ten by ten matrix used by the large square probes.
 */
function largeMatrix(): MatrixCase {
  const data: number[][] = NumericVectorFactory.matrix(MATRIX_10_ROWS, MATRIX_10_COLS, MATRIX_SEED);
  return { label: '10x10', rows: MATRIX_10_ROWS, cols: MATRIX_10_COLS, seed: MATRIX_SEED, data: data };
}

/**
 * Builds the single cell matrix used by the degenerate probes.
 */
function singleCellMatrix(): MatrixCase {
  const data: number[][] = NumericVectorFactory.matrix(ONE, ONE, MATRIX_SEED);
  return { label: '1x1', rows: ONE, cols: ONE, seed: MATRIX_SEED, data: data };
}

/**
 * Builds the five by six matrix with a large seed used by the column probes.
 */
function wideMatrix(): MatrixCase {
  const data: number[][] = NumericVectorFactory.matrix(MATRIX_WIDE_ROWS, MATRIX_WIDE_COLS, MATRIX_SEED_WIDE);
  return {
    label: '5x6',
    rows: MATRIX_WIDE_ROWS,
    cols: MATRIX_WIDE_COLS,
    seed: MATRIX_SEED_WIDE,
    data: data
  };
}

export default function numericMatrixLogicTest() {
  describe('NumericMatrixLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0100
     * @tc.name      testNumericMatrix0001
     * @tc.desc      Verify ArrayUtils.sum matches the closed-form sum of an ascending sequence.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TWENTY, PRIMARY_START, PRIMARY_STEP);
      expect(values.length).assertEqual(TWENTY);
      expect(ArrayUtils.sum(values)).assertEqual(primarySum());
      expect(ArrayUtils.sum(values)).assertEqual(210);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0101
     * @tc.name      testNumericMatrix0002
     * @tc.desc      Verify ArrayUtils.sum matches the closed-form sum of a descending sequence.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.descending(TWENTY, DESCENDING_START, DESCENDING_STEP);
      // A descending sequence is the ascending one with step negated.
      const closedForm: number = NumericVectorFactory.arithmeticSum(TWENTY, DESCENDING_START, -DESCENDING_STEP);
      expect(ArrayUtils.sum(values)).assertEqual(closedForm);
      expect(values[0]).assertEqual(DESCENDING_START);
      expect(values[TWENTY - 1]).assertEqual(PRIMARY_START);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(DESCENDING_START);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0102
     * @tc.name      testNumericMatrix0003
     * @tc.desc      Verify ArrayUtils.sum matches the closed-form sum of a constant vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.constant(TWELVE, CONSTANT_VALUE);
      expect(ArrayUtils.sum(values)).assertEqual(NumericVectorFactory.constantSum(TWELVE, CONSTANT_VALUE));
      expect(ArrayUtils.minOrNull(values)).assertEqual(CONSTANT_VALUE);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(CONSTANT_VALUE);
      expect(NumericVectorFactory.distinctCount(values)).assertEqual(ONE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0103
     * @tc.name      testNumericMatrix0004
     * @tc.desc      Verify ArrayUtils.sum matches the closed-form sum of an alternating vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.alternating(TEN, ALTERNATE_LOW, ALTERNATE_HIGH);
      // An even length alternating vector holds count/2 pairs, each pair sums to low + high.
      const pairs: number = TEN / TWO;
      const closedForm: number = pairs * (ALTERNATE_LOW + ALTERNATE_HIGH);
      expect(ArrayUtils.sum(values)).assertEqual(closedForm);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(ALTERNATE_HIGH);
      expect(ArrayUtils.minOrNull(values)).assertEqual(ALTERNATE_LOW);
      expect(NumericVectorFactory.distinctCount(values)).assertEqual(TWO);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0104
     * @tc.name      testNumericMatrix0005
     * @tc.desc      Verify ArrayUtils.sum matches the closed-form sum of a multiples vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.multiples(TEN, MULTIPLE_FACTOR);
      expect(ArrayUtils.sum(values)).assertEqual(NumericVectorFactory.arithmeticSum(TEN, 0, MULTIPLE_FACTOR));
      // The first multiple is always zero and the last one is (count - 1) * factor.
      expect(ArrayUtils.firstOrDefault<number>(values, -1)).assertEqual(0);
      expect(ArrayUtils.lastOrDefault<number>(values, -1)).assertEqual((TEN - 1) * MULTIPLE_FACTOR);
      expect(ArrayUtils.average(values)).assertEqual((TEN - 1) * MULTIPLE_FACTOR / TWO);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0105
     * @tc.name      testNumericMatrix0006
     * @tc.desc      Verify ArrayUtils.sum matches the closed-form sum of a power vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.powers(POWER_BASE, EIGHT);
      expect(ArrayUtils.sum(values)).assertEqual(NumericVectorFactory.powersSum(POWER_BASE, EIGHT));
      expect(ArrayUtils.sum(values)).assertEqual(255);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(128);
      expect(ArrayUtils.minOrNull(values)).assertEqual(ONE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0106
     * @tc.name      testNumericMatrix0007
     * @tc.desc      Verify ArrayUtils.sum matches the closed-form sum of a three power vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.powers(POWER_BASE_THREE, FIVE);
      expect(ArrayUtils.sum(values)).assertEqual(NumericVectorFactory.powersSum(POWER_BASE_THREE, FIVE));
      expect(ArrayUtils.sum(values)).assertEqual(121);
      // A power vector with a base other than one never repeats a value.
      expect(hasNoDuplicate(values)).assertTrue();
      expect(NumericVectorFactory.distinctCount(values)).assertEqual(FIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0107
     * @tc.name      testNumericMatrix0008
     * @tc.desc      Verify the first ten primes sum to 129 with minimum 2, maximum 29 and no duplicates.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.primes(TEN);
      expect(values.length).assertEqual(TEN);
      // The first ten primes are 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 and sum to 129.
      expect(ArrayUtils.sum(values)).assertEqual(129);
      expect(ArrayUtils.minOrNull(values)).assertEqual(2);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(29);
      expect(hasNoDuplicate(values)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0108
     * @tc.name      testNumericMatrix0009
     * @tc.desc      Verify the Fibonacci vector matches the closed-form Fibonacci values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.fibonacci(TWELVE);
      expect(values.length).assertEqual(TWELVE);
      expect(values[0]).assertEqual(NumericVectorFactory.fibonacciValue(0));
      expect(values[1]).assertEqual(NumericVectorFactory.fibonacciValue(1));
      expect(values[TWELVE - 1]).assertEqual(NumericVectorFactory.fibonacciValue(TWELVE - 1));
      // First twelve values: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 and sum to 232.
      expect(ArrayUtils.sum(values)).assertEqual(232);
      expect(ArrayUtils.minOrNull(values)).assertEqual(0);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(89);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0109
     * @tc.name      testNumericMatrix0010
     * @tc.desc      Verify the triangular vector matches the closed-form triangular sum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.triangular(SIX);
      // The first six triangular numbers are 1, 3, 6, 10, 15, 21.
      expect(values.length).assertEqual(SIX);
      expect(ArrayUtils.sum(values)).assertEqual(NumericVectorFactory.triangularSum(SIX));
      expect(ArrayUtils.sum(values)).assertEqual(56);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(21);
      expect(ArrayUtils.minOrNull(values)).assertEqual(ONE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0110
     * @tc.name      testNumericMatrix0011
     * @tc.desc      Verify the zigzag vector is symmetric around zero for an even cardinality.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.zigzag(TEN, ZIGZAG_AMPLITUDE);
      // Every positive amplitude cancels a negative one, so the sum is zero.
      expect(ArrayUtils.sum(values)).assertEqual(0);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(ZIGZAG_AMPLITUDE);
      expect(ArrayUtils.minOrNull(values)).assertEqual(-ZIGZAG_AMPLITUDE);
      expect(NumericVectorFactory.distinctCount(values)).assertEqual(TWO);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0111
     * @tc.name      testNumericMatrix0012
     * @tc.desc      Verify the average equals the closed-form sum divided by the cardinality.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TWENTY, PRIMARY_START, PRIMARY_STEP);
      const closedForm: number = NumericVectorFactory.arithmeticSum(TWENTY, PRIMARY_START, PRIMARY_STEP);
      const expectedAverage: number = closedForm / TWENTY;
      expect(isClose(ArrayUtils.average(values), expectedAverage)).assertTrue();
      // For an arithmetic sequence the average is the mean of the first and last value.
      const firstValue: number = values[0];
      const lastValue: number = values[TWENTY - 1];
      expect(isClose(ArrayUtils.average(values), (firstValue + lastValue) / TWO)).assertTrue();
      // The twenty element sequence averages to the exact half integer 10.5.
      expect(ArrayUtils.average(values)).assertEqual(10.5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0112
     * @tc.name      testNumericMatrix0013
     * @tc.desc      Verify the average of a constant vector equals that constant for every count.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const counts: number[] = [ONE, TWO, THREE, FIVE, EIGHT, TWELVE, TWENTY];
      for (const count of counts) {
        const values: number[] = NumericVectorFactory.constant(count, CONSTANT_VALUE);
        expect(ArrayUtils.sum(values)).assertEqual(NumericVectorFactory.constantSum(count, CONSTANT_VALUE));
        expect(isClose(ArrayUtils.average(values), CONSTANT_VALUE)).assertTrue();
        expect(ArrayUtils.minOrNull(values)).assertEqual(CONSTANT_VALUE);
        expect(ArrayUtils.maxOrNull(values)).assertEqual(CONSTANT_VALUE);
      }
      expect(counts.length).assertEqual(SEVEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0113
     * @tc.name      testNumericMatrix0014
     * @tc.desc      Verify minOrNull and maxOrNull equal the closed-form minOf and maxOf for every family.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const families: number[][] = [
        NumericVectorFactory.ascending(TWELVE, PRIMARY_START, PRIMARY_STEP),
        NumericVectorFactory.descending(TWELVE, DESCENDING_START, DESCENDING_STEP),
        NumericVectorFactory.constant(FIVE, CONSTANT_VALUE),
        NumericVectorFactory.alternating(SIX, ALTERNATE_LOW, ALTERNATE_HIGH),
        NumericVectorFactory.multiples(FIVE, MULTIPLE_FACTOR),
        NumericVectorFactory.powers(POWER_BASE, SIX),
        NumericVectorFactory.primes(FIVE),
        NumericVectorFactory.fibonacci(EIGHT),
        NumericVectorFactory.triangular(FOUR),
        NumericVectorFactory.zigzag(FIVE, ZIGZAG_AMPLITUDE)
      ];
      for (const family of families) {
        expect(ArrayUtils.minOrNull(family)).assertEqual(NumericVectorFactory.minOf(family));
        expect(ArrayUtils.maxOrNull(family)).assertEqual(NumericVectorFactory.maxOf(family));
      }
      expect(families.length).assertEqual(TEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0114
     * @tc.name      testNumericMatrix0015
     * @tc.desc      Verify minOrNull and maxOrNull report the closed-form extremes of the prime family.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.primes(FIVE);
      expect(values.length).assertEqual(FIVE);
      expect(ArrayUtils.minOrNull(values)).assertEqual(NumericVectorFactory.minOf(values));
      expect(ArrayUtils.maxOrNull(values)).assertEqual(NumericVectorFactory.maxOf(values));
      expect(ArrayUtils.minOrNull(values)).assertEqual(TWO);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(11);
      expect(ArrayUtils.minOrNull(values) !== ArrayUtils.maxOrNull(values)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0115
     * @tc.name      testNumericMatrix0016
     * @tc.desc      Verify the single element vector reports that element as sum, average, min and max.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(ONE, CONSTANT_VALUE, PRIMARY_STEP);
      expect(values.length).assertEqual(ONE);
      expect(ArrayUtils.sum(values)).assertEqual(CONSTANT_VALUE);
      expect(isClose(ArrayUtils.average(values), CONSTANT_VALUE)).assertTrue();
      expect(ArrayUtils.minOrNull(values)).assertEqual(CONSTANT_VALUE);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(CONSTANT_VALUE);
      expect(NumericVectorFactory.distinctCount(values)).assertEqual(ONE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0116
     * @tc.name      testNumericMatrix0017
     * @tc.desc      Verify the chunk segment count equals ceil(count / size) for every chunk case.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: ChunkCase[] = [
        { label: 'twelve-by-four', size: CHUNK_SIZE_FOUR, count: TWELVE },
        { label: 'twelve-by-five', size: CHUNK_SIZE_FIVE, count: TWELVE },
        { label: 'twelve-by-three', size: THREE, count: TWELVE },
        { label: 'twelve-by-two', size: TWO, count: TWELVE },
        { label: 'twelve-by-huge', size: CHUNK_SIZE_HUGE, count: TWELVE }
      ];
      const source: number[] = NumericVectorFactory.ascending(TWELVE, PRIMARY_START, PRIMARY_STEP);
      for (const chunkCase of cases) {
        const chunks: number[][] = ArrayUtils.chunk<number>(source, chunkCase.size);
        expect(chunks.length).assertEqual(expectedChunkCount(chunkCase.count, chunkCase.size));
        expect(totalChunkedElements(chunks)).assertEqual(chunkCase.count);
      }
      expect(cases.length).assertEqual(FIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0117
     * @tc.name      testNumericMatrix0018
     * @tc.desc      Verify every chunk except possibly the last has the requested size.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = NumericVectorFactory.ascending(TWELVE, PRIMARY_START, PRIMARY_STEP);
      const chunks: number[][] = ArrayUtils.chunk<number>(source, CHUNK_SIZE_FIVE);
      expect(chunks.length).assertEqual(expectedChunkCount(TWELVE, CHUNK_SIZE_FIVE));
      for (let index: number = 0; index < chunks.length; index++) {
        expect(chunks[index].length).assertEqual(expectedChunkLength(TWELVE, CHUNK_SIZE_FIVE, index));
      }
      // 12 elements split by 5 yields 5, 5 and a shorter tail of 2.
      expect(chunks.length).assertEqual(THREE);
      expect(chunks[0].length).assertEqual(CHUNK_SIZE_FIVE);
      expect(chunks[1].length).assertEqual(CHUNK_SIZE_FIVE);
      expect(chunks[TWO].length).assertEqual(TWO);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0118
     * @tc.name      testNumericMatrix0019
     * @tc.desc      Verify an exactly divisible vector produces chunks of identical size.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = NumericVectorFactory.ascending(TWELVE, PRIMARY_START, PRIMARY_STEP);
      const chunks: number[][] = ArrayUtils.chunk<number>(source, CHUNK_SIZE_FOUR);
      expect(chunks.length).assertEqual(THREE);
      expect(chunks.length).assertEqual(expectedChunkCount(TWELVE, CHUNK_SIZE_FOUR));
      for (const chunk of chunks) {
        expect(chunk.length).assertEqual(CHUNK_SIZE_FOUR);
      }
      // Every chunk holds a contiguous slice, so the chunk sums form an arithmetic sequence.
      expect(ArrayUtils.sum(chunks[0])).assertEqual(10);
      expect(ArrayUtils.sum(chunks[1])).assertEqual(26);
      expect(ArrayUtils.sum(chunks[TWO])).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0119
     * @tc.name      testNumericMatrix0020
     * @tc.desc      Verify a chunk size larger than the vector yields exactly one full chunk.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = NumericVectorFactory.ascending(TWELVE, PRIMARY_START, PRIMARY_STEP);
      const chunks: number[][] = ArrayUtils.chunk<number>(source, CHUNK_SIZE_HUGE);
      expect(chunks.length).assertEqual(ONE);
      expect(chunks[0].length).assertEqual(TWELVE);
      expect(ArrayUtils.sum(chunks[0])).assertEqual(NumericVectorFactory.arithmeticSum(TWELVE, PRIMARY_START, PRIMARY_STEP));
      expect(chunks[0]).assertDeepEquals(source);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0120
     * @tc.name      testNumericMatrix0021
     * @tc.desc      Verify chunk sizes 0 and -4 both split five elements into five chunks, and that size 0 yields single element chunks.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = NumericVectorFactory.ascending(FIVE, PRIMARY_START, PRIMARY_STEP);
      const zeroChunks: number[][] = ArrayUtils.chunk<number>(source, 0);
      const negativeChunks: number[][] = ArrayUtils.chunk<number>(source, -CHUNK_SIZE_FOUR);
      expect(zeroChunks.length).assertEqual(FIVE);
      expect(negativeChunks.length).assertEqual(FIVE);
      for (const chunk of zeroChunks) {
        expect(chunk.length).assertEqual(ONE);
      }
      expect(totalChunkedElements(zeroChunks)).assertEqual(FIVE);
      expect(totalChunkedElements(negativeChunks)).assertEqual(FIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0121
     * @tc.name      testNumericMatrix0022
     * @tc.desc      Verify unique keeps the length of a strictly distinct vector unchanged.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.multiples(TWENTY, UNIQUE_FACTOR);
      expect(NumericVectorFactory.distinctCount(values)).assertEqual(TWENTY);
      const uniqueValues: number[] = ArrayUtils.unique<number>(values);
      expect(uniqueValues.length).assertEqual(NumericVectorFactory.distinctCount(values));
      expect(uniqueValues.length).assertEqual(values.length);
      expect(ArrayUtils.sum(uniqueValues)).assertEqual(ArrayUtils.sum(values));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0122
     * @tc.name      testNumericMatrix0023
     * @tc.desc      Verify unique collapses a repeated vector to its distinct cardinality.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: number[] = NumericVectorFactory.ascending(SIX, PRIMARY_START, PRIMARY_STEP);
      const repeated: number[] = NumericVectorFactory.repeatEach(base, REPEAT_TIMES);
      expect(repeated.length).assertEqual(SIX * REPEAT_TIMES);
      expect(NumericVectorFactory.distinctCount(repeated)).assertEqual(SIX);
      const uniqueValues: number[] = ArrayUtils.unique<number>(repeated);
      expect(uniqueValues.length).assertEqual(NumericVectorFactory.distinctCount(repeated));
      expect(uniqueValues).assertDeepEquals(base);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0123
     * @tc.name      testNumericMatrix0024
     * @tc.desc      Verify unique keeps the first occurrence order for an interleaved duplicate vector.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: number[] = NumericVectorFactory.ascending(FIVE, PRIMARY_START, PRIMARY_STEP);
      const interleaved: number[] = NumericVectorFactory.interleave(base, base);
      expect(interleaved.length).assertEqual(FIVE * TWO);
      expect(NumericVectorFactory.distinctCount(interleaved)).assertEqual(FIVE);
      const uniqueValues: number[] = ArrayUtils.unique<number>(interleaved);
      expect(uniqueValues.length).assertEqual(NumericVectorFactory.distinctCount(interleaved));
      expect(uniqueValues).assertDeepEquals(base);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0124
     * @tc.name      testNumericMatrix0025
     * @tc.desc      Verify unique collapses a constant vector to a single element.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.constant(TWELVE, CONSTANT_VALUE);
      const uniqueValues: number[] = ArrayUtils.unique<number>(values);
      expect(uniqueValues.length).assertEqual(ONE);
      expect(uniqueValues.length).assertEqual(NumericVectorFactory.distinctCount(values));
      expect(uniqueValues[0]).assertEqual(CONSTANT_VALUE);
      expect(ArrayUtils.sum(uniqueValues)).assertEqual(CONSTANT_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0125
     * @tc.name      testNumericMatrix0026
     * @tc.desc      Verify the mirrored distinct vector keeps the distinct cardinality of its source.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: number[] = NumericVectorFactory.ascending(EIGHT, PRIMARY_START, UNIQUE_FACTOR_B);
      const mirrored: number[] = NumericVectorFactory.mirror(source);
      expect(mirrored.length).assertEqual(source.length);
      expect(NumericVectorFactory.distinctCount(mirrored)).assertEqual(EIGHT);
      expect(ArrayUtils.unique<number>(mirrored).length).assertEqual(NumericVectorFactory.distinctCount(mirrored));
      // Mirroring reverses the sequence, so the first value becomes the last one.
      expect(mirrored[0]).assertEqual(source[source.length - 1]);
      expect(ArrayUtils.sum(mirrored)).assertEqual(ArrayUtils.sum(source));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0126
     * @tc.name      testNumericMatrix0027
     * @tc.desc      Verify the single cell matrix aggregates to its only element.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = singleCellMatrix();
      const flat: number[] = NumericVectorFactory.flatten(matrixCase.data);
      expect(flat.length).assertEqual(ONE);
      expect(ArrayUtils.sum(flat)).assertEqual(NumericVectorFactory.matrixTotalSum(MATRIX_SEED, ONE, ONE));
      expect(ArrayUtils.sum(matrixCase.data[0])).assertEqual(NumericVectorFactory.matrixRowSum(MATRIX_SEED, ONE, 0));
      expect(extractColumn(matrixCase.data, 0)[0]).assertEqual(NumericVectorFactory.matrixValue(MATRIX_SEED, ONE, 0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0127
     * @tc.name      testNumericMatrix0028
     * @tc.desc      Verify the flattened three by three matrix sums to its closed-form total.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = smallMatrix();
      const flat: number[] = NumericVectorFactory.flatten(matrixCase.data);
      expect(matrixCase.data.length).assertEqual(MATRIX_3_ROWS);
      expect(flat.length).assertEqual(MATRIX_3_ROWS * MATRIX_3_COLS);
      expect(ArrayUtils.sum(flat)).assertEqual(
        NumericVectorFactory.matrixTotalSum(MATRIX_SEED, MATRIX_3_ROWS, MATRIX_3_COLS));
      // The 3x3 row-major values 1..9 sum to 45.
      expect(ArrayUtils.sum(flat)).assertEqual(45);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0128
     * @tc.name      testNumericMatrix0029
     * @tc.desc      Verify every row sum of the three by three matrix equals matrixRowSum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = smallMatrix();
      for (let rowIndex: number = 0; rowIndex < matrixCase.rows; rowIndex++) {
        const rowSum: number = ArrayUtils.sum(matrixCase.data[rowIndex]);
        expect(rowSum).assertEqual(
          NumericVectorFactory.matrixRowSum(MATRIX_SEED, MATRIX_3_COLS, rowIndex));
      }
      // Rows of 1..9 grouped by three sum to 6, 15 and 24.
      expect(ArrayUtils.sum(matrixCase.data[0])).assertEqual(6);
      expect(ArrayUtils.sum(matrixCase.data[1])).assertEqual(15);
      expect(ArrayUtils.sum(matrixCase.data[TWO])).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0129
     * @tc.name      testNumericMatrix0030
     * @tc.desc      Verify every extracted column sum of the three by three matrix equals matrixColumnSum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = smallMatrix();
      for (let col: number = 0; col < matrixCase.cols; col++) {
        const column: number[] = extractColumn(matrixCase.data, col);
        expect(column.length).assertEqual(MATRIX_3_ROWS);
        expect(ArrayUtils.sum(column)).assertEqual(
          NumericVectorFactory.matrixColumnSum(MATRIX_SEED, MATRIX_3_ROWS, MATRIX_3_COLS, col));
      }
      // Columns of 1..9 grouped by stride three sum to 12, 15 and 18.
      expect(ArrayUtils.sum(extractColumn(matrixCase.data, 0))).assertEqual(12);
      expect(ArrayUtils.sum(extractColumn(matrixCase.data, 1))).assertEqual(15);
      expect(ArrayUtils.sum(extractColumn(matrixCase.data, TWO))).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0130
     * @tc.name      testNumericMatrix0031
     * @tc.desc      Verify the four by five matrix keeps row column and total closed-form sums consistent.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = rectangularMatrix();
      expect(matrixCase.data.length).assertEqual(MATRIX_4_ROWS);
      let rowSumTotal: number = 0;
      for (let rowIndex: number = 0; rowIndex < matrixCase.rows; rowIndex++) {
        const rowSum: number = ArrayUtils.sum(matrixCase.data[rowIndex]);
        expect(rowSum).assertEqual(
          NumericVectorFactory.matrixRowSum(MATRIX_SEED, MATRIX_4_COLS, rowIndex));
        rowSumTotal += rowSum;
      }
      let columnSumTotal: number = 0;
      for (let col: number = 0; col < matrixCase.cols; col++) {
        const columnSum: number = ArrayUtils.sum(extractColumn(matrixCase.data, col));
        expect(columnSum).assertEqual(
          NumericVectorFactory.matrixColumnSum(MATRIX_SEED, MATRIX_4_ROWS, MATRIX_4_COLS, col));
        columnSumTotal += columnSum;
      }
      const expectedTotal: number = NumericVectorFactory.matrixTotalSum(MATRIX_SEED, MATRIX_4_ROWS, MATRIX_4_COLS);
      expect(rowSumTotal).assertEqual(expectedTotal);
      expect(columnSumTotal).assertEqual(expectedTotal);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0131
     * @tc.name      testNumericMatrix0032
     * @tc.desc      Verify the ten by ten matrix flatten sum equals the closed-form total sum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = largeMatrix();
      const flat: number[] = NumericVectorFactory.flatten(matrixCase.data);
      expect(flat.length).assertEqual(MATRIX_10_ROWS * MATRIX_10_COLS);
      expect(ArrayUtils.sum(flat)).assertEqual(
        NumericVectorFactory.matrixTotalSum(MATRIX_SEED, MATRIX_10_ROWS, MATRIX_10_COLS));
      // A ten by ten row-major matrix seeded at one holds 1..100 and sums to 5050.
      expect(ArrayUtils.sum(flat)).assertEqual(5050);
      expect(ArrayUtils.minOrNull(flat)).assertEqual(MATRIX_SEED);
      expect(ArrayUtils.maxOrNull(flat)).assertEqual(MATRIX_10_ROWS * MATRIX_10_COLS);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0132
     * @tc.name      testNumericMatrix0033
     * @tc.desc      Verify every row and every column of the ten by ten matrix matches its closed form.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = largeMatrix();
      for (let rowIndex: number = 0; rowIndex < matrixCase.rows; rowIndex++) {
        expect(ArrayUtils.sum(matrixCase.data[rowIndex])).assertEqual(
          NumericVectorFactory.matrixRowSum(MATRIX_SEED, MATRIX_10_COLS, rowIndex));
      }
      for (let col: number = 0; col < matrixCase.cols; col++) {
        expect(ArrayUtils.sum(extractColumn(matrixCase.data, col))).assertEqual(
          NumericVectorFactory.matrixColumnSum(MATRIX_SEED, MATRIX_10_ROWS, MATRIX_10_COLS, col));
      }
      // The first row and the first column of a seeded matrix share the same first element.
      expect(matrixCase.data[0][0]).assertEqual(NumericVectorFactory.matrixValue(MATRIX_SEED, MATRIX_10_COLS, 0, 0));
      expect(matrixCase.data[0][0] === extractColumn(matrixCase.data, 0)[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0133
     * @tc.name      testNumericMatrix0034
     * @tc.desc      Verify the zero seeded matrix has a zero first element and the documented total sum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const data: number[][] = NumericVectorFactory.matrix(MATRIX_3_ROWS, MATRIX_3_COLS, MATRIX_SEED_ZERO);
      const flat: number[] = NumericVectorFactory.flatten(data);
      expect(data[0][0]).assertEqual(MATRIX_SEED_ZERO);
      expect(ArrayUtils.minOrNull(flat)).assertEqual(MATRIX_SEED_ZERO);
      expect(ArrayUtils.sum(flat)).assertEqual(
        NumericVectorFactory.matrixTotalSum(MATRIX_SEED_ZERO, MATRIX_3_ROWS, MATRIX_3_COLS));
      // Starting at zero, the 3x3 row-major matrix holds 0..8 and sums to 36.
      expect(ArrayUtils.sum(flat)).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0134
     * @tc.name      testNumericMatrix0035
     * @tc.desc      Verify a negative seeded matrix keeps the closed-form total sum and negative minimum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const data: number[][] = NumericVectorFactory.matrix(MATRIX_3_ROWS, MATRIX_3_COLS, MATRIX_SEED_NEGATIVE);
      const flat: number[] = NumericVectorFactory.flatten(data);
      expect(ArrayUtils.minOrNull(flat)).assertEqual(MATRIX_SEED_NEGATIVE);
      expect(ArrayUtils.sum(flat)).assertEqual(
        NumericVectorFactory.matrixTotalSum(MATRIX_SEED_NEGATIVE, MATRIX_3_ROWS, MATRIX_3_COLS));
      // Seeding at minus five yields -5..3, which still sums to the positive 3x3 total minus 54.
      expect(ArrayUtils.sum(flat)).assertEqual(45 - MATRIX_3_ROWS * MATRIX_3_COLS * SIX);
      expect(ArrayUtils.average(flat) !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0135
     * @tc.name      testNumericMatrix0036
     * @tc.desc      Verify every column of the wide seeded matrix matches its closed-form column sum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = wideMatrix();
      expect(matrixCase.data.length).assertEqual(MATRIX_WIDE_ROWS);
      let columnTotal: number = 0;
      for (let col: number = 0; col < matrixCase.cols; col++) {
        const column: number[] = extractColumn(matrixCase.data, col);
        expect(column.length).assertEqual(MATRIX_WIDE_ROWS);
        const columnSum: number = ArrayUtils.sum(column);
        expect(columnSum).assertEqual(
          NumericVectorFactory.matrixColumnSum(MATRIX_SEED_WIDE, MATRIX_WIDE_ROWS, MATRIX_WIDE_COLS, col));
        columnTotal += columnSum;
      }
      expect(columnTotal).assertEqual(
        NumericVectorFactory.matrixTotalSum(MATRIX_SEED_WIDE, MATRIX_WIDE_ROWS, MATRIX_WIDE_COLS));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0136
     * @tc.name      testNumericMatrix0037
     * @tc.desc      Verify the flattened matrix buckets reproduce the original row layout.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const matrixCase: MatrixCase = rectangularMatrix();
      const flat: number[] = NumericVectorFactory.flatten(matrixCase.data);
      const buckets: number[][] = NumericVectorFactory.buckets(flat, MATRIX_4_COLS);
      expect(buckets.length).assertEqual(MATRIX_4_ROWS);
      for (let rowIndex: number = 0; rowIndex < buckets.length; rowIndex++) {
        expect(buckets[rowIndex]).assertDeepEquals(matrixCase.data[rowIndex]);
        expect(ArrayUtils.sum(buckets[rowIndex])).assertEqual(
          NumericVectorFactory.matrixRowSum(MATRIX_SEED, MATRIX_4_COLS, rowIndex));
      }
      expect(totalChunkedElements(buckets)).assertEqual(flat.length);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0137
     * @tc.name      testNumericMatrix0038
     * @tc.desc      Verify buckets with a zero size produce no bucket at all.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumericMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumericMatrix0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const flat: number[] = NumericVectorFactory.ascending(TWELVE, PRIMARY_START, PRIMARY_STEP);
      const emptyBuckets: number[][] = NumericVectorFactory.buckets(flat, 0);
      expect(emptyBuckets.length).assertEqual(0);
      expect(totalChunkedElements(emptyBuckets)).assertEqual(0);
      expect(ArrayUtils.sum(flat)).assertEqual(NumericVectorFactory.arithmeticSum(TWELVE, PRIMARY_START, PRIMARY_STEP));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0138
     * @tc.name      testNumericMatrix0039
     * @tc.desc      Verify buckets of a partially filled tail keep the closed-form element total.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const flat: number[] = NumericVectorFactory.ascending(TEN, PRIMARY_START, PRIMARY_STEP);
      const buckets: number[][] = NumericVectorFactory.buckets(flat, CHUNK_SIZE_FOUR);
      expect(buckets.length).assertEqual(expectedChunkCount(TEN, CHUNK_SIZE_FOUR));
      expect(buckets.length).assertEqual(THREE);
      expect(buckets[0].length).assertEqual(CHUNK_SIZE_FOUR);
      expect(buckets[TWO].length).assertEqual(TWO);
      let bucketTotal: number = 0;
      for (const bucket of buckets) {
        bucketTotal += ArrayUtils.sum(bucket);
      }
      expect(bucketTotal).assertEqual(ArrayUtils.sum(flat));
      expect(bucketTotal).assertEqual(NumericVectorFactory.arithmeticSum(TEN, PRIMARY_START, PRIMARY_STEP));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0139
     * @tc.name      testNumericMatrix0040
     * @tc.desc      Verify countInRange equals the element wise NumberUtils.isInRange accumulation.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TWENTY, PRIMARY_START, PRIMARY_STEP);
      let probeCount: number = 0;
      for (const value of values) {
        if (NumberUtils.isInRange(value, RANGE_LOW, RANGE_HIGH)) {
          probeCount++;
        }
      }
      expect(probeCount).assertEqual(NumericVectorFactory.countInRange(values, RANGE_LOW, RANGE_HIGH));
      // 1..20 with the inclusive bounds 0..10 keeps the values 1..10.
      expect(probeCount).assertEqual(TEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0140
     * @tc.name      testNumericMatrix0041
     * @tc.desc      Verify countInRange agrees with the element wise probe for a negative range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.descending(TWENTY, PRIMARY_START, PRIMARY_STEP);
      let probeCount: number = 0;
      for (const value of values) {
        if (NumberUtils.isInRange(value, NEGATIVE_RANGE_LOW, NEGATIVE_RANGE_HIGH)) {
          probeCount++;
        }
      }
      expect(probeCount).assertEqual(
        NumericVectorFactory.countInRange(values, NEGATIVE_RANGE_LOW, NEGATIVE_RANGE_HIGH));
      // The descending run 1, 0, -1 down to -18 keeps the seven values -8..-2.
      expect(probeCount).assertEqual(SEVEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0141
     * @tc.name      testNumericMatrix0042
     * @tc.desc      Verify countInRange agrees with the element wise probe for the wide range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const flat: number[] = NumericVectorFactory.flatten(wideMatrix().data);
      let probeCount: number = 0;
      for (const value of flat) {
        if (NumberUtils.isInRange(value, WIDE_RANGE_LOW, WIDE_RANGE_HIGH)) {
          probeCount++;
        }
      }
      expect(probeCount).assertEqual(NumericVectorFactory.countInRange(flat, WIDE_RANGE_LOW, WIDE_RANGE_HIGH));
      expect(probeCount > 0).assertTrue();
      expect(probeCount <= flat.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0143
     * @tc.name      testNumericMatrix0043
     * @tc.desc      Verify a degenerate range counts only the exact hit and misses everything else.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TEN, PRIMARY_START, PRIMARY_STEP);
      // A range that collapses to the single point 5 hits exactly one element.
      expect(NumericVectorFactory.countInRange(values, FIVE, FIVE)).assertEqual(ONE);
      expect(NumericVectorFactory.countInRange(values, 0, 0)).assertEqual(0);
      // A swapped range contains nothing because the probe is an inclusive interval check.
      expect(NumericVectorFactory.countInRange(values, RANGE_HIGH, RANGE_LOW)).assertEqual(0);
      expect(NumberUtils.isInRange(FIVE, FIVE, FIVE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0144
     * @tc.name      testNumericMatrix0044
     * @tc.desc      Verify clamp keeps every element inside the requested inclusive range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TWENTY, PRIMARY_START, PRIMARY_STEP);
      const clamped: number[] = [];
      for (const value of values) {
        clamped.push(NumberUtils.clamp(value, RANGE_LOW, RANGE_HIGH));
      }
      expect(clamped.length).assertEqual(TWENTY);
      expect(allInsideRange(clamped, RANGE_LOW, RANGE_HIGH)).assertTrue();
      expect(ArrayUtils.minOrNull(clamped)).assertEqual(RANGE_LOW + 1);
      expect(ArrayUtils.maxOrNull(clamped)).assertEqual(RANGE_HIGH);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0145
     * @tc.name      testNumericMatrix0045
     * @tc.desc      Verify clamping a zigzag vector pins both tails to the requested bounds.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.zigzag(TEN, ZIGZAG_AMPLITUDE);
      const clamped: number[] = [];
      for (const value of values) {
        clamped.push(NumberUtils.clamp(value, -TWO, TWO));
      }
      expect(allInsideRange(clamped, -TWO, TWO)).assertTrue();
      expect(ArrayUtils.maxOrNull(clamped)).assertEqual(TWO);
      expect(ArrayUtils.minOrNull(clamped)).assertEqual(-TWO);
      expect(NumericVectorFactory.distinctCount(clamped)).assertEqual(TWO);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0146
     * @tc.name      testNumericMatrix0046
     * @tc.desc      Verify a swapped clamp range is normalized so the result still lands inside it.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TEN, PRIMARY_START, PRIMARY_STEP);
      const normalized: number[] = [];
      for (const value of values) {
        normalized.push(NumberUtils.clamp(value, RANGE_HIGH, RANGE_LOW));
      }
      expect(allInsideRange(normalized, RANGE_LOW, RANGE_HIGH)).assertTrue();
      expect(ArrayUtils.maxOrNull(normalized)).assertEqual(RANGE_HIGH);
      expect(ArrayUtils.minOrNull(normalized)).assertEqual(RANGE_LOW + 1);
      expect(NumericVectorFactory.countInRange(normalized, RANGE_LOW, RANGE_HIGH)).assertEqual(TEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0147
     * @tc.name      testNumericMatrix0047
     * @tc.desc      Verify a degenerate clamp range collapses every element to the single bound.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TWELVE, PRIMARY_START, PRIMARY_STEP);
      const collapsed: number[] = [];
      for (const value of values) {
        collapsed.push(NumberUtils.clamp(value, CONSTANT_VALUE, CONSTANT_VALUE));
      }
      expect(NumericVectorFactory.distinctCount(collapsed)).assertEqual(ONE);
      expect(ArrayUtils.minOrNull(collapsed)).assertEqual(CONSTANT_VALUE);
      expect(ArrayUtils.maxOrNull(collapsed)).assertEqual(CONSTANT_VALUE);
      expect(ArrayUtils.sum(collapsed)).assertEqual(NumericVectorFactory.constantSum(TWELVE, CONSTANT_VALUE));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0148
     * @tc.name      testNumericMatrix0048
     * @tc.desc      Verify toFixedString keeps the documented integer digit count for every value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.ascending(TEN, PRIMARY_START, PRIMARY_STEP);
      for (const value of values) {
        const text: string = NumberUtils.toFixedString(value, DIGITS_TWO);
        // Integer part digits plus the separator plus the requested fraction digits.
        const expectedLength: number = value.toString().length + ONE + DIGITS_TWO;
        expect(text.length).assertEqual(expectedLength);
        // No rounding happens for an integer with two extra digits.
        expect(text.split('.')[0]).assertEqual(value.toString());
        expect(text.endsWith('00')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0149
     * @tc.name      testNumericMatrix0049
     * @tc.desc      Verify toFixedString with zero digits emits the integer text only.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.multiples(TEN, MULTIPLE_FACTOR);
      for (const value of values) {
        const text: string = NumberUtils.toFixedString(value, DIGITS_ZERO);
        expect(text.length).assertEqual(value.toString().length);
        expect(text).assertEqual(value.toString());
        expect(text.indexOf('.')).assertEqual(-1);
      }
      expect(NumberUtils.toFixedString(MULTIPLE_FACTOR, DIGITS_THREE)).assertEqual('3.000');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0150
     * @tc.name      testNumericMatrix0050
     * @tc.desc      Verify toFixedString keeps the fraction width for every power vector element.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.powers(POWER_BASE, SIX);
      for (const value of values) {
        const text: string = NumberUtils.toFixedString(value, DIGITS_THREE);
        const expectedLength: number = value.toString().length + ONE + DIGITS_THREE;
        expect(text.length).assertEqual(expectedLength);
        expect(text.split('.')[1].length).assertEqual(DIGITS_THREE);
      }
      // The largest power of the fixture is exactly representable, so the text is stable.
      expect(NumberUtils.toFixedString(32, DIGITS_TWO)).assertEqual('32.00');
      expect(NumberUtils.toFixedString(32, DIGITS_ZERO)).assertEqual('32');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0151
     * @tc.name      testNumericMatrix0051
     * @tc.desc      Verify the primary combination reports the four closed-form metrics together.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumericMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumericMatrix0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vectorCase: VectorCase = { label: 'primary', count: TWENTY, start: PRIMARY_START, step: PRIMARY_STEP };
      const values: number[] = NumericVectorFactory.ascending(vectorCase.count, vectorCase.start, vectorCase.step);
      const closedForm: number = NumericVectorFactory.arithmeticSum(vectorCase.count, vectorCase.start, vectorCase.step);
      expect(ArrayUtils.sum(values)).assertEqual(closedForm);
      expect(isClose(ArrayUtils.average(values), closedForm / vectorCase.count)).assertTrue();
      expect(ArrayUtils.minOrNull(values)).assertEqual(NumericVectorFactory.minOf(values));
      expect(ArrayUtils.maxOrNull(values)).assertEqual(NumericVectorFactory.maxOf(values));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0152
     * @tc.name      testNumericMatrix0052
     * @tc.desc      Verify the combination matrix with count nine and step two keeps four closed-form metrics.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0052';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vectorCase: VectorCase = { label: 'step-two', count: NINE, start: PRIMARY_START, step: TWO };
      const values: number[] = NumericVectorFactory.ascending(vectorCase.count, vectorCase.start, vectorCase.step);
      const closedForm: number = NumericVectorFactory.arithmeticSum(vectorCase.count, vectorCase.start, vectorCase.step);
      expect(ArrayUtils.sum(values)).assertEqual(closedForm);
      expect(isClose(ArrayUtils.average(values), closedForm / vectorCase.count)).assertTrue();
      expect(ArrayUtils.minOrNull(values)).assertEqual(vectorCase.start);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(vectorCase.start + (vectorCase.count - ONE) * vectorCase.step);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0153
     * @tc.name      testNumericMatrix0053
     * @tc.desc      Verify the combination matrix with a negative start keeps four closed-form metrics.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0053';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vectorCase: VectorCase = { label: 'negative-start', count: SEVEN, start: -SIX, step: PRIMARY_STEP };
      const values: number[] = NumericVectorFactory.ascending(vectorCase.count, vectorCase.start, vectorCase.step);
      const closedForm: number = NumericVectorFactory.arithmeticSum(vectorCase.count, vectorCase.start, vectorCase.step);
      expect(ArrayUtils.sum(values)).assertEqual(closedForm);
      expect(isClose(ArrayUtils.average(values), closedForm / vectorCase.count)).assertTrue();
      expect(ArrayUtils.minOrNull(values)).assertEqual(NumericVectorFactory.minOf(values));
      expect(ArrayUtils.maxOrNull(values)).assertEqual(NumericVectorFactory.maxOf(values));
      expect(ArrayUtils.minOrNull(values)).assertEqual(-SIX);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0154
     * @tc.name      testNumericMatrix0054
     * @tc.desc      Verify the combination matrix with a large step keeps four closed-form metrics.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0054';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vectorCase: VectorCase = { label: 'large-step', count: FIVE, start: PRIMARY_START, step: SIXTEEN };
      const values: number[] = NumericVectorFactory.ascending(vectorCase.count, vectorCase.start, vectorCase.step);
      const closedForm: number = NumericVectorFactory.arithmeticSum(vectorCase.count, vectorCase.start, vectorCase.step);
      expect(ArrayUtils.sum(values)).assertEqual(closedForm);
      expect(isClose(ArrayUtils.average(values), closedForm / vectorCase.count)).assertTrue();
      expect(ArrayUtils.minOrNull(values)).assertEqual(vectorCase.start);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(vectorCase.start + (vectorCase.count - ONE) * vectorCase.step);
      expect(hasNoDuplicate(values)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0155
     * @tc.name      testNumericMatrix0055
     * @tc.desc      Verify the combination matrix with a single element keeps four closed-form metrics.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0055';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const vectorCase: VectorCase = { label: 'single', count: ONE, start: CONSTANT_VALUE, step: PRIMARY_STEP };
      const values: number[] = NumericVectorFactory.ascending(vectorCase.count, vectorCase.start, vectorCase.step);
      const closedForm: number = NumericVectorFactory.arithmeticSum(vectorCase.count, vectorCase.start, vectorCase.step);
      expect(values.length).assertEqual(ONE);
      expect(ArrayUtils.sum(values)).assertEqual(closedForm);
      expect(isClose(ArrayUtils.average(values), closedForm / vectorCase.count)).assertTrue();
      expect(ArrayUtils.minOrNull(values)).assertEqual(vectorCase.start);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(vectorCase.start);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0156
     * @tc.name      testNumericMatrix0056
     * @tc.desc      Verify the whole combination matrix keeps four closed-form metrics for every entry.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumericMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumericMatrix0056';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: VectorCase[] = [
        { label: 'primary', count: TWENTY, start: PRIMARY_START, step: PRIMARY_STEP },
        { label: 'step-two', count: NINE, start: PRIMARY_START, step: TWO },
        { label: 'negative-start', count: SEVEN, start: -SIX, step: PRIMARY_STEP },
        { label: 'large-step', count: FIVE, start: PRIMARY_START, step: SIXTEEN },
        { label: 'single', count: ONE, start: CONSTANT_VALUE, step: PRIMARY_STEP }
      ];
      expect(cases.length).assertEqual(FIVE);
      for (const vectorCase of cases) {
        const values: number[] = NumericVectorFactory.ascending(
          vectorCase.count, vectorCase.start, vectorCase.step);
        const closedForm: number = NumericVectorFactory.arithmeticSum(
          vectorCase.count, vectorCase.start, vectorCase.step);
        expect(ArrayUtils.sum(values)).assertEqual(closedForm);
        expect(isClose(ArrayUtils.average(values), closedForm / vectorCase.count)).assertTrue();
        expect(ArrayUtils.minOrNull(values)).assertEqual(NumericVectorFactory.minOf(values));
        expect(ArrayUtils.maxOrNull(values)).assertEqual(NumericVectorFactory.maxOf(values));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0157
     * @tc.name      testNumericMatrix0057
     * @tc.desc      Verify an empty vector aggregates to the documented neutral values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0057';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const empty: number[] = NumericVectorFactory.ascending(0, PRIMARY_START, PRIMARY_STEP);
      expect(empty.length).assertEqual(0);
      expect(ArrayUtils.sum(empty)).assertEqual(0);
      expect(ArrayUtils.average(empty)).assertEqual(0);
      expect(ArrayUtils.minOrNull(empty)).assertNull();
      expect(ArrayUtils.maxOrNull(empty)).assertNull();
      expect(ArrayUtils.unique<number>(empty).length).assertEqual(0);
      expect(NumericVectorFactory.distinctCount(empty)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0158
     * @tc.name      testNumericMatrix0058
     * @tc.desc      Verify a negative count yields an empty vector whose sum and in-range count are zero and whose min and max are null.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumericMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumericMatrix0058';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const negative: number[] = NumericVectorFactory.ascending(-THREE, PRIMARY_START, PRIMARY_STEP);
      expect(negative.length).assertEqual(0);
      expect(ArrayUtils.sum(negative)).assertEqual(0);
      expect(NumericVectorFactory.countInRange(negative, RANGE_LOW, RANGE_HIGH)).assertEqual(0);
      expect(NumericVectorFactory.maxOf(negative)).assertNull();
      expect(NumericVectorFactory.minOf(negative)).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0159
     * @tc.name      testNumericMatrix0059
     * @tc.desc      Verify the interleaved vector keeps the closed-form total of both source vectors.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0059';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: number[] = NumericVectorFactory.ascending(SIX, PRIMARY_START, PRIMARY_STEP);
      const second: number[] = NumericVectorFactory.primes(SIX);
      const interleaved: number[] = NumericVectorFactory.interleave(first, second);
      expect(interleaved.length).assertEqual(SIX * TWO);
      expect(ArrayUtils.sum(interleaved)).assertEqual(ArrayUtils.sum(first) + ArrayUtils.sum(second));
      expect(ArrayUtils.maxOrNull(interleaved)).assertEqual(NumericVectorFactory.maxOf(interleaved));
      expect(ArrayUtils.minOrNull(interleaved)).assertEqual(NumericVectorFactory.minOf(interleaved));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0160
     * @tc.name      testNumericMatrix0060
     * @tc.desc      Verify interleaving vectors of three and eight values keeps all eleven values, the combined sum and the extremes 1 and 27.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumericMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumericMatrix0060';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const shortVector: number[] = NumericVectorFactory.ascending(THREE, PRIMARY_START, PRIMARY_STEP);
      const longVector: number[] = NumericVectorFactory.ascending(EIGHT, DESCENDING_START, DESCENDING_STEP);
      const interleaved: number[] = NumericVectorFactory.interleave(shortVector, longVector);
      expect(interleaved.length).assertEqual(longVector.length + shortVector.length);
      expect(ArrayUtils.sum(interleaved)).assertEqual(ArrayUtils.sum(shortVector) + ArrayUtils.sum(longVector));
      // The maximum comes from the tail of the longer ascending vector.
      expect(ArrayUtils.maxOrNull(interleaved)).assertEqual(DESCENDING_START + EIGHT - 1);
      expect(ArrayUtils.minOrNull(interleaved)).assertEqual(PRIMARY_START);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0161
     * @tc.name      testNumericMatrix0061
     * @tc.desc      Verify repeatEach scales the closed-form sum by the repeat count.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericMatrix0061';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: number[] = NumericVectorFactory.ascending(EIGHT, PRIMARY_START, PRIMARY_STEP);
      const repeated: number[] = NumericVectorFactory.repeatEach(base, REPEAT_TIMES);
      expect(repeated.length).assertEqual(EIGHT * REPEAT_TIMES);
      expect(ArrayUtils.sum(repeated)).assertEqual(ArrayUtils.sum(base) * REPEAT_TIMES);
      expect(isClose(ArrayUtils.average(repeated), ArrayUtils.average(base))).assertTrue();
      expect(ArrayUtils.maxOrNull(repeated)).assertEqual(ArrayUtils.maxOrNull(base));
      expect(ArrayUtils.minOrNull(repeated)).assertEqual(ArrayUtils.minOrNull(base));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0162
     * @tc.name      testNumericMatrix0062
     * @tc.desc      Verify every matrix fixture reports the documented flatten length and total sum.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumericMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumericMatrix0062';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: MatrixCase[] = [singleCellMatrix(), smallMatrix(), rectangularMatrix(), largeMatrix()];
      expect(cases.length).assertEqual(FOUR);
      for (const matrixCase of cases) {
        const flat: number[] = NumericVectorFactory.flatten(matrixCase.data);
        expect(matrixCase.data.length).assertEqual(matrixCase.rows);
        expect(flat.length).assertEqual(matrixCase.rows * matrixCase.cols);
        expect(ArrayUtils.sum(flat)).assertEqual(
          NumericVectorFactory.matrixTotalSum(matrixCase.seed, matrixCase.rows, matrixCase.cols));
        expect(ArrayUtils.minOrNull(flat)).assertEqual(matrixCase.seed);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0163
     * @tc.name      testNumericMatrix0063
     * @tc.desc      Verify every matrix fixture reports consistent row and column closed-form sums.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumericMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumericMatrix0063';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: MatrixCase[] = [singleCellMatrix(), smallMatrix(), rectangularMatrix(), largeMatrix()];
      for (const matrixCase of cases) {
        let matrixRowTotal: number = 0;
        for (let rowIndex: number = 0; rowIndex < matrixCase.rows; rowIndex++) {
          const rowSum: number = ArrayUtils.sum(matrixCase.data[rowIndex]);
          expect(rowSum).assertEqual(
            NumericVectorFactory.matrixRowSum(matrixCase.seed, matrixCase.cols, rowIndex));
          matrixRowTotal += rowSum;
        }
        let matrixColumnTotal: number = 0;
        for (let col: number = 0; col < matrixCase.cols; col++) {
          const columnSum: number = ArrayUtils.sum(extractColumn(matrixCase.data, col));
          expect(columnSum).assertEqual(
            NumericVectorFactory.matrixColumnSum(matrixCase.seed, matrixCase.rows, matrixCase.cols, col));
          matrixColumnTotal += columnSum;
        }
        const expectedTotal: number =
          NumericVectorFactory.matrixTotalSum(matrixCase.seed, matrixCase.rows, matrixCase.cols);
        expect(matrixRowTotal).assertEqual(expectedTotal);
        expect(matrixColumnTotal).assertEqual(expectedTotal);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMMATRIX_0164
     * @tc.name      testNumericMatrix0064
     * @tc.desc      Verify the fibonacci family keeps min max and distinct counts independent of order.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumericMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumericMatrix0064';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: number[] = NumericVectorFactory.fibonacci(TEN);
      const mirrored: number[] = NumericVectorFactory.mirror(values);
      expect(ArrayUtils.sum(mirrored)).assertEqual(ArrayUtils.sum(values));
      expect(ArrayUtils.minOrNull(mirrored)).assertEqual(ArrayUtils.minOrNull(values));
      expect(ArrayUtils.maxOrNull(mirrored)).assertEqual(ArrayUtils.maxOrNull(values));
      // The first ten Fibonacci numbers are 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, so nine values are distinct.
      expect(NumericVectorFactory.distinctCount(values)).assertEqual(NINE);
      expect(ArrayUtils.unique<number>(values).length).assertEqual(NINE);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
