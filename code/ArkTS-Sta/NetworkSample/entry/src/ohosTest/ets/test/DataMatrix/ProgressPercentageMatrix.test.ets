'use static';
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

/**
 * ProgressPercentageMatrix suite.
 *
 * Walks the progress values the page must render: 0, 1, 25, 50, 75, 99 and
 * 100. For each value the suite checks the label literal, the ratio, the
 * monotone update rule, the completion override and the aggregate metrics.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-59    progressValueA / progressValueB / progressValueC
 *   68-76    updateProgress writes 100 for one task
 *   207-247  three labels of the form `任务X当前进度 ${value}%`
 *   249-259  button background and enabled(isTaskFinished)
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  NetworkMetrics,
  progressLabel,
  expectedProgressAfter,
  expectedCompletedProgress,
  startButtonEnabled,
  startButtonBackground,
  clampInt
} from '../Shared/SharedDriver';

const MILESTONES: number[] = [0, 1, 25, 50, 75, 99, 100];

export default function progressPercentageMatrixTest(): void {
  describe('ProgressPercentageMatrix', () => {
    beforeAll(() => {
      logSuite('ProgressPercentageMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ProgressPercentageMatrix', 'end');
    });

    /**
     * @tc.name   zeroProgressLabelExact
     * @tc.desc   The first milestone renders a zero label with the exact production wording for task A.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('zeroProgressLabelExact', 0, () => {
      logStep('ProgressPercentageMatrix', 'render zero milestone');
      expect(progressLabel(TASK_A, 0)).assertEqual('任务A当前进度 0%');
      expect(progressLabel(TASK_A, PROGRESS_INITIAL)).assertEqual('任务A当前进度 0%');
      expect(progressLabel(TASK_B, 0)).assertEqual('任务B当前进度 0%');
      expect(progressLabel(TASK_C, 0)).assertEqual('任务C当前进度 0%');
      expect(progressLabel(TASK_A, 0).endsWith('0%')).assertTrue();
      expect(progressLabel(TASK_A, 0).length).assertEqual(10);
    });

    /**
     * @tc.name   onePercentLabelExact
     * @tc.desc   The smallest non-zero milestone keeps a single digit and one percent sign.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('onePercentLabelExact', 0, () => {
      const label: string = progressLabel(TASK_B, 1);
      expect(label).assertEqual('任务B当前进度 1%');
      expect(label.indexOf('1')).assertLarger(0);
      expect(label.split('%').length).assertEqual(2);
      expect(label.endsWith('1%')).assertTrue();
      expect(label.length).assertEqual(10);
      expect(progressLabel(TASK_B, 1) === progressLabel(TASK_B, 0)).assertFalse();
    });

    /**
     * @tc.name   quarterProgressLabelExact
     * @tc.desc   Twenty-five percent renders the two digit milestone with the same prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('quarterProgressLabelExact', 0, () => {
      const label: string = progressLabel(TASK_C, 25);
      expect(label).assertEqual('任务C当前进度 25%');
      expect(label.startsWith('任务C当前进度 ')).assertTrue();
      expect(label.endsWith('25%')).assertTrue();
      expect(label.length).assertEqual(11);
      expect(progressLabel(TASK_C, 25).indexOf('%')).assertEqual(10);
      expect(progressLabel(TASK_C, 25) === progressLabel(TASK_C, 26)).assertFalse();
    });

    /**
     * @tc.name   halfProgressLabelExact
     * @tc.desc   Fifty percent is a stable mid-run value and the label carries exactly two digits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('halfProgressLabelExact', 0, () => {
      const label: string = progressLabel(TASK_A, 50);
      expect(label).assertEqual('任务A当前进度 50%');
      expect(label.endsWith('50%')).assertTrue();
      expect(label.indexOf('5') < label.indexOf('%')).assertTrue();
      expect(label.length).assertEqual(11);
      expect(progressLabel(TASK_A, 50) === progressLabel(TASK_A, 49)).assertFalse();
      expect(progressLabel(TASK_A, 50).indexOf('0%')).assertLarger(0);
    });

    /**
     * @tc.name   threeQuarterProgressLabelExact
     * @tc.desc   Seventy-five percent sits between the half and the near-complete milestones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('threeQuarterProgressLabelExact', 0, () => {
      const label: string = progressLabel(TASK_B, 75);
      expect(label).assertEqual('任务B当前进度 75%');
      expect(label.endsWith('75%')).assertTrue();
      expect(label.length).assertEqual(11);
      expect(progressLabel(TASK_B, 75) === progressLabel(TASK_B, 50)).assertFalse();
      expect(progressLabel(TASK_B, 75).indexOf('25')).assertEqual(-1);
      expect(progressLabel(TASK_B, 75).startsWith('任务B')).assertTrue();
    });

    /**
     * @tc.name   ninetyNineProgressLabelExact
     * @tc.desc   The near-complete milestone is distinct from a completed row and keeps two digits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('ninetyNineProgressLabelExact', 0, () => {
      const label: string = progressLabel(TASK_C, 99);
      expect(label).assertEqual('任务C当前进度 99%');
      expect(label.endsWith('99%')).assertTrue();
      expect(label === progressLabel(TASK_C, PROGRESS_TOTAL)).assertFalse();
      expect(label.length).assertEqual(11);
      expect(label.indexOf('100')).assertEqual(-1);
      expect(label.split('9').length - 1).assertEqual(2);
    });

    /**
     * @tc.name   fullProgressLabelExact
     * @tc.desc   The final milestone renders 100 percent with three digits as the completion path does.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fullProgressLabelExact', 0, () => {
      const label: string = progressLabel(TASK_A, PROGRESS_TOTAL);
      expect(label).assertEqual('任务A当前进度 100%');
      expect(label.endsWith('100%')).assertTrue();
      expect(label.length).assertEqual(12);
      expect(label.indexOf('100')).assertLarger(0);
      expect(progressLabel(TASK_C, PROGRESS_TOTAL)).assertEqual('任务C当前进度 100%');
      expect(progressLabel(TASK_A, PROGRESS_TOTAL) === label).assertTrue();
    });

    /**
     * @tc.name   progressMatrixLabelsForAllTasks
     * @tc.desc   The full seven-value matrix rendered for all three tasks yields twenty-one unique labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressMatrixLabelsForAllTasks', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      const labels: string[] = [];
      for (let task = 0; task < numbers.length; task++) {
        for (let step = 0; step < MILESTONES.length; step++) {
          labels.push(progressLabel(numbers[task], MILESTONES[step]));
        }
      }
      expect(labels.length).assertEqual(21);
      expect(labels[0]).assertEqual('任务A当前进度 0%');
      expect(labels[6]).assertEqual('任务A当前进度 100%');
      expect(labels[20]).assertEqual('任务C当前进度 100%');
      expect(labels[11]).assertEqual('任务B当前进度 75%');
      for (let index = 1; index < labels.length; index++) {
        expect(labels[index] === labels[index - 1]).assertFalse();
      }
    });

    /**
     * @tc.name   ratioAtEachMilestone
     * @tc.desc   The ratio helper maps every milestone to its exact fraction of the total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('ratioAtEachMilestone', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      const ratios: number[] = [];
      for (let step = 0; step < MILESTONES.length; step++) {
        a.progress = MILESTONES[step];
        ratios.push(a.progressRatio());
      }
      expect(ratios.length).assertEqual(7);
      expect(ratios[0]).assertEqual(0);
      expect(ratios[1]).assertEqual(0.01);
      expect(ratios[2]).assertEqual(0.25);
      expect(ratios[3]).assertEqual(0.5);
      expect(ratios[4]).assertEqual(0.75);
      expect(ratios[6]).assertEqual(1);
    });

    /**
     * @tc.name   progressStaysMonotoneAcrossMatrix
     * @tc.desc   Feeding the milestones in ascending order raises the row at every step and never lowers it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressStaysMonotoneAcrossMatrix', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      let previous: number = PROGRESS_INITIAL;
      for (let step = 0; step < MILESTONES.length; step++) {
        const value: number = b.reportProgress(MILESTONES[step]);
        expect(value).assertEqual(MILESTONES[step]);
        expect(value >= previous).assertTrue();
        previous = value;
      }
      expect(b.progress).assertEqual(PROGRESS_TOTAL);
      expect(previous).assertEqual(PROGRESS_TOTAL);
      expect(b.status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   staleMilestoneDoesNotRollBack
     * @tc.desc   An out-of-order milestone from an older callback is ignored once a higher value is displayed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('staleMilestoneDoesNotRollBack', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const c: DownloadTask = graph.taskAt(2);
      expect(c.reportProgress(75)).assertEqual(75);
      expect(c.reportProgress(25)).assertEqual(75);
      expect(c.reportProgress(50)).assertEqual(75);
      expect(c.reportProgress(1)).assertEqual(75);
      expect(c.progress).assertEqual(75);
      expect(c.label()).assertEqual('任务C当前进度 75%');
    });

    /**
     * @tc.name   completionOverridesPartialMilestones
     * @tc.desc   A completion after any partial milestone writes exactly 100 regardless of the last value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOverridesPartialMilestones', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(99);
      expect(a.progress).assertEqual(99);
      expect(a.progress === PROGRESS_TOTAL).assertFalse();
      expect(graph.completeTask(TASK_A, 1)).assertTrue();
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.label()).assertEqual('任务A当前进度 100%');
      expect(a.progressRatio()).assertEqual(1);
      expect(a.status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   completionOracleAlwaysReturnsHundred
     * @tc.desc   The independent completion oracle is constant 100 and never depends on the previous value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOracleAlwaysReturnsHundred', 0, () => {
      expect(expectedCompletedProgress()).assertEqual(PROGRESS_TOTAL);
      expect(expectedCompletedProgress()).assertEqual(100);
      expect(expectedCompletedProgress()).assertEqual(expectedCompletedProgress());
      for (let step = 0; step < MILESTONES.length; step++) {
        expect(expectedProgressAfter(MILESTONES[step], 100)).assertEqual(PROGRESS_TOTAL);
      }
      expect(expectedCompletedProgress() > 99).assertTrue();
      expect(expectedCompletedProgress() === 0).assertFalse();
    });

    /**
     * @tc.name   expectedProgressAfterMatrix
     * @tc.desc   The pure oracle takes the maximum of current and clamped incoming across the whole matrix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedProgressAfterMatrix', 0, () => {
      expect(expectedProgressAfter(0, 0)).assertEqual(0);
      expect(expectedProgressAfter(0, 1)).assertEqual(1);
      expect(expectedProgressAfter(1, 0)).assertEqual(1);
      expect(expectedProgressAfter(25, 50)).assertEqual(50);
      expect(expectedProgressAfter(50, 50)).assertEqual(50);
      expect(expectedProgressAfter(75, 99)).assertEqual(99);
      expect(expectedProgressAfter(99, 100)).assertEqual(100);
      expect(expectedProgressAfter(100, 100)).assertEqual(100);
    });

    /**
     * @tc.name   clampBoundariesMatchMatrix
     * @tc.desc   The clamp helper leaves in-range milestones untouched and pins values outside 0..100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clampBoundariesMatchMatrix', 0, () => {
      expect(clampInt(0, 0, 100)).assertEqual(0);
      expect(clampInt(1, 0, 100)).assertEqual(1);
      expect(clampInt(50, 0, 100)).assertEqual(50);
      expect(clampInt(100, 0, 100)).assertEqual(100);
      expect(clampInt(-1, 0, 100)).assertEqual(0);
      expect(clampInt(101, 0, 100)).assertEqual(100);
      expect(clampInt(9999, 0, 100)).assertEqual(100);
      expect(clampInt(-9999, 0, 100)).assertEqual(0);
    });

    /**
     * @tc.name   labelUsesTaskNumberOfRow
     * @tc.desc   The label prefix follows the row identity for all three tasks at the same progress value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelUsesTaskNumberOfRow', 0, () => {
      expect(progressLabel(TASK_A, 50)).assertEqual('任务A当前进度 50%');
      expect(progressLabel(TASK_B, 50)).assertEqual('任务B当前进度 50%');
      expect(progressLabel(TASK_C, 50)).assertEqual('任务C当前进度 50%');
      expect(progressLabel(TASK_A, 50) === progressLabel(TASK_B, 50)).assertFalse();
      expect(progressLabel(TASK_B, 50) === progressLabel(TASK_C, 50)).assertFalse();
      expect(progressLabel(TASK_A, 50).indexOf(TASK_A)).assertEqual(2);
    });

    /**
     * @tc.name   everyLabelContainsPercentSuffix
     * @tc.desc   Every label of the matrix ends with a percent sign and contains exactly one of them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyLabelContainsPercentSuffix', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      for (let task = 0; task < numbers.length; task++) {
        for (let step = 0; step < MILESTONES.length; step++) {
          const label: string = progressLabel(numbers[task], MILESTONES[step]);
          expect(label.endsWith('%')).assertTrue();
          expect(label.split('%').length).assertEqual(2);
          expect(label.indexOf('当前进度')).assertLarger(0);
          expect(label.indexOf('%') === label.length - 1).assertTrue();
        }
      }
      expect(numbers.length * MILESTONES.length).assertEqual(21);
    });

    /**
     * @tc.name   everyLabelIsNonEmpty
     * @tc.desc   No matrix combination produces an empty or whitespace-only label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyLabelIsNonEmpty', 0, () => {
      for (let step = 0; step < MILESTONES.length; step++) {
        const label: string = progressLabel(TASK_C, MILESTONES[step]);
        expect(label.length >= 10).assertTrue();
        expect(label.length === 0).assertFalse();
        expect(label.trim().length).assertEqual(label.length);
        expect(label.indexOf(' ')).assertLarger(0);
      }
      expect(progressLabel(TASK_C, 0).length).assertEqual(10);
      expect(progressLabel(TASK_C, 100).length).assertEqual(12);
    });

    /**
     * @tc.name   buttonEnabledSemantics
     * @tc.desc   The button is enabled exactly when the finished flag is true, matching enabled(isTaskFinished).
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonEnabledSemantics', 0, () => {
      expect(startButtonEnabled(true)).assertTrue();
      expect(startButtonEnabled(false)).assertFalse();
      expect(startButtonEnabled(true) === startButtonEnabled(false)).assertFalse();
      const graph: TaskGraph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
    });

    /**
     * @tc.name   buttonBackgroundSwitchesBetweenLiterals
     * @tc.desc   The button uses the active blue while enabled and the disabled grey while a run is in flight.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonBackgroundSwitchesBetweenLiterals', 0, () => {
      expect(startButtonBackground(true)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(startButtonBackground(false)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(startButtonBackground(true)).assertEqual('#409EFF');
      expect(startButtonBackground(false)).assertEqual('#C0C4CC');
      expect(startButtonBackground(true) === startButtonBackground(false)).assertFalse();
      expect(startButtonBackground(true).startsWith('#')).assertTrue();
    });

    /**
     * @tc.name   ratioBoundariesZeroAndFull
     * @tc.desc   The ratio is exactly 0 at the start and exactly 1 after completion, never above one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('ratioBoundariesZeroAndFull', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.progressRatio()).assertEqual(0);
      graph.startAll();
      expect(a.progressRatio()).assertEqual(0);
      graph.completeTask(TASK_A, 1);
      expect(a.progressRatio()).assertEqual(1);
      expect(a.progressRatio() <= 1).assertTrue();
      expect(a.progressRatio() * PROGRESS_TOTAL).assertEqual(100);
      expect(a.progressRatio() > 0).assertTrue();
    });

    /**
     * @tc.name   matrixRowTotalsAggregate
     * @tc.desc   Three rows at 25, 50 and 75 aggregate to 150 and average 50 before any completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixRowTotalsAggregate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(25);
      graph.taskAt(1).reportProgress(50);
      graph.taskAt(2).reportProgress(75);
      expect(graph.totalProgress()).assertEqual(150);
      expect(graph.averageProgress()).assertEqual(50);
      expect(NetworkMetrics.from(graph).totalProgress).assertEqual(150);
      expect(NetworkMetrics.from(graph).averageProgress()).assertEqual(50);
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(0);
    });

    /**
     * @tc.name   matrixAfterResetReturnsToZero
     * @tc.desc   A reset lowers every milestone row back to zero and restores the zero label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixAfterResetReturnsToZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(25);
      graph.taskAt(1).reportProgress(75);
      graph.taskAt(2).reportProgress(99);
      expect(graph.totalProgress()).assertEqual(199);
      graph.reset();
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0);
      expect(graph.taskAt(1).label()).assertEqual('任务B当前进度 0%');
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 0%');
    });

    /**
     * @tc.name   matrixNeverExceedsTotal
     * @tc.desc   Every oversized payload across all rows is pinned at 100, so the total never exceeds 300.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixNeverExceedsTotal', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(250);
      graph.taskAt(1).reportProgress(500);
      graph.taskAt(2).reportProgress(1000);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.totalProgress() <= 300).assertTrue();
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   matrixNeverDropsBelowZero
     * @tc.desc   Negative payloads across all rows are pinned at zero and leave labels at the zero milestone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixNeverDropsBelowZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.taskAt(0).reportProgress(-10)).assertEqual(0);
      expect(graph.taskAt(1).reportProgress(-1)).assertEqual(0);
      expect(graph.taskAt(2).reportProgress(-1000)).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.totalProgress() >= 0).assertTrue();
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 0%');
    });

    /**
     * @tc.name   fullPercentageWithoutCompletionStaysRunning
     * @tc.desc   A progress payload of 100 renders the full label but does not flip the status to completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ProgressPercentageMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fullPercentageWithoutCompletionStaysRunning', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.reportProgress(100)).assertEqual(PROGRESS_TOTAL);
      expect(a.label()).assertEqual('任务A当前进度 100%');
      expect(a.status).assertEqual(STATUS_RUNNING);
      expect(a.progressRatio()).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
    });
  });
}
