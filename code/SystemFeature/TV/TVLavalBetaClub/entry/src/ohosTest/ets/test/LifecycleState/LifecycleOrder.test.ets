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

const PHASE_CREATE: string = 'create';

const PHASE_START: string = 'start';

const PHASE_RESUME: string = 'resume';

const PHASE_PAUSE: string = 'pause';

const PHASE_STOP: string = 'stop';

const PHASE_DESTROY: string = 'destroy';

const EXPECTED_ORDER: string[] = [
  PHASE_CREATE, PHASE_START, PHASE_RESUME, PHASE_PAUSE, PHASE_STOP, PHASE_DESTROY
];

// Validates that recorded lifecycle phases follow the expected order
class LifecycleOrderValidator {
  public static expectedOrder(): string[] {
    return [...EXPECTED_ORDER];
  }

  public static isKnownPhase(phase: string): boolean {
    return EXPECTED_ORDER.includes(phase);
  }

  public static isOrdered(recorded: string[]): boolean {
    if (recorded.length === 0) {
      return false;
    }
    let lastIndex: number = -1;
    for (let i = 0; i < recorded.length; i++) {
      const index = EXPECTED_ORDER.indexOf(recorded[i]);
      if (index < 0 || index <= lastIndex) {
        return false;
      }
      lastIndex = index;
    }
    return true;
  }

  public static firstMissing(recorded: string[]): string {
    for (let i = 0; i < EXPECTED_ORDER.length; i++) {
      if (!recorded.includes(EXPECTED_ORDER[i])) {
        return EXPECTED_ORDER[i];
      }
    }
    return '';
  }

  public static missingPhases(recorded: string[]): string[] {
    return EXPECTED_ORDER.filter((phase: string) => !recorded.includes(phase));
  }

  public static hasDuplicates(recorded: string[]): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < recorded.length; i++) {
      if (seen.has(recorded[i])) {
        return true;
      }
      seen.add(recorded[i]);
    }
    return false;
  }

  public static isComplete(recorded: string[]): boolean {
    return LifecycleOrderValidator.missingPhases(recorded).length === 0;
  }

  public static indexOf(phase: string): number {
    return EXPECTED_ORDER.indexOf(phase);
  }

  public static isBefore(first: string, second: string): boolean {
    const firstIndex = EXPECTED_ORDER.indexOf(first);
    const secondIndex = EXPECTED_ORDER.indexOf(second);
    return firstIndex >= 0 && secondIndex >= 0 && firstIndex < secondIndex;
  }
}

