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

/**
 * Numeric grid description used by matrix generators inside the test support layer.
 * The width is the number of columns, the height is the number of rows.
 */
export interface NumericGridInfo {
  rows: number;
  cols: number;
  total: number;
}

/**
 * Simple statistics bundle computed from one numeric series.
 * Every field is a plain number so it can be compared with assertEqual directly.
 */
export interface NumericStats {
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
 * Pair of numbers produced by the cartesian helpers.
 * Wrapped in a class because ArkTS rejects tuple style literals in most positions.
 */
export class NumberPair {
  public first: number = 0;
  public second: number = 0;

  constructor(first: number, second: number) {
    this.first = first;
    this.second = second;
  }
}

/**
 * Triple of numbers produced by the cartesian helpers.
 */
export class NumberTriple {
  public first: number = 0;
  public second: number = 0;
  public third: number = 0;

  constructor(first: number, second: number, third: number) {
    this.first = first;
    this.second = second;
    this.third = third;
  }
}

/**
 * Pure numeric matrix and statistics helper used only by the ohosTest support layer.
 *
 * Contract summary (kept stable so the tests can assert exact values):
 * - Every method is a pure function, no shared mutable state is touched.
 * - Empty input arrays return 0 for numeric reducers (sum/average/min/max/median/variance/stdDev).
 * - `chunk` with a non-positive or non-finite size returns an empty list.
 * - `boundaryValues` with fewer than 1 step returns a single element holding the center value.
 * - `gridOfNumbers` with a non-positive row or column count returns an empty list.
 */
export class NumericMatrixUtil {
  /**
   * Build the cartesian product of two numeric arrays.
   * @param a the first numeric array, may be empty
   * @param b the second numeric array, may be empty
   * @returns every pair (first from a, second from b) in row-major order; empty when either side is empty
   */
  public static cartesian2(a: number[], b: number[]): NumberPair[] {
    const result: NumberPair[] = [];
    // Iterate the first array in the outer loop to keep a stable row-major order.
    for (let i = 0; i < a.length; i++) {
      for (let j = 0; j < b.length; j++) {
        result.push(new NumberPair(a[i], b[j]));
      }
    }
    return result;
  }

  /**
   * Build the cartesian product of three numeric arrays.
   * @param a the first numeric array
   * @param b the second numeric array
   * @param c the third numeric array
   * @returns every triple in a-then-b-then-c order; empty when any side is empty
   */
  public static cartesian3(a: number[], b: number[], c: number[]): NumberTriple[] {
    const result: NumberTriple[] = [];
    for (let i = 0; i < a.length; i++) {
      for (let j = 0; j < b.length; j++) {
        for (let k = 0; k < c.length; k++) {
          result.push(new NumberTriple(a[i], b[j], c[k]));
        }
      }
    }
    return result;
  }

  /**
   * Flatten a two dimensional numeric matrix into one array.
   * @param matrix the matrix to flatten, rows may have different lengths
   * @returns all numbers in row-major order; empty when the matrix or all rows are empty
   */
  public static flatten(matrix: number[][]): number[] {
    const result: number[] = [];
    for (let i = 0; i < matrix.length; i++) {
      const row: number[] = matrix[i];
      for (let j = 0; j < row.length; j++) {
        result.push(row[j]);
      }
    }
    return result;
  }

  /**
   * Split one numeric array into fixed size chunks.
   * @param values the array to split
   * @param size the chunk size, must be a positive integer
   * @returns the chunks in order, the last chunk may be shorter; empty when size is invalid or values is empty
   */
  public static chunk(values: number[], size: number): number[][] {
    // Reject non-positive and non-finite sizes so the loop always advances.
    if (!Number.isFinite(size) || size < 1) {
      return [];
    }
    const step: number = Math.floor(size);
    const result: number[][] = [];
    let cursor: number = 0;
    while (cursor < values.length) {
      // Copy one slice so the caller array is never aliased by the result.
      const slice: number[] = [];
      for (let i = cursor; i < cursor + step && i < values.length; i++) {
        slice.push(values[i]);
      }
      result.push(slice);
      cursor = cursor + step;
    }
    return result;
  }

