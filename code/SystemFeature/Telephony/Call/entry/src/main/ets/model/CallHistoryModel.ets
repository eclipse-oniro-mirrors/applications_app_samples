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
 * @file entry/src/main/ets/model/CallHistoryModel.ets
 * 文件职责：通话记录的内存模型，负责插入排序、容量裁剪与统计。
 * 主要声明：CallHistoryEntry、CallHistoryModel。
 */

import { CallNumberFormatter } from './CallNumberFormatter';

/**
 * CallHistoryEntry：单条通话记录。
 */
export interface CallHistoryEntry {
  id: number;
  number: string;
  startTime: number;
  durationSec: number;
  direction: string;
}

/**
 * CallHistoryModel：维持按开始时间倒序的记录列表。
 */
export class CallHistoryModel {
  private items: CallHistoryEntry[] = [];
  private capacity: number = 50;

  constructor(capacity: number) {
    if (capacity > 0) {
      this.capacity = capacity;
    }
  }

  /**
   * add：插入一条记录，按开始时间倒序排序并裁剪容量。
   * @param entry 记录。
   */
  add(entry: CallHistoryEntry): void {
    this.items.push(entry);
    this.items.sort((left: CallHistoryEntry, right: CallHistoryEntry) => right.startTime - left.startTime);
    if (this.items.length > this.capacity) {
      this.items = this.items.slice(0, this.capacity);
    }
  }

  /**
   * size：返回当前记录数。
   * @returns 记录数。
   */
  size(): number {
    return this.items.length;
  }

  /**
   * all：返回记录副本。
   * @returns 记录数组。
   */
  all(): CallHistoryEntry[] {
    return this.items.slice(0);
  }

  /**
   * clear：清空记录。
   */
  clear(): void {
    this.items = [];
  }

  /**
   * totalDuration：返回累计通话秒数。
   * @returns 累计秒数。
   */
  totalDuration(): number {
    let total: number = 0;
    for (let index = 0; index < this.items.length; index++) {
      total += this.items[index].durationSec;
    }
    return total;
  }

  /**
   * countByDirection：按呼叫方向统计条数。
   * @param direction 方向，如 incoming、outgoing、missed。
   * @returns 条数。
   */
  countByDirection(direction: string): number {
    let count: number = 0;
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].direction === direction) {
        count++;
      }
    }
    return count;
  }

  /**
   * findByNumber：按归一化号码查找记录。
   * @param number 号码。
   * @returns 命中记录数组。
   */
  findByNumber(number: string): CallHistoryEntry[] {
    const target: string = CallNumberFormatter.sanitize(number);
    const result: CallHistoryEntry[] = [];
    for (let index = 0; index < this.items.length; index++) {
      if (CallNumberFormatter.sanitize(this.items[index].number) === target) {
        result.push(this.items[index]);
      }
    }
    return result;
  }

  /**
   * lastEntry：返回最近一条记录。
   * @returns 最近记录，空表返回 undefined。
   */
  lastEntry(): CallHistoryEntry | undefined {
    return this.items.length === 0 ? undefined : this.items[0];
  }

  /**
   * longestEntry：返回时长最长的记录，时长相同取较早插入者。
   * @returns 最长记录，空表返回 undefined。
   */
  longestEntry(): CallHistoryEntry | undefined {
    if (this.items.length === 0) {
      return undefined;
    }
    let best: CallHistoryEntry = this.items[0];
    for (let index = 1; index < this.items.length; index++) {
      if (this.items[index].durationSec > best.durationSec) {
        best = this.items[index];
      }
    }
    return best;
  }

  /**
   * removeById：按 id 删除记录。
   * @param id 记录 id。
   * @returns 是否删除成功。
   */
  removeById(id: number): boolean {
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].id === id) {
        this.items.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  /**
   * numbers：返回去重后的号码列表，保持首次出现顺序。
   * @returns 号码数组。
   */
  numbers(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.items.length; index++) {
      const value: string = CallNumberFormatter.sanitize(this.items[index].number);
      if (result.indexOf(value) < 0) {
        result.push(value);
      }
    }
    return result;
  }
}
