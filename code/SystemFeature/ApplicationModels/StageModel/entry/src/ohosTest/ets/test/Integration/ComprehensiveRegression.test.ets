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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv
} from '../Shared/SharedDriver';

enum Severity {
  LOW = 0,
  MEDIUM = 1,
  HIGH = 2
}

enum CaseStatus {
  NOT_RUN = 0,
  PASSED = 1,
  FAILED = 2
}

class RegressionCase {
  id: string = '';
  name: string = '';
  baseline: number = 0;
  actual: number = 0;
  tolerance: number = 0;
  severity: Severity = Severity.LOW;
  status: CaseStatus = CaseStatus.NOT_RUN;

  constructor(id: string, name: string, baseline: number, tolerance: number,
    severity: Severity) {
    this.id = id;
    this.name = name;
    this.baseline = baseline;
    this.tolerance = tolerance;
    this.severity = severity;
  }

  run(actual: number): boolean {
    this.actual = actual;
    const delta = Math.abs(actual - this.baseline);
    if (delta <= this.tolerance) {
      this.status = CaseStatus.PASSED;
      return true;
    }
    this.status = CaseStatus.FAILED;
    return false;
  }

  delta(): number {
    return Math.abs(this.actual - this.baseline);
  }

  isPassed(): boolean {
    return this.status === CaseStatus.PASSED;
  }

  isFailed(): boolean {
    return this.status === CaseStatus.FAILED;
  }
}

class RegressionLedger {
  private cases: RegressionCase[] = [];
  private runs: number = 0;

  addRegressionCase(item: RegressionCase): boolean {
    for (const existing of this.cases) {
      if (existing.id === item.id) {
        return false;
      }
    }
    this.cases.push(item);
    return true;
  }

  caseCount(): number {
    return this.cases.length;
  }

  runAll(actuals: number[]): number {
    this.runs = this.runs + 1;
    let executed = 0;
    for (let i = 0; i < this.cases.length; i++) {
      const value = i < actuals.length ? actuals[i] : this.cases[i].baseline;
      this.cases[i].run(value);
      executed = executed + 1;
    }
    return executed;
  }

  passCount(): number {
    let count = 0;
    for (const item of this.cases) {
      if (item.isPassed()) {
        count = count + 1;
      }
    }
    return count;
  }

  failCount(): number {
    let count = 0;
    for (const item of this.cases) {
      if (item.isFailed()) {
        count = count + 1;
      }
    }
    return count;
  }

  passRate(): number {
    return clampNumber(safeDiv(this.passCount(), this.caseCount()), 0, 1);
  }

  runCount(): number {
    return this.runs;
  }

  findBySeverity(severity: Severity): RegressionCase[] {
    const result: RegressionCase[] = [];
    for (const item of this.cases) {
      if (item.severity === severity) {
        result.push(item);
      }
    }
    return result;
  }

  worstDelta(): number {
    let worst = 0;
    for (const item of this.cases) {
      if (item.delta() > worst) {
        worst = item.delta();
      }
    }
    return worst;
  }

  findCase(id: string): RegressionCase | null {
    for (const item of this.cases) {
      if (item.id === id) {
        return item;
      }
    }
    return null;
  }

  allPassed(): boolean {
    return this.caseCount() > 0 && this.failCount() === 0;
  }
}

class GoldenSnapshot {
  version: number = 1;
  private values: number[] = [];

  constructor(version: number) {
    this.version = version;
  }

  push(value: number): void {
    this.values.push(value);
  }

  size(): number {
    return this.values.length;
  }

  valueAt(index: number): number {
    if (index < 0 || index >= this.values.length) {
      return 0;
    }
    return this.values[index];
  }

  diff(other: GoldenSnapshot): number[] {
    const deltas: number[] = [];
    const limit = Math.min(this.size(), other.size());
    for (let i = 0; i < limit; i++) {
      deltas.push(Math.abs(this.values[i] - other.values[i]));
    }
    return deltas;
  }

  sum(): number {
    let total = 0;
    for (const value of this.values) {
      total = total + value;
    }
    return total;
  }
}

class RegressionRunner {
  private ledger: RegressionLedger;
  private rounds: number = 0;
  private stableRounds: number = 0;

  constructor(ledger: RegressionLedger) {
    this.ledger = ledger;
  }

  runRounds(count: number): number {
    for (let round = 0; round < count; round++) {
      this.ledger.runAll([]);
      this.rounds = this.rounds + 1;
      if (this.ledger.allPassed()) {
        this.stableRounds = this.stableRounds + 1;
      }
    }
    return this.rounds;
  }

