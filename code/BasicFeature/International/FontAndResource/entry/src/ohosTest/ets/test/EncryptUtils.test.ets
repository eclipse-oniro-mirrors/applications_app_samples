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

// Import the encoding and digest helpers under test from the library HAR package.
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

// The ASCII sample used by the Base64 encode and decode round trips.
const ASCII_SAMPLE: string = 'hello';
// The Base64 text that the ASCII sample must encode to.
const ASCII_BASE64: string = 'aGVsbG8=';
// The single character ASCII sample used by the short input cases.
const ASCII_ONE: string = 'A';
// The Base64 text that the single character ASCII sample must encode to.
const ASCII_ONE_BASE64: string = 'QQ==';
// The two character ASCII sample used by the short input cases.
const ASCII_TWO: string = 'AB';
// The Base64 text that the two character ASCII sample must encode to.
const ASCII_TWO_BASE64: string = 'QUI=';
// The three character ASCII sample used by the short input cases.
const ASCII_THREE: string = 'ABC';
// The Base64 text that the three character ASCII sample must encode to.
const ASCII_THREE_BASE64: string = 'QUJD';
// The lowercase alphabet sample used by the longer ASCII case.
const ALPHABET_LOWER: string = 'abcdefghijklmnopqrstuvwxyz';
// The Base64 text that the lowercase alphabet must encode to.
const ALPHABET_LOWER_BASE64: string = 'YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXo=';
// The digit sample used by the numeric ASCII case.
const DIGITS_SAMPLE: string = '1234567890';
// The Base64 text that the digit sample must encode to.
const DIGITS_BASE64: string = 'MTIzNDU2Nzg5MA==';
// The mixed punctuation sample used by the symbol ASCII case.
const SYMBOL_SAMPLE: string = 'a+b/c=d';
// The Base64 text that the punctuation sample must encode to.
const SYMBOL_BASE64: string = 'YStiL2M9ZA==';
// The Chinese greeting sample used by the multi byte round trip cases.
const CHINESE_SAMPLE: string = '你好';
// The expected Base64 text of the Chinese greeting sample.
const CHINESE_BASE64: string = '5L2g5aW9';
// The mixed Chinese and ASCII sample used by the multi byte round trip cases.
const MIXED_SAMPLE: string = '你好abc';
// The expected Base64 text of the mixed Chinese and ASCII sample.
const MIXED_BASE64: string = '5L2g5aW9YWJj';
// The three character Chinese sample used by the multi byte round trip cases.
const CHINESE_THREE: string = '中文字';
// The expected Base64 text of the three character Chinese sample.
const CHINESE_THREE_BASE64: string = '5Lit5paH5a2X';
// The emoji sample used by the surrogate pair round trip cases, spelled with its character codes.
const EMOJI_SAMPLE: string = String.fromCharCode(0xD83D) + String.fromCharCode(0xDE00);
// The mixed emoji and ASCII sample used by the surrogate pair round trip cases.
const EMOJI_MIXED: string = 'a' + String.fromCharCode(0xD83D) + String.fromCharCode(0xDE00) + 'b';
// The expected Base64 text of the emoji sample.
const EMOJI_BASE64: string = '8J+YgA==';
// The expected Base64 text of the mixed emoji and ASCII sample.
const EMOJI_MIXED_BASE64: string = 'YfCfmIBi';
// The empty string digest of MD5, the well known constant vector.
const MD5_EMPTY: string = 'd41d8cd98f00b204e9800998ecf8427e';
// The MD5 digest of the text "abc".
const MD5_ABC: string = '900150983cd24fb0d6963f7d28e17f72';
// The MD5 digest of the text "hello".
const MD5_HELLO: string = '5d41402abc4b2a76b9719d911017c592';
// The MD5 digest of the text "A".
const MD5_UPPER_A: string = '7fc56270e7a70fa81a5935b72eacbe29';
// The MD5 digest of the text "message digest".
const MD5_MESSAGE_DIGEST: string = 'f96b697d7cb7938d525a2f31aaf161d0';

// The SHA-1 digest of the empty string.
const SHA1_EMPTY: string = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';
// The SHA-1 digest of the text "abc".
const SHA1_ABC: string = 'a9993e364706816aba3e25717850c26c9cd0d89d';
// The SHA-1 digest of the text "hello".
const SHA1_HELLO: string = 'aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d';
// The SHA-1 digest of the text "A".
const SHA1_UPPER_A: string = '6dcd4ce23d88e2ee9568ba546c007c63d9131c1b';

// The SHA-256 digest of the empty string.
const SHA256_EMPTY: string = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855';
// The SHA-256 digest of the text "abc".
const SHA256_ABC: string = 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad';
// The SHA-256 digest of the text "hello".
const SHA256_HELLO: string = '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824';
// The SHA-256 digest of the text "A".
const SHA256_UPPER_A: string = '559aead08264d5795d3909718cdd05abd49572e84fe55590eef31a88a08fdffd';

