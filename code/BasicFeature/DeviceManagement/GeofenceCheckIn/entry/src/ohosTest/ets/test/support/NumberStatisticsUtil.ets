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
 * Pure numeric statistics helpers used by the statistics matrix suites.
 */
export class NumberStatisticsUtil {
  /**
   * Sum every value of the list.
   * @param values the values to sum
   * @returns the sum, or 0 for an empty list
   */
  public static total(values: number[]): number {
    let sum: number = 0;
    for (let i = 0; i < values.length; i++) {
      sum = sum + values[i];
    }
    return sum;
  }

  /**
   * Compute the arithmetic mean of the list.
   * @param values the values to average
   * @returns the mean, or 0 for an empty list
   */
  public static mean(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    return NumberStatisticsUtil.total(values) / values.length;
  }

  /**
   * Copy the list and sort it in ascending order with a bubble sort.
   * @param values the values to copy and sort
   * @returns a new ascending list
   */
  private static sortedCopy(values: number[]): number[] {
    const copy: number[] = [];
    for (let i = 0; i < values.length; i++) {
      copy.push(values[i]);
    }
    for (let i = 0; i < copy.length; i++) {
      for (let j = 0; j < copy.length - 1 - i; j++) {
        if (copy[j] > copy[j + 1]) {
          const swap: number = copy[j];
          copy[j] = copy[j + 1];
          copy[j + 1] = swap;
        }
      }
    }
    return copy;
  }

  /**
   * Compute the median of the list without changing the input order.
   * @param values the values whose median is computed
   * @returns the median, or 0 for an empty list
   */
  public static median(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const sorted: number[] = NumberStatisticsUtil.sortedCopy(values);
    const middle: number = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 1) {
      return sorted[middle];
    }
    return (sorted[middle - 1] + sorted[middle]) / 2;
  }

  /**
   * Find the most frequent value, preferring the smallest value on ties.
   * @param values the values whose mode is computed
   * @returns the mode, or 0 for an empty list
   */
  public static mode(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let bestValue: number = values[0];
    let bestCount: number = 0;
    for (let i = 0; i < values.length; i++) {
      let count: number = 0;
      for (let j = 0; j < values.length; j++) {
        if (values[j] === values[i]) {
          count = count + 1;
        }
      }
      if (count > bestCount || (count === bestCount && values[i] < bestValue)) {
        bestValue = values[i];
        bestCount = count;
      }
    }
    return bestValue;
  }

  /**
   * Compute the difference between the largest and smallest value.
   * @param values the values whose range is computed
   * @returns the range, or 0 for an empty list
   */
  public static range(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    return NumberStatisticsUtil.maxValue(values) - NumberStatisticsUtil.minValue(values);
  }

  /**
   * Find the smallest value of the list.
   * @param values the values to scan
   * @returns the smallest value, or 0 for an empty list
   */
  public static minValue(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let result: number = values[0];
    for (let i = 1; i < values.length; i++) {
      if (values[i] < result) {
        result = values[i];
      }
    }
    return result;
  }

  /**
   * Find the largest value of the list.
   * @param values the values to scan
   * @returns the largest value, or 0 for an empty list
   */
  public static maxValue(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let result: number = values[0];
    for (let i = 1; i < values.length; i++) {
      if (values[i] > result) {
        result = values[i];
      }
    }
    return result;
  }

  /**
   * Compute the population variance of the list.
   * @param values the values whose population variance is computed
   * @returns the variance, or 0 for an empty list
   */
  public static variance(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const average: number = NumberStatisticsUtil.mean(values);
    let sum: number = 0;
    for (let i = 0; i < values.length; i++) {
      const diff: number = values[i] - average;
      sum = sum + diff * diff;
    }
    return sum / values.length;
  }

  /**
   * Compute the population standard deviation of the list.
   * @param values the values whose standard deviation is computed
   * @returns the standard deviation, or 0 for an empty list
   */
  public static stdDev(values: number[]): number {
    return Math.sqrt(NumberStatisticsUtil.variance(values));
  }

  /**
   * Compute a nearest rank percentile without changing the input order.
   * @param values the values to scan
   * @param percent the requested percentile from 0 to 100
   * @returns the percentile value, or 0 for an empty list
   */
  public static percentile(values: number[], percent: number): number {
    if (values.length === 0) {
      return 0;
    }
    let safePercent: number = percent;
    if (safePercent < 0) {
      safePercent = 0;
    }
    if (safePercent > 100) {
      safePercent = 100;
    }
    const sorted: number[] = NumberStatisticsUtil.sortedCopy(values);
    let rank: number = Math.ceil(safePercent / 100 * sorted.length);
    if (rank < 1) {
      rank = 1;
    }
    if (rank > sorted.length) {
      rank = sorted.length;
    }
    return sorted[rank - 1];
  }

  /**
   * Count how many values are strictly greater than the threshold.
   * @param values the values to scan
   * @param threshold the exclusive lower bound
   * @returns the number of values above the threshold
   */
  public static countAbove(values: number[], threshold: number): number {
    let count: number = 0;
    for (let i = 0; i < values.length; i++) {
      if (values[i] > threshold) {
        count = count + 1;
      }
    }
    return count;
  }

  /**
   * Count how many values are strictly smaller than the threshold.
   * @param values the values to scan
   * @param threshold the exclusive upper bound
   * @returns the number of values below the threshold
   */
  public static countBelow(values: number[], threshold: number): number {
    let count: number = 0;
    for (let i = 0; i < values.length; i++) {
      if (values[i] < threshold) {
        count = count + 1;
      }
    }
    return count;
  }

  /**
   * Count distinct values without changing the input order.
   * @param values the values to scan
   * @returns the number of distinct values
   */
  public static distinctCount(values: number[]): number {
    const seen: number[] = [];
    for (let i = 0; i < values.length; i++) {
      if (seen.indexOf(values[i]) < 0) {
        seen.push(values[i]);
      }
    }
    return seen.length;
  }

  /**
   * Scale every value into the closed range from 0 to 1.
   * A constant list maps to zeros.
   * @param values the values to normalize
   * @returns a new normalized list
   */
  public static normalize(values: number[]): number[] {
    const result: number[] = [];
    if (values.length === 0) {
      return result;
    }
    const low: number = NumberStatisticsUtil.minValue(values);
    const high: number = NumberStatisticsUtil.maxValue(values);
    if (high === low) {
      for (let i = 0; i < values.length; i++) {
        result.push(0);
      }
      return result;
    }
    for (let i = 0; i < values.length; i++) {
      result.push((values[i] - low) / (high - low));
    }
    return result;
  }
}
