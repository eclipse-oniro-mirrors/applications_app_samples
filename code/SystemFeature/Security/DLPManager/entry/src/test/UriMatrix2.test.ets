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
import { QueryParam, QueryParseResult, UriDecodeResult, UriParseResult, UriParts, baseNameOf,
  buildQuery, buildUri, decodeComponent, encodeComponent, extensionOf, fileNameOf, getQueryParam,
  isFileLikeUri, isScheme, joinPath, normalizePath, parseQuery, parseUri, replaceExtension,
  stripExtension, upsertQuery } from '../main/ets/core/UriCore';

function joinTexts(values: string[]): string {
  return values.join('|');
}

export default function uriMatrix2Test(): void {
  describe('UriMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0001
     * @tc.name      testUserInfoAuthority0001
     * @tc.desc      user info inside the authority is preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUserInfoAuthority0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: UriParseResult = parseUri('file://user@host/a');
      expect(parsed.parts.authority).assertEqual('user@host');
      expect(parsed.parts.path).assertEqual('/a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0002
     * @tc.name      testIpv6Port0002
     * @tc.desc      bracketed ipv6 hosts keep their ports
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIpv6Port0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: UriParseResult = parseUri('file://[::1]:8080/a');
      expect(parsed.parts.authority).assertEqual('[::1]:8080');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0003
     * @tc.name      testRoundTripEncodedQuery0003
     * @tc.desc      encoded queries round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripEncodedQuery0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'file://h/a?x=1%202&y=%E4%B8%AD';
      expect(buildUri(parseUri(source).parts)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0004
     * @tc.name      testRoundTripFragmentQuery0004
     * @tc.desc      fragments containing question marks round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripFragmentQuery0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'file://h/a#frag?x';
      expect(buildUri(parseUri(source).parts)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0005
     * @tc.name      testEncodeReservedSweep0005
     * @tc.desc      reserved characters encode to uppercase hex
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeReservedSweep0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(encodeComponent(':', false)).assertEqual('%3A');
      expect(encodeComponent('@', false)).assertEqual('%40');
      expect(encodeComponent(';', false)).assertEqual('%3B');
      expect(encodeComponent(',', false)).assertEqual('%2C');
      expect(encodeComponent('$', false)).assertEqual('%24');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0006
     * @tc.name      testEncodeBrackets0006
     * @tc.desc      brackets and parentheses are encoded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeBrackets0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(encodeComponent('[a]', false)).assertEqual('%5Ba%5D');
      expect(encodeComponent('(a)', false)).assertEqual('%28a%29');
      expect(encodeComponent('!*', false)).assertEqual('%21%2A');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0007
     * @tc.name      testDecodeInvalidSweep0007
     * @tc.desc      malformed percent sequences are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeInvalidSweep0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const trailing: UriDecodeResult = decodeComponent('abc%', false);
      const short: UriDecodeResult = decodeComponent('%1', false);
      expect(trailing.valid).assertFalse();
      expect(short.valid).assertFalse();
      expect(trailing.text).assertEqual('abc%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0008
     * @tc.name      testDecodePlusModes0008
     * @tc.desc      plus decoding depends on the mode
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodePlusModes0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(decodeComponent('a+b+c', true).text).assertEqual('a b c');
      expect(decodeComponent('a+b+c', false).text).assertEqual('a+b+c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0009
     * @tc.name      testParseQueryDuplicates0009
     * @tc.desc      duplicate query keys are all parsed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryDuplicates0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: QueryParseResult = parseQuery('a=1&a=2&a=3');
      expect(parsed.params.length).assertEqual(3);
      expect(parsed.params[2].value).assertEqual('3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0010
     * @tc.name      testParseQueryEmptyKey0010
     * @tc.desc      empty keys are preserved with their values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseQueryEmptyKey0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: QueryParseResult = parseQuery('=v');
      expect(parsed.params[0].key).assertEqual('');
      expect(parsed.params[0].value).assertEqual('v');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0011
     * @tc.name      testBuildQueryUnicode0011
     * @tc.desc      unicode query values encode correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildQueryUnicode0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const params: QueryParam[] = [new QueryParam('k', '中 文')];
      expect(buildQuery(params)).assertEqual('k=%E4%B8%AD%20%E6%96%87');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0012
     * @tc.name      testGetQueryDuplicate0012
     * @tc.desc      duplicate lookup returns the first value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGetQueryDuplicate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(getQueryParam('file://h/a?x=1&x=2', 'x')).assertEqual('1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0013
     * @tc.name      testUpsertAppend0013
     * @tc.desc      new keys are appended to existing queries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertAppend0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(upsertQuery('file://h/a?x=1', 'y', '2')).assertEqual('file://h/a?x=1&y=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0014
     * @tc.name      testUpsertMiddle0014
     * @tc.desc      middle keys are replaced in place
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertMiddle0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(upsertQuery('file://h/a?x=1&y=2&z=3', 'y', '9')).assertEqual('file://h/a?x=1&y=9&z=3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0015
     * @tc.name      testUpsertFragment0015
     * @tc.desc      fragments survive updates
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertFragment0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(upsertQuery('file://h/a#f', 'x', '1')).assertEqual('file://h/a?x=1#f');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0016
     * @tc.name      testUpsertEncoded0016
     * @tc.desc      encoded values are used for new keys
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertEncoded0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(upsertQuery('file://h/a', 'k', '中 文'))
        .assertEqual('file://h/a?k=%E4%B8%AD%20%E6%96%87');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0017
     * @tc.name      testNormalizeDeep0017
     * @tc.desc      deep parent traversal resolves against the stack
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeDeep0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(normalizePath('/a/b/../../../c')).assertEqual('/c');
      expect(normalizePath('a/b/../../../c')).assertEqual('../c');
      expect(normalizePath('/a//../b')).assertEqual('/b');
      expect(normalizePath('./../a')).assertEqual('../a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0018
     * @tc.name      testJoinNoNormalize0018
     * @tc.desc      joining does not resolve dot segments
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinNoNormalize0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(joinPath(['/a', './b'])).assertEqual('/a/./b');
      expect(joinPath(['a', '..', 'b'])).assertEqual('a/../b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0019
     * @tc.name      testJoinAbsolute0019
     * @tc.desc      leading slashes keep the result absolute
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJoinAbsolute0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(joinPath(['/'])).assertEqual('/');
      expect(joinPath(['/', 'b', 'c'])).assertEqual('/b/c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0020
     * @tc.name      testFileNameMatrix0020
     * @tc.desc      file name extraction covers trailing slashes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFileNameMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(fileNameOf('/a/b/')).assertEqual('');
      expect(fileNameOf('/a/b/c.txt')).assertEqual('c.txt');
      expect(fileNameOf('')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0021
     * @tc.name      testExtensionMultiDot0021
     * @tc.desc      extension utilities handle archive.tar.gz names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionMultiDot0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(extensionOf('archive.tar.gz')).assertEqual('gz');
      expect(baseNameOf('archive.tar.gz')).assertEqual('archive.tar');
      expect(stripExtension('archive.tar.gz')).assertEqual('archive.tar');
      expect(replaceExtension('archive.tar.gz', 'zip')).assertEqual('archive.tar.zip');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0022
     * @tc.name      testSchemeMatrix0022
     * @tc.desc      scheme helpers cover file like schemes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSchemeMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isScheme('datashare:///a', 'datashare')).assertTrue();
      expect(isScheme('datashare:///a', 'file')).assertFalse();
      expect(isFileLikeUri('content://a')).assertTrue();
      expect(isFileLikeUri('http://a')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0023
     * @tc.name      testParseEmptyPathQuery0023
     * @tc.desc      empty paths with queries are valid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmptyPathQuery0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: UriParseResult = parseUri('file:?a=1&b=2');
      expect(parsed.valid).assertTrue();
      expect(parsed.parts.path).assertEqual('');
      expect(parsed.parts.query).assertEqual('a=1&b=2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0024
     * @tc.name      testBuildTripleSlashQuery0024
     * @tc.desc      triple slash uris rebuild with queries intact
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildTripleSlashQuery0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parts: UriParts = new UriParts('datashare', '', '/media/1', 'x=1', '', true);
      expect(buildUri(parts)).assertEqual('datashare:///media/1?x=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0025
     * @tc.name      testDecodeTruncatedUtf80025
     * @tc.desc      truncated utf8 percent bytes are invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeTruncatedUtf80025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const decoded: UriDecodeResult = decodeComponent('%F0%9F', false);
      expect(decoded.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0026
     * @tc.name      testRoundTripSlashPath0026
     * @tc.desc      paths with multiple segments round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripSlashPath0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'file://host/a/b/c/d.txt';
      expect(buildUri(parseUri(source).parts)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0027
     * @tc.name      testEncodeKeepSlashPath0027
     * @tc.desc      keeping slashes works for multi segment paths
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeKeepSlashPath0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(encodeComponent('/a/b c/', true)).assertEqual('/a/b%20c/');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0028
     * @tc.name      testQueryRoundTripRepeated0028
     * @tc.desc      repeated query keys survive build and parse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryRoundTripRepeated0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const params: QueryParam[] = [new QueryParam('a', '1'), new QueryParam('a', '2')];
      const parsed: QueryParseResult = parseQuery(buildQuery(params));
      expect(parsed.params.length).assertEqual(2);
      expect(parsed.params[1].value).assertEqual('2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0029
     * @tc.name      testInvalidSchemeMatrix0029
     * @tc.desc      invalid schemes are rejected with reasons
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidSchemeMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseUri('').reason).assertEqual('empty');
      expect(parseUri('1a://x').reason).assertEqual('bad-scheme');
      expect(parseUri('a b://x').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_URIMATRIX2_0030
     * @tc.name      testUpsertNoQueryPreserved0030
     * @tc.desc      repeated updates keep prior parameters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpsertNoQueryPreserved0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: string = upsertQuery('file://h/a', 'a', '1');
      const second: string = upsertQuery(first, 'b', '2');
      expect(first).assertEqual('file://h/a?a=1');
      expect(second).assertEqual('file://h/a?a=1&b=2');
    })
  });
}
