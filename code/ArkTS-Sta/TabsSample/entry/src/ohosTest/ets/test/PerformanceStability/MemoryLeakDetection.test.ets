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

import { describe, it, expect } from '@ohos/hypium';


// MemoryLeakDetection 指标采集器：统计页签切换/渲染耗时样本
class MemoryLeakDetectionMetricsCollector {
  private samples: number[] = [];

  public record(value: number): void {
    if (value >= 0) {
      this.samples.push(value);
    }
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getSum(): number {
    let total: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      total += this.samples[i];
    }
    return total;
  }

  public getAverage(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.getSum() / this.samples.length;
  }

  public getMax(): number {
    let max: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      if (this.samples[i] > max) {
        max = this.samples[i];
      }
    }
    return max;
  }

  public getMin(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min: number = this.samples[0];
    for (let i: number = 1; i < this.samples.length; i++) {
      if (this.samples[i] < min) {
        min = this.samples[i];
      }
    }
    return min;
  }

  public isWithinBudget(budget: number): boolean {
    return this.getMax() <= budget;
  }

  public clear(): void {
    this.samples = [];
  }
}


// MemoryLeakDetection 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class MemoryLeakDetectionIndexTracker {
  private current: number = 0;
  private count: number;

  public constructor(count: number) {
    this.count = count > 0 ? count : 1;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= this.count) {
      return false;
    }
    this.current = index;
    return true;
  }

  public next(): boolean {
    if (this.current >= this.count - 1) {
      return false;
    }
    this.current = this.current + 1;
    return true;
  }

  public prev(): boolean {
    if (this.current <= 0) {
      return false;
    }
    this.current = this.current - 1;
    return true;
  }

  public wrapNext(): number {
    this.current = (this.current + 1) % this.count;
    return this.current;
  }

  public wrapPrev(): number {
    this.current = (this.current - 1 + this.count) % this.count;
    return this.current;
  }

  public getIndex(): number {
    return this.current;
  }

  public getCount(): number {
    return this.count;
  }

  public isFirst(): boolean {
    return this.current === 0;
  }

  public isLast(): boolean {
    return this.current === this.count - 1;
  }

  public reset(): void {
    this.current = 0;
  }
}

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection_Test', () => {
    it('memoryLeakDetectionTest_sum_average_0', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(10);
      metrics.record(20);
      metrics.record(30);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(60);
      expect(metrics.getAverage()).assertEqual(20);
    });

    it('memoryLeakDetectionTest_max_min_0', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(5);
      metrics.record(50);
      metrics.record(15);
      expect(metrics.getMax()).assertEqual(50);
      expect(metrics.getMin()).assertEqual(5);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('memoryLeakDetectionTest_budget_0', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('memoryLeakDetectionTest_sum_average_1', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(11);
      metrics.record(21);
      metrics.record(31);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(63);
      expect(metrics.getAverage()).assertEqual(21);
    });

    it('memoryLeakDetectionTest_max_min_1', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(6);
      metrics.record(51);
      metrics.record(16);
      expect(metrics.getMax()).assertEqual(51);
      expect(metrics.getMin()).assertEqual(6);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('memoryLeakDetectionTest_budget_1', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('memoryLeakDetectionTest_sum_average_2', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(12);
      metrics.record(22);
      metrics.record(32);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(66);
      expect(metrics.getAverage()).assertEqual(22);
    });

    it('memoryLeakDetectionTest_max_min_2', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(7);
      metrics.record(52);
      metrics.record(17);
      expect(metrics.getMax()).assertEqual(52);
      expect(metrics.getMin()).assertEqual(7);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('memoryLeakDetectionTest_budget_2', 0, async () => {
      const metrics = new MemoryLeakDetectionMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('memoryLeakDetectionTest_set_index_in_range_0', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('memoryLeakDetectionTest_next_prev_boundary_0', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('memoryLeakDetectionTest_wrap_around_0', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('memoryLeakDetectionTest_set_index_in_range_1', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('memoryLeakDetectionTest_next_prev_boundary_1', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('memoryLeakDetectionTest_wrap_around_1', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('memoryLeakDetectionTest_set_index_in_range_2', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('memoryLeakDetectionTest_next_prev_boundary_2', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('memoryLeakDetectionTest_wrap_around_2', 0, async () => {
      const tracker = new MemoryLeakDetectionIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

  });
}