  /**
   * Remove duplicated numbers and keep the first appearance order.
   * @param values the array to deduplicate
   * @returns distinct numbers in their original order; empty when values is empty
   */
  public static uniqueNumbers(values: number[]): number[] {
    const result: number[] = [];
    for (let i = 0; i < values.length; i++) {
      if (result.indexOf(values[i]) >= 0) {
        continue;
      }
      result.push(values[i]);
    }
    return result;
  }

  /**
   * Sort numbers ascending with the default numeric comparison.
   * @param values the array to sort, it is not modified in place
   * @returns a new ascending array; empty when values is empty
   */
  public static sortAscending(values: number[]): number[] {
    const copy: number[] = values.slice();
    copy.sort((left: number, right: number): number => left - right);
    return copy;
  }

  /**
   * Sort numbers descending with the default numeric comparison.
   * @param values the array to sort, it is not modified in place
   * @returns a new descending array; empty when values is empty
   */
  public static sortDescending(values: number[]): number[] {
    const copy: number[] = values.slice();
    copy.sort((left: number, right: number): number => right - left);
    return copy;
  }

  /**
   * Add all numbers of one array together.
   * @param values the array to reduce
   * @returns the arithmetic sum, or 0 for an empty array
   */
  public static sum(values: number[]): number {
    let total: number = 0;
    for (let i = 0; i < values.length; i++) {
      total = total + values[i];
    }
    return total;
  }

  /**
   * Compute the arithmetic mean of one array.
   * @param values the array to reduce
   * @returns the mean value, or 0 for an empty array
   */
  public static average(values: number[]): number {
    // The empty case is defined as 0 so callers never see NaN.
    if (values.length === 0) {
      return 0;
    }
    return NumericMatrixUtil.sum(values) / values.length;
  }

  /**
   * Find the smallest number of one array.
   * @param values the array to scan
   * @returns the minimum value, or 0 for an empty array
   */
  public static minOf(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let current: number = values[0];
    for (let i = 1; i < values.length; i++) {
      if (values[i] < current) {
        current = values[i];
      }
    }
    return current;
  }

  /**
   * Find the largest number of one array.
   * @param values the array to scan
   * @returns the maximum value, or 0 for an empty array
   */
  public static maxOf(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let current: number = values[0];
    for (let i = 1; i < values.length; i++) {
      if (values[i] > current) {
        current = values[i];
      }
    }
    return current;
  }

  /**
   * Compute the median of one array with linear interpolation for even counts.
   * @param values the array to reduce, it is not modified in place
   * @returns the median value, or 0 for an empty array
   */
  public static median(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const sorted: number[] = NumericMatrixUtil.sortAscending(values);
    const middle: number = Math.floor(sorted.length / 2);
    // An odd count maps directly onto the middle element.
    if (sorted.length % 2 === 1) {
      return sorted[middle];
    }
    // An even count averages the two middle elements.
    return (sorted[middle - 1] + sorted[middle]) / 2;
  }

  /**
   * Compute the population variance of one array around its average.
   * @param values the array to reduce
   * @returns the variance, or 0 for an empty array
   */
  public static variance(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const mean: number = NumericMatrixUtil.average(values);
    let accumulator: number = 0;
    for (let i = 0; i < values.length; i++) {
      const delta: number = values[i] - mean;
      accumulator = accumulator + delta * delta;
    }
    return accumulator / values.length;
  }

  /**
   * Compute the population standard deviation of one array.
   * @param values the array to reduce
   * @returns the standard deviation, or 0 for an empty array
   */
  public static stdDev(values: number[]): number {
    return Math.sqrt(NumericMatrixUtil.variance(values));
  }

  /**
   * Build an evenly spaced set of boundary samples around a center value.
   * The result always starts at center - span and ends at center + span when steps >= 2.
   * @param center the middle value of the sampling window
   * @param span the half width of the sampling window, may be zero
   * @param steps the number of samples, values below 1 collapse to a single center sample
   * @returns the sample list, never empty
   */
  public static boundaryValues(center: number, span: number, steps: number): number[] {
    // A single sample cannot move away from the center value.
    if (!Number.isFinite(steps) || steps < 2) {
      return [center];
    }
    const count: number = Math.floor(steps);
    const result: number[] = [];
    const stride: number = (span * 2) / (count - 1);
    for (let i = 0; i < count; i++) {
      // Build every value from the center to avoid accumulating float error.
      result.push(center - span + stride * i);
    }
    return result;
  }

