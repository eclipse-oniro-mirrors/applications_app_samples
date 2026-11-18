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
import { JsonUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Placeholder returned by the json helpers when the input cannot be processed. */
const INVALID_JSON_TEXT: string = '[invalid json]';

/**
 * Registers the matrix cases of the JsonUtils helpers. The serializer, the
 * validator, the pretty printer and the minifier are driven through the
 * accepted and the rejected input classes that logging call sites produce.
 * All methods under test are pure static helpers, so no ability context is
 * required.
 */
export default function jsonUtilsMatrixTest() {
  describe('JsonUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0100
     * @tc.name      testJsonMatrix0001
     * @tc.desc      Verify stringifySafe quotes plain texts including the
     *               empty string, non ascii characters and inner blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plain text is wrapped in json quotes.
      expect(JsonUtils.stringifySafe('hello')).assertEqual('"hello"');
      // The empty string becomes the quoted empty json string.
      expect(JsonUtils.stringifySafe('')).assertEqual('""');
      // Non ascii characters pass through without mangling.
      expect(JsonUtils.stringifySafe('中文')).assertEqual('"中文"');
      // Inner blanks are part of the value and survive.
      expect(JsonUtils.stringifySafe('a b c')).assertEqual('"a b c"');
      // A single character is quoted as well.
      expect(JsonUtils.stringifySafe('x')).assertEqual('"x"');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0200
     * @tc.name      testJsonMatrix0002
     * @tc.desc      Verify stringifySafe escapes quotes, tabs, newlines and
     *               backslashes through the platform serializer.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An embedded double quote is escaped by the serializer.
      expect(JsonUtils.stringifySafe('a"b')).assertEqual('"a\\"b"');
      // A tab character is rendered as the \\t escape sequence.
      expect(JsonUtils.stringifySafe('tab\tend')).assertEqual('"tab\\tend"');
      // A newline character is rendered as the \\n escape sequence.
      expect(JsonUtils.stringifySafe('nl\nend')).assertEqual('"nl\\nend"');
      // A backslash is doubled by the serializer.
      expect(JsonUtils.stringifySafe('a\\b')).assertEqual('"a\\\\b"');
      // A mixed escape text keeps every sequence in order.
      expect(JsonUtils.stringifySafe('q"t\\n')).assertEqual('"q\\"t\\\\n"');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0300
     * @tc.name      testJsonMatrix0003
     * @tc.desc      Verify stringifySafe serializes string lists into json
     *               arrays including the empty list and non ascii entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty list becomes an empty json array.
      expect(JsonUtils.stringifySafe([])).assertEqual('[]');
      // Two entries are separated by a comma.
      expect(JsonUtils.stringifySafe(['a', 'b'])).assertEqual('["a","b"]');
      // A list with one empty entry keeps the empty quoted string.
      expect(JsonUtils.stringifySafe([''])).assertEqual('[""]');
      // Non ascii entries pass through without mangling.
      expect(JsonUtils.stringifySafe(['中文'])).assertEqual('["中文"]');
      // Inner blanks and single quotes survive inside the entries.
      expect(JsonUtils.stringifySafe(['x y', "p'q"])).assertEqual('["x y","p\'q"]');
      // A three entry list keeps the order of the input.
      expect(JsonUtils.stringifySafe(['a', 'b', 'c'])).assertEqual('["a","b","c"]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0400
     * @tc.name      testJsonMatrix0004
     * @tc.desc      Verify stringifySafe degrades undefined and null to the
     *               json null literal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing value is rendered as the json null literal.
      expect(JsonUtils.stringifySafe(undefined)).assertEqual('null');
      // An explicit null is rendered as the same literal.
      expect(JsonUtils.stringifySafe(null)).assertEqual('null');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0500
     * @tc.name      testJsonMatrix0005
     * @tc.desc      Verify stringifySafe escapes quotes and tabs inside the
     *               entries of a string list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both entries escape their special characters independently.
      expect(JsonUtils.stringifySafe(['a"b', 'c\td'])).assertEqual('["a\\"b","c\\td"]');
      // A backslash entry is doubled inside the array.
      expect(JsonUtils.stringifySafe(['a\\b'])).assertEqual('["a\\\\b"]');
      // A newline entry is rendered as the \\n escape sequence.
      expect(JsonUtils.stringifySafe(['nl\nend'])).assertEqual('["nl\\nend"]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0600
     * @tc.name      testJsonMatrix0006
     * @tc.desc      Verify isValidJson accepts real object documents produced
     *               by logging call sites including blanks and unicode keys.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A flat object with two entries is valid json.
      expect(JsonUtils.isValidJson('{"album":"camera","count":3}')).assertTrue();
      // An empty object is valid json.
      expect(JsonUtils.isValidJson('{}')).assertTrue();
      // A nested object with an array entry is valid json.
      expect(JsonUtils.isValidJson('{"a":{"b":[1,2]}}')).assertTrue();
      // Blanks between tokens do not change the validity.
      expect(JsonUtils.isValidJson('{ "a" : 1 }')).assertTrue();
      // Unicode keys and values are valid json.
      expect(JsonUtils.isValidJson('{"中文":"值"}')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0700
     * @tc.name      testJsonMatrix0007
     * @tc.desc      Verify isValidJson accepts arrays, string literals and
     *               every scalar json value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A number array is valid json.
      expect(JsonUtils.isValidJson('[1,2,3]')).assertTrue();
      // An empty array is valid json.
      expect(JsonUtils.isValidJson('[]')).assertTrue();
      // A quoted string literal is valid json on its own.
      expect(JsonUtils.isValidJson('"quoted"')).assertTrue();
      // A bare number is valid json.
      expect(JsonUtils.isValidJson('42')).assertTrue();
      // A bare true literal is valid json.
      expect(JsonUtils.isValidJson('true')).assertTrue();
      // A bare false literal is valid json.
      expect(JsonUtils.isValidJson('false')).assertTrue();
      // A bare null literal is valid json.
      expect(JsonUtils.isValidJson('null')).assertTrue();
      // A negative fraction is valid json.
      expect(JsonUtils.isValidJson('-1.5')).assertTrue();
      // The exponent form is accepted by the platform parser.
      expect(JsonUtils.isValidJson('1e5')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0800
     * @tc.name      testJsonMatrix0008
     * @tc.desc      Verify isValidJson rejects malformed documents, blank
     *               input and missing input without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
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
      // An unquoted key is an illegal token.
      expect(JsonUtils.isValidJson('{a:1}')).assertFalse();
      // A trailing comma inside an array is rejected.
      expect(JsonUtils.isValidJson('[1,2,]')).assertFalse();
      // The NaN token is not valid json.
      expect(JsonUtils.isValidJson('NaN')).assertFalse();
      // The Infinity token is not valid json.
      expect(JsonUtils.isValidJson('Infinity')).assertFalse();
      // Single quotes do not form json strings.
      expect(JsonUtils.isValidJson("'single'")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_0900
     * @tc.name      testJsonMatrix0009
     * @tc.desc      Verify isValidJson rejects every malformed number form
     *               that the json grammar forbids.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Leading zeros are forbidden by the json grammar.
      expect(JsonUtils.isValidJson('00')).assertFalse();
      // A leading plus sign is forbidden.
      expect(JsonUtils.isValidJson('+1')).assertFalse();
      // A number without fraction digits is forbidden.
      expect(JsonUtils.isValidJson('1.')).assertFalse();
      // A fraction without integer digits is forbidden.
      expect(JsonUtils.isValidJson('.5')).assertFalse();
      // The hexadecimal form is forbidden.
      expect(JsonUtils.isValidJson('0x10')).assertFalse();
      // An exponent without digits is forbidden.
      expect(JsonUtils.isValidJson('1e')).assertFalse();
      // The undefined token is not valid json.
      expect(JsonUtils.isValidJson('undefined')).assertFalse();
      // An unclosed string literal is rejected.
      expect(JsonUtils.isValidJson('"unclosed')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1000
     * @tc.name      testJsonMatrix0010
     * @tc.desc      Verify prettyPrint re-indents a flat object with two
     *               spaces per level and trims surrounding blanks first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A flat object is re-indented with one entry per line.
      expect(JsonUtils.prettyPrint('{"a":1,"b":2}')).assertEqual('{\n  "a": 1,\n  "b": 2\n}');
      // Surrounding blanks are trimmed before formatting.
      expect(JsonUtils.prettyPrint('  {"a":1}  ')).assertEqual('{\n  "a": 1\n}');
      // Blanks between the tokens are normalized away.
      expect(JsonUtils.prettyPrint('{ "a" : 1 , "b" : 2 }')).assertEqual('{\n  "a": 1,\n  "b": 2\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1100
     * @tc.name      testJsonMatrix0011
     * @tc.desc      Verify prettyPrint nests embedded objects one level
     *               deeper for two and three hierarchy levels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two level object nests the inner object one level deeper.
      expect(JsonUtils.prettyPrint('{"a":{"b":1}}')).assertEqual('{\n  "a": {\n    "b": 1\n  }\n}');
      // A three level object nests every level two spaces deeper.
      expect(JsonUtils.prettyPrint('{"a":{"b":{"c":1}}}'))
        .assertEqual('{\n  "a": {\n    "b": {\n      "c": 1\n    }\n  }\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1200
     * @tc.name      testJsonMatrix0012
     * @tc.desc      Verify prettyPrint re-indents arrays and keeps empty
     *               containers on one line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A flat array is re-indented with one entry per line.
      expect(JsonUtils.prettyPrint('[1,2,3]')).assertEqual('[\n  1,\n  2,\n  3\n]');
      // Nested arrays indent every level two spaces deeper.
      expect(JsonUtils.prettyPrint('[[1,2],[3]]'))
        .assertEqual('[\n  [\n    1,\n    2\n  ],\n  [\n    3\n  ]\n]');
      // An empty array stays on one line.
      expect(JsonUtils.prettyPrint('[]')).assertEqual('[]');
      // An empty object stays on one line.
      expect(JsonUtils.prettyPrint('{}')).assertEqual('{}');
      // A padded empty object is normalized to the compact form.
      expect(JsonUtils.prettyPrint(' { } ')).assertEqual('{}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1300
     * @tc.name      testJsonMatrix0013
     * @tc.desc      Verify prettyPrint re-indents mixed documents where
     *               objects and arrays are nested into each other.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An array of two objects renders each object on its own lines.
      expect(JsonUtils.prettyPrint('[{"a":1},{"b":2}]'))
        .assertEqual('[\n  {\n    "a": 1\n  },\n  {\n    "b": 2\n  }\n]');
      // An object entry with an array that contains an object nests three levels.
      expect(JsonUtils.prettyPrint('{"a":[1,{"b":2}]}'))
        .assertEqual('{\n  "a": [\n    1,\n    {\n      "b": 2\n    }\n  ]\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1400
     * @tc.name      testJsonMatrix0014
     * @tc.desc      Verify prettyPrint hands scalar values and blank padded
     *               scalars back unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A bare number scalar is handed back unchanged.
      expect(JsonUtils.prettyPrint('42')).assertEqual('42');
      // A string literal scalar is handed back unchanged.
      expect(JsonUtils.prettyPrint('"ok"')).assertEqual('"ok"');
      // A true literal scalar is handed back unchanged.
      expect(JsonUtils.prettyPrint('true')).assertEqual('true');
      // A null literal scalar is handed back unchanged.
      expect(JsonUtils.prettyPrint('null')).assertEqual('null');
      // A negative fraction scalar is handed back unchanged.
      expect(JsonUtils.prettyPrint('-2.5')).assertEqual('-2.5');
      // Surrounding blanks of a scalar are trimmed away.
      expect(JsonUtils.prettyPrint('  "s"  ')).assertEqual('"s"');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1500
     * @tc.name      testJsonMatrix0015
     * @tc.desc      Verify prettyPrint degrades missing, empty and malformed
     *               input to the invalid json placeholder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty text cannot be formatted and degrades to the placeholder.
      expect(JsonUtils.prettyPrint('')).assertEqual(INVALID_JSON_TEXT);
      // Missing input degrades to the same placeholder.
      expect(JsonUtils.prettyPrint(undefined)).assertEqual(INVALID_JSON_TEXT);
      // Explicit null degrades to the same placeholder.
      expect(JsonUtils.prettyPrint(null)).assertEqual(INVALID_JSON_TEXT);
      // A text that is not json degrades to the placeholder without throwing.
      expect(JsonUtils.prettyPrint('{bad}')).assertEqual(INVALID_JSON_TEXT);
      // A truncated object degrades to the placeholder as well.
      expect(JsonUtils.prettyPrint('{"a":')).assertEqual(INVALID_JSON_TEXT);
      // A trailing comma degrades to the placeholder.
      expect(JsonUtils.prettyPrint('[1,2,]')).assertEqual(INVALID_JSON_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1600
     * @tc.name      testJsonMatrix0016
     * @tc.desc      Verify prettyPrint honours the optional indent parameter
     *               for objects, nested objects and arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two space indent shifts the entries and the closing brace.
      expect(JsonUtils.prettyPrint('{"a":1}', '  ')).assertEqual('{\n    "a": 1\n  }');
      // The nested object inherits the shifted levels.
      expect(JsonUtils.prettyPrint('{"a":{"b":1}}', '  '))
        .assertEqual('{\n    "a": {\n      "b": 1\n    }\n  }');
      // A one space indent shifts every line by three spaces inside.
      expect(JsonUtils.prettyPrint('[1,2]', ' ')).assertEqual('[\n   1,\n   2\n ]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1700
     * @tc.name      testJsonMatrix0017
     * @tc.desc      Verify prettyPrint splits entries at the first top level
     *               colon only and keeps colons inside strings intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Colons inside the url value do not split the entry.
      expect(JsonUtils.prettyPrint('{"url":"http://x:8080/p"}'))
        .assertEqual('{\n  "url": "http://x:8080/p"\n}');
      // A colon inside the key does not split the entry either.
      expect(JsonUtils.prettyPrint('{"a:b":1}')).assertEqual('{\n  "a:b": 1\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1800
     * @tc.name      testJsonMatrix0018
     * @tc.desc      Verify prettyPrint keeps commas inside string values
     *             intact for object entries and array elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A comma inside the value does not split the object entry.
      expect(JsonUtils.prettyPrint('{"t":"a,b"}')).assertEqual('{\n  "t": "a,b"\n}');
      // A comma inside an array element does not split the array entry.
      expect(JsonUtils.prettyPrint('["x,y","z"]')).assertEqual('[\n  "x,y",\n  "z"\n]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_1900
     * @tc.name      testJsonMatrix0019
     * @tc.desc      Verify minify collapses blanks around object tokens and
     *               keeps blanks inside string values intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A padded object collapses to the compact form.
      expect(JsonUtils.minify('{ "a" : 1 }')).assertEqual('{"a":1}');
      // Newlines between the entries collapse as well.
      expect(JsonUtils.minify('{\n"a":1,\n"b":2\n}')).assertEqual('{"a":1,"b":2}');
      // Blanks inside the string value survive the walk.
      expect(JsonUtils.minify('{ "s" : "x y" }')).assertEqual('{"s":"x y"}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2000
     * @tc.name      testJsonMatrix0020
     * @tc.desc      Verify minify collapses arrays and passes scalar texts
     *               through unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testJsonMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testJsonMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A padded array collapses to the compact form.
      expect(JsonUtils.minify('[ 1 , 2 ]')).assertEqual('[1,2]');
      // Surrounding blanks of an array are dropped as well.
      expect(JsonUtils.minify('  [ 1 , 2 ]  ')).assertEqual('[1,2]');
      // A string scalar keeps its inner blanks.
      expect(JsonUtils.minify('"a b  c"')).assertEqual('"a b  c"');
      // The true literal passes through unchanged.
      expect(JsonUtils.minify('true')).assertEqual('true');
      // The null literal passes through unchanged.
      expect(JsonUtils.minify('null')).assertEqual('null');
      // A number scalar passes through unchanged.
      expect(JsonUtils.minify('123')).assertEqual('123');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2100
     * @tc.name      testJsonMatrix0021
     * @tc.desc      Verify minify keeps escape sequences inside string
     *               literals untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tab escape inside a string survives the walk.
      expect(JsonUtils.minify('"a\\tb"')).assertEqual('"a\\tb"');
      // An escaped quote inside a string survives the walk.
      expect(JsonUtils.minify('"a\\"b"')).assertEqual('"a\\"b"');
      // An escaped tab and an inner blank inside an object value survive.
      expect(JsonUtils.minify('{ "e" : "a\\tb c" }')).assertEqual('{"e":"a\\tb c"}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2200
     * @tc.name      testJsonMatrix0022
     * @tc.desc      Verify minify degrades missing and malformed input to
     *               the invalid json placeholder instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty text is not json and degrades to the placeholder.
      expect(JsonUtils.minify('')).assertEqual(INVALID_JSON_TEXT);
      // Missing input degrades to the same placeholder.
      expect(JsonUtils.minify(undefined)).assertEqual(INVALID_JSON_TEXT);
      // Explicit null degrades to the same placeholder.
      expect(JsonUtils.minify(null)).assertEqual(INVALID_JSON_TEXT);
      // A truncated object degrades to the placeholder without throwing.
      expect(JsonUtils.minify('{"a":')).assertEqual(INVALID_JSON_TEXT);
      // A bare word is not json and degrades to the placeholder.
      expect(JsonUtils.minify('nope')).assertEqual(INVALID_JSON_TEXT);
      // A double dotted number is rejected by the parser first.
      expect(JsonUtils.minify('12.3.4')).assertEqual(INVALID_JSON_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2300
     * @tc.name      testJsonMatrix0023
     * @tc.desc      Verify minify collapses nested containers and padded
     *               empty containers to the compact form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A nested object with a padded array collapses completely.
      expect(JsonUtils.minify('{ "a" : { "b" : [ 1 , 2 ] } }')).assertEqual('{"a":{"b":[1,2]}}');
      // A padded empty object collapses to the compact form.
      expect(JsonUtils.minify('  {  }  ')).assertEqual('{}');
      // A padded empty array collapses to the compact form.
      expect(JsonUtils.minify('  [ ]  ')).assertEqual('[]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2400
     * @tc.name      testJsonMatrix0024
     * @tc.desc      Verify prettyPrint re-indents a realistic album snapshot
     *               with a nested array of photo objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The snapshot combines a flat entry, an array of objects and a tail entry.
      const compact: string = '{"album":"camera","photos":[{"name":"a.jpg","size":1},'
        + '{"name":"b.jpg","size":2}],"total":2}';
      // Every container opens on its own line and closes at the parent level.
      const expected: string = '{\n'
        + '  "album": "camera",\n'
        + '  "photos": [\n'
        + '    {\n'
        + '      "name": "a.jpg",\n'
        + '      "size": 1\n'
        + '    },\n'
        + '    {\n'
        + '      "name": "b.jpg",\n'
        + '      "size": 2\n'
        + '    }\n'
        + '  ],\n'
        + '  "total": 2\n'
        + '}';
      expect(JsonUtils.prettyPrint(compact)).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2500
     * @tc.name      testJsonMatrix0025
     * @tc.desc      Verify minify restores the compact original from the
     *               pretty printed output of compact json texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The album snapshot round trips back to its compact original.
      const compact: string = '{"album":"camera","photos":[{"name":"a.jpg","size":1},'
        + '{"name":"b.jpg","size":2}],"total":2}';
      expect(JsonUtils.minify(JsonUtils.prettyPrint(compact))).assertEqual(compact);
      // A short array round trips back to its compact original as well.
      expect(JsonUtils.minify(JsonUtils.prettyPrint('[1,2]'))).assertEqual('[1,2]');
      // A flat object round trips back to its compact original.
      expect(JsonUtils.minify(JsonUtils.prettyPrint('{"a":1,"b":2}'))).assertEqual('{"a":1,"b":2}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2600
     * @tc.name      testJsonMatrix0026
     * @tc.desc      Verify the helpers pass non ascii keys and values through
     *               unchanged and still classify the texts as valid json.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A padded object with unicode keys and values collapses.
      expect(JsonUtils.minify('{ "中文" : "值" }')).assertEqual('{"中文":"值"}');
      // A padded array with unicode entries collapses.
      expect(JsonUtils.minify('["中文","值"]')).assertEqual('["中文","值"]');
      // A unicode object is valid json for the platform parser.
      expect(JsonUtils.isValidJson('{"中文":"值"}')).assertTrue();
      // The serializer quotes the unicode text without mangling it.
      expect(JsonUtils.stringifySafe('中文')).assertEqual('"中文"');
      // The pretty printer keeps the unicode text as a scalar.
      expect(JsonUtils.prettyPrint('"中文 值"')).assertEqual('"中文 值"');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONMAT_2700
     * @tc.name      testJsonMatrix0027
     * @tc.desc      Verify prettyPrint keeps boolean, null and fractional
     *               number scalars unchanged in objects and arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonMatrix0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A flat object of scalar types re-indents one entry per line.
      expect(JsonUtils.prettyPrint('{"on":true,"off":false,"none":null,"ratio":0.5}'))
        .assertEqual('{\n  "on": true,\n  "off": false,\n  "none": null,\n  "ratio": 0.5\n}');
      // A mixed scalar array re-indents one entry per line.
      expect(JsonUtils.prettyPrint('[true,null,0.5]')).assertEqual('[\n  true,\n  null,\n  0.5\n]');
      // A negative fraction keeps its sign.
      expect(JsonUtils.prettyPrint('[-1.5,2.25]')).assertEqual('[\n  -1.5,\n  2.25\n]');
      // The minified scalar mix stays compact and valid.
      expect(JsonUtils.minify('{ "on" : true , "ratio" : 0.5 }')).assertEqual('{"on":true,"ratio":0.5}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
