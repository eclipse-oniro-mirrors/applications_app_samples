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

// Registers every matrix case of the EncodingDigestMatrixSuite suite.
export default function encodingDigestMatrixTest() {
  // Group the cases under the "EncodingDigestMatrixSuite" describe block.
  describe('EncodingDigestMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'EncodingDigestMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DIGEST_0100
     * @tc.name      testDigestMd50001
     * @tc.desc      Verify md5 returns the expected hexadecimal digest for fixed vectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigestMd50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigestMd50001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: md5("") returns the published digest.
      logCase(TAG, "md5 ");
      expect(await EncryptUtils.md5("")).assertEqual("d41d8cd98f00b204e9800998ecf8427e");
      // Vector 2: md5("a") returns the published digest.
      logCase(TAG, "md5 a");
      expect(await EncryptUtils.md5("a")).assertEqual("0cc175b9c0f1b6a831c399e269772661");
      // Vector 3: md5("abc") returns the published digest.
      logCase(TAG, "md5 abc");
      expect(await EncryptUtils.md5("abc")).assertEqual("900150983cd24fb0d6963f7d28e17f72");
      // Vector 4: md5("message digest") returns the published digest.
      logCase(TAG, "md5 message digest");
      expect(await EncryptUtils.md5("message digest")).assertEqual("f96b697d7cb7938d525a2f31aaf161d0");
      // Vector 5: md5("abcdefghijklmnopqrstuvwxyz") returns the published digest.
      logCase(TAG, "md5 abcdefghijklmnopqrstuvwxyz");
      expect(await EncryptUtils.md5("abcdefghijklmnopqrstuvwxyz")).assertEqual("c3fcd3d76192e4007dfb496cca67e13b");
      // Vector 6: md5("字体资源") returns the published digest.
      logCase(TAG, "md5 字体资源");
      expect(await EncryptUtils.md5("字体资源")).assertEqual("722d3693fc0b9344bb46ee220beac1b6");
      // Vector 7: md5("The quick brown fox jumps over the lazy dog") returns the published digest.
      logCase(TAG, "md5 The quick brown fox jumps over the lazy dog");
      expect(await EncryptUtils.md5("The quick brown fox jumps over the lazy dog")).assertEqual("9e107d9d372bb6826bd81d3542a419d6");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DIGEST_0200
     * @tc.name      testDigestSha10001
     * @tc.desc      Verify sha1 returns the expected hexadecimal digest for fixed vectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigestSha10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigestSha10001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: sha1("") returns the published digest.
      logCase(TAG, "sha1 ");
      expect(await EncryptUtils.sha1("")).assertEqual("da39a3ee5e6b4b0d3255bfef95601890afd80709");
      // Vector 2: sha1("a") returns the published digest.
      logCase(TAG, "sha1 a");
      expect(await EncryptUtils.sha1("a")).assertEqual("86f7e437faa5a7fce15d1ddcb9eaeaea377667b8");
      // Vector 3: sha1("abc") returns the published digest.
      logCase(TAG, "sha1 abc");
      expect(await EncryptUtils.sha1("abc")).assertEqual("a9993e364706816aba3e25717850c26c9cd0d89d");
      // Vector 4: sha1("message digest") returns the published digest.
      logCase(TAG, "sha1 message digest");
      expect(await EncryptUtils.sha1("message digest")).assertEqual("c12252ceda8be8994d5fa0290a47231c1d16aae3");
      // Vector 5: sha1("abcdefghijklmnopqrstuvwxyz") returns the published digest.
      logCase(TAG, "sha1 abcdefghijklmnopqrstuvwxyz");
      expect(await EncryptUtils.sha1("abcdefghijklmnopqrstuvwxyz")).assertEqual("32d10c7b8cf96570ca04ce37f2a19d84240d3a89");
      // Vector 6: sha1("字体资源") returns the published digest.
      logCase(TAG, "sha1 字体资源");
      expect(await EncryptUtils.sha1("字体资源")).assertEqual("6418c76c0bbb0cf3a88dfe0b9b79266524927964");
      // Vector 7: sha1("The quick brown fox jumps over the lazy dog") returns the published digest.
      logCase(TAG, "sha1 The quick brown fox jumps over the lazy dog");
      expect(await EncryptUtils.sha1("The quick brown fox jumps over the lazy dog")).assertEqual("2fd4e1c67a2d28fced849ee1bb76e7391b93eb12");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DIGEST_0300
     * @tc.name      testDigestSha2560001
     * @tc.desc      Verify sha256 returns the expected hexadecimal digest for fixed vectors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigestSha2560001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigestSha2560001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: sha256("") returns the published digest.
      logCase(TAG, "sha256 ");
      expect(await EncryptUtils.sha256("")).assertEqual("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
      // Vector 2: sha256("a") returns the published digest.
      logCase(TAG, "sha256 a");
      expect(await EncryptUtils.sha256("a")).assertEqual("ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb");
      // Vector 3: sha256("abc") returns the published digest.
      logCase(TAG, "sha256 abc");
      expect(await EncryptUtils.sha256("abc")).assertEqual("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");
      // Vector 4: sha256("message digest") returns the published digest.
      logCase(TAG, "sha256 message digest");
      expect(await EncryptUtils.sha256("message digest")).assertEqual("f7846f55cf23e14eebeab5b4e1550cad5b509e3348fbc4efa3a1413d393cb650");
      // Vector 5: sha256("abcdefghijklmnopqrstuvwxyz") returns the published digest.
      logCase(TAG, "sha256 abcdefghijklmnopqrstuvwxyz");
      expect(await EncryptUtils.sha256("abcdefghijklmnopqrstuvwxyz")).assertEqual("71c480df93d6ae2f1efad1447c66c9525e316218cf51fc8d9ed832f2daf18b73");
      // Vector 6: sha256("字体资源") returns the published digest.
      logCase(TAG, "sha256 字体资源");
      expect(await EncryptUtils.sha256("字体资源")).assertEqual("1c862486e03666947c6f9012b5c7b17dd3a3fe911139630e043c84f5f9c64945");
      // Vector 7: sha256("The quick brown fox jumps over the lazy dog") returns the published digest.
      logCase(TAG, "sha256 The quick brown fox jumps over the lazy dog");
      expect(await EncryptUtils.sha256("The quick brown fox jumps over the lazy dog")).assertEqual("d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DIGEST_0400
     * @tc.name      testDigestLength0001
     * @tc.desc      Verify MD5, SHA-1 and SHA-256 emit fixed length hexadecimal text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDigestLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testDigestLength0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: digest length is stable for "abc".
      logCase(TAG, "digest length abc");
      expect((await EncryptUtils.md5("abc")).length).assertEqual(32);
      expect((await EncryptUtils.sha1("abc")).length).assertEqual(40);
      expect((await EncryptUtils.sha256("abc")).length).assertEqual(64);
      // Vector 2: digest length is stable for "字体资源".
      logCase(TAG, "digest length 字体资源");
      expect((await EncryptUtils.md5("字体资源")).length).assertEqual(32);
      expect((await EncryptUtils.sha1("字体资源")).length).assertEqual(40);
      expect((await EncryptUtils.sha256("字体资源")).length).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
