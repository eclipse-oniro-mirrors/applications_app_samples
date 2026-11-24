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
 * UrlStructureMatrix suite.
 *
 * Feeds the URL helpers a matrix of realistic shapes: two schemes, hosts with
 * and without ports, paths with empty segments, queries, fragments, user info,
 * trailing slashes and several extension shapes. The three production URLs are
 * part of the matrix and are compared against independently written oracles.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  download() forwards the URL string untouched into the config
 *   151-171  the three literal URLs used by runTaskA / runTaskB / runTaskC
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  TASK_URLS,
  DownloadConfig,
  UrlExpectation,
  expectationFor,
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
  joined,
  sameStringArray
} from '../Shared/SharedDriver';

const URL_HTTP: string = 'http://example.com/media/picture.png';
const URL_WITH_PORT: string = 'https://cdn.example.com:8443/assets/logo.png';
const URL_BARE_HOST: string = 'https://example.com';
const URL_QUERY: string = 'https://api.example.com/download/file.zip?token=abc123&size=large';
const URL_FRAGMENT: string = 'https://docs.example.com/guide/page.png#section-two';
const URL_USERINFO: string = 'https://alice:secret@files.example.com/private/report.pdf';
const URL_EMPTY_SEGMENT: string = 'https://static.example.com/a//b//icon.png';
const URL_TRAILING_SLASH: string = 'https://static.example.com/gallery/';
const URL_DOT_FILE: string = 'https://config.example.com/.env';
const URL_DOUBLE_EXTENSION: string = 'https://archive.example.com/releases/bundle.tar.gz';

