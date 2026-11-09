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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BasicUtil } from 'library';
import { NumericMatrixUtil } from './support/NumericMatrixUtil';
import { NumberPair } from './support/NumericMatrixUtil';
import { NumberTriple } from './support/NumericMatrixUtil';
import { NumericStats } from './support/NumericMatrixUtil';
import { NumericGridInfo } from './support/NumericMatrixUtil';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NumericMatrix]';

/**
 * Probe record describing the expected statistics of one numeric series.
 * Used by the statistics matrix case to compare every reducer at once.
 */
interface StatsExpectation {
  label: string;
  values: number[];
  count: number;
  sum: number;
  average: number;
  min: number;
  max: number;
  median: number;
  variance: number;
  stdDev: number;
}

/**
 * Probe record describing one cartesian2 product expectation.
 */
interface CartesianExpectation {
  label: string;
  a: number[];
  b: number[];
  expectedCount: number;
  firstPairFirst: number;
  firstPairSecond: number;
  lastPairFirst: number;
  lastPairSecond: number;
}

/**
 * Probe record describing one chunk expectation.
 */
interface ChunkExpectation {
  label: string;
  values: number[];
  size: number;
  expectedChunks: number;
  firstChunkLength: number;
  lastChunkLength: number;
}

/**
 * Probe record describing one grid expectation.
 */
interface GridExpectation {
  label: string;
  rows: number;
  cols: number;
  start: number;
  step: number;
  expectedRows: number;
  expectedCols: number;
  firstValue: number;
  lastValue: number;
}

/**
 * Probe record describing one boundaryValues expectation.
 */
interface BoundaryExpectation {
  label: string;
  center: number;
  span: number;
  steps: number;
  expectedLength: number;
  expectedFirst: number;
  expectedLast: number;
}

/**
 * Numeric series used by the statistics matrix. The first six entries are integers,
 * duplicated values and negatives, the last five are decimals and large magnitudes.
 */
const STATS_CASES: StatsExpectation[] = [
  { label: 'empty', values: [], count: 0, sum: 0, average: 0, min: 0, max: 0, median: 0, variance: 0, stdDev: 0 },
  { label: 'single', values: [7], count: 1, sum: 7, average: 7, min: 7, max: 7, median: 7, variance: 0, stdDev: 0 },
  { label: 'pair', values: [2, 4], count: 2, sum: 6, average: 3, min: 2, max: 4, median: 3, variance: 1, stdDev: 1 },
  { label: 'triple', values: [1, 2, 3], count: 3, sum: 6, average: 2, min: 1, max: 3, median: 2, variance: 2 / 3, stdDev: Math.sqrt(2 / 3) },
  { label: 'duplicate', values: [5, 5, 5, 5], count: 4, sum: 20, average: 5, min: 5, max: 5, median: 5, variance: 0, stdDev: 0 },
  { label: 'negative', values: [-4, -2, 0, 2, 4], count: 5, sum: 0, average: 0, min: -4, max: 4, median: 0, variance: 8, stdDev: Math.sqrt(8) },
  { label: 'evenCount', values: [1, 3, 5, 7], count: 4, sum: 16, average: 4, min: 1, max: 7, median: 4, variance: 5, stdDev: Math.sqrt(5) },
  { label: 'decimal', values: [0.5, 1.5, 2.5], count: 3, sum: 4.5, average: 1.5, min: 0.5, max: 2.5, median: 1.5, variance: 2 / 3, stdDev: Math.sqrt(2 / 3) },
  { label: 'mixedSign', values: [-10, 0, 10], count: 3, sum: 0, average: 0, min: -10, max: 10, median: 0, variance: 200 / 3, stdDev: Math.sqrt(200 / 3) },
  { label: 'largeValues', values: [1000000, 2000000, 3000000], count: 3, sum: 6000000, average: 2000000, min: 1000000, max: 3000000, median: 2000000, variance: 2000000000000 / 3, stdDev: Math.sqrt(2000000000000 / 3) },
  { label: 'symmetric', values: [-3, -1, 1, 3], count: 4, sum: 0, average: 0, min: -3, max: 3, median: 0, variance: 5, stdDev: Math.sqrt(5) }
];

/**
 * Cartesian product matrix used by the cartesian2 case.
 */
const CARTESIAN_CASES: CartesianExpectation[] = [
  { label: 'emptyFirst', a: [], b: [1, 2], expectedCount: 0, firstPairFirst: 0, firstPairSecond: 0, lastPairFirst: 0, lastPairSecond: 0 },
  { label: 'emptySecond', a: [1, 2], b: [], expectedCount: 0, firstPairFirst: 0, firstPairSecond: 0, lastPairFirst: 0, lastPairSecond: 0 },
  { label: 'single', a: [1], b: [2], expectedCount: 1, firstPairFirst: 1, firstPairSecond: 2, lastPairFirst: 1, lastPairSecond: 2 },
  { label: 'row', a: [0], b: [1, 2, 3], expectedCount: 3, firstPairFirst: 0, firstPairSecond: 1, lastPairFirst: 0, lastPairSecond: 3 },
  { label: 'column', a: [1, 2, 3], b: [9], expectedCount: 3, firstPairFirst: 1, firstPairSecond: 9, lastPairFirst: 3, lastPairSecond: 9 },
  { label: 'square', a: [1, 2], b: [3, 4], expectedCount: 4, firstPairFirst: 1, firstPairSecond: 3, lastPairFirst: 2, lastPairSecond: 4 },
  { label: 'negative', a: [-1, -2], b: [-3], expectedCount: 2, firstPairFirst: -1, firstPairSecond: -3, lastPairFirst: -2, lastPairSecond: -3 },
  { label: 'decimal', a: [0.5], b: [1.5, 2.5], expectedCount: 2, firstPairFirst: 0.5, firstPairSecond: 1.5, lastPairFirst: 0.5, lastPairSecond: 2.5 },
  { label: 'duplicate', a: [1, 1], b: [1], expectedCount: 2, firstPairFirst: 1, firstPairSecond: 1, lastPairFirst: 1, lastPairSecond: 1 }
];

/**
 * Chunk matrix covering valid, boundary and invalid sizes.
 */
const CHUNK_CASES: ChunkExpectation[] = [
  { label: 'emptyValues', values: [], size: 3, expectedChunks: 0, firstChunkLength: 0, lastChunkLength: 0 },
  { label: 'sizeZero', values: [1, 2, 3], size: 0, expectedChunks: 0, firstChunkLength: 0, lastChunkLength: 0 },
  { label: 'sizeNegative', values: [1, 2, 3], size: -2, expectedChunks: 0, firstChunkLength: 0, lastChunkLength: 0 },
  { label: 'sizeOne', values: [1, 2, 3], size: 1, expectedChunks: 3, firstChunkLength: 1, lastChunkLength: 1 },
  { label: 'exact', values: [1, 2, 3, 4], size: 2, expectedChunks: 2, firstChunkLength: 2, lastChunkLength: 2 },
  { label: 'remainder', values: [1, 2, 3, 4, 5], size: 2, expectedChunks: 3, firstChunkLength: 2, lastChunkLength: 1 },
  { label: 'oversize', values: [1, 2], size: 10, expectedChunks: 1, firstChunkLength: 2, lastChunkLength: 2 },
  { label: 'decimalSize', values: [1, 2, 3, 4], size: 1.8, expectedChunks: 4, firstChunkLength: 1, lastChunkLength: 1 },
  { label: 'negativeValues', values: [-1, -2, -3], size: 2, expectedChunks: 2, firstChunkLength: 2, lastChunkLength: 1 }
];

