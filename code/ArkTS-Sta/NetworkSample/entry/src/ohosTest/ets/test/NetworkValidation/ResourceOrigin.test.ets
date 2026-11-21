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
 * ResourceOrigin suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   151-155  runTaskA builds urlA from the OrangeShopping favor_list_tea drawable
 *   157-162  runTaskB builds urlB from the after_cache drawable
 *   164-171  runTaskC builds the icon_main_color drawable behind the gate
 *   47-53    SharedDriver URL_TASK_A / URL_TASK_B / URL_TASK_C literals
 *   120-168  fileNameOf / extensionOf / schemeOf / hostOf / pathOf / queryOf
 *   1089-1092 expectationFor builds the UrlExpectation triple
 *
 * The suite pins the exact three URL literals, proves that every origin field
 * (scheme, host, path, file name, extension, query) is derived consistently and
 * that the derivation helpers behave correctly on edge inputs. No request is
 * issued: every assertion runs on pure string logic.
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
  fileNameOf,
  extensionOf,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  hasQuery,
  isHttpUrl,
  isHttpsUrl,
  sortedCopy,
  reversedCopy,
  joined,
  sameStringArray,
  hasDuplicateStrings,
  countOf,
  uniqueStrings,
  UrlExpectation,
  expectationFor,
  redactQuery,
  redactCredentials
} from '../Shared/SharedDriver';

const LITERAL_A: string =
  'https://gitee.com/openharmony/applications_app_samples/raw/a826ab0e75fe51d028c1c5af58188e908736b53b/code/Solutions/Shopping/OrangeShopping/feature/navigationHome/src/main/resources/base/media/favor_list_tea.png';
const LITERAL_B: string =
  'https://gitee.com/chenhaiwen2/cases/raw/fdb9d48cacd1083f17b7c3e569b39f36db8a26aa/CommonAppDevelopment/product/entry/src/main/resources/base/media/after_cache.png';
const LITERAL_C: string =
  'https://gitee.com/chenhaiwen2/cases/raw/fdb9d48cacd1083f17b7c3e569b39f36db8a26aa/CommonAppDevelopment/product/entry/src/main/resources/base/media/icon_main_color.png';
const MEDIA_SEGMENT: string = '/src/main/resources/base/media/';
const HOST_GITEE: string = 'gitee.com';

