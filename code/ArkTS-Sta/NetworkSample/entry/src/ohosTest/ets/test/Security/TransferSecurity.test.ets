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
 * TransferSecurity suite.
 *
 * The page logs its configuration and task numbers through hilog. A download
 * URL may carry a signed query or embedded credentials, so this suite proves
 * that the redaction helpers remove both, that a redacted URL is safe to place
 * in the bounded log buffer, and that only https reaches request.agent.create.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116 config with url and saveas
 *   127-131 completion and progress logging
 *   135-146 error paths that log err.message and err.code
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  TASK_URLS,
  DownloadConfig,
  redactQuery,
  redactCredentials,
  isHttpsUrl,
  isHttpUrl,
  hasQuery,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  fileNameOf,
  LogBuffer,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  EventRecorder,
  createTaskGraph,
  textFingerprint,
  ERROR_NETWORK,
  TaskGraph
} from '../Shared/SharedDriver';

/** Applies both redaction steps in the order a logger should use them. */
function safeForLog(url: string): string {
  return redactQuery(redactCredentials(url));
}

export default function transferSecurityTest(): void {
  describe('TransferSecurity', () => {
    beforeAll(() => {
      logSuite('TransferSecurity', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferSecurity', 'end');
    });

    /**
     * @tc.name   redactQueryRemovesSignedToken
     * @tc.desc   A signed query is cut at the first question mark, so the token never reaches the log.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactQueryRemovesSignedToken', 0, () => {
      const signed: string = 'https://gitee.com/openharmony/sample.png?token=secret123&expires=99';
      const safe: string = redactQuery(signed);
      expect(safe).assertEqual('https://gitee.com/openharmony/sample.png');
      expect(safe.indexOf('token')).assertEqual(-1);
      expect(safe.indexOf('secret123')).assertEqual(-1);
      expect(safe.indexOf('?')).assertEqual(-1);
      expect(safe.length < signed.length).assertTrue();
      expect(safe.endsWith('sample.png')).assertTrue();
      expect(hasQuery(signed)).assertTrue();
      expect(hasQuery(safe)).assertFalse();
      expect(queryOf(safe)).assertEqual('');
      expect(isHttpsUrl(safe)).assertTrue();
      expect(safe.indexOf('expires')).assertEqual(-1);
      expect(safe.indexOf('=')).assertEqual(-1);
      expect(safe.indexOf('&')).assertEqual(-1);
      expect(pathOf(safe)).assertEqual('/openharmony/sample.png');
      expect(hostOf(safe)).assertEqual('gitee.com');
      expect(fileNameOf(safe)).assertEqual('sample.png');
      expect(safe.split('?').length).assertEqual(1);
    });

    /**
     * @tc.name   redactQueryKeepsQueryFreeUrl
     * @tc.desc   A URL without a query is returned byte for byte, so plain literals are unchanged in logs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactQueryKeepsQueryFreeUrl', 0, () => {
      expect(redactQuery(URL_TASK_A)).assertEqual(URL_TASK_A);
      expect(redactQuery(URL_TASK_B)).assertEqual(URL_TASK_B);
      expect(redactQuery(URL_TASK_C)).assertEqual(URL_TASK_C);
      expect(redactQuery(URL_TASK_A) === URL_TASK_A).assertTrue();
      expect(redactQuery(TASK_URLS[0])).assertEqual(TASK_URLS[0]);
      expect(redactQuery('')).assertEqual('');
      expect(redactQuery('https://gitee.com')).assertEqual('https://gitee.com');
      expect(redactQuery('https://gitee.com/a.png#frag')).assertEqual('https://gitee.com/a.png#frag');
      expect(redactQuery(URL_TASK_C).length).assertEqual(URL_TASK_C.length);
    });

    /**
     * @tc.name   redactQueryHandlesEmptyQueryMarker
     * @tc.desc   A trailing question mark with no values is still removed, leaving no dangling separator.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactQueryHandlesEmptyQueryMarker', 0, () => {
      expect(redactQuery('https://gitee.com/a.png?')).assertEqual('https://gitee.com/a.png');
      expect(redactQuery('https://gitee.com/a.png?')).assertEqual(redactQuery('https://gitee.com/a.png'));
      expect(redactQuery('?')).assertEqual('');
      expect(redactQuery('?a=1')).assertEqual('');
      expect(redactQuery('https://gitee.com/a.png?token=')).assertEqual('https://gitee.com/a.png');
      const empty: string = redactQuery('https://gitee.com/a.png?');
      expect(empty.endsWith('?')).assertFalse();
      expect(empty.endsWith('.png')).assertTrue();
      expect(redactQuery('https://gitee.com/a.png??')).assertEqual('https://gitee.com/a.png');
      expect(hasQuery(empty)).assertFalse();
    });

    /**
     * @tc.name   redactQueryOnlyCutsFirstQuestionMark
     * @tc.desc   Everything after the first marker is dropped, even when a second marker appears later.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactQueryOnlyCutsFirstQuestionMark', 0, () => {
      const nested: string = 'https://gitee.com/a.png?next=?token=abc';
      const safe: string = redactQuery(nested);
      expect(safe).assertEqual('https://gitee.com/a.png');
      expect(safe.indexOf('next')).assertEqual(-1);
      expect(safe.indexOf('abc')).assertEqual(-1);
      expect(nested.indexOf('?')).assertEqual(safe.length);
      expect(safe.indexOf('?')).assertEqual(-1);
      expect(redactQuery('https://gitee.com/a.png#x?y=1')).assertEqual('https://gitee.com/a.png#x');
      expect(redactQuery('https://gitee.com/a.png#x?y=1').indexOf('y=1')).assertEqual(-1);
      expect(redactQuery('https://gitee.com/a.png?x=1').indexOf('#')).assertEqual(-1);
      expect(redactQuery('https://gitee.com/a.png?x=1#f')).assertEqual('https://gitee.com/a.png');
    });

    /**
     * @tc.name   redactCredentialsMasksUserAndPassword
     * @tc.desc   Embedded user:password is replaced by a single mask while the host and path survive.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactCredentialsMasksUserAndPassword', 0, () => {
      const withSecret: string = 'https://builder:pa55word@gitee.com/openharmony/sample.png';
      const safe: string = redactCredentials(withSecret);
      expect(safe).assertEqual('https://***@gitee.com/openharmony/sample.png');
      expect(safe.indexOf('builder')).assertEqual(-1);
      expect(safe.indexOf('pa55word')).assertEqual(-1);
      expect(safe.indexOf('***@')).assertEqual(8);
      expect(safe.startsWith('https://')).assertTrue();
      expect(safe.endsWith('/openharmony/sample.png')).assertTrue();
      expect(hostOf(safe)).assertEqual('***@gitee.com');
      expect(hostOf(withSecret)).assertEqual('builder:pa55word@gitee.com');
      expect(isHttpsUrl(safe)).assertTrue();
      expect(safe.indexOf(':')).assertEqual(5);
      expect(safe.split('@').length).assertEqual(2);
      expect(safe.split(':').length).assertEqual(2);
      expect(pathOf(safe)).assertEqual('/openharmony/sample.png');
      expect(fileNameOf(safe)).assertEqual('sample.png');
      expect(safe.length < withSecret.length).assertTrue();
    });

    /**
     * @tc.name   redactCredentialsLeavesAnonymousUrl
     * @tc.desc   A URL without an at sign is returned unchanged, including one with a bare colon in the path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactCredentialsLeavesAnonymousUrl', 0, () => {
      expect(redactCredentials(URL_TASK_A)).assertEqual(URL_TASK_A);
      expect(redactCredentials('https://gitee.com/a:b/sample.png')).assertEqual('https://gitee.com/a:b/sample.png');
      expect(redactCredentials('https://gitee.com/a:b/sample.png').indexOf('***')).assertEqual(-1);
      expect(redactCredentials('gitee.com/@/sample.png')).assertEqual('gitee.com/@/sample.png');
      expect(redactCredentials('user:pass@gitee.com/a.png')).assertEqual('user:pass@gitee.com/a.png');
      expect(redactCredentials('')).assertEqual('');
      expect(redactCredentials('https://gitee.com')).assertEqual('https://gitee.com');
      expect(redactCredentials(URL_TASK_B) === URL_TASK_B).assertTrue();
      expect(hostOf(redactCredentials(URL_TASK_B))).assertEqual('gitee.com');
    });

    /**
     * @tc.name   redactCredentialsKeepsSchemeAndHost
     * @tc.desc   Only the authority userinfo changes; scheme, host, port and path stay readable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactCredentialsKeepsSchemeAndHost', 0, () => {
      const safe: string = redactCredentials('https://user:pw@gitee.com:8443/dir/file.png');
      expect(safe).assertEqual('https://***@gitee.com:8443/dir/file.png');
      expect(schemeOf(safe)).assertEqual('https');
      expect(hostOf(safe)).assertEqual('***@gitee.com:8443');
      expect(pathOf(safe)).assertEqual('/dir/file.png');
      expect(fileNameOf(safe)).assertEqual('file.png');
      expect(safe.indexOf('8443') > 0).assertTrue();
      expect(safe.indexOf('user')).assertEqual(-1);
      expect(safe.indexOf('pw')).assertEqual(-1);
      expect(safe.split('@').length).assertEqual(2);
    });

    /**
     * @tc.name   redactCredentialsMasksAnyUserInfoLength
     * @tc.desc   Short, long, empty and colon-less userinfo all collapse to the same single mask.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactCredentialsMasksAnyUserInfoLength', 0, () => {
      expect(redactCredentials('https://a@h/p')).assertEqual('https://***@h/p');
      expect(redactCredentials('https://:@h/p')).assertEqual('https://***@h/p');
      expect(redactCredentials('https://user@h/p')).assertEqual('https://***@h/p');
      expect(redactCredentials('https://verylongusername:verylongpassword@h/p')).assertEqual('https://***@h/p');
      expect(redactCredentials('https://u:p@h/p').length).assertEqual('https://***@h/p'.length);
      expect(redactCredentials('http://u:p@h/p')).assertEqual('http://***@h/p');
      expect(redactCredentials('http://u:p@h/p').startsWith('http://')).assertTrue();
      expect(redactCredentials('https://u:p@h/p').indexOf(':p@')).assertEqual(-1);
      expect(redactCredentials('https://u:p@h/p').indexOf('u:') >= 0).assertFalse();
    });

    /**
     * @tc.name   redactionCompositionHidesBothSecrets
     * @tc.desc   Applying both helpers in either order removes the userinfo and the query from one URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactionCompositionHidesBothSecrets', 0, () => {
      const full: string = 'https://builder:pa55@gitee.com/a.png?token=abc&sig=xyz';
      const first: string = redactQuery(redactCredentials(full));
      const second: string = redactCredentials(redactQuery(full));
      expect(first).assertEqual('https://***@gitee.com/a.png');
      expect(second).assertEqual(first);
      expect(first.indexOf('builder')).assertEqual(-1);
      expect(first.indexOf('pa55')).assertEqual(-1);
      expect(first.indexOf('token')).assertEqual(-1);
      expect(first.indexOf('sig')).assertEqual(-1);
      expect(first.indexOf('xyz')).assertEqual(-1);
      expect(first.split('?').length).assertEqual(1);
      expect(first.split('@').length).assertEqual(2);
      expect(safeForLog(full)).assertEqual(first);
    });

    /**
     * @tc.name   redactedUrlIsStillHttpsAndParseable
     * @tc.desc   The masked URL still parses as an https download target, so redaction does not break validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactedUrlIsStillHttpsAndParseable', 0, () => {
      const safe: string = safeForLog('https://u:p@gitee.com/dir/file.png?x=1');
      expect(isHttpsUrl(safe)).assertTrue();
      expect(schemeOf(safe)).assertEqual('https');
      expect(hostOf(safe)).assertEqual('***@gitee.com');
      expect(pathOf(safe)).assertEqual('/dir/file.png');
      expect(fileNameOf(safe)).assertEqual('file.png');
      expect(hasQuery(safe)).assertFalse();
      expect(safe.indexOf('?')).assertEqual(-1);
      expect(safe.startsWith('https://***@')).assertTrue();
      expect(DownloadConfig.forUrl(safe).isValid()).assertTrue();
      expect(DownloadConfig.forUrl(safe).fileName()).assertEqual('file.png');
    });

    /**
     * @tc.name   logBufferRecordsOnlyRedactedUrl
     * @tc.desc   A log line built from the redacted URL never contains the token or the credentials.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferRecordsOnlyRedactedUrl', 0, () => {
      const log = new LogBuffer();
      const secret: string = 'https://u:p@gitee.com/a.png?token=abc123';
      log.info('download ' + safeForLog(secret));
      expect(log.size()).assertEqual(1);
      expect(log.contains('abc123')).assertFalse();
      expect(log.contains('token')).assertFalse();
      expect(log.contains('u:p@')).assertFalse();
      expect(log.contains('https://***@gitee.com/a.png')).assertTrue();
      expect(log.contains('download')).assertTrue();
      expect(log.lines[0].startsWith(LEVEL_INFO)).assertTrue();
      expect(log.levels[0]).assertEqual(LEVEL_INFO);
      expect(log.trace().indexOf('abc123')).assertEqual(-1);
      log.warn('query stripped');
      expect(log.contains('abc123')).assertFalse();
      expect(log.size()).assertEqual(2);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(log.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(log.trace().split('|').length).assertEqual(2);
      expect(log.lines[1]).assertEqual('WARN query stripped');
      expect(log.contains('https://***@gitee.com/a.png')).assertTrue();
    });

    /**
     * @tc.name   logBufferLevelsFollowApiUsed
     * @tc.desc   The buffer mirrors the level of each call so a reviewer can see warning and error paths.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferLevelsFollowApiUsed', 0, () => {
      const log = new LogBuffer(8);
      log.info('started');
      log.warn('retrying');
      log.error('failed');
      log.info('done');
      expect(log.size()).assertEqual(4);
      expect(log.levels.length).assertEqual(4);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(2);
      expect(log.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(log.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(log.lines[0]).assertEqual('INFO started');
      expect(log.lines[1]).assertEqual('WARN retrying');
      expect(log.lines[2]).assertEqual('ERROR failed');
      expect(log.lines[3]).assertEqual('INFO done');
      expect(log.trace().split('|').length).assertEqual(4);
      expect(log.countLevel('DEBUG')).assertEqual(0);
      expect(log.contains(LEVEL_WARN)).assertTrue();
      expect(log.lines[1].startsWith(LEVEL_WARN)).assertTrue();
      expect(log.lines[2].endsWith('failed')).assertTrue();
    });

    /**
     * @tc.name   logBufferTrimKeepsNewestLines
     * @tc.desc   Once the limit is reached the oldest entries are dropped and the newest remain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferTrimKeepsNewestLines', 0, () => {
      const log = new LogBuffer(3);
      log.info('1');
      log.info('2');
      expect(log.size()).assertEqual(2);
      log.info('3');
      expect(log.size()).assertEqual(3);
      log.info('4');
      expect(log.size()).assertEqual(3);
      expect(log.lines[0]).assertEqual('INFO 2');
      log.info('5');
      expect(log.lines[0]).assertEqual('INFO 3');
      expect(log.lines[2]).assertEqual('INFO 5');
      expect(log.contains('INFO 5')).assertTrue();
      expect(log.contains('INFO 1')).assertFalse();
      expect(log.levels.length).assertEqual(3);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(log.trace()).assertEqual('INFO 3|INFO 4|INFO 5');
      expect(log.lines[1]).assertEqual('INFO 4');
      expect(log.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   logBufferContainsFindsRetainedFragment
     * @tc.desc   The text search helper reports only fragments that are still inside the retained window.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferContainsFindsRetainedFragment', 0, () => {
      const log = new LogBuffer(64);
      expect(log.contains('anything')).assertFalse();
      log.info('task A started');
      log.warn('task B slow');
      log.error('task C blocked');
      expect(log.contains('task')).assertTrue();
      expect(log.contains('task A started')).assertTrue();
      expect(log.contains('slow')).assertTrue();
      expect(log.contains('blocked')).assertTrue();
      expect(log.contains('task D')).assertFalse();
      expect(log.contains('')).assertTrue();
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.contains('task')).assertFalse();
      expect(log.levels.length).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.countLevel(LEVEL_INFO)).assertEqual(0);
      log.info('after clear');
      expect(log.size()).assertEqual(1);
      expect(log.trace()).assertEqual('INFO after clear');
    });

    /**
     * @tc.name   configValidationRejectsHttpTransfer
     * @tc.desc   An http download is refused before request.agent.create, so the payload never leaves in clear text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configValidationRejectsHttpTransfer', 0, () => {
      const config = DownloadConfig.forUrl('http://gitee.com/openharmony/sample.png');
      expect(isHttpUrl(config.url)).assertTrue();
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.isValid()).assertFalse();
      expect(config.validate()).assertContain('url-not-https');
      expect(config.validate().length).assertEqual(1);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
      expect(config.overwrite).assertTrue();
      expect(schemeOf(config.url)).assertEqual('http');
      expect(schemeOf(config.url) === 'https').assertFalse();
      const upgraded = DownloadConfig.forUrl('https://gitee.com/openharmony/sample.png');
      expect(upgraded.isValid()).assertTrue();
      expect(upgraded.url.indexOf('http://')).assertEqual(-1);
      expect(upgraded.url.startsWith('https://')).assertTrue();
      expect(config.url.startsWith('http://')).assertTrue();
      expect(config.validate().indexOf('action-not-download')).assertLess(0);
      expect(config.validate().indexOf('method-unsupported')).assertLess(0);
      expect(config.fileName()).assertEqual('sample.png');
      expect(redactQuery(config.url)).assertEqual(config.url);
    });

    /**
     * @tc.name   configValidationRejectsNonHttpsSchemes
     * @tc.desc   file, ftp, ws, javascript and data URLs are all rejected by the https prefix rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configValidationRejectsNonHttpsSchemes', 0, () => {
      const unsafe: string[] = [
        'file:///data/storage/sample.png',
        'ftp://gitee.com/sample.png',
        'ws://gitee.com/sample.png',
        'javascript:alert(1)',
        'data:image/png;base64,AAAA',
        'blob:https://gitee.com/sample'
      ];
      for (let index = 0; index < unsafe.length; index++) {
        const config = DownloadConfig.forUrl(unsafe[index]);
        expect(isHttpsUrl(unsafe[index])).assertFalse();
        expect(config.isValid()).assertFalse();
        expect(config.validate()).assertContain('url-not-https');
        expect(config.validate().length).assertEqual(1);
      }
      expect(schemeOf(unsafe[0])).assertEqual('file');
      expect(schemeOf(unsafe[1])).assertEqual('ftp');
      expect(schemeOf(unsafe[3])).assertEqual('');
      expect(DownloadConfig.forUrl(unsafe[2]).url).assertEqual(unsafe[2]);
      expect(DownloadConfig.forUrl(unsafe[4]).fileName()).assertEqual('png;base64,AAAA');
      expect(DownloadConfig.forUrl(unsafe[5]).isValid()).assertFalse();
      expect(unsafe.length).assertEqual(6);
      expect(isHttpsUrl('wss://gitee.com/a.png')).assertFalse();
      expect(isHttpsUrl('HTTPS://gitee.com/a.png')).assertFalse();
      expect(isHttpsUrl('https://gitee.com/a.png')).assertTrue();
      expect(DownloadConfig.forUrl('https://gitee.com/a.png?x=1').isValid()).assertTrue();
      expect(DownloadConfig.forUrl('https://gitee.com/a.png?x=1').validate().length).assertEqual(0);
      expect(DownloadConfig.forUrl('ws://gitee.com/a.png').validate()[0]).assertEqual('url-not-https');
    });

    /**
     * @tc.name   schemeRelativeUrlIsRejected
     * @tc.desc   A protocol relative URL has no https prefix and cannot inherit the page scheme.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemeRelativeUrlIsRejected', 0, () => {
      const relative: string = '//gitee.com/openharmony/sample.png';
      expect(relative.startsWith('https://')).assertFalse();
      expect(isHttpsUrl(relative)).assertFalse();
      expect(isHttpUrl(relative)).assertFalse();
      expect(schemeOf(relative)).assertEqual('');
      expect(hostOf(relative)).assertEqual('');
      expect(pathOf(relative)).assertEqual('//gitee.com/openharmony/sample.png');
      const config = DownloadConfig.forUrl(relative);
      expect(config.isValid()).assertFalse();
      expect(config.validate()).assertContain('url-not-https');
      expect(config.validate().length).assertEqual(1);
      expect(config.url.indexOf('gitee.com') > 0).assertTrue();
      expect(pathOf(config.url).startsWith('//')).assertTrue();
      expect(fileNameOf(config.url)).assertEqual('sample.png');
      expect(DownloadConfig.forUrl('https://gitee.com/openharmony/sample.png').isValid()).assertTrue();
      expect(relative.indexOf('://')).assertEqual(-1);
    });

    /**
     * @tc.name   productionUrlsCarryNoCredentialsOrQuery
     * @tc.desc   The three shipped literals contain no at sign and no question mark, so nothing needs masking.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('productionUrlsCarryNoCredentialsOrQuery', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        expect(url.indexOf('@')).assertEqual(-1);
        expect(hasQuery(url)).assertFalse();
        expect(queryOf(url)).assertEqual('');
        expect(redactQuery(url)).assertEqual(url);
        expect(redactCredentials(url)).assertEqual(url);
        expect(safeForLog(url)).assertEqual(url);
        expect(hostOf(url)).assertEqual('gitee.com');
        expect(hostOf(url).indexOf('@')).assertEqual(-1);
      }
      expect(TASK_URLS.length).assertEqual(3);
      expect(hostOf(TASK_URLS[0]) === hostOf(TASK_URLS[2])).assertTrue();
    });

    /**
     * @tc.name   redactingProductionUrlsIsIdentity
     * @tc.desc   Both helpers are identity functions on the shipped literals, so logs keep the real file names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactingProductionUrlsIsIdentity', 0, () => {
      expect(redactCredentials(URL_TASK_A)).assertEqual(URL_TASK_A);
      expect(redactCredentials(URL_TASK_B)).assertEqual(URL_TASK_B);
      expect(redactCredentials(URL_TASK_C)).assertEqual(URL_TASK_C);
      expect(redactQuery(URL_TASK_A)).assertEqual(URL_TASK_A);
      expect(redactQuery(URL_TASK_B)).assertEqual(URL_TASK_B);
      expect(redactQuery(URL_TASK_C)).assertEqual(URL_TASK_C);
      expect(fileNameOf(URL_TASK_A)).assertEqual('favor_list_tea.png');
      expect(fileNameOf(safeForLog(URL_TASK_C))).assertEqual('icon_main_color.png');
      expect(safeForLog(URL_TASK_B).length).assertEqual(URL_TASK_B.length);
      expect(safeForLog(URL_TASK_A) === URL_TASK_A).assertTrue();
      expect(redactQuery(redactCredentials(URL_TASK_B))).assertEqual(URL_TASK_B);
      expect(redactCredentials(redactQuery(URL_TASK_B))).assertEqual(URL_TASK_B);
      expect(safeForLog(URL_TASK_B).indexOf('@')).assertEqual(-1);
      expect(hasQuery(safeForLog(URL_TASK_B))).assertFalse();
    });

    /**
     * @tc.name   eventRecorderStoresOnlyRedactedDetails
     * @tc.desc   A recorder fed with redacted details cannot reproduce a token, yet still identifies the task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventRecorderStoresOnlyRedactedDetails', 0, () => {
      const recorder = new EventRecorder();
      const secret: string = 'https://u:p@gitee.com/a.png?token=topsecret';
      recorder.record('config', safeForLog(secret));
      recorder.record('start', TASK_A);
      recorder.record('done', TASK_A);
      expect(recorder.size()).assertEqual(3);
      expect(recorder.trace().indexOf('topsecret')).assertEqual(-1);
      expect(recorder.trace().indexOf('u:p@')).assertEqual(-1);
      expect(recorder.countOf('config')).assertEqual(1);
      expect(recorder.countOf('start')).assertEqual(1);
      expect(recorder.countOf('done')).assertEqual(1);
      expect(recorder.last()).assertEqual('done:A');
      expect(recorder.trace().indexOf('https://***@gitee.com/a.png') > 0).assertTrue();
      expect(recorder.fingerprint()).assertLarger(0);
      expect(recorder.trace().split('|').length).assertEqual(3);
      expect(recorder.trace().startsWith('config:')).assertTrue();
      expect(recorder.trace().endsWith('done:A')).assertTrue();
      expect(recorder.entries[0].indexOf('token')).assertEqual(-1);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(recorder.trace()));
    });

    /**
     * @tc.name   graphFailureLoggingUsesCodeOnly
     * @tc.desc   A failure line can carry the numeric code and task number without the server message.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphFailureLoggingUsesCodeOnly', 0, () => {
      const graph = createTaskGraph();
      const log = new LogBuffer(32);
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      log.error('task ' + TASK_A + ' failed code ' + String(graph.taskAt(0).lastErrorCode));
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(log.size()).assertEqual(1);
      expect(log.contains('13400003')).assertTrue();
      expect(log.contains('task A')).assertTrue();
      expect(log.contains('https://')).assertFalse();
      expect(log.contains('token')).assertFalse();
      expect(log.lines[0].startsWith(LEVEL_ERROR)).assertTrue();
      expect(log.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(graph.taskAt(0).status).assertEqual('failed');
      expect(log.trace()).assertEqual('ERROR task A failed code 13400003');
      expect(log.trace().split(' ').length).assertEqual(6);
      expect(log.trace().indexOf('message')).assertEqual(-1);
    });

    /**
     * @tc.name   tokenNeverAppearsInLongBuffer
     * @tc.desc   Fifty redacted log lines retain no token and no userinfo anywhere in the window.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tokenNeverAppearsInLongBuffer', 0, () => {
      const log = new LogBuffer(64);
      const raw: string = 'https://user:pw@gitee.com/a.png?token=abc123';
      for (let index = 0; index < 50; index++) {
        log.info('attempt ' + String(index) + ' ' + safeForLog(raw));
      }
      expect(log.size()).assertEqual(50);
      expect(log.levels.length).assertEqual(50);
      expect(log.contains('abc123')).assertFalse();
      expect(log.contains('token')).assertFalse();
      expect(log.contains('user:pw')).assertFalse();
      expect(log.contains('***@gitee.com')).assertTrue();
      expect(log.trace().indexOf('?') >= 0).assertFalse();
      expect(log.countLevel(LEVEL_INFO)).assertEqual(50);
      expect(log.lines[49].indexOf('attempt 49') > 0).assertTrue();
      expect(log.lines[0].indexOf('attempt 0') > 0).assertTrue();
      expect(log.trace().indexOf('http://')).assertEqual(-1);
      expect(log.trace().indexOf('@gitee.com')).assertLarger(0);
      expect(log.trace().split('|').length).assertEqual(50);
      expect(log.contains('attempt 25')).assertTrue();
      expect(log.contains('attempt 50')).assertFalse();
    });

    /**
     * @tc.name   maskedAuthorityPreventsSecretInHost
     * @tc.desc   The authority parser exposes userinfo, so only the masked URL may be used for trust decisions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('maskedAuthorityPreventsSecretInHost', 0, () => {
      const withUser: string = 'https://deploy:secret@gitee.com/a.png';
      const masked: string = safeForLog(withUser);
      expect(hostOf(withUser)).assertEqual('deploy:secret@gitee.com');
      expect(hostOf(withUser).indexOf('secret') > 0).assertTrue();
      expect(hostOf(masked)).assertEqual('***@gitee.com');
      expect(hostOf(masked).indexOf('deploy')).assertEqual(-1);
      expect(hostOf(masked).indexOf('secret')).assertEqual(-1);
      expect(hostOf(masked).endsWith('gitee.com')).assertTrue();
      expect(hostOf(masked).indexOf(':')).assertEqual(-1);
      expect(isHttpsUrl(masked)).assertTrue();
      expect(fileNameOf(masked)).assertEqual('a.png');
      expect(masked.indexOf('deploy:secret')).assertEqual(-1);
      expect(masked.startsWith('https://***@')).assertTrue();
      expect(hostOf(masked).startsWith('***@')).assertTrue();
      expect(safeForLog(masked)).assertEqual(masked);
      expect(pathOf(masked)).assertEqual('/a.png');
    });

    /**
     * @tc.name   doubleRedactionIsIdempotent
     * @tc.desc   Repeating either helper on its own output changes nothing, so layered logging is safe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('doubleRedactionIsIdempotent', 0, () => {
      const once: string = redactCredentials('https://u:p@gitee.com/a.png');
      const twice: string = redactCredentials(once);
      expect(once).assertEqual('https://***@gitee.com/a.png');
      expect(twice).assertEqual(once);
      expect(redactCredentials(twice)).assertEqual(once);
      const queryOnce: string = redactQuery('https://gitee.com/a.png?t=1');
      expect(redactQuery(queryOnce)).assertEqual(queryOnce);
      expect(redactQuery(redactQuery(queryOnce))).assertEqual('https://gitee.com/a.png');
      expect(redactQuery(redactCredentials(once))).assertEqual(once);
      expect(redactCredentials(redactQuery(once))).assertEqual(once);
      expect(safeForLog(once)).assertEqual(once);
      expect(safeForLog(safeForLog('https://u:p@h/a?x=1'))).assertEqual('https://***@h/a');
      expect(redactCredentials(redactCredentials('https://u:p@h/a'))).assertEqual('https://***@h/a');
      expect(redactQuery(redactQuery('https://h/a?x=1'))).assertEqual('https://h/a');
      expect(once.split('***@').length).assertEqual(2);
      expect(once.indexOf('u')).assertEqual(-1);
    });

    /**
     * @tc.name   emptyAndUnusualInputsAreSafe
     * @tc.desc   Empty strings, bare schemes and marker-only inputs never throw or invent characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyAndUnusualInputsAreSafe', 0, () => {
      expect(redactQuery('')).assertEqual('');
      expect(redactCredentials('')).assertEqual('');
      expect(redactQuery('?')).assertEqual('');
      expect(redactQuery('a?b')).assertEqual('a');
      expect(redactCredentials('https://')).assertEqual('https://');
      expect(redactCredentials('https://@')).assertEqual('https://***@');
      expect(redactCredentials('://u:p@h')).assertEqual('://u:p@h');
      expect(redactCredentials('HTTPS://u:p@h').indexOf('u:p') >= 0).assertFalse();
      expect(redactQuery('   ')).assertEqual('   ');
      expect(redactCredentials('   ')).assertEqual('   ');
      expect(safeForLog('?')).assertEqual('');
      expect(hostOf(redactCredentials('https://@h/p'))).assertEqual('***@h');
      expect(redactQuery('#frag')).assertEqual('#frag');
      expect(redactCredentials('https://u:p@')).assertEqual('https://***@');
      expect(redactQuery('a?b?c').split('?').length).assertEqual(1);
      expect(redactCredentials('x://@').split('@').length).assertEqual(2);
      expect(redactCredentials('x://@').indexOf('***@') > 0).assertTrue();
      expect(redactQuery('a?b?c')).assertEqual('a');
    });

    /**
     * @tc.name   fragmentHandlingUnderRedaction
     * @tc.desc   A fragment before the query marker survives; a marker before it removes both.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fragmentHandlingUnderRedaction', 0, () => {
      expect(redactQuery('https://gitee.com/a.png#section?x=1')).assertEqual('https://gitee.com/a.png#section');
      expect(redactQuery('https://gitee.com/a.png?x=1#section')).assertEqual('https://gitee.com/a.png');
      expect(redactQuery('https://gitee.com/a.png#section')).assertEqual('https://gitee.com/a.png#section');
      expect(redactQuery('https://gitee.com/a.png?x=1#section').indexOf('#')).assertEqual(-1);
      expect(redactQuery('https://gitee.com/a.png#section?x=1').indexOf('#section') > 0).assertTrue();
      expect(redactQuery('https://gitee.com/a.png#section?x=1').indexOf('x=1')).assertEqual(-1);
      expect(redactCredentials('https://u:p@gitee.com/a.png#s?x=1').indexOf('u:p')).assertEqual(-1);
      expect(fileNameOf(redactQuery('https://gitee.com/a.png?x=1#s'))).assertEqual('a.png');
      expect(safeForLog('https://u:p@gitee.com/a.png#s?x=1')).assertEqual('https://***@gitee.com/a.png#s');
    });

    /**
     * @tc.name   queryRedactionRestoresFileNameExtraction
     * @tc.desc   Removing the query first makes the file name and extension helpers produce the cache name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryRedactionRestoresFileNameExtraction', 0, () => {
      const signed: string = 'https://gitee.com/dir/photo.png?token=abc';
      expect(fileNameOf(signed)).assertEqual('photo.png?token=abc');
      expect(fileNameOf(signed).endsWith('.png')).assertFalse();
      expect(fileNameOf(redactQuery(signed))).assertEqual('photo.png');
      expect(fileNameOf(redactQuery(signed)).endsWith('.png')).assertTrue();
      expect(fileNameOf(redactQuery(signed)).indexOf('?')).assertEqual(-1);
      expect(hasQuery(redactQuery(signed))).assertFalse();
      expect(DownloadConfig.forUrl(signed).fileName()).assertEqual('photo.png?token=abc');
      expect(DownloadConfig.forUrl(redactQuery(signed)).fileName()).assertEqual('photo.png');
      expect(DownloadConfig.forUrl(redactQuery(signed)).isValid()).assertTrue();
    });

    /**
     * @tc.name   singleLineBufferKeepsOnlyLatest
     * @tc.desc   A one-line buffer keeps exactly the most recent entry and drops the rest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleLineBufferKeepsOnlyLatest', 0, () => {
      const log = new LogBuffer(1);
      log.info('first');
      expect(log.size()).assertEqual(1);
      expect(log.lines[0]).assertEqual('INFO first');
      log.warn('second');
      expect(log.size()).assertEqual(1);
      expect(log.lines[0]).assertEqual('WARN second');
      log.error('third');
      expect(log.lines[0]).assertEqual('ERROR third');
      expect(log.levels.length).assertEqual(1);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(log.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(log.contains('first')).assertFalse();
      expect(log.contains('third')).assertTrue();
      const tokenLine: string = 'download https://gitee.com/a.png';
      log.error(tokenLine);
      expect(log.size()).assertEqual(1);
      expect(log.lines[0].indexOf('token')).assertEqual(-1);
      expect(log.lines[0]).assertEqual('ERROR ' + tokenLine);
      expect(log.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(log.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(log.trace().split('|').length).assertEqual(1);
    });

    /**
     * @tc.name   redactedTransferOfAllThreeTasks
     * @tc.desc   One redacted log line per task keeps the file names while proving no secret can leak.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactedTransferOfAllThreeTasks', 0, () => {
      const graph = createTaskGraph();
      const log = new LogBuffer(16);
      graph.startAll();
      for (let index = 0; index < graph.tasks.length; index++) {
        const url: string = graph.taskAt(index).url;
        log.info('task ' + graph.taskAt(index).taskNo + ' ' + safeForLog(url));
        expect(redactQuery(url)).assertEqual(url);
        expect(redactCredentials(url)).assertEqual(url);
        expect(isHttpsUrl(url)).assertTrue();
        expect(DownloadConfig.forUrl(url).isValid()).assertTrue();
      }
      expect(log.size()).assertEqual(3);
      expect(log.contains('favor_list_tea.png')).assertTrue();
      expect(log.contains('after_cache.png')).assertTrue();
      expect(log.contains('icon_main_color.png')).assertTrue();
      expect(log.contains('token')).assertFalse();
      expect(log.contains('@')).assertFalse();
      expect(log.trace().indexOf('?')).assertEqual(-1);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(log.lines[0].indexOf('task A') > 0).assertTrue();
      expect(log.lines[1].indexOf('task B') > 0).assertTrue();
      expect(log.lines[2].indexOf('task C') > 0).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   transferSecurityEndsClean
     * @tc.desc   After a full run the buffer holds only safe lines and the graph holds three https configs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferSecurity scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('transferSecurityEndsClean', 0, () => {
      const graph = createTaskGraph();
      const log = new LogBuffer(64);
      graph.startAll();
      log.info('start ' + safeForLog('https://u:p@gitee.com/a.png?token=abc'));
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      for (let index = 0; index < graph.tasks.length; index++) {
        log.info('done ' + graph.taskAt(index).taskNo + ' ' + String(graph.taskAt(index).progress));
      }
      expect(log.size()).assertEqual(4);
      expect(log.contains('abc')).assertFalse();
      expect(log.contains('u:p')).assertFalse();
      expect(log.contains('done C 100')).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(DownloadConfig.forTask(TASK_A).isValid()).assertTrue();
      expect(isHttpsUrl(graph.taskAt(2).url)).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.trace().indexOf('?')).assertEqual(-1);
      expect(log.lines[1].indexOf('done A 100') > 0).assertTrue();
      expect(log.lines[3].indexOf('done C 100') > 0).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(log.levels.length).assertEqual(4);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(4);
      expect(log.contains('https://***@gitee.com/a.png')).assertTrue();
    });

    // End of transfer security suite.
  });
}
