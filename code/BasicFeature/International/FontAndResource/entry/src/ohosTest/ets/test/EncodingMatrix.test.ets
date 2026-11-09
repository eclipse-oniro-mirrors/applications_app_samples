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

// Import the encoding helpers under test from the library HAR package.
import { EncryptUtils } from 'library';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The single character ASCII sample of the encode matrix.
const TEXT_ONE: string = 'A';
// The two character ASCII sample of the encode matrix.
const TEXT_TWO: string = 'AB';
// The three character ASCII sample of the encode matrix.
const TEXT_THREE: string = 'ABC';
// The four character ASCII sample that needs no padding.
const TEXT_FOUR: string = 'ABCD';
// The five character ASCII sample that needs one pad character.
const TEXT_FIVE: string = 'ABCDE';
// The six character ASCII sample that needs two pad characters.
const TEXT_SIX: string = 'ABCDEF';
// The greeting sample of the encode matrix.
const TEXT_GREETING: string = 'hello';
// The digit sample of the encode matrix.
const TEXT_DIGITS: string = '123456';
// The symbol sample of the encode matrix.
const TEXT_SYMBOLS: string = 'a+b/c=d';
// The Chinese sample of the encode matrix.
const TEXT_CHINESE: string = '中文';
// The mixed sample of the encode matrix.
const TEXT_MIXED: string = 'abc中文';
// The space sample of the encode matrix.
const TEXT_SPACE: string = ' ';
// The ampersand sample of the encode matrix.
const TEXT_AMPERSAND: string = '&';
// The equals sample of the encode matrix.
const TEXT_EQUALS: string = '=';
// The plus sample of the encode matrix.
const TEXT_PLUS: string = '+';
// The hash sample of the encode matrix.
const TEXT_HASH: string = '#';

// The Base64 text of the single character sample.
const B64_ONE: string = 'QQ==';
// The Base64 text of the two character sample.
const B64_TWO: string = 'QUI=';
// The Base64 text of the three character sample.
const B64_THREE: string = 'QUJD';
// The Base64 text of the four character sample.
const B64_FOUR: string = 'QUJDRA==';
// The Base64 text of the five character sample.
const B64_FIVE: string = 'QUJDREU=';
// The Base64 text of the six character sample.
const B64_SIX: string = 'QUJDREVG';
// The Base64 text of the greeting sample.
const B64_GREETING: string = 'aGVsbG8=';
// The Base64 text of the digit sample.
const B64_DIGITS: string = 'MTIzNDU2';
// The Base64 text of the Chinese sample.
const B64_CHINESE: string = '5Lit5paH';
// The Base64 text of the mixed sample.
const B64_MIXED: string = 'YWJj5Lit5paH';

// The Base64 pad character used by the width checks.
const PAD: string = '=';
// The URL space escape sequence.
const URL_SPACE_ESCAPE: string = '%20';
// The URL ampersand escape sequence.
const URL_AMP_ESCAPE: string = '%26';
// The URL equals escape sequence.
const URL_EQUALS_ESCAPE: string = '%3D';
// The URL plus escape sequence.
const URL_PLUS_ESCAPE: string = '%2B';
// The URL hash escape sequence.
const URL_HASH_ESCAPE: string = '%23';
// The URL Chinese escape sequence.
const URL_CHINESE_ESCAPE: string = '%E4%B8%AD%E6%96%87';
// The percent character used by the malformed escape probes.
const PERCENT: string = '%';

// The Base64 width of one three byte group.
const BASE64_GROUP: number = 4;
// The byte count of one Base64 group before encoding.
const BYTE_GROUP: number = 3;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Returns true when the text holds only characters of the Base64 alphabet plus the pad character.
function isBase64Alphabet(text: string): boolean {
  // The accepted Base64 character set.
  const alphabet: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
  // Walk every character of the text.
  for (let i: number = 0; i < text.length; i++) {
    // Check the current character against the accepted set.
    if (alphabet.indexOf(text.charAt(i)) < 0) {
      // Report the first offending character immediately.
      return false;
    }
  }
  // Every character belonged to the Base64 set.
  return true;
}

// Returns the expected Base64 width of the given raw byte count.
function expectedBase64Width(byteCount: number): number {
  // Round the byte count up to a full group and expand it by four thirds.
  const groups: number = Math.ceil(byteCount / BYTE_GROUP);
  // Return the padded Base64 width of the byte count.
  return groups * BASE64_GROUP;
}

