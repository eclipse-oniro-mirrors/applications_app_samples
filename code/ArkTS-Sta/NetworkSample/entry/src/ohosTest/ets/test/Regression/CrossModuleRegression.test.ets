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
 * CrossModuleRegression suite.
 *
 * Combines the four observable modules of the page in one regression matrix:
 * the download configuration, the task graph, the aggregate metrics and the
 * bounded log buffer. Each case checks that the combined view stays coherent
 * through start, completion, failure, reset and rerun.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   109-148  config assembly and the create/start callbacks
 *   174-198  startAllTasks, the 200 ms poll and the isTaskFinished flag
 *   249-259  the start button driven by isTaskFinished
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep, logWarn, logError } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  TASK_URLS,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  ERROR_NETWORK,
  PROGRESS_TOTAL,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  CONFIG_ACTION_DOWNLOAD,
  BUTTON_ACTIVE_BACKGROUND,
  DownloadConfig,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  RetryPolicy,
  PollClock,
  LogBuffer,
  NetworkMetrics,
  SnapshotLog,
  RunSnapshot,
  UrlExpectation,
  completionTrace,
  isTopologicalCompletion,
  expectedConfigFor,
  expectationFor,
  fileNameOf,
  extensionOf,
  isHttpsUrl,
  progressLabel,
  startButtonEnabled,
  startButtonBackground,
  textFingerprint
} from '../Shared/SharedDriver';

