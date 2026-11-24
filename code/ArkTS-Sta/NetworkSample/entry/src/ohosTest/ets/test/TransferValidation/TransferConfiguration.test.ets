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
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  hasDuplicateStrings,
  uniqueStrings,
  sameStringArray,
  countOf,
  schemeOf,
  hostOf,
  hasQuery,
  queryOf,
  extensionOf
} from '../Shared/SharedDriver';

/**
 * Configuration matrix suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  the request.agent.Config literal built inside download()
 *   151-171  runTaskA / runTaskB / runTaskC supply the URL argument
 *   174-197  startAllTasks passes 'A', 'B' and 'C' as task numbers
 *
 * Every row of the matrix is checked against an oracle that is rebuilt from the
 * page literal, then mutated one field at a time. An invalid row may never be
 * reported as valid, whatever the other four fields contain.
 */
export default function transferConfigurationTest(): void {
  describe('TransferConfiguration', () => {
    beforeAll(() => {
      logSuite('TransferConfiguration', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferConfiguration', 'end');
    });

    /**
     * @tc.name   threeTaskMatrixHasThreeRows
     * @tc.desc   The community matrix built from the factory contains one row per page task number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('threeTaskMatrixHasThreeRows', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      expect(matrix.length).assertEqual(3);
      expect(matrix.length).assertEqual(TASK_NUMBERS.length);
      expect(matrix[0].url).assertEqual(URL_TASK_A);
      expect(matrix[1].url).assertEqual(URL_TASK_B);
      expect(matrix[2].url).assertEqual(URL_TASK_C);
      expect(matrix[0].sameAs(matrix[1])).assertFalse();
      expect(matrix[1].sameAs(matrix[2])).assertFalse();
    });

    /**
     * @tc.name   matrixRowsAreAllValid
     * @tc.desc   All three production rows pass the configuration contract without a single error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixRowsAreAllValid', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      for (let index = 0; index < matrix.length; index++) {
        expect(matrix[index].isValid()).assertTrue();
        expect(matrix[index].validate().length).assertEqual(0);
      }
      expect(countOf(matrix[0].validate(), 'url-empty')).assertEqual(0);
      expect(matrix[2].validate().length).assertEqual(0);
      logStep('transferConfiguration', 'all three production rows are valid');
    });

    /**
     * @tc.name   matrixRowsShareActionAndMethod
     * @tc.desc   The action and method columns are identical across the three task rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixRowsShareActionAndMethod', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      for (let index = 0; index < matrix.length; index++) {
        expect(matrix[index].action).assertEqual(CONFIG_ACTION_DOWNLOAD);
        expect(matrix[index].method).assertEqual(CONFIG_METHOD_GET);
        expect(matrix[index].action).assertEqual(matrix[0].action);
        expect(matrix[index].method).assertEqual(matrix[0].method);
      }
      expect(matrix[1].action).assertEqual('DOWNLOAD');
      expect(matrix[2].method).assertEqual('GET');
    });

    /**
     * @tc.name   matrixRowsShareOverwriteAndSaveas
     * @tc.desc   The overwrite and saveas columns are identical across the three task rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixRowsShareOverwriteAndSaveas', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      for (let index = 0; index < matrix.length; index++) {
        expect(matrix[index].overwrite).assertEqual(CONFIG_OVERWRITE);
        expect(matrix[index].saveas).assertEqual(CONFIG_SAVEAS_CACHE);
        expect(matrix[index].overwrite).assertTrue();
        expect(matrix[index].saveas).assertEqual('./');
      }
      expect(matrix[0].saveas).assertEqual(matrix[2].saveas);
      expect(matrix[1].overwrite).assertEqual(matrix[2].overwrite);
    });

    /**
     * @tc.name   matrixUrlsArePairwiseDistinct
     * @tc.desc   The URL column has no duplicate and no blank entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixUrlsArePairwiseDistinct', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      expect(hasDuplicateStrings(urls)).assertFalse();
      expect(uniqueStrings(urls).length).assertEqual(3);
      expect(urls.indexOf('')).assertEqual(-1);
      expect(countOf(urls, URL_TASK_A)).assertEqual(1);
      expect(countOf(urls, URL_TASK_B)).assertEqual(1);
      expect(countOf(urls, URL_TASK_C)).assertEqual(1);
      expect(urls[0] === urls[1]).assertFalse();
    });

    /**
     * @tc.name   matrixFileNamesArePairwiseDistinct
     * @tc.desc   The three URLs resolve to three different download file names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixFileNamesArePairwiseDistinct', 0, () => {
      const names: string[] = [
        DownloadConfig.forTask(TASK_A).fileName(),
        DownloadConfig.forTask(TASK_B).fileName(),
        DownloadConfig.forTask(TASK_C).fileName()
      ];
      expect(hasDuplicateStrings(names)).assertFalse();
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('favor_list_tea.png');
      expect(names[1]).assertEqual('after_cache.png');
      expect(names[2]).assertEqual('icon_main_color.png');
      expect(names.indexOf('file')).assertEqual(-1);
      expect(uniqueStrings(names).length).assertEqual(3);
    });

    /**
     * @tc.name   matrixExtensionsAreAllPng
     * @tc.desc   Every row keeps the png extension declared by its URL literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixExtensionsAreAllPng', 0, () => {
      const configs: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      for (let index = 0; index < configs.length; index++) {
        expect(extensionOf(configs[index].url)).assertEqual('.png');
        expect(configs[index].fileName().endsWith('.png')).assertTrue();
        expect(configs[index].fileName().lastIndexOf('.')).assertLarger(0);
      }
      expect(extensionOf(configs[0].url)).assertEqual(extensionOf(configs[2].url));
      expect(configs[1].fileName().split('.').length).assertEqual(2);
    });

    /**
     * @tc.name   matrixDescribeStringsAreDistinct
     * @tc.desc   The serialized rows differ only in their URL tail and are all unique.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixDescribeStringsAreDistinct', 0, () => {
      const lines: string[] = [
        DownloadConfig.forTask(TASK_A).describe(),
        DownloadConfig.forTask(TASK_B).describe(),
        DownloadConfig.forTask(TASK_C).describe()
      ];
      expect(hasDuplicateStrings(lines)).assertFalse();
      expect(uniqueStrings(lines).length).assertEqual(3);
      expect(lines[0].split('|')[4]).assertEqual(URL_TASK_A);
      expect(lines[1].split('|')[4]).assertEqual(URL_TASK_B);
      expect(lines[2].split('|')[4]).assertEqual(URL_TASK_C);
      expect(lines[0].startsWith('DOWNLOAD|GET|true|./|')).assertTrue();
      expect(lines[1].startsWith('DOWNLOAD|GET|true|./|')).assertTrue();
    });

    /**
     * @tc.name   oracleMatrixMatchesFactoryRowByRow
     * @tc.desc   Each factory row equals the independently built expectation for the same task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oracleMatrixMatchesFactoryRowByRow', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < matrix.length; index++) {
        const oracle: DownloadConfig = expectedConfigFor(numbers[index]);
        expect(matrix[index].sameAs(oracle)).assertTrue();
        expect(matrix[index].describe()).assertEqual(oracle.describe());
        expect(matrix[index].validate().length).assertEqual(oracle.validate().length);
      }
      expect(matrix[0].sameAs(expectedConfigFor(TASK_B))).assertFalse();
      expect(matrix[2].sameAs(expectedConfigFor(TASK_C))).assertTrue();
    });

    /**
     * @tc.name   oracleForTaskARepeatsUrlA
     * @tc.desc   The oracle row for A carries the A URL and the page download options.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oracleForTaskARepeatsUrlA', 0, () => {
      const oracle: DownloadConfig = expectedConfigFor(TASK_A);
      expect(oracle.url).assertEqual(URL_TASK_A);
      expect(oracle.url.indexOf('favor_list_tea.png')).assertLarger(0);
      expect(oracle.action).assertEqual('DOWNLOAD');
      expect(oracle.method).assertEqual('GET');
      expect(oracle.overwrite).assertTrue();
      expect(oracle.saveas).assertEqual('./');
      expect(oracle.isValid()).assertTrue();
    });

    /**
     * @tc.name   oracleForTaskBRepeatsUrlB
     * @tc.desc   The oracle row for B carries the B URL and the page download options.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oracleForTaskBRepeatsUrlB', 0, () => {
      const oracle: DownloadConfig = expectedConfigFor(TASK_B);
      expect(oracle.url).assertEqual(URL_TASK_B);
      expect(oracle.url.indexOf('after_cache.png')).assertLarger(0);
      expect(oracle.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(oracle.method).assertEqual(CONFIG_METHOD_GET);
      expect(oracle.overwrite).assertTrue();
      expect(oracle.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(oracle.fileName()).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   oracleForTaskCRepeatsUrlC
     * @tc.desc   The oracle row for C carries the C URL and the page download options.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oracleForTaskCRepeatsUrlC', 0, () => {
      const oracle: DownloadConfig = expectedConfigFor(TASK_C);
      expect(oracle.url).assertEqual(URL_TASK_C);
      expect(oracle.url.indexOf('icon_main_color.png')).assertLarger(0);
      expect(oracle.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(oracle.method).assertEqual(CONFIG_METHOD_GET);
      expect(oracle.overwrite).assertTrue();
      expect(oracle.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(oracle.fileName()).assertEqual('icon_main_color.png');
    });

    /**
     * @tc.name   unknownTaskOracleHasEmptyUrlAndIsInvalid
     * @tc.desc   An oracle row for an unknown task keeps the options but leaves the URL empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskOracleHasEmptyUrlAndIsInvalid', 0, () => {
      const oracle: DownloadConfig = expectedConfigFor('Q');
      expect(oracle.url).assertEqual('');
      expect(oracle.action).assertEqual('DOWNLOAD');
      expect(oracle.method).assertEqual('GET');
      expect(oracle.isValid()).assertFalse();
      expect(oracle.validate().length).assertEqual(2);
      expect(oracle.clone().isValid()).assertFalse();
      expect(oracle.sameAs(DownloadConfig.forTask('Q'))).assertTrue();
    });

    /**
     * @tc.name   emptyTaskNumberOracleMatchesUnknownTask
     * @tc.desc   The empty and unknown task numbers both produce the same empty URL row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyTaskNumberOracleMatchesUnknownTask', 0, () => {
      const empty: DownloadConfig = expectedConfigFor('');
      const unknown: DownloadConfig = expectedConfigFor('Z');
      expect(empty.sameAs(unknown)).assertTrue();
      expect(empty.url).assertEqual('');
      expect(unknown.url).assertEqual('');
      expect(empty.describe()).assertEqual(unknown.describe());
      expect(empty.isValid()).assertFalse();
      expect(empty.fileName()).assertEqual('file');
      expect(unknown.fileName()).assertEqual('file');
    });

    /**
     * @tc.name   matrixRowEqualityIsReflexive
     * @tc.desc   Every row is equal to itself, matching the equality contract used by the matrix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixRowEqualityIsReflexive', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C),
        expectedConfigFor(TASK_A)
      ];
      for (let index = 0; index < matrix.length; index++) {
        expect(matrix[index].sameAs(matrix[index])).assertTrue();
        expect(matrix[index].describe()).assertEqual(matrix[index].describe());
      }
      expect(matrix[0].sameAs(matrix[3])).assertTrue();
      expect(matrix[3].sameAs(matrix[0])).assertTrue();
      expect(matrix.length).assertEqual(4);
    });

    /**
     * @tc.name   matrixRowEqualityIsSymmetric
     * @tc.desc   Equivalence between two rows holds in both argument directions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixRowEqualityIsSymmetric', 0, () => {
      const base: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const cloned: DownloadConfig = base.clone();
      const other: DownloadConfig = DownloadConfig.forTask(TASK_C);
      expect(base.sameAs(cloned)).assertTrue();
      expect(cloned.sameAs(base)).assertTrue();
      expect(base.sameAs(other)).assertFalse();
      expect(other.sameAs(base)).assertFalse();
      expect(base.describe()).assertEqual(cloned.describe());
      expect(base.describe() === other.describe()).assertFalse();
      expect(base.sameAs(other) === other.sameAs(base)).assertTrue();
    });

    /**
     * @tc.name   cloneMatrixIsEqualButIndependent
     * @tc.desc   Cloning every row produces equal copies that survive mutation of the sources.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneMatrixIsEqualButIndependent', 0, () => {
      const originals: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      const copies: DownloadConfig[] = [originals[0].clone(), originals[1].clone(), originals[2].clone()];
      for (let index = 0; index < copies.length; index++) {
        expect(copies[index].sameAs(originals[index])).assertTrue();
      }
      originals[0].url = '';
      originals[1].overwrite = false;
      originals[2].method = 'PUT';
      expect(copies[0].isValid()).assertTrue();
      expect(copies[1].isValid()).assertTrue();
      expect(copies[2].isValid()).assertTrue();
      expect(copies[0].sameAs(originals[0])).assertFalse();
      expect(copies[2].sameAs(originals[2])).assertFalse();
    });

    /**
     * @tc.name   mutatedActionRowDiffersFromBaseline
     * @tc.desc   Changing only the action column breaks equality and validity of the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutatedActionRowDiffersFromBaseline', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const row: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './');
      expect(row.sameAs(baseline)).assertFalse();
      expect(row.describe() === baseline.describe()).assertFalse();
      expect(row.action).assertEqual('UPLOAD');
      expect(row.url).assertEqual(baseline.url);
      expect(row.method).assertEqual(baseline.method);
      expect(row.isValid()).assertFalse();
      expect(row.validate()[0]).assertEqual('action-not-download');
    });

    /**
     * @tc.name   mutatedMethodRowDiffersFromBaseline
     * @tc.desc   Changing only the method column breaks equality and validity of the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutatedMethodRowDiffersFromBaseline', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const row: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'TRACE', './');
      expect(row.sameAs(baseline)).assertFalse();
      expect(row.method).assertEqual('TRACE');
      expect(row.action).assertEqual(baseline.action);
      expect(row.saveas).assertEqual(baseline.saveas);
      expect(row.isValid()).assertFalse();
      expect(row.validate().length).assertEqual(1);
      expect(row.validate()[0]).assertEqual('method-unsupported');
    });

    /**
     * @tc.name   mutatedOverwriteRowDiffersFromBaseline
     * @tc.desc   Flipping only the overwrite column breaks equality and validity of the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutatedOverwriteRowDiffersFromBaseline', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const row: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, false, 'GET', './');
      expect(row.sameAs(baseline)).assertFalse();
      expect(row.overwrite).assertFalse();
      expect(baseline.overwrite).assertTrue();
      expect(row.url).assertEqual(baseline.url);
      expect(row.isValid()).assertFalse();
      expect(row.validate()[0]).assertEqual('overwrite-disabled');
      expect(row.describe().split('|')[2]).assertEqual('false');
    });

    /**
     * @tc.name   mutatedSaveasRowDiffersFromBaseline
     * @tc.desc   Changing only the saveas column breaks equality and validity of the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutatedSaveasRowDiffersFromBaseline', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const row: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', '/tmp');
      expect(row.sameAs(baseline)).assertFalse();
      expect(row.saveas).assertEqual('/tmp');
      expect(row.saveas === baseline.saveas).assertFalse();
      expect(row.isValid()).assertFalse();
      expect(row.validate()[0]).assertEqual('saveas-not-cache');
      expect(row.describe().split('|')[3]).assertEqual('/tmp');
      expect(row.fileName()).assertEqual(baseline.fileName());
    });

    /**
     * @tc.name   mutatedUrlRowDiffersFromBaseline
     * @tc.desc   Downgrading only the URL to http breaks equality and validity of the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutatedUrlRowDiffersFromBaseline', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const row: DownloadConfig =
        new DownloadConfig('DOWNLOAD', 'http://example.com/media/after_cache.png', true, 'GET', './');
      expect(row.sameAs(baseline)).assertFalse();
      expect(row.url === baseline.url).assertFalse();
      expect(row.isValid()).assertFalse();
      expect(row.validate().length).assertEqual(1);
      expect(row.validate()[0]).assertEqual('url-not-https');
      expect(row.fileName()).assertEqual(baseline.fileName());
      expect(row.action).assertEqual(baseline.action);
    });

    /**
     * @tc.name   allFiveMutationsDifferFromBaseline
     * @tc.desc   Each of the five column mutations is unequal to the baseline row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allFiveMutationsDifferFromBaseline', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const rows: DownloadConfig[] = [
        new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'PUT', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, false, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', 'tmp'),
        new DownloadConfig('DOWNLOAD', 'http://example.com/a.png', true, 'GET', './')
      ];
      expect(rows.length).assertEqual(5);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].sameAs(baseline)).assertFalse();
        expect(baseline.sameAs(rows[index])).assertFalse();
        expect(rows[index].describe() === baseline.describe()).assertFalse();
      }
      expect(baseline.sameAs(baseline)).assertTrue();
      expect(baseline.describe().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name   mutatedRowsAreAllInvalid
     * @tc.desc   Every single-column mutation produces a row that fails validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutatedRowsAreAllInvalid', 0, () => {
      const rows: DownloadConfig[] = [
        new DownloadConfig('DELETE', URL_TASK_B, true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'HEAD', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, false, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', './out'),
        new DownloadConfig('DOWNLOAD', 'ftp://example.com/after_cache.png', true, 'GET', './')
      ];
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].isValid()).assertFalse();
        expect(rows[index].validate().length).assertLarger(0);
      }
      expect(rows[0].validate()[0]).assertEqual('action-not-download');
      expect(rows[4].validate()[0]).assertEqual('url-not-https');
      logStep('transferConfiguration', 'all mutated rows are invalid');
    });

    /**
     * @tc.name   invalidMatrixNeverReportsValid
     * @tc.desc   Over a mixed matrix isValid matches emptiness of the error list for every row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidMatrixNeverReportsValid', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        new DownloadConfig('DOWNLOAD', '', true, 'GET', './'),
        new DownloadConfig('UPLOAD', URL_TASK_B, true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'PATCH', './'),
        expectedConfigFor(TASK_C)
      ];
      for (let index = 0; index < matrix.length; index++) {
        expect(matrix[index].isValid()).assertEqual(matrix[index].validate().length === 0);
      }
      expect(matrix[0].isValid()).assertTrue();
      expect(matrix[1].isValid()).assertFalse();
      expect(matrix[4].isValid()).assertTrue();
      expect(matrix.length).assertEqual(5);
    });

    /**
     * @tc.name   emptyUrlRowReportsTwoErrors
     * @tc.desc   The empty URL row is the only mutation that reports two independent errors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyUrlRowReportsTwoErrors', 0, () => {
      const row: DownloadConfig = new DownloadConfig('DOWNLOAD', '', true, 'GET', './');
      const errors: string[] = row.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(sameStringArray(errors, ['url-empty', 'url-not-https'])).assertTrue();
      expect(row.isValid()).assertFalse();
      expect(row.url.length).assertEqual(0);
      expect(row.fileName()).assertEqual('file');
    });

    /**
     * @tc.name   httpRowReportsSchemeErrorOnly
     * @tc.desc   A plain http row reports exactly one error, the https clause.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('httpRowReportsSchemeErrorOnly', 0, () => {
      const row: DownloadConfig =
        new DownloadConfig('DOWNLOAD', 'http://example.com/media/icon_main_color.png', true, 'GET', './');
      expect(row.validate().length).assertEqual(1);
      expect(row.validate()[0]).assertEqual('url-not-https');
      expect(row.isValid()).assertFalse();
      expect(row.fileName()).assertEqual('icon_main_color.png');
      expect(row.method).assertEqual('GET');
      expect(row.overwrite).assertTrue();
      expect(row.saveas).assertEqual('./');
    });

    /**
     * @tc.name   postMethodRowStaysValidButDiffers
     * @tc.desc   A POST row is valid, yet it is not equal to the GET production row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('postMethodRowStaysValidButDiffers', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const row: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'POST', './');
      expect(row.isValid()).assertTrue();
      expect(row.validate().length).assertEqual(0);
      expect(row.sameAs(baseline)).assertFalse();
      expect(row.method).assertEqual('POST');
      expect(baseline.method).assertEqual('GET');
      expect(row.url).assertEqual(baseline.url);
      expect(row.describe().split('|')[1]).assertEqual('POST');
    });

    /**
     * @tc.name   cloneOfEachRowKeepsValidity
     * @tc.desc   Copying a mixed matrix preserves the validity verdict of every row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneOfEachRowKeepsValidity', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        new DownloadConfig('DOWNLOAD', 'http://example.com/a.png', true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, false, 'GET', './'),
        expectedConfigFor(TASK_C)
      ];
      for (let index = 0; index < matrix.length; index++) {
        const copy: DownloadConfig = matrix[index].clone();
        expect(copy.isValid()).assertEqual(matrix[index].isValid());
        expect(copy.validate().length).assertEqual(matrix[index].validate().length);
        expect(copy.sameAs(matrix[index])).assertTrue();
      }
      expect(matrix[1].clone().isValid()).assertFalse();
      expect(matrix[3].clone().isValid()).assertTrue();
    });

    /**
     * @tc.name   rowEqualityUsesEveryFieldColumn
     * @tc.desc   A row that matches four of five columns is still unequal to the baseline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowEqualityUsesEveryFieldColumn', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const rows: DownloadConfig[] = [
        new DownloadConfig('UPLOAD', URL_TASK_B, true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'PUT', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, false, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', 'elsewhere'),
        new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'GET', './')
      ];
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].sameAs(baseline)).assertFalse();
        expect(rows[index].describe().split('|')[4] === URL_TASK_B).assertEqual(index !== 4);
      }
      expect(baseline.describe().split('|').length).assertEqual(5);
      expect(rows[4].describe().split('|')[4]).assertEqual(URL_TASK_C);
    });

    /**
     * @tc.name   matrixOrderFollowsTaskNumbers
     * @tc.desc   Building rows from TASK_NUMBERS preserves the A, B, C order of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixOrderFollowsTaskNumbers', 0, () => {
      const matrix: DownloadConfig[] = [];
      for (let index = 0; index < TASK_NUMBERS.length; index++) {
        matrix.push(DownloadConfig.forTask(TASK_NUMBERS[index]));
      }
      expect(matrix.length).assertEqual(3);
      expect(matrix[0].url).assertEqual(URL_TASK_A);
      expect(matrix[1].url).assertEqual(URL_TASK_B);
      expect(matrix[2].url).assertEqual(URL_TASK_C);
      expect(TASK_NUMBERS[0]).assertEqual(TASK_A);
      expect(matrix[0].sameAs(DownloadConfig.forTask(TASK_A))).assertTrue();
      expect(matrix[2].sameAs(DownloadConfig.forTask(TASK_C))).assertTrue();
    });

    /**
     * @tc.name   perTaskHostIsGitee
     * @tc.desc   All three task URLs point at the same gitee host used by the sample.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('perTaskHostIsGitee', 0, () => {
      const hosts: string[] = [hostOf(URL_TASK_A), hostOf(URL_TASK_B), hostOf(URL_TASK_C)];
      for (let index = 0; index < hosts.length; index++) {
        expect(hosts[index]).assertEqual('gitee.com');
        expect(hosts[index].indexOf('.')).assertLarger(0);
      }
      expect(hasDuplicateStrings(hosts)).assertTrue();
      expect(uniqueStrings(hosts).length).assertEqual(1);
      expect(hostOf('https://example.com/a.png')).assertEqual('example.com');
      expect(hosts[0] === hosts[2]).assertTrue();
    });

    /**
     * @tc.name   perTaskSchemeIsHttps
     * @tc.desc   The scheme column of the matrix is https for every task row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('perTaskSchemeIsHttps', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      for (let index = 0; index < urls.length; index++) {
        expect(schemeOf(urls[index])).assertEqual('https');
        expect(schemeOf(urls[index]).length).assertEqual(5);
        expect(urls[index].startsWith('https://')).assertTrue();
        expect(schemeOf(urls[index]) === 'http').assertFalse();
      }
      expect(schemeOf('http://example.com/a.png')).assertEqual('http');
      expect(schemeOf('gitee.com/a.png')).assertEqual('');
    });

    /**
     * @tc.name   matrixRowsHaveNoQueryStrings
     * @tc.desc   No task URL carries a query, so nothing has to be redacted from the configuration.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matrixRowsHaveNoQueryStrings', 0, () => {
      const configs: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C)
      ];
      for (let index = 0; index < configs.length; index++) {
        expect(hasQuery(configs[index].url)).assertFalse();
        expect(configs[index].url.indexOf('?')).assertEqual(-1);
        expect(queryOf(configs[index].url)).assertEqual('');
      }
      expect(hasQuery('https://example.com/a.png?token=1')).assertTrue();
      expect(queryOf('https://example.com/a.png?token=1')).assertEqual('?token=1');
      expect(configs[0].describe().indexOf('?')).assertEqual(-1);
    });

    /**
     * @tc.name   matrixDescribePrefixIsStable
     * @tc.desc   Every row serialises the same four leading option columns.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('matrixDescribePrefixIsStable', 0, () => {
      const configs: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        DownloadConfig.forTask(TASK_B),
        DownloadConfig.forTask(TASK_C),
        DownloadConfig.forUrl('https://example.com/other.bin')
      ];
      for (let index = 0; index < configs.length; index++) {
        expect(configs[index].describe().startsWith('DOWNLOAD|GET|true|./|')).assertTrue();
        expect(configs[index].describe().split('|').length).assertEqual(5);
        expect(configs[index].describe().split('|')[0]).assertEqual(CONFIG_ACTION_DOWNLOAD);
      }
      expect(configs[3].describe().split('|')[4]).assertEqual('https://example.com/other.bin');
      expect(configs[0].describe().length).assertLarger(configs[0].url.length);
    });

    /**
     * @tc.name   factoryMatrixStableAcrossCalls
     * @tc.desc   Rebuilding the matrix yields equal but distinct row objects.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('factoryMatrixStableAcrossCalls', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const second: DownloadConfig = DownloadConfig.forTask(TASK_A);
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(first)).assertTrue();
      expect(first === second).assertFalse();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.url).assertEqual(second.url);
      expect(first.fileName()).assertEqual(second.fileName());
      expect(first.isValid()).assertEqual(second.isValid());
    });

    /**
     * @tc.name   oracleMatrixStableAcrossCalls
     * @tc.desc   Rebuilding the oracle yields the same row and still matches the factory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oracleMatrixStableAcrossCalls', 0, () => {
      const first: DownloadConfig = expectedConfigFor(TASK_B);
      const second: DownloadConfig = expectedConfigFor(TASK_B);
      expect(first.sameAs(second)).assertTrue();
      expect(first === second).assertFalse();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.sameAs(DownloadConfig.forTask(TASK_B))).assertTrue();
      expect(second.sameAs(DownloadConfig.forTask(TASK_B))).assertTrue();
      expect(first.url).assertEqual(URL_TASK_B);
      expect(second.isValid()).assertTrue();
    });

    /**
     * @tc.name   invalidRowKeepsUrlAndFileName
     * @tc.desc   An invalid scheme does not disturb the URL tail or the derived download name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidRowKeepsUrlAndFileName', 0, () => {
      const baseline: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const row: DownloadConfig =
        new DownloadConfig('DOWNLOAD', 'ftp://example.com/media/after_cache.png', true, 'GET', './');
      expect(row.isValid()).assertFalse();
      expect(row.fileName()).assertEqual(baseline.fileName());
      expect(row.fileName()).assertEqual('after_cache.png');
      expect(row.url).assertEqual('ftp://example.com/media/after_cache.png');
      expect(row.describe().endsWith('after_cache.png')).assertTrue();
      expect(row.sameAs(baseline)).assertFalse();
      expect(row.clone().validate().length).assertEqual(1);
    });

    /**
     * @tc.name   mixedMatrixHasTwoValidRows
     * @tc.desc   Counting validity across a mixed matrix returns exactly the two production rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferConfiguration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mixedMatrixHasTwoValidRows', 0, () => {
      const matrix: DownloadConfig[] = [
        DownloadConfig.forTask(TASK_A),
        new DownloadConfig('UPLOAD', URL_TASK_B, true, 'GET', './'),
        DownloadConfig.forTask(TASK_C),
        new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', 'tmp'),
        new DownloadConfig('DOWNLOAD', '', true, 'GET', './')
      ];
      let validRows: number = 0;
      for (let index = 0; index < matrix.length; index++) {
        if (matrix[index].isValid()) {
          validRows = validRows + 1;
        }
      }
      expect(validRows).assertEqual(2);
      expect(matrix.length).assertEqual(5);
      expect(matrix[0].isValid()).assertTrue();
      expect(matrix[2].isValid()).assertTrue();
      expect(matrix[1].isValid()).assertFalse();
      expect(matrix[3].isValid()).assertFalse();
      expect(matrix[4].isValid()).assertFalse();
    });

  });
}
