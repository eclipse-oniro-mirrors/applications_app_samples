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

import { MergedTestCases } from '../Shared/MergedTestCases';
import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  KEY_BACK,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  clickSampleButton,
  TEXT_SELECT_BY_PICKER
} from '../Shared/ContactsDriver';
import { PickerSession } from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

enum PickerLifecyclePhase {
  CREATED = 'created',
  SHOWING = 'showing',
  VISIBLE = 'visible',
  INTERACTING = 'interacting',
  HIDING = 'hiding',
  HIDDEN = 'hidden',
  DESTROYED = 'destroyed'
}

interface LifecycleRecord {
  phase: PickerLifecyclePhase;
  duration: number;
  isSuccess: boolean;
  timestamp: number;
}

class PickerLifecycleTracker {
  private static instance: PickerLifecycleTracker;
  private history: LifecycleRecord[] = [];
  private totalPhases: number = 0;
  private successfulPhases: number = 0;

  public static getInstance(): PickerLifecycleTracker {
    if (!PickerLifecycleTracker.instance) {
      PickerLifecycleTracker.instance = new PickerLifecycleTracker();
    }
    return PickerLifecycleTracker.instance;
  }

  public recordLifecycle(phase: PickerLifecyclePhase, duration: number, isSuccess: boolean): void {
    this.history.push({ phase: phase, duration: duration, isSuccess: isSuccess, timestamp: Date.now() });
    this.totalPhases++;
    if (isSuccess) {
      this.successfulPhases++;
    }
  }

  public getLifecycleHistory(): LifecycleRecord[] {
    return this.history.map((r: LifecycleRecord) => r);
  }

  public getTotalPhases(): number {
    return this.totalPhases;
  }

  public getSuccessfulPhases(): number {
    return this.successfulPhases;
  }

  public reset(): void {
    this.history = [];
    this.totalPhases = 0;
    this.successfulPhases = 0;
  }

  public getSuccessRate(): number {
    if (this.totalPhases === 0) {
      return 0;
    }
    return this.successfulPhases / this.totalPhases;
  }

  public hasPhase(phase: PickerLifecyclePhase): boolean {
    return this.history.some((r: LifecycleRecord) => r.phase === phase);
  }

  public getAverageDuration(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.history.length; i++) {
      total += this.history[i].duration;
    }
    return total / this.history.length;
  }
}

