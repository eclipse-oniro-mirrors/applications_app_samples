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
  DownloadConfig,
  expectedConfigFor,
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  sameStringArray,
  countOf,
  hasDuplicateStrings,
  uniqueStrings,
  extensionOf
} from '../Shared/SharedDriver';

/**
 * Contract suite for the request.agent configuration that download() assembles.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  action DOWNLOAD, url argument, overwrite true, method GET, saveas './'
 *   117-143  create/start callback wiring that consumes the configuration
 *   151-171  the three URL literals bound to task A, B and C
 *
 * The oracle is written from the page literal, never from the validator, so an
 * inverted rule inside validate() cannot bless itself through this suite.
 */
export default function transferContractTest(): void {
  describe('TransferContract', () => {
    beforeAll(() => {
      logSuite('TransferContract', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferContract', 'end');
    });

    /**
     * @tc.name   seededConfigForTaskAHasProductionLiterals
     * @tc.desc   The task A configuration keeps the five literals written in download().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededConfigForTaskAHasProductionLiterals', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('./');
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.url.startsWith('https://')).assertTrue();
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   seededConfigForEachTaskCarriesItsOwnUrl
     * @tc.desc   A, B and C resolve to three different production URLs while sharing the same options.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededConfigForEachTaskCarriesItsOwnUrl', 0, () => {
      const configA: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const configB: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const configC: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(configA.url).assertEqual(URL_TASK_A);
      expect(configB.url).assertEqual(URL_TASK_B);
      expect(configC.url).assertEqual(URL_TASK_C);
      expect(configA.sameAs(configB)).assertFalse();
      expect(configB.sameAs(configC)).assertFalse();
      expect(configA.action).assertEqual(configC.action);
      expect(configB.method).assertEqual(configA.method);
    });

    /**
     * @tc.name   factoryForUrlCopiesEveryProductionLiteral
     * @tc.desc   DownloadConfig.forUrl builds a fully valid configuration around an arbitrary https URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('factoryForUrlCopiesEveryProductionLiteral', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_B);
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(config.url).assertEqual(URL_TASK_B);
      expect(config.validate().length).assertEqual(0);
      expect(config.fileName()).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   factoryForTaskMatchesOracleForAllThreeTasks
     * @tc.desc   The factory result equals the independently built expectation for every task number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('factoryForTaskMatchesOracleForAllThreeTasks', 0, () => {
      const configA: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const configB: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const configC: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(configA.sameAs(expectedConfigFor(TASK_A))).assertTrue();
      expect(configB.sameAs(expectedConfigFor(TASK_B))).assertTrue();
      expect(configC.sameAs(expectedConfigFor(TASK_C))).assertTrue();
      expect(configA.describe()).assertEqual(expectedConfigFor(TASK_A).describe());
      expect(configB.describe()).assertEqual(expectedConfigFor(TASK_B).describe());
      expect(configC.describe()).assertEqual(expectedConfigFor(TASK_C).describe());
      logStep('transferContract', 'factory and oracle agree for A, B and C');
    });

    /**
     * @tc.name   unknownTaskNumberFallsBackToEmptyUrl
     * @tc.desc   An unknown task number yields the default options with an empty URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskNumberFallsBackToEmptyUrl', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('Z');
      expect(config.url).assertEqual('');
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('./');
      expect(config.isValid()).assertFalse();
      expect(config.describe().endsWith('|')).assertTrue();
    });

    /**
     * @tc.name   validConfigProducesEmptyErrorList
     * @tc.desc   A production configuration reports no validation errors at all.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validConfigProducesEmptyErrorList', 0, () => {
      const config: DownloadConfig = expectedConfigFor(TASK_C);
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(0);
      expect(sameStringArray(errors, [])).assertTrue();
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.sameAs(config.clone())).assertTrue();
      expect(countOf(errors, 'url-empty')).assertEqual(0);
    });

    /**
     * @tc.name   emptyUrlReportsEmptyAndSchemeErrors
     * @tc.desc   An empty URL fails both the length rule and the https rule, in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyUrlReportsEmptyAndSchemeErrors', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', '', true, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(sameStringArray(errors, ['url-empty', 'url-not-https'])).assertTrue();
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('file');
    });

    /**
     * @tc.name   plainHttpUrlReportsSchemeErrorOnly
     * @tc.desc   A plain http URL breaks only the https rule of the contract.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('plainHttpUrlReportsSchemeErrorOnly', 0, () => {
      const config: DownloadConfig =
        new DownloadConfig('DOWNLOAD', 'http://example.com/media/picture.png', true, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(sameStringArray(errors, ['url-not-https'])).assertTrue();
      expect(config.isValid()).assertFalse();
      expect(config.url.startsWith('http://')).assertTrue();
      expect(config.fileName()).assertEqual('picture.png');
    });

    /**
     * @tc.name   wrongActionReportsActionErrorOnly
     * @tc.desc   Replacing the action with UPLOAD breaks exactly the action clause of the contract.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('wrongActionReportsActionErrorOnly', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('action-not-download');
      expect(config.isValid()).assertFalse();
      expect(config.action).assertEqual('UPLOAD');
      expect(config.action !== CONFIG_ACTION_DOWNLOAD).assertTrue();
      expect(config.url).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   unsupportedMethodReportsMethodErrorOnly
     * @tc.desc   PUT is neither GET nor POST, so the method clause is the only failure.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unsupportedMethodReportsMethodErrorOnly', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'PUT', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('method-unsupported');
      expect(sameStringArray(errors, ['method-unsupported'])).assertTrue();
      expect(config.isValid()).assertFalse();
      expect(config.method).assertEqual('PUT');
      expect(config.clone().isValid()).assertFalse();
    });

    /**
     * @tc.name   postMethodIsAcceptedByContract
     * @tc.desc   The page comment allows GET or POST, and the validator honours POST as valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('postMethodIsAcceptedByContract', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'POST', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.method).assertEqual('POST');
      expect(countOf(errors, 'method-unsupported')).assertEqual(0);
      expect(config.sameAs(expectedConfigFor(TASK_C))).assertFalse();
      expect(config.fileName()).assertEqual('icon_main_color.png');
    });

    /**
     * @tc.name   lowerCaseGetMethodIsRejected
     * @tc.desc   The method comparison is case sensitive, so a lower case get is unsupported.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lowerCaseGetMethodIsRejected', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'get', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('method-unsupported');
      expect(config.method === CONFIG_METHOD_GET).assertFalse();
      expect(config.method.length).assertEqual(3);
      expect(config.isValid()).assertFalse();
      expect(config.url).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   overwriteDisabledReportsOverwriteError
     * @tc.desc   The overwrite flag must stay true so a re-download replaces the cached file.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('overwriteDisabledReportsOverwriteError', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, false, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('overwrite-disabled');
      expect(config.overwrite).assertFalse();
      expect(config.isValid()).assertFalse();
      expect(config.describe().indexOf('|false|')).assertLarger(0);
      expect(config.clone().overwrite).assertFalse();
    });

    /**
     * @tc.name   saveasOutsideCacheReportsSaveasError
     * @tc.desc   A saveas path other than the cache directory is rejected by the contract.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('saveasOutsideCacheReportsSaveasError', 0, () => {
      const config: DownloadConfig =
        new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', '/data/storage/el2/base/files');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('saveas-not-cache');
      expect(config.isValid()).assertFalse();
      expect(config.saveas).assertEqual('/data/storage/el2/base/files');
      expect(config.saveas !== CONFIG_SAVEAS_CACHE).assertTrue();
      expect(config.fileName()).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   cacheDirectoryRequiresLeadingDotSlash
     * @tc.desc   A bare cache spelling is not the cache literal, so validation still rejects it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cacheDirectoryRequiresLeadingDotSlash', 0, () => {
      const bare: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', 'cache');
      const nested: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', './cache');
      expect(bare.validate().length).assertEqual(1);
      expect(bare.validate()[0]).assertEqual('saveas-not-cache');
      expect(nested.validate().length).assertEqual(1);
      expect(nested.validate()[0]).assertEqual('saveas-not-cache');
      expect(bare.saveas.length).assertEqual(5);
      expect(nested.saveas.endsWith('cache')).assertTrue();
      expect(nested.isValid()).assertFalse();
    });

    /**
     * @tc.name   fullyBrokenConfigReportsAllSixErrors
     * @tc.desc   A configuration that breaks every clause produces the complete error list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fullyBrokenConfigReportsAllSixErrors', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', '', false, 'PATCH', 'tmp');
      const errors: string[] = config.validate();
      const expected: string[] = [
        'url-empty', 'url-not-https', 'action-not-download',
        'method-unsupported', 'overwrite-disabled', 'saveas-not-cache'
      ];
      expect(errors.length).assertEqual(6);
      expect(sameStringArray(errors, expected)).assertTrue();
      expect(countOf(errors, 'url-empty')).assertEqual(1);
      expect(countOf(errors, 'saveas-not-cache')).assertEqual(1);
      expect(config.isValid()).assertFalse();
      expect(config.validate().length).assertEqual(6);
    });

    /**
     * @tc.name   errorOrderFollowsValidationPrecedence
     * @tc.desc   Error entries always come out in the fixed url, action, method, overwrite, saveas order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorOrderFollowsValidationPrecedence', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', 'http://host/x.bin', false, 'PUT', 'tmp');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(5);
      expect(errors[0]).assertEqual('url-not-https');
      expect(errors[1]).assertEqual('action-not-download');
      expect(errors[2]).assertEqual('method-unsupported');
      expect(errors[3]).assertEqual('overwrite-disabled');
      expect(errors[4]).assertEqual('saveas-not-cache');
      expect(errors.indexOf('action-not-download')).assertLess(errors.indexOf('method-unsupported'));
    });

    /**
     * @tc.name   describeJoinsFieldsWithPipeSeparator
     * @tc.desc   describe() serialises action, method, overwrite, saveas and url in that fixed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('describeJoinsFieldsWithPipeSeparator', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      const text: string = config.describe();
      const parts: string[] = text.split('|');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('DOWNLOAD');
      expect(parts[1]).assertEqual('GET');
      expect(parts[2]).assertEqual('true');
      expect(parts[3]).assertEqual('./');
      expect(parts[4]).assertEqual(URL_TASK_A);
      expect(text.indexOf('DOWNLOAD')).assertEqual(0);
    });

    /**
     * @tc.name   sameAsComparesAllFiveFields
     * @tc.desc   Equality is broken by a change in any single configuration field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameAsComparesAllFiveFields', 0, () => {
      const base: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      const action: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './');
      const method: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'POST', './');
      const overwrite: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, false, 'GET', './');
      const saveas: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', './tmp');
      const url: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', './');
      expect(base.sameAs(base)).assertTrue();
      expect(base.sameAs(action)).assertFalse();
      expect(base.sameAs(method)).assertFalse();
      expect(base.sameAs(overwrite)).assertFalse();
      expect(base.sameAs(saveas)).assertFalse();
      expect(base.sameAs(url)).assertFalse();
      expect(url.sameAs(base)).assertFalse();
    });

    /**
     * @tc.name   cloneIsIndependentOfLaterMutation
     * @tc.desc   A clone keeps the original values after the source configuration is mutated.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneIsIndependentOfLaterMutation', 0, () => {
      const original: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const copy: DownloadConfig = original.clone();
      expect(copy.sameAs(original)).assertTrue();
      original.url = 'https://example.com/replaced.png';
      original.method = 'POST';
      original.overwrite = false;
      expect(copy.url).assertEqual(URL_TASK_A);
      expect(copy.method).assertEqual('GET');
      expect(copy.overwrite).assertTrue();
      expect(copy.sameAs(original)).assertFalse();
      expect(original.isValid()).assertFalse();
    });

    /**
     * @tc.name   cloneOfInvalidConfigKeepsItsErrors
     * @tc.desc   Cloning does not repair an invalid configuration; the copy reproduces the errors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneOfInvalidConfigKeepsItsErrors', 0, () => {
      const original: DownloadConfig = new DownloadConfig('UPLOAD', '', false, 'PUT', 'tmp');
      const copy: DownloadConfig = original.clone();
      expect(copy.sameAs(original)).assertTrue();
      expect(copy.validate().length).assertEqual(original.validate().length);
      expect(copy.validate().length).assertEqual(6);
      expect(copy.isValid()).assertFalse();
      expect(copy.action).assertEqual('UPLOAD');
      expect(copy.url).assertEqual('');
      expect(copy.overwrite).assertFalse();
    });

    /**
     * @tc.name   validateIsRepeatableAndReadOnly
     * @tc.desc   Calling validate() twice returns the same list and never mutates the configuration.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validateIsRepeatableAndReadOnly', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', 'ftp://host/x.png', true, 'GET', './');
      const first: string[] = config.validate();
      const second: string[] = config.validate();
      expect(sameStringArray(first, second)).assertTrue();
      expect(first.length).assertEqual(1);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('./');
      expect(config.url).assertEqual('ftp://host/x.png');
    });

    /**
     * @tc.name   isValidAgreesWithErrorListLength
     * @tc.desc   isValid() is exactly the emptiness test of validate() over a spread of configurations.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isValidAgreesWithErrorListLength', 0, () => {
      const configs: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forUrl('https://example.com/a.txt'),
        DownloadConfig.forUrl('http://example.com/a.txt'),
        new DownloadConfig('DOWNLOAD', URL_TASK_C, false, 'GET', './'),
        new DownloadConfig('UPLOAD', URL_TASK_C, true, 'GET', './')
      ];
      for (let index = 0; index < configs.length; index++) {
        expect(configs[index].isValid()).assertEqual(configs[index].validate().length === 0);
      }
      expect(configs[0].isValid()).assertTrue();
      expect(configs[3].isValid()).assertFalse();
      expect(configs[5].isValid()).assertFalse();
    });

    /**
     * @tc.name   fileNameOfTaskAConfigMatchesUrlTail
     * @tc.desc   The derived file name of the task A URL is the drawable name from the page literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileNameOfTaskAConfigMatchesUrlTail', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const name: string = config.fileName();
      expect(name).assertEqual('favor_list_tea.png');
      expect(name.indexOf('/')).assertEqual(-1);
      expect(config.url.endsWith(name)).assertTrue();
      expect(name.length).assertLarger(4);
      expect(name.endsWith('.png')).assertTrue();
      expect(config.fileName()).assertEqual(name);
    });

    /**
     * @tc.name   fileNameFallsBackForDirectoryStyleUrl
     * @tc.desc   A URL that ends with a slash has no tail, so the derived name is the documented fallback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameFallsBackForDirectoryStyleUrl', 0, () => {
      const config: DownloadConfig =
        new DownloadConfig('DOWNLOAD', 'https://example.com/media/downloads/', true, 'GET', './');
      expect(config.fileName()).assertEqual('file');
      expect(config.fileName().length).assertEqual(4);
      expect(config.url.endsWith('/')).assertTrue();
      expect(countOf(config.url.split('/'), '')).assertEqual(2);
      expect(config.isValid()).assertTrue();
      expect(config.describe().endsWith('/')).assertTrue();
    });

    /**
     * @tc.name   configForTaskBPreservesPngExtension
     * @tc.desc   The task B configuration keeps the png suffix of the after_cache literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configForTaskBPreservesPngExtension', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const name: string = config.fileName();
      expect(name).assertEqual('after_cache.png');
      expect(extensionOf(config.url)).assertEqual('.png');
      expect(name.endsWith(extensionOf(config.url))).assertTrue();
      expect(name.indexOf('.')).assertLarger(0);
      expect(config.url.indexOf('after_cache')).assertLarger(0);
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   describeRoundTripsThroughClone
     * @tc.desc   A clone serialises to the identical describe() text, so equality survives a copy.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeRoundTripsThroughClone', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const copy: DownloadConfig = config.clone();
      expect(copy.describe()).assertEqual(config.describe());
      expect(copy.describe().split('|')[4]).assertEqual(URL_TASK_C);
      expect(copy.describe().split('|')[2]).assertEqual('true');
      expect(copy.describe().length).assertEqual(config.describe().length);
      expect(copy.sameAs(config)).assertTrue();
      expect(config.sameAs(copy)).assertTrue();
      expect(copy.url).assertEqual(URL_TASK_C);
    });

    /**
     * @tc.name   actionLiteralIsUppercaseDownload
     * @tc.desc   The action constant is the exact uppercase DOWNLOAD literal used by download().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('actionLiteralIsUppercaseDownload', 0, () => {
      expect(CONFIG_ACTION_DOWNLOAD).assertEqual('DOWNLOAD');
      expect(CONFIG_ACTION_DOWNLOAD.length).assertEqual(8);
      expect(CONFIG_ACTION_DOWNLOAD.toUpperCase()).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(CONFIG_ACTION_DOWNLOAD.indexOf('DOWNLOAD')).assertEqual(0);
      expect(DownloadConfig.forTask(TASK_A).action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(DownloadConfig.forUrl(URL_TASK_B).action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(DownloadConfig.forTask(TASK_A).describe().split('|')[0]).assertEqual(CONFIG_ACTION_DOWNLOAD);
    });

    /**
     * @tc.name   saveasLiteralIsDotSlashCache
     * @tc.desc   The saveas constant is the two character './' cache marker from the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('saveasLiteralIsDotSlashCache', 0, () => {
      expect(CONFIG_SAVEAS_CACHE).assertEqual('./');
      expect(CONFIG_SAVEAS_CACHE.length).assertEqual(2);
      expect(CONFIG_SAVEAS_CACHE.startsWith('.')).assertTrue();
      expect(CONFIG_SAVEAS_CACHE.endsWith('/')).assertTrue();
      expect(DownloadConfig.forTask(TASK_B).saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(DownloadConfig.forTask(TASK_C).describe().split('|')[3]).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(CONFIG_SAVEAS_CACHE.indexOf('cache')).assertEqual(-1);
    });

    /**
     * @tc.name   methodLiteralIsUppercaseGet
     * @tc.desc   The method constant is the uppercase GET literal used by the download configuration.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('methodLiteralIsUppercaseGet', 0, () => {
      expect(CONFIG_METHOD_GET).assertEqual('GET');
      expect(CONFIG_METHOD_GET.length).assertEqual(3);
      expect(CONFIG_METHOD_GET.toUpperCase()).assertEqual(CONFIG_METHOD_GET);
      expect(CONFIG_METHOD_GET.indexOf('G')).assertEqual(0);
      expect(DownloadConfig.forTask(TASK_B).method).assertEqual(CONFIG_METHOD_GET);
      expect(DownloadConfig.forUrl(URL_TASK_C).describe().split('|')[1]).assertEqual(CONFIG_METHOD_GET);
      expect(CONFIG_METHOD_GET === 'get').assertFalse();
    });

    /**
     * @tc.name   overwriteLiteralIsTrue
     * @tc.desc   The overwrite constant is boolean true, matching the page requirement to replace files.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('overwriteLiteralIsTrue', 0, () => {
      expect(CONFIG_OVERWRITE).assertTrue();
      expect(CONFIG_OVERWRITE === true).assertTrue();
      expect(CONFIG_OVERWRITE === false).assertFalse();
      expect(DownloadConfig.forTask(TASK_C).overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(DownloadConfig.forUrl(URL_TASK_A).overwrite).assertTrue();
      expect(DownloadConfig.forTask(TASK_A).describe().split('|')[2]).assertEqual('true');
      expect(DownloadConfig.forTask(TASK_A).validate().indexOf('overwrite-disabled')).assertEqual(-1);
    });

    /**
     * @tc.name   httpFactoryConfigIsInvalid
     * @tc.desc   The factory keeps the options but an http URL still fails the https contract clause.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('httpFactoryConfigIsInvalid', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl('http://example.com/media/photo.png');
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.isValid()).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.fileName()).assertEqual('photo.png');
      expect(config.sameAs(expectedConfigFor('Z'))).assertFalse();
    });

    /**
     * @tc.name   sameAsIsSymmetricAcrossTaskConfigs
     * @tc.desc   Equality between the three task configurations is symmetric and only holds for equal URLs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameAsIsSymmetricAcrossTaskConfigs', 0, () => {
      const configA: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const configB: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const configC: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(configA.sameAs(configB)).assertFalse();
      expect(configB.sameAs(configA)).assertFalse();
      expect(configB.sameAs(configC)).assertFalse();
      expect(configC.sameAs(configB)).assertFalse();
      expect(configA.sameAs(configA.clone())).assertTrue();
      expect(configB.sameAs(configB.clone())).assertTrue();
      expect(configC.sameAs(configC.clone())).assertTrue();
    });

    /**
     * @tc.name   singleFieldMutationsEachYieldOneError
     * @tc.desc   Each of the five field mutations breaks exactly one clause of the contract.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleFieldMutationsEachYieldOneError', 0, () => {
      const mutated: DownloadConfig[] = [
        new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'DELETE', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, false, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', 'tmp'),
        new DownloadConfig('DOWNLOAD', 'http://example.com/a.png', true, 'GET', './')
      ];
      const codes: string[] = [
        'action-not-download', 'method-unsupported', 'overwrite-disabled', 'saveas-not-cache', 'url-not-https'
      ];
      for (let index = 0; index < mutated.length; index++) {
        expect(mutated[index].validate().length).assertEqual(1);
        expect(mutated[index].validate()[0]).assertEqual(codes[index]);
        expect(mutated[index].isValid()).assertFalse();
      }
      expect(mutated[0].validate()[0]).assertEqual(codes[0]);
    });

    /**
     * @tc.name   extensionAgreementAcrossThreeTasks
     * @tc.desc   Every task file name ends with the extension derived from its own URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionAgreementAcrossThreeTasks', 0, () => {
      const configs: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A), DownloadConfig.forTask(TASK_B), DownloadConfig.forTask(TASK_C)
      ];
      for (let index = 0; index < configs.length; index++) {
        const name: string = configs[index].fileName();
        const extension: string = extensionOf(configs[index].url);
        expect(extension).assertEqual('.png');
        expect(name.endsWith(extension)).assertTrue();
        expect(configs[index].url.endsWith(name)).assertTrue();
        expect(name.indexOf('?')).assertEqual(-1);
      }
      expect(configs.length).assertEqual(3);
    });

    /**
     * @tc.name   configMatrixHasNoDuplicateUrls
     * @tc.desc   The three task URLs are pairwise distinct with no repeated or blank entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configMatrixHasNoDuplicateUrls', 0, () => {
      const urls: string[] = [
        DownloadConfig.forTask(TASK_A).url,
        DownloadConfig.forTask(TASK_B).url,
        DownloadConfig.forTask(TASK_C).url
      ];
      expect(hasDuplicateStrings(urls)).assertFalse();
      expect(uniqueStrings(urls).length).assertEqual(3);
      expect(countOf(urls, URL_TASK_A)).assertEqual(1);
      expect(countOf(urls, URL_TASK_B)).assertEqual(1);
      expect(countOf(urls, URL_TASK_C)).assertEqual(1);
      expect(urls.indexOf('')).assertEqual(-1);
      expect(hasDuplicateStrings(uniqueStrings(urls))).assertFalse();
    });

    /**
     * @tc.name   uppercaseSchemeIsRejected
     * @tc.desc   The https check is case sensitive, so an uppercase scheme is not accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercaseSchemeIsRejected', 0, () => {
      const config: DownloadConfig =
        new DownloadConfig('DOWNLOAD', 'HTTPS://example.com/media/picture.png', true, 'GET', './');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.url.startsWith('https://')).assertFalse();
      expect(config.url.toUpperCase().startsWith('HTTPS://')).assertTrue();
      expect(config.fileName()).assertEqual('picture.png');
    });

    /**
     * @tc.name   urlWithFragmentStaysValid
     * @tc.desc   A fragment is not part of the contract, so a fragment-bearing https URL remains valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlWithFragmentStaysValid', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl('https://example.com/media/picture.png#preview');
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.url.indexOf('#')).assertLarger(0);
      expect(config.fileName()).assertEqual('picture.png#preview');
      expect(config.fileName().startsWith('picture.png')).assertTrue();
      expect(config.describe().endsWith('#preview')).assertTrue();
      expect(config.sameAs(DownloadConfig.forUrl('https://example.com/media/picture.png'))).assertFalse();
    });

    /**
     * @tc.name   cloneMatrixOfAllTaskConfigsIsDeep
     * @tc.desc   Each cloned task configuration detaches from its source field by field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneMatrixOfAllTaskConfigsIsDeep', 0, () => {
      const configs: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A), DownloadConfig.forTask(TASK_B), DownloadConfig.forTask(TASK_C)
      ];
      for (let index = 0; index < configs.length; index++) {
        const copy: DownloadConfig = configs[index].clone();
        expect(copy.sameAs(configs[index])).assertTrue();
        expect(copy.url).assertEqual(configs[index].url);
        copy.url = 'https://example.com/mutated.png';
        copy.saveas = 'tmp';
        expect(copy.sameAs(configs[index])).assertFalse();
        expect(configs[index].isValid()).assertTrue();
        expect(copy.isValid()).assertFalse();
      }
      expect(configs[0].url).assertEqual(URL_TASK_A);
      expect(configs[2].url).assertEqual(URL_TASK_C);
    });

    /**
     * @tc.name   validationCoversEveryClauseExactlyOnce
     * @tc.desc   Across six orthogonal mutations, each error code is emitted exactly once in total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationCoversEveryClauseExactlyOnce', 0, () => {
      const broken: DownloadConfig[] = [
        new DownloadConfig('DOWNLOAD', '', true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', 'http://example.com/a.png', true, 'GET', './'),
        new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'PUT', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, false, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', 'tmp')
      ];
      const seen: string[] = [];
      for (let index = 0; index < broken.length; index++) {
        const errors: string[] = broken[index].validate();
        expect(errors.length).assertLarger(0);
        for (let inner = 0; inner < errors.length; inner++) {
          seen.push(errors[inner]);
        }
      }
      expect(seen.length).assertEqual(7);
      expect(countOf(seen, 'url-empty')).assertEqual(1);
      expect(countOf(seen, 'url-not-https')).assertEqual(2);
      expect(countOf(seen, 'action-not-download')).assertEqual(1);
      expect(countOf(seen, 'method-unsupported')).assertEqual(1);
      expect(countOf(seen, 'overwrite-disabled')).assertEqual(1);
      expect(countOf(seen, 'saveas-not-cache')).assertEqual(1);
      expect(uniqueStrings(seen).length).assertEqual(6);
    });

    /**
     * @tc.name   describeOfEmptyUrlConfigHasTrailingSeparator
     * @tc.desc   The fallback configuration serialises five parts where the last one is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeOfEmptyUrlConfigHasTrailingSeparator', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('unknown');
      const parts: string[] = config.describe().split('|');
      expect(parts.length).assertEqual(5);
      expect(parts[4]).assertEqual('');
      expect(countOf(parts, '')).assertEqual(1);
      expect(config.describe().endsWith('|')).assertTrue();
      expect(config.describe().length).assertEqual(21);
      expect(config.fileName()).assertEqual('file');
      expect(config.url).assertEqual('');
      expect(config.clone().describe()).assertEqual(config.describe());
    });

    /**
     * @tc.name   actionAndSaveasClausesAreIndependent
     * @tc.desc   Breaking action and saveas together yields two errors that do not mask each other.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('actionAndSaveasClausesAreIndependent', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_B, true, 'GET', 'tmp');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('action-not-download');
      expect(errors[1]).assertEqual('saveas-not-cache');
      expect(sameStringArray(errors, ['action-not-download', 'saveas-not-cache'])).assertTrue();
      expect(countOf(errors, 'action-not-download')).assertEqual(1);
      expect(countOf(errors, 'saveas-not-cache')).assertEqual(1);
      expect(config.url).assertEqual(URL_TASK_B);
      expect(config.isValid()).assertFalse();
    });

  });
}
