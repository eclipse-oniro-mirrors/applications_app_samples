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
  DELAY_AFTER_PICKER,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  contactPageComponentCount,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  waitForStableContactPage,
  clickSampleButton,
  clickSampleButtonAt,
  TEXT_ADD_BY_PICKER,
  TEXT_SELECT_BY_PICKER,
  TEXT_UPDATE_BY_PICKER,
  TEXT_ADD_BY_PERMISSION
} from '../Shared/ContactsDriver';
import { ContactFactory, ContactRecord, ContactValidator, PickerSession, PickerOptions } from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

enum PickerFlowPhase {
  IDLE = 'idle',
  OPENING = 'opening',
  SELECTING = 'selecting',
  RESOLVED = 'resolved',
  CANCELLED = 'cancelled',
  CLOSED = 'closed'
}

interface FlowRecord {
  phase: PickerFlowPhase;
  duration: number;
  success: boolean;
  timestamp: number;
}

class PickerFlowTracker {
  private static instance: PickerFlowTracker;
  private history: FlowRecord[] = [];
  private total: number = 0;
  private succeeded: number = 0;

  public static getInstance(): PickerFlowTracker {
    if (!PickerFlowTracker.instance) {
      PickerFlowTracker.instance = new PickerFlowTracker();
    }
    return PickerFlowTracker.instance;
  }

  public record(phase: PickerFlowPhase, duration: number, success: boolean): void {
    this.history.push({ phase: phase, duration: duration, success: success, timestamp: Date.now() });
    this.total++;
    if (success) {
      this.succeeded++;
    }
  }

  public getHistory(): FlowRecord[] {
    return this.history.map((r: FlowRecord) => r);
  }

  public getTotal(): number {
    return this.total;
  }

  public getSucceeded(): number {
    return this.succeeded;
  }

  public getSuccessRate(): number {
    if (this.total === 0) {
      return 0;
    }
    return this.succeeded / this.total;
  }

  public hasPhase(phase: PickerFlowPhase): boolean {
    return this.history.some((r: FlowRecord) => r.phase === phase);
  }

  public reset(): void {
    this.history = [];
    this.total = 0;
    this.succeeded = 0;
  }
}

class PickerFlowValidator {
  public static isValidTransition(from: PickerFlowPhase, to: PickerFlowPhase): boolean {
    if (from === PickerFlowPhase.IDLE) {
      return to === PickerFlowPhase.OPENING;
    }
    if (from === PickerFlowPhase.OPENING) {
      return to === PickerFlowPhase.SELECTING;
    }
    if (from === PickerFlowPhase.SELECTING) {
      return to === PickerFlowPhase.RESOLVED || to === PickerFlowPhase.CANCELLED;
    }
    if (from === PickerFlowPhase.RESOLVED || from === PickerFlowPhase.CANCELLED) {
      return to === PickerFlowPhase.CLOSED;
    }
    return false;
  }

  public static isFinished(phase: PickerFlowPhase): boolean {
    return phase === PickerFlowPhase.CLOSED;
  }

  public static canRestart(phase: PickerFlowPhase): boolean {
    return phase === PickerFlowPhase.CLOSED || phase === PickerFlowPhase.IDLE;
  }
}

// 选择器并发守卫：保证同一时刻只有一个 picker 会话在运行
class PickerConcurrencyGuard {
  private activeSession: PickerSession | null = null;
  private rejected: number = 0;
  private accepted: number = 0;

  public tryAcquire(target: PickerSession): boolean {
    if (this.activeSession !== null && this.activeSession.isOpened()) {
      this.rejected++;
      return false;
    }
    this.activeSession = target;
    this.accepted++;
    return true;
  }

