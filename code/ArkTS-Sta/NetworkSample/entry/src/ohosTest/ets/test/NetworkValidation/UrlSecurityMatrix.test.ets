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
 * UrlSecurityMatrix suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   151-171  the three https URL literals of runTaskA / runTaskB / runTaskC
 *   109-148  download() builds action DOWNLOAD, method GET, saveas './', overwrite true
 *
 * SharedDriver anchors:
 *   120-168  fileNameOf / extensionOf / schemeOf / hostOf / pathOf / queryOf
 *   170-201  isHttpUrl / isHttpsUrl / hasQuery / redactQuery / redactCredentials
 *   571-646  DownloadConfig and its validate() rule list
 *   648-659  expectedConfigFor
 *
 * The suite pins scheme acceptance, credential and query redaction, port and
 * fragment handling, malformed literals and the https validation rule list.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  DownloadConfig,
  expectedConfigFor,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  TASK_A,
  TASK_B,
  TASK_C,
  CONFIG_ACTION_DOWNLOAD,
  CONFIG_METHOD_GET,
  CONFIG_SAVEAS_CACHE,
  CONFIG_OVERWRITE,
  schemeOf,
  hostOf,
  pathOf,
  queryOf,
  hasQuery,
  isHttpUrl,
  isHttpsUrl,
  redactQuery,
  redactCredentials,
  fileNameOf,
  extensionOf,
  sameStringArray,
  countOf,
  joined,
  uniqueStrings
} from '../Shared/SharedDriver';

const HTTPS_SAMPLE: string = 'https://gitee.com/chenhaiwen2/cases/raw/main/icon_main_color.png';
const HTTP_SAMPLE: string = 'http://gitee.com/chenhaiwen2/cases/raw/main/icon_main_color.png';
const FTP_SAMPLE: string = 'ftp://gitee.com/chenhaiwen2/cases/raw/main/icon_main_color.png';
const FILE_SAMPLE: string = 'file:///tmp/media/icon_main_color.png';

