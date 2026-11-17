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


// AnimationPerformance 指标采集器：统计页签切换/渲染耗时样本
class AnimationPerformanceMetricsCollector {
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


// AnimationPerformance 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class AnimationPerformanceIndexTracker {
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


// AnimationPerformance 数据集：模拟 TabDataSource/WaterFlowDataSource 的基础增删查
class AnimationPerformanceDataSet {
  private values: number[] = [];

  public add(value: number): void {
    this.values.push(value);
  }

  public insert(index: number, value: number): boolean {
    if (index < 0 || index > this.values.length) {
      return false;
    }
    this.values.splice(index, 0, value);
    return true;
  }

  public remove(value: number): boolean {
    const pos: number = this.values.indexOf(value);
    if (pos < 0) {
      return false;
    }
    this.values.splice(pos, 1);
    return true;
  }

  public contains(value: number): boolean {
    return this.values.indexOf(value) >= 0;
  }

  public size(): number {
    return this.values.length;
  }

  public get(index: number): number {
    return (index >= 0 && index < this.values.length) ? this.values[index] : -1;
  }

  public toArray(): number[] {
    const copy: number[] = [];
    for (let i: number = 0; i < this.values.length; i++) {
      copy.push(this.values[i]);
    }
    return copy;
  }

  public clear(): void {
    this.values = [];
  }
}


// AnimationPerformance 历史记录：保存焦点/导航路径序列
class AnimationPerformanceHistory {
  private items: number[] = [];

  public append(value: number): void {
    this.items.push(value);
  }

  public get(index: number): number {
    if (index < 0 || index >= this.items.length) {
      return -1;
    }
    return this.items[index];
  }

  public length(): number {
    return this.items.length;
  }

  public first(): number {
    return this.items.length === 0 ? -1 : this.items[0];
  }

  public last(): number {
    return this.items.length === 0 ? -1 : this.items[this.items.length - 1];
  }

  public includes(value: number): boolean {
    return this.items.indexOf(value) >= 0;
  }

