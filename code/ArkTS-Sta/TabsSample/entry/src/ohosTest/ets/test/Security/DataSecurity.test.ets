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


// DataSecurity 校验器：提供页签索引/输入范围等通用边界校验
class DataSecurityValidator {
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


// DataSecurity 仓储：以键值保存页签/文章的映射关系
class DataSecurityRepository {
  private store: Map<string, string> = new Map<string, string>();

  public put(key: string, value: string): void {
    this.store.set(key, value);
  }

  public get(key: string): string {
    const value: string | undefined = this.store.get(key);
    return value === undefined ? '' : value;
  }

  public update(key: string, value: string): boolean {
    if (!this.store.has(key)) {
      return false;
    }
    this.store.set(key, value);
    return true;
  }

  public remove(key: string): boolean {
    return this.store.delete(key);
  }

  public has(key: string): boolean {
    return this.store.has(key);
  }

  public size(): number {
    return this.store.size;
  }

  public clear(): void {
    this.store = new Map<string, string>();
  }
}


// DataSecurity 注册表：以键统计页签/配置条目数量，覆盖增删与去重
class DataSecurityRegistry {
  private items: Map<string, number> = new Map<string, number>();

  public add(key: string, value: number): void {
    if (!this.items.has(key)) {
      this.items.set(key, value);
    }
  }

  public update(key: string, value: number): boolean {
    if (!this.items.has(key)) {
      return false;
    }
    this.items.set(key, value);
    return true;
  }

  public get(key: string): number {
    const value: number | undefined = this.items.get(key);
    return value === undefined ? -1 : value;
  }

  public has(key: string): boolean {
    return this.items.has(key);
  }

  public remove(key: string): boolean {
    return this.items.delete(key);
  }

  public size(): number {
    return this.items.size;
  }

