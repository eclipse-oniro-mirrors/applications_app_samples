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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { JsonUtils, ValidateUtils } from 'photopickersendable';

/** Placeholder returned by the json helpers when the input cannot be processed. */
const INVALID_JSON_TEXT: string = '[invalid json]';

/**
 * Registers the unit cases of JsonUtils and ValidateUtils.
 */
export default function jsonValidateUtilsTest() {
  describe('JsonValidateUtilsTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0100
     * @tc.name      testJsonValidate0001
     * @tc.desc      Verify stringifySafe renders plain text with json quoting,
     *               escapes quotes and control characters and degrades missing
     *               input to the null literal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Quote a plain text as a json string.
      expect(JsonUtils.stringifySafe('hello')).assertEqual('"hello"');
      // Escape an embedded double quote through the platform serializer.
      expect(JsonUtils.stringifySafe('a"b')).assertEqual('"a\\"b"');
      // Escape a tab character as the \\t sequence.
      expect(JsonUtils.stringifySafe('tab\tend')).assertEqual('"tab\\tend"');
      // Degrade a missing value to the json null literal.
      expect(JsonUtils.stringifySafe(undefined)).assertEqual('null');
      // Degrade an explicit null to the same literal.
      expect(JsonUtils.stringifySafe(null)).assertEqual('null');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0200
     * @tc.name      testJsonValidate0002
     * @tc.desc      Verify stringifySafe serializes string lists into json arrays,
     *               keeps an empty list empty and preserves blanks and non ascii
     *               characters inside the entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Render an empty list as an empty json array.
      expect(JsonUtils.stringifySafe([])).assertEqual('[]');
      // Serialize two entries separated by a comma.
      expect(JsonUtils.stringifySafe(['a', 'b'])).assertEqual('["a","b"]');
      // Keep the blank inside the first entry and the single quote inside the second one.
      expect(JsonUtils.stringifySafe(['x y', "p'q"])).assertEqual('["x y","p\'q"]');
      // Pass a non ascii entry through without mangling.
      expect(JsonUtils.stringifySafe(['中文值'])).assertEqual('["中文值"]');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0300
     * @tc.name      testJsonValidate0003
     * @tc.desc      Verify isValidJson accepts objects, arrays, string literals and
     *               scalar json values produced by real call sites.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // An object with two entries is valid json.
      expect(JsonUtils.isValidJson('{"album":"camera","count":3}')).assertTrue();
      // An array of numbers is valid json.
      expect(JsonUtils.isValidJson('[1,2,3]')).assertTrue();
      // A quoted string literal is valid json on its own.
      expect(JsonUtils.isValidJson('"quoted"')).assertTrue();
      // A bare number is valid json.
      expect(JsonUtils.isValidJson('42')).assertTrue();
      // A bare boolean literal is valid json.
      expect(JsonUtils.isValidJson('true')).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0400
     * @tc.name      testJsonValidate0004
     * @tc.desc      Verify isValidJson rejects malformed input safely instead of
     *               throwing: missing text, blank text, truncated containers,
     *               illegal tokens and trailing commas all return false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // An empty text is not json.
      expect(JsonUtils.isValidJson('')).assertFalse();
      // A blank text made of spaces is not json either.
      expect(JsonUtils.isValidJson('   ')).assertFalse();
      // Missing input degrades to false without throwing.
      expect(JsonUtils.isValidJson(undefined)).assertFalse();
      // Explicit null degrades to false as well.
      expect(JsonUtils.isValidJson(null)).assertFalse();
      // A truncated object is rejected.
      expect(JsonUtils.isValidJson('{"a":1')).assertFalse();
      // An unquoted key is an illegal token and is rejected.
      expect(JsonUtils.isValidJson('{a:1}')).assertFalse();
      // A trailing comma inside an array is rejected.
      expect(JsonUtils.isValidJson('[1,2,]')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0500
     * @tc.name      testJsonValidate0005
     * @tc.desc      Verify prettyPrint re-indents a flat object with two spaces per
     *               level, trims surrounding blanks and nests one level deeper for
     *               an embedded object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Re-indent a flat object with one entry per line.
      expect(JsonUtils.prettyPrint('{"a":1,"b":2}')).assertEqual('{\n  "a": 1,\n  "b": 2\n}');
      // Remove the insignificant blanks around the text before formatting.
      expect(JsonUtils.prettyPrint('  {"a":1}  ')).assertEqual('{\n  "a": 1\n}');
      // Indent the embedded object one level deeper than the outer one.
      expect(JsonUtils.prettyPrint('{"a":{"b":1}}')).assertEqual('{\n  "a": {\n    "b": 1\n  }\n}');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0600
     * @tc.name      testJsonValidate0006
     * @tc.desc      Verify prettyPrint degrades missing and malformed input to the
     *               invalid json placeholder and passes scalar values through
     *               unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // An empty text cannot be formatted and degrades to the placeholder.
      expect(JsonUtils.prettyPrint('')).assertEqual(INVALID_JSON_TEXT);
      // Missing input degrades to the same placeholder.
      expect(JsonUtils.prettyPrint(undefined)).assertEqual(INVALID_JSON_TEXT);
      // Explicit null degrades to the same placeholder.
      expect(JsonUtils.prettyPrint(null)).assertEqual(INVALID_JSON_TEXT);
      // A text that is not json degrades to the placeholder without throwing.
      expect(JsonUtils.prettyPrint('{bad}')).assertEqual(INVALID_JSON_TEXT);
      // A valid scalar is handed back unchanged.
      expect(JsonUtils.prettyPrint('42')).assertEqual('42');
      // A valid string literal is handed back unchanged.
      expect(JsonUtils.prettyPrint('"ok"')).assertEqual('"ok"');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0700
     * @tc.name      testJsonValidate0007
     * @tc.desc      Verify minify drops the insignificant blanks of objects and
     *               arrays and keeps the blanks inside a string literal intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Collapse a padded object into its compact form.
      expect(JsonUtils.minify('{ "a" : 1 , "b" : [ 2 , 3 ] }')).assertEqual('{"a":1,"b":[2,3]}');
      // Trim the surrounding blanks of an array as well.
      expect(JsonUtils.minify('  [ 1 , 2 ]  ')).assertEqual('[1,2]');
      // Keep the blanks inside a string literal because they are part of the value.
      expect(JsonUtils.minify('"a b  c"')).assertEqual('"a b  c"');
      // Keep an escape sequence inside a string literal untouched.
      expect(JsonUtils.minify('"a\\tb"')).assertEqual('"a\\tb"');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0800
     * @tc.name      testJsonValidate0008
     * @tc.desc      Verify minify degrades missing and malformed input to the
     *               invalid json placeholder instead of throwing and keeps an
     *               escaped quote inside a string literal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // An empty text is not json and degrades to the placeholder.
      expect(JsonUtils.minify('')).assertEqual(INVALID_JSON_TEXT);
      // Missing input degrades to the same placeholder.
      expect(JsonUtils.minify(undefined)).assertEqual(INVALID_JSON_TEXT);
      // Explicit null degrades to the same placeholder.
      expect(JsonUtils.minify(null)).assertEqual(INVALID_JSON_TEXT);
      // A truncated object degrades to the placeholder without throwing.
      expect(JsonUtils.minify('{"a":')).assertEqual(INVALID_JSON_TEXT);
      // An escaped quote inside a string literal survives the minify walk.
      expect(JsonUtils.minify('"a\\"b"')).assertEqual('"a\\"b"');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_0900
     * @tc.name      testJsonValidate0009
     * @tc.desc      Verify isPhone accepts a padded mainland mobile number and
     *               rejects empty, missing and null input without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A plain eleven digit mobile number is accepted.
      expect(ValidateUtils.isPhone('13812345678')).assertTrue();
      // Padded blanks around the number are trimmed before the check.
      expect(ValidateUtils.isPhone('  13812345678  ')).assertTrue();
      // An empty text is rejected.
      expect(ValidateUtils.isPhone('')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isPhone(undefined)).assertFalse();
      // Explicit null is rejected as well.
      expect(ValidateUtils.isPhone(null)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1000
     * @tc.name      testJsonValidate0010
     * @tc.desc      Verify isPhone enforces the numbering plan boundaries: the
     *               carrier digit range, the leading digit and the eleven digit
     *               length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The lower carrier prefix three is accepted.
      expect(ValidateUtils.isPhone('13299999999')).assertTrue();
      // The upper carrier prefix nine is accepted.
      expect(ValidateUtils.isPhone('13999999999')).assertTrue();
      // Carrier prefix two is outside the assigned block.
      expect(ValidateUtils.isPhone('12999999999')).assertFalse();
      // A leading zero is not a mobile number.
      expect(ValidateUtils.isPhone('03812345678')).assertFalse();
      // Ten digits are one short of the numbering plan.
      expect(ValidateUtils.isPhone('1381234567')).assertFalse();
      // Twelve digits are one too many.
      expect(ValidateUtils.isPhone('138123456789')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1100
     * @tc.name      testJsonValidate0011
     * @tc.desc      Verify isPhoneByDigits reproduces the phone branches without the
     *               regular expression: carrier prefix bounds, letter tails, wrong
     *               lengths and missing input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A valid mobile number inside the carrier block is accepted.
      expect(ValidateUtils.isPhoneByDigits('18912345678')).assertTrue();
      // Carrier prefix two is rejected by the digit walk.
      expect(ValidateUtils.isPhoneByDigits('12912345678')).assertFalse();
      // A trailing letter breaks the digit check.
      expect(ValidateUtils.isPhoneByDigits('1381234567a')).assertFalse();
      // Ten digits are rejected by the length guard.
      expect(ValidateUtils.isPhoneByDigits('1381234567')).assertFalse();
      // A leading letter fails the first digit check.
      expect(ValidateUtils.isPhoneByDigits('abc12345678')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isPhoneByDigits(undefined)).assertFalse();
      // An empty text is rejected as well.
      expect(ValidateUtils.isPhoneByDigits('')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1200
     * @tc.name      testJsonValidate0012
     * @tc.desc      Verify isEmail accepts dotted and tagged local parts with
     *               multi-label domains and rejects missing separators, bare
     *               domains, empty local parts and blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A plain address with one dot domain is accepted.
      expect(ValidateUtils.isEmail('user@example.com')).assertTrue();
      // Dots and a plus tag in the local part with a two label domain are accepted.
      expect(ValidateUtils.isEmail('first.last+tag@sub.domain-x.org')).assertTrue();
      // A text without the at sign is rejected.
      expect(ValidateUtils.isEmail('no-at-sign.example')).assertFalse();
      // A domain without any dot label is rejected.
      expect(ValidateUtils.isEmail('missing@tld')).assertFalse();
      // An empty local part is rejected.
      expect(ValidateUtils.isEmail('@example.com')).assertFalse();
      // A blank inside the local part is rejected.
      expect(ValidateUtils.isEmail('a b@example.com')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isEmail(undefined)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1300
     * @tc.name      testJsonValidate0013
     * @tc.desc      Verify isUrl accepts http and https forms with optional port
     *               and path and rejects foreign schemes and hostless texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A plain https address with a bare host is accepted.
      expect(ValidateUtils.isUrl('https://example.com')).assertTrue();
      // A http address with port, path and query is accepted.
      expect(ValidateUtils.isUrl('http://example.com:8080/photo/album?count=3')).assertTrue();
      // The ftp scheme is outside the supported set.
      expect(ValidateUtils.isUrl('ftp://example.com')).assertFalse();
      // A scheme without a host is rejected.
      expect(ValidateUtils.isUrl('https://')).assertFalse();
      // A scheme-less host reference is rejected.
      expect(ValidateUtils.isUrl('//example.com')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isUrl(undefined)).assertFalse();
      // An empty text is rejected as well.
      expect(ValidateUtils.isUrl('')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1400
     * @tc.name      testJsonValidate0014
     * @tc.desc      Verify isNumber accepts signed decimal forms with padded blanks
     *               and rejects exponent, hexadecimal, plus sign and multi dot
     *               forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // A plain integer text is accepted.
      expect(ValidateUtils.isNumber('123')).assertTrue();
      // A negative value with a fraction is accepted.
      expect(ValidateUtils.isNumber('-12.50')).assertTrue();
      // Padded blanks around the digits are trimmed before the check.
      expect(ValidateUtils.isNumber(' 42 ')).assertTrue();
      // The plus sign is outside the accepted sign forms.
      expect(ValidateUtils.isNumber('+5')).assertFalse();
      // The exponent form is rejected on purpose.
      expect(ValidateUtils.isNumber('1e5')).assertFalse();
      // The hexadecimal form is rejected on purpose.
      expect(ValidateUtils.isNumber('0x1f')).assertFalse();
      // A second dot breaks the single fraction group.
      expect(ValidateUtils.isNumber('12.3.4')).assertFalse();
      // Explicit null is rejected without throwing.
      expect(ValidateUtils.isNumber(null)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1500
     * @tc.name      testJsonValidate0015
     * @tc.desc      Verify isEmptyString treats missing, empty and whitespace only
     *               texts as empty and keeps texts with any visible character
     *               non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonValidate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // An empty text counts as empty.
      expect(ValidateUtils.isEmptyString('')).assertTrue();
      // A text of blanks counts as empty.
      expect(ValidateUtils.isEmptyString('   ')).assertTrue();
      // A text of tab and newline counts as empty.
      expect(ValidateUtils.isEmptyString('\t\n')).assertTrue();
      // Missing input counts as empty.
      expect(ValidateUtils.isEmptyString(undefined)).assertTrue();
      // Explicit null counts as empty.
      expect(ValidateUtils.isEmptyString(null)).assertTrue();
      // A text with letters is not empty.
      expect(ValidateUtils.isEmptyString('data')).assertFalse();
      // A text with blanks around a letter is not empty either.
      expect(ValidateUtils.isEmptyString(' x ')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1600
     * @tc.name      testJsonValidate0016
     * @tc.desc      Verify isHexColor accepts upper and lower case six digit colors
     *               and rejects five and seven digit texts, a missing hash and
     *               illegal digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // An upper case six digit color is accepted.
      expect(ValidateUtils.isHexColor('#FF00AA')).assertTrue();
      // A lower case six digit color is accepted as well.
      expect(ValidateUtils.isHexColor('#ff00aa')).assertTrue();
      // Five digits are one short of the color format.
      expect(ValidateUtils.isHexColor('#F00AA')).assertFalse();
      // Seven digits are one too many.
      expect(ValidateUtils.isHexColor('#FF00ABC')).assertFalse();
      // The leading hash is mandatory.
      expect(ValidateUtils.isHexColor('FF00AA')).assertFalse();
      // The letter G is not a hexadecimal digit.
      expect(ValidateUtils.isHexColor('#GG00AA')).assertFalse();
      // An empty text is rejected without throwing.
      expect(ValidateUtils.isHexColor('')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1700
     * @tc.name      testJsonValidate0017
     * @tc.desc      Verify isValidIndex accepts whole indexes inside the list
     *               bounds and rejects the upper boundary, negative indexes,
     *               fractional indexes and indexes into an empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The first index of a three entry list is valid.
      expect(ValidateUtils.isValidIndex(0, 3)).assertTrue();
      // The last valid index is one below the length.
      expect(ValidateUtils.isValidIndex(2, 3)).assertTrue();
      // The index equal to the length is outside the bounds.
      expect(ValidateUtils.isValidIndex(3, 3)).assertFalse();
      // A negative index cannot address an entry.
      expect(ValidateUtils.isValidIndex(-1, 3)).assertFalse();
      // A fractional index is rejected even inside the bounds.
      expect(ValidateUtils.isValidIndex(1.5, 3)).assertFalse();
      // Any index is invalid for an empty list.
      expect(ValidateUtils.isValidIndex(0, 0)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1800
     * @tc.name      testJsonValidate0018
     * @tc.desc      Verify isPositiveInteger accepts strictly positive whole
     *               numbers and rejects zero, negatives, fractions and infinity,
     *               and that a NaN index fails the index guard.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonValidate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // One is the smallest positive integer.
      expect(ValidateUtils.isPositiveInteger(1)).assertTrue();
      // A larger whole number is accepted.
      expect(ValidateUtils.isPositiveInteger(100)).assertTrue();
      // Zero is not strictly positive.
      expect(ValidateUtils.isPositiveInteger(0)).assertFalse();
      // A negative whole number is rejected.
      expect(ValidateUtils.isPositiveInteger(-4)).assertFalse();
      // A fractional value is rejected even when positive.
      expect(ValidateUtils.isPositiveInteger(2.5)).assertFalse();
      // Infinity is rejected by the finite guard.
      expect(ValidateUtils.isPositiveInteger(Number.POSITIVE_INFINITY)).assertFalse();
      // A NaN index is rejected by the index guard without throwing.
      expect(ValidateUtils.isValidIndex(Number.NaN, 5)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_1900
     * @tc.name      testJsonValidate0019
     * @tc.desc      Verify isMediaUri accepts the picker granted media scheme, the
     *               datashare scheme and sandbox file uris with an extension, and
     *               rejects foreign schemes and extensionless sandbox paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonValidate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The picker granted media uri is accepted directly.
      expect(ValidateUtils.isMediaUri('file://media/photo/1.jpg')).assertTrue();
      // The datashare uri is accepted as a share form.
      expect(ValidateUtils.isMediaUri('datashare://media/album/12')).assertTrue();
      // A sandbox file uri with a jpg extension is accepted.
      expect(ValidateUtils.isMediaUri('file://data/storage/el2/base/files/export.jpg')).assertTrue();
      // A foreign scheme is rejected.
      expect(ValidateUtils.isMediaUri('http://media/photo/1.jpg')).assertFalse();
      // A sandbox path without an extension is rejected.
      expect(ValidateUtils.isMediaUri('file://data/files/noextension')).assertFalse();
      // The media prefix without the trailing slash falls to the sandbox branch and is rejected.
      expect(ValidateUtils.isMediaUri('file://media')).assertFalse();
      // Missing input is rejected without throwing.
      expect(ValidateUtils.isMediaUri(undefined)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONVALID_2000
     * @tc.name      testJsonValidate0020
     * @tc.desc      Verify isMediaUri enforces the file name extension boundaries:
     *               upper case and five digit extensions pass, six digit
     *               extensions, a trailing dot, a leading dot file name and empty
     *               input fail.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonValidate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // An upper case extension passes the case insensitive tail.
      expect(ValidateUtils.isMediaUri('file://docs/IMG_0001.JPG')).assertTrue();
      // A five character extension is the longest accepted one.
      expect(ValidateUtils.isMediaUri('file://docs/IMG_0001.12345')).assertTrue();
      // A six character extension exceeds the accepted length.
      expect(ValidateUtils.isMediaUri('file://docs/IMG_0001.123456')).assertFalse();
      // A trailing dot without extension text is rejected.
      expect(ValidateUtils.isMediaUri('file://docs/IMG_0001.')).assertFalse();
      // A file name starting with the dot has no visible name part and is rejected.
      expect(ValidateUtils.isMediaUri('file://docs/.jpg')).assertFalse();
      // An empty text is rejected without throwing.
      expect(ValidateUtils.isMediaUri('')).assertFalse();
    });
  });
}
