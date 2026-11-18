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

// Registers every matrix case of the EncodingBase64MatrixSuite suite.
export default function encodingBase64MatrixTest() {
  // Group the cases under the "EncodingBase64MatrixSuite" describe block.
  describe('EncodingBase64MatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'EncodingBase64MatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_B64_0100
     * @tc.name      testBase64Encode0001
     * @tc.desc      Verify base64Encode produces the standard UTF-8 Base64 text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64Encode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: base64Encode("") returns .
      logCase(TAG, "base64Encode ");
      expect(EncryptUtils.base64Encode("")).assertEqual("");
      // Vector 2: base64Encode("a") returns YQ==.
      logCase(TAG, "base64Encode a");
      expect(EncryptUtils.base64Encode("a")).assertEqual("YQ==");
      // Vector 3: base64Encode("ab") returns YWI=.
      logCase(TAG, "base64Encode ab");
      expect(EncryptUtils.base64Encode("ab")).assertEqual("YWI=");
      // Vector 4: base64Encode("abc") returns YWJj.
      logCase(TAG, "base64Encode abc");
      expect(EncryptUtils.base64Encode("abc")).assertEqual("YWJj");
      // Vector 5: base64Encode("hello") returns aGVsbG8=.
      logCase(TAG, "base64Encode hello");
      expect(EncryptUtils.base64Encode("hello")).assertEqual("aGVsbG8=");
      // Vector 6: base64Encode("Hello, World!") returns SGVsbG8sIFdvcmxkIQ==.
      logCase(TAG, "base64Encode Hello, World!");
      expect(EncryptUtils.base64Encode("Hello, World!")).assertEqual("SGVsbG8sIFdvcmxkIQ==");
      // Vector 7: base64Encode("字体资源") returns 5a2X5L2T6LWE5rqQ.
      logCase(TAG, "base64Encode 字体资源");
      expect(EncryptUtils.base64Encode("字体资源")).assertEqual("5a2X5L2T6LWE5rqQ");
      // Vector 8: base64Encode("0123456789") returns MDEyMzQ1Njc4OQ==.
      logCase(TAG, "base64Encode 0123456789");
      expect(EncryptUtils.base64Encode("0123456789")).assertEqual("MDEyMzQ1Njc4OQ==");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_B64_0200
     * @tc.name      testBase64Decode0001
     * @tc.desc      Verify base64Decode restores the original UTF-8 text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64Decode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: base64Decode() returns the original text.
      logCase(TAG, "base64Decode ");
      expect(EncryptUtils.base64Decode("")).assertEqual("");
      // Vector 2: base64Decode(YQ==) returns the original text.
      logCase(TAG, "base64Decode YQ==");
      expect(EncryptUtils.base64Decode("YQ==")).assertEqual("a");
      // Vector 3: base64Decode(YWI=) returns the original text.
      logCase(TAG, "base64Decode YWI=");
      expect(EncryptUtils.base64Decode("YWI=")).assertEqual("ab");
      // Vector 4: base64Decode(YWJj) returns the original text.
      logCase(TAG, "base64Decode YWJj");
      expect(EncryptUtils.base64Decode("YWJj")).assertEqual("abc");
      // Vector 5: base64Decode(aGVsbG8=) returns the original text.
      logCase(TAG, "base64Decode aGVsbG8=");
      expect(EncryptUtils.base64Decode("aGVsbG8=")).assertEqual("hello");
      // Vector 6: base64Decode(SGVsbG8sIFdvcmxkIQ==) returns the original text.
      logCase(TAG, "base64Decode SGVsbG8sIFdvcmxkIQ==");
      expect(EncryptUtils.base64Decode("SGVsbG8sIFdvcmxkIQ==")).assertEqual("Hello, World!");
      // Vector 7: base64Decode(5a2X5L2T6LWE5rqQ) returns the original text.
      logCase(TAG, "base64Decode 5a2X5L2T6LWE5rqQ");
      expect(EncryptUtils.base64Decode("5a2X5L2T6LWE5rqQ")).assertEqual("字体资源");
      // Vector 8: base64Decode(MDEyMzQ1Njc4OQ==) returns the original text.
      logCase(TAG, "base64Decode MDEyMzQ1Njc4OQ==");
      expect(EncryptUtils.base64Decode("MDEyMzQ1Njc4OQ==")).assertEqual("0123456789");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_B64_0300
     * @tc.name      testBase64RoundTrip0001
     * @tc.desc      Verify Base64 encode and decode form a lossless round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64RoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64RoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: Base64 round trip keeps "".
      logCase(TAG, "base64 round trip ");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode(""))).assertEqual("");
      // Vector 2: Base64 round trip keeps "a".
      logCase(TAG, "base64 round trip a");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode("a"))).assertEqual("a");
      // Vector 3: Base64 round trip keeps "ab".
      logCase(TAG, "base64 round trip ab");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode("ab"))).assertEqual("ab");
      // Vector 4: Base64 round trip keeps "abc".
      logCase(TAG, "base64 round trip abc");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode("abc"))).assertEqual("abc");
      // Vector 5: Base64 round trip keeps "hello".
      logCase(TAG, "base64 round trip hello");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode("hello"))).assertEqual("hello");
      // Vector 6: Base64 round trip keeps "Hello, World!".
      logCase(TAG, "base64 round trip Hello, World!");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode("Hello, World!"))).assertEqual("Hello, World!");
      // Vector 7: Base64 round trip keeps "字体资源".
      logCase(TAG, "base64 round trip 字体资源");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode("字体资源"))).assertEqual("字体资源");
      // Vector 8: Base64 round trip keeps "0123456789".
      logCase(TAG, "base64 round trip 0123456789");
      expect(EncryptUtils.base64Decode(EncryptUtils.base64Encode("0123456789"))).assertEqual("0123456789");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_B64_0400
     * @tc.name      testBase64Invalid0001
     * @tc.desc      Verify base64Decode returns an empty string for malformed input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Invalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64Invalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: base64Decode("!") returns an empty string.
      logCase(TAG, "base64Decode invalid !");
      expect(EncryptUtils.base64Decode("!")).assertEqual('');
      // Vector 2: base64Decode("not base64!") returns an empty string.
      logCase(TAG, "base64Decode invalid not base64!");
      expect(EncryptUtils.base64Decode("not base64!")).assertEqual('');
      // Vector 3: base64Decode("%%%%") returns an empty string.
      logCase(TAG, "base64Decode invalid %%%%");
      expect(EncryptUtils.base64Decode("%%%%")).assertEqual('');
      // Vector 4: base64Decode("a") returns an empty string.
      logCase(TAG, "base64Decode invalid a");
      expect(EncryptUtils.base64Decode("a")).assertEqual('');
      // Vector 5: base64Decode("====") returns an empty string.
      logCase(TAG, "base64Decode invalid ====");
      expect(EncryptUtils.base64Decode("====")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