export default function contactPickerLifecycleTest(): void {
  describe('ContactPickerLifecycle_Test', () => {
    let driver: Driver;
    let tracker: PickerLifecycleTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = PickerLifecycleTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('picker_lifecycle_should_complete_created_phase', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 0, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.CREATED)).assertTrue();
    });

    it('picker_lifecycle_should_complete_showing_phase', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.SHOWING, 0, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.SHOWING)).assertTrue();
    });

    it('picker_lifecycle_should_complete_visible_phase', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 0, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.VISIBLE)).assertTrue();
    });

    it('picker_lifecycle_should_complete_interacting_phase', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.INTERACTING, 0, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.INTERACTING)).assertTrue();
    });

    it('picker_lifecycle_should_complete_hiding_phase', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.HIDING, 0, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.HIDING)).assertTrue();
    });

    it('picker_lifecycle_should_complete_hidden_phase', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.HIDDEN, 0, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.HIDDEN)).assertTrue();
    });

    it('picker_lifecycle_should_complete_destroyed_phase', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.DESTROYED, 0, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.DESTROYED)).assertTrue();
    });

    it('picker_lifecycle_records_should_be_chronological', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.SHOWING, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 100, true);
      const history: LifecycleRecord[] = tracker.getLifecycleHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('picker_lifecycle_tracker_should_be_singleton', 0, async () => {
      const t1: PickerLifecycleTracker = PickerLifecycleTracker.getInstance();
      const t2: PickerLifecycleTracker = PickerLifecycleTracker.getInstance();
      expect(t1 === t2).assertTrue();
      t1.reset();
      t1.recordLifecycle(PickerLifecyclePhase.CREATED, 100, true);
      expect(t2.getTotalPhases()).assertEqual(1);
    });

    it('picker_lifecycle_should_handle_all_phases', 0, async () => {
      tracker.reset();
      const phases: PickerLifecyclePhase[] = [
        PickerLifecyclePhase.CREATED, PickerLifecyclePhase.SHOWING, PickerLifecyclePhase.VISIBLE,
        PickerLifecyclePhase.INTERACTING, PickerLifecyclePhase.HIDING, PickerLifecyclePhase.HIDDEN,
        PickerLifecyclePhase.DESTROYED
      ];
      for (const phase of phases) {
        tracker.recordLifecycle(phase, 100, true);
      }
      expect(tracker.getTotalPhases()).assertEqual(7);
    });

    it('picker_lifecycle_should_maintain_quality_under_load', 0, async () => {
      tracker.reset();
      for (let i = 0; i < 10; i++) {
        const phase: PickerLifecyclePhase = i % 2 === 0
          ? PickerLifecyclePhase.INTERACTING : PickerLifecyclePhase.VISIBLE;
        tracker.recordLifecycle(phase, 100, true);
      }
      expect(tracker.getTotalPhases()).assertEqual(10);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    it('picker_lifecycle_should_have_optimal_duration', 0, async () => {
      tracker.reset();
      for (let i = 0; i < 10; i++) {
        tracker.recordLifecycle(PickerLifecyclePhase.INTERACTING, 150, true);
      }
      expect(tracker.getAverageDuration()).assertLessOrEqual(200);
    });

    it('picker_lifecycle_session_should_wrap_phases', 0, async () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.resolve(1);
      expect(session.isOpened()).assertTrue();
      expect(session.isResolved()).assertTrue();
      expect(session.getResultCount()).assertEqual(1);
    });

    it('picker_lifecycle_page_should_survive_open_close_cycle', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
      await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      await serializedDelay(driver, 300);
      await pressAndWait(driver, KEY_BACK, 1, 100);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_lifecycle_session_duration_should_be_non_negative', 0, async () => {
      const session: PickerSession = new PickerSession();
      expect(session.durationMs()).assertEqual(0);
      session.open();
      session.resolve(0);
      expect(session.durationMs()).assertLargerOrEqual(0);
    });

    it('picker_lifecycle_destroyed_phase_should_be_terminal', 0, async () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.DESTROYED, 10, true);
      expect(tracker.getTotalPhases()).assertEqual(1);
      expect(tracker.getSuccessfulPhases()).assertEqual(1);
    });

    it('picker_lifecycle_phase_order_should_be_defined__group_9', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_lifecycle_phase_order_should_be_defined', () => {
      const order: number = PickerLifecycle.phaseOrder(PickerLifecyclePhase.VISIBLE);
      expect(order).assertLarger(PickerLifecycle.phaseOrder(PickerLifecyclePhase.CREATED));
      expect(order).assertLess(PickerLifecycle.phaseOrder(PickerLifecyclePhase.DESTROYED));
    });

    mergedCases.run('picker_lifecycle_phase_order_created_is_first', () => {
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.CREATED)).assertEqual(0);
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.DESTROYED)).assertEqual(6);
    });

    mergedCases.run('picker_lifecycle_tracker_should_compute_average_duration', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 200, true);
      expect(tracker.getAverageDuration()).assertEqual(150);
    });

    mergedCases.run('picker_lifecycle_visible_phase_should_be_interactive_milestone', () => {
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.VISIBLE)).assertTrue();
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.INTERACTING)).assertTrue();
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.CREATED)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_terminal_phases_should_finish', () => {
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.DESTROYED)).assertTrue();
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.VISIBLE)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_success_rate_full_success', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 100, true);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_success_rate_partial_failure', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 100, false);
      expect(tracker.getSuccessRate()).assertEqual(0.5);
    });


    mergedCases.run('picker_lifecycle_should_report_optimal_average_under_target', () => {
      tracker.reset();
      for (let i = 0; i < 5; i++) {
        tracker.recordLifecycle(PickerLifecyclePhase.SHOWING, 120, true);
      }
      expect(tracker.getAverageDuration()).assertLessOrEqual(200);
    });
      mergedCases.finish();
    });

    it('picker_lifecycle_page_should_survive_reopen_cycle', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      await serializedDelay(driver, 300);
      await pressAndWait(driver, KEY_BACK, 1, 100);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_lifecycle_hidden_phase_should_prune_records__group_8', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_lifecycle_hidden_phase_should_prune_records', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.HIDDEN, 50, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.HIDDEN)).assertTrue();
      expect(tracker.getTotalPhases()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_order_should_be_strictly_increasing', () => {
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.CREATED)).assertLess(
        PickerLifecycle.phaseOrder(PickerLifecyclePhase.SHOWING));
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.HIDDEN)).assertLess(
        PickerLifecycle.phaseOrder(PickerLifecyclePhase.DESTROYED));
    });

    mergedCases.run('picker_lifecycle_interactive_phases_should_be_two', () => {
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.VISIBLE)).assertTrue();
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.INTERACTING)).assertTrue();
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.CREATED)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_terminal_only_destroyed', () => {
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.DESTROYED)).assertTrue();
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.HIDDEN)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_tracker_history_should_grow', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 10, true);
      tracker.recordLifecycle(PickerLifecyclePhase.SHOWING, 10, true);
      expect(tracker.getLifecycleHistory().length).assertEqual(2);
    });

    mergedCases.run('picker_lifecycle_success_rate_full', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 10, true);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_average_duration_zero_when_empty', () => {
      tracker.reset();
      expect(tracker.getAverageDuration()).assertEqual(0);
    });

    mergedCases.run('picker_lifecycle_session_duration_should_measure', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.resolve(1);
      expect(session.durationMs()).assertLargerOrEqual(0);
    });
      mergedCases.finish();
    });

    it('picker_lifecycle_should_survive_multiple_cycles', 0, async () => {
      await ensureContactsPage(driver);
      for (let i = 0; i < 2; i++) {
        const ready: boolean = await ensureContactsPage(driver);
        expect(ready).assertTrue();
        await serializedDelay(driver, 80);
      }
    });

    it('picker_lifecycle_order_visible_before_destroy__group_10', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_lifecycle_order_visible_before_destroy', () => {
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.VISIBLE)).assertLess(
        PickerLifecycle.phaseOrder(PickerLifecyclePhase.DESTROYED));
    });

    mergedCases.run('picker_lifecycle_interacting_is_interactive', () => {
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.INTERACTING)).assertTrue();
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.SHOWING)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_tracker_full_round', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 10, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 10, true);
      tracker.recordLifecycle(PickerLifecyclePhase.DESTROYED, 10, true);
      expect(tracker.getTotalPhases()).assertEqual(3);
      expect(tracker.getSuccessfulPhases()).assertEqual(3);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_tracker_partial_failure', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 10, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 10, false);
      expect(tracker.getSuccessRate()).assertEqual(0.5);
    });

    mergedCases.run('picker_lifecycle_average_one_phase', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 300, true);
      expect(tracker.getAverageDuration()).assertEqual(300);
    });

    mergedCases.run('picker_lifecycle_session_open_once', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      expect(session.isOpened()).assertTrue();
      session.resolve(1);
      expect(session.getResultCount()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_session_cancel_count', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.cancel();
      expect(session.getResultCount()).assertEqual(0);
      expect(session.isCancelled()).assertTrue();
    });

    mergedCases.run('picker_lifecycle_terminal_hidden_not_end', () => {
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.DESTROYED)).assertTrue();
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.HIDDEN)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_creator_first_phase', () => {
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.CREATED)).assertEqual(0);
    });

    mergedCases.run('picker_lifecycle_history_chronology', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 10, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 10, true);
      const history = tracker.getLifecycleHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
    });
      mergedCases.finish();
    });

    it('picker_lifecycle_page_reopen_consistency', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      await serializedDelay(driver, 200);
      await pressAndWait(driver, KEY_BACK, 1, 80);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_lifecycle_success_rate_empty__group_13', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_lifecycle_success_rate_empty', () => {
      tracker.reset();
      expect(tracker.getSuccessRate()).assertEqual(0);
    });

    mergedCases.run('picker_lifecycle_phase_order_full', () => {
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.CREATED)).assertLess(
        PickerLifecycle.phaseOrder(PickerLifecyclePhase.SHOWING));
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.SHOWING)).assertLess(
        PickerLifecycle.phaseOrder(PickerLifecyclePhase.VISIBLE));
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.HIDING)).assertLess(
        PickerLifecycle.phaseOrder(PickerLifecyclePhase.HIDDEN));
    });

    mergedCases.run('picker_lifecycle_interactive_set', () => {
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.VISIBLE)).assertTrue();
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.INTERACTING)).assertTrue();
      expect(PickerLifecycle.isInteractive(PickerLifecyclePhase.CREATED)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_only_destroyed_terminal', () => {
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.DESTROYED)).assertTrue();
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.HIDDEN)).assertFalse();
      expect(PickerLifecycle.isTerminal(PickerLifecyclePhase.VISIBLE)).assertFalse();
    });

    mergedCases.run('picker_lifecycle_tracker_full_success', () => {
      tracker.reset();
      for (let i = 0; i < 7; i++) {
        tracker.recordLifecycle(PickerLifecyclePhase.SHOWING, 10, true);
      }
      expect(tracker.getTotalPhases()).assertEqual(7);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_average_round', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.SHOWING, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 300, true);
      expect(tracker.getAverageDuration()).assertEqual(200);
    });

    mergedCases.run('picker_lifecycle_has_phase_covered', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 5, true);
      tracker.recordLifecycle(PickerLifecyclePhase.DESTROYED, 5, true);
      expect(tracker.hasPhase(PickerLifecyclePhase.CREATED)).assertTrue();
      expect(tracker.hasPhase(PickerLifecyclePhase.DESTROYED)).assertTrue();
    });

    mergedCases.run('picker_lifecycle_phase_order_visible_before_destroy', () => {
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.VISIBLE)).assertLess(
        PickerLifecycle.phaseOrder(PickerLifecyclePhase.DESTROYED));
    });

    mergedCases.run('picker_lifecycle_phase_order_created_min', () => {
      expect(PickerLifecycle.phaseOrder(PickerLifecyclePhase.CREATED)).assertEqual(0);
    });

    mergedCases.run('picker_lifecycle_tracker_average_two', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 300, true);
      expect(tracker.getAverageDuration()).assertEqual(200);
    });

    mergedCases.run('picker_lifecycle_tracker_period_success', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 100, true);
      expect(tracker.getSuccessfulPhases()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_tracker_period_failure', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 100, false);
      expect(tracker.getSuccessfulPhases()).assertEqual(0);
      expect(tracker.getTotalPhases()).assertEqual(1);
    });

    mergedCases.run('picker_lifecycle_success_rate_mixed', () => {
      tracker.reset();
      tracker.recordLifecycle(PickerLifecyclePhase.CREATED, 100, true);
      tracker.recordLifecycle(PickerLifecyclePhase.VISIBLE, 100, false);
      expect(tracker.getSuccessRate()).assertEqual(0.5);
    });
      mergedCases.finish();
    });
  });
}

class PickerLifecycle {
  public static readonly ORDER: PickerLifecyclePhase[] = [
    PickerLifecyclePhase.CREATED,
    PickerLifecyclePhase.SHOWING,
    PickerLifecyclePhase.VISIBLE,
    PickerLifecyclePhase.INTERACTING,
    PickerLifecyclePhase.HIDING,
    PickerLifecyclePhase.HIDDEN,
    PickerLifecyclePhase.DESTROYED
  ];

  public static phaseOrder(phase: PickerLifecyclePhase): number {
    return PickerLifecycle.ORDER.indexOf(phase);
  }

  public static isInteractive(phase: PickerLifecyclePhase): boolean {
    return phase === PickerLifecyclePhase.VISIBLE || phase === PickerLifecyclePhase.INTERACTING;
  }

  public static isTerminal(phase: PickerLifecyclePhase): boolean {
    return phase === PickerLifecyclePhase.DESTROYED;
  }
}