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
/** Length of the long text inputs built by the edge cases. */
const LONG_TEXT: number = 500;
/** Entry count of the long list inputs built by the edge cases. */
const LONG_LIST: number = 40;
/** Key count of the long object inputs built by the edge cases. */
const LONG_OBJECT: number = 60;

/**
 * Registers the edge and extreme input cases of the JsonUtils helpers. The
 * cases probe long texts, long lists, deep nesting, escape sequences and
 * whitespace floods. All methods under test are pure static helpers, so no
 * ability context is required.
 */
export default function jsonUtilsEdgeTest() {
  describe('JsonUtilsEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0100
     * @tc.name      testJsonEdge0001
     * @tc.desc      Verify stringifySafe quotes a very long text without
     *               truncation and keeps every chunk intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a long text out of repeated chunks.
      let text: string = 'chunk';
      let index: number = 0;
      while (index < LONG_TEXT) {
        text = text + 'chunk';
        index = index + 1;
      }
      // The serializer wraps the whole text without dropping a chunk.
      expect(JsonUtils.stringifySafe(text)).assertEqual('"' + text + '"');
      // The quoted result is exactly two characters longer than the input.
      expect(JsonUtils.stringifySafe(text).length).assertEqual(text.length + 2);
      // A shorter repeated text behaves the same way.
      expect(JsonUtils.stringifySafe('abab')).assertEqual('"abab"');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0200
     * @tc.name      testJsonEdge0002
     * @tc.desc      Verify stringifySafe serializes a long list of generated
     *               entries into the exact json array text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a long list of generated entries.
      const items: string[] = [];
      for (let index: number = 0; index < LONG_LIST; index++) {
        items.push('item' + String(index));
      }
      // Build the expected array text entry by entry.
      let expected: string = '[';
      for (let index: number = 0; index < LONG_LIST; index++) {
        if (index > 0) {
          expected = expected + ',';
        }
        expected = expected + '"item' + String(index) + '"';
      }
      expected = expected + ']';
      // The serializer renders every generated entry.
      expect(JsonUtils.stringifySafe(items)).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0300
     * @tc.name      testJsonEdge0003
     * @tc.desc      Verify stringifySafe escapes the backspace, form feed and
     *               carriage return control characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The backspace control character becomes the \\b escape.
      expect(JsonUtils.stringifySafe('a\bb')).assertEqual('"a\\bb"');
      // The form feed control character becomes the \\f escape.
      expect(JsonUtils.stringifySafe('a\fb')).assertEqual('"a\\fb"');
      // The carriage return control character becomes the \\r escape.
      expect(JsonUtils.stringifySafe('a\rb')).assertEqual('"a\\rb"');
      // A combined control character run is fully escaped.
      expect(JsonUtils.stringifySafe('\r\n\t')).assertEqual('"\\r\\n\\t"');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0400
     * @tc.name      testJsonEdge0004
     * @tc.desc      Verify stringifySafe passes currency symbols and mixed
     *               non ascii texts through without mangling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testJsonEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Currency symbols survive the quoting.
      expect(JsonUtils.stringifySafe('¥€£')).assertEqual('"¥€£"');
      // A mixed text with ascii and non ascii parts survives as well.
      expect(JsonUtils.stringifySafe('中文 mixed text')).assertEqual('"中文 mixed text"');
      // A list of unicode entries keeps every entry intact.
      expect(JsonUtils.stringifySafe(['中文', '値', '值'])).assertEqual('["中文","値","值"]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0500
     * @tc.name      testJsonEdge0005
     * @tc.desc      Verify isValidJson accepts whitespace flooded json and
     *               rejects a blank only text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Wide blanks around every token are still valid json.
      expect(JsonUtils.isValidJson('  {  "a"  :  1  }  ')).assertTrue();
      // Newlines and tabs around the container are valid json as well.
      expect(JsonUtils.isValidJson('\n\t{\n"a":1\n}\r\n')).assertTrue();
      // A single space is not json at all.
      expect(JsonUtils.isValidJson(' ')).assertFalse();
      // A blank run of tabs and newlines is not json either.
      expect(JsonUtils.isValidJson('\t\n\r ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0600
     * @tc.name      testJsonEdge0006
     * @tc.desc      Verify isValidJson accepts a long generated object and
     *               that minify of the compact text stays identical.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a long object with generated keys and number values.
      let longJson: string = '{';
      for (let index: number = 0; index < LONG_OBJECT; index++) {
        if (index > 0) {
          longJson = longJson + ',';
        }
        longJson = longJson + '"k' + String(index) + '":' + String(index);
      }
      longJson = longJson + '}';
      // The platform parser accepts the long object.
      expect(JsonUtils.isValidJson(longJson)).assertTrue();
      // The compact text contains no insignificant blanks so minify is a no-op.
      expect(JsonUtils.minify(longJson)).assertEqual(longJson);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0700
     * @tc.name      testJsonEdge0007
     * @tc.desc      Verify isValidJson accepts deeply nested arrays and
     *               objects and rejects a deeply truncated prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Eight nested array levels are valid json.
      expect(JsonUtils.isValidJson('[[[[[[[[1]]]]]]]]')).assertTrue();
      // Three nested object levels are valid json as well.
      expect(JsonUtils.isValidJson('{"a":{"a":{"a":1}}}')).assertTrue();
      // A truncated nested prefix is rejected.
      expect(JsonUtils.isValidJson('[[[[')).assertFalse();
      // A truncated nested object is rejected too.
      expect(JsonUtils.isValidJson('{"a":{"a":')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0800
     * @tc.name      testJsonEdge0008
     * @tc.desc      Verify isValidJson accepts every exponent and signed zero
     *               form that the platform parser supports.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A positive exponent is valid json.
      expect(JsonUtils.isValidJson('1e+5')).assertTrue();
      // A negative exponent is valid json.
      expect(JsonUtils.isValidJson('1e-5')).assertTrue();
      // A negative zero is valid json.
      expect(JsonUtils.isValidJson('-0')).assertTrue();
      // An upper case exponent marker is valid json.
      expect(JsonUtils.isValidJson('1E5')).assertTrue();
      // A fractional mantissa with an exponent is valid json.
      expect(JsonUtils.isValidJson('1.5e3')).assertTrue();
      // A negative fractional mantissa with a negative exponent is valid json.
      expect(JsonUtils.isValidJson('-1.5e-3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_0900
     * @tc.name      testJsonEdge0009
     * @tc.desc      Verify isValidJson accepts legal string escape sequences
     *               and rejects illegal ones instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testJsonEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A unicode escape sequence is valid json.
      expect(JsonUtils.isValidJson('"a\\u0041b"')).assertTrue();
      // A forward slash escape is valid json.
      expect(JsonUtils.isValidJson('"a\\/b"')).assertTrue();
      // An escaped quote is valid json.
      expect(JsonUtils.isValidJson('"a\\"b"')).assertTrue();
      // A newline escape is valid json.
      expect(JsonUtils.isValidJson('"a\\n b"')).assertTrue();
      // An unknown escape letter is rejected.
      expect(JsonUtils.isValidJson('"a\\q"')).assertFalse();
      // A malformed unicode escape is rejected.
      expect(JsonUtils.isValidJson('"\\uZZZZ"')).assertFalse();
      // An unterminated string is rejected.
      expect(JsonUtils.isValidJson('"unclosed')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1000
     * @tc.name      testJsonEdge0010
     * @tc.desc      Verify prettyPrint re-indents a three level nested array
     *               with one indentation step per level.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every nesting level adds one two space indentation step.
      expect(JsonUtils.prettyPrint('[[[1]]]')).assertEqual('[\n  [\n    [\n      1\n    ]\n  ]\n]');
      // A two level object inside an array keeps the same step size.
      expect(JsonUtils.prettyPrint('[{"a":{"b":1}}]'))
        .assertEqual('[\n  {\n    "a": {\n      "b": 1\n    }\n  }\n]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1100
     * @tc.name      testJsonEdge0011
     * @tc.desc      Verify prettyPrint re-indents a long generated flat array
     *               into one entry per line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a compact array with ten entries.
      let compact: string = '[';
      let indented: string = '[\n  ';
      for (let index: number = 1; index <= 10; index++) {
        if (index > 1) {
          compact = compact + ',';
          indented = indented + ',\n  ';
        }
        compact = compact + String(index);
        indented = indented + String(index);
      }
      compact = compact + ']';
      indented = indented + '\n]';
      // The pretty printer moves every entry onto its own line.
      expect(JsonUtils.prettyPrint(compact)).assertEqual(indented);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1200
     * @tc.name      testJsonEdge0012
     * @tc.desc      Verify prettyPrint nests an array value one level deeper
     *               than its object entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The array value opens on its own line and closes at the entry level.
      expect(JsonUtils.prettyPrint('{"names":["alice","bob"]}'))
        .assertEqual('{\n  "names": [\n    "alice",\n    "bob"\n  ]\n}');
      // A nested object value follows the same depth rule.
      expect(JsonUtils.prettyPrint('{"meta":{"count":2,"tags":["x"]}}'))
        .assertEqual('{\n  "meta": {\n    "count": 2,\n    "tags": [\n      "x"\n    ]\n  }\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1300
     * @tc.name      testJsonEdge0013
     * @tc.desc      Verify prettyPrint collapses padded empty containers to
     *               the one line compact form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A padded empty object collapses to the compact form.
      expect(JsonUtils.prettyPrint(' { } ')).assertEqual('{}');
      // A padded empty array collapses to the compact form.
      expect(JsonUtils.prettyPrint('  []  ')).assertEqual('[]');
      // An empty object value stays on one line inside its parent.
      expect(JsonUtils.prettyPrint('{ "a" : { } }')).assertEqual('{\n  "a": {}\n}');
      // An empty array value stays on one line inside its parent.
      expect(JsonUtils.prettyPrint('{"a":[ ]}')).assertEqual('{\n  "a": []\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1400
     * @tc.name      testJsonEdge0014
     * @tc.desc      Verify prettyPrint keeps boolean, null and fractional
     *               scalar entries unchanged while re-indenting.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A scalar array of literals re-indents one entry per line.
      expect(JsonUtils.prettyPrint('[true,false,null]')).assertEqual('[\n  true,\n  false,\n  null\n]');
      // Negative fractions keep their sign and fraction part.
      expect(JsonUtils.prettyPrint('[-1.5,2.25]')).assertEqual('[\n  -1.5,\n  2.25\n]');
      // An object mixing booleans and nulls keeps every scalar unchanged.
      expect(JsonUtils.prettyPrint('{"on":true,"none":null}'))
        .assertEqual('{\n  "on": true,\n  "none": null\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1500
     * @tc.name      testJsonEdge0015
     * @tc.desc      Verify prettyPrint keeps duplicated object keys in the
     *               input order because the parser never deduplicates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testJsonEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The duplicated key appears twice in the output.
      expect(JsonUtils.prettyPrint('{"a":1,"a":2}')).assertEqual('{\n  "a": 1,\n  "a": 2\n}');
      // The input order of the duplicated keys is preserved.
      expect(JsonUtils.prettyPrint('{"b":1,"a":2,"b":3}'))
        .assertEqual('{\n  "b": 1,\n  "a": 2,\n  "b": 3\n}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1600
     * @tc.name      testJsonEdge0016
     * @tc.desc      Verify minify keeps escape sequences inside string values
     *               and drops only the insignificant blanks around them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A newline escape inside a compact text is already minimal.
      expect(JsonUtils.minify('{"a":"line1\\nline2"}')).assertEqual('{"a":"line1\\nline2"}');
      // An escape sequence with an inner blank survives a padded object.
      expect(JsonUtils.minify('{ "a" : "line1\\nline2" }')).assertEqual('{"a":"line1\\nline2"}');
      // Two escaped values in one object both survive.
      expect(JsonUtils.minify('{"a":"x\\ty","b":"u\\tv"}')).assertEqual('{"a":"x\\ty","b":"u\\tv"}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1700
     * @tc.name      testJsonEdge0017
     * @tc.desc      Verify minify removes a flood of insignificant blanks and
     *               keeps a blank run inside a string literal intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A wide blank flood around every token collapses.
      expect(JsonUtils.minify('{     "a"     :     1     }')).assertEqual('{"a":1}');
      // A blank run inside a string literal is part of the value.
      expect(JsonUtils.minify('"        "')).assertEqual('"        "');
      // A blank run inside an object string value survives as well.
      expect(JsonUtils.minify('{ "s" : "a     b" }')).assertEqual('{"s":"a     b"}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1800
     * @tc.name      testJsonEdge0018
     * @tc.desc      Verify that minify of a pretty printed compact text
     *               restores the original compact form for mixed containers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A mixed object round trips back to its compact original.
      const mixed: string = '{"a":1,"b":[true,null]}';
      expect(JsonUtils.minify(JsonUtils.prettyPrint(mixed))).assertEqual(mixed);
      // A nested array round trips back to its compact original.
      const nested: string = '{"a":{"b":[1,2]}}';
      expect(JsonUtils.minify(JsonUtils.prettyPrint(nested))).assertEqual(nested);
      // A scalar round trips back to itself through both helpers.
      expect(JsonUtils.minify(JsonUtils.prettyPrint('true'))).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_1900
     * @tc.name      testJsonEdge0019
     * @tc.desc      Verify prettyPrint hands scalar texts back unchanged and
     *               trims only the surrounding insignificant blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testJsonEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A string scalar with an inner blank keeps the blank.
      expect(JsonUtils.prettyPrint('"a b"')).assertEqual('"a b"');
      // A padded boolean scalar is trimmed back to the literal.
      expect(JsonUtils.prettyPrint('  true  ')).assertEqual('true');
      // A padded unicode string keeps the inner blanks after trimming.
      expect(JsonUtils.prettyPrint('  " 中文 "  ')).assertEqual('" 中文 "');
      // A negative zero scalar passes through unchanged.
      expect(JsonUtils.prettyPrint('-0')).assertEqual('-0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2000
     * @tc.name      testJsonEdge0020
     * @tc.desc      Verify stringifySafe keeps blanks, commas and quotes
     *               inside list entries safely escaped.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A wide inner blank inside an entry survives.
      expect(JsonUtils.stringifySafe(['a  b'])).assertEqual('["a  b"]');
      // A blank only entry is still quoted, not dropped.
      expect(JsonUtils.stringifySafe([' ', 'x'])).assertEqual('[" ","x"]');
      // A comma inside an entry does not split the array.
      expect(JsonUtils.stringifySafe(['a,b'])).assertEqual('["a,b"]');
      // A quote inside an entry is escaped.
      expect(JsonUtils.stringifySafe(['a"b'])).assertEqual('["a\\"b"]');
      // A tab inside an entry is escaped.
      expect(JsonUtils.stringifySafe(['a\tb'])).assertEqual('["a\\tb"]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2100
     * @tc.name      testJsonEdge0021
     * @tc.desc      Verify isValidJson accepts empty and nested empty
     *               containers in every padding variant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty object is valid json.
      expect(JsonUtils.isValidJson('{}')).assertTrue();
      // An empty array is valid json.
      expect(JsonUtils.isValidJson('[]')).assertTrue();
      // A nested empty object is valid json.
      expect(JsonUtils.isValidJson('{"a":{}}')).assertTrue();
      // A pair of nested empty containers is valid json.
      expect(JsonUtils.isValidJson('[[],{}]')).assertTrue();
      // A padded nested empty array is valid json as well.
      expect(JsonUtils.isValidJson('{"a":{ }}')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2200
     * @tc.name      testJsonEdge0022
     * @tc.desc      Verify isValidJson rejects concatenated containers,
     *               trailing garbage and truncated literals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testJsonEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two concatenated objects are not one json value.
      expect(JsonUtils.isValidJson('{"a":1}{"b":2}')).assertFalse();
      // Two concatenated arrays are not one json value.
      expect(JsonUtils.isValidJson('[1][2]')).assertFalse();
      // Trailing garbage after a valid object is rejected.
      expect(JsonUtils.isValidJson('{"a":1}extra')).assertFalse();
      // Two adjacent string literals are rejected.
      expect(JsonUtils.isValidJson('"a""b"')).assertFalse();
      // A truncated true literal is rejected.
      expect(JsonUtils.isValidJson('tru')).assertFalse();
      // A padded true literal with garbage is rejected.
      expect(JsonUtils.isValidJson('truex')).assertFalse();
      // A truncated null literal is rejected.
      expect(JsonUtils.isValidJson('nul')).assertFalse();
      // A doubled comma inside an object is rejected.
      expect(JsonUtils.isValidJson('{"a":1,,"b":2}')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2300
     * @tc.name      testJsonEdge0023
     * @tc.desc      Verify prettyPrint applies the explicit indent parameter
     *               to every level of a nested array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testJsonEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The explicit indent shifts the outer level and every nested level.
      const expected: string = '[\n'
        + '    [\n'
        + '      1,\n'
        + '      2\n'
        + '    ],\n'
        + '    [\n'
        + '      3,\n'
        + '      4\n'
        + '    ]\n'
        + '  ]';
      expect(JsonUtils.prettyPrint('[[1,2],[3,4]]', '  ')).assertEqual(expected);
      // A flat object with the same indent shifts only the inner entries.
      expect(JsonUtils.prettyPrint('{"a":1}', '  ')).assertEqual('{\n    "a": 1\n  }');
      // A one space indent produces a three space inner level.
      expect(JsonUtils.prettyPrint('[1,2]', ' ')).assertEqual('[\n   1,\n   2\n ]');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2400
     * @tc.name      testJsonEdge0024
     * @tc.desc      Verify the helpers handle a programmatically built long
     *               number array for validation, minify and pretty print.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the compact array text with an index based loop.
      let compact: string = '[';
      let index: number = 0;
      while (index < LONG_LIST) {
        if (index > 0) {
          compact = compact + ',';
        }
        compact = compact + String(index);
        index = index + 1;
      }
      compact = compact + ']';
      // The built text is valid json.
      expect(JsonUtils.isValidJson(compact)).assertTrue();
      // Minify of an already compact text returns it unchanged.
      expect(JsonUtils.minify(compact)).assertEqual(compact);
      // Build the expected indented output with the same loop bounds.
      let indented: string = '[\n';
      index = 0;
      while (index < LONG_LIST) {
        if (index > 0) {
          indented = indented + ',\n';
        }
        indented = indented + '  ' + String(index);
        index = index + 1;
      }
      indented = indented + '\n]';
      // The pretty printer re-indents every entry of the long array.
      expect(JsonUtils.prettyPrint(compact)).assertEqual(indented);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2500
     * @tc.name      testJsonEdge0025
     * @tc.desc      Verify stringifySafe serializes a hundred entry list
     *               completely and in the original order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the input list with a hundred entries.
      const items: string[] = [];
      let index: number = 0;
      while (index < 100) {
        items.push('item' + String(index));
        index = index + 1;
      }
      // Build the expected json array with the same entry texts.
      let expected: string = '[';
      index = 0;
      while (index < 100) {
        if (index > 0) {
          expected = expected + ',';
        }
        expected = expected + '"item' + String(index) + '"';
        index = index + 1;
      }
      expected = expected + ']';
      // Every entry is serialized in order without truncation.
      expect(JsonUtils.stringifySafe(items)).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2600
     * @tc.name      testJsonEdge0026
     * @tc.desc      Verify minify collapses a whitespace flooded deep object
     *               and is idempotent on its own compact output.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testJsonEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testJsonEdge0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every blank of the padded deep object collapses away.
      expect(JsonUtils.minify('{ "a" : { "b" : { "c" : [ 1 , 2 ] } } }'))
        .assertEqual('{"a":{"b":{"c":[1,2]}}}');
      // The padded deep object is valid json for the parser.
      expect(JsonUtils.isValidJson('{ "a" : { "b" : { "c" : [ 1 , 2 ] } } }')).assertTrue();
      // Minify of the compact deep object is idempotent.
      expect(JsonUtils.minify('{"a":{"b":{"c":[1,2]}}}')).assertEqual('{"a":{"b":{"c":[1,2]}}}');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_JSONEDGE_2700
     * @tc.name      testJsonEdge0027
     * @tc.desc      Verify prettyPrint keeps escaped tabs and escaped quotes
     *               inside array string entries unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testJsonEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testJsonEdge0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The escaped tab and the escaped quote survive as scalar entries.
      expect(JsonUtils.prettyPrint('["a\\tb","c\\"d"]')).assertEqual('[\n  "a\\tb",\n  "c\\"d"\n]');
      // The escaped backslash itself survives the split walk.
      expect(JsonUtils.prettyPrint('["a\\\\b"]')).assertEqual('[\n  "a\\\\b"\n]');
      // The escaped entries are still valid json for the parser.
      expect(JsonUtils.isValidJson('["a\\tb","c\\"d"]')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
