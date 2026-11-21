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
 * Connectivity suite.
 *
 * The page downloads three https images from gitee. This suite pins the URL
 * contract (scheme, host, path, query), proves that only https is accepted by
 * the configuration validator, and models offline, transient and recovered
 * network behaviour with the error codes the page branches on.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116 download(): action DOWNLOAD, url, overwrite true, GET, './'
 *   117-147 create/start callbacks, err.code branches and error logging
 *   151-171 three https URL literals on gitee.com
 *   188-196 200 ms interval that keeps checking the gate while offline
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_URLS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  DownloadConfig,
  isHttpUrl,
  isHttpsUrl,
  hasQuery,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  fileNameOf,
  createTaskGraph,
  expectedConfigFor,
  progressLabel,
  RetryPolicy,
  NetworkMetrics,
  PollClock,
  classifyStartResult,
  shouldAbortStart,
  isRetryableError,
  TaskGraph
} from '../Shared/SharedDriver';

/** Applies one offline failure to a task and reports the observed code. */
function failOnce(task: TaskGraph, taskNo: string, code: number): number {
  const row = task.taskAt(TASK_A === taskNo ? 0 : (TASK_B === taskNo ? 1 : 2));
  row.fail(code);
  return row.lastErrorCode;
}

export default function connectivityTest(): void {
  describe('Connectivity', () => {
    beforeAll(() => {
      logSuite('Connectivity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('Connectivity', 'end');
    });

    /**
     * @tc.name   allTaskUrlsUseHttpsScheme
     * @tc.desc   Every seeded download URL starts with the https scheme required by the configuration.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('allTaskUrlsUseHttpsScheme', 0, () => {
      expect(TASK_URLS.length).assertEqual(3);
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(isHttpsUrl(TASK_URLS[index])).assertTrue();
        expect(isHttpUrl(TASK_URLS[index])).assertFalse();
        expect(schemeOf(TASK_URLS[index])).assertEqual('https');
        expect(TASK_URLS[index].startsWith('https://')).assertTrue();
      }
      expect(schemeOf(URL_TASK_A)).assertEqual('https');
      expect(schemeOf(URL_TASK_B)).assertEqual('https');
      expect(schemeOf(URL_TASK_C)).assertEqual('https');
      const expectedHosts: string[] = ['gitee.com', 'gitee.com', 'gitee.com'];
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(hostOf(TASK_URLS[index])).assertEqual(expectedHosts[index]);
        expect(hasQuery(TASK_URLS[index])).assertFalse();
        expect(DownloadConfig.forUrl(TASK_URLS[index]).isValid()).assertTrue();
      }
      expect(schemeOf(TASK_URLS[0]) === schemeOf(TASK_URLS[2])).assertTrue();
    });

    /**
     * @tc.name   everyTaskHostIsGiteeCom
     * @tc.desc   The host extraction of all three URLs yields the single gitee.com host the page hardcodes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyTaskHostIsGiteeCom', 0, () => {
      expect(hostOf(URL_TASK_A)).assertEqual('gitee.com');
      expect(hostOf(URL_TASK_B)).assertEqual('gitee.com');
      expect(hostOf(URL_TASK_C)).assertEqual('gitee.com');
      expect(hostOf(TASK_URLS[0])).assertEqual(hostOf(TASK_URLS[1]));
      expect(hostOf(URL_TASK_A).length).assertEqual(9);
      expect(hostOf(URL_TASK_A).indexOf('gitee')).assertEqual(0);
      expect(hostOf(URL_TASK_A).endsWith('.com')).assertTrue();
      expect(hostOf('https://gitee.com')).assertEqual('gitee.com');
    });

    /**
     * @tc.name   schemeLessUrlFailsHttpsCheck
     * @tc.desc   A gitee path without a scheme is not a download URL and is rejected by the validator.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemeLessUrlFailsHttpsCheck', 0, () => {
      const bare: string = 'gitee.com/openharmony/sample.png';
      expect(isHttpsUrl(bare)).assertFalse();
      expect(isHttpUrl(bare)).assertFalse();
      expect(schemeOf(bare)).assertEqual('');
      expect(hostOf(bare)).assertEqual('');
      expect(pathOf(bare)).assertEqual('/openharmony/sample.png');
      const config = DownloadConfig.forUrl(bare);
      expect(config.validate().indexOf('url-not-https') >= 0).assertTrue();
      expect(config.isValid()).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.fileName()).assertEqual('sample.png');
      expect(config.url).assertEqual(bare);
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(hostOf(config.url)).assertEqual('');
      expect(pathOf(config.url).endsWith('.png')).assertTrue();
      expect(config.describe().indexOf('url-not-https')).assertEqual(-1);
      expect(config.describe().endsWith(bare)).assertTrue();
      expect(config.describe().startsWith('DOWNLOAD|GET|true|./|')).assertTrue();
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
    });

    /**
     * @tc.name   httpSchemeIsRejectedByConfigValidation
     * @tc.desc   A plain http mirror of the same asset is refused even though the host and file name match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('httpSchemeIsRejectedByConfigValidation', 0, () => {
      const insecure: string = 'http://gitee.com/openharmony/sample.png';
      expect(isHttpsUrl(insecure)).assertFalse();
      expect(isHttpUrl(insecure)).assertTrue();
      expect(schemeOf(insecure)).assertEqual('http');
      expect(hostOf(insecure)).assertEqual('gitee.com');
      expect(fileNameOf(insecure)).assertEqual('sample.png');
      const config = DownloadConfig.forUrl(insecure);
      expect(config.isValid()).assertFalse();
      expect(config.validate()).assertContain('url-not-https');
      expect(config.validate().indexOf('url-empty')).assertLess(0);
      expect(DownloadConfig.forUrl('https://gitee.com/openharmony/sample.png').isValid()).assertTrue();
    });

    /**
     * @tc.name   uppercaseSchemeIsNotTreatedAsHttps
     * @tc.desc   The page compares the literal lowercase prefix, so an uppercase scheme is not accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercaseSchemeIsNotTreatedAsHttps', 0, () => {
      const upper: string = 'HTTPS://gitee.com/openharmony/sample.png';
      expect(isHttpsUrl(upper)).assertFalse();
      expect(schemeOf(upper)).assertEqual('HTTPS');
      expect(hostOf(upper)).assertEqual('gitee.com');
      expect(schemeOf(upper) === 'https').assertFalse();
      const config = DownloadConfig.forUrl(upper);
      expect(config.validate()).assertContain('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(upper.toLowerCase().startsWith('https://')).assertTrue();
      expect(DownloadConfig.forUrl(upper.toLowerCase()).isValid()).assertTrue();
    });

    /**
     * @tc.name   httpsWithLeadingSpaceIsRejected
     * @tc.desc   A padded URL fails the prefix check, which is why the page must pass the raw literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('httpsWithLeadingSpaceIsRejected', 0, () => {
      const padded: string = ' https://gitee.com/openharmony/sample.png';
      expect(isHttpsUrl(padded)).assertFalse();
      expect(padded.indexOf('https://')).assertEqual(1);
      expect(hostOf(padded)).assertEqual('gitee.com');
      expect(DownloadConfig.forUrl(padded).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(padded).validate()).assertContain('url-not-https');
      const trimmed: string = padded.substring(1);
      expect(isHttpsUrl(trimmed)).assertTrue();
      expect(DownloadConfig.forUrl(trimmed).isValid()).assertTrue();
      expect(hostOf(trimmed)).assertEqual('gitee.com');
      const trailing: string = 'https://gitee.com/openharmony/sample.png ';
      expect(isHttpsUrl(trailing)).assertTrue();
      expect(hostOf(trailing)).assertEqual('gitee.com');
      expect(fileNameOf(trailing).endsWith(' ')).assertTrue();
      expect(trailing.length).assertEqual('https://gitee.com/openharmony/sample.png'.length + 1);
      expect(padded.indexOf(' ')).assertEqual(0);
    });

    /**
     * @tc.name   hostExtractionNeedsSchemeMarker
     * @tc.desc   Without the :// marker the host helper reports an empty authority instead of guessing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostExtractionNeedsSchemeMarker', 0, () => {
      expect(hostOf('https:/gitee.com/sample.png')).assertEqual('');
      expect(hostOf('gitee.com/sample.png')).assertEqual('');
      expect(hostOf('')).assertEqual('');
      expect(hostOf('https://')).assertEqual('');
      expect(hostOf('https:///sample.png')).assertEqual('');
      expect(hostOf('https://gitee.com/sample.png').length > 0).assertTrue();
      expect(schemeOf('https:/gitee.com/sample.png')).assertEqual('');
      expect(schemeOf('https://gitee.com/sample.png')).assertEqual('https');
      expect(isHttpsUrl('https:/gitee.com/sample.png')).assertFalse();
    });

    /**
     * @tc.name   hostExtractionStopsAtFirstPathSlash
     * @tc.desc   The authority ends at the first slash, so path segments never leak into the host value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostExtractionStopsAtFirstPathSlash', 0, () => {
      expect(hostOf('https://gitee.com/a/b/c.png')).assertEqual('gitee.com');
      expect(hostOf('https://gitee.com/a/b/c.png').indexOf('/')).assertEqual(-1);
      expect(hostOf('https://gitee.com/a/b/c.png').indexOf('a')).assertEqual(-1);
      expect(pathOf(URL_TASK_B).startsWith('/')).assertTrue();
      expect(pathOf(URL_TASK_B).indexOf('chenhaiwen2')).assertEqual(1);
      expect(pathOf('https://gitee.com')).assertEqual('');
      expect(pathOf('https://gitee.com/')).assertEqual('/');
      expect(hostOf('https://gitee.com/').length).assertEqual(9);
      expect(hostOf('https://gitee.com/') === '').assertFalse();
    });

    /**
     * @tc.name   pathAndFileNameMatchTheGiteeMediaAsset
     * @tc.desc   Each literal resolves to a distinct png file name under a gitee media path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pathAndFileNameMatchTheGiteeMediaAsset', 0, () => {
      expect(fileNameOf(URL_TASK_A)).assertEqual('favor_list_tea.png');
      expect(fileNameOf(URL_TASK_B)).assertEqual('after_cache.png');
      expect(fileNameOf(URL_TASK_C)).assertEqual('icon_main_color.png');
      expect(pathOf(URL_TASK_A).endsWith('/favor_list_tea.png')).assertTrue();
      expect(pathOf(URL_TASK_C).endsWith('/icon_main_color.png')).assertTrue();
      expect(fileNameOf('https://gitee.com/dir/')).assertEqual('file');
      expect(fileNameOf('https://gitee.com/dir/', 'asset')).assertEqual('asset');
      expect(fileNameOf('https://gitee.com/dir/file.png').length).assertEqual(8);
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(fileNameOf(TASK_URLS[index]).endsWith('.png')).assertTrue();
        expect(pathOf(TASK_URLS[index]).startsWith('/')).assertTrue();
      }
    });

    /**
     * @tc.name   queryMarkIsDetectedAndSeparated
     * @tc.desc   A signed download link keeps its query intact when split from the path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryMarkIsDetectedAndSeparated', 0, () => {
      const signed: string = 'https://gitee.com/openharmony/sample.png?token=abc123&expires=99';
      expect(hasQuery(signed)).assertTrue();
      expect(queryOf(signed)).assertEqual('?token=abc123&expires=99');
      expect(queryOf(signed).startsWith('?')).assertTrue();
      expect(pathOf(signed)).assertEqual('/openharmony/sample.png');
      expect(pathOf(signed).indexOf('?')).assertEqual(-1);
      expect(fileNameOf(signed)).assertEqual('sample.png?token=abc123&expires=99');
      expect(isHttpsUrl(signed)).assertTrue();
      expect(DownloadConfig.forUrl(signed).isValid()).assertTrue();
      expect(hostOf(signed)).assertEqual('gitee.com');
      expect(hasQuery('?token=only')).assertTrue();
      expect(queryOf('?token=only')).assertEqual('?token=only');
      expect(pathOf('?token=only')).assertEqual('');
      expect(hostOf(signed) === '').assertFalse();
      expect(queryOf(signed).indexOf('token') > 0).assertTrue();
    });

    /**
     * @tc.name   queryFreeUrlsReportNoQuery
     * @tc.desc   The three production literals carry no query string, so logs of them need no redaction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryFreeUrlsReportNoQuery', 0, () => {
      expect(hasQuery(URL_TASK_A)).assertFalse();
      expect(hasQuery(URL_TASK_B)).assertFalse();
      expect(hasQuery(URL_TASK_C)).assertFalse();
      expect(queryOf(URL_TASK_A)).assertEqual('');
      expect(queryOf(URL_TASK_B)).assertEqual('');
      expect(URL_TASK_A.indexOf('?')).assertEqual(-1);
      expect(URL_TASK_B.indexOf('?')).assertEqual(-1);
      expect(URL_TASK_C.indexOf('?')).assertEqual(-1);
      expect(fileNameOf(URL_TASK_A)).assertEqual(fileNameOf(URL_TASK_A).substring(0));
      expect(fileNameOf(URL_TASK_B).indexOf('?')).assertEqual(-1);
    });

    /**
     * @tc.name   offlineNetworkErrorIsRetryable
     * @tc.desc   The network drop code is one of the three codes the retry helper treats as transient.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('offlineNetworkErrorIsRetryable', 0, () => {
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(ERROR_NETWORK)).assertEqual(true);
      expect(ERROR_NETWORK).assertEqual(13400003);
      expect(ERROR_NETWORK).assertLarger(ERROR_NONE);
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      const policy = new RetryPolicy();
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_RUNNING)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_IDLE)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_COMPLETED)).assertFalse();
      expect(ERROR_NETWORK === ERROR_TIMEOUT).assertFalse();
      expect(ERROR_NETWORK >= ERROR_START).assertTrue();
      expect(isRetryableError(ERROR_NETWORK) === true).assertTrue();
      expect(isRetryableError(ERROR_START) && isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(ERROR_NETWORK.toString().length).assertEqual(8);
      expect(ERROR_NETWORK.toString().startsWith('1340')).assertTrue();
      const clock = new PollClock(POLL_INTERVAL_MS);
      clock.start();
      expect(clock.tick()).assertEqual(POLL_INTERVAL_MS);
      expect(clock.active).assertTrue();
      expect(clock.intervalMs === POLL_INTERVAL_MS).assertTrue();
      expect(clock.ticks).assertEqual(1);
    });

    /**
     * @tc.name   timeoutErrorIsRetryable
     * @tc.desc   A read timeout is transient as well, and is a different literal from the network drop.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timeoutErrorIsRetryable', 0, () => {
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(ERROR_TIMEOUT === ERROR_NETWORK).assertFalse();
      expect(ERROR_TIMEOUT).assertEqual(13400004);
      expect(ERROR_TIMEOUT > ERROR_NETWORK).assertTrue();
      const policy = new RetryPolicy(2, 150);
      expect(policy.shouldRetry(0, ERROR_TIMEOUT, STATUS_RUNNING)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_RUNNING)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_TIMEOUT, STATUS_RUNNING)).assertFalse();
      expect(policy.delayFor(1)).assertEqual(150);
      expect(policy.delayFor(2)).assertEqual(300);
      expect(classifyStartResult(ERROR_TIMEOUT)).assertEqual('failed');
    });

    /**
     * @tc.name   connectivityCreateErrorIsNotRetryable
     * @tc.desc   A configuration failure is permanent: the transient helper excludes the create code,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            even though the generic policy would still allow an attempt.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('connectivityCreateErrorIsNotRetryable', 0, () => {
      expect(ERROR_CREATE).assertEqual(13400001);
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(isRetryableError(ERROR_CREATE) === isRetryableError(ERROR_NETWORK)).assertFalse();
      const policy = new RetryPolicy();
      expect(policy.shouldRetry(0, ERROR_CREATE, STATUS_FAILED)).assertTrue();
      expect(isRetryableError(ERROR_CREATE) && policy.shouldRetry(0, ERROR_CREATE, STATUS_FAILED)).assertFalse();
      const graph = createTaskGraph();
      graph.startAll();
      expect(failOnce(graph, TASK_A, ERROR_CREATE)).assertEqual(ERROR_CREATE);
      expect(graph.taskAt(0).isFailed()).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   zeroErrorNeverTriggersRetry
     * @tc.desc   A zero code means the start succeeded, so no retry is requested for any attempt index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('zeroErrorNeverTriggersRetry', 0, () => {
      const policy = new RetryPolicy(5, POLL_INTERVAL_MS);
      for (let attempt = 0; attempt < 5; attempt++) {
        expect(policy.shouldRetry(attempt, ERROR_NONE, STATUS_RUNNING)).assertFalse();
      }
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_IDLE)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_COMPLETED)).assertFalse();
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
    });

    /**
     * @tc.name   startErrorIsRetryable
     * @tc.desc   The start code is transient, and the page aborts the callback for every non-zero code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startErrorIsRetryable', 0, () => {
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(ERROR_START).assertEqual(13400002);
      expect(shouldAbortStart(ERROR_START)).assertTrue();
      expect(shouldAbortStart(ERROR_NETWORK)).assertTrue();
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(classifyStartResult(ERROR_START)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
      expect(isRetryableError(ERROR_START)).assertEqual(!shouldAbortStart(ERROR_NONE));
      const policy = new RetryPolicy();
      expect(policy.shouldRetry(0, ERROR_START, STATUS_IDLE)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_START, STATUS_RUNNING)).assertTrue();
    });

    /**
     * @tc.name   retryLoopRecoversWithinBudget
     * @tc.desc   One offline failure followed by a retry lets the same row finish and the gate to open.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryLoopRecoversWithinBudget', 0, () => {
      const graph = createTaskGraph();
      const policy = new RetryPolicy(3, POLL_INTERVAL_MS);
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(policy.shouldRetry(0, graph.taskAt(0).lastErrorCode, graph.taskAt(0).status)).assertTrue();
      expect(policy.isExhausted(1)).assertFalse();
      graph.taskAt(0).reset();
      expect(graph.taskAt(0).start(POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(2 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(policy.isExhausted(1)).assertFalse();
      expect(policy.isExhausted(2)).assertFalse();
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(0);
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NONE);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.averageProgress()).assertEqual(200.0 / 3);
    });

    /**
     * @tc.name   retryLoopExhaustsBudgetOffline
     * @tc.desc   Three consecutive offline attempts use up the budget; the fourth is refused by the policy.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryLoopExhaustsBudgetOffline', 0, () => {
      const graph = createTaskGraph();
      const policy = new RetryPolicy(3, POLL_INTERVAL_MS);
      graph.startAll();
      let attempt = 1;
      for (let round = 0; round < 3; round++) {
        graph.taskAt(0).fail(ERROR_NETWORK);
        expect(graph.taskAt(0).isFailed()).assertTrue();
        expect(graph.taskAt(0).attempts).assertEqual(attempt);
        if (round < 2) {
          expect(policy.shouldRetry(attempt - 1, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
          graph.taskAt(0).reset();
          graph.taskAt(0).start(POLL_INTERVAL_MS * attempt);
          attempt = attempt + 1;
        }
      }
      expect(graph.taskAt(0).attempts).assertEqual(3);
      expect(policy.shouldRetry(3, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(0).startedAt).assertEqual(2 * POLL_INTERVAL_MS);
    });

    /**
     * @tc.name   recoveryRestoresFullProgressAndGate
     * @tc.desc   After connectivity returns, the retried row fills its bar and the third task becomes runnable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryRestoresFullProgressAndGate', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      graph.taskAt(1).reset();
      expect(graph.taskAt(1).isIdle()).assertTrue();
      graph.taskAt(1).start(POLL_INTERVAL_MS);
      expect(graph.taskAt(1).attempts).assertEqual(2);
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.runTaskCIfReady(2 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   offlineGateBlocksExclusiveStart
     * @tc.desc   With one dependency offline the exclusive task cannot be started by a poll or by a direct call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('offlineGateBlocksExclusiveStart', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.taskAt(0).isFailed()).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      expect(graph.runTaskCIfReady(2 * POLL_INTERVAL_MS)).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.hasShared(TASK_B)).assertFalse();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   connectivityReturnAllowsExclusiveStart
     * @tc.desc   The same graph unlocks the third task once the failed row is retried successfully.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('connectivityReturnAllowsExclusiveStart', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      graph.taskAt(0).reset();
      graph.taskAt(0).start(2 * POLL_INTERVAL_MS);
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(3 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(3 * POLL_INTERVAL_MS);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   pollKeepsTickingWhileOffline
     * @tc.desc   The interval keeps firing during an outage; each round counts but none can start the third task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollKeepsTickingWhileOffline', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      for (let round = 0; round < 6; round++) {
        expect(graph.pollTick(POLL_INTERVAL_MS * (round + 1))).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(6);
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks * POLL_INTERVAL_MS).assertEqual(1200);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   errorConstantsAreDistinct
     * @tc.desc   The five connectivity codes are unique, ordered and none of them collides with the success code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorConstantsAreDistinct', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_CREATE).assertEqual(13400001);
      expect(ERROR_START).assertEqual(13400002);
      expect(ERROR_NETWORK).assertEqual(13400003);
      expect(ERROR_TIMEOUT).assertEqual(13400004);
      expect(ERROR_CREATE > ERROR_NONE).assertTrue();
      expect(ERROR_START > ERROR_CREATE).assertTrue();
      expect(ERROR_NETWORK > ERROR_START).assertTrue();
      expect(ERROR_TIMEOUT > ERROR_NETWORK).assertTrue();
      const codes: number[] = [ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT, ERROR_TIMEOUT + 1];
      for (let outer = 0; outer < codes.length; outer++) {
        for (let inner = outer + 1; inner < codes.length; inner++) {
          expect(codes[outer] === codes[inner]).assertFalse();
        }
      }
      expect(isRetryableError(ERROR_NETWORK)).assertEqual(true);
      expect(isRetryableError(ERROR_CREATE)).assertEqual(false);
    });

    /**
     * @tc.name   failedConnectivityShowsInMetrics
     * @tc.desc   An offline run reports one failed row, two untouched rows and a zero success ratio.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedConnectivityShowsInMetrics', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(2).fail(ERROR_TIMEOUT);
      graph.taskAt(1).reportProgress(20);
      const metrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(20);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.averageProgress()).assertEqual(20.0 / 3);
      expect(graph.taskAt(2).status).assertEqual(STATUS_FAILED);
      expect(graph.taskAt(2).lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_FAILED);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.taskAt(2).label().endsWith('0%')).assertTrue();
      expect(graph.events.countOf('failed')).assertEqual(0);
    });

    /**
     * @tc.name   everyTaskConfigPassesHttpsValidation
     * @tc.desc   All three task configurations are https and identical to the independent literal oracle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyTaskConfigPassesHttpsValidation', 0, () => {
      const tasks: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < tasks.length; index++) {
        const config = DownloadConfig.forTask(tasks[index]);
        const oracle = expectedConfigFor(tasks[index]);
        expect(config.isValid()).assertTrue();
        expect(config.sameAs(oracle)).assertTrue();
        expect(isHttpsUrl(config.url)).assertTrue();
        expect(hostOf(config.url)).assertEqual('gitee.com');
        expect(config.validate().length).assertEqual(0);
        expect(config.clone().sameAs(config)).assertTrue();
      }
      const unknown = DownloadConfig.forTask('Z');
      expect(unknown.url).assertEqual('');
      expect(unknown.isValid()).assertFalse();
      expect(unknown.validate()).assertContain('url-empty');
      expect(unknown.validate()).assertContain('url-not-https');
      expect(unknown.fileName()).assertEqual('file');
      expect(unknown.action).assertEqual('DOWNLOAD');
      expect(unknown.overwrite).assertTrue();
      expect(unknown.saveas).assertEqual('./');
      expect(unknown.method).assertEqual('GET');
      expect(unknown.url.length).assertEqual(0);
      expect(unknown.validate().length).assertEqual(2);
      expect(unknown.isValid() === false).assertTrue();
    });

    /**
     * @tc.name   offlineFailuresKeepConfiguredMethod
     * @tc.desc   Retrying after an outage never rewrites the method, saveas path or overwrite flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('offlineFailuresKeepConfiguredMethod', 0, () => {
      const graph = createTaskGraph();
      const config = DownloadConfig.forTask(TASK_A);
      graph.startAll();
      for (let round = 0; round < 2; round++) {
        graph.taskAt(0).fail(ERROR_NETWORK);
        expect(graph.taskAt(0).isFailed()).assertTrue();
        graph.taskAt(0).reset();
        graph.taskAt(0).start(POLL_INTERVAL_MS * (round + 1));
        expect(config.method).assertEqual('GET');
        expect(config.saveas).assertEqual('./');
        expect(config.overwrite).assertTrue();
        expect(config.url).assertEqual(URL_TASK_A);
        expect(config.isValid()).assertTrue();
      }
      expect(graph.taskAt(0).attempts).assertEqual(3);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(config.action).assertEqual('DOWNLOAD');
      expect(hostOf(config.url)).assertEqual('gitee.com');
      expect(isHttpsUrl(config.url)).assertTrue();
    });

    /**
     * @tc.name   hostComparisonAcrossUrlForms
     * @tc.desc   The authority parser keeps a port and any userinfo, so callers must redact before comparing hosts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostComparisonAcrossUrlForms', 0, () => {
      expect(hostOf('https://gitee.com:443/a.png')).assertEqual('gitee.com:443');
      expect(hostOf('https://gitee.com:443/a.png') === 'gitee.com').assertFalse();
      expect(hostOf('https://gitee.com:443/a.png').indexOf(':443') > 0).assertTrue();
      const withUser = 'https://build:secret@gitee.com/a.png';
      expect(hostOf(withUser)).assertEqual('build:secret@gitee.com');
      expect(hostOf(withUser).indexOf('secret') > 0).assertTrue();
      expect(hostOf(withUser).indexOf('@') > 0).assertTrue();
      expect(hostOf('https://gitee.com/a.png')).assertEqual('gitee.com');
      expect(hostOf('https://Gitee.com/a.png')).assertEqual('Gitee.com');
      expect(hostOf('https://Gitee.com/a.png') === hostOf('https://gitee.com/a.png')).assertFalse();
      expect(hostOf('https://sub.gitee.com/a.png').endsWith('.gitee.com')).assertTrue();
    });

    /**
     * @tc.name   recoveredRunIsFullyCoherent
     * @tc.desc   A run that starts offline, retries once, then finishes leaves every model field in the success shape.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recoveredRunIsFullyCoherent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      graph.taskAt(0).reset();
      graph.taskAt(0).start(POLL_INTERVAL_MS);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(2 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.completeTaskC(3 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(NetworkMetrics.from(graph).successRatio()).assertEqual(1);
      expect(graph.totalProgress()).assertEqual(3 * PROGRESS_TOTAL);
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NONE);
      logStep('Connectivity', 'recoveredAttempts=' + String(graph.taskAt(0).attempts));
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.taskAt(2).finishedAt).assertEqual(3 * POLL_INTERVAL_MS);
      expect(graph.snapshotText().indexOf(STATUS_IDLE)).assertLess(0);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   pollCadenceMatchesTwoHundredMillisecondInterval
     * @tc.desc   The mirrored interval advances 200 ms per round, so five rounds cover one second.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollCadenceMatchesTwoHundredMillisecondInterval', 0, () => {
      const clock = new PollClock(POLL_INTERVAL_MS);
      expect(clock.intervalMs).assertEqual(200);
      clock.start();
      expect(clock.ticks).assertEqual(0);
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(600);
      expect(clock.tick()).assertEqual(800);
      expect(clock.tick()).assertEqual(1000);
      expect(clock.ticks).assertEqual(5);
      expect(clock.isDueAfter(5)).assertTrue();
      expect(clock.isDueAfter(6)).assertFalse();
      clock.stop();
      expect(clock.tick()).assertEqual(1000);
      expect(clock.active).assertFalse();
    });

    /**
     * @tc.name   offlineDurationKeepsAllBarsAtZero
     * @tc.desc   However long the outage lasts, no progress is invented for the three rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Connectivity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('offlineDurationKeepsAllBarsAtZero', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.taskAt(2).fail(ERROR_TIMEOUT);
      for (let round = 0; round < 10; round++) {
        graph.pollTick(POLL_INTERVAL_MS * (round + 1));
      }
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 0));
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(graph.taskAt(2).lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(graph.pollTicks).assertEqual(10);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(3);
    });

    // End of connectivity suite.
  });
}