  /**
   * Generate a row-major grid of numbers starting at start with a fixed step.
   * @param rows the number of rows, must be a positive integer
   * @param cols the number of columns, must be a positive integer
   * @param start the first value placed at row 0 column 0
   * @param step the increment applied to each following cell
   * @returns the grid; empty when rows or cols is not a positive finite number
   */
  public static gridOfNumbers(rows: number, cols: number, start: number, step: number): number[][] {
    // Invalid dimensions collapse to an empty grid instead of throwing.
    if (!Number.isFinite(rows) || !Number.isFinite(cols) || rows < 1 || cols < 1) {
      return [];
    }
    const rowCount: number = Math.floor(rows);
    const colCount: number = Math.floor(cols);
    const result: number[][] = [];
    let cursor: number = start;
    for (let i = 0; i < rowCount; i++) {
      const row: number[] = [];
      for (let j = 0; j < colCount; j++) {
        row.push(cursor);
        cursor = cursor + step;
      }
      result.push(row);
    }
    return result;
  }

  /**
   * Describe a grid shape without materializing it.
   * @param rows the row count
   * @param cols the column count
   * @returns a shape descriptor whose total is rows * cols, both clamped at 0 for invalid input
   */
  public static gridInfo(rows: number, cols: number): NumericGridInfo {
    // Negative dimensions are not meaningful, so clamp them to zero.
    const safeRows: number = Number.isFinite(rows) && rows > 0 ? Math.floor(rows) : 0;
    const safeCols: number = Number.isFinite(cols) && cols > 0 ? Math.floor(cols) : 0;
    const info: NumericGridInfo = {
      rows: safeRows,
      cols: safeCols,
      total: safeRows * safeCols
    };
    return info;
  }

  /**
   * Count how many values fall inside the inclusive range [low, high].
   * @param values the array to scan
   * @param low the inclusive lower bound
   * @param high the inclusive upper bound
   * @returns the number of values inside the range, 0 for an empty array
   */
  public static countInRange(values: number[], low: number, high: number): number {
    let count: number = 0;
    for (let i = 0; i < values.length; i++) {
      const item: number = values[i];
      if (item >= low && item <= high) {
        count = count + 1;
      }
    }
    return count;
  }

  /**
   * Keep only the values that fall inside the inclusive range [low, high].
   * @param values the array to filter
   * @param low the inclusive lower bound
   * @param high the inclusive upper bound
   * @returns a new filtered array keeping the original order
   */
  public static filterInRange(values: number[], low: number, high: number): number[] {
    const result: number[] = [];
    for (let i = 0; i < values.length; i++) {
      const item: number = values[i];
      if (item >= low && item <= high) {
        result.push(item);
      }
    }
    return result;
  }

  /**
   * Sum one column of a rectangular matrix.
   * @param matrix the matrix to scan, short rows simply contribute fewer values
   * @param column the zero based column index
   * @returns the column sum, or 0 when the matrix is empty or the column index is negative
   */
  public static columnSum(matrix: number[][], column: number): number {
    if (column < 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < matrix.length; i++) {
      const row: number[] = matrix[i];
      if (column < row.length) {
        total = total + row[column];
      }
    }
    return total;
  }

  /**
   * Sum one row of a matrix.
   * @param matrix the matrix to scan
   * @param rowIndex the zero based row index
   * @returns the row sum, or 0 when the index is out of bounds
   */
  public static rowSum(matrix: number[][], rowIndex: number): number {
    if (rowIndex < 0 || rowIndex >= matrix.length) {
      return 0;
    }
    return NumericMatrixUtil.sum(matrix[rowIndex]);
  }

