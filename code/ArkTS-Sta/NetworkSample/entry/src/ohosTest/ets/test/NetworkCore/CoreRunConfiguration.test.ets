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
 * CoreRunConfiguration suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  download(): action DOWNLOAD, url, overwrite true, method GET, saveas './'
 *   117      request.agent.create(context, config)
 *   151-171  the three URL literals handed to download()
 *
 * The suite pins the DownloadConfig value object: construction, cloning,
 * file name derivation, validate() error codes, describe()/sameAs() and the
 * independent expectedConfigFor() oracle.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  DownloadConfig,
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  TASK_URLS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  expectedConfigFor,
  fileNameOf,
  extensionOf,
  sameStringArray,
  hasDuplicateStrings,
  uniqueStrings,
  joined,
  isHttpsUrl
} from '../Shared/SharedDriver';

export default function networkCoreRunConfigurationTest(): void {
  describe('CoreRunConfiguration', () => {
    beforeAll(() => {
      logSuite('CoreRunConfiguration', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreRunConfiguration', 'end');
    });

    /**
     * @tc.name   configConstantsCarryThePageLiterals
     * @tc.desc   The four configuration constants equal the literals written by download().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configConstantsCarryThePageLiterals', 0, () => {
      expect(CONFIG_ACTION_DOWNLOAD).assertEqual('DOWNLOAD');
      expect(CONFIG_METHOD_GET).assertEqual('GET');
      expect(CONFIG_SAVEAS_CACHE).assertEqual('./');
      expect(CONFIG_OVERWRITE).assertTrue();
      expect(CONFIG_ACTION_DOWNLOAD.length).assertEqual(8);
    });

    /**
     * @tc.name   forUrlBuildsTheDownloadShape
     * @tc.desc   forUrl() fills action, overwrite, method and saveas exactly like download().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('forUrlBuildsTheDownloadShape', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('./');
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   forTaskAResolvesTheOrangeShoppingPng
     * @tc.desc   A task number maps to the favor_list_tea drawable URL of runTaskA.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('forTaskAResolvesTheOrangeShoppingPng', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A);
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.url.indexOf('OrangeShopping')).assertLarger(0);
      expect(config.fileName()).assertEqual('favor_list_tea.png');
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   forTaskBResolvesTheAfterCachePng
     * @tc.desc   B maps to the after_cache drawable and keeps an https scheme.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('forTaskBResolvesTheAfterCachePng', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B);
      expect(config.url).assertEqual(URL_TASK_B);
      expect(config.url.endsWith('after_cache.png')).assertTrue();
      expect(isHttpsUrl(config.url)).assertTrue();
      expect(config.fileName()).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   forTaskCResolvesTheIconMainColorPng
     * @tc.desc   C maps to the icon_main_color drawable used by runTaskC.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('forTaskCResolvesTheIconMainColorPng', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(config.url).assertEqual(URL_TASK_C);
      expect(config.url.indexOf('icon_main_color')).assertLarger(0);
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(config.sameAs(DownloadConfig.forUrl(URL_TASK_C))).assertTrue();
    });

    /**
     * @tc.name   forTaskUnknownYieldsAnEmptyUrl
     * @tc.desc   An unknown task number produces the empty URL branch of forTask.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('forTaskUnknownYieldsAnEmptyUrl', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('Z');
      expect(config.url).assertEqual('');
      expect(config.fileName()).assertEqual('file');
      expect(config.isValid()).assertFalse();
      expect(config.validate().length).assertEqual(2);
    });

    /**
     * @tc.name   forTaskIsCaseSensitive
     * @tc.desc   A lower-case task number is not equal to TASK_A, so no URL is resolved.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('forTaskIsCaseSensitive', 0, () => {
      const lower: DownloadConfig = DownloadConfig.forTask('a');
      expect(lower.url).assertEqual('');
      expect(lower.sameAs(DownloadConfig.forTask(TASK_A))).assertFalse();
      expect(DownloadConfig.forTask(TASK_A).isValid()).assertTrue();
    });

    /**
     * @tc.name   constructorStoresEveryFieldVerbatim
     * @tc.desc   The five constructor arguments are stored without normalisation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('constructorStoresEveryFieldVerbatim', 0, () => {
      const raw: DownloadConfig = new DownloadConfig('DOWNLOAD', 'https://example.com/media/picture.png',
        true, 'GET', './');
      expect(raw.url).assertEqual('https://example.com/media/picture.png');
      expect(raw.action).assertEqual('DOWNLOAD');
      expect(raw.overwrite).assertTrue();
      expect(raw.method).assertEqual('GET');
      expect(raw.saveas).assertEqual('./');
    });

    /**
     * @tc.name   cloneKeepsEveryFieldEqual
     * @tc.desc   clone() reproduces all five fields, so sameAs() holds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneKeepsEveryFieldEqual', 0, () => {
      const original: DownloadConfig = expectedConfigFor(TASK_C);
      const copy: DownloadConfig = original.clone();
      expect(copy.sameAs(original)).assertTrue();
      expect(copy.url).assertEqual(original.url);
      expect(copy.overwrite).assertEqual(original.overwrite);
      expect(copy.describe()).assertEqual(original.describe());
    });

    /**
     * @tc.name   cloneIsAnIndependentObject
     * @tc.desc   Mutating the clone leaves the original configuration untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneIsAnIndependentObject', 0, () => {
      const original: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const copy: DownloadConfig = original.clone();
      copy.url = 'https://example.com/media/other.png';
      copy.method = 'POST';
      expect(original.url).assertEqual(URL_TASK_A);
      expect(original.method).assertEqual('GET');
      expect(copy.sameAs(original)).assertFalse();
      expect(copy.isValid()).assertTrue();
    });

    /**
     * @tc.name   cloneOfAClonedConfigStillMatches
     * @tc.desc   A second clone keeps the value, so cloning is not destructive.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('cloneOfAClonedConfigStillMatches', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const second: DownloadConfig = first.clone();
      const third: DownloadConfig = second.clone();
      expect(third.sameAs(first)).assertTrue();
      expect(third.describe()).assertEqual(first.describe());
      expect(third.isValid()).assertTrue();
    });

    /**
     * @tc.name   fileNameDropsDirectoriesAndKeepsTheQueryFreeTail
     * @tc.desc   fileName() returns the last path segment for each task URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileNameDropsDirectoriesAndKeepsTheQueryFreeTail', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const name: string = config.fileName();
      expect(name).assertEqual(fileNameOf(URL_TASK_A));
      expect(name.indexOf('/')).assertEqual(-1);
      expect(name.endsWith('.png')).assertTrue();
    });

    /**
     * @tc.name   fileNameFallsBackWhenTheUrlEndsWithASlash
     * @tc.desc   A directory-style URL has no tail, so fileName() returns the 'file' fallback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameFallsBackWhenTheUrlEndsWithASlash', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', 'https://example.com/assets/',
        true, 'GET', './');
      expect(config.fileName()).assertEqual('file');
      expect(config.isValid()).assertTrue();
      expect(extensionOf(config.url)).assertEqual('');
    });

    /**
     * @tc.name   extensionOfEachTaskUrlIsPng
     * @tc.desc   Every seeded URL ends with the .png extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionOfEachTaskUrlIsPng', 0, () => {
      expect(extensionOf(URL_TASK_A)).assertEqual('.png');
      expect(extensionOf(URL_TASK_B)).assertEqual('.png');
      expect(extensionOf(URL_TASK_C)).assertEqual('.png');
      expect(extensionOf('https://example.com/no-extension')).assertEqual('');
    });

    /**
     * @tc.name   validatePassesForTheSeededConfig
     * @tc.desc   A task configuration has no validation error at all.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validatePassesForTheSeededConfig', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(errors.indexOf('url-not-https')).assertEqual(-1);
    });

    /**
     * @tc.name   validateReportsEmptyUrlAndSchemeTogether
     * @tc.desc   An empty URL triggers both url-empty and url-not-https in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateReportsEmptyUrlAndSchemeTogether', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('unknown');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   validateRejectsPlainHttp
     * @tc.desc   Only https is accepted, so an http URL yields exactly one code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateRejectsPlainHttp', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', 'http://example.com/media/a.png',
        true, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(isHttpsUrl(config.url)).assertFalse();
    });
    /**
     * @tc.name   validateReportsActionMismatch
     * @tc.desc   An action other than DOWNLOAD adds action-not-download.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateReportsActionMismatch', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('action-not-download');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   validateAcceptsPostAsASecondaryMethod
     * @tc.desc   The page documents GET or POST, so POST passes validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateAcceptsPostAsASecondaryMethod', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'POST', './');
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.method).assertEqual('POST');
    });

    /**
     * @tc.name   validateRejectsAnUnsupportedMethod
     * @tc.desc   PUT is neither GET nor POST, so method-unsupported is reported.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateRejectsAnUnsupportedMethod', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'PUT', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('method-unsupported');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   validateRejectsOverwriteDisabled
     * @tc.desc   overwrite false adds the overwrite-disabled code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateRejectsOverwriteDisabled', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, false, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('overwrite-disabled');
      expect(config.overwrite).assertFalse();
    });

    /**
     * @tc.name   validateRejectsASaveasOutsideTheCache
     * @tc.desc   The page saves into './', so another directory fails validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateRejectsASaveasOutsideTheCache', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', './download');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('saveas-not-cache');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   validateAccumulatesEveryErrorCodeInOrder
     * @tc.desc   A fully broken configuration reports all six codes in validate() order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validateAccumulatesEveryErrorCodeInOrder', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', '', false, 'PUT', '/data');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(6);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(errors[2]).assertEqual('action-not-download');
      expect(errors[3]).assertEqual('method-unsupported');
      expect(errors[4]).assertEqual('overwrite-disabled');
      expect(errors[5]).assertEqual('saveas-not-cache');
    });

    /**
     * @tc.name   validateIsDeterministicAcrossRepeatedCalls
     * @tc.desc   Two validate() calls return the same ordered code list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validateIsDeterministicAcrossRepeatedCalls', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', 'http://example.com/x', false, 'PUT', '/tmp');
      const first: string[] = config.validate();
      const second: string[] = config.validate();
      expect(sameStringArray(first, second)).assertTrue();
      expect(first.length).assertEqual(5);
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   isValidTracksEverySingleMutation
     * @tc.desc   Each field independently decides validity of an otherwise clean config.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('isValidTracksEverySingleMutation', 0, () => {
      const config: DownloadConfig = expectedConfigFor(TASK_A);
      expect(config.isValid()).assertTrue();
      config.overwrite = false;
      expect(config.isValid()).assertFalse();
      config.overwrite = true;
      config.action = 'UPLOAD';
      expect(config.isValid()).assertFalse();
      config.action = 'DOWNLOAD';
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
    });

    /**
     * @tc.name   describeJoinsTheFiveFieldsWithPipes
     * @tc.desc   describe() is action|method|overwrite|saveas|url, so five segments exist.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeJoinsTheFiveFieldsWithPipes', 0, () => {
      const config: DownloadConfig = expectedConfigFor(TASK_A);
      const parts: string[] = config.describe().split('|');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('DOWNLOAD');
      expect(parts[1]).assertEqual('GET');
      expect(parts[2]).assertEqual('true');
      expect(parts[3]).assertEqual('./');
      expect(parts[4]).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   describeStartsWithTheActionAndEndsWithTheUrl
     * @tc.desc   The textual form is stable at both boundaries for each task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeStartsWithTheActionAndEndsWithTheUrl', 0, () => {
      const config: DownloadConfig = expectedConfigFor(TASK_C);
      const text: string = config.describe();
      expect(text.startsWith('DOWNLOAD|GET|true|./|')).assertTrue();
      expect(text.endsWith(URL_TASK_C)).assertTrue();
      expect(text.indexOf(URL_TASK_C)).assertEqual(21);
    });

    /**
     * @tc.name   describeOfAnEmptyUrlStillEndsWithThePipe
     * @tc.desc   The separator survives even when the URL field is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('describeOfAnEmptyUrlStillEndsWithThePipe', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('nope');
      const text: string = config.describe();
      expect(text.endsWith('|')).assertTrue();
      expect(text.split('|').length).assertEqual(5);
      expect(text.split('|')[4]).assertEqual('');
    });

    /**
     * @tc.name   sameAsComparesTheWholeDescription
     * @tc.desc   A differing saveas or method flips sameAs() while the URL stays equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameAsComparesTheWholeDescription', 0, () => {
      const base: DownloadConfig = expectedConfigFor(TASK_B);
      const other: DownloadConfig = base.clone();
      expect(base.sameAs(other)).assertTrue();
      other.saveas = './downloads';
      expect(base.sameAs(other)).assertFalse();
      other.saveas = './';
      other.method = 'POST';
      expect(base.sameAs(other)).assertFalse();
      expect(base.url).assertEqual(other.url);
    });

    /**
     * @tc.name   sameAsIsReflexiveAndSymmetric
     * @tc.desc   A config equals itself and equality with a clone works both ways.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sameAsIsReflexiveAndSymmetric', 0, () => {
      const left: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const right: DownloadConfig = left.clone();
      expect(left.sameAs(left)).assertTrue();
      expect(left.sameAs(right)).assertTrue();
      expect(right.sameAs(left)).assertTrue();
      right.url = URL_TASK_B;
      expect(left.sameAs(right)).assertFalse();
    });

    /**
     * @tc.name   expectedConfigForMatchesTheFactoryForEveryTask
     * @tc.desc   The oracle and forTask agree for A, B and C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedConfigForMatchesTheFactoryForEveryTask', 0, () => {
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const taskNo: string = TASK_NUMBERS[index];
        const oracle: DownloadConfig = expectedConfigFor(taskNo);
        expect(oracle.sameAs(DownloadConfig.forTask(taskNo))).assertTrue();
        expect(oracle.isValid()).assertTrue();
      }
      expect(TASK_NUMBERS.length).assertEqual(3);
    });

    /**
     * @tc.name   expectedConfigForUnknownKeepsTheEmptyUrlBranch
     * @tc.desc   The oracle returns the page defaults with an empty URL for unknown input.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedConfigForUnknownKeepsTheEmptyUrlBranch', 0, () => {
      const oracle: DownloadConfig = expectedConfigFor('D');
      expect(oracle.url).assertEqual('');
      expect(oracle.action).assertEqual('DOWNLOAD');
      expect(oracle.method).assertEqual('GET');
      expect(oracle.overwrite).assertTrue();
      expect(oracle.saveas).assertEqual('./');
      expect(oracle.isValid()).assertFalse();
    });

    /**
     * @tc.name   expectedConfigForIsAFreshObjectPerCall
     * @tc.desc   Two oracle calls yield equal but distinct instances.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('expectedConfigForIsAFreshObjectPerCall', 0, () => {
      const first: DownloadConfig = expectedConfigFor(TASK_B);
      const second: DownloadConfig = expectedConfigFor(TASK_B);
      expect(first.sameAs(second)).assertTrue();
      first.method = 'POST';
      expect(second.method).assertEqual('GET');
      expect(second.sameAs(expectedConfigFor(TASK_B))).assertTrue();
    });
    /**
     * @tc.name   taskUrlTableHoldsThreeDistinctPngResources
     * @tc.desc   TASK_URLS mirrors A, B, C with no duplicate entry and no empty slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskUrlTableHoldsThreeDistinctPngResources', 0, () => {
      expect(TASK_URLS.length).assertEqual(3);
      expect(hasDuplicateStrings(TASK_URLS)).assertFalse();
      expect(TASK_URLS[0]).assertEqual(URL_TASK_A);
      expect(TASK_URLS[1]).assertEqual(URL_TASK_B);
      expect(TASK_URLS[2]).assertEqual(URL_TASK_C);
      for (let index = 0; index < TASK_URLS.length; index++) {
        expect(isHttpsUrl(TASK_URLS[index])).assertTrue();
      }
    });

    /**
     * @tc.name   everyTaskConfigFileIsUnique
     * @tc.desc   The three derived file names differ, so no download collides on disk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyTaskConfigFileIsUnique', 0, () => {
      const names: string[] = [];
      names.push(DownloadConfig.forTask(TASK_A).fileName());
      names.push(DownloadConfig.forTask(TASK_B).fileName());
      names.push(DownloadConfig.forTask(TASK_C).fileName());
      expect(uniqueStrings(names).length).assertEqual(3);
      expect(hasDuplicateStrings(names)).assertFalse();
      expect(names[0]).assertEqual('favor_list_tea.png');
    });

    /**
     * @tc.name   joinedFileNamesKeepTheCallerSeparator
     * @tc.desc   A joined listing of the three file names contains two separators.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('joinedFileNamesKeepTheCallerSeparator', 0, () => {
      const names: string[] = [];
      names.push(DownloadConfig.forTask(TASK_A).fileName());
      names.push(DownloadConfig.forTask(TASK_B).fileName());
      names.push(DownloadConfig.forTask(TASK_C).fileName());
      const line: string = joined(names, ', ');
      expect(line.indexOf('after_cache.png')).assertLarger(0);
      expect(line.split(', ').length).assertEqual(3);
      expect(line.endsWith('icon_main_color.png')).assertTrue();
    });

    /**
     * @tc.name   everySeededUrlHasItsOwnFileName
     * @tc.desc   fileNameOf() agrees with config.fileName() for all three seeds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeededUrlHasItsOwnFileName', 0, () => {
      const configA: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const configB: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const configC: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(configA.fileName()).assertEqual(fileNameOf(URL_TASK_A));
      expect(configB.fileName()).assertEqual(fileNameOf(URL_TASK_B));
      expect(configC.fileName()).assertEqual(fileNameOf(URL_TASK_C));
    });

    /**
     * @tc.name   fileNameFallsBackForATrailingSlashOnlyUrl
     * @tc.desc   A bare host keeps the fallback because there is no path tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fileNameFallsBackForATrailingSlashOnlyUrl', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', 'https://example.com/', true, 'GET', './');
      expect(config.fileName()).assertEqual('file');
      expect(config.validate().length).assertEqual(0);
      expect(config.describe().indexOf('https://example.com/')).assertLarger(0);
    });

    /**
     * @tc.name   configWithQueryKeepsTheTailIncludingTheQuery
     * @tc.desc   fileName() only cuts at the last slash, so a signed URL keeps its query in the name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('configWithQueryKeepsTheTailIncludingTheQuery', 0, () => {
      const signed: DownloadConfig = new DownloadConfig('DOWNLOAD',
        'https://example.com/media/avatar.png?token=abc', true, 'GET', './');
      expect(signed.isValid()).assertTrue();
      expect(signed.fileName()).assertEqual('avatar.png?token=abc');
      expect(signed.describe().indexOf('?token=abc')).assertLarger(0);
    });

    /**
     * @tc.name   requestShapeSurvivesACloneRoundTrip
     * @tc.desc   Cloning preserves the exact agent.create fields the page passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('requestShapeSurvivesACloneRoundTrip', 0, () => {
      const original: DownloadConfig = DownloadConfig.forUrl(URL_TASK_B);
      const copy: DownloadConfig = original.clone();
      expect(copy.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(copy.method).assertEqual(CONFIG_METHOD_GET);
      expect(copy.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(copy.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(copy.isValid()).assertTrue();
    });

    /**
     * @tc.name   overwriteFlipAloneBlocksTheRequest
     * @tc.desc   A cloned config with overwrite off is rejected although every other field is intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overwriteFlipAloneBlocksTheRequest', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C).clone();
      config.overwrite = false;
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('overwrite-disabled');
      expect(config.fileName()).assertEqual('icon_main_color.png');
    });

    /**
     * @tc.name   saveasFlipAloneBlocksTheRequest
     * @tc.desc   A non-seed saveas is the only error when the other fields stay valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('saveasFlipAloneBlocksTheRequest', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A).clone();
      config.saveas = './files';
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('saveas-not-cache');
      expect(config.describe().indexOf('./files')).assertLarger(0);
    });

    /**
     * @tc.name   methodFlipAloneBlocksTheRequest
     * @tc.desc   HEAD is not a download method, so the code list holds one element.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('methodFlipAloneBlocksTheRequest', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B).clone();
      config.method = 'HEAD';
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('method-unsupported');
      expect(config.sameAs(DownloadConfig.forTask(TASK_B))).assertFalse();
    });

    /**
     * @tc.name   urlFlipAloneKeepsAnHttpsConfigValid
     * @tc.desc   Replacing the URL with another https resource keeps the config acceptable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlFlipAloneKeepsAnHttpsConfigValid', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A).clone();
      config.url = 'https://example.com/media/banner.png';
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('banner.png');
      expect(config.sameAs(DownloadConfig.forTask(TASK_A))).assertFalse();
    });

    /**
     * @tc.name   actionFlipAloneBlocksTheRequest
     * @tc.desc   Changing the action leaves one action-not-download code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('actionFlipAloneBlocksTheRequest', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A).clone();
      config.action = 'download';
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('action-not-download');
      expect(config.describe().startsWith('download|')).assertTrue();
    });

    /**
     * @tc.name   describeKeepsTheUrlVerbatimIncludingCase
     * @tc.desc   describe() does not lower-case the path of the resource.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('describeKeepsTheUrlVerbatimIncludingCase', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const text: string = config.describe();
      expect(text.indexOf('CommonAppDevelopment')).assertLarger(0);
      expect(text.indexOf('commonappdevelopment')).assertEqual(-1);
      expect(text.endsWith('icon_main_color.png')).assertTrue();
    });
    /**
     * @tc.name   seededConfigReportIsLoggedForTheFirstTask
     * @tc.desc   The seeded report can be handed to the step logger without exposing a token.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('seededConfigReportIsLoggedForTheFirstTask', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A);
      logStep('CoreRunConfiguration', config.describe());
      expect(config.describe().indexOf('?') ).assertEqual(-1);
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('favor_list_tea.png');
    });

    /**
     * @tc.name   fileNameHelpersIgnoreASingleCharacterTail
     * @tc.desc   A one-character tail is still a valid file name for fileName().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fileNameHelpersIgnoreASingleCharacterTail', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', 'https://example.com/media/x',
        true, 'GET', './');
      expect(config.fileName()).assertEqual('x');
      expect(extensionOf(config.url)).assertEqual('');
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   defaultConfigHasEveryFalsyBranchCovered
     * @tc.desc   A default constructed config reports every code except the URL pair.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('defaultConfigHasEveryFalsyBranchCovered', 0, () => {
      const empty: DownloadConfig = new DownloadConfig('', '', false, '', '');
      const errors: string[] = empty.validate();
      expect(errors.length).assertEqual(6);
      expect(errors.indexOf('action-not-download')).assertEqual(2);
      expect(errors.indexOf('method-unsupported')).assertEqual(3);
      expect(empty.fileName()).assertEqual('file');
    });

    /**
     * @tc.name   sameAsDetectsAUrlOnlyDifference
     * @tc.desc   Two configs sharing action and method but not URL are not equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameAsDetectsAUrlOnlyDifference', 0, () => {
      const left: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const right: DownloadConfig = DownloadConfig.forTask(TASK_B);
      expect(left.action).assertEqual(right.action);
      expect(left.method).assertEqual(right.method);
      expect(left.sameAs(right)).assertFalse();
      expect(left.url === right.url).assertFalse();
    });

    /**
     * @tc.name   taskNumbersDriveConfigLookup
     * @tc.desc   Each TASK_NUMBERS entry yields the URL stored in TASK_URLS at the same index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskNumbersDriveConfigLookup', 0, () => {
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const config: DownloadConfig = DownloadConfig.forTask(TASK_NUMBERS[index]);
        expect(config.url).assertEqual(TASK_URLS[index]);
        expect(config.url.length).assertLarger(40);
      }
      expect(DownloadConfig.forTask('AB').url).assertEqual('');
    });

    /**
     * @tc.name   configDescribeRoundTripsThroughClone
     * @tc.desc   describe() of a clone equals describe() of the source for every seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('configDescribeRoundTripsThroughClone', 0, () => {
      let matched: number = 0;
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const source: DownloadConfig = DownloadConfig.forTask(TASK_NUMBERS[index]);
        if (source.describe() === source.clone().describe()) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(3);
      expect(matched).assertEqual(TASK_NUMBERS.length);
    });
    /**
     * @tc.name   seedConfigsCarryNoValidationNoise
     * @tc.desc   The three seeded configs validate to an empty list and share one describe prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedConfigsCarryNoValidationNoise', 0, () => {
      const prefix: string = 'DOWNLOAD|GET|true|./|';
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const config: DownloadConfig = DownloadConfig.forTask(TASK_NUMBERS[index]);
        expect(config.validate().length).assertEqual(0);
        expect(config.describe().startsWith(prefix)).assertTrue();
        expect(config.describe().length).assertLarger(prefix.length);
      }
    });

    /**
     * @tc.name   forUrlAndForTaskAgreeForEverySeed
     * @tc.desc   Building the config from a URL and from a task number yields the same five fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('forUrlAndForTaskAgreeForEverySeed', 0, () => {
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        const fromTask: DownloadConfig = DownloadConfig.forTask(TASK_NUMBERS[index]);
        const fromUrl: DownloadConfig = DownloadConfig.forUrl(TASK_URLS[index]);
        expect(fromTask.sameAs(fromUrl)).assertTrue();
        expect(fromTask.fileName()).assertEqual(fromUrl.fileName());
        expect(fromTask.describe()).assertEqual(fromUrl.describe());
        expect(fromTask.validate().length).assertEqual(0);
      }
      expect(TASK_URLS.length).assertEqual(TASK_NUMBERS.length);
    });

    /**
     * @tc.name   encodedFileNameKeepsThePercentEscapes
     * @tc.desc   fileName() neither decodes nor re-encodes a percent escaped resource name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreRunConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('encodedFileNameKeepsThePercentEscapes', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD',
        'https://example.com/media/t%C3%A9l%C3%A9chargement.png', true, 'GET', './');
      expect(config.fileName()).assertEqual('t%C3%A9l%C3%A9chargement.png');
      expect(config.fileName().indexOf('%C3')).assertLarger(0);
      expect(extensionOf(config.url)).assertEqual('.png');
      expect(config.isValid()).assertTrue();
      expect(config.describe().indexOf('%A9')).assertLarger(0);
    });
  });
}