/**
 * Grid generator matrix covering valid shapes and invalid dimensions.
 */
const GRID_CASES: GridExpectation[] = [
  { label: 'zeroRows', rows: 0, cols: 3, start: 1, step: 1, expectedRows: 0, expectedCols: 0, firstValue: 0, lastValue: 0 },
  { label: 'zeroCols', rows: 3, cols: 0, start: 1, step: 1, expectedRows: 0, expectedCols: 0, firstValue: 0, lastValue: 0 },
  { label: 'negativeRows', rows: -2, cols: 2, start: 0, step: 1, expectedRows: 0, expectedCols: 0, firstValue: 0, lastValue: 0 },
  { label: 'singleCell', rows: 1, cols: 1, start: 5, step: 3, expectedRows: 1, expectedCols: 1, firstValue: 5, lastValue: 5 },
  { label: 'row', rows: 1, cols: 4, start: 0, step: 2, expectedRows: 1, expectedCols: 4, firstValue: 0, lastValue: 6 },
  { label: 'col', rows: 4, cols: 1, start: 10, step: -3, expectedRows: 4, expectedCols: 1, firstValue: 10, lastValue: 1 },
  { label: 'square', rows: 3, cols: 3, start: 1, step: 1, expectedRows: 3, expectedCols: 3, firstValue: 1, lastValue: 9 },
  { label: 'zeroStep', rows: 2, cols: 2, start: 7, step: 0, expectedRows: 2, expectedCols: 2, firstValue: 7, lastValue: 7 },
  { label: 'decimalStep', rows: 2, cols: 3, start: 0, step: 0.5, expectedRows: 2, expectedCols: 3, firstValue: 0, lastValue: 2.5 }
];

/**
 * Boundary sampler matrix covering invalid step counts and symmetric windows.
 */
const BOUNDARY_CASES: BoundaryExpectation[] = [
  { label: 'zeroSteps', center: 10, span: 5, steps: 0, expectedLength: 1, expectedFirst: 10, expectedLast: 10 },
  { label: 'oneStep', center: 10, span: 5, steps: 1, expectedLength: 1, expectedFirst: 10, expectedLast: 10 },
  { label: 'twoSteps', center: 10, span: 5, steps: 2, expectedLength: 2, expectedFirst: 5, expectedLast: 15 },
  { label: 'threeSteps', center: 10, span: 5, steps: 3, expectedLength: 3, expectedFirst: 5, expectedLast: 15 },
  { label: 'fiveSteps', center: 0, span: 4, steps: 5, expectedLength: 5, expectedFirst: -4, expectedLast: 4 },
  { label: 'zeroSpan', center: 3, span: 0, steps: 4, expectedLength: 4, expectedFirst: 3, expectedLast: 3 },
  { label: 'negativeCenter', center: -6, span: 2, steps: 3, expectedLength: 3, expectedFirst: -8, expectedLast: -4 },
  { label: 'decimalSpan', center: 2.5, span: 0.5, steps: 3, expectedLength: 3, expectedFirst: 2, expectedLast: 3 }
];

/**
 * Percent format matrix used when cross checking BasicUtil.formatPercent.
 */
interface PercentExpectation {
  ratio: number;
  digits: number;
  expected: string;
}

const PERCENT_CASES: PercentExpectation[] = [
  { ratio: 0, digits: 1, expected: '0.0%' },
  { ratio: 1, digits: 1, expected: '100.0%' },
  { ratio: 0.256, digits: 1, expected: '25.6%' },
  { ratio: 0.256, digits: 2, expected: '25.60%' },
  { ratio: 0.256, digits: 0, expected: '26%' },
  { ratio: 0.0001, digits: 3, expected: '0.010%' },
  { ratio: -0.5, digits: 1, expected: '-50.0%' },
  { ratio: 1.5, digits: 1, expected: '150.0%' },
  { ratio: 0.12345, digits: 4, expected: '12.3450%' },
  { ratio: 0.5, digits: 5, expected: '50.00000%' }
];

/**
 * Clamp matrix used when cross checking BasicUtil.clamp against the local numeric helpers.
 */
interface ClampExpectation {
  label: string;
  value: number;
  min: number;
  max: number;
  expected: number;
}

const CLAMP_CASES: ClampExpectation[] = [
  { label: 'inside', value: 5, min: 0, max: 10, expected: 5 },
  { label: 'below', value: -5, min: 0, max: 10, expected: 0 },
  { label: 'above', value: 15, min: 0, max: 10, expected: 10 },
  { label: 'onLower', value: 0, min: 0, max: 10, expected: 0 },
  { label: 'onUpper', value: 10, min: 0, max: 10, expected: 10 },
  { label: 'degenerate', value: 5, min: 3, max: 3, expected: 3 },
  { label: 'invertedRange', value: -100, min: 10, max: 0, expected: 0 },
  { label: 'negativeRange', value: -4, min: -10, max: -2, expected: -4 },
  { label: 'decimalValue', value: 0.555, min: 0, max: 1, expected: 0.555 },
  { label: 'decimalBounds', value: -0.25, min: -0.5, max: 0.5, expected: -0.25 },
  { label: 'largeValue', value: 1e12, min: 0, max: 1e6, expected: 1e6 }
];