export default function resourceOriginTest(): void {
  describe('ResourceOrigin', () => {
    beforeAll(() => {
      logSuite('ResourceOrigin', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ResourceOrigin', 'end');
    });

    /**
     * @tc.name   taskAUrlMatchesProductionLiteral
     * @tc.desc   URL_TASK_A is byte-identical to the urlA literal of runTaskA.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskAUrlMatchesProductionLiteral', 0, () => {
      logStep('taskAUrlMatchesProductionLiteral', String(URL_TASK_A.length));
      expect(URL_TASK_A).assertEqual(LITERAL_A);
      expect(URL_TASK_A.length).assertEqual(210);
      expect(URL_TASK_A.indexOf('OrangeShopping')).assertLarger(0);
      expect(URL_TASK_A.indexOf('favor_list_tea.png')).assertLarger(0);
      expect(URL_TASK_A === URL_TASK_B).assertFalse();
      expect(URL_TASK_A === LITERAL_C).assertFalse();
    });

    /**
     * @tc.name   taskBUrlMatchesProductionLiteral
     * @tc.desc   URL_TASK_B is byte-identical to the urlB literal of runTaskB.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskBUrlMatchesProductionLiteral', 0, () => {
      logStep('taskBUrlMatchesProductionLiteral', String(URL_TASK_B.length));
      expect(URL_TASK_B).assertEqual(LITERAL_B);
      expect(URL_TASK_B.indexOf('chenhaiwen2')).assertLarger(0);
      expect(URL_TASK_B.indexOf('after_cache.png')).assertLarger(0);
      expect(URL_TASK_B.indexOf('OrangeShopping')).assertLess(0);
      expect(URL_TASK_B === LITERAL_B).assertTrue();
    });

    /**
     * @tc.name   taskCUrlMatchesProductionLiteral
     * @tc.desc   URL_TASK_C is byte-identical to the url literal of runTaskC.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCUrlMatchesProductionLiteral', 0, () => {
      logStep('taskCUrlMatchesProductionLiteral', String(URL_TASK_C.length));
      expect(URL_TASK_C).assertEqual(LITERAL_C);
      expect(URL_TASK_C.length).assertEqual(165);
      expect(URL_TASK_C.indexOf('icon_main_color.png')).assertLarger(0);
      expect(URL_TASK_C.indexOf('after_cache.png')).assertLess(0);
      expect(URL_TASK_C === LITERAL_A).assertFalse();
      expect(URL_TASK_C === LITERAL_C).assertTrue();
    });

    /**
     * @tc.name   everyTaskUrlUsesHttpsScheme
     * @tc.desc   All three download sources open with the https scheme and fail the plain-http predicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyTaskUrlUsesHttpsScheme', 0, () => {
      let httpsCount: number = 0;
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        if (isHttpsUrl(url)) {
          httpsCount = httpsCount + 1;
        }
        expect(schemeOf(url)).assertEqual('https');
        expect(url.startsWith('https://')).assertTrue();
        expect(isHttpUrl(url)).assertFalse();
        expect(schemeOf(url) === 'http').assertFalse();
      }
      logStep('everyTaskUrlUsesHttpsScheme', String(httpsCount));
      expect(httpsCount).assertEqual(3);
      expect(schemeOf(TASK_URLS[0])).assertEqual(schemeOf(TASK_URLS[2]));
    });

    /**
     * @tc.name   originTaskUrlsShareGiteeHost
     * @tc.desc   hostOf yields the same gitee.com authority for every pinned drawable URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('originTaskUrlsShareGiteeHost', 0, () => {
      const hosts: string[] = [];
      for (let index = 0; index < TASK_URLS.length; index++) {
        const host: string = hostOf(TASK_URLS[index]);
        hosts.push(host);
        expect(host).assertEqual(HOST_GITEE);
        expect(host.indexOf('://')).assertLess(0);
      }
      logStep('taskUrlsShareGiteeHost', joined(hosts, '/'));
      expect(joined(hosts, '/')).assertEqual('gitee.com/gitee.com/gitee.com');
      expect(uniqueStrings(hosts).length).assertEqual(1);
      expect(hostOf(URL_TASK_B).length).assertEqual(9);
    });

    /**
     * @tc.name   taskUrlsDifferInRepositorySegment
     * @tc.desc   Task A lives in openharmony samples while B and C live in chenhaiwen2.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlsDifferInRepositorySegment', 0, () => {
      expect(URL_TASK_A.indexOf('/openharmony/')).assertLarger(0);
      expect(URL_TASK_A.indexOf('/chenhaiwen2/')).assertLess(0);
      expect(URL_TASK_B.indexOf('/chenhaiwen2/')).assertLarger(0);
      expect(URL_TASK_C.indexOf('/openharmony/')).assertLess(0);
      const commonHead: string = URL_TASK_B.substring(0, URL_TASK_B.indexOf('after_cache'));
      expect(URL_TASK_C.startsWith(commonHead)).assertTrue();
      expect(URL_TASK_A.startsWith(commonHead)).assertFalse();
      logStep('taskUrlsDifferInRepositorySegment', String(commonHead.length));
    });

    /**
     * @tc.name   everyTaskUrlEndsWithPngExtension
     * @tc.desc   extensionOf reports .png for all three sources and rejects a jpeg spelling.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyTaskUrlEndsWithPngExtension', 0, () => {
      let pngCount: number = 0;
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        expect(extensionOf(url)).assertEqual('.png');
        expect(url.endsWith('.png')).assertTrue();
        expect(extensionOf(url) === '.jpg').assertFalse();
        if (extensionOf(url) === '.png') {
          pngCount = pngCount + 1;
        }
      }
      logStep('everyTaskUrlEndsWithPngExtension', String(pngCount));
      expect(pngCount).assertEqual(3);
      expect(fileNameOf(URL_TASK_A).endsWith(extensionOf(URL_TASK_A))).assertTrue();
    });

    /**
     * @tc.name   fileNameOfResolvesEachDrawable
     * @tc.desc   fileNameOf returns the last path segment for A, B and C without any directory noise.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileNameOfResolvesEachDrawable', 0, () => {
      const nameA: string = fileNameOf(URL_TASK_A);
      const nameB: string = fileNameOf(URL_TASK_B);
      const nameC: string = fileNameOf(URL_TASK_C);
      logStep('fileNameOfResolvesEachDrawable', nameA + ',' + nameB + ',' + nameC);
      expect(nameA).assertEqual('favor_list_tea.png');
      expect(nameB).assertEqual('after_cache.png');
      expect(nameC).assertEqual('icon_main_color.png');
      expect(nameA.indexOf('/')).assertLess(0);
      expect(nameB.length).assertEqual(15);
      expect(joined([nameA, nameB, nameC], ';')).assertEqual('favor_list_tea.png;after_cache.png;icon_main_color.png');
    });

    /**
     * @tc.name   taskUrlsCarryNoQueryString
     * @tc.desc   Pinned drawable URLs never embed a query, so queryOf is empty and redaction is a no-op.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsCarryNoQueryString', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        expect(hasQuery(url)).assertFalse();
        expect(queryOf(url)).assertEqual('');
        expect(url.indexOf('?')).assertLess(0);
        expect(url.indexOf('&')).assertLess(0);
        expect(redactQuery(url) === url).assertTrue();
      }
      logStep('taskUrlsCarryNoQueryString', String(TASK_URLS.length));
      expect(queryOf(URL_TASK_A)).assertEqual('');
      expect(redactQuery(URL_TASK_C).length).assertEqual(URL_TASK_C.length);
    });

    /**
     * @tc.name   pathOfKeepsMediaSegment
     * @tc.desc   pathOf returns the repository path that still contains the media directory and drawable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pathOfKeepsMediaSegment', 0, () => {
      const pathB: string = pathOf(URL_TASK_B);
      expect(pathB.indexOf(MEDIA_SEGMENT)).assertLarger(0);
      expect(pathB.startsWith('/chenhaiwen2/')).assertTrue();
      expect(pathOf(URL_TASK_A).startsWith('/openharmony/')).assertTrue();
      expect(pathB.endsWith('after_cache.png')).assertTrue();
      expect(pathB.indexOf(HOST_GITEE)).assertLess(0);
      expect(pathB.length).assertEqual(URL_TASK_B.length - 17);
      expect(pathOf(URL_TASK_C)).assertEqual(URL_TASK_C.substring(17));
      logStep('pathOfKeepsMediaSegment', String(pathB.length));
    });

    /**
     * @tc.name   expectationForTaskADerivesFields
     * @tc.desc   expectationFor(TASK_A) exposes the parsed file name, extension and host of urlA.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectationForTaskADerivesFields', 0, () => {
      const expected: UrlExpectation = expectationFor(TASK_A);
      logStep('expectationForTaskADerivesFields', expected.fileName);
      expect(expected.taskNo).assertEqual(TASK_A);
      expect(expected.url).assertEqual(URL_TASK_A);
      expect(expected.fileName).assertEqual('favor_list_tea.png');
      expect(expected.extension).assertEqual('.png');
      expect(expected.host).assertEqual(HOST_GITEE);
      expect(expected.url === URL_TASK_B).assertFalse();
    });

    /**
     * @tc.name   expectationForTaskBDerivesFields
     * @tc.desc   expectationFor(TASK_B) points at after_cache.png under the gitee.com authority.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectationForTaskBDerivesFields', 0, () => {
      const expected: UrlExpectation = expectationFor(TASK_B);
      logStep('expectationForTaskBDerivesFields', expected.fileName);
      expect(expected.taskNo).assertEqual(TASK_B);
      expect(expected.url).assertEqual(LITERAL_B);
      expect(expected.fileName).assertEqual('after_cache.png');
      expect(expected.extension).assertEqual(extensionOf(URL_TASK_B));
      expect(expected.host).assertEqual('gitee.com');
      expect(expected.fileName.length).assertEqual(15);
      expect(expected.url.endsWith(expected.fileName)).assertTrue();
    });

    /**
     * @tc.name   expectationForTaskCDerivesFields
     * @tc.desc   expectationFor(TASK_C) resolves icon_main_color.png even though C only runs after A and B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectationForTaskCDerivesFields', 0, () => {
      const expected: UrlExpectation = expectationFor(TASK_C);
      logStep('expectationForTaskCDerivesFields', expected.fileName);
      expect(expected.taskNo).assertEqual(TASK_C);
      expect(expected.url).assertEqual(LITERAL_C);
      expect(expected.fileName).assertEqual('icon_main_color.png');
      expect(expected.extension).assertEqual('.png');
      expect(expected.host.length).assertEqual(9);
      expect(expected.extension === expected.fileName).assertFalse();
    });

    /**
     * @tc.name   expectationForUnknownTaskFallsBackToTaskC
     * @tc.desc   An unknown task number keeps its label but receives the last URL of the ternary chain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectationForUnknownTaskFallsBackToTaskC', 0, () => {
      const fallback: UrlExpectation = expectationFor('Z');
      logStep('expectationForUnknownTaskFallsBackToTaskC', fallback.taskNo);
      expect(fallback.taskNo).assertEqual('Z');
      expect(fallback.url).assertEqual(URL_TASK_C);
      expect(fallback.fileName).assertEqual('icon_main_color.png');
      expect(fallback.host).assertEqual(HOST_GITEE);
      expect(expectationFor('').url).assertEqual(URL_TASK_C);
      expect(expectationFor('a').url).assertEqual(URL_TASK_C);
      expect(fallback.taskNo === TASK_C).assertFalse();
    });

    /**
     * @tc.name   urlExpectationClassDerivesFieldsFromConstructor
     * @tc.desc   The UrlExpectation constructor parses the URL it is given and keeps the label untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlExpectationClassDerivesFieldsFromConstructor', 0, () => {
      const mixed: UrlExpectation = new UrlExpectation(TASK_A, LITERAL_B);
      logStep('urlExpectationClassDerivesFieldsFromConstructor', mixed.fileName);
      expect(mixed.taskNo).assertEqual(TASK_A);
      expect(mixed.url).assertEqual(LITERAL_B);
      expect(mixed.fileName).assertEqual('after_cache.png');
      expect(mixed.extension).assertEqual('.png');
      expect(mixed.host).assertEqual(HOST_GITEE);
      expect(mixed.fileName).assertEqual(fileNameOf(LITERAL_B));
      expect(mixed.taskNo).assertEqual(TASK_A);
    });

    /**
     * @tc.name   urlExpectationsRemainIndependentObjects
     * @tc.desc   Two expectations hold their own fields; editing one does not leak into the other.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlExpectationsRemainIndependentObjects', 0, () => {
      const first: UrlExpectation = expectationFor(TASK_A);
      const second: UrlExpectation = expectationFor(TASK_B);
      expect(first.fileName === second.fileName).assertFalse();
      expect(first.host).assertEqual(second.host);
      first.fileName = 'patched.png';
      expect(first.fileName).assertEqual('patched.png');
      expect(second.fileName).assertEqual('after_cache.png');
      expect(second.url).assertEqual(URL_TASK_B);
      expect(first.url).assertEqual(URL_TASK_A);
      logStep('urlExpectationsRemainIndependentObjects', second.fileName);
    });

    /**
     * @tc.name   fileNameOfUsesFallbackForTrailingSlash
     * @tc.desc   A URL that ends with a slash has no file name and therefore returns the supplied fallback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileNameOfUsesFallbackForTrailingSlash', 0, () => {
      const directoryUrl: string = 'https://gitee.com/chenhaiwen2/media/';
      expect(fileNameOf(directoryUrl, 'fallback.bin')).assertEqual('fallback.bin');
      expect(fileNameOf(directoryUrl)).assertEqual('file');
      expect(fileNameOf('')).assertEqual('file');
      expect(fileNameOf('https://gitee.com/chenhaiwen2/media/', '')).assertEqual('');
      expect(fileNameOf(directoryUrl, 'fallback.bin').indexOf('/')).assertLess(0);
      logStep('fileNameOfUsesFallbackForTrailingSlash', fileNameOf(directoryUrl));
    });

    /**
     * @tc.name   extensionOfIgnoresDotsInDirectoryNames
     * @tc.desc   Only a dot inside the final segment counts as an extension; dotted directories are ignored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionOfIgnoresDotsInDirectoryNames', 0, () => {
      expect(extensionOf('https://gitee.com/media/v1.2/icon_main_color')).assertEqual('');
      expect(extensionOf('https://gitee.com/media/v1.2/icon_main_color.png')).assertEqual('.png');
      expect(extensionOf('https://gitee.com/media/favor_list_tea.png')).assertEqual('.png');
      expect(extensionOf('https://gitee.com/media/a.b.c.jpeg')).assertEqual('.jpeg');
      expect(extensionOf(URL_TASK_A)).assertEqual(extensionOf(URL_TASK_C));
      logStep('extensionOfIgnoresDotsInDirectoryNames', extensionOf('https://gitee.com/media/a.b.c.jpeg'));
    });

    /**
     * @tc.name   schemeOfReturnsEmptyWithoutSeparator
     * @tc.desc   schemeOf requires the :// marker and returns an empty string for relative or marker-free input.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemeOfReturnsEmptyWithoutSeparator', 0, () => {
      expect(schemeOf('gitee.com/media/icon.png')).assertEqual('');
      expect(schemeOf('/media/icon_main_color.png')).assertEqual('');
      expect(schemeOf('https:/gitee.com/media/icon.png')).assertEqual('');
      expect(schemeOf('://gitee.com/media/icon.png')).assertEqual('');
      expect(schemeOf('HTTPS://GITEE.COM/MEDIA/ICON.PNG')).assertEqual('HTTPS');
      expect(schemeOf('')).assertEqual('');
      logStep('schemeOfReturnsEmptyWithoutSeparator', String(schemeOf('://gitee.com').length));
    });

    /**
     * @tc.name   hostOfStopsAtFirstPathSlash
     * @tc.desc   The authority is everything between :// and the first slash, or empty when no marker exists.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hostOfStopsAtFirstPathSlash', 0, () => {
      expect(hostOf('https://gitee.com')).assertEqual(HOST_GITEE);
      expect(hostOf('https://gitee.com/')).assertEqual(HOST_GITEE);
      expect(hostOf('https://gitee.com/a/b/c.png')).assertEqual(HOST_GITEE);
      expect(hostOf('gitee.com/a/b.png')).assertEqual('');
      expect(hostOf('/media/icon_main_color.png')).assertEqual('');
      expect(hostOf('https://gitee.com/a/b/c.png').indexOf('/')).assertLess(0);
      logStep('hostOfStopsAtFirstPathSlash', hostOf('https://gitee.com/a/b/c.png'));
    });

    /**
     * @tc.name   taskUrlLengthsKeepRepositoryOrdering
     * @tc.desc   The OrangeShopping path is longest, store paths share a prefix and differ by four characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlLengthsKeepRepositoryOrdering', 0, () => {
      let sum: number = 0;
      for (let index = 0; index < TASK_URLS.length; index++) {
        sum = sum + TASK_URLS[index].length;
      }
      logStep('taskUrlLengthsKeepRepositoryOrdering', String(sum));
      expect(URL_TASK_A.length).assertEqual(210);
      expect(URL_TASK_B.length).assertEqual(161);
      expect(URL_TASK_C.length).assertEqual(165);
      expect(URL_TASK_A.length > URL_TASK_C.length).assertTrue();
      expect(URL_TASK_C.length > URL_TASK_B.length).assertTrue();
      expect(URL_TASK_C.length - URL_TASK_B.length).assertEqual(4);
      expect(sum).assertEqual(536);
    });

    /**
     * @tc.name   taskUrlsAreUniqueWithinTheSuite
     * @tc.desc   The three pinned URLs are pairwise distinct so duplicate detection and counting stay honest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsAreUniqueWithinTheSuite', 0, () => {
      expect(hasDuplicateStrings(TASK_URLS)).assertFalse();
      expect(countOf(TASK_URLS, URL_TASK_A)).assertEqual(1);
      expect(countOf(TASK_URLS, URL_TASK_B)).assertEqual(1);
      expect(countOf(TASK_URLS, URL_TASK_C)).assertEqual(1);
      expect(countOf(TASK_URLS, LITERAL_A)).assertEqual(1);
      const unique: string[] = uniqueStrings(TASK_URLS);
      expect(unique.length).assertEqual(3);
      expect(sameStringArray(unique, TASK_URLS)).assertTrue();
      logStep('taskUrlsAreUniqueWithinTheSuite', String(unique.length));
    });

    /**
     * @tc.name   sortedTaskUrlsOrderAlphabetically
     * @tc.desc   Sorting positions the two chenhaiwen2 URLs first and leaves the pinned array untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sortedTaskUrlsOrderAlphabetically', 0, () => {
      const ordered: string[] = sortedCopy(TASK_URLS);
      logStep('sortedTaskUrlsOrderAlphabetically', ordered[0]);
      expect(ordered[0]).assertEqual(URL_TASK_B);
      expect(ordered[1]).assertEqual(URL_TASK_C);
      expect(ordered[2]).assertEqual(URL_TASK_A);
      expect(ordered.length).assertEqual(TASK_URLS.length);
      expect(TASK_URLS[0]).assertEqual(URL_TASK_A);
      expect(TASK_URLS[2]).assertEqual(URL_TASK_C);
      expect(sameStringArray(ordered, TASK_URLS)).assertFalse();
      expect(ordered[0].indexOf('chenhaiwen2')).assertLarger(0);
    });

    /**
     * @tc.name   reversedTaskUrlsMirrorPageOrder
     * @tc.desc   Reversing the URL list yields C, B, A which is the reverse of the row order on the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reversedTaskUrlsMirrorPageOrder', 0, () => {
      const mirror: string[] = reversedCopy(TASK_URLS);
      logStep('reversedTaskUrlsMirrorPageOrder', fileNameOf(mirror[0]));
      expect(mirror[0]).assertEqual(URL_TASK_C);
      expect(mirror[1]).assertEqual(URL_TASK_B);
      expect(mirror[2]).assertEqual(URL_TASK_A);
      expect(fileNameOf(mirror[0])).assertEqual('icon_main_color.png');
      expect(fileNameOf(mirror[2])).assertEqual('favor_list_tea.png');
      expect(sameStringArray(mirror, TASK_URLS)).assertFalse();
      expect(sameStringArray(reversedCopy(mirror), TASK_URLS)).assertTrue();
    });

    /**
     * @tc.name   taskUrlsNeverCarryUppercaseScheme
     * @tc.desc   Every source spells the scheme in lower case, so the https prefix guard accepts it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlsNeverCarryUppercaseScheme', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        expect(url.startsWith('HTTPS://')).assertFalse();
        expect(url.startsWith('Http://')).assertFalse();
        expect(schemeOf(url)).assertEqual('https');
        expect(schemeOf(url) === schemeOf(url).toUpperCase()).assertFalse();
        expect(isHttpsUrl(url)).assertTrue();
      }
      expect(isHttpsUrl('HTTPS://GITEE.COM/A.PNG')).assertFalse();
      logStep('taskUrlsNeverCarryUppercaseScheme', schemeOf(URL_TASK_C));
    });

    /**
     * @tc.name   taskUrlsCarryNoFragment
     * @tc.desc   Pinned drawables never append a fragment, so the resource name stays the final segment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskUrlsCarryNoFragment', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        expect(url.indexOf('#')).assertLess(0);
        expect(url.endsWith(fileNameOf(url))).assertTrue();
        expect(fileNameOf(url).indexOf('#')).assertLess(0);
      }
      expect(fileNameOf('https://gitee.com/media/icon.png#preview')).assertEqual('icon.png#preview');
      expect(extensionOf('https://gitee.com/media/icon.png#preview')).assertEqual('.png#preview');
      logStep('taskUrlsCarryNoFragment', String(TASK_URLS[1].indexOf('#')));
    });

    /**
     * @tc.name   hostOfRejectsRelativeMediaPath
     * @tc.desc   A relative media path has no authority and no scheme, so both extractors return empty strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostOfRejectsRelativeMediaPath', 0, () => {
      expect(hostOf('/media/icon_main_color.png')).assertEqual('');
      expect(hostOf('media/icon_main_color.png')).assertEqual('');
      expect(schemeOf('media/icon_main_color.png')).assertEqual('');
      expect(isHttpsUrl('media/icon_main_color.png')).assertFalse();
      expect(isHttpUrl('/media/icon_main_color.png')).assertFalse();
      expect(pathOf('media/icon_main_color.png')).assertEqual('/icon_main_color.png');
      expect(fileNameOf('/media/icon_main_color.png')).assertEqual('icon_main_color.png');
      logStep('hostOfRejectsRelativeMediaPath', String(hostOf('/media/icon_main_color.png').length));
    });

    /**
     * @tc.name   expectationForPreservesTaskNumbers
     * @tc.desc   Each expectation keeps the requested label while resolving a distinct URL from the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectationForPreservesTaskNumbers', 0, () => {
      const labels: string[] = [TASK_A, TASK_B, TASK_C];
      const urls: string[] = [];
      for (let index = 0; index < labels.length; index++) {
        const expected: UrlExpectation = expectationFor(labels[index]);
        urls.push(expected.url);
        expect(expected.taskNo).assertEqual(labels[index]);
        expect(expected.taskNo === labels[index]).assertTrue();
      }
      logStep('expectationForPreservesTaskNumbers', joined(labels, ','));
      expect(urls[0]).assertEqual(URL_TASK_A);
      expect(urls[1]).assertEqual(URL_TASK_B);
      expect(urls[2]).assertEqual(URL_TASK_C);
      expect(hasDuplicateStrings(urls)).assertFalse();
      expect(joined(labels, '')).assertEqual('ABC');
    });

    /**
     * @tc.name   taskExpectationHostsAgreeWithHostOf
     * @tc.desc   The expectation table and the raw helpers agree on host, file name and extension for every task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskExpectationHostsAgreeWithHostOf', 0, () => {
      const labels: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < labels.length; index++) {
        const expected: UrlExpectation = expectationFor(labels[index]);
        expect(expected.host).assertEqual(hostOf(TASK_URLS[index]));
        expect(expected.fileName).assertEqual(fileNameOf(TASK_URLS[index]));
        expect(expected.extension).assertEqual(extensionOf(TASK_URLS[index]));
        expect(expected.url).assertEqual(TASK_URLS[index]);
      }
      logStep('taskExpectationHostsAgreeWithHostOf', expectationFor(TASK_C).host);
      expect(expectationFor(TASK_A).host).assertEqual(expectationFor(TASK_B).host);
      expect(expectationFor(TASK_B).extension).assertEqual(expectationFor(TASK_C).extension);
      expect(expectationFor(TASK_A).fileName === expectationFor(TASK_C).fileName).assertFalse();
    });

    /**
     * @tc.name   mediaSegmentIsIdenticalAcrossTaskUrls
     * @tc.desc   All three sources resolve into the base/media resources folder that the page draws its images from.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mediaSegmentIsIdenticalAcrossTaskUrls', 0, () => {
      let hits: number = 0;
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        const at: int = url.indexOf(MEDIA_SEGMENT);
        expect(at).assertLarger(0);
        expect(url.substring(at).startsWith(MEDIA_SEGMENT)).assertTrue();
        expect(pathOf(url).indexOf(MEDIA_SEGMENT)).assertLarger(0);
        if (at > 0) {
          hits = hits + 1;
        }
      }
      logStep('mediaSegmentIsIdenticalAcrossTaskUrls', String(hits));
      expect(hits).assertEqual(3);
      expect(URL_TASK_A.indexOf(MEDIA_SEGMENT + 'favor_list_tea.png')).assertLarger(0);
      expect(URL_TASK_B.indexOf(MEDIA_SEGMENT + 'after_cache.png')).assertLarger(0);
      expect(URL_TASK_C.indexOf(MEDIA_SEGMENT + 'icon_main_color.png')).assertLarger(0);
    });

    /**
     * @tc.name   queryOfKeepsQuestionMarkOnVariant
     * @tc.desc   A cache-busting variant is returned with its leading question mark and does not change the origin.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryOfKeepsQuestionMarkOnVariant', 0, () => {
      const variant: string = URL_TASK_A + '?v=20260101';
      expect(queryOf(variant)).assertEqual('?v=20260101');
      expect(hasQuery(variant)).assertTrue();
      expect(hasQuery(URL_TASK_A)).assertFalse();
      expect(schemeOf(variant)).assertEqual('https');
      expect(hostOf(variant)).assertEqual(HOST_GITEE);
      expect(pathOf(variant)).assertEqual(pathOf(URL_TASK_A));
      expect(fileNameOf(variant)).assertEqual('favor_list_tea.png?v=20260101');
      logStep('queryOfKeepsQuestionMarkOnVariant', queryOf(variant));
    });

    /**
     * @tc.name   redactQueryStripsVariantToken
     * @tc.desc   Redaction restores the clean drawable URL so a log line cannot leak the cache token.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactQueryStripsVariantToken', 0, () => {
      const signed: string = URL_TASK_B + '?token=secret-value&expires=99';
      const clean: string = redactQuery(signed);
      logStep('redactQueryStripsVariantToken', String(clean.length));
      expect(clean).assertEqual(URL_TASK_B);
      expect(clean.indexOf('token')).assertLess(0);
      expect(clean.indexOf('?')).assertLess(0);
      expect(clean.length < signed.length).assertTrue();
      expect(hasQuery(signed)).assertTrue();
      expect(hasQuery(clean)).assertFalse();
      expect(redactQuery(clean)).assertEqual(clean);
    });

    /**
     * @tc.name   redactCredentialsMasksUserInfoInDrawableUrl
     * @tc.desc   User and password before the authority are replaced by a fixed mask without touching the path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactCredentialsMasksUserInfoInDrawableUrl', 0, () => {
      const guarded: string = 'https://build:release@gitee.com/chenhaiwen2/media/icon_main_color.png';
      const masked: string = redactCredentials(guarded);
      logStep('redactCredentialsMasksUserInfoInDrawableUrl', masked);
      expect(masked).assertEqual('https://***@gitee.com/chenhaiwen2/media/icon_main_color.png');
      expect(masked.indexOf('release')).assertLess(0);
      expect(masked.indexOf('build')).assertLess(0);
      expect(masked.startsWith('https://***@')).assertTrue();
      expect(masked.endsWith('icon_main_color.png')).assertTrue();
      expect(redactCredentials(URL_TASK_C)).assertEqual(URL_TASK_C);
      expect(hostOf(guarded)).assertEqual('build:release@gitee.com');
    });

    /**
     * @tc.name   fileNameOfHandlesBareSegment
     * @tc.desc   A URL with no directory part is its own file name and keeps the png extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameOfHandlesBareSegment', 0, () => {
      expect(fileNameOf('icon_main_color.png')).assertEqual('icon_main_color.png');
      expect(fileNameOf('after_cache.png', 'fallback')).assertEqual('after_cache.png');
      expect(fileNameOf('icon_main_color.png').indexOf('/')).assertLess(0);
      expect(extensionOf('icon_main_color.png')).assertEqual('.png');
      expect(hostOf('icon_main_color.png')).assertEqual('');
      expect(schemeOf('icon_main_color.png')).assertEqual('');
      expect(pathOf('icon_main_color.png')).assertEqual('');
      logStep('fileNameOfHandlesBareSegment', fileNameOf('icon_main_color.png'));
    });

    /**
     * @tc.name   taskUrlsBeginAtGiteeAuthority
     * @tc.desc   Every pinned URL starts with the same eight character https prefix plus the gitee.com authority.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlsBeginAtGiteeAuthority', 0, () => {
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        expect(url.startsWith('https://gitee.com/')).assertTrue();
        expect(url.indexOf(HOST_GITEE)).assertEqual(8);
        expect(url.substring(0, 8)).assertEqual('https://');
        expect(url.substring(8, 17)).assertEqual(HOST_GITEE);
        expect(url.indexOf('://')).assertEqual(5);
      }
      logStep('taskUrlsBeginAtGiteeAuthority', URL_TASK_A.substring(0, 17));
      expect(URL_TASK_A.substring(0, 17)).assertEqual('https://gitee.com');
      expect(URL_TASK_C.substring(8, 17)).assertEqual(URL_TASK_B.substring(8, 17));
    });

    /**
     * @tc.name   hostOfKeepsPortInAuthority
     * @tc.desc   A numeric port stays part of the authority because hostOf only stops at the first slash.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostOfKeepsPortInAuthority', 0, () => {
      expect(hostOf('https://gitee.com:443/a/icon.png')).assertEqual('gitee.com:443');
      expect(hostOf('https://gitee.com:443')).assertEqual('gitee.com:443');
      expect(hostOf('https://gitee.com:443/a/icon.png').indexOf(':')).assertLarger(0);
      expect(hostOf(URL_TASK_B)).assertEqual(HOST_GITEE);
      expect(hostOf(URL_TASK_B).indexOf(':')).assertLess(0);
      expect(fileNameOf('https://gitee.com:443/a/icon.png')).assertEqual('icon.png');
      logStep('hostOfKeepsPortInAuthority', hostOf('https://gitee.com:443/a/icon.png'));
    });

    /**
     * @tc.name   pathOfEmptyForAuthorityOnlyUrl
     * @tc.desc   An authority-only URL has no path while a single trailing slash yields one separator character.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pathOfEmptyForAuthorityOnlyUrl', 0, () => {
      expect(pathOf('https://gitee.com')).assertEqual('');
      expect(pathOf('https://gitee.com/')).assertEqual('/');
      expect(pathOf('')).assertEqual('');
      expect(queryOf('')).assertEqual('');
      expect(hostOf('https://gitee.com')).assertEqual(HOST_GITEE);
      expect(fileNameOf('https://gitee.com')).assertEqual('gitee.com');
      expect(pathOf(URL_TASK_A).length).assertEqual(URL_TASK_A.length - 17);
      logStep('pathOfEmptyForAuthorityOnlyUrl', String(pathOf('https://gitee.com/').length));
    });

    /**
     * @tc.name   extensionOfKeepsUppercaseSuffix
     * @tc.desc   Extension extraction is case sensitive, so an uppercase PNG suffix stays uppercase.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionOfKeepsUppercaseSuffix', 0, () => {
      const upper: string = 'https://gitee.com/media/ICON.PNG';
      expect(extensionOf(upper)).assertEqual('.PNG');
      expect(extensionOf(upper) === '.png').assertFalse();
      expect(extensionOf(upper).toLowerCase()).assertEqual('.png');
      expect(fileNameOf(upper)).assertEqual('ICON.PNG');
      expect(isHttpsUrl(upper)).assertTrue();
      expect(extensionOf(URL_TASK_A)).assertEqual('.png');
      logStep('extensionOfKeepsUppercaseSuffix', extensionOf(upper));
    });

    /**
     * @tc.name   urlExpectationFieldsAreFrozenAtConstruction
     * @tc.desc   Replacing the url field of an expectation does not recompute the derived fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlExpectationFieldsAreFrozenAtConstruction', 0, () => {
      const expected: UrlExpectation = expectationFor(TASK_A);
      expected.url = URL_TASK_B;
      logStep('urlExpectationFieldsAreFrozenAtConstruction', expected.fileName);
      expect(expected.url).assertEqual(URL_TASK_B);
      expect(expected.fileName).assertEqual('favor_list_tea.png');
      expect(expected.fileName === fileNameOf(expected.url)).assertFalse();
      expect(expected.host).assertEqual(HOST_GITEE);
      expect(expected.extension).assertEqual('.png');
      expect(new UrlExpectation(TASK_B, URL_TASK_B).fileName).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   sortedCopyIsOrderIndependentOfInputOrder
     * @tc.desc   Sorting a reversed list produces the same sequence as sorting the original list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sortedCopyIsOrderIndependentOfInputOrder', 0, () => {
      const forward: string[] = sortedCopy(TASK_URLS);
      const backward: string[] = sortedCopy(reversedCopy(TASK_URLS));
      logStep('sortedCopyIsOrderIndependentOfInputOrder', forward[0]);
      expect(sameStringArray(forward, backward)).assertTrue();
      expect(forward[0]).assertEqual(backward[0]);
      expect(backward[0]).assertEqual(URL_TASK_B);
      expect(backward[2]).assertEqual(URL_TASK_A);
      expect(forward.length).assertEqual(3);
      expect(TASK_URLS[0]).assertEqual(URL_TASK_A);
      expect(backward === forward).assertFalse();
    });

    /**
     * @tc.name   taskOriginSummaryKeepsThreePngDrawables
     * @tc.desc   Aggregating every origin field confirms three distinct drawables on one https host.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskOriginSummaryKeepsThreePngDrawables', 0, () => {
      const names: string[] = [];
      const hosts: string[] = [];
      const schemes: string[] = [];
      for (let index = 0; index < TASK_URLS.length; index++) {
        names.push(fileNameOf(TASK_URLS[index]));
        hosts.push(hostOf(TASK_URLS[index]));
        schemes.push(schemeOf(TASK_URLS[index]));
      }
      logStep('taskOriginSummaryKeepsThreePngDrawables', joined(names, ','));
      expect(names.length).assertEqual(3);
      expect(uniqueStrings(names).length).assertEqual(3);
      expect(uniqueStrings(hosts).length).assertEqual(1);
      expect(uniqueStrings(schemes).length).assertEqual(1);
      expect(joined(schemes, ',')).assertEqual('https,https,https');
      expect(extensionOf(TASK_URLS[0])).assertEqual(extensionOf(TASK_URLS[1]));
      expect(hasDuplicateStrings(names)).assertFalse();
      expect(names[2]).assertEqual('icon_main_color.png');
    });

    /**
     * @tc.name   repeatedOriginDerivationIsDeterministic
     * @tc.desc   Three consecutive derivation rounds return identical fields for the same pinned URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceOrigin scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedOriginDerivationIsDeterministic', 0, () => {
      const firstNames: string[] = [];
      const secondNames: string[] = [];
      for (let round: number = 0; round < 3; round++) {
        const roundNames: string[] = [];
        for (let index = 0; index < TASK_URLS.length; index++) {
          roundNames.push(fileNameOf(TASK_URLS[index]) + '@' + hostOf(TASK_URLS[index]));
        }
        if (round === 0) {
          for (let index = 0; index < roundNames.length; index++) {
            firstNames.push(roundNames[index]);
          }
        } else {
          for (let index = 0; index < roundNames.length; index++) {
            secondNames.push(roundNames[index]);
          }
        }
      }
      logStep('repeatedOriginDerivationIsDeterministic', joined(firstNames, ';'));
      expect(sameStringArray(firstNames, secondNames.slice(0, 3))).assertTrue();
      expect(secondNames.length).assertEqual(6);
      expect(secondNames[0]).assertEqual('favor_list_tea.png@gitee.com');
      expect(secondNames[5]).assertEqual('icon_main_color.png@gitee.com');
      expect(firstNames[1].indexOf('@gitee.com')).assertLarger(0);
      expect(secondNames[3]).assertEqual(firstNames[0]);
    });
  });
}
