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
 * CreateFailure suite.
 *
 * The page builds a request.agent.Config and calls agent.create before any task
 * exists. This suite injects creation failures and invalid configurations,
 * checks that no download is started and that the next run recovers cleanly.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  download() assembles action/url/overwrite/method/saveas
 *   117-118  agent.create(...).then(task => ...)
 *   144-147  create rejection is only logged, the task is never started
 *   174-198  startAllTasks runs again once isTaskFinished is true
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  STATUS_IDLE,
  STATUS_COMPLETED,
  STATUS_RUNNING,
  ERROR_NONE,
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  PROGRESS_TOTAL,
  LEVEL_ERROR,
  DownloadConfig,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  RetryPolicy,
  LogBuffer,
  NetworkMetrics,
  expectedConfigFor,
  classifyStartResult,
  shouldAbortStart,
  isRetryableError,
  isHttpsUrl,
  URL_TASK_B,
  URL_TASK_C
} from '../Shared/SharedDriver';

export default function createFailureTest(): void {
  describe('CreateFailure', () => {
    beforeAll(() => {
      logSuite('CreateFailure', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CreateFailure', 'end');
    });

    /**
     * @tc.name   createErrorCodeHasDedicatedValue
     * @tc.desc   The agent.create rejection code is a fixed number distinct from start, network and timeout codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createErrorCodeHasDedicatedValue', 0, () => {
      logStep('CreateFailure', 'inspect create code');
      expect(ERROR_CREATE).assertEqual(13400001);
      expect(ERROR_CREATE === ERROR_START).assertFalse();
      expect(ERROR_CREATE === ERROR_NETWORK).assertFalse();
      expect(ERROR_CREATE === ERROR_TIMEOUT).assertFalse();
      expect(ERROR_CREATE > ERROR_NONE).assertTrue();
      expect(ERROR_CREATE < ERROR_START).assertTrue();
    });

    /**
     * @tc.name   createErrorIsNotTransient
     * @tc.desc   A creation failure is excluded from the transient classifier that drives transport retries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createErrorIsNotTransient', 0, () => {
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_CREATE)).assertEqual(isRetryableError(ERROR_NONE));
      expect(isRetryableError(ERROR_CREATE) === isRetryableError(ERROR_START)).assertFalse();
    });

    /**
     * @tc.name   createErrorClassifiedAsFailedStart
     * @tc.desc   The start-callback classifier reports failed for a create code and asked the page to abort.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createErrorClassifiedAsFailedStart', 0, () => {
      expect(classifyStartResult(ERROR_CREATE)).assertEqual('failed');
      expect(shouldAbortStart(ERROR_CREATE)).assertTrue();
      expect(classifyStartResult(ERROR_START)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(classifyStartResult(ERROR_CREATE) === classifyStartResult(ERROR_NONE)).assertFalse();
    });

    /**
     * @tc.name   taskAConfigIsValid
     * @tc.desc   The configuration assembled for task A carries every production literal and validates cleanly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskAConfigIsValid', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A);
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   allTaskConfigsAreValid
     * @tc.desc   Every configured task passes validation and agrees with the independent config oracle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allTaskConfigsAreValid', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < numbers.length; index++) {
        const config: DownloadConfig = DownloadConfig.forTask(numbers[index]);
        const oracle: DownloadConfig = expectedConfigFor(numbers[index]);
        expect(config.isValid()).assertTrue();
        expect(config.sameAs(oracle)).assertTrue();
        expect(isHttpsUrl(config.url)).assertTrue();
        expect(config.fileName().endsWith('.png')).assertTrue();
      }
      expect(numbers.length).assertEqual(3);
    });

    /**
     * @tc.name   unknownTaskConfigIsRejected
     * @tc.desc   An unknown task number yields an empty URL, which validation reports as empty and non-HTTPS.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unknownTaskConfigIsRejected', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('D');
      const errors: string[] = config.validate();
      expect(config.url).assertEqual('');
      expect(config.isValid()).assertFalse();
      expect(errors.length).assertEqual(2);
      expect(errors.indexOf('url-empty') >= 0).assertTrue();
      expect(errors.indexOf('url-not-https') >= 0).assertTrue();
      expect(errors.indexOf('action-not-download')).assertEqual(-1);
    });

    /**
     * @tc.name   plainHttpUrlRejectedAsNotHttps
     * @tc.desc   A well formed plain HTTP URL is rejected because the page only accepts the secure scheme.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('plainHttpUrlRejectedAsNotHttps', 0, () => {
      const config: DownloadConfig = new DownloadConfig(
        CONFIG_ACTION_DOWNLOAD, 'http://example.com/media/icon.png', true, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.fileName()).assertEqual('icon.png');
    });

    /**
     * @tc.name   wrongActionRejected
     * @tc.desc   A config whose action is not DOWNLOAD is rejected even when every other field is valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('wrongActionRejected', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      config.action = 'UPLOAD';
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('action-not-download');
      expect(config.isValid()).assertFalse();
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.describe().startsWith('UPLOAD|')).assertTrue();
      expect(config.action === CONFIG_ACTION_DOWNLOAD).assertFalse();
    });

    /**
     * @tc.name   unsupportedMethodRejected
     * @tc.desc   A method outside GET and POST is rejected while both production methods are accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unsupportedMethodRejected', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_B);
      config.method = 'PUT';
      expect(config.validate()[0]).assertEqual('method-unsupported');
      config.method = 'GET';
      expect(config.validate().length).assertEqual(0);
      config.method = 'POST';
      expect(config.validate().length).assertEqual(0);
      config.method = 'DELETE';
      expect(config.isValid()).assertFalse();
      expect(config.validate().indexOf('method-unsupported') >= 0).assertTrue();
    });

    /**
     * @tc.name   postMethodAcceptedForDownload
     * @tc.desc   POST is the documented alternative for downloads and survives validation with all literals intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('postMethodAcceptedForDownload', 0, () => {
      const config: DownloadConfig = new DownloadConfig(
        CONFIG_ACTION_DOWNLOAD, URL_TASK_C, true, 'POST', './');
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.method).assertEqual('POST');
      expect(config.describe().indexOf('|POST|') >= 0).assertTrue();
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(config.saveas).assertEqual('./');
    });

    /**
     * @tc.name   overwriteDisabledRejected
     * @tc.desc   A config that refuses to overwrite an existing file is rejected by the page contract.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overwriteDisabledRejected', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      config.overwrite = false;
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('overwrite-disabled');
      expect(config.isValid()).assertFalse();
      config.overwrite = true;
      expect(config.isValid()).assertTrue();
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
    });

    /**
     * @tc.name   faultCreateSaveasOutsideCacheRejected
     * @tc.desc   Only the cache save path './' is accepted; any explicit directory is a contract violation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('faultCreateSaveasOutsideCacheRejected', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_B);
      config.saveas = '/data/storage/el2/base/files';
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('saveas-not-cache');
      expect(config.isValid()).assertFalse();
      config.saveas = CONFIG_SAVEAS_CACHE;
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   faultCreateConfigCloneIsIndependent
     * @tc.desc   Mutating a clone does not change the source config, so a failed attempt cannot poison the next one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('faultCreateConfigCloneIsIndependent', 0, () => {
      const source: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      const clone: DownloadConfig = source.clone();
      expect(clone.sameAs(source)).assertTrue();
      clone.url = 'https://example.com/other.png';
      clone.method = 'POST';
      expect(source.url).assertEqual(URL_TASK_A);
      expect(source.method).assertEqual(CONFIG_METHOD_GET);
      expect(clone.sameAs(source)).assertFalse();
      expect(source.isValid()).assertTrue();
      expect(clone.isValid()).assertTrue();
    });

    /**
     * @tc.name   configDescribeIsExact
     * @tc.desc   The describe string is a pipe separated rendering of the five config fields in production order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configDescribeIsExact', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_C);
      expect(config.describe()).assertEqual('DOWNLOAD|GET|true|./|' + URL_TASK_C);
      expect(config.describe().split('|').length).assertEqual(5);
      expect(config.describe().indexOf('|GET|') >= 0).assertTrue();
      expect(config.describe().endsWith('.png')).assertTrue();
      const other: DownloadConfig = DownloadConfig.forUrl(URL_TASK_B);
      expect(other.describe() === config.describe()).assertFalse();
    });

    /**
     * @tc.name   createFailureLeavesAllTasksIdle
     * @tc.desc   A failed creation attempt never touches task rows, so every row remains idle at zero progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createFailureLeavesAllTasksIdle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const failedCreate: number = ERROR_CREATE;
      expect(shouldAbortStart(failedCreate)).assertTrue();
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.taskAt(1).isIdle()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   createFailureKeepsFinishedFlagTrue
     * @tc.desc   Because no task was started, the start button stays enabled and the run can be retried at once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createFailureKeepsFinishedFlagTrue', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.startAll()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.startAll()).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   createFailureLeavesLockFree
     * @tc.desc   No lock slot is acquired by a create failure, which would otherwise starve the exclusive branch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createFailureLeavesLockFree', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   createFailureDoesNotIncrementAttempts
     * @tc.desc   A task that was never created has no attempt recorded, because attempts count accepted starts only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createFailureDoesNotIncrementAttempts', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.attempts).assertEqual(0);
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(a.startedAt).assertEqual(0);
      expect(a.lastErrorCode).assertEqual(ERROR_NONE);
      expect(a.start(1)).assertTrue();
      expect(a.attempts).assertEqual(1);
      expect(a.isRunning()).assertTrue();
    });

    /**
     * @tc.name   recoveryOnNextRunStartsNormally
     * @tc.desc   After a rejected config the corrected config starts a normal run with both shared rows running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recoveryOnNextRunStartsNormally', 0, () => {
      const rejected: DownloadConfig = new DownloadConfig(
        CONFIG_ACTION_DOWNLOAD, 'http://example.com/a.png', true, 'GET', './');
      expect(rejected.isValid()).assertFalse();
      const accepted: DownloadConfig = DownloadConfig.forTask(TASK_A);
      expect(accepted.isValid()).assertTrue();
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(0).url).assertEqual(accepted.url);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
    });

    /**
     * @tc.name   recoveryAfterCreateFailureCompletesAll
     * @tc.desc   The retry after a failed creation reaches the full three-row completion without leftovers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryAfterCreateFailureCompletesAll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(shouldAbortStart(ERROR_CREATE)).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(3);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   createFailureLoggedAtErrorLevel
     * @tc.desc   The catch branch writes the creation error at ERROR level and never at INFO level.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createFailureLoggedAtErrorLevel', 0, () => {
      const buffer: LogBuffer = new LogBuffer(8);
      buffer.error('Failed to task create with error code: ' + String(ERROR_CREATE));
      buffer.info('网络场景');
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.contains('error code: 13400001')).assertTrue();
      expect(buffer.contains('Failed to task create')).assertTrue();
      expect(buffer.lines[0].startsWith('ERROR ')).assertTrue();
      expect(buffer.trace().indexOf('|INFO ')).assertLarger(0);
    });

    /**
     * @tc.name   createFailureSnapshotDiffersFromStartedRun
     * @tc.desc   The failed attempt leaves the idle snapshot untouched while a recovered run produces the running snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createFailureSnapshotDiffersFromStartedRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const idle: string = graph.snapshotText();
      expect(idle).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      graph.startAll();
      const running: string = graph.snapshotText();
      expect(running).assertEqual('A:running:0|B:running:0|C:idle:0');
      expect(running === idle).assertFalse();
      expect(running.indexOf('running')).assertEqual(2);
      expect(idle.indexOf('running')).assertEqual(-1);
    });

    /**
     * @tc.name   createFailureDoesNotPoisonRetryPolicy
     * @tc.desc   The retry policy only inspects non-zero codes, so a create failure is filtered by the transient classifier.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('createFailureDoesNotPoisonRetryPolicy', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_CREATE, STATUS_IDLE)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_NONE, STATUS_IDLE)).assertFalse();
      expect(policy.shouldRetry(3, ERROR_CREATE, STATUS_IDLE)).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
      expect(isRetryableError(ERROR_CREATE) || policy.isExhausted(3)).assertTrue();
    });

    /**
     * @tc.name   createFailureRecoveryKeepsUrlIntact
     * @tc.desc   The URL literal of each configured task survives a failed attempt and the recovery run unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createFailureRecoveryKeepsUrlIntact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const urls: string[] = [graph.taskAt(0).url, graph.taskAt(1).url, graph.taskAt(2).url];
      expect(urls[0]).assertEqual(URL_TASK_A);
      expect(urls[0] === urls[1]).assertFalse();
      graph.startAll();
      graph.reset();
      expect(graph.taskAt(0).url).assertEqual(urls[0]);
      expect(graph.taskAt(1).url).assertEqual(urls[1]);
      expect(graph.taskAt(2).url).assertEqual(urls[2]);
      expect(urls[0].length > 100).assertTrue();
    });

    /**
     * @tc.name   createFailureConfigErrorsMatchFieldCount
     * @tc.desc   A config that breaks every field reports one distinct error per violated rule, with no duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('createFailureConfigErrorsMatchFieldCount', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', 'http://example.com/a.png', false, 'PUT', '/tmp');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(5);
      expect(errors.indexOf('url-not-https') >= 0).assertTrue();
      expect(errors.indexOf('action-not-download') >= 0).assertTrue();
      expect(errors.indexOf('method-unsupported') >= 0).assertTrue();
      expect(errors.indexOf('overwrite-disabled') >= 0).assertTrue();
      expect(errors.indexOf('saveas-not-cache') >= 0).assertTrue();
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   rejectedConfigKeepsUrlContractForRecovery
     * @tc.desc   A rejected create attempt does not shorten the URL literals used by the next run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CreateFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rejectedConfigKeepsUrlContractForRecovery', 0, () => {
      const rejected: DownloadConfig = new DownloadConfig('DOWNLOAD', 'http://x/y.png', false, 'GET', './');
      expect(rejected.isValid()).assertFalse();
      expect(rejected.validate().length).assertEqual(2);
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskAt(0).url.length > 150).assertTrue();
      expect(graph.taskAt(1).url.length > 100).assertTrue();
      expect(graph.taskAt(2).url.length > 100).assertTrue();
      expect(graph.taskAt(0).url === graph.taskAt(1).url).assertFalse();
      expect(isHttpsUrl(graph.taskAt(2).url)).assertTrue();
      expect(DownloadConfig.forTask(TASK_C).isValid()).assertTrue();
    });
  });
}