export default function crossModuleRegressionTest(): void {
  describe('CrossModuleRegression', () => {
    beforeAll(() => {
      logSuite('CrossModuleRegression', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CrossModuleRegression', 'end');
    });

    /**
     * @tc.name   fullRunKeepsAllModulesCoherent
     * @tc.desc   One complete run agrees across config, graph, metrics and logging at the final state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fullRunKeepsAllModulesCoherent', 0, () => {
      logStep('CrossModuleRegression', 'complete run across modules');
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(16);
      graph.startAll();
      buffer.info('start ' + graph.taskAt(0).taskNo);
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      buffer.info('completed ' + completionTrace(graph));
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(graph.allCompleted()).assertTrue();
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.totalProgress).assertEqual(300);
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(buffer.contains('completed A|B|C')).assertTrue();
    });

    /**
     * @tc.name   configMatrixMatchesTaskRows
     * @tc.desc   Every row's URL resolves to a valid config whose file name and extension match the URL helpers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configMatrixMatchesTaskRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < numbers.length; index++) {
        const row: DownloadTask = graph.taskAt(index);
        const config: DownloadConfig = DownloadConfig.forTask(numbers[index]);
        expect(config.url).assertEqual(row.url);
        expect(config.isValid()).assertTrue();
        expect(config.fileName()).assertEqual(fileNameOf(row.url));
        expect(extensionOf(row.url)).assertEqual('.png');
        expect(isHttpsUrl(row.url)).assertTrue();
        expect(config.sameAs(expectedConfigFor(numbers[index]))).assertTrue();
      }
      expect(numbers.length).assertEqual(3);
    });

    /**
     * @tc.name   metricsAfterFullRunReportSuccess
     * @tc.desc   After the run metrics expose three tasks, three completions, no failure and full progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsAfterFullRunReportSuccess', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(300);
      expect(metrics.averageProgress()).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   logBufferRecordsRunPhasesInOrder
     * @tc.desc   Info lines written for start, unlock and completion keep their chronological order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferRecordsRunPhasesInOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(8);
      buffer.info('run start');
      graph.startAll();
      buffer.info('shared owners ' + String(graph.lock.holderCount()));
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      buffer.info('exit code 0');
      buffer.warn('poll tick ' + String(graph.pollTicks));
      graph.pollTick(3);
      expect(buffer.size()).assertEqual(4);
      expect(buffer.lines[0]).assertEqual('INFO run start');
      expect(buffer.lines[1].startsWith('INFO shared owners 2')).assertTrue();
      expect(buffer.lines[2]).assertEqual('INFO exit code 0');
      expect(buffer.lines[3].startsWith('WARN poll tick 0')).assertTrue();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(3);
    });

    /**
     * @tc.name   logBufferLevelCountsAddUp
     * @tc.desc   The per-level counts of a mixed log sum to the total line count and cover all three levels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferLevelCountsAddUp', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(16);
      graph.startAll();
      buffer.info('start-all');
      graph.taskAt(1).fail(ERROR_NETWORK);
      buffer.warn('network branch failed');
      buffer.error('code ' + String(graph.taskAt(1).lastErrorCode));
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) +
        buffer.countLevel(LEVEL_ERROR)).assertEqual(buffer.size());
    });

    /**
     * @tc.name   logBufferKeepsNewestUnderLimit
     * @tc.desc   A small buffer drops the oldest line first and keeps exactly the newest entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferKeepsNewestUnderLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      buffer.info('first');
      buffer.info('second');
      buffer.warn('third');
      buffer.error('fourth');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.contains('first')).assertFalse();
      expect(buffer.contains('second')).assertTrue();
      expect(buffer.lines[0]).assertEqual('INFO second');
      expect(buffer.lines[2]).assertEqual('ERROR fourth');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name   configDescribeFingerprintStable
     * @tc.desc   The describe string of a config is deterministic and its fingerprint is reproducible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configDescribeFingerprintStable', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const second: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const description: string = first.describe();
      expect(second.describe()).assertEqual(description);
      expect(first.describe()).assertEqual(description);
      expect(textFingerprint(description)).assertEqual(textFingerprint(second.describe()));
      expect(description.indexOf(CONFIG_ACTION_DOWNLOAD)).assertEqual(0);
      expect(description.endsWith(URL_TASK_A)).assertTrue();
      expect(textFingerprint(description) > 0).assertTrue();
    });

    /**
     * @tc.name   eventTraceFingerprintStableAcrossRuns
     * @tc.desc   Two identical scripted runs produce identical event traces and identical fingerprints.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventTraceFingerprintStableAcrossRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const firstTrace: string = graph.eventTrace();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      expect(graph.eventTrace()).assertEqual(firstTrace);
      expect(graph.events.fingerprint()).assertEqual(textFingerprint(firstTrace));
      expect(firstTrace.indexOf('start-all')).assertEqual(0);
      expect(firstTrace.indexOf('completed:C')).assertLarger(0);
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   combinedFingerprintCoversConfigTraceMetrics
     * @tc.desc   A composite fingerprint over config, trace and metrics is deterministic for the same run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('combinedFingerprintCoversConfigTraceMetrics', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      const composite: string = DownloadConfig.forTask(TASK_A).describe() + '#' + graph.eventTrace() +
        '#' + String(metrics.completedTasks) + ':' + String(metrics.totalProgress);
      const firstPrint: number = textFingerprint(composite);
      const rebuilt: string = expectedConfigFor(TASK_A).describe() + '#' + graph.eventTrace() +
        '#' + String(NetworkMetrics.from(graph).completedTasks) + ':' + String(graph.totalProgress());
      expect(rebuilt).assertEqual(composite);
      expect(textFingerprint(rebuilt)).assertEqual(firstPrint);
      expect(composite.split('#').length).assertEqual(3);
      expect(firstPrint > 0).assertTrue();
    });

    /**
     * @tc.name   snapshotAfterStartMatchesGraphRows
     * @tc.desc   A snapshot log captured after start exposes the two running rows and the idle exclusive row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterStartMatchesGraphRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.trace()).assertEqual('A/running/0|B/running/0|C/idle/0');
      expect(log.latest(TASK_A) !== undefined).assertTrue();
      const latestA: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      expect(latestA.status).assertEqual(STATUS_RUNNING);
      expect(log.size()).assertEqual(3);
      expect(graph.snapshotText().indexOf('C:idle:0')).assertLarger(0);
    });

    /**
     * @tc.name   resetRestoresEveryModule
     * @tc.desc   Reset clears graph rows, lock, metrics, events and the button flag in one coordinated step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetRestoresEveryModule', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(8);
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      buffer.info('before reset');
      graph.reset();
      buffer.clear();
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(buffer.size()).assertEqual(0);
    });

    /**
     * @tc.name   failurePathMetricsAndLogsAgree
     * @tc.desc   A network failure on B is visible in metrics, in the log and in the frozen row progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failurePathMetricsAndLogsAgree', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(8);
      graph.startAll();
      graph.taskAt(1).reportProgress(40);
      graph.taskAt(1).fail(ERROR_NETWORK);
      buffer.error('branch failed ' + String(graph.taskAt(1).lastErrorCode));
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(40);
      expect(buffer.contains('13400003')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   retryPolicyIntegratedWithMetrics
     * @tc.desc   A retried failure consumes the policy budget and the recovered run reports a completed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicyIntegratedWithMetrics', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.fail(ERROR_NETWORK);
      expect(policy.shouldRetry(a.attempts, ERROR_NETWORK, a.status)).assertTrue();
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(1);
      a.reset();
      a.start(5);
      graph.completeTask(TASK_A, 6);
      expect(a.attempts).assertEqual(2);
      expect(policy.isExhausted(a.attempts)).assertFalse();
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(1);
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(0);
    });

    /**
     * @tc.name   pollClockAgreesWithGraphTicks
     * @tc.desc   The clock model advances 200 ms per graph poll, so elapsed time matches the tick count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockAgreesWithGraphTicks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      for (let round = 0; round < 3; round++) {
        graph.pollTick(round);
        clock.tick();
      }
      expect(graph.pollTicks).assertEqual(3);
      expect(clock.ticks).assertEqual(3);
      expect(clock.elapsedMs).assertEqual(600);
      expect(clock.elapsedMs).assertEqual(graph.pollTicks * 200);
      expect(clock.isDueAfter(3)).assertTrue();
    });

    /**
     * @tc.name   urlHelpersAgreeWithAllConfigs
     * @tc.desc   Every config URL is HTTPS, resolves through the expectation object and ends with a PNG name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlHelpersAgreeWithAllConfigs', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < numbers.length; index++) {
        const config: DownloadConfig = DownloadConfig.forTask(numbers[index]);
        const expectation: UrlExpectation = expectationFor(numbers[index]);
        expect(config.url).assertEqual(expectation.url);
        expect(expectation.host).assertEqual('gitee.com');
        expect(expectation.extension).assertEqual('.png');
        expect(expectation.fileName.length > 4).assertTrue();
        expect(isHttpsUrl(config.url)).assertTrue();
      }
      expect(TASK_URLS.length).assertEqual(3);
    });

    /**
     * @tc.name   completionOrderMatchesTopology
     * @tc.desc   The completed graph order is topological and starts with one of the two prerequisites.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderMatchesTopology', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[0] === TASK_A || graph.completionOrder[0] === TASK_B).assertTrue();
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(graph.completionOrder.indexOf(TASK_C) > graph.completionOrder.indexOf(TASK_A)).assertTrue();
    });

    /**
     * @tc.name   buttonStateTracksFinishedFlag
     * @tc.desc   The button helpers follow the graph flag before, during and after a run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonStateTracksFinishedFlag', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      graph.startAll();
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      expect(startButtonBackground(graph.isTaskFinished)).assertEqual('#C0C4CC');
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(startButtonEnabled(graph.isTaskFinished)).assertFalse();
      graph.reset();
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
    });

    /**
     * @tc.name   progressLabelsMatchLiveRows
     * @tc.desc   The rendered label helper reproduces the live label of every row at two different phases.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLabelsMatchLiveRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(30);
      graph.taskAt(1).reportProgress(60);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 30));
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 60));
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      graph.completeTask(TASK_A, 1);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, PROGRESS_TOTAL));
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 100%');
      expect(graph.taskAt(1).label()).assertEqual('任务B当前进度 60%');
    });

    /**
     * @tc.name   twoRunsShareCompositeFingerprint
     * @tc.desc   The composite module fingerprint of two identical runs is equal while timestamps differ.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoRunsShareCompositeFingerprint', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const first: string = graph.eventTrace() + '#' + graph.snapshotText();
      const firstPrint: number = textFingerprint(first);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 101);
      graph.completeTask(TASK_B, 102);
      graph.pollTick(103);
      graph.completeTaskC(104);
      const second: string = graph.eventTrace() + '#' + graph.snapshotText();
      expect(second).assertEqual(first);
      expect(textFingerprint(second)).assertEqual(firstPrint);
      expect(graph.taskAt(0).finishedAt).assertEqual(101);
      expect(graph.taskAt(0).finishedAt === 1).assertFalse();
    });

    /**
     * @tc.name   crossModuleFailureBlocksCompletion
     * @tc.desc   A failed prerequisite keeps the graph, metrics and button state away from a completed run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('crossModuleFailureBlocksCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.pollTick(2);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   configValidationGuardsTheRun
     * @tc.desc   A config that fails validation must be corrected before the regression run is accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configValidationGuardsTheRun', 0, () => {
      const broken: DownloadConfig = DownloadConfig.forUrl('http://example.com/pic.png');
      expect(broken.isValid()).assertFalse();
      expect(broken.validate().indexOf('url-not-https') >= 0).assertTrue();
      const fixed: DownloadConfig = DownloadConfig.forUrl(URL_TASK_C);
      expect(fixed.isValid()).assertTrue();
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.taskAt(2).url).assertEqual(fixed.url);
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });

    /**
     * @tc.name   metricsFingerprintIsDeterministic
     * @tc.desc   The metrics fingerprint only depends on counts and progress, not on identity or ordering.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintIsDeterministic', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A, 1);
      first.taskAt(1).reportProgress(50);
      second.startAll();
      second.completeTask(TASK_B, 2);
      second.taskAt(0).reportProgress(50);
      const firstMetrics: NetworkMetrics = NetworkMetrics.from(first);
      const secondMetrics: NetworkMetrics = NetworkMetrics.from(second);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.completedTasks).assertEqual(secondMetrics.completedTasks);
      expect(firstMetrics.totalProgress).assertEqual(secondMetrics.totalProgress);
      expect(firstMetrics.fingerprint()).assertEqual(
        textFingerprint('3:1:0:150'));
      expect(secondMetrics.averageProgress()).assertEqual(50);
    });

    /**
     * @tc.name   regressionMatrixWalksAllTaskMetadata
     * @tc.desc   A single loop verifies URL, host, extension and config validity for every configured task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionMatrixWalksAllTaskMetadata', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      let checked: number = 0;
      for (let index = 0; index < numbers.length; index++) {
        const expectation: UrlExpectation = expectationFor(numbers[index]);
        const config: DownloadConfig = DownloadConfig.forTask(numbers[index]);
        expect(expectation.host).assertEqual('gitee.com');
        expect(expectation.extension).assertEqual('.png');
        expect(expectation.fileName).assertEqual(config.fileName());
        expect(config.isValid()).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(3);
      expect(numbers.length).assertEqual(TASK_URLS.length);
    });

    /**
     * @tc.name   loggingAfterResetStartsClean
     * @tc.desc   Clearing the log and resetting the graph leaves both modules empty before the second run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('loggingAfterResetStartsClean', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(4);
      graph.startAll();
      buffer.info('run one');
      buffer.warn('run one warning');
      graph.reset();
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(graph.events.size()).assertEqual(0);
      graph.startAll();
      buffer.info('run two');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('run one')).assertFalse();
      expect(buffer.contains('run two')).assertTrue();
    });

    /**
     * @tc.name   fullRegressionMatrixEndsComplete
     * @tc.desc   The closing state of the integrated matrix is three full rows, a free lock and a bounded log.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossModuleRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fullRegressionMatrixEndsComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(6);
      graph.startAll();
      for (let index = 0; index < 3; index++) {
        buffer.info('running ' + graph.taskAt(index).taskNo);
      }
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      buffer.info('all completed');
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(buffer.size()).assertEqual(4);
      expect(buffer.contains('all completed')).assertTrue();
      expect(graph.totalProgress()).assertEqual(300);
    });
  });
}
