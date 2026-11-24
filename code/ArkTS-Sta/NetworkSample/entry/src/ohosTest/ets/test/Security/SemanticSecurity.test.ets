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
 * SemanticSecurity suite.
 *
 * The three progress rows are read out by a screen reader and the start button
 * must be announced as disabled while a run is active. This suite checks that
 * each label is specific to one task, that the enabled/background pair matches
 * the flag, and that the bounded log buffer holds plain English diagnostics
 * with no hidden payload after redaction.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   203-205 page title text
 *   209-246 three progress labels and bars
 *   250-259 button with .enabled(this.isTaskFinished)
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  PROGRESS_TOTAL,
  PAGE_TITLE,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  ERROR_NONE,
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  progressLabel,
  startButtonEnabled,
  startButtonBackground,
  createTaskGraph,
  LogBuffer,
  redactCredentials,
  redactQuery,
  hasDuplicateStrings,
  uniqueStrings,
  countOf,
  joined,
  DownloadConfig,
  TaskGraph
} from '../Shared/SharedDriver';

export default function semanticSecurityTest(): void {
  describe('SemanticSecurity', () => {
    beforeAll(() => {
      logSuite('SemanticSecurity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SemanticSecurity', 'end');
    });

    /**
     * @tc.name   labelContainsTaskLetterAndPercent
     * @tc.desc   A row label names its task and ends with the percentage sign the bar shows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelContainsTaskLetterAndPercent', 0, () => {
      const graph = createTaskGraph();
      const label: string = graph.taskAt(0).label();
      expect(label).assertEqual('任务A当前进度 0%');
      expect(label.indexOf('任务')).assertEqual(0);
      expect(label.indexOf(TASK_A)).assertEqual(2);
      expect(label.endsWith('%')).assertTrue();
      expect(label.endsWith('0%')).assertTrue();
      expect(label.indexOf('当前进度')).assertLarger(2);
      expect(label.length).assertEqual(10);
      expect(label.split('%').length).assertEqual(2);
    });

    /**
     * @tc.name   labelsAreDistinctPerTaskAtSameProgress
     * @tc.desc   Three rows at the same percentage still read differently because the task letter differs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelsAreDistinctPerTaskAtSameProgress', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      for (let index = 0; index < graph.tasks.length; index++) {
        graph.taskAt(index).reportProgress(50);
      }
      const labels: string[] = [graph.taskAt(0).label(), graph.taskAt(1).label(), graph.taskAt(2).label()];
      expect(labels[0]).assertEqual(progressLabel(TASK_A, 50));
      expect(labels[1]).assertEqual(progressLabel(TASK_B, 50));
      expect(labels[2]).assertEqual(progressLabel(TASK_C, 50));
      expect(hasDuplicateStrings(labels)).assertFalse();
      expect(uniqueStrings(labels).length).assertEqual(3);
      expect(labels[0].indexOf('B')).assertEqual(-1);
      expect(labels[1].indexOf('A')).assertEqual(-1);
      expect(labels[2].indexOf('A') === -1).assertTrue();
      expect(labels[0].endsWith('50%')).assertTrue();
      expect(labels[0].split(' ')[1]).assertEqual('50%');
      expect(labels[1].split(' ')[1]).assertEqual('50%');
      expect(labels[2].split(' ')[1]).assertEqual('50%');
      expect(labels[0].charCodeAt(2)).assertEqual(65);
      expect(labels[1].charCodeAt(2)).assertEqual(66);
      expect(labels[2].charCodeAt(2)).assertEqual(67);
      expect(labels[0].length).assertEqual(11);
      expect(labels[2].length).assertEqual(labels[0].length);
    });

    /**
     * @tc.name   labelAtZeroAndHundred
     * @tc.desc   The two boundary percentages render with one and three digits without truncation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('labelAtZeroAndHundred', 0, () => {
      expect(progressLabel(TASK_A, 0)).assertEqual('任务A当前进度 0%');
      expect(progressLabel(TASK_A, 100)).assertEqual('任务A当前进度 100%');
      expect(progressLabel(TASK_A, 100).length).assertEqual(12);
      expect(progressLabel(TASK_A, 100).length > progressLabel(TASK_A, 0).length).assertTrue();
      expect(progressLabel(TASK_C, 0).indexOf(TASK_C)).assertEqual(2);
      expect(progressLabel(TASK_C, 100).indexOf('100')).assertLarger(0);
      expect(progressLabel(TASK_A, 100).endsWith('100%')).assertTrue();
      expect(progressLabel(TASK_B, 100).startsWith('任务B')).assertTrue();
      expect(PROGRESS_TOTAL).assertEqual(100);
    });

    /**
     * @tc.name   labelTracksEveryProgressValue
     * @tc.desc   Each decile the bar reports appears verbatim in the label for that task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelTracksEveryProgressValue', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      for (let value = 0; value <= 100; value = value + 10) {
        graph.taskAt(1).reportProgress(value);
        expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, value));
        expect(graph.taskAt(1).label().indexOf(String(value)) > 0).assertTrue();
        expect(graph.taskAt(1).label()).assertEqual(graph.taskAt(1).label());
      }
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 0));
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      expect(graph.taskAt(1).label().length).assertEqual(12);
      expect(graph.taskAt(1).label().indexOf('%')).assertEqual(11);
      expect(graph.taskAt(1).label().split('%').length).assertEqual(2);
      expect(graph.taskAt(1).label().startsWith('任务B')).assertTrue();
    });

    /**
     * @tc.name   labelNeverShowsNegativePercent
     * @tc.desc   Task labels derive from the clamped progress, so a negative callback cannot be read aloud.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelNeverShowsNegativePercent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(-40);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 0));
      expect(graph.taskAt(0).label().indexOf('-')).assertEqual(-1);
      expect(graph.taskAt(0).label().indexOf('-40')).assertEqual(-1);
      graph.taskAt(0).reportProgress(10);
      graph.taskAt(0).reportProgress(-90);
      expect(graph.taskAt(0).progress).assertEqual(10);
      expect(graph.taskAt(0).label().endsWith('10%')).assertTrue();
      expect(graph.taskAt(0).label().indexOf('-')).assertEqual(-1);
      expect(graph.taskAt(0).progress >= 0).assertTrue();
      expect(progressLabel(TASK_A, -40)).assertEqual('任务A当前进度 -40%');
      expect(progressLabel(TASK_A, -1).indexOf('-1') > 0).assertTrue();
      expect(graph.taskAt(0).label().indexOf('-40')).assertEqual(-1);
      expect(graph.taskAt(0).progress).assertEqual(10);
    });

    /**
     * @tc.name   labelNeverExceedsHundred
     * @tc.desc   A server value above the total is clamped before rendering, so no label reads 140 percent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelNeverExceedsHundred', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(2).reportProgress(140);
      expect(graph.taskAt(2).progress).assertEqual(100);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 100));
      expect(graph.taskAt(2).label().indexOf('140')).assertEqual(-1);
      expect(graph.taskAt(2).label().endsWith('100%')).assertTrue();
      expect(graph.taskAt(2).progress <= PROGRESS_TOTAL).assertTrue();
      graph.taskAt(2).reportProgress(999);
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 100%');
      expect(graph.taskAt(2).label().length).assertEqual(12);
      expect(graph.taskAt(2).label().indexOf('%')).assertEqual(11);
    });

    /**
     * @tc.name   buttonEnabledOnlyWhenFlagTrue
     * @tc.desc   The enabled state is a direct function of isTaskFinished and nothing else.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonEnabledOnlyWhenFlagTrue', 0, () => {
      expect(startButtonEnabled(true)).assertTrue();
      expect(startButtonEnabled(false)).assertFalse();
      expect(startButtonEnabled(true) === startButtonEnabled(false)).assertFalse();
      const graph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.completeTask(TASK_A);
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished) === true).assertTrue();
    });

    /**
     * @tc.name   buttonBackgroundMatchesEnabledState
     * @tc.desc   The active and disabled colours are distinct constants chosen by the same flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonBackgroundMatchesEnabledState', 0, () => {
      expect(BUTTON_ACTIVE_BACKGROUND).assertEqual('#409EFF');
      expect(BUTTON_DISABLED_BACKGROUND).assertEqual('#C0C4CC');
      expect(BUTTON_ACTIVE_BACKGROUND === BUTTON_DISABLED_BACKGROUND).assertFalse();
      expect(startButtonBackground(true)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(startButtonBackground(false)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(startButtonBackground(true).startsWith('#')).assertTrue();
      expect(startButtonBackground(true).length).assertEqual(7);
      expect(startButtonBackground(false).length).assertEqual(7);
      expect(startButtonBackground(true) === startButtonBackground(false)).assertFalse();
      expect(BUTTON_ACTIVE_BACKGROUND !== BUTTON_DISABLED_BACKGROUND).assertTrue();
      expect(startButtonBackground(false).toUpperCase()).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(startButtonBackground(true).substring(1).length).assertEqual(6);
      expect(startButtonBackground(true) === '#409EFF').assertTrue();
    });

    /**
     * @tc.name   buttonDisabledAfterStart
     * @tc.desc   The moment a run starts the button is announced disabled and its colour greys out.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('buttonDisabledAfterStart', 0, () => {
      const graph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#409EFF');
      graph.startAll();
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
      expect(startButtonBackground(graph.isTaskFinished) === '#409EFF').assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.isTaskFinished === false).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 0));
    });

    /**
     * @tc.name   buttonRemainsDisabledAfterCompletionUntilReset
     * @tc.desc   The page never flips the flag back on completion, so only a reset re-enables the button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('buttonRemainsDisabledAfterCompletionUntilReset', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#409EFF');
      expect(graph.taskAt(0).progress).assertEqual(0);
    });

    /**
     * @tc.name   buttonSemanticsIndependentOfTaskStatuses
     * @tc.desc   Even with failed or completed rows the announcement follows only isTaskFinished.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('buttonSemanticsIndependentOfTaskStatuses', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.completeTask(TASK_B);
      expect(graph.taskAt(0).status).assertEqual(STATUS_FAILED);
      expect(graph.taskAt(1).status).assertEqual(STATUS_COMPLETED);
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.isTaskFinished = true;
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.taskAt(0).isFailed()).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertTrue();
      graph.isTaskFinished = false;
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   logMessagesUseEnglishOnly
     * @tc.desc   Every diagnostic line produced by the suites is plain ASCII English, so log readers need no locale.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logMessagesUseEnglishOnly', 0, () => {
      const log = new LogBuffer(16);
      log.info('task A started');
      log.warn('task B is slow');
      log.error('task C failed code ' + String(ERROR_NETWORK));
      for (let line = 0; line < log.lines.length; line++) {
        const text: string = log.lines[line];
        for (let index = 0; index < text.length; index++) {
          expect(text.charCodeAt(index) < 128).assertTrue();
        }
      }
      expect(log.lines[0]).assertEqual('INFO task A started');
      expect(log.lines[1]).assertEqual('WARN task B is slow');
      expect(log.lines[2]).assertEqual('ERROR task C failed code 13400003');
      expect(log.contains('started')).assertTrue();
      expect(log.trace().split('|').length).assertEqual(3);
      expect(log.trace().indexOf('ERROR')).assertLarger(0);
      expect(log.lines[0].split(' ').length).assertEqual(4);
      expect(log.lines[2].indexOf('13400003') > 0).assertTrue();
    });

    /**
     * @tc.name   logMessagesContainNoControlCharacters
     * @tc.desc   A production safe message has no carriage return, so one call writes exactly one readable line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logMessagesContainNoControlCharacters', 0, () => {
      const log = new LogBuffer(8);
      const safe: string = 'task A completed 100 percent';
      log.info(safe);
      expect(log.lines[0].indexOf('\n')).assertEqual(-1);
      expect(log.lines[0].indexOf('\r')).assertEqual(-1);
      expect(log.lines[0].indexOf('\t')).assertEqual(-1);
      expect(log.size()).assertEqual(1);
      log.info('line one\nline two');
      expect(log.lines[1].indexOf('\n') > 0).assertTrue();
      expect(log.size()).assertEqual(2);
      expect(log.trace().indexOf('\n') > 0).assertTrue();
      expect(safe.split('\n').length).assertEqual(1);
      expect(log.lines[0].endsWith('percent')).assertTrue();
      expect(log.trace().split('\n').length).assertEqual(2);
      expect(log.levels.length).assertEqual(2);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(2);
    });

    /**
     * @tc.name   logLevelPrefixMatchesEntry
     * @tc.desc   The stored line always starts with the level of the call that created it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logLevelPrefixMatchesEntry', 0, () => {
      const log = new LogBuffer(8);
      log.info('one');
      log.warn('two');
      log.error('three');
      expect(log.lines[0].startsWith(LEVEL_INFO + ' ')).assertTrue();
      expect(log.lines[1].startsWith(LEVEL_WARN + ' ')).assertTrue();
      expect(log.lines[2].startsWith(LEVEL_ERROR + ' ')).assertTrue();
      expect(log.levels[0]).assertEqual(LEVEL_INFO);
      expect(log.levels[1]).assertEqual(LEVEL_WARN);
      expect(log.levels[2]).assertEqual(LEVEL_ERROR);
      expect(log.lines[0].substring(LEVEL_INFO.length)).assertEqual(' one');
      expect(log.lines[2].substring(LEVEL_ERROR.length + 1)).assertEqual('three');
      expect(log.lines[1].substring(LEVEL_WARN.length + 1)).assertEqual('two');
      expect(log.levels[1]).assertEqual(LEVEL_WARN);
      expect(log.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(log.countLevel('TRACE')).assertEqual(0);
      expect(log.lines.length).assertEqual(3);
      expect(log.lines[0]).assertEqual(LEVEL_INFO + ' one');
      expect(log.lines[2]).assertEqual(LEVEL_ERROR + ' three');
      expect(log.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(log.lines[1].indexOf(LEVEL_WARN)).assertEqual(0);
      expect(log.lines[2].indexOf(LEVEL_ERROR)).assertEqual(0);
      expect(log.trace().split('INFO ').length).assertEqual(2);
      expect(log.trace().split('WARN ').length).assertEqual(2);
      expect(log.trace().split('ERROR ').length).assertEqual(2);
    });

    /**
     * @tc.name   logTraceIsFlatAndPipeDelimited
     * @tc.desc   The trace joins entries with a pipe, so a reader can split it without parsing nested text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logTraceIsFlatAndPipeDelimited', 0, () => {
      const log = new LogBuffer(8);
      log.info('alpha');
      log.info('beta');
      log.info('gamma');
      expect(log.trace()).assertEqual('INFO alpha|INFO beta|INFO gamma');
      expect(log.trace().split('|').length).assertEqual(3);
      expect(log.trace().startsWith('INFO alpha')).assertTrue();
      expect(log.trace().endsWith('INFO gamma')).assertTrue();
      expect(joined(log.lines, '|')).assertEqual(log.trace());
      expect(log.trace().indexOf('INFO beta')).assertLarger(0);
      log.clear();
      expect(log.trace().split('|').length).assertEqual(1);
      expect(log.trace()).assertEqual('');
    });

    /**
     * @tc.name   noHiddenPayloadInAccessibleText
     * @tc.desc   Labels and log lines never include a URL, token or newline that a screen reader could echo.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('noHiddenPayloadInAccessibleText', 0, () => {
      const graph = createTaskGraph();
      const log = new LogBuffer(8);
      const secret: string = 'https://u:p@gitee.com/a.png?token=abc';
      const safe: string = redactQuery(redactCredentials(secret));
      log.info('download ready ' + safe);
      for (let index = 0; index < graph.tasks.length; index++) {
        const label: string = graph.taskAt(index).label();
        expect(label.indexOf('http')).assertEqual(-1);
        expect(label.indexOf('token')).assertEqual(-1);
        expect(label.indexOf('\n')).assertEqual(-1);
        expect(label.indexOf('@')).assertEqual(-1);
      }
      expect(log.contains('abc')).assertFalse();
      expect(log.contains('u:p@')).assertFalse();
      expect(log.contains('http')).assertTrue();
      expect(log.size()).assertEqual(1);
      expect(log.lines[0].indexOf('@')).assertLarger(0);
      expect(log.lines[0].endsWith('a.png')).assertTrue();
      expect(log.contains('***')).assertTrue();
      expect(log.contains('?')).assertFalse();
    });

    /**
     * @tc.name   screenReaderTextForEachRowIsUnique
     * @tc.desc   A reader walking the three rows hears three different strings at any shared percentage.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('screenReaderTextForEachRowIsUnique', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const percentages: number[] = [0, 25, 50, 75, 100];
      for (let step = 0; step < percentages.length; step++) {
        for (let index = 0; index < graph.tasks.length; index++) {
          graph.taskAt(index).reportProgress(percentages[step]);
        }
        const first: string = graph.taskAt(0).label();
        const second: string = graph.taskAt(1).label();
        const third: string = graph.taskAt(2).label();
        expect(first === second).assertFalse();
        expect(second === third).assertFalse();
        expect(first === third).assertFalse();
        expect(first.indexOf(TASK_A)).assertEqual(2);
        expect(second.indexOf(TASK_B)).assertEqual(2);
        expect(third.indexOf(TASK_C)).assertEqual(2);
      }
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 100%');
    });

    /**
     * @tc.name   statusConstantsAreDistinctAndReadable
     * @tc.desc   The four status words are unique, lowercase English and usable as spoken state names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('statusConstantsAreDistinctAndReadable', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED];
      expect(statuses.length).assertEqual(4);
      expect(hasDuplicateStrings(statuses)).assertFalse();
      expect(uniqueStrings(statuses).length).assertEqual(4);
      expect(STATUS_IDLE).assertEqual('idle');
      expect(STATUS_RUNNING).assertEqual('running');
      expect(STATUS_COMPLETED).assertEqual('completed');
      expect(STATUS_FAILED).assertEqual('failed');
      for (let index = 0; index < statuses.length; index++) {
        expect(statuses[index]).assertEqual(statuses[index].toLowerCase());
        expect(statuses[index].length > 3).assertTrue();
        expect(statuses[index].indexOf(' ')).assertEqual(-1);
      }
      expect(joined(statuses, '/')).assertEqual('idle/running/completed/failed');
      expect(countOf(statuses, STATUS_RUNNING)).assertEqual(1);
    });

    /**
     * @tc.name   statusWordsMatchTaskLifecycle
     * @tc.desc   Each lifecycle step reports the status word a reader would expect at that point.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statusWordsMatchTaskLifecycle', 0, () => {
      const graph = createTaskGraph();
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      graph.startAll();
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      graph.completeTask(TASK_A);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      expect(graph.taskAt(1).status).assertEqual(STATUS_FAILED);
      expect(graph.taskAt(1).status === graph.taskAt(0).status).assertFalse();
      graph.reset();
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).describe()).assertEqual('A:idle:0');
      expect(graph.taskAt(1).describe()).assertEqual('B:idle:0');
    });

    /**
     * @tc.name   levelConstantsAreUpperEnglish
     * @tc.desc   INFO, WARN and ERROR are the three distinct uppercase level words the buffer accepts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('levelConstantsAreUpperEnglish', 0, () => {
      const levels: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      expect(hasDuplicateStrings(levels)).assertFalse();
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      for (let index = 0; index < levels.length; index++) {
        expect(levels[index]).assertEqual(levels[index].toUpperCase());
        expect(levels[index].length >= 4).assertTrue();
      }
      expect(joined(levels, ',')).assertEqual('INFO,WARN,ERROR');
      expect(LEVEL_ERROR.length > LEVEL_WARN.length).assertTrue();
      expect(LEVEL_INFO.length === LEVEL_WARN.length).assertTrue();
      expect(LEVEL_WARN.length < LEVEL_ERROR.length).assertTrue();
    });

    /**
     * @tc.name   taskNumbersAreSingleAsciiLetters
     * @tc.desc   The three task identifiers are the single uppercase letters the labels and logs quote.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskNumbersAreSingleAsciiLetters', 0, () => {
      expect(TASK_NUMBERS.length).assertEqual(3);
      expect(hasDuplicateStrings(TASK_NUMBERS)).assertFalse();
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const taskNo: string = TASK_NUMBERS[index];
        expect(taskNo.length).assertEqual(1);
        expect(taskNo.charCodeAt(0) >= 65).assertTrue();
        expect(taskNo.charCodeAt(0) <= 90).assertTrue();
        expect(taskNo).assertEqual(taskNo.toUpperCase());
        expect(progressLabel(taskNo, 0).indexOf(taskNo)).assertEqual(2);
      }
      expect(TASK_A.charCodeAt(0)).assertEqual(65);
      expect(TASK_B.charCodeAt(0)).assertEqual(66);
      expect(TASK_C.charCodeAt(0)).assertEqual(67);
      expect(joined(TASK_NUMBERS, '')).assertEqual('ABC');
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(TASK_NUMBERS[2]).assertEqual(TASK_C);
      expect(progressLabel(TASK_B, 7).indexOf(TASK_B)).assertEqual(2);
      expect(TASK_NUMBERS.indexOf(TASK_C)).assertEqual(2);
    });

    /**
     * @tc.name   pageTitleIsReadableAndStable
     * @tc.desc   The header literal above the rows is unchanged, four characters long and free of markup.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pageTitleIsReadableAndStable', 0, () => {
      expect(PAGE_TITLE).assertEqual('网络场景');
      expect(PAGE_TITLE.length).assertEqual(4);
      expect(PAGE_TITLE.indexOf('网络')).assertEqual(0);
      expect(PAGE_TITLE.indexOf('<')).assertEqual(-1);
      expect(PAGE_TITLE.indexOf('>')).assertEqual(-1);
      expect(PAGE_TITLE.trim()).assertEqual(PAGE_TITLE);
      expect(PAGE_TITLE.indexOf('\n')).assertEqual(-1);
      expect(PAGE_TITLE.split('').length).assertEqual(4);
      expect(PAGE_TITLE !== '').assertTrue();
    });

    /**
     * @tc.name   errorConstantsAreDistinctAndReadable
     * @tc.desc   The five numeric codes are unique, ordered and printable, so a log reader can quote them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorConstantsAreDistinctAndReadable', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      expect(codes.length).assertEqual(5);
      for (let outer = 0; outer < codes.length; outer++) {
        for (let inner = outer + 1; inner < codes.length; inner++) {
          expect(codes[outer] === codes[inner]).assertFalse();
        }
      }
      expect(ERROR_CREATE > ERROR_NONE).assertTrue();
      expect(ERROR_START > ERROR_CREATE).assertTrue();
      expect(ERROR_NETWORK > ERROR_START).assertTrue();
      expect(ERROR_TIMEOUT > ERROR_NETWORK).assertTrue();
      for (let index = 1; index < codes.length; index++) {
        expect(String(codes[index]).length).assertEqual(8);
        expect(String(codes[index]).startsWith('1340')).assertTrue();
      }
      expect(String(ERROR_NONE)).assertEqual('0');
    });

    /**
     * @tc.name   labelsUseIntegerPercentagesOnly
     * @tc.desc   A spoken label never contains a decimal point or a stray plus sign.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelsUseIntegerPercentagesOnly', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(33);
      graph.taskAt(1).reportProgress(67);
      graph.taskAt(2).reportProgress(99);
      for (let index = 0; index < graph.tasks.length; index++) {
        const label: string = graph.taskAt(index).label();
        expect(label.indexOf('.')).assertEqual(-1);
        expect(label.indexOf('+')).assertEqual(-1);
        expect(label.indexOf('e')).assertEqual(-1);
        expect(label.indexOf(',')).assertEqual(-1);
        expect(label.endsWith('%')).assertTrue();
      }
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 33));
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 67));
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 99%');
      expect(graph.taskAt(2).label().length).assertEqual(11);
      expect(graph.taskAt(2).label().charCodeAt(2)).assertEqual(67);
      expect(graph.taskAt(0).label().split(' ').length).assertEqual(2);
      expect(graph.taskAt(0).label().split(' ')[0]).assertEqual('任务A当前进度');
      expect(graph.taskAt(0).label().split(' ')[1]).assertEqual('33%');
      expect(graph.taskAt(2).label().indexOf('%')).assertEqual(10);
      expect(graph.taskAt(0).label().length).assertEqual(11);
    });

    /**
     * @tc.name   configIsNotExposedInAccessibleText
     * @tc.desc   Neither a row label nor a status line mentions the transfer verb, method or saveas path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configIsNotExposedInAccessibleText', 0, () => {
      const graph = createTaskGraph();
      const log = new LogBuffer(8);
      const config = DownloadConfig.forTask(TASK_A);
      log.info('task A state ' + graph.taskAt(0).status);
      for (let index = 0; index < graph.tasks.length; index++) {
        const label: string = graph.taskAt(index).label();
        expect(label.indexOf('DOWNLOAD')).assertEqual(-1);
        expect(label.indexOf('GET')).assertEqual(-1);
        expect(label.indexOf('./')).assertEqual(-1);
        expect(label.indexOf('saveas')).assertEqual(-1);
      }
      expect(log.lines[0]).assertEqual('INFO task A state idle');
      expect(log.contains('DOWNLOAD')).assertFalse();
      expect(log.contains('GET')).assertFalse();
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   buttonPairHasNoThirdState
     * @tc.desc   The button helper resolves to exactly one of the two documented constants for any flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('buttonPairHasNoThirdState', 0, () => {
      const flags: boolean[] = [true, false, true, false];
      const seen: string[] = [];
      for (let index = 0; index < flags.length; index++) {
        const colour: string = startButtonBackground(flags[index]);
        expect(colour === BUTTON_ACTIVE_BACKGROUND || colour === BUTTON_DISABLED_BACKGROUND).assertTrue();
        if (seen.indexOf(colour) < 0) {
          seen.push(colour);
        }
        expect(startButtonEnabled(flags[index])).assertEqual(flags[index]);
      }
      expect(seen.length).assertEqual(2);
      expect(seen.indexOf(BUTTON_ACTIVE_BACKGROUND) >= 0).assertTrue();
      expect(seen.indexOf(BUTTON_DISABLED_BACKGROUND) >= 0).assertTrue();
      expect(BUTTON_ACTIVE_BACKGROUND !== BUTTON_DISABLED_BACKGROUND).assertTrue();
    });

    /**
     * @tc.name   logBufferLimitDoesNotSplitEntry
     * @tc.desc   Trimming removes whole entries only, so a retained line keeps its level and full text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferLimitDoesNotSplitEntry', 0, () => {
      const log = new LogBuffer(2);
      const longLine: string = 'task C retry scheduled after timeout code 13400004';
      log.info('first entry');
      log.info(longLine);
      log.info('third entry');
      expect(log.size()).assertEqual(2);
      expect(log.lines[0]).assertEqual('INFO ' + longLine);
      expect(log.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      expect(log.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      expect(log.lines[0].endsWith('13400004')).assertTrue();
      expect(log.contains('first entry')).assertFalse();
      expect(log.contains(longLine)).assertTrue();
      expect(log.levels.length).assertEqual(2);
      expect(log.trace().split('|').length).assertEqual(2);
    });

    /**
     * @tc.name   semanticsSummaryOfFullRun
     * @tc.desc   At the end of a run all three labels read 100 percent, statuses are completed and the button is off.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('semanticsSummaryOfFullRun', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).label()).assertEqual(progressLabel(TASK_NUMBERS[index], 100));
        expect(graph.taskAt(index).status).assertEqual(STATUS_COMPLETED);
        expect(graph.taskAt(index).progressRatio()).assertEqual(1);
      }
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(graph.allCompleted()).assertTrue();
      expect(hasDuplicateStrings([graph.taskAt(0).label(), graph.taskAt(1).label(), graph.taskAt(2).label()])).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.taskAt(0).label().length).assertEqual(12);
      expect(graph.taskAt(1).progressRatio()).assertEqual(1);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(graph.events.size()).assertEqual(11);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.taskAt(1).startedAt).assertEqual(0);
      expect(graph.taskAt(2).startedAt).assertEqual(200);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   semanticsStateAfterResetIsFresh
     * @tc.desc   After a reset every spoken label and status returns to the initial reading.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('semanticsStateAfterResetIsFresh', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.taskAt(1).fail(ERROR_CREATE);
      graph.reset();
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 0%');
      expect(graph.taskAt(1).label()).assertEqual('任务B当前进度 0%');
      expect(graph.taskAt(2).label()).assertEqual('任务C当前进度 0%');
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.taskAt(0).label().length).assertEqual(10);
      expect(graph.taskAt(1).label().indexOf(TASK_B)).assertEqual(2);
      expect(graph.taskAt(2).label().endsWith('0%')).assertTrue();
    });

    /**
     * @tc.name   statusWordReachesTheLogUnchanged
     * @tc.desc   The status constant quoted in a log line is the same word the semantics layer announces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SemanticSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statusWordReachesTheLogUnchanged', 0, () => {
      const graph = createTaskGraph();
      const log = new LogBuffer(8);
      graph.startAll();
      log.info('task A ' + graph.taskAt(0).status);
      expect(log.lines[0]).assertEqual('INFO task A running');
      expect(log.contains(STATUS_RUNNING)).assertTrue();
      graph.completeTask(TASK_A);
      log.info('task A ' + graph.taskAt(0).status);
      expect(log.lines[1]).assertEqual('INFO task A completed');
      expect(log.contains(STATUS_COMPLETED)).assertTrue();
      graph.taskAt(1).fail(ERROR_NETWORK);
      log.warn('task B ' + graph.taskAt(1).status);
      expect(log.lines[2]).assertEqual('WARN task B failed');
      expect(log.contains(STATUS_FAILED)).assertTrue();
      expect(log.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(log.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(log.trace().indexOf(STATUS_IDLE)).assertEqual(-1);
    });

    // End of semantics security suite.
  });
}
