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
import { QueryParam, QueryParseResult, UriDecodeResult, UriParseResult, UriParts, buildQuery, buildUri,
  baseNameOf, decodeComponent, encodeComponent, extensionOf, fileNameOf, findQueryParam, getQueryParam,
  isFileLikeUri, isScheme, joinPath, normalizePath, parseQuery, parseUri, replaceExtension, segmentsOf,
  stripExtension, upsertQuery } from '../main/ets/core/UriCore';

function joinTexts(values: string[]): string {
  return values.join('|');
}

function roundTrip(source: string): string {
  return decodeComponent(encodeComponent(source, false), false).text;
}

export default function uriMatrixTest(): void {
  describe('UriMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0001
     * @tc.name      testEncodeAscii0001
     * @tc.desc      ascii letters survive encoding unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeAscii0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeAscii0001 begin');
      console.info('testEncodeAscii0001 begin');
      expect(roundTrip('abcdefghijklmnopqrstuvwxyz')).assertEqual('abcdefghijklmnopqrstuvwxyz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0002
     * @tc.name      testEncodeUpper0002
     * @tc.desc      uppercase letters survive encoding unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUpper0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUpper0002 begin');
      console.info('testEncodeUpper0002 begin');
      expect(roundTrip('ABCDEFGHIJKLMNOPQRSTUVWXYZ')).assertEqual('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0003
     * @tc.name      testEncodeDigits0003
     * @tc.desc      digits survive encoding unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeDigits0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeDigits0003 begin');
      console.info('testEncodeDigits0003 begin');
      expect(roundTrip('0123456789')).assertEqual('0123456789');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0004
     * @tc.name      testEncodeUnreserved0004
     * @tc.desc      unreserved punctuation survives encoding unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUnreserved0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUnreserved0004 begin');
      console.info('testEncodeUnreserved0004 begin');
      expect(roundTrip('-_.~')).assertEqual('-_.~');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0005
     * @tc.name      testEncodeSpace0005
     * @tc.desc      spaces round trip through percent encoding
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeSpace0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeSpace0005 begin');
      console.info('testEncodeSpace0005 begin');
      expect(encodeComponent('a b', false)).assertEqual('a%20b');
      expect(roundTrip('a b')).assertEqual('a b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0006
     * @tc.name      testEncodeReserved0006
     * @tc.desc      reserved characters are percent encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeReserved0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeReserved0006 begin');
      console.info('testEncodeReserved0006 begin');
      expect(encodeComponent('?#&=+', false)).assertEqual('%3F%23%26%3D%2B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0007
     * @tc.name      testEncodeSlash0007
     * @tc.desc      slash handling depends on the keep flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeSlash0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeSlash0007 begin');
      console.info('testEncodeSlash0007 begin');
      expect(encodeComponent('a/b', true)).assertEqual('a/b');
      expect(encodeComponent('a/b', false)).assertEqual('a%2Fb');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0008
     * @tc.name      testEncodeChinese0008
     * @tc.desc      single chinese character encodes to utf8 bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeChinese0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeChinese0008 begin');
      console.info('testEncodeChinese0008 begin');
      expect(encodeComponent('你', false)).assertEqual('%E4%BD%A0');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0009
     * @tc.name      testEncodeChineseSentence0009
     * @tc.desc      chinese sentences round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeChineseSentence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeChineseSentence0009 begin');
      console.info('testEncodeChineseSentence0009 begin');
      expect(roundTrip('年度报告与权限说明')).assertEqual('年度报告与权限说明');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0010
     * @tc.name      testEncodeEmoji0010
     * @tc.desc      emoji round trips through four percent bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeEmoji0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeEmoji0010 begin');
      console.info('testEncodeEmoji0010 begin');
      expect(encodeComponent('😀', false)).assertEqual('%F0%9F%98%80');
      expect(roundTrip('文件😀')).assertEqual('文件😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0011
     * @tc.name      testEncodeMixed0011
     * @tc.desc      mixed names round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeMixed0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeMixed0011 begin');
      console.info('testEncodeMixed0011 begin');
      expect(roundTrip('2026 年度 report-final(1).txt')).assertEqual('2026 年度 report-final(1).txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0012
     * @tc.name      testEncodePercent0012
     * @tc.desc      percent signs round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodePercent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodePercent0012 begin');
      console.info('testEncodePercent0012 begin');
      expect(encodeComponent('100%', false)).assertEqual('100%25');
      expect(roundTrip('100%')).assertEqual('100%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0013
     * @tc.name      testEncodeNewline0013
     * @tc.desc      newlines and tabs round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeNewline0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeNewline0013 begin');
      console.info('testEncodeNewline0013 begin');
      expect(roundTrip('a\nb\tc')).assertEqual('a\nb\tc');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0014
     * @tc.name      testEncodeLongText0014
     * @tc.desc      long text round trips without loss
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeLongText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeLongText0014 begin');
      console.info('testEncodeLongText0014 begin');
      let source: string = '';
      for (let index = 0; index < 100; index++) {
        source += 'ab你';
      }
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0015
     * @tc.name      testDecodePlusMode0015
     * @tc.desc      plus is decoded as space in query mode
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodePlusMode0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodePlusMode0015 begin');
      console.info('testDecodePlusMode0015 begin');
      expect(decodeComponent('a+b', true).text).assertEqual('a b');
      expect(decodeComponent('a+b', false).text).assertEqual('a+b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0016
     * @tc.name      testParseFull0016
     * @tc.desc      full uris expose every component
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFull0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFull0016 begin');
      console.info('testParseFull0016 begin');
      const parsed: UriParseResult = parseUri('file://host/a?x=1&y=2#f');
      expect(parsed.parts.scheme).assertEqual('file');
      expect(parsed.parts.authority).assertEqual('host');
      expect(parsed.parts.path).assertEqual('/a');
      expect(parsed.parts.query).assertEqual('x=1&y=2');
      expect(parsed.parts.fragment).assertEqual('f');
      expect(parsed.parts.hasAuthority).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0017
     * @tc.name      testParseTripleSlash0017
     * @tc.desc      triple slash keeps an empty authority flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseTripleSlash0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseTripleSlash0017 begin');
      console.info('testParseTripleSlash0017 begin');
      const parsed: UriParseResult = parseUri('file:///a');
      expect(parsed.parts.authority).assertEqual('');
      expect(parsed.parts.path).assertEqual('/a');
      expect(parsed.parts.hasAuthority).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0018
     * @tc.name      testParseNoPath0018
     * @tc.desc      authority only uris parse with an empty path
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNoPath0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNoPath0018 begin');
      console.info('testParseNoPath0018 begin');
      expect(parseUri('file://host').parts.path).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0019
     * @tc.name      testParsePort0019
     * @tc.desc      ports remain part of the authority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParsePort0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParsePort0019 begin');
      console.info('testParsePort0019 begin');
      const parsed: UriParseResult = parseUri('http://host:8080/a');
      expect(parsed.parts.authority).assertEqual('host:8080');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0020
     * @tc.name      testParseIpv60020
     * @tc.desc      bracketed ipv6 hosts are parsed as authority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseIpv60020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseIpv60020 begin');
      console.info('testParseIpv60020 begin');
      const parsed: UriParseResult = parseUri('file://[::1]/a');
      expect(parsed.parts.authority).assertEqual('[::1]');
      expect(parsed.parts.path).assertEqual('/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0021
     * @tc.name      testParseEncodedPath0021
     * @tc.desc      encoded paths are not decoded during parsing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEncodedPath0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEncodedPath0021 begin');
      console.info('testParseEncodedPath0021 begin');
      expect(parseUri('file://host/a%20b').parts.path).assertEqual('/a%20b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0022
     * @tc.name      testParseUnicodePath0022
     * @tc.desc      unicode paths are preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseUnicodePath0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseUnicodePath0022 begin');
      console.info('testParseUnicodePath0022 begin');
      expect(parseUri('file://host/中文/文件.txt').parts.path).assertEqual('/中文/文件.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0023
     * @tc.name      testParseQuestionTwice0023
     * @tc.desc      a second question mark stays in the query
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQuestionTwice0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQuestionTwice0023 begin');
      console.info('testParseQuestionTwice0023 begin');
      expect(parseUri('file://host/a?q=1?2').parts.query).assertEqual('q=1?2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0024
     * @tc.name      testParseHashTwice0024
     * @tc.desc      a second hash stays in the fragment
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseHashTwice0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseHashTwice0024 begin');
      console.info('testParseHashTwice0024 begin');
      expect(parseUri('file://host/a#f#g').parts.fragment).assertEqual('f#g');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0025
     * @tc.name      testParseMissingScheme0025
     * @tc.desc      text without a colon is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMissingScheme0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMissingScheme0025 begin');
      console.info('testParseMissingScheme0025 begin');
      expect(parseUri('file').valid).assertFalse();
      expect(parseUri('/a/b').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0026
     * @tc.name      testParseDigitScheme0026
     * @tc.desc      schemes cannot start with a digit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseDigitScheme0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseDigitScheme0026 begin');
      console.info('testParseDigitScheme0026 begin');
      expect(parseUri('1x://h').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0027
     * @tc.name      testParseBadSchemeChars0027
     * @tc.desc      spaces and underscores are not scheme characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadSchemeChars0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseBadSchemeChars0027 begin');
      console.info('testParseBadSchemeChars0027 begin');
      expect(parseUri('a b://h').valid).assertFalse();
      expect(parseUri('a_b://h').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0028
     * @tc.name      testBuildTripleSlash0028
     * @tc.desc      empty authorities rebuild with triple slash
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildTripleSlash0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildTripleSlash0028 begin');
      console.info('testBuildTripleSlash0028 begin');
      const parts: UriParts = new UriParts('file', '', '/a', '', '', true);
      expect(buildUri(parts)).assertEqual('file:///a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0029
     * @tc.name      testBuildSingleSlash0029
     * @tc.desc      missing authority flags rebuild with a single slash
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildSingleSlash0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildSingleSlash0029 begin');
      console.info('testBuildSingleSlash0029 begin');
      const parts: UriParts = new UriParts('file', '', '/a', '', '', false);
      expect(buildUri(parts)).assertEqual('file:/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0030
     * @tc.name      testBuildQueryFragment0030
     * @tc.desc      query and fragment are appended correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryFragment0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryFragment0030 begin');
      console.info('testBuildQueryFragment0030 begin');
      const parts: UriParts = new UriParts('file', 'h', '/a', 'x=1', 'f', true);
      expect(buildUri(parts)).assertEqual('file://h/a?x=1#f');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0031
     * @tc.name      testRoundTripFile0031
     * @tc.desc      file uris round trip through parse and build
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripFile0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripFile0031 begin');
      console.info('testRoundTripFile0031 begin');
      const source: string = 'file://host/a';
      expect(buildUri(parseUri(source).parts)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0032
     * @tc.name      testRoundTripDatashare0032
     * @tc.desc      datashare uris round trip with triple slash
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripDatashare0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripDatashare0032 begin');
      console.info('testRoundTripDatashare0032 begin');
      const source: string = 'datashare:///media/100/a?x=1';
      expect(buildUri(parseUri(source).parts)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0033
     * @tc.name      testRoundTripFragment0033
     * @tc.desc      fragments survive parse and build
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripFragment0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripFragment0033 begin');
      console.info('testRoundTripFragment0033 begin');
      const source: string = 'file://h/a?x=1&y=2#section';
      expect(buildUri(parseUri(source).parts)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0034
     * @tc.name      testRoundTripAuthorityOnly0034
     * @tc.desc      authority only uris round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripAuthorityOnly0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripAuthorityOnly0034 begin');
      console.info('testRoundTripAuthorityOnly0034 begin');
      expect(buildUri(parseUri('file://h').parts)).assertEqual('file://h');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0035
     * @tc.name      testRoundTripQueryOnly0035
     * @tc.desc      query only uris round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripQueryOnly0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripQueryOnly0035 begin');
      console.info('testRoundTripQueryOnly0035 begin');
      expect(buildUri(parseUri('file:?q=1').parts)).assertEqual('file:?q=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0036
     * @tc.name      testParseQueryBasic0036
     * @tc.desc      query pairs are parsed in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryBasic0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryBasic0036 begin');
      console.info('testParseQueryBasic0036 begin');
      const parsed: QueryParseResult = parseQuery('a=1&b=2');
      expect(parsed.params.length).assertEqual(2);
      expect(parsed.params[0].key).assertEqual('a');
      expect(parsed.params[1].value).assertEqual('2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0037
     * @tc.name      testParseQueryNoValue0037
     * @tc.desc      keys without values are kept
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryNoValue0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryNoValue0037 begin');
      console.info('testParseQueryNoValue0037 begin');
      expect(parseQuery('a').params[0].value).assertEqual('');
      expect(parseQuery('a=').params[0].value).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0038
     * @tc.name      testParseQueryEmptyParts0038
     * @tc.desc      empty fields are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEmptyParts0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryEmptyParts0038 begin');
      console.info('testParseQueryEmptyParts0038 begin');
      expect(parseQuery('&&a=1&').params.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0039
     * @tc.name      testParseQueryEncoded0039
     * @tc.desc      encoded keys and values are decoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEncoded0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryEncoded0039 begin');
      console.info('testParseQueryEncoded0039 begin');
      const parsed: QueryParseResult = parseQuery('k=%E4%B8%AD&v=a+b');
      expect(parsed.params[0].key).assertEqual('k');
      expect(parsed.params[0].value).assertEqual('中');
      expect(parsed.params[1].value).assertEqual('a b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0040
     * @tc.name      testParseQueryEqualsInValue0040
     * @tc.desc      only the first equals splits the value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEqualsInValue0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseQueryEqualsInValue0040 begin');
      console.info('testParseQueryEqualsInValue0040 begin');
      expect(parseQuery('a=1=2').params[0].value).assertEqual('1=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0041
     * @tc.name      testBuildQueryBasic0041
     * @tc.desc      query pairs join with ampersands
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryBasic0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryBasic0041 begin');
      console.info('testBuildQueryBasic0041 begin');
      const params: QueryParam[] = [new QueryParam('a', '1'), new QueryParam('b', '2')];
      expect(buildQuery(params)).assertEqual('a=1&b=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0042
     * @tc.name      testBuildQueryEncoded0042
     * @tc.desc      spaces and chinese are encoded when building
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryEncoded0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryEncoded0042 begin');
      console.info('testBuildQueryEncoded0042 begin');
      const params: QueryParam[] = [new QueryParam('k', '中 文')];
      expect(buildQuery(params)).assertEqual('k=%E4%B8%AD%20%E6%96%87');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0043
     * @tc.name      testGetQueryParam0043
     * @tc.desc      query lookups return decoded values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGetQueryParam0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGetQueryParam0043 begin');
      console.info('testGetQueryParam0043 begin');
      expect(getQueryParam('file://h/a?x=1&y=2', 'y')).assertEqual('2');
      expect(getQueryParam('file://h/a?x=1', 'z')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0044
     * @tc.name      testFindQueryParam0044
     * @tc.desc      query lookups distinguish missing keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindQueryParam0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindQueryParam0044 begin');
      console.info('testFindQueryParam0044 begin');
      expect(findQueryParam('file://h/a?x=1', 'x') !== null).assertTrue();
      expect(findQueryParam('file://h/a?x=1', 'z')).assertNull();
      expect(findQueryParam('bad', 'x')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0045
     * @tc.name      testUpsertAdd0045
     * @tc.desc      missing keys are appended
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertAdd0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertAdd0045 begin');
      console.info('testUpsertAdd0045 begin');
      expect(upsertQuery('file://h/a', 'x', '1')).assertEqual('file://h/a?x=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0046
     * @tc.name      testUpsertReplace0046
     * @tc.desc      existing keys are replaced in place
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertReplace0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertReplace0046 begin');
      console.info('testUpsertReplace0046 begin');
      expect(upsertQuery('file://h/a?x=1&y=2', 'x', '9')).assertEqual('file://h/a?x=9&y=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0047
     * @tc.name      testUpsertInvalid0047
     * @tc.desc      invalid uris are returned unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertInvalid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertInvalid0047 begin');
      console.info('testUpsertInvalid0047 begin');
      expect(upsertQuery('bad uri', 'x', '1')).assertEqual('bad uri');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0048
     * @tc.name      testJoinPath0048
     * @tc.desc      path segments join with single slashes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPath0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJoinPath0048 begin');
      console.info('testJoinPath0048 begin');
      expect(joinPath(['/', 'docs', 'a.txt'])).assertEqual('/docs/a.txt');
      expect(joinPath(['a/', '/b'])).assertEqual('a/b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0049
     * @tc.name      testJoinPathEmpty0049
     * @tc.desc      empty segment lists produce empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinPathEmpty0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJoinPathEmpty0049 begin');
      console.info('testJoinPathEmpty0049 begin');
      expect(joinPath([])).assertEqual('');
      expect(joinPath(['', ''])).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0050
     * @tc.name      testNormalizeDot0050
     * @tc.desc      current directory segments are removed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeDot0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeDot0050 begin');
      console.info('testNormalizeDot0050 begin');
      expect(normalizePath('/a/./b/.')).assertEqual('/a/b');
      expect(normalizePath('./a')).assertEqual('a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0051
     * @tc.name      testNormalizeDotDot0051
     * @tc.desc      parent segments resolve against the stack
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeDotDot0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeDotDot0051 begin');
      console.info('testNormalizeDotDot0051 begin');
      expect(normalizePath('/a/b/../c')).assertEqual('/a/c');
      expect(normalizePath('a/../../b')).assertEqual('../b');
      expect(normalizePath('/../a')).assertEqual('/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0052
     * @tc.name      testNormalizeSlash0052
     * @tc.desc      duplicate slashes collapse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeSlash0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeSlash0052 begin');
      console.info('testNormalizeSlash0052 begin');
      expect(normalizePath('a//b///c')).assertEqual('a/b/c');
      expect(normalizePath('/')).assertEqual('/');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0053
     * @tc.name      testSegments0053
     * @tc.desc      segments ignore empty parts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSegments0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSegments0053 begin');
      console.info('testSegments0053 begin');
      expect(joinTexts(segmentsOf('//a//b/'))).assertEqual('a|b');
      expect(segmentsOf('/').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0054
     * @tc.name      testFileName0054
     * @tc.desc      the file name is the last segment
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFileName0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFileName0054 begin');
      console.info('testFileName0054 begin');
      expect(fileNameOf('/docs/a.txt')).assertEqual('a.txt');
      expect(fileNameOf('/docs/')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0055
     * @tc.name      testExtension0055
     * @tc.desc      extensions use the last dot
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtension0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtension0055 begin');
      console.info('testExtension0055 begin');
      expect(extensionOf('a.tar.gz')).assertEqual('gz');
      expect(extensionOf('.gitignore')).assertEqual('');
      expect(extensionOf('a.')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0056
     * @tc.name      testBaseName0056
     * @tc.desc      base names drop the extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBaseName0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBaseName0056 begin');
      console.info('testBaseName0056 begin');
      expect(baseNameOf('a.tar.gz')).assertEqual('a.tar');
      expect(baseNameOf('README')).assertEqual('README');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0057
     * @tc.name      testStripReplace0057
     * @tc.desc      extension replacement handles dots and empties
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStripReplace0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testStripReplace0057 begin');
      console.info('testStripReplace0057 begin');
      expect(stripExtension('a.txt')).assertEqual('a');
      expect(replaceExtension('a.txt', 'md')).assertEqual('a.md');
      expect(replaceExtension('a.txt', '')).assertEqual('a');
      expect(replaceExtension('a', 'md')).assertEqual('a.md');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0058
     * @tc.name      testIsScheme0058
     * @tc.desc      scheme checks ignore case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsScheme0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testIsScheme0058 begin');
      console.info('testIsScheme0058 begin');
      expect(isScheme('FILE:///a', 'file')).assertTrue();
      expect(isScheme('https://a', 'file')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0059
     * @tc.name      testFileLike0059
     * @tc.desc      file like schemes are recognized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFileLike0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFileLike0059 begin');
      console.info('testFileLike0059 begin');
      expect(isFileLikeUri('file:///a')).assertTrue();
      expect(isFileLikeUri('datashare:///a')).assertTrue();
      expect(isFileLikeUri('https://a')).assertFalse();
      expect(isFileLikeUri('bad')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0060
     * @tc.name      testDecodeInvalidPercent0060
     * @tc.desc      malformed percent triplets are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeInvalidPercent0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeInvalidPercent0060 begin');
      console.info('testDecodeInvalidPercent0060 begin');
      const decoded: UriDecodeResult = decodeComponent('%zz', false);
      expect(decoded.valid).assertFalse();
      expect(decoded.text).assertEqual('%zz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0061
     * @tc.name      testDecodeRawUnicode0061
     * @tc.desc      raw unicode text is accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeRawUnicode0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeRawUnicode0061 begin');
      console.info('testDecodeRawUnicode0061 begin');
      expect(decodeComponent('中文😀', false).text).assertEqual('中文😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0062
     * @tc.name      testEncodeEmpty0062
     * @tc.desc      empty text encodes and decodes to empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeEmpty0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeEmpty0062 begin');
      console.info('testEncodeEmpty0062 begin');
      expect(encodeComponent('', false)).assertEqual('');
      expect(decodeComponent('', false).text).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0063
     * @tc.name      testUpsertFragment0063
     * @tc.desc      fragments survive query updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertFragment0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpsertFragment0063 begin');
      console.info('testUpsertFragment0063 begin');
      expect(upsertQuery('file://h/a?x=1#f', 'y', '2')).assertEqual('file://h/a?x=1&y=2#f');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0064
     * @tc.name      testRoundTripChineseUri0064
     * @tc.desc      unicode uris round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripChineseUri0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripChineseUri0064 begin');
      console.info('testRoundTripChineseUri0064 begin');
      const source: string = 'file://h/中文/报告.txt';
      expect(buildUri(parseUri(source).parts)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX_0065
     * @tc.name      testBuildQueryRoundTrip0065
     * @tc.desc      built queries parse back to the same pairs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryRoundTrip0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildQueryRoundTrip0065 begin');
      console.info('testBuildQueryRoundTrip0065 begin');
      const params: QueryParam[] = [new QueryParam('a b', '中 文'), new QueryParam('x', '1')];
      const parsed: QueryParseResult = parseQuery(buildQuery(params));
      expect(parsed.params[0].key).assertEqual('a b');
      expect(parsed.params[0].value).assertEqual('中 文');
      expect(parsed.params[1].key).assertEqual('x');
    })
  });
}