  /**
   * Transpose a rectangular matrix.
   * @param matrix the matrix to transpose, rows may have different lengths
   * @returns the transposed matrix; empty when the matrix itself is empty
   */
  public static transpose(matrix: number[][]): number[][] {
    if (matrix.length === 0) {
      return [];
    }
    // The widest row decides how many output rows are produced.
    let widest: number = 0;
    for (let i = 0; i < matrix.length; i++) {
      if (matrix[i].length > widest) {
        widest = matrix[i].length;
      }
    }
    const result: number[][] = [];
    for (let c = 0; c < widest; c++) {
      const row: number[] = [];
      for (let r = 0; r < matrix.length; r++) {
        if (c < matrix[r].length) {
          row.push(matrix[r][c]);
        }
      }
      result.push(row);
    }
    return result;
  }

  /**
   * Rotate a numeric sequence left by the requested distance.
   * @param values the sequence to rotate
   * @param distance how many positions to shift left, larger than the length wraps around
   * @returns a new rotated array; empty when values is empty
   */
  public static rotateLeft(values: number[], distance: number): number[] {
    if (values.length === 0) {
      return [];
    }
    // Normalize the distance so negative and oversized values behave predictably.
    const length: number = values.length;
    let offset: number = Math.floor(distance) % length;
    if (offset < 0) {
      offset = offset + length;
    }
    const result: number[] = [];
    for (let i = 0; i < length; i++) {
      result.push(values[(i + offset) % length]);
    }
    return result;
  }

  /**
   * Build the running totals of one sequence.
   * @param values the sequence to accumulate
   * @returns the prefix sums; empty when values is empty
   */
  public static prefixSums(values: number[]): number[] {
    const result: number[] = [];
    let total: number = 0;
    for (let i = 0; i < values.length; i++) {
      total = total + values[i];
      result.push(total);
    }
    return result;
  }

  /**
   * Build the difference between neighbouring values of one sequence.
   * @param values the sequence to differentiate
   * @returns the deltas, one shorter than the input; empty when fewer than 2 values exist
   */
  public static differences(values: number[]): number[] {
    if (values.length < 2) {
      return [];
    }
    const result: number[] = [];
    for (let i = 1; i < values.length; i++) {
      result.push(values[i] - values[i - 1]);
    }
    return result;
  }

  /**
   * Scale every value of one sequence by a factor.
   * @param values the sequence to scale
   * @param factor the multiplier
   * @returns a new scaled array; empty when values is empty
   */
  public static scale(values: number[], factor: number): number[] {
    const result: number[] = [];
    for (let i = 0; i < values.length; i++) {
      result.push(values[i] * factor);
    }
    return result;
  }

  /**
   * Round every value of one sequence to a fixed number of fraction digits.
   * @param values the sequence to round
   * @param digits fraction digits to keep, negative values are treated as 0
   * @returns a new rounded array; empty when values is empty
   */
  public static roundAll(values: number[], digits: number): number[] {
    const safeDigits: number = digits > 0 ? Math.floor(digits) : 0;
    const factor: number = Math.pow(10, safeDigits);
    const result: number[] = [];
    for (let i = 0; i < values.length; i++) {
      result.push(Math.round(values[i] * factor) / factor);
    }
    return result;
  }

  /**
   * Build a full statistics bundle for one numeric series in a single pass over the data.
   * @param values the series to describe
   * @returns the statistics bundle, every field is 0 when the series is empty
   */
  public static describe(values: number[]): NumericStats {
    const stats: NumericStats = {
      count: values.length,
      sum: NumericMatrixUtil.sum(values),
      average: NumericMatrixUtil.average(values),
      min: NumericMatrixUtil.minOf(values),
      max: NumericMatrixUtil.maxOf(values),
      median: NumericMatrixUtil.median(values),
      variance: NumericMatrixUtil.variance(values),
      stdDev: NumericMatrixUtil.stdDev(values)
    };
    return stats;
  }

  /**
   * Compute the exclusive upper bound of a value inside a bucket ladder.
   * @param value the value to bucket
   * @param edges the sorted bucket edges, assumed ascending
   * @returns the index of the first edge greater than the value, or the edge count when none matches
   */
  public static bucketIndexOf(value: number, edges: number[]): number {
    for (let i = 0; i < edges.length; i++) {
      if (value < edges[i]) {
        return i;
      }
    }
    return edges.length;
  }