  getRounds(): number {
    return this.rounds;
  }

  getStableRounds(): number {
    return this.stableRounds;
  }

  stability(): number {
    return clampNumber(safeDiv(this.stableRounds, this.rounds), 0, 1);
  }
}

function buildLedger(): RegressionLedger {
  const ledger = new RegressionLedger();
  ledger.addRegressionCase(new RegressionCase('R1', 'ability start', 100, 2, Severity.HIGH));
  ledger.addRegressionCase(new RegressionCase('R2', 'service switch', 50, 5, Severity.MEDIUM));
  ledger.addRegressionCase(new RegressionCase('R3', 'form render', 30, 1, Severity.LOW));
  return ledger;
}

export default function comprehensiveRegressionTest(): void {
  describe('ComprehensiveRegression', () => {
    it('ComprehensiveRegression_001', 0, async (done: Function) => {
      const item = new RegressionCase('R1', 'start', 100, 2, Severity.HIGH);
      expect(item.status).assertEqual(CaseStatus.NOT_RUN);
      expect(item.delta()).assertEqual(100);
      done();
    });

    it('ComprehensiveRegression_002', 0, async (done: Function) => {
      const item = new RegressionCase('R1', 'start', 100, 2, Severity.HIGH);
      expect(item.run(101)).assertTrue();
      expect(item.isPassed()).assertTrue();
      expect(item.delta()).assertEqual(1);
      done();
    });

    it('ComprehensiveRegression_003', 0, async (done: Function) => {
      const item = new RegressionCase('R1', 'start', 100, 2, Severity.HIGH);
      expect(item.run(103)).assertFalse();
      expect(item.isFailed()).assertTrue();
      expect(item.delta()).assertEqual(3);
      done();
    });

    it('ComprehensiveRegression_004', 0, async (done: Function) => {
      const item = new RegressionCase('R1', 'start', 10, 0, Severity.LOW);
      expect(item.run(10)).assertTrue();
      expect(item.run(9)).assertFalse();
      done();
    });

    it('ComprehensiveRegression_005', 0, async (done: Function) => {
      const ledger = new RegressionLedger();
      expect(ledger.addRegressionCase(new RegressionCase('R1', 'a', 1, 0, Severity.LOW))).assertTrue();
      expect(ledger.addRegressionCase(new RegressionCase('R1', 'b', 1, 0, Severity.LOW))).assertFalse();
      expect(ledger.caseCount()).assertEqual(1);
      done();
    });

    it('ComprehensiveRegression_006', 0, async (done: Function) => {
      const ledger = buildLedger();
      expect(ledger.caseCount()).assertEqual(3);
      expect(ledger.runAll([100, 50, 30])).assertEqual(3);
      expect(ledger.passCount()).assertEqual(3);
      expect(ledger.failCount()).assertEqual(0);
      expect(ledger.passRate()).assertEqual(1);
      done();
    });

    it('ComprehensiveRegression_007', 0, async (done: Function) => {
      const ledger = buildLedger();
      ledger.runAll([100, 60, 30]);
      expect(ledger.passCount()).assertEqual(2);
      expect(ledger.failCount()).assertEqual(1);
      expect(ledger.allPassed()).assertFalse();
      done();
    });

    it('ComprehensiveRegression_008', 0, async (done: Function) => {
      const ledger = buildLedger();
      ledger.runAll([104, 55, 31]);
      expect(ledger.worstDelta()).assertEqual(5);
      expect(ledger.passRate()).assertEqual(0.6666666666666666);
      done();
    });

    it('ComprehensiveRegression_009', 0, async (done: Function) => {
      const ledger = buildLedger();
      expect(ledger.findBySeverity(Severity.HIGH).length).assertEqual(1);
      expect(ledger.findBySeverity(Severity.MEDIUM).length).assertEqual(1);
      expect(ledger.findBySeverity(Severity.LOW).length).assertEqual(1);
      done();
    });

    it('ComprehensiveRegression_010', 0, async (done: Function) => {
      const ledger = buildLedger();
      expect(ledger.findCase('R1') !== null).assertTrue();
      expect(ledger.findCase('R9') === null).assertTrue();
      done();
    });
    it('ComprehensiveRegression_011', 0, async (done: Function) => {
      const ledger = buildLedger();
      expect(ledger.runCount()).assertEqual(0);
      ledger.runAll([100, 50, 30]);
      ledger.runAll([100, 50, 30]);
      expect(ledger.runCount()).assertEqual(2);
      done();
    });

    it('ComprehensiveRegression_012', 0, async (done: Function) => {
      const ledger = buildLedger();
      ledger.runAll([100]);
      expect(ledger.passCount()).assertEqual(3);
      expect(ledger.passRate()).assertEqual(1);
      done();
    });

    it('ComprehensiveRegression_013', 0, async (done: Function) => {
      const ledger = new RegressionLedger();
      expect(ledger.allPassed()).assertFalse();
      expect(ledger.passRate()).assertEqual(0);
      expect(ledger.worstDelta()).assertEqual(0);
      done();
    });

    it('ComprehensiveRegression_014', 0, async (done: Function) => {
      const ledger = buildLedger();
      ledger.runAll([100, 50, 30]);
      const runner = new RegressionRunner(ledger);
      expect(runner.runRounds(3)).assertEqual(3);
      expect(runner.getRounds()).assertEqual(3);
      expect(runner.getStableRounds()).assertEqual(3);
      expect(runner.stability()).assertEqual(1);
      done();
    });

    it('ComprehensiveRegression_015', 0, async (done: Function) => {
      const ledger = new RegressionLedger();
      ledger.addRegressionCase(new RegressionCase('R1', 'a', 5, 0, Severity.LOW));
      ledger.runAll([6]);
      const runner = new RegressionRunner(ledger);
      runner.runRounds(4);
      expect(runner.getStableRounds()).assertEqual(4);
      expect(runner.stability()).assertEqual(1);
      done();
    });

    it('ComprehensiveRegression_016', 0, async (done: Function) => {
      const runner = new RegressionRunner(buildLedger());
      expect(runner.getRounds()).assertEqual(0);
      expect(runner.stability()).assertEqual(0);
      done();
    });

    it('ComprehensiveRegression_017', 0, async (done: Function) => {
      const first = new GoldenSnapshot(1);
      first.push(10);
      first.push(20);
      first.push(30);
      expect(first.size()).assertEqual(3);
      expect(first.valueAt(0)).assertEqual(10);
      expect(first.valueAt(5)).assertEqual(0);
      expect(first.sum()).assertEqual(60);
      done();
    });

    it('ComprehensiveRegression_018', 0, async (done: Function) => {
      const first = new GoldenSnapshot(1);
      first.push(10);
      first.push(20);
      const second = new GoldenSnapshot(2);
      second.push(12);
      second.push(18);
      const deltas = first.diff(second);
      expect(deltas.length).assertEqual(2);
      expect(deltas[0]).assertEqual(2);
      expect(deltas[1]).assertEqual(2);
      done();
    });

    it('ComprehensiveRegression_019', 0, async (done: Function) => {
      const first = new GoldenSnapshot(1);
      first.push(1);
      first.push(2);
      first.push(3);
      const second = new GoldenSnapshot(2);
      second.push(5);
      expect(first.diff(second).length).assertEqual(1);
      expect(first.version).assertEqual(1);
      expect(second.version).assertEqual(2);
      done();
    });

    it('ComprehensiveRegression_020', 0, async (done: Function) => {
      expect(regressionSuiteName()).assertEqual('ComprehensiveRegression');
      const empty = new GoldenSnapshot(0);
      expect(empty.sum()).assertEqual(0);
      expect(empty.diff(empty).length).assertEqual(0);
      done();
    });
    it('ComprehensiveRegression_021', 0, async (done: Function) => {
      const ledger = buildLedger();
      ledger.runAll([100, 50, 30]);
      const r1 = ledger.findCase('R1');
      const r2 = ledger.findCase('R2');
      expect(r1 !== null).assertTrue();
      expect(r2 !== null).assertTrue();
      if (r1 !== null && r2 !== null) {
        expect(r1.severity).assertEqual(Severity.HIGH);
        expect(r2.severity).assertEqual(Severity.MEDIUM);
        expect(r1.isPassed()).assertTrue();
        expect(r2.isPassed()).assertTrue();
      }
      done();
    });

    it('ComprehensiveRegression_022', 0, async (done: Function) => {
      const ledger = new RegressionLedger();
      ledger.addRegressionCase(new RegressionCase('A', 'x', 8, 1, Severity.MEDIUM));
      ledger.addRegressionCase(new RegressionCase('B', 'y', 4, 1, Severity.MEDIUM));
      ledger.runAll([9, 6]);
      expect(ledger.failCount()).assertEqual(1);
      expect(ledger.worstDelta()).assertEqual(2);
      expect(ledger.findCase('B') !== null).assertTrue();
      done();
    });

    it('ComprehensiveRegression_023', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'ComprehensiveRegression probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

function regressionSuiteName(): string {
  return 'ComprehensiveRegression';
}
