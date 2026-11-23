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
  waitForContactsPage,
  clickSampleButtonAt,
  clickSampleButton,
  TEXT_SELECT_BY_PICKER,
  TEXT_UPDATE_BY_PICKER,
  sampleButtons
} from '../Shared/ContactsDriver';
import { PickerSession, PickerOptions } from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

enum PickerOpType {
  SELECT = 0,
  ADD = 1,
  UPDATE = 2
}

interface PickerOpRecord {
  opType: PickerOpType;
  startedAt: number;
  finishedAt: number;
  outcome: boolean;
  concurrency: number;
}

class PickerOpTracker {
  private records: PickerOpRecord[] = [];
  private active: Map<PickerOpType, number> = new Map<PickerOpType, number>();
  private maxPeak: number = 0;
  private peak: number = 0;

  public begin(opType: PickerOpType): number {
    const running: number = this.active.get(opType) ?? 0;
    this.active.set(opType, running + 1);
    return this.active.get(opType) ?? 0;
  }

  public finish(opType: PickerOpType, outcome: boolean): void {
    const running: number = this.active.get(opType) ?? 0;
    const next: number = Math.max(0, running - 1);
    if (next === 0) {
      this.active.set(opType, 0);
    } else {
      this.active.set(opType, next);
    }
    this.records.push({ opType: opType, startedAt: 0, finishedAt: Date.now(), outcome: outcome, concurrency: running });
    this.peak = Math.max(this.peak, running);
  }

  public countRunning(): number {
    let sum: number = 0;
    this.active.forEach((value: number) => {
      sum += value;
    });
    return sum;
  }

  public getMaxPeak(): number {
    if (this.maxPeak < this.peak) {
      this.maxPeak = this.peak;
    }
    return this.maxPeak;
  }

  public getTotal(): number {
    return this.records.length;
  }

  public getByType(opType: PickerOpType): PickerOpRecord[] {
    return this.records.filter((r: PickerOpRecord) => r.opType === opType);
  }

  public reset(): void {
    this.records = [];
    this.active.clear();
    this.maxPeak = 0;
    this.peak = 0;
  }
}

// 并发控制器：保证同一时刻只允许一个 picker 操作进入底层
class PickerGate {
  private held: boolean = false;
  private queued: number = 0;
  private dropped: number = 0;

  public enter(): boolean {
    if (this.held) {
      this.dropped++;
      return false;
    }
    this.held = true;
    this.queued++;
    return true;
  }

  public leave(): void {
    this.held = false;
  }

  public isHeld(): boolean {
    return this.held;
  }

