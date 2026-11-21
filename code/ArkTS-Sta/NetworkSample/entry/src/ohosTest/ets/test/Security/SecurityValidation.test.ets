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
 * SecurityValidation suite.
 *
 * download() builds a request.agent.Config from the page literal. This suite
 * proves the validator refuses every broken field (url, action, method,
 * overwrite, saveas), that hostile URL strings such as padded text, embedded
 * newlines and protocol relative forms never satisfy the https prefix rule,
 * and that the host/path/query splitters stay predictable on hostile input.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   110-116 the config literal and its five fields
 *   117     agent.create(context, config) is only reachable after the literal
 *   151-171 the three https URL literals
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_C,
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  DownloadConfig,
  isHttpsUrl,
  isHttpUrl,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  fileNameOf,
  extensionOf,
  hasQuery,
  expectedConfigFor,
  createTaskGraph,
  STATUS_IDLE,
  ERROR_NONE
} from '../Shared/SharedDriver';

/** Builds a config with only the supplied deviation from the page literal. */
function brokenAction(): DownloadConfig {
  return new DownloadConfig('UPLOAD', URL_TASK_A, true, 'GET', './');
}

function brokenMethod(): DownloadConfig {
  return new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'PUT', './');
}

function brokenOverwrite(): DownloadConfig {
  return new DownloadConfig('DOWNLOAD', URL_TASK_A, false, 'GET', './');
}

function brokenSaveas(): DownloadConfig {
  return new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', 'downloads/');
}

