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

const CATEGORY_MEMORY: string = 'memory';

const CATEGORY_DISK: string = 'disk';

const CATEGORY_NETWORK: string = 'network';

const CATEGORY_CPU: string = 'cpu';

const MEMORY_LIMIT: number = 256 * 1024 * 1024;

const DISK_LIMIT: number = 512 * 1024 * 1024;

const NETWORK_LIMIT: number = 100 * 1024 * 1024;

const CPU_LIMIT: number = 80;

const WARN_PERCENT: number = 80;

interface BudgetEntry {
  category: string;
  used: number;
  limit: number;
}

// Validates usage against per-category budgets
class ResourceBudget {
  private entries: Map<string, BudgetEntry> = new Map<string, BudgetEntry>();

  public define(category: string, limit: number): boolean {
    if (category.length === 0 || limit <= 0 || this.entries.has(category)) {
      return false;
    }
    this.entries.set(category, { category: category, used: 0, limit: limit });
    return true;
  }

  public consume(category: string, amount: number): boolean {
    const entry = this.entries.get(category);
    if (entry === undefined || amount < 0) {
      return false;
    }
    if (entry.used + amount > entry.limit) {
      return false;
    }
    entry.used += amount;
    return true;
  }

  public usageOf(category: string): number {
    const entry = this.entries.get(category);
    return entry === undefined ? 0 : entry.used;
  }

  public limitOf(category: string): number {
    const entry = this.entries.get(category);
    return entry === undefined ? 0 : entry.limit;
  }

  public percentOf(category: string): number {
    const entry = this.entries.get(category);
    if (entry === undefined || entry.limit <= 0) {
      return 0;
    }
    return entry.used * 100 / entry.limit;
  }

  public isExceeded(category: string): boolean {
    return this.percentOf(category) > 100;
  }

  public isWarning(category: string): boolean {
    const percent = this.percentOf(category);
    return percent >= WARN_PERCENT && percent <= 100;
  }

  public reset(category: string): boolean {
    const entry = this.entries.get(category);
    if (entry === undefined) {
      return false;
    }
    entry.used = 0;
    return true;
  }

  public size(): number {
    return this.entries.size;
  }

  public clear(): void {
    this.entries = new Map<string, BudgetEntry>();
  }
}

// Aggregates category budgets into one report
class BudgetReport {
  private budget: ResourceBudget;
  private categories: string[];

  constructor(budget: ResourceBudget, categories: string[]) {
    this.budget = budget;
    this.categories = [...categories];
  }

  public exceededCategories(): string[] {
    return this.categories.filter((category: string) => this.budget.isExceeded(category));
  }

  public warningCategories(): string[] {
    return this.categories.filter((category: string) => this.budget.isWarning(category));
  }

  public isHealthy(): boolean {
    return this.exceededCategories().length === 0;
  }

  public averagePercent(): number {
    if (this.categories.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.categories.length; i++) {
      total += this.budget.percentOf(this.categories[i]);
    }
    return total / this.categories.length;
  }

  public resetAll(): void {
    for (let i = 0; i < this.categories.length; i++) {
      this.budget.reset(this.categories[i]);
    }
  }
}

// Builds the default application resource budgets
class BudgetFactory {
  public static build(): ResourceBudget {
    const budget = new ResourceBudget();
    budget.define(CATEGORY_MEMORY, MEMORY_LIMIT);
    budget.define(CATEGORY_DISK, DISK_LIMIT);
    budget.define(CATEGORY_NETWORK, NETWORK_LIMIT);
    budget.define(CATEGORY_CPU, CPU_LIMIT);
    return budget;
  }

  public static categories(): string[] {
    return [CATEGORY_MEMORY, CATEGORY_DISK, CATEGORY_NETWORK, CATEGORY_CPU];
  }

  public static isCategoryValid(category: string): boolean {
    return category === CATEGORY_MEMORY || category === CATEGORY_DISK ||
      category === CATEGORY_NETWORK || category === CATEGORY_CPU;
  }
}

