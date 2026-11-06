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
const TAG: string = '[TestMetricsCollector]';

export interface MetricDataPoint {
  name: string;
  value: number;
  timestamp: number;
  category: string;
  tags: Map<string, string>;
}

export interface MetricSummary {
  name: string;
  count: number;
  sum: number;
  average: number;
  min: number;
  max: number;
  latest: number;
  category: string;
}

export interface CategorySummary {
  category: string;
  metricCount: number;
  totalDataPoints: number;
  averageValue: number;
}

export class TestMetricsCollector {
  private dataPoints: Array<MetricDataPoint> = [];
  private maxDataPoints: number = 10000;
  private static instance: TestMetricsCollector | undefined = undefined;

  private constructor() {
  }

  public static getInstance(): TestMetricsCollector {
    if (TestMetricsCollector.instance === undefined) {
      TestMetricsCollector.instance = new TestMetricsCollector();
    }
    return TestMetricsCollector.instance;
  }

  public recordMetric(name: string, value: number, category: string): void {
    const tags: Map<string, string> = new Map();
    tags.set('name', name);
    tags.set('category', category);

    const point: MetricDataPoint = {
      name: name,
      value: value,
      timestamp: Date.now(),
      category: category,
      tags: tags
    };

    if (this.dataPoints.length >= this.maxDataPoints) {
      this.dataPoints.shift();
    }
    this.dataPoints.push(point);
    hilog.debug(DOMAIN, TAG, 'Metric recorded: %{public}s=%{public}d [%{public}s]', name, value, category);
  }

  public recordMetricWithTags(name: string, value: number, category: string,
    tags: Map<string, string>): void {
    const point: MetricDataPoint = {
      name: name,
      value: value,
      timestamp: Date.now(),
      category: category,
      tags: tags
    };

    if (this.dataPoints.length >= this.maxDataPoints) {
      this.dataPoints.shift();
    }
    this.dataPoints.push(point);
  }

  public incrementCounter(name: string, category: string): void {
    const existing = this.getLatestValue(name, category);
    this.recordMetric(name, existing + 1, category);
  }

  public getLatestValue(name: string, category: string): number {
    for (let i = this.dataPoints.length - 1; i >= 0; i--) {
      if (this.dataPoints[i].name === name && this.dataPoints[i].category === category) {
        return this.dataPoints[i].value;
      }
    }
    return 0;
  }

  public getDataPoints(): Array<MetricDataPoint> {
    const result: Array<MetricDataPoint> = [];
    for (let i = 0; i < this.dataPoints.length; i++) {
      const dp = this.dataPoints[i];
      const tags: Map<string, string> = new Map();
      dp.tags.forEach((value: string, key: string) => {
        tags.set(key, value);
      });
      const copy: MetricDataPoint = {
        name: dp.name,
        value: dp.value,
        timestamp: dp.timestamp,
        category: dp.category,
        tags: tags
      };
      result.push(copy);
    }
    return result;
  }

  public getDataPointsByCategory(category: string): Array<MetricDataPoint> {
    const result: Array<MetricDataPoint> = [];
    for (let i = 0; i < this.dataPoints.length; i++) {
      if (this.dataPoints[i].category === category) {
        result.push(this.dataPoints[i]);
      }
    }
    return result;
  }

  public getDataPointsByName(name: string): Array<MetricDataPoint> {
    const result: Array<MetricDataPoint> = [];
    for (let i = 0; i < this.dataPoints.length; i++) {
      if (this.dataPoints[i].name === name) {
        result.push(this.dataPoints[i]);
      }
    }
    return result;
  }

  public getMetricSummary(name: string, category: string): MetricSummary {
    let count = 0;
    let sum = 0;
    let min = Number.MAX_VALUE;
    let max = Number.MIN_VALUE;
    let latest = 0;
    let latestTimestamp = 0;

    for (let i = 0; i < this.dataPoints.length; i++) {
      const dp = this.dataPoints[i];
      if (dp.name === name && dp.category === category) {
        count++;
        sum += dp.value;
        if (dp.value < min) {
          min = dp.value;
        }
        if (dp.value > max) {
          max = dp.value;
        }
        if (dp.timestamp >= latestTimestamp) {
          latestTimestamp = dp.timestamp;
          latest = dp.value;
        }
      }
    }

    const average = count > 0 ? Math.round((sum / count) * 100) / 100 : 0;

    return {
      name: name,
      count: count,
      sum: sum,
      average: average,
      min: min === Number.MAX_VALUE ? 0 : min,
      max: max === Number.MIN_VALUE ? 0 : max,
      latest: latest,
      category: category
    };
  }

