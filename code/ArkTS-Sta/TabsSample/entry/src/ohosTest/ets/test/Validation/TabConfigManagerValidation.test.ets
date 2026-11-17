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


// TabConfigManagerValidation 校验器：提供页签索引/输入范围等通用边界校验
class TabConfigManagerValidationValidator {
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


// TabConfigManagerValidation 配置表：模拟 STYLE_CONFIGURATION 的键值读取
class TabConfigManagerValidationConfig {
  private entries: Map<string, number> = new Map<string, number>();

  public set(key: string, value: number): void {
    this.entries.set(key, value);
  }

  public get(key: string, defaultValue: number): number {
    const value: number | undefined = this.entries.get(key);
    return value === undefined ? defaultValue : value;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public keys(): string[] {
    const result: string[] = [];
    this.entries.forEach((value: number, key: string) => {
      result.push(key);
    });
    return result;
  }

  public keyCount(): number {
    return this.entries.size;
  }

  public clear(): void {
    this.entries = new Map<string, number>();
  }
}


// TabConfigManagerValidation 数据集：模拟 TabDataSource/WaterFlowDataSource 的基础增删查
class TabConfigManagerValidationDataSet {
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


// TabConfigManagerValidation 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class TabConfigManagerValidationIndexTracker {
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


// TabConfigManagerValidation 历史记录：保存焦点/导航路径序列
class TabConfigManagerValidationHistory {
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

export default function tabConfigManagerValidationTest() {
  describe('TabConfigManagerValidation_Test', () => {
    it('tabConfigManagerValidationTest_range_checks_0', 0, async () => {
      expect(TabConfigManagerValidationValidator.isInRange(1, 0, 5)).assertTrue();
      expect(TabConfigManagerValidationValidator.isInRange(9, 0, 5)).assertFalse();
      expect(TabConfigManagerValidationValidator.isValidIndex(0, 3)).assertTrue();
      expect(TabConfigManagerValidationValidator.isValidIndex(3, 3)).assertFalse();
      expect(TabConfigManagerValidationValidator.isPositive(1)).assertTrue();
      expect(TabConfigManagerValidationValidator.isPositive(0)).assertFalse();
    });

    it('tabConfigManagerValidationTest_text_and_clamp_0', 0, async () => {
      expect(TabConfigManagerValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TabConfigManagerValidationValidator.isNonEmptyText('')).assertFalse();
      expect(TabConfigManagerValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TabConfigManagerValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TabConfigManagerValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('tabConfigManagerValidationTest_normalize_index_0', 0, async () => {
      expect(TabConfigManagerValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TabConfigManagerValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TabConfigManagerValidationValidator.normalizeIndex(7, 5)).assertEqual(2);
      expect(TabConfigManagerValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('tabConfigManagerValidationTest_range_checks_1', 0, async () => {
      expect(TabConfigManagerValidationValidator.isInRange(2, 0, 6)).assertTrue();
      expect(TabConfigManagerValidationValidator.isInRange(10, 0, 6)).assertFalse();
      expect(TabConfigManagerValidationValidator.isValidIndex(0, 4)).assertTrue();
      expect(TabConfigManagerValidationValidator.isValidIndex(4, 4)).assertFalse();
      expect(TabConfigManagerValidationValidator.isPositive(1)).assertTrue();
      expect(TabConfigManagerValidationValidator.isPositive(0)).assertFalse();
    });

    it('tabConfigManagerValidationTest_text_and_clamp_1', 0, async () => {
      expect(TabConfigManagerValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TabConfigManagerValidationValidator.isNonEmptyText('')).assertFalse();
      expect(TabConfigManagerValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TabConfigManagerValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TabConfigManagerValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('tabConfigManagerValidationTest_normalize_index_1', 0, async () => {
      expect(TabConfigManagerValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TabConfigManagerValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TabConfigManagerValidationValidator.normalizeIndex(8, 5)).assertEqual(3);
      expect(TabConfigManagerValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('tabConfigManagerValidationTest_range_checks_2', 0, async () => {
      expect(TabConfigManagerValidationValidator.isInRange(3, 0, 7)).assertTrue();
      expect(TabConfigManagerValidationValidator.isInRange(11, 0, 7)).assertFalse();
      expect(TabConfigManagerValidationValidator.isValidIndex(0, 5)).assertTrue();
      expect(TabConfigManagerValidationValidator.isValidIndex(5, 5)).assertFalse();
      expect(TabConfigManagerValidationValidator.isPositive(1)).assertTrue();
      expect(TabConfigManagerValidationValidator.isPositive(0)).assertFalse();
    });

    it('tabConfigManagerValidationTest_text_and_clamp_2', 0, async () => {
      expect(TabConfigManagerValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TabConfigManagerValidationValidator.isNonEmptyText('')).assertFalse();
      expect(TabConfigManagerValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TabConfigManagerValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TabConfigManagerValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('tabConfigManagerValidationTest_normalize_index_2', 0, async () => {
      expect(TabConfigManagerValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TabConfigManagerValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TabConfigManagerValidationValidator.normalizeIndex(9, 5)).assertEqual(4);
      expect(TabConfigManagerValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('tabConfigManagerValidationTest_set_get_0', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 3)).assertEqual(3);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabConfigManagerValidationTest_keys_and_clear_0', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabConfigManagerValidationTest_default_fallback_0', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      expect(config.get('UNKNOWN', 0)).assertEqual(0);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 1);
      expect(config.get('UNKNOWN', 0)).assertEqual(1);
    });

    it('tabConfigManagerValidationTest_set_get_1', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 4)).assertEqual(4);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabConfigManagerValidationTest_keys_and_clear_1', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabConfigManagerValidationTest_default_fallback_1', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      expect(config.get('UNKNOWN', 1)).assertEqual(1);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 2);
      expect(config.get('UNKNOWN', 0)).assertEqual(2);
    });

    it('tabConfigManagerValidationTest_set_get_2', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 5)).assertEqual(5);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabConfigManagerValidationTest_keys_and_clear_2', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabConfigManagerValidationTest_default_fallback_2', 0, async () => {
      const config = new TabConfigManagerValidationConfig();
      expect(config.get('UNKNOWN', 2)).assertEqual(2);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 3);
      expect(config.get('UNKNOWN', 0)).assertEqual(3);
    });

    it('tabConfigManagerValidationTest_add_contains_0', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(0);
      dataSet.add(1);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(0)).assertTrue();
      expect(dataSet.contains(9)).assertFalse();
      expect(dataSet.get(0)).assertEqual(0);
    });

    it('tabConfigManagerValidationTest_insert_remove_0', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabConfigManagerValidationTest_copy_and_clear_0', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(0);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_add_contains_1', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(1);
      dataSet.add(2);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(1)).assertTrue();
      expect(dataSet.contains(10)).assertFalse();
      expect(dataSet.get(0)).assertEqual(1);
    });

    it('tabConfigManagerValidationTest_insert_remove_1', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabConfigManagerValidationTest_copy_and_clear_1', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(1);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_add_contains_2', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(2);
      dataSet.add(3);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(2)).assertTrue();
      expect(dataSet.contains(11)).assertFalse();
      expect(dataSet.get(0)).assertEqual(2);
    });

    it('tabConfigManagerValidationTest_insert_remove_2', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('tabConfigManagerValidationTest_copy_and_clear_2', 0, async () => {
      const dataSet = new TabConfigManagerValidationDataSet();
      dataSet.add(2);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_set_index_in_range_0', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabConfigManagerValidationTest_next_prev_boundary_0', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabConfigManagerValidationTest_wrap_around_0', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabConfigManagerValidationTest_set_index_in_range_1', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabConfigManagerValidationTest_next_prev_boundary_1', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabConfigManagerValidationTest_wrap_around_1', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabConfigManagerValidationTest_set_index_in_range_2', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabConfigManagerValidationTest_next_prev_boundary_2', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabConfigManagerValidationTest_wrap_around_2', 0, async () => {
      const tracker = new TabConfigManagerValidationIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabConfigManagerValidationTest_append_and_access_0', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_monotonic_and_includes_0', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('tabConfigManagerValidationTest_copy_and_reset_0', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_append_and_access_1', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_monotonic_and_includes_1', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('tabConfigManagerValidationTest_copy_and_reset_1', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_append_and_access_2', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('tabConfigManagerValidationTest_monotonic_and_includes_2', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('tabConfigManagerValidationTest_copy_and_reset_2', 0, async () => {
      const history = new TabConfigManagerValidationHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

  });
}
