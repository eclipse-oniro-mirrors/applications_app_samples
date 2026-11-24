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
 * 单次轮询的进度快照，避免直接依赖 SDK 结构。
 */
export interface ScanProgressSnapshot {
  progress: number;
  isFinal: boolean;
}

/**
 * 一批扫描结果汇总后的状态。
 */
export interface ScanProgressSummary {
  total: number;
  completed: number;
  finalized: number;
  percent: number;
  finished: boolean;
}

/**
 * 扫描进度聚合：轮询、批量、失败重试都走同一套归一化规则。
 */
export class ScanProgressAggregator {
  public static readonly PERCENT_MIN: number = 0;
  public static readonly PERCENT_MAX: number = 100;
  public static readonly POLL_DELAY_MS: number = 500;
  public static readonly STOP_DELAY_MS: number = -1;

  /**
   * NaN、负数、超过 100 一律修正到 [0, 100] 并取整。
   */
  static normalizeProgress(value: number): number {
    if (Number.isNaN(value)) {
      return ScanProgressAggregator.PERCENT_MIN;
    }
    if (value < ScanProgressAggregator.PERCENT_MIN) {
      return ScanProgressAggregator.PERCENT_MIN;
    }
    if (value > ScanProgressAggregator.PERCENT_MAX) {
      return ScanProgressAggregator.PERCENT_MAX;
    }
    return Math.round(value);
  }

  static countCompleted(list: ScanProgressSnapshot[]): number {
    let count: number = 0;
    for (let index = 0; index < list.length; index++) {
      if (ScanProgressAggregator.normalizeProgress(list[index].progress) >=
        ScanProgressAggregator.PERCENT_MAX) {
        count++;
      }
    }
    return count;
  }

  static countFinalized(list: ScanProgressSnapshot[]): number {
    let count: number = 0;
    for (let index = 0; index < list.length; index++) {
      if (list[index].isFinal) {
        count++;
      }
    }
    return count;
  }

  /**
   * 只有最后一条既是 100% 又标记 final 才算本次扫描结束。
   */
  static isFinished(list: ScanProgressSnapshot[]): boolean {
    if (list.length === 0) {
      return false;
    }
    const last: ScanProgressSnapshot = list[list.length - 1];
    const percent: number = ScanProgressAggregator.normalizeProgress(last.progress);
    return last.isFinal && percent >= ScanProgressAggregator.PERCENT_MAX;
  }

  static summarize(list: ScanProgressSnapshot[]): ScanProgressSummary {
    const summary: ScanProgressSummary = {
      total: list.length,
      completed: ScanProgressAggregator.countCompleted(list),
      finalized: ScanProgressAggregator.countFinalized(list),
      percent: list.length === 0 ? 0
        : ScanProgressAggregator.normalizeProgress(list[list.length - 1].progress),
      finished: ScanProgressAggregator.isFinished(list)
    };
    return summary;
  }

  /**
   * 进度只增不减：迟到的旧轮询结果不会让进度条回退。
   */
  static mergePercent(previous: number, current: number): number {
    const left: number = ScanProgressAggregator.normalizeProgress(previous);
    const right: number = ScanProgressAggregator.normalizeProgress(current);
    return left > right ? left : right;
  }

  static getPollDelay(finished: boolean): number {
    return finished ? ScanProgressAggregator.STOP_DELAY_MS : ScanProgressAggregator.POLL_DELAY_MS;
  }

  static toPercentText(percent: number): string {
    return `${ScanProgressAggregator.normalizeProgress(percent)}%`;
  }
}