// The hexadecimal length of an MD5 digest.
const MD5_HEX_LENGTH: number = 32;
// The hexadecimal length of a SHA-1 digest.
const SHA1_HEX_LENGTH: number = 40;
// The hexadecimal length of a SHA-256 digest.
const SHA256_HEX_LENGTH: number = 64;
// The lowercase hexadecimal alphabet used by the digest shape checks.
const HEX_ALPHABET: string = '0123456789abcdef';
// The Base64 padding character used by the shape checks.
const BASE64_PAD: string = '=';
// A long ASCII text used by the stability and round trip cases.
const LONG_ASCII: string = 'The quick brown fox jumps over the lazy dog';
// The Base64 text of the long ASCII sentence.
const LONG_ASCII_BASE64: string = 'VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZw==';
// The URL sample that contains a space and an ampersand.
const URL_SAMPLE: string = 'a b&c=d';
// The expected URL encoding of the URL sample, every special character escaped.
const URL_SAMPLE_ENCODED: string = 'a%20b%26c%3Dd';
// The URL query sample used by the decode friendly cases.
const URL_QUERY: string = 'key=hello world';
// The expected URL encoding of the URL query sample.
const URL_QUERY_ENCODED: string = 'key%3Dhello%20world';
// The Chinese URL sample used by the multi byte URL cases.
const URL_CHINESE: string = '中文';
// The expected URL encoding of the Chinese URL sample.
const URL_CHINESE_ENCODED: string = '%E4%B8%AD%E6%96%87';
// The already safe URL sample used by the pass through cases.
const URL_SAFE: string = 'abc123-_.~';
// The malformed escape sequence used by the tolerant decode cases.
const URL_MALFORMED: string = '%E4%B8';
// A second malformed escape sequence used by the tolerant decode cases.
const URL_MALFORMED_TWO: string = 'abc%';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Returns true when every character of the text is a lowercase hexadecimal digit.
function isLowerHexText(text: string): boolean {
  // Scan every character of the text.
  for (let i: number = 0; i < text.length; i++) {
    // Check whether the current character belongs to the hexadecimal alphabet.
    if (HEX_ALPHABET.indexOf(text.charAt(i)) < 0) {
      // Report the first offending character immediately.
      return false;
    }
  }
  // Every character was a lowercase hexadecimal digit.
  return true;
}