export default function urlSecurityMatrixTest(): void {
  describe('UrlSecurityMatrix', () => {
    beforeAll(() => {
      logSuite('UrlSecurityMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('UrlSecurityMatrix', 'end');
    });

    /**
     * @tc.name   urlMatrixHttpsSchemeAccepted
     * @tc.desc   The seeded task A literal is https, so the configuration validates.
     * @tc.precondition  The shared URL constants are loaded after the beforeEach yield.
     * @tc.steps         1. Read the scheme of the task A literal.
     *                   2. Evaluate isHttpsUrl and the configuration rules.
     *                   3. Confirm the http predicate stays false.
     * @tc.expected      Scheme is https, the config is valid and no rule fires.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlMatrixHttpsSchemeAccepted', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(URL_TASK_A);
      expect(schemeOf(URL_TASK_A)).assertEqual('https');
      expect(isHttpsUrl(URL_TASK_A)).assertTrue();
      expect(isHttpUrl(URL_TASK_A)).assertFalse();
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.url).assertEqual(URL_TASK_A);
    });

    /**
     * @tc.name   urlMatrixHttpSchemeRejectedByConfig
     * @tc.desc   A plain http literal fails the https-only download rule.
     * @tc.precondition  A local http literal is declared at the top of the suite.
     * @tc.steps         1. Build a configuration around the http literal.
     *                   2. Run the rule list and read the first error code.
     *                   3. Confirm the https predicate is false.
     * @tc.expected      Exactly one url-not-https error is reported.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlMatrixHttpSchemeRejectedByConfig', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(HTTP_SAMPLE);
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('url-not-https');
      expect(sameStringArray(errors, ['url-not-https'])).assertTrue();
      expect(config.isValid()).assertFalse();
      expect(schemeOf(HTTP_SAMPLE)).assertEqual('http');
      expect(isHttpUrl(HTTP_SAMPLE)).assertTrue();
      expect(isHttpsUrl(HTTP_SAMPLE)).assertFalse();
    });

    /**
     * @tc.name   urlMatrixFtpSchemeHasNoHttpsPrefix
     * @tc.desc   An ftp literal keeps its scheme and host but fails https validation.
     * @tc.precondition  A local ftp literal is declared at the top of the suite.
     * @tc.steps         1. Extract scheme, host and path from the ftp literal.
     *                   2. Build a configuration and read the rule list.
     *                   3. Confirm both scheme predicates are false.
     * @tc.expected      The scheme is ftp, the host is preserved and one error fires.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixFtpSchemeHasNoHttpsPrefix', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(FTP_SAMPLE);
      expect(schemeOf(FTP_SAMPLE)).assertEqual('ftp');
      expect(hostOf(FTP_SAMPLE)).assertEqual('gitee.com');
      expect(pathOf(FTP_SAMPLE)).assertEqual('/chenhaiwen2/cases/raw/main/icon_main_color.png');
      expect(isHttpUrl(FTP_SAMPLE)).assertFalse();
      expect(isHttpsUrl(FTP_SAMPLE)).assertFalse();
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   urlMatrixFileSchemeClassified
     * @tc.desc   A file literal has an empty authority but keeps its path and name.
     * @tc.precondition  A local file literal is declared at the top of the suite.
     * @tc.steps         1. Extract scheme, host, path and file name.
     *                   2. Read the extension of the literal.
     *                   3. Confirm the configuration rejects the scheme.
     * @tc.expected      Scheme file, empty host, full path and a png extension.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixFileSchemeClassified', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl(FILE_SAMPLE);
      expect(schemeOf(FILE_SAMPLE)).assertEqual('file');
      expect(hostOf(FILE_SAMPLE)).assertEqual('');
      expect(pathOf(FILE_SAMPLE)).assertEqual('/tmp/media/icon_main_color.png');
      expect(fileNameOf(FILE_SAMPLE)).assertEqual('icon_main_color.png');
      expect(extensionOf(FILE_SAMPLE)).assertEqual('.png');
      expect(config.validate().length).assertEqual(1);
      expect(countOf(config.validate(), 'url-not-https')).assertEqual(1);
    });

    /**
     * @tc.name   urlMatrixSchemeIsCaseSensitive
     * @tc.desc   Upper and mixed case https spellings fail the prefix predicate.
     * @tc.precondition  Three case variants of the same literal are built inline.
     * @tc.steps         1. Read the scheme text of the upper case variant.
     *                   2. Evaluate the https predicate for all three variants.
     *                   3. Confirm only the lower case variant validates.
     * @tc.expected      The scheme text keeps its case and only lowercase https is accepted.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixSchemeIsCaseSensitive', 0, () => {
      const upper: string = 'HTTPS://gitee.com/chenhaiwen2/cases/raw/main/icon_main_color.png';
      const mixed: string = 'Https://gitee.com/chenhaiwen2/cases/raw/main/icon_main_color.png';
      expect(schemeOf(upper)).assertEqual('HTTPS');
      expect(schemeOf(mixed)).assertEqual('Https');
      expect(isHttpsUrl(upper)).assertFalse();
      expect(isHttpsUrl(mixed)).assertFalse();
      expect(isHttpsUrl(HTTPS_SAMPLE)).assertTrue();
      expect(DownloadConfig.forUrl(upper).validate()[0]).assertEqual('url-not-https');
      expect(DownloadConfig.forUrl(HTTPS_SAMPLE).isValid()).assertTrue();
    });

    /**
     * @tc.name   urlMatrixSchemeRequiresDoubleSlash
     * @tc.desc   A single slash after the scheme is not recognized as an authority marker.
     * @tc.precondition  Malformed literals are built inline after the beforeEach yield.
     * @tc.steps         1. Read scheme and host of the single slash literal.
     *                   2. Read the path and file name of the same literal.
     *                   3. Confirm a bare https marker still validates.
     * @tc.expected      The single slash form has no scheme while the bare marker does.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixSchemeRequiresDoubleSlash', 0, () => {
      const single: string = 'https:/gitee.com/chenhaiwen2/icon_main_color.png';
      expect(schemeOf(single)).assertEqual('');
      expect(hostOf(single)).assertEqual('');
      expect(pathOf(single)).assertEqual('/gitee.com/chenhaiwen2/icon_main_color.png');
      expect(fileNameOf(single)).assertEqual('icon_main_color.png');
      expect(isHttpsUrl(single)).assertFalse();
      expect(DownloadConfig.forUrl('https://').isValid()).assertTrue();
      expect(DownloadConfig.forUrl(single).validate()[0]).assertEqual('url-not-https');
    });

    /**
     * @tc.name   urlMatrixEmptySchemeForRelativePath
     * @tc.desc   A relative media path has no scheme and no host at all.
     * @tc.precondition  A relative literal is built inline after the beforeEach yield.
     * @tc.steps         1. Read scheme and host of the relative literal.
     *                   2. Read the path and file name.
     *                   3. Confirm the configuration reports url-not-https.
     * @tc.expected      The scheme and host are empty and the https rule rejects the path.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixEmptySchemeForRelativePath', 0, () => {
      const relative: string = 'media/icon_main_color.png';
      const config: DownloadConfig = DownloadConfig.forUrl(relative);
      expect(schemeOf(relative)).assertEqual('');
      expect(hostOf(relative)).assertEqual('');
      expect(pathOf(relative)).assertEqual('/icon_main_color.png');
      expect(extensionOf(relative)).assertEqual('.png');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
    });

    /**
     * @tc.name   urlMatrixCredentialsRedacted
     * @tc.desc   user:password before the host is replaced by a three star marker.
     * @tc.precondition  A credential bearing literal is built inline.
     * @tc.steps         1. Build the literal with user and secret.
     *                   2. Apply redactCredentials once.
     *                   3. Confirm the secret is gone and the host survives.
     * @tc.expected      The redacted text starts with https://***@ and hides the secret.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlMatrixCredentialsRedacted', 0, () => {
      const secret: string = 'https://user:secret@gitee.com/media/icon_main_color.png';
      const redacted: string = redactCredentials(secret);
      expect(redacted).assertEqual('https://***@gitee.com/media/icon_main_color.png');
      expect(redacted.indexOf('secret')).assertEqual(-1);
      expect(redacted.indexOf('user')).assertEqual(-1);
      expect(redacted.startsWith('https://***@')).assertTrue();
      expect(redacted.endsWith('icon_main_color.png')).assertTrue();
      expect(hostOf(secret).indexOf('@')).assertLarger(0);
      expect(isHttpsUrl(redacted)).assertTrue();
    });

    /**
     * @tc.name   urlMatrixCredentialsWithoutSchemeUntouched
     * @tc.desc   Without an authority marker the redaction helper returns the input.
     * @tc.precondition  A schemeless credential literal is built inline.
     * @tc.steps         1. Build a user@host literal without a scheme.
     *                   2. Apply redactCredentials.
     *                   3. Compare the result with the input.
     * @tc.expected      The helper is a no-op and the original text is unchanged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixCredentialsWithoutSchemeUntouched', 0, () => {
      const bare: string = 'user:secret@gitee.com/media/icon_main_color.png';
      const redacted: string = redactCredentials(bare);
      expect(redacted).assertEqual(bare);
      expect(redacted.indexOf('secret')).assertLarger(0);
      expect(redacted.indexOf('***')).assertEqual(-1);
      expect(schemeOf(bare)).assertEqual('');
      expect(redactCredentials('')).assertEqual('');
      expect(redactCredentials('').length).assertEqual(0);
    });

    /**
     * @tc.name   urlMatrixMultipleAtSignsKeepLastSplit
     * @tc.desc   The first at sign is chosen, so the remainder still contains one.
     * @tc.precondition  A double at sign literal is built inline.
     * @tc.steps         1. Build https://a@b@gitee.com/c.png.
     *                   2. Apply redactCredentials.
     *                   3. Count the markers and the remaining at signs.
     * @tc.expected      One three star marker is inserted and one at sign survives.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixMultipleAtSignsKeepLastSplit', 0, () => {
      const multipleAtUrl: string = 'https://a@b@gitee.com/media/icon_main_color.png';
      const redacted: string = redactCredentials(multipleAtUrl);
      expect(redacted).assertEqual('https://***@b@gitee.com/media/icon_main_color.png');
      expect(redacted.indexOf('***@')).assertEqual(8);
      expect(redacted.indexOf('@b@')).assertLarger(0);
      expect(redacted.indexOf('a@')).assertEqual(-1);
      expect(redacted.endsWith('icon_main_color.png')).assertTrue();
      expect(schemeOf(redacted)).assertEqual('https');
    });

    /**
     * @tc.name   urlMatrixCredentialsWithPortRedacted
     * @tc.desc   A port after the host is preserved when credentials are hidden.
     * @tc.precondition  A credential literal with an explicit port is built inline.
     * @tc.steps         1. Read the host of the original literal.
     *                   2. Apply redactCredentials.
     *                   3. Confirm the port and path survive.
     * @tc.expected      The redacted text keeps :8443 and the media path.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixCredentialsWithPortRedacted', 0, () => {
      const ported: string = 'https://admin:pw@gitee.com:8443/media/icon_main_color.png';
      const redacted: string = redactCredentials(ported);
      expect(hostOf(ported)).assertEqual('admin:pw@gitee.com:8443');
      expect(redacted).assertEqual('https://***@gitee.com:8443/media/icon_main_color.png');
      expect(redacted.indexOf(':8443')).assertLarger(0);
      expect(redacted.indexOf('admin')).assertEqual(-1);
      expect(pathOf(redacted)).assertEqual('/media/icon_main_color.png');
      expect(isHttpsUrl(redacted)).assertTrue();
    });

    /**
     * @tc.name   urlMatrixAtSignInPathTreatedAsCredentials
     * @tc.desc   The helper splits on the first at sign even when it belongs to a path.
     * @tc.precondition  A path literal containing an at sign is built inline.
     * @tc.steps         1. Build a literal whose file name contains an at sign.
     *                   2. Apply redactCredentials and read the host.
     *                   3. Compare the file name before and after redaction.
     * @tc.expected      The authority is collapsed, which is the documented trade-off.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixAtSignInPathTreatedAsCredentials', 0, () => {
      const literal: string = 'https://gitee.com/media/a@b.png';
      const redacted: string = redactCredentials(literal);
      expect(redacted).assertEqual('https://***@b.png');
      expect(hostOf(literal)).assertEqual('gitee.com');
      expect(hostOf(redacted)).assertEqual('***@b.png');
      expect(fileNameOf(literal)).assertEqual('a@b.png');
      expect(fileNameOf(redacted)).assertEqual('***@b.png');
      expect(redacted.indexOf('gitee.com')).assertEqual(-1);
      expect(redacted.startsWith('https://')).assertTrue();
    });

    /**
     * @tc.name   urlMatrixCredentialsRedactionIsIdempotent
     * @tc.desc   A second redaction pass over masked text changes nothing.
     * @tc.precondition  A credential literal is built inline.
     * @tc.steps         1. Apply redactCredentials to the literal.
     *                   2. Apply the helper again to the result.
     *                   3. Compare both outputs.
     * @tc.expected      Both passes produce the identical masked authority.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixCredentialsRedactionIsIdempotent', 0, () => {
      const literal: string = 'https://user:secret@gitee.com/media/icon_main_color.png';
      const once: string = redactCredentials(literal);
      const twice: string = redactCredentials(once);
      expect(once).assertEqual(twice);
      expect(countOf(once.substring(once.indexOf('://') + 3).split('@'), '***')).assertEqual(1);
      expect(twice.split('@').length).assertEqual(2);
      expect(twice.indexOf('secret')).assertEqual(-1);
      expect(extensionOf(twice)).assertEqual('.png');
    });

    /**
     * @tc.name   urlMatrixRedactQueryRemovesToken
     * @tc.desc   Everything from the first question mark is dropped from the log form.
     * @tc.precondition  A signed literal is built inline.
     * @tc.steps         1. Read queryOf and hasQuery of the signed literal.
     *                   2. Apply redactQuery.
     *                   3. Confirm the token and marker are gone.
     * @tc.expected      The redacted form ends at the file name and has no token.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlMatrixRedactQueryRemovesToken', 0, () => {
      const signed: string = 'https://gitee.com/media/icon_main_color.png?token=abc123';
      const redacted: string = redactQuery(signed);
      expect(hasQuery(signed)).assertTrue();
      expect(queryOf(signed)).assertEqual('?token=abc123');
      expect(redacted).assertEqual('https://gitee.com/media/icon_main_color.png');
      expect(redacted.indexOf('token')).assertEqual(-1);
      expect(redacted.indexOf('abc123')).assertEqual(-1);
      expect(redacted.indexOf('?')).assertEqual(-1);
      expect(hasQuery(redacted)).assertFalse();
    });

    /**
     * @tc.name   urlMatrixRedactQueryWithoutMarkerIsNoop
     * @tc.desc   A literal without a query is returned unchanged by the redactor.
     * @tc.precondition  The seeded task B literal is read after the beforeEach yield.
     * @tc.steps         1. Confirm the seeded literal has no query marker.
     *                   2. Apply redactQuery.
     *                   3. Compare length and content with the input.
     * @tc.expected      The redacted text equals the input and queryOf is empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlMatrixRedactQueryWithoutMarkerIsNoop', 0, () => {
      const redacted: string = redactQuery(URL_TASK_B);
      expect(hasQuery(URL_TASK_B)).assertFalse();
      expect(queryOf(URL_TASK_B)).assertEqual('');
      expect(redacted).assertEqual(URL_TASK_B);
      expect(redacted.length).assertEqual(URL_TASK_B.length);
      expect(redactQuery('').length).assertEqual(0);
      expect(fileNameOf(redacted)).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   urlMatrixEmptyQueryMarkerStillRedacted
     * @tc.desc   A trailing question mark alone counts as a query and is stripped.
     * @tc.precondition  A literal ending with a bare marker is built inline.
     * @tc.steps         1. Confirm hasQuery sees the bare marker.
     *                   2. Read queryOf of the literal.
     *                   3. Apply redactQuery and read the result.
     * @tc.expected      The query is exactly one character and the redacted form drops it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixEmptyQueryMarkerStillRedacted', 0, () => {
      const bareMarker: string = 'https://gitee.com/media/icon_main_color.png?';
      expect(hasQuery(bareMarker)).assertTrue();
      expect(queryOf(bareMarker)).assertEqual('?');
      expect(queryOf(bareMarker).length).assertEqual(1);
      expect(redactQuery(bareMarker)).assertEqual('https://gitee.com/media/icon_main_color.png');
      expect(redactQuery(bareMarker).endsWith('?')).assertFalse();
      expect(extensionOf(redactQuery(bareMarker))).assertEqual('.png');
    });

    /**
     * @tc.name   urlMatrixQueryOfIncludesMarkerAndOrder
     * @tc.desc   The query keeps the leading marker and the original parameter order.
     * @tc.precondition  A two parameter literal is built inline.
     * @tc.steps         1. Read queryOf of the literal.
     *                   2. Split the query on the ampersand separator.
     *                   3. Confirm pathOf excludes the query.
     * @tc.expected      The query starts with a marker and lists b before a.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixQueryOfIncludesMarkerAndOrder', 0, () => {
      const twoParams: string = 'https://gitee.com/media/icon_main_color.png?b=2&a=1';
      const query: string = queryOf(twoParams);
      expect(query).assertEqual('?b=2&a=1');
      expect(query.startsWith('?')).assertTrue();
      expect(query.split('&').length).assertEqual(2);
      expect(query.indexOf('b=2')).assertEqual(1);
      expect(query.indexOf('a=1')).assertLarger(1);
      expect(pathOf(twoParams)).assertEqual('/media/icon_main_color.png');
      expect(pathOf(twoParams).indexOf('?')).assertEqual(-1);
    });

    /**
     * @tc.name   urlMatrixFragmentSurvivesQueryRedaction
     * @tc.desc   A fragment without a query is kept, while a query removes a later fragment.
     * @tc.precondition  Two fragment literals are built inline.
     * @tc.steps         1. Read the path and file name of the fragment literal.
     *                   2. Confirm redactQuery keeps it when no marker exists.
     *                   3. Confirm a query before the fragment removes both.
     * @tc.expected      The bare fragment is retained in path and name, the signed one is not.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixFragmentSurvivesQueryRedaction', 0, () => {
      const fragment: string = 'https://gitee.com/media/icon_main_color.png#preview';
      const signed: string = 'https://gitee.com/media/icon_main_color.png?token=x#preview';
      expect(hasQuery(fragment)).assertFalse();
      expect(redactQuery(fragment)).assertEqual(fragment);
      expect(pathOf(fragment)).assertEqual('/media/icon_main_color.png#preview');
      expect(fileNameOf(fragment)).assertEqual('icon_main_color.png#preview');
      expect(redactQuery(signed).indexOf('#preview')).assertEqual(-1);
      expect(redactQuery(signed)).assertEqual('https://gitee.com/media/icon_main_color.png');
      expect(extensionOf(fragment)).assertEqual('.png#preview');
    });

    /**
     * @tc.name   urlMatrixHasQueryDetectsMarkerAnywhere
     * @tc.desc   The predicate is a plain search for the first question mark.
     * @tc.precondition  Four literals are built inline.
     * @tc.steps         1. Evaluate hasQuery on plain, query, fragment and double query forms.
     *                   2. Read the marker index of the double query form.
     *                   3. Confirm the empty string has no query.
     * @tc.expected      Only literals containing a question mark report true.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixHasQueryDetectsMarkerAnywhere', 0, () => {
      const plain: string = 'https://gitee.com/media/icon_main_color.png';
      const fragment: string = 'https://gitee.com/media/icon_main_color.png#top';
      const doubled: string = 'https://gitee.com/media/icon_main_color.png?a=1?b=2';
      expect(hasQuery(plain)).assertFalse();
      expect(hasQuery(fragment)).assertFalse();
      expect(hasQuery(doubled)).assertTrue();
      expect(doubled.indexOf('?')).assertLarger(0);
      expect(queryOf(doubled)).assertEqual('?a=1?b=2');
      expect(queryOf(doubled).split('?').length).assertEqual(3);
      expect(hasQuery('')).assertFalse();
    });

    /**
     * @tc.name   urlMatrixRedactionLayersCompose
     * @tc.desc   Credential and query redaction commute on a signed credential URL.
     * @tc.precondition  A literal with both a user info block and a token is built inline.
     * @tc.steps         1. Apply query redaction and then credential redaction.
     *                   2. Apply credential redaction and then query redaction.
     *                   3. Compare both results with the expected masked text.
     * @tc.expected      Both orders yield the same masked literal with no secret left.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixRedactionLayersCompose', 0, () => {
      const both: string = 'https://user:pw@gitee.com/media/icon_main_color.png?token=abc123';
      const queryFirst: string = redactCredentials(redactQuery(both));
      const credentialsFirst: string = redactQuery(redactCredentials(both));
      expect(queryFirst).assertEqual(credentialsFirst);
      expect(queryFirst).assertEqual('https://***@gitee.com/media/icon_main_color.png');
      expect(queryFirst.indexOf('user')).assertEqual(-1);
      expect(queryFirst.indexOf('pw')).assertEqual(-1);
      expect(queryFirst.indexOf('token')).assertEqual(-1);
      expect(queryFirst.startsWith('https://***@')).assertTrue();
    });

    /**
     * @tc.name   urlMatrixHostKeepsExplicitPort
     * @tc.desc   An explicit port stays inside the host field and does not move to the path.
     * @tc.precondition  A port bearing literal is built inline.
     * @tc.steps         1. Read the host and the path of the literal.
     *                   2. Split the host on the colon separator.
     *                   3. Confirm the configuration still validates.
     * @tc.expected      The host is gitee.com:8443, the path starts at the slash and rules pass.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixHostKeepsExplicitPort', 0, () => {
      const ported: string = 'https://gitee.com:8443/media/icon_main_color.png';
      const host: string = hostOf(ported);
      expect(host).assertEqual('gitee.com:8443');
      expect(host.split(':').length).assertEqual(2);
      expect(host.split(':')[1]).assertEqual('8443');
      expect(pathOf(ported)).assertEqual('/media/icon_main_color.png');
      expect(pathOf(ported).indexOf(':')).assertEqual(-1);
      expect(DownloadConfig.forUrl(ported).isValid()).assertTrue();
      expect(fileNameOf(ported)).assertEqual('icon_main_color.png');
    });

    /**
     * @tc.name   urlMatrixHostWithoutPathIsAuthority
     * @tc.desc   With no path the host helper returns the whole authority text.
     * @tc.precondition  An authority only literal is built inline.
     * @tc.steps         1. Read host and path of the authority literal.
     *                   2. Read the derived file name and extension.
     *                   3. Confirm the configuration accepts the literal.
     * @tc.expected      The host keeps the port and the derived name is the authority text.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixHostWithoutPathIsAuthority', 0, () => {
      const authority: string = 'https://gitee.com:8443';
      expect(hostOf(authority)).assertEqual('gitee.com:8443');
      expect(pathOf(authority)).assertEqual('');
      expect(fileNameOf(authority)).assertEqual('gitee.com:8443');
      expect(extensionOf(authority)).assertEqual('.com:8443');
      expect(fileNameOf(authority, 'file')).assertEqual('gitee.com:8443');
      expect(isHttpsUrl(authority)).assertTrue();
      expect(DownloadConfig.forUrl(authority).validate().length).assertEqual(0);
    });

    /**
     * @tc.name   urlMatrixPortDoesNotAffectScheme
     * @tc.desc   Ports on http, https and ftp literals never change the scheme verdict.
     * @tc.precondition  Three port bearing literals are built inline.
     * @tc.steps         1. Read the scheme of each port bearing literal.
     *                   2. Evaluate both scheme predicates.
     *                   3. Confirm only the https literal validates.
     * @tc.expected      The scheme text ignores the port and only https passes the rule.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixPortDoesNotAffectScheme', 0, () => {
      const httpsPort: string = 'https://gitee.com:9443/media/icon_main_color.png';
      const httpPort: string = 'http://gitee.com:8080/media/icon_main_color.png';
      const ftpPort: string = 'ftp://gitee.com:2121/media/icon_main_color.png';
      expect(schemeOf(httpsPort)).assertEqual('https');
      expect(schemeOf(httpPort)).assertEqual('http');
      expect(schemeOf(ftpPort)).assertEqual('ftp');
      expect(isHttpsUrl(httpsPort)).assertTrue();
      expect(isHttpsUrl(httpPort)).assertFalse();
      expect(DownloadConfig.forUrl(httpsPort).isValid()).assertTrue();
      expect(DownloadConfig.forUrl(httpPort).validate()[0]).assertEqual('url-not-https');
    });

    /**
     * @tc.name   urlMatrixConfigAcceptsPortOnHttps
     * @tc.desc   The rule list does not forbid an explicit 443 port on an https literal.
     * @tc.precondition  An https literal with the default port is built inline.
     * @tc.steps         1. Build the configuration and read its describe text.
     *                   2. Run the rule list.
     *                   3. Confirm the port is still visible in the URL field.
     * @tc.expected      The config is valid and the describe text carries the ported URL.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigAcceptsPortOnHttps', 0, () => {
      const ported: string = 'https://gitee.com:443/media/icon_main_color.png';
      const config: DownloadConfig = DownloadConfig.forUrl(ported);
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(config.describe()).assertEqual('DOWNLOAD|GET|true|./|' + ported);
      expect(config.describe().indexOf(':443')).assertLarger(0);
      expect(config.url).assertEqual(ported);
      expect(config.fileName()).assertEqual('icon_main_color.png');
      expect(sameStringArray(config.validate(), [])).assertTrue();
    });

    /**
     * @tc.name   urlMatrixMalformedEmptyHostStillValid
     * @tc.desc   The rule list checks the scheme only, so an empty host still validates.
     * @tc.precondition  A triple slash literal is built inline.
     * @tc.steps         1. Read scheme, host and path of the triple slash literal.
     *                   2. Build the configuration and run the rule list.
     *                   3. Confirm isValid reports true despite the empty host.
     * @tc.expected      The host field is empty while the configuration is accepted.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixMalformedEmptyHostStillValid', 0, () => {
      const triple: string = 'https:///media/icon_main_color.png';
      const config: DownloadConfig = DownloadConfig.forUrl(triple);
      expect(schemeOf(triple)).assertEqual('https');
      expect(hostOf(triple)).assertEqual('');
      expect(pathOf(triple)).assertEqual('/media/icon_main_color.png');
      expect(config.isValid()).assertTrue();
      expect(config.validate().length).assertEqual(0);
      expect(isHttpsUrl(triple)).assertTrue();
      expect(hostOf(triple).length).assertEqual(0);
    });

    /**
     * @tc.name   urlMatrixMalformedSchemelessHostLikePath
     * @tc.desc   A host-like literal without a scheme is parsed as a relative path.
     * @tc.precondition  A schemeless literal is built inline.
     * @tc.steps         1. Read scheme and host of the schemeless literal.
     *                   2. Read the path fragment that the helper extracts.
     *                   3. Run the rule list on the derived configuration.
     * @tc.expected      The scheme is empty, the path drops the first segment and one error fires.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixMalformedSchemelessHostLikePath', 0, () => {
      const schemeless: string = 'gitee.com/media/icon_main_color.png';
      const config: DownloadConfig = DownloadConfig.forUrl(schemeless);
      expect(schemeOf(schemeless)).assertEqual('');
      expect(hostOf(schemeless)).assertEqual('');
      expect(pathOf(schemeless)).assertEqual('/media/icon_main_color.png');
      expect(fileNameOf(schemeless)).assertEqual('icon_main_color.png');
      expect(config.validate().length).assertEqual(1);
      expect(config.validate()[0]).assertEqual('url-not-https');
      expect(isHttpUrl(schemeless)).assertFalse();
    });

    /**
     * @tc.name   urlMatrixMalformedSpacesStillStringChecks
     * @tc.desc   A space is kept verbatim because every helper is a pure string operation.
     * @tc.precondition  A literal with an embedded space is built inline.
     * @tc.steps         1. Read scheme, host and file name of the spaced literal.
     *                   2. Count the space separated segments.
     *                   3. Run the rule list and confirm no space rule exists.
     * @tc.expected      The space survives in the name and the https rule still accepts it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixMalformedSpacesStillStringChecks', 0, () => {
      const spaced: string = 'https://gitee.com/media/icon main color.png';
      expect(schemeOf(spaced)).assertEqual('https');
      expect(hostOf(spaced)).assertEqual('gitee.com');
      expect(fileNameOf(spaced)).assertEqual('icon main color.png');
      expect(fileNameOf(spaced).split(' ').length).assertEqual(3);
      expect(fileNameOf(spaced).indexOf(' ')).assertEqual(4);
      expect(DownloadConfig.forUrl(spaced).isValid()).assertTrue();
      expect(extensionOf(spaced)).assertEqual('.png');
    });

    /**
     * @tc.name   urlMatrixMalformedEmptyUrlProducesErrors
     * @tc.desc   An empty URL fires both the empty rule and the https rule.
     * @tc.precondition  An empty literal is supplied to the configuration factory.
     * @tc.steps         1. Run the rule list on the empty configuration.
     *                   2. Read each error in order.
     *                   3. Read the fallback file name and the describe text.
     * @tc.expected      Two ordered errors are reported and the fallback name is used.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlMatrixMalformedEmptyUrlProducesErrors', 0, () => {
      const config: DownloadConfig = DownloadConfig.forUrl('');
      const errors: string[] = config.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('url-empty');
      expect(errors[1]).assertEqual('url-not-https');
      expect(config.isValid()).assertFalse();
      expect(config.fileName()).assertEqual('file');
      expect(fileNameOf('')).assertEqual('file');
      expect(config.describe()).assertEqual('DOWNLOAD|GET|true|./|');
      expect(hostOf('')).assertEqual('');
    });

    /**
     * @tc.name   urlMatrixMalformedTrailingSlashFallsBackName
     * @tc.desc   A slash terminated path yields the default file name and no extension.
     * @tc.precondition  A trailing slash literal is built inline.
     * @tc.steps         1. Read the host and path of the trailing slash literal.
     *                   2. Read the derived name and extension.
     *                   3. Confirm a custom fallback replaces the default.
     * @tc.expected      The name falls back to file, the extension is empty and the host is intact.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixMalformedTrailingSlashFallsBackName', 0, () => {
      const trailing: string = 'https://gitee.com/media/';
      expect(hostOf(trailing)).assertEqual('gitee.com');
      expect(pathOf(trailing)).assertEqual('/media/');
      expect(fileNameOf(trailing)).assertEqual('file');
      expect(fileNameOf(trailing, 'asset')).assertEqual('asset');
      expect(extensionOf(trailing)).assertEqual('');
      expect(DownloadConfig.forUrl(trailing).isValid()).assertTrue();
      expect(trailing.endsWith('/')).assertTrue();
    });

    /**
     * @tc.name   urlMatrixHostOfMarkerOnlyAndEmptyInputs
     * @tc.desc   An empty string, a marker only literal and a scheme relative literal.
     * @tc.precondition  Three degenerate literals are built inline.
     * @tc.steps         1. Read the host of the empty string and the marker only literal.
     *                   2. Read the host of a protocol relative literal.
     *                   3. Confirm a plain authority still reports its host.
     * @tc.expected      Only the complete authority literal reports a non-empty host.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixHostOfMarkerOnlyAndEmptyInputs', 0, () => {
      const markerOnly: string = 'https://';
      const relative: string = '//gitee.com/media/icon_main_color.png';
      expect(hostOf('')).assertEqual('');
      expect(hostOf(markerOnly)).assertEqual('');
      expect(hostOf(relative)).assertEqual('');
      expect(schemeOf(relative)).assertEqual('');
      expect(hostOf('http://gitee.com')).assertEqual('gitee.com');
      expect(pathOf(markerOnly)).assertEqual('');
      expect(fileNameOf(markerOnly)).assertEqual('file');
    });

    /**
     * @tc.name   urlMatrixMalformedDoubleSlashPathPreserved
     * @tc.desc   Repeated slashes inside the path are preserved by the extractor.
     * @tc.precondition  A literal with doubled path separators is built inline.
     * @tc.steps         1. Read the path of the doubled separator literal.
     *                   2. Split the path on the slash separator.
     *                   3. Confirm the file name and the configuration verdict.
     * @tc.expected      The path keeps both pairs of slashes and the file name is unchanged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixMalformedDoubleSlashPathPreserved', 0, () => {
      const doubled: string = 'https://gitee.com//media//icon_main_color.png';
      const path: string = pathOf(doubled);
      expect(path).assertEqual('//media//icon_main_color.png');
      expect(path.split('/').length).assertEqual(5);
      expect(path.startsWith('//')).assertTrue();
      expect(fileNameOf(doubled)).assertEqual('icon_main_color.png');
      expect(hostOf(doubled)).assertEqual('gitee.com');
      expect(DownloadConfig.forUrl(doubled).isValid()).assertTrue();
      expect(path.indexOf('//media//')).assertEqual(0);
    });

    /**
     * @tc.name   urlMatrixConfigErrorsAccumulate
     * @tc.desc   Five independent rule violations are reported in declaration order.
     * @tc.precondition  A configuration is built with every field set illegally.
     * @tc.steps         1. Run the rule list on the illegal configuration.
     *                   2. Read the error count and each entry.
     *                   3. Join the errors into one text and compare.
     * @tc.expected      Five errors appear in the documented order.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigErrorsAccumulate', 0, () => {
      const broken: DownloadConfig = new DownloadConfig('UPLOAD', HTTP_SAMPLE, false, 'PUT', '/tmp');
      const errors: string[] = broken.validate();
      expect(errors.length).assertEqual(5);
      expect(errors[0]).assertEqual('url-not-https');
      expect(errors[1]).assertEqual('action-not-download');
      expect(errors[2]).assertEqual('method-unsupported');
      expect(errors[3]).assertEqual('overwrite-disabled');
      expect(errors[4]).assertEqual('saveas-not-cache');
      expect(joined(errors, ',')).assertEqual('url-not-https,action-not-download,method-unsupported,' +
        'overwrite-disabled,saveas-not-cache');
      expect(broken.isValid()).assertFalse();
    });

    /**
     * @tc.name   urlMatrixConfigValidForEveryTaskUrl
     * @tc.desc   The three seeded literals all produce valid, distinct download configs.
     * @tc.precondition  The seeded URL constants are loaded after the beforeEach yield.
     * @tc.steps         1. Build a configuration for each seeded literal.
     *                   2. Collect the derived file names and rule counts.
     *                   3. Compare factories with the independent oracle.
     * @tc.expected      All three validate, their names are unique and the oracle agrees.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigValidForEveryTaskUrl', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      const names: string[] = [];
      let totalErrors: number = 0;
      for (let index = 0; index < urls.length; index++) {
        const config: DownloadConfig = DownloadConfig.forUrl(urls[index]);
        expect(config.isValid()).assertTrue();
        totalErrors = totalErrors + config.validate().length;
        names.push(config.fileName());
      }
      expect(totalErrors).assertEqual(0);
      expect(uniqueStrings(names).length).assertEqual(3);
      expect(sameStringArray(uniqueStrings(names), names)).assertTrue();
      expect(expectedConfigFor(TASK_A).sameAs(DownloadConfig.forUrl(URL_TASK_A))).assertTrue();
      expect(expectedConfigFor(TASK_C).sameAs(DownloadConfig.forUrl(URL_TASK_C))).assertTrue();
      expect(expectedConfigFor(TASK_B).fileName()).assertEqual('after_cache.png');
    });

    /**
     * @tc.name   urlMatrixConfigRejectsWrongAction
     * @tc.desc   Only the DOWNLOAD action is accepted by the rule list.
     * @tc.precondition  An otherwise valid configuration carries a wrong action.
     * @tc.steps         1. Build a configuration with action UPLOAD.
     *                   2. Run the rule list.
     *                   3. Compare the action field with the constant.
     * @tc.expected      Exactly one action-not-download error is reported.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('urlMatrixConfigRejectsWrongAction', 0, () => {
      const wrongAction: DownloadConfig = new DownloadConfig('UPLOAD', HTTPS_SAMPLE, CONFIG_OVERWRITE,
        CONFIG_METHOD_GET, CONFIG_SAVEAS_CACHE);
      const errors: string[] = wrongAction.validate();
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('action-not-download');
      expect(wrongAction.action).assertEqual('UPLOAD');
      expect(wrongAction.action === CONFIG_ACTION_DOWNLOAD).assertFalse();
      expect(wrongAction.isValid()).assertFalse();
      expect(wrongAction.clone().action).assertEqual('UPLOAD');
    });

    /**
     * @tc.name   urlMatrixConfigRejectsUnsupportedMethod
     * @tc.desc   GET and POST pass while PUT and DELETE fail the method rule.
     * @tc.precondition  Four configurations share an https literal.
     * @tc.steps         1. Build configurations with GET, POST, PUT and DELETE.
     *                   2. Run the rule list on each one.
     *                   3. Compare the failing error text.
     * @tc.expected      GET and POST are valid while PUT and DELETE report method-unsupported.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigRejectsUnsupportedMethod', 0, () => {
      const get: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'GET', './');
      const post: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'POST', './');
      const put: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'PUT', './');
      const remove: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'DELETE', './');
      expect(get.isValid()).assertTrue();
      expect(post.isValid()).assertTrue();
      expect(put.validate().length).assertEqual(1);
      expect(put.validate()[0]).assertEqual('method-unsupported');
      expect(remove.validate().length).assertEqual(1);
      expect(remove.validate()[0]).assertEqual('method-unsupported');
      expect(put.isValid()).assertFalse();
      expect(get.method).assertEqual(CONFIG_METHOD_GET);
      expect(remove.method).assertEqual('DELETE');
    });

    /**
     * @tc.name   urlMatrixConfigRejectsDisabledOverwrite
     * @tc.desc   overwrite must be true because the page always replaces the cache file.
     * @tc.precondition  Two configurations differ only in the overwrite flag.
     * @tc.steps         1. Build one configuration with overwrite true and one with false.
     *                   2. Run the rule list on both.
     *                   3. Compare the overwrite field with the constant.
     * @tc.expected      The true flag validates while the false flag reports overwrite-disabled.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigRejectsDisabledOverwrite', 0, () => {
      const enabled: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'GET', './');
      const disabled: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, false, 'GET', './');
      expect(enabled.isValid()).assertTrue();
      expect(disabled.validate().length).assertEqual(1);
      expect(disabled.validate()[0]).assertEqual('overwrite-disabled');
      expect(disabled.isValid()).assertFalse();
      expect(enabled.overwrite).assertEqual(CONFIG_OVERWRITE);
      expect(disabled.overwrite).assertFalse();
      expect(disabled.describe().indexOf('false')).assertLarger(0);
    });

    /**
     * @tc.name   urlMatrixConfigRejectsWrongSaveas
     * @tc.desc   The cache directory literal './' is the only accepted saveas value.
     * @tc.precondition  Three configurations carry different saveas values.
     * @tc.steps         1. Build configurations with the cache, temp and absolute directories.
     *                   2. Run the rule list on each one.
     *                   3. Compare the saveas field with the constant.
     * @tc.expected      Only the cache directory validates and the others report saveas-not-cache.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigRejectsWrongSaveas', 0, () => {
      const cache: DownloadConfig = DownloadConfig.forUrl(HTTPS_SAMPLE);
      const temp: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'GET', '/tmp');
      const absolute: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'GET', '/data/');
      expect(cache.saveas).assertEqual(CONFIG_SAVEAS_CACHE);
      expect(cache.isValid()).assertTrue();
      expect(temp.validate()[0]).assertEqual('saveas-not-cache');
      expect(absolute.validate()[0]).assertEqual('saveas-not-cache');
      expect(temp.validate().length).assertEqual(1);
      expect(absolute.isValid()).assertFalse();
      expect(temp.saveas).assertEqual('/tmp');
    });

    /**
     * @tc.name   urlMatrixConfigPostAcceptedForHttps
     * @tc.desc   POST is a supported method even though the page issues GET requests.
     * @tc.precondition  A POST configuration over the https sample is built inline.
     * @tc.steps         1. Build the POST configuration and run the rule list.
     *                   2. Clone the configuration and compare the describe text.
     *                   3. Read the method field and the describe prefix.
     * @tc.expected      The POST configuration is valid and its clone is identical.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigPostAcceptedForHttps', 0, () => {
      const post: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, CONFIG_OVERWRITE,
        'POST', CONFIG_SAVEAS_CACHE);
      const clone: DownloadConfig = post.clone();
      expect(post.validate().length).assertEqual(0);
      expect(post.isValid()).assertTrue();
      expect(clone.sameAs(post)).assertTrue();
      expect(clone.describe()).assertEqual(post.describe());
      expect(post.method).assertEqual('POST');
      expect(post.describe().startsWith('DOWNLOAD|POST|true|./|')).assertTrue();
      expect(HTTPS_SAMPLE.endsWith('.png')).assertTrue();
    });

    /**
     * @tc.name   urlMatrixConfigForTaskKeepsSeededLiterals
     * @tc.desc   The task factory mirrors the oracle for A, B, C and degrades on unknown rows.
     * @tc.precondition  The seeded task numbers and literals are loaded.
     * @tc.steps         1. Build configurations through the task and oracle factories.
     *                   2. Compare both describe texts for the three known rows.
     *                   3. Build the configuration for an unknown row.
     * @tc.expected      Known rows agree and the unknown row yields the empty URL error pair.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixConfigForTaskKeepsSeededLiterals', 0, () => {
      expect(DownloadConfig.forTask(TASK_A).sameAs(expectedConfigFor(TASK_A))).assertTrue();
      expect(DownloadConfig.forTask(TASK_B).sameAs(expectedConfigFor(TASK_B))).assertTrue();
      expect(DownloadConfig.forTask(TASK_C).sameAs(expectedConfigFor(TASK_C))).assertTrue();
      expect(DownloadConfig.forTask(TASK_A).url).assertEqual(URL_TASK_A);
      expect(DownloadConfig.forTask(TASK_C).url).assertEqual(URL_TASK_C);
      const unknown: DownloadConfig = DownloadConfig.forTask('Z');
      expect(unknown.url).assertEqual('');
      expect(unknown.validate().length).assertEqual(2);
      expect(unknown.validate()[0]).assertEqual('url-empty');
    });

    /**
     * @tc.name   urlMatrixLoggedFormDropsSecretsForSeededUrls
     * @tc.desc   The seeded literals survive the redaction pipeline without any change.
     * @tc.precondition  The three seeded literals carry no credentials and no query.
     * @tc.steps         1. Run every seeded literal through both redactors.
     *                   2. Compare each result with the original literal.
     *                   3. Confirm no masked marker appears in the log form.
     * @tc.expected      All three log forms equal their sources and contain no marker.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixLoggedFormDropsSecretsForSeededUrls', 0, () => {
      const urls: string[] = [URL_TASK_A, URL_TASK_B, URL_TASK_C];
      for (let index = 0; index < urls.length; index++) {
        const logged: string = redactCredentials(redactQuery(urls[index]));
        expect(logged).assertEqual(urls[index]);
        expect(logged.indexOf('***')).assertEqual(-1);
        expect(logged.indexOf('?')).assertEqual(-1);
      }
      const secret: string = 'https://user:pw@gitee.com/media/a.png?token=1';
      const safe: string = redactCredentials(redactQuery(secret));
      expect(safe).assertEqual('https://***@gitee.com/media/a.png');
      expect(safe.indexOf('token')).assertEqual(-1);
      logStep('UrlSecurityMatrix', safe);
    });

    /**
     * @tc.name   urlMatrixHttpsGuardRejectsSchemeSubstring
     * @tc.desc   A scheme that merely ends with https is not accepted by the prefix guard.
     * @tc.precondition  Two prefixed scheme literals are built inline.
     * @tc.steps         1. Read the scheme text of the prefixed scheme literals.
     *                   2. Evaluate the https predicate for both.
     *                   3. Run the rule list on the configurations.
     * @tc.expected      The prefixed schemes are extracted literally and both fail the guard.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixHttpsGuardRejectsSchemeSubstring', 0, () => {
      const prefixed: string = 'xhttps://gitee.com/media/icon_main_color.png';
      const suffixed: string = 'httpsx://gitee.com/media/icon_main_color.png';
      expect(schemeOf(prefixed)).assertEqual('xhttps');
      expect(schemeOf(suffixed)).assertEqual('httpsx');
      expect(isHttpsUrl(prefixed)).assertFalse();
      expect(isHttpsUrl(suffixed)).assertFalse();
      expect(prefixed.endsWith('icon_main_color.png')).assertTrue();
      expect(DownloadConfig.forUrl(prefixed).validate()[0]).assertEqual('url-not-https');
      expect(DownloadConfig.forUrl(suffixed).validate().length).assertEqual(1);
    });

    /**
     * @tc.name   urlMatrixPortOnlyAuthorityParses
     * @tc.desc   A port with an empty host name is still kept inside the host field.
     * @tc.precondition  A port only authority literal is built inline.
     * @tc.steps         1. Read the host and path of the literal.
     *                   2. Split the host on the colon separator.
     *                   3. Confirm the https rule accepts the literal.
     * @tc.expected      The host is the port text, the path is intact and the config is valid.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixPortOnlyAuthorityParses', 0, () => {
      const portOnly: string = 'https://:8443/media/icon_main_color.png';
      const host: string = hostOf(portOnly);
      expect(host).assertEqual(':8443');
      expect(host.split(':')[0]).assertEqual('');
      expect(host.split(':')[1]).assertEqual('8443');
      expect(pathOf(portOnly)).assertEqual('/media/icon_main_color.png');
      expect(fileNameOf(portOnly)).assertEqual('icon_main_color.png');
      expect(schemeOf(portOnly)).assertEqual('https');
      expect(DownloadConfig.forUrl(portOnly).isValid()).assertTrue();
    });

    /**
     * @tc.name   urlMatrixEncodedCharactersSurvive
     * @tc.desc   Percent encoded names and values are not decoded by the string helpers.
     * @tc.precondition  A percent encoded literal is built inline.
     * @tc.steps         1. Read the file name of the encoded literal.
     *                   2. Read the query and apply redactQuery.
     *                   3. Confirm the extension is still detected.
     * @tc.expected      The encoded name is preserved and the encoded query is removed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixEncodedCharactersSurvive', 0, () => {
      const encoded: string = 'https://gitee.com/media/a%20b.png?q=%2F';
      expect(fileNameOf(encoded)).assertEqual('a%20b.png?q=%2F');
      expect(fileNameOf(encoded).indexOf('%20')).assertLarger(0);
      expect(extensionOf(encoded)).assertEqual('.png?q=%2F');
      expect(queryOf(encoded)).assertEqual('?q=%2F');
      expect(redactQuery(encoded)).assertEqual('https://gitee.com/media/a%20b.png');
      expect(redactQuery(encoded).indexOf('%2F')).assertEqual(-1);
      expect(hasQuery(encoded)).assertTrue();
    });

    /**
     * @tc.name   urlMatrixHttpsLiteralWithFragmentValidates
     * @tc.desc   A fragment does not break the https rule and stays inside the path field.
     * @tc.precondition  A fragment bearing https literal is built inline.
     * @tc.steps         1. Read scheme, host and path of the fragment literal.
     *                   2. Read the derived file name and the query predicate.
     *                   3. Build the configuration and run the rule list.
     * @tc.expected      The config is valid and the fragment is part of the path and name.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixHttpsLiteralWithFragmentValidates', 0, () => {
      const fragment: string = 'https://gitee.com/media/icon_main_color.png#preview';
      const config: DownloadConfig = DownloadConfig.forUrl(fragment);
      expect(schemeOf(fragment)).assertEqual('https');
      expect(hostOf(fragment)).assertEqual('gitee.com');
      expect(pathOf(fragment)).assertEqual('/media/icon_main_color.png#preview');
      expect(fileNameOf(fragment)).assertEqual('icon_main_color.png#preview');
      expect(hasQuery(fragment)).assertFalse();
      expect(redactQuery(fragment)).assertEqual(fragment);
      expect(config.validate().length).assertEqual(0);
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   urlMatrixUserOnlyCredentialsRedacted
     * @tc.desc   A user name without a password is still replaced by the mask marker.
     * @tc.precondition  A user only authority literal is built inline.
     * @tc.steps         1. Read the host of the user only literal.
     *                   2. Apply redactCredentials and read the masked host.
     *                   3. Confirm the file name and extension survive.
     * @tc.expected      The user name disappears and the masked literal keeps host, path and name.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixUserOnlyCredentialsRedacted', 0, () => {
      const userOnly: string = 'https://user@gitee.com/media/icon_main_color.png';
      const redacted: string = redactCredentials(userOnly);
      expect(hostOf(userOnly)).assertEqual('user@gitee.com');
      expect(redacted).assertEqual('https://***@gitee.com/media/icon_main_color.png');
      expect(hostOf(redacted)).assertEqual('***@gitee.com');
      expect(redacted.indexOf('user')).assertEqual(-1);
      expect(redacted.startsWith('https://***@')).assertTrue();
      expect(fileNameOf(redacted)).assertEqual('icon_main_color.png');
      expect(extensionOf(redacted)).assertEqual('.png');
    });

    /**
     * @tc.name   urlMatrixSaveasRelativeVariantsRejected
     * @tc.desc   Only the exact cache literal is accepted, not other relative directories.
     * @tc.precondition  Four configurations differ only in the saveas text.
     * @tc.steps         1. Build configurations with ./cache, ../, an empty string and ./.
     *                   2. Run the rule list on each configuration.
     *                   3. Compare the failing error and the accepted one.
     * @tc.expected      The three variants report saveas-not-cache while the cache literal passes.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('urlMatrixSaveasRelativeVariantsRejected', 0, () => {
      const nested: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'GET', './cache');
      const parent: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'GET', '../');
      const empty: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, true, 'GET', '');
      const cache: DownloadConfig = DownloadConfig.forUrl(HTTPS_SAMPLE);
      expect(nested.validate().length).assertEqual(1);
      expect(nested.validate()[0]).assertEqual('saveas-not-cache');
      expect(parent.validate()[0]).assertEqual('saveas-not-cache');
      expect(empty.validate()[0]).assertEqual('saveas-not-cache');
      expect(cache.validate().length).assertEqual(0);
      expect(cache.isValid()).assertTrue();
      expect(empty.saveas.length).assertEqual(0);
    });

    /**
     * @tc.name   urlMatrixOverwriteAndMethodPairReported
     * @tc.desc   Two independent rule violations keep the method error before the overwrite error.
     * @tc.precondition  A configuration with PATCH and a disabled overwrite is built inline.
     * @tc.steps         1. Build the configuration over the https sample.
     *                   2. Run the rule list and read both errors.
     *                   3. Confirm the fields that caused the errors.
     * @tc.expected      Two ordered errors are reported and no other rule fires.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixOverwriteAndMethodPairReported', 0, () => {
      const pair: DownloadConfig = new DownloadConfig(CONFIG_ACTION_DOWNLOAD, HTTPS_SAMPLE, false, 'PATCH', './');
      const errors: string[] = pair.validate();
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('method-unsupported');
      expect(errors[1]).assertEqual('overwrite-disabled');
      expect(joined(errors, ',')).assertEqual('method-unsupported,overwrite-disabled');
      expect(pair.method).assertEqual('PATCH');
      expect(pair.overwrite).assertFalse();
      expect(pair.isValid()).assertFalse();
      expect(pair.url).assertEqual(HTTPS_SAMPLE);
    });

    /**
     * @tc.name   urlMatrixQueryOnlyNoPathAuthority
     * @tc.desc   A query on a pathless literal is parsed into the authority text by the helpers.
     * @tc.precondition  A pathless https literal with a token is built inline.
     * @tc.steps         1. Read host, path and file name of the pathless literal.
     *                   2. Apply redactQuery and read the shortened literal.
     *                   3. Build the configuration and run the rule list.
     * @tc.expected      The query rides in the host and name fields, and redaction restores a clean host.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixQueryOnlyNoPathAuthority', 0, () => {
      const pathless: string = 'https://gitee.com?token=1';
      expect(schemeOf(pathless)).assertEqual('https');
      expect(hostOf(pathless)).assertEqual('gitee.com?token=1');
      expect(pathOf(pathless)).assertEqual('');
      expect(fileNameOf(pathless)).assertEqual('gitee.com?token=1');
      expect(extensionOf(pathless)).assertEqual('.com?token=1');
      expect(hasQuery(pathless)).assertTrue();
      expect(redactQuery(pathless)).assertEqual('https://gitee.com');
      expect(hostOf(redactQuery(pathless))).assertEqual('gitee.com');
      expect(DownloadConfig.forUrl(pathless).isValid()).assertTrue();
    });

    /**
     * @tc.name   urlMatrixLeadingSpaceRejectsHttpsPrefix
     * @tc.desc   A single leading space joins the scheme text and defeats the https guard.
     * @tc.precondition  A padded literal is built inline.
     * @tc.steps         1. Read the scheme text of the padded literal.
     *                   2. Read host, path and file name of the same literal.
     *                   3. Run the rule list and confirm the guard refusal.
     * @tc.expected      The scheme keeps the space, the host is still found and the config fails.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('urlMatrixLeadingSpaceRejectsHttpsPrefix', 0, () => {
      const padded: string = ' https://gitee.com/media/icon_main_color.png';
      expect(schemeOf(padded)).assertEqual(' https');
      expect(schemeOf(padded).length).assertEqual(6);
      expect(isHttpsUrl(padded)).assertFalse();
      expect(hostOf(padded)).assertEqual('gitee.com');
      expect(pathOf(padded)).assertEqual('/media/icon_main_color.png');
      expect(fileNameOf(padded)).assertEqual('icon_main_color.png');
      expect(DownloadConfig.forUrl(padded).validate().length).assertEqual(1);
      expect(DownloadConfig.forUrl(padded).validate()[0]).assertEqual('url-not-https');
    });
  });
}
