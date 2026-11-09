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

const DOMAIN: number = 0xF811;
const TAG: string = '[PerformanceTracker]';

export interface PerformanceMetric {
  name: string;
  startTime: number;
  endTime: number;
  duration: number;
  category: string;
  tags: Map<string, string>;
  success: boolean;
  errorMessage: string;
}

export interface PerformanceSummary {
  totalMetrics: number;
  averageDuration: number;
  minDuration: number;
  maxDuration: number;
  medianDuration: number;
  p90Duration: number;
  p95Duration: number;
  p99Duration: number;
  successRate: number;
  metricsByCategory: Map<string, number>;
  slowestMetrics: PerformanceMetric[];
}

export class PerformanceTracker {
  private metrics: PerformanceMetric[] = [];
  private activeTimers: Map<string, number> = new Map();
  private maxMetrics: number = 5000;

  constructor(maxMetrics?: number) {
    if (maxMetrics !== undefined) {
      this.maxMetrics = maxMetrics;
    }
  }

  public startTimer(name: string): void {
    this.activeTimers.set(name, Date.now());
    hilog.debug(DOMAIN, TAG, 'Timer started: %{public}s', name);
  }

  public stopTimer(name: string, category: string = 'default',
    success: boolean = true, errorMessage: string = ''): PerformanceMetric | undefined {
    const startTime: number | undefined = this.activeTimers.get(name);
    if (startTime === undefined) {
      hilog.warn(DOMAIN, TAG, 'Timer not found: %{public}s', name);
      return undefined;
    }
    const endTime: number = Date.now();
    const duration: number = endTime - startTime;
    this.activeTimers.delete(name);

    const tags: Map<string, string> = new Map();
    tags.set('name', name);
    tags.set('category', category);

    const metric: PerformanceMetric = {
      name: name,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
      category: category,
      tags: tags,
      success: success,
      errorMessage: errorMessage
    };

    if (this.metrics.length >= this.maxMetrics) {
      this.metrics.shift();
    }
    this.metrics.push(metric);

    hilog.info(DOMAIN, TAG, 'Timer stopped: %{public}s duration=%{public}dms success=%{public}s',
      name, duration, success ? 'true' : 'false');
    return metric;
  }

  public recordMetric(name: string, duration: number, category: string = 'default',
    success: boolean = true, errorMessage: string = ''): void {
    const now: number = Date.now();
    const tags: Map<string, string> = new Map();
    tags.set('name', name);
    tags.set('category', category);

    const metric: PerformanceMetric = {
      name: name,
      startTime: now - duration,
      endTime: now,
      duration: duration,
      category: category,
      tags: tags,
      success: success,
      errorMessage: errorMessage
    };

    if (this.metrics.length >= this.maxMetrics) {
      this.metrics.shift();
    }
    this.metrics.push(metric);
  }

  public getMetrics(): PerformanceMetric[] {
    const result: PerformanceMetric[] = [];
    for (let i: number = 0; i < this.metrics.length; i++) {
      const m: PerformanceMetric = this.metrics[i];
      const tags: Map<string, string> = new Map();
      m.tags.forEach((value: string, key: string) => {
        tags.set(key, value);
      });
      const copy: PerformanceMetric = {
        name: m.name,
        startTime: m.startTime,
        endTime: m.endTime,
        duration: m.duration,
        category: m.category,
        tags: tags,
        success: m.success,
        errorMessage: m.errorMessage
      };
      result.push(copy);
    }
    return result;
  }

