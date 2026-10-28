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

const CURRENT_VERSION: number = 3;

const MIN_VERSION: number = 0;

const MAX_VERSION: number = 99;

const MAX_STEPS: number = 16;

interface MigrationStep {
  version: number;
  name: string;
  applied: boolean;
}

// Applies ordered schema migrations from the stored version
class MigrationPlan {
  private steps: MigrationStep[] = [];
  private storedVersion: number = MIN_VERSION;

  public add(version: number, name: string): boolean {
    if (name.length === 0 || version <= MIN_VERSION || version > MAX_VERSION) {
      return false;
    }
    if (this.steps.length >= MAX_STEPS || this.hasVersion(version)) {
      return false;
    }
    this.steps.push({ version: version, name: name, applied: false });
    return true;
  }

  public hasVersion(version: number): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].version === version) {
        return true;
      }
    }
    return false;
  }

  public sorted(): MigrationStep[] {
    return [...this.steps].sort((left: MigrationStep, right: MigrationStep) =>
      left.version - right.version);
  }

  public pending(): MigrationStep[] {
    const result: MigrationStep[] = [];
    const ordered = this.sorted();
    for (let i = 0; i < ordered.length; i++) {
      if (!ordered[i].applied && ordered[i].version > this.storedVersion) {
        result.push(ordered[i]);
      }
    }
    return result;
  }

  public applyNext(action: (step: MigrationStep) => boolean): boolean {
    const pending = this.pending();
    if (pending.length === 0) {
      return false;
    }
    const step = pending[0];
    const success = action(step);
    if (success) {
      step.applied = true;
      this.storedVersion = step.version;
    }
    return success;
  }

  public applyAll(action: (step: MigrationStep) => boolean): number {
    let applied: number = 0;
    while (this.pending().length > 0) {
      if (!this.applyNext(action)) {
        break;
      }
      applied++;
    }
    return applied;
  }

  public rollback(version: number): boolean {
    if (version < MIN_VERSION || version > this.storedVersion) {
      return false;
    }
    this.storedVersion = version;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].version > version) {
        this.steps[i].applied = false;
      }
    }
    return true;
  }

  public getStoredVersion(): number {
    return this.storedVersion;
  }

  public isCurrent(): boolean {
    return this.storedVersion >= CURRENT_VERSION;
  }

  public size(): number {
    return this.steps.length;
  }

  public reset(): void {
    this.steps = [];
    this.storedVersion = MIN_VERSION;
  }
}

// Persists the schema version across launches
class SchemaVersionStore {
  private version: number = MIN_VERSION;

  public read(): number {
    return this.version;
  }

  public write(version: number): boolean {
    if (version < MIN_VERSION || version > MAX_VERSION || version < this.version) {
      return false;
    }
    this.version = version;
    return true;
  }

  public isOutdated(): boolean {
    return this.version < CURRENT_VERSION;
  }

  public reset(): void {
    this.version = MIN_VERSION;
  }
}

// Aggregates migration results for diagnostics
class MigrationReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

// Builds the default migration plan for the issue store
class MigrationFactory {
  public static build(): MigrationPlan {
    const plan = new MigrationPlan();
    plan.add(1, 'createIssueTable');
    plan.add(2, 'addAttachmentColumn');
    plan.add(3, 'addOperationHistory');
    return plan;
  }

  public static names(): string[] {
    return ['createIssueTable', 'addAttachmentColumn', 'addOperationHistory'];
  }
}