  public getCategorySummaries(): Array<CategorySummary> {
    const categories: Array<string> = [];
    for (let i = 0; i < this.dataPoints.length; i++) {
      const cat = this.dataPoints[i].category;
      let found = false;
      for (let j = 0; j < categories.length; j++) {
        if (categories[j] === cat) {
          found = true;
          break;
        }
      }
      if (!found) {
        categories.push(cat);
      }
    }

    const summaries: Array<CategorySummary> = [];
    for (let i = 0; i < categories.length; i++) {
      const cat = categories[i];
      let metricCount = 0;
      let totalPoints = 0;
      let totalValue = 0;
      const metricNames: Array<string> = [];

      for (let j = 0; j < this.dataPoints.length; j++) {
        if (this.dataPoints[j].category === cat) {
          totalPoints++;
          totalValue += this.dataPoints[j].value;
          let nameFound = false;
          for (let k = 0; k < metricNames.length; k++) {
            if (metricNames[k] === this.dataPoints[j].name) {
              nameFound = true;
              break;
            }
          }
          if (!nameFound) {
            metricNames.push(this.dataPoints[j].name);
            metricCount++;
          }
        }
      }

      const avgValue = totalPoints > 0 ? Math.round((totalValue / totalPoints) * 100) / 100 : 0;
      const summary: CategorySummary = {
        category: cat,
        metricCount: metricCount,
        totalDataPoints: totalPoints,
        averageValue: avgValue
      };
      summaries.push(summary);
    }

    return summaries;
  }

  public getAllMetricNames(): Array<string> {
    const names: Array<string> = [];
    for (let i = 0; i < this.dataPoints.length; i++) {
      const name = this.dataPoints[i].name;
      let found = false;
      for (let j = 0; j < names.length; j++) {
        if (names[j] === name) {
          found = true;
          break;
        }
      }
      if (!found) {
        names.push(name);
      }
    }
    return names;
  }

  public getAllCategories(): Array<string> {
    const categories: Array<string> = [];
    for (let i = 0; i < this.dataPoints.length; i++) {
      const cat = this.dataPoints[i].category;
      let found = false;
      for (let j = 0; j < categories.length; j++) {
        if (categories[j] === cat) {
          found = true;
          break;
        }
      }
      if (!found) {
        categories.push(cat);
      }
    }
    return categories;
  }

  public generateSummaryReport(): string {
    const lines: Array<string> = [];
    lines.push('=== Test Metrics Summary Report ===');
    lines.push(`Total data points: ${this.dataPoints.length}`);

    const categories = this.getCategorySummaries();
    if (categories.length > 0) {
      lines.push('');
      lines.push('--- By Category ---');
      for (let i = 0; i < categories.length; i++) {
        const cat = categories[i];
        lines.push(`  [${cat.category}]`);
        lines.push(`    Metrics: ${cat.metricCount}`);
        lines.push(`    Data points: ${cat.totalDataPoints}`);
        lines.push(`    Average value: ${cat.averageValue}`);
      }
    }

    const metricNames = this.getAllMetricNames();
    if (metricNames.length > 0) {
      lines.push('');
      lines.push('--- By Metric ---');
      for (let i = 0; i < metricNames.length; i++) {
        const name = metricNames[i];
        const catList = this.getAllCategories();
        for (let j = 0; j < catList.length; j++) {
          const summary = this.getMetricSummary(name, catList[j]);
          if (summary.count > 0) {
            lines.push(`  ${name} [${catList[j]}]: count=${summary.count} avg=${summary.average} min=${summary.min} max=${summary.max}`);
          }
        }
      }
    }

    lines.push('');
    lines.push('=== End of Report ===');
    return lines.join('\n');
  }

  public clear(): void {
    this.dataPoints = [];
    hilog.info(DOMAIN, TAG, 'Metrics collector cleared');
  }

  public getDataPointCount(): number {
    return this.dataPoints.length;
  }

  public setMaxDataPoints(max: number): void {
    this.maxDataPoints = max;
  }
}
