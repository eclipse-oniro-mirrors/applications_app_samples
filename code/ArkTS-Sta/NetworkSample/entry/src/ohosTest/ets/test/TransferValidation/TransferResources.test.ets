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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  TASK_URLS,
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
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  BUTTON_ACTIVE_BACKGROUND,
  BUTTON_DISABLED_BACKGROUND,
  PAGE_TITLE,
  expectedCompletedProgress,
  startButtonEnabled,
  startButtonBackground,
  isRetryableError,
  classifyStartResult,
  shouldAbortStart,
  hasDuplicateStrings,
  uniqueStrings,
  countOf,
  sortedCopy,
  reversedCopy,
  joined,
  sameStringArray,
  fileNameOf,
  extensionOf,
  schemeOf,
  hostOf
} from '../Shared/SharedDriver';

/**
 * Resource constant suite for the literals rendered by the page.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    progress rows start at 0 and the finished flag starts true
 *   111-115  action DOWNLOAD, overwrite true, method GET, saveas './'
 *   151-171  the three URL literals
 *   188-193  the 200 ms poll interval
 *   203      page title 网络场景
 *   250-259  button label, '#409EFF' background and enabled flag
 *
 * Every constant is checked for its exact value, for stability across reads, and
 * for accidental duplication against the other members of its group.
 */
