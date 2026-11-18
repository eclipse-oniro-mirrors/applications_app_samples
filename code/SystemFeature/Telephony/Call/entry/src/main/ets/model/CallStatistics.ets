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
 * @file entry/src/main/ets/model/CallStatistics.ets
 * 文件职责：通话分类计数与占比统计。
 * 主要声明：CallStatistics。
 */

/**
 * CallStatistics：以键值计数的方式维护统计。
 */
export class CallStatistics {
  private keys: string[] = [];
  private values: number[] = [];

  /**
   * increment：为指定键累加计数。
   * @param key 统计键。
   * @param delta 增量，负数按 0 处理，缺省为 1。
   */
  increment(key: string, delta: number = 1): void {
    const step: number = delta < 0 ? 0 : delta;
    for (let index = 0; index < this.keys.length; index++) {
      if (this.keys[index] === key) {
        this.values[index] = this.values[index] + step;
        return;
      }
    }
    this.keys.push(key);
    this.values.push(step);
  }

  /**
   * count：读取指定键的计数。
   * @param key 统计键。
   * @returns 计数，不存在返回 0。
   */
  count(key: string): number {
    for (let index = 0; index < this.keys.length; index++) {
      if (this.keys[index] === key) {
        return this.values[index];
      }
    }
    return 0;
  }

  /**
   * total：返回全部计数之和。
   * @returns 总数。
   */
  total(): number {
    let sum: number = 0;
    for (let index = 0; index < this.values.length; index++) {
      sum += this.values[index];
    }
    return sum;
  }

  /**
   * ratio：返回指定键占比，保留两位小数。
   * @param key 统计键。
   * @returns 百分比数值，总数为 0 时返回 0。
   */
  ratio(key: string): number {
    const sum: number = this.total();
    if (sum === 0) {
      return 0;
    }
    const raw: number = this.count(key) / sum * 100;
    return Math.round(raw * 100) / 100;
  }

  /**
   * topKey：返回计数最大的键，并列时取先出现的键。
   * @returns 键名，空统计返回空串。
   */
  topKey(): string {
    if (this.keys.length === 0) {
      return '';
    }
    let bestIndex: number = 0;
    for (let index = 1; index < this.values.length; index++) {
      if (this.values[index] > this.values[bestIndex]) {
        bestIndex = index;
      }
    }
    return this.keys[bestIndex];
  }

  /**
   * entries：返回 key=count 形式的条目列表。
   * @returns 条目数组。
   */
  entries(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.keys.length; index++) {
      result.push(this.keys[index] + '=' + this.values[index]);
    }
    return result;
  }

  /**
   * clear：清空统计。
   */
  clear(): void {
    this.keys = [];
    this.values = [];
  }

  /**
   * size：返回统计键个数。
   * @returns 键个数。
   */
  size(): number {
    return this.keys.length;
  }
}
