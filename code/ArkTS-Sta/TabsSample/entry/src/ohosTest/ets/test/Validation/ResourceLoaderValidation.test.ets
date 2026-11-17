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


// ResourceLoaderValidation 校验器：提供页签索引/输入范围等通用边界校验
class ResourceLoaderValidationValidator {
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


// ResourceLoaderValidation 配置表：模拟 STYLE_CONFIGURATION 的键值读取
class ResourceLoaderValidationConfig {
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


// ResourceLoaderValidation 数据集：模拟 TabDataSource/WaterFlowDataSource 的基础增删查
class ResourceLoaderValidationDataSet {
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


// ResourceLoaderValidation 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class ResourceLoaderValidationIndexTracker {
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

export default function resourceLoaderValidationTest() {
  describe('ResourceLoaderValidation_Test', () => {
    it('resourceLoaderValidationTest_range_checks_0', 0, async () => {
      expect(ResourceLoaderValidationValidator.isInRange(1, 0, 5)).assertTrue();
      expect(ResourceLoaderValidationValidator.isInRange(9, 0, 5)).assertFalse();
      expect(ResourceLoaderValidationValidator.isValidIndex(0, 3)).assertTrue();
      expect(ResourceLoaderValidationValidator.isValidIndex(3, 3)).assertFalse();
      expect(ResourceLoaderValidationValidator.isPositive(1)).assertTrue();
      expect(ResourceLoaderValidationValidator.isPositive(0)).assertFalse();
    });

    it('resourceLoaderValidationTest_text_and_clamp_0', 0, async () => {
      expect(ResourceLoaderValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(ResourceLoaderValidationValidator.isNonEmptyText('')).assertFalse();
      expect(ResourceLoaderValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(ResourceLoaderValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(ResourceLoaderValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('resourceLoaderValidationTest_normalize_index_0', 0, async () => {
      expect(ResourceLoaderValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(ResourceLoaderValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(ResourceLoaderValidationValidator.normalizeIndex(7, 5)).assertEqual(2);
      expect(ResourceLoaderValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('resourceLoaderValidationTest_range_checks_1', 0, async () => {
      expect(ResourceLoaderValidationValidator.isInRange(2, 0, 6)).assertTrue();
      expect(ResourceLoaderValidationValidator.isInRange(10, 0, 6)).assertFalse();
      expect(ResourceLoaderValidationValidator.isValidIndex(0, 4)).assertTrue();
      expect(ResourceLoaderValidationValidator.isValidIndex(4, 4)).assertFalse();
      expect(ResourceLoaderValidationValidator.isPositive(1)).assertTrue();
      expect(ResourceLoaderValidationValidator.isPositive(0)).assertFalse();
    });

    it('resourceLoaderValidationTest_text_and_clamp_1', 0, async () => {
      expect(ResourceLoaderValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(ResourceLoaderValidationValidator.isNonEmptyText('')).assertFalse();
      expect(ResourceLoaderValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(ResourceLoaderValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(ResourceLoaderValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('resourceLoaderValidationTest_normalize_index_1', 0, async () => {
      expect(ResourceLoaderValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(ResourceLoaderValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(ResourceLoaderValidationValidator.normalizeIndex(8, 5)).assertEqual(3);
      expect(ResourceLoaderValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('resourceLoaderValidationTest_range_checks_2', 0, async () => {
      expect(ResourceLoaderValidationValidator.isInRange(3, 0, 7)).assertTrue();
      expect(ResourceLoaderValidationValidator.isInRange(11, 0, 7)).assertFalse();
      expect(ResourceLoaderValidationValidator.isValidIndex(0, 5)).assertTrue();
      expect(ResourceLoaderValidationValidator.isValidIndex(5, 5)).assertFalse();
      expect(ResourceLoaderValidationValidator.isPositive(1)).assertTrue();
      expect(ResourceLoaderValidationValidator.isPositive(0)).assertFalse();
    });

    it('resourceLoaderValidationTest_text_and_clamp_2', 0, async () => {
      expect(ResourceLoaderValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(ResourceLoaderValidationValidator.isNonEmptyText('')).assertFalse();
      expect(ResourceLoaderValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(ResourceLoaderValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(ResourceLoaderValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('resourceLoaderValidationTest_normalize_index_2', 0, async () => {
      expect(ResourceLoaderValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(ResourceLoaderValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(ResourceLoaderValidationValidator.normalizeIndex(9, 5)).assertEqual(4);
      expect(ResourceLoaderValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('resourceLoaderValidationTest_set_get_0', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 3)).assertEqual(3);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('resourceLoaderValidationTest_keys_and_clear_0', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('resourceLoaderValidationTest_default_fallback_0', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      expect(config.get('UNKNOWN', 0)).assertEqual(0);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 1);
      expect(config.get('UNKNOWN', 0)).assertEqual(1);
    });

    it('resourceLoaderValidationTest_set_get_1', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 4)).assertEqual(4);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('resourceLoaderValidationTest_keys_and_clear_1', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('resourceLoaderValidationTest_default_fallback_1', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      expect(config.get('UNKNOWN', 1)).assertEqual(1);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 2);
      expect(config.get('UNKNOWN', 0)).assertEqual(2);
    });

    it('resourceLoaderValidationTest_set_get_2', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 5)).assertEqual(5);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('resourceLoaderValidationTest_keys_and_clear_2', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('resourceLoaderValidationTest_default_fallback_2', 0, async () => {
      const config = new ResourceLoaderValidationConfig();
      expect(config.get('UNKNOWN', 2)).assertEqual(2);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 3);
      expect(config.get('UNKNOWN', 0)).assertEqual(3);
    });

    it('resourceLoaderValidationTest_add_contains_0', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(0);
      dataSet.add(1);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(0)).assertTrue();
      expect(dataSet.contains(9)).assertFalse();
      expect(dataSet.get(0)).assertEqual(0);
    });

    it('resourceLoaderValidationTest_insert_remove_0', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('resourceLoaderValidationTest_copy_and_clear_0', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(0);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('resourceLoaderValidationTest_add_contains_1', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(1);
      dataSet.add(2);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(1)).assertTrue();
      expect(dataSet.contains(10)).assertFalse();
      expect(dataSet.get(0)).assertEqual(1);
    });

    it('resourceLoaderValidationTest_insert_remove_1', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('resourceLoaderValidationTest_copy_and_clear_1', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(1);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('resourceLoaderValidationTest_add_contains_2', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(2);
      dataSet.add(3);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(2)).assertTrue();
      expect(dataSet.contains(11)).assertFalse();
      expect(dataSet.get(0)).assertEqual(2);
    });

    it('resourceLoaderValidationTest_insert_remove_2', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('resourceLoaderValidationTest_copy_and_clear_2', 0, async () => {
      const dataSet = new ResourceLoaderValidationDataSet();
      dataSet.add(2);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('resourceLoaderValidationTest_set_index_in_range_0', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('resourceLoaderValidationTest_next_prev_boundary_0', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('resourceLoaderValidationTest_wrap_around_0', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('resourceLoaderValidationTest_set_index_in_range_1', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('resourceLoaderValidationTest_next_prev_boundary_1', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('resourceLoaderValidationTest_wrap_around_1', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('resourceLoaderValidationTest_set_index_in_range_2', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('resourceLoaderValidationTest_next_prev_boundary_2', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('resourceLoaderValidationTest_wrap_around_2', 0, async () => {
      const tracker = new ResourceLoaderValidationIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

  });
}
