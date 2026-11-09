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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the EncryptUtils helpers under test from the library HAR package.
import { EncryptUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every matrix case of the EncodingSweepSuite suite.
export default function encodingSweepTest() {
  // Group the cases under the "EncodingSweepSuite" describe block.
  describe('EncodingSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'EncodingSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0100
     * @tc.name      testEncodingSweepBase64Encode0001
     * @tc.desc      Verify base64Encode encodes ASCII, CJK and control characters as UTF-8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepBase64Encode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEncodingSweepBase64Encode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: base64Encode("") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"\")");
      expect(EncryptUtils.base64Encode("")).assertEqual("");
      // Vector 2: base64Encode("a") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"a\")");
      expect(EncryptUtils.base64Encode("a")).assertEqual("YQ==");
      // Vector 3: base64Encode("abc") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"abc\")");
      expect(EncryptUtils.base64Encode("abc")).assertEqual("YWJj");
      // Vector 4: base64Encode("hello") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"hello\")");
      expect(EncryptUtils.base64Encode("hello")).assertEqual("aGVsbG8=");
      // Vector 5: base64Encode("Hello, World!") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"Hello, World!\")");
      expect(EncryptUtils.base64Encode("Hello, World!")).assertEqual("SGVsbG8sIFdvcmxkIQ==");
      // Vector 6: base64Encode("中文字符串") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"中文字符串\")");
      expect(EncryptUtils.base64Encode("中文字符串")).assertEqual("5Lit5paH5a2X56ym5Liy");
      // Vector 7: base64Encode("日本語テスト") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"日本語テスト\")");
      expect(EncryptUtils.base64Encode("日本語テスト")).assertEqual("5pel5pys6Kqe44OG44K544OI");
      // Vector 8: base64Encode("line1\nline2") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"line1\\nline2\")");
      expect(EncryptUtils.base64Encode("line1\nline2")).assertEqual("bGluZTEKbGluZTI=");
      // Vector 9: base64Encode("tab\tend") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"tab\\tend\")");
      expect(EncryptUtils.base64Encode("tab\tend")).assertEqual("dGFiCWVuZA==");
      // Vector 10: base64Encode("0123456789") produces the RFC 4648 text.
      logCase(TAG, "base64Encode(\"0123456789\")");
      expect(EncryptUtils.base64Encode("0123456789")).assertEqual("MDEyMzQ1Njc4OQ==");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0200
     * @tc.name      testEncodingSweepBase64Decode0001
     * @tc.desc      Verify base64Decode restores the original UTF-8 text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepBase64Decode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEncodingSweepBase64Decode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: base64Decode("") restores the original text.
      logCase(TAG, "base64Decode(\"\")");
      expect(EncryptUtils.base64Decode("")).assertEqual("");
      // Vector 2: base64Decode("YQ==") restores the original text.
      logCase(TAG, "base64Decode(\"YQ==\")");
      expect(EncryptUtils.base64Decode("YQ==")).assertEqual("a");
      // Vector 3: base64Decode("YWJj") restores the original text.
      logCase(TAG, "base64Decode(\"YWJj\")");
      expect(EncryptUtils.base64Decode("YWJj")).assertEqual("abc");
      // Vector 4: base64Decode("aGVsbG8=") restores the original text.
      logCase(TAG, "base64Decode(\"aGVsbG8=\")");
      expect(EncryptUtils.base64Decode("aGVsbG8=")).assertEqual("hello");
      // Vector 5: base64Decode("SGVsbG8sIFdvcmxkIQ==") restores the original text.
      logCase(TAG, "base64Decode(\"SGVsbG8sIFdvcmxkIQ==\")");
      expect(EncryptUtils.base64Decode("SGVsbG8sIFdvcmxkIQ==")).assertEqual("Hello, World!");
      // Vector 6: base64Decode("5Lit5paH5a2X56ym5Liy") restores the original text.
      logCase(TAG, "base64Decode(\"5Lit5paH5a2X56ym5Liy\")");
      expect(EncryptUtils.base64Decode("5Lit5paH5a2X56ym5Liy")).assertEqual("中文字符串");
      // Vector 7: base64Decode("5pel5pys6Kqe44OG44K544OI") restores the original text.
      logCase(TAG, "base64Decode(\"5pel5pys6Kqe44OG44K544OI\")");
      expect(EncryptUtils.base64Decode("5pel5pys6Kqe44OG44K544OI")).assertEqual("日本語テスト");
      // Vector 8: base64Decode("bGluZTEKbGluZTI=") restores the original text.
      logCase(TAG, "base64Decode(\"bGluZTEKbGluZTI=\")");
      expect(EncryptUtils.base64Decode("bGluZTEKbGluZTI=")).assertEqual("line1\nline2");
      // Vector 9: base64Decode("dGFiCWVuZA==") restores the original text.
      logCase(TAG, "base64Decode(\"dGFiCWVuZA==\")");
      expect(EncryptUtils.base64Decode("dGFiCWVuZA==")).assertEqual("tab\tend");
      // Vector 10: base64Decode("MDEyMzQ1Njc4OQ==") restores the original text.
      logCase(TAG, "base64Decode(\"MDEyMzQ1Njc4OQ==\")");
      expect(EncryptUtils.base64Decode("MDEyMzQ1Njc4OQ==")).assertEqual("0123456789");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0300
     * @tc.name      testEncodingSweepBase64Invalid0001
     * @tc.desc      Verify base64Decode returns an empty string for malformed input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepBase64Invalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEncodingSweepBase64Invalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: base64Decode("not base64!") reports malformed input with an empty string.
      logCase(TAG, "base64Decode(\"not base64!\")");
      expect(EncryptUtils.base64Decode("not base64!")).assertEqual("");
      // Vector 2: base64Decode("%%%%") reports malformed input with an empty string.
      logCase(TAG, "base64Decode(\"%%%%\")");
      expect(EncryptUtils.base64Decode("%%%%")).assertEqual("");
      // Vector 3: base64Decode("a") reports malformed input with an empty string.
      logCase(TAG, "base64Decode(\"a\")");
      expect(EncryptUtils.base64Decode("a")).assertEqual("");
      // Vector 4: base64Decode("====") reports malformed input with an empty string.
      logCase(TAG, "base64Decode(\"====\")");
      expect(EncryptUtils.base64Decode("====")).assertEqual("");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0400
     * @tc.name      testEncodingSweepUrlEncode0001
     * @tc.desc      Verify urlEncode percent-encodes reserved and non-ASCII characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepUrlEncode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEncodingSweepUrlEncode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: urlEncode("hello world") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"hello world\")");
      expect(EncryptUtils.urlEncode("hello world")).assertEqual("hello%20world");
      // Vector 2: urlEncode("a&b=c") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"a&b=c\")");
      expect(EncryptUtils.urlEncode("a&b=c")).assertEqual("a%26b%3Dc");
      // Vector 3: urlEncode("path/to/file") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"path/to/file\")");
      expect(EncryptUtils.urlEncode("path/to/file")).assertEqual("path%2Fto%2Ffile");
      // Vector 4: urlEncode("中文") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"中文\")");
      expect(EncryptUtils.urlEncode("中文")).assertEqual("%E4%B8%AD%E6%96%87");
      // Vector 5: urlEncode("a+b") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"a+b\")");
      expect(EncryptUtils.urlEncode("a+b")).assertEqual("a%2Bb");
      // Vector 6: urlEncode("100%") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"100%\")");
      expect(EncryptUtils.urlEncode("100%")).assertEqual("100%25");
      // Vector 7: urlEncode("?q=1#frag") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"?q=1#frag\")");
      expect(EncryptUtils.urlEncode("?q=1#frag")).assertEqual("%3Fq%3D1%23frag");
      // Vector 8: urlEncode("a'b(c)*~!") percent-encodes reserved characters.
      logCase(TAG, "urlEncode(\"a'b(c)*~!\")");
      expect(EncryptUtils.urlEncode("a'b(c)*~!")).assertEqual("a'b(c)*~!");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0500
     * @tc.name      testEncodingSweepUrlDecode0001
     * @tc.desc      Verify urlDecode restores percent-encoded UTF-8 text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepUrlDecode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEncodingSweepUrlDecode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: urlDecode("hello%20world") restores the original text.
      logCase(TAG, "urlDecode(\"hello%20world\")");
      expect(EncryptUtils.urlDecode("hello%20world")).assertEqual("hello world");
      // Vector 2: urlDecode("a%26b%3Dc") restores the original text.
      logCase(TAG, "urlDecode(\"a%26b%3Dc\")");
      expect(EncryptUtils.urlDecode("a%26b%3Dc")).assertEqual("a&b=c");
      // Vector 3: urlDecode("path%2Fto%2Ffile") restores the original text.
      logCase(TAG, "urlDecode(\"path%2Fto%2Ffile\")");
      expect(EncryptUtils.urlDecode("path%2Fto%2Ffile")).assertEqual("path/to/file");
      // Vector 4: urlDecode("%E4%B8%AD%E6%96%87") restores the original text.
      logCase(TAG, "urlDecode(\"%E4%B8%AD%E6%96%87\")");
      expect(EncryptUtils.urlDecode("%E4%B8%AD%E6%96%87")).assertEqual("中文");
      // Vector 5: urlDecode("a%2Bb") restores the original text.
      logCase(TAG, "urlDecode(\"a%2Bb\")");
      expect(EncryptUtils.urlDecode("a%2Bb")).assertEqual("a+b");
      // Vector 6: urlDecode("100%25") restores the original text.
      logCase(TAG, "urlDecode(\"100%25\")");
      expect(EncryptUtils.urlDecode("100%25")).assertEqual("100%");
      // Vector 7: urlDecode("%3Fq%3D1%23frag") restores the original text.
      logCase(TAG, "urlDecode(\"%3Fq%3D1%23frag\")");
      expect(EncryptUtils.urlDecode("%3Fq%3D1%23frag")).assertEqual("?q=1#frag");
      // Vector 8: urlDecode("a'b(c)*~!") restores the original text.
      logCase(TAG, "urlDecode(\"a'b(c)*~!\")");
      expect(EncryptUtils.urlDecode("a'b(c)*~!")).assertEqual("a'b(c)*~!");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0600
     * @tc.name      testEncodingSweepMd50001
     * @tc.desc      Verify md5 produces the expected hexadecimal digest for known vectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepMd50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEncodingSweepMd50001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: md5("") matches the published digest vector.
      logCase(TAG, "md5(\"\")");
      expect(await EncryptUtils.md5("")).assertEqual("d41d8cd98f00b204e9800998ecf8427e");
      // Vector 2: md5("abc") matches the published digest vector.
      logCase(TAG, "md5(\"abc\")");
      expect(await EncryptUtils.md5("abc")).assertEqual("900150983cd24fb0d6963f7d28e17f72");
      // Vector 3: md5("hello") matches the published digest vector.
      logCase(TAG, "md5(\"hello\")");
      expect(await EncryptUtils.md5("hello")).assertEqual("5d41402abc4b2a76b9719d911017c592");
      // Vector 4: md5("Hello, World!") matches the published digest vector.
      logCase(TAG, "md5(\"Hello, World!\")");
      expect(await EncryptUtils.md5("Hello, World!")).assertEqual("65a8e27d8879283831b664bd8b7f0ad4");
      // Vector 5: md5("中文字符串") matches the published digest vector.
      logCase(TAG, "md5(\"中文字符串\")");
      expect(await EncryptUtils.md5("中文字符串")).assertEqual("353c198568f0cd08eb215d21f45938a3");
      // Vector 6: md5("0123456789") matches the published digest vector.
      logCase(TAG, "md5(\"0123456789\")");
      expect(await EncryptUtils.md5("0123456789")).assertEqual("781e5e245d69b566979b86e28d23f2c7");
      // Vector 7: md5("The quick brown fox jumps over the lazy dog") matches the published digest vector.
      logCase(TAG, "md5(\"The quick brown fox jumps over the lazy dog\")");
      expect(await EncryptUtils.md5("The quick brown fox jumps over the lazy dog")).assertEqual("9e107d9d372bb6826bd81d3542a419d6");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0700
     * @tc.name      testEncodingSweepSha10001
     * @tc.desc      Verify sha1 produces the expected hexadecimal digest for known vectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepSha10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEncodingSweepSha10001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: sha1("") matches the published digest vector.
      logCase(TAG, "sha1(\"\")");
      expect(await EncryptUtils.sha1("")).assertEqual("da39a3ee5e6b4b0d3255bfef95601890afd80709");
      // Vector 2: sha1("abc") matches the published digest vector.
      logCase(TAG, "sha1(\"abc\")");
      expect(await EncryptUtils.sha1("abc")).assertEqual("a9993e364706816aba3e25717850c26c9cd0d89d");
      // Vector 3: sha1("hello") matches the published digest vector.
      logCase(TAG, "sha1(\"hello\")");
      expect(await EncryptUtils.sha1("hello")).assertEqual("aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d");
      // Vector 4: sha1("Hello, World!") matches the published digest vector.
      logCase(TAG, "sha1(\"Hello, World!\")");
      expect(await EncryptUtils.sha1("Hello, World!")).assertEqual("0a0a9f2a6772942557ab5355d76af442f8f65e01");
      // Vector 5: sha1("中文字符串") matches the published digest vector.
      logCase(TAG, "sha1(\"中文字符串\")");
      expect(await EncryptUtils.sha1("中文字符串")).assertEqual("c069ed6a39618717acd362292a517afc1e461591");
      // Vector 6: sha1("0123456789") matches the published digest vector.
      logCase(TAG, "sha1(\"0123456789\")");
      expect(await EncryptUtils.sha1("0123456789")).assertEqual("87acec17cd9dcd20a716cc2cf67417b71c8a7016");
      // Vector 7: sha1("The quick brown fox jumps over the lazy dog") matches the published digest vector.
      logCase(TAG, "sha1(\"The quick brown fox jumps over the lazy dog\")");
      expect(await EncryptUtils.sha1("The quick brown fox jumps over the lazy dog")).assertEqual("2fd4e1c67a2d28fced849ee1bb76e7391b93eb12");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ENC_0800
     * @tc.name      testEncodingSweepSha2560001
     * @tc.desc      Verify sha256 produces the expected hexadecimal digest for known vectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEncodingSweepSha2560001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEncodingSweepSha2560001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: sha256("") matches the published digest vector.
      logCase(TAG, "sha256(\"\")");
      expect(await EncryptUtils.sha256("")).assertEqual("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
      // Vector 2: sha256("abc") matches the published digest vector.
      logCase(TAG, "sha256(\"abc\")");
      expect(await EncryptUtils.sha256("abc")).assertEqual("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");
      // Vector 3: sha256("hello") matches the published digest vector.
      logCase(TAG, "sha256(\"hello\")");
      expect(await EncryptUtils.sha256("hello")).assertEqual("2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824");
      // Vector 4: sha256("Hello, World!") matches the published digest vector.
      logCase(TAG, "sha256(\"Hello, World!\")");
      expect(await EncryptUtils.sha256("Hello, World!")).assertEqual("dffd6021bb2bd5b0af676290809ec3a53191dd81c7f70a4b28688a362182986f");
      // Vector 5: sha256("中文字符串") matches the published digest vector.
      logCase(TAG, "sha256(\"中文字符串\")");
      expect(await EncryptUtils.sha256("中文字符串")).assertEqual("58fbba2e845c8fe79d3aa34afb576b61096b23b781a7e3abb7ecacc4db04183a");
      // Vector 6: sha256("0123456789") matches the published digest vector.
      logCase(TAG, "sha256(\"0123456789\")");
      expect(await EncryptUtils.sha256("0123456789")).assertEqual("84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882");
      // Vector 7: sha256("The quick brown fox jumps over the lazy dog") matches the published digest vector.
      logCase(TAG, "sha256(\"The quick brown fox jumps over the lazy dog\")");
      expect(await EncryptUtils.sha256("The quick brown fox jumps over the lazy dog")).assertEqual("d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
