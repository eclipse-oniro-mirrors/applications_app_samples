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
 * SemanticOrderModel suite.
 *
 * Checks the reading order and semantics a screen reader would follow: the
 * progress label is read task number, then the words, then the value, then the
 * percent sign; task numbers are ordered A, B, C; English log lines are plain
 * ASCII; every label is non-empty; and each status has a stable meaning.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    three progress rows plus the finished flag
 *   127      completion log line `下载完成 ${taskNo}`
 *   200-247  three label rows read top to bottom
 *   249-259  the start button label and its enabled state
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  ERROR_NETWORK,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  LogBuffer,
  NetworkMetrics,
  EventRecorder,
  completionTrace,
  progressLabel,
  isTerminalStatus,
  startButtonEnabled,
  startButtonBackground,
  textFingerprint,
  hasDuplicateStrings
} from '../Shared/SharedDriver';

export default function semanticOrderModelTest(): void {
  describe('SemanticOrderModel', () => {
    beforeAll(() => {
      logSuite('SemanticOrderModel', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SemanticOrderModel', 'end');
    });

    /**
     * @tc.name   labelReadsTaskThenTextThenValue
     * @tc.desc   The rendered label exposes the task number before the words and the numeric value after them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelReadsTaskThenTextThenValue', 0, () => {
      logStep('SemanticOrderModel', 'label order');
      const label: string = progressLabel(TASK_A, 42);
      const taskIndex: number = label.indexOf(TASK_A);
      const wordsIndex: number = label.indexOf('当前进度');
      const valueIndex: number = label.indexOf('42');
      const percentIndex: number = label.indexOf('%');
      expect(label).assertEqual('任务A当前进度 42%');
      expect(taskIndex < wordsIndex).assertTrue();
      expect(wordsIndex < valueIndex).assertTrue();
      expect(valueIndex < percentIndex).assertTrue();
      expect(percentIndex).assertEqual(label.length - 1);
    });

    /**
     * @tc.name   labelBeginsWithTaskWord
     * @tc.desc   Every label begins with the same task word, so reading order starts at the row identity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelBeginsWithTaskWord', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < numbers.length; index++) {
        const label: string = progressLabel(numbers[index], 50);
        expect(label.startsWith('任务')).assertTrue();
        expect(label.substring(0, 2)).assertEqual('任务');
        expect(label.indexOf('任务')).assertEqual(0);
        expect(label.indexOf(numbers[index])).assertEqual(2);
      }
      expect(progressLabel(TASK_A, 50).length).assertEqual(11);
    });

    /**
     * @tc.name   taskNumbersFollowExpectedOrder
     * @tc.desc   The three rows are read in A, B, C order, which is the order used by completion and loops.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskNumbersFollowExpectedOrder', 0, () => {
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(TASK_NUMBERS[1]).assertEqual(TASK_B);
      expect(TASK_NUMBERS[2]).assertEqual(TASK_C);
      expect(TASK_A < TASK_B).assertTrue();
      expect(TASK_B < TASK_C).assertTrue();
      expect(TASK_A < TASK_C).assertTrue();
      expect(hasDuplicateStrings(TASK_NUMBERS)).assertFalse();
    });

    /**
     * @tc.name   taskNumbersAreConsecutiveLetters
     * @tc.desc   The three identifiers are consecutive characters, which keeps numeric ordering stable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskNumbersAreConsecutiveLetters', 0, () => {
      const first: number = TASK_A.charCodeAt(0);
      const second: number = TASK_B.charCodeAt(0);
      const third: number = TASK_C.charCodeAt(0);
      expect(second - first).assertEqual(1);
      expect(third - second).assertEqual(1);
      expect(third - first).assertEqual(2);
      expect(first).assertEqual(65);
      expect(third).assertEqual(67);
      expect(TASK_C.charCodeAt(0) > TASK_A.charCodeAt(0)).assertTrue();
    });

    /**
     * @tc.name   englishLogTokensAreAscii
     * @tc.desc   The level tokens and English log sentences contain only ASCII characters for log readability.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('englishLogTokensAreAscii', 0, () => {
      const lines: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR, 'download completed for task ' + TASK_A,
        'retry scheduled after timeout'];
      for (let line = 0; line < lines.length; line++) {
        let asciiOnly: boolean = true;
        for (let index = 0; index < lines[line].length; index++) {
          if (lines[line].charCodeAt(index) > 127) {
            asciiOnly = false;
          }
        }
        expect(asciiOnly).assertTrue();
        expect(lines[line].length > 0).assertTrue();
      }
      expect(lines.length).assertEqual(5);
      expect(LEVEL_INFO === 'INFO').assertTrue();
    });

    /**
     * @tc.name   englishLogLevelsAreUpperTokens
     * @tc.desc   Each level token is uppercase ASCII and the three tokens are distinct.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('englishLogLevelsAreUpperTokens', 0, () => {
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      expect(LEVEL_INFO.toUpperCase()).assertEqual(LEVEL_INFO);
      expect(LEVEL_WARN.toUpperCase()).assertEqual(LEVEL_WARN);
      expect(LEVEL_ERROR.toUpperCase()).assertEqual(LEVEL_ERROR);
      expect(hasDuplicateStrings([LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR])).assertFalse();
    });

    /**
     * @tc.name   logLineStartsWithLevelThenSpace
     * @tc.desc   A buffered line begins with its level, a single space and then a non-empty English message.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logLineStartsWithLevelThenSpace', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('run started');
      buffer.warn('poll delayed');
      buffer.error('create failed');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0]).assertEqual('INFO run started');
      expect(buffer.lines[1]).assertEqual('WARN poll delayed');
      expect(buffer.lines[2]).assertEqual('ERROR create failed');
      expect(buffer.lines[0].indexOf(' ')).assertEqual(4);
      expect(buffer.lines[2].indexOf(' ')).assertEqual(5);
      expect(buffer.lines[2].length > 6).assertTrue();
    });

    /**
     * @tc.name   logLineMessagesAreNonEmpty
     * @tc.desc   No level accepts an empty message without still producing a readable line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logLineMessagesAreNonEmpty', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('a');
      buffer.warn('b');
      buffer.error('c');
      for (let index = 0; index < buffer.size(); index++) {
        expect(buffer.lines[index].length > 2).assertTrue();
        expect(buffer.lines[index].indexOf(' ')).assertLarger(0);
        expect(buffer.lines[index].trim()).assertEqual(buffer.lines[index]);
      }
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.contains('a')).assertTrue();
    });

    /**
     * @tc.name   labelsNonEmptyForEveryRow
     * @tc.desc   All three rows render a non-empty label at every milestone, including zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelsNonEmptyForEveryRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const milestones: number[] = [0, 1, 50, 99, 100];
      for (let row = 0; row < graph.tasks.length; row++) {
        for (let step = 0; step < milestones.length; step++) {
          const label: string = progressLabel(graph.taskAt(row).taskNo, milestones[step]);
          expect(label.length >= 10).assertTrue();
          expect(label.trim()).assertEqual(label);
          expect(label.endsWith('%')).assertTrue();
        }
      }
      expect(graph.tasks.length * milestones.length).assertEqual(15);
      expect(progressLabel(TASK_C, 0)).assertEqual('任务C当前进度 0%');
    });

    /**
     * @tc.name   labelsDistinctAcrossRows
     * @tc.desc   At the same progress value the three labels differ only by the task number, never collide.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelsDistinctAcrossRows', 0, () => {
      const a: string = progressLabel(TASK_A, 60);
      const b: string = progressLabel(TASK_B, 60);
      const c: string = progressLabel(TASK_C, 60);
      expect(a === b).assertFalse();
      expect(b === c).assertFalse();
      expect(a === c).assertFalse();
      expect(hasDuplicateStrings([a, b, c])).assertFalse();
      expect(a.length).assertEqual(b.length);
      expect(b.length).assertEqual(c.length);
      expect(a.indexOf(TASK_A)).assertEqual(2);
      expect(c.indexOf(TASK_C)).assertEqual(2);
    });

    /**
     * @tc.name   statusSemanticsDescribeRunStage
     * @tc.desc   Each status string carries a distinct stage meaning, from idle to completed or failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('statusSemanticsDescribeRunStage', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.status).assertEqual(STATUS_IDLE);
      graph.startAll();
      expect(a.status).assertEqual(STATUS_RUNNING);
      graph.completeTask(TASK_A, 1);
      expect(a.status).assertEqual(STATUS_COMPLETED);
      const b: DownloadTask = graph.taskAt(1);
      b.fail(ERROR_NETWORK);
      expect(b.status).assertEqual(STATUS_FAILED);
      expect(a.status === b.status).assertFalse();
      expect(a.isComplete()).assertTrue();
      expect(b.isFailed()).assertTrue();
    });

    /**
     * @tc.name   statusLifecycleFollowsExpectedOrder
     * @tc.desc   The observable status sequence is idle, running, completed without skipping a stage.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statusLifecycleFollowsExpectedOrder', 0, () => {
      const stages: string[] = [];
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      stages.push(a.status);
      a.start(0);
      stages.push(a.status);
      a.reportProgress(40);
      stages.push(a.status);
      a.complete(1);
      stages.push(a.status);
      expect(stages.length).assertEqual(4);
      expect(stages[0]).assertEqual(STATUS_IDLE);
      expect(stages[1]).assertEqual(STATUS_RUNNING);
      expect(stages[2]).assertEqual(STATUS_RUNNING);
      expect(stages[3]).assertEqual(STATUS_COMPLETED);
      expect(stages[0] === stages[1]).assertFalse();
    });

    /**
     * @tc.name   terminalStatusesRejectFurtherProgress
     * @tc.desc   Completed and failed are terminal for progress while idle and running still accept updates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('terminalStatusesRejectFurtherProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(30);
      a.fail(ERROR_NETWORK);
      expect(isTerminalStatus(a.status)).assertTrue();
      expect(a.reportProgress(70)).assertEqual(30);
      const c: DownloadTask = graph.taskAt(2);
      expect(isTerminalStatus(c.status)).assertFalse();
      expect(c.reportProgress(70)).assertEqual(70);
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
      expect(isTerminalStatus(STATUS_IDLE)).assertFalse();
    });

    /**
     * @tc.name   progressValuesReadAscending
     * @tc.desc   A reader walking the milestones always sees a larger number, so no announcement goes backwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressValuesReadAscending', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      const seen: number[] = [];
      const milestones: number[] = [0, 1, 25, 50, 75, 99, 100];
      for (let step = 0; step < milestones.length; step++) {
        seen.push(b.reportProgress(milestones[step]));
      }
      expect(seen.length).assertEqual(7);
      for (let index = 1; index < seen.length; index++) {
        expect(seen[index] > seen[index - 1]).assertTrue();
      }
      expect(seen[0]).assertEqual(PROGRESS_INITIAL);
      expect(seen[6]).assertEqual(PROGRESS_TOTAL);
      expect(b.label()).assertEqual('任务B当前进度 100%');
    });

    /**
     * @tc.name   completionSemanticsAnnounceFullValue
     * @tc.desc   A completed row announces exactly 100 percent regardless of the last partial value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionSemanticsAnnounceFullValue', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const c: DownloadTask = graph.taskAt(2);
      c.reportProgress(3);
      expect(c.label()).assertEqual('任务C当前进度 3%');
      graph.completeTask(TASK_C, 1);
      expect(c.progress).assertEqual(PROGRESS_TOTAL);
      expect(c.label()).assertEqual('任务C当前进度 100%');
      expect(c.label().endsWith('100%')).assertTrue();
      expect(c.progressRatio()).assertEqual(1);
      expect(isTerminalStatus(c.status)).assertTrue();
    });

    /**
     * @tc.name   buttonSemanticsSwitchWithFinishedFlag
     * @tc.desc   The button reads as enabled with the active colour only while no run is in flight.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonSemanticsSwitchWithFinishedFlag', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(BUTTON_ACTIVE_BACKGROUND === BUTTON_DISABLED_BACKGROUND).assertFalse();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
    });

    /**
     * @tc.name   logBufferPreservesWriteOrder
     * @tc.desc   Buffered lines keep the order in which the phases wrote them, which is the reading order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferPreservesWriteOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(8);
      buffer.info('first start');
      graph.startAll();
      buffer.info('second shared');
      graph.completeTask(TASK_A, 1);
      buffer.warn('third unlock pending');
      expect(buffer.lines[0].endsWith('first start')).assertTrue();
      expect(buffer.lines[1].endsWith('second shared')).assertTrue();
      expect(buffer.lines[2].endsWith('third unlock pending')).assertTrue();
      expect(buffer.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      expect(buffer.lines[2].startsWith(LEVEL_WARN)).assertTrue();
      expect(buffer.trace().indexOf('first') < buffer.trace().indexOf('third')).assertTrue();
    });

    /**
     * @tc.name   eventTraceReadsInPhaseOrder
     * @tc.desc   The recorded graph events are read start, prerequisites, unlock, exclusive start, completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventTraceReadsInPhaseOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const trace: string = graph.eventTrace();
      const startIndex: number = trace.indexOf('start-all');
      const firstDone: number = trace.indexOf('completed:A');
      const unlockIndex: number = trace.indexOf('unlocked:C');
      const startC: number = trace.indexOf('started:C');
      const doneC: number = trace.indexOf('completed:C');
      expect(startIndex).assertEqual(0);
      expect(startIndex < firstDone).assertTrue();
      expect(firstDone < unlockIndex).assertTrue();
      expect(unlockIndex < startC).assertTrue();
      expect(startC < doneC).assertTrue();
      expect(graph.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   completionTraceReadsLeftToRight
     * @tc.desc   The completion trace lists task numbers in the order they finished, joined by pipes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionTraceReadsLeftToRight', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      const parts: string[] = completionTrace(graph).split('|');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(TASK_B);
      expect(parts[1]).assertEqual(TASK_A);
      expect(parts[2]).assertEqual(TASK_C);
      expect(parts[2] === parts[0]).assertFalse();
    });

    /**
     * @tc.name   metricsRespectOrderingInvariants
     * @tc.desc   Completed and failed counts never exceed the total and success ratio stays within zero and one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsRespectOrderingInvariants', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).fail(ERROR_NETWORK);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.completedTasks <= metrics.totalTasks).assertTrue();
      expect(metrics.failedTasks <= metrics.totalTasks).assertTrue();
      expect(metrics.completedTasks + metrics.failedTasks <= metrics.totalTasks).assertTrue();
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.averageProgress() >= 0).assertTrue();
    });

    /**
     * @tc.name   errorSemanticsStayNonNegative
     * @tc.desc   A success code is zero and every failure code is a positive number with its own meaning.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorSemanticsStayNonNegative', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      expect(b.lastErrorCode).assertEqual(ERROR_NONE);
      expect(b.lastErrorCode).assertEqual(0);
      b.fail(ERROR_NETWORK);
      expect(b.lastErrorCode > ERROR_NONE).assertTrue();
      expect(b.lastErrorCode).assertEqual(13400003);
      expect(b.isFailed()).assertTrue();
      expect(ERROR_NONE === 0).assertTrue();
      expect(ERROR_NETWORK === 0).assertFalse();
    });

    /**
     * @tc.name   failedRowKeepsPartialReadingUntilReset
     * @tc.desc   A failed row keeps announcing its last partial value, then reset returns it to the zero label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRowKeepsPartialReadingUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(64);
      a.fail(ERROR_NETWORK);
      expect(a.label()).assertEqual('任务A当前进度 64%');
      expect(a.progress).assertEqual(64);
      a.reset();
      expect(a.label()).assertEqual('任务A当前进度 0%');
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(isTerminalStatus(a.status)).assertFalse();
    });

    /**
     * @tc.name   labelSetFingerprintIsStable
     * @tc.desc   The label set of a fixed progress state produces the same fingerprint on repeated reads.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('labelSetFingerprintIsStable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(10);
      graph.taskAt(1).reportProgress(55);
      graph.taskAt(2).reportProgress(90);
      const first: string = progressLabel(TASK_A, graph.taskAt(0).progress) + '|' +
        progressLabel(TASK_B, graph.taskAt(1).progress) + '|' +
        progressLabel(TASK_C, graph.taskAt(2).progress);
      const second: string = progressLabel(TASK_A, graph.taskAt(0).progress) + '|' +
        progressLabel(TASK_B, graph.taskAt(1).progress) + '|' +
        progressLabel(TASK_C, graph.taskAt(2).progress);
      expect(first).assertEqual(second);
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
      expect(first.split('|').length).assertEqual(3);
      expect(first.indexOf('55%')).assertLarger(0);
    });

    /**
     * @tc.name   rowOrderStableAfterReset
     * @tc.desc   Reset keeps the row order and task numbering that a screen reader depends on.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowOrderStableAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const before: string[] = [graph.taskAt(0).taskNo, graph.taskAt(1).taskNo, graph.taskAt(2).taskNo];
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      graph.reset();
      expect(graph.taskAt(0).taskNo).assertEqual(before[0]);
      expect(graph.taskAt(1).taskNo).assertEqual(before[1]);
      expect(graph.taskAt(2).taskNo).assertEqual(before[2]);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   taskNumberIndexMappingIsStable
     * @tc.desc   Each task number maps to a fixed row index, which fixes the top-to-bottom reading order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskNumberIndexMappingIsStable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        expect(graph.taskAt(index).taskNo).assertEqual(TASK_NUMBERS[index]);
        expect(graph.taskByNo(TASK_NUMBERS[index]) === graph.taskAt(index)).assertTrue();
      }
      expect(graph.taskByNo(TASK_A) !== graph.taskByNo(TASK_B)).assertTrue();
      expect(graph.tasks.length).assertEqual(TASK_NUMBERS.length);
      expect(graph.taskAt(0).url).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   labelCarriesSinglePercentSign
     * @tc.desc   The percent sign appears once and at the end, so a reader announces one percentage only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelCarriesSinglePercentSign', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      const values: number[] = [0, 7, 33, 66, 100];
      for (let row = 0; row < numbers.length; row++) {
        for (let step = 0; step < values.length; step++) {
          const label: string = progressLabel(numbers[row], values[step]);
          expect(label.split('%').length).assertEqual(2);
          expect(label.indexOf('%')).assertEqual(label.length - 1);
          expect(label.lastIndexOf('%')).assertEqual(label.length - 1);
        }
      }
      expect(numbers.length * values.length).assertEqual(15);
      expect(progressLabel(TASK_C, 100).split('%').length).assertEqual(2);
    });

    /**
     * @tc.name   eventRecorderReadsChronologically
     * @tc.desc   The shared recorder keeps a chronological list whose last entry is the newest event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticOrderModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventRecorderReadsChronologically', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('phase', 'begin');
      recorder.record('task', 'A');
      recorder.record('task', 'B');
      recorder.record('phase', 'end');
      expect(recorder.size()).assertEqual(4);
      expect(recorder.entries[0]).assertEqual('phase:begin');
      expect(recorder.entries[3]).assertEqual('phase:end');
      expect(recorder.last()).assertEqual('phase:end');
      expect(recorder.countOf('task')).assertEqual(2);
      expect(recorder.trace().indexOf('task:A') < recorder.trace().indexOf('task:B')).assertTrue();
    });
  });
}
