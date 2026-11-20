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
 
import { LogUtil } from './LogUtil';

const TAG = 'PerfTimer';

export class PerfTimer {
  private samples: number[] = [];
  private startMs: number = 0;

  /** 同步代码块计时：返回 fn 结果并输出耗时日志 */
  static time<T>(tag: string, name: string, fn: () => T): T {
    const begin: number = Date.now();
    try {
      return fn();
    } finally {
      const cost: number = Date.now() - begin;
      LogUtil.info(tag, `⏱ ${name} 耗时 ${cost}ms`);
    }
  }

  /** 开始采样 */
  start(): void {
    this.startMs = Date.now();
  }

  /** 结束采样并记录，返回本次耗时 ms */
  stop(): number {
    const cost: number = Date.now() - this.startMs;
    this.samples.push(cost);
    return cost;
  }

  /** 采样次数 */
  count(): number {
    return this.samples.length;
  }

  /** 平均耗时 ms（无样本返回 0） */
  avg(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let sum = 0;
    for (const s of this.samples) {
      sum += s;
    }
    return Math.round(sum / this.samples.length * 100) / 100;
  }

  /** 最小耗时 ms（无样本返回 0） */
  min(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let m = this.samples[0];
    for (const s of this.samples) {
      if (s < m) {
        m = s;
      }
    }
    return m;
  }

  /** 最大耗时 ms（无样本返回 0） */
  max(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let m = this.samples[0];
    for (const s of this.samples) {
      if (s > m) {
        m = s;
      }
    }
    return m;
  }

  /** 统计报告（输出到日志并返回） */
  report(name: string): string {
    const line: string = `${name}: ${this.count()} samples, avg ${this.avg()}ms, min ${this.min()}ms, max ${this.max()}ms`;
    LogUtil.info(TAG, line);
    return line;
  }

  /** 清空样本 */
  reset(): void {
    this.samples = [];
  }
}