export default function urlStructureMatrixTest(): void {
  describe('UrlStructureMatrix', () => {
    beforeAll(() => {
      logSuite('UrlStructureMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('UrlStructureMatrix', 'end');
    });

    /**
     * @tc.name   everyTaskUrlUsesHttps
     * @tc.desc   All three production URLs are secure and none of them is accepted by the plain HTTP predicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyTaskUrlUsesHttps', 0, () => {
      logStep('UrlStructureMatrix', 'scheme check');
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(isHttpsUrl(TASK_URLS[index])).assertTrue();
        expect(isHttpUrl(TASK_URLS[index])).assertFalse();
        expect(schemeOf(TASK_URLS[index])).assertEqual('https');
      }
      expect(TASK_URLS.length).assertEqual(3);
      expect(isHttpsUrl(URL_HTTP)).assertFalse();
    });

    /**
     * @tc.name   everyTaskUrlSharesGiteeHost
     * @tc.desc   The three samples all point at gitee.com, which keeps the download scenario reproducible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyTaskUrlSharesGiteeHost', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(hostOf(TASK_URLS[index])).assertEqual('gitee.com');
        expect(hostOf(TASK_URLS[index]).indexOf(':')).assertEqual(-1);
      }
      expect(hostOf(URL_WITH_PORT)).assertEqual('cdn.example.com:8443');
      expect(hostOf(URL_WITH_PORT) === hostOf(URL_TASK_A)).assertFalse();
      expect(hostOf(URL_HTTP)).assertEqual('example.com');
    });

    /**
     * @tc.name   everyTaskUrlEndsWithPng
     * @tc.desc   The page downloads PNG images, so every literal ends with that extension and reports it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyTaskUrlEndsWithPng', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(TASK_URLS[index].endsWith('.png')).assertTrue();
        expect(extensionOf(TASK_URLS[index])).assertEqual('.png');
      }
      expect(extensionOf(URL_DOUBLE_EXTENSION)).assertEqual('.gz');
      expect(extensionOf(URL_HTTP)).assertEqual('.png');
      expect(extensionOf(URL_BARE_HOST)).assertEqual('.com');
    });

    /**
     * @tc.name   taskFileNamesAreDistinct
     * @tc.desc   The three names extracted from the URLs are pairwise different, so cache collisions cannot occur.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskFileNamesAreDistinct', 0, () => {
      const names: string[] = [];
      for (let index = 0; index < TASK_URLS.length; index++) {
        names.push(fileNameOf(TASK_URLS[index]));
      }
      expect(names.length).assertEqual(3);
      expect(names[0] === names[1]).assertFalse();
      expect(names[1] === names[2]).assertFalse();
      expect(names[0] === names[2]).assertFalse();
      expect(joined(names, ',')).assertEqual('favor_list_tea.png,after_cache.png,icon_main_color.png');
    });

    /**
     * @tc.name   taskAFileNameAndPathExact
     * @tc.desc   Task A resolves to the OrangeShopping media path and its exact file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskAFileNameAndPathExact', 0, () => {
      expect(fileNameOf(URL_TASK_A)).assertEqual('favor_list_tea.png');
      expect(pathOf(URL_TASK_A)).assertEqual('/openharmony/applications_app_samples/raw/a826ab0e75fe51d028c1c5af58188e908736b53b/code/Solutions/' +
        'Shopping/OrangeShopping/feature/navigationHome/src/main/resources/base/media/favor_list_tea.png');
      expect(pathOf(URL_TASK_A).startsWith('/openharmony/')).assertTrue();
      expect(pathOf(URL_TASK_A).indexOf('feature/navigationHome') > 0).assertTrue();
      expect(hasQuery(URL_TASK_A)).assertFalse();
      expect(queryOf(URL_TASK_A)).assertEqual('');
    });

    /**
     * @tc.name   expectationForMatchesHelpers
     * @tc.desc   The expectation object built for each task agrees with the four helper functions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectationForMatchesHelpers', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < numbers.length; index++) {
        const expectation: UrlExpectation = expectationFor(numbers[index]);
        expect(expectation.taskNo).assertEqual(numbers[index]);
        expect(expectation.url).assertEqual(TASK_URLS[index]);
        expect(expectation.fileName).assertEqual(fileNameOf(TASK_URLS[index]));
        expect(expectation.extension).assertEqual(extensionOf(TASK_URLS[index]));
        expect(expectation.host).assertEqual(hostOf(TASK_URLS[index]));
      }
      expect(expectationFor(TASK_A).url === expectationFor(TASK_B).url).assertFalse();
    });

    /**
     * @tc.name   schemeExtractionCoversBothSchemes
     * @tc.desc   The scheme helper returns https for the production URLs, http for the plain sample and empty for a path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemeExtractionCoversBothSchemes', 0, () => {
      expect(schemeOf(URL_TASK_C)).assertEqual('https');
      expect(schemeOf(URL_HTTP)).assertEqual('http');
      expect(schemeOf('relative/path/file.png')).assertEqual('');
      expect(schemeOf('/absolute/path.png')).assertEqual('');
      expect(schemeOf(URL_USERINFO)).assertEqual('https');
      expect(schemeOf(URL_HTTP).length).assertEqual(4);
      expect(schemeOf(URL_TASK_C).length).assertEqual(5);
    });

    /**
     * @tc.name   hostWithoutPathIsFullAuthority
     * @tc.desc   For a bare host URL the host is the whole authority and the path helper reports empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostWithoutPathIsFullAuthority', 0, () => {
      expect(hostOf(URL_BARE_HOST)).assertEqual('example.com');
      expect(pathOf(URL_BARE_HOST)).assertEqual('');
      expect(queryOf(URL_BARE_HOST)).assertEqual('');
      expect(fileNameOf(URL_BARE_HOST, 'fallback')).assertEqual('example.com');
      expect(extensionOf(URL_BARE_HOST)).assertEqual('.com');
      expect(hostOf(URL_BARE_HOST).indexOf('/')).assertEqual(-1);
    });

    /**
     * @tc.name   hostEmptyForRelativeUrl
     * @tc.desc   Without a scheme marker the host helper returns empty while the path helper keeps the whole string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostEmptyForRelativeUrl', 0, () => {
      const relative: string = 'images/icons/app.png';
      expect(hostOf(relative)).assertEqual('');
      expect(schemeOf(relative)).assertEqual('');
      expect(pathOf(relative)).assertEqual('/icons/app.png');
      expect(fileNameOf(relative)).assertEqual('app.png');
      expect(extensionOf(relative)).assertEqual('.png');
      expect(isHttpsUrl(relative)).assertFalse();
    });

    /**
     * @tc.name   pathStripsQueryButKeepsLeadSlash
     * @tc.desc   A query is removed from the path and the remaining path still starts with the authority slash.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pathStripsQueryButKeepsLeadSlash', 0, () => {
      expect(pathOf(URL_QUERY)).assertEqual('/download/file.zip');
      expect(pathOf(URL_QUERY).startsWith('/')).assertTrue();
      expect(pathOf(URL_QUERY).indexOf('?')).assertEqual(-1);
      expect(pathOf(URL_QUERY).indexOf('token')).assertEqual(-1);
      expect(fileNameOf(URL_QUERY)).assertEqual('file.zip?token=abc123&size=large');
      expect(extensionOf(URL_QUERY).startsWith('.zip?')).assertTrue();
    });

    /**
     * @tc.name   queryIncludesMarkerAndParameterOrder
     * @tc.desc   The query helper preserves the leading question mark and the original parameter order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryIncludesMarkerAndParameterOrder', 0, () => {
      expect(queryOf(URL_QUERY)).assertEqual('?token=abc123&size=large');
      expect(queryOf(URL_QUERY).startsWith('?')).assertTrue();
      expect(hasQuery(URL_QUERY)).assertTrue();
      expect(queryOf(URL_QUERY).indexOf('token') < queryOf(URL_QUERY).indexOf('size')).assertTrue();
      expect(queryOf(URL_QUERY).split('&').length).assertEqual(2);
      expect(hasQuery(URL_TASK_B)).assertFalse();
    });

    /**
     * @tc.name   emptyQueryMarkerStillCounts
     * @tc.desc   A lone question mark is a query, is excluded from the path and redacts to an empty suffix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyQueryMarkerStillCounts', 0, () => {
      const marker: string = 'https://example.com/assets/photo.png?';
      expect(hasQuery(marker)).assertTrue();
      expect(queryOf(marker)).assertEqual('?');
      expect(pathOf(marker)).assertEqual('/assets/photo.png');
      expect(fileNameOf(marker)).assertEqual('photo.png?');
      expect(redactQuery(marker)).assertEqual('https://example.com/assets/photo.png');
      expect(redactQuery(marker).indexOf('?')).assertEqual(-1);
    });

    /**
     * @tc.name   fragmentIsRetainedInPath
     * @tc.desc   The helpers do not strip fragments, so a fragment stays attached to the path and the file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fragmentIsRetainedInPath', 0, () => {
      expect(pathOf(URL_FRAGMENT)).assertEqual('/guide/page.png#section-two');
      expect(fileNameOf(URL_FRAGMENT)).assertEqual('page.png#section-two');
      expect(extensionOf(URL_FRAGMENT)).assertEqual('.png#section-two');
      expect(hasQuery(URL_FRAGMENT)).assertFalse();
      expect(redactQuery(URL_FRAGMENT)).assertEqual(URL_FRAGMENT);
      expect(fileNameOf(URL_FRAGMENT).indexOf('#') > 0).assertTrue();
    });

    /**
     * @tc.name   emptySegmentsPreservedInPath
     * @tc.desc   Double slashes survive the path helper and only the last segment is taken as the file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptySegmentsPreservedInPath', 0, () => {
      expect(pathOf(URL_EMPTY_SEGMENT)).assertEqual('/a//b//icon.png');
      expect(pathOf(URL_EMPTY_SEGMENT).indexOf('//') > 0).assertTrue();
      expect(fileNameOf(URL_EMPTY_SEGMENT)).assertEqual('icon.png');
      expect(extensionOf(URL_EMPTY_SEGMENT)).assertEqual('.png');
      expect(pathOf(URL_EMPTY_SEGMENT).split('/').length).assertEqual(6);
      expect(hostOf(URL_EMPTY_SEGMENT)).assertEqual('static.example.com');
    });

    /**
     * @tc.name   trailingSlashFallsBackToDefaultName
     * @tc.desc   A directory style URL has an empty tail, so the file name falls back to the supplied default.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingSlashFallsBackToDefaultName', 0, () => {
      expect(pathOf(URL_TRAILING_SLASH)).assertEqual('/gallery/');
      expect(fileNameOf(URL_TRAILING_SLASH)).assertEqual('file');
      expect(fileNameOf(URL_TRAILING_SLASH, 'index.html')).assertEqual('index.html');
      expect(fileNameOf(URL_TRAILING_SLASH, '')).assertEqual('');
      expect(extensionOf(URL_TRAILING_SLASH)).assertEqual('');
      expect(URL_TRAILING_SLASH.endsWith('/')).assertTrue();
    });

    /**
     * @tc.name   dotFileHasNoExtension
     * @tc.desc   A leading-dot file name is treated as a name without extension, never as a suffix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('dotFileHasNoExtension', 0, () => {
      expect(fileNameOf(URL_DOT_FILE)).assertEqual('.env');
      expect(extensionOf(URL_DOT_FILE)).assertEqual('');
      expect(fileNameOf(URL_DOT_FILE).startsWith('.')).assertTrue();
      expect(fileNameOf(URL_DOT_FILE).length).assertEqual(4);
      expect(extensionOf(URL_DOT_FILE).length).assertEqual(0);
      expect(extensionOf('.env') === extensionOf(URL_DOT_FILE)).assertTrue();
    });

    /**
     * @tc.name   extensionKeepsOnlyFinalSuffix
     * @tc.desc   A double extension resolves to the final suffix only, matching the last dot rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionKeepsOnlyFinalSuffix', 0, () => {
      expect(fileNameOf(URL_DOUBLE_EXTENSION)).assertEqual('bundle.tar.gz');
      expect(extensionOf(URL_DOUBLE_EXTENSION)).assertEqual('.gz');
      expect(extensionOf(URL_DOUBLE_EXTENSION) === '.tar.gz').assertFalse();
      expect(URL_DOUBLE_EXTENSION.indexOf('.tar.gz') > 0).assertTrue();
      expect(fileNameOf(URL_DOUBLE_EXTENSION).split('.').length).assertEqual(3);
      expect(extensionOf(URL_DOUBLE_EXTENSION).length).assertEqual(3);
    });

    /**
     * @tc.name   plainTokenHasNoDirectoryOrExtension
     * @tc.desc   A token without any slash or dot is returned whole and reports an empty extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('plainTokenHasNoDirectoryOrExtension', 0, () => {
      expect(fileNameOf('download')).assertEqual('download');
      expect(fileNameOf('download', 'fallback')).assertEqual('download');
      expect(extensionOf('download')).assertEqual('');
      expect(fileNameOf('download').indexOf('/')).assertEqual(-1);
      expect(fileNameOf('download').indexOf('.')).assertEqual(-1);
      expect('download'.length).assertEqual(8);
    });

    /**
     * @tc.name   fileNameOfEmptyUrlUsesFallback
     * @tc.desc   An empty URL has no tail at all, so the fallback is the only possible file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameOfEmptyUrlUsesFallback', 0, () => {
      expect(fileNameOf('')).assertEqual('file');
      expect(fileNameOf('', 'unknown.bin')).assertEqual('unknown.bin');
      expect(extensionOf('')).assertEqual('');
      expect(hostOf('')).assertEqual('');
      expect(pathOf('')).assertEqual('');
      expect(schemeOf('')).assertEqual('');
    });

    /**
     * @tc.name   redactQueryRemovesToken
     * @tc.desc   The redaction helper drops the whole query, so a token can never reach a log line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactQueryRemovesToken', 0, () => {
      const safe: string = redactQuery(URL_QUERY);
      expect(safe).assertEqual('https://api.example.com/download/file.zip');
      expect(safe.indexOf('token')).assertEqual(-1);
      expect(safe.indexOf('abc123')).assertEqual(-1);
      expect(safe.indexOf('?')).assertEqual(-1);
      expect(redactQuery(URL_TASK_A)).assertEqual(URL_TASK_A);
      expect(hasQuery(safe)).assertFalse();
    });

    /**
     * @tc.name   redactCredentialsHidesUserInfo
     * @tc.desc   The user and password part of the authority is replaced by a fixed mask before logging.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactCredentialsHidesUserInfo', 0, () => {
      const safe: string = redactCredentials(URL_USERINFO);
      expect(safe).assertEqual('https://***@files.example.com/private/report.pdf');
      expect(safe.indexOf('alice')).assertEqual(-1);
      expect(safe.indexOf('secret')).assertEqual(-1);
      expect(safe.indexOf('***@') > 0).assertTrue();
      expect(hostOf(URL_USERINFO)).assertEqual('alice:secret@files.example.com');
      expect(redactCredentials(URL_TASK_A)).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   redactionLayersCompose
     * @tc.desc   Query redaction followed by credential redaction removes both secrets from a composed URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('redactionLayersCompose', 0, () => {
      const both: string = 'https://bob:hunter2@api.example.com/v1/file.png?key=topsecret';
      const noQuery: string = redactQuery(both);
      const noBoth: string = redactCredentials(noQuery);
      expect(noQuery).assertEqual('https://bob:hunter2@api.example.com/v1/file.png');
      expect(noBoth).assertEqual('https://***@api.example.com/v1/file.png');
      expect(noBoth.indexOf('hunter2')).assertEqual(-1);
      expect(noBoth.indexOf('topsecret')).assertEqual(-1);
      expect(fileNameOf(noBoth)).assertEqual('file.png');
      expect(hostOf(noBoth)).assertEqual('***@api.example.com');
    });

    /**
     * @tc.name   configFileNameMatchesUrlHelper
     * @tc.desc   The config object builds its file name through the same helper, so both views agree.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configFileNameMatchesUrlHelper', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_B);
      expect(config.fileName()).assertEqual(fileNameOf(URL_TASK_B));
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(config.url).assertEqual(URL_TASK_B);
      expect(config.isValid()).assertTrue();
      expect(config.describe().endsWith(URL_TASK_B)).assertTrue();
      expect(sameStringArray([config.fileName()], ['after_cache.png'])).assertTrue();
    });

    /**
     * @tc.name   urlMatrixClassifiesEachScheme
     * @tc.desc   A four-entry matrix separates secure, plain and scheme-less URLs through both predicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixClassifiesEachScheme', 0, () => {
      const matrix: string[] = [URL_TASK_A, URL_HTTP, URL_BARE_HOST, 'ftp://files.example.com/a.bin'];
      expect(isHttpsUrl(matrix[0])).assertTrue();
      expect(isHttpsUrl(matrix[1])).assertFalse();
      expect(isHttpUrl(matrix[1])).assertTrue();
      expect(isHttpsUrl(matrix[2])).assertTrue();
      expect(schemeOf(matrix[3])).assertEqual('ftp');
      expect(isHttpsUrl(matrix[3])).assertFalse();
      expect(isHttpUrl(matrix[3])).assertFalse();
    });

    /**
     * @tc.name   taskUrlPathDepthIsCountable
     * @tc.desc   Each production path splits into a stable number of non-empty segments after the host.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlPathDepthIsCountable', 0, () => {
      const segmentsA: string[] = pathOf(URL_TASK_A).split('/');
      const segmentsB: string[] = pathOf(URL_TASK_B).split('/');
      const segmentsC: string[] = pathOf(URL_TASK_C).split('/');
      expect(segmentsA.length).assertEqual(17);
      expect(segmentsB.length).assertEqual(14);
      expect(segmentsC.length).assertEqual(14);
      expect(segmentsA[0]).assertEqual('');
      expect(segmentsA[segmentsA.length - 1]).assertEqual('favor_list_tea.png');
      expect(segmentsB[segmentsB.length - 1]).assertEqual('after_cache.png');
      expect(segmentsC[segmentsC.length - 1]).assertEqual('icon_main_color.png');
    });

    /**
     * @tc.name   hostAndPathReassembleAuthority
     * @tc.desc   Concatenating host, path and query restores the original URL for every production literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostAndPathReassembleAuthority', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        const rebuilt: string = schemeOf(TASK_URLS[index]) + '://' + hostOf(TASK_URLS[index]) +
          pathOf(TASK_URLS[index]) + queryOf(TASK_URLS[index]);
        expect(rebuilt).assertEqual(TASK_URLS[index]);
        expect(rebuilt.length).assertEqual(TASK_URLS[index].length);
      }
      expect(TASK_URLS.length).assertEqual(3);
      expect(schemeOf(URL_QUERY) + '://' + hostOf(URL_QUERY) + pathOf(URL_QUERY) + queryOf(URL_QUERY))
        .assertEqual(URL_QUERY);
      expect(hostOf(URL_WITH_PORT) + pathOf(URL_WITH_PORT)).assertEqual('cdn.example.com:8443/assets/logo.png');
    });

    /**
     * @tc.name   schemeDetectionIsCaseSensitive
     * @tc.desc   The secure predicate only matches the lowercase production scheme, so an uppercase variant is not
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            silently accepted.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemeDetectionIsCaseSensitive', 0, () => {
      const upper: string = 'HTTPS://example.com/file.png';
      expect(isHttpsUrl(upper)).assertFalse();
      expect(isHttpUrl(upper)).assertFalse();
      expect(schemeOf(upper)).assertEqual('HTTPS');
      expect(schemeOf(upper) === 'https').assertFalse();
      expect(hostOf(upper)).assertEqual('example.com');
      expect(fileNameOf(upper)).assertEqual('file.png');
      expect(extensionOf(upper)).assertEqual('.png');
    });

    /**
     * @tc.name   queryAndFragmentOrderIsPreserved
     * @tc.desc   With both markers present the query starts at the question mark and keeps the fragment inside it,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            while the path stops before the question mark.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queryAndFragmentOrderIsPreserved', 0, () => {
      const mixed: string = 'https://cdn.example.com/data/report.csv?v=2#page-3';
      expect(queryOf(mixed)).assertEqual('?v=2#page-3');
      expect(queryOf(mixed).indexOf('#') > queryOf(mixed).indexOf('?')).assertTrue();
      expect(pathOf(mixed)).assertEqual('/data/report.csv');
      expect(pathOf(mixed).indexOf('#')).assertEqual(-1);
      expect(fileNameOf(mixed)).assertEqual('report.csv?v=2#page-3');
      expect(redactQuery(mixed)).assertEqual('https://cdn.example.com/data/report.csv');
      expect(fileNameOf(redactQuery(mixed))).assertEqual('report.csv');
      expect(hostOf(mixed)).assertEqual('cdn.example.com');
    });

    /**
     * @tc.name   schemeMarkerNeedsDoubleSlash
     * @tc.desc   A single slash after the colon is not an authority marker, so scheme and host stay empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UrlStructureMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemeMarkerNeedsDoubleSlash', 0, () => {
      const malformed: string = 'https:/example.com/a/file.png';
      expect(schemeOf(malformed)).assertEqual('');
      expect(hostOf(malformed)).assertEqual('');
      expect(pathOf(malformed)).assertEqual('/example.com/a/file.png');
      expect(isHttpsUrl(malformed)).assertFalse();
      expect(fileNameOf(malformed)).assertEqual('file.png');
      expect(extensionOf(malformed)).assertEqual('.png');
    });
  });
}
