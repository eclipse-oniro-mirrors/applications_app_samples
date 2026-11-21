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
 * ResourceSession suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-148  download() assembles action DOWNLOAD, overwrite true, method GET, saveas './'
 *   151-171  runTaskA / runTaskB / runTaskC pass the per-task URL into download()
 *   174-198  startAllTasks() reuses the same three configurations on every press
 *   571-646  DownloadConfig: factory, clone, validate, describe and sameAs
 *   648-659  expectedConfigFor is the independent oracle of the configuration block
 *
 * A session is the lifetime of one page instance: the user may press the start
 * button repeatedly, so the configuration built for a task number must not drift
 * between runs. The suite also proves that clone() is a real copy, that the
 * validation rules reject every unsupported field and that the factory and the
 * oracle agree for known and unknown task numbers.
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
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  DownloadConfig,
  expectedConfigFor,
  fileNameOf,
  isHttpsUrl,
  joined,
  sameStringArray,
  uniqueStrings,
  countOf,
  reversedCopy
} from '../Shared/SharedDriver';

const KNOWN_TASKS: string[] = [TASK_A, TASK_B, TASK_C];
const KNOWN_URLS: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];

export default function resourceSessionTest(): void {
  describe('ResourceSession', () => {
    beforeAll(() => {
      logSuite('ResourceSession', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ResourceSession', 'end');
    });

    /**
     * @tc.name   taskAConfigStableWithinSession
     * @tc.desc   Three lookups of task A in one session return the same description and URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskAConfigStableWithinSession', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const second: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const third: DownloadConfig = DownloadConfig.forTask(TASK_A);
      logStep('taskAConfigStableWithinSession', first.describe());
      expect(first.sameAs(second)).assertTrue();
      expect(second.sameAs(third)).assertTrue();
      expect(first.describe()).assertEqual(third.describe());
      expect(first.url).assertEqual(URL_TASK_A);
      expect(second.url).assertEqual(first.url);
      expect(first === second).assertFalse();
      expect(first.isValid()).assertTrue();
    });

    /**
     * @tc.name   taskBConfigStableWithinSession
     * @tc.desc   Task B keeps the after_cache drawable and the GET download preset on every lookup.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskBConfigStableWithinSession', 0, () => {
      const session: DownloadConfig[] = [];
      for (let index = 0; index < 4; index++) {
        session.push(DownloadConfig.forTask(TASK_B));
      }
      logStep('taskBConfigStableWithinSession', String(session.length));
      expect(session.length).assertEqual(4);
      expect(session[0].url).assertEqual(URL_TASK_B);
      expect(session[3].url).assertEqual(URL_TASK_B);
      expect(session[0].sameAs(session[3])).assertTrue();
      expect(session[1].describe()).assertEqual(session[2].describe());
      expect(session[0].fileName()).assertEqual('after_cache.png');
      expect(session[3].method).assertEqual(CONFIG_METHOD_GET);
    });

    /**
     * @tc.name   taskCConfigStableWithinSession
     * @tc.desc   Task C resolves icon_main_color.png and stays valid although it only runs after the gate opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCConfigStableWithinSession', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const later: DownloadConfig = DownloadConfig.forTask(TASK_C);
      logStep('taskCConfigStableWithinSession', first.describe());
      expect(first.url).assertEqual(URL_TASK_C);
      expect(later.url).assertEqual(URL_TASK_C);
      expect(first.sameAs(later)).assertTrue();
      expect(first.describe()).assertEqual(later.describe());
      expect(first.fileName()).assertEqual('icon_main_color.png');
      expect(first.validate().length).assertEqual(0);
      expect(first.url === URL_TASK_A).assertFalse();
      expect(later.url === URL_TASK_B).assertFalse();
    });

    /**
     * @tc.name   configForTaskAKeepsDownloadAction
     * @tc.desc   The factory stores the DOWNLOAD action, overwrite flag, GET method and cache save path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configForTaskAKeepsDownloadAction', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_A);
      logStep('configForTaskAKeepsDownloadAction', config.describe());
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(config.overwrite).assertTrue();
      expect(config.method).assertEqual('GET');
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(config.saveas).assertEqual('./');
      expect(config.validate().length).assertEqual(0);
    });

    /**
     * @tc.name   configForTaskBUsesGetMethod
     * @tc.desc   Task B shares the transport semantics of task A while carrying its own drawable URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configForTaskBUsesGetMethod', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B);
      logStep('configForTaskBUsesGetMethod', config.method);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.isValid()).assertTrue();
      expect(config.url).assertEqual(URL_TASK_B);
      expect(config.url === URL_TASK_A).assertFalse();
      expect(config.describe().indexOf('GET')).assertLarger(0);
      expect(config.describe().indexOf('./')).assertLarger(0);
      expect(config.method.length).assertEqual(3);
    });

    /**
     * @tc.name   configForTaskCKeepsCacheSaveas
     * @tc.desc   The save target of task C is the application cache directory encoded as './'.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configForTaskCKeepsCacheSaveas', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C);
      logStep('configForTaskCKeepsCacheSaveas', config.saveas);
      expect(config.saveas).assertEqual('./');
      expect(config.saveas.endsWith('/')).assertTrue();
      expect(config.saveas.length).assertEqual(2);
      expect(config.describe().endsWith(URL_TASK_C)).assertTrue();
      expect(config.describe().split('|').length).assertEqual(5);
      expect(config.describe().indexOf('|./|')).assertLarger(0);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   unknownTaskConfigHasEmptyUrl
     * @tc.desc   An unknown task number keeps the download preset but leaves the URL empty and invalid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskConfigHasEmptyUrl', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('D');
      logStep('unknownTaskConfigHasEmptyUrl', config.describe());
      expect(config.url).assertEqual('');
      expect(config.url.length).assertEqual(0);
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('./');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('file');
    });

    /**
     * @tc.name   unknownTaskConfigReportsBothUrlErrors
     * @tc.desc   Validation of an empty URL reports the empty rule and the https rule in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskConfigReportsBothUrlErrors', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask('');
      const errors: string[] = config.validate();
      logStep('unknownTaskConfigReportsBothUrlErrors', joined(errors, ','));
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(joined(errors, ',')).assertEqual('url-empty,url-not-https');
      expect(countOf(errors, 'url-empty')).assertEqual(1);
      expect(errors.indexOf('url-not-https')).assertEqual(1);
      expect(config.isValid()).assertFalse();
      expect(isHttpsUrl(config.url)).assertFalse();
    });

    /**
     * @tc.name   unknownTaskConfigDescribeIsStable
     * @tc.desc   Two unknown task numbers produce the same preset description with an empty trailing URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskConfigDescribeIsStable', 0, () => {
      const named: DownloadConfig = DownloadConfig.forTask('D');
      const blank: DownloadConfig = DownloadConfig.forTask('');
      logStep('unknownTaskConfigDescribeIsStable', named.describe());
      expect(named.describe()).assertEqual(blank.describe());
      expect(named.sameAs(blank)).assertTrue();
      expect(named.describe().endsWith('|./|')).assertTrue();
      expect(named.describe().indexOf('|./|')).assertLarger(0);
      expect(named.describe().length).assertEqual(21);
      expect(blank.describe()).assertEqual('DOWNLOAD|GET|true|./|');
      expect(named.describe().indexOf('http')).assertLess(0);
    });

    /**
     * @tc.name   configForUrlKeepsDownloadSemantics
     * @tc.desc   The URL factory applies the same preset as the task factory and accepts empty input.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configForUrlKeepsDownloadSemantics', 0, () => {
      const fromUrl: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      const fromTask: DownloadConfig = DownloadConfig.forTask(TASK_A);
      logStep('configForUrlKeepsDownloadSemantics', fromUrl.describe());
      expect(fromUrl.sameAs(fromTask)).assertTrue();
      expect(fromUrl.action).assertEqual('DOWNLOAD');
      expect(fromUrl.method).assertEqual('GET');
      expect(fromUrl.overwrite).assertTrue();
      expect(fromUrl.saveas).assertEqual('./');
      expect(fromUrl.isValid()).assertTrue();
      expect(DownloadConfig.forUrl('').isValid()).assertFalse();
      expect(DownloadConfig.forUrl('').fileName()).assertEqual('file');
    });

    /**
     * @tc.name   cloneOfTaskAConfigIsEqualButDistinct
     * @tc.desc   A clone of the task A configuration is value-equal to its source but a separate object.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneOfTaskAConfigIsEqualButDistinct', 0, () => {
      const source: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const copy: DownloadConfig = source.clone();
      logStep('cloneOfTaskAConfigIsEqualButDistinct', copy.describe());
      expect(copy.sameAs(source)).assertTrue();
      expect(source.sameAs(copy)).assertTrue();
      expect(copy === source).assertFalse();
      expect(copy.describe()).assertEqual(source.describe());
      expect(copy.url).assertEqual(source.url);
      expect(copy.fileName()).assertEqual(source.fileName());
      expect(copy.isValid()).assertTrue();
      expect(copy.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
    });

    /**
     * @tc.name   cloneMethodEditLeavesOriginalGet
     * @tc.desc   Switching the clone to POST leaves the source on GET and both stay independently valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneMethodEditLeavesOriginalGet', 0, () => {
      const source: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const copy: DownloadConfig = source.clone();
      copy.method = 'POST';
      logStep('cloneMethodEditLeavesOriginalGet', copy.describe());
      expect(source.method).assertEqual('GET');
      expect(copy.method).assertEqual('POST');
      expect(copy.sameAs(source)).assertFalse();
      expect(copy.isValid()).assertTrue();
      expect(source.isValid()).assertTrue();
      expect(copy.describe().indexOf('|POST|')).assertLarger(0);
      expect(source.describe().indexOf('|GET|')).assertLarger(0);
      expect(copy.url).assertEqual(URL_TASK_B);
    });

    /**
     * @tc.name   cloneOverwriteEditInvalidatesOnlyClone
     * @tc.desc   Clearing overwrite on the clone adds the overwrite rule while the source keeps its preset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneOverwriteEditInvalidatesOnlyClone', 0, () => {
      const source: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const copy: DownloadConfig = source.clone();
      copy.overwrite = false;
      const errors: string[] = copy.validate();
      logStep('cloneOverwriteEditInvalidatesOnlyClone', joined(errors, ','));
      expect(source.overwrite).assertTrue();
      expect(copy.overwrite).assertFalse();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('overwrite-disabled');
      expect(copy.isValid()).assertFalse();
      expect(source.isValid()).assertTrue();
      expect(copy.sameAs(source)).assertFalse();
      expect(countOf(errors, 'overwrite-disabled')).assertEqual(1);
    });

    /**
     * @tc.name   cloneSaveasEditReportsCacheError
     * @tc.desc   A custom save directory on the clone is rejected as saveas-not-cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneSaveasEditReportsCacheError', 0, () => {
      const source: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const copy: DownloadConfig = source.clone();
      copy.saveas = '/data/storage/el2/base/cache/';
      logStep('cloneSaveasEditReportsCacheError', copy.saveas);
      expect(source.saveas).assertEqual('./');
      expect(copy.saveas).assertEqual('/data/storage/el2/base/cache/');
      expect(copy.validate().length).assertEqual(1);
      expect(copy.validate()[0]).assertEqual('saveas-not-cache');
      expect(copy.isValid()).assertFalse();
      expect(source.isValid()).assertTrue();
      expect(copy.describe().indexOf('/data/')).assertLarger(0);
      expect(source.describe().indexOf('/data/')).assertLess(0);
    });

    /**
     * @tc.name   cloneUrlEditRepointsOnlyClone
     * @tc.desc   Replacing the URL of a clone does not repoint the source configuration.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cloneUrlEditRepointsOnlyClone', 0, () => {
      const source: DownloadConfig = DownloadConfig.forTask(TASK_A);
      const copy: DownloadConfig = source.clone();
      copy.url = URL_TASK_B;
      logStep('cloneUrlEditRepointsOnlyClone', copy.fileName());
      expect(source.url).assertEqual(URL_TASK_A);
      expect(copy.url).assertEqual(URL_TASK_B);
      expect(source.fileName()).assertEqual('favor_list_tea.png');
      expect(copy.fileName()).assertEqual('after_cache.png');
      expect(copy.sameAs(source)).assertFalse();
      expect(copy.isValid()).assertTrue();
      expect(copy.describe().endsWith('after_cache.png')).assertTrue();
      expect(source.describe().endsWith('favor_list_tea.png')).assertTrue();
    });

    /**
     * @tc.name   cloneActionEditReportsDownloadError
     * @tc.desc   An action other than DOWNLOAD is rejected with a single action-not-download error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneActionEditReportsDownloadError', 0, () => {
      const source: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const copy: DownloadConfig = source.clone();
      copy.action = 'UPLOAD';
      const errors: string[] = copy.validate();
      logStep('cloneActionEditReportsDownloadError', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('action-not-download');
      expect(errors.indexOf('url-not-https')).assertLess(0);
      expect(copy.action).assertEqual('UPLOAD');
      expect(source.action).assertEqual('DOWNLOAD');
      expect(copy.isValid()).assertFalse();
      expect(source.isValid()).assertTrue();
      expect(copy.sameAs(source)).assertFalse();
    });

    /**
     * @tc.name   sameAsDetectsUrlDifference
     * @tc.desc   sameAs compares the full description, so two presets that differ only by URL are not equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameAsDetectsUrlDifference', 0, () => {
      const first: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', './');
      const second: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', './');
      logStep('sameAsDetectsUrlDifference', second.fileName());
      expect(first.sameAs(second)).assertFalse();
      expect(second.sameAs(first)).assertFalse();
      expect(first.sameAs(first.clone())).assertTrue();
      expect(first.describe() === second.describe()).assertFalse();
      expect(first.describe().substring(0, 18)).assertEqual(second.describe().substring(0, 18));
      expect(first.url).assertEqual(URL_TASK_A);
      expect(second.url).assertEqual(URL_TASK_B);
      expect(first.isValid() && second.isValid()).assertTrue();
    });

    /**
     * @tc.name   sameAsDetectsMethodDifference
     * @tc.desc   POST and GET presets over the same drawable are distinct even though both are valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameAsDetectsMethodDifference', 0, () => {
      const get: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      const post: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'POST', './');
      logStep('sameAsDetectsMethodDifference', post.method);
      expect(get.sameAs(post)).assertFalse();
      expect(post.sameAs(get)).assertFalse();
      expect(get.method).assertEqual('GET');
      expect(post.method).assertEqual('POST');
      expect(get.isValid()).assertTrue();
      expect(post.isValid()).assertTrue();
      expect(get.url).assertEqual(post.url);
      expect(get.describe() === post.describe()).assertFalse();
      expect(get.clone().sameAs(get)).assertTrue();
    });

    /**
     * @tc.name   sameAsDetectsFlagAndSaveasDifference
     * @tc.desc   The overwrite flag and the save path both participate in value equality.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameAsDetectsFlagAndSaveasDifference', 0, () => {
      const preset: DownloadConfig = DownloadConfig.forUrl(URL_TASK_C);
      const noOverwrite: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, false, 'GET', './');
      const otherSaveas: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'GET', './cache');
      logStep('sameAsDetectsFlagAndSaveasDifference', String(noOverwrite.overwrite) + '/' + otherSaveas.saveas);
      expect(preset.sameAs(noOverwrite)).assertFalse();
      expect(preset.sameAs(otherSaveas)).assertFalse();
      expect(noOverwrite.overwrite).assertFalse();
      expect(otherSaveas.overwrite).assertTrue();
      expect(otherSaveas.saveas).assertEqual('./cache');
      expect(preset.saveas).assertEqual('./');
      expect(preset.isValid()).assertTrue();
      expect(noOverwrite.isValid()).assertFalse();
      expect(otherSaveas.isValid()).assertFalse();
    });

    /**
     * @tc.name   expectedConfigMatchesFactoryForEachTask
     * @tc.desc   The independent oracle reproduces the factory output for A, B and C without sharing code paths.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedConfigMatchesFactoryForEachTask', 0, () => {
      const descriptions: string[] = [];
      for (let index = 0; index < KNOWN_TASKS.length; index++) {
        const oracle: DownloadConfig = expectedConfigFor(KNOWN_TASKS[index]);
        const factory: DownloadConfig = DownloadConfig.forTask(KNOWN_TASKS[index]);
        descriptions.push(oracle.describe());
        expect(oracle.sameAs(factory)).assertTrue();
        expect(oracle.url).assertEqual(KNOWN_URLS[index]);
        expect(oracle.action).assertEqual('DOWNLOAD');
        expect(oracle.method).assertEqual('GET');
        expect(oracle.saveas).assertEqual('./');
      }
      logStep('expectedConfigMatchesFactoryForEachTask', String(descriptions.length));
      expect(descriptions.length).assertEqual(3);
      expect(uniqueStrings(descriptions).length).assertEqual(3);
      expect(sameStringArray(descriptions, [DownloadConfig.forTask(TASK_A).describe(),
        DownloadConfig.forTask(TASK_B).describe(), DownloadConfig.forTask(TASK_C).describe()])).assertTrue();
    });

    /**
     * @tc.name   expectedConfigFallbackForUnknownTask
     * @tc.desc   The oracle falls back to an empty URL for an unknown task and still mirrors the factory preset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedConfigFallbackForUnknownTask', 0, () => {
      const oracle: DownloadConfig = expectedConfigFor('D');
      const factory: DownloadConfig = DownloadConfig.forTask('D');
      logStep('expectedConfigFallbackForUnknownTask', oracle.describe());
      expect(oracle.url).assertEqual('');
      expect(oracle.sameAs(factory)).assertTrue();
      expect(oracle.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(oracle.isValid()).assertFalse();
      expect(oracle.validate().length).assertEqual(2);
      expect(oracle.fileName()).assertEqual('file');
      expect(expectedConfigFor('Z').url).assertEqual('');
      expect(expectedConfigFor('Z').sameAs(oracle)).assertTrue();
    });

    /**
     * @tc.name   postMethodIsAcceptedByValidation
     * @tc.desc   The download spec allows GET and POST, so a POST configuration passes validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('postMethodIsAcceptedByValidation', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'POST', './');
      logStep('postMethodIsAcceptedByValidation', config.method);
      expect(config.method).assertEqual('POST');
      expect(config.validate().length).assertEqual(0);
      expect(config.validate().indexOf('method-unsupported')).assertLess(0);
      expect(config.isValid()).assertTrue();
      expect(config.url).assertEqual(URL_TASK_B);
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(config.describe().indexOf('POST')).assertLarger(0);
      expect(config.clone().sameAs(config)).assertTrue();
    });

    /**
     * @tc.name   putMethodIsRejectedByValidation
     * @tc.desc   A PUT method falls outside the download contract and yields method-unsupported alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('putMethodIsRejectedByValidation', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'PUT', './');
      const errors: string[] = config.validate();
      logStep('putMethodIsRejectedByValidation', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('method-unsupported');
      expect(errors.indexOf('url-not-https')).assertLess(0);
      expect(config.isValid()).assertFalse();
      expect(config.method).assertEqual('PUT');
      expect(config.url).assertEqual(URL_TASK_C);
      expect(config.sameAs(DownloadConfig.forTask(TASK_C))).assertFalse();
      expect(countOf(errors, 'method-unsupported')).assertEqual(1);
    });

    /**
     * @tc.name   validationRejectsHttpSourceUrl
     * @tc.desc   A plain-http source is rejected only by the https rule because the URL is not empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validationRejectsHttpSourceUrl', 0, () => {
      const httpUrl: string = 'http://gitee.com/chenhaiwen2/media/after_cache.png';
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', httpUrl, true, 'GET', './');
      const errors: string[] = config.validate();
      logStep('validationRejectsHttpSourceUrl', joined(errors, ','));
      expect(httpUrl.startsWith('http://')).assertTrue();
      expect(isHttpsUrl(httpUrl)).assertFalse();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(errors.indexOf('url-empty')).assertLess(0);
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(config.url).assertEqual(httpUrl);
    });

    /**
     * @tc.name   validationRejectsUppercaseHttpsSource
     * @tc.desc   The https guard is a case sensitive prefix test, so an upper case scheme is rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationRejectsUppercaseHttpsSource', 0, () => {
      const upper: string = 'HTTPS://GITEE.COM/CHENHAIWEN2/MEDIA/ICON_MAIN_COLOR.PNG';
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', upper, true, 'GET', './');
      logStep('validationRejectsUppercaseHttpsSource', config.url.substring(0, 8));
      expect(isHttpsUrl(upper)).assertFalse();
      expect(upper.startsWith('https://')).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('ICON_MAIN_COLOR.PNG');
      expect(config.url.indexOf('://')).assertEqual(5);
      expect(config.method).assertEqual('GET');
    });

    /**
     * @tc.name   trailingSlashSourceKeepsConfigValidButLosesFileName
     * @tc.desc   A directory-like URL still passes the https rule while its file name falls back to the default.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingSlashSourceKeepsConfigValidButLosesFileName', 0, () => {
      const directory: string = URL_TASK_C + '/';
      const config: DownloadConfig = DownloadConfig.forUrl(directory);
      logStep('trailingSlashSourceKeepsConfigValidButLosesFileName', config.fileName());
      expect(directory.endsWith('/')).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('file');
      expect(fileNameOf(directory, 'saved.png')).assertEqual('saved.png');
      expect(config.url.length).assertEqual(URL_TASK_C.length + 1);
      expect(config.url.endsWith('icon_main_color.png/')).assertTrue();
      expect(config.describe().endsWith('/')).assertTrue();
    });

    /**
     * @tc.name   configDescribeEncodesFiveFields
     * @tc.desc   describe() serialises action, method, overwrite flag, save path and URL in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configDescribeEncodesFiveFields', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B);
      const fields: string[] = config.describe().split('|');
      logStep('configDescribeEncodesFiveFields', String(fields.length));
      expect(fields.length).assertEqual(5);
      expect(fields[0]).assertEqual('DOWNLOAD');
      expect(fields[1]).assertEqual('GET');
      expect(fields[2]).assertEqual('true');
      expect(fields[3]).assertEqual('./');
      expect(fields[4]).assertEqual(URL_TASK_B);
      expect(joined([config.action, config.method, String(config.overwrite), config.saveas, config.url], '|'))
        .assertEqual(config.describe());
      expect(fields[2] === String(config.overwrite)).assertTrue();
    });

    /**
     * @tc.name   configFileNameMatchesDrawable
     * @tc.desc   Every task configuration exposes the exact drawable name used by its URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configFileNameMatchesDrawable', 0, () => {
      const expectedNames: string[] = ['favor_list_tea.png', 'after_cache.png', 'icon_main_color.png'];
      const actualNames: string[] = [];
      for (let index = 0; index < KNOWN_TASKS.length; index++) {
        const config: DownloadConfig = DownloadConfig.forTask(KNOWN_TASKS[index]);
        const name: string = config.fileName();
        actualNames.push(name);
        expect(name).assertEqual(expectedNames[index]);
        expect(name.endsWith('.png')).assertTrue();
        expect(config.url.endsWith(name)).assertTrue();
        expect(name.indexOf('/')).assertLess(0);
      }
      logStep('configFileNameMatchesDrawable', joined(actualNames, ','));
      expect(sameStringArray(actualNames, expectedNames)).assertTrue();
      expect(uniqueStrings(actualNames).length).assertEqual(3);
      expect(countOf(actualNames, 'after_cache.png')).assertEqual(1);
    });

    /**
     * @tc.name   sessionReuseKeepsThreeRunsStable
     * @tc.desc   Simulating three button presses rebuilds the same three configurations on every run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sessionReuseKeepsThreeRunsStable', 0, () => {
      const firstRun: string[] = [];
      for (let index = 0; index < KNOWN_TASKS.length; index++) {
        firstRun.push(DownloadConfig.forTask(KNOWN_TASKS[index]).describe());
      }
      let stable: number = 0;
      for (let run: number = 0; run < 3; run++) {
        const runDescriptions: string[] = [];
        for (let index = 0; index < KNOWN_TASKS.length; index++) {
          runDescriptions.push(DownloadConfig.forTask(KNOWN_TASKS[index]).describe());
        }
        if (sameStringArray(firstRun, runDescriptions)) {
          stable = stable + 1;
        }
      }
      logStep('sessionReuseKeepsThreeRunsStable', String(stable));
      expect(stable).assertEqual(3);
      expect(firstRun.length).assertEqual(3);
      expect(uniqueStrings(firstRun).length).assertEqual(3);
      expect(firstRun[0].indexOf('favor_list_tea.png')).assertLarger(0);
      expect(firstRun[1].indexOf('after_cache.png')).assertLarger(0);
      expect(firstRun[2].indexOf('icon_main_color.png')).assertLarger(0);
      expect(firstRun[0] === firstRun[1]).assertFalse();
    });

    /**
     * @tc.name   allTaskConfigsAreDistinctWithinSession
     * @tc.desc   No two task numbers collapse onto the same configuration inside one session.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('allTaskConfigsAreDistinctWithinSession', 0, () => {
      const configs: DownloadConfig[] = [];
      for (let index = 0; index < KNOWN_TASKS.length; index++) {
        configs.push(DownloadConfig.forTask(KNOWN_TASKS[index]));
      }
      logStep('allTaskConfigsAreDistinctWithinSession', String(configs.length));
      expect(configs[0].sameAs(configs[1])).assertFalse();
      expect(configs[0].sameAs(configs[2])).assertFalse();
      expect(configs[1].sameAs(configs[2])).assertFalse();
      expect(configs[0].url === configs[1].url).assertFalse();
      expect(configs[1].url === configs[2].url).assertFalse();
      expect(uniqueStrings([configs[0].url, configs[1].url, configs[2].url]).length).assertEqual(3);
      expect(configs[0].action).assertEqual(configs[2].action);
      expect(configs[0].saveas).assertEqual(configs[1].saveas);
    });

    /**
     * @tc.name   cloneChainStaysStableAcrossGenerations
     * @tc.desc   Three successive clones keep the same value until the newest one is edited.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneChainStaysStableAcrossGenerations', 0, () => {
      const first: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const second: DownloadConfig = first.clone();
      const third: DownloadConfig = second.clone();
      logStep('cloneChainStaysStableAcrossGenerations', third.describe());
      expect(second.sameAs(first)).assertTrue();
      expect(third.sameAs(second)).assertTrue();
      expect(third.sameAs(first)).assertTrue();
      third.url = URL_TASK_A;
      expect(second.url).assertEqual(URL_TASK_C);
      expect(first.url).assertEqual(URL_TASK_C);
      expect(third.sameAs(first)).assertFalse();
      expect(third.fileName()).assertEqual('favor_list_tea.png');
    });

    /**
     * @tc.name   cloneOfUnknownConfigKeepsInvalidState
     * @tc.desc   Cloning the fallback configuration copies its empty URL and its two validation errors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneOfUnknownConfigKeepsInvalidState', 0, () => {
      const source: DownloadConfig = DownloadConfig.forTask('D');
      const copy: DownloadConfig = source.clone();
      logStep('cloneOfUnknownConfigKeepsInvalidState', joined(copy.validate(), ','));
      expect(copy.sameAs(source)).assertTrue();
      expect(copy.url).assertEqual('');
      expect(copy.isValid()).assertFalse();
      expect(copy.validate().length).assertEqual(2);
      expect(copy.validate()[0]).assertEqual('url-empty');
      expect(copy.fileName()).assertEqual('file');
      expect(copy.describe()).assertEqual(source.describe());
      expect(copy === source).assertFalse();
    });

    /**
     * @tc.name   configValidationListsErrorsInPageOrder
     * @tc.desc   A configuration that breaks every rule reports five errors in the order of the validation block.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configValidationListsErrorsInPageOrder', 0, () => {
      const broken: DownloadConfig = new DownloadConfig('UPLOAD', 'ftp://gitee.com/media/icon.png', false, 'PUT', './cache');
      const errors: string[] = broken.validate();
      logStep('configValidationListsErrorsInPageOrder', joined(errors, ','));
      expect(errors.length).assertEqual(5);
      expect(errors[0]).assertEqual('url-not-https');
      expect(errors[1]).assertEqual('action-not-download');
      expect(errors[2]).assertEqual('method-unsupported');
      expect(errors[3]).assertEqual('overwrite-disabled');
      expect(errors[4]).assertEqual('saveas-not-cache');
      expect(joined(errors, ',')).assertEqual('url-not-https,action-not-download,method-unsupported,overwrite-disabled,saveas-not-cache');
      expect(broken.isValid()).assertFalse();
    });

    /**
     * @tc.name   emptySaveasIsRejected
     * @tc.desc   An empty save path is not the cache preset and therefore fails with saveas-not-cache only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptySaveasIsRejected', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', '');
      const errors: string[] = config.validate();
      logStep('emptySaveasIsRejected', joined(errors, ','));
      expect(config.saveas).assertEqual('');
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('saveas-not-cache');
      expect(config.isValid()).assertFalse();
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.fileName()).assertEqual('favor_list_tea.png');
      expect(config.describe().endsWith('|' + URL_TASK_A)).assertTrue();
      expect(DownloadConfig.forTask(TASK_A).isValid()).assertTrue();
    });

    /**
     * @tc.name   invalidFieldMatrixNeverPassesValidation
     * @tc.desc   Each single-field deviation from the preset is rejected while the untouched preset stays valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidFieldMatrixNeverPassesValidation', 0, () => {
      const valid: DownloadConfig = DownloadConfig.forUrl(URL_TASK_B);
      const matrix: DownloadConfig[] = [
        new DownloadConfig('DOWNLOAD', '', true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', 'http://gitee.com/media/after_cache.png', true, 'GET', './'),
        new DownloadConfig('UPLOAD', URL_TASK_B, true, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'DELETE', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, false, 'GET', './'),
        new DownloadConfig('DOWNLOAD', URL_TASK_B, true, 'GET', 'cache')
      ];
      let rejected: number = 0;
      for (let index = 0; index < matrix.length; index++) {
        if (!matrix[index].isValid()) {
          rejected = rejected + 1;
        }
        expect(matrix[index].validate().length).assertLarger(0);
        expect(matrix[index].sameAs(valid)).assertFalse();
      }
      logStep('invalidFieldMatrixNeverPassesValidation', String(rejected));
      expect(rejected).assertEqual(6);
      expect(matrix.length).assertEqual(6);
      expect(valid.isValid()).assertTrue();
      expect(valid.validate().length).assertEqual(0);
      expect(matrix[0].validate()[0]).assertEqual('url-empty');
      expect(matrix[5].validate()[0]).assertEqual('saveas-not-cache');
    });

    /**
     * @tc.name   taskConfigLookupOrderDoesNotMatter
     * @tc.desc   Resolving tasks in a different order inside the session yields the same three configurations.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskConfigLookupOrderDoesNotMatter', 0, () => {
      const forward: string[] = [];
      const backward: string[] = [];
      for (let index = 0; index < KNOWN_TASKS.length; index++) {
        forward.push(DownloadConfig.forTask(KNOWN_TASKS[index]).describe());
        backward.push(DownloadConfig.forTask(KNOWN_TASKS[KNOWN_TASKS.length - 1 - index]).describe());
      }
      logStep('taskConfigLookupOrderDoesNotMatter', joined(backward, ';'));
      expect(backward[0]).assertEqual(forward[2]);
      expect(backward[2]).assertEqual(forward[0]);
      expect(backward[1]).assertEqual(forward[1]);
      expect(backward[0].indexOf('icon_main_color.png')).assertLarger(0);
      expect(backward[2].indexOf('favor_list_tea.png')).assertLarger(0);
      expect(uniqueStrings(backward).length).assertEqual(3);
      expect(sameStringArray(backward, reversedCopy(forward))).assertTrue();
      expect(backward.length).assertEqual(3);
    });

    /**
     * @tc.name   presetSaveasTargetsTheRelativeCacheRoot
     * @tc.desc   The preset save path is the two character relative root instead of an absolute application path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceSession scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('presetSaveasTargetsTheRelativeCacheRoot', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_B);
      logStep('presetSaveasTargetsTheRelativeCacheRoot', config.saveas);
      expect(config.saveas).assertEqual('./');
      expect(config.saveas.startsWith('./')).assertTrue();
      expect(config.saveas.startsWith('/')).assertFalse();
      expect(config.saveas.indexOf('cache')).assertLess(0);
      expect(config.saveas.length).assertEqual(2);
      expect(config.describe().indexOf('|./|')).assertLarger(0);
      expect(config.clone().saveas).assertEqual(config.saveas);
    });
  });
}