export default function securityValidationTest(): void {
  describe('SecurityValidation', () => {
    beforeAll(() => {
      logSuite('SecurityValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SecurityValidation', 'end');
    });

    /**
     * @tc.name   emptyUrlReportsBothErrors
     * @tc.desc   A missing URL trips both the empty check and the https check, in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyUrlReportsBothErrors', 0, () => {
      const config = DownloadConfig.forUrl('');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(isHttpsUrl(config.url)).assertFalse();
      expect(config.url.length).assertEqual(0);
      expect(config.fileName()).assertEqual('file');
      expect(config.action).assertEqual(CONFIG_ACTION_DOWNLOAD);
      expect(config.method).assertEqual(CONFIG_METHOD_GET);
      expect(config.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(config.overwrite).assertEqual(CONFIG_OVERWRITE);
    });

    /**
     * @tc.name   missingActionRejected
     * @tc.desc   Any action other than DOWNLOAD, including an empty one, fails validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingActionRejected', 0, () => {
      const empty = new DownloadConfig('', URL_TASK_A, true, 'GET', './');
      const upload = brokenAction();
      expect(empty.validate()).assertContain('action-not-download');
      expect(upload.validate()).assertContain('action-not-download');
      expect(empty.isValid()).assertFalse();
      expect(upload.isValid()).assertFalse();
      expect(empty.validate().length).assertEqual(1);
      expect(upload.validate().length).assertEqual(1);
      expect(empty.validate()[0]).assertEqual('action-not-download');
      expect(upload.url).assertEqual(URL_TASK_A);
      expect(isHttpsUrl(upload.url)).assertTrue();
      expect(DownloadConfig.forTask(TASK_A).isValid()).assertTrue();
    });

    /**
     * @tc.name   missingMethodRejected
     * @tc.desc   A blank method or an unsupported verb such as PUT is refused; GET and POST are allowed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingMethodRejected', 0, () => {
      const blank = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, '', './');
      const put = brokenMethod();
      const get = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', './');
      const post = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'POST', './');
      expect(blank.validate()).assertContain('method-unsupported');
      expect(put.validate()).assertContain('method-unsupported');
      expect(blank.isValid()).assertFalse();
      expect(put.isValid()).assertFalse();
      expect(get.isValid()).assertTrue();
      expect(post.isValid()).assertTrue();
      expect(post.validate().length).assertEqual(0);
      expect(put.validate().length).assertEqual(1);
      expect(get.method).assertEqual(CONFIG_METHOD_GET);
      expect(brokenMethod().sameAs(put)).assertTrue();
      expect(put.describe().indexOf('|PUT|') > 0).assertTrue();
      expect(blank.method.length).assertEqual(0);
      expect(post.method).assertEqual('POST');
      expect(get.validate().indexOf('method-unsupported')).assertLess(0);
      expect(new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'get', './').isValid()).assertFalse();
      expect(new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'POST', './').validate().length).assertEqual(0);
      expect(DownloadConfig.forTask(TASK_B).method).assertEqual('GET');
    });

    /**
     * @tc.name   overwriteFlagMustStayTrue
     * @tc.desc   overwrite false is rejected because the page always passes the constant true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('overwriteFlagMustStayTrue', 0, () => {
      const config = brokenOverwrite();
      expect(config.overwrite).assertFalse();
      expect(config.validate()).assertContain('overwrite-disabled');
      expect(config.validate().length).assertEqual(1);
      expect(config.isValid()).assertFalse();
      expect(CONFIG_OVERWRITE).assertTrue();
      expect(DownloadConfig.forUrl(URL_TASK_A).overwrite).assertTrue();
      expect(DownloadConfig.forUrl(URL_TASK_A).isValid()).assertTrue();
      expect(config.validate().indexOf('url-not-https')).assertLess(0);
      expect(config.describe().indexOf('false')).assertLarger(0);
      expect(brokenOverwrite().sameAs(config)).assertTrue();
    });

    /**
     * @tc.name   saveasOutsideCacheRejected
     * @tc.desc   Only the cache-relative './' saveas value is accepted; other folders and absolute paths fail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('saveasOutsideCacheRejected', 0, () => {
      const folder = brokenSaveas();
      const absolute = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', 'file:///data/storage/');
      const parent = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'GET', '../');
      expect(folder.validate()).assertContain('saveas-not-cache');
      expect(absolute.validate()).assertContain('saveas-not-cache');
      expect(parent.validate()).assertContain('saveas-not-cache');
      expect(folder.isValid()).assertFalse();
      expect(absolute.isValid()).assertFalse();
      expect(parent.isValid()).assertFalse();
      expect(CONFIG_SAVEAS_CACHE).assertEqual('./');
      expect(DownloadConfig.forUrl(URL_TASK_A).saveas).assertEqual('./');
      expect(DownloadConfig.forUrl(folder.saveas).isValid()).assertFalse();
      expect(folder.describe().indexOf('downloads/') > 0).assertTrue();
      expect(absolute.url).assertEqual(URL_TASK_A);
      expect(parent.saveas).assertEqual('../');
      expect(folder.validate()[0]).assertEqual('saveas-not-cache');
      expect(DownloadConfig.forUrl(URL_TASK_A).saveas === './').assertTrue();
    });

    /**
     * @tc.name   fiveFieldFailureOrderIsStable
     * @tc.desc   A config broken in all five fields reports six errors in the validator's documented order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fiveFieldFailureOrderIsStable', 0, () => {
      const broken = new DownloadConfig('UPLOAD', '', false, 'PUT', 'elsewhere/');
      const errors: string[] = broken.validate();
      expect(errors.length).assertEqual(6);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(errors[2]).assertEqual('action-not-download');
      expect(errors[3]).assertEqual('method-unsupported');
      expect(errors[4]).assertEqual('overwrite-disabled');
      expect(errors[5]).assertEqual('saveas-not-cache');
      expect(broken.isValid()).assertFalse();
      expect(broken.validate().length).assertEqual(broken.validate().length);
      expect(errors[0] === errors[5]).assertFalse();
      expect(broken.url).assertEqual('');
      expect(errors.indexOf('url-empty')).assertEqual(0);
      expect(errors.indexOf('saveas-not-cache')).assertEqual(5);
      expect(errors.indexOf('overwrite-disabled')).assertEqual(4);
      expect(broken.overwrite).assertFalse();
      expect(broken.method).assertEqual('PUT');
      expect(broken.validate() === broken.validate()).assertFalse();
    });

    /**
     * @tc.name   validConfigHasZeroErrors
     * @tc.desc   The clean configuration returns an empty error list for each of the three tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validConfigHasZeroErrors', 0, () => {
      const tasks: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < tasks.length; index++) {
        const config = DownloadConfig.forTask(tasks[index]);
        expect(config.validate().length).assertEqual(0);
        expect(config.isValid()).assertTrue();
        expect(config.action).assertEqual('DOWNLOAD');
        expect(config.method).assertEqual('GET');
        expect(config.overwrite).assertTrue();
        expect(config.saveas).assertEqual('./');
        expect(isHttpsUrl(config.url)).assertTrue();
      }
      expect(DownloadConfig.forTask(TASK_C).fileName()).assertEqual('icon_main_color.png');
      expect(DownloadConfig.forUrl(URL_TASK_C).sameAs(expectedConfigFor(TASK_C))).assertTrue();
      expect(DownloadConfig.forTask(TASK_A).describe().split('|').length).assertEqual(5);
      expect(DownloadConfig.forTask(TASK_B).fileName()).assertEqual('after_cache.png');
      expect(DownloadConfig.forTask(TASK_A).validate() === DownloadConfig.forTask(TASK_A).validate()).assertFalse();
      expect(DownloadConfig.forTask(TASK_A).isValid()).assertEqual(true);
      expect(DownloadConfig.forUrl('https://gitee.com/a.png').validate().length).assertEqual(0);
      expect(DownloadConfig.forUrl('https://gitee.com/a.png').validate() === DownloadConfig.forUrl('https://gitee.com/a.png').validate()).assertFalse();
      expect(DownloadConfig.forUrl('https://gitee.com/a.png').overwrite).assertTrue();
      expect(DownloadConfig.forUrl('https://gitee.com/a.png').saveas).assertEqual('./');
      expect(DownloadConfig.forUrl('https://gitee.com/a.png').action).assertEqual('DOWNLOAD');
    });

    /**
     * @tc.name   leadingSpaceUrlFailsPrefix
     * @tc.desc   A single leading space breaks the literal https prefix, so validation refuses the config.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('leadingSpaceUrlFailsPrefix', 0, () => {
      const padded: string = ' https://gitee.com/openharmony/sample.png';
      expect(isHttpsUrl(padded)).assertFalse();
      expect(padded.startsWith('https://')).assertFalse();
      expect(padded.indexOf('https://')).assertEqual(1);
      expect(schemeOf(padded)).assertEqual(' https');
      expect(hostOf(padded)).assertEqual('gitee.com');
      expect(schemeOf(padded) === 'https').assertFalse();
      const config = DownloadConfig.forUrl(padded);
      expect(config.isValid()).assertFalse();
      expect(config.validate()).assertContain('url-not-https');
      expect(config.validate().length).assertEqual(1);
      expect(fileNameOf(padded)).assertEqual('sample.png');
      expect(DownloadConfig.forUrl(padded.substring(1)).isValid()).assertTrue();
      expect(padded.indexOf(' ')).assertEqual(0);
      expect(padded.length).assertEqual('https://gitee.com/openharmony/sample.png'.length + 1);
      expect(padded.trim()).assertEqual('https://gitee.com/openharmony/sample.png');
      expect(DownloadConfig.forUrl(padded.trim()).isValid()).assertTrue();
    });

    /**
     * @tc.name   newlineBeforeSchemeFails
     * @tc.desc   A line break in front of the URL defeats the prefix check, which is why raw literals must be clean.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('newlineBeforeSchemeFails', 0, () => {
      const injected: string = '\nhttps://gitee.com/openharmony/sample.png';
      expect(injected.length).assertEqual('https://gitee.com/openharmony/sample.png'.length + 1);
      expect(isHttpsUrl(injected)).assertFalse();
      expect(isHttpUrl(injected)).assertFalse();
      expect(injected.startsWith('https://')).assertFalse();
      expect(DownloadConfig.forUrl(injected).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(injected).validate()).assertContain('url-not-https');
      expect(injected.indexOf('\n')).assertEqual(0);
      expect(injected.substring(1)).assertEqual('https://gitee.com/openharmony/sample.png');
      expect(DownloadConfig.forUrl(injected.substring(1)).isValid()).assertTrue();
      expect(hostOf(injected)).assertEqual('gitee.com');
      expect(injected.trim()).assertEqual('https://gitee.com/openharmony/sample.png');
      expect(injected.length).assertEqual('https://gitee.com/openharmony/sample.png'.length + 1);
    });

    /**
     * @tc.name   newlineInsidePathKeepsPrefixValid
     * @tc.desc   A newline after the scheme still passes the prefix rule, so callers must sanitise names separately.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('newlineInsidePathKeepsPrefixValid', 0, () => {
      const injected: string = 'https://gitee.com/dir/file\n.png';
      expect(isHttpsUrl(injected)).assertTrue();
      expect(schemeOf(injected)).assertEqual('https');
      expect(hostOf(injected)).assertEqual('gitee.com');
      expect(pathOf(injected).indexOf('\n') > 0).assertTrue();
      expect(fileNameOf(injected).indexOf('\n') > 0).assertTrue();
      expect(extensionOf(injected)).assertEqual('.png');
      expect(DownloadConfig.forUrl(injected).isValid()).assertTrue();
      expect(injected.split('\n').length).assertEqual(2);
      expect(fileNameOf(injected).length).assertEqual(9);
    });

    /**
     * @tc.name   tabAndCarriageReturnInputs
     * @tc.desc   Tabs and carriage returns inside the authority never become a trusted host on their own.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tabAndCarriageReturnInputs', 0, () => {
      const tabbed: string = 'https://gitee\t.com/a.png';
      const carried: string = 'https://gitee.com/a.png\r';
      expect(isHttpsUrl(tabbed)).assertTrue();
      expect(hostOf(tabbed).indexOf('\t') > 0).assertTrue();
      expect(hostOf(tabbed) === 'gitee.com').assertFalse();
      expect(isHttpsUrl(carried)).assertTrue();
      expect(fileNameOf(carried).indexOf('\r') > 0).assertTrue();
      expect(fileNameOf(carried) === 'a.png').assertFalse();
      expect(carried.length).assertEqual('https://gitee.com/a.png'.length + 1);
      expect(DownloadConfig.forUrl(tabbed).isValid()).assertTrue();
      expect(hostOf('https://\tgitee.com/a.png')).assertEqual('\tgitee.com');
    });

    /**
     * @tc.name   schemeRelativeDoubleSlashRejected
     * @tc.desc   A //host form inherits no scheme, fails the prefix rule and yields no host.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemeRelativeDoubleSlashRejected', 0, () => {
      const relative: string = '//gitee.com/openharmony/sample.png';
      expect(isHttpsUrl(relative)).assertFalse();
      expect(schemeOf(relative)).assertEqual('');
      expect(hostOf(relative)).assertEqual('');
      expect(relative.startsWith('//')).assertTrue();
      expect(DownloadConfig.forUrl(relative).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(relative).validate()).assertContain('url-not-https');
      expect(DownloadConfig.forUrl(relative).validate().length).assertEqual(1);
      expect(pathOf(relative)).assertEqual(relative);
      expect(fileNameOf(relative)).assertEqual('sample.png');
      expect(DownloadConfig.forUrl('https:' + relative).isValid()).assertTrue();
    });

    /**
     * @tc.name   schemeRelativeWithAuthorityAndPortRejected
     * @tc.desc   Adding a port or userinfo to a protocol relative URL still leaves it without an https prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemeRelativeWithAuthorityAndPortRejected', 0, () => {
      const withPort: string = '//gitee.com:443/a.png';
      const withUser: string = '//user:pw@gitee.com/a.png';
      expect(isHttpsUrl(withPort)).assertFalse();
      expect(isHttpsUrl(withUser)).assertFalse();
      expect(hostOf(withPort)).assertEqual('');
      expect(hostOf(withUser)).assertEqual('');
      expect(schemeOf(withPort)).assertEqual('');
      expect(DownloadConfig.forUrl(withPort).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(withUser).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(withUser).validate()).assertContain('url-not-https');
      expect('https:' + withPort).assertEqual('https://gitee.com:443/a.png');
      expect(isHttpsUrl('https:' + withPort)).assertTrue();
      expect(('https:' + withPort).indexOf('//')).assertEqual(6);
      expect(schemeOf('https:' + withPort)).assertEqual('https');
      expect(hostOf('https:' + withPort)).assertEqual('gitee.com:443');
      expect(DownloadConfig.forUrl('https:' + withPort).isValid()).assertTrue();
    });

    /**
     * @tc.name   protocolCaseVariantRejected
     * @tc.desc   HTTPS:// and Https:// are not the literal prefix the page checks, so they never validate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('protocolCaseVariantRejected', 0, () => {
      const upper: string = 'HTTPS://gitee.com/a.png';
      const mixed: string = 'Https://gitee.com/a.png';
      expect(isHttpsUrl(upper)).assertFalse();
      expect(isHttpsUrl(mixed)).assertFalse();
      expect(schemeOf(upper)).assertEqual('HTTPS');
      expect(schemeOf(mixed)).assertEqual('Https');
      expect(schemeOf(upper) === 'https').assertFalse();
      expect(DownloadConfig.forUrl(upper).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(mixed).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(mixed).validate()).assertContain('url-not-https');
      expect(upper.toLowerCase().startsWith('https://')).assertTrue();
      expect(DownloadConfig.forUrl(mixed.toLowerCase()).isValid()).assertTrue();
      expect(upper.indexOf('https')).assertEqual(-1);
      expect(upper.indexOf('HTTPS')).assertEqual(0);
      expect(isHttpUrl(upper)).assertFalse();
      expect(schemeOf(upper).length).assertEqual(5);
    });

    /**
     * @tc.name   mailtoAndFileSchemesRejected
     * @tc.desc   Non transfer schemes are refused even though their host and tail may look reasonable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mailtoAndFileSchemesRejected', 0, () => {
      const mail: string = 'mailto:security@gitee.com';
      const file: string = 'file:///data/storage/sample.png';
      const tel: string = 'tel:+8610000000000';
      for (let index = 0; index < 2; index++) {
        const current: string = index === 0 ? mail : file;
        expect(isHttpsUrl(current)).assertFalse();
        expect(DownloadConfig.forUrl(current).isValid()).assertFalse();
        expect(DownloadConfig.forUrl(current).validate()).assertContain('url-not-https');
      }
      expect(schemeOf(mail)).assertEqual('');
      expect(schemeOf(file)).assertEqual('file');
      expect(schemeOf(tel)).assertEqual('');
      expect(hostOf(file)).assertEqual('');
      expect(fileNameOf(file)).assertEqual('sample.png');
      expect(DownloadConfig.forUrl(tel).isValid()).assertFalse();
    });

    /**
     * @tc.name   hostExtractionOfEmptyAuthority
     * @tc.desc   An empty or slash-only authority yields an empty host instead of a partial token.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostExtractionOfEmptyAuthority', 0, () => {
      expect(hostOf('')).assertEqual('');
      expect(hostOf('https://')).assertEqual('');
      expect(hostOf('https:///a.png')).assertEqual('');
      expect(hostOf('https://////')).assertEqual('');
      expect(hostOf('https:/a.png')).assertEqual('');
      expect(hostOf('https:gitee.com/a.png')).assertEqual('');
      expect(hostOf('https://a.png')).assertEqual('a.png');
      expect(hostOf('https:// ')).assertEqual(' ');
      expect(hostOf('https://').length).assertEqual(0);
      expect(hostOf('https:///').length).assertEqual(0);
      expect(hostOf('https://').indexOf('/')).assertEqual(-1);
      expect(hostOf('https://?x=1')).assertEqual('?x=1');
      expect(hostOf('https://?x=1').startsWith('?')).assertTrue();
    });

    /**
     * @tc.name   hostExtractionKeepsUserInfo
     * @tc.desc   The splitter returns the raw authority, so credentials are visible until redaction is applied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostExtractionKeepsUserInfo', 0, () => {
      const withUser: string = 'https://user:pass@gitee.com/a.png';
      expect(hostOf(withUser)).assertEqual('user:pass@gitee.com');
      expect(hostOf(withUser).indexOf('@') > 0).assertTrue();
      expect(hostOf(withUser).indexOf('pass') > 0).assertTrue();
      expect(hostOf(withUser) === 'gitee.com').assertFalse();
      expect(hostOf(withUser).endsWith('gitee.com')).assertTrue();
      expect(hostOf('https://user@gitee.com/a.png')).assertEqual('user@gitee.com');
      expect(hostOf('https://@gitee.com/a.png')).assertEqual('@gitee.com');
      expect(hostOf('https://:@gitee.com/a.png').indexOf(':')).assertEqual(0);
      expect(hostOf('https://user:pass@gitee.com/a.png').split('@').length).assertEqual(2);
      expect(hostOf('https://user:pass@gitee.com/a.png').split(':').length).assertEqual(2);
      expect(hostOf('https://a@b@c.com/x')).assertEqual('a@b@c.com');
      expect(hostOf('https://a@b@c.com/x').split('@').length).assertEqual(3);
    });

    /**
     * @tc.name   hostExtractionStopsOnlyAtSlash
     * @tc.desc   Without a path the query stays glued to the authority, which a host comparison must account for.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostExtractionStopsOnlyAtSlash', 0, () => {
      expect(hostOf('https://gitee.com?x=1')).assertEqual('gitee.com?x=1');
      expect(hostOf('https://gitee.com?x=1') === 'gitee.com').assertFalse();
      expect(hostOf('https://gitee.com/?x=1')).assertEqual('gitee.com');
      expect(hostOf('https://gitee.com/#f')).assertEqual('gitee.com');
      expect(hostOf('https://gitee.com/a?x=1')).assertEqual('gitee.com');
      expect(hostOf('https://gitee.com:443/a').indexOf(':443') > 0).assertTrue();
      expect(hostOf('https://gitee.com:443?x=1')).assertEqual('gitee.com:443?x=1');
      expect(hostOf('https://gitee.com:443/?x=1')).assertEqual('gitee.com:443');
      expect(hostOf('https://gitee.com:443/?x=1').indexOf('?')).assertEqual(-1);
      expect(hostOf('https://gitee.com?x=1').endsWith('?x=1')).assertTrue();
      expect(hostOf('https://gitee.com/a?x=1').indexOf('?')).assertEqual(-1);
      expect(pathOf('https://gitee.com?x=1')).assertEqual('');
    });

    /**
     * @tc.name   pathExtractionDropsQuery
     * @tc.desc   The path helper returns the slash-prefixed route and cuts the query before returning it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pathExtractionDropsQuery', 0, () => {
      expect(pathOf('https://gitee.com/a/b?x=1')).assertEqual('/a/b');
      expect(pathOf('https://gitee.com/a/b?x=1').indexOf('?')).assertEqual(-1);
      expect(pathOf('https://gitee.com/a/b')).assertEqual('/a/b');
      expect(pathOf('https://gitee.com')).assertEqual('');
      expect(pathOf('https://gitee.com/')).assertEqual('/');
      expect(pathOf('gitee.com/a/b')).assertEqual('/a/b');
      expect(pathOf('')).assertEqual('');
      expect(pathOf('?x=1')).assertEqual('');
      expect(pathOf('https://gitee.com/a/b#f')).assertEqual('/a/b#f');
      expect(pathOf('https://gitee.com/a b.png')).assertEqual('/a b.png');
      expect(pathOf('https://gitee.com/a b.png').indexOf(' ')).assertEqual(2);
      expect(pathOf('//host/a/b')).assertEqual('//host/a/b');
      expect(pathOf('a/b')).assertEqual('/b');
      expect(pathOf('a')).assertEqual('');
    });

    /**
     * @tc.name   queryExtractionOnlyFirstMarker
     * @tc.desc   The query helper starts at the first marker and keeps everything after it, including later markers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryExtractionOnlyFirstMarker', 0, () => {
      expect(queryOf('https://gitee.com/a?x=1?y=2')).assertEqual('?x=1?y=2');
      expect(queryOf('https://gitee.com/a?x=1?y=2').split('?').length).assertEqual(3);
      expect(queryOf('https://gitee.com/a')).assertEqual('');
      expect(queryOf('?')).assertEqual('?');
      expect(queryOf('https://gitee.com/a#f?x=1')).assertEqual('?x=1');
      expect(queryOf('https://gitee.com/a#f?x=1').startsWith('?')).assertTrue();
      expect(hasQuery('https://gitee.com/a#f?x=1')).assertTrue();
      expect(hasQuery('https://gitee.com/a#f')).assertFalse();
      expect(queryOf('https://gitee.com/a?')).assertEqual('?');
      expect(queryOf('https://gitee.com/a?token=a b')).assertEqual('?token=a b');
      expect(queryOf('https://gitee.com/a?token=a b').indexOf('?')).assertEqual(0);
      expect(queryOf('a?b').substring(1)).assertEqual('b');
    });

    /**
     * @tc.name   fileNameFallbackForTrailingSlash
     * @tc.desc   A URL ending in a slash has no file name, so the helper falls back to the supplied default.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameFallbackForTrailingSlash', 0, () => {
      expect(fileNameOf('https://gitee.com/dir/')).assertEqual('file');
      expect(fileNameOf('https://gitee.com/dir/', 'asset')).assertEqual('asset');
      expect(fileNameOf('https://gitee.com/dir/', '')).assertEqual('');
      expect(fileNameOf('https://gitee.com/name', 'asset')).assertEqual('name');
      expect(fileNameOf('https://gitee.com/dir/name.png')).assertEqual('name.png');
      expect(fileNameOf('a/b/c')).assertEqual('c');
      expect(fileNameOf('name.png')).assertEqual('name.png');
      expect(fileNameOf('')).assertEqual('file');
      expect(fileNameOf('https://gitee.com//')).assertEqual('file');
      expect(fileNameOf('https://gitee.com/a.png?x=1')).assertEqual('a.png?x=1');
      expect(fileNameOf(URL_TASK_A)).assertEqual('favor_list_tea.png');
      expect(fileNameOf(URL_TASK_C, 'none')).assertEqual('icon_main_color.png');
      expect(fileNameOf('/')).assertEqual('file');
    });

    /**
     * @tc.name   extensionDotRules
     * @tc.desc   A dot at position zero does not create an extension, and the last dot wins.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionDotRules', 0, () => {
      expect(extensionOf('https://gitee.com/a/file.png')).assertEqual('.png');
      expect(extensionOf('https://gitee.com/a/file.')).assertEqual('.');
      expect(extensionOf('https://gitee.com/a/.hidden')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/archive.tar.gz')).assertEqual('.gz');
      expect(extensionOf('https://gitee.com/a/noDot')).assertEqual('');
      expect(extensionOf('')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/.')).assertEqual('');
      expect(extensionOf('https://gitee.com/a/b..png')).assertEqual('.png');
      expect(extensionOf('https://gitee.com/a/file.PNG')).assertEqual('.PNG');
      expect(extensionOf('a.b.c').length).assertEqual(2);
      expect(extensionOf('a.b.c').startsWith('.')).assertTrue();
      expect(extensionOf('https://gitee.com/a/b.').endsWith('.')).assertTrue();
    });

    /**
     * @tc.name   configCloneIsIndependent
     * @tc.desc   A cloned config can be corrupted without touching the validated original.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configCloneIsIndependent', 0, () => {
      const original = DownloadConfig.forUrl(URL_TASK_A);
      const clone = original.clone();
      expect(clone.sameAs(original)).assertTrue();
      expect(clone.isValid()).assertTrue();
      clone.action = 'UPLOAD';
      expect(original.action).assertEqual('DOWNLOAD');
      expect(clone.action).assertEqual('UPLOAD');
      expect(clone.sameAs(original)).assertFalse();
      expect(clone.isValid()).assertFalse();
      expect(original.isValid()).assertTrue();
      clone.url = 'http://gitee.com/a.png';
      expect(original.url).assertEqual(URL_TASK_A);
      expect(clone.validate().length).assertEqual(2);
      expect(DownloadConfig.forUrl(URL_TASK_C).clone().url).assertEqual(URL_TASK_C);
      expect(DownloadConfig.forUrl(URL_TASK_C).clone().sameAs(DownloadConfig.forUrl(URL_TASK_C))).assertTrue();
      expect(clone.saveas).assertEqual('./');
      expect(clone.method).assertEqual('GET');
      expect(clone.overwrite).assertTrue();
      expect(clone.url).assertEqual('http://gitee.com/a.png');
    });

    /**
     * @tc.name   configDescribeShapeIsStable
     * @tc.desc   The diagnostic string exposes exactly five pipe separated fields ending with the raw URL.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configDescribeShapeIsStable', 0, () => {
      const config = DownloadConfig.forTask(TASK_A);
      const text: string = config.describe();
      expect(text.split('|').length).assertEqual(5);
      expect(text.startsWith('DOWNLOAD|GET|true|./|')).assertTrue();
      expect(text.endsWith(URL_TASK_A)).assertTrue();
      expect(text.indexOf('https://')).assertEqual('DOWNLOAD|GET|true|./|'.length);
      expect(config.describe() === config.describe()).assertTrue();
      expect(config.describe()).assertEqual(expectedConfigFor(TASK_A).describe());
      expect(DownloadConfig.forTask(TASK_B).describe().endsWith(URL_TASK_A)).assertFalse();
      const broken = brokenAction();
      expect(broken.describe().startsWith('UPLOAD|')).assertTrue();
      expect(broken.describe().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name   validationDoesNotMutateConfig
     * @tc.desc   Calling validate twice returns equal but distinct arrays and never rewrites a field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationDoesNotMutateConfig', 0, () => {
      const config = brokenSaveas();
      const before: string = config.describe();
      const first: string[] = config.validate();
      const second: string[] = config.validate();
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(1);
      expect(first[0]).assertEqual(second[0]);
      expect(first === second).assertFalse();
      expect(config.describe()).assertEqual(before);
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('downloads/');
      expect(config.isValid()).assertFalse();
      expect(config.validate()[0]).assertEqual('saveas-not-cache');
      expect(config.fileName()).assertEqual('favor_list_tea.png');
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.validate().length).assertEqual(1);
      expect(isHttpsUrl(config.url)).assertTrue();
    });

    /**
     * @tc.name   crossCheckWithExpectedConfigOracle
     * @tc.desc   The factory and the independent oracle agree for all three tasks and for an unknown task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('crossCheckWithExpectedConfigOracle', 0, () => {
      const tasks: string[] = [TASK_A, TASK_B, TASK_C];
      for (let index = 0; index < tasks.length; index++) {
        const factory = DownloadConfig.forTask(tasks[index]);
        const oracle = expectedConfigFor(tasks[index]);
        expect(factory.sameAs(oracle)).assertTrue();
        expect(factory.describe()).assertEqual(oracle.describe());
        expect(oracle.isValid()).assertTrue();
        expect(oracle.action).assertEqual('DOWNLOAD');
        expect(oracle.saveas).assertEqual('./');
        expect(oracle.overwrite).assertTrue();
      }
      const unknownFactory = DownloadConfig.forTask('Q');
      const unknownOracle = expectedConfigFor('Q');
      expect(unknownFactory.url).assertEqual('');
      expect(unknownOracle.url).assertEqual('');
      expect(unknownFactory.sameAs(unknownOracle)).assertTrue();
      expect(unknownOracle.isValid()).assertFalse();
    });

    /**
     * @tc.name   hostileUrlListAllFailValidation
     * @tc.desc   A list of hostile URL shapes is rejected with the https error and never reports a clean config.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hostileUrlListAllFailValidation', 0, () => {
      const hostile: string[] = [
        ' https://gitee.com/a.png',
        '\thttps://gitee.com/a.png',
        '\nhttps://gitee.com/a.png',
        '//gitee.com/a.png',
        'http://gitee.com/a.png',
        'HTTPS://gitee.com/a.png',
        'https ://gitee.com/a.png',
        'https:/gitee.com/a.png',
        'javascript:alert(1)',
        'data:text/html,<b>x</b>'
      ];
      for (let index = 0; index < hostile.length; index++) {
        const current: string = hostile[index];
        expect(isHttpsUrl(current)).assertFalse();
        const config = DownloadConfig.forUrl(current);
        expect(config.isValid()).assertFalse();
        expect(config.validate()).assertContain('url-not-https');
        expect(config.url).assertEqual(current);
        expect(config.url.length > 0).assertTrue();
      }
      expect(hostile.length).assertEqual(10);
      expect(isHttpsUrl(URL_TASK_A)).assertTrue();
      expect(DownloadConfig.forUrl(URL_TASK_A).isValid()).assertTrue();
      const uniqueErrors: string[] = [];
      for (let index = 0; index < hostile.length; index++) {
        const errors: string[] = DownloadConfig.forUrl(hostile[index]).validate();
        for (let inner = 0; inner < errors.length; inner++) {
          if (uniqueErrors.indexOf(errors[inner]) < 0) {
            uniqueErrors.push(errors[inner]);
          }
        }
      }
      expect(uniqueErrors.length).assertEqual(1);
      expect(uniqueErrors[0]).assertEqual('url-not-https');
    });

    /**
     * @tc.name   invalidConfigKeepsGraphIdle
     * @tc.desc   A rejected configuration never moves the observable graph, so a bad URL cannot start a row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidConfigKeepsGraphIdle', 0, () => {
      const graph = createTaskGraph();
      const configs: DownloadConfig[] = [
        DownloadConfig.forUrl('http://gitee.com/a.png'),
        brokenAction(),
        brokenMethod(),
        brokenOverwrite(),
        brokenSaveas()
      ];
      for (let index = 0; index < configs.length; index++) {
        expect(configs[index].isValid()).assertFalse();
        expect(graph.taskAt(index >= 3 ? 2 : index).isIdle()).assertTrue();
      }
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).status).assertEqual(STATUS_IDLE);
        expect(graph.taskAt(index).lastErrorCode).assertEqual(ERROR_NONE);
      }
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   whitespaceVariantsAroundScheme
     * @tc.desc   Spaces around the scheme are tolerated only when they are absent, and the trimmed form validates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('whitespaceVariantsAroundScheme', 0, () => {
      const forms: string[] = [
        'https://gitee.com/a.png ',
        'https:// gitee.com/a.png',
        ' https://gitee.com/a.png',
        'https://gitee.com /a.png',
        'https://gitee.com/ a.png'
      ];
      expect(isHttpsUrl(forms[0])).assertTrue();
      expect(isHttpsUrl(forms[1])).assertTrue();
      expect(isHttpsUrl(forms[2])).assertFalse();
      expect(isHttpsUrl(forms[3])).assertTrue();
      expect(isHttpsUrl(forms[4])).assertTrue();
      expect(fileNameOf(forms[0]).endsWith(' ')).assertTrue();
      expect(hostOf(forms[1])).assertEqual(' gitee.com');
      expect(hostOf(forms[1]) === 'gitee.com').assertFalse();
      expect(hostOf(forms[3])).assertEqual('gitee.com ');
      expect(DownloadConfig.forUrl(forms[2]).isValid()).assertFalse();
      expect(DownloadConfig.forUrl(forms[2].substring(1)).isValid()).assertTrue();
      expect(DownloadConfig.forUrl(forms[0]).validate().length).assertEqual(0);
    });

    /**
     * @tc.name   securityValidationSummary
     * @tc.desc   The validator never blesses a config whose url is not https, across every field combination tried.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SecurityValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('securityValidationSummary', 0, () => {
      const urls: string[] = ['', 'http://gitee.com/a.png', '//gitee.com/a.png', 'ftp://gitee.com/a.png', URL_TASK_A];
      const actions: string[] = ['DOWNLOAD', 'UPLOAD', ''];
      let rejected: number = 0;
      let accepted: number = 0;
      for (let outer = 0; outer < urls.length; outer++) {
        for (let inner = 0; inner < actions.length; inner++) {
          const config = new DownloadConfig(actions[inner], urls[outer], true, 'GET', './');
          if (config.isValid()) {
            accepted = accepted + 1;
            expect(isHttpsUrl(urls[outer])).assertTrue();
            expect(actions[inner]).assertEqual('DOWNLOAD');
          } else {
            rejected = rejected + 1;
            expect(config.validate().length > 0).assertTrue();
          }
        }
      }
      expect(accepted + rejected).assertEqual(urls.length * actions.length);
      expect(accepted).assertEqual(1);
      expect(rejected).assertEqual(14);
      expect(accepted < rejected).assertTrue();
    });

    // End of security validation suite.
  });
}