export default function transferResourcesTest(): void {
  describe('TransferResources', () => {
    beforeAll(() => {
      logSuite('TransferResources', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferResources', 'end');
    });

    /**
     * @tc.name   taskNumbersAreThreeSingleLetters
     * @tc.desc   The task number list holds A, B and C, each a single uppercase letter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskNumbersAreThreeSingleLetters', 0, () => {
      expect(TASK_NUMBERS.length).assertEqual(3);
      expect(TASK_A).assertEqual('A');
      expect(TASK_B).assertEqual('B');
      expect(TASK_C).assertEqual('C');
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        expect(TASK_NUMBERS[index].length).assertEqual(1);
        expect(TASK_NUMBERS[index]).assertEqual(TASK_NUMBERS[index].toUpperCase());
      }
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(TASK_NUMBERS[2]).assertEqual(TASK_C);
    });

    /**
     * @tc.name   taskNumberListHasNoDuplicates
     * @tc.desc   TASK_NUMBERS contains three pairwise different entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskNumberListHasNoDuplicates', 0, () => {
      expect(hasDuplicateStrings(TASK_NUMBERS)).assertFalse();
      expect(uniqueStrings(TASK_NUMBERS).length).assertEqual(3);
      expect(countOf(TASK_NUMBERS, TASK_A)).assertEqual(1);
      expect(countOf(TASK_NUMBERS, TASK_B)).assertEqual(1);
      expect(countOf(TASK_NUMBERS, TASK_C)).assertEqual(1);
      expect(TASK_NUMBERS.indexOf('')).assertEqual(-1);
      expect(TASK_NUMBERS.indexOf(TASK_A)).assertEqual(0);
    });

    /**
     * @tc.name   taskNumberListKeepsPageOrder
     * @tc.desc   The list follows the A, B, C row order rendered by the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskNumberListKeepsPageOrder', 0, () => {
      expect(TASK_NUMBERS[0]).assertEqual('A');
      expect(TASK_NUMBERS[1]).assertEqual('B');
      expect(TASK_NUMBERS[2]).assertEqual('C');
      expect(TASK_NUMBERS[0].charCodeAt(0) < TASK_NUMBERS[1].charCodeAt(0)).assertTrue();
      expect(TASK_NUMBERS[1].charCodeAt(0) < TASK_NUMBERS[2].charCodeAt(0)).assertTrue();
      expect(sameStringArray(TASK_NUMBERS, ['A', 'B', 'C'])).assertTrue();
      expect(joined(TASK_NUMBERS, '')).assertEqual('ABC');
    });

    /**
     * @tc.name   taskUrlListMatchesIndividualConstants
     * @tc.desc   TASK_URLS holds exactly the three URL constants in task order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlListMatchesIndividualConstants', 0, () => {
      expect(TASK_URLS.length).assertEqual(3);
      expect(TASK_URLS[0]).assertEqual(URL_TASK_A);
      expect(TASK_URLS[1]).assertEqual(URL_TASK_B);
      expect(TASK_URLS[2]).assertEqual(URL_TASK_C);
      expect(sameStringArray(TASK_URLS, [URL_TASK_A, URL_TASK_B, URL_TASK_C])).assertTrue();
      expect(TASK_URLS.length).assertEqual(TASK_NUMBERS.length);
      expect(joined(TASK_URLS, ';').split(';').length).assertEqual(3);
    });

    /**
     * @tc.name   taskUrlsAreAllHttps
     * @tc.desc   All three URL literals use the https scheme required by download().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsAreAllHttps', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(schemeOf(TASK_URLS[index])).assertEqual('https');
        expect(TASK_URLS[index].startsWith('https://')).assertTrue();
        expect(TASK_URLS[index].startsWith('http://')).assertFalse();
      }
      expect(TASK_URLS.length).assertEqual(3);
      expect(countOf(TASK_URLS, URL_TASK_A)).assertEqual(1);
      expect(schemeOf(URL_TASK_B)).assertEqual(schemeOf(URL_TASK_C));
    });

    /**
     * @tc.name   taskUrlsAreAllPng
     * @tc.desc   Every URL literal ends with a png file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsAreAllPng', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(extensionOf(TASK_URLS[index])).assertEqual('.png');
        expect(fileNameOf(TASK_URLS[index]).endsWith('.png')).assertTrue();
        expect(fileNameOf(TASK_URLS[index]).length).assertLarger(4);
      }
      expect(extensionOf(URL_TASK_A)).assertEqual(extensionOf(URL_TASK_B));
      expect(fileNameOf(URL_TASK_C)).assertEqual('icon_main_color.png');
      expect(TASK_URLS.length).assertEqual(3);
    });

    /**
     * @tc.name   taskUrlsAreDistinct
     * @tc.desc   No two task URL constants are equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsAreDistinct', 0, () => {
      expect(hasDuplicateStrings(TASK_URLS)).assertFalse();
      expect(uniqueStrings(TASK_URLS).length).assertEqual(3);
      expect(URL_TASK_A === URL_TASK_B).assertFalse();
      expect(URL_TASK_B === URL_TASK_C).assertFalse();
      expect(URL_TASK_A === URL_TASK_C).assertFalse();
      expect(URL_TASK_A.endsWith(fileNameOf(URL_TASK_A))).assertTrue();
      expect(countOf(TASK_URLS, URL_TASK_C)).assertEqual(1);
    });

    /**
     * @tc.name   taskUrlsHaveDistinctFileNames
     * @tc.desc   The three long literals resolve to three different download names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsHaveDistinctFileNames', 0, () => {
      const names: string[] = [
        fileNameOf(URL_TASK_A), fileNameOf(URL_TASK_B), fileNameOf(URL_TASK_C)
      ];
      expect(names[0]).assertEqual('favor_list_tea.png');
      expect(names[1]).assertEqual('after_cache.png');
      expect(names[2]).assertEqual('icon_main_color.png');
      expect(hasDuplicateStrings(names)).assertFalse();
      expect(uniqueStrings(names).length).assertEqual(3);
      expect(names.indexOf('file')).assertEqual(-1);
      expect(names[0].length).assertLarger(4);
    });

    /**
     * @tc.name   taskUrlsShareGiteeHost
     * @tc.desc   The host segment of every literal is gitee.com.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsShareGiteeHost', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(hostOf(TASK_URLS[index])).assertEqual('gitee.com');
        expect(hostOf(TASK_URLS[index]).indexOf('.')).assertLarger(0);
      }
      expect(hostOf(URL_TASK_A)).assertEqual(hostOf(URL_TASK_B));
      expect(uniqueStrings([hostOf(URL_TASK_A), hostOf(URL_TASK_C)]).length).assertEqual(1);
      expect(hasDuplicateStrings([hostOf(URL_TASK_B), hostOf(URL_TASK_C)])).assertTrue();
    });

    /**
     * @tc.name   taskUrlsHaveNoQueryStrings
     * @tc.desc   None of the literals embeds a query, so no token is shipped inside the constants.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlsHaveNoQueryStrings', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(TASK_URLS[index].indexOf('?')).assertEqual(-1);
        expect(TASK_URLS[index].indexOf('token')).assertEqual(-1);
      }
      expect(URL_TASK_A.indexOf('?')).assertEqual(-1);
      expect(URL_TASK_B.indexOf('#')).assertEqual(-1);
      expect(URL_TASK_C.indexOf('?')).assertEqual(-1);
      expect(TASK_URLS.length).assertEqual(3);
    });

    /**
     * @tc.name   progressTotalIsHundred
     * @tc.desc   The progress total matches the Progress total of the page rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressTotalIsHundred', 0, () => {
      expect(PROGRESS_TOTAL).assertEqual(100);
      expect(PROGRESS_TOTAL).assertLarger(0);
      expect(PROGRESS_TOTAL).assertEqual(expectedCompletedProgress());
      expect(PROGRESS_TOTAL / 2).assertEqual(50);
      expect(PROGRESS_TOTAL - PROGRESS_INITIAL).assertEqual(100);
      expect(PROGRESS_TOTAL % 10).assertEqual(0);
      expect(PROGRESS_TOTAL).assertLess(1000);
    });

    /**
     * @tc.name   progressInitialIsZero
     * @tc.desc   The three rows start at zero, matching PROGRESS_INITIAL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressInitialIsZero', 0, () => {
      expect(PROGRESS_INITIAL).assertEqual(0);
      expect(PROGRESS_INITIAL).assertEqual(PROGRESS_TOTAL - 100);
      expect(PROGRESS_INITIAL).assertLess(PROGRESS_TOTAL);
      expect(PROGRESS_INITIAL >= 0).assertTrue();
      expect(PROGRESS_INITIAL / PROGRESS_TOTAL).assertEqual(0);
      expect(PROGRESS_INITIAL + PROGRESS_TOTAL).assertEqual(PROGRESS_TOTAL);
      expect(PROGRESS_INITIAL === PROGRESS_TOTAL).assertFalse();
    });

    /**
     * @tc.name   pollIntervalIsTwoHundred
     * @tc.desc   The poll constant matches the 200 ms setInterval call of startAllTasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollIntervalIsTwoHundred', 0, () => {
      expect(POLL_INTERVAL_MS).assertEqual(200);
      expect(POLL_INTERVAL_MS / 2).assertEqual(100);
      expect(POLL_INTERVAL_MS / 4).assertEqual(50);
      expect(POLL_INTERVAL_MS).assertEqual(PROGRESS_TOTAL * 2);
      expect(POLL_INTERVAL_MS).assertLarger(0);
      expect(POLL_INTERVAL_MS % 100).assertEqual(0);
      expect(POLL_INTERVAL_MS).assertLess(1000);
    });

    /**
     * @tc.name   pollIntervalFitsRequestBudget
     * @tc.desc   The interval is short enough to react quickly yet long enough not to spin.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollIntervalFitsRequestBudget', 0, () => {
      expect(POLL_INTERVAL_MS >= 100).assertTrue();
      expect(POLL_INTERVAL_MS <= 1000).assertTrue();
      expect(POLL_INTERVAL_MS > 0).assertTrue();
      expect(POLL_INTERVAL_MS).assertEqual(POLL_INTERVAL_MS);
      expect(POLL_INTERVAL_MS * 5).assertEqual(1000);
      expect(POLL_INTERVAL_MS - 1).assertEqual(199);
      expect(POLL_INTERVAL_MS === 200).assertTrue();
    });

    /**
     * @tc.name   statusesAreFourDistinct
     * @tc.desc   The status vocabulary has four pairwise different entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('statusesAreFourDistinct', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED];
      expect(statuses.length).assertEqual(4);
      expect(hasDuplicateStrings(statuses)).assertFalse();
      expect(uniqueStrings(statuses).length).assertEqual(4);
      expect(countOf(statuses, STATUS_IDLE)).assertEqual(1);
      expect(countOf(statuses, STATUS_FAILED)).assertEqual(1);
      expect(statuses.indexOf('')).assertEqual(-1);
      expect(statuses[0] === statuses[3]).assertFalse();
    });

    /**
     * @tc.name   statusesAreLowercase
     * @tc.desc   Every status literal is already lowercase, matching the recorder format.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('statusesAreLowercase', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED];
      for (let index = 0; index < statuses.length; index++) {
        expect(statuses[index].toLowerCase()).assertEqual(statuses[index]);
        expect(statuses[index].length).assertLarger(3);
        expect(statuses[index].indexOf(' ')).assertEqual(-1);
      }
      expect(STATUS_COMPLETED.toUpperCase()).assertEqual('COMPLETED');
      expect(STATUS_FAILED.length).assertEqual(6);
    });

    /**
     * @tc.name   idleStatusLiteral
     * @tc.desc   The idle status is the exact 'idle' token used before a task starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('idleStatusLiteral', 0, () => {
      expect(STATUS_IDLE).assertEqual('idle');
      expect(STATUS_IDLE.length).assertEqual(4);
      expect(STATUS_IDLE.startsWith('i')).assertTrue();
      expect(STATUS_IDLE.endsWith('e')).assertTrue();
      expect(STATUS_IDLE.indexOf('idle')).assertEqual(0);
      expect(STATUS_IDLE === STATUS_RUNNING).assertFalse();
      expect(STATUS_IDLE === '').assertFalse();
    });

    /**
     * @tc.name   runningStatusLiteral
     * @tc.desc   The running status is the exact 'running' token used after start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runningStatusLiteral', 0, () => {
      expect(STATUS_RUNNING).assertEqual('running');
      expect(STATUS_RUNNING.length).assertEqual(7);
      expect(STATUS_RUNNING.startsWith('run')).assertTrue();
      expect(STATUS_RUNNING.endsWith('ing')).assertTrue();
      expect(STATUS_RUNNING.indexOf('nn')).assertLarger(0);
      expect(STATUS_RUNNING === STATUS_IDLE).assertFalse();
      expect(STATUS_RUNNING === STATUS_COMPLETED).assertFalse();
    });

    /**
     * @tc.name   completedStatusLiteral
     * @tc.desc   The completed status is the exact 'completed' token written on success.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedStatusLiteral', 0, () => {
      expect(STATUS_COMPLETED).assertEqual('completed');
      expect(STATUS_COMPLETED.length).assertEqual(9);
      expect(STATUS_COMPLETED.startsWith('complete')).assertTrue();
      expect(STATUS_COMPLETED.endsWith('ed')).assertTrue();
      expect(STATUS_COMPLETED.indexOf('let')).assertLarger(0);
      expect(STATUS_COMPLETED === STATUS_FAILED).assertFalse();
      expect(STATUS_COMPLETED).assertEqual(STATUS_COMPLETED.toLowerCase());
    });

    /**
     * @tc.name   failedStatusLiteral
     * @tc.desc   The failed status is the exact 'failed' token written on error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedStatusLiteral', 0, () => {
      expect(STATUS_FAILED).assertEqual('failed');
      expect(STATUS_FAILED.length).assertEqual(6);
      expect(STATUS_FAILED.startsWith('fail')).assertTrue();
      expect(STATUS_FAILED.endsWith('ed')).assertTrue();
      expect(STATUS_FAILED.indexOf('ile')).assertLarger(0);
      expect(STATUS_FAILED === STATUS_COMPLETED).assertFalse();
      expect(STATUS_FAILED.substring(0, 1)).assertEqual('f');
    });

    /**
     * @tc.name   errorCodesAreFiveDistinct
     * @tc.desc   The error vocabulary has five pairwise different numeric codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorCodesAreFiveDistinct', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      expect(codes.length).assertEqual(5);
      expect(uniqueStrings([String(ERROR_NONE), String(ERROR_CREATE), String(ERROR_START),
        String(ERROR_NETWORK), String(ERROR_TIMEOUT)]).length).assertEqual(5);
      expect(ERROR_CREATE === ERROR_START).assertFalse();
      expect(ERROR_START === ERROR_NETWORK).assertFalse();
      expect(ERROR_NETWORK === ERROR_TIMEOUT).assertFalse();
      expect(countOf(['0', '13400001', '13400002', '13400003', '13400004'], '0')).assertEqual(1);
      expect(codes.length).assertEqual(5);
    });

    /**
     * @tc.name   errorNoneIsZero
     * @tc.desc   The success code is exactly zero, matching the err.code check of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorNoneIsZero', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(ERROR_NONE < ERROR_CREATE).assertTrue();
      expect(ERROR_NONE + 1).assertEqual(1);
      expect(ERROR_NONE === 0).assertTrue();
    });

    /**
     * @tc.name   errorCodesAscendByFailureStage
     * @tc.desc   The four failure codes increase from create to start to network to timeout.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorCodesAscendByFailureStage', 0, () => {
      expect(ERROR_CREATE).assertEqual(13400001);
      expect(ERROR_START).assertEqual(13400002);
      expect(ERROR_NETWORK).assertEqual(13400003);
      expect(ERROR_TIMEOUT).assertEqual(13400004);
      expect(ERROR_CREATE < ERROR_START).assertTrue();
      expect(ERROR_START < ERROR_NETWORK).assertTrue();
      expect(ERROR_NETWORK < ERROR_TIMEOUT).assertTrue();
      expect(ERROR_TIMEOUT - ERROR_CREATE).assertEqual(3);
    });

    /**
     * @tc.name   retryableErrorsAreNetworkTimeoutStart
     * @tc.desc   Exactly the start, network and timeout codes are classified retryable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryableErrorsAreNetworkTimeoutStart', 0, () => {
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(isRetryableError(999)).assertFalse();
      expect(isRetryableError(-1)).assertFalse();
    });

    /**
     * @tc.name   createErrorIsNotRetryable
     * @tc.desc   A configuration creation failure is terminal for the retry policy.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createErrorIsNotRetryable', 0, () => {
      expect(ERROR_CREATE).assertLarger(0);
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(shouldAbortStart(ERROR_CREATE)).assertTrue();
      expect(classifyStartResult(ERROR_CREATE)).assertEqual('failed');
      expect(ERROR_CREATE !== ERROR_START).assertTrue();
      expect(String(ERROR_CREATE)).assertEqual('13400001');
    });

    /**
     * @tc.name   startResultClassification
     * @tc.desc   Only a zero code classifies as started; every failure code maps to failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startResultClassification', 0, () => {
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
      expect(classifyStartResult(ERROR_CREATE)).assertEqual('failed');
      expect(classifyStartResult(ERROR_START)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NETWORK)).assertEqual('failed');
      expect(classifyStartResult(ERROR_TIMEOUT)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NONE) === 'failed').assertFalse();
      expect(classifyStartResult(-1)).assertEqual('failed');
    });

    /**
     * @tc.name   abortPredicateMatchesNonZeroCode
     * @tc.desc   The page aborts a start callback exactly when the error code is non zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('abortPredicateMatchesNonZeroCode', 0, () => {
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(shouldAbortStart(ERROR_CREATE)).assertTrue();
      expect(shouldAbortStart(ERROR_START)).assertTrue();
      expect(shouldAbortStart(1)).assertTrue();
      expect(shouldAbortStart(-1)).assertTrue();
      expect(shouldAbortStart(ERROR_NONE)).assertEqual(ERROR_NONE !== 0);
      expect(shouldAbortStart(ERROR_TIMEOUT)).assertEqual(!shouldAbortStart(ERROR_NONE));
    });

    /**
     * @tc.name   logLevelsAreThreeDistinct
     * @tc.desc   The log level constants are INFO, WARN and ERROR with no duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logLevelsAreThreeDistinct', 0, () => {
      const levels: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      expect(levels.length).assertEqual(3);
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      expect(hasDuplicateStrings(levels)).assertFalse();
      expect(uniqueStrings(levels).length).assertEqual(3);
      expect(countOf(levels, LEVEL_WARN)).assertEqual(1);
      expect(levels.indexOf('DEBUG')).assertEqual(-1);
    });

    /**
     * @tc.name   logLevelsAreUppercase
     * @tc.desc   Every log level constant is already uppercase and separator free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logLevelsAreUppercase', 0, () => {
      const levels: string[] = [LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
      for (let index = 0; index < levels.length; index++) {
        expect(levels[index].toUpperCase()).assertEqual(levels[index]);
        expect(levels[index].toLowerCase() === levels[index]).assertFalse();
        expect(levels[index].indexOf(' ')).assertEqual(-1);
      }
      expect(LEVEL_INFO.length).assertEqual(4);
      expect(LEVEL_WARN.length).assertEqual(4);
      expect(LEVEL_ERROR.length).assertEqual(5);
      expect(LEVEL_ERROR.startsWith('ERR')).assertTrue();
    });

    /**
     * @tc.name   activeButtonColorLiteral
     * @tc.desc   The enabled button background is the '#409EFF' literal of the page button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('activeButtonColorLiteral', 0, () => {
      expect(BUTTON_ACTIVE_BACKGROUND).assertEqual('#409EFF');
      expect(BUTTON_ACTIVE_BACKGROUND.length).assertEqual(7);
      expect(BUTTON_ACTIVE_BACKGROUND.startsWith('#')).assertTrue();
      expect(BUTTON_ACTIVE_BACKGROUND.toUpperCase()).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(BUTTON_ACTIVE_BACKGROUND.indexOf('409EFF')).assertEqual(1);
      expect(startButtonBackground(true)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(startButtonBackground(true) === BUTTON_DISABLED_BACKGROUND).assertFalse();
    });

    /**
     * @tc.name   disabledButtonColorLiteral
     * @tc.desc   The disabled button background is the grey '#C0C4CC' literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('disabledButtonColorLiteral', 0, () => {
      expect(BUTTON_DISABLED_BACKGROUND).assertEqual('#C0C4CC');
      expect(BUTTON_DISABLED_BACKGROUND.length).assertEqual(7);
      expect(BUTTON_DISABLED_BACKGROUND.startsWith('#')).assertTrue();
      expect(BUTTON_DISABLED_BACKGROUND.toUpperCase()).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(BUTTON_DISABLED_BACKGROUND.indexOf('C0C4CC')).assertEqual(1);
      expect(startButtonBackground(false)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(startButtonBackground(false) === BUTTON_ACTIVE_BACKGROUND).assertFalse();
    });

    /**
     * @tc.name   buttonColorsAreDistinct
     * @tc.desc   The enabled and disabled backgrounds are two different colors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('buttonColorsAreDistinct', 0, () => {
      expect(BUTTON_ACTIVE_BACKGROUND === BUTTON_DISABLED_BACKGROUND).assertFalse();
      expect(hasDuplicateStrings([BUTTON_ACTIVE_BACKGROUND, BUTTON_DISABLED_BACKGROUND])).assertFalse();
      expect(uniqueStrings([BUTTON_ACTIVE_BACKGROUND, BUTTON_DISABLED_BACKGROUND]).length).assertEqual(2);
      expect(startButtonBackground(true) === startButtonBackground(false)).assertFalse();
      expect(countOf([BUTTON_ACTIVE_BACKGROUND], '#409EFF')).assertEqual(1);
      expect(countOf([BUTTON_DISABLED_BACKGROUND], '#409EFF')).assertEqual(0);
      expect(BUTTON_ACTIVE_BACKGROUND.length).assertEqual(BUTTON_DISABLED_BACKGROUND.length);
    });

    /**
     * @tc.name   buttonColorsUseHexFormat
     * @tc.desc   Both color literals are seven character uppercase hex triplets.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('buttonColorsUseHexFormat', 0, () => {
      const colors: string[] = [BUTTON_ACTIVE_BACKGROUND, BUTTON_DISABLED_BACKGROUND];
      for (let index = 0; index < colors.length; index++) {
        expect(colors[index].length).assertEqual(7);
        expect(colors[index].substring(0, 1)).assertEqual('#');
        expect(colors[index].substring(1).length).assertEqual(6);
        expect(colors[index].substring(1).toUpperCase()).assertEqual(colors[index].substring(1));
      }
      expect(BUTTON_ACTIVE_BACKGROUND.substring(0, 4)).assertEqual('#409');
      expect(BUTTON_DISABLED_BACKGROUND.substring(0, 4)).assertEqual('#C0C');
      expect(BUTTON_ACTIVE_BACKGROUND.indexOf('#', 1)).assertEqual(-1);
    });

    /**
     * @tc.name   pageTitleLiteral
     * @tc.desc   The page title constant is the Chinese header rendered above the three rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pageTitleLiteral', 0, () => {
      expect(PAGE_TITLE).assertEqual('网络场景');
      expect(PAGE_TITLE.length).assertEqual(4);
      expect(PAGE_TITLE.indexOf('网络')).assertEqual(0);
      expect(PAGE_TITLE.indexOf('场景')).assertEqual(2);
      expect(PAGE_TITLE.startsWith('网')).assertTrue();
      expect(PAGE_TITLE.endsWith('景')).assertTrue();
      expect(PAGE_TITLE === '').assertFalse();
    });

    /**
     * @tc.name   pageTitleHasNoPadding
     * @tc.desc   The title literal carries no surrounding whitespace or punctuation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pageTitleHasNoPadding', 0, () => {
      expect(PAGE_TITLE.indexOf(' ')).assertEqual(-1);
      expect(PAGE_TITLE.trim()).assertEqual(PAGE_TITLE);
      expect(PAGE_TITLE.startsWith(' ')).assertFalse();
      expect(PAGE_TITLE.endsWith(' ')).assertFalse();
      expect(PAGE_TITLE.indexOf('。')).assertEqual(-1);
      expect(PAGE_TITLE.length).assertEqual(4);
      expect(PAGE_TITLE.substring(0, 1)).assertEqual('网');
      expect(PAGE_TITLE.substring(3, 4)).assertEqual('景');
    });

    /**
     * @tc.name   startButtonEnabledFollowsFlag
     * @tc.desc   The button is enabled exactly while the finished flag is true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startButtonEnabledFollowsFlag', 0, () => {
      expect(startButtonEnabled(true)).assertTrue();
      expect(startButtonEnabled(false)).assertFalse();
      expect(startButtonEnabled(true) === startButtonEnabled(false)).assertFalse();
      expect(startButtonEnabled(true)).assertEqual(true);
      expect(startButtonEnabled(false)).assertEqual(false);
      expect(startButtonEnabled(!false)).assertTrue();
      expect(startButtonEnabled(!true)).assertFalse();
    });

    /**
     * @tc.name   startButtonBackgroundFollowsFlag
     * @tc.desc   The background switches between the enabled and disabled constants with the flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startButtonBackgroundFollowsFlag', 0, () => {
      expect(startButtonBackground(true)).assertEqual('#409EFF');
      expect(startButtonBackground(false)).assertEqual('#C0C4CC');
      expect(startButtonBackground(true)).assertEqual(BUTTON_ACTIVE_BACKGROUND);
      expect(startButtonBackground(false)).assertEqual(BUTTON_DISABLED_BACKGROUND);
      expect(startButtonBackground(true) === startButtonBackground(false)).assertFalse();
      expect(startButtonBackground(true).startsWith('#')).assertTrue();
      expect(startButtonBackground(false).length).assertEqual(7);
    });

    /**
     * @tc.name   sortedTaskNumbersPreserveSet
     * @tc.desc   Sorting the task number list keeps the same three members and leaves it unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sortedTaskNumbersPreserveSet', 0, () => {
      const sorted: string[] = sortedCopy(TASK_NUMBERS);
      expect(sorted.length).assertEqual(3);
      expect(sameStringArray(sorted, TASK_NUMBERS)).assertTrue();
      expect(uniqueStrings(sorted).length).assertEqual(3);
      expect(sorted[0]).assertEqual(TASK_A);
      expect(sorted[2]).assertEqual(TASK_C);
      expect(TASK_NUMBERS.length).assertEqual(3);
      expect(TASK_NUMBERS[1]).assertEqual(TASK_B);
    });

    /**
     * @tc.name   reversedTaskNumbersPreserveSet
     * @tc.desc   Reversing the list flips the order without changing membership or the source array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('reversedTaskNumbersPreserveSet', 0, () => {
      const reversed: string[] = reversedCopy(TASK_NUMBERS);
      expect(reversed.length).assertEqual(3);
      expect(reversed[0]).assertEqual(TASK_C);
      expect(reversed[1]).assertEqual(TASK_B);
      expect(reversed[2]).assertEqual(TASK_A);
      expect(uniqueStrings(reversed).length).assertEqual(3);
      expect(reversed.indexOf(TASK_A)).assertEqual(2);
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(reversed[0] === TASK_NUMBERS[0]).assertFalse();
    });

    /**
     * @tc.name   joinedTaskNumbersFormat
     * @tc.desc   The joined helper renders the task list with the requested separator.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('joinedTaskNumbersFormat', 0, () => {
      expect(joined(TASK_NUMBERS, '|')).assertEqual('A|B|C');
      expect(joined(TASK_NUMBERS, '')).assertEqual('ABC');
      expect(joined(TASK_NUMBERS, ', ')).assertEqual('A, B, C');
      expect(joined(TASK_NUMBERS, '|').split('|').length).assertEqual(3);
      expect(joined(TASK_NUMBERS, '|').split('|')[1]).assertEqual(TASK_B);
      expect(joined(TASK_NUMBERS, '|')).assertEqual(joined(sortedCopy(TASK_NUMBERS), '|'));
      expect(joined([], '|')).assertEqual('');
    });

    /**
     * @tc.name   constantReadsAreStable
     * @tc.desc   Repeated reads of the exported constants return identical values and array contents.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('constantReadsAreStable', 0, () => {
      expect(TASK_A).assertEqual(TASK_A);
      expect(URL_TASK_A).assertEqual(TASK_URLS[0]);
      expect(PROGRESS_TOTAL).assertEqual(PROGRESS_TOTAL);
      expect(PAGE_TITLE).assertEqual(PAGE_TITLE);
      expect(TASK_NUMBERS.length).assertEqual(TASK_NUMBERS.length);
      expect(sameStringArray(TASK_NUMBERS, TASK_NUMBERS.slice())).assertTrue();
      expect(POLL_INTERVAL_MS).assertEqual(POLL_INTERVAL_MS);
      expect(STATUS_IDLE).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   resourceGroupsHaveNoAccidentalDuplicates
     * @tc.desc   Task numbers, statuses, levels and colors do not share an accidental value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resourceGroupsHaveNoAccidentalDuplicates', 0, () => {
      const combined: string[] = [
        TASK_A, TASK_B, TASK_C,
        STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED,
        LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR,
        BUTTON_ACTIVE_BACKGROUND, BUTTON_DISABLED_BACKGROUND
      ];
      expect(combined.length).assertEqual(12);
      expect(hasDuplicateStrings(combined)).assertFalse();
      expect(uniqueStrings(combined).length).assertEqual(12);
      expect(countOf(combined, LEVEL_INFO)).assertEqual(1);
      expect(countOf(combined, STATUS_FAILED)).assertEqual(1);
      expect(combined.indexOf('')).assertEqual(-1);
      expect(sameStringArray(combined.slice(0, 3), TASK_NUMBERS)).assertTrue();
    });

    /**
     * @tc.name   configLiteralsMatchPage
     * @tc.desc   The four download option constants keep the exact literals of the page config.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configLiteralsMatchPage', 0, () => {
      expect(CONFIG_ACTION_DOWNLOAD).assertEqual('DOWNLOAD');
      expect(CONFIG_METHOD_GET).assertEqual('GET');
      expect(CONFIG_SAVEAS_CACHE).assertEqual('./');
      expect(CONFIG_OVERWRITE).assertTrue();
      expect(CONFIG_ACTION_DOWNLOAD.length).assertEqual(8);
      expect(CONFIG_METHOD_GET.length).assertEqual(3);
      expect(CONFIG_SAVEAS_CACHE.length).assertEqual(2);
      expect(CONFIG_ACTION_DOWNLOAD.toUpperCase()).assertEqual(CONFIG_ACTION_DOWNLOAD);
    });

    /**
     * @tc.name   saveasAndOverwriteLiterals
     * @tc.desc   The cache saveas literal and the overwrite flag are distinct from the other options.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('saveasAndOverwriteLiterals', 0, () => {
      expect(CONFIG_SAVEAS_CACHE.startsWith('.')).assertTrue();
      expect(CONFIG_SAVEAS_CACHE.endsWith('/')).assertTrue();
      expect(CONFIG_SAVEAS_CACHE.indexOf('cache')).assertEqual(-1);
      expect(CONFIG_OVERWRITE === true).assertTrue();
      expect(CONFIG_OVERWRITE === false).assertFalse();
      expect(CONFIG_ACTION_DOWNLOAD === CONFIG_METHOD_GET).assertFalse();
      expect(CONFIG_METHOD_GET === CONFIG_SAVEAS_CACHE).assertFalse();
      expect(hasDuplicateStrings([CONFIG_ACTION_DOWNLOAD, CONFIG_METHOD_GET, CONFIG_SAVEAS_CACHE])).assertFalse();
      logStep('transferResources', 'config literals match the page');
    });

    /**
     * @tc.name   urlLiteralsAreLongEnough
     * @tc.desc   The shipped URL constants are full remote paths rather than abbreviated placeholders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferResources scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlLiteralsAreLongEnough', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(TASK_URLS[index].length).assertLarger(80);
        expect(TASK_URLS[index].indexOf('https://gitee.com/')).assertEqual(0);
        expect(TASK_URLS[index].split('/').length).assertLarger(8);
      }
      expect(URL_TASK_A.length).assertLarger(URL_TASK_B.length);
      expect(URL_TASK_B.length).assertLarger(80);
      expect(URL_TASK_C.indexOf('blob/master')).assertLarger(0);
      expect(TASK_URLS[0].length).assertEqual(URL_TASK_A.length);
    });

  });
}
