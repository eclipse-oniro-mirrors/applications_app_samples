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

const PHASE_ABILITY_CREATE: string = 'abilityCreate';

const PHASE_CONFIG_INIT: string = 'configInit';

const PHASE_KV_INIT: string = 'kvInit';

const PHASE_MEDIA_INIT: string = 'mediaInit';

const PHASE_UI_LOAD: string = 'uiLoad';

const PHASE_FIRST_FRAME: string = 'firstFrame';

const TTID_BUDGET_MS: number = 1000;

const TTFD_BUDGET_MS: number = 2000;

const MAX_COLD_START_MS: number = 3000;

const MAX_PHASE_MS: number = 2000;

interface PhaseRecord {
  name: string;
  startMs: number;
  endMs: number;
}

// Records startup phase boundaries with monotonic timestamps
class StartupTimer {
  private records: PhaseRecord[] = [];
  private readonly origin: number;

  constructor(origin: number) {
    this.origin = origin;
  }

  public begin(name: string, now: number): boolean {
    if (name.length === 0 || this.has(name)) {
      return false;
    }
    this.records.push({ name: name, startMs: now - this.origin, endMs: -1 });
    return true;
  }

  public end(name: string, now: number): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].name === name && this.records[i].endMs < 0) {
        const elapsed = now - this.origin;
        if (elapsed < this.records[i].startMs) {
          return false;
        }
        this.records[i].endMs = elapsed;
        return true;
      }
    }
    return false;
  }

  public has(name: string): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].name === name) {
        return true;
      }
    }
    return false;
  }

  public durationOf(name: string): number {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].name === name && this.records[i].endMs >= 0) {
        return this.records[i].endMs - this.records[i].startMs;
      }
    }
    return -1;
  }

  public startOf(name: string): number {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].name === name) {
        return this.records[i].startMs;
      }
    }
    return -1;
  }

  public totalElapsed(): number {
    let max: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].endMs > max) {
        max = this.records[i].endMs;
      }
    }
    return max;
  }

  public completedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].endMs >= 0) {
        count++;
      }
    }
    return count;
  }

  public names(): string[] {
    return this.records.map((record: PhaseRecord) => record.name);
  }

  public clear(): void {
    this.records = [];
  }
}

// Measures cold start milestones (TTID/TTFD)
class ColdStartAnalyzer {
  private createdAt: number = -1;
  private firstFrameAt: number = -1;
  private fullyDrawnAt: number = -1;

  public markCreated(now: number): void {
    this.createdAt = now;
  }

  public markFirstFrame(now: number): boolean {
    if (this.createdAt < 0 || now < this.createdAt || this.firstFrameAt >= 0) {
      return false;
    }
    this.firstFrameAt = now;
    return true;
  }

  public markFullyDrawn(now: number): boolean {
    if (this.firstFrameAt < 0 || now < this.firstFrameAt || this.fullyDrawnAt >= 0) {
      return false;
    }
    this.fullyDrawnAt = now;
    return true;
  }

  public ttidMs(): number {
    if (this.createdAt < 0 || this.firstFrameAt < 0) {
      return -1;
    }
    return this.firstFrameAt - this.createdAt;
  }

  public ttfdMs(): number {
    if (this.createdAt < 0 || this.fullyDrawnAt < 0) {
      return -1;
    }
    return this.fullyDrawnAt - this.createdAt;
  }

  public isTtidWithinBudget(): boolean {
    const ttid = this.ttidMs();
    return ttid >= 0 && ttid <= TTID_BUDGET_MS;
  }

  public isTtfdWithinBudget(): boolean {
    const ttfd = this.ttfdMs();
    return ttfd >= 0 && ttfd <= TTFD_BUDGET_MS;
  }

  public isColdStartAcceptable(): boolean {
    const ttfd = this.ttfdMs();
    return ttfd >= 0 && ttfd <= MAX_COLD_START_MS;
  }

  public isComplete(): boolean {
    return this.createdAt >= 0 && this.firstFrameAt >= 0 && this.fullyDrawnAt >= 0;
  }

  public reset(): void {
    this.createdAt = -1;
    this.firstFrameAt = -1;
    this.fullyDrawnAt = -1;
  }
}

