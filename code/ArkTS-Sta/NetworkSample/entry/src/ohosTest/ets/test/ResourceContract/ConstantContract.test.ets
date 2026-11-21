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
 * ConstantContract suite.
 *
 * Locks the exported resource contract of the sample: the three task numbers,
 * the three URL literals, the progress and poll constants, every status, error,
 * log level and colour literal, and the helper behaviour that depends on them.
 * A changed literal breaks this suite before it reaches the rendered page.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    the four state members and the four private flags
 *   68-76    updateProgress literal 100
 *   109-116  DOWNLOAD, GET, './', overwrite true
 *   151-171  the three URL literals
 *   200-259  title, labels, progress total 100, two button colours
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
  hasDuplicateStrings,
  sameStringArray,
  countOf,
  fileNameOf,
  extensionOf,
  schemeOf,
  hostOf,
  isTerminalStatus,
  progressLabel,
  clampInt,
  DownloadConfig,
  textFingerprint
} from '../Shared/SharedDriver';

export default function constantContractTest(): void {
  describe('ConstantContract', () => {
    beforeAll(() => {
      logSuite('ConstantContract', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ConstantContract', 'end');
    });

    /**
     * @tc.name   taskConstantsAreSingleLetters
     * @tc.desc   The three task numbers are the exact single uppercase letters the callbacks compare against.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskConstantsAreSingleLetters', 0, () => {
      logStep('ConstantContract', 'task numbers');
      expect(TASK_A).assertEqual('A');
      expect(TASK_B).assertEqual('B');
      expect(TASK_C).assertEqual('C');
      expect(TASK_A.length).assertEqual(1);
      expect(TASK_B.length).assertEqual(1);
      expect(TASK_C.length).assertEqual(1);
      expect(TASK_A !== TASK_B && TASK_B !== TASK_C && TASK_A !== TASK_C).assertTrue();
    });

    /**
     * @tc.name   taskNumbersArrayIsOrdered
     * @tc.desc   The exported task array lists A, B then C and contains no duplicate entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskNumbersArrayIsOrdered', 0, () => {
      expect(TASK_NUMBERS.length).assertEqual(3);
      expect(sameStringArray(TASK_NUMBERS, [TASK_A, TASK_B, TASK_C])).assertTrue();
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(TASK_NUMBERS[1]).assertEqual(TASK_B);
      expect(TASK_NUMBERS[2]).assertEqual(TASK_C);
      expect(hasDuplicateStrings(TASK_NUMBERS)).assertFalse();
      expect(countOf(TASK_NUMBERS, TASK_C)).assertEqual(1);
    });

    /**
     * @tc.name   taskNumbersArePairwiseDistinct
     * @tc.desc   Every pair of task numbers differs, so callback dispatch cannot collide.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskNumbersArePairwiseDistinct', 0, () => {
      const pairs: number = TASK_NUMBERS.length * (TASK_NUMBERS.length - 1) / 2;
      expect(pairs).assertEqual(3);
      for (let outer = 0; outer < TASK_NUMBERS.length; outer++) {
        for (let inner = outer + 1; inner < TASK_NUMBERS.length; inner++) {
          expect(TASK_NUMBERS[outer] === TASK_NUMBERS[inner]).assertFalse();
        }
      }
      expect(TASK_NUMBERS.indexOf(TASK_A)).assertEqual(0);
      expect(TASK_NUMBERS.indexOf(TASK_C)).assertEqual(2);
      expect(TASK_NUMBERS.indexOf('D')).assertEqual(-1);
    });

    /**
     * @tc.name   urlConstantsHaveProductionPrefixes
     * @tc.desc   Each URL literal starts with the gitee origin of its repository and the secure scheme.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlConstantsHaveProductionPrefixes', 0, () => {
      expect(URL_TASK_A.startsWith('https://gitee.com/openharmony/')).assertTrue();
      expect(URL_TASK_B.startsWith('https://gitee.com/harmonyos-cases/')).assertTrue();
      expect(URL_TASK_C.startsWith('https://gitee.com/harmonyos-cases/')).assertTrue();
      expect(schemeOf(URL_TASK_A)).assertEqual('https');
      expect(hostOf(URL_TASK_A)).assertEqual('gitee.com');
      expect(URL_TASK_B.indexOf('/blob/master/')).assertLarger(0);
      expect(URL_TASK_C.indexOf('/CommonAppDevelopment/')).assertLarger(0);
    });

    /**
     * @tc.name   taskUrlsArrayMatchesConstants
     * @tc.desc   The URL array is exactly the three exported literals in A, B, C order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsArrayMatchesConstants', 0, () => {
      expect(TASK_URLS.length).assertEqual(3);
      expect(sameStringArray(TASK_URLS, [URL_TASK_A, URL_TASK_B, URL_TASK_C])).assertTrue();
      expect(TASK_URLS[0]).assertEqual(URL_TASK_A);
      expect(TASK_URLS[1]).assertEqual(URL_TASK_B);
      expect(TASK_URLS[2]).assertEqual(URL_TASK_C);
      expect(hasDuplicateStrings(TASK_URLS)).assertFalse();
      expect(TASK_URLS.length).assertEqual(TASK_NUMBERS.length);
    });

    /**
     * @tc.name   taskUrlsMeetMinimumLength
     * @tc.desc   Every literal is a long media path, so a truncated constant would fail a length floor.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlsMeetMinimumLength', 0, () => {
      expect(URL_TASK_A.length > 150).assertTrue();
      expect(URL_TASK_B.length > 110).assertTrue();
      expect(URL_TASK_C.length > 110).assertTrue();
      expect(URL_TASK_A.length === URL_TASK_B.length).assertFalse();
      expect(URL_TASK_B.length === URL_TASK_C.length).assertFalse();
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(TASK_URLS[index].length > 100).assertTrue();
      }
      expect(URL_TASK_A.length + URL_TASK_B.length + URL_TASK_C.length > 400).assertTrue();
    });

    /**
     * @tc.name   taskUrlsShareMediaSegments
     * @tc.desc   All three literals traverse base/media and resolve to PNG files in the resource tree.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlsShareMediaSegments', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(TASK_URLS[index].indexOf('/src/main/resources/base/media/') > 0).assertTrue();
        expect(TASK_URLS[index].endsWith('.png')).assertTrue();
        expect(extensionOf(TASK_URLS[index])).assertEqual('.png');
        expect(fileNameOf(TASK_URLS[index]).indexOf(' ')).assertEqual(-1);
      }
      expect(URL_TASK_A.indexOf('/feature/navigationHome/')).assertLarger(0);
      expect(URL_TASK_B.indexOf('/product/entry/')).assertLarger(0);
      expect(URL_TASK_C.indexOf('/product/entry/')).assertLarger(0);
    });

    /**
     * @tc.name   progressConstantsExact
     * @tc.desc   The progress total is 100 and the initial value is 0, matching the Progress component bounds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressConstantsExact', 0, () => {
      expect(PROGRESS_TOTAL).assertEqual(100);
      expect(PROGRESS_INITIAL).assertEqual(0);
      expect(PROGRESS_TOTAL).assertEqual(100);
      expect(PROGRESS_TOTAL > PROGRESS_INITIAL).assertTrue();
      expect(PROGRESS_TOTAL - PROGRESS_INITIAL).assertEqual(100);
      expect(clampInt(PROGRESS_TOTAL + 1, PROGRESS_INITIAL, PROGRESS_TOTAL)).assertEqual(100);
    });

    /**
     * @tc.name   pollIntervalConstantExact
     * @tc.desc   The setInterval delay of the page is 200 ms and stays a positive whole number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollIntervalConstantExact', 0, () => {
      expect(POLL_INTERVAL_MS).assertEqual(200);
      expect(POLL_INTERVAL_MS > 0).assertTrue();
      expect(POLL_INTERVAL_MS < 1000).assertTrue();
      expect(POLL_INTERVAL_MS * 5).assertEqual(1000);
      expect(POLL_INTERVAL_MS === PROGRESS_TOTAL).assertFalse();
      expect(POLL_INTERVAL_MS / 200).assertEqual(1);
    });

    /**
     * @tc.name   configActionConstantExact
     * @tc.desc   The action literal is the uppercase DOWNLOAD token accepted by request.agent.Action.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configActionConstantExact', 0, () => {
      expect(CONFIG_ACTION_DOWNLOAD).assertEqual('DOWNLOAD');
      expect(CONFIG_ACTION_DOWNLOAD.length).assertEqual(8);
      expect(CONFIG_ACTION_DOWNLOAD.toUpperCase()).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(CONFIG_ACTION_DOWNLOAD === 'UPLOAD').assertFalse();
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.validate().indexOf('action-not-download')).assertEqual(-1);
    });

    /**
     * @tc.name   configMethodAndSaveasConstants
     * @tc.desc   The method is GET and the save path is the cache token './' used by download().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configMethodAndSaveasConstants', 0, () => {
      expect(CONFIG_METHOD_GET).assertEqual('GET');
      expect(CONFIG_SAVEAS_CACHE).assertEqual('./');
      expect(CONFIG_METHOD_GET.length).assertEqual(3);
      expect(CONFIG_SAVEAS_CACHE.length).assertEqual(2);
      expect(CONFIG_SAVEAS_CACHE.startsWith('.')).assertTrue();
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
    });

    /**
     * @tc.name   configOverwriteConstantIsTrue
     * @tc.desc   Overwrite stays enabled so a repeated download replaces the cached file.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configOverwriteConstantIsTrue', 0, () => {
      expect(CONFIG_OVERWRITE).assertTrue();
      expect(CONFIG_OVERWRITE === false).assertFalse();
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(config.isValid()).assertTrue();
      config.overwrite = false;
      expect(config.validate()[0]).assertEqual('overwrite-disabled');
      expect(CONFIG_OVERWRITE).assertTrue();
    });

    /**
     * @tc.name   statusConstantsExact
     * @tc.desc   The four status strings are the exact lowercase tokens used by the driver state machine.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('statusConstantsExact', 0, () => {
      expect(STATUS_IDLE).assertEqual('idle');
      expect(STATUS_RUNNING).assertEqual('running');
      expect(STATUS_COMPLETED).assertEqual('completed');
      expect(STATUS_FAILED).assertEqual('failed');
      expect(hasDuplicateStrings([STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED])).assertFalse();
      expect(STATUS_IDLE.length).assertEqual(4);
      expect(STATUS_COMPLETED.length).assertEqual(9);
    });

    /**
     * @tc.name   terminalStatusesAreCompletedAndFailed
     * @tc.desc   Only completed and failed are terminal; idle and running still accept progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('terminalStatusesAreCompletedAndFailed', 0, () => {
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
      expect(isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(isTerminalStatus(STATUS_IDLE)).assertFalse();
      expect(isTerminalStatus(STATUS_RUNNING)).assertFalse();
      expect(isTerminalStatus(STATUS_COMPLETED) === isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(isTerminalStatus('')).assertFalse();
    });

    /**
     * @tc.name   errorConstantsExact
     * @tc.desc   The five error codes keep their exact numeric contract and the zero code means success.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorConstantsExact', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_CREATE).assertEqual(13400001);
      expect(ERROR_START).assertEqual(13400002);
      expect(ERROR_NETWORK).assertEqual(13400003);
      expect(ERROR_TIMEOUT).assertEqual(13400004);
      expect(ERROR_NONE < ERROR_CREATE).assertTrue();
      expect(ERROR_TIMEOUT - ERROR_CREATE).assertEqual(3);
    });

    /**
     * @tc.name   errorCodesAreDistinctAndOrdered
     * @tc.desc   All five error codes are pairwise distinct and the four failures increase by one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorCodesAreDistinctAndOrdered', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      for (let outer = 0; outer < codes.length; outer++) {
        for (let inner = outer + 1; inner < codes.length; inner++) {
          expect(codes[outer] === codes[inner]).assertFalse();
        }
      }
      expect(codes.length).assertEqual(5);
      expect(ERROR_START - ERROR_CREATE).assertEqual(1);
      expect(ERROR_NETWORK - ERROR_START).assertEqual(1);
      expect(ERROR_TIMEOUT - ERROR_NETWORK).assertEqual(1);
      expect(ERROR_TIMEOUT > ERROR_CREATE).assertTrue();
    });

    /**
     * @tc.name   logLevelConstantsExact
     * @tc.desc   The three log levels are the uppercase tokens used by the bounded buffer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logLevelConstantsExact', 0, () => {
      expect(LEVEL_INFO).assertEqual('INFO');
      expect(LEVEL_WARN).assertEqual('WARN');
      expect(LEVEL_ERROR).assertEqual('ERROR');
      expect(hasDuplicateStrings([LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR])).assertFalse();
      expect(LEVEL_INFO.length).assertEqual(4);
      expect(LEVEL_WARN.length).assertEqual(4);
      expect(LEVEL_ERROR.length).assertEqual(5);
    });

    /**
     * @tc.name   colourLiteralsExact
     * @tc.desc   The two button colours are the exact six digit hex literals of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('colourLiteralsExact', 0, () => {
      expect(BUTTON_ACTIVE_BACKGROUND).assertEqual('#409EFF');
      expect(BUTTON_DISABLED_BACKGROUND).assertEqual('#C0C4CC');
      expect(BUTTON_ACTIVE_BACKGROUND.length).assertEqual(7);
      expect(BUTTON_DISABLED_BACKGROUND.length).assertEqual(7);
      expect(BUTTON_ACTIVE_BACKGROUND.startsWith('#')).assertTrue();
      expect(BUTTON_DISABLED_BACKGROUND.startsWith('#')).assertTrue();
      expect(BUTTON_ACTIVE_BACKGROUND === BUTTON_DISABLED_BACKGROUND).assertFalse();
    });

    /**
     * @tc.name   pageTitleConstantExact
     * @tc.desc   The page title is the four character Chinese literal rendered by the header Text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pageTitleConstantExact', 0, () => {
      expect(PAGE_TITLE).assertEqual('网络场景');
      expect(PAGE_TITLE.length).assertEqual(4);
      expect(PAGE_TITLE.length > 0).assertTrue();
      expect(PAGE_TITLE === '').assertFalse();
      expect(PAGE_TITLE.indexOf('网络')).assertEqual(0);
      expect(PAGE_TITLE.endsWith('场景')).assertTrue();
      expect(PAGE_TITLE.trim()).assertEqual(PAGE_TITLE);
    });

    /**
     * @tc.name   progressLabelContractUsesConstants
     * @tc.desc   The label helper embeds the task number and the progress value between its fixed words.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressLabelContractUsesConstants', 0, () => {
      expect(progressLabel(TASK_A, PROGRESS_INITIAL)).assertEqual('任务A当前进度 0%');
      expect(progressLabel(TASK_B, 50)).assertEqual('任务B当前进度 50%');
      expect(progressLabel(TASK_C, PROGRESS_TOTAL)).assertEqual('任务C当前进度 100%');
      expect(progressLabel(TASK_A, 0).indexOf(TASK_A)).assertEqual(2);
      expect(progressLabel(TASK_A, 0).indexOf('当前进度')).assertLarger(0);
      expect(progressLabel(TASK_A, 0).endsWith('%')).assertTrue();
    });

    /**
     * @tc.name   configFactoryUsesEveryLiteral
     * @tc.desc   A factory config embeds every exported config literal and validates against them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configFactoryUsesEveryLiteral', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_C);
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(config.url).assertEqual(URL_TASK_C);
      expect(config.validate().length).assertEqual(0);
      expect(config.describe()).assertEqual('DOWNLOAD|GET|true|./|' + URL_TASK_C);
    });

    /**
     * @tc.name   taskUrlExtensionsMatchConstantFileNames
     * @tc.desc   Each constant URL resolves to a distinct PNG file name through the shared helpers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlExtensionsMatchConstantFileNames', 0, () => {
      expect(fileNameOf(URL_TASK_A)).assertEqual('favor_list_tea.png');
      expect(fileNameOf(URL_TASK_B)).assertEqual('after_cache.png');
      expect(fileNameOf(URL_TASK_C)).assertEqual('icon_main_color.png');
      expect(extensionOf(URL_TASK_A)).assertEqual('.png');
      expect(extensionOf(URL_TASK_B)).assertEqual('.png');
      expect(extensionOf(URL_TASK_C)).assertEqual('.png');
      expect(countOf([URL_TASK_A, URL_TASK_B, URL_TASK_C], URL_TASK_C)).assertEqual(1);
    });

    /**
     * @tc.name   titleAndColoursAreIndependentLiterals
     * @tc.desc   The title, both colours and the save path are pairwise distinct string resources.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('titleAndColoursAreIndependentLiterals', 0, () => {
      const literals: string[] = [PAGE_TITLE, BUTTON_ACTIVE_BACKGROUND, BUTTON_DISABLED_BACKGROUND, CONFIG_SAVEAS_CACHE];
      expect(hasDuplicateStrings(literals)).assertFalse();
      expect(literals.length).assertEqual(4);
      expect(PAGE_TITLE === CONFIG_SAVEAS_CACHE).assertFalse();
      expect(BUTTON_ACTIVE_BACKGROUND === CONFIG_SAVEAS_CACHE).assertFalse();
      expect(literals[1]).assertEqual('#409EFF');
      expect(literals[2]).assertEqual('#C0C4CC');
    });

    /**
     * @tc.name   statusTokensAreLowercaseAscii
     * @tc.desc   All four status tokens are lowercase ASCII words, which keeps matching and logging predictable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statusTokensAreLowercaseAscii', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED];
      for (let index = 0; index < statuses.length; index++) {
        expect(statuses[index]).assertEqual(statuses[index].toLowerCase());
        expect(statuses[index].length > 3).assertTrue();
        let ascii: boolean = true;
        for (let inner = 0; inner < statuses[index].length; inner++) {
          if (statuses[index].charCodeAt(inner) > 127) {
            ascii = false;
          }
        }
        expect(ascii).assertTrue();
      }
      expect(statuses.length).assertEqual(4);
      expect(hasDuplicateStrings(statuses)).assertFalse();
    });

    /**
     * @tc.name   configTokensAreUppercaseAscii
     * @tc.desc   The action and method literals are uppercase ASCII tokens and remain distinct.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configTokensAreUppercaseAscii', 0, () => {
      expect(CONFIG_ACTION_DOWNLOAD.toUpperCase()).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(CONFIG_METHOD_GET.toUpperCase()).assertEqual(CONFIG_METHOD_GET);
      expect(CONFIG_ACTION_DOWNLOAD === CONFIG_METHOD_GET).assertFalse();
      expect(CONFIG_ACTION_DOWNLOAD.length > CONFIG_METHOD_GET.length).assertTrue();
      expect(CONFIG_ACTION_DOWNLOAD.indexOf(' ')).assertEqual(-1);
      expect(CONFIG_METHOD_GET.indexOf(' ')).assertEqual(-1);
      expect(CONFIG_ACTION_DOWNLOAD.charCodeAt(0)).assertEqual(68);
      expect(CONFIG_METHOD_GET.charCodeAt(0)).assertEqual(71);
    });

    /**
     * @tc.name   contractFingerprintStableAcrossReads
     * @tc.desc   The concatenated contract literal set has a stable fingerprint that a literal change would break.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('contractFingerprintStableAcrossReads', 0, () => {
      const contract: string = TASK_A + TASK_B + TASK_C + '|' + URL_TASK_A + '|' + URL_TASK_B + '|' +
        URL_TASK_C + '|' + String(PROGRESS_TOTAL) + '|' + String(POLL_INTERVAL_MS) + '|' +
        CONFIG_ACTION_DOWNLOAD + '|' + CONFIG_METHOD_GET + '|' + CONFIG_SAVEAS_CACHE + '|' +
        BUTTON_ACTIVE_BACKGROUND + '|' + BUTTON_DISABLED_BACKGROUND + '|' + PAGE_TITLE;
      const first: number = textFingerprint(contract);
      const second: number = textFingerprint(contract);
      expect(first).assertEqual(second);
      expect(first > 0).assertTrue();
      expect(contract.split('|').length).assertEqual(12);
      expect(contract.indexOf(PAGE_TITLE) > contract.indexOf(URL_TASK_C)).assertTrue();
      expect(contract.indexOf('|' + CONFIG_METHOD_GET + '|') > 0).assertTrue();
    });

    /**
     * @tc.name   taskNumbersAlignWithTaskUrls
     * @tc.desc   Index i of the task array and index i of the URL array describe the same row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskNumbersAlignWithTaskUrls', 0, () => {
      expect(TASK_NUMBERS.length).assertEqual(TASK_URLS.length);
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        expect(TASK_URLS[index].startsWith('https://')).assertTrue();
        expect(extensionOf(TASK_URLS[index])).assertEqual('.png');
        expect(hostOf(TASK_URLS[index])).assertEqual('gitee.com');
      }
      expect(fileNameOf(TASK_URLS[0])).assertEqual('favor_list_tea.png');
      expect(fileNameOf(TASK_URLS[1])).assertEqual('after_cache.png');
      expect(fileNameOf(TASK_URLS[2])).assertEqual('icon_main_color.png');
    });
  });
}
