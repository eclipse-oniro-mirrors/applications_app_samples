/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { HttpMethod, HttpUtils } from 'library';

/**
 * Test suite for HttpUtils.
 * @since 26.0.0
 */
const DEFAULT_TIMEOUT: number = 30000;
const BASE_URL: string = 'https://example.com';
const UNKNOWN_TEXT: string = 'Unknown';

export default function httpUtilsTest(): void {
  describe('HttpUtilsTest', () => {
    // ==================== check query string structure build (2 cases) ====================

    /*
     * @tc.number: SUB_HTTP_UTILS_0100
     * @tc.name: testHttpUtils0001
     * @tc.desc: Build query strings from empty, single and multiple parameter records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0001', 0, () => {
      const empty: Record<string, string> = {};
      const single: Record<string, string> = { 'page': '2' };
      const pair: Record<string, string> = { 'name': 'BT Speaker', 'page': '2' };

      expect(HttpUtils.buildQueryString(empty)).assertEqual('');
      expect(HttpUtils.buildQueryString(single)).assertEqual('page=2');
      expect(HttpUtils.buildQueryString(pair)).assertEqual('name=BT%20Speaker&page=2');
      expect(HttpUtils.buildQueryString(pair).indexOf('&')).assertEqual(17);
      expect(HttpUtils.buildQueryString(pair).split('&').length).assertEqual(2);
      expect(HttpUtils.buildQueryString(single).indexOf('=')).assertEqual(4);
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_0200
     * @tc.name: testHttpUtils0002
     * @tc.desc: Escape reserved characters in both parameter names and parameter values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0002', 0, () => {
      const reserved: Record<string, string> = { 'a&b': 'c=d' };
      const spaced: Record<string, string> = { 'q': 'device name' };
      const built: string = HttpUtils.buildQueryString(reserved);
      const spacedBuilt: string = HttpUtils.buildQueryString(spaced);

      expect(built).assertEqual('a%26b=c%3Dd');
      expect(spacedBuilt).assertEqual('q=device%20name');
      expect(built.indexOf(' ')).assertEqual(-1);
      expect(spacedBuilt.indexOf(' ')).assertEqual(-1);
      expect(built.split('&').length).assertEqual(1);
      expect(HttpUtils.parseQueryString(built)['a&b']).assertEqual('c=d');
    });

    // ==================== check query string decode parse (3 cases) ====================

    /*
     * @tc.number: SUB_HTTP_UTILS_0300
     * @tc.name: testHttpUtils0003
     * @tc.desc: Parse an empty string, a bare marker and pairs without a value separator.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0003', 0, () => {
      const empty: Record<string, string> = HttpUtils.parseQueryString('');
      const bare: Record<string, string> = HttpUtils.parseQueryString('?');
      const partial: Record<string, string> = HttpUtils.parseQueryString('a=1&bogus&b=2');

      expect(Object.keys(empty).length).assertEqual(0);
      expect(Object.keys(bare).length).assertEqual(0);
      expect(Object.keys(partial).length).assertEqual(2);
      expect(partial['a']).assertEqual('1');
      expect(partial['b']).assertEqual('2');
      expect(Object.keys(partial).indexOf('bogus')).assertEqual(-1);
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_0400
     * @tc.name: testHttpUtils0004
     * @tc.desc: Handle a leading question mark, empty values, duplicate keys and extra separators.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0004', 0, () => {
      const prefixed: Record<string, string> = HttpUtils.parseQueryString('?device=earbud&mode=a2dp');
      const emptyValue: Record<string, string> = HttpUtils.parseQueryString('k=&x=1');
      const duplicated: Record<string, string> = HttpUtils.parseQueryString('a=1&a=2');
      const extraEquals: Record<string, string> = HttpUtils.parseQueryString('a=b=c');
      const headless: Record<string, string> = HttpUtils.parseQueryString('=v');

      expect(prefixed['device']).assertEqual('earbud');
      expect(prefixed['mode']).assertEqual('a2dp');
      expect(emptyValue['k']).assertEqual('');
      expect(emptyValue['x']).assertEqual('1');
      expect(duplicated['a']).assertEqual('2');
      expect(extraEquals['a']).assertEqual('b=c');
      expect(Object.keys(headless).length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_0500
     * @tc.name: testHttpUtils0005
     * @tc.desc: Round trip parameter records through the builder and the parser unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0005', 0, () => {
      const source: Record<string, string> = { 'address': '00:1A:2B:3C:4D:5E', 'name': 'BT Speaker', 'page': '3' };
      const built: string = HttpUtils.buildQueryString(source);
      const restored: Record<string, string> = HttpUtils.parseQueryString(built);

      expect(Object.keys(restored).length).assertEqual(3);
      expect(restored['address']).assertEqual('00:1A:2B:3C:4D:5E');
      expect(restored['name']).assertEqual('BT Speaker');
      expect(restored['page']).assertEqual('3');
      expect(HttpUtils.buildQueryString(restored)).assertEqual(built);
      expect(built.split('&').length).assertEqual(3);
      expect(Object.keys(restored).indexOf('missing')).assertEqual(-1);
      expect(restored['name'] === source['name']).assertTrue();
    });

    // ==================== URL concat connect (2 cases) ====================

    /*
     * @tc.number: SUB_HTTP_UTILS_0600
     * @tc.name: testHttpUtils0006
     * @tc.desc: Join the base address with a path and insert the missing separator only once.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0006', 0, () => {
      expect(HttpUtils.buildUrl(BASE_URL, 'api')).assertEqual(BASE_URL + '/api');
      expect(HttpUtils.buildUrl(BASE_URL, '/api')).assertEqual(BASE_URL + '/api');
      expect(HttpUtils.buildUrl(BASE_URL, 'api/v2')).assertEqual(BASE_URL + '/api/v2');
      expect(HttpUtils.buildUrl(BASE_URL, '/api/v2/')).assertEqual(BASE_URL + '/api/v2/');
      expect(HttpUtils.buildUrl(BASE_URL, '')).assertEqual(BASE_URL);
      expect(HttpUtils.buildUrl(BASE_URL, 'devices', undefined)).assertEqual(BASE_URL + '/devices');
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_0700
     * @tc.name: testHttpUtils0007
     * @tc.desc: Append query parameters to a built URL and reuse an existing question mark.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0007', 0, () => {
      const params: Record<string, string> = { 'n': 'a b', 'p': '1' };
      const empty: Record<string, string> = {};

      expect(HttpUtils.buildUrl(BASE_URL, 'api', params)).assertEqual(BASE_URL + '/api?n=a%20b&p=1');
      expect(HttpUtils.buildUrl(BASE_URL, 'api', empty)).assertEqual(BASE_URL + '/api');
      expect(HttpUtils.buildUrl(BASE_URL, '', params)).assertEqual(BASE_URL + '?n=a%20b&p=1');
      expect(HttpUtils.buildUrl(BASE_URL + '/api?x=1', 'y', { 'z': '2' }))
        .assertEqual(BASE_URL + '/api?x=1/y&z=2');
      expect(HttpUtils.buildUrl(BASE_URL, 'api', params).indexOf('?')).assertEqual(BASE_URL.length + 4);
      expect(HttpUtils.buildUrl(BASE_URL, 'api', empty).indexOf('?')).assertEqual(-1);
    });

    // ==================== request config (3 cases) ====================

    /*
     * @tc.number: SUB_HTTP_UTILS_0800
     * @tc.name: testHttpUtils0008
     * @tc.desc: Create a request configuration with the default method, headers and timeout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0008', 0, () => {
      const config = HttpUtils.createConfig(BASE_URL + '/devices');

      expect(config.url).assertEqual(BASE_URL + '/devices');
      expect(config.method).assertEqual(HttpMethod.GET);
      expect(config.timeout).assertEqual(DEFAULT_TIMEOUT);
      const headers = config.headers!;
      expect(headers['Content-Type']).assertEqual('application/json');
      expect(config.body === undefined).assertTrue();
      expect(Object.keys(headers).length).assertEqual(1);
      expect(config.url.indexOf('https://')).assertEqual(0);
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_0900
     * @tc.name: testHttpUtils0009
     * @tc.desc: Create configurations for every supported HTTP method and request body.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0009', 0, () => {
      const methods: HttpMethod[] =
        [HttpMethod.GET, HttpMethod.POST, HttpMethod.PUT, HttpMethod.DELETE, HttpMethod.PATCH];
      const body: string = '{"name":"BT Speaker"}';
      let matched: number = 0;
      for (const method of methods) {
        const config = HttpUtils.createConfig(BASE_URL, method, body);
        if (config.method === method && config.body === body && config.timeout === DEFAULT_TIMEOUT) {
          matched++;
        }
      }

      expect(matched).assertEqual(methods.length);
      expect(HttpUtils.createConfig(BASE_URL, HttpMethod.POST, body).url).assertEqual(BASE_URL);
      expect(HttpUtils.createConfig(BASE_URL, HttpMethod.DELETE, body).method).assertEqual(HttpMethod.DELETE);
      expect(HttpUtils.createConfig(BASE_URL, HttpMethod.PATCH, body).body).assertEqual(body);
      expect(HttpUtils.createConfig(BASE_URL, HttpMethod.PUT).body === undefined).assertTrue();
      expect(methods.length).assertEqual(5);
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_1000
     * @tc.name: testHttpUtils0010
     * @tc.desc: Expose the five HTTP method constants with their standard upper case names.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0010', 0, () => {
      expect(HttpMethod.GET).assertEqual('GET');
      expect(HttpMethod.POST).assertEqual('POST');
      expect(HttpMethod.PUT).assertEqual('PUT');
      expect(HttpMethod.DELETE).assertEqual('DELETE');
      expect(HttpMethod.PATCH).assertEqual('PATCH');
      const defaultMethod: string = HttpUtils.createConfig(BASE_URL).method;
      const leftMethod: string = HttpMethod.GET;
      const rightMethod: string = HttpMethod.POST;
      expect(defaultMethod).assertEqual(leftMethod);
      expect(leftMethod === rightMethod).assertFalse();
      expect(HttpUtils.createConfig(BASE_URL, HttpMethod.POST).method).assertEqual('POST');
    });

    // ==================== state state code classification (5 cases) ====================

    /*
     * @tc.number: SUB_HTTP_UTILS_1100
     * @tc.name: testHttpUtils0011
     * @tc.desc: Accept only the two hundreds range as a successful response status.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0011', 0, () => {
      expect(HttpUtils.isSuccess(199)).assertFalse();
      expect(HttpUtils.isSuccess(200)).assertTrue();
      expect(HttpUtils.isSuccess(201)).assertTrue();
      expect(HttpUtils.isSuccess(204)).assertTrue();
      expect(HttpUtils.isSuccess(299)).assertTrue();
      expect(HttpUtils.isSuccess(300)).assertFalse();
      expect(HttpUtils.isSuccess(0)).assertFalse();
      expect(HttpUtils.isSuccess(500)).assertFalse();
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_1200
     * @tc.name: testHttpUtils0012
     * @tc.desc: Recognize the three hundreds range as a redirection response.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0012', 0, () => {
      expect(HttpUtils.isRedirect(299)).assertFalse();
      expect(HttpUtils.isRedirect(300)).assertTrue();
      expect(HttpUtils.isRedirect(301)).assertTrue();
      expect(HttpUtils.isRedirect(304)).assertTrue();
      expect(HttpUtils.isRedirect(399)).assertTrue();
      expect(HttpUtils.isRedirect(400)).assertFalse();
      expect(HttpUtils.isRedirect(200)).assertFalse();
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_1300
     * @tc.name: testHttpUtils0013
     * @tc.desc: Recognize the four hundreds range as a client error response.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0013', 0, () => {
      expect(HttpUtils.isClientError(399)).assertFalse();
      expect(HttpUtils.isClientError(400)).assertTrue();
      expect(HttpUtils.isClientError(404)).assertTrue();
      expect(HttpUtils.isClientError(408)).assertTrue();
      expect(HttpUtils.isClientError(499)).assertTrue();
      expect(HttpUtils.isClientError(500)).assertFalse();
      expect(HttpUtils.isClientError(401)).assertTrue();
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_1400
     * @tc.name: testHttpUtils0014
     * @tc.desc: Treat every status at or above the five hundreds start as a server error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0014', 0, () => {
      expect(HttpUtils.isServerError(499)).assertFalse();
      expect(HttpUtils.isServerError(500)).assertTrue();
      expect(HttpUtils.isServerError(502)).assertTrue();
      expect(HttpUtils.isServerError(503)).assertTrue();
      expect(HttpUtils.isServerError(599)).assertTrue();
      expect(HttpUtils.isServerError(1000)).assertTrue();
      expect(HttpUtils.isServerError(200)).assertFalse();
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_1500
     * @tc.name: testHttpUtils0015
     * @tc.desc: Keep the four status classifiers mutually exclusive for sampled codes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0015', 0, () => {
      const codes: number[] = [100, 200, 302, 404, 500];
      let exclusiveCount: number = 0;
      for (const code of codes) {
        const matches: number = (HttpUtils.isSuccess(code) ? 1 : 0) + (HttpUtils.isRedirect(code) ? 1 : 0) +
          (HttpUtils.isClientError(code) ? 1 : 0) + (HttpUtils.isServerError(code) ? 1 : 0);
        expect(matches < 2).assertTrue();
        if (matches === 1) {
          exclusiveCount++;
        }
      }

      expect(exclusiveCount).assertEqual(codes.length - 1);
      expect(HttpUtils.isSuccess(100)).assertFalse();
      expect(HttpUtils.isRedirect(100)).assertFalse();
      expect(HttpUtils.isClientError(100)).assertFalse();
      expect(HttpUtils.isServerError(100)).assertFalse();
      expect(HttpUtils.isServerError(599)).assertTrue();
    });

    // ==================== state state describe describe (2 cases) ====================

    /*
     * @tc.number: SUB_HTTP_UTILS_1600
     * @tc.name: testHttpUtils0016
     * @tc.desc: Resolve the description text of the fifteen catalogued status codes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testHttpUtils0016', 0, () => {
      expect(HttpUtils.getStatusText(200)).assertEqual('OK');
      expect(HttpUtils.getStatusText(201)).assertEqual('Created');
      expect(HttpUtils.getStatusText(204)).assertEqual('No Content');
      expect(HttpUtils.getStatusText(301)).assertEqual('Moved Permanently');
      expect(HttpUtils.getStatusText(302)).assertEqual('Found');
      expect(HttpUtils.getStatusText(304)).assertEqual('Not Modified');
      expect(HttpUtils.getStatusText(400)).assertEqual('Bad Request');
      expect(HttpUtils.getStatusText(401)).assertEqual('Unauthorized');
      expect(HttpUtils.getStatusText(403)).assertEqual('Forbidden');
      expect(HttpUtils.getStatusText(404)).assertEqual('Not Found');
    });

    /*
     * @tc.number: SUB_HTTP_UTILS_1700
     * @tc.name: testHttpUtils0017
     * @tc.desc: Continue the status catalogue and fall back for codes outside the table.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0017', 0, () => {
      expect(HttpUtils.getStatusText(405)).assertEqual('Method Not Allowed');
      expect(HttpUtils.getStatusText(408)).assertEqual('Request Timeout');
      expect(HttpUtils.getStatusText(500)).assertEqual('Internal Server Error');
      expect(HttpUtils.getStatusText(502)).assertEqual('Bad Gateway');
      expect(HttpUtils.getStatusText(503)).assertEqual('Service Unavailable');
      expect(HttpUtils.getStatusText(202)).assertEqual(UNKNOWN_TEXT);
      expect(HttpUtils.getStatusText(418)).assertEqual(UNKNOWN_TEXT);
      expect(HttpUtils.getStatusText(0)).assertEqual(UNKNOWN_TEXT);
      expect(HttpUtils.getStatusText(-1)).assertEqual(UNKNOWN_TEXT);
      expect(HttpUtils.getStatusText(599)).assertEqual(UNKNOWN_TEXT);
    });

    // ==================== interceptor register (1 cases) ====================

    /*
     * @tc.number: SUB_HTTP_UTILS_1800
     * @tc.name: testHttpUtils0018
     * @tc.desc: Register request and response interceptors and clear them without side effects.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testHttpUtils0018', 0, () => {
      let invoked: number = 0;
      HttpUtils.addRequestInterceptor({
        onRequest: (config: ESObject): ESObject => {
          invoked++;
          return config;
        }
      });
      HttpUtils.addResponseInterceptor({
        onResponse: (response: ESObject): ESObject => {
          invoked++;
          return response;
        }
      });

      const config = HttpUtils.createConfig(BASE_URL, HttpMethod.POST, '{}');
      expect(HttpUtils.buildUrl(BASE_URL, 'api')).assertEqual(BASE_URL + '/api');
      expect(config.method).assertEqual(HttpMethod.POST);
      expect(config.timeout).assertEqual(DEFAULT_TIMEOUT);
      expect(HttpUtils.isSuccess(200)).assertTrue();
      expect(HttpUtils.getStatusText(404)).assertEqual('Not Found');

      HttpUtils.clearInterceptors();
      HttpUtils.clearInterceptors();
      const clearedHeaders = HttpUtils.createConfig(BASE_URL).headers!;
      expect(clearedHeaders['Content-Type']).assertEqual('application/json');
      expect(invoked).assertEqual(0);
      expect(HttpUtils.parseQueryString('a=1')['a']).assertEqual('1');
    });
  });
}