// Registers every on-device logic test case of the encoding and digest helpers.
export default function encryptUtilsTest() {
  // Group the cases under the "EncryptUtilsSuite" describe block.
  describe('EncryptUtilsSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'EncryptUtilsSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0100
     * @tc.name      testEncBase64EncodeAscii0001
     * @tc.desc      Verify base64Encode produces the standard padded Base64 text for short ASCII inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncBase64EncodeAscii0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncBase64EncodeAscii0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Encode the single character sample and compare it against the known vector.
      const oneResult: string = EncryptUtils.base64Encode(ASCII_ONE);
      // Log the single character encoding result.
      logCase(TAG, 'base64Encode(A): ' + oneResult);
      // Expect the single character to encode into QQ== with a double pad.
      expect(oneResult).assertEqual(ASCII_ONE_BASE64);

      // Encode the two character sample and compare it against the known vector.
      const twoResult: string = EncryptUtils.base64Encode(ASCII_TWO);
      // Log the two character encoding result.
      logCase(TAG, 'base64Encode(AB): ' + twoResult);
      // Expect the two character sample to encode into QUI= with a single pad.
      expect(twoResult).assertEqual(ASCII_TWO_BASE64);

      // Encode the three character sample and compare it against the known vector.
      const threeResult: string = EncryptUtils.base64Encode(ASCII_THREE);
      // Log the three character encoding result.
      logCase(TAG, 'base64Encode(ABC): ' + threeResult);
      // Expect the three character sample to encode into QUJD without any pad.
      expect(threeResult).assertEqual(ASCII_THREE_BASE64);

      // Encode the greeting sample and compare it against the known vector.
      const helloResult: string = EncryptUtils.base64Encode(ASCII_SAMPLE);
      // Log the greeting encoding result.
      logCase(TAG, 'base64Encode(hello): ' + helloResult);
      // Expect the greeting to encode into aGVsbG8=.
      expect(helloResult).assertEqual(ASCII_BASE64);

      // Confirm that the padded output keeps the standard alphabet characters only.
      expect(helloResult.indexOf(BASE64_PAD)).assertLarger(-1);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0200
     * @tc.name      testEncBase64EncodeAscii0002
     * @tc.desc      Verify base64Encode matches the known vectors for the full lowercase alphabet, a digit run and a punctuation run.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncBase64EncodeAscii0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncBase64EncodeAscii0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Encode the lowercase alphabet and compare it against the known vector.
      const alphabetResult: string = EncryptUtils.base64Encode(ALPHABET_LOWER);
      // Log the alphabet encoding result.
      logCase(TAG, 'base64Encode(alphabet): ' + alphabetResult);
      // Expect the 26 letter alphabet to hit the published Base64 vector.
      expect(alphabetResult).assertEqual(ALPHABET_LOWER_BASE64);

      // Encode the ten digit run and compare it against the known vector.
      const digitsResult: string = EncryptUtils.base64Encode(DIGITS_SAMPLE);
      // Log the digit encoding result.
      logCase(TAG, 'base64Encode(digits): ' + digitsResult);
      // Expect the digit run to encode into MTIzNDU2Nzg5MA==.
      expect(digitsResult).assertEqual(DIGITS_BASE64);

      // Encode the punctuation run and compare it against the known vector.
      const symbolResult: string = EncryptUtils.base64Encode(SYMBOL_SAMPLE);
      // Log the punctuation encoding result.
      logCase(TAG, 'base64Encode(symbols): ' + symbolResult);
      // Expect the punctuation run to escape every special character on its own.
      expect(symbolResult).assertEqual(SYMBOL_BASE64);

      // Encode the long sentence and compare it against the known vector.
      const longResult: string = EncryptUtils.base64Encode(LONG_ASCII);
      // Log the long sentence encoding result.
      logCase(TAG, 'base64Encode(long sentence): ' + longResult);
      // Expect the long sentence to hit its known Base64 vector.
      expect(longResult).assertEqual(LONG_ASCII_BASE64);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0300
     * @tc.name      testEncBase64EncodeUnicode0001
     * @tc.desc      Verify base64Encode encodes Chinese text, mixed text and emoji surrogate pairs through their UTF-8 bytes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncBase64EncodeUnicode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncBase64EncodeUnicode0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Encode the two character Chinese greeting.
      const chineseResult: string = EncryptUtils.base64Encode(CHINESE_SAMPLE);
      // Log the Chinese greeting encoding result.
      logCase(TAG, 'base64Encode(Chinese greeting): ' + chineseResult);
      // Expect six UTF-8 bytes to encode into the known eight character Base64 text.
      expect(chineseResult).assertEqual(CHINESE_BASE64);
      // Expect the Base64 length of six raw bytes to be eight characters.
      expect(chineseResult.length).assertEqual(8);

      // Encode the mixed Chinese and ASCII sample.
      const mixedResult: string = EncryptUtils.base64Encode(MIXED_SAMPLE);
      // Log the mixed sample encoding result.
      logCase(TAG, 'base64Encode(mixed): ' + mixedResult);
      // Expect the mixed sample to hit its known Base64 vector.
      expect(mixedResult).assertEqual(MIXED_BASE64);

      // Encode the three character Chinese sample.
      const threeResult: string = EncryptUtils.base64Encode(CHINESE_THREE);
      // Log the three character Chinese encoding result.
      logCase(TAG, 'base64Encode(three Chinese): ' + threeResult);
      // Expect nine UTF-8 bytes to encode into twelve Base64 characters.
      expect(threeResult).assertEqual(CHINESE_THREE_BASE64);
      // Expect nine raw bytes to expand into twelve Base64 characters.
      expect(threeResult.length).assertEqual(12);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0400
     * @tc.name      testEncBase64EncodeUnicode0002
     * @tc.desc      Verify base64Encode encodes an emoji surrogate pair into the four byte UTF-8 Base64 vector.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncBase64EncodeUnicode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncBase64EncodeUnicode0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Encode the single emoji sample.
      const emojiResult: string = EncryptUtils.base64Encode(EMOJI_SAMPLE);
      // Log the emoji encoding result.
      logCase(TAG, 'base64Encode(emoji): ' + emojiResult);
      // Expect the emoji to encode into its four byte UTF-8 Base64 vector.
      expect(emojiResult).assertEqual(EMOJI_BASE64);
      // Expect four raw bytes to expand into eight Base64 characters.
      expect(emojiResult.length).assertEqual(8);
      // Expect the emoji Base64 text to end with one pad character.
      expect(emojiResult.endsWith(BASE64_PAD)).assertTrue();

      // Encode the mixed emoji and ASCII sample.
      const mixedResult: string = EncryptUtils.base64Encode(EMOJI_MIXED);
      // Log the mixed emoji encoding result.
      logCase(TAG, 'base64Encode(emoji mixed): ' + mixedResult);
      // Expect the mixed sample to hit its known Base64 vector.
      expect(mixedResult).assertEqual(EMOJI_MIXED_BASE64);
      // Expect the surrogate pair to keep the raw byte count at six.
      expect(mixedResult.length).assertEqual(8);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0500
     * @tc.name      testEncBase64RoundTrip0001
     * @tc.desc      Verify base64Decode restores every encoded ASCII sample and reports the empty string for the empty input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncBase64RoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncBase64RoundTrip0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the ASCII inputs driven through the encode and decode round trip.
      const asciiInputs: string[] = [ASCII_ONE, ASCII_TWO, ASCII_THREE, ASCII_SAMPLE, DIGITS_SAMPLE,
        ALPHABET_LOWER, SYMBOL_SAMPLE, LONG_ASCII];
      // Walk every ASCII input in order.
      for (let i: number = 0; i < asciiInputs.length; i++) {
        // Read the current ASCII input.
        const input: string = asciiInputs[i];
        // Encode the input into Base64 text.
        const encoded: string = EncryptUtils.base64Encode(input);
        // Decode the Base64 text back into plain text.
        const decoded: string = EncryptUtils.base64Decode(encoded);
        // Log the round trip result of the current input.
        logCase(TAG, 'roundtrip[' + i + '] encoded length ' + encoded.length);
        // Expect the decoded text to equal the original ASCII input.
        expect(decoded).assertEqual(input);
      }

      // Decode the empty string and expect the empty result.
      const emptyResult: string = EncryptUtils.base64Decode('');
      // Log the empty decode result.
      logCase(TAG, "base64Decode(''): '" + emptyResult + "'");
      // Expect the empty input to decode into the empty string.
      expect(emptyResult).assertEqual('');
      // Expect the empty decode result to report zero length.
      expect(emptyResult.length).assertEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0600
     * @tc.name      testEncBase64RoundTrip0002
     * @tc.desc      Verify base64Decode restores Chinese text, mixed text and emoji surrogate pairs without losing bytes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncBase64RoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncBase64RoundTrip0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the multi byte inputs driven through the encode and decode round trip.
      const unicodeInputs: string[] = [CHINESE_SAMPLE, MIXED_SAMPLE, CHINESE_THREE, EMOJI_SAMPLE, EMOJI_MIXED];
      // Walk every multi byte input in order.
      for (let i: number = 0; i < unicodeInputs.length; i++) {
        // Read the current multi byte input.
        const input: string = unicodeInputs[i];
        // Encode the input into Base64 text.
        const encoded: string = EncryptUtils.base64Encode(input);
        // Decode the Base64 text back into plain text.
        const decoded: string = EncryptUtils.base64Decode(encoded);
        // Log the round trip result of the current input.
        logCase(TAG, 'unicode roundtrip[' + i + '] chars ' + decoded.length);
        // Expect the decoded text to equal the original multi byte input.
        expect(decoded).assertEqual(input);
        // Expect the decoded text to keep the same character count.
        expect(decoded.length).assertEqual(input.length);
      }

      // Decode the known Chinese Base64 vector directly.
      const knownResult: string = EncryptUtils.base64Decode(CHINESE_BASE64);
      // Log the known vector decode result.
      logCase(TAG, 'decode Chinese vector chars ' + knownResult.length);
      // Expect the hard coded Chinese vector to decode back to the greeting.
      expect(knownResult).assertEqual(CHINESE_SAMPLE);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0700
     * @tc.name      testEncBase64DecodeInvalid0001
     * @tc.desc      Verify base64Decode returns the empty string for malformed Base64 inputs instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncBase64DecodeInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncBase64DecodeInvalid0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the malformed Base64 inputs that must fail the decode.
      const invalidInputs: string[] = ['!!!!', '@@@@', 'a', 'ab', 'abc', 'aGVsbG8', '====', '#$%^&*'];
      // Walk every malformed input in order.
      for (let i: number = 0; i < invalidInputs.length; i++) {
        // Read the current malformed input.
        const input: string = invalidInputs[i];
        // Decode the malformed input and capture the tolerant result.
        const result: string = EncryptUtils.base64Decode(input);
        // Log the malformed decode result.
        logCase(TAG, 'decode invalid[' + i + '] length ' + result.length);
        // Expect the malformed input to fall back to the empty string.
        expect(result).assertEqual('');
      }

      // Confirm the empty fallback keeps a zero length.
      expect(EncryptUtils.base64Decode('!!!!').length).assertEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0800
     * @tc.name      testEncUrlEncode0001
     * @tc.desc      Verify urlEncode escapes spaces, ampersands, equals signs and Chinese characters while keeping unreserved characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncUrlEncode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncUrlEncode0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Encode the mixed space and ampersand sample.
      const sampleResult: string = EncryptUtils.urlEncode(URL_SAMPLE);
      // Log the mixed sample encoding result.
      logCase(TAG, 'urlEncode(a b&c=d): ' + sampleResult);
      // Expect the space to become %20 and the ampersand to become %26.
      expect(sampleResult).assertEqual(URL_SAMPLE_ENCODED);
      // Expect the encoded text to keep no raw space character.
      expect(sampleResult.indexOf(' ')).assertEqual(-1);

      // Encode the query shaped sample.
      const queryResult: string = EncryptUtils.urlEncode(URL_QUERY);
      // Log the query encoding result.
      logCase(TAG, 'urlEncode(key=hello world): ' + queryResult);
      // Expect the equals sign and the space to be escaped.
      expect(queryResult).assertEqual(URL_QUERY_ENCODED);

      // Encode the Chinese sample into UTF-8 percent escapes.
      const chineseResult: string = EncryptUtils.urlEncode(URL_CHINESE);
      // Log the Chinese encoding result.
      logCase(TAG, 'urlEncode(Chinese): ' + chineseResult);
      // Expect the two Chinese characters to become six percent escape groups.
      expect(chineseResult).assertEqual(URL_CHINESE_ENCODED);
      // Expect the Chinese encoding to expand to eighteen characters.
      expect(chineseResult.length).assertEqual(18);

      // Encode the already safe sample and expect it unchanged.
      const safeResult: string = EncryptUtils.urlEncode(URL_SAFE);
      // Log the safe sample encoding result.
      logCase(TAG, 'urlEncode(safe): ' + safeResult);
      // Expect the unreserved characters to survive the encoding untouched.
      expect(safeResult).assertEqual(URL_SAFE);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_0900
     * @tc.name      testEncUrlDecode0001
     * @tc.desc      Verify urlDecode restores every percent encoded sample and returns malformed escapes unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncUrlDecode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncUrlDecode0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Decode the pre-encoded mixed sample and expect the original text.
      const sampleResult: string = EncryptUtils.urlDecode(URL_SAMPLE_ENCODED);
      // Log the mixed sample decode result.
      logCase(TAG, 'urlDecode(a%20b%26c%3Dd): ' + sampleResult);
      // Expect the escaped space to come back as a plain space.
      expect(sampleResult).assertEqual(URL_SAMPLE);

      // Decode the pre-encoded query sample and expect the original text.
      const queryResult: string = EncryptUtils.urlDecode(URL_QUERY_ENCODED);
      // Log the query decode result.
      logCase(TAG, 'urlDecode(key%3Dhello%20world): ' + queryResult);
      // Expect the escaped equals sign to come back as a plain equals sign.
      expect(queryResult).assertEqual(URL_QUERY);

      // Decode the pre-encoded Chinese sample and expect the original text.
      const chineseResult: string = EncryptUtils.urlDecode(URL_CHINESE_ENCODED);
      // Log the Chinese decode result.
      logCase(TAG, 'urlDecode(Chinese escapes): ' + chineseResult);
      // Expect the six escape groups to rebuild the two Chinese characters.
      expect(chineseResult).assertEqual(URL_CHINESE);

      // Decode the malformed escape sample and expect the original text.
      const malformedResult: string = EncryptUtils.urlDecode(URL_MALFORMED);
      // Log the malformed decode result.
      logCase(TAG, 'urlDecode(malformed): ' + malformedResult);
      // Expect the malformed sample to be returned unchanged.
      expect(malformedResult).assertEqual(URL_MALFORMED);

      // Decode the trailing percent sample and expect the original text.
      const trailingResult: string = EncryptUtils.urlDecode(URL_MALFORMED_TWO);
      // Log the trailing percent decode result.
      logCase(TAG, 'urlDecode(abc%): ' + trailingResult);
      // Expect the trailing percent sample to be returned unchanged.
      expect(trailingResult).assertEqual(URL_MALFORMED_TWO);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1000
     * @tc.name      testEncUrlRoundTrip0001
     * @tc.desc      Verify urlDecode restores the output of urlEncode for ASCII, symbols, Chinese text and emoji.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncUrlRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncUrlRoundTrip0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the samples driven through the URL encode and decode round trip.
      const urlInputs: string[] = [ASCII_SAMPLE, URL_SAMPLE, URL_QUERY, URL_CHINESE, URL_SAFE,
        EMOJI_SAMPLE, EMOJI_MIXED];
      // Walk every URL sample in order.
      for (let i: number = 0; i < urlInputs.length; i++) {
        // Read the current URL sample.
        const input: string = urlInputs[i];
        // Encode the sample into a URL safe component.
        const encoded: string = EncryptUtils.urlEncode(input);
        // Decode the escaped component back into plain text.
        const decoded: string = EncryptUtils.urlDecode(encoded);
        // Log the round trip result of the current sample.
        logCase(TAG, 'url roundtrip[' + i + '] encoded length ' + encoded.length);
        // Expect the decoded text to equal the original sample.
        expect(decoded).assertEqual(input);
      }

      // Encode the empty string and expect the empty result.
      const emptyEncoded: string = EncryptUtils.urlEncode('');
      // Log the empty encode result.
      logCase(TAG, "urlEncode('') length " + emptyEncoded.length);
      // Expect the empty input to encode into the empty string.
      expect(emptyEncoded).assertEqual('');
      // Decode the empty string and expect the empty result.
      expect(EncryptUtils.urlDecode('')).assertEqual('');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1100
     * @tc.name      testEncMd50001
     * @tc.desc      Verify the async md5 helper returns the published digest vectors for the empty string, abc, hello and a single letter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncMd50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncMd50001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Hash the empty string and compare it against the known vector.
      const emptyDigest: string = await EncryptUtils.md5('');
      // Log the empty string digest.
      logCase(TAG, 'md5(empty): ' + emptyDigest);
      // Expect the empty string to hash into the published MD5 vector.
      expect(emptyDigest).assertEqual(MD5_EMPTY);
      // Expect the empty string digest to be 32 hexadecimal characters wide.
      expect(emptyDigest.length).assertEqual(MD5_HEX_LENGTH);

      // Hash the text abc and compare it against the known vector.
      const abcDigest: string = await EncryptUtils.md5('abc');
      // Log the abc digest.
      logCase(TAG, 'md5(abc): ' + abcDigest);
      // Expect abc to hash into the published MD5 vector.
      expect(abcDigest).assertEqual(MD5_ABC);

      // Hash the text hello and compare it against the known vector.
      const helloDigest: string = await EncryptUtils.md5(ASCII_SAMPLE);
      // Log the hello digest.
      logCase(TAG, 'md5(hello): ' + helloDigest);
      // Expect hello to hash into the published MD5 vector.
      expect(helloDigest).assertEqual(MD5_HELLO);

      // Hash the single letter A and compare it against the known vector.
      const upperDigest: string = await EncryptUtils.md5(ASCII_ONE);
      // Log the single letter digest.
      logCase(TAG, 'md5(A): ' + upperDigest);
      // Expect the single letter to hash into the published MD5 vector.
      expect(upperDigest).assertEqual(MD5_UPPER_A);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1200
     * @tc.name      testEncMd50002
     * @tc.desc      Verify md5 is deterministic, lowercase hexadecimal shaped and differs for different inputs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncMd50002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncMd50002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Hash the message digest sample and compare it against the known vector.
      const vectorDigest: string = await EncryptUtils.md5('message digest');
      // Log the message digest vector result.
      logCase(TAG, 'md5(message digest): ' + vectorDigest);
      // Expect the long sample to hash into the published MD5 vector.
      expect(vectorDigest).assertEqual(MD5_MESSAGE_DIGEST);

      // Hash the same input twice to check determinism.
      const firstRun: string = await EncryptUtils.md5(ASCII_SAMPLE);
      // Hash the same input a second time.
      const secondRun: string = await EncryptUtils.md5(ASCII_SAMPLE);
      // Log the repeated run digests.
      logCase(TAG, 'repeat run stable ' + (firstRun === secondRun));
      // Expect the two runs of the same input to be identical.
      expect(firstRun).assertEqual(secondRun);

      // Confirm the digest uses lowercase hexadecimal characters only.
      expect(isLowerHexText(firstRun)).assertTrue();
      // Hash a one character shifted input to confirm the avalanche difference.
      const shiftedDigest: string = await EncryptUtils.md5('hellp');
      // Log the shifted input digest.
      logCase(TAG, 'md5(hellp): ' + shiftedDigest);
      // Expect the shifted input to produce a completely different digest.
      expect(shiftedDigest === firstRun).assertFalse();
      // Expect the shifted digest to keep the MD5 width.
      expect(shiftedDigest.length).assertEqual(MD5_HEX_LENGTH);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1300
     * @tc.name      testEncSha10001
     * @tc.desc      Verify the async sha1 helper returns the published digest vectors for the empty string, abc, hello and a single letter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncSha10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncSha10001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Hash the empty string and compare it against the known vector.
      const emptyDigest: string = await EncryptUtils.sha1('');
      // Log the empty string digest.
      logCase(TAG, 'sha1(empty): ' + emptyDigest);
      // Expect the empty string to hash into the published SHA-1 vector.
      expect(emptyDigest).assertEqual(SHA1_EMPTY);
      // Expect the empty string digest to be 40 hexadecimal characters wide.
      expect(emptyDigest.length).assertEqual(SHA1_HEX_LENGTH);

      // Hash the text abc and compare it against the known vector.
      const abcDigest: string = await EncryptUtils.sha1('abc');
      // Log the abc digest.
      logCase(TAG, 'sha1(abc): ' + abcDigest);
      // Expect abc to hash into the published SHA-1 vector.
      expect(abcDigest).assertEqual(SHA1_ABC);

      // Hash the text hello and compare it against the known vector.
      const helloDigest: string = await EncryptUtils.sha1(ASCII_SAMPLE);
      // Log the hello digest.
      logCase(TAG, 'sha1(hello): ' + helloDigest);
      // Expect hello to hash into the published SHA-1 vector.
      expect(helloDigest).assertEqual(SHA1_HELLO);

      // Hash the single letter A and compare it against the known vector.
      const upperDigest: string = await EncryptUtils.sha1(ASCII_ONE);
      // Log the single letter digest.
      logCase(TAG, 'sha1(A): ' + upperDigest);
      // Expect the single letter to hash into the published SHA-1 vector.
      expect(upperDigest).assertEqual(SHA1_UPPER_A);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1400
     * @tc.name      testEncSha10002
     * @tc.desc      Verify sha1 stays deterministic, keeps its lowercase hexadecimal shape and never collides with the md5 output.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncSha10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncSha10002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Hash the abc sample twice to check determinism.
      const firstRun: string = await EncryptUtils.sha1('abc');
      // Hash the same sample a second time.
      const secondRun: string = await EncryptUtils.sha1('abc');
      // Log the repeated run comparison.
      logCase(TAG, 'sha1 repeat stable ' + (firstRun === secondRun));
      // Expect the two runs of the same input to be identical.
      expect(firstRun).assertEqual(secondRun);

      // Confirm the digest uses lowercase hexadecimal characters only.
      expect(isLowerHexText(firstRun)).assertTrue();
      // Hash the same sample with md5 to compare the two algorithms.
      const md5Digest: string = await EncryptUtils.md5('abc');
      // Log both digest values.
      logCase(TAG, 'sha1 vs md5 differ ' + (firstRun !== md5Digest));
      // Expect the SHA-1 output to differ from the MD5 output.
      expect(firstRun === md5Digest).assertFalse();
      // Expect the SHA-1 digest to be wider than the MD5 digest.
      expect(firstRun.length > md5Digest.length).assertTrue();

      // Hash a long sentence and confirm the fixed digest width.
      const longDigest: string = await EncryptUtils.sha1(LONG_ASCII);
      // Log the long sentence digest width.
      logCase(TAG, 'sha1(long) length ' + longDigest.length);
      // Expect the long sentence to keep the fixed SHA-1 width.
      expect(longDigest.length).assertEqual(SHA1_HEX_LENGTH);
      // Expect the long sentence digest to use lowercase hexadecimal characters.
      expect(isLowerHexText(longDigest)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1500
     * @tc.name      testEncSha2560001
     * @tc.desc      Verify the async sha256 helper returns the published digest vectors for the empty string, abc, hello and a single letter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEncSha2560001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncSha2560001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Hash the empty string and compare it against the known vector.
      const emptyDigest: string = await EncryptUtils.sha256('');
      // Log the empty string digest.
      logCase(TAG, 'sha256(empty): ' + emptyDigest);
      // Expect the empty string to hash into the published SHA-256 vector.
      expect(emptyDigest).assertEqual(SHA256_EMPTY);
      // Expect the empty string digest to be 64 hexadecimal characters wide.
      expect(emptyDigest.length).assertEqual(SHA256_HEX_LENGTH);

      // Hash the text abc and compare it against the known vector.
      const abcDigest: string = await EncryptUtils.sha256('abc');
      // Log the abc digest.
      logCase(TAG, 'sha256(abc): ' + abcDigest);
      // Expect abc to hash into the published SHA-256 vector.
      expect(abcDigest).assertEqual(SHA256_ABC);

      // Hash the text hello and compare it against the known vector.
      const helloDigest: string = await EncryptUtils.sha256(ASCII_SAMPLE);
      // Log the hello digest.
      logCase(TAG, 'sha256(hello): ' + helloDigest);
      // Expect hello to hash into the published SHA-256 vector.
      expect(helloDigest).assertEqual(SHA256_HELLO);

      // Hash the single letter A and compare it against the known vector.
      const upperDigest: string = await EncryptUtils.sha256(ASCII_ONE);
      // Log the single letter digest.
      logCase(TAG, 'sha256(A): ' + upperDigest);
      // Expect the single letter to hash into the published SHA-256 vector.
      expect(upperDigest).assertEqual(SHA256_UPPER_A);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1600
     * @tc.name      testEncSha2560002
     * @tc.desc      Verify sha256 keeps the fixed 64 character width, stays stable across runs and differs from sha1 for the same input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncSha2560002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncSha2560002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Hash the abc sample twice to check determinism.
      const firstRun: string = await EncryptUtils.sha256('abc');
      // Hash the same sample a second time.
      const secondRun: string = await EncryptUtils.sha256('abc');
      // Log the repeated run comparison.
      logCase(TAG, 'sha256 repeat stable ' + (firstRun === secondRun));
      // Expect the two runs of the same input to be identical.
      expect(firstRun).assertEqual(secondRun);

      // Confirm the digest uses lowercase hexadecimal characters only.
      expect(isLowerHexText(firstRun)).assertTrue();
      // Hash the same sample with sha1 to compare the two algorithms.
      const sha1Digest: string = await EncryptUtils.sha1('abc');
      // Log both digest values.
      logCase(TAG, 'sha256 vs sha1 differ ' + (firstRun !== sha1Digest));
      // Expect the SHA-256 output to differ from the SHA-1 output.
      expect(firstRun === sha1Digest).assertFalse();
      // Expect the SHA-256 digest to be wider than the SHA-1 digest.
      expect(firstRun.length > sha1Digest.length).assertTrue();

      // Hash a long sentence and confirm the fixed digest width.
      const longDigest: string = await EncryptUtils.sha256(LONG_ASCII);
      // Log the long sentence digest width.
      logCase(TAG, 'sha256(long) length ' + longDigest.length);
      // Expect the long sentence to keep the fixed SHA-256 width.
      expect(longDigest.length).assertEqual(SHA256_HEX_LENGTH);

      // Hash a Chinese sample and confirm the multi byte digest width.
      const chineseDigest: string = await EncryptUtils.sha256(CHINESE_SAMPLE);
      // Log the Chinese sample digest.
      logCase(TAG, 'sha256(Chinese) length ' + chineseDigest.length);
      // Expect the multi byte input to keep the fixed SHA-256 width.
      expect(chineseDigest.length).assertEqual(SHA256_HEX_LENGTH);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1700
     * @tc.name      testEncDigestMatrix0001
     * @tc.desc      Verify the three digest helpers stay consistent across an input matrix of ASCII, symbol and multi byte samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncDigestMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncDigestMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the digest input matrix that mixes ASCII, symbols and multi byte text.
      const digestInputs: string[] = ['', ASCII_ONE, ASCII_TWO, ASCII_THREE, ASCII_SAMPLE, DIGITS_SAMPLE,
        SYMBOL_SAMPLE, LONG_ASCII, CHINESE_SAMPLE, EMOJI_SAMPLE];
      // Walk every digest input in order.
      for (let i: number = 0; i < digestInputs.length; i++) {
        // Read the current digest input.
        const input: string = digestInputs[i];
        // Compute the three digests of the current input.
        const md5Digest: string = await EncryptUtils.md5(input);
        // Compute the SHA-1 digest of the current input.
        const sha1Digest: string = await EncryptUtils.sha1(input);
        // Compute the SHA-256 digest of the current input.
        const sha256Digest: string = await EncryptUtils.sha256(input);
        // Log the three digest widths of the current input.
        logCase(TAG, 'digest matrix[' + i + '] widths ' + md5Digest.length + '/' + sha1Digest.length +
          '/' + sha256Digest.length);
        // Expect the MD5 digest to keep the fixed width.
        expect(md5Digest.length).assertEqual(MD5_HEX_LENGTH);
        // Expect the SHA-1 digest to keep the fixed width.
        expect(sha1Digest.length).assertEqual(SHA1_HEX_LENGTH);
        // Expect the SHA-256 digest to keep the fixed width.
        expect(sha256Digest.length).assertEqual(SHA256_HEX_LENGTH);
        // Expect every digest of the row to use lowercase hexadecimal characters.
        expect(isLowerHexText(md5Digest) && isLowerHexText(sha1Digest) && isLowerHexText(sha256Digest)).assertTrue();
      }

      // Confirm that two distinct inputs never share the same MD5 digest in this matrix.
      const leftDigest: string = await EncryptUtils.md5('abc');
      // Hash the neighbouring input of the matrix.
      const rightDigest: string = await EncryptUtils.md5('abd');
      // Log the neighbouring input comparison.
      logCase(TAG, 'neighbour digests differ ' + (leftDigest !== rightDigest));
      // Expect the two neighbouring inputs to hash differently.
      expect(leftDigest === rightDigest).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ENC_1800
     * @tc.name      testEncCrossMatrix0001
     * @tc.desc      Verify Base64, URL escapes and the digest helpers stay independent and stable over a shared input matrix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEncCrossMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testEncCrossMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the shared input matrix of the cross helper checks.
      const sharedInputs: string[] = [ASCII_SAMPLE, DIGITS_SAMPLE, URL_SAMPLE, URL_CHINESE, EMOJI_MIXED];
      // Walk every shared input in order.
      for (let i: number = 0; i < sharedInputs.length; i++) {
        // Read the current shared input.
        const input: string = sharedInputs[i];
        // Run the Base64 round trip of the current input.
        const base64Decoded: string = EncryptUtils.base64Decode(EncryptUtils.base64Encode(input));
        // Run the URL round trip of the current input.
        const urlDecoded: string = EncryptUtils.urlDecode(EncryptUtils.urlEncode(input));
        // Hash the Base64 text of the current input to prove it differs from the raw text digest.
        const rawDigest: string = await EncryptUtils.md5(input);
        // Hash the URL escaped text of the current input.
        const encodedDigest: string = await EncryptUtils.md5(EncryptUtils.urlEncode(input));
        // Log the cross matrix row summary.
        logCase(TAG, 'cross matrix[' + i + '] raw ' + rawDigest.length + ', escaped ' + encodedDigest.length);
        // Expect the Base64 round trip to restore the raw input.
        expect(base64Decoded).assertEqual(input);
        // Expect the URL round trip to restore the raw input.
        expect(urlDecoded).assertEqual(input);
        // Inputs without reserved characters keep their escaped form, so their digests match.
        if (EncryptUtils.urlEncode(input) !== input) {
          // Expect the digest of the raw text to differ from the digest of its escaped form.
          expect(rawDigest === encodedDigest).assertFalse();
        }
      }

      // Confirm the empty input is handled identically by every helper.
      const emptyBase64: string = EncryptUtils.base64Encode('');
      // Encode the empty input through the URL helper as well.
      const emptyUrl: string = EncryptUtils.urlEncode('');
      // Log the empty input summary.
      logCase(TAG, "empty input base64 length " + emptyBase64.length + ", url length " + emptyUrl.length);
      // Expect the empty input to encode into the empty Base64 text.
      expect(emptyBase64).assertEqual('');
      // Expect the empty input to encode into the empty URL text.
      expect(emptyUrl).assertEqual('');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { encryptUtilsTest };