export default function dataMigrationTest() {
  describe('DataMigration_Test', () => {

    it('plan_should_add_steps', 0, () => {
      const plan = new MigrationPlan();
      expect(plan.add(1, 'first')).assertTrue();
      expect(plan.add(1, 'duplicate')).assertFalse();
      expect(plan.add(0, 'zero')).assertFalse();
      expect(plan.add(MAX_VERSION + 1, 'overflow')).assertFalse();
      expect(plan.add(2, '')).assertFalse();
      expect(plan.size()).assertEqual(1);
      expect(plan.hasVersion(1)).assertTrue();
      expect(plan.hasVersion(9)).assertFalse();
    });

    it('plan_should_sort_steps', 0, () => {
      const plan = new MigrationPlan();
      plan.add(3, 'third');
      plan.add(1, 'first');
      plan.add(2, 'second');
      const ordered = plan.sorted();
      expect(ordered.length).assertEqual(3);
      expect(ordered[0].version).assertEqual(1);
      expect(ordered[1].version).assertEqual(2);
      expect(ordered[2].version).assertEqual(3);
    });

    it('plan_should_report_all_pending', 0, () => {
      const plan = MigrationFactory.build();
      expect(plan.getStoredVersion()).assertEqual(0);
      expect(plan.pending().length).assertEqual(3);
      expect(plan.pending()[0].name).assertEqual('createIssueTable');
      expect(plan.isCurrent()).assertFalse();
    });

    it('plan_should_apply_next_step', 0, () => {
      const plan = MigrationFactory.build();
      expect(plan.applyNext((step: MigrationStep) => {
        return step.name === 'createIssueTable';
      })).assertTrue();
      expect(plan.getStoredVersion()).assertEqual(1);
      expect(plan.pending().length).assertEqual(2);
    });

    it('plan_should_stop_on_failure', 0, () => {
      const plan = MigrationFactory.build();
      expect(plan.applyNext(() => false)).assertFalse();
      expect(plan.getStoredVersion()).assertEqual(0);
      expect(plan.pending().length).assertEqual(3);
      expect(plan.applyNext(() => true)).assertTrue();
      expect(plan.getStoredVersion()).assertEqual(1);
    });

    it('plan_should_apply_all_steps', 0, () => {
      const plan = MigrationFactory.build();
      expect(plan.applyAll(() => true)).assertEqual(3);
      expect(plan.getStoredVersion()).assertEqual(CURRENT_VERSION);
      expect(plan.pending().length).assertEqual(0);
      expect(plan.isCurrent()).assertTrue();
      expect(plan.applyAll(() => true)).assertEqual(0);
    });

    it('plan_should_apply_only_pending', 0, () => {
      const plan = MigrationFactory.build();
      plan.applyNext(() => true);
      expect(plan.applyAll(() => true)).assertEqual(2);
      expect(plan.getStoredVersion()).assertEqual(3);
      expect(plan.size()).assertEqual(3);
    });

    it('plan_should_rollback', 0, () => {
      const plan = MigrationFactory.build();
      plan.applyAll(() => true);
      expect(plan.rollback(1)).assertTrue();
      expect(plan.getStoredVersion()).assertEqual(1);
      expect(plan.pending().length).assertEqual(2);
      expect(plan.rollback(5)).assertFalse();
      expect(plan.rollback(-1)).assertFalse();
    });

    it('plan_should_reset', 0, () => {
      const plan = MigrationFactory.build();
      plan.applyAll(() => true);
      plan.reset();
      expect(plan.size()).assertEqual(0);
      expect(plan.getStoredVersion()).assertEqual(0);
      expect(plan.isCurrent()).assertFalse();
    });

    it('store_should_persist_version', 0, () => {
      const store = new SchemaVersionStore();
      expect(store.read()).assertEqual(0);
      expect(store.isOutdated()).assertTrue();
      expect(store.write(1)).assertTrue();
      expect(store.read()).assertEqual(1);
      expect(store.write(0)).assertFalse();
      expect(store.write(MAX_VERSION + 1)).assertFalse();
    });

    it('store_should_reach_current', 0, () => {
      const store = new SchemaVersionStore();
      expect(store.write(CURRENT_VERSION)).assertTrue();
      expect(store.isOutdated()).assertFalse();
      expect(store.read()).assertEqual(CURRENT_VERSION);
      store.reset();
      expect(store.read()).assertEqual(0);
      expect(store.isOutdated()).assertTrue();
    });

    it('report_should_aggregate_migration_checks', 0, () => {
      const report = new MigrationReport();
      report.check('steps', true);
      report.check('version', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('rollback', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['rollback']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('migration_flow_should_reach_current_version', 0, () => {
      const plan = MigrationFactory.build();
      const store = new SchemaVersionStore();
      const report = new MigrationReport();
      const applied = plan.applyAll(() => true);
      report.check('applied', applied === 3);
      report.check('store', store.write(plan.getStoredVersion()));
      report.check('current', plan.isCurrent());
      expect(report.isPassed()).assertTrue();
      expect(store.read()).assertEqual(CURRENT_VERSION);
      expect(MigrationFactory.names().length).assertEqual(3);
    });

    it('migration_flow_should_recover_after_rollback', 0, () => {
      const plan = MigrationFactory.build();
      const report = new MigrationReport();
      plan.applyAll(() => true);
      plan.rollback(1);
      report.check('pending', plan.pending().length === 2);
      report.check('reapply', plan.applyAll(() => true) === 2);
      report.check('current', plan.isCurrent());
      expect(report.isPassed()).assertTrue();
      expect(plan.getStoredVersion()).assertEqual(3);
    });

    it('migration_constants_should_be_stable', 0, () => {
      expect(CURRENT_VERSION).assertEqual(3);
      expect(MIN_VERSION).assertEqual(0);
      expect(MAX_VERSION).assertEqual(99);
      expect(MAX_STEPS).assertEqual(16);
      expect(MigrationFactory.names().length).assertEqual(3);
    });
  });
}

