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


// SecurityValidation 校验器：提供页签索引/输入范围等通用边界校验
class SecurityValidationValidator {
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


// SecurityValidation 仓储：以键值保存页签/文章的映射关系
class SecurityValidationRepository {
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


// SecurityValidation 注册表：以键统计页签/配置条目数量，覆盖增删与去重
class SecurityValidationRegistry {
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

export default function securityValidationTest() {
  describe('SecurityValidation_Test', () => {
    it('securityValidationTest_range_checks_0', 0, async () => {
      expect(SecurityValidationValidator.isInRange(1, 0, 5)).assertTrue();
      expect(SecurityValidationValidator.isInRange(9, 0, 5)).assertFalse();
      expect(SecurityValidationValidator.isValidIndex(0, 3)).assertTrue();
      expect(SecurityValidationValidator.isValidIndex(3, 3)).assertFalse();
      expect(SecurityValidationValidator.isPositive(1)).assertTrue();
      expect(SecurityValidationValidator.isPositive(0)).assertFalse();
    });

    it('securityValidationTest_text_and_clamp_0', 0, async () => {
      expect(SecurityValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(SecurityValidationValidator.isNonEmptyText('')).assertFalse();
      expect(SecurityValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(SecurityValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(SecurityValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('securityValidationTest_normalize_index_0', 0, async () => {
      expect(SecurityValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(SecurityValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(SecurityValidationValidator.normalizeIndex(7, 5)).assertEqual(2);
      expect(SecurityValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('securityValidationTest_range_checks_1', 0, async () => {
      expect(SecurityValidationValidator.isInRange(2, 0, 6)).assertTrue();
      expect(SecurityValidationValidator.isInRange(10, 0, 6)).assertFalse();
      expect(SecurityValidationValidator.isValidIndex(0, 4)).assertTrue();
      expect(SecurityValidationValidator.isValidIndex(4, 4)).assertFalse();
      expect(SecurityValidationValidator.isPositive(1)).assertTrue();
      expect(SecurityValidationValidator.isPositive(0)).assertFalse();
    });

    it('securityValidationTest_text_and_clamp_1', 0, async () => {
      expect(SecurityValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(SecurityValidationValidator.isNonEmptyText('')).assertFalse();
      expect(SecurityValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(SecurityValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(SecurityValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('securityValidationTest_normalize_index_1', 0, async () => {
      expect(SecurityValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(SecurityValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(SecurityValidationValidator.normalizeIndex(8, 5)).assertEqual(3);
      expect(SecurityValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('securityValidationTest_range_checks_2', 0, async () => {
      expect(SecurityValidationValidator.isInRange(3, 0, 7)).assertTrue();
      expect(SecurityValidationValidator.isInRange(11, 0, 7)).assertFalse();
      expect(SecurityValidationValidator.isValidIndex(0, 5)).assertTrue();
      expect(SecurityValidationValidator.isValidIndex(5, 5)).assertFalse();
      expect(SecurityValidationValidator.isPositive(1)).assertTrue();
      expect(SecurityValidationValidator.isPositive(0)).assertFalse();
    });

    it('securityValidationTest_text_and_clamp_2', 0, async () => {
      expect(SecurityValidationValidator.isNonEmptyText('tabs')).assertTrue();
      expect(SecurityValidationValidator.isNonEmptyText('')).assertFalse();
      expect(SecurityValidationValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(SecurityValidationValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(SecurityValidationValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('securityValidationTest_normalize_index_2', 0, async () => {
      expect(SecurityValidationValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(SecurityValidationValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(SecurityValidationValidator.normalizeIndex(9, 5)).assertEqual(4);
      expect(SecurityValidationValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('securityValidationTest_put_get_0', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('tab0', 'page0');
      expect(repo.has('tab0')).assertTrue();
      expect(repo.get('tab0')).assertEqual('page0');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('securityValidationTest_update_remove_0', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('securityValidationTest_clear_0', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('securityValidationTest_put_get_1', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('tab1', 'page1');
      expect(repo.has('tab1')).assertTrue();
      expect(repo.get('tab1')).assertEqual('page1');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('securityValidationTest_update_remove_1', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('securityValidationTest_clear_1', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('securityValidationTest_put_get_2', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('tab2', 'page2');
      expect(repo.has('tab2')).assertTrue();
      expect(repo.get('tab2')).assertEqual('page2');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('securityValidationTest_update_remove_2', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('securityValidationTest_clear_2', 0, async () => {
      const repo = new SecurityValidationRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('securityValidationTest_add_and_query_0', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('tab0', 1);
      expect(registry.has('tab0')).assertTrue();
      expect(registry.get('tab0')).assertEqual(1);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab0', 99);
      expect(registry.get('tab0')).assertEqual(1);
      expect(registry.size()).assertEqual(1);
    });

    it('securityValidationTest_registry_update_remove_0', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('tab0', 1);
      expect(registry.update('tab0', 2)).assertTrue();
      expect(registry.get('tab0')).assertEqual(2);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab0')).assertTrue();
      expect(registry.has('tab0')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('securityValidationTest_total_value_0', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('a', 1);
      registry.add('b', 2);
      expect(registry.totalValue()).assertEqual(3);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

    it('securityValidationTest_add_and_query_1', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('tab1', 2);
      expect(registry.has('tab1')).assertTrue();
      expect(registry.get('tab1')).assertEqual(2);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab1', 99);
      expect(registry.get('tab1')).assertEqual(2);
      expect(registry.size()).assertEqual(1);
    });

    it('securityValidationTest_registry_update_remove_1', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('tab1', 1);
      expect(registry.update('tab1', 3)).assertTrue();
      expect(registry.get('tab1')).assertEqual(3);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab1')).assertTrue();
      expect(registry.has('tab1')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('securityValidationTest_total_value_1', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('a', 2);
      registry.add('b', 3);
      expect(registry.totalValue()).assertEqual(5);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

    it('securityValidationTest_add_and_query_2', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('tab2', 3);
      expect(registry.has('tab2')).assertTrue();
      expect(registry.get('tab2')).assertEqual(3);
      expect(registry.get('missing')).assertEqual(-1);
      registry.add('tab2', 99);
      expect(registry.get('tab2')).assertEqual(3);
      expect(registry.size()).assertEqual(1);
    });

    it('securityValidationTest_registry_update_remove_2', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('tab2', 1);
      expect(registry.update('tab2', 4)).assertTrue();
      expect(registry.get('tab2')).assertEqual(4);
      expect(registry.update('ghost', 1)).assertFalse();
      expect(registry.remove('tab2')).assertTrue();
      expect(registry.has('tab2')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('securityValidationTest_total_value_2', 0, async () => {
      const registry = new SecurityValidationRegistry();
      registry.add('a', 3);
      registry.add('b', 4);
      expect(registry.totalValue()).assertEqual(7);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.totalValue()).assertEqual(0);
    });

  });
}
