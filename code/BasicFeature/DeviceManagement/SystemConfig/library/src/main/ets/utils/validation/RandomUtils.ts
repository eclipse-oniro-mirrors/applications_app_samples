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
// 默认字符集常量
// ========================================

/** 字母数字字符集 */
const ALPHANUMERIC_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
/** 十六进制字符集 */
const HEX_CHARS: string = '0123456789abcdef';

// ========================================
// 随机数权重项接口
// ========================================

/**
 * 加权随机项接口。
 * 用于 weightedRandom 方法中的条目与权重配对。
 */
export interface WeightedItem<T> {
  /** 随机项的数据值 */
  item: T;
  /** 随机项的权重值（越大越容易被选中） */
  weight: number;
}

// ========================================
// 随机工具类
// ========================================

/**
 * 随机数生成工具类。
 * 提供多种随机数据生成能力，包括整数、浮点数、字符串、
 * UUID、颜色值、数组洗牌和加权随机等。
 */
export class RandomUtils {
  /**
   * 生成指定范围内的随机整数。
   * 包含最小值，不包含最大值。
   * @param {number} min - 最小值（含）
   * @param {number} max - 最大值（不含）
   * @returns {number} 随机整数
   */
  static nextInt(min: number, max: number): number {
    if (min >= max) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextInt: min >= max, returning min=%{public}d', min);
      return min;
    }
    const result: number = Math.floor(Math.random() * (max - min)) + min;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextInt: min=%{public}d, max=%{public}d, result=%{public}d',
      min, max, result);
    return result;
  }

  /**
   * 生成指定范围内的随机浮点数。
   * @param {number} min - 最小值（含）
   * @param {number} max - 最大值（含）
   * @returns {number} 随机浮点数
   */
  static nextFloat(min: number, max: number): number {
    if (min > max) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextFloat: min > max, swapping values');
      const temp: number = min;
      min = max;
      max = temp;
    }
    const result: number = Math.random() * (max - min) + min;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextFloat: result=%{public}s', result.toFixed(4));
    return result;
  }

  /**
   * 生成随机布尔值。
   * @returns {boolean} 随机的 true 或 false
   */
  static nextBoolean(): boolean {
    const result: boolean = Math.random() >= 0.5;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextBoolean: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 生成指定长度的随机字符串。
   * 默认使用字母数字字符集，也可自定义字符集。
   * @param {number} length - 生成字符串的长度
   * @param {string} [chars] - 可选的自定义字符集
   * @returns {string} 随机字符串
   */
  static nextString(length: number, chars?: string): string {
    const charSet: string = chars ?? ALPHANUMERIC_CHARS;
    let result: string = '';

    for (let i: number = 0; i < length; i++) {
      const randomIndex: number = Math.floor(Math.random() * charSet.length);
      result += charSet.charAt(randomIndex);
    }

    hilog.debug(DOMAIN, TAG, 'RandomUtils nextString: length=%{public}d, resultLength=%{public}d',
      length, result.length);
    return result;
  }

  /**
   * 生成指定长度的随机十六进制字符串。
   * @param {number} length - 十六进制字符串长度
   * @returns {string} 随机十六进制字符串（小写）
   */
  static nextHex(length: number): string {
    let result: string = '';

    for (let i: number = 0; i < length; i++) {
      const randomIndex: number = Math.floor(Math.random() * HEX_CHARS.length);
      result += HEX_CHARS.charAt(randomIndex);
    }

    hilog.debug(DOMAIN, TAG, 'RandomUtils nextHex: length=%{public}d', length);
    return result;
  }

  // ========================================
  // UUID 生成
  // ========================================

  /**
   * 生成模拟 UUID（v4 格式）字符串。
   * 格式为 xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx，
   * 其中 y 为 8、9、a、b 之一。
   * @returns {string} 模拟的 UUID 字符串
   */
  static nextUuid(): string {
    const section1: string = RandomUtils.nextHex(8);
    const section2: string = RandomUtils.nextHex(4);
    const section3: string = '4' + RandomUtils.nextHex(3);
    const variantChars: string = '89ab';
    const variantChar: string = variantChars.charAt(Math.floor(Math.random() * variantChars.length));
    const section4: string = variantChar + RandomUtils.nextHex(3);
    const section5: string = RandomUtils.nextHex(12);

    const uuid: string = `${section1}-${section2}-${section3}-${section4}-${section5}`;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextUuid: generated=%{public}s', uuid);
    return uuid;
  }

  // ========================================
  // 颜色与元素操作
  // ========================================

  /**
   * 生成随机的十六进制颜色值。
   * 格式为 #RRGGBB，每个通道为两位十六进制数。
   * @returns {string} 随机颜色值（如 #a3f2c1）
   */
  static nextColor(): string {
    const color: string = '#' + RandomUtils.nextHex(6);
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextColor: %{public}s', color);
    return color;
  }

  /**
   * 从数组中随机选取一个元素。
   * 数组不能为空，否则返回 undefined。
   * @param {T[]} array - 源数组
   * @returns {T | undefined} 随机选取的元素
   */
  static nextElement<T>(array: T[]): T | undefined {
    if (array.length === 0) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextElement: array is empty');
      return undefined;
    }
    const index: number = Math.floor(Math.random() * array.length);
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextElement: selected index=%{public}d', index);
    return array[index];
  }

  /**
   * 使用 Fisher-Yates 算法对数组进行原地洗牌。
   * 返回洗牌后的新数组，不修改原数组。
   * @param {T[]} array - 待洗牌的数组
   * @returns {T[]} 洗牌后的新数组
   */
  static shuffle<T>(array: T[]): T[] {
    const result: T[] = [...array];
    hilog.info(DOMAIN, TAG, 'RandomUtils shuffle: shuffling array of length=%{public}d', result.length);

    for (let i: number = result.length - 1; i > 0; i--) {
      const j: number = Math.floor(Math.random() * (i + 1));
      const temp: T = result[i];
      result[i] = result[j];
      result[j] = temp;
    }

    hilog.debug(DOMAIN, TAG, 'RandomUtils shuffle: shuffle complete');
    return result;
  }

  // ========================================
  // 范围与加权随机
  // ========================================

  /**
   * 在指定范围内按步长生成随机值。
   * 从 min 开始，以 step 为步递增，随机选取其中一个值。
   * @param {number} min - 范围最小值（含）
   * @param {number} max - 范围最大值（含）
   * @param {number} step - 步长（必须大于 0）
   * @returns {number} 范围内的随机步进值
   */
  static nextInRange(min: number, max: number, step: number): number {
    if (step <= 0) {
      hilog.error(DOMAIN, TAG, 'RandomUtils nextInRange: step must be positive, got=%{public}s', step.toString());
      return min;
    }
    if (min > max) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextInRange: min > max, returning min');
      return min;
    }

    const stepsCount: number = Math.floor((max - min) / step);
    const randomStep: number = Math.floor(Math.random() * (stepsCount + 1));
    const result: number = min + randomStep * step;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextInRange: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 根据权重从条目列表中随机选取一项。
   * 权重越大的条目被选中的概率越高。
   * @param {T[]} items - 候选条目数组
   * @param {number[]} weights - 对应的权重数组（需与 items 等长）
   * @returns {T | undefined} 选中的条目，列表为空时返回 undefined
   */
  static weightedRandom<T>(items: T[], weights: number[]): T | undefined {
    if (items.length === 0 || weights.length === 0) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils weightedRandom: empty items or weights');
      return undefined;
    }

    if (items.length !== weights.length) {
      hilog.error(DOMAIN, TAG, 'RandomUtils weightedRandom: items and weights length mismatch');
      return undefined;
    }

    // 计算权重总和
    let totalWeight: number = 0;
    for (const weight of weights) {
      totalWeight += Math.max(0, weight);
    }

    if (totalWeight <= 0) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils weightedRandom: total weight is zero, using uniform random');
      return items[Math.floor(Math.random() * items.length)];
    }

    // 生成随机值并在权重区间中查找
    let randomValue: number = Math.random() * totalWeight;
    for (let i: number = 0; i < items.length; i++) {
      randomValue -= Math.max(0, weights[i]);
      if (randomValue < 0) {
        hilog.debug(DOMAIN, TAG, 'RandomUtils weightedRandom: selected index=%{public}d', i);
        return items[i];
      }
    }

    // 兜底返回最后一个元素
    return items[items.length - 1];
  }
}