  public isMonotonicIncreasing(): boolean {
    for (let i: number = 1; i < this.items.length; i++) {
      if (this.items[i] < this.items[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public toArray(): number[] {
    const copy: number[] = [];
    for (let i: number = 0; i < this.items.length; i++) {
      copy.push(this.items[i]);
    }
    return copy;
  }

  public reset(): void {
    this.items = [];
  }
}


// AnimationPerformance 校验器：提供页签索引/输入范围等通用边界校验
class AnimationPerformanceValidator {
  public static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public static isValidIndex(index: number, count: number): boolean {
    return index >= 0 && index < count;
  }

  public static isNonEmptyText(text: string): boolean {
    return text.length > 0;
  }

  public static isPositive(value: number): boolean {
    return value > 0;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static normalizeIndex(index: number, count: number): number {
    if (count <= 0) {
      return 0;
    }
    const mod: number = index % count;
    return mod < 0 ? mod + count : mod;
  }
}

export default function animationPerformanceTest() {
  describe('AnimationPerformance_Test', () => {
    it('animationPerformanceTest_sum_average_0', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(10);
      metrics.record(20);
      metrics.record(30);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(60);
      expect(metrics.getAverage()).assertEqual(20);
    });

    it('animationPerformanceTest_max_min_0', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(5);
      metrics.record(50);
      metrics.record(15);
      expect(metrics.getMax()).assertEqual(50);
      expect(metrics.getMin()).assertEqual(5);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('animationPerformanceTest_budget_0', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('animationPerformanceTest_sum_average_1', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(11);
      metrics.record(21);
      metrics.record(31);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(63);
      expect(metrics.getAverage()).assertEqual(21);
    });

    it('animationPerformanceTest_max_min_1', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(6);
      metrics.record(51);
      metrics.record(16);
      expect(metrics.getMax()).assertEqual(51);
      expect(metrics.getMin()).assertEqual(6);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('animationPerformanceTest_budget_1', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('animationPerformanceTest_sum_average_2', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(12);
      metrics.record(22);
      metrics.record(32);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(66);
      expect(metrics.getAverage()).assertEqual(22);
    });

    it('animationPerformanceTest_max_min_2', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(7);
      metrics.record(52);
      metrics.record(17);
      expect(metrics.getMax()).assertEqual(52);
      expect(metrics.getMin()).assertEqual(7);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('animationPerformanceTest_budget_2', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('animationPerformanceTest_set_index_in_range_0', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('animationPerformanceTest_next_prev_boundary_0', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('animationPerformanceTest_wrap_around_0', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('animationPerformanceTest_set_index_in_range_1', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('animationPerformanceTest_next_prev_boundary_1', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('animationPerformanceTest_wrap_around_1', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('animationPerformanceTest_set_index_in_range_2', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('animationPerformanceTest_next_prev_boundary_2', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('animationPerformanceTest_wrap_around_2', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('animationPerformanceTest_add_contains_0', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(0);
      dataSet.add(1);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(0)).assertTrue();
      expect(dataSet.contains(9)).assertFalse();
      expect(dataSet.get(0)).assertEqual(0);
    });

    it('animationPerformanceTest_insert_remove_0', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('animationPerformanceTest_copy_and_clear_0', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(0);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('animationPerformanceTest_add_contains_1', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(1);
      dataSet.add(2);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(1)).assertTrue();
      expect(dataSet.contains(10)).assertFalse();
      expect(dataSet.get(0)).assertEqual(1);
    });

    it('animationPerformanceTest_insert_remove_1', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('animationPerformanceTest_copy_and_clear_1', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(1);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('animationPerformanceTest_add_contains_2', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(2);
      dataSet.add(3);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(2)).assertTrue();
      expect(dataSet.contains(11)).assertFalse();
      expect(dataSet.get(0)).assertEqual(2);
    });

    it('animationPerformanceTest_insert_remove_2', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('animationPerformanceTest_copy_and_clear_2', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(2);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('animationPerformanceTest_append_and_access_0', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('animationPerformanceTest_monotonic_and_includes_0', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('animationPerformanceTest_copy_and_reset_0', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('animationPerformanceTest_append_and_access_1', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('animationPerformanceTest_monotonic_and_includes_1', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('animationPerformanceTest_copy_and_reset_1', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('animationPerformanceTest_append_and_access_2', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('animationPerformanceTest_monotonic_and_includes_2', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('animationPerformanceTest_copy_and_reset_2', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('animationPerformanceTest_range_checks_0', 0, async () => {
      expect(AnimationPerformanceValidator.isInRange(1, 0, 5)).assertTrue();
      expect(AnimationPerformanceValidator.isInRange(9, 0, 5)).assertFalse();
      expect(AnimationPerformanceValidator.isValidIndex(0, 3)).assertTrue();
      expect(AnimationPerformanceValidator.isValidIndex(3, 3)).assertFalse();
      expect(AnimationPerformanceValidator.isPositive(1)).assertTrue();
      expect(AnimationPerformanceValidator.isPositive(0)).assertFalse();
    });

    it('animationPerformanceTest_text_and_clamp_0', 0, async () => {
      expect(AnimationPerformanceValidator.isNonEmptyText('tabs')).assertTrue();
      expect(AnimationPerformanceValidator.isNonEmptyText('')).assertFalse();
      expect(AnimationPerformanceValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(AnimationPerformanceValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(AnimationPerformanceValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('animationPerformanceTest_normalize_index_0', 0, async () => {
      expect(AnimationPerformanceValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(AnimationPerformanceValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(AnimationPerformanceValidator.normalizeIndex(7, 5)).assertEqual(2);
      expect(AnimationPerformanceValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('animationPerformanceTest_range_checks_1', 0, async () => {
      expect(AnimationPerformanceValidator.isInRange(2, 0, 6)).assertTrue();
      expect(AnimationPerformanceValidator.isInRange(10, 0, 6)).assertFalse();
      expect(AnimationPerformanceValidator.isValidIndex(0, 4)).assertTrue();
      expect(AnimationPerformanceValidator.isValidIndex(4, 4)).assertFalse();
      expect(AnimationPerformanceValidator.isPositive(1)).assertTrue();
      expect(AnimationPerformanceValidator.isPositive(0)).assertFalse();
    });

    it('animationPerformanceTest_text_and_clamp_1', 0, async () => {
      expect(AnimationPerformanceValidator.isNonEmptyText('tabs')).assertTrue();
      expect(AnimationPerformanceValidator.isNonEmptyText('')).assertFalse();
      expect(AnimationPerformanceValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(AnimationPerformanceValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(AnimationPerformanceValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('animationPerformanceTest_normalize_index_1', 0, async () => {
      expect(AnimationPerformanceValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(AnimationPerformanceValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(AnimationPerformanceValidator.normalizeIndex(8, 5)).assertEqual(3);
      expect(AnimationPerformanceValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('animationPerformanceTest_range_checks_2', 0, async () => {
      expect(AnimationPerformanceValidator.isInRange(3, 0, 7)).assertTrue();
      expect(AnimationPerformanceValidator.isInRange(11, 0, 7)).assertFalse();
      expect(AnimationPerformanceValidator.isValidIndex(0, 5)).assertTrue();
      expect(AnimationPerformanceValidator.isValidIndex(5, 5)).assertFalse();
      expect(AnimationPerformanceValidator.isPositive(1)).assertTrue();
      expect(AnimationPerformanceValidator.isPositive(0)).assertFalse();
    });

    it('animationPerformanceTest_text_and_clamp_2', 0, async () => {
      expect(AnimationPerformanceValidator.isNonEmptyText('tabs')).assertTrue();
      expect(AnimationPerformanceValidator.isNonEmptyText('')).assertFalse();
      expect(AnimationPerformanceValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(AnimationPerformanceValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(AnimationPerformanceValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('animationPerformanceTest_normalize_index_2', 0, async () => {
      expect(AnimationPerformanceValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(AnimationPerformanceValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(AnimationPerformanceValidator.normalizeIndex(9, 5)).assertEqual(4);
      expect(AnimationPerformanceValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('animationPerformanceTest_max_min_1_p1', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(6);
      metrics.record(51);
      metrics.record(16);
      expect(metrics.getMax()).assertEqual(51);
      expect(metrics.getMin()).assertEqual(6);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('animationPerformanceTest_wrap_around_2_p2', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('animationPerformanceTest_add_contains_3_p3', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(3);
      dataSet.add(4);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(3)).assertTrue();
      expect(dataSet.contains(12)).assertFalse();
      expect(dataSet.get(0)).assertEqual(3);
    });

    it('animationPerformanceTest_monotonic_and_includes_4_p4', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('animationPerformanceTest_normalize_index_5_p5', 0, async () => {
      expect(AnimationPerformanceValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(AnimationPerformanceValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(AnimationPerformanceValidator.normalizeIndex(12, 5)).assertEqual(2);
      expect(AnimationPerformanceValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('animationPerformanceTest_sum_average_6_p6', 0, async () => {
      const metrics = new AnimationPerformanceMetricsCollector();
      metrics.record(16);
      metrics.record(26);
      metrics.record(36);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(78);
      expect(metrics.getAverage()).assertEqual(26);
    });

    it('animationPerformanceTest_next_prev_boundary_7_p7', 0, async () => {
      const tracker = new AnimationPerformanceIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('animationPerformanceTest_copy_and_clear_8_p8', 0, async () => {
      const dataSet = new AnimationPerformanceDataSet();
      dataSet.add(8);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('animationPerformanceTest_append_and_access_9_p9', 0, async () => {
      const history = new AnimationPerformanceHistory();
      history.append(9);
      history.append(10);
      history.append(11);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(9);
      expect(history.last()).assertEqual(11);
      expect(history.get(1)).assertEqual(10);
      expect(history.get(99)).assertEqual(-1);
    });

    it('animationPerformanceTest_text_and_clamp_10_p10', 0, async () => {
      expect(AnimationPerformanceValidator.isNonEmptyText('tabs')).assertTrue();
      expect(AnimationPerformanceValidator.isNonEmptyText('')).assertFalse();
      expect(AnimationPerformanceValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(AnimationPerformanceValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(AnimationPerformanceValidator.clamp(5, 0, 10)).assertEqual(5);
    });

  });
}