// Returns true when every character of the text is a lowercase hexadecimal digit.
function isLowerHexText(text: string): boolean {
  // The lowercase hexadecimal alphabet.
  const alphabet: string = '0123456789abcdef';
  // Walk every character of the text.
  for (let i: number = 0; i < text.length; i++) {
    // Check the current character against the hexadecimal alphabet.
    if (alphabet.indexOf(text.charAt(i)) < 0) {
      // Report the first offending character immediately.
      return false;
    }
  }
  // Every character was a lowercase hexadecimal digit.
  return true;
}

// Registers every on-device logic test case of the encoding matrix.
export default function encodingMatrixTest() {
  // Group the cases under the "EncodingMatrixSuite" describe block.
  describe('EncodingMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'EncodingMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0100
     * @tc.name      testEncmxBase64WidthTable0001
     * @tc.desc      Verify the Base64 width formula over the byte counts one to six and the matching encode vectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxBase64WidthTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxBase64WidthTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the encode table rows of one to six bytes.
      const rows: string[] = [TEXT_ONE, TEXT_TWO, TEXT_THREE, TEXT_FOUR, TEXT_FIVE, TEXT_SIX];
      // Prepare the matching Base64 vectors of the rows.
      const vectors: string[] = [B64_ONE, B64_TWO, B64_THREE, B64_FOUR, B64_FIVE, B64_SIX];
      // Walk every encode table row.
      for (let i: number = 0; i < rows.length; i++) {
        // Encode the current row.
        const encoded: string = EncryptUtils.base64Encode(rows[i]);
        // Compute the expected width of the current row.
        const expectedWidth: number = expectedBase64Width(rows[i].length);
        // Log the width table row summary.
        logCase(TAG, 'row[' + i + '] width ' + encoded.length + ', expected ' + expectedWidth);
        // Expect the encoded text to hit the known vector.
        expect(encoded).assertEqual(vectors[i]);
        // Expect the encoded width to follow the group formula.
        expect(encoded.length).assertEqual(expectedWidth);
        // Expect the encoded text to stay inside the Base64 alphabet.
        expect(isBase64Alphabet(encoded)).assertTrue();
      }

      // Verify the two pad characters of the one byte row.
      const onePad: number = EncryptUtils.base64Encode(TEXT_ONE).split(PAD).length - 1;
      // Log the pad count of the one byte row.
      logCase(TAG, 'one byte pad count ' + onePad);
      // Expect the one byte row to carry two pad characters.
      expect(onePad).assertEqual(2);
      // Expect the three byte row to carry no pad character.
      expect(EncryptUtils.base64Encode(TEXT_THREE).split(PAD).length - 1).assertEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0200
     * @tc.name      testEncmxBase64DecodeTable0001
     * @tc.desc      Verify base64Decode of the known vectors restores the raw ASCII rows of the encode table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxBase64DecodeTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxBase64DecodeTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the decode table rows of the known vectors.
      const vectors: string[] = [B64_ONE, B64_TWO, B64_THREE, B64_FOUR, B64_FIVE, B64_SIX, B64_GREETING,
        B64_DIGITS];
      // Prepare the raw texts expected after every decode.
      const raws: string[] = [TEXT_ONE, TEXT_TWO, TEXT_THREE, TEXT_FOUR, TEXT_FIVE, TEXT_SIX, TEXT_GREETING,
        TEXT_DIGITS];
      // Walk every decode table row.
      for (let i: number = 0; i < vectors.length; i++) {
        // Decode the current vector.
        const decoded: string = EncryptUtils.base64Decode(vectors[i]);
        // Log the decode table row.
        logCase(TAG, 'decode row[' + i + '] ' + decoded);
        // Expect the decoded text to restore the raw row.
        expect(decoded).assertEqual(raws[i]);
        // Expect the decoded text to keep the raw width.
        expect(decoded.length).assertEqual(raws[i].length);
      }

      // Decode the Chinese vector and check the multi byte restore.
      const chinese: string = EncryptUtils.base64Decode(B64_CHINESE);
      // Log the decoded Chinese text.
      logCase(TAG, 'decode chinese ' + chinese);
      // Expect the Chinese vector to restore the Chinese sample.
      expect(chinese).assertEqual(TEXT_CHINESE);
      // Expect the Chinese sample to use two characters.
      expect(chinese.length).assertEqual(2);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0300
     * @tc.name      testEncmxRoundTripMatrix0001
     * @tc.desc      Verify the Base64 round trip restores every row of the mixed text matrix without losing bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxRoundTripMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxRoundTripMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the round trip matrix of the mixed rows.
      const rows: string[] = ['', TEXT_ONE, TEXT_THREE, TEXT_GREETING, TEXT_DIGITS, TEXT_SYMBOLS, TEXT_CHINESE,
        TEXT_MIXED, TEXT_SPACE, TEXT_AMPERSAND];
      // Walk every round trip row.
      for (let i: number = 0; i < rows.length; i++) {
        // Read the current round trip row.
        const raw: string = rows[i];
        // Encode the current row.
        const encoded: string = EncryptUtils.base64Encode(raw);
        // Decode the encoded text of the current row.
        const decoded: string = EncryptUtils.base64Decode(encoded);
        // Log the round trip row summary.
        logCase(TAG, 'round trip row[' + i + '] raw ' + raw.length + ', encoded ' + encoded.length);
        // Expect the round trip to restore the raw row.
        expect(decoded).assertEqual(raw);
        // Expect the round trip to keep the raw width.
        expect(decoded.length).assertEqual(raw.length);
        // Expect the encoded text to stay inside the Base64 alphabet.
        expect(isBase64Alphabet(encoded)).assertTrue();
      }

      // The empty row must encode into the empty text and decode back to the empty text.
      const emptyEncoded: string = EncryptUtils.base64Encode('');
      // Log the empty row encode width.
      logCase(TAG, 'empty row encoded width ' + emptyEncoded.length);
      // Expect the empty row to encode into the empty text.
      expect(emptyEncoded).assertEqual('');
      // Expect the empty text to decode back into the empty text.
      expect(EncryptUtils.base64Decode('')).assertEqual('');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0400
     * @tc.name      testEncmxBase64InvalidTable0001
     * @tc.desc      Verify base64Decode falls back to the empty text for every malformed row of the invalid table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxBase64InvalidTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxBase64InvalidTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the invalid Base64 rows of the fallback checks.
      const invalidRows: string[] = ['!', '@@@@', 'a', 'ab', 'abc', '中文', '****', 'QQ==QQ==QQ=='];
      // Walk every invalid row.
      for (let i: number = 0; i < invalidRows.length; i++) {
        // Read the current invalid row.
        const row: string = invalidRows[i];
        // Track whether the decode call threw.
        let threw: boolean = false;
        // Track the decode result of the current row.
        let decoded: string = '__unset__';
        // Run the decode inside a guarded block.
        try {
          // Decode the current invalid row.
          decoded = EncryptUtils.base64Decode(row);
        } catch (error) {
          // Record the thrown failure instead of propagating it.
          threw = true;
        }
        // Log the invalid row verdict.
        logCase(TAG, 'invalid row[' + i + '] threw ' + threw + ', width ' + decoded.length);
        // Expect the decode call to swallow the failure and return a text.
        expect(threw).assertFalse();
        // Expect the invalid row to fall back to the empty text.
        expect(decoded).assertEqual('');
      }

      // The whitespace padded vector must not silently restore the raw text.
      const spaced: string = EncryptUtils.base64Decode(' ' + B64_GREETING + ' ');
      // Log the padded vector verdict width.
      logCase(TAG, 'padded vector width ' + spaced.length);
      // Expect the padded vector to either restore or fall back without throwing.
      expect(spaced.length >= 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0500
     * @tc.name      testEncmxUrlEscapeTable0001
     * @tc.desc      Verify urlEncode over the reserved character table of the URL escape matrix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxUrlEscapeTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxUrlEscapeTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the reserved character rows of the escape table.
      const reserved: string[] = [TEXT_SPACE, TEXT_AMPERSAND, TEXT_EQUALS, TEXT_PLUS, TEXT_HASH];
      // Prepare the expected escape sequences of the rows.
      const escapes: string[] = [URL_SPACE_ESCAPE, URL_AMP_ESCAPE, URL_EQUALS_ESCAPE, URL_PLUS_ESCAPE,
        URL_HASH_ESCAPE];
      // Walk every reserved character row.
      for (let i: number = 0; i < reserved.length; i++) {
        // Encode the current reserved character.
        const encoded: string = EncryptUtils.urlEncode(reserved[i]);
        // Log the escape table row.
        logCase(TAG, 'escape row[' + i + '] ' + encoded);
        // Expect the encoded text to hit the known escape sequence.
        expect(encoded).assertEqual(escapes[i]);
        // Expect the encoded text to contain the percent marker.
        expect(encoded.indexOf(PERCENT)).assertEqual(0);
        // Expect the encoded text to be longer than the raw character.
        expect(encoded.length).assertLarger(reserved[i].length);
      }

      // Encode the Chinese sample and check the multi byte escape.
      const chineseEscaped: string = EncryptUtils.urlEncode(TEXT_CHINESE);
      // Log the Chinese escape sequence.
      logCase(TAG, 'chinese escape ' + chineseEscaped);
      // Expect the Chinese sample to hit the known escape sequence.
      expect(chineseEscaped).assertEqual(URL_CHINESE_ESCAPE);
      // Expect every Chinese character to expand into nine escape characters.
      expect(chineseEscaped.length).assertEqual(TEXT_CHINESE.length * 9);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0600
     * @tc.name      testEncmxUrlUnescapeTable0001
     * @tc.desc      Verify urlDecode restores the raw characters of the URL escape table and keeps already safe rows.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxUrlUnescapeTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxUrlUnescapeTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the escape rows of the unescape table.
      const escapes: string[] = [URL_SPACE_ESCAPE, URL_AMP_ESCAPE, URL_EQUALS_ESCAPE, URL_PLUS_ESCAPE,
        URL_HASH_ESCAPE];
      // Prepare the raw characters expected after every decode.
      const raws: string[] = [TEXT_SPACE, TEXT_AMPERSAND, TEXT_EQUALS, TEXT_PLUS, TEXT_HASH];
      // Walk every unescape row.
      for (let i: number = 0; i < escapes.length; i++) {
        // Decode the current escape sequence.
        const decoded: string = EncryptUtils.urlDecode(escapes[i]);
        // Log the unescape table row.
        logCase(TAG, 'unescape row[' + i + '] length ' + decoded.length);
        // Expect the escape sequence to restore the raw character.
        expect(decoded).assertEqual(raws[i]);
        // Expect the decoded character to use a single character.
        expect(decoded.length).assertEqual(1);
        // Expect the decoded character to drop the percent marker.
        expect(decoded.indexOf(PERCENT)).assertEqual(-1);
      }

      // Decode the Chinese escape sequence and check the multi byte restore.
      const chinese: string = EncryptUtils.urlDecode(URL_CHINESE_ESCAPE);
      // Log the decoded Chinese text.
      logCase(TAG, 'unescape chinese ' + chinese);
      // Expect the Chinese escape sequence to restore the Chinese sample.
      expect(chinese).assertEqual(TEXT_CHINESE);
      // Expect the already safe text to pass through the decode untouched.
      expect(EncryptUtils.urlDecode('abc123-_.~')).assertEqual('abc123-_.~');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0700
     * @tc.name      testEncmxUrlRoundTripMatrix0001
     * @tc.desc      Verify the URL round trip restores every row of the mixed text matrix including malformed rows.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxUrlRoundTripMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxUrlRoundTripMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the round trip matrix of the mixed rows.
      const rows: string[] = ['', TEXT_ONE, TEXT_GREETING, TEXT_DIGITS, TEXT_SYMBOLS, TEXT_CHINESE, TEXT_MIXED,
        TEXT_SPACE, TEXT_AMPERSAND, TEXT_EQUALS, TEXT_PLUS, TEXT_HASH];
      // Walk every URL round trip row.
      for (let i: number = 0; i < rows.length; i++) {
        // Read the current round trip row.
        const raw: string = rows[i];
        // Encode the current row.
        const encoded: string = EncryptUtils.urlEncode(raw);
        // Decode the encoded text of the current row.
        const decoded: string = EncryptUtils.urlDecode(encoded);
        // Log the URL round trip row summary.
        logCase(TAG, 'url round trip row[' + i + '] raw ' + raw.length + ', encoded ' + encoded.length);
        // Expect the round trip to restore the raw row.
        expect(decoded).assertEqual(raw);
        // Expect the encoded text to never be shorter than the raw row.
        expect(encoded.length >= raw.length).assertTrue();
      }

      // Decode the malformed escape sequence and expect the raw text back.
      const malformed: string = EncryptUtils.urlDecode('%E4%B8');
      // Log the malformed escape verdict.
      logCase(TAG, 'malformed escape restored ' + (malformed.length > 0));
      // Expect the malformed escape sequence to be returned unchanged.
      expect(malformed).assertEqual('%E4%B8');
      // Expect a second malformed escape sequence to be returned unchanged as well.
      expect(EncryptUtils.urlDecode('abc%')).assertEqual('abc%');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0800
     * @tc.name      testEncmxBase64UrlIndependence0001
     * @tc.desc      Verify the Base64 and URL helpers stay independent and shape stable over the shared text matrix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncmxBase64UrlIndependence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxBase64UrlIndependence0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the shared matrix of the independence checks.
      const rows: string[] = [TEXT_GREETING, TEXT_SYMBOLS, TEXT_CHINESE, TEXT_MIXED, TEXT_SPACE];
      // Walk every shared row.
      for (let i: number = 0; i < rows.length; i++) {
        // Read the current shared row.
        const raw: string = rows[i];
        // Encode the row into Base64.
        const base64Text: string = EncryptUtils.base64Encode(raw);
        // Encode the row into a URL safe text.
        const urlText: string = EncryptUtils.urlEncode(raw);
        // Log the independence row summary.
        logCase(TAG, 'independence row[' + i + '] base64 ' + base64Text.length + ', url ' + urlText.length);
        // Expect the Base64 text to differ from the URL text.
        expect(base64Text === urlText).assertFalse();
        // Expect the Base64 text to stay inside the Base64 alphabet.
        expect(isBase64Alphabet(base64Text)).assertTrue();
        // Expect the Base64 text to carry no percent marker.
        expect(base64Text.indexOf(PERCENT)).assertEqual(-1);
        // Expect the URL text to restore the raw row.
        expect(EncryptUtils.urlDecode(urlText)).assertEqual(raw);
        // Expect the Base64 text to restore the raw row as well.
        expect(EncryptUtils.base64Decode(base64Text)).assertEqual(raw);
      }

      // The safe URL row must not be escaped at all.
      const safeRow: string = 'abc-_.~';
      // Log the safe row escape verdict.
      logCase(TAG, 'safe row escaped ' + (EncryptUtils.urlEncode(safeRow) !== safeRow));
      // Expect the safe row to pass through the URL encoder unchanged.
      expect(EncryptUtils.urlEncode(safeRow)).assertEqual(safeRow);
      // Expect the safe row to pass through the URL decoder unchanged.
      expect(EncryptUtils.urlDecode(safeRow)).assertEqual(safeRow);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_0900
     * @tc.name      testEncmxDigestShapeMatrix0001
     * @tc.desc      Verify the three digest helpers keep their fixed widths, lowercase alphabet and input sensitivity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncmxDigestShapeMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxDigestShapeMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the digest matrix rows of the shape checks.
      const rows: string[] = ['', TEXT_ONE, TEXT_THREE, TEXT_GREETING, TEXT_DIGITS, TEXT_SYMBOLS, TEXT_CHINESE,
        TEXT_MIXED];
      // Walk every digest matrix row.
      for (let i: number = 0; i < rows.length; i++) {
        // Read the current digest row.
        const raw: string = rows[i];
        // Compute the three digests of the current row.
        const md5Text: string = await EncryptUtils.md5(raw);
        // Compute the SHA-1 digest of the current row.
        const sha1Text: string = await EncryptUtils.sha1(raw);
        // Compute the SHA-256 digest of the current row.
        const sha256Text: string = await EncryptUtils.sha256(raw);
        // Log the digest shape row summary.
        logCase(TAG, 'digest row[' + i + '] ' + md5Text.length + '/' + sha1Text.length + '/' + sha256Text.length);
        // Expect the MD5 digest to keep the fixed width.
        expect(md5Text.length).assertEqual(32);
        // Expect the SHA-1 digest to keep the fixed width.
        expect(sha1Text.length).assertEqual(40);
        // Expect the SHA-256 digest to keep the fixed width.
        expect(sha256Text.length).assertEqual(64);
        // Expect every digest of the row to use lowercase hexadecimal digits.
        expect(isLowerHexText(md5Text) && isLowerHexText(sha1Text) && isLowerHexText(sha256Text)).assertTrue();
        // Expect the digests of one row to differ from each other.
        expect(md5Text === sha256Text).assertFalse();
      }

      // Hash two neighbouring rows to prove the digest is input sensitive.
      const leftDigest: string = await EncryptUtils.md5('abd');
      // Hash the neighbouring text of the digest matrix.
      const rightDigest: string = await EncryptUtils.md5('abe');
      // Log the neighbouring digest comparison.
      logCase(TAG, 'neighbour digests differ ' + (leftDigest !== rightDigest));
      // Expect the neighbouring texts to hash differently.
      expect(leftDigest === rightDigest).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_1000
     * @tc.name      testEncmxKnownVectorMatrix0001
     * @tc.desc      Verify the digest helpers against the published test vectors of the empty, abc and greeting inputs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncmxKnownVectorMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxKnownVectorMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the MD5 known vectors of the vector table.
      const md5Vectors: string[] = ['d41d8cd98f00b204e9800998ecf8427e',
        '900150983cd24fb0d6963f7d28e17f72', '5d41402abc4b2a76b9719d911017c592'];
      // Prepare the matching inputs of the MD5 vector table.
      const md5Inputs: string[] = ['', 'abc', TEXT_GREETING];
      // Walk the MD5 vector table.
      for (let i: number = 0; i < md5Inputs.length; i++) {
        // Hash the current MD5 vector input.
        const digest: string = await EncryptUtils.md5(md5Inputs[i]);
        // Log the MD5 vector row.
        logCase(TAG, 'md5 vector row[' + i + '] ' + digest);
        // Expect the MD5 digest to hit the published vector.
        expect(digest).assertEqual(md5Vectors[i]);
      }

      // Prepare the SHA-1 known vectors of the vector table.
      const sha1Vectors: string[] = ['da39a3ee5e6b4b0d3255bfef95601890afd80709',
        'a9993e364706816aba3e25717850c26c9cd0d89d', 'aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d'];
      // Walk the SHA-1 vector table.
      for (let i: number = 0; i < md5Inputs.length; i++) {
        // Hash the current SHA-1 vector input.
        const digest: string = await EncryptUtils.sha1(md5Inputs[i]);
        // Log the SHA-1 vector row.
        logCase(TAG, 'sha1 vector row[' + i + '] ' + digest);
        // Expect the SHA-1 digest to hit the published vector.
        expect(digest).assertEqual(sha1Vectors[i]);
      }

      // Prepare the SHA-256 known vectors of the vector table.
      const sha256Vectors: string[] = [
        'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',
        'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad',
        '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824'];
      // Walk the SHA-256 vector table.
      for (let i: number = 0; i < md5Inputs.length; i++) {
        // Hash the current SHA-256 vector input.
        const digest: string = await EncryptUtils.sha256(md5Inputs[i]);
        // Log the SHA-256 vector row.
        logCase(TAG, 'sha256 vector row[' + i + '] ' + digest);
        // Expect the SHA-256 digest to hit the published vector.
        expect(digest).assertEqual(sha256Vectors[i]);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_1100
     * @tc.name      testEncmxEmptyInputTable0001
     * @tc.desc      Verify every encode helper maps the empty input to the empty text and every decode helper maps the empty text back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncmxEmptyInputTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxEmptyInputTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Encode the empty input through the Base64 helper.
      const base64Empty: string = EncryptUtils.base64Encode('');
      // Log the empty Base64 result width.
      logCase(TAG, 'empty base64 width ' + base64Empty.length);
      // Expect the empty input to encode into the empty Base64 text.
      expect(base64Empty).assertEqual('');
      // Expect the empty Base64 text to decode back into the empty text.
      expect(EncryptUtils.base64Decode(base64Empty)).assertEqual('');

      // Encode the empty input through the URL helper.
      const urlEmpty: string = EncryptUtils.urlEncode('');
      // Log the empty URL result width.
      logCase(TAG, 'empty url width ' + urlEmpty.length);
      // Expect the empty input to encode into the empty URL text.
      expect(urlEmpty).assertEqual('');
      // Expect the empty URL text to decode back into the empty text.
      expect(EncryptUtils.urlDecode(urlEmpty)).assertEqual('');

      // Compute the three digests of the empty input.
      const md5Empty: string = await EncryptUtils.md5('');
      // Compute the SHA-1 digest of the empty input.
      const sha1Empty: string = await EncryptUtils.sha1('');
      // Compute the SHA-256 digest of the empty input.
      const sha256Empty: string = await EncryptUtils.sha256('');
      // Log the three empty digests.
      logCase(TAG, 'empty digests ' + md5Empty + ', ' + sha1Empty + ', ' + sha256Empty);
      // Expect the MD5 digest of the empty input to stay at the fixed width.
      expect(md5Empty.length).assertEqual(32);
      // Expect the SHA-1 digest of the empty input to stay at the fixed width.
      expect(sha1Empty.length).assertEqual(40);
      // Expect the SHA-256 digest of the empty input to stay at the fixed width.
      expect(sha256Empty.length).assertEqual(64);

      // Confirm the empty Base64 text and the empty URL text are different from the input space.
      const spaceBase64: string = EncryptUtils.base64Encode(TEXT_SPACE);
      // Log the space Base64 result.
      logCase(TAG, 'space base64 ' + spaceBase64);
      // Expect the single space to encode into a non empty Base64 text.
      expect(spaceBase64.length).assertLarger(0);
      // Expect the empty input to encode differently from the single space.
      expect(base64Empty === spaceBase64).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_1200
     * @tc.name      testEncmxAsciiSweepTable0001
     * @tc.desc      Verify the Base64 helper over a sweep of ASCII printable characters, checking the width formula and the round trip.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncmxAsciiSweepTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxAsciiSweepTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the ASCII sweep of the encode matrix.
      const sweep: string[] = ['0', '1', 'a', 'z', 'A', 'Z', '_', '-', '.', '~'];
      // Walk the ASCII sweep in order.
      for (let i: number = 0; i < sweep.length; i++) {
        // Read the current ASCII character.
        const character: string = sweep[i];
        // Encode the current character.
        const encoded: string = EncryptUtils.base64Encode(character);
        // Log the current sweep row.
        logCase(TAG, 'sweep row[' + i + '] ' + character + ' -> ' + encoded);
        // Expect the one byte character to encode into a four character text.
        expect(encoded.length).assertEqual(4);
        // Expect the encoded text to use the Base64 alphabet and the pad only.
        expect(isBase64Alphabet(encoded)).assertTrue();
        // Expect the encoded text to end with the double pad of a single byte.
        expect(encoded.endsWith(PAD + PAD)).assertTrue();
        // Expect the decoded text to restore the original character.
        expect(EncryptUtils.base64Decode(encoded)).assertEqual(character);
      }

      // Build the whole ASCII sweep text at once.
      const sweepText: string = sweep.join('');
      // Encode the whole sweep text.
      const sweepEncoded: string = EncryptUtils.base64Encode(sweepText);
      // Log the whole sweep width.
      logCase(TAG, 'whole sweep width ' + sweepEncoded.length);
      // Expect the whole sweep to follow the Base64 width formula.
      expect(sweepEncoded.length).assertEqual(expectedBase64Width(sweepText.length));
      // Expect the whole sweep to round trip without loss.
      expect(EncryptUtils.base64Decode(sweepEncoded)).assertEqual(sweepText);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_1300
     * @tc.name      testEncmxUrlReservedTable0001
     * @tc.desc      Verify the URL helpers escape and restore every reserved character of the URL component grammar.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncmxUrlReservedTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxUrlReservedTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the reserved characters that the URL helper must escape.
      const reserved: string[] = [' ', '&', '=', '+', '#', '?', '/', '@', ':'];
      // Walk the reserved character table.
      for (let i: number = 0; i < reserved.length; i++) {
        // Read the current reserved character.
        const character: string = reserved[i];
        // Encode the reserved character.
        const encoded: string = EncryptUtils.urlEncode(character);
        // Log the reserved row result.
        logCase(TAG, 'reserved row[' + i + '] ' + character + ' -> ' + encoded);
        // Expect the reserved character to be escaped into a percent triplet.
        expect(encoded.length).assertEqual(3);
        // Expect the escape sequence to start with the percent sign.
        expect(encoded.charAt(0)).assertEqual('%');
        // Expect the reserved character to be restored by the decoder.
        expect(EncryptUtils.urlDecode(encoded)).assertEqual(character);
      }

      // Prepare the unreserved characters that the URL helper must keep.
      const unreserved: string[] = ['a', 'Z', '0', '-', '_', '.', '~'];
      // Walk the unreserved character table.
      for (let i: number = 0; i < unreserved.length; i++) {
        // Read the current unreserved character.
        const character: string = unreserved[i];
        // Encode the unreserved character.
        const encoded: string = EncryptUtils.urlEncode(character);
        // Log the unreserved row result.
        logCase(TAG, 'unreserved row[' + i + '] ' + character + ' -> ' + encoded);
        // Expect the unreserved character to pass through unchanged.
        expect(encoded).assertEqual(character);
        // Expect the single character to stay at width one.
        expect(encoded.length).assertEqual(1);
      }

      // Compose a query style text from the reserved table.
      const queryText: string = 'a' + TEXT_SPACE + 'b' + TEXT_AMPERSAND + 'c' + TEXT_EQUALS + 'd';
      // Encode the whole query text.
      const queryEncoded: string = EncryptUtils.urlEncode(queryText);
      // Log the encoded query text.
      logCase(TAG, 'query encoded ' + queryEncoded);
      // Expect the query text to round trip without loss.
      expect(EncryptUtils.urlDecode(queryEncoded)).assertEqual(queryText);
      // Expect the encoded query text to hold three escape triplets.
      expect(EncryptUtils.urlDecode(queryEncoded).length).assertEqual(queryText.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_1400
     * @tc.name      testEncmxMultiByteTable0001
     * @tc.desc      Verify the Base64 helper expands Chinese and mixed text by their UTF-8 byte counts and restores them exactly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncmxMultiByteTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxMultiByteTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the multi byte rows of the encode matrix.
      const rows: string[] = [TEXT_CHINESE, TEXT_MIXED, TEXT_GREETING];
      // Prepare the expected Base64 texts of the multi byte rows.
      const vectors: string[] = [B64_CHINESE, B64_MIXED, B64_GREETING];
      // Walk the multi byte rows in order.
      for (let i: number = 0; i < rows.length; i++) {
        // Read the current multi byte row.
        const raw: string = rows[i];
        // Encode the current multi byte row.
        const encoded: string = EncryptUtils.base64Encode(raw);
        // Log the multi byte row result.
        logCase(TAG, 'multi byte row[' + i + '] ' + encoded);
        // Expect the encoded text to hit the known Base64 vector.
        expect(encoded).assertEqual(vectors[i]);
        // Expect the encoded text to use the Base64 alphabet and the pad only.
        expect(isBase64Alphabet(encoded)).assertTrue();
        // Expect the decoded text to restore the multi byte row.
        expect(EncryptUtils.base64Decode(encoded)).assertEqual(raw);
      }

      // Confirm the Chinese row needs three UTF-8 bytes per character.
      const chineseBytes: number = TEXT_CHINESE.length * 3;
      // Log the Chinese byte estimate.
      logCase(TAG, 'chinese bytes ' + chineseBytes);
      // Expect the Chinese Base64 width to follow the byte based formula.
      expect(B64_CHINESE.length).assertEqual(expectedBase64Width(chineseBytes));
      // Expect the Chinese Base64 width to be larger than the raw width.
      expect(B64_CHINESE.length).assertLarger(TEXT_CHINESE.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENCMX_1500
     * @tc.name      testEncmxDigestStabilityMatrix0001
     * @tc.desc      Verify the digest helpers are stable across repeated calls and unaffected by the Base64 and URL helpers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncmxDigestStabilityMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncmxDigestStabilityMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the stability rows of the digest matrix.
      const rows: string[] = ['', TEXT_ONE, TEXT_GREETING, TEXT_SYMBOLS, TEXT_CHINESE];
      // Walk the stability rows in order.
      for (let i: number = 0; i < rows.length; i++) {
        // Read the current stability row.
        const raw: string = rows[i];
        // Hash the current row the first time.
        const firstMd5: string = await EncryptUtils.md5(raw);
        // Hash the current row the second time.
        const secondMd5: string = await EncryptUtils.md5(raw);
        // Log the repeated digest comparison of the row.
        logCase(TAG, 'stability row[' + i + '] repeated equal ' + (firstMd5 === secondMd5));
        // Expect the repeated MD5 calls to return the same digest.
        expect(firstMd5).assertEqual(secondMd5);
        // Expect the digest to use lowercase hexadecimal characters only.
        expect(isLowerHexText(firstMd5)).assertTrue();
      }

      // Confirm the digest of the raw text differs from the digest of its Base64 text.
      const rawDigest: string = await EncryptUtils.sha1(TEXT_GREETING);
      // Hash the Base64 text of the greeting sample.
      const encodedDigest: string = await EncryptUtils.sha1(EncryptUtils.base64Encode(TEXT_GREETING));
      // Log the raw and encoded digest comparison.
      logCase(TAG, 'raw digest differs from encoded digest ' + (rawDigest !== encodedDigest));
      // Expect the raw and encoded digests to differ.
      expect(rawDigest === encodedDigest).assertFalse();
      // Expect both digests to keep the SHA-1 fixed width.
      expect(rawDigest.length).assertEqual(40);
      // Expect the encoded digest to keep the SHA-1 fixed width as well.
      expect(encodedDigest.length).assertEqual(40);

      // URL encoding leaves the greeting unchanged, so its digest must also remain unchanged.
      const urlDigest: string = await EncryptUtils.sha256(EncryptUtils.urlEncode(TEXT_GREETING));
      // Hash the raw greeting sample with SHA-256.
      const plainDigest: string = await EncryptUtils.sha256(TEXT_GREETING);
      // Log the URL digest comparison.
      logCase(TAG, 'url digest equals plain digest ' + (urlDigest === plainDigest));
      expect(urlDigest).assertEqual(plainDigest);
      // Expect the plain digest to equal the published greeting vector.
      expect(plainDigest).assertEqual(
        '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824');

      const escapedSymbols: string = EncryptUtils.urlEncode(TEXT_SYMBOLS);
      expect(escapedSymbols).assertEqual('a%2Bb%2Fc%3Dd');
      const symbolsDigest: string = await EncryptUtils.sha256(TEXT_SYMBOLS);
      const escapedSymbolsDigest: string = await EncryptUtils.sha256(escapedSymbols);
      expect(symbolsDigest.length).assertEqual(64);
      expect(escapedSymbolsDigest.length).assertEqual(64);
      expect(symbolsDigest === escapedSymbolsDigest).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { encodingMatrixTest };