  public totalValue(): number {
    let total: number = 0;
    this.items.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public clear(): void {
    this.items = new Map<string, number>();
  }
}


// DataSecurity 数据集：模拟 TabDataSource/WaterFlowDataSource 的基础增删查
class DataSecurityDataSet {
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


// DataSecurity 配置表：模拟 STYLE_CONFIGURATION 的键值读取
class DataSecurityConfig {
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

export default function dataSecurityTest() {
  describe('DataSecurity_Test', () => {
    it('dataSecurityTest_range_checks_0', 0, async () => {
      expect(DataSecurityValidator.isInRange(1, 0, 5)).assertTrue();
      expect(DataSecurityValidator.isInRange(9, 0, 5)).assertFalse();
      expect(DataSecurityValidator.isValidIndex(0, 3)).assertTrue();
      expect(DataSecurityValidator.isValidIndex(3, 3)).assertFalse();
      expect(DataSecurityValidator.isPositive(1)).assertTrue();
      expect(DataSecurityValidator.isPositive(0)).assertFalse();
    });

    it('dataSecurityTest_text_and_clamp_0', 0, async () => {
      expect(DataSecurityValidator.isNonEmptyText('tabs')).assertTrue();
      expect(DataSecurityValidator.isNonEmptyText('')).assertFalse();
      expect(DataSecurityValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(DataSecurityValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(DataSecurityValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('dataSecurityTest_normalize_index_0', 0, async () => {
      expect(DataSecurityValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(DataSecurityValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(DataSecurityValidator.normalizeIndex(7, 5)).assertEqual(2);
      expect(DataSecurityValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('dataSecurityTest_range_checks_1', 0, async () => {
      expect(DataSecurityValidator.isInRange(2, 0, 6)).assertTrue();
      expect(DataSecurityValidator.isInRange(10, 0, 6)).assertFalse();
      expect(DataSecurityValidator.isValidIndex(0, 4)).assertTrue();
      expect(DataSecurityValidator.isValidIndex(4, 4)).assertFalse();
      expect(DataSecurityValidator.isPositive(1)).assertTrue();
      expect(DataSecurityValidator.isPositive(0)).assertFalse();
    });

    it('dataSecurityTest_text_and_clamp_1', 0, async () => {
      expect(DataSecurityValidator.isNonEmptyText('tabs')).assertTrue();
      expect(DataSecurityValidator.isNonEmptyText('')).assertFalse();
      expect(DataSecurityValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(DataSecurityValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(DataSecurityValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('dataSecurityTest_normalize_index_1', 0, async () => {
      expect(DataSecurityValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(DataSecurityValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(DataSecurityValidator.normalizeIndex(8, 5)).assertEqual(3);
      expect(DataSecurityValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('dataSecurityTest_range_checks_2', 0, async () => {
      expect(DataSecurityValidator.isInRange(3, 0, 7)).assertTrue();
      expect(DataSecurityValidator.isInRange(11, 0, 7)).assertFalse();
      expect(DataSecurityValidator.isValidIndex(0, 5)).assertTrue();
      expect(DataSecurityValidator.isValidIndex(5, 5)).assertFalse();
      expect(DataSecurityValidator.isPositive(1)).assertTrue();
      expect(DataSecurityValidator.isPositive(0)).assertFalse();
    });

    it('dataSecurityTest_text_and_clamp_2', 0, async () => {
      expect(DataSecurityValidator.isNonEmptyText('tabs')).assertTrue();
      expect(DataSecurityValidator.isNonEmptyText('')).assertFalse();
      expect(DataSecurityValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(DataSecurityValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(DataSecurityValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('dataSecurityTest_normalize_index_2', 0, async () => {
      expect(DataSecurityValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(DataSecurityValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(DataSecurityValidator.normalizeIndex(9, 5)).assertEqual(4);
      expect(DataSecurityValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('dataSecurityTest_put_get_0', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('tab0', 'page0');
      expect(repo.has('tab0')).assertTrue();
      expect(repo.get('tab0')).assertEqual('page0');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('dataSecurityTest_update_remove_0', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('dataSecurityTest_clear_0', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('dataSecurityTest_put_get_1', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('tab1', 'page1');
      expect(repo.has('tab1')).assertTrue();
      expect(repo.get('tab1')).assertEqual('page1');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('dataSecurityTest_update_remove_1', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('dataSecurityTest_clear_1', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('dataSecurityTest_put_get_2', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('tab2', 'page2');
      expect(repo.has('tab2')).assertTrue();
      expect(repo.get('tab2')).assertEqual('page2');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('dataSecurityTest_update_remove_2', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('dataSecurityTest_clear_2', 0, async () => {
      const repo = new DataSecurityRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('dataSecurityTest_add_and_query_0', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('tab0', 1);
      expect(registry.has('tab0')).assertTrue();
      expect(registry.get('tab0')).assertEqual(1);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab0', 99);
      expect(registry.get('tab0')).assertEqual(1);
      expect(registry.size()).assertEqual(1);
    });

    it('dataSecurityTest_registry_update_remove_0', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('tab0', 1);
      expect(registry.update('tab0', 2)).assertTrue();
      expect(registry.get('tab0')).assertEqual(2);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab0')).assertTrue();
      expect(registry.has('tab0')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('dataSecurityTest_total_value_0', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('a', 1);
      registry.add('b', 2);
      expect(registry.totalValue()).assertEqual(3);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

    it('dataSecurityTest_add_and_query_1', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('tab1', 2);
      expect(registry.has('tab1')).assertTrue();
      expect(registry.get('tab1')).assertEqual(2);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab1', 99);
      expect(registry.get('tab1')).assertEqual(2);
      expect(registry.size()).assertEqual(1);
    });

    it('dataSecurityTest_registry_update_remove_1', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('tab1', 1);
      expect(registry.update('tab1', 3)).assertTrue();
      expect(registry.get('tab1')).assertEqual(3);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab1')).assertTrue();
      expect(registry.has('tab1')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('dataSecurityTest_total_value_1', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('a', 2);
      registry.add('b', 3);
      expect(registry.totalValue()).assertEqual(5);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

    it('dataSecurityTest_add_and_query_2', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('tab2', 3);
      expect(registry.has('tab2')).assertTrue();
      expect(registry.get('tab2')).assertEqual(3);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab2', 99);
      expect(registry.get('tab2')).assertEqual(3);
      expect(registry.size()).assertEqual(1);
    });

    it('dataSecurityTest_registry_update_remove_2', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('tab2', 1);
      expect(registry.update('tab2', 4)).assertTrue();
      expect(registry.get('tab2')).assertEqual(4);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab2')).assertTrue();
      expect(registry.has('tab2')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('dataSecurityTest_total_value_2', 0, async () => {
      const registry = new DataSecurityRegistry();
      registry.add('a', 3);
      registry.add('b', 4);
      expect(registry.totalValue()).assertEqual(7);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

    it('dataSecurityTest_add_contains_0', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(0);
      dataSet.add(1);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(0)).assertTrue();
      expect(dataSet.contains(9)).assertFalse();
      expect(dataSet.get(0)).assertEqual(0);
    });

    it('dataSecurityTest_insert_remove_0', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('dataSecurityTest_copy_and_clear_0', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(0);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('dataSecurityTest_add_contains_1', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(1);
      dataSet.add(2);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(1)).assertTrue();
      expect(dataSet.contains(10)).assertFalse();
      expect(dataSet.get(0)).assertEqual(1);
    });

    it('dataSecurityTest_insert_remove_1', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('dataSecurityTest_copy_and_clear_1', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(1);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('dataSecurityTest_add_contains_2', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(2);
      dataSet.add(3);
      expect(dataSet.size()).assertEqual(2);
      expect(dataSet.contains(2)).assertTrue();
      expect(dataSet.contains(11)).assertFalse();
      expect(dataSet.get(0)).assertEqual(2);
    });

    it('dataSecurityTest_insert_remove_2', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(1);
      dataSet.add(3);
      expect(dataSet.insert(1, 2)).assertTrue();
      expect(dataSet.get(1)).assertEqual(2);
      expect(dataSet.insert(-1, 0)).assertFalse();
      expect(dataSet.remove(2)).assertTrue();
      expect(dataSet.remove(99)).assertFalse();
      expect(dataSet.size()).assertEqual(2);
    });

    it('dataSecurityTest_copy_and_clear_2', 0, async () => {
      const dataSet = new DataSecurityDataSet();
      dataSet.add(2);
      const copy: number[] = dataSet.toArray();
      copy.push(100);
      expect(dataSet.size()).assertEqual(1);
      dataSet.clear();
      expect(dataSet.size()).assertEqual(0);
      expect(dataSet.get(0)).assertEqual(-1);
    });

    it('dataSecurityTest_set_get_0', 0, async () => {
      const config = new DataSecurityConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 3)).assertEqual(3);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('dataSecurityTest_keys_and_clear_0', 0, async () => {
      const config = new DataSecurityConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('dataSecurityTest_default_fallback_0', 0, async () => {
      const config = new DataSecurityConfig();
      expect(config.get('UNKNOWN', 0)).assertEqual(0);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 1);
      expect(config.get('UNKNOWN', 0)).assertEqual(1);
    });

    it('dataSecurityTest_set_get_1', 0, async () => {
      const config = new DataSecurityConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 4)).assertEqual(4);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('dataSecurityTest_keys_and_clear_1', 0, async () => {
      const config = new DataSecurityConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('dataSecurityTest_default_fallback_1', 0, async () => {
      const config = new DataSecurityConfig();
      expect(config.get('UNKNOWN', 1)).assertEqual(1);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 2);
      expect(config.get('UNKNOWN', 0)).assertEqual(2);
    });

    it('dataSecurityTest_set_get_2', 0, async () => {
      const config = new DataSecurityConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 5)).assertEqual(5);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('dataSecurityTest_keys_and_clear_2', 0, async () => {
      const config = new DataSecurityConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('dataSecurityTest_default_fallback_2', 0, async () => {
      const config = new DataSecurityConfig();
      expect(config.get('UNKNOWN', 2)).assertEqual(2);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 3);
      expect(config.get('UNKNOWN', 0)).assertEqual(3);
    });

  });
}
