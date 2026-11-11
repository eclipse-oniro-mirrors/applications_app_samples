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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 数学工具类
// ========================================

/**
 * 数学工具类
 * 提供常用的数学计算静态方法，包括数值限制、插值、舍入、随机数生成、
 * 数组统计、百分比计算等功能
 */
export class MathUtils {
  /** 默认小数精度 */
  private static readonly DEFAULT_PRECISION: number = 2;

  /** 圆周率常量 */
  static readonly PI: number = Math.PI;

  /** 自然常数 */
  static readonly E: number = Math.E;

  /** 黄金比例 */
  static readonly GOLDEN_RATIO: number = 1.618033988749895;

  // ========================================
  // 数值限制与插值
  // ========================================

  /**
   * 将数值限制在指定范围内
   * 如果值小于最小值则返回最小值，大于最大值则返回最大值
   * @param value - 要限制的数值
   * @param min - 最小值
   * @param max - 最大值
   * @returns 限制范围后的数值
   */
  static clamp(value: number, min: number, max: number): number {
    if (min > max) {
      hilog.warn(DOMAIN, TAG, 'MathUtils clamp: min greater than max, auto swapped');
      const temp: number = min;
      min = max;
      max = temp;
    }
    return Math.min(Math.max(value, min), max);
  }

  /**
   * 线性插值计算
   * 根据参数t（0-1）在a和b之间进行线性插值
   * @param a - 起始值
   * @param b - 结束值
   * @param t - 插值因子（0到1之间）
   * @returns 插值结果
   */
  static lerp(a: number, b: number, t: number): number {
    const clampedT: number = MathUtils.clamp(t, 0, 1);
    return a + (b - a) * clampedT;
  }

  /**
   * 反向线性插值
   * 给定值在a和b之间的位置，返回对应的插值因子
   * @param a - 起始值
   * @param b - 结束值
   * @param value - 实际值
   * @returns 插值因子（0到1之间）
   */
  static inverseLerp(a: number, b: number, value: number): number {
    if (a === b) {
      return 0;
    }
    return (value - a) / (b - a);
  }

  /**
   * 将一个范围内的值映射到另一个范围
   * @param value - 原始值
   * @param fromMin - 原始范围最小值
   * @param fromMax - 原始范围最大值
   * @param toMin - 目标范围最小值
   * @param toMax - 目标范围最大值
   * @returns 映射后的值
   */
  static mapRange(value: number, fromMin: number, fromMax: number, toMin: number, toMax: number): number {
    const t: number = MathUtils.inverseLerp(fromMin, fromMax, value);
    return MathUtils.lerp(toMin, toMax, t);
  }

  // ========================================
  // 舍入与精度
  // ========================================

  /**
   * 四舍五入到指定小数位
   * @param value - 要舍入的数值
   * @param decimals - 小数位数，默认为2
   * @returns 舍入后的数值
   */
  static round(value: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    const factor: number = Math.pow(10, decimals);
    return Math.round(value * factor) / factor;
  }

  /**
   * 向上取整到指定小数位
   * @param value - 要处理的数值
   * @param decimals - 小数位数，默认为2
   * @returns 向上取整后的数值
   */
  static ceil(value: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    const factor: number = Math.pow(10, decimals);
    return Math.ceil(value * factor) / factor;
  }

  /**
   * 向下取整到指定小数位
   * @param value - 要处理的数值
   * @param decimals - 小数位数，默认为2
   * @returns 向下取整后的数值
   */
  static floor(value: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    const factor: number = Math.pow(10, decimals);
    return Math.floor(value * factor) / factor;
  }

  // ========================================
  // 随机数生成
  // ========================================

  /**
   * 生成指定范围内的随机整数
   * @param min - 最小值（包含）
   * @param max - 最大值（包含）
   * @returns 随机整数
   */
  static randomInt(min: number, max: number): number {
    const safeMin: number = Math.ceil(min);
    const safeMax: number = Math.floor(max);
    return Math.floor(Math.random() * (safeMax - safeMin + 1)) + safeMin;
  }

  /**
   * 生成指定范围内的随机浮点数
   * @param min - 最小值（包含）
   * @param max - 最大值（不包含）
   * @returns 随机浮点数
   */
  static randomFloat(min: number, max: number): number {
    return Math.random() * (max - min) + min;
  }

  /**
   * 从数组中随机选取一个元素
   * @param array - 源数组
   * @returns 随机选取的元素，数组为空时返回undefined
   */
  static randomChoice<T>(array: T[]): T | undefined {
    if (array.length === 0) {
      return undefined;
    }
    const index: number = MathUtils.randomInt(0, array.length - 1);
    return array[index];
  }

