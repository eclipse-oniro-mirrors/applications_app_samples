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


import { describe, it, expect } from '@ohos/hypium';
import url from '@ohos.url';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.URL;


export default function urlApiTest(): void {
  describe('UrlApiTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0100
     * @tc.name urlProtocol001
     * @tc.desc Verify the URL protocol is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlProtocol_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlProtocol_001 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlProtocol_001, check01=' + JSON.stringify(parsed.protocol));
      expect(parsed.protocol).assertEqual('https:');
      Logger.info(TAG, 'urlProtocol_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0200
     * @tc.name urlHost002
     * @tc.desc Verify the URL host includes the port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlHost_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlHost_002 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlHost_002, check01=' + JSON.stringify(parsed.host));
      expect(parsed.host).assertEqual('example.com:8080');
      Logger.info(TAG, 'urlHost_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0300
     * @tc.name urlHostname003
     * @tc.desc Verify the URL hostname omits the port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlHostname_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlHostname_003 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlHostname_003, check01=' + JSON.stringify(parsed.hostname));
      expect(parsed.hostname).assertEqual('example.com');
      Logger.info(TAG, 'urlHostname_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0400
     * @tc.name urlPort004
     * @tc.desc Verify the URL port is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlPort_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlPort_004 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlPort_004, check01=' + JSON.stringify(parsed.port));
      expect(parsed.port).assertEqual('8080');
      Logger.info(TAG, 'urlPort_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0500
     * @tc.name urlPathname005
     * @tc.desc Verify the URL path without the query is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlPathname_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlPathname_005 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlPathname_005, check01=' + JSON.stringify(parsed.pathname));
      expect(parsed.pathname).assertEqual('/path/to');
      Logger.info(TAG, 'urlPathname_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0600
     * @tc.name urlSearch006
     * @tc.desc Verify the URL search block keeps the question mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSearch_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSearch_006 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlSearch_006, check01=' + JSON.stringify(parsed.search));
      expect(parsed.search).assertEqual('?x=1&y=2');
      Logger.info(TAG, 'urlSearch_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0700
     * @tc.name urlHash007
     * @tc.desc Verify the URL fragment keeps the hash marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlHash_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlHash_007 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlHash_007, check01=' + JSON.stringify(parsed.hash));
      expect(parsed.hash).assertEqual('#frag');
      Logger.info(TAG, 'urlHash_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0800
     * @tc.name urlOrigin008
     * @tc.desc Verify the URL origin combines protocol and host
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlOrigin_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlOrigin_008 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlOrigin_008, check01=' + JSON.stringify(parsed.origin));
      expect(parsed.origin).assertEqual('https://example.com:8080');
      Logger.info(TAG, 'urlOrigin_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_0900
     * @tc.name urlUsername009
     * @tc.desc Verify the URL username is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlUsername_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlUsername_009 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlUsername_009, check01=' + JSON.stringify(parsed.username));
      expect(parsed.username).assertEqual('user');
      Logger.info(TAG, 'urlUsername_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1000
     * @tc.name urlPassword010
     * @tc.desc Verify the URL password is parsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlPassword_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlPassword_010 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlPassword_010, check01=' + JSON.stringify(parsed.password));
      expect(parsed.password).assertEqual('pass');
      Logger.info(TAG, 'urlPassword_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1100
     * @tc.name urlHref011
     * @tc.desc Verify the URL href keeps the full source text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlHref_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlHref_011 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlHref_011, check01=' + JSON.stringify(parsed.href));
      expect(parsed.href).assertEqual('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlHref_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1200
     * @tc.name urlToString012
     * @tc.desc Verify toString returns the full source text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlToString_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlToString_012 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlToString_012, check01=' + JSON.stringify(parsed.toString()));
      expect(parsed.toString()).assertEqual('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlToString_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1300
     * @tc.name urlToJson013
     * @tc.desc Verify toJSON returns the serialized URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlToJson_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlToJson_013 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlToJson_013, check01=' + JSON.stringify(parsed.toJSON()));
      expect(parsed.toJSON()).assertEqual('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlToJson_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1400
     * @tc.name urlSetHash014
     * @tc.desc Verify assigning a new fragment updates the href
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSetHash_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSetHash_014 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      parsed.hash = '#next';
      Logger.info(TAG, 'urlSetHash_014, check01=' + JSON.stringify(parsed.hash));
      expect(parsed.hash).assertEqual('#next');
      Logger.info(TAG, 'urlSetHash_014, check02=' + JSON.stringify(parsed.href.indexOf('#next') >= 0));
      expect(parsed.href.indexOf('#next') >= 0).assertTrue();
      Logger.info(TAG, 'urlSetHash_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1500
     * @tc.name urlSetPathname015
     * @tc.desc Verify assigning a new path updates the pathname
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSetPathname_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSetPathname_015 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      parsed.pathname = '/next';
      Logger.info(TAG, 'urlSetPathname_015, check01=' + JSON.stringify(parsed.pathname));
      expect(parsed.pathname).assertEqual('/next');
      Logger.info(TAG, 'urlSetPathname_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1600
     * @tc.name urlSetPort016
     * @tc.desc Verify assigning a new port updates the port
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSetPort_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSetPort_016 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      parsed.port = '9090';
      Logger.info(TAG, 'urlSetPort_016, check01=' + JSON.stringify(parsed.port));
      expect(parsed.port).assertEqual('9090');
      Logger.info(TAG, 'urlSetPort_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1700
     * @tc.name urlSearchParamsGet017
     * @tc.desc Verify searchParams reads a query value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSearchParamsGet_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSearchParamsGet_017 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlSearchParamsGet_017, check01=' + JSON.stringify(parsed.searchParams.get('x')));
      expect(parsed.searchParams.get('x')).assertEqual('1');
      Logger.info(TAG, 'urlSearchParamsGet_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1800
     * @tc.name urlSearchParamsHas018
     * @tc.desc Verify searchParams reports an existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSearchParamsHas_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSearchParamsHas_018 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlSearchParamsHas_018, check01=' + JSON.stringify(parsed.searchParams.has('y')));
      expect(parsed.searchParams.has('y')).assertTrue();
      Logger.info(TAG, 'urlSearchParamsHas_018, check02=' + JSON.stringify(parsed.searchParams.has('z')));
      expect(parsed.searchParams.has('z')).assertFalse();
      Logger.info(TAG, 'urlSearchParamsHas_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_1900
     * @tc.name urlSearchParamsAppend019
     * @tc.desc Verify append adds a second value for a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSearchParamsAppend_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSearchParamsAppend_019 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      parsed.searchParams.append('x', '3');
      const values: Array<string> = parsed.searchParams.getAll('x');
      Logger.info(TAG, 'urlSearchParamsAppend_019, check01=' + JSON.stringify(values.length));
      expect(values.length).assertEqual(2);
      Logger.info(TAG, 'urlSearchParamsAppend_019, check02=' + JSON.stringify(values[1]));
      expect(values[1]).assertEqual('3');
      Logger.info(TAG, 'urlSearchParamsAppend_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_2000
     * @tc.name urlSearchParamsToString020
     * @tc.desc Verify searchParams serializes the query text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlSearchParamsToString_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlSearchParamsToString_020 begin');
      const parsed: url.URL = new url.URL('https://user:pass@example.com:8080/path/to?x=1&y=2#frag');
      Logger.info(TAG, 'urlSearchParamsToString_020, check01=' + JSON.stringify(parsed.searchParams.toString()));
      expect(parsed.searchParams.toString()).assertEqual('x=1&y=2');
      Logger.info(TAG, 'urlSearchParamsToString_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_2100
     * @tc.name urlRelativeBase021
     * @tc.desc Verify a relative reference resolves against a base URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlRelativeBase_021', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlRelativeBase_021 begin');
      const parsed: url.URL = new url.URL('child', 'https://example.com/root/');
      Logger.info(TAG, 'urlRelativeBase_021, check01=' + JSON.stringify(parsed.hostname));
      expect(parsed.hostname).assertEqual('example.com');
      Logger.info(TAG, 'urlRelativeBase_021, check02=' + JSON.stringify(parsed.pathname));
      expect(parsed.pathname).assertEqual('/root/child');
      Logger.info(TAG, 'urlRelativeBase_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_URL_2200
     * @tc.name urlDefaultPort022
     * @tc.desc Verify an HTTPS URL without a port keeps the plain host
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'urlDefaultPort_022', 0, async (): Promise<void> => {
      Logger.info(TAG, 'urlDefaultPort_022 begin');
      const parsed: url.URL = new url.URL('https://example.com/a');
      Logger.info(TAG, 'urlDefaultPort_022, check01=' + JSON.stringify(parsed.host));
      expect(parsed.host).assertEqual('example.com');
      Logger.info(TAG, 'urlDefaultPort_022, check02=' + JSON.stringify(parsed.protocol));
      expect(parsed.protocol).assertEqual('https:');
      Logger.info(TAG, 'urlDefaultPort_022 end');
    });

  });
}