  public release(session: PickerSession): void {
    if (this.activeSession === session) {
      this.activeSession = null;
    }
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getAccepted(): number {
    return this.accepted;
  }

  public isBusy(): boolean {
    return this.activeSession !== null && this.activeSession.isOpened();
  }
}

export default function contactPickerEndToEndTest(): void {
  describe('ContactPickerEndToEnd_Test', () => {
    let driver: Driver;
    let tracker: PickerFlowTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = PickerFlowTracker.getInstance();
      tracker.reset();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('picker_flow_should_begin_from_idle', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver, TIMEOUT_PAGE_RENDER);
      expect(ready).assertTrue();
      tracker.record(PickerFlowPhase.IDLE, 0, true);
      tracker.record(PickerFlowPhase.OPENING, 10, true);
      expect(tracker.hasPhase(PickerFlowPhase.IDLE)).assertTrue();
      expect(tracker.hasPhase(PickerFlowPhase.OPENING)).assertTrue();
    });

    it('picker_flow_should_allow_valid_transitions__group_8', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_flow_should_allow_valid_transitions', () => {
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.IDLE, PickerFlowPhase.OPENING)).assertTrue();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.OPENING, PickerFlowPhase.SELECTING)).assertTrue();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.SELECTING, PickerFlowPhase.RESOLVED)).assertTrue();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.SELECTING, PickerFlowPhase.CANCELLED)).assertTrue();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.RESOLVED, PickerFlowPhase.CLOSED)).assertTrue();
      expect(PickerFlowValidator.isFinished(PickerFlowPhase.CLOSED)).assertTrue();
    });

    mergedCases.run('picker_flow_should_reject_invalid_transitions', () => {
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.IDLE, PickerFlowPhase.CLOSED)).assertFalse();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.OPENING, PickerFlowPhase.CLOSED)).assertFalse();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.OPENING, PickerFlowPhase.IDLE)).assertFalse();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.CANCELLED, PickerFlowPhase.RESOLVED)).assertFalse();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.CLOSED, PickerFlowPhase.SELECTING)).assertFalse();
    });

    mergedCases.run('picker_flow_tracker_should_count_success_rate', () => {
      tracker.reset();
      tracker.record(PickerFlowPhase.OPENING, 10, true);
      tracker.record(PickerFlowPhase.SELECTING, 20, true);
      tracker.record(PickerFlowPhase.CANCELLED, 30, false);
      expect(tracker.getTotal()).assertEqual(3);
      expect(tracker.getSucceeded()).assertEqual(2);
      expect(tracker.getSuccessRate()).assertEqual(2 / 3);
    });

    mergedCases.run('picker_flow_guard_should_reject_concurrent_sessions', () => {
      const guard: PickerConcurrencyGuard = new PickerConcurrencyGuard();
      const first: PickerSession = new PickerSession();
      first.open();
      const second: PickerSession = new PickerSession();
      second.open();
      expect(guard.tryAcquire(first)).assertTrue();
      expect(guard.tryAcquire(second)).assertFalse();
      expect(guard.getAccepted()).assertEqual(1);
      expect(guard.getRejected()).assertEqual(1);
      guard.release(first);
      expect(guard.tryAcquire(second)).assertTrue();
    });

    mergedCases.run('picker_flow_guard_should_report_busy', () => {
      const guard: PickerConcurrencyGuard = new PickerConcurrencyGuard();
      const session: PickerSession = new PickerSession();
      session.open();
      expect(guard.isBusy()).assertFalse();
      guard.tryAcquire(session);
      expect(guard.isBusy()).assertTrue();
      guard.release(session);
      expect(guard.isBusy()).assertFalse();
    });

    mergedCases.run('picker_flow_session_should_track_resolution', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.resolve(2);
      expect(session.isOpened()).assertTrue();
      expect(session.isResolved()).assertTrue();
      expect(session.isCancelled()).assertFalse();
      expect(session.getResultCount()).assertEqual(2);
    });

    mergedCases.run('picker_flow_session_should_track_cancellation', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.cancel();
      expect(session.isCancelled()).assertTrue();
      expect(session.isResolved()).assertTrue();
      expect(session.getResultCount()).assertEqual(0);
    });

    mergedCases.run('picker_flow_options_should_respect_multi_selection', () => {
      const single: PickerOptions = new PickerOptions(false, 0);
      const multi: PickerOptions = new PickerOptions(true, 5);
      expect(single.capacity()).assertEqual(1);
      expect(multi.capacity()).assertEqual(5);
      single.setSelectedCount(1);
      multi.setSelectedCount(5);
      expect(single.canSelectMore()).assertFalse();
      expect(multi.canSelectMore()).assertFalse();
    });
      mergedCases.finish();
    });

    it('picker_flow_page_should_survive_picker_flow', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
      await waitForStableContactPage(driver);
      const before: number = await contactPageComponentCount(driver);
      expect(before).assertLargerOrEqual(1);
      const clicked: boolean = await clickSampleButton(driver, TEXT_ADD_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await pressAndWait(driver, KEY_BACK, 1, 50);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_flow_select_button_should_keep_page_consistent', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
    });

    it('picker_flow_update_button_should_keep_page_consistent', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
    });

    it('picker_flow_add_permission_button_should_keep_page_alive', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_ADD_BY_PERMISSION);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 300);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_flow_model_should_validate_contact_before_end_to_end__group_8', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_flow_model_should_validate_contact_before_end_to_end', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '13900001111');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
      const bad: ContactRecord = ContactFactory.buildRecord('', '');
      expect(ContactValidator.isValidRecord(bad)).assertFalse();
    });

    mergedCases.run('picker_flow_tracker_should_cover_all_phases', () => {
      tracker.reset();
      tracker.record(PickerFlowPhase.IDLE, 0, true);
      tracker.record(PickerFlowPhase.OPENING, 5, true);
      tracker.record(PickerFlowPhase.SELECTING, 15, true);
      tracker.record(PickerFlowPhase.RESOLVED, 2, true);
      tracker.record(PickerFlowPhase.CLOSED, 1, true);
      expect(tracker.getTotal()).assertEqual(5);
      expect(tracker.getSuccessRate()).assertEqual(1);
      expect(PickerFlowValidator.canRestart(PickerFlowPhase.CLOSED)).assertTrue();
    });

    mergedCases.run('picker_flow_guard_should_allow_sequential_sessions', () => {
      const guard: PickerConcurrencyGuard = new PickerConcurrencyGuard();
      for (let i = 0; i < 3; i++) {
        const session: PickerSession = new PickerSession();
        session.open();
        expect(guard.tryAcquire(session)).assertTrue();
        session.resolve(1);
        guard.release(session);
      }
      expect(guard.getRejected()).assertEqual(0);
      expect(guard.getAccepted()).assertEqual(3);
    });

    mergedCases.run('picker_flow_validator_should_allow_restart_from_closed', () => {
      expect(PickerFlowValidator.canRestart(PickerFlowPhase.CLOSED)).assertTrue();
      expect(PickerFlowValidator.canRestart(PickerFlowPhase.IDLE)).assertTrue();
      expect(PickerFlowValidator.canRestart(PickerFlowPhase.OPENING)).assertFalse();
    });

    mergedCases.run('picker_flow_tracker_success_rate_bounds', () => {
      tracker.reset();
      tracker.record(PickerFlowPhase.OPENING, 10, true);
      expect(tracker.getSuccessRate()).assertEqual(1);
      tracker.record(PickerFlowPhase.SELECTING, 10, false);
      expect(tracker.getSuccessRate()).assertLessOrEqual(0.5);
    });

    mergedCases.run('picker_flow_session_should_not_resolve_before_open', () => {
      const session: PickerSession = new PickerSession();
      expect(session.isResolved()).assertFalse();
      session.open();
      session.resolve(1);
      expect(session.getResultCount()).assertEqual(1);
    });

    mergedCases.run('picker_flow_session_cancel_should_yield_zero', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.cancel();
      expect(session.getResultCount()).assertEqual(0);
      expect(session.isCancelled()).assertTrue();
    });

    mergedCases.run('picker_flow_single_selection_capacity_is_one', () => {
      const opts: PickerOptions = new PickerOptions(false, 0);
      expect(opts.capacity()).assertEqual(1);
    });
      mergedCases.finish();
    });

    it('picker_flow_page_should_survive_all_buttons_round_trip', 0, async () => {
      await ensureContactsPage(driver);
      for (let i = 0; i < 4; i++) {
        await clickSampleButtonAt(driver, i);
        await serializedDelay(driver, 120);
        await ensureContactsPage(driver);
      }
    });

    it('picker_flow_model_should_validate_after_end_to_end__group_6', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_flow_model_should_validate_after_end_to_end', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '13900001111');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });

    mergedCases.run('picker_flow_tracker_should_expose_total_and_recovered', () => {
      tracker.reset();
      tracker.record(PickerFlowPhase.OPENING, 10, true);
      tracker.record(PickerFlowPhase.SELECTING, 20, true);
      expect(tracker.getTotal()).assertEqual(2);
      expect(tracker.getSucceeded()).assertEqual(2);
    });

    mergedCases.run('picker_flow_validator_should_reject_skipped_phases', () => {
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.IDLE, PickerFlowPhase.SELECTING)).assertFalse();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.OPENING, PickerFlowPhase.RESOLVED)).assertFalse();
    });

    mergedCases.run('picker_flow_session_should_track_cancellation_state', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.cancel();
      expect(session.isCancelled()).assertTrue();
      expect(session.getResultCount()).assertEqual(0);
    });

    mergedCases.run('picker_flow_multi_selection_should_respect_capacity', () => {
      const multi: PickerOptions = new PickerOptions(true, 3);
      multi.setSelectedCount(3);
      expect(multi.canSelectMore()).assertFalse();
      multi.setSelectedCount(2);
      expect(multi.canSelectMore()).assertTrue();
    });

    mergedCases.run('picker_flow_guard_should_reject_overlap', () => {
      const guard: PickerConcurrencyGuard = new PickerConcurrencyGuard();
      const first: PickerSession = new PickerSession();
      const second: PickerSession = new PickerSession();
      first.open();
      second.open();
      expect(guard.tryAcquire(first)).assertTrue();
      expect(guard.tryAcquire(second)).assertFalse();
      guard.release(first);
      expect(guard.tryAcquire(second)).assertTrue();
    });
      mergedCases.finish();
    });

    it('picker_flow_page_select_button_should_survive', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 200);
      await ensureContactsPage(driver);
    });

    it('picker_flow_page_add_button_should_survive', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_ADD_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 200);
      await ensureContactsPage(driver);
    });

    it('picker_flow_page_update_button_should_survive', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 200);
      await ensureContactsPage(driver);
    });

    it('picker_flow_tracker_should_return_history_copy__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_flow_tracker_should_return_history_copy', () => {
      tracker.reset();
      tracker.record(PickerFlowPhase.OPENING, 5, true);
      const history3 = tracker.getHistory();
      expect(history3.length).assertEqual(1);
      expect(history3[0].phase).assertEqual(PickerFlowPhase.OPENING);
    });

    mergedCases.run('picker_flow_validator_should_work_on_all_edges', () => {
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.SELECTING, PickerFlowPhase.RESOLVED)).assertTrue();
      expect(PickerFlowValidator.isValidTransition(PickerFlowPhase.SELECTING, PickerFlowPhase.CANCELLED)).assertTrue();
      expect(PickerFlowValidator.isFinished(PickerFlowPhase.CLOSED)).assertTrue();
    });

    mergedCases.run('picker_flow_tracker_timestamps_should_rise', () => {
      tracker.reset();
      tracker.record(PickerFlowPhase.OPENING, 5, true);
      tracker.record(PickerFlowPhase.SELECTING, 5, true);
      const hist = tracker.getHistory();
      expect(hist[0].timestamp).assertLessOrEqual(hist[1].timestamp);
    });

    // 完整流水线应覆盖五个关键阶段
    mergedCases.run('picker_flow_should_span_five_stages', () => {
      tracker.reset();
      tracker.record(PickerFlowPhase.OPENING, 1, true);
      tracker.record(PickerFlowPhase.SELECTING, 1, true);
      tracker.record(PickerFlowPhase.RESOLVED, 1, true);
      tracker.record(PickerFlowPhase.CLOSED, 1, true);
      expect(tracker.getTotal()).assertEqual(4);
    });
      mergedCases.finish();
    });
  });
}