  /**
   * Count how many values fall into each bucket defined by ascending edges.
   * Every value below the first edge lands in bucket 0, values above the last edge land in the final bucket.
   * @param values the values to bucket
   * @param edges the ascending bucket edges
   * @returns the bucket counters, the length equals edges.length + 1
   */
  public static histogram(values: number[], edges: number[]): number[] {
    const counters: number[] = [];
    // One extra counter is needed for values above the highest edge.
    for (let i = 0; i <= edges.length; i++) {
      counters.push(0);
    }
    for (let i = 0; i < values.length; i++) {
      const index: number = NumericMatrixUtil.bucketIndexOf(values[i], edges);
      counters[index] = counters[index] + 1;
    }
    return counters;
  }

  /**
   * Build an arithmetic progression starting at start.
   * @param start the first value of the sequence
   * @param step the difference between neighbouring values
   * @param count the number of values, values below 1 produce an empty sequence
   * @returns the arithmetic progression; empty when count is below 1 or not finite
   */
  public static arithmeticSequence(start: number, step: number, count: number): number[] {
    if (!Number.isFinite(count) || count < 1) {
      return [];
    }
    const total: number = Math.floor(count);
    const result: number[] = [];
    for (let i = 0; i < total; i++) {
      result.push(start + step * i);
    }
    return result;
  }

  /**
   * Build a geometric progression starting at start.
   * @param start the first value of the sequence
   * @param ratio the multiplier between neighbouring values
   * @param count the number of values, values below 1 produce an empty sequence
   * @returns the geometric progression; empty when count is below 1 or not finite
   */
  public static geometricSequence(start: number, ratio: number, count: number): number[] {
    if (!Number.isFinite(count) || count < 1) {
      return [];
    }
    const total: number = Math.floor(count);
    const result: number[] = [];
    let current: number = start;
    for (let i = 0; i < total; i++) {
      result.push(current);
      current = current * ratio;
    }
    return result;
  }

  /**
   * Check whether a numeric series is strictly ascending.
   * @param values the series to check
   * @returns true when every value is greater than its predecessor, false for series shorter than 2
   */
  public static isStrictlyAscending(values: number[]): boolean {
    if (values.length < 2) {
      return false;
    }
    for (let i = 1; i < values.length; i++) {
      if (values[i] <= values[i - 1]) {
        return false;
      }
    }
    return true;
  }

  /**
   * Check whether a numeric series is non-decreasing.
   * @param values the series to check
   * @returns true when every value is greater than or equal to its predecessor, false for an empty series
   */
  public static isNonDecreasing(values: number[]): boolean {
    if (values.length === 0) {
      return false;
    }
    for (let i = 1; i < values.length; i++) {
      if (values[i] < values[i - 1]) {
        return false;
      }
    }
    return true;
  }

  /**
   * Pick every n-th value of a sequence.
   * @param values the sequence to sample
   * @param stride the sampling stride, values below 1 are treated as 1
   * @returns the sampled values starting from index 0; empty when values is empty
   */
  public static decimate(values: number[], stride: number): number[] {
    const step: number = Number.isFinite(stride) && stride >= 1 ? Math.floor(stride) : 1;
    const result: number[] = [];
    for (let i = 0; i < values.length; i = i + step) {
      result.push(values[i]);
    }
    return result;
  }

  /**
   * Aggregate two numeric series index by index with a binary operator result.
   * @param left the first series
   * @param right the second series
   * @param add true to add the values, false to subtract right from left
   * @returns the combined series whose length is the shorter input length
   */
  public static combine(left: number[], right: number[], add: boolean): number[] {
    const length: number = left.length < right.length ? left.length : right.length;
    const result: number[] = [];
    for (let i = 0; i < length; i++) {
      result.push(add ? left[i] + right[i] : left[i] - right[i]);
    }
    return result;
  }

  /**
   * Build the index of every occurrence of a value inside a sequence.
   * @param values the sequence to scan
   * @param target the value to locate
   * @returns the ascending index list, empty when the value is absent
   */
  public static indexOfValue(values: number[], target: number): number[] {
    const result: number[] = [];
    for (let i = 0; i < values.length; i++) {
      if (values[i] === target) {
        result.push(i);
      }
    }
    return result;
  }
}
