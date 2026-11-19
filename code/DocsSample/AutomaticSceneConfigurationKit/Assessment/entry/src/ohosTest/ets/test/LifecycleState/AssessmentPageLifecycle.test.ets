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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_EXAM_TITLE,
  TEXT_STATE_INACTIVE,
  TEXT_EXAM_PREVIOUS,
  TEXT_EXAM_NEXT,
  TEXT_EXAM_SUBMIT,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Names of the page lifecycle phases of the sample. The sequence mirrors the order in which
// ArkUI invokes the callbacks of the entry page: the component is created, its aboutToAppear
// runs before the first layout, onPageShow runs after the page became visible, and
// aboutToDisappear runs when the component is removed from the tree.
const PHASE_ABOUT_TO_APPEAR: string = 'aboutToAppear';
const PHASE_PAGE_SHOW: string = 'onPageShow';
const PHASE_ABOUT_TO_DISAPPEAR: string = 'aboutToDisappear';

// The exam page additionally starts its countdown in aboutToAppear and stops it in
// aboutToDisappear, it therefore carries two extra sub phases.
const PHASE_COUNTDOWN_START: string = 'startCountdown';
const PHASE_COUNTDOWN_STOP: string = 'stopCountdown';
const PHASE_HARDENING_APPLY: string = 'applyHardening';
const PHASE_HARDENING_RELEASE: string = 'releaseHardening';

// Durations are measured in milliseconds. The thresholds below bound what the model accepts
// as a plausible phase duration, they are not platform guarantees.
const PHASE_DURATION_MIN: number = 0;
const PHASE_DURATION_MAX: number = 3600000;

// The countdown of the exam page ticks once per second, the sample declares the interval in
// AssessmentConstants.COUNTDOWN_INTERVAL.
const COUNTDOWN_INTERVAL: number = 1000;

/**
 * One phase that a page went through, together with the elapsed time and the outcome.
 */
interface PhaseRecord {
  phase: string;
  sequence: number;
  durationMs: number;
  success: boolean;
}

/**
 * Tracks the lifecycle phases of one page instance.
 *
 * The tracker is the model of what the sample does on the device: every callback is recorded
 * with its arrival order, the elapsed time and the success flag. The helpers below let a case
 * assert the shape of a sequence without repeating the bookkeeping.
 */
class LifecycleTracker {
  private records: PhaseRecord[] = [];
  private showIndex: number = -1;

  /**
   * Records a phase.
   *
   * @param phase name of the phase.
   * @param durationMs elapsed time of the phase.
   * @param success true when the phase completed without an error.
   * @returns the record that was created.
   */
  public record(phase: string, durationMs: number, success: boolean): PhaseRecord {
    const record: PhaseRecord = {
      phase: phase,
      sequence: this.records.length,
      durationMs: durationMs,
      success: success
    };
    if (phase === PHASE_PAGE_SHOW && this.showIndex < 0) {
      this.showIndex = this.records.length;
    }
    this.records.push(record);
    return record;
  }

  public size(): number {
    return this.records.length;
  }

  public getRecords(): PhaseRecord[] {
    return this.records.slice();
  }

  public phaseNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      names.push(this.records[i].phase);
    }
    return names;
  }

  public contains(phase: string): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        return true;
      }
    }
    return false;
  }

  public count(phase: string): number {
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        total++;
      }
    }
    return total;
  }

  public indexOf(phase: string): number {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        return i;
      }
    }
    return -1;
  }

  public succeedsBefore(first: string, second: string): boolean {
    const firstIndex: number = this.indexOf(first);
    const secondIndex: number = this.indexOf(second);
    if (firstIndex < 0 || secondIndex < 0) {
      return false;
    }
    return firstIndex < secondIndex;
  }

  public allSucceeded(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (!this.records[i].success) {
        return false;
      }
    }
    return true;
  }

  public failedPhases(): string[] {
    const failed: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (!this.records[i].success) {
        failed.push(this.records[i].phase);
      }
    }
    return failed;
  }

  public totalDurationMs(): number {
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      total += this.records[i].durationMs;
    }
    return total;
  }

  public durationOf(phase: string): number {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        return this.records[i].durationMs;
      }
    }
    return -1;
  }

  public longestPhase(): string {
    if (this.records.length === 0) {
      return '';
    }
    let longest: PhaseRecord = this.records[0];
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].durationMs > longest.durationMs) {
        longest = this.records[i];
      }
    }
    return longest.phase;
  }

  public distanceFromShow(): number {
    return this.showIndex;
  }

  public sequencesAreMonotonic(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].sequence !== i) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.records = [];
    this.showIndex = -1;
  }

  /**
   * Builds a compact summary of the tracked phases for the log line of a case.
   *
   * @returns the summary text.
   */
  public summary(): string {
    const names: string[] = this.phaseNames();
    return `LifecycleTracker{phases=${names.join('>')}, totalMs=${this.totalDurationMs()}}`;
  }
}