export default function resourceBudgetValidationTest() {
  describe('ResourceBudgetValidation_Test', () => {

    it('budget_should_define_categories', 0, () => {
      const budget = new ResourceBudget();
      expect(budget.define(CATEGORY_MEMORY, MEMORY_LIMIT)).assertTrue();
      expect(budget.define(CATEGORY_MEMORY, MEMORY_LIMIT)).assertFalse();
      expect(budget.define('', MEMORY_LIMIT)).assertFalse();
      expect(budget.define('bad', 0)).assertFalse();
      expect(budget.size()).assertEqual(1);
      expect(budget.limitOf(CATEGORY_MEMORY)).assertEqual(MEMORY_LIMIT);
    });

    it('budget_should_consume_within_limit', 0, () => {
      const budget = new ResourceBudget();
      budget.define(CATEGORY_DISK, DISK_LIMIT);
      expect(budget.consume(CATEGORY_DISK, 1024)).assertTrue();
      expect(budget.usageOf(CATEGORY_DISK)).assertEqual(1024);
      expect(budget.percentOf(CATEGORY_DISK)).assertClose(1024 * 100 / DISK_LIMIT, 0.001);
      expect(budget.isExceeded(CATEGORY_DISK)).assertFalse();
      expect(budget.isWarning(CATEGORY_DISK)).assertFalse();
    });

    it('budget_should_reject_overflow', 0, () => {
      const budget = new ResourceBudget();
      budget.define(CATEGORY_NETWORK, NETWORK_LIMIT);
      expect(budget.consume(CATEGORY_NETWORK, NETWORK_LIMIT)).assertTrue();
      expect(budget.consume(CATEGORY_NETWORK, 1)).assertFalse();
      expect(budget.consume(CATEGORY_NETWORK, -1)).assertFalse();
      expect(budget.consume('missing', 1)).assertFalse();
      expect(budget.usageOf(CATEGORY_NETWORK)).assertEqual(NETWORK_LIMIT);
      expect(budget.percentOf(CATEGORY_NETWORK)).assertEqual(100);
    });

    it('budget_should_detect_warning_zone', 0, () => {
      const budget = new ResourceBudget();
      budget.define(CATEGORY_CPU, CPU_LIMIT);
      budget.consume(CATEGORY_CPU, 64);
      expect(budget.percentOf(CATEGORY_CPU)).assertEqual(80);
      expect(budget.isWarning(CATEGORY_CPU)).assertTrue();
      expect(budget.isExceeded(CATEGORY_CPU)).assertFalse();
      budget.consume(CATEGORY_CPU, 16);
      expect(budget.percentOf(CATEGORY_CPU)).assertEqual(100);
      expect(budget.isWarning(CATEGORY_CPU)).assertTrue();
    });

    it('budget_should_reset_category', 0, () => {
      const budget = new ResourceBudget();
      budget.define(CATEGORY_MEMORY, MEMORY_LIMIT);
      budget.consume(CATEGORY_MEMORY, 1024);
      expect(budget.reset(CATEGORY_MEMORY)).assertTrue();
      expect(budget.usageOf(CATEGORY_MEMORY)).assertEqual(0);
      expect(budget.reset('missing')).assertFalse();
      budget.clear();
      expect(budget.size()).assertEqual(0);
      expect(budget.limitOf(CATEGORY_MEMORY)).assertEqual(0);
    });

    it('factory_should_build_defaults', 0, () => {
      const budget = BudgetFactory.build();
      expect(budget.size()).assertEqual(4);
      expect(budget.limitOf(CATEGORY_MEMORY)).assertEqual(MEMORY_LIMIT);
      expect(budget.limitOf(CATEGORY_DISK)).assertEqual(DISK_LIMIT);
      expect(budget.limitOf(CATEGORY_NETWORK)).assertEqual(NETWORK_LIMIT);
      expect(budget.limitOf(CATEGORY_CPU)).assertEqual(CPU_LIMIT);
      expect(BudgetFactory.categories().length).assertEqual(4);
    });

    it('factory_should_validate_categories', 0, () => {
      expect(BudgetFactory.isCategoryValid(CATEGORY_MEMORY)).assertTrue();
      expect(BudgetFactory.isCategoryValid(CATEGORY_DISK)).assertTrue();
      expect(BudgetFactory.isCategoryValid(CATEGORY_NETWORK)).assertTrue();
      expect(BudgetFactory.isCategoryValid(CATEGORY_CPU)).assertTrue();
      expect(BudgetFactory.isCategoryValid('gpu')).assertFalse();
    });

    it('report_should_detect_exceeded_categories', 0, () => {
      const budget = BudgetFactory.build();
      const report = new BudgetReport(budget, BudgetFactory.categories());
      expect(report.isHealthy()).assertTrue();
      expect(report.exceededCategories().length).assertEqual(0);
      budget.consume(CATEGORY_CPU, CPU_LIMIT);
      expect(report.warningCategories()).assertDeepEquals([CATEGORY_CPU]);
      expect(report.isHealthy()).assertTrue();
      expect(report.averagePercent()).assertEqual(25);
    });

    it('report_should_reset_all_categories', 0, () => {
      const budget = BudgetFactory.build();
      const report = new BudgetReport(budget, BudgetFactory.categories());
      budget.consume(CATEGORY_MEMORY, 1024);
      budget.consume(CATEGORY_DISK, 2048);
      expect(budget.usageOf(CATEGORY_MEMORY)).assertEqual(1024);
      report.resetAll();
      expect(budget.usageOf(CATEGORY_MEMORY)).assertEqual(0);
      expect(budget.usageOf(CATEGORY_DISK)).assertEqual(0);
      expect(report.averagePercent()).assertEqual(0);
      const empty = new BudgetReport(budget, []);
      expect(empty.averagePercent()).assertEqual(0);
      expect(empty.isHealthy()).assertTrue();
    });

    it('budget_flow_should_gate_attachment_upload', 0, () => {
      const budget = BudgetFactory.build();
      const attachmentBytes = 80 * 1024 * 1024;
      expect(budget.consume(CATEGORY_DISK, attachmentBytes)).assertTrue();
      expect(budget.consume(CATEGORY_NETWORK, attachmentBytes)).assertTrue();
      expect(budget.percentOf(CATEGORY_DISK)).assertClose(15.625, 0.001);
      expect(budget.percentOf(CATEGORY_NETWORK)).assertEqual(80);
      expect(budget.isWarning(CATEGORY_NETWORK)).assertTrue();
      expect(budget.consume(CATEGORY_NETWORK, 30 * 1024 * 1024)).assertFalse();
      const report = new BudgetReport(budget, BudgetFactory.categories());
      expect(report.isHealthy()).assertTrue();
      expect(report.warningCategories()).assertDeepEquals([CATEGORY_NETWORK]);
    });

    it('resource_budget_constants_should_be_stable', 0, () => {
      expect(MEMORY_LIMIT).assertEqual(268435456);
      expect(DISK_LIMIT).assertEqual(536870912);
      expect(NETWORK_LIMIT).assertEqual(104857600);
      expect(CPU_LIMIT).assertEqual(80);
      expect(WARN_PERCENT).assertEqual(80);
    });
  });
}

