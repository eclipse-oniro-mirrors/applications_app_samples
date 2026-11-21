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
 * OfflineResource suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  download() forwards the caller URL straight into request.agent.Config
 *   151-171  the only three URLs the production page ever builds
 *   170-176  isHttpUrl / isHttpsUrl are plain prefix predicates
 *   178-201  hasQuery / redactQuery / redactCredentials
 *   612-633  DownloadConfig.validate() returns the ordered error code list
 *
 * The suite is fully offline: it never creates a request.agent task. Instead it
 * walks a negative URL matrix (empty, whitespace, http, ftp, file, javascript,
 * data, upper case, query only, fragment only, protocol relative) and pins the
 * validation code for each entry. It then documents the exact semantics of the
 * isHttpsUrl prefix check, including the entries it accepts, so a future change
 * to the guard cannot pass silently.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  DownloadConfig,
  isHttpUrl,
  isHttpsUrl,
  fileNameOf,
  extensionOf,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  hasQuery,
  redactQuery,
  redactCredentials,
  hasDuplicateStrings,
  countOf,
  uniqueStrings,
  joined
} from '../Shared/SharedDriver';

const OFFLINE_BAD: string[] = [
  '',
  '   ',
  'http://gitee.com/a/after_cache.png',
  'ftp://gitee.com/a/after_cache.png',
  'file:///data/storage/el2/base/cache/after_cache.png',
  'javascript:alert(1)',
  'data:image/png;base64,AAAA',
  'HTTPS://GITEE.COM/A/AFTER_CACHE.PNG'
];

const OFFLINE_GOOD: string[] = [
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C
];

function offlineConfig(url: string): DownloadConfig {
  return new DownloadConfig('DOWNLOAD', url, true, 'GET', './');
}

