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
  fileNameOf,
  extensionOf,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  isHttpUrl,
  isHttpsUrl,
  hasQuery,
  redactQuery,
  redactCredentials,
  hasDuplicateStrings,
  uniqueStrings,
  countOf,
  joined,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C
} from '../Shared/SharedDriver';

/**
 * Input validation suite for the url argument of download().
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  url is forwarded verbatim into the request.agent.Config
 *   151-171  the three long gitee URL literals passed by the runTask helpers
 *   127-141  hilog messages that must not print a token from the url
 *
 * The helpers under test are pure string readers, so every case states the exact
 * input string and the exact expected part instead of relying on a URL parser.
 */
export default function transferInputTest(): void {
  describe('TransferInput', () => {
    beforeAll(() => {
      logSuite('TransferInput', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferInput', 'end');
    });

    /**
     * @tc.name   emptyUrlHasNoFileAndNoScheme
     * @tc.desc   An empty input yields the fallback name and empty scheme and host parts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyUrlHasNoFileAndNoScheme', 0, () => {
      expect(fileNameOf('')).assertEqual('file');
      expect(schemeOf('')).assertEqual('');
      expect(hostOf('')).assertEqual('');
      expect(pathOf('')).assertEqual('');
      expect(queryOf('')).assertEqual('');
      expect(extensionOf('')).assertEqual('');
      expect(hasQuery('')).assertFalse();
      expect(isHttpsUrl('')).assertFalse();
    });

    /**
     * @tc.name   emptyUrlAcceptsCustomFallback
     * @tc.desc   The fallback argument of fileNameOf replaces the default only when the tail is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyUrlAcceptsCustomFallback', 0, () => {
      expect(fileNameOf('', 'download')).assertEqual('download');
      expect(fileNameOf('', '')).assertEqual('');
      expect(fileNameOf('', 'file')).assertEqual('file');
      expect(fileNameOf('https://example.com/a.png', 'download')).assertEqual('a.png');
      expect(fileNameOf('https://example.com/a.png', '')).assertEqual('a.png');
      expect(fileNameOf('https://example.com/', 'named.bin')).assertEqual('named.bin');
      expect(fileNameOf('https://example.com/', '')).assertEqual('');
    });

    /**
     * @tc.name   whitespaceUrlIsNotEmptyString
     * @tc.desc   A whitespace-only input is not empty, so it is returned as the file name verbatim.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('whitespaceUrlIsNotEmptyString', 0, () => {
      const blank: string = '   ';
      expect(blank.length).assertEqual(3);
      expect(fileNameOf(blank)).assertEqual('   ');
      expect(fileNameOf(blank) === 'file').assertFalse();
      expect(schemeOf(blank)).assertEqual('');
      expect(hostOf(blank)).assertEqual('');
      expect(pathOf(blank)).assertEqual('');
      expect(isHttpsUrl(blank)).assertFalse();
    });

    /**
     * @tc.name   whitespaceInsideFileNameIsPreserved
     * @tc.desc   Spaces inside the last segment are part of the download name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('whitespaceInsideFileNameIsPreserved', 0, () => {
      const url: string = 'https://example.com/media/my report final.png';
      expect(fileNameOf(url)).assertEqual('my report final.png');
      expect(fileNameOf(url).indexOf(' ')).assertLarger(0);
      expect(fileNameOf(url).split(' ').length).assertEqual(3);
      expect(extensionOf(url)).assertEqual('.png');
      expect(pathOf(url)).assertEqual('/media/my report final.png');
      expect(fileNameOf(url).endsWith('.png')).assertTrue();
      expect(hostOf(url)).assertEqual('example.com');
    });

    /**
     * @tc.name   whitespaceAroundSchemeBreaksDetection
     * @tc.desc   Surrounding spaces prevent both https detection and scheme extraction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('whitespaceAroundSchemeBreaksDetection', 0, () => {
      const url: string = ' https://example.com/a.png ';
      expect(isHttpsUrl(url)).assertFalse();
      expect(isHttpUrl(url)).assertFalse();
      expect(schemeOf(url)).assertEqual(' https');
      expect(hostOf(url)).assertEqual('example.com');
      expect(fileNameOf(url)).assertEqual('a.png ');
      expect(extensionOf(url)).assertEqual('.png ');
      expect(pathOf(url)).assertEqual('/a.png ');
    });

    /**
     * @tc.name   uppercaseSchemeIsNotHttps
     * @tc.desc   The scheme check is case sensitive, so an uppercase scheme fails both predicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('uppercaseSchemeIsNotHttps', 0, () => {
      const url: string = 'HTTPS://gitee.com/cases/icon_main_color.png';
      expect(isHttpsUrl(url)).assertFalse();
      expect(isHttpUrl(url)).assertFalse();
      expect(schemeOf(url)).assertEqual('HTTPS');
      expect(schemeOf(url).length).assertEqual(5);
      expect(hostOf(url)).assertEqual('gitee.com');
      expect(fileNameOf(url)).assertEqual('icon_main_color.png');
      expect(url.toLowerCase().startsWith('https://')).assertTrue();
    });

    /**
     * @tc.name   uppercaseSchemeStillHasHostAndPath
     * @tc.desc   Host and path readers are independent of the scheme predicate, so they still work.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercaseSchemeStillHasHostAndPath', 0, () => {
      const url: string = 'HTTP://Example.COM/Media/Photo.PNG';
      expect(schemeOf(url)).assertEqual('HTTP');
      expect(hostOf(url)).assertEqual('Example.COM');
      expect(pathOf(url)).assertEqual('/Media/Photo.PNG');
      expect(fileNameOf(url)).assertEqual('Photo.PNG');
      expect(extensionOf(url)).assertEqual('.PNG');
      expect(isHttpUrl(url)).assertFalse();
      expect(extensionOf(url) === '.png').assertFalse();
    });

    /**
     * @tc.name   lowercaseSchemeIsHttps
     * @tc.desc   The production scheme is lowercase https and satisfies both predicates correctly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lowercaseSchemeIsHttps', 0, () => {
      const url: string = 'https://example.com/a.png';
      expect(isHttpsUrl(url)).assertTrue();
      expect(isHttpUrl(url)).assertFalse();
      expect(schemeOf(url)).assertEqual('https');
      expect(schemeOf(url).length).assertEqual(5);
      expect(hostOf(url)).assertEqual('example.com');
      expect(pathOf(url)).assertEqual('/a.png');
      expect(fileNameOf(url)).assertEqual('a.png');
    });

    /**
     * @tc.name   httpSchemeIsHttpNotHttps
     * @tc.desc   A plain http input satisfies isHttpUrl and is rejected by isHttpsUrl.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('httpSchemeIsHttpNotHttps', 0, () => {
      const url: string = 'http://example.com/a.png';
      expect(isHttpUrl(url)).assertTrue();
      expect(isHttpsUrl(url)).assertFalse();
      expect(schemeOf(url)).assertEqual('http');
      expect(schemeOf(url).length).assertEqual(4);
      expect(hostOf(url)).assertEqual('example.com');
      expect(hostOf(url).startsWith('http')).assertFalse();
      expect(fileNameOf(url)).assertEqual('a.png');
    });

    /**
     * @tc.name   missingSchemeHasNoHost
     * @tc.desc   Without a scheme marker there is no scheme and no host, but a file name remains.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingSchemeHasNoHost', 0, () => {
      const url: string = 'gitee.com/cases/after_cache.png';
      expect(schemeOf(url)).assertEqual('');
      expect(hostOf(url)).assertEqual('');
      expect(pathOf(url)).assertEqual('/cases/after_cache.png');
      expect(fileNameOf(url)).assertEqual('after_cache.png');
      expect(extensionOf(url)).assertEqual('.png');
      expect(isHttpsUrl(url)).assertFalse();
      expect(hasQuery(url)).assertFalse();
    });

    /**
     * @tc.name   schemeWithoutHostStaysEmpty
     * @tc.desc   A marker at position zero is not a scheme, so host and scheme stay empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemeWithoutHostStaysEmpty', 0, () => {
      const url: string = '://example.com/a.png';
      expect(url.indexOf('://')).assertEqual(0);
      expect(schemeOf(url)).assertEqual('');
      expect(hostOf(url)).assertEqual('');
      expect(pathOf(url)).assertEqual('//example.com/a.png');
      expect(fileNameOf(url)).assertEqual('a.png');
      expect(isHttpsUrl(url)).assertFalse();
      expect(extensionOf(url)).assertEqual('.png');
    });

    /**
     * @tc.name   userInfoIsPartOfHost
     * @tc.desc   The host reader keeps user:password@ in the authority segment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('userInfoIsPartOfHost', 0, () => {
      const url: string = 'https://user:secret@example.com/private/a.png';
      expect(hostOf(url)).assertEqual('user:secret@example.com');
      expect(hostOf(url).indexOf('@')).assertLarger(0);
      expect(hostOf(url).indexOf(':')).assertLarger(0);
      expect(pathOf(url)).assertEqual('/private/a.png');
      expect(fileNameOf(url)).assertEqual('a.png');
      expect(schemeOf(url)).assertEqual('https');
      expect(hostOf(url) === 'example.com').assertFalse();
    });

    /**
     * @tc.name   userInfoRedactedFromUrl
     * @tc.desc   redactCredentials replaces the whole user info with three stars before the at sign.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('userInfoRedactedFromUrl', 0, () => {
      const url: string = 'https://user:secret@example.com/private/a.png';
      const safe: string = redactCredentials(url);
      expect(safe).assertEqual('https://***@example.com/private/a.png');
      expect(safe.indexOf('secret')).assertEqual(-1);
      expect(safe.indexOf('user')).assertEqual(-1);
      expect(safe.indexOf('***@')).assertLarger(0);
      expect(safe.endsWith('/private/a.png')).assertTrue();
      expect(fileNameOf(safe)).assertEqual('a.png');
      expect(hostOf(safe)).assertEqual('***@example.com');
    });

    /**
     * @tc.name   redactionWithoutCredentialsIsIdentity
     * @tc.desc   A URL without an at sign is returned unchanged by the credential redactor.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactionWithoutCredentialsIsIdentity', 0, () => {
      const url: string = 'https://example.com/media/a.png';
      expect(redactCredentials(url)).assertEqual(url);
      expect(redactCredentials('')).assertEqual('');
      expect(redactCredentials('gitee.com/a.png')).assertEqual('gitee.com/a.png');
      expect(redactCredentials('https://example.com/a@b.png')).assertEqual('https://***@b.png');
      expect(redactCredentials(url).indexOf('***')).assertEqual(-1);
      expect(redactCredentials(url).length).assertEqual(url.length);
    });

    /**
     * @tc.name   redactionKeepsPortPathAndQuery
     * @tc.desc   Credential redaction only rewrites the user info and leaves every other part intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactionKeepsPortPathAndQuery', 0, () => {
      const url: string = 'https://admin:pass@example.com:8443/media/a.png?x=1';
      const safe: string = redactCredentials(url);
      expect(safe).assertEqual('https://***@example.com:8443/media/a.png?x=1');
      expect(safe.indexOf(':8443')).assertLarger(0);
      expect(safe.indexOf('?x=1')).assertLarger(0);
      expect(hostOf(safe)).assertEqual('***@example.com:8443');
      expect(queryOf(safe)).assertEqual('?x=1');
      expect(safe.indexOf('pass')).assertEqual(-1);
      expect(fileNameOf(safe)).assertEqual('a.png?x=1');
    });

    /**
     * @tc.name   portIsKeptInHost
     * @tc.desc   A numeric port remains part of the host segment because only the slash ends it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('portIsKeptInHost', 0, () => {
      const url: string = 'https://example.com:8443/media/a.png';
      expect(hostOf(url)).assertEqual('example.com:8443');
      expect(hostOf(url).indexOf(':8443')).assertLarger(0);
      expect(hostOf(url).endsWith('8443')).assertTrue();
      expect(pathOf(url)).assertEqual('/media/a.png');
      expect(fileNameOf(url)).assertEqual('a.png');
      expect(hostOf(url) === 'example.com').assertFalse();
      expect(schemeOf(url)).assertEqual('https');
    });

    /**
     * @tc.name   hostWithoutPathHasNoPath
     * @tc.desc   A URL that ends at the authority has an empty path but keeps its host.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostWithoutPathHasNoPath', 0, () => {
      const url: string = 'https://example.com:8443';
      expect(hostOf(url)).assertEqual('example.com:8443');
      expect(pathOf(url)).assertEqual('');
      expect(fileNameOf(url)).assertEqual('example.com:8443');
      expect(extensionOf(url)).assertEqual('.com:8443');
      expect(hasQuery(url)).assertFalse();
      expect(isHttpsUrl(url)).assertTrue();
      expect(fileNameOf(url).indexOf('/')).assertEqual(-1);
    });

    /**
     * @tc.name   rootPathIsSingleSlash
     * @tc.desc   A trailing root slash produces the single slash path and the fallback file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('rootPathIsSingleSlash', 0, () => {
      const url: string = 'https://example.com/';
      expect(pathOf(url)).assertEqual('/');
      expect(pathOf(url).length).assertEqual(1);
      expect(fileNameOf(url)).assertEqual('file');
      expect(fileNameOf(url, 'root')).assertEqual('root');
      expect(extensionOf(url)).assertEqual('');
      expect(hostOf(url)).assertEqual('example.com');
      expect(url.lastIndexOf('/')).assertEqual(url.length - 1);
    });

    /**
     * @tc.name   fragmentStaysInFileName
     * @tc.desc   A fragment is not stripped by the name reader, so it remains attached to the file.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fragmentStaysInFileName', 0, () => {
      const url: string = 'https://example.com/media/a.png#preview';
      expect(fileNameOf(url)).assertEqual('a.png#preview');
      expect(fileNameOf(url).indexOf('#')).assertLarger(0);
      expect(fileNameOf(url).startsWith('a.png')).assertTrue();
      expect(pathOf(url)).assertEqual('/media/a.png#preview');
      expect(extensionOf(url)).assertEqual('.png#preview');
      expect(hostOf(url)).assertEqual('example.com');
      expect(hasQuery(url)).assertFalse();
    });

    /**
     * @tc.name   fragmentIsNotQuery
     * @tc.desc   A fragment alone never satisfies the query predicate or the query reader.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fragmentIsNotQuery', 0, () => {
      const url: string = 'https://example.com/media/a.png#section?not-a-query';
      expect(hasQuery(url)).assertTrue();
      expect(queryOf(url)).assertEqual('?not-a-query');
      expect(queryOf(url).startsWith('#')).assertFalse();
      expect(redactQuery(url)).assertEqual('https://example.com/media/a.png#section');
      expect(fileNameOf(url)).assertEqual('a.png#section?not-a-query');
      expect(pathOf(url)).assertEqual('/media/a.png#section');
      expect(url.indexOf('#')).assertLess(url.indexOf('?'));
    });

    /**
     * @tc.name   queryStaysOutOfPath
     * @tc.desc   The path reader cuts the query so a token never appears inside a path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryStaysOutOfPath', 0, () => {
      const url: string = 'https://example.com/media/a.png?token=abc&size=2';
      expect(pathOf(url)).assertEqual('/media/a.png');
      expect(pathOf(url).indexOf('?')).assertEqual(-1);
      expect(pathOf(url).indexOf('token')).assertEqual(-1);
      expect(fileNameOf(url)).assertEqual('a.png?token=abc&size=2');
      expect(hostOf(url)).assertEqual('example.com');
      expect(hasQuery(url)).assertTrue();
      expect(queryOf(url)).assertEqual('?token=abc&size=2');
    });

    /**
     * @tc.name   queryIncludesQuestionMark
     * @tc.desc   The query reader returns the question mark as part of the query text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryIncludesQuestionMark', 0, () => {
      const url: string = 'https://example.com/a.png?x=1';
      expect(queryOf(url)).assertEqual('?x=1');
      expect(queryOf(url).startsWith('?')).assertTrue();
      expect(queryOf(url).length).assertEqual(4);
      expect(queryOf(url).split('=').length).assertEqual(2);
      expect(queryOf(url) === 'x=1').assertFalse();
      expect(queryOf('https://example.com/a.png')).assertEqual('');
      expect(countOf(queryOf(url).split(''), '?')).assertEqual(1);
    });

    /**
     * @tc.name   hasQueryDetectsQuestionAnywhere
     * @tc.desc   The query predicate is true if and only if the input contains a question mark.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hasQueryDetectsQuestionAnywhere', 0, () => {
      const withQuery: string[] = ['https://example.com/a?x=1', '?', 'a?b', 'https://example.com/?q='];
      const without: string[] = ['https://example.com/a', '', 'https://example.com/a#frag', 'a=b'];
      for (let index = 0; index < withQuery.length; index++) {
        expect(hasQuery(withQuery[index])).assertTrue();
      }
      for (let index = 0; index < without.length; index++) {
        expect(hasQuery(without[index])).assertFalse();
      }
      expect(hasQuery('?')).assertTrue();
      expect(without.length).assertEqual(4);
    });

    /**
     * @tc.name   redactQueryDropsToken
     * @tc.desc   Redacting the query removes the token and every parameter after the question mark.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactQueryDropsToken', 0, () => {
      const url: string = 'https://example.com/media/a.png?token=secret&expires=99';
      const safe: string = redactQuery(url);
      expect(safe).assertEqual('https://example.com/media/a.png');
      expect(safe.indexOf('secret')).assertEqual(-1);
      expect(safe.indexOf('token')).assertEqual(-1);
      expect(safe.indexOf('?')).assertEqual(-1);
      expect(hasQuery(safe)).assertFalse();
      expect(fileNameOf(safe)).assertEqual('a.png');
      expect(safe.length).assertLess(url.length);
    });

    /**
     * @tc.name   redactQueryWithoutQueryIsIdentity
     * @tc.desc   A URL without a question mark passes through the query redactor unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactQueryWithoutQueryIsIdentity', 0, () => {
      const url: string = 'https://example.com/media/a.png';
      expect(redactQuery(url)).assertEqual(url);
      expect(redactQuery('')).assertEqual('');
      expect(redactQuery('https://example.com/a.png#frag')).assertEqual('https://example.com/a.png#frag');
      expect(redactQuery(url).length).assertEqual(url.length);
      expect(redactQuery('https://example.com/a?x=1')).assertEqual('https://example.com/a');
      expect(redactQuery('?x=1')).assertEqual('');
      expect(redactQuery('a?b?c')).assertEqual('a');
    });

    /**
     * @tc.name   pathOfBareHostIsEmpty
     * @tc.desc   An authority-only input has no path, while a slash introduces one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pathOfBareHostIsEmpty', 0, () => {
      expect(pathOf('example.com')).assertEqual('');
      expect(pathOf('https://example.com')).assertEqual('');
      expect(pathOf('example.com/a.png')).assertEqual('/a.png');
      expect(pathOf('https://example.com/a.png')).assertEqual('/a.png');
      expect(pathOf('https://example.com//double')).assertEqual('//double');
      expect(pathOf('a/b/c')).assertEqual('/b/c');
      expect(pathOf('abc')).assertEqual('');
    });

    /**
     * @tc.name   fileNameOfNestedPath
     * @tc.desc   The name reader keeps only the segment after the final slash of a deep path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileNameOfNestedPath', 0, () => {
      const url: string = 'https://example.com/a/b/c/icon.png';
      expect(fileNameOf(url)).assertEqual('icon.png');
      expect(fileNameOf(url).indexOf('/')).assertEqual(-1);
      expect(fileNameOf(url).split('/').length).assertEqual(1);
      expect(url.endsWith('/' + fileNameOf(url))).assertTrue();
      expect(pathOf(url)).assertEqual('/a/b/c/icon.png');
      expect(hostOf(url)).assertEqual('example.com');
      expect(url.split('/').length).assertEqual(7);
    });

    /**
     * @tc.name   deepDirectoryUrlUsesFallback
     * @tc.desc   A deep path that ends with a slash has an empty tail and uses the fallback name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deepDirectoryUrlUsesFallback', 0, () => {
      const url: string = 'https://example.com/a/b/c/';
      expect(fileNameOf(url)).assertEqual('file');
      expect(fileNameOf(url, 'archive.bin')).assertEqual('archive.bin');
      expect(fileNameOf(url, '')).assertEqual('');
      expect(pathOf(url)).assertEqual('/a/b/c/');
      expect(extensionOf(url)).assertEqual('');
      expect(url.endsWith('/')).assertTrue();
      expect(hostOf(url)).assertEqual('example.com');
    });

    /**
     * @tc.name   fileNameKeepsQueryText
     * @tc.desc   The name and extension readers include the query, while the path reader excludes it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameKeepsQueryText', 0, () => {
      const url: string = 'https://example.com/media/photo.jpg?w=400&h=300';
      expect(fileNameOf(url)).assertEqual('photo.jpg?w=400&h=300');
      expect(fileNameOf(url).startsWith('photo.jpg')).assertTrue();
      expect(fileNameOf(url).indexOf('?')).assertLarger(0);
      expect(extensionOf(url)).assertEqual('.jpg?w=400&h=300');
      expect(pathOf(url)).assertEqual('/media/photo.jpg');
      expect(pathOf(url).indexOf('?')).assertEqual(-1);
      expect(queryOf(url)).assertEqual('?w=400&h=300');
    });

    /**
     * @tc.name   extensionOfPngIsLowercase
     * @tc.desc   Lowercase png names return the four character dot extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('extensionOfPngIsLowercase', 0, () => {
      expect(extensionOf('https://example.com/a.png')).assertEqual('.png');
      expect(extensionOf('a.png')).assertEqual('.png');
      expect(extensionOf('.png')).assertEqual('');
      expect(extensionOf('https://example.com/a.png').length).assertEqual(4);
      expect(extensionOf('https://example.com/a.PNG')).assertEqual('.PNG');
      expect(extensionOf('https://example.com/a.png') === '.PNG').assertFalse();
      expect(extensionOf('https://example.com/a.jpeg')).assertEqual('.jpeg');
    });

    /**
     * @tc.name   extensionOfExtensionlessIsEmpty
     * @tc.desc   A last segment without a dot has no extension at all.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('extensionOfExtensionlessIsEmpty', 0, () => {
      expect(extensionOf('https://example.com/README')).assertEqual('');
      expect(extensionOf('https://example.com/a/b/LICENSE')).assertEqual('');
      expect(extensionOf('README')).assertEqual('');
      expect(extensionOf('https://example.com/README').length).assertEqual(0);
      expect(fileNameOf('https://example.com/README')).assertEqual('README');
      expect(fileNameOf('https://example.com/README').indexOf('.')).assertEqual(-1);
      expect(extensionOf('https://example.com/README') === '.md').assertFalse();
    });

    /**
     * @tc.name   extensionOfDotFileIsEmpty
     * @tc.desc   A dotfile starts with the dot, and the reader treats that as no extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionOfDotFileIsEmpty', 0, () => {
      expect(extensionOf('https://example.com/.bashrc')).assertEqual('');
      expect(extensionOf('.gitignore')).assertEqual('');
      expect(extensionOf('https://example.com/a/.env')).assertEqual('');
      expect(fileNameOf('https://example.com/.bashrc')).assertEqual('.bashrc');
      expect(fileNameOf('https://example.com/.bashrc').startsWith('.')).assertTrue();
      expect(fileNameOf('https://example.com/.bashrc').lastIndexOf('.')).assertEqual(0);
      expect(extensionOf('https://example.com/a.b/.hidden')).assertEqual('');
    });

    /**
     * @tc.name   extensionOfMultipleDotsKeepsLast
     * @tc.desc   For a name with several dots only the final dot starts the extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('extensionOfMultipleDotsKeepsLast', 0, () => {
      const url: string = 'https://example.com/media/archive.tar.gz';
      expect(fileNameOf(url)).assertEqual('archive.tar.gz');
      expect(extensionOf(url)).assertEqual('.gz');
      expect(extensionOf(url) === '.tar.gz').assertFalse();
      expect(fileNameOf(url).split('.').length).assertEqual(3);
      expect(fileNameOf(url).indexOf('.')).assertLarger(0);
      expect(extensionOf(url).length).assertEqual(3);
      expect(extensionOf('a.b.c.d')).assertEqual('.d');
    });

    /**
     * @tc.name   extensionOfTrailingDotIsDot
     * @tc.desc   A name that ends with a dot reports the dot itself as the extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionOfTrailingDotIsDot', 0, () => {
      const url: string = 'https://example.com/media/name.';
      expect(fileNameOf(url)).assertEqual('name.');
      expect(extensionOf(url)).assertEqual('.');
      expect(extensionOf(url).length).assertEqual(1);
      expect(extensionOf(url).startsWith('.')).assertTrue();
      expect(fileNameOf(url).endsWith('.')).assertTrue();
      expect(fileNameOf(url).lastIndexOf('.')).assertEqual(4);
      expect(extensionOf(url) === '').assertFalse();
    });

    /**
     * @tc.name   longFileNameIsPreserved
     * @tc.desc   A one hundred and twenty character segment is returned whole with its extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longFileNameIsPreserved', 0, () => {
      let longName: string = '';
      for (let index = 0; index < 120; index++) {
        longName = longName + 'a';
      }
      const url: string = 'https://example.com/media/' + longName + '.png';
      expect(longName.length).assertEqual(120);
      expect(fileNameOf(url)).assertEqual(longName + '.png');
      expect(fileNameOf(url).length).assertEqual(124);
      expect(extensionOf(url)).assertEqual('.png');
      expect(fileNameOf(url).startsWith(longName)).assertTrue();
      expect(pathOf(url)).assertEqual('/media/' + longName + '.png');
      expect(hostOf(url)).assertEqual('example.com');
      logStep('transferInput', 'long file name survives the readers intact');
    });

    /**
     * @tc.name   unicodeFileNameIsPreserved
     * @tc.desc   Chinese characters in the last segment are kept verbatim by name and path readers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unicodeFileNameIsPreserved', 0, () => {
      const url: string = 'https://example.com/资料/图像.png';
      expect(fileNameOf(url)).assertEqual('图像.png');
      expect(fileNameOf(url).length).assertEqual(6);
      expect(extensionOf(url)).assertEqual('.png');
      expect(pathOf(url)).assertEqual('/资料/图像.png');
      expect(hostOf(url)).assertEqual('example.com');
      expect(fileNameOf(url).indexOf('/')).assertEqual(-1);
      expect(fileNameOf(url).split('.').length).assertEqual(2);
    });

    /**
     * @tc.name   unicodeHostIsKeptInAuthority
     * @tc.desc   A non ASCII host stays in the authority and does not leak into the file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unicodeHostIsKeptInAuthority', 0, () => {
      const url: string = 'https://例子.测试/媒体/照片.png';
      expect(hostOf(url)).assertEqual('例子.测试');
      expect(hostOf(url).indexOf('/')).assertEqual(-1);
      expect(fileNameOf(url)).assertEqual('照片.png');
      expect(extensionOf(url)).assertEqual('.png');
      expect(pathOf(url)).assertEqual('/媒体/照片.png');
      expect(schemeOf(url)).assertEqual('https');
      expect(fileNameOf(url).indexOf('例子')).assertEqual(-1);
    });

    /**
     * @tc.name   taskUrlsShareSchemeAndHost
     * @tc.desc   All three production URLs share the https scheme and the gitee host.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsShareSchemeAndHost', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      for (let index = 0; index < urls.length; index++) {
        expect(schemeOf(urls[index])).assertEqual('https');
        expect(hostOf(urls[index])).assertEqual('gitee.com');
        expect(isHttpsUrl(urls[index])).assertTrue();
        expect(isHttpUrl(urls[index])).assertFalse();
      }
      expect(uniqueStrings([hostOf(URL_TASK_A), hostOf(URL_TASK_B)]).length).assertEqual(1);
      expect(hasDuplicateStrings([schemeOf(URL_TASK_A), schemeOf(URL_TASK_C)])).assertTrue();
    });

    /**
     * @tc.name   taskUrlsHaveDistinctNames
     * @tc.desc   The three long literals resolve to three different png file names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsHaveDistinctNames', 0, () => {
      const names: string[] = [fileNameOf(URL_TASK_A), fileNameOf(URL_TASK_B), fileNameOf(URL_TASK_C)];
      expect(names[0]).assertEqual('favor_list_tea.png');
      expect(names[1]).assertEqual('after_cache.png');
      expect(names[2]).assertEqual('icon_main_color.png');
      expect(hasDuplicateStrings(names)).assertFalse();
      expect(uniqueStrings(names).length).assertEqual(3);
      expect(countOf(names, 'after_cache.png')).assertEqual(1);
      expect(names.indexOf('file')).assertEqual(-1);
    });

    /**
     * @tc.name   taskPathEndsWithName
     * @tc.desc   For every task URL the path ends with a slash followed by its own file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskPathEndsWithName', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      for (let index = 0; index < urls.length; index++) {
        const name: string = fileNameOf(urls[index]);
        const path: string = pathOf(urls[index]);
        expect(path.endsWith('/' + name)).assertTrue();
        expect(path.startsWith('/')).assertTrue();
        expect(path.indexOf('://')).assertEqual(-1);
        expect(path.length).assertLarger(name.length);
      }
      expect(pathOf(URL_TASK_A).split('/').length).assertLarger(5);
      expect(fileNameOf(URL_TASK_B).endsWith('.png')).assertTrue();
      expect(pathOf(URL_TASK_C).indexOf('icon_main_color')).assertLarger(0);
    });

    /**
     * @tc.name   reconstructionFromPartsMatchesSimpleUrl
     * @tc.desc   Scheme, host and path joined back together rebuild the original simple URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reconstructionFromPartsMatchesSimpleUrl', 0, () => {
      const url: string = 'https://example.com/media/a.png';
      const parts: string[] = [schemeOf(url), '://', hostOf(url), pathOf(url)];
      expect(joined(parts, '')).assertEqual(url);
      expect(parts.length).assertEqual(4);
      expect(parts[0]).assertEqual('https');
      expect(parts[1]).assertEqual('://');
      expect(parts[2]).assertEqual('example.com');
      expect(parts[3]).assertEqual('/media/a.png');
      expect(joined(parts, '')).assertEqual('https://example.com/media/a.png');
      expect(joined(parts, '|').split('|').length).assertEqual(4);
    });

    /**
     * @tc.name   encodedCharactersArePreserved
     * @tc.desc   Percent escapes are not decoded by any reader, so the token text stays comparable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('encodedCharactersArePreserved', 0, () => {
      const url: string = 'https://example.com/media/a%20b.png?x=%2F';
      expect(fileNameOf(url)).assertEqual('a%20b.png?x=%2F');
      expect(fileNameOf(url).indexOf('%20')).assertLarger(0);
      expect(extensionOf(url)).assertEqual('.png?x=%2F');
      expect(pathOf(url)).assertEqual('/media/a%20b.png');
      expect(queryOf(url)).assertEqual('?x=%2F');
      expect(redactQuery(url)).assertEqual('https://example.com/media/a%20b.png');
      expect(redactQuery(url).indexOf('%2F')).assertEqual(-1);
    });

    /**
     * @tc.name   taskUrlsUsePngExtension
     * @tc.desc   Every page literal ends with the same png extension and a non empty name stem.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsUsePngExtension', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      for (let index = 0; index < urls.length; index++) {
        expect(extensionOf(urls[index])).assertEqual('.png');
        expect(fileNameOf(urls[index]).endsWith('.png')).assertTrue();
        expect(fileNameOf(urls[index]).length).assertLarger(4);
        expect(fileNameOf(urls[index]).indexOf('.')).assertLarger(0);
      }
      expect(extensionOf(URL_TASK_A)).assertEqual(extensionOf(URL_TASK_C));
      expect(countOf([fileNameOf(URL_TASK_A)], 'favor_list_tea.png')).assertEqual(1);
      expect(fileNameOf(URL_TASK_C).startsWith('icon_main_color')).assertTrue();
    });

    /**
     * @tc.name   hostOnlyUrlUsesHostAsName
     * @tc.desc   With no path segment the authority becomes the file name and its last dot the extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostOnlyUrlUsesHostAsName', 0, () => {
      const url: string = 'https://example.com';
      expect(fileNameOf(url)).assertEqual('example.com');
      expect(pathOf(url)).assertEqual('');
      expect(extensionOf(url)).assertEqual('.com');
      expect(fileNameOf(url).indexOf('.')).assertLarger(0);
      expect(fileNameOf(url, 'fallback')).assertEqual('example.com');
      expect(pathOf(url) === '/').assertFalse();
      expect(url.endsWith(fileNameOf(url))).assertTrue();
    });

    /**
     * @tc.name   doubleSlashPathKeepsName
     * @tc.desc   A repeated slash inside the path does not disturb the name or the extension readers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('doubleSlashPathKeepsName', 0, () => {
      const url: string = 'https://example.com//media//a.png';
      expect(fileNameOf(url)).assertEqual('a.png');
      expect(extensionOf(url)).assertEqual('.png');
      expect(pathOf(url)).assertEqual('//media//a.png');
      expect(pathOf(url).indexOf('//')).assertEqual(0);
      expect(countOf(pathOf(url).split('/'), '')).assertLarger(2);
      expect(hostOf(url)).assertEqual('example.com');
      expect(redactQuery(url)).assertEqual(url);
    });

    /**
     * @tc.name   layeredRedactionKeepsStructure
     * @tc.desc   Applying credential and query redaction in sequence removes both secrets and keeps the URL shape.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferInput scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('layeredRedactionKeepsStructure', 0, () => {
      const url: string = 'https://user:pass@example.com/media/a.png?token=abc';
      const withoutCredentials: string = redactCredentials(url);
      const safe: string = redactQuery(withoutCredentials);
      expect(withoutCredentials).assertEqual('https://***@example.com/media/a.png?token=abc');
      expect(safe).assertEqual('https://***@example.com/media/a.png');
      expect(safe.indexOf('pass')).assertEqual(-1);
      expect(safe.indexOf('token')).assertEqual(-1);
      expect(safe.indexOf('***@')).assertLarger(0);
      expect(hostOf(safe)).assertEqual('***@example.com');
      expect(pathOf(safe)).assertEqual('/media/a.png');
      expect(fileNameOf(safe)).assertEqual('a.png');
      expect(isHttpsUrl(safe)).assertTrue();
      expect(hasQuery(safe)).assertFalse();
    });

  });
}
