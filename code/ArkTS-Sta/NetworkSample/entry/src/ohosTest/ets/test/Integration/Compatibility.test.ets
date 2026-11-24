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
 * Compatibility suite.
 *
 * The page is a single fixed screen, so compatibility here means value
 * compatibility: any progress value a server may report, either completion
 * order, every seeded URL and every helper must behave without a device,
 * ability context or clock. Unknown task numbers must be inert rather than
 * corrupting the three known rows.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60   three number states and one boolean flag
 *   68-76   updateProgress assigns exactly 100 for a matching task letter
 *   109-116 config literal: DOWNLOAD, url, overwrite, GET, './'
 *   151-171 URL literals per task
 *   209-247 three progress rows with total 100
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  TASK_URLS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
  POLL_INTERVAL_MS,
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  createTaskGraph,
  DownloadConfig,
  expectedConfigFor,
  expectedProgressAfter,
  clampInt,
  isTerminalStatus,
  fileNameOf,
  extensionOf,
  hostOf,
  schemeOf,
  expectationFor,
  progressLabel,
  startButtonEnabled,
  startButtonBackground,
  countOf,
  hasDuplicateStrings,
  uniqueStrings,
  sortedCopy,
  reversedCopy,
  joined,
  sameStringArray,
  TaskGraph
} from '../Shared/SharedDriver';