// Enforces per-phase startup budgets
class StartupBudget {
  private limits: Map<string, number> = new Map<string, number>();

  public define(phase: string, limitMs: number): boolean {
    if (phase.length === 0 || limitMs <= 0 || limitMs > MAX_PHASE_MS) {
      return false;
    }
    this.limits.set(phase, limitMs);
    return true;
  }

  public limitOf(phase: string): number {
    const value = this.limits.get(phase);
    return value === undefined ? 0 : value;
  }

  public isWithin(phase: string, durationMs: number): boolean {
    const limit = this.limitOf(phase);
    return limit > 0 && durationMs >= 0 && durationMs <= limit;
  }

  public violations(timer: StartupTimer): string[] {
    const result: string[] = [];
    const names = timer.names();
    for (let i = 0; i < names.length; i++) {
      const duration = timer.durationOf(names[i]);
      if (duration < 0) {
        continue;
      }
      const limit = this.limitOf(names[i]);
      if (limit > 0 && duration > limit) {
        result.push(names[i]);
      }
    }
    return result;
  }

  public size(): number {
    return this.limits.size;
  }

  public clear(): void {
    this.limits = new Map<string, number>();
  }
}

// Aggregates startup measurements for release gating
class StartupReport {
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

  public summary(): string {
    return this.isPassed() ? 'fast' : 'slow';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

// Builds the default startup budget for the beta club app
class StartupBudgetFactory {
  public static build(): StartupBudget {
    const budget = new StartupBudget();
    budget.define(PHASE_ABILITY_CREATE, 100);
    budget.define(PHASE_CONFIG_INIT, 200);
    budget.define(PHASE_KV_INIT, 300);
    budget.define(PHASE_MEDIA_INIT, 600);
    budget.define(PHASE_UI_LOAD, 400);
    budget.define(PHASE_FIRST_FRAME, TTID_BUDGET_MS);
    return budget;
  }

  public static phases(): string[] {
    return [
      PHASE_ABILITY_CREATE, PHASE_CONFIG_INIT, PHASE_KV_INIT,
      PHASE_MEDIA_INIT, PHASE_UI_LOAD, PHASE_FIRST_FRAME
    ];
  }

  public static isCritical(phase: string): boolean {
    return phase === PHASE_ABILITY_CREATE || phase === PHASE_CONFIG_INIT ||
      phase === PHASE_FIRST_FRAME;
  }
}

export default function startupPerformanceTest() {
  describe('StartupPerformance_Test', () => {

    it('timer_should_record_phase_boundaries', 0, () => {
      const timer = new StartupTimer(1000);
      expect(timer.begin(PHASE_ABILITY_CREATE, 1000)).assertTrue();
      expect(timer.startOf(PHASE_ABILITY_CREATE)).assertEqual(0);
      expect(timer.end(PHASE_ABILITY_CREATE, 1050)).assertTrue();
      expect(timer.durationOf(PHASE_ABILITY_CREATE)).assertEqual(50);
      expect(timer.completedCount()).assertEqual(1);
    });

    it('timer_should_reject_duplicate_phases', 0, () => {
      const timer = new StartupTimer(0);
      expect(timer.begin(PHASE_CONFIG_INIT, 0)).assertTrue();
      expect(timer.begin(PHASE_CONFIG_INIT, 10)).assertFalse();
      expect(timer.begin('', 10)).assertFalse();
      expect(timer.names()).assertDeepEquals([PHASE_CONFIG_INIT]);
    });

    it('timer_should_reject_end_without_begin', 0, () => {
      const timer = new StartupTimer(0);
      expect(timer.end(PHASE_KV_INIT, 100)).assertFalse();
      timer.begin(PHASE_KV_INIT, 0);
      expect(timer.durationOf(PHASE_KV_INIT)).assertEqual(-1);
      expect(timer.end(PHASE_KV_INIT, 0)).assertTrue();
      expect(timer.durationOf(PHASE_KV_INIT)).assertEqual(0);
    });

    it('timer_should_reject_negative_duration', 0, () => {
      const timer = new StartupTimer(1000);
      timer.begin(PHASE_MEDIA_INIT, 1100);
      expect(timer.end(PHASE_MEDIA_INIT, 1050)).assertFalse();
      expect(timer.durationOf(PHASE_MEDIA_INIT)).assertEqual(-1);
      expect(timer.end(PHASE_MEDIA_INIT, 1100)).assertTrue();
    });

    it('timer_should_compute_total_elapsed', 0, () => {
      const timer = new StartupTimer(0);
      timer.begin(PHASE_ABILITY_CREATE, 0);
      timer.end(PHASE_ABILITY_CREATE, 100);
      timer.begin(PHASE_CONFIG_INIT, 100);
      timer.end(PHASE_CONFIG_INIT, 350);
      expect(timer.totalElapsed()).assertEqual(350);
      expect(timer.completedCount()).assertEqual(2);
    });

    it('timer_should_return_minus_one_for_unknown_phase', 0, () => {
      const timer = new StartupTimer(0);
      expect(timer.startOf('unknown')).assertEqual(-1);
      expect(timer.durationOf('unknown')).assertEqual(-1);
      expect(timer.has('unknown')).assertFalse();
      timer.clear();
      expect(timer.names().length).assertEqual(0);
      expect(timer.totalElapsed()).assertEqual(0);
    });

    it('timer_should_support_sequential_phases', 0, () => {
      const timer = new StartupTimer(500);
      const phases = StartupBudgetFactory.phases();
      let clock = 500;
      for (let i = 0; i < phases.length; i++) {
        timer.begin(phases[i], clock);
        clock += 50;
        timer.end(phases[i], clock);
      }
      expect(timer.completedCount()).assertEqual(phases.length);
      expect(timer.durationOf(phases[0])).assertEqual(50);
      expect(timer.totalElapsed()).assertEqual(300);
    });

    it('timer_should_keep_phase_durations_independent', 0, () => {
      const timer = new StartupTimer(0);
      timer.begin(PHASE_UI_LOAD, 0);
      timer.begin(PHASE_FIRST_FRAME, 100);
      timer.end(PHASE_UI_LOAD, 300);
      timer.end(PHASE_FIRST_FRAME, 400);
      expect(timer.durationOf(PHASE_UI_LOAD)).assertEqual(300);
      expect(timer.durationOf(PHASE_FIRST_FRAME)).assertEqual(300);
      expect(timer.totalElapsed()).assertEqual(400);
    });

    it('timer_should_clear_all_records', 0, () => {
      const timer = new StartupTimer(0);
      timer.begin(PHASE_ABILITY_CREATE, 0);
      timer.end(PHASE_ABILITY_CREATE, 10);
      timer.clear();
      expect(timer.names().length).assertEqual(0);
      expect(timer.completedCount()).assertEqual(0);
      expect(timer.begin(PHASE_ABILITY_CREATE, 20)).assertTrue();
    });

    it('timer_should_allow_reuse_after_clear', 0, () => {
      const timer = new StartupTimer(0);
      timer.begin(PHASE_KV_INIT, 0);
      timer.end(PHASE_KV_INIT, 100);
      timer.clear();
      timer.begin(PHASE_KV_INIT, 200);
      timer.end(PHASE_KV_INIT, 260);
      expect(timer.durationOf(PHASE_KV_INIT)).assertEqual(60);
    });

    it('cold_start_should_measure_ttid', 0, () => {
      const analyzer = new ColdStartAnalyzer();
      analyzer.markCreated(1000);
      expect(analyzer.markFirstFrame(1800)).assertTrue();
      expect(analyzer.ttidMs()).assertEqual(800);
      expect(analyzer.isTtidWithinBudget()).assertTrue();
      expect(analyzer.isComplete()).assertFalse();
    });

    it('cold_start_should_measure_ttfd', 0, () => {
      const analyzer = new ColdStartAnalyzer();
      analyzer.markCreated(0);
      analyzer.markFirstFrame(500);
      expect(analyzer.markFullyDrawn(1500)).assertTrue();
      expect(analyzer.ttfdMs()).assertEqual(1500);
      expect(analyzer.isTtfdWithinBudget()).assertTrue();
      expect(analyzer.isColdStartAcceptable()).assertTrue();
      expect(analyzer.isComplete()).assertTrue();
    });

    it('cold_start_should_reject_out_of_order_marks', 0, () => {
      const analyzer = new ColdStartAnalyzer();
      expect(analyzer.markFirstFrame(100)).assertFalse();
      analyzer.markCreated(200);
      expect(analyzer.markFirstFrame(100)).assertFalse();
      expect(analyzer.markFirstFrame(300)).assertTrue();
      expect(analyzer.markFirstFrame(400)).assertFalse();
      expect(analyzer.markFullyDrawn(250)).assertFalse();
    });

    it('cold_start_should_flag_slow_ttid', 0, () => {
      const analyzer = new ColdStartAnalyzer();
      analyzer.markCreated(0);
      analyzer.markFirstFrame(TTID_BUDGET_MS + 1);
      expect(analyzer.isTtidWithinBudget()).assertFalse();
      expect(analyzer.ttidMs()).assertEqual(TTID_BUDGET_MS + 1);
    });

    it('cold_start_should_flag_slow_ttfd', 0, () => {
      const analyzer = new ColdStartAnalyzer();
      analyzer.markCreated(0);
      analyzer.markFirstFrame(500);
      analyzer.markFullyDrawn(TTFD_BUDGET_MS + 1);
      expect(analyzer.isTtfdWithinBudget()).assertFalse();
      expect(analyzer.isColdStartAcceptable()).assertTrue();
      analyzer.reset();
      expect(analyzer.isComplete()).assertFalse();
      expect(analyzer.ttidMs()).assertEqual(-1);
    });

    it('cold_start_should_reject_unacceptable_total', 0, () => {
      const analyzer = new ColdStartAnalyzer();
      analyzer.markCreated(0);
      analyzer.markFirstFrame(500);
      analyzer.markFullyDrawn(MAX_COLD_START_MS + 1);
      expect(analyzer.isColdStartAcceptable()).assertFalse();
      expect(analyzer.ttfdMs()).assertEqual(MAX_COLD_START_MS + 1);
    });

    it('budget_should_define_phase_limits', 0, () => {
      const budget = new StartupBudget();
      expect(budget.define(PHASE_ABILITY_CREATE, 100)).assertTrue();
      expect(budget.define(PHASE_ABILITY_CREATE, 200)).assertTrue();
      expect(budget.limitOf(PHASE_ABILITY_CREATE)).assertEqual(200);
      expect(budget.define('', 100)).assertFalse();
      expect(budget.define('phase', 0)).assertFalse();
      expect(budget.define('phase', MAX_PHASE_MS + 1)).assertFalse();
    });

    it('budget_should_check_phase_duration', 0, () => {
      const budget = StartupBudgetFactory.build();
      expect(budget.isWithin(PHASE_CONFIG_INIT, 150)).assertTrue();
      expect(budget.isWithin(PHASE_CONFIG_INIT, 201)).assertFalse();
      expect(budget.isWithin('unknown', 10)).assertFalse();
      expect(budget.isWithin(PHASE_CONFIG_INIT, -1)).assertFalse();
      expect(budget.size()).assertEqual(6);
    });

    it('budget_should_report_violations', 0, () => {
      const timer = new StartupTimer(0);
      timer.begin(PHASE_CONFIG_INIT, 0);
      timer.end(PHASE_CONFIG_INIT, 250);
      timer.begin(PHASE_KV_INIT, 250);
      timer.end(PHASE_KV_INIT, 400);
      const budget = StartupBudgetFactory.build();
      const violations = budget.violations(timer);
      expect(violations.length).assertEqual(1);
      expect(violations[0]).assertEqual(PHASE_CONFIG_INIT);
    });

    it('budget_should_ignore_unfinished_phases', 0, () => {
      const timer = new StartupTimer(0);
      timer.begin(PHASE_MEDIA_INIT, 0);
      const budget = StartupBudgetFactory.build();
      expect(budget.violations(timer).length).assertEqual(0);
    });

    it('budget_should_accept_all_within_limits', 0, () => {
      const timer = new StartupTimer(0);
      timer.begin(PHASE_ABILITY_CREATE, 0);
      timer.end(PHASE_ABILITY_CREATE, 50);
      timer.begin(PHASE_UI_LOAD, 50);
      timer.end(PHASE_UI_LOAD, 300);
      const budget = StartupBudgetFactory.build();
      expect(budget.violations(timer).length).assertEqual(0);
      expect(StartupBudgetFactory.phases().length).assertEqual(6);
    });

    it('budget_factory_should_mark_critical_phases', 0, () => {
      expect(StartupBudgetFactory.isCritical(PHASE_ABILITY_CREATE)).assertTrue();
      expect(StartupBudgetFactory.isCritical(PHASE_CONFIG_INIT)).assertTrue();
      expect(StartupBudgetFactory.isCritical(PHASE_FIRST_FRAME)).assertTrue();
      expect(StartupBudgetFactory.isCritical(PHASE_KV_INIT)).assertFalse();
      expect(StartupBudgetFactory.isCritical(PHASE_MEDIA_INIT)).assertFalse();
      expect(StartupBudgetFactory.isCritical(PHASE_UI_LOAD)).assertFalse();
    });

    it('report_should_aggregate_startup_checks', 0, () => {
      const report = new StartupReport();
      report.check('ttid', true);
      report.check('ttfd', true);
      report.check('budget', true);
      expect(report.count()).assertEqual(3);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('fast');
      report.check('slowPhase', false);
      expect(report.summary()).assertEqual('slow');
      expect(report.failures()).assertDeepEquals(['slowPhase']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('startup_flow_should_pass_budgets', 0, () => {
      const timer = new StartupTimer(0);
      const analyzer = new ColdStartAnalyzer();
      const report = new StartupReport();
      const budget = StartupBudgetFactory.build();
      analyzer.markCreated(0);
      timer.begin(PHASE_ABILITY_CREATE, 0);
      timer.end(PHASE_ABILITY_CREATE, 50);
      timer.begin(PHASE_CONFIG_INIT, 50);
      timer.end(PHASE_CONFIG_INIT, 150);
      timer.begin(PHASE_KV_INIT, 150);
      timer.end(PHASE_KV_INIT, 300);
      analyzer.markFirstFrame(800);
      analyzer.markFullyDrawn(1600);
      report.check('ttid', analyzer.isTtidWithinBudget());
      report.check('ttfd', analyzer.isTtfdWithinBudget());
      report.check('violations', budget.violations(timer).length === 0);
      expect(report.isPassed()).assertTrue();
      expect(timer.totalElapsed()).assertEqual(300);
      expect(analyzer.ttfdMs()).assertEqual(1600);
    });

    it('startup_flow_should_detect_regression', 0, () => {
      const timer = new StartupTimer(0);
      const analyzer = new ColdStartAnalyzer();
      const report = new StartupReport();
      const budget = StartupBudgetFactory.build();
      analyzer.markCreated(0);
      timer.begin(PHASE_MEDIA_INIT, 0);
      timer.end(PHASE_MEDIA_INIT, 700);
      analyzer.markFirstFrame(TTID_BUDGET_MS + 500);
      analyzer.markFullyDrawn(MAX_COLD_START_MS + 500);
      report.check('violations', budget.violations(timer).length === 0);
      report.check('ttid', analyzer.isTtidWithinBudget());
      report.check('coldStart', analyzer.isColdStartAcceptable());
      expect(report.isPassed()).assertFalse();
      expect(report.failures().length).assertEqual(3);
      expect(budget.violations(timer)).assertDeepEquals([PHASE_MEDIA_INIT]);
    });

    it('startup_constants_should_be_stable', 0, () => {
      expect(PHASE_ABILITY_CREATE).assertEqual('abilityCreate');
      expect(PHASE_CONFIG_INIT).assertEqual('configInit');
      expect(PHASE_KV_INIT).assertEqual('kvInit');
      expect(PHASE_MEDIA_INIT).assertEqual('mediaInit');
      expect(PHASE_UI_LOAD).assertEqual('uiLoad');
      expect(PHASE_FIRST_FRAME).assertEqual('firstFrame');
      expect(TTID_BUDGET_MS).assertEqual(1000);
      expect(TTFD_BUDGET_MS).assertEqual(2000);
      expect(MAX_COLD_START_MS).assertEqual(3000);
      expect(MAX_PHASE_MS).assertEqual(2000);
    });

  });
}



