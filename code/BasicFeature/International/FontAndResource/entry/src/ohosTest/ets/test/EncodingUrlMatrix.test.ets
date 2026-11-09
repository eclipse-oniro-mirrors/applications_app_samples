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

// Registers every matrix case of the EncodingUrlMatrixSuite suite.
export default function encodingUrlMatrixTest() {
  // Group the cases under the "EncodingUrlMatrixSuite" describe block.
  describe('EncodingUrlMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'EncodingUrlMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_URL_0100
     * @tc.name      testUrlEncode0001
     * @tc.desc      Verify urlEncode percent-encodes reserved characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUrlEncode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUrlEncode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: urlEncode("") returns .
      logCase(TAG, "urlEncode ");
      expect(EncryptUtils.urlEncode("")).assertEqual("");
      // Vector 2: urlEncode("abc") returns abc.
      logCase(TAG, "urlEncode abc");
      expect(EncryptUtils.urlEncode("abc")).assertEqual("abc");
      // Vector 3: urlEncode("a b") returns a%20b.
      logCase(TAG, "urlEncode a b");
      expect(EncryptUtils.urlEncode("a b")).assertEqual("a%20b");
      // Vector 4: urlEncode("a&b") returns a%26b.
      logCase(TAG, "urlEncode a&b");
      expect(EncryptUtils.urlEncode("a&b")).assertEqual("a%26b");
      // Vector 5: urlEncode("a=b") returns a%3Db.
      logCase(TAG, "urlEncode a=b");
      expect(EncryptUtils.urlEncode("a=b")).assertEqual("a%3Db");
      // Vector 6: urlEncode("a?b") returns a%3Fb.
      logCase(TAG, "urlEncode a?b");
      expect(EncryptUtils.urlEncode("a?b")).assertEqual("a%3Fb");
      // Vector 7: urlEncode("a/b") returns a%2Fb.
      logCase(TAG, "urlEncode a/b");
      expect(EncryptUtils.urlEncode("a/b")).assertEqual("a%2Fb");
      // Vector 8: urlEncode("a#b") returns a%23b.
      logCase(TAG, "urlEncode a#b");
      expect(EncryptUtils.urlEncode("a#b")).assertEqual("a%23b");
      // Vector 9: urlEncode("字体资源") returns %E5%AD%97%E4%BD%93%E8%B5%84%E6%BA%90.
      logCase(TAG, "urlEncode 字体资源");
      expect(EncryptUtils.urlEncode("字体资源")).assertEqual("%E5%AD%97%E4%BD%93%E8%B5%84%E6%BA%90");
      // Vector 10: urlEncode("hello world!") returns hello%20world!.
      logCase(TAG, "urlEncode hello world!");
      expect(EncryptUtils.urlEncode("hello world!")).assertEqual("hello%20world!");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_URL_0200
     * @tc.name      testUrlDecode0001
     * @tc.desc      Verify urlDecode restores percent-encoded text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUrlDecode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUrlDecode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: urlDecode() returns the original text.
      logCase(TAG, "urlDecode ");
      expect(EncryptUtils.urlDecode("")).assertEqual("");
      // Vector 2: urlDecode(abc) returns the original text.
      logCase(TAG, "urlDecode abc");
      expect(EncryptUtils.urlDecode("abc")).assertEqual("abc");
      // Vector 3: urlDecode(a%20b) returns the original text.
      logCase(TAG, "urlDecode a%20b");
      expect(EncryptUtils.urlDecode("a%20b")).assertEqual("a b");
      // Vector 4: urlDecode(a%26b) returns the original text.
      logCase(TAG, "urlDecode a%26b");
      expect(EncryptUtils.urlDecode("a%26b")).assertEqual("a&b");
      // Vector 5: urlDecode(a%3Db) returns the original text.
      logCase(TAG, "urlDecode a%3Db");
      expect(EncryptUtils.urlDecode("a%3Db")).assertEqual("a=b");
      // Vector 6: urlDecode(a%3Fb) returns the original text.
      logCase(TAG, "urlDecode a%3Fb");
      expect(EncryptUtils.urlDecode("a%3Fb")).assertEqual("a?b");
      // Vector 7: urlDecode(a%2Fb) returns the original text.
      logCase(TAG, "urlDecode a%2Fb");
      expect(EncryptUtils.urlDecode("a%2Fb")).assertEqual("a/b");
      // Vector 8: urlDecode(a%23b) returns the original text.
      logCase(TAG, "urlDecode a%23b");
      expect(EncryptUtils.urlDecode("a%23b")).assertEqual("a#b");
      // Vector 9: urlDecode(%E5%AD%97%E4%BD%93%E8%B5%84%E6%BA%90) returns the original text.
      logCase(TAG, "urlDecode %E5%AD%97%E4%BD%93%E8%B5%84%E6%BA%90");
      expect(EncryptUtils.urlDecode("%E5%AD%97%E4%BD%93%E8%B5%84%E6%BA%90")).assertEqual("字体资源");
      // Vector 10: urlDecode(hello%20world!) returns the original text.
      logCase(TAG, "urlDecode hello%20world!");
      expect(EncryptUtils.urlDecode("hello%20world!")).assertEqual("hello world!");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_URL_0300
     * @tc.name      testUrlRoundTrip0001
     * @tc.desc      Verify URL encode and decode form a lossless round trip.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUrlRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUrlRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: URL round trip keeps "".
      logCase(TAG, "url round trip ");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode(""))).assertEqual("");
      // Vector 2: URL round trip keeps "abc".
      logCase(TAG, "url round trip abc");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("abc"))).assertEqual("abc");
      // Vector 3: URL round trip keeps "a b".
      logCase(TAG, "url round trip a b");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("a b"))).assertEqual("a b");
      // Vector 4: URL round trip keeps "a&b".
      logCase(TAG, "url round trip a&b");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("a&b"))).assertEqual("a&b");
      // Vector 5: URL round trip keeps "a=b".
      logCase(TAG, "url round trip a=b");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("a=b"))).assertEqual("a=b");
      // Vector 6: URL round trip keeps "a?b".
      logCase(TAG, "url round trip a?b");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("a?b"))).assertEqual("a?b");
      // Vector 7: URL round trip keeps "a/b".
      logCase(TAG, "url round trip a/b");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("a/b"))).assertEqual("a/b");
      // Vector 8: URL round trip keeps "a#b".
      logCase(TAG, "url round trip a#b");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("a#b"))).assertEqual("a#b");
      // Vector 9: URL round trip keeps "字体资源".
      logCase(TAG, "url round trip 字体资源");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("字体资源"))).assertEqual("字体资源");
      // Vector 10: URL round trip keeps "hello world!".
      logCase(TAG, "url round trip hello world!");
      expect(EncryptUtils.urlDecode(EncryptUtils.urlEncode("hello world!"))).assertEqual("hello world!");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_URL_0400
     * @tc.name      testUrlInvalid0001
     * @tc.desc      Verify urlDecode returns the original text for malformed escapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUrlInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUrlInvalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: urlDecode("%") returns the original malformed text.
      logCase(TAG, "urlDecode invalid %");
      expect(EncryptUtils.urlDecode("%")).assertEqual("%");
      // Vector 2: urlDecode("%E4") returns the original malformed text.
      logCase(TAG, "urlDecode invalid %E4");
      expect(EncryptUtils.urlDecode("%E4")).assertEqual("%E4");
      // Vector 3: urlDecode("%ZZ") returns the original malformed text.
      logCase(TAG, "urlDecode invalid %ZZ");
      expect(EncryptUtils.urlDecode("%ZZ")).assertEqual("%ZZ");
      // Vector 4: urlDecode("a%2") returns the original malformed text.
      logCase(TAG, "urlDecode invalid a%2");
      expect(EncryptUtils.urlDecode("a%2")).assertEqual("a%2");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