export default function numericMatrixTest() {
  describe('NumericMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumericMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumericMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0100
     * @tc.name      testCartesian2Matrix0001
     * @tc.desc      Verify cartesian2 produces the full row-major product for empty, single,
     *               row, column, square, negative and decimal input matrices.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCartesian2Matrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCartesian2Matrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < CARTESIAN_CASES.length; i++) {
        const probe: CartesianExpectation = CARTESIAN_CASES[i];
        const pairs: NumberPair[] = NumericMatrixUtil.cartesian2(probe.a, probe.b);
        expect(pairs.length).assertEqual(probe.expectedCount);
        expect(pairs.length).assertEqual(probe.a.length * probe.b.length);
        // An empty side always collapses the product to zero elements.
        if (probe.expectedCount === 0) {
          expect(pairs.length).assertEqual(0);
          continue;
        }
        expect(pairs[0].first).assertEqual(probe.firstPairFirst);
        expect(pairs[0].second).assertEqual(probe.firstPairSecond);
        expect(pairs[pairs.length - 1].first).assertEqual(probe.lastPairFirst);
        expect(pairs[pairs.length - 1].second).assertEqual(probe.lastPairSecond);
        // The outer loop must walk the first array so blocks of b values stay together.
        expect(pairs[0].second).assertEqual(probe.b[0]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'cartesian2 ' + probe.label + ' size=' + pairs.length);
      }
      const emptyPairs: NumberPair[] = NumericMatrixUtil.cartesian2([], []);
      expect(emptyPairs.length).assertEqual(0);
      expect(NumericMatrixUtil.cartesian2([], [1, 2]).length).assertEqual(0);
      expect(NumericMatrixUtil.cartesian2([1, 2], []).length).assertEqual(0);
      expect(CARTESIAN_CASES.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0200
     * @tc.name      testCartesian2Order0001
     * @tc.desc      Verify cartesian2 emits pairs in a stable nested order so index i * bLength + j
     *               maps onto (a[i], b[j]).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCartesian2Order0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCartesian2Order0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const a: number[] = [10, 20, 30];
      const b: number[] = [1, 2, 3, 4];
      const pairs: NumberPair[] = NumericMatrixUtil.cartesian2(a, b);
      expect(pairs.length).assertEqual(12);
      for (let i = 0; i < a.length; i++) {
        for (let j = 0; j < b.length; j++) {
          const index: number = i * b.length + j;
          expect(pairs[index].first).assertEqual(a[i]);
          expect(pairs[index].second).assertEqual(b[j]);
        }
      }
      // Distinct first values must appear in exactly b.length sized blocks.
      expect(pairs[0].first).assertEqual(10);
      expect(pairs[3].first).assertEqual(10);
      expect(pairs[4].first).assertEqual(20);
      expect(pairs[11].first).assertEqual(30);
      expect(pairs[11].second).assertEqual(4);
      const sum: number[] = [];
      for (let i = 0; i < pairs.length; i++) {
        sum.push(pairs[i].first + pairs[i].second);
      }
      expect(NumericMatrixUtil.sum(sum)).assertEqual(270);
      // The second column of the product cycles through 1..4 for every first value.
      expect(pairs[0].second).assertEqual(1);
      expect(pairs[1].second).assertEqual(2);
      expect(pairs[2].second).assertEqual(3);
      expect(pairs[5].second).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0300
     * @tc.name      testCartesian3Matrix0001
     * @tc.desc      Verify cartesian3 expands three arrays in a-then-b-then-c order and collapses
     *               to zero elements whenever any array is empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCartesian3Matrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCartesian3Matrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const triples: NumberTriple[] = NumericMatrixUtil.cartesian3([1, 2], [3], [4, 5]);
      expect(triples.length).assertEqual(4);
      expect(triples[0].first).assertEqual(1);
      expect(triples[0].second).assertEqual(3);
      expect(triples[0].third).assertEqual(4);
      expect(triples[1].third).assertEqual(5);
      expect(triples[2].first).assertEqual(2);
      expect(triples[3].first).assertEqual(2);
      expect(triples[3].second).assertEqual(3);
      expect(triples[3].third).assertEqual(5);
      expect(NumericMatrixUtil.cartesian3([], [1], [1]).length).assertEqual(0);
      expect(NumericMatrixUtil.cartesian3([1], [], [1]).length).assertEqual(0);
      expect(NumericMatrixUtil.cartesian3([1], [1], []).length).assertEqual(0);
      expect(NumericMatrixUtil.cartesian3([], [], []).length).assertEqual(0);
      const cube: NumberTriple[] = NumericMatrixUtil.cartesian3([-1, 0, 1], [-1, 0, 1], [-1, 0, 1]);
      expect(cube.length).assertEqual(27);
      // The sum of every coordinate across a symmetric cube must cancel out.
      let total: number = 0;
      for (let i = 0; i < cube.length; i++) {
        total = total + cube[i].first + cube[i].second + cube[i].third;
      }
      expect(total).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0400
     * @tc.name      testFlattenMatrix0001
     * @tc.desc      Verify flatten concatenates rows in order including empty rows, ragged rows
     *               and single cell matrices.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFlattenMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFlattenMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumericMatrixUtil.flatten([]).length).assertEqual(0);
      expect(NumericMatrixUtil.flatten([[]]).length).assertEqual(0);
      expect(NumericMatrixUtil.flatten([[], []]).length).assertEqual(0);
      const single: number[] = NumericMatrixUtil.flatten([[7]]);
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual(7);
      const square: number[] = NumericMatrixUtil.flatten([[1, 2], [3, 4]]);
      expect(square.length).assertEqual(4);
      expect(square[0]).assertEqual(1);
      expect(square[1]).assertEqual(2);
      expect(square[2]).assertEqual(3);
      expect(square[3]).assertEqual(4);
      const ragged: number[] = NumericMatrixUtil.flatten([[1], [2, 3], [], [4, 5, 6]]);
      expect(ragged.length).assertEqual(6);
      expect(ragged[0]).assertEqual(1);
      expect(ragged[2]).assertEqual(3);
      expect(ragged[5]).assertEqual(6);
      const negative: number[] = NumericMatrixUtil.flatten([[-1, -2], [-3]]);
      expect(NumericMatrixUtil.minOf(negative)).assertEqual(-3);
      expect(NumericMatrixUtil.maxOf(negative)).assertEqual(-1);
      expect(NumericMatrixUtil.sum(negative)).assertEqual(-6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0500
     * @tc.name      testChunkMatrix0001
     * @tc.desc      Verify chunk splits arrays into fixed size slices with a shorter last slice
     *               and returns an empty list for invalid sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testChunkMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testChunkMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < CHUNK_CASES.length; i++) {
        const probe: ChunkExpectation = CHUNK_CASES[i];
        const chunks: number[][] = NumericMatrixUtil.chunk(probe.values, probe.size);
        expect(chunks.length).assertEqual(probe.expectedChunks);
        if (probe.expectedChunks === 0) {
          expect(chunks.length).assertEqual(0);
          continue;
        }
        expect(chunks[0].length).assertEqual(probe.firstChunkLength);
        expect(chunks[chunks.length - 1].length).assertEqual(probe.lastChunkLength);
        // Flattening the chunks must reproduce the source array unchanged.
        const rebuilt: number[] = NumericMatrixUtil.flatten(chunks);
        expect(rebuilt.length).assertEqual(probe.values.length);
        for (let j = 0; j < rebuilt.length; j++) {
          expect(rebuilt[j]).assertEqual(probe.values[j]);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'chunk ' + probe.label + ' chunks=' + chunks.length);
      }
      expect(NumericMatrixUtil.chunk([1, 2, 3], 0).length).assertEqual(0);
      expect(NumericMatrixUtil.chunk([1, 2, 3], -1).length).assertEqual(0);
      expect(NumericMatrixUtil.chunk([], 1).length).assertEqual(0);
      expect(NumericMatrixUtil.chunk([7], 1).length).assertEqual(1);
      expect(NumericMatrixUtil.chunk([7], 1)[0][0]).assertEqual(7);
      expect(NumericMatrixUtil.chunk([1, 2, 3], 5).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0600
     * @tc.name      testUniqueNumbersMatrix0001
     * @tc.desc      Verify uniqueNumbers keeps the first appearance order and handles duplicates,
     *               negatives, decimals and empty arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUniqueNumbersMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUniqueNumbersMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumericMatrixUtil.uniqueNumbers([]).length).assertEqual(0);
      expect(NumericMatrixUtil.uniqueNumbers([1]).length).assertEqual(1);
      const repeated: number[] = NumericMatrixUtil.uniqueNumbers([1, 1, 1, 1]);
      expect(repeated.length).assertEqual(1);
      expect(repeated[0]).assertEqual(1);
      const mixed: number[] = NumericMatrixUtil.uniqueNumbers([3, 1, 3, 2, 1, 5]);
      expect(mixed.length).assertEqual(4);
      expect(mixed[0]).assertEqual(3);
      expect(mixed[1]).assertEqual(1);
      expect(mixed[2]).assertEqual(2);
      expect(mixed[3]).assertEqual(5);
      const negative: number[] = NumericMatrixUtil.uniqueNumbers([-1, 0, -1, 0, 1]);
      expect(negative.length).assertEqual(3);
      expect(negative[0]).assertEqual(-1);
      expect(negative[2]).assertEqual(1);
      const decimal: number[] = NumericMatrixUtil.uniqueNumbers([0.5, 0.5, 1.5]);
      expect(decimal.length).assertEqual(2);
      expect(decimal[0]).assertEqual(0.5);
      const wide: number[] = [];
      for (let i = 0; i < 100; i++) {
        wide.push(i % 10);
      }
      expect(NumericMatrixUtil.uniqueNumbers(wide).length).assertEqual(10);
      expect(NumericMatrixUtil.uniqueNumbers(wide)[9]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0700
     * @tc.name      testSortMatrix0001
     * @tc.desc      Verify sortAscending and sortDescending use numeric comparison, never modify the
     *               source array and handle negatives, decimals and duplicates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSortMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSortMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: number[] = [10, 9, 100, 1, -5];
      const ascending: number[] = NumericMatrixUtil.sortAscending(source);
      const descending: number[] = NumericMatrixUtil.sortDescending(source);
      // Numeric ordering puts 9 before 10 while string ordering would not.
      expect(ascending[0]).assertEqual(-5);
      expect(ascending[1]).assertEqual(1);
      expect(ascending[2]).assertEqual(9);
      expect(ascending[3]).assertEqual(10);
      expect(ascending[4]).assertEqual(100);
      expect(descending[0]).assertEqual(100);
      expect(descending[4]).assertEqual(-5);
      // The source array must stay untouched because both helpers copy first.
      expect(source[0]).assertEqual(10);
      expect(source[4]).assertEqual(-5);
      expect(source.length).assertEqual(5);
      expect(NumericMatrixUtil.sortAscending([]).length).assertEqual(0);
      expect(NumericMatrixUtil.sortDescending([42])[0]).assertEqual(42);
      const decimal: number[] = NumericMatrixUtil.sortAscending([0.3, 0.1, 0.2]);
      expect(decimal[0]).assertEqual(0.1);
      expect(decimal[2]).assertEqual(0.3);
      const duplicates: number[] = NumericMatrixUtil.sortAscending([2, 2, 1, 1]);
      expect(duplicates.length).assertEqual(4);
      expect(duplicates[0]).assertEqual(1);
      expect(duplicates[3]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0800
     * @tc.name      testStatisticsMatrix0001
     * @tc.desc      Verify sum, average, minOf, maxOf, median, variance and stdDev agree with the
     *               expectation table across empty, duplicate, negative and decimal series.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStatisticsMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStatisticsMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < STATS_CASES.length; i++) {
        const probe: StatsExpectation = STATS_CASES[i];
        const values: number[] = probe.values;
        expect(values.length).assertEqual(probe.count);
        expect(NumericMatrixUtil.sum(values)).assertEqual(probe.sum);
        expect(NumericMatrixUtil.average(values)).assertEqual(probe.average);
        expect(NumericMatrixUtil.minOf(values)).assertEqual(probe.min);
        expect(NumericMatrixUtil.maxOf(values)).assertEqual(probe.max);
        expect(NumericMatrixUtil.median(values)).assertEqual(probe.median);
        // Variance and stdDev may differ in the last float bit, so compare with a tolerance.
        expect(Math.abs(NumericMatrixUtil.variance(values) - probe.variance) < 1e-9).assertTrue();
        expect(Math.abs(NumericMatrixUtil.stdDev(values) - probe.stdDev) < 1e-9).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'stats ' + probe.label + ' sum=' + probe.sum);
      }
      expect(NumericMatrixUtil.minOf([])).assertEqual(0);
      expect(NumericMatrixUtil.maxOf([])).assertEqual(0);
      expect(NumericMatrixUtil.median([])).assertEqual(0);
      expect(NumericMatrixUtil.variance([])).assertEqual(0);
      expect(NumericMatrixUtil.stdDev([])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_0900
     * @tc.name      testStatisticsConsistency0001
     * @tc.desc      Verify the reducer invariants min <= average <= max, stdDev squared equals variance
     *               and describe() mirrors the individual reducers on a large generated series.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStatisticsConsistency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStatisticsConsistency0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const large: number[] = [];
      for (let i = 0; i < 500; i++) {
        large.push((i % 37) - 18);
      }
      expect(large.length).assertEqual(500);
      const min: number = NumericMatrixUtil.minOf(large);
      const max: number = NumericMatrixUtil.maxOf(large);
      const average: number = NumericMatrixUtil.average(large);
      expect(min).assertEqual(-18);
      expect(max).assertEqual(18);
      expect(min <= average).assertTrue();
      expect(average <= max).assertTrue();
      const variance: number = NumericMatrixUtil.variance(large);
      const stdDev: number = NumericMatrixUtil.stdDev(large);
      expect(Math.abs(stdDev * stdDev - variance) < 1e-9).assertTrue();
      expect(variance > 0).assertTrue();
      // The overall sum must equal the sum of the per-bucket sums.
      let bucketTotal: number = 0;
      for (let b = -18; b <= 18; b++) {
        const bucket: number[] = NumericMatrixUtil.filterInRange(large, b, b);
        bucketTotal = bucketTotal + NumericMatrixUtil.sum(bucket);
      }
      expect(bucketTotal).assertEqual(NumericMatrixUtil.sum(large));
      const stats: NumericStats = NumericMatrixUtil.describe(large);
      expect(stats.count).assertEqual(500);
      expect(stats.sum).assertEqual(NumericMatrixUtil.sum(large));
      expect(stats.average).assertEqual(average);
      expect(stats.min).assertEqual(min);
      expect(stats.max).assertEqual(max);
      expect(stats.median).assertEqual(NumericMatrixUtil.median(large));
      expect(Math.abs(stats.variance - variance) < 1e-9).assertTrue();
      expect(Math.abs(stats.stdDev - stdDev) < 1e-9).assertTrue();
      const emptyStats: NumericStats = NumericMatrixUtil.describe([]);
      expect(emptyStats.count).assertEqual(0);
      expect(emptyStats.stdDev).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1000
     * @tc.name      testBoundaryValuesMatrix0001
     * @tc.desc      Verify boundaryValues returns a single center sample for invalid step counts and
     *               an evenly spaced window from center - span to center + span otherwise.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBoundaryValuesMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBoundaryValuesMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < BOUNDARY_CASES.length; i++) {
        const probe: BoundaryExpectation = BOUNDARY_CASES[i];
        const samples: number[] = NumericMatrixUtil.boundaryValues(probe.center, probe.span, probe.steps);
        expect(samples.length).assertEqual(probe.expectedLength);
        expect(Math.abs(samples[0] - probe.expectedFirst) < 1e-9).assertTrue();
        expect(Math.abs(samples[samples.length - 1] - probe.expectedLast) < 1e-9).assertTrue();
        // A center inside the window is always contained in the sample range.
        expect(samples[0] <= probe.center).assertTrue();
        expect(samples[samples.length - 1] >= probe.center).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'boundary ' + probe.label + ' len=' + samples.length);
      }
      const negativeSteps: number[] = NumericMatrixUtil.boundaryValues(5, 1, -3);
      expect(negativeSteps.length).assertEqual(1);
      expect(negativeSteps[0]).assertEqual(5);
      const five: number[] = NumericMatrixUtil.boundaryValues(0, 4, 5);
      expect(five[1]).assertEqual(-2);
      expect(five[2]).assertEqual(0);
      expect(five[3]).assertEqual(2);
      const monotonic: boolean = NumericMatrixUtil.isNonDecreasing(five);
      expect(monotonic).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1100
     * @tc.name      testGridOfNumbersMatrix0001
     * @tc.desc      Verify gridOfNumbers builds row-major grids with the requested shape and step,
     *               and returns an empty grid for non-positive or non-finite dimensions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGridOfNumbersMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGridOfNumbersMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < GRID_CASES.length; i++) {
        const probe: GridExpectation = GRID_CASES[i];
        const grid: number[][] = NumericMatrixUtil.gridOfNumbers(probe.rows, probe.cols, probe.start, probe.step);
        expect(grid.length).assertEqual(probe.expectedRows);
        if (probe.expectedRows === 0) {
          expect(grid.length).assertEqual(0);
          continue;
        }
        expect(grid[0].length).assertEqual(probe.expectedCols);
        expect(grid[0][0]).assertEqual(probe.firstValue);
        expect(grid[grid.length - 1][grid[grid.length - 1].length - 1]).assertEqual(probe.lastValue);
        // Flattened grid length must equal rows * cols.
        expect(NumericMatrixUtil.flatten(grid).length).assertEqual(probe.expectedRows * probe.expectedCols);
        hilog.info(DOMAIN, TAG, '%{public}s', 'grid ' + probe.label + ' rows=' + grid.length);
      }
      const grid: number[][] = NumericMatrixUtil.gridOfNumbers(3, 3, 1, 1);
      expect(grid[0][1]).assertEqual(2);
      expect(grid[1][0]).assertEqual(4);
      expect(grid[2][2]).assertEqual(9);
      expect(NumericMatrixUtil.rowSum(grid, 0)).assertEqual(6);
      expect(NumericMatrixUtil.columnSum(grid, 2)).assertEqual(18);
      expect(NumericMatrixUtil.isStrictlyAscending(NumericMatrixUtil.flatten(grid))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1200
     * @tc.name      testGridInfoMatrix0001
     * @tc.desc      Verify gridInfo clamps invalid dimensions to zero and reports the total cell count
     *               for valid shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGridInfoMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGridInfoMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negative: NumericGridInfo = NumericMatrixUtil.gridInfo(-3, 5);
      expect(negative.rows).assertEqual(0);
      expect(negative.cols).assertEqual(5);
      expect(negative.total).assertEqual(0);
      const zero: NumericGridInfo = NumericMatrixUtil.gridInfo(0, 0);
      expect(zero.total).assertEqual(0);
      const square: NumericGridInfo = NumericMatrixUtil.gridInfo(4, 4);
      expect(square.rows).assertEqual(4);
      expect(square.cols).assertEqual(4);
      expect(square.total).assertEqual(16);
      const wide: NumericGridInfo = NumericMatrixUtil.gridInfo(2, 7);
      expect(wide.total).assertEqual(14);
      const tall: NumericGridInfo = NumericMatrixUtil.gridInfo(9, 1);
      expect(tall.total).assertEqual(9);
      // The descriptor must match the materialized grid size.
      const grid: number[][] = NumericMatrixUtil.gridOfNumbers(square.rows, square.cols, 0, 1);
      expect(NumericMatrixUtil.flatten(grid).length).assertEqual(square.total);
      const infinite: NumericGridInfo = NumericMatrixUtil.gridInfo(Infinity, 2);
      expect(infinite.rows).assertEqual(0);
      expect(infinite.total).assertEqual(0);
      const nan: NumericGridInfo = NumericMatrixUtil.gridInfo(NaN, 3);
      expect(nan.rows).assertEqual(0);
      expect(nan.cols).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1300
     * @tc.name      testRangeHelpers0001
     * @tc.desc      Verify countInRange and filterInRange treat both bounds as inclusive and agree with
     *               each other for empty, negative and decimal ranges.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRangeHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRangeHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [-5, -1, 0, 1, 2, 3, 4, 5];
      expect(NumericMatrixUtil.countInRange(values, -1, 1)).assertEqual(3);
      expect(NumericMatrixUtil.countInRange(values, 0, 0)).assertEqual(1);
      expect(NumericMatrixUtil.countInRange(values, 10, 20)).assertEqual(0);
      expect(NumericMatrixUtil.countInRange([], 0, 10)).assertEqual(0);
      expect(NumericMatrixUtil.countInRange(values, -100, 100)).assertEqual(8);
      // Inverted bounds never match because the lower bound is checked first.
      expect(NumericMatrixUtil.countInRange(values, 4, 1)).assertEqual(0);
      const filtered: number[] = NumericMatrixUtil.filterInRange(values, -1, 2);
      expect(filtered.length).assertEqual(4);
      expect(filtered[0]).assertEqual(-1);
      expect(filtered[3]).assertEqual(2);
      expect(filtered.length).assertEqual(NumericMatrixUtil.countInRange(values, -1, 2));
      expect(NumericMatrixUtil.filterInRange(values, 100, 200).length).assertEqual(0);
      const decimal: number[] = [0.1, 0.2, 0.3, 0.4];
      const decimalFiltered: number[] = NumericMatrixUtil.filterInRange(decimal, 0.2, 0.3);
      expect(decimalFiltered.length).assertEqual(2);
      expect(decimalFiltered[1]).assertEqual(0.3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1400
     * @tc.name      testMatrixShapeHelpers0001
     * @tc.desc      Verify columnSum, rowSum and transpose handle out of bounds indexes, ragged rows
     *               and empty matrices without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMatrixShapeHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMatrixShapeHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const matrix: number[][] = [[1, 2, 3], [4, 5, 6]];
      expect(NumericMatrixUtil.rowSum(matrix, 0)).assertEqual(6);
      expect(NumericMatrixUtil.rowSum(matrix, 1)).assertEqual(15);
      expect(NumericMatrixUtil.rowSum(matrix, -1)).assertEqual(0);
      expect(NumericMatrixUtil.rowSum(matrix, 2)).assertEqual(0);
      expect(NumericMatrixUtil.rowSum([], 0)).assertEqual(0);
      expect(NumericMatrixUtil.columnSum(matrix, 0)).assertEqual(5);
      expect(NumericMatrixUtil.columnSum(matrix, 2)).assertEqual(9);
      expect(NumericMatrixUtil.columnSum(matrix, -1)).assertEqual(0);
      expect(NumericMatrixUtil.columnSum(matrix, 5)).assertEqual(0);
      const transposed: number[][] = NumericMatrixUtil.transpose(matrix);
      expect(transposed.length).assertEqual(3);
      expect(transposed[0].length).assertEqual(2);
      expect(transposed[0][0]).assertEqual(1);
      expect(transposed[0][1]).assertEqual(4);
      expect(transposed[2][1]).assertEqual(6);
      expect(NumericMatrixUtil.transpose([]).length).assertEqual(0);
      const ragged: number[][] = [[1], [2, 3], [4, 5, 6]];
      expect(NumericMatrixUtil.columnSum(ragged, 0)).assertEqual(7);
      const raggedTransposed: number[][] = NumericMatrixUtil.transpose(ragged);
      expect(raggedTransposed.length).assertEqual(3);
      expect(raggedTransposed[0].length).assertEqual(3);
      expect(raggedTransposed[2].length).assertEqual(1);
      expect(raggedTransposed[2][0]).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1500
     * @tc.name      testSequenceHelpers0001
     * @tc.desc      Verify rotateLeft normalizes negative and oversized distances, and that prefixSums
     *               and differences invert each other on a generated series.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSequenceHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSequenceHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [1, 2, 3, 4];
      const rotated: number[] = NumericMatrixUtil.rotateLeft(values, 1);
      expect(rotated[0]).assertEqual(2);
      expect(rotated[3]).assertEqual(1);
      const wrapped: number[] = NumericMatrixUtil.rotateLeft(values, 5);
      expect(wrapped[0]).assertEqual(2);
      expect(wrapped[3]).assertEqual(1);
      const backwards: number[] = NumericMatrixUtil.rotateLeft(values, -1);
      expect(backwards[0]).assertEqual(4);
      expect(backwards[1]).assertEqual(1);
      const full: number[] = NumericMatrixUtil.rotateLeft(values, 4);
      expect(full[0]).assertEqual(1);
      expect(full[3]).assertEqual(4);
      expect(NumericMatrixUtil.rotateLeft([], 3).length).assertEqual(0);
      expect(NumericMatrixUtil.rotateLeft([9], 7)[0]).assertEqual(9);
      const prefixes: number[] = NumericMatrixUtil.prefixSums(values);
      expect(prefixes.length).assertEqual(4);
      expect(prefixes[0]).assertEqual(1);
      expect(prefixes[1]).assertEqual(3);
      expect(prefixes[3]).assertEqual(10);
      expect(NumericMatrixUtil.prefixSums([]).length).assertEqual(0);
      const deltas: number[] = NumericMatrixUtil.differences(values);
      expect(deltas.length).assertEqual(3);
      expect(deltas[0]).assertEqual(1);
      expect(NumericMatrixUtil.differences([5]).length).assertEqual(0);
      expect(NumericMatrixUtil.differences([]).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1600
     * @tc.name      testScaleAndRound0001
     * @tc.desc      Verify scale multiplies every value and roundAll keeps the requested fraction digits
     *               while leaving the source arrays unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testScaleAndRound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testScaleAndRound0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: number[] = [1, 2, 3];
      const doubled: number[] = NumericMatrixUtil.scale(source, 2);
      expect(doubled.length).assertEqual(3);
      expect(doubled[0]).assertEqual(2);
      expect(doubled[2]).assertEqual(6);
      const zeroed: number[] = NumericMatrixUtil.scale(source, 0);
      expect(NumericMatrixUtil.sum(zeroed)).assertEqual(0);
      const negated: number[] = NumericMatrixUtil.scale(source, -1);
      expect(NumericMatrixUtil.sum(negated)).assertEqual(-6);
      expect(NumericMatrixUtil.scale([], 5).length).assertEqual(0);
      // The source array must stay untouched after scaling.
      expect(source[0]).assertEqual(1);
      const decimals: number[] = [1.2345, 2.3456, 3.4567];
      const twoDigits: number[] = NumericMatrixUtil.roundAll(decimals, 2);
      expect(twoDigits[0]).assertEqual(1.23);
      expect(twoDigits[1]).assertEqual(2.35);
      expect(twoDigits[2]).assertEqual(3.46);
      const noDigits: number[] = NumericMatrixUtil.roundAll(decimals, 0);
      expect(noDigits[0]).assertEqual(1);
      expect(noDigits[1]).assertEqual(2);
      expect(noDigits[2]).assertEqual(3);
      const negativeDigits: number[] = NumericMatrixUtil.roundAll([1.7], -2);
      expect(negativeDigits[0]).assertEqual(2);
      expect(decimals[0]).assertEqual(1.2345);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1700
     * @tc.name      testHistogram0001
     * @tc.desc      Verify histogram and bucketIndexOf place values into the expected buckets including
     *               values below the first edge and above the last edge.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistogram0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testHistogram0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const edges: number[] = [0, 10, 20];
      expect(NumericMatrixUtil.bucketIndexOf(-5, edges)).assertEqual(0);
      expect(NumericMatrixUtil.bucketIndexOf(0, edges)).assertEqual(1);
      expect(NumericMatrixUtil.bucketIndexOf(9, edges)).assertEqual(1);
      expect(NumericMatrixUtil.bucketIndexOf(10, edges)).assertEqual(2);
      expect(NumericMatrixUtil.bucketIndexOf(25, edges)).assertEqual(3);
      expect(NumericMatrixUtil.bucketIndexOf(1, [])).assertEqual(0);
      const counters: number[] = NumericMatrixUtil.histogram([-5, 0, 5, 10, 15, 25], edges);
      expect(counters.length).assertEqual(4);
      expect(counters[0]).assertEqual(1);
      expect(counters[1]).assertEqual(2);
      expect(counters[2]).assertEqual(2);
      expect(counters[3]).assertEqual(1);
      let total: number = 0;
      for (let i = 0; i < counters.length; i++) {
        total = total + counters[i];
      }
      expect(total).assertEqual(6);
      const emptyCounters: number[] = NumericMatrixUtil.histogram([], edges);
      expect(emptyCounters.length).assertEqual(4);
      expect(emptyCounters[0]).assertEqual(0);
      expect(NumericMatrixUtil.histogram([1, 2], []).length).assertEqual(1);
      expect(NumericMatrixUtil.histogram([1, 2], [])[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1800
     * @tc.name      testProgressionHelpers0001
     * @tc.desc      Verify arithmeticSequence and geometricSequence produce the expected terms and
     *               return empty arrays for non-positive counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testProgressionHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testProgressionHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const arithmetic: number[] = NumericMatrixUtil.arithmeticSequence(1, 3, 5);
      expect(arithmetic.length).assertEqual(5);
      expect(arithmetic[0]).assertEqual(1);
      expect(arithmetic[1]).assertEqual(4);
      expect(arithmetic[4]).assertEqual(13);
      expect(NumericMatrixUtil.sum(arithmetic)).assertEqual(35);
      expect(NumericMatrixUtil.isStrictlyAscending(arithmetic)).assertTrue();
      const descending: number[] = NumericMatrixUtil.arithmeticSequence(10, -2, 4);
      expect(descending[0]).assertEqual(10);
      expect(descending[3]).assertEqual(4);
      expect(NumericMatrixUtil.isStrictlyAscending(descending)).assertFalse();
      expect(NumericMatrixUtil.arithmeticSequence(0, 1, 0).length).assertEqual(0);
      expect(NumericMatrixUtil.arithmeticSequence(0, 1, -5).length).assertEqual(0);
      const geometric: number[] = NumericMatrixUtil.geometricSequence(1, 2, 5);
      expect(geometric.length).assertEqual(5);
      expect(geometric[0]).assertEqual(1);
      expect(geometric[2]).assertEqual(4);
      expect(geometric[4]).assertEqual(16);
      const halving: number[] = NumericMatrixUtil.geometricSequence(8, 0.5, 4);
      expect(halving[1]).assertEqual(4);
      expect(halving[3]).assertEqual(1);
      expect(NumericMatrixUtil.geometricSequence(1, 1, 3).length).assertEqual(3);
      expect(NumericMatrixUtil.geometricSequence(1, 2, 0).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_1900
     * @tc.name      testOrderingHelpers0001
     * @tc.desc      Verify isStrictlyAscending and isNonDecreasing distinguish strict from loose ordering
     *               and reject series shorter than two elements for the strict variant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOrderingHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testOrderingHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumericMatrixUtil.isStrictlyAscending([1, 2, 3])).assertTrue();
      expect(NumericMatrixUtil.isStrictlyAscending([1, 1, 2])).assertFalse();
      expect(NumericMatrixUtil.isStrictlyAscending([3, 2, 1])).assertFalse();
      expect(NumericMatrixUtil.isStrictlyAscending([1])).assertFalse();
      expect(NumericMatrixUtil.isStrictlyAscending([])).assertFalse();
      expect(NumericMatrixUtil.isNonDecreasing([1, 1, 2])).assertTrue();
      expect(NumericMatrixUtil.isNonDecreasing([1, 2, 2, 3])).assertTrue();
      expect(NumericMatrixUtil.isNonDecreasing([2, 1])).assertFalse();
      expect(NumericMatrixUtil.isNonDecreasing([])).assertFalse();
      expect(NumericMatrixUtil.isNonDecreasing([5])).assertTrue();
      const sorted: number[] = NumericMatrixUtil.sortAscending([4, -1, 7, 0]);
      expect(NumericMatrixUtil.isNonDecreasing(sorted)).assertTrue();
      const descending: number[] = NumericMatrixUtil.sortDescending([4, -1, 7, 0]);
      expect(NumericMatrixUtil.isNonDecreasing(descending)).assertFalse();
      expect(descending[0]).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_2000
     * @tc.name      testDecimateAndCombine0001
     * @tc.desc      Verify decimate samples every n-th value with a guarded stride, and combine makes
     *               element-wise pairs whose length is the shorter input length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDecimateAndCombine0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDecimateAndCombine0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      const everyTwo: number[] = NumericMatrixUtil.decimate(values, 2);
      expect(everyTwo.length).assertEqual(4);
      expect(everyTwo[0]).assertEqual(0);
      expect(everyTwo[1]).assertEqual(2);
      expect(everyTwo[3]).assertEqual(6);
      const everyThree: number[] = NumericMatrixUtil.decimate(values, 3);
      expect(everyThree.length).assertEqual(3);
      expect(everyThree[2]).assertEqual(6);
      // A stride below one is raised to one so no value is skipped silently.
      expect(NumericMatrixUtil.decimate(values, 0).length).assertEqual(8);
      expect(NumericMatrixUtil.decimate(values, -2).length).assertEqual(8);
      expect(NumericMatrixUtil.decimate([], 2).length).assertEqual(0);
      const added: number[] = NumericMatrixUtil.combine([1, 2, 3], [10, 20, 30], true);
      expect(added.length).assertEqual(3);
      expect(added[0]).assertEqual(11);
      expect(added[2]).assertEqual(33);
      const subtracted: number[] = NumericMatrixUtil.combine([1, 2, 3], [10, 20, 30], false);
      expect(subtracted[0]).assertEqual(-9);
      expect(subtracted[2]).assertEqual(-27);
      expect(NumericMatrixUtil.combine([1, 2], [1, 2, 3], true).length).assertEqual(2);
      expect(NumericMatrixUtil.combine([1, 2, 3], [1], true).length).assertEqual(1);
      expect(NumericMatrixUtil.combine([], [], true).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_2100
     * @tc.name      testIndexOfValue0001
     * @tc.desc      Verify indexOfValue reports every ascending index of a repeated value and an empty
     *               list when the value is absent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIndexOfValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIndexOfValue0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [4, 1, 4, 2, 4];
      const hits: number[] = NumericMatrixUtil.indexOfValue(values, 4);
      expect(hits.length).assertEqual(3);
      expect(hits[0]).assertEqual(0);
      expect(hits[1]).assertEqual(2);
      expect(hits[2]).assertEqual(4);
      expect(NumericMatrixUtil.indexOfValue(values, 1).length).assertEqual(1);
      expect(NumericMatrixUtil.indexOfValue(values, 1)[0]).assertEqual(1);
      expect(NumericMatrixUtil.indexOfValue(values, 9).length).assertEqual(0);
      expect(NumericMatrixUtil.indexOfValue([], 1).length).assertEqual(0);
      expect(NumericMatrixUtil.indexOfValue([7], 7)[0]).assertEqual(0);
      expect(NumericMatrixUtil.indexOfValue([-1, -1], -1).length).assertEqual(2);
      expect(NumericMatrixUtil.indexOfValue([0.5, 1.5], 0.5).length).assertEqual(1);
      const zeros: number[] = [];
      for (let i = 0; i < 20; i++) {
        zeros.push(i % 2 === 0 ? 0 : 1);
      }
      expect(NumericMatrixUtil.indexOfValue(zeros, 0).length).assertEqual(10);
      expect(NumericMatrixUtil.indexOfValue(zeros, 0)[9]).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_2200
     * @tc.name      testClampCrossCheck0001
     * @tc.desc      Verify BasicUtil.clamp matches the expected bounds matrix and agrees with the local
     *               sorting and range helpers on derived values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampCrossCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampCrossCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < CLAMP_CASES.length; i++) {
        const probe: ClampExpectation = CLAMP_CASES[i];
        const clamped: number = BasicUtil.clamp(probe.value, probe.min, probe.max);
        expect(clamped).assertEqual(probe.expected);
        // A clamped value can never escape the requested window.
        if (probe.min <= probe.max) {
          expect(clamped >= probe.min).assertTrue();
          expect(clamped <= probe.max).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'clamp ' + probe.label + '=' + clamped);
      }
      const values: number[] = [-20, -5, 0, 5, 20];
      const clampedValues: number[] = [];
      for (let i = 0; i < values.length; i++) {
        clampedValues.push(BasicUtil.clamp(values[i], -5, 5));
      }
      expect(clampedValues[0]).assertEqual(-5);
      expect(clampedValues[2]).assertEqual(0);
      expect(clampedValues[4]).assertEqual(5);
      expect(NumericMatrixUtil.minOf(clampedValues)).assertEqual(-5);
      expect(NumericMatrixUtil.maxOf(clampedValues)).assertEqual(5);
      expect(NumericMatrixUtil.countInRange(clampedValues, -5, 5)).assertEqual(5);
      expect(NumericMatrixUtil.sum(clampedValues.map((value: number): number => Math.abs(value))) <
        NumericMatrixUtil.sum(values.map((value: number): number => Math.abs(value)))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_2300
     * @tc.name      testRandomIntCrossCheck0001
     * @tc.desc      Verify BasicUtil.randomInt stays inside the inclusive range for many samples and
     *               degrades to the lower bound for degenerate or inverted ranges.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntCrossCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntCrossCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: number[] = [];
      for (let i = 0; i < 200; i++) {
        const value: number = BasicUtil.randomInt(1, 100);
        samples.push(value);
        expect(value >= 1).assertTrue();
        expect(value <= 100).assertTrue();
        expect(Math.floor(value)).assertEqual(value);
      }
      expect(samples.length).assertEqual(200);
      expect(NumericMatrixUtil.countInRange(samples, 1, 100)).assertEqual(200);
      expect(NumericMatrixUtil.countInRange(samples, -100, 0)).assertEqual(0);
      // Degenerate and inverted ranges collapse onto the lower bound of the pair.
      expect(BasicUtil.randomInt(7, 7)).assertEqual(7);
      expect(BasicUtil.randomInt(5, 1)).assertEqual(1);
      expect(BasicUtil.randomInt(-3, -3)).assertEqual(-3);
      const tiny: number[] = [];
      for (let i = 0; i < 50; i++) {
        tiny.push(BasicUtil.randomInt(0, 1));
      }
      expect(NumericMatrixUtil.countInRange(tiny, 0, 1)).assertEqual(50);
      expect(BasicUtil.isPositiveNumber(BasicUtil.randomInt(1, 9))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_2400
     * @tc.name      testPositiveNumberCrossCheck0001
     * @tc.desc      Verify BasicUtil.isPositiveNumber rejects zero, negatives, NaN and Infinity, and that
     *               the verdict matches the local min/max helpers on the same probe series.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPositiveNumberCrossCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPositiveNumberCrossCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isPositiveNumber(1)).assertTrue();
      expect(BasicUtil.isPositiveNumber(0.0001)).assertTrue();
      expect(BasicUtil.isPositiveNumber(1e9)).assertTrue();
      expect(BasicUtil.isPositiveNumber(0)).assertFalse();
      expect(BasicUtil.isPositiveNumber(-0.0001)).assertFalse();
      expect(BasicUtil.isPositiveNumber(-1e9)).assertFalse();
      expect(BasicUtil.isPositiveNumber(NaN)).assertFalse();
      expect(BasicUtil.isPositiveNumber(Infinity)).assertFalse();
      expect(BasicUtil.isPositiveNumber(-Infinity)).assertFalse();
      const probes: number[] = [-2, -0.5, 0, 0.5, 2];
      const accepted: number[] = NumericMatrixUtil.filterInRange(probes, Number.MIN_VALUE, Number.MAX_VALUE);
      expect(accepted.length).assertEqual(2);
      expect(accepted.length).assertEqual(NumericMatrixUtil.countInRange(probes, 0.0001, 100));
      expect(NumericMatrixUtil.maxOf(probes)).assertEqual(2);
      expect(BasicUtil.isPositiveNumber(NumericMatrixUtil.maxOf(probes))).assertTrue();
      expect(BasicUtil.isPositiveNumber(NumericMatrixUtil.minOf(probes))).assertFalse();
      // The average of a symmetric series is zero and must be rejected.
      expect(BasicUtil.isPositiveNumber(NumericMatrixUtil.average(probes))).assertFalse();
      expect(BasicUtil.isPositiveNumber(NumericMatrixUtil.average(accepted))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_2500
     * @tc.name      testFormatPercentCrossCheck0001
     * @tc.desc      Verify BasicUtil.formatPercent renders the ratio matrix with the requested fraction
     *               digits and that the parsed numeric part matches ratio * 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatPercentCrossCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatPercentCrossCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < PERCENT_CASES.length; i++) {
        const probe: PercentExpectation = PERCENT_CASES[i];
        const text: string = BasicUtil.formatPercent(probe.ratio, probe.digits);
        expect(text).assertEqual(probe.expected);
        // Every rendered value ends with the percent suffix.
        expect(text.charAt(text.length - 1)).assertEqual('%');
        const numericPart: number = Number(text.substring(0, text.length - 1));
        expect(Number.isNaN(numericPart)).assertFalse();
        expect(Math.abs(numericPart - probe.ratio * 100) < Math.pow(10, -probe.digits) / 2 + 1e-9).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'percent ' + probe.ratio + ' -> ' + text);
      }
      // Without an explicit digit count the helper keeps one fraction digit.
      expect(BasicUtil.formatPercent(0.5)).assertEqual('50.0%');
      expect(BasicUtil.formatPercent(0.5, 3)).assertEqual('50.000%');
      expect(BasicUtil.formatPercent(0.5, 0)).assertEqual('50%');
      // Ratios produced by the statistics helpers can be formatted directly.
      const ratio: number = NumericMatrixUtil.average([0.1, 0.3]);
      expect(Math.abs(ratio - 0.2) < 1e-9).assertTrue();
      expect(BasicUtil.formatPercent(ratio, 1)).assertEqual('20.0%');
      expect(BasicUtil.formatPercent(0.25)).assertEqual('25.0%');
      expect(BasicUtil.formatPercent(0.125, 2)).assertEqual('12.50%');
      expect(BasicUtil.formatPercent(0, 0)).assertEqual('0%');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMMAT_2600
     * @tc.name      testLargeMatrixAggregation0001
     * @tc.desc      Verify the matrix helpers stay consistent on a generated 40 x 25 grid covering row
     *               sums, column sums, flatten length and bucket histogram totals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLargeMatrixAggregation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLargeMatrixAggregation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const grid: number[][] = NumericMatrixUtil.gridOfNumbers(40, 25, 0, 1);
      expect(grid.length).assertEqual(40);
      expect(grid[0].length).assertEqual(25);
      const flat: number[] = NumericMatrixUtil.flatten(grid);
      expect(flat.length).assertEqual(1000);
      expect(flat[0]).assertEqual(0);
      expect(flat[999]).assertEqual(999);
      expect(NumericMatrixUtil.isStrictlyAscending(flat)).assertTrue();
      expect(NumericMatrixUtil.rowSum(grid, 0)).assertEqual(300);
      expect(NumericMatrixUtil.rowSum(grid, 39)).assertEqual(300 + 39 * 25 * 25);
      expect(NumericMatrixUtil.columnSum(grid, 0)).assertEqual(19500);
      expect(NumericMatrixUtil.columnSum(grid, 24)).assertEqual(20460);
      let rowTotal: number = 0;
      for (let r = 0; r < grid.length; r++) {
        rowTotal = rowTotal + NumericMatrixUtil.rowSum(grid, r);
      }
      expect(rowTotal).assertEqual(NumericMatrixUtil.sum(flat));
      const counters: number[] = NumericMatrixUtil.histogram(flat, [100, 500, 900]);
      expect(counters.length).assertEqual(4);
      let counterTotal: number = 0;
      for (let i = 0; i < counters.length; i++) {
        counterTotal = counterTotal + counters[i];
      }
      expect(counterTotal).assertEqual(1000);
      expect(counters[0]).assertEqual(100);
      expect(counters[3]).assertEqual(100);
      const chunks: number[][] = NumericMatrixUtil.chunk(flat, 250);
      expect(chunks.length).assertEqual(4);
      expect(chunks[3].length).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