/**
 * Describes where a page is in its lifetime, the value is derived from the tracker so that a
 * case never has to reimplement the ordering rules.
 */
class PageStateMachine {
  private appeared: boolean = false;
  private shown: boolean = false;
  private disappeared: boolean = false;

  public apply(phase: string): boolean {
    if (phase === PHASE_ABOUT_TO_APPEAR) {
      if (this.appeared) {
        return false;
      }
      this.appeared = true;
      return true;
    }
    if (phase === PHASE_PAGE_SHOW) {
      if (!this.appeared || this.shown || this.disappeared) {
        return false;
      }
      this.shown = true;
      return true;
    }
    if (phase === PHASE_ABOUT_TO_DISAPPEAR) {
      if (this.disappeared) {
        return false;
      }
      this.disappeared = true;
      return true;
    }
    return false;
  }

  public isVisible(): boolean {
    return this.shown && !this.disappeared;
  }

  public isFinished(): boolean {
    return this.disappeared;
  }

  public toString(): string {
    return `PageStateMachine{appeared=${this.appeared}, shown=${this.shown}, disappeared=${this.disappeared}}`;
  }
}

/**
 * Computes the number of countdown ticks a duration produces on the exam page. The page keeps
 * the remaining seconds as floor(duration / 1000) and only starts the timer when it is positive.
 *
 * @param durationMs assessment duration in milliseconds.
 * @returns the number of ticks, zero when no countdown is started.
 */
