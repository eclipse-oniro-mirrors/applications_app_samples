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
 * 数学工具类
 * 提供数学计算相关的实用方法
 */
export class MathUtils {
  /**
   * 将值限制在指定范围内
   * @param value - 输入值
   * @param min - 最小值
   * @param max - 最大值
   * @returns 限制后的值
   */
  static clamp(value: number, min: number, max: number): number {
    return Math.min(Math.max(value, min), max);
  }

  /**
   * 线性插值
   * @param start - 起始值
   * @param end - 结束值
   * @param t - 插值因子 (0-1)
   * @returns 插值结果
   */
  static lerp(start: number, end: number, t: number): number {
    return start + (end - start) * MathUtils.clamp(t, 0, 1);
  }

  /**
   * 计算平均值
   * @param values - 数值数组
   * @returns 平均值
   */
  static average(values: number[]): number {
    if (values.length === 0) return 0;
    let sum: number = 0;
    for (let i: number = 0; i < values.length; i++) {
      sum += values[i];
    }
    return sum / values.length;
  }

  /**
   * 计算中位数
   * @param values - 数值数组
   * @returns 中位数
   */
  static median(values: number[]): number {
    if (values.length === 0) return 0;
    const sorted: number[] = [...values].sort((a: number, b: number) => a - b);
    const mid: number = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 0) {
      return (sorted[mid - 1] + sorted[mid]) / 2;
    }
    return sorted[mid];
  }

  /**
   * 计算标准差
   * @param values - 数值数组
   * @returns 标准差
   */
  static standardDeviation(values: number[]): number {
    if (values.length === 0) return 0;
    const avg: number = MathUtils.average(values);
    let sumSquares: number = 0;
    for (let i: number = 0; i < values.length; i++) {
      const diff: number = values[i] - avg;
      sumSquares += diff * diff;
    }
    return Math.sqrt(sumSquares / values.length);
  }

  /**
   * 计算百分比
   * @param value - 当前值
   * @param total - 总值
   * @returns 百分比 (0-100)
   */
  static percentage(value: number, total: number): number {
    if (total === 0) return 0;
    return MathUtils.clamp(Math.round((value / total) * 100), 0, 100);
  }

  /**
   * 将RSSI转换为距离估算（米）
   * 使用对数距离路径损耗模型
   * @param rssi - RSSI值 (dBm)
   * @param txPower - 发射功率 (dBm)，默认-59
   * @param pathLossExponent - 路径损耗指数，默认2.0
   * @returns 估算距离（米）
   */
  static rssiToDistance(rssi: number, txPower: number = -59, pathLossExponent: number = 2.0): number {
    if (rssi === 0) return -1;
    const ratio: number = (rssi - txPower) / (10 * pathLossExponent);
    return Math.pow(10, ratio);
  }

  /**
   * 将RSSI转换为信号质量百分比
   * @param rssi - RSSI值
   * @returns 信号质量 (0-100)
   */
  static rssiToQuality(rssi: number): number {
    if (rssi <= -100) return 0;
    if (rssi >= -50) return 100;
    return 2 * (rssi + 100);
  }

  /**
   * 计算两个点之间的欧几里得距离
   * @param x1 - 点1的x坐标
   * @param y1 - 点1的y坐标
   * @param x2 - 点2的x坐标
   * @param y2 - 点2的y坐标
   * @returns 距离
   */
  static distance(x1: number, y1: number, x2: number, y2: number): number {
    return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
  }

  /**
   * 生成指定范围内的随机整数
   * @param min - 最小值（包含）
   * @param max - 最大值（包含）
   * @returns 随机整数
   */
  static randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  /**
   * 生成指定范围内的随机浮点数
   * @param min - 最小值
   * @param max - 最大值
   * @returns 随机浮点数
   */
  static randomFloat(min: number, max: number): number {
    return Math.random() * (max - min) + min;
  }

  /**
   * 四舍五入到指定小数位
   * @param value - 要舍入的值
   * @param decimals - 小数位数
   * @returns 舍入后的值
   */
  static roundTo(value: number, decimals: number): number {
    const factor: number = Math.pow(10, decimals);
    return Math.round(value * factor) / factor;
  }

  /**
   * 检查值是否在指定范围内（包含边界）
   * @param value - 要检查的值
   * @param min - 最小值
   * @param max - 最大值
   * @returns 是否在范围内
   */
  static inRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  /**
   * 计算最大公约数
   * @param a - 第一个数
   * @param b - 第二个数
   * @returns 最大公约数
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
   * 计算最小公倍数
   * @param a - 第一个数
   * @param b - 第二个数
   * @returns 最小公倍数
   */
  static lcm(a: number, b: number): number {
    if (a === 0 || b === 0) return 0;
    return Math.abs(a * b) / MathUtils.gcd(a, b);
  }
}
