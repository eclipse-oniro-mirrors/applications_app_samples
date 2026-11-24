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
 * ResourceSource suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  download() builds the request.agent.Config from the caller URL
 *   151-171  runTaskA / runTaskB / runTaskC are the only positions that create URLs
 *   612-637  DownloadConfig.validate() is the gate that decides whether a source is usable
 *   170-201  isHttpUrl / isHttpsUrl / hasQuery / redactQuery / redactCredentials
 *   203-278  array helpers that detect duplicate or unsorted source lists
 *
 * The suite feeds empty, relative, plain-http, ftp, file, data and javascript
 * sources into the validation block and pins the exact error code list. It also
 * covers the array utilities that a source table relies on: duplicate detection,
 * counting, de-duplication, sorting and reversal. No network call is made.
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
  DownloadConfig,
  fileNameOf,
  extensionOf,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  hasQuery,
  isHttpUrl,
  isHttpsUrl,
  redactQuery,
  redactCredentials,
  hasDuplicateStrings,
  countOf,
  uniqueStrings,
  sortedCopy,
  reversedCopy,
  sameStringArray,
  joined
} from '../Shared/SharedDriver';

const PRESET_ACTION: string = 'DOWNLOAD';
const PRESET_METHOD: string = 'GET';
const PRESET_SAVEAS: string = './';
const LITERAL_C: string =
  'https://gitee.com/chenhaiwen2/cases/raw/fdb9d48cacd1083f17b7c3e569b39f36db8a26aa/CommonAppDevelopment/product/entry/src/main/resources/base/media/icon_main_color.png';

function sourceConfig(url: string): DownloadConfig {
  return new DownloadConfig(PRESET_ACTION, url, true, PRESET_METHOD, PRESET_SAVEAS);
}