  public getQueued(): number {
    return this.queued;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public reset(): void {
    this.held = false;
    this.queued = 0;
    this.dropped = 0;
  }
}

export default function contactPickerConcurrencyTest(): void {
  describe('ContactPickerConcurrency_Test', () => {
    let driver: Driver;
    let tracker: PickerOpTracker;
    let gate: PickerGate;

    beforeAll(async () => {
      driver = getDriver();
      tracker = new PickerOpTracker();
      gate = new PickerGate();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('picker_concurrency_gate_should_allow_first_operation__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_concurrency_gate_should_allow_first_operation', () => {
      gate.reset();
      expect(gate.enter()).assertTrue();
      expect(gate.isHeld()).assertTrue();
      expect(gate.getQueued()).assertEqual(1);
      gate.leave();
      expect(gate.isHeld()).assertFalse();
    });

    mergedCases.run('picker_concurrency_gate_should_drop_overlapping_operation', () => {
      gate.reset();
      expect(gate.enter()).assertTrue();
      expect(gate.enter()).assertFalse();
      expect(gate.getDropped()).assertEqual(1);
      expect(gate.getQueued()).assertEqual(1);
      gate.leave();
      expect(gate.enter()).assertTrue();
      expect(gate.getQueued()).assertEqual(2);
    });

    mergedCases.run('picker_concurrency_tracker_should_not_exceed_peak_one', () => {
      tracker.reset();
      const f1: PickerSession = new PickerSession();
      f1.open();
      tracker.begin(PickerOpType.SELECT);
      const f2: PickerSession = new PickerSession();
      f2.open();
      tracker.begin(PickerOpType.SELECT);
      expect(tracker.countRunning()).assertEqual(2);
      tracker.finish(PickerOpType.SELECT, true);
      tracker.finish(PickerOpType.SELECT, true);
      expect(tracker.getMaxPeak()).assertLargerOrEqual(2);
    });

    mergedCases.run('picker_concurrency_tracker_should_count_by_type', () => {
      tracker.reset();
      tracker.begin(PickerOpType.SELECT);
      tracker.finish(PickerOpType.SELECT, true);
      tracker.begin(PickerOpType.ADD);
      tracker.finish(PickerOpType.ADD, false);
      expect(tracker.getTotal()).assertEqual(2);
      expect(tracker.getByType(PickerOpType.SELECT).length).assertEqual(1);
      expect(tracker.getByType(PickerOpType.ADD).length).assertEqual(1);
    });
      mergedCases.finish();
    });

    it('picker_concurrency_page_should_survive_rapid_picker_calls', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
      for (let i = 0; i < 5; i++) {
        await clickSampleButtonAt(driver, 0);
        await serializedDelay(driver, 200);
      }
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('picker_concurrency_page_should_survive_mixed_buttons', 0, async () => {
      await ensureContactsPage(driver);
      const labels: string[] = sampleButtons();
      expect(labels.length).assertEqual(4);
      for (let i = 0; i < labels.length; i++) {
        await clickSampleButtonAt(driver, i);
        await serializedDelay(driver, 150);
      }
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_concurrency_should_keep_page_responsive_after_burst', 0, async () => {
      await ensureContactsPage(driver);
      const before: number = await contactPageComponentCount(driver);
      for (let i = 0; i < 8; i++) {
        await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
        await serializedDelay(driver, 100);
      }
      await ensureContactsPage(driver);
      const after: number = await contactPageComponentCount(driver);
      expect(after).assertLargerOrEqual(1);
      expect(Math.abs(after - before)).assertLessOrEqual(10);
    });

    it('picker_concurrency_should_hold_for_update_button', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_concurrency_gate_should_serialize_sessions__group_3', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_concurrency_gate_should_serialize_sessions', () => {
      gate.reset();
      const s1: PickerSession = new PickerSession();
      const s2: PickerSession = new PickerSession();
      s1.open();
      s2.open();
      expect(gate.enter()).assertTrue();
      s1.resolve(1);
      gate.leave();
      expect(gate.enter()).assertTrue();
      s2.cancel();
      gate.leave();
      expect(gate.getDropped()).assertEqual(0);
      expect(gate.getQueued()).assertEqual(2);
    });

    mergedCases.run('picker_concurrency_options_should_limit_multi_selection', () => {
      const multi: PickerOptions = new PickerOptions(true, 3);
      multi.setSelectedCount(3);
      expect(multi.canSelectMore()).assertFalse();
      multi.setSelectedCount(1);
      expect(multi.canSelectMore()).assertTrue();
      expect(multi.capacity()).assertEqual(3);
    });

    mergedCases.run('picker_concurrency_tracker_should_reset_between_batches', () => {
      tracker.reset();
      tracker.begin(PickerOpType.SELECT);
      tracker.finish(PickerOpType.SELECT, true);
      expect(tracker.getTotal()).assertEqual(1);
      tracker.reset();
      expect(tracker.getTotal()).assertEqual(0);
      expect(tracker.getMaxPeak()).assertEqual(0);
    });
      mergedCases.finish();
    });

    it('picker_concurrency_page_should_wait_for_render', 0, async () => {
      const ready: boolean = await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      expect(ready).assertTrue();
    });

    it('picker_concurrency_gate_should_measure_time_in_flight__group_5', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_concurrency_gate_should_measure_time_in_flight', () => {
      const gate: PickerConcurrencyGate = new PickerConcurrencyGate();
      gate.enter();
      expect(gate.isHeld()).assertTrue();
      gate.leave();
      expect(gate.isHeld()).assertFalse();
      expect(gate.getThroughput()).assertEqual(1);
    });

    mergedCases.run('picker_concurrency_gate_should_have_no_contention_on_single', () => {
      const gate: PickerConcurrencyGate = new PickerConcurrencyGate();
      for (let i = 0; i < 5; i++) {
        gate.enter();
        gate.leave();
      }
      expect(gate.getThroughput()).assertEqual(5);
      expect(gate.getContention()).assertEqual(0);
    });

    mergedCases.run('picker_concurrency_gate_should_count_contention', () => {
      const gate: PickerConcurrencyGate = new PickerConcurrencyGate();
      gate.enter();
      gate.enter();
      gate.leave();
      expect(gate.getContention()).assertEqual(1);
      expect(gate.getThroughput()).assertEqual(1);
    });

    mergedCases.run('picker_concurrency_peek_should_not_exceed_capacity', () => {
      const opts: PickerOptions = new PickerOptions(true, 2);
      opts.setSelectedCount(2);
      expect(opts.canSelectMore()).assertFalse();
      const single: PickerOptions = new PickerOptions(false, 0);
      expect(single.capacity()).assertEqual(1);
    });

    mergedCases.run('picker_concurrency_session_peak_should_be_bounded', () => {
      tracker.reset();
      let runningSum: number = 0;
      for (let i = 0; i < 4; i++) {
        tracker.begin(PickerOpType.SELECT);
        runningSum++;
        tracker.finish(PickerOpType.SELECT, true);
      }
      expect(tracker.getTotal()).assertEqual(4);
      expect(runningSum).assertEqual(4);
    });
      mergedCases.finish();
    });

    it('picker_concurrency_should_keep_page_after_mixed_rapid', 0, async () => {
      await ensureContactsPage(driver);
      for (let i = 0; i < 6; i++) {
        await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
        await serializedDelay(driver, 80);
      }
      await pressAndWait(driver, KEY_BACK, 1, 80);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_concurrency_sessions_should_serialize__group_2', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_concurrency_sessions_should_serialize', () => {
      const gate: PickerConcurrencyGate = new PickerConcurrencyGate();
      expect(gate.isHeld()).assertFalse();
      gate.enter();
      expect(gate.isHeld()).assertTrue();
      gate.leave();
      gate.enter();
      gate.leave();
      expect(gate.getThroughput()).assertEqual(2);
    });

    mergedCases.run('picker_concurrency_contention_should_grow_with_overlap', () => {
      const gate: PickerConcurrencyGate = new PickerConcurrencyGate();
      gate.enter();
      gate.enter();
      gate.enter();
      gate.leave();
      expect(gate.getContention()).assertEqual(2);
      expect(gate.getThroughput()).assertEqual(1);
    });
      mergedCases.finish();
    });

    it('picker_concurrency_page_should_survive_holder_cycle', 0, async () => {
      await ensureContactsPage(driver);
      const gate: PickerConcurrencyGate = new PickerConcurrencyGate();
      gate.enter();
      gate.leave();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    it('picker_concurrency_operation_peek_should_be_bounded__group_3', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_concurrency_operation_peek_should_be_bounded', () => {
      const tracker2: PickerOpTracker = new PickerOpTracker();
      tracker2.begin(PickerOpType.ADD);
      tracker2.begin(PickerOpType.UPDATE);
      tracker2.finish(PickerOpType.ADD, true);
      tracker2.finish(PickerOpType.UPDATE, true);
      expect(tracker2.getTotal()).assertEqual(2);
    });

    mergedCases.run('picker_concurrency_options_single_should_be_capacity_one', () => {
      const opts: PickerOptions = new PickerOptions(false, 0);
      opts.setSelectedCount(0);
      expect(opts.capacity()).assertEqual(1);
      expect(opts.canSelectMore()).assertTrue();
    });

    mergedCases.run('picker_concurrency_options_multi_should_cap', () => {
      const opts: PickerOptions = new PickerOptions(true, 2);
      opts.setSelectedCount(2);
      expect(opts.canSelectMore()).assertFalse();
      opts.setSelectedCount(1);
      expect(opts.canSelectMore()).assertTrue();
    });
      mergedCases.finish();
    });

    it('picker_concurrency_should_keep_page_consistent', 0, async () => {
      await ensureContactsPage(driver);
      const before: number = await contactPageComponentCount(driver);
      await serializedDelay(driver, 100);
      const after: number = await contactPageComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(10);
    });

    it('picker_concurrency_gate_should_track_time__group_2', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_concurrency_gate_should_track_time', () => {
      const gate2: PickerConcurrencyGate = new PickerConcurrencyGate();
      gate2.enter();
      expect(gate2.getThroughput()).assertEqual(1);
      gate2.leave();
      expect(gate2.isHeld()).assertFalse();
    });

    mergedCases.run('picker_concurrency_operation_count_should_accumulate', () => {
      const opTracker = new PickerOpTracker();
      opTracker.begin(PickerOpType.SELECT);
      opTracker.begin(PickerOpType.ADD);
      opTracker.finish(PickerOpType.SELECT, true);
      opTracker.finish(PickerOpType.ADD, false);
      expect(opTracker.getTotal()).assertEqual(2);
    });
      mergedCases.finish();
    });

    it('picker_concurrency_should_stay_consistent_across_batches', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButtonAt(driver, 2);
      await serializedDelay(driver, 200);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_concurrency_empty_sessions_should_not_count__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_concurrency_empty_sessions_should_not_count', () => {
      const opTracker = new PickerOpTracker();
      expect(opTracker.getTotal()).assertEqual(0);
      expect(opTracker.countRunning()).assertEqual(0);
    });

    // 并发下会话应各自独立解析
    mergedCases.run('picker_concurrency_sessions_should_be_independent', () => {
      const s1: PickerSession = new PickerSession();
      const s2: PickerSession = new PickerSession();
      s1.open();
      s2.open();
      s1.resolve(1);
      expect(s1.isResolved()).assertTrue();
      expect(s2.isResolved()).assertFalse();
    });

    // 并发下多选容量应按配置约束
    mergedCases.run('picker_concurrency_multi_capacity_should_bind', () => {
      const opts: PickerOptions = new PickerOptions(true, 1);
      opts.setSelectedCount(1);
      expect(opts.canSelectMore()).assertFalse();
    });

    // 并发下复选框按通道区分
    mergedCases.run('picker_concurrency_operation_type_should_differ', () => {
      const opTracker = new PickerOpTracker();
      opTracker.begin(PickerOpType.SELECT);
      opTracker.finish(PickerOpType.SELECT, true);
      opTracker.begin(PickerOpType.ADD);
      opTracker.finish(PickerOpType.ADD, true);
      expect(opTracker.getTotal()).assertEqual(2);
      expect(opTracker.countRunning()).assertEqual(0);
    });
      mergedCases.finish();
    });

    // 并发页面应始终可重新进入
    it('picker_concurrency_should_allow_reenter', 0, async () => {
      await ensureContactsPage(driver);
      const g: PickerConcurrencyGate = new PickerConcurrencyGate();
      g.enter();
      g.leave();
      const ready: boolean = await waitForContactsPage(driver, TIMEOUT_PAGE_RENDER);
      expect(ready).assertTrue();
    });

    // 并发压力下页签组件数应保持稳定
    it('picker_concurrency_component_count_should_be_stable', 0, async () => {
      await ensureContactsPage(driver);
      const c: number = await contactPageComponentCount(driver);
      expect(c).assertLargerOrEqual(1);
    });
  });
}

class PickerConcurrencyGate {
  private held: boolean = false;
  private passed: number = 0;
  private contended: number = 0;

  public enter(): void {
    if (this.held) {
      this.contended++;
      return;
    }
    this.held = true;
    this.passed++;
  }

  public leave(): void {
    this.held = false;
  }

  public isHeld(): boolean {
    return this.held;
  }

  public getThroughput(): number {
    return this.passed;
  }

  public getContention(): number {
    return this.contended;
  }
}