  public getMetricsByCategory(category: string): PerformanceMetric[] {
    const result: PerformanceMetric[] = [];
    for (let i: number = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].category === category) {
        result.push(this.metrics[i]);
      }
    }
    return result;
  }

  public getMetricsByName(name: string): PerformanceMetric[] {
    const result: PerformanceMetric[] = [];
    for (let i: number = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].name === name) {
        result.push(this.metrics[i]);
      }
    }
    return result;
  }

  public getFailedMetrics(): PerformanceMetric[] {
    const result: PerformanceMetric[] = [];
    for (let i: number = 0; i < this.metrics.length; i++) {
      if (!this.metrics[i].success) {
        result.push(this.metrics[i]);
      }
    }
    return result;
  }

  private sortDurations(durations: number[]): number[] {
    const sorted: number[] = [];
    for (let i: number = 0; i < durations.length; i++) {
      sorted.push(durations[i]);
    }
    for (let i: number = 0; i < sorted.length - 1; i++) {
      for (let j: number = 0; j < sorted.length - 1 - i; j++) {
        if (sorted[j] > sorted[j + 1]) {
          const temp: number = sorted[j];
          sorted[j] = sorted[j + 1];
          sorted[j + 1] = temp;
        }
      }
    }
    return sorted;
  }

  private percentile(sorted: number[], p: number): number {
    if (sorted.length === 0) {
      return 0;
    }
    const index: number = Math.ceil((p / 100) * sorted.length) - 1;
    return sorted[Math.max(0, index)];
  }

  public summarize(): PerformanceSummary {
    if (this.metrics.length === 0) {
      return {
        totalMetrics: 0,
        averageDuration: 0,
        minDuration: 0,
        maxDuration: 0,
        medianDuration: 0,
        p90Duration: 0,
        p95Duration: 0,
        p99Duration: 0,
        successRate: 0,
        metricsByCategory: new Map(),
        slowestMetrics: []
      };
    }

    const durations: number[] = [];
    let totalDuration: number = 0;
    let minDuration: number = Number.MAX_VALUE;
    let maxDuration: number = 0;
    let successCount: number = 0;
    const categoryCounts: Map<string, number> = new Map();

    for (let i: number = 0; i < this.metrics.length; i++) {
      const m: PerformanceMetric = this.metrics[i];
      durations.push(m.duration);
      totalDuration += m.duration;
      if (m.duration < minDuration) {
        minDuration = m.duration;
      }
      if (m.duration > maxDuration) {
        maxDuration = m.duration;
      }
      if (m.success) {
        successCount++;
      }
      const currentCount: number | undefined = categoryCounts.get(m.category);
      if (currentCount !== undefined) {
        categoryCounts.set(m.category, currentCount + 1);
      } else {
        categoryCounts.set(m.category, 1);
      }
    }

    const sorted: number[] = this.sortDurations(durations);
    const average: number = totalDuration / this.metrics.length;
    const median: number = this.percentile(sorted, 50);
    const p90: number = this.percentile(sorted, 90);
    const p95: number = this.percentile(sorted, 95);
    const p99: number = this.percentile(sorted, 99);
    const successRate: number = Math.round((successCount / this.metrics.length) * 100);

    const slowest: PerformanceMetric[] = [];
    const sortedByDuration: PerformanceMetric[] = [];
    for (let i: number = 0; i < this.metrics.length; i++) {
      sortedByDuration.push(this.metrics[i]);
    }
    for (let i: number = 0; i < sortedByDuration.length - 1; i++) {
      for (let j: number = 0; j < sortedByDuration.length - 1 - i; j++) {
        if (sortedByDuration[j].duration < sortedByDuration[j + 1].duration) {
          const temp: PerformanceMetric = sortedByDuration[j];
          sortedByDuration[j] = sortedByDuration[j + 1];
          sortedByDuration[j + 1] = temp;
        }
      }
    }
    const topCount: number = Math.min(10, sortedByDuration.length);
    for (let i: number = 0; i < topCount; i++) {
      slowest.push(sortedByDuration[i]);
    }

    return {
      totalMetrics: this.metrics.length,
      averageDuration: Math.round(average),
      minDuration: minDuration === Number.MAX_VALUE ? 0 : minDuration,
      maxDuration: maxDuration,
      medianDuration: median,
      p90Duration: p90,
      p95Duration: p95,
      p99Duration: p99,
      successRate: successRate,
      metricsByCategory: categoryCounts,
      slowestMetrics: slowest
    };
  }

  public generateReport(): string {
    const summary: PerformanceSummary = this.summarize();
    const lines: string[] = [];
    lines.push('=== Performance Report ===');
    lines.push(`Total metrics: ${summary.totalMetrics}`);
    lines.push(`Average duration: ${summary.averageDuration}ms`);
    lines.push(`Min duration: ${summary.minDuration}ms`);
    lines.push(`Max duration: ${summary.maxDuration}ms`);
    lines.push(`Median duration: ${summary.medianDuration}ms`);
    lines.push(`P90 duration: ${summary.p90Duration}ms`);
    lines.push(`P95 duration: ${summary.p95Duration}ms`);
    lines.push(`P99 duration: ${summary.p99Duration}ms`);
    lines.push(`Success rate: ${summary.successRate}%`);

    if (summary.metricsByCategory.size > 0) {
      lines.push('');
      lines.push('--- Metrics by Category ---');
      summary.metricsByCategory.forEach((count: number, category: string) => {
        lines.push(`  ${category}: ${count}`);
      });
    }

    if (summary.slowestMetrics.length > 0) {
      lines.push('');
      lines.push('--- Top 10 Slowest ---');
      for (let i: number = 0; i < summary.slowestMetrics.length; i++) {
        const m: PerformanceMetric = summary.slowestMetrics[i];
        lines.push(`  #${i + 1} ${m.name}: ${m.duration}ms [${m.category}]`);
      }
    }

    lines.push('');
    lines.push('=== End of Report ===');
    return lines.join('\n');
  }

  public clear(): void {
    this.metrics = [];
    this.activeTimers.clear();
  }

  public getMetricCount(): number {
    return this.metrics.length;
  }

  public getActiveTimerCount(): number {
    return this.activeTimers.size;
  }
}
