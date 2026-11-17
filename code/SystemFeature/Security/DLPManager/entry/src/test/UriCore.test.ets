/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { UriParts, UriParseResult, UriDecodeResult, QueryParam, QueryParseResult, parseUri, buildUri,
  encodeComponent, decodeComponent, parseQuery, buildQuery, findQueryParam, getQueryParam, upsertQuery,
  joinPath, normalizePath, segmentsOf, fileNameOf, extensionOf, baseNameOf, stripExtension,
  replaceExtension, isScheme, isFileLikeUri } from '../main/ets/core/UriCore';

function joinTexts(values: string[]): string {
  return values.join('|');
}

function joinParams(values: QueryParam[]): string {
  const parts: string[] = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(values[index].key + '=' + values[index].value);
  }
  return parts.join('|');
}

const SAMPLE_URI: string = 'datashare:///media/100/Pictures/a.txt?networkid=abc&flag=1#section';

export default function uriCoreTest(): void {
  describe('UriCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0001
     * @tc.name      testParseEmpty0001
     * @tc.desc      empty uri is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0001 begin');
      console.info('testParseEmpty0001 begin');
      const parsed: UriParseResult = parseUri('');
      expect(parsed.valid).assertFalse();
      expect(parsed.reason).assertEqual('empty');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0002
     * @tc.name      testParseFileAuthority0002
     * @tc.desc      file uri with authority is split correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFileAuthority0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFileAuthority0002 begin');
      console.info('testParseFileAuthority0002 begin');
      const parsed: UriParseResult = parseUri('file://com.sample.dlpmanager/a.txt');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.scheme).assertEqual('file');
      expect(parsed.parts.authority).assertEqual('com.sample.dlpmanager');
      expect(parsed.parts.path).assertEqual('/a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0003
     * @tc.name      testParseFileNoAuthority0003
     * @tc.desc      empty authority with triple slash is supported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFileNoAuthority0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFileNoAuthority0003 begin');
      console.info('testParseFileNoAuthority0003 begin');
      const parsed: UriParseResult = parseUri('file:///a.txt');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.authority).assertEqual('');
      expect(parsed.parts.path).assertEqual('/a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0004
     * @tc.name      testParseAuthorityOnly0004
     * @tc.desc      authority without path is allowed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseAuthorityOnly0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseAuthorityOnly0004 begin');
      console.info('testParseAuthorityOnly0004 begin');
      const parsed: UriParseResult = parseUri('file://com.sample');
      expect(parsed.parts.authority).assertEqual('com.sample');
      expect(parsed.parts.path).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0005
     * @tc.name      testParseAuthorityQuery0005
     * @tc.desc      query follows the authority without a path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseAuthorityQuery0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseAuthorityQuery0005 begin');
      console.info('testParseAuthorityQuery0005 begin');
      const parsed: UriParseResult = parseUri('file://com.sample?a=1');
      expect(parsed.parts.authority).assertEqual('com.sample');
      expect(parsed.parts.path).assertEqual('');
      expect(parsed.parts.query).assertEqual('a=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0006
     * @tc.name      testParseFullUri0006
     * @tc.desc      scheme authority path query and fragment are all parsed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFullUri0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFullUri0006 begin');
      console.info('testParseFullUri0006 begin');
      const parsed: UriParseResult = parseUri(SAMPLE_URI);
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.scheme).assertEqual('datashare');
      expect(parsed.parts.authority).assertEqual('');
      expect(parsed.parts.path).assertEqual('/media/100/Pictures/a.txt');
      expect(parsed.parts.query).assertEqual('networkid=abc&flag=1');
      expect(parsed.parts.fragment).assertEqual('section');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0007
     * @tc.name      testParseHttps0007
     * @tc.desc      http style uri is parsed with authority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseHttps0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseHttps0007 begin');
      console.info('testParseHttps0007 begin');
      const parsed: UriParseResult = parseUri('https://example.com/a/b?q=1');
      expect(parsed.parts.scheme).assertEqual('https');
      expect(parsed.parts.authority).assertEqual('example.com');
      expect(parsed.parts.path).assertEqual('/a/b');
      expect(parsed.parts.query).assertEqual('q=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0008
     * @tc.name      testParseOpaque0008
     * @tc.desc      opaque uri keeps the rest as path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseOpaque0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseOpaque0008 begin');
      console.info('testParseOpaque0008 begin');
      const parsed: UriParseResult = parseUri('mailto:user@example.com');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.scheme).assertEqual('mailto');
      expect(parsed.parts.authority).assertEqual('');
      expect(parsed.parts.path).assertEqual('user@example.com');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0009
     * @tc.name      testParseDigitScheme0009
     * @tc.desc      scheme starting with a digit is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseDigitScheme0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseDigitScheme0009 begin');
      console.info('testParseDigitScheme0009 begin');
      const parsed: UriParseResult = parseUri('1abc://x');
      expect(parsed.valid).assertFalse();
      expect(parsed.reason).assertEqual('bad-scheme');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0010
     * @tc.name      testParseSchemeSymbols0010
     * @tc.desc      plus minus and dot are valid scheme characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSchemeSymbols0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSchemeSymbols0010 begin');
      console.info('testParseSchemeSymbols0010 begin');
      const parsed: UriParseResult = parseUri('a+b-c.d://host');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.scheme).assertEqual('a+b-c.d');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0011
     * @tc.name      testParseMissingScheme0011
     * @tc.desc      text without a colon has no scheme
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMissingScheme0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMissingScheme0011 begin');
      console.info('testParseMissingScheme0011 begin');
      expect(parseUri('file').valid).assertFalse();
      expect(parseUri('file').reason).assertEqual('missing-scheme');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0012
     * @tc.name      testParseEmptyScheme0012
     * @tc.desc      colon first means an empty scheme
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmptyScheme0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmptyScheme0012 begin');
      console.info('testParseEmptyScheme0012 begin');
      expect(parseUri('://x').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0013
     * @tc.name      testParseSlashStart0013
     * @tc.desc      path starting with slash has no scheme
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSlashStart0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSlashStart0013 begin');
      console.info('testParseSlashStart0013 begin');
      expect(parseUri('/abc').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0014
     * @tc.name      testParseSingleSlash0014
     * @tc.desc      single slash keeps a plain path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSingleSlash0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSingleSlash0014 begin');
      console.info('testParseSingleSlash0014 begin');
      const parsed: UriParseResult = parseUri('file:/path');
      expect(parsed.parts.authority).assertEqual('');
      expect(parsed.parts.path).assertEqual('/path');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0015
     * @tc.name      testParseFragmentHash0015
     * @tc.desc      a second hash stays inside the fragment
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFragmentHash0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFragmentHash0015 begin');
      console.info('testParseFragmentHash0015 begin');
      const parsed: UriParseResult = parseUri('file://host/path#frag#more');
      expect(parsed.parts.path).assertEqual('/path');
      expect(parsed.parts.fragment).assertEqual('frag#more');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0016
     * @tc.name      testParseQueryQuestion0016
     * @tc.desc      a second question mark stays inside the query
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryQuestion0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryQuestion0016 begin');
      console.info('testParseQueryQuestion0016 begin');
      const parsed: UriParseResult = parseUri('file://host/path?q=1?2');
      expect(parsed.parts.query).assertEqual('q=1?2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0017
     * @tc.name      testParseDoubleSlashPath0017
     * @tc.desc      double slash inside the path is preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseDoubleSlashPath0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseDoubleSlashPath0017 begin');
      console.info('testParseDoubleSlashPath0017 begin');
      const parsed: UriParseResult = parseUri('file://host//double');
      expect(parsed.parts.authority).assertEqual('host');
      expect(parsed.parts.path).assertEqual('//double');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0018
     * @tc.name      testParseRootPath0018
     * @tc.desc      slash after authority becomes the root path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseRootPath0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseRootPath0018 begin');
      console.info('testParseRootPath0018 begin');
      const parsed: UriParseResult = parseUri('file://host/');
      expect(parsed.parts.authority).assertEqual('host');
      expect(parsed.parts.path).assertEqual('/');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0019
     * @tc.name      testParseEmptyAuthority0019
     * @tc.desc      double slash without authority is valid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmptyAuthority0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmptyAuthority0019 begin');
      console.info('testParseEmptyAuthority0019 begin');
      const parsed: UriParseResult = parseUri('file://');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.authority).assertEqual('');
      expect(parsed.parts.path).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0020
     * @tc.name      testParseCasePreserved0020
     * @tc.desc      scheme and authority case is preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseCasePreserved0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseCasePreserved0020 begin');
      console.info('testParseCasePreserved0020 begin');
      const parsed: UriParseResult = parseUri('FILE://HOST/A');
      expect(parsed.parts.scheme).assertEqual('FILE');
      expect(parsed.parts.authority).assertEqual('HOST');
      expect(parsed.parts.path).assertEqual('/A');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0021
     * @tc.name      testParseSpaceInScheme0021
     * @tc.desc      space inside the scheme is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSpaceInScheme0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSpaceInScheme0021 begin');
      console.info('testParseSpaceInScheme0021 begin');
      expect(parseUri('a b://h').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0022
     * @tc.name      testParseUnderscoreScheme0022
     * @tc.desc      underscore is not a valid scheme character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseUnderscoreScheme0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseUnderscoreScheme0022 begin');
      console.info('testParseUnderscoreScheme0022 begin');
      expect(parseUri('a_b://h').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0023
     * @tc.name      testParseSpaceInPath0023
     * @tc.desc      spaces inside the path do not break parsing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSpaceInPath0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSpaceInPath0023 begin');
      console.info('testParseSpaceInPath0023 begin');
      const parsed: UriParseResult = parseUri('file://host/path space');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.path).assertEqual('/path space');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0024
     * @tc.name      testParseQueryOnly0024
     * @tc.desc      empty path with query and fragment is valid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryOnly0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryOnly0024 begin');
      console.info('testParseQueryOnly0024 begin');
      const parsed: UriParseResult = parseUri('file:?#f');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.path).assertEqual('');
      expect(parsed.parts.query).assertEqual('');
      expect(parsed.parts.fragment).assertEqual('f');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0025
     * @tc.name      testParseFragmentOnly0025
     * @tc.desc      fragment without query is parsed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFragmentOnly0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFragmentOnly0025 begin');
      console.info('testParseFragmentOnly0025 begin');
      const parsed: UriParseResult = parseUri('file:#f');
      expect(parsed.parts.fragment).assertEqual('f');
      expect(parsed.parts.query).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0026
     * @tc.name      testBuildNoAuthority0026
     * @tc.desc      empty authority omits the double slash
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildNoAuthority0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildNoAuthority0026 begin');
      console.info('testBuildNoAuthority0026 begin');
      const parts: UriParts = new UriParts('file', '', '/a', '', '');
      expect(buildUri(parts)).assertEqual('file:/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0027
     * @tc.name      testBuildWithAuthority0027
     * @tc.desc      authority is rebuilt with double slash
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildWithAuthority0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildWithAuthority0027 begin');
      console.info('testBuildWithAuthority0027 begin');
      const parts: UriParts = new UriParts('file', 'host', '/a', '', '');
      expect(buildUri(parts)).assertEqual('file://host/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0028
     * @tc.name      testBuildAuthorityNoSlash0028
     * @tc.desc      a missing leading slash is inserted after the authority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildAuthorityNoSlash0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildAuthorityNoSlash0028 begin');
      console.info('testBuildAuthorityNoSlash0028 begin');
      const parts: UriParts = new UriParts('file', 'host', 'a', '', '');
      expect(buildUri(parts)).assertEqual('file://host/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0029
     * @tc.name      testBuildWithQuery0029
     * @tc.desc      query and fragment are appended in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildWithQuery0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildWithQuery0029 begin');
      console.info('testBuildWithQuery0029 begin');
      const parts: UriParts = new UriParts('file', 'host', '/a', 'x=1', 'f');
      expect(buildUri(parts)).assertEqual('file://host/a?x=1#f');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0030
     * @tc.name      testBuildRoundTrip0030
     * @tc.desc      parsing a rebuilt uri keeps all parts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildRoundTrip0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildRoundTrip0030 begin');
      console.info('testBuildRoundTrip0030 begin');
      const parsed: UriParseResult = parseUri(SAMPLE_URI);
      const rebuilt: string = buildUri(parsed.parts);
      expect(rebuilt).assertEqual(SAMPLE_URI);
      expect(parseUri(rebuilt).parts.path).assertEqual('/media/100/Pictures/a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0031
     * @tc.name      testEncodeUnreserved0031
     * @tc.desc      unreserved characters are not encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUnreserved0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUnreserved0031 begin');
      console.info('testEncodeUnreserved0031 begin');
      expect(encodeComponent('a-b_c.d~9', false)).assertEqual('a-b_c.d~9');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0032
     * @tc.name      testEncodeSpace0032
     * @tc.desc      space is percent encoded as uppercase hex
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeSpace0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeSpace0032 begin');
      console.info('testEncodeSpace0032 begin');
      expect(encodeComponent('a b', false)).assertEqual('a%20b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0033
     * @tc.name      testEncodeSlashKeep0033
     * @tc.desc      slash is kept when requested
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeSlashKeep0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeSlashKeep0033 begin');
      console.info('testEncodeSlashKeep0033 begin');
      expect(encodeComponent('a/b/c', true)).assertEqual('a/b/c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0034
     * @tc.name      testEncodeSlashDrop0034
     * @tc.desc      slash is encoded when not kept
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeSlashDrop0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeSlashDrop0034 begin');
      console.info('testEncodeSlashDrop0034 begin');
      expect(encodeComponent('a/b', false)).assertEqual('a%2Fb');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0035
     * @tc.name      testEncodeChinese0035
     * @tc.desc      chinese characters encode to utf8 percent bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeChinese0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeChinese0035 begin');
      console.info('testEncodeChinese0035 begin');
      expect(encodeComponent('中', false)).assertEqual('%E4%B8%AD');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0036
     * @tc.name      testEncodeQuestion0036
     * @tc.desc      reserved question mark is encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeQuestion0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeQuestion0036 begin');
      console.info('testEncodeQuestion0036 begin');
      expect(encodeComponent('?', false)).assertEqual('%3F');
      expect(encodeComponent('&', false)).assertEqual('%26');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0037
     * @tc.name      testEncodeEmoji0037
     * @tc.desc      emoji encodes to four percent bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeEmoji0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeEmoji0037 begin');
      console.info('testEncodeEmoji0037 begin');
      expect(encodeComponent('😀', false)).assertEqual('%F0%9F%98%80');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0038
     * @tc.name      testEncodeEmpty0038
     * @tc.desc      empty text encodes to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeEmpty0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeEmpty0038 begin');
      console.info('testEncodeEmpty0038 begin');
      expect(encodeComponent('', false)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0039
     * @tc.name      testDecodePlain0039
     * @tc.desc      plain text decodes unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodePlain0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodePlain0039 begin');
      console.info('testDecodePlain0039 begin');
      const decoded: UriDecodeResult = decodeComponent('abc', false);
      expect(decoded.text).assertEqual('abc');
      expect(decoded.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0040
     * @tc.name      testDecodeSpace0040
     * @tc.desc      percent space decodes back to space
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeSpace0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeSpace0040 begin');
      console.info('testDecodeSpace0040 begin');
      expect(decodeComponent('a%20b', false).text).assertEqual('a b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0041
     * @tc.name      testDecodePlusPath0041
     * @tc.desc      plus stays literal in path mode
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodePlusPath0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodePlusPath0041 begin');
      console.info('testDecodePlusPath0041 begin');
      expect(decodeComponent('a+b', false).text).assertEqual('a+b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0042
     * @tc.name      testDecodePlusQuery0042
     * @tc.desc      plus becomes space in query mode
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodePlusQuery0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodePlusQuery0042 begin');
      console.info('testDecodePlusQuery0042 begin');
      expect(decodeComponent('a+b', true).text).assertEqual('a b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0043
     * @tc.name      testDecodeChinese0043
     * @tc.desc      utf8 percent bytes decode to chinese
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeChinese0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeChinese0043 begin');
      console.info('testDecodeChinese0043 begin');
      const decoded: UriDecodeResult = decodeComponent('%E4%B8%AD', false);
      expect(decoded.text).assertEqual('中');
      expect(decoded.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0044
     * @tc.name      testDecodeChineseLower0044
     * @tc.desc      lowercase percent hex is accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeChineseLower0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeChineseLower0044 begin');
      console.info('testDecodeChineseLower0044 begin');
      expect(decodeComponent('%e4%b8%ad', false).text).assertEqual('中');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0045
     * @tc.name      testDecodeBadPercent0045
     * @tc.desc      lone percent is kept but marked invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeBadPercent0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeBadPercent0045 begin');
      console.info('testDecodeBadPercent0045 begin');
      const decoded: UriDecodeResult = decodeComponent('%', false);
      expect(decoded.text).assertEqual('%');
      expect(decoded.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0046
     * @tc.name      testDecodeShortPercent0046
     * @tc.desc      percent with one hex digit is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeShortPercent0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeShortPercent0046 begin');
      console.info('testDecodeShortPercent0046 begin');
      const decoded: UriDecodeResult = decodeComponent('%2', false);
      expect(decoded.text).assertEqual('%2');
      expect(decoded.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0047
     * @tc.name      testDecodeNonHex0047
     * @tc.desc      non hex characters after percent are invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeNonHex0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeNonHex0047 begin');
      console.info('testDecodeNonHex0047 begin');
      const decoded: UriDecodeResult = decodeComponent('%G1', false);
      expect(decoded.text).assertEqual('%G1');
      expect(decoded.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0048
     * @tc.name      testDecodeEmoji0048
     * @tc.desc      emoji percent bytes decode to a surrogate pair
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeEmoji0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeEmoji0048 begin');
      console.info('testDecodeEmoji0048 begin');
      const decoded: UriDecodeResult = decodeComponent('%F0%9F%98%80', false);
      expect(decoded.text.charCodeAt(0)).assertEqual(0xD83D);
      expect(decoded.text.charCodeAt(1)).assertEqual(0xDE00);
      expect(decoded.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0049
     * @tc.name      testDecodeTruncatedUtf80049
     * @tc.desc      truncated utf8 percent bytes are invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeTruncatedUtf80049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeTruncatedUtf80049 begin');
      console.info('testDecodeTruncatedUtf80049 begin');
      const decoded: UriDecodeResult = decodeComponent('%E4%B8', false);
      expect(decoded.valid).assertFalse();
      expect(decoded.text).assertEqual('\uFFFD\uFFFD');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0050
     * @tc.name      testDecodeRawChinese0050
     * @tc.desc      raw chinese text is accepted without encoding
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeRawChinese0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeRawChinese0050 begin');
      console.info('testDecodeRawChinese0050 begin');
      const decoded: UriDecodeResult = decodeComponent('中文', false);
      expect(decoded.text).assertEqual('中文');
      expect(decoded.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0051
     * @tc.name      testDecodePercent0051
     * @tc.desc      encoded percent decodes to a percent sign
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodePercent0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodePercent0051 begin');
      console.info('testDecodePercent0051 begin');
      const decoded: UriDecodeResult = decodeComponent('%25', false);
      expect(decoded.text).assertEqual('%');
      expect(decoded.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0052
     * @tc.name      testDecodeRoundTrip0052
     * @tc.desc      encoded then decoded text matches the source
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeRoundTrip0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeRoundTrip0052 begin');
      console.info('testDecodeRoundTrip0052 begin');
      const source: string = 'a b/中文?c=1';
      expect(decodeComponent(encodeComponent(source, false), false).text).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0053
     * @tc.name      testParseQueryEmpty0053
     * @tc.desc      empty query yields no params
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEmpty0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryEmpty0053 begin');
      console.info('testParseQueryEmpty0053 begin');
      const parsed: QueryParseResult = parseQuery('');
      expect(parsed.params.length).assertEqual(0);
      expect(parsed.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0054
     * @tc.name      testParseQuerySingle0054
     * @tc.desc      single key value pair is parsed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQuerySingle0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQuerySingle0054 begin');
      console.info('testParseQuerySingle0054 begin');
      const parsed: QueryParseResult = parseQuery('a=1');
      expect(parsed.params.length).assertEqual(1);
      expect(parsed.params[0].key).assertEqual('a');
      expect(parsed.params[0].value).assertEqual('1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0055
     * @tc.name      testParseQueryMultiple0055
     * @tc.desc      multiple pairs keep their order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryMultiple0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryMultiple0055 begin');
      console.info('testParseQueryMultiple0055 begin');
      expect(joinParams(parseQuery('a=1&b=2').params)).assertEqual('a=1|b=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0056
     * @tc.name      testParseQueryNoEquals0056
     * @tc.desc      a key without equals has an empty value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryNoEquals0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryNoEquals0056 begin');
      console.info('testParseQueryNoEquals0056 begin');
      const parsed: QueryParseResult = parseQuery('a');
      expect(parsed.params[0].key).assertEqual('a');
      expect(parsed.params[0].value).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0057
     * @tc.name      testParseQueryEmptyValue0057
     * @tc.desc      explicit empty value is preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEmptyValue0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryEmptyValue0057 begin');
      console.info('testParseQueryEmptyValue0057 begin');
      const parsed: QueryParseResult = parseQuery('a=');
      expect(parsed.params.length).assertEqual(1);
      expect(parsed.params[0].value).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0058
     * @tc.name      testParseQueryEmptyFields0058
     * @tc.desc      empty fields between ampersands are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEmptyFields0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryEmptyFields0058 begin');
      console.info('testParseQueryEmptyFields0058 begin');
      const parsed: QueryParseResult = parseQuery('&&');
      expect(parsed.params.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0059
     * @tc.name      testParseQueryTrailingAmp0059
     * @tc.desc      trailing ampersand does not add a param
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryTrailingAmp0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryTrailingAmp0059 begin');
      console.info('testParseQueryTrailingAmp0059 begin');
      expect(parseQuery('a=1&').params.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0060
     * @tc.name      testParseQueryEncoded0060
     * @tc.desc      encoded keys and values are decoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEncoded0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryEncoded0060 begin');
      console.info('testParseQueryEncoded0060 begin');
      const parsed: QueryParseResult = parseQuery('k=%E4%B8%AD');
      expect(parsed.params[0].value).assertEqual('中');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0061
     * @tc.name      testParseQueryPlus0061
     * @tc.desc      plus decodes to space in query values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryPlus0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryPlus0061 begin');
      console.info('testParseQueryPlus0061 begin');
      expect(parseQuery('k=a+b').params[0].value).assertEqual('a b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0062
     * @tc.name      testParseQuerySecondEquals0062
     * @tc.desc      only the first equals splits key and value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQuerySecondEquals0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQuerySecondEquals0062 begin');
      console.info('testParseQuerySecondEquals0062 begin');
      const parsed: QueryParseResult = parseQuery('a=1=2');
      expect(parsed.params[0].key).assertEqual('a');
      expect(parsed.params[0].value).assertEqual('1=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0063
     * @tc.name      testParseQueryMixed0063
     * @tc.desc      a key without value is kept next to valued pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryMixed0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryMixed0063 begin');
      console.info('testParseQueryMixed0063 begin');
      expect(joinParams(parseQuery('a&b=2').params)).assertEqual('a=|b=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0064
     * @tc.name      testBuildQueryEmpty0064
     * @tc.desc      empty params produce an empty query
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryEmpty0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryEmpty0064 begin');
      console.info('testBuildQueryEmpty0064 begin');
      expect(buildQuery([])).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0065
     * @tc.name      testBuildQueryBasic0065
     * @tc.desc      key value pairs join with ampersands
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryBasic0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryBasic0065 begin');
      console.info('testBuildQueryBasic0065 begin');
      const params: QueryParam[] = [new QueryParam('a', '1'), new QueryParam('b', '2')];
      expect(buildQuery(params)).assertEqual('a=1&b=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0066
     * @tc.name      testBuildQuerySpace0066
     * @tc.desc      spaces are encoded when building the query
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQuerySpace0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQuerySpace0066 begin');
      console.info('testBuildQuerySpace0066 begin');
      const params: QueryParam[] = [new QueryParam('k', 'a b')];
      expect(buildQuery(params)).assertEqual('k=a%20b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0067
     * @tc.name      testBuildQueryChinese0067
     * @tc.desc      chinese values are percent encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryChinese0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryChinese0067 begin');
      console.info('testBuildQueryChinese0067 begin');
      const params: QueryParam[] = [new QueryParam('k', '中')];
      expect(buildQuery(params)).assertEqual('k=%E4%B8%AD');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0068
     * @tc.name      testBuildQueryRoundTrip0068
     * @tc.desc      built query parses back to the same pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryRoundTrip0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryRoundTrip0068 begin');
      console.info('testBuildQueryRoundTrip0068 begin');
      const params: QueryParam[] = [new QueryParam('a b', '中 文'), new QueryParam('c', '1')];
      expect(joinParams(parseQuery(buildQuery(params)).params)).assertEqual('a b=中 文|c=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0069
     * @tc.name      testGetQueryParamPresent0069
     * @tc.desc      existing query values are returned
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGetQueryParamPresent0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGetQueryParamPresent0069 begin');
      console.info('testGetQueryParamPresent0069 begin');
      expect(getQueryParam('file://h/p?a=1&b=2', 'a')).assertEqual('1');
      expect(getQueryParam('file://h/p?a=1&b=2', 'b')).assertEqual('2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0070
     * @tc.name      testGetQueryParamMissing0070
     * @tc.desc      missing keys return empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGetQueryParamMissing0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGetQueryParamMissing0070 begin');
      console.info('testGetQueryParamMissing0070 begin');
      expect(getQueryParam('file://h/p?a=1', 'c')).assertEqual('');
      expect(getQueryParam('file://h/p', 'a')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0071
     * @tc.name      testGetQueryParamInvalidUri0071
     * @tc.desc      invalid uri returns empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGetQueryParamInvalidUri0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGetQueryParamInvalidUri0071 begin');
      console.info('testGetQueryParamInvalidUri0071 begin');
      expect(getQueryParam('not a uri', 'a')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0072
     * @tc.name      testFindQueryParamMissing0072
     * @tc.desc      missing keys return null
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindQueryParamMissing0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindQueryParamMissing0072 begin');
      console.info('testFindQueryParamMissing0072 begin');
      expect(findQueryParam(SAMPLE_URI, 'missing')).assertNull();
      expect(findQueryParam('bad', 'a')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0073
     * @tc.name      testFindQueryParamFirst0073
     * @tc.desc      duplicate keys return the first value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindQueryParamFirst0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindQueryParamFirst0073 begin');
      console.info('testFindQueryParamFirst0073 begin');
      expect(getQueryParam('file://h/p?a=1&a=2', 'a')).assertEqual('1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0074
     * @tc.name      testUpsertQueryAdd0074
     * @tc.desc      a new key is appended to the query
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertQueryAdd0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertQueryAdd0074 begin');
      console.info('testUpsertQueryAdd0074 begin');
      expect(upsertQuery('file://h/p', 'a', '1')).assertEqual('file://h/p?a=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0075
     * @tc.name      testUpsertQueryReplace0075
     * @tc.desc      an existing key is replaced in place
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertQueryReplace0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertQueryReplace0075 begin');
      console.info('testUpsertQueryReplace0075 begin');
      expect(upsertQuery('file://h/p?a=1', 'a', '2')).assertEqual('file://h/p?a=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0076
     * @tc.name      testUpsertQueryKeepOthers0076
     * @tc.desc      other query parameters are preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertQueryKeepOthers0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertQueryKeepOthers0076 begin');
      console.info('testUpsertQueryKeepOthers0076 begin');
      expect(upsertQuery('file://h/p?a=1&b=2', 'b', '3')).assertEqual('file://h/p?a=1&b=3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0077
     * @tc.name      testUpsertQueryFragment0077
     * @tc.desc      fragments survive query updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertQueryFragment0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertQueryFragment0077 begin');
      console.info('testUpsertQueryFragment0077 begin');
      expect(upsertQuery('file://h/p?x=1#f', 'a', '2')).assertEqual('file://h/p?x=1&a=2#f');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0078
     * @tc.name      testUpsertQueryInvalid0078
     * @tc.desc      invalid uri is returned unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertQueryInvalid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertQueryInvalid0078 begin');
      console.info('testUpsertQueryInvalid0078 begin');
      expect(upsertQuery('not a uri', 'a', '1')).assertEqual('not a uri');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0079
     * @tc.name      testUpsertQueryEncoded0079
     * @tc.desc      values with spaces are encoded on update
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertQueryEncoded0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertQueryEncoded0079 begin');
      console.info('testUpsertQueryEncoded0079 begin');
      expect(upsertQuery('file://h/p', 'k', 'a b')).assertEqual('file://h/p?k=a%20b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0080
     * @tc.name      testJoinPathEmpty0080
     * @tc.desc      no segments produce empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathEmpty0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJoinPathEmpty0080 begin');
      console.info('testJoinPathEmpty0080 begin');
      expect(joinPath([])).assertEqual('');
      expect(joinPath(['', ''])).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0081
     * @tc.name      testJoinPathRelative0081
     * @tc.desc      relative segments join with single slashes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathRelative0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJoinPathRelative0081 begin');
      console.info('testJoinPathRelative0081 begin');
      expect(joinPath(['a', 'b', 'c'])).assertEqual('a/b/c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0082
     * @tc.name      testJoinPathAbsolute0082
     * @tc.desc      leading slash keeps the result absolute
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathAbsolute0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJoinPathAbsolute0082 begin');
      console.info('testJoinPathAbsolute0082 begin');
      expect(joinPath(['/a', 'b'])).assertEqual('/a/b');
      expect(joinPath(['/', 'a'])).assertEqual('/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0083
     * @tc.name      testJoinPathNormalizeSlash0083
     * @tc.desc      duplicate boundary slashes collapse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathNormalizeSlash0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJoinPathNormalizeSlash0083 begin');
      console.info('testJoinPathNormalizeSlash0083 begin');
      expect(joinPath(['a/', '/b'])).assertEqual('a/b');
      expect(joinPath(['a//', '//b'])).assertEqual('a/b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0084
     * @tc.name      testJoinPathRootOnly0084
     * @tc.desc      only a root slash stays root
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathRootOnly0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJoinPathRootOnly0084 begin');
      console.info('testJoinPathRootOnly0084 begin');
      expect(joinPath(['/'])).assertEqual('/');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0085
     * @tc.name      testNormalizeEmpty0085
     * @tc.desc      empty path normalizes to empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEmpty0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEmpty0085 begin');
      console.info('testNormalizeEmpty0085 begin');
      expect(normalizePath('')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0086
     * @tc.name      testNormalizeRoot0086
     * @tc.desc      root slash is preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeRoot0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeRoot0086 begin');
      console.info('testNormalizeRoot0086 begin');
      expect(normalizePath('/')).assertEqual('/');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0087
     * @tc.name      testNormalizeDot0087
     * @tc.desc      current directory segments are dropped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeDot0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeDot0087 begin');
      console.info('testNormalizeDot0087 begin');
      expect(normalizePath('/a/./b')).assertEqual('/a/b');
      expect(normalizePath('./a')).assertEqual('a');
      expect(normalizePath('a/.')).assertEqual('a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0088
     * @tc.name      testNormalizeDotDot0088
     * @tc.desc      parent segments resolve against the stack
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeDotDot0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeDotDot0088 begin');
      console.info('testNormalizeDotDot0088 begin');
      expect(normalizePath('/a/../b')).assertEqual('/b');
      expect(normalizePath('a/../b')).assertEqual('b');
      expect(normalizePath('/a/b/..')).assertEqual('/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0089
     * @tc.name      testNormalizeLeadingDotDot0089
     * @tc.desc      leading parent segments stay for relative paths
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeLeadingDotDot0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeLeadingDotDot0089 begin');
      console.info('testNormalizeLeadingDotDot0089 begin');
      expect(normalizePath('../a')).assertEqual('../a');
      expect(normalizePath('a/../../b')).assertEqual('../b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0090
     * @tc.name      testNormalizeRootDotDot0090
     * @tc.desc      parents above root are discarded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeRootDotDot0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeRootDotDot0090 begin');
      console.info('testNormalizeRootDotDot0090 begin');
      expect(normalizePath('/../a')).assertEqual('/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0091
     * @tc.name      testNormalizeDuplicateSlash0091
     * @tc.desc      duplicate slashes collapse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeDuplicateSlash0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeDuplicateSlash0091 begin');
      console.info('testNormalizeDuplicateSlash0091 begin');
      expect(normalizePath('a//b')).assertEqual('a/b');
      expect(normalizePath('//a///b//')).assertEqual('/a/b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0092
     * @tc.name      testSegmentsEmpty0092
     * @tc.desc      empty path has no segments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSegmentsEmpty0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSegmentsEmpty0092 begin');
      console.info('testSegmentsEmpty0092 begin');
      expect(segmentsOf('').length).assertEqual(0);
      expect(segmentsOf('/').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0093
     * @tc.name      testSegmentsBasic0093
     * @tc.desc      path segments are extracted in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSegmentsBasic0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSegmentsBasic0093 begin');
      console.info('testSegmentsBasic0093 begin');
      expect(joinTexts(segmentsOf('/a/b/c'))).assertEqual('a|b|c');
      expect(joinTexts(segmentsOf('a//b/'))).assertEqual('a|b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0094
     * @tc.name      testFileNameBasic0094
     * @tc.desc      file name is the last path segment
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFileNameBasic0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFileNameBasic0094 begin');
      console.info('testFileNameBasic0094 begin');
      expect(fileNameOf('/x/y.txt')).assertEqual('y.txt');
      expect(fileNameOf('y.txt')).assertEqual('y.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0095
     * @tc.name      testFileNameTrailingSlash0095
     * @tc.desc      trailing slash yields an empty file name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFileNameTrailingSlash0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFileNameTrailingSlash0095 begin');
      console.info('testFileNameTrailingSlash0095 begin');
      expect(fileNameOf('/x/')).assertEqual('');
      expect(fileNameOf('/')).assertEqual('');
      expect(fileNameOf('')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0096
     * @tc.name      testExtensionBasic0096
     * @tc.desc      extension excludes the dot
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionBasic0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtensionBasic0096 begin');
      console.info('testExtensionBasic0096 begin');
      expect(extensionOf('a.txt')).assertEqual('txt');
      expect(extensionOf('a.tar.gz')).assertEqual('gz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0097
     * @tc.name      testExtensionNone0097
     * @tc.desc      names without usable extensions return empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionNone0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtensionNone0097 begin');
      console.info('testExtensionNone0097 begin');
      expect(extensionOf('README')).assertEqual('');
      expect(extensionOf('.gitignore')).assertEqual('');
      expect(extensionOf('a.')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0098
     * @tc.name      testExtensionCase0098
     * @tc.desc      extension case is preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionCase0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtensionCase0098 begin');
      console.info('testExtensionCase0098 begin');
      expect(extensionOf('a.B')).assertEqual('B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0099
     * @tc.name      testBaseNameBasic0099
     * @tc.desc      base name drops the extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBaseNameBasic0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBaseNameBasic0099 begin');
      console.info('testBaseNameBasic0099 begin');
      expect(baseNameOf('a.txt')).assertEqual('a');
      expect(baseNameOf('a.tar.gz')).assertEqual('a.tar');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0100
     * @tc.name      testBaseNameDotfile0100
     * @tc.desc      dotfiles keep their whole name as base
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBaseNameDotfile0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBaseNameDotfile0100 begin');
      console.info('testBaseNameDotfile0100 begin');
      expect(baseNameOf('.gitignore')).assertEqual('.gitignore');
      expect(baseNameOf('README')).assertEqual('README');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0101
     * @tc.name      testStripExtension0101
     * @tc.desc      stripping keeps names without extensions unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStripExtension0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testStripExtension0101 begin');
      console.info('testStripExtension0101 begin');
      expect(stripExtension('a.txt')).assertEqual('a');
      expect(stripExtension('README')).assertEqual('README');
      expect(stripExtension('.gitignore')).assertEqual('.gitignore');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0102
     * @tc.name      testReplaceExtension0102
     * @tc.desc      extension replacement works with and without dots
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReplaceExtension0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReplaceExtension0102 begin');
      console.info('testReplaceExtension0102 begin');
      expect(replaceExtension('a.txt', 'md')).assertEqual('a.md');
      expect(replaceExtension('a.txt', '.md')).assertEqual('a.md');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0103
     * @tc.name      testReplaceExtensionNoExt0103
     * @tc.desc      names without extensions gain the new suffix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReplaceExtensionNoExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReplaceExtensionNoExt0103 begin');
      console.info('testReplaceExtensionNoExt0103 begin');
      expect(replaceExtension('a', 'md')).assertEqual('a.md');
      expect(replaceExtension('a', '.TXT')).assertEqual('a.TXT');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0104
     * @tc.name      testReplaceExtensionEmpty0104
     * @tc.desc      empty replacement removes the extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReplaceExtensionEmpty0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReplaceExtensionEmpty0104 begin');
      console.info('testReplaceExtensionEmpty0104 begin');
      expect(replaceExtension('a.txt', '')).assertEqual('a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0105
     * @tc.name      testReplaceExtensionDotfile0105
     * @tc.desc      dotfiles are treated as having no extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReplaceExtensionDotfile0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReplaceExtensionDotfile0105 begin');
      console.info('testReplaceExtensionDotfile0105 begin');
      expect(replaceExtension('.gitignore', 'txt')).assertEqual('.gitignore.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0106
     * @tc.name      testReplaceExtensionMultiDot0106
     * @tc.desc      only the last extension is replaced
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReplaceExtensionMultiDot0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReplaceExtensionMultiDot0106 begin');
      console.info('testReplaceExtensionMultiDot0106 begin');
      expect(replaceExtension('a.tar.gz', 'zip')).assertEqual('a.tar.zip');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0107
     * @tc.name      testIsSchemeTrue0107
     * @tc.desc      matching scheme returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsSchemeTrue0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testIsSchemeTrue0107 begin');
      console.info('testIsSchemeTrue0107 begin');
      expect(isScheme('file:///a', 'file')).assertTrue();
      expect(isScheme('FILE:///a', 'file')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0108
     * @tc.name      testIsSchemeFalse0108
     * @tc.desc      different schemes return false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsSchemeFalse0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testIsSchemeFalse0108 begin');
      console.info('testIsSchemeFalse0108 begin');
      expect(isScheme('datashare:///a', 'file')).assertFalse();
      expect(isScheme('', 'file')).assertFalse();
      expect(isScheme('filesystem', 'file')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0109
     * @tc.name      testIsFileLikeTrue0109
     * @tc.desc      file datashare and content are file like schemes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsFileLikeTrue0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testIsFileLikeTrue0109 begin');
      console.info('testIsFileLikeTrue0109 begin');
      expect(isFileLikeUri('file:///a')).assertTrue();
      expect(isFileLikeUri('datashare:///a')).assertTrue();
      expect(isFileLikeUri('content://a')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0110
     * @tc.name      testIsFileLikeFalse0110
     * @tc.desc      remote schemes and invalid text are not file like
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsFileLikeFalse0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testIsFileLikeFalse0110 begin');
      console.info('testIsFileLikeFalse0110 begin');
      expect(isFileLikeUri('https://example.com')).assertFalse();
      expect(isFileLikeUri('not a uri')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0111
     * @tc.name      testQueryDecodeInvalid0111
     * @tc.desc      invalid percent in query is reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryDecodeInvalid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryDecodeInvalid0111 begin');
      console.info('testQueryDecodeInvalid0111 begin');
      const parsed: QueryParseResult = parseQuery('a=%zz');
      expect(parsed.valid).assertFalse();
      expect(parsed.params[0].value).assertEqual('%zz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0112
     * @tc.name      testParseQueryFragmentInValue0112
     * @tc.desc      hash is removed from the query before parsing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryFragmentInValue0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryFragmentInValue0112 begin');
      console.info('testParseQueryFragmentInValue0112 begin');
      const parsed: UriParseResult = parseUri('file://h/p?a=1#frag');
      expect(parsed.parts.query).assertEqual('a=1');
      expect(parsed.parts.fragment).assertEqual('frag');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0113
     * @tc.name      testParseNoPathWithQuery0113
     * @tc.desc      scheme with query and empty path is valid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNoPathWithQuery0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNoPathWithQuery0113 begin');
      console.info('testParseNoPathWithQuery0113 begin');
      const parsed: UriParseResult = parseUri('file:?q=1');
      expect(parsed.parts.path).assertEqual('');
      expect(parsed.parts.query).assertEqual('q=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0114
     * @tc.name      testParseDlpUri0114
     * @tc.desc      dlp style file uri keeps its full path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseDlpUri0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseDlpUri0114 begin');
      console.info('testParseDlpUri0114 begin');
      const parsed: UriParseResult = parseUri('file://docs/storage/Users/currentUser/a.txt.dlp');
      expect(parsed.parts.authority).assertEqual('docs');
      expect(parsed.parts.path).assertEqual('/storage/Users/currentUser/a.txt.dlp');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URICORE_0115
     * @tc.name      testBuildEmptyParts0115
     * @tc.desc      minimal parts rebuild as scheme colon only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildEmptyParts0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildEmptyParts0115 begin');
      console.info('testBuildEmptyParts0115 begin');
      const parts: UriParts = new UriParts('x', '', '', '', '');
      expect(buildUri(parts)).assertEqual('x:');
    })
  });
}
