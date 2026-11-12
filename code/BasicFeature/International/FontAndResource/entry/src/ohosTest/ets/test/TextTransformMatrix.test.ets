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
// Import the StringUtils helpers under test from the library HAR package.
import { StringUtils } from 'library';

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

// Registers every matrix case of the TextTransformMatrixSuite suite.
export default function textTransformMatrixTest() {
  // Group the cases under the "TextTransformMatrixSuite" describe block.
  describe('TextTransformMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'TextTransformMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTTR_0100
     * @tc.name      testTextReverse0001
     * @tc.desc      Verify reverse flips the character order of the input text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextReverse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextReverse0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: reverse("abc") returns "cba".
      logCase(TAG, "reverse abc");
      expect(StringUtils.reverse("abc")).assertEqual("cba");
      // Vector 2: reverse("Hello") returns "olleH".
      logCase(TAG, "reverse Hello");
      expect(StringUtils.reverse("Hello")).assertEqual("olleH");
      // Vector 3: reverse("12345") returns "54321".
      logCase(TAG, "reverse 12345");
      expect(StringUtils.reverse("12345")).assertEqual("54321");
      // Vector 4: reverse("a") returns "a".
      logCase(TAG, "reverse a");
      expect(StringUtils.reverse("a")).assertEqual("a");
      // Vector 5: reverse("") returns "".
      logCase(TAG, "reverse ");
      expect(StringUtils.reverse("")).assertEqual("");
      // Vector 6: reverse("字体资源") returns "源资体字".
      logCase(TAG, "reverse 字体资源");
      expect(StringUtils.reverse("字体资源")).assertEqual("源资体字");
      // Vector 7: reverse("A1b2C3") returns "3C2b1A".
      logCase(TAG, "reverse A1b2C3");
      expect(StringUtils.reverse("A1b2C3")).assertEqual("3C2b1A");
      // Vector 8: reverse("racecar") returns "racecar".
      logCase(TAG, "reverse racecar");
      expect(StringUtils.reverse("racecar")).assertEqual("racecar");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTTR_0200
     * @tc.name      testTextCapitalize0001
     * @tc.desc      Verify capitalize upper-cases only the first character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextCapitalize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextCapitalize0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: capitalize("abc") returns "Abc".
      logCase(TAG, "capitalize abc");
      expect(StringUtils.capitalize("abc")).assertEqual("Abc");
      // Vector 2: capitalize("ABC") returns "ABC".
      logCase(TAG, "capitalize ABC");
      expect(StringUtils.capitalize("ABC")).assertEqual("ABC");
      // Vector 3: capitalize("a") returns "A".
      logCase(TAG, "capitalize a");
      expect(StringUtils.capitalize("a")).assertEqual("A");
      // Vector 4: capitalize("") returns "".
      logCase(TAG, "capitalize ");
      expect(StringUtils.capitalize("")).assertEqual("");
      // Vector 5: capitalize("1abc") returns "1abc".
      logCase(TAG, "capitalize 1abc");
      expect(StringUtils.capitalize("1abc")).assertEqual("1abc");
      // Vector 6: capitalize("font") returns "Font".
      logCase(TAG, "capitalize font");
      expect(StringUtils.capitalize("font")).assertEqual("Font");
      // Vector 7: capitalize("字体") returns "字体".
      logCase(TAG, "capitalize 字体");
      expect(StringUtils.capitalize("字体")).assertEqual("字体");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTTR_0300
     * @tc.name      testTextKebabCase0001
     * @tc.desc      Verify toKebabCase inserts dashes before upper-case letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextKebabCase0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextKebabCase0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toKebabCase("fontResourcePage") returns "font-resource-page".
      logCase(TAG, "toKebabCase fontResourcePage");
      expect(StringUtils.toKebabCase("fontResourcePage")).assertEqual("font-resource-page");
      // Vector 2: toKebabCase("FontResource") returns "-font-resource".
      logCase(TAG, "toKebabCase FontResource");
      expect(StringUtils.toKebabCase("FontResource")).assertEqual("-font-resource");
      // Vector 3: toKebabCase("font") returns "font".
      logCase(TAG, "toKebabCase font");
      expect(StringUtils.toKebabCase("font")).assertEqual("font");
      // Vector 4: toKebabCase("aB") returns "a-b".
      logCase(TAG, "toKebabCase aB");
      expect(StringUtils.toKebabCase("aB")).assertEqual("a-b");
      // Vector 5: toKebabCase("ABC") returns "-a-b-c".
      logCase(TAG, "toKebabCase ABC");
      expect(StringUtils.toKebabCase("ABC")).assertEqual("-a-b-c");
      // Vector 6: toKebabCase("fontResourcePageTitle") returns "font-resource-page-title".
      logCase(TAG, "toKebabCase fontResourcePageTitle");
      expect(StringUtils.toKebabCase("fontResourcePageTitle")).assertEqual("font-resource-page-title");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTTR_0400
     * @tc.name      testTextCamelCase0001
     * @tc.desc      Verify toCamelCase removes separators and upper-cases the following letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextCamelCase0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextCamelCase0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toCamelCase("font-resource") returns "fontResource".
      logCase(TAG, "toCamelCase font-resource");
      expect(StringUtils.toCamelCase("font-resource")).assertEqual("fontResource");
      // Vector 2: toCamelCase("font_resource") returns "fontResource".
      logCase(TAG, "toCamelCase font_resource");
      expect(StringUtils.toCamelCase("font_resource")).assertEqual("fontResource");
      // Vector 3: toCamelCase("font") returns "font".
      logCase(TAG, "toCamelCase font");
      expect(StringUtils.toCamelCase("font")).assertEqual("font");
      // Vector 4: toCamelCase("Font-Resource") returns "fontResource".
      logCase(TAG, "toCamelCase Font-Resource");
      expect(StringUtils.toCamelCase("Font-Resource")).assertEqual("fontResource");
      // Vector 5: toCamelCase("a-b-c") returns "aBC".
      logCase(TAG, "toCamelCase a-b-c");
      expect(StringUtils.toCamelCase("a-b-c")).assertEqual("aBC");
      // Vector 6: toCamelCase("font--resource") returns "fontResource".
      logCase(TAG, "toCamelCase font--resource");
      expect(StringUtils.toCamelCase("font--resource")).assertEqual("fontResource");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTTR_0500
     * @tc.name      testTextTruncate0001
     * @tc.desc      Verify truncate appends the suffix only when the value was cut.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextTruncate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextTruncate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: truncate("abcdef", 3, "...") returns "abc...".
      logCase(TAG, "truncate abcdef");
      expect(StringUtils.truncate("abcdef", 3, "...")).assertEqual("abc...");
      // Vector 2: truncate("abc", 3, "...") returns "abc".
      logCase(TAG, "truncate abc");
      expect(StringUtils.truncate("abc", 3, "...")).assertEqual("abc");
      // Vector 3: truncate("abcdef", 0, "~") returns "~".
      logCase(TAG, "truncate abcdef");
      expect(StringUtils.truncate("abcdef", 0, "~")).assertEqual("~");
      // Vector 4: truncate("", 5, "...") returns "".
      logCase(TAG, "truncate ");
      expect(StringUtils.truncate("", 5, "...")).assertEqual("");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