export default function compatibilityTest(): void {
  describe('Compatibility', () => {
    beforeAll(() => {
      logSuite('Compatibility', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('Compatibility', 'end');
    });

    /**
     * @tc.name   progressAcceptsEveryDecileValue
     * @tc.desc   All eleven decile values are stored verbatim while a download is running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressAcceptsEveryDecileValue', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      let observed = 0;
      for (let value = 0; value <= PROGRESS_TOTAL; value = value + 10) {
        expect(graph.taskAt(0).reportProgress(value)).assertEqual(value);
        observed = observed + 1;
      }
      expect(observed).assertEqual(11);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).progressRatio()).assertEqual(1);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(0).progress % 10).assertEqual(0);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 100));
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(0).isComplete()).assertFalse();
      expect(graph.taskAt(0).isFailed()).assertFalse();
      expect(graph.taskAt(0).isIdle()).assertFalse();
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.totalProgress()).assertEqual(100);
    });

    /**
     * @tc.name   progressClampsNegativeInput
     * @tc.desc   A negative byte count from a misbehaving callback never pushes a bar below zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressClampsNegativeInput', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.taskAt(0).reportProgress(-1)).assertEqual(0);
      expect(graph.taskAt(0).reportProgress(-500)).assertEqual(0);
      expect(graph.taskAt(0).progress).assertEqual(0);
      graph.taskAt(0).reportProgress(30);
      expect(graph.taskAt(0).reportProgress(-20)).assertEqual(30);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0.3);
      expect(clampInt(-9, 0, 100)).assertEqual(0);
      expect(clampInt(-1, -5, 100)).assertEqual(-1);
      expect(expectedProgressAfter(30, -20)).assertEqual(30);
      expect(expectedProgressAfter(0, -20)).assertEqual(0);
      expect(graph.taskAt(0).progress >= PROGRESS_INITIAL).assertTrue();
      expect(graph.taskAt(0).label().endsWith('30%')).assertTrue();
      expect(clampInt(-100, -50, 50)).assertEqual(-50);
      expect(clampInt(0, 0, 100)).assertEqual(0);
      expect(clampInt(-0.5, 0, 100)).assertEqual(0);
      expect(graph.taskAt(0).progressRatio() > 0).assertTrue();
      expect(graph.taskAt(0).progressRatio() < 1).assertTrue();
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   compatibilityProgressClampsAboveHundred
     * @tc.desc   A server reporting more than the total is capped at exactly one hundred percent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('compatibilityProgressClampsAboveHundred', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.taskAt(1).reportProgress(101)).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.taskAt(1).progressRatio()).assertEqual(1);
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 100));
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(clampInt(150, 0, 100)).assertEqual(100);
      expect(clampInt(100, 0, 100)).assertEqual(100);
      expect(expectedProgressAfter(0, 240)).assertEqual(100);
      expect(graph.taskAt(1).progress <= PROGRESS_TOTAL).assertTrue();
      expect(graph.taskAt(1).progressRatio() === 1).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertFalse();
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(clampInt(1000, 0, 100)).assertEqual(100);
      expect(expectedProgressAfter(99, 500)).assertEqual(100);
      expect(graph.taskAt(1).label().endsWith('100%')).assertTrue();
      expect(graph.taskAt(1).describe()).assertEqual('B:running:100');
      expect(graph.taskAt(1).progress >= 100).assertTrue();
    });

    /**
     * @tc.name   progressNeverMovesBackwards
     * @tc.desc   A lower value arriving after a higher one is ignored, keeping the bar monotone for the user.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressNeverMovesBackwards', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.taskAt(2).reportProgress(70)).assertEqual(70);
      expect(graph.taskAt(2).reportProgress(65)).assertEqual(70);
      expect(graph.taskAt(2).reportProgress(12)).assertEqual(70);
      expect(graph.taskAt(2).progress).assertEqual(70);
      expect(graph.taskAt(2).label().endsWith('70%')).assertTrue();
      expect(graph.taskAt(2).reportProgress(71)).assertEqual(71);
      expect(graph.taskAt(2).progress).assertEqual(71);
      expect(graph.taskAt(2).isRunning()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(expectedProgressAfter(70, 12)).assertEqual(70);
      expect(expectedProgressAfter(70, 71)).assertEqual(71);
      expect(graph.taskAt(2).progressRatio()).assertEqual(0.71);
      expect(graph.taskAt(2).describe()).assertEqual('C:idle:71');
      expect(graph.events.size()).assertEqual(4);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(clampInt(70, 0, 100)).assertEqual(70);
      expect(graph.taskAt(2).isComplete()).assertFalse();
      expect(graph.taskAt(2).isFailed()).assertFalse();
      expect(graph.taskAt(2).label().indexOf('71') > 0).assertTrue();
    });

    /**
     * @tc.name   compatibilityCompletionOverridesPartialProgress
     * @tc.desc   The completion callback writes 100 regardless of the last intermediate percentage.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('compatibilityCompletionOverridesPartialProgress', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(37);
      expect(graph.taskAt(0).progress).assertEqual(37);
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 100));
      expect(graph.taskAt(0).progressRatio()).assertEqual(1);
      expect(graph.taskAt(0).isRunning()).assertFalse();
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 100));
      expect(graph.taskAt(0).describe()).assertEqual('A:completed:100');
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).progressRatio() * 100).assertEqual(100);
      expect(expectedProgressAfter(37, 100)).assertEqual(100);
      expect(graph.taskAt(0).label().indexOf('100') > 0).assertTrue();
      expect(graph.taskAt(0).label().endsWith('%')).assertTrue();
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(1);
    });

    /**
     * @tc.name   variedOrderAThenBReachesGate
     * @tc.desc   Finishing A before B unlocks the third row in the standard order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('variedOrderAThenBReachesGate', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
      expect(graph.completionOrder[1]).assertEqual(TASK_B);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   variedOrderBThenAReachesGate
     * @tc.desc   The mirrored order is equally valid; only the completion trace differs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('variedOrderBThenAReachesGate', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      expect(graph.completionOrder.indexOf(TASK_A)).assertEqual(1);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.runTaskCIfReady(100)).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   interleavedProgressDoesNotCrossRows
     * @tc.desc   Alternating updates between three tasks keep each row's percentage independent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interleavedProgressDoesNotCrossRows', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      for (let step = 1; step <= 5; step++) {
        graph.taskAt(0).reportProgress(step * 20);
        graph.taskAt(1).reportProgress(step * 10);
        graph.taskAt(2).reportProgress(step * 4);
      }
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(50);
      expect(graph.taskAt(2).progress).assertEqual(20);
      expect(graph.taskAt(0).label().endsWith('100%')).assertTrue();
      expect(graph.taskAt(1).label().endsWith('50%')).assertTrue();
      expect(graph.taskAt(2).label().endsWith('20%')).assertTrue();
      expect(graph.totalProgress()).assertEqual(170);
      expect(graph.averageProgress()).assertEqual(170.0 / 3);
      expect(graph.taskAt(1).progressRatio()).assertEqual(0.5);
      expect(graph.taskAt(2).progressRatio()).assertEqual(0.2);
      expect(graph.taskAt(0).progress === PROGRESS_TOTAL).assertTrue();
      expect(graph.taskAt(1).describe()).assertEqual('B:running:50');
      expect(graph.taskAt(2).describe()).assertEqual('C:idle:20');
      expect(graph.taskAt(0).label() === graph.taskAt(1).label()).assertFalse();
      expect(graph.taskAt(1).label() === graph.taskAt(2).label()).assertFalse();
      expect(countOf([graph.taskAt(0).label(), graph.taskAt(1).label()], graph.taskAt(2).label())).assertEqual(0);
      expect(graph.totalProgress() - 170).assertEqual(0);
      expect(graph.averageProgress() * 3).assertEqual(170);
    });

    /**
     * @tc.name   unknownTaskCompletionIsIgnored
     * @tc.desc   An unknown task letter cannot complete, cannot enter the trace and cannot move the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskCompletionIsIgnored', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const eventsBefore: number = graph.events.size();
      expect(graph.completeTask('D')).assertFalse();
      expect(graph.completeTask('')).assertFalse();
      expect(graph.completeTask('a')).assertFalse();
      expect(graph.events.size()).assertEqual(eventsBefore);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskByNo('D') === undefined).assertTrue();
      expect(graph.taskByNo(TASK_A) !== undefined).assertTrue();
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   unknownTaskConfigIsInvalid
     * @tc.desc   Building a config for an unknown task yields the empty URL form that the validator rejects.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskConfigIsInvalid', 0, () => {
      const config = DownloadConfig.forTask('D');
      expect(config.url).assertEqual('');
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(config.isValid()).assertFalse();
      expect(config.validate().length).assertEqual(2);
      expect(config.validate()[0]).assertEqual('url-empty');
      expect(config.validate()[1]).assertEqual('url-not-https');
      expect(config.fileName()).assertEqual('file');
      expect(config.describe().indexOf('DOWNLOAD|GET|true|./|') === 0).assertTrue();
    });

    /**
     * @tc.name   unknownTaskExpectationFallsBackToThirdLiteral
     * @tc.desc   The expectation helper resolves any non A/B task number to the third literal, including unknown ones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskExpectationFallsBackToThirdLiteral', 0, () => {
      const known = expectationFor(TASK_C);
      const unknown = expectationFor('D');
      expect(known.url).assertEqual(URL_TASK_C);
      expect(unknown.url).assertEqual(URL_TASK_C);
      expect(unknown.taskNo).assertEqual('D');
      expect(unknown.fileName).assertEqual('icon_main_color.png');
      expect(unknown.extension).assertEqual('.png');
      expect(unknown.host).assertEqual('gitee.com');
      expect(unknown.fileName).assertEqual(known.fileName);
      expect(unknown.taskNo === known.taskNo).assertFalse();
      expect(unknown.url).assertEqual(URL_TASK_B === unknown.url ? URL_TASK_A : URL_TASK_C);
      expect(expectationFor(TASK_A).url).assertEqual(URL_TASK_A);
      expect(expectationFor(TASK_B).host).assertEqual('gitee.com');
    });

    /**
     * @tc.name   constantsAreStableAcrossInstances
     * @tc.desc   Every documented literal keeps its value when read through a new graph or config instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('constantsAreStableAcrossInstances', 0, () => {
      expect(PROGRESS_TOTAL).assertEqual(100);
      expect(PROGRESS_INITIAL).assertEqual(0);
      expect(POLL_INTERVAL_MS).assertEqual(200);
      expect(CONFIG_ACTION_DOWNLOAD).assertEqual('DOWNLOAD');
      expect(CONFIG_METHOD_GET).assertEqual('GET');
      expect(CONFIG_SAVEAS_CACHE).assertEqual('./');
      expect(CONFIG_OVERWRITE).assertTrue();
      const first = createTaskGraph();
      const second = createTaskGraph();
      expect(first.taskAt(0).url).assertEqual(second.taskAt(0).url);
      expect(first.taskAt(1).url).assertEqual(URL_TASK_B);
      expect(first.taskAt(2).url).assertEqual(URL_TASK_C);
      expect(DownloadConfig.forTask(TASK_A).describe()).assertEqual(expectedConfigFor(TASK_A).describe());
      expect(DownloadConfig.forUrl(URL_TASK_B).method).assertEqual(CONFIG_METHOD_GET);
      expect(DownloadConfig.forUrl(URL_TASK_B).saveas).assertEqual('./');
      expect(DownloadConfig.forUrl(URL_TASK_B).overwrite).assertTrue();
      expect(DownloadConfig.forUrl(URL_TASK_B).url).assertEqual(second.taskAt(1).url);
      expect(second.events.size()).assertEqual(first.events.size());
      expect(first.pollTicks).assertEqual(0);
      expect(first.timerActive).assertFalse();
      expect(first.taskAt(0).isIdle()).assertTrue();
      expect(TASK_NUMBERS.length).assertEqual(3);
      expect(PROGRESS_TOTAL - PROGRESS_INITIAL).assertEqual(100);
    });

    /**
     * @tc.name   progressBudgetIsHundredForAllRows
     * @tc.desc   The progress total used by all three rows is one hundred, and completion always fills it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressBudgetIsHundredForAllRows', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        expect(graph.taskAt(index).progress).assertEqual(PROGRESS_INITIAL);
        expect(graph.taskAt(index).progressRatio()).assertEqual(0);
      }
      graph.completeTask(TASK_C);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        expect(graph.taskAt(index).progress).assertEqual(PROGRESS_TOTAL);
        expect(graph.taskAt(index).progressRatio()).assertEqual(1);
        expect(graph.taskAt(index).progress <= PROGRESS_TOTAL).assertTrue();
      }
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
    });

    /**
     * @tc.name   compatibilityTaskAtClampsOutOfRangeIndex
     * @tc.desc   The index helper clamps to the first or last row instead of returning nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('compatibilityTaskAtClampsOutOfRangeIndex', 0, () => {
      const graph = createTaskGraph();
      expect(graph.taskAt(-1).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(-99).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(3).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(42).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(999).taskNo).assertEqual(graph.taskAt(2).taskNo);
      expect(clampInt(7, 0, 2)).assertEqual(2);
      expect(clampInt(-7, 0, 2)).assertEqual(0);
    });

    /**
     * @tc.name   fileNamesAreDistinctPerTask
     * @tc.desc   The three gitee literals resolve to three different png names, so they cannot collide on disk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileNamesAreDistinctPerTask', 0, () => {
      const names: string[] = [];
      for (let index = 0; index < TASK_URLS.length; index++) {
        names.push(fileNameOf(TASK_URLS[index]));
      }
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('favor_list_tea.png');
      expect(names[1]).assertEqual('after_cache.png');
      expect(names[2]).assertEqual('icon_main_color.png');
      expect(hasDuplicateStrings(names)).assertFalse();
      expect(uniqueStrings(names).length).assertEqual(3);
      expect(countOf(names, 'after_cache.png')).assertEqual(1);
      expect(fileNameOf(TASK_URLS[0]) === fileNameOf(TASK_URLS[1])).assertFalse();
    });

    /**
     * @tc.name   allExtensionsArePng
     * @tc.desc   Extension parsing is uniform for the three images and handles odd dot placement.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allExtensionsArePng', 0, () => {
      expect(extensionOf(URL_TASK_A)).assertEqual('.png');
      expect(extensionOf(URL_TASK_B)).assertEqual('.png');
      expect(extensionOf(URL_TASK_C)).assertEqual('.png');
      expect(extensionOf('https://gitee.com/a/b.jpg')).assertEqual('.jpg');
      expect(extensionOf('https://gitee.com/a/archive.tar.gz')).assertEqual('.gz');
      expect(extensionOf('https://gitee.com/a/noextension')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/.hidden')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/dir/')).assertEqual('');
      expect(extensionOf(URL_TASK_A).length).assertEqual(4);
      expect(extensionOf(URL_TASK_A).startsWith('.')).assertTrue();
    });

    /**
     * @tc.name   allUrlsAreUnique
     * @tc.desc   No two tasks share a URL, so three separate cache files are produced.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('allUrlsAreUnique', 0, () => {
      expect(TASK_URLS.length).assertEqual(3);
      expect(hasDuplicateStrings(TASK_URLS)).assertFalse();
      expect(uniqueStrings(TASK_URLS).length).assertEqual(3);
      expect(countOf(TASK_URLS, URL_TASK_A)).assertEqual(1);
      expect(TASK_URLS[0] === TASK_URLS[1]).assertFalse();
      expect(TASK_URLS[1] === TASK_URLS[2]).assertFalse();
      expect(URL_TASK_A).assertEqual(TASK_URLS[0]);
      expect(URL_TASK_C).assertEqual(TASK_URLS[2]);
      expect(hostOf(TASK_URLS[0])).assertEqual(hostOf(TASK_URLS[2]));
    });

    /**
     * @tc.name   duplicateDetectionFindsRepeatedLiterals
     * @tc.desc   A synthetic list that repeats a URL is reported as duplicated by the helper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateDetectionFindsRepeatedLiterals', 0, () => {
      const repeated: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_A];
      expect(hasDuplicateStrings(repeated)).assertTrue();
      expect(uniqueStrings(repeated).length).assertEqual(2);
      expect(countOf(repeated, URL_TASK_A)).assertEqual(2);
      expect(countOf(repeated, URL_TASK_B)).assertEqual(1);
      expect(countOf(repeated, URL_TASK_C)).assertEqual(0);
      expect(hasDuplicateStrings([URL_TASK_A])).assertFalse();
      expect(hasDuplicateStrings([])).assertFalse();
      const doubled: string[] = TASK_URLS.slice();
      doubled.push(URL_TASK_C);
      expect(hasDuplicateStrings(doubled)).assertTrue();
      expect(uniqueStrings(doubled).length).assertEqual(3);
      expect(doubled.length).assertEqual(4);
    });

    /**
     * @tc.name   compatibilityUniqueStringsKeepsFirstOccurrenceOrder
     * @tc.desc   Deduplication preserves the order in which each value first appeared.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('compatibilityUniqueStringsKeepsFirstOccurrenceOrder', 0, () => {
      const values: string[] = [TASK_B, TASK_A, TASK_B, TASK_C, TASK_A, TASK_C];
      const unique: string[] = uniqueStrings(values);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual(TASK_B);
      expect(unique[1]).assertEqual(TASK_A);
      expect(unique[2]).assertEqual(TASK_C);
      expect(sameStringArray(unique, [TASK_B, TASK_A, TASK_C])).assertTrue();
      expect(sameStringArray(unique, sortedCopy(unique))).assertFalse();
      expect(uniqueStrings(TASK_NUMBERS).length).assertEqual(3);
      expect(uniqueStrings([]).length).assertEqual(0);
    });

    /**
     * @tc.name   sortedAndReversedCopiesDoNotMutateSource
     * @tc.desc   Ordering helpers return new arrays and leave the constant task list untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sortedAndReversedCopiesDoNotMutateSource', 0, () => {
      const source: string[] = [TASK_C, TASK_A, TASK_B];
      const sorted: string[] = sortedCopy(source);
      const reversed: string[] = reversedCopy(source);
      expect(sorted[0]).assertEqual(TASK_A);
      expect(sorted[2]).assertEqual(TASK_C);
      expect(reversed[0]).assertEqual(TASK_B);
      expect(reversed[2]).assertEqual(TASK_C);
      expect(source[0]).assertEqual(TASK_C);
      expect(source[1]).assertEqual(TASK_A);
      expect(sameStringArray(source, reversedCopy(reversed))).assertTrue();
      expect(sorted === source).assertFalse();
      expect(sortedCopy(TASK_NUMBERS)[0]).assertEqual(TASK_A);
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(reversedCopy([]).length).assertEqual(0);
    });

    /**
     * @tc.name   joinedUsesRequestedSeparator
     * @tc.desc   Trace building joins task numbers with the separator the caller chooses.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('joinedUsesRequestedSeparator', 0, () => {
      expect(joined(TASK_NUMBERS, '|')).assertEqual('A|B|C');
      expect(joined(TASK_NUMBERS)).assertEqual('A,B,C');
      expect(joined(TASK_NUMBERS, ' -> ')).assertEqual('A -> B -> C');
      expect(joined([TASK_A], '|')).assertEqual(TASK_A);
      expect(joined([], '|')).assertEqual('');
      expect(joined(TASK_NUMBERS, '|').split('|').length).assertEqual(3);
      expect(joined(TASK_NUMBERS, '|').indexOf(',')).assertEqual(-1);
      expect(joined(TASK_NUMBERS, '').length).assertEqual(3);
      expect(joined(TASK_NUMBERS, '|').startsWith(TASK_A)).assertTrue();
      expect(joined(reversedCopy(TASK_NUMBERS), '|')).assertEqual('C|B|A');
    });

    /**
     * @tc.name   sameStringArrayComparesPositionally
     * @tc.desc   Two lists are equal only when length and every position match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameStringArrayComparesPositionally', 0, () => {
      expect(sameStringArray(TASK_NUMBERS, [TASK_A, TASK_B, TASK_C])).assertTrue();
      expect(sameStringArray(TASK_NUMBERS, [TASK_C, TASK_B, TASK_A])).assertFalse();
      expect(sameStringArray(TASK_NUMBERS, [TASK_A, TASK_B])).assertFalse();
      expect(sameStringArray([TASK_A], [TASK_A, TASK_B])).assertFalse();
      expect(sameStringArray([], [])).assertTrue();
      expect(sameStringArray([], [TASK_A])).assertFalse();
      expect(sameStringArray(sortedCopy(TASK_NUMBERS), TASK_NUMBERS)).assertTrue();
      expect(sameStringArray(reversedCopy(TASK_NUMBERS), TASK_NUMBERS)).assertFalse();
      expect(sameStringArray(uniqueStrings(TASK_NUMBERS), TASK_NUMBERS)).assertTrue();
      expect(sameStringArray([TASK_A, TASK_A], [TASK_A])).assertFalse();
    });

    /**
     * @tc.name   statusConstantsAreDistinct
     * @tc.desc   The four lifecycle status literals are unique strings without shared prefixes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('statusConstantsAreDistinct', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED];
      expect(statuses.length).assertEqual(4);
      expect(hasDuplicateStrings(statuses)).assertFalse();
      expect(uniqueStrings(statuses).length).assertEqual(4);
      expect(STATUS_IDLE).assertEqual('idle');
      expect(STATUS_RUNNING).assertEqual('running');
      expect(STATUS_COMPLETED).assertEqual('completed');
      expect(STATUS_FAILED).assertEqual('failed');
      expect(STATUS_RUNNING === STATUS_IDLE).assertFalse();
      expect(STATUS_COMPLETED === STATUS_FAILED).assertFalse();
      expect(joined(statuses, '|')).assertEqual('idle|running|completed|failed');
      expect(joined(statuses, ',')).assertEqual('idle,running,completed,failed');
      expect(countOf(statuses, STATUS_RUNNING)).assertEqual(1);
      expect(statuses.indexOf(STATUS_FAILED)).assertEqual(3);
      expect(statuses.indexOf(STATUS_IDLE)).assertEqual(0);
      expect(STATUS_COMPLETED.length).assertEqual(9);
      expect(STATUS_IDLE.length < STATUS_RUNNING.length).assertTrue();
      expect(STATUS_FAILED.startsWith('fail')).assertTrue();
    });

    /**
     * @tc.name   terminalStatusAcceptsOnlyFinishedStates
     * @tc.desc   Only completed and failed stop progress; running, idle and unknown labels do not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('terminalStatusAcceptsOnlyFinishedStates', 0, () => {
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
      expect(isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(isTerminalStatus(STATUS_RUNNING)).assertFalse();
      expect(isTerminalStatus(STATUS_IDLE)).assertFalse();
      expect(isTerminalStatus('done')).assertFalse();
      expect(isTerminalStatus('')).assertFalse();
      expect(isTerminalStatus(STATUS_COMPLETED.toUpperCase())).assertFalse();
      expect(STATUS_COMPLETED === STATUS_RUNNING).assertFalse();
      expect(isTerminalStatus(STATUS_COMPLETED) && isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(isTerminalStatus(STATUS_COMPLETED) === isTerminalStatus(STATUS_IDLE)).assertFalse();
    });

    /**
     * @tc.name   progressRatioMatchesPercent
     * @tc.desc   The ratio helper divides by the same total the rows display, giving exact fractions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressRatioMatchesPercent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(25);
      graph.taskAt(1).reportProgress(50);
      graph.taskAt(2).reportProgress(75);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0.25);
      expect(graph.taskAt(1).progressRatio()).assertEqual(0.5);
      expect(graph.taskAt(2).progressRatio()).assertEqual(0.75);
      expect(graph.taskAt(0).progressRatio() * 100).assertEqual(25);
      expect(graph.taskAt(1).progressRatio() * 100).assertEqual(50);
      expect(graph.taskAt(2).progressRatio()).assertLess(1);
      expect(graph.taskAt(2).progressRatio()).assertLarger(0);
      graph.taskAt(0).reportProgress(0);
      expect(graph.taskAt(0).progressRatio()).assertEqual(0.25);
      expect(graph.taskAt(0).progressRatio()).assertLessOrEqual(1);
      expect(graph.taskAt(0).progressRatio()).assertLargerOrEqual(0);
      expect(graph.taskAt(1).progressRatio() + graph.taskAt(2).progressRatio()).assertEqual(1.25);
      expect(graph.taskAt(0).progressRatio()).assertEqual(graph.taskAt(0).progress / PROGRESS_TOTAL);
    });

    /**
     * @tc.name   describeTextShapeIsStable
     * @tc.desc   The diagnostic string is <task>:<status>:<progress> and follows every transition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeTextShapeIsStable', 0, () => {
      const graph = createTaskGraph();
      expect(graph.taskAt(0).describe()).assertEqual('A:idle:0');
      graph.startAll();
      expect(graph.taskAt(0).describe()).assertEqual('A:running:0');
      graph.taskAt(0).reportProgress(42);
      expect(graph.taskAt(0).describe()).assertEqual('A:running:42');
      graph.completeTask(TASK_A);
      expect(graph.taskAt(0).describe()).assertEqual('A:completed:100');
      expect(graph.taskAt(0).describe().split(':').length).assertEqual(3);
      expect(graph.taskAt(0).describe().startsWith(TASK_A + ':')).assertTrue();
      graph.taskAt(1).fail(ERROR_NONE);
      expect(graph.taskAt(1).describe()).assertEqual('B:failed:0');
      expect(graph.snapshotText().split('|').length).assertEqual(3);
      expect(graph.snapshotText().indexOf('A:completed:100') >= 0).assertTrue();
    });

    /**
     * @tc.name   graphIsIndependentOfDeviceContext
     * @tc.desc   The model needs no ability context: two graphs coexist and never share task objects or events.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphIsIndependentOfDeviceContext', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      expect(first.taskAt(0) === second.taskAt(0)).assertFalse();
      expect(first.events === second.events).assertFalse();
      expect(first.lock === second.lock).assertFalse();
      first.startAll();
      first.completeTask(TASK_A);
      first.taskAt(1).reportProgress(88);
      expect(second.taskAt(0).isIdle()).assertTrue();
      expect(second.taskAt(1).progress).assertEqual(0);
      expect(second.events.size()).assertEqual(0);
      expect(second.isTaskFinished).assertTrue();
      expect(first.isTaskFinished).assertFalse();
      expect(first.tasks.length).assertEqual(second.tasks.length);
      expect(first.eventTrace() === second.eventTrace()).assertFalse();
      expect(first.events.countOf('started')).assertEqual(2);
      expect(second.events.countOf('started')).assertEqual(0);
      expect(first.lock.hasShared(TASK_A)).assertFalse();
      expect(first.lock.hasShared(TASK_B)).assertTrue();
      expect(second.lock.hasShared(TASK_A)).assertFalse();
      expect(first.taskAt(1).progress).assertEqual(88);
      expect(second.taskAt(1).progress).assertEqual(0);
      expect(first.taskAt(0).isComplete()).assertTrue();
      expect(second.taskAt(0).isComplete()).assertFalse();
      expect(first.isTaskFinished === second.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   buttonStateDependsOnlyOnFlag
     * @tc.desc   The button helpers are pure functions of isTaskFinished, not of any task status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonStateDependsOnlyOnFlag', 0, () => {
      expect(startButtonEnabled(true)).assertTrue();
      expect(startButtonEnabled(false)).assertFalse();
      expect(startButtonBackground(true)).assertEqual('#409EFF');
      expect(startButtonBackground(false)).assertEqual('#C0C4CC');
      expect(startButtonBackground(true) === startButtonBackground(false)).assertFalse();
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTaskC(100);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
      graph.isTaskFinished = true;
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#409EFF');
    });

    /**
     * @tc.name   longProgressSequenceStaysBounded
     * @tc.desc   Sixty uneven updates never leave the 0..100 window or decrease the visible bar.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longProgressSequenceStaysBounded', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const updates: number[] = [4, 9, 3, 22, 21, 40, 39, 58, 57, 61, 80, 79, 96, 95, 100, 100, 12, 64];
      let highest: number = 0;
      for (let round = 0; round < 3; round++) {
        for (let index = 0; index < updates.length; index++) {
          const value: number = graph.taskAt(0).reportProgress(updates[index]);
          expect(value >= highest).assertTrue();
          expect(value <= PROGRESS_TOTAL).assertTrue();
          expect(value >= PROGRESS_INITIAL).assertTrue();
          highest = value;
        }
      }
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(0).progressRatio()).assertEqual(1);
      expect(highest).assertEqual(100);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 100));
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
    });

    /**
     * @tc.name   compatibilityMatrixAcrossAllTasks
     * @tc.desc   For every task number the config, expectation, label and lifecycle behave the same way.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Compatibility scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('compatibilityMatrixAcrossAllTasks', 0, () => {
      const graph = createTaskGraph();
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const taskNo: string = TASK_NUMBERS[index];
        const config = DownloadConfig.forTask(taskNo);
        const expectation = expectationFor(taskNo);
        const row = graph.taskAt(index);
        expect(config.isValid()).assertTrue();
        expect(config.url).assertEqual(expectation.url);
        expect(expectation.host).assertEqual('gitee.com');
        expect(expectation.extension).assertEqual('.png');
        expect(row.taskNo).assertEqual(taskNo);
        expect(row.label()).assertEqual(progressLabel(taskNo, 0));
        expect(row.start(0)).assertTrue();
        expect(graph.completeTask(taskNo)).assertTrue();
        expect(row.progress).assertEqual(100);
        expect(row.label()).assertEqual(progressLabel(taskNo, 100));
        expect(config.method).assertEqual('GET');
      }
      expect(graph.allCompleted()).assertTrue();
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.averageProgress()).assertEqual(100);
    });

    // End of compatibility suite.
  });
}
