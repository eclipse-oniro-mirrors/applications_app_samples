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

import { BluetoothConstants } from '../../constants/BluetoothConstants';

/**
 * math utility class
 * provides number study calculate relative relate actual use method method
 */
export class MathUtils {
  /**
   * clamp the value within the specified range
   * @param value - input value
   * @param min - min value
   * @param max - max value
   * @returns limit control after value
   */
  static clamp(value: number, min: number, max: number): number {
    return Math.min(Math.max(value, min), max);
  }

  /**
   * linear interpolation
   * @param start - start value
   * @param end - end value
   * @param t - interpolation factor (0-1)
   * @returns interpolation result
   */
  static lerp(start: number, end: number, t: number): number {
    return start + (end - start) * MathUtils.clamp(t, 0, 1);
  }

  /**
   * calculate average
   * @param values - number array
   * @returns average
   */
  static average(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i: number = 0; i < values.length; i++) {
      sum += values[i];
    }
    return sum / values.length;
  }

  /**
   * calculate median
   * @param values - number array
   * @returns median
   */
  static median(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const sorted: number[] = [...values].sort((a: number, b: number) => a - b);
    const mid: number = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 0) {
      return (sorted[mid - 1] + sorted[mid]) / 2;
    }
    return sorted[mid];
  }

  /**
   * calculate standard deviation
   * @param values - number array
   * @returns standard deviation
   */
  static standardDeviation(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const avg: number = MathUtils.average(values);
    let sumSquares: number = 0;
    for (let i: number = 0; i < values.length; i++) {
      const diff: number = values[i] - avg;
      sumSquares += diff * diff;
    }
    return Math.sqrt(sumSquares / values.length);
  }

  /**
   * calculate percentage
   * @param value - current value
   * @param total - total value
   * @returns percentage (0-100)
   */
  static percentage(value: number, total: number): number {
    if (total === 0) {
      return 0;
    }
    return MathUtils.clamp(Math.round((value / total) * 100), 0, 100);
  }

  /**
   * will RSSI convert for distance estimate (meter)
   * use log-distance path loss model
   * @param rssi - RSSI value (dBm)
   * @param txPower - transmit power (dBm), default -59
   * @param pathLossExponent - path loss exponent, default 2.0
   * @returns estimated distance (meter)
   */
  static rssiToDistance(rssi: number, txPower: number = -59, pathLossExponent: number = 2.0): number {
    if (rssi === 0) {
      return -1;
    }
    const ratio: number = (rssi - txPower) / (10 * pathLossExponent);
    return Math.pow(10, ratio);
  }

  /**
   * will RSSI convert for signal quality percentage
   * @param rssi - RSSI value
   * @returns signal quality (0-100)
   */
  static rssiToQuality(rssi: number): number {
    if (rssi <= -100) {
      return 0;
    }
    if (rssi >= -50) {
      return 100;
    }
    return 2 * (rssi + 100);
  }

  /**
   * calculate Euclidean distance between two points
   * @param x1 - point 1 x coordinate
   * @param y1 - point 1 y coordinate
   * @param x2 - point 2 x coordinate
   * @param y2 - point 2 y coordinate
   * @returns distance distance
   */
  static distance(x1: number, y1: number, x2: number, y2: number): number {
    return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
  }

  /**
   * generate specified range range internal random integer
   * @param min - min value (package contain)
   * @param max - max value (package contain)
   * @returns random integer
   */
  static randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  /**
   * generate specified range range internal random float
   * @param min - min value
   * @param max - max value
   * @returns random float
   */
  static randomFloat(min: number, max: number): number {
    return Math.random() * (max - min) + min;
  }

  /**
   * round to the specified decimals
   * @param value - want house in value
   * @param decimals - number of digits after the decimal point
   * @returns house in after value
   */
  static roundTo(value: number, decimals: number): number {
    const factor: number = Math.pow(10, decimals);
    return Math.round(value * factor) / factor;
  }

  /**
   * check value whether at specified range range internal (package contain edge interface)
   * @param value - want check value
   * @param min - min value
   * @param max - max value
   * @returns whether at range range internal
   */
  static inRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  /**
   * calculate greatest common divisor
   * @param a - th one number
   * @param b - th second number
   * @returns greatest common divisor
   */
  static gcd(a: number, b: number): number {
    a = Math.abs(a);
    b = Math.abs(b);
    while (b !== 0) {
      const temp: number = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  /**
   * calculate least common multiple
   * @param a - th one number
   * @param b - th second number
   * @returns least common multiple
   */
  static lcm(a: number, b: number): number {
    if (a === 0 || b === 0) {
      return 0;
    }
    return Math.abs(a * b) / MathUtils.gcd(a, b);
  }
}