  /**
   * 生成随机布尔值
   * @param probability - 返回true的概率（0-1），默认为0.5
   * @returns 随机布尔值
   */
  static randomBoolean(probability: number = 0.5): boolean {
    return Math.random() < probability;
  }

  // ========================================
  // 范围检查
  // ========================================

  /**
   * 检查数值是否在指定范围内（包含边界）
   * @param value - 要检查的数值
   * @param min - 最小值
   * @param max - 最大值
   * @returns 如果值在范围内返回true
   */
  static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  /**
   * 检查数值是否为正数
   * @param value - 要检查的数值
   * @returns 如果值为正数返回true
   */
  static isPositive(value: number): boolean {
    return value > 0;
  }

  /**
   * 检查数值是否为负数
   * @param value - 要检查的数值
   * @returns 如果值为负数返回true
   */
  static isNegative(value: number): boolean {
    return value < 0;
  }

  /**
   * 检查数值是否为整数
   * @param value - 要检查的数值
   * @returns 如果值为整数返回true
   */
  static isInteger(value: number): boolean {
    return Number.isInteger(value);
  }

  // ========================================
  // 数组统计方法
  // ========================================

  /**
   * 计算数值数组的平均值
   * @param numbers - 数值数组
   * @returns 平均值，数组为空时返回0
   */
  static average(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    const total: number = MathUtils.sum(numbers);
    return total / numbers.length;
  }

  /**
   * 计算数值数组的总和
   * @param numbers - 数值数组
   * @returns 所有元素的总和
   */
  static sum(numbers: number[]): number {
    let total: number = 0;
    for (let i: number = 0; i < numbers.length; i++) {
      total += numbers[i];
    }
    return total;
  }

  /**
   * 计算数值数组的中位数
   * @param numbers - 数值数组
   * @returns 中位数，数组为空时返回0
   */
  static median(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    const sorted: number[] = [...numbers].sort((a: number, b: number) => a - b);
    const mid: number = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 0) {
      return (sorted[mid - 1] + sorted[mid]) / 2;
    }
    return sorted[mid];
  }

  /**
   * 找出数组中的最大值
   * @param numbers - 数值数组
   * @returns 最大值，数组为空时返回0
   */
  static max(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    let maxVal: number = numbers[0];
    for (let i: number = 1; i < numbers.length; i++) {
      if (numbers[i] > maxVal) {
        maxVal = numbers[i];
      }
    }
    return maxVal;
  }

  /**
   * 找出数组中的最小值
   * @param numbers - 数值数组
   * @returns 最小值，数组为空时返回0
   */
  static min(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    let minVal: number = numbers[0];
    for (let i: number = 1; i < numbers.length; i++) {
      if (numbers[i] < minVal) {
        minVal = numbers[i];
      }
    }
    return minVal;
  }

  // ========================================
  // 百分比计算
  // ========================================

  /**
   * 计算百分比
   * @param part - 部分值
   * @param total - 总值
   * @param decimals - 小数位数，默认为2
   * @returns 百分比数值
   */
  static percentage(part: number, total: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    if (total === 0) {
      hilog.warn(DOMAIN, TAG, 'MathUtils percentage: total must not be zero');
      return 0;
    }
    const result: number = (part / total) * 100;
    return MathUtils.round(result, decimals);
  }

  /**
   * 计算数值的平方
   * @param value - 要计算平方的数值
   * @returns 平方结果
   */
  static square(value: number): number {
    return value * value;
  }

  /**
   * 计算两点之间的欧几里得距离
   * @param x1 - 第一个点的x坐标
   * @param y1 - 第一个点的y坐标
   * @param x2 - 第二个点的x坐标
   * @param y2 - 第二个点的y坐标
   * @returns 两点之间的距离
   */
  static distance(x1: number, y1: number, x2: number, y2: number): number {
    return Math.sqrt(MathUtils.square(x2 - x1) + MathUtils.square(y2 - y1));
  }

  /**
   * 将角度转换为弧度
   * @param degrees - 角度值
   * @returns 弧度值
   */
  static degreesToRadians(degrees: number): number {
    return degrees * (MathUtils.PI / 180);
  }

  /**
   * 将弧度转换为角度
   * @param radians - 弧度值
   * @returns 角度值
   */
  static radiansToDegrees(radians: number): number {
    return radians * (180 / MathUtils.PI);
  }
}