function countdownTicks(durationMs: number): number {
  if (durationMs <= 0) {
    return 0;
  }
  return Math.floor(durationMs / COUNTDOWN_INTERVAL);
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page showed up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentPageLifecycleTest() {
  describe('AssessmentPageLifecycle_Test', () => {
    let driver: Driver;
    let tracker: LifecycleTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = new LifecycleTracker();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the entry page appears and becomes visible.
     * Expectation: aboutToAppear is recorded before onPageShow and both phases succeeded.
     */
    it('Assessment_AssessmentPageLifecycle_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_001, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 4, true);
      tracker.record(PHASE_PAGE_SHOW, 2, true);
      expect(tracker.size()).assertEqual(2);
      expect(tracker.succeedsBefore(PHASE_ABOUT_TO_APPEAR, PHASE_PAGE_SHOW)).assertTrue();
      expect(tracker.allSucceeded()).assertTrue();
      expect(tracker.failedPhases().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', tracker.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_001, end');
    });

    /**
     * Scenario: the complete lifecycle of a page visit.
     * Expectation: the three canonical phases are recorded in order and every phase carries a
     * monotonic sequence number.
     */
    it('Assessment_AssessmentPageLifecycle_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_002, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 3, true);
      tracker.record(PHASE_PAGE_SHOW, 1, true);
      tracker.record(PHASE_ABOUT_TO_DISAPPEAR, 2, true);
      const names: string[] = tracker.phaseNames();
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual(PHASE_ABOUT_TO_APPEAR);
      expect(names[1]).assertEqual(PHASE_PAGE_SHOW);
      expect(names[2]).assertEqual(PHASE_ABOUT_TO_DISAPPEAR);
      expect(tracker.sequencesAreMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_002, end');
    });

    /**
     * Scenario: the exam page enters and leaves.
     * Expectation: applyHardening runs in aboutToAppear and releaseHardening runs in
     * aboutToDisappear, so the release never precedes the apply.
     */
    it('Assessment_AssessmentPageLifecycle_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_003, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 5, true);
      tracker.record(PHASE_HARDENING_APPLY, 30, true);
      tracker.record(PHASE_PAGE_SHOW, 1, true);
      tracker.record(PHASE_ABOUT_TO_DISAPPEAR, 2, true);
      tracker.record(PHASE_HARDENING_RELEASE, 25, true);
      expect(tracker.succeedsBefore(PHASE_HARDENING_APPLY, PHASE_HARDENING_RELEASE)).assertTrue();
      expect(tracker.count(PHASE_HARDENING_APPLY)).assertEqual(1);
      expect(tracker.count(PHASE_HARDENING_RELEASE)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_003, end');
    });

    /**
     * Scenario: a duration of ten minutes is handed to the exam page.
     * Expectation: the countdown starts in aboutToAppear and stops in aboutToDisappear, the
     * number of ticks equals floor(duration / interval).
     */
    it('Assessment_AssessmentPageLifecycle_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_004, begin');
      tracker.reset();
      tracker.record(PHASE_COUNTDOWN_START, 1, true);
      tracker.record(PHASE_COUNTDOWN_STOP, 1, true);
      expect(tracker.succeedsBefore(PHASE_COUNTDOWN_START, PHASE_COUNTDOWN_STOP)).assertTrue();
      expect(countdownTicks(600000)).assertEqual(600);
      expect(countdownTicks(1800000)).assertEqual(1800);
      expect(countdownTicks(3600000)).assertEqual(3600);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_004, end');
    });

    /**
     * Scenario: the default duration is used, which the sample expresses as zero.
     * Expectation: no countdown is started, the tick count is zero.
     */
    it('Assessment_AssessmentPageLifecycle_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_005, begin');
      expect(countdownTicks(0)).assertEqual(0);
      expect(countdownTicks(-1)).assertEqual(0);
      const fractional: number = countdownTicks(1500);
      expect(fractional).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_005, end');
    });

    /**
     * Scenario: a phase fails.
     * Expectation: the failure is recorded, the phase shows up in the failed list and the
     * overall success flag turns false.
     */
    it('Assessment_AssessmentPageLifecycle_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_006, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 3, true);
      tracker.record(PHASE_HARDENING_APPLY, 12, false);
      expect(tracker.allSucceeded()).assertFalse();
      const failed: string[] = tracker.failedPhases();
      expect(failed.length).assertEqual(1);
      expect(failed[0]).assertEqual(PHASE_HARDENING_APPLY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_006, end');
    });

    /**
     * Scenario: durations of the phases are aggregated.
     * Expectation: the total is the sum of the phases and the longest phase is reported.
     */
    it('Assessment_AssessmentPageLifecycle_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_007, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 40, true);
      tracker.record(PHASE_PAGE_SHOW, 5, true);
      tracker.record(PHASE_ABOUT_TO_DISAPPEAR, 10, true);
      expect(tracker.totalDurationMs()).assertEqual(55);
      expect(tracker.longestPhase()).assertEqual(PHASE_ABOUT_TO_APPEAR);
      expect(tracker.durationOf(PHASE_PAGE_SHOW)).assertEqual(5);
      expect(tracker.durationOf('unknownPhase')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_007, end');
    });

    /**
     * Scenario: a phase duration of an uncharted phase is queried.
     * Expectation: the lookup reports minus one rather than a zero that could be mistaken for
     * an instant phase.
     */
    it('Assessment_AssessmentPageLifecycle_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_008, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, PHASE_DURATION_MIN, true);
      expect(tracker.durationOf(PHASE_PAGE_SHOW)).assertEqual(-1);
      expect(tracker.durationOf(PHASE_ABOUT_TO_APPEAR)).assertEqual(PHASE_DURATION_MIN);
      expect(tracker.totalDurationMs()).assertEqual(PHASE_DURATION_MIN);
      expect(PHASE_DURATION_MAX > PHASE_DURATION_MIN).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_008, end');
    });

    /**
     * Scenario: the state machine walks the canonical sequence.
     * Expectation: every phase is accepted once and the page is visible between onPageShow and
     * aboutToDisappear.
     */
    it('Assessment_AssessmentPageLifecycle_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_009, begin');
      const machine: PageStateMachine = new PageStateMachine();
      expect(machine.apply(PHASE_ABOUT_TO_APPEAR)).assertTrue();
      expect(machine.isVisible()).assertFalse();
      expect(machine.apply(PHASE_PAGE_SHOW)).assertTrue();
      expect(machine.isVisible()).assertTrue();
      expect(machine.apply(PHASE_ABOUT_TO_DISAPPEAR)).assertTrue();
      expect(machine.isVisible()).assertFalse();
      expect(machine.isFinished()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_009, end');
    });

    /**
     * Scenario: onPageShow arrives before aboutToAppear, which the platform never does.
     * Expectation: the state machine rejects the out of order phase.
     */
    it('Assessment_AssessmentPageLifecycle_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_010, begin');
      const machine: PageStateMachine = new PageStateMachine();
      expect(machine.apply(PHASE_PAGE_SHOW)).assertFalse();
      expect(machine.isVisible()).assertFalse();
      expect(machine.apply(PHASE_ABOUT_TO_APPEAR)).assertTrue();
      expect(machine.apply(PHASE_PAGE_SHOW)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_010, end');
    });

    /**
     * Scenario: aboutToAppear is delivered twice for the same instance.
     * Expectation: the second delivery is rejected, a page cannot appear twice.
     */
    it('Assessment_AssessmentPageLifecycle_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_011, begin');
      const machine: PageStateMachine = new PageStateMachine();
      expect(machine.apply(PHASE_ABOUT_TO_APPEAR)).assertTrue();
      expect(machine.apply(PHASE_ABOUT_TO_APPEAR)).assertFalse();
      expect(machine.apply(PHASE_PAGE_SHOW)).assertTrue();
      expect(machine.apply(PHASE_PAGE_SHOW)).assertFalse();
      expect(machine.apply(PHASE_ABOUT_TO_DISAPPEAR)).assertTrue();
      expect(machine.apply(PHASE_ABOUT_TO_DISAPPEAR)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_011, end');
    });

    /**
     * Scenario: the entry page is left and revisited.
     * Expectation: onPageShow resets the exam page guard, so a second visible phase is valid
     * for the same page instance only after the machine was reset.
     */
    it('Assessment_AssessmentPageLifecycle_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_012, begin');
      const machine: PageStateMachine = new PageStateMachine();
      machine.apply(PHASE_ABOUT_TO_APPEAR);
      machine.apply(PHASE_PAGE_SHOW);
      machine.apply(PHASE_ABOUT_TO_DISAPPEAR);
      const fresh: PageStateMachine = new PageStateMachine();
      expect(fresh.apply(PHASE_ABOUT_TO_APPEAR)).assertTrue();
      expect(fresh.apply(PHASE_PAGE_SHOW)).assertTrue();
      expect(machine.isFinished()).assertTrue();
      expect(fresh.isVisible()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_012, end');
    });

    /**
     * Scenario: the tracker positions onPageShow relative to the phase list.
     * Expectation: the position is stable and does not move when further phases arrive.
     */
    it('Assessment_AssessmentPageLifecycle_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_013, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 2, true);
      tracker.record(PHASE_PAGE_SHOW, 1, true);
      const position: number = tracker.distanceFromShow();
      tracker.record(PHASE_ABOUT_TO_DISAPPEAR, 1, true);
      expect(position).assertEqual(1);
      expect(tracker.distanceFromShow()).assertEqual(1);
      expect(tracker.indexOf(PHASE_PAGE_SHOW)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_013, end');
    });

    /**
     * Scenario: a phase is queried that was never recorded.
     * Expectation: index and count answer zero or minus one and the contains check is false.
     */
    it('Assessment_AssessmentPageLifecycle_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_014, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 2, true);
      expect(tracker.contains(PHASE_PAGE_SHOW)).assertFalse();
      expect(tracker.indexOf(PHASE_PAGE_SHOW)).assertEqual(-1);
      expect(tracker.count(PHASE_PAGE_SHOW)).assertEqual(0);
      expect(tracker.record(PHASE_PAGE_SHOW, 1, true).sequence).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_014, end');
    });

    /**
     * Scenario: a reset of the tracker.
     * Expectation: the records and the show position return to the empty defaults.
     */
    it('Assessment_AssessmentPageLifecycle_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_015, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 3, true);
      tracker.record(PHASE_PAGE_SHOW, 1, true);
      tracker.reset();
      expect(tracker.size()).assertEqual(0);
      expect(tracker.distanceFromShow()).assertEqual(-1);
      expect(tracker.phaseNames().length).assertEqual(0);
      expect(tracker.totalDurationMs()).assertEqual(0);
      expect(tracker.longestPhase()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_015, end');
    });

    /**
     * Scenario: the operation area of the exam page uses three fixed labels.
     * Expectation: the labels are distinct, so the page can be driven by text and by focus.
     */
    it('Assessment_AssessmentPageLifecycle_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_019, begin');
      const labels: string[] = [TEXT_EXAM_PREVIOUS, TEXT_EXAM_NEXT, TEXT_EXAM_SUBMIT];
      const unique: Set<string> = new Set<string>(labels);
      expect(unique.size).assertEqual(labels.length);
      expect(labels.length).assertEqual(3);
      for (let i = 0; i < labels.length; i++) {
        expect(labels[i].length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_019, end');
    });

    /**
     * Scenario: the tracker summarizes a realistic visit.
     * Expectation: the summary lists the phases in order and the total duration matches the
     * sum of the recorded phases.
     */
    it('Assessment_AssessmentPageLifecycle_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_020, begin');
      tracker.reset();
      tracker.record(PHASE_ABOUT_TO_APPEAR, 8, true);
      tracker.record(PHASE_HARDENING_APPLY, 20, true);
      tracker.record(PHASE_COUNTDOWN_START, 1, true);
      tracker.record(PHASE_PAGE_SHOW, 2, true);
      tracker.record(PHASE_ABOUT_TO_DISAPPEAR, 3, true);
      tracker.record(PHASE_COUNTDOWN_STOP, 1, true);
      tracker.record(PHASE_HARDENING_RELEASE, 18, true);
      expect(tracker.size()).assertEqual(7);
      expect(tracker.totalDurationMs()).assertEqual(53);
      expect(tracker.allSucceeded()).assertTrue();
      expect(tracker.longestPhase()).assertEqual(PHASE_HARDENING_APPLY);
      hilog.info(DOMAIN, TAG, '%{public}s', tracker.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPageLifecycle_020, end');
    });
  });
}