// Records lifecycle transitions with timestamps
class LifecycleTimeline {
  private phaseList: string[] = [];
  private timestamps: number[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(phase: string, now: number): boolean {
    if (!LifecycleOrderValidator.isKnownPhase(phase) || this.capacity <= 0) {
      return false;
    }
    if (this.phaseList.length >= this.capacity) {
      this.phaseList.shift();
      this.timestamps.shift();
    }
    this.phaseList.push(phase);
    this.timestamps.push(now);
    return true;
  }

  public phases(): string[] {
    return [...this.phaseList];
  }

  public timestampOf(phase: string): number {
    const index = this.phaseList.indexOf(phase);
    return index < 0 ? -1 : this.timestamps[index];
  }

  public count(): number {
    return this.phaseList.length;
  }

  public durationBetween(first: string, second: string): number {
    const firstTime = this.timestampOf(first);
    const secondTime = this.timestampOf(second);
    if (firstTime < 0 || secondTime < 0) {
      return -1;
    }
    return secondTime - firstTime;
  }

  public clear(): void {
    this.phaseList = [];
    this.timestamps = [];
  }
}

// Summarizes lifecycle compliance for a page
class LifecycleReport {
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
    return this.isPassed() ? 'compliant' : 'violation';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function lifecycleOrderTest() {
  describe('LifecycleOrder_Test', () => {

    it('validator_should_expose_expected_order', 0, () => {
      const order = LifecycleOrderValidator.expectedOrder();
      expect(order.length).assertEqual(6);
      expect(order[0]).assertEqual(PHASE_CREATE);
      expect(order[order.length - 1]).assertEqual(PHASE_DESTROY);
      expect(LifecycleOrderValidator.indexOf(PHASE_RESUME)).assertEqual(2);
      expect(LifecycleOrderValidator.indexOf('unknown')).assertEqual(-1);
    });

    it('validator_should_recognize_phases', 0, () => {
      expect(LifecycleOrderValidator.isKnownPhase(PHASE_CREATE)).assertTrue();
      expect(LifecycleOrderValidator.isKnownPhase(PHASE_START)).assertTrue();
      expect(LifecycleOrderValidator.isKnownPhase(PHASE_RESUME)).assertTrue();
      expect(LifecycleOrderValidator.isKnownPhase(PHASE_PAUSE)).assertTrue();
      expect(LifecycleOrderValidator.isKnownPhase(PHASE_STOP)).assertTrue();
      expect(LifecycleOrderValidator.isKnownPhase(PHASE_DESTROY)).assertTrue();
      expect(LifecycleOrderValidator.isKnownPhase('unknown')).assertFalse();
    });

    it('validator_should_accept_ordered_sequence', 0, () => {
      expect(LifecycleOrderValidator.isOrdered(EXPECTED_ORDER)).assertTrue();
      expect(LifecycleOrderValidator.isOrdered([PHASE_CREATE, PHASE_START, PHASE_RESUME])).assertTrue();
      expect(LifecycleOrderValidator.isOrdered([])).assertFalse();
      expect(LifecycleOrderValidator.isOrdered([PHASE_START, PHASE_CREATE])).assertFalse();
      expect(LifecycleOrderValidator.isOrdered(['unknown'])).assertFalse();
    });

    it('validator_should_reject_repeated_phase', 0, () => {
      expect(LifecycleOrderValidator.isOrdered([PHASE_CREATE, PHASE_CREATE])).assertFalse();
      expect(LifecycleOrderValidator.hasDuplicates([PHASE_CREATE, PHASE_CREATE])).assertTrue();
      expect(LifecycleOrderValidator.hasDuplicates(EXPECTED_ORDER)).assertFalse();
      expect(LifecycleOrderValidator.hasDuplicates([])).assertFalse();
    });

    it('validator_should_report_missing', 0, () => {
      expect(LifecycleOrderValidator.firstMissing([])).assertEqual(PHASE_CREATE);
      expect(LifecycleOrderValidator.firstMissing([PHASE_CREATE])).assertEqual(PHASE_START);
      expect(LifecycleOrderValidator.firstMissing(EXPECTED_ORDER)).assertEqual('');
      expect(LifecycleOrderValidator.missingPhases([PHASE_CREATE, PHASE_DESTROY]))
        .assertDeepEquals([PHASE_START, PHASE_RESUME, PHASE_PAUSE, PHASE_STOP]);
      expect(LifecycleOrderValidator.isComplete(EXPECTED_ORDER)).assertTrue();
      expect(LifecycleOrderValidator.isComplete([PHASE_CREATE])).assertFalse();
    });

    it('validator_should_compare_phases', 0, () => {
      expect(LifecycleOrderValidator.isBefore(PHASE_CREATE, PHASE_START)).assertTrue();
      expect(LifecycleOrderValidator.isBefore(PHASE_STOP, PHASE_DESTROY)).assertTrue();
      expect(LifecycleOrderValidator.isBefore(PHASE_DESTROY, PHASE_CREATE)).assertFalse();
      expect(LifecycleOrderValidator.isBefore('unknown', PHASE_CREATE)).assertFalse();
    });

    it('timeline_should_record_phases', 0, () => {
      const timeline = new LifecycleTimeline(10);
      expect(timeline.record(PHASE_CREATE, 100)).assertTrue();
      expect(timeline.record(PHASE_START, 200)).assertTrue();
      expect(timeline.record('unknown', 300)).assertFalse();
      expect(timeline.count()).assertEqual(2);
      expect(timeline.phases()).assertDeepEquals([PHASE_CREATE, PHASE_START]);
      expect(timeline.timestampOf(PHASE_CREATE)).assertEqual(100);
      expect(timeline.timestampOf('missing')).assertEqual(-1);
    });

    it('timeline_should_compute_durations', 0, () => {
      const timeline = new LifecycleTimeline(10);
      timeline.record(PHASE_CREATE, 100);
      timeline.record(PHASE_START, 250);
      timeline.record(PHASE_RESUME, 400);
      expect(timeline.durationBetween(PHASE_CREATE, PHASE_START)).assertEqual(150);
      expect(timeline.durationBetween(PHASE_START, PHASE_RESUME)).assertEqual(150);
      expect(timeline.durationBetween(PHASE_CREATE, 'missing')).assertEqual(-1);
      expect(timeline.durationBetween('missing', PHASE_START)).assertEqual(-1);
    });

    it('timeline_should_be_bounded', 0, () => {
      const timeline = new LifecycleTimeline(2);
      timeline.record(PHASE_CREATE, 1);
      timeline.record(PHASE_START, 2);
      timeline.record(PHASE_RESUME, 3);
      expect(timeline.count()).assertEqual(2);
      expect(timeline.phases()).assertDeepEquals([PHASE_START, PHASE_RESUME]);
      expect(timeline.timestampOf(PHASE_CREATE)).assertEqual(-1);
      timeline.clear();
      expect(timeline.count()).assertEqual(0);
      const zero = new LifecycleTimeline(0);
      expect(zero.record(PHASE_CREATE, 1)).assertFalse();
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new LifecycleReport();
      report.check('order', LifecycleOrderValidator.isOrdered(EXPECTED_ORDER));
      report.check('complete', LifecycleOrderValidator.isComplete(EXPECTED_ORDER));
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('compliant');
      report.check('duplicate', false);
      expect(report.isPassed()).assertFalse();
      expect(report.summary()).assertEqual('violation');
      expect(report.failures()).assertDeepEquals(['duplicate']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('lifecycle_flow_should_be_compliant', 0, () => {
      const timeline = new LifecycleTimeline(10);
      for (let i = 0; i < EXPECTED_ORDER.length; i++) {
        timeline.record(EXPECTED_ORDER[i], (i + 1) * 100);
      }
      const recorded = timeline.phases();
      expect(LifecycleOrderValidator.isOrdered(recorded)).assertTrue();
      expect(LifecycleOrderValidator.isComplete(recorded)).assertTrue();
      expect(LifecycleOrderValidator.hasDuplicates(recorded)).assertFalse();
      expect(timeline.durationBetween(PHASE_CREATE, PHASE_DESTROY)).assertEqual(500);
      const report = new LifecycleReport();
      report.check('ordered', LifecycleOrderValidator.isOrdered(recorded));
      expect(report.isPassed()).assertTrue();
    });

    it('lifecycle_constants_should_be_stable', 0, () => {
      expect(PHASE_CREATE).assertEqual('create');
      expect(PHASE_START).assertEqual('start');
      expect(PHASE_RESUME).assertEqual('resume');
      expect(PHASE_PAUSE).assertEqual('pause');
      expect(PHASE_STOP).assertEqual('stop');
      expect(PHASE_DESTROY).assertEqual('destroy');
    });
  });
}