export default function resourceSourceTest(): void {
  describe('ResourceSource', () => {
    beforeAll(() => {
      logSuite('ResourceSource', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ResourceSource', 'end');
    });

    /**
     * @tc.name   emptyUrlProducesEmptyAndNotHttpsErrors
     * @tc.desc   An empty source fails both URL rules because it is empty and not an https prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyUrlProducesEmptyAndNotHttpsErrors', 0, () => {
      const config: DownloadConfig = sourceConfig('');
      const errors: string[] = config.validate();
      logStep('emptyUrlProducesEmptyAndNotHttpsErrors', joined(errors, ','));
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.url.length).assertEqual(0);
      expect(fileNameOf(config.url)).assertEqual('file');
      expect(config.describe().endsWith('|')).assertTrue();
    });

    /**
     * @tc.name   relativeMediaPathFailsHttpsCheck
     * @tc.desc   A page-relative media path is non-empty but lacks the https prefix, so only one rule fires.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('relativeMediaPathFailsHttpsCheck', 0, () => {
      const config: DownloadConfig = sourceConfig('/base/media/icon_main_color.png');
      const errors: string[] = config.validate();
      logStep('relativeMediaPathFailsHttpsCheck', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(errors.indexOf('url-empty')).assertLess(0);
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(schemeOf(config.url)).assertEqual('');
      expect(hostOf(config.url)).assertEqual('');
      expect(config.url.startsWith('/')).assertTrue();
    });

    /**
     * @tc.name   plainHttpSourceIsRejected
     * @tc.desc   A http:// drawable matches the insecure predicate and is refused by the https rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('plainHttpSourceIsRejected', 0, () => {
      const config: DownloadConfig = sourceConfig('http://gitee.com/chenhaiwen2/media/after_cache.png');
      logStep('plainHttpSourceIsRejected', schemeOf(config.url));
      expect(isHttpUrl(config.url)).assertTrue();
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(schemeOf(config.url)).assertEqual('http');
      expect(hostOf(config.url)).assertEqual('gitee.com');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   uppercaseHttpsSchemeIsRejected
     * @tc.desc   The scheme guard compares lower case prefixes, so HTTPS in capitals is treated as unsafe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('uppercaseHttpsSchemeIsRejected', 0, () => {
      const config: DownloadConfig = sourceConfig('HTTPS://GITEE.COM/CHENHAIWEN2/MEDIA/ICON_MAIN_COLOR.PNG');
      logStep('uppercaseHttpsSchemeIsRejected', schemeOf(config.url));
      expect(schemeOf(config.url)).assertEqual('HTTPS');
      expect(hostOf(config.url)).assertEqual('GITEE.COM');
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(isHttpUrl(config.url)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('ICON_MAIN_COLOR.PNG');
    });

    /**
     * @tc.name   ftpSchemeIsRejectedByHttpsGuard
     * @tc.desc   An ftp source parses a host correctly but is still refused by the https prefix rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('ftpSchemeIsRejectedByHttpsGuard', 0, () => {
      const config: DownloadConfig = sourceConfig('ftp://gitee.com/chenhaiwen2/media/after_cache.png');
      logStep('ftpSchemeIsRejectedByHttpsGuard', schemeOf(config.url));
      expect(schemeOf(config.url)).assertEqual('ftp');
      expect(hostOf(config.url)).assertEqual('gitee.com');
      expect(extensionOf(config.url)).assertEqual('.png');
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(pathOf(config.url).indexOf('/media/')).assertLarger(0);
    });

    /**
     * @tc.name   fileSchemeIsRejectedByHttpsGuard
     * @tc.desc   A file:// path has no authority and is refused even though the trailing drawable name parses.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileSchemeIsRejectedByHttpsGuard', 0, () => {
      const config: DownloadConfig = sourceConfig('file:///data/storage/el2/base/cache/after_cache.png');
      logStep('fileSchemeIsRejectedByHttpsGuard', schemeOf(config.url));
      expect(schemeOf(config.url)).assertEqual('file');
      expect(hostOf(config.url)).assertEqual('');
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(extensionOf(config.url)).assertEqual('.png');
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   dataUrlIsRejectedAsSource
     * @tc.desc   An inline data URL has no scheme separator and therefore no host, and it fails validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dataUrlIsRejectedAsSource', 0, () => {
      const config: DownloadConfig = sourceConfig('data:image/png;base64,iVBORw0KGgoAAAANSUhEUg');
      logStep('dataUrlIsRejectedAsSource', String(config.url.length));
      expect(schemeOf(config.url)).assertEqual('');
      expect(hostOf(config.url)).assertEqual('');
      expect(config.url.indexOf('://')).assertLess(0);
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(pathOf(config.url)).assertEqual('/png;base64,iVBORw0KGgoAAAANSUhEUg');
    });

    /**
     * @tc.name   javascriptSchemeIsRejectedAsSource
     * @tc.desc   A javascript: pseudo URL is refused by the https rule and exposes no file extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('javascriptSchemeIsRejectedAsSource', 0, () => {
      const config: DownloadConfig = sourceConfig('javascript:alert(document.cookie)');
      logStep('javascriptSchemeIsRejectedAsSource', String(config.validate().length));
      expect(schemeOf(config.url)).assertEqual('');
      expect(extensionOf(config.url)).assertEqual('.cookie)');
      expect(hostOf(config.url)).assertEqual('');
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.url.indexOf('https')).assertLess(0);
    });

    /**
     * @tc.name   malformedAuthorityLeavesEmptyHost
     * @tc.desc   Three slashes leave an empty authority, yet the prefix-only gate still accepts the source.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('malformedAuthorityLeavesEmptyHost', 0, () => {
      const config: DownloadConfig = sourceConfig('https:///media/icon.png');
      logStep('malformedAuthorityLeavesEmptyHost', String(hostOf(config.url).length));
      expect(hostOf(config.url)).assertEqual('');
      expect(schemeOf(config.url)).assertEqual('https');
      expect(isHttpsUrl(config.url)).assertTrue();
      expect(config.fileName()).assertEqual('icon.png');
      expect(pathOf(config.url)).assertEqual('/media/icon.png');
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.url.startsWith('https:///')).assertTrue();
    });

    /**
     * @tc.name   doubleSchemeSeparatorKeepsFirstScheme
     * @tc.desc   With a doubled scheme marker the first separator wins, so the authority becomes "https:".
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('doubleSchemeSeparatorKeepsFirstScheme', 0, () => {
      const config: DownloadConfig = sourceConfig('https://https://gitee.com/media/icon.png');
      logStep('doubleSchemeSeparatorKeepsFirstScheme', hostOf(config.url));
      expect(schemeOf(config.url)).assertEqual('https');
      expect(hostOf(config.url)).assertEqual('https:');
      expect(hostOf(config.url).endsWith(':')).assertTrue();
      expect(config.fileName()).assertEqual('icon.png');
      expect(config.url.indexOf('://')).assertEqual(5);
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(pathOf(config.url).startsWith('//')).assertTrue();
    });

    /**
     * @tc.name   trailingSlashSourceFallsBackToDefaultFileName
     * @tc.desc   A directory-like source passes validation but the derived file name falls back to "file".
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingSlashSourceFallsBackToDefaultFileName', 0, () => {
      const config: DownloadConfig = sourceConfig(URL_TASK_C + '/');
      logStep('trailingSlashSourceFallsBackToDefaultFileName', config.fileName());
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('file');
      expect(fileNameOf(URL_TASK_C + '/', 'saved.png')).assertEqual('saved.png');
      expect(fileNameOf(URL_TASK_C + '/')).assertEqual('file');
      expect(extensionOf(URL_TASK_C + '/')).assertEqual('');
      expect(config.url.endsWith('/')).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.url.length).assertEqual(URL_TASK_C.length + 1);
    });

    /**
     * @tc.name   duplicateUrlDetectionFlagsRepeatedDrawable
     * @tc.desc   A source table that lists the same drawable twice is reported as containing duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateUrlDetectionFlagsRepeatedDrawable', 0, () => {
      const table: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_A];
      logStep('duplicateUrlDetectionFlagsRepeatedDrawable', String(table.length));
      expect(hasDuplicateStrings(table)).assertTrue();
      expect(countOf(table, URL_TASK_A)).assertEqual(2);
      expect(countOf(table, URL_TASK_B)).assertEqual(1);
      expect(uniqueStrings(table).length).assertEqual(2);
      expect(uniqueStrings(table)[0]).assertEqual(URL_TASK_A);
      expect(hasDuplicateStrings([URL_TASK_A, URL_TASK_B, URL_TASK_C])).assertFalse();
      expect(hasDuplicateStrings([])).assertFalse();
    });

    /**
     * @tc.name   duplicateDetectionIsCaseSensitive
     * @tc.desc   Two URLs that differ only in case are distinct strings for the duplicate detector.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateDetectionIsCaseSensitive', 0, () => {
      const upper: string = URL_TASK_A.toUpperCase();
      const table: string[] = [URL_TASK_A, upper];
      logStep('duplicateDetectionIsCaseSensitive', String(table.length));
      expect(table[0] === table[1]).assertFalse();
      expect(hasDuplicateStrings(table)).assertFalse();
      expect(countOf(table, URL_TASK_A)).assertEqual(1);
      expect(countOf(table, upper)).assertEqual(1);
      expect(uniqueStrings(table).length).assertEqual(2);
      expect(isHttpsUrl(upper)).assertFalse();
      expect(schemeOf(upper)).assertEqual('HTTPS');
    });

    /**
     * @tc.name   countOfCountsExactMatchesOnly
     * @tc.desc   countOf matches whole strings, so prefixes and an empty query do not inflate the count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('countOfCountsExactMatchesOnly', 0, () => {
      const table: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_A, ''];
      logStep('countOfCountsExactMatchesOnly', String(countOf(table, URL_TASK_A)));
      expect(countOf(table, URL_TASK_A)).assertEqual(2);
      expect(countOf(table, URL_TASK_B)).assertEqual(1);
      expect(countOf(table, URL_TASK_C)).assertEqual(0);
      expect(countOf(table, '')).assertEqual(1);
      expect(countOf(table, 'favor')).assertEqual(0);
      expect(countOf(table, URL_TASK_A + '?v=1')).assertEqual(0);
      expect(countOf([], URL_TASK_A)).assertEqual(0);
      expect(table.length).assertEqual(4);
    });

    /**
     * @tc.name   uniqueStringsKeepsFirstOccurrenceOrder
     * @tc.desc   De-duplication preserves the first appearance of each URL instead of sorting the result.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('uniqueStringsKeepsFirstOccurrenceOrder', 0, () => {
      const table: string[] = [URL_TASK_B, URL_TASK_A, URL_TASK_B, URL_TASK_C, URL_TASK_A];
      const unique: string[] = uniqueStrings(table);
      logStep('uniqueStringsKeepsFirstOccurrenceOrder', joined(unique, ','));
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual(URL_TASK_B);
      expect(unique[1]).assertEqual(URL_TASK_A);
      expect(unique[2]).assertEqual(URL_TASK_C);
      expect(unique[0].endsWith('after_cache.png')).assertTrue();
      expect(unique[2].endsWith('icon_main_color.png')).assertTrue();
      expect(sameStringArray(unique, [URL_TASK_B, URL_TASK_A, URL_TASK_C])).assertTrue();
      expect(hasDuplicateStrings(unique)).assertFalse();
    });

    /**
     * @tc.name   uniqueStringsReturnsIndependentArray
     * @tc.desc   Growing the de-duplicated result does not append to the input table it was built from.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uniqueStringsReturnsIndependentArray', 0, () => {
      const table: string[] = [URL_TASK_A, URL_TASK_B];
      const unique: string[] = uniqueStrings(table);
      unique.push(URL_TASK_C);
      logStep('uniqueStringsReturnsIndependentArray', String(unique.length));
      expect(unique.length).assertEqual(3);
      expect(table.length).assertEqual(2);
      expect(sameStringArray(table, [URL_TASK_A, URL_TASK_B])).assertTrue();
      expect(unique[2]).assertEqual(URL_TASK_C);
      expect(table.indexOf(URL_TASK_C)).assertLess(0);
      expect(unique === table).assertFalse();
      expect(countOf(unique, URL_TASK_A)).assertEqual(1);
    });

    /**
     * @tc.name   sortedCopyDoesNotMutateSource
     * @tc.desc   Sorting a copy of the source table leaves the page-order input untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sortedCopyDoesNotMutateSource', 0, () => {
      const table: string[] = [URL_TASK_C, URL_TASK_A, URL_TASK_B];
      const sorted: string[] = sortedCopy(table);
      logStep('sortedCopyDoesNotMutateSource', sorted[0].substring(0, 25));
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(URL_TASK_B);
      expect(sorted[1]).assertEqual(URL_TASK_C);
      expect(sorted[2]).assertEqual(URL_TASK_A);
      expect(table[0]).assertEqual(URL_TASK_C);
      expect(table[2]).assertEqual(URL_TASK_B);
      expect(sorted === table).assertFalse();
      expect(sameStringArray(table, sorted)).assertFalse();
    });

    /**
     * @tc.name   sortedCopyOfEmptyArrayIsEmpty
     * @tc.desc   Sorting and joining empty source tables is safe and yields no residual separators.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sortedCopyOfEmptyArrayIsEmpty', 0, () => {
      const empty: string[] = [];
      const sorted: string[] = sortedCopy(empty);
      logStep('sortedCopyOfEmptyArrayIsEmpty', String(sorted.length));
      expect(sorted.length).assertEqual(0);
      expect(joined(sorted, ',')).assertEqual('');
      expect(reversedCopy(empty).length).assertEqual(0);
      expect(uniqueStrings(empty).length).assertEqual(0);
      expect(hasDuplicateStrings(empty)).assertFalse();
      expect(sorted === empty).assertFalse();
      const single: string[] = sortedCopy([URL_TASK_A]);
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   reversedCopyTwiceRestoresOriginal
     * @tc.desc   Reversing a source list twice returns the original page order A, B, C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('reversedCopyTwiceRestoresOriginal', 0, () => {
      const once: string[] = reversedCopy(TASK_URLS);
      const twice: string[] = reversedCopy(once);
      logStep('reversedCopyTwiceRestoresOriginal', fileNameOf(twice[0]));
      expect(once[0]).assertEqual(URL_TASK_C);
      expect(twice[0]).assertEqual(URL_TASK_A);
      expect(twice[2]).assertEqual(URL_TASK_C);
      expect(sameStringArray(twice, TASK_URLS)).assertTrue();
      expect(sameStringArray(once, TASK_URLS)).assertFalse();
      expect(twice.length).assertEqual(3);
      expect(twice[1]).assertEqual(URL_TASK_B);
    });

    /**
     * @tc.name   reversedCopyDoesNotAliasSource
     * @tc.desc   Appending to the reversed list does not grow the pinned source table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reversedCopyDoesNotAliasSource', 0, () => {
      const mirror: string[] = reversedCopy(TASK_URLS);
      mirror.push(URL_TASK_A);
      logStep('reversedCopyDoesNotAliasSource', String(mirror.length));
      expect(mirror.length).assertEqual(4);
      expect(TASK_URLS.length).assertEqual(3);
      expect(TASK_URLS[0]).assertEqual(URL_TASK_A);
      expect(TASK_URLS[2]).assertEqual(URL_TASK_C);
      expect(mirror[3]).assertEqual(URL_TASK_A);
      expect(mirror === TASK_URLS).assertFalse();
      expect(mirror[0]).assertEqual(URL_TASK_C);
      expect(hasDuplicateStrings(mirror)).assertTrue();
    });

    /**
     * @tc.name   sameStringArrayRequiresSameLength
     * @tc.desc   A prefix of the source table is not equal to the full table even though every entry matches.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameStringArrayRequiresSameLength', 0, () => {
      const full: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      const prefix: string[] = [URL_TASK_A, URL_TASK_B];
      logStep('sameStringArrayRequiresSameLength', String(prefix.length));
      expect(sameStringArray(full, prefix)).assertFalse();
      expect(sameStringArray(prefix, full)).assertFalse();
      expect(full.length === prefix.length).assertFalse();
      expect(prefix[0]).assertEqual(full[0]);
      expect(prefix[1]).assertEqual(full[1]);
      expect(sameStringArray(prefix, [URL_TASK_A])).assertFalse();
      expect(sameStringArray([], [])).assertTrue();
      expect(sameStringArray(prefix, prefix)).assertTrue();
    });

    /**
     * @tc.name   sameStringArrayRequiresSameOrder
     * @tc.desc   The same three URLs in a different order are not considered equal sequences.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameStringArrayRequiresSameOrder', 0, () => {
      const forward: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      const swapped: string[] = [URL_TASK_B, URL_TASK_A, URL_TASK_C];
      logStep('sameStringArrayRequiresSameOrder', fileNameOf(swapped[0]));
      expect(sameStringArray(forward, swapped)).assertFalse();
      expect(sameStringArray(swapped, forward)).assertFalse();
      expect(sameStringArray(forward, reversedCopy(reversedCopy(forward)))).assertTrue();
      expect(sameStringArray(sortedCopy(forward), sortedCopy(swapped))).assertTrue();
      expect(forward[0]).assertEqual(URL_TASK_A);
      expect(swapped[0]).assertEqual(URL_TASK_B);
      expect(sameStringArray(forward, forward.slice())).assertTrue();
      expect(forward.length).assertEqual(swapped.length);
    });

    /**
     * @tc.name   sameStringArrayAcceptsIdenticalSequences
     * @tc.desc   Two independently built tables with the same URLs compare equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameStringArrayAcceptsIdenticalSequences', 0, () => {
      const left: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      const right: string[] = [];
      right.push(URL_TASK_A);
      right.push(URL_TASK_B);
      right.push(URL_TASK_C);
      logStep('sameStringArrayAcceptsIdenticalSequences', String(right.length));
      expect(left === right).assertFalse();
      expect(sameStringArray(left, right)).assertTrue();
      expect(sameStringArray(right, TASK_URLS)).assertTrue();
      expect(joined(left, '|')).assertEqual(joined(right, '|'));
      expect(sameStringArray(left, uniqueStrings(right))).assertTrue();
      expect(countOf(right, URL_TASK_B)).assertEqual(1);
      expect(right[2]).assertEqual(URL_TASK_C);
    });

    /**
     * @tc.name   duplicateSourceListFailsUniquenessGate
     * @tc.desc   Appending an existing drawable to the pinned table flips the duplicate gate and keeps three names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateSourceListFailsUniquenessGate', 0, () => {
      const table: string[] = TASK_URLS.slice();
      table.push(URL_TASK_B);
      logStep('duplicateSourceListFailsUniquenessGate', String(table.length));
      expect(table.length).assertEqual(4);
      expect(hasDuplicateStrings(TASK_URLS)).assertFalse();
      expect(hasDuplicateStrings(table)).assertTrue();
      expect(uniqueStrings(table).length).assertEqual(3);
      expect(countOf(table, URL_TASK_B)).assertEqual(2);
      expect(countOf(table, URL_TASK_A)).assertEqual(1);
      expect(countOf(table, URL_TASK_C)).assertEqual(1);
      expect(sameStringArray(uniqueStrings(table), TASK_URLS)).assertTrue();
    });

    /**
     * @tc.name   emptyUrlHasNoFileNameOrExtension
     * @tc.desc   The empty source exposes neither a file name nor an extension and carries no query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyUrlHasNoFileNameOrExtension', 0, () => {
      const emptyUrl: string = '';
      logStep('emptyUrlHasNoFileNameOrExtension', fileNameOf(emptyUrl));
      expect(fileNameOf(emptyUrl)).assertEqual('file');
      expect(fileNameOf(emptyUrl, 'missing.png')).assertEqual('missing.png');
      expect(extensionOf(emptyUrl)).assertEqual('');
      expect(queryOf(emptyUrl)).assertEqual('');
      expect(hasQuery(emptyUrl)).assertFalse();
      expect(redactQuery(emptyUrl)).assertEqual('');
      expect(redactCredentials(emptyUrl)).assertEqual('');
      expect(hostOf(emptyUrl)).assertEqual('');
    });

    /**
     * @tc.name   queryBearingSourceIsRedactedBeforeValidation
     * @tc.desc   A signed drawable URL keeps its https validity while redaction removes the token segment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryBearingSourceIsRedactedBeforeValidation', 0, () => {
      const signed: string = URL_TASK_A + '?token=abc123&expires=42';
      const config: DownloadConfig = sourceConfig(signed);
      logStep('queryBearingSourceIsRedactedBeforeValidation', redactQuery(signed).length.toString());
      expect(hasQuery(signed)).assertTrue();
      expect(queryOf(signed)).assertEqual('?token=abc123&expires=42');
      expect(isHttpsUrl(signed)).assertTrue();
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(redactQuery(signed)).assertEqual(URL_TASK_A);
      expect(redactQuery(signed).indexOf('abc123')).assertLess(0);
      expect(config.fileName()).assertEqual('favor_list_tea.png?token=abc123&expires=42');
    });

    /**
     * @tc.name   credentialedSourceMasksUserInfo
     * @tc.desc   A source carrying user info is masked at the authority while its drawable suffix survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('credentialedSourceMasksUserInfo', 0, () => {
      const guarded: string = 'https://robot:token@gitee.com/chenhaiwen2/media/after_cache.png';
      const masked: string = redactCredentials(guarded);
      logStep('credentialedSourceMasksUserInfo', masked);
      expect(masked).assertEqual('https://***@gitee.com/chenhaiwen2/media/after_cache.png');
      expect(masked.indexOf('token')).assertLess(0);
      expect(masked.indexOf('robot')).assertLess(0);
      expect(masked.endsWith('after_cache.png')).assertTrue();
      expect(schemeOf(masked)).assertEqual('https');
      expect(hostOf(guarded)).assertEqual('robot:token@gitee.com');
      expect(sourceConfig(guarded).isValid()).assertTrue();
      expect(redactCredentials(URL_TASK_B)).assertEqual(URL_TASK_B);
    });

    /**
     * @tc.name   nonHttpsSourcesShareTheSameErrorCode
     * @tc.desc   Six insecure or opaque sources are rejected with the single url-not-https code each.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('nonHttpsSourcesShareTheSameErrorCode', 0, () => {
      const rejected: string[] = [
        'http://gitee.com/media/after_cache.png',
        'ftp://gitee.com/media/after_cache.png',
        'file:///data/storage/el2/base/cache/after_cache.png',
        'data:image/png;base64,AAAA',
        'javascript:alert(1)',
        'HTTPS://GITEE.COM/MEDIA/AFTER_CACHE.PNG'
      ];
      let codeHits: number = 0;
      for (let index = 0; index < rejected.length; index++) {
        const errors: string[] = sourceConfig(rejected[index]).validate();
        if (errors.length === 1 && errors[0] === 'url-not-https') {
          codeHits = codeHits + 1;
        }
        expect(errors[0]).assertEqual('url-not-https');
        expect(errors.indexOf('url-empty')).assertLess(0);
      }
      logStep('nonHttpsSourcesShareTheSameErrorCode', String(codeHits));
      expect(codeHits).assertEqual(6);
      expect(rejected.length).assertEqual(6);
      expect(sourceConfig(rejected[0]).isValid()).assertFalse();
      expect(sourceConfig(rejected[5]).isValid()).assertFalse();
    });

    /**
     * @tc.name   httpsSourceMatrixPassesValidation
     * @tc.desc   All lower case https sources, including a malformed authority, satisfy the prefix gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('httpsSourceMatrixPassesValidation', 0, () => {
      const accepted: string[] = [
        URL_TASK_A,
        URL_TASK_B,
        URL_TASK_C,
        'https:///media/icon.png',
        'https://gitee.com/media/icon.png?rev=2'
      ];
      let validCount: number = 0;
      for (let index = 0; index < accepted.length; index++) {
        const config: DownloadConfig = sourceConfig(accepted[index]);
        if (config.isValid()) {
          validCount = validCount + 1;
        }
        expect(config.validate().length).assertEqual(0);
        expect(isHttpsUrl(accepted[index])).assertTrue();
      }
      logStep('httpsSourceMatrixPassesValidation', String(validCount));
      expect(validCount).assertEqual(5);
      expect(hasDuplicateStrings(accepted)).assertFalse();
      expect(accepted.length).assertEqual(5);
      expect(sourceConfig(accepted[3]).url.startsWith('https:///')).assertTrue();
    });

    /**
     * @tc.name   mixedSourceMatrixKeepsOnlyHttpsAccepted
     * @tc.desc   A mixed offline matrix accepts exactly the two https entries and rejects the other four.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mixedSourceMatrixKeepsOnlyHttpsAccepted', 0, () => {
      const matrix: string[] = [
        URL_TASK_C,
        '',
        'http://gitee.com/media/icon_main_color.png',
        'ftp://gitee.com/media/icon_main_color.png',
        ' ' + URL_TASK_C,
        URL_TASK_C + ' '
      ];
      let accepted: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < matrix.length; index++) {
        const config: DownloadConfig = sourceConfig(matrix[index]);
        if (config.isValid()) {
          accepted = accepted + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      logStep('mixedSourceMatrixKeepsOnlyHttpsAccepted', String(accepted) + '/' + String(rejected));
      expect(accepted).assertEqual(2);
      expect(rejected).assertEqual(4);
      expect(sourceConfig(matrix[0]).isValid()).assertTrue();
      expect(sourceConfig(matrix[1]).validate().length).assertEqual(2);
      expect(sourceConfig(matrix[4]).isValid()).assertFalse();
      expect(sourceConfig(matrix[5]).isValid()).assertTrue();
      expect(matrix.length).assertEqual(6);
    });

    /**
     * @tc.name   pathOfDirectorySourceKeepsTrailingSlash
     * @tc.desc   A directory-like source keeps its trailing separator in pathOf without gaining a query part.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pathOfDirectorySourceKeepsTrailingSlash', 0, () => {
      const directory: string = URL_TASK_B + '/';
      logStep('pathOfDirectorySourceKeepsTrailingSlash', String(pathOf(directory).length));
      expect(pathOf(directory)).assertEqual(pathOf(URL_TASK_B) + '/');
      expect(pathOf(directory).endsWith('/')).assertTrue();
      expect(pathOf(directory).indexOf('?')).assertLess(0);
      expect(hostOf(directory)).assertEqual(hostOf(URL_TASK_B));
      expect(fileNameOf(directory)).assertEqual('file');
      expect(extensionOf(directory)).assertEqual('');
      expect(queryOf(directory)).assertEqual('');
      expect(sourceConfig(directory).isValid()).assertTrue();
    });

    /**
     * @tc.name   querySourceSplitsAtFirstQuestionMark
     * @tc.desc   Only the first question mark starts the query, so later markers stay inside the query text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('querySourceSplitsAtFirstQuestionMark', 0, () => {
      const tricky: string = 'https://gitee.com/media/icon.png?rev=1?size=2';
      const config: DownloadConfig = sourceConfig(tricky);
      logStep('querySourceSplitsAtFirstQuestionMark', queryOf(tricky));
      expect(queryOf(tricky)).assertEqual('?rev=1?size=2');
      expect(redactQuery(tricky)).assertEqual('https://gitee.com/media/icon.png');
      expect(pathOf(tricky)).assertEqual('/media/icon.png');
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('icon.png?rev=1?size=2');
      expect(tricky.indexOf('?')).assertEqual(32);
      expect(hasQuery(tricky)).assertTrue();
      expect(redactQuery(tricky).indexOf('rev')).assertLess(0);
    });

    /**
     * @tc.name   sourceValidationErrorOrderMatchesRuleOrder
     * @tc.desc   A source that is both insecure and badly configured reports the URL rule first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sourceValidationErrorOrderMatchesRuleOrder', 0, () => {
      const config: DownloadConfig =
        new DownloadConfig('DOWNLOAD', 'http://gitee.com/media/icon.png', true, 'PATCH', ':/');
      const errors: string[] = config.validate();
      logStep('sourceValidationErrorOrderMatchesRuleOrder', joined(errors, ','));
      expect(errors.length).assertEqual(3);
      expect(errors[0]).assertEqual('url-not-https');
      expect(errors[1]).assertEqual('method-unsupported');
      expect(errors[2]).assertEqual('saveas-not-cache');
      expect(joined(errors, '>')).assertEqual('url-not-https>method-unsupported>saveas-not-cache');
      expect(config.isValid()).assertFalse();
      expect(errors.indexOf('url-empty')).assertLess(0);
      expect(errors.indexOf('action-not-download')).assertLess(0);
    });

    /**
     * @tc.name   uppercaseHostIsAcceptedByPrefixGate
     * @tc.desc   The scheme prefix is lower case here, so an upper case host still passes the https gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercaseHostIsAcceptedByPrefixGate', 0, () => {
      const mixed: string = 'https://GITEE.COM/MEDIA/ICON_MAIN_COLOR.PNG';
      const config: DownloadConfig = sourceConfig(mixed);
      logStep('uppercaseHostIsAcceptedByPrefixGate', hostOf(mixed));
      expect(schemeOf(mixed)).assertEqual('https');
      expect(hostOf(mixed)).assertEqual('GITEE.COM');
      expect(isHttpsUrl(mixed)).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('ICON_MAIN_COLOR.PNG');
      expect(extensionOf(mixed)).assertEqual('.PNG');
      expect(extensionOf(mixed) === '.png').assertFalse();
    });

    /**
     * @tc.name   redactionIsIdentityForCleanSources
     * @tc.desc   The pinned drawables carry neither a query nor user info, so both redactors return them unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('redactionIsIdentityForCleanSources', 0, () => {
      let identical: number = 0;
      for (let index = 0; index < TASK_URLS.length; index++) {
        const url: string = TASK_URLS[index];
        expect(redactQuery(url)).assertEqual(url);
        expect(redactCredentials(url)).assertEqual(url);
        expect(hasQuery(url)).assertFalse();
        if (redactQuery(url) === url && redactCredentials(url) === url) {
          identical = identical + 1;
        }
      }
      logStep('redactionIsIdentityForCleanSources', String(identical));
      expect(identical).assertEqual(3);
      expect(redactQuery(URL_TASK_A).length).assertEqual(URL_TASK_A.length);
      expect(redactCredentials(URL_TASK_C)).assertEqual(LITERAL_C);
      expect(TASK_URLS.length).assertEqual(3);
    });

    /**
     * @tc.name   leadingSpaceSourceFailsPrefixGate
     * @tc.desc   A single leading space breaks the https prefix and turns the extracted scheme into " https".
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('leadingSpaceSourceFailsPrefixGate', 0, () => {
      const padded: string = ' ' + URL_TASK_A;
      const config: DownloadConfig = sourceConfig(padded);
      logStep('leadingSpaceSourceFailsPrefixGate', schemeOf(padded));
      expect(padded.startsWith('https://')).assertFalse();
      expect(isHttpsUrl(padded)).assertFalse();
      expect(schemeOf(padded)).assertEqual(' https');
      expect(hostOf(padded)).assertEqual('gitee.com');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('favor_list_tea.png');
    });

    /**
     * @tc.name   trailingSpaceSourceSurvivesGateButPollutesFileName
     * @tc.desc   A trailing space keeps the https prefix valid yet leaks into the derived file name and extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingSpaceSourceSurvivesGateButPollutesFileName', 0, () => {
      const padded: string = URL_TASK_C + ' ';
      const config: DownloadConfig = sourceConfig(padded);
      logStep('trailingSpaceSourceSurvivesGateButPollutesFileName', extensionOf(padded));
      expect(isHttpsUrl(padded)).assertTrue();
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('icon_main_color.png ');
      expect(extensionOf(padded)).assertEqual('.png ');
      expect(extensionOf(padded) === '.png').assertFalse();
      expect(padded.endsWith(' ')).assertTrue();
      expect(padded.length).assertEqual(URL_TASK_C.length + 1);
      expect(config.url.indexOf(' ')).assertEqual(padded.length - 1);
    });
  });
}