export default function offlineResourceTest(): void {
  describe('OfflineResource', () => {
    beforeAll(() => {
      logSuite('OfflineResource', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('OfflineResource', 'end');
    });

    /**
     * @tc.name   emptySourceIsRejectedWithTwoErrors
     * @tc.desc   The empty URL triggers both the empty rule and the https rule in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptySourceIsRejectedWithTwoErrors', 0, () => {
      const config: DownloadConfig = offlineConfig('');
      const errors: string[] = config.validate();
      logStep('emptySourceIsRejectedWithTwoErrors', joined(errors, ','));
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(isHttpsUrl('')).assertFalse();
      expect(config.url.length).assertEqual(0);
      expect(fileNameOf('')).assertEqual('file');
    });

    /**
     * @tc.name   whitespaceOnlySourceIsRejected
     * @tc.desc   A blank source is non-empty, so only the https rule fires and the blank name survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('whitespaceOnlySourceIsRejected', 0, () => {
      const blank: string = '   ';
      const config: DownloadConfig = offlineConfig(blank);
      const errors: string[] = config.validate();
      logStep('whitespaceOnlySourceIsRejected', joined(errors, ','));
      expect(blank.length).assertEqual(3);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(errors.indexOf('url-empty')).assertLess(0);
      expect(config.isValid()).assertFalse();
      expect(fileNameOf(blank)).assertEqual('   ');
      expect(extensionOf(blank)).assertEqual('');
      expect(isHttpsUrl(blank)).assertFalse();
    });

    /**
     * @tc.name   leadingSpaceSourceIsRejected
     * @tc.desc   One leading space breaks the https prefix even though the authority still parses.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('leadingSpaceSourceIsRejected', 0, () => {
      const padded: string = ' ' + URL_TASK_B;
      const config: DownloadConfig = offlineConfig(padded);
      logStep('leadingSpaceSourceIsRejected', schemeOf(padded));
      expect(isHttpsUrl(padded)).assertFalse();
      expect(schemeOf(padded)).assertEqual(' https');
      expect(hostOf(padded)).assertEqual('gitee.com');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(padded.indexOf('https')).assertEqual(1);
    });

    /**
     * @tc.name   trailingSpaceSourcePassesPrefixGate
     * @tc.desc   A trailing space does not disturb the prefix, so the source is accepted with a polluted name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingSpaceSourcePassesPrefixGate', 0, () => {
      const padded: string = URL_TASK_B + ' ';
      const config: DownloadConfig = offlineConfig(padded);
      logStep('trailingSpaceSourcePassesPrefixGate', config.fileName());
      expect(isHttpsUrl(padded)).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('after_cache.png ');
      expect(config.fileName()).assertEqual(fileNameOf(padded));
      expect(extensionOf(padded)).assertEqual('.png ');
      expect(padded.endsWith(' ')).assertTrue();
      expect(padded.length).assertEqual(URL_TASK_B.length + 1);
    });

    /**
     * @tc.name   plainHttpSourceRejectedOffline
     * @tc.desc   A plain-http drawable is refused before any socket is opened, with the https code only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('plainHttpSourceRejectedOffline', 0, () => {
      const httpUrl: string = 'http://gitee.com/chenhaiwen2/media/icon_main_color.png';
      const config: DownloadConfig = offlineConfig(httpUrl);
      logStep('plainHttpSourceRejectedOffline', String(config.validate().length));
      expect(isHttpUrl(httpUrl)).assertTrue();
      expect(isHttpsUrl(httpUrl)).assertFalse();
      expect(schemeOf(httpUrl)).assertEqual('http');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(config.describe().indexOf('http://')).assertLarger(0);
    });

    /**
     * @tc.name   ftpSourceRejectedOffline
     * @tc.desc   An ftp mirror parses cleanly into scheme, host and file but fails the https gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('ftpSourceRejectedOffline', 0, () => {
      const ftpUrl: string = 'ftp://mirror.example.org/pub/after_cache.png';
      const config: DownloadConfig = offlineConfig(ftpUrl);
      logStep('ftpSourceRejectedOffline', schemeOf(ftpUrl));
      expect(schemeOf(ftpUrl)).assertEqual('ftp');
      expect(hostOf(ftpUrl)).assertEqual('mirror.example.org');
      expect(extensionOf(ftpUrl)).assertEqual('.png');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(isHttpUrl(ftpUrl)).assertFalse();
    });

    /**
     * @tc.name   fileSourceRejectedOffline
     * @tc.desc   A local file path cannot stand in for a download source, so it fails the https gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fileSourceRejectedOffline', 0, () => {
      const fileUrl: string = 'file:///data/storage/el2/base/cache/after_cache.png';
      const config: DownloadConfig = offlineConfig(fileUrl);
      logStep('fileSourceRejectedOffline', schemeOf(fileUrl));
      expect(schemeOf(fileUrl)).assertEqual('file');
      expect(hostOf(fileUrl)).assertEqual('');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(config.url.startsWith('file:///')).assertTrue();
      expect(pathOf(fileUrl)).assertEqual('/data/storage/el2/base/cache/after_cache.png');
    });

    /**
     * @tc.name   javascriptSourceRejectedOffline
     * @tc.desc   A javascript pseudo URL has no authority and no extension, and it never validates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('javascriptSourceRejectedOffline', 0, () => {
      const scriptUrl: string = 'javascript:alert(document.cookie)';
      const config: DownloadConfig = offlineConfig(scriptUrl);
      logStep('javascriptSourceRejectedOffline', String(config.validate().length));
      expect(schemeOf(scriptUrl)).assertEqual('');
      expect(hostOf(scriptUrl)).assertEqual('');
      expect(extensionOf(scriptUrl)).assertEqual('.cookie)');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(scriptUrl.indexOf('://')).assertLess(0);
      expect(config.fileName()).assertEqual(scriptUrl);
    });

    /**
     * @tc.name   dataSourceRejectedOffline
     * @tc.desc   An inline data URL is rejected and keeps its base64 payload out of the derived fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dataSourceRejectedOffline', 0, () => {
      const dataUrl: string = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUg';
      const config: DownloadConfig = offlineConfig(dataUrl);
      logStep('dataSourceRejectedOffline', schemeOf(dataUrl));
      expect(dataUrl.startsWith('data:')).assertTrue();
      expect(schemeOf(dataUrl)).assertEqual('');
      expect(hostOf(dataUrl)).assertEqual('');
      expect(extensionOf(dataUrl)).assertEqual('');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.url.indexOf('base64')).assertLarger(0);
    });

    /**
     * @tc.name   uppercaseHttpsRejectedOffline
     * @tc.desc   The https guard is case sensitive, so an upper case scheme is offline rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('uppercaseHttpsRejectedOffline', 0, () => {
      const upper: string = 'HTTPS://GITEE.COM/A/AFTER_CACHE.PNG';
      const config: DownloadConfig = offlineConfig(upper);
      logStep('uppercaseHttpsRejectedOffline', schemeOf(upper));
      expect(schemeOf(upper)).assertEqual('HTTPS');
      expect(hostOf(upper)).assertEqual('GITEE.COM');
      expect(upper.startsWith('https://')).assertFalse();
      expect(isHttpsUrl(upper)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('AFTER_CACHE.PNG');
    });

    /**
     * @tc.name   queryOnlySourceRejected
     * @tc.desc   A bare query string is a non-empty source with no scheme, so it fails with one code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryOnlySourceRejected', 0, () => {
      const onlyQuery: string = '?token=abc123';
      const config: DownloadConfig = offlineConfig(onlyQuery);
      logStep('queryOnlySourceRejected', queryOf(onlyQuery));
      expect(hasQuery(onlyQuery)).assertTrue();
      expect(queryOf(onlyQuery)).assertEqual('?token=abc123');
      expect(redactQuery(onlyQuery)).assertEqual('');
      expect(isHttpsUrl(onlyQuery)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual(onlyQuery);
    });

    /**
     * @tc.name   fragmentOnlySourceRejected
     * @tc.desc   A fragment without a scheme is rejected while the trailing file name still parses.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fragmentOnlySourceRejected', 0, () => {
      const fragment: string = '#media/icon.png';
      const config: DownloadConfig = offlineConfig(fragment);
      logStep('fragmentOnlySourceRejected', fileNameOf(fragment));
      expect(fragment.startsWith('#')).assertTrue();
      expect(hasQuery(fragment)).assertFalse();
      expect(queryOf(fragment)).assertEqual('');
      expect(schemeOf(fragment)).assertEqual('');
      expect(hostOf(fragment)).assertEqual('');
      expect(isHttpsUrl(fragment)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.fileName()).assertEqual('icon.png');
    });

    /**
     * @tc.name   protocolRelativeSourceRejected
     * @tc.desc   A //authority source inherits the page scheme, not https, and the guard refuses it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('protocolRelativeSourceRejected', 0, () => {
      const relative: string = '//gitee.com/a/after_cache.png';
      const config: DownloadConfig = offlineConfig(relative);
      logStep('protocolRelativeSourceRejected', pathOf(relative));
      expect(relative.startsWith('//')).assertTrue();
      expect(relative.startsWith('https://')).assertFalse();
      expect(isHttpsUrl(relative)).assertFalse();
      expect(hostOf(relative)).assertEqual('');
      expect(pathOf(relative)).assertEqual('//gitee.com/a/after_cache.png');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.fileName()).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   parentDirectorySourceRejected
     * @tc.desc   A ../ media reference is a relative path, so it cannot pass the origin gate offline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('parentDirectorySourceRejected', 0, () => {
      const parent: string = '../media/icon_main_color.png';
      const config: DownloadConfig = offlineConfig(parent);
      logStep('parentDirectorySourceRejected', String(pathOf(parent)));
      expect(parent.startsWith('..')).assertTrue();
      expect(schemeOf(parent)).assertEqual('');
      expect(hostOf(parent)).assertEqual('');
      expect(isHttpsUrl(parent)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(pathOf(parent)).assertEqual('/media/icon_main_color.png');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   uppercaseHostAcceptedOffline
     * @tc.desc   Only the scheme prefix is checked, so an upper case host is accepted without any request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('uppercaseHostAcceptedOffline', 0, () => {
      const mixed: string = 'https://GITEE.COM/a/icon_main_color.png';
      const config: DownloadConfig = offlineConfig(mixed);
      logStep('uppercaseHostAcceptedOffline', hostOf(mixed));
      expect(isHttpsUrl(mixed)).assertTrue();
      expect(schemeOf(mixed)).assertEqual('https');
      expect(hostOf(mixed)).assertEqual('GITEE.COM');
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(config.url.indexOf('GITEE')).assertLarger(0);
      expect(hostOf(mixed) === 'gitee.com').assertFalse();
    });

    /**
     * @tc.name   uppercasePathAcceptedOffline
     * @tc.desc   An upper case path and extension also pass, and the extension keeps its case.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercasePathAcceptedOffline', 0, () => {
      const shoute: string = 'https://gitee.com/MEDIA/ICON_MAIN_COLOR.PNG';
      const config: DownloadConfig = offlineConfig(shoute);
      logStep('uppercasePathAcceptedOffline', extensionOf(shoute));
      expect(config.isValid()).assertTrue();
      expect(schemeOf(shoute)).assertEqual('https');
      expect(hostOf(shoute)).assertEqual('gitee.com');
      expect(pathOf(shoute)).assertEqual('/MEDIA/ICON_MAIN_COLOR.PNG');
      expect(extensionOf(shoute)).assertEqual('.PNG');
      expect(extensionOf(shoute) === '.png').assertFalse();
      expect(config.fileName()).assertEqual('ICON_MAIN_COLOR.PNG');
      expect(config.validate().length).assertEqual(0);
    });

    /**
     * @tc.name   offlineMatrixHasSingleAcceptance
     * @tc.desc   Walking the full offline matrix accepts exactly the three pinned https entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('offlineMatrixHasSingleAcceptance', 0, () => {
      let accepted: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < OFFLINE_BAD.length; index++) {
        const config: DownloadConfig = offlineConfig(OFFLINE_BAD[index]);
        if (config.isValid()) {
          accepted = accepted + 1;
        } else {
          rejected = rejected + 1;
        }
        expect(config.isValid()).assertFalse();
        expect(config.validate().length >= 1).assertTrue();
      }
      for (let index = 0; index < OFFLINE_GOOD.length; index++) {
        const config: DownloadConfig = offlineConfig(OFFLINE_GOOD[index]);
        if (config.isValid()) {
          accepted = accepted + 1;
        } else {
          rejected = rejected + 1;
        }
        expect(config.isValid()).assertTrue();
      }
      logStep('offlineMatrixHasSingleAcceptance', String(accepted) + '/' + String(rejected));
      expect(accepted).assertEqual(3);
      expect(rejected).assertEqual(8);
      expect(OFFLINE_BAD.length).assertEqual(8);
      expect(OFFLINE_GOOD.length).assertEqual(3);
      expect(accepted + rejected).assertEqual(11);
      expect(hasDuplicateStrings(OFFLINE_BAD)).assertFalse();
    });

    /**
     * @tc.name   malformedAuthorityHttpsAcceptedByPrefix
     * @tc.desc   An empty authority still satisfies the prefix guard, which is the documented offline semantics.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('malformedAuthorityHttpsAcceptedByPrefix', 0, () => {
      const malformed: string = 'https:///a/icon.png';
      const config: DownloadConfig = offlineConfig(malformed);
      logStep('malformedAuthorityHttpsAcceptedByPrefix', String(hostOf(malformed).length));
      expect(hostOf(malformed)).assertEqual('');
      expect(malformed.startsWith('https:///')).assertTrue();
      expect(isHttpsUrl(malformed)).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(pathOf(malformed)).assertEqual('/a/icon.png');
      expect(config.fileName()).assertEqual('icon.png');
      expect(config.url.indexOf('gitee.com')).assertLess(0);
    });

    /**
     * @tc.name   saveasOfflineFailureIsIndependentOfUrl
     * @tc.desc   A valid https source with a non-cache save path fails only on the saveas rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('saveasOfflineFailureIsIndependentOfUrl', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, true, 'GET', './cache/');
      const errors: string[] = config.validate();
      logStep('saveasOfflineFailureIsIndependentOfUrl', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('saveas-not-cache');
      expect(errors.indexOf('url-not-https')).assertLess(0);
      expect(config.url).assertEqual(URL_TASK_C);
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(config.describe().indexOf('./cache/')).assertLarger(0);
      expect(isHttpsUrl(config.url)).assertTrue();
    });

    /**
     * @tc.name   methodOfflineFailureIsIndependentOfUrl
     * @tc.desc   A valid https source with a PATCH method fails only on the transport rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('methodOfflineFailureIsIndependentOfUrl', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_A, true, 'PATCH', './');
      const errors: string[] = config.validate();
      logStep('methodOfflineFailureIsIndependentOfUrl', joined(errors, ','));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('method-unsupported');
      expect(errors.indexOf('url-not-https')).assertLess(0);
      expect(config.method).assertEqual('PATCH');
      expect(config.url).assertEqual(URL_TASK_A);
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('favor_list_tea.png');
      expect(isHttpsUrl(config.url)).assertTrue();
    });

    /**
     * @tc.name   actionOfflineFailureIsIndependentOfUrl
     * @tc.desc   A valid https source with an upload action fails only on the action rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('actionOfflineFailureIsIndependentOfUrl', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_B, true, 'GET', './');
      logStep('actionOfflineFailureIsIndependentOfUrl', joined(config.validate(), ','));
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('action-not-download');
      expect(config.isValid()).assertFalse();
      expect(config.action).assertEqual('UPLOAD');
      expect(config.url).assertEqual(URL_TASK_B);
      expect(config.method).assertEqual('GET');
      expect(config.fileName()).assertEqual('after_cache.png');
      expect(isHttpsUrl(config.url)).assertTrue();
    });

    /**
     * @tc.name   overwriteOfflineFailureIsIndependentOfUrl
     * @tc.desc   A valid https source with overwrite disabled fails only on the overwrite rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overwriteOfflineFailureIsIndependentOfUrl', 0, () => {
      const config: DownloadConfig = new DownloadConfig('DOWNLOAD', URL_TASK_C, false, 'GET', './');
      logStep('overwriteOfflineFailureIsIndependentOfUrl', String(config.overwrite));
      expect(config.overwrite).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('overwrite-disabled');
      expect(config.isValid()).assertFalse();
      expect(config.url).assertEqual(URL_TASK_C);
      expect(config.saveas).assertEqual('./');
      expect(config.describe().indexOf('|false|')).assertLarger(0);
      expect(isHttpsUrl(config.url)).assertTrue();
    });

    /**
     * @tc.name   validUrlWithAllBadFieldsReportsFourErrors
     * @tc.desc   A reachable https URL with four broken options reports the four option codes in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validUrlWithAllBadFieldsReportsFourErrors', 0, () => {
      const config: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_A, false, 'PUT', 'elsewhere');
      const errors: string[] = config.validate();
      logStep('validUrlWithAllBadFieldsReportsFourErrors', joined(errors, ','));
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('action-not-download');
      expect(errors[1]).assertEqual('method-unsupported');
      expect(errors[2]).assertEqual('overwrite-disabled');
      expect(errors[3]).assertEqual('saveas-not-cache');
      expect(errors.indexOf('url-not-https')).assertLess(0);
      expect(errors.indexOf('url-empty')).assertLess(0);
      expect(config.isValid()).assertFalse();
      expect(config.url).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   offlineErrorCodesAreStableStrings
     * @tc.desc   The six validation codes are stable literals that a negative suite can assert against.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('offlineErrorCodesAreStableStrings', 0, () => {
      const codes: string[] = [];
      const empty: DownloadConfig = offlineConfig('');
      for (let index = 0; index < empty.validate().length; index++) {
        codes.push(empty.validate()[index]);
      }
      const broken: DownloadConfig = new DownloadConfig('UPLOAD', URL_TASK_B, false, 'PUT', 'elsewhere');
      for (let index = 0; index < broken.validate().length; index++) {
        codes.push(broken.validate()[index]);
      }
      logStep('offlineErrorCodesAreStableStrings', joined(codes, ','));
      expect(codes.length).assertEqual(6);
      expect(codes[0]).assertEqual('url-empty');
      expect(codes[1]).assertEqual('url-not-https');
      expect(codes[2]).assertEqual('action-not-download');
      expect(codes[3]).assertEqual('method-unsupported');
      expect(codes[4]).assertEqual('overwrite-disabled');
      expect(codes[5]).assertEqual('saveas-not-cache');
      expect(uniqueStrings(codes).length).assertEqual(6);
      expect(hasDuplicateStrings(codes)).assertFalse();
    });

    /**
     * @tc.name   fileNameOfMatrixGroups
     * @tc.desc   The matrix splits into a fallback name, a blank name, three store names and two opaque names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fileNameOfMatrixGroups', 0, () => {
      const names: string[] = [];
      for (let index = 0; index < OFFLINE_BAD.length; index++) {
        names.push(fileNameOf(OFFLINE_BAD[index]));
      }
      logStep('fileNameOfMatrixGroups', joined(names, ';'));
      expect(names[0]).assertEqual('file');
      expect(names[1]).assertEqual('   ');
      expect(names[2]).assertEqual('after_cache.png');
      expect(names[3]).assertEqual('after_cache.png');
      expect(names[4]).assertEqual('after_cache.png');
      expect(names[5]).assertEqual(OFFLINE_BAD[5]);
      expect(names[7]).assertEqual('AFTER_CACHE.PNG');
      expect(countOf(names, 'after_cache.png')).assertEqual(3);
      expect(uniqueStrings(names).length).assertEqual(6);
    });

    /**
     * @tc.name   extensionOfMatrixGroups
     * @tc.desc   Only the http, ftp, file and upper case entries expose an extension in the matrix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('extensionOfMatrixGroups', 0, () => {
      const extensions: string[] = [];
      for (let index = 0; index < OFFLINE_BAD.length; index++) {
        extensions.push(extensionOf(OFFLINE_BAD[index]));
      }
      logStep('extensionOfMatrixGroups', joined(extensions, ','));
      expect(extensions[0]).assertEqual('');
      expect(extensions[1]).assertEqual('');
      expect(extensions[2]).assertEqual('.png');
      expect(extensions[3]).assertEqual('.png');
      expect(extensions[4]).assertEqual('.png');
      expect(extensions[5]).assertEqual('');
      expect(extensions[6]).assertEqual('');
      expect(extensions[7]).assertEqual('.PNG');
      expect(countOf(extensions, '.png')).assertEqual(3);
      expect(countOf(extensions, '.PNG')).assertEqual(1);
    });

    /**
     * @tc.name   schemeOfMatrixGroups
     * @tc.desc   Four matrix entries have no scheme marker while http, ftp, file and HTTPS parse.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemeOfMatrixGroups', 0, () => {
      const schemes: string[] = [];
      for (let index = 0; index < OFFLINE_BAD.length; index++) {
        schemes.push(schemeOf(OFFLINE_BAD[index]));
      }
      logStep('schemeOfMatrixGroups', joined(schemes, ','));
      expect(schemes[0]).assertEqual('');
      expect(schemes[1]).assertEqual('');
      expect(schemes[2]).assertEqual('http');
      expect(schemes[3]).assertEqual('ftp');
      expect(schemes[4]).assertEqual('file');
      expect(schemes[5]).assertEqual('');
      expect(schemes[7]).assertEqual('HTTPS');
      expect(countOf(schemes, '')).assertEqual(4);
      expect(uniqueStrings(schemes).length).assertEqual(5);
    });

    /**
     * @tc.name   hostOfMatrixGroups
     * @tc.desc   Only authorities with a real marker and a slash-free host survive host extraction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostOfMatrixGroups', 0, () => {
      const hosts: string[] = [];
      for (let index = 0; index < OFFLINE_BAD.length; index++) {
        hosts.push(hostOf(OFFLINE_BAD[index]));
      }
      logStep('hostOfMatrixGroups', joined(hosts, ','));
      expect(hosts[0]).assertEqual('');
      expect(hosts[1]).assertEqual('');
      expect(hosts[2]).assertEqual('gitee.com');
      expect(hosts[3]).assertEqual('gitee.com');
      expect(hosts[4]).assertEqual('');
      expect(hosts[6]).assertEqual('');
      expect(hosts[7]).assertEqual('GITEE.COM');
      expect(countOf(hosts, 'gitee.com')).assertEqual(2);
      expect(countOf(hosts, '')).assertEqual(5);
    });

    /**
     * @tc.name   redactionMatrixLeavesNonHttpsUnchanged
     * @tc.desc   None of the negative entries carries a query or user info, so both redactors are identity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('redactionMatrixLeavesNonHttpsUnchanged', 0, () => {
      let identical: number = 0;
      for (let index = 0; index < OFFLINE_BAD.length; index++) {
        const url: string = OFFLINE_BAD[index];
        expect(redactQuery(url)).assertEqual(url);
        expect(redactCredentials(url)).assertEqual(url);
        if (redactQuery(url) === url && redactCredentials(url) === url) {
          identical = identical + 1;
        }
      }
      logStep('redactionMatrixLeavesNonHttpsUnchanged', String(identical));
      expect(identical).assertEqual(8);
      expect(hasQuery(OFFLINE_BAD[2])).assertFalse();
      expect(redactQuery(OFFLINE_BAD[2])).assertEqual(OFFLINE_BAD[2]);
      expect(redactCredentials(OFFLINE_BAD[7])).assertEqual(OFFLINE_BAD[7]);
      expect(OFFLINE_BAD[2].indexOf('@')).assertLess(0);
    });

    /**
     * @tc.name   queryBearingHttpStillRejected
     * @tc.desc   Adding a token to an http source does not change the rejection: the scheme is still wrong.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryBearingHttpStillRejected', 0, () => {
      const signed: string = 'http://gitee.com/a/after_cache.png?token=abc';
      const config: DownloadConfig = offlineConfig(signed);
      logStep('queryBearingHttpStillRejected', redactQuery(signed));
      expect(hasQuery(signed)).assertTrue();
      expect(redactQuery(signed)).assertEqual('http://gitee.com/a/after_cache.png');
      expect(isHttpsUrl(signed)).assertFalse();
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('after_cache.png?token=abc');
      expect(redactQuery(signed).indexOf('token')).assertLess(0);
    });

    /**
     * @tc.name   trailingSlashOfflineSourcePassesGate
     * @tc.desc   A directory-like https source is accepted while its file name falls back to "file".
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingSlashOfflineSourcePassesGate', 0, () => {
      const directory: string = URL_TASK_C + '/';
      const config: DownloadConfig = offlineConfig(directory);
      logStep('trailingSlashOfflineSourcePassesGate', config.fileName());
      expect(directory.endsWith('/')).assertTrue();
      expect(isHttpsUrl(directory)).assertTrue();
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.fileName()).assertEqual('file');
      expect(extensionOf(directory)).assertEqual('');
      expect(hostOf(directory)).assertEqual('gitee.com');
      expect(config.url.length).assertEqual(URL_TASK_C.length + 1);
    });

    /**
     * @tc.name   mixedCaseSchemeMatrix
     * @tc.desc   Every spelling of the scheme except the exact lower case https is rejected offline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mixedCaseSchemeMatrix', 0, () => {
      const variants: string[] = [
        'Http://gitee.com/a.png',
        'hTTps://gitee.com/a.png',
        'HTTPS://gitee.com/a.png',
        'https:/gitee.com/a.png',
        'Https://gitee.com/a.png'
      ];
      let rejected: number = 0;
      for (let index = 0; index < variants.length; index++) {
        const config: DownloadConfig = offlineConfig(variants[index]);
        if (!config.isValid()) {
          rejected = rejected + 1;
        }
        expect(isHttpsUrl(variants[index])).assertFalse();
        expect(config.validate().length).assertEqual(1);
        expect(config.validate()[0]).assertEqual('url-not-https');
      }
      logStep('mixedCaseSchemeMatrix', String(rejected));
      expect(rejected).assertEqual(5);
      expect(schemeOf(variants[0])).assertEqual('Http');
      expect(schemeOf(variants[2])).assertEqual('HTTPS');
      expect(schemeOf(variants[3])).assertEqual('');
      expect(OFFLINE_GOOD[0].startsWith('https://')).assertTrue();
    });

    /**
     * @tc.name   isHttpsUrlIsPurePrefixCheck
     * @tc.desc   The guard only inspects the first eight characters: no host or path is validated.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('isHttpsUrlIsPurePrefixCheck', 0, () => {
      logStep('isHttpsUrlIsPurePrefixCheck', String(isHttpsUrl('https://')));
      expect(isHttpsUrl('https://')).assertTrue();
      expect(isHttpsUrl('https:///')).assertTrue();
      expect(isHttpsUrl('https:// ')).assertTrue();
      expect(isHttpsUrl('https:/')).assertFalse();
      expect(isHttpsUrl('https')).assertFalse();
      expect(isHttpsUrl(' https://gitee.com')).assertFalse();
      expect(isHttpsUrl('xhttps://gitee.com')).assertFalse();
      expect(isHttpsUrl('https://gitee.com/a.png')).assertTrue();
    });

    /**
     * @tc.name   isHttpUrlNeverMatchesHttps
     * @tc.desc   The insecure predicate requires the http prefix and therefore rejects every https source.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('isHttpUrlNeverMatchesHttps', 0, () => {
      logStep('isHttpUrlNeverMatchesHttps', String(isHttpUrl('http://gitee.com')));
      expect(isHttpUrl('http://gitee.com')).assertTrue();
      expect(isHttpUrl('http://')).assertTrue();
      expect(isHttpUrl('http:/')).assertFalse();
      expect(isHttpUrl('http')).assertFalse();
      expect(isHttpUrl('HTTP://gitee.com')).assertFalse();
      expect(isHttpUrl(URL_TASK_A)).assertFalse();
      expect(isHttpUrl(URL_TASK_C)).assertFalse();
      expect(isHttpUrl('http://gitee.com') === isHttpUrl('https://gitee.com')).assertFalse();
      expect(isHttpUrl(OFFLINE_BAD[5])).assertFalse();
    });

    /**
     * @tc.name   offlineMatrixKeepsOriginalUrlIntact
     * @tc.desc   Validation never rewrites the stored URL, so a rejected entry stays byte-identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the OfflineResource scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('offlineMatrixKeepsOriginalUrlIntact', 0, () => {
      let intact: number = 0;
      for (let index = 0; index < OFFLINE_BAD.length; index++) {
        const config: DownloadConfig = offlineConfig(OFFLINE_BAD[index]);
        expect(config.url).assertEqual(OFFLINE_BAD[index]);
        expect(config.url.length).assertEqual(OFFLINE_BAD[index].length);
        expect(config.describe().endsWith(OFFLINE_BAD[index])).assertTrue();
        config.validate();
        if (config.url === OFFLINE_BAD[index]) {
          intact = intact + 1;
        }
      }
      logStep('offlineMatrixKeepsOriginalUrlIntact', String(intact));
      expect(intact).assertEqual(8);
      expect(offlineConfig(OFFLINE_BAD[2]).isValid()).assertFalse();
      expect(OFFLINE_BAD[2]).assertEqual(offlineConfig(OFFLINE_BAD[2]).url);
      expect(offlineConfig(OFFLINE_BAD[2]).sameAs(offlineConfig(OFFLINE_BAD[2]).clone())).assertTrue();
    });
  });
}
