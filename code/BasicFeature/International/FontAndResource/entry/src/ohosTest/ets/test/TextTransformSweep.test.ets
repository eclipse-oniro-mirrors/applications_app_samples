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

// Registers every matrix case of the TextTransformSweepSuite suite.
export default function textTransformSweepTest() {
  // Group the cases under the "TextTransformSweepSuite" describe block.
  describe('TextTransformSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'TextTransformSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_TXTT_0100
     * @tc.name      testTextTransformSweepReverse0001
     * @tc.desc      Verify reverse flips ASCII and BMP text without losing characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextTransformSweepReverse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextTransformSweepReverse0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: reverse("") reverses the characters.
      logCase(TAG, "reverse(\"\")");
      expect(StringUtils.reverse("")).assertEqual("");
      // Vector 2: reverse("a") reverses the characters.
      logCase(TAG, "reverse(\"a\")");
      expect(StringUtils.reverse("a")).assertEqual("a");
      // Vector 3: reverse("ab") reverses the characters.
      logCase(TAG, "reverse(\"ab\")");
      expect(StringUtils.reverse("ab")).assertEqual("ba");
      // Vector 4: reverse("abc") reverses the characters.
      logCase(TAG, "reverse(\"abc\")");
      expect(StringUtils.reverse("abc")).assertEqual("cba");
      // Vector 5: reverse("hello") reverses the characters.
      logCase(TAG, "reverse(\"hello\")");
      expect(StringUtils.reverse("hello")).assertEqual("olleh");
      // Vector 6: reverse("HelloWorld") reverses the characters.
      logCase(TAG, "reverse(\"HelloWorld\")");
      expect(StringUtils.reverse("HelloWorld")).assertEqual("dlroWolleH");
      // Vector 7: reverse("fontResource") reverses the characters.
      logCase(TAG, "reverse(\"fontResource\")");
      expect(StringUtils.reverse("fontResource")).assertEqual("ecruoseRtnof");
      // Vector 8: reverse("FontAndResource") reverses the characters.
      logCase(TAG, "reverse(\"FontAndResource\")");
      expect(StringUtils.reverse("FontAndResource")).assertEqual("ecruoseRdnAtnoF");
      // Vector 9: reverse("ABC") reverses the characters.
      logCase(TAG, "reverse(\"ABC\")");
      expect(StringUtils.reverse("ABC")).assertEqual("CBA");
      // Vector 10: reverse("aBcD") reverses the characters.
      logCase(TAG, "reverse(\"aBcD\")");
      expect(StringUtils.reverse("aBcD")).assertEqual("DcBa");
      // Vector 11: reverse("中文字符串") reverses the characters.
      logCase(TAG, "reverse(\"中文字符串\")");
      expect(StringUtils.reverse("中文字符串")).assertEqual("串符字文中");
      // Vector 12: reverse("日本語テスト") reverses the characters.
      logCase(TAG, "reverse(\"日本語テスト\")");
      expect(StringUtils.reverse("日本語テスト")).assertEqual("トステ語本日");
      // Vector 13: reverse("abc123XYZ") reverses the characters.
      logCase(TAG, "reverse(\"abc123XYZ\")");
      expect(StringUtils.reverse("abc123XYZ")).assertEqual("ZYX321cba");
      // Vector 14: reverse("x-y_z") reverses the characters.
      logCase(TAG, "reverse(\"x-y_z\")");
      expect(StringUtils.reverse("x-y_z")).assertEqual("z_y-x");
      // Vector 15: reverse("CamelCaseString") reverses the characters.
      logCase(TAG, "reverse(\"CamelCaseString\")");
      expect(StringUtils.reverse("CamelCaseString")).assertEqual("gnirtSesaClemaC");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_TXTT_0200
     * @tc.name      testTextTransformSweepCapitalize0001
     * @tc.desc      Verify capitalize upper-cases the first character and keeps the remainder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextTransformSweepCapitalize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextTransformSweepCapitalize0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: capitalize("a") upper-cases the first character.
      logCase(TAG, "capitalize(\"a\")");
      expect(StringUtils.capitalize("a")).assertEqual("A");
      // Vector 2: capitalize("abc") upper-cases the first character.
      logCase(TAG, "capitalize(\"abc\")");
      expect(StringUtils.capitalize("abc")).assertEqual("Abc");
      // Vector 3: capitalize("hello world") upper-cases the first character.
      logCase(TAG, "capitalize(\"hello world\")");
      expect(StringUtils.capitalize("hello world")).assertEqual("Hello world");
      // Vector 4: capitalize("font resource") upper-cases the first character.
      logCase(TAG, "capitalize(\"font resource\")");
      expect(StringUtils.capitalize("font resource")).assertEqual("Font resource");
      // Vector 5: capitalize("already") upper-cases the first character.
      logCase(TAG, "capitalize(\"already\")");
      expect(StringUtils.capitalize("already")).assertEqual("Already");
      // Vector 6: capitalize("x") upper-cases the first character.
      logCase(TAG, "capitalize(\"x\")");
      expect(StringUtils.capitalize("x")).assertEqual("X");
      // Vector 7: capitalize("Hello") upper-cases the first character.
      logCase(TAG, "capitalize(\"Hello\")");
      expect(StringUtils.capitalize("Hello")).assertEqual("Hello");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_TXTT_0300
     * @tc.name      testTextTransformSweepKebab0001
     * @tc.desc      Verify toKebabCase inserts a dash before every upper-case letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextTransformSweepKebab0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextTransformSweepKebab0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toKebabCase("fontResource") converts the identifier.
      logCase(TAG, "toKebabCase(\"fontResource\")");
      expect(StringUtils.toKebabCase("fontResource")).assertEqual("font-resource");
      // Vector 2: toKebabCase("FontAndResource") converts the identifier.
      logCase(TAG, "toKebabCase(\"FontAndResource\")");
      expect(StringUtils.toKebabCase("FontAndResource")).assertEqual("-font-and-resource");
      // Vector 3: toKebabCase("ABC") converts the identifier.
      logCase(TAG, "toKebabCase(\"ABC\")");
      expect(StringUtils.toKebabCase("ABC")).assertEqual("-a-b-c");
      // Vector 4: toKebabCase("aBcD") converts the identifier.
      logCase(TAG, "toKebabCase(\"aBcD\")");
      expect(StringUtils.toKebabCase("aBcD")).assertEqual("a-bc-d");
      // Vector 5: toKebabCase("camelCase") converts the identifier.
      logCase(TAG, "toKebabCase(\"camelCase\")");
      expect(StringUtils.toKebabCase("camelCase")).assertEqual("camel-case");
      // Vector 6: toKebabCase("kebab-case") converts the identifier.
      logCase(TAG, "toKebabCase(\"kebab-case\")");
      expect(StringUtils.toKebabCase("kebab-case")).assertEqual("kebab-case");
      // Vector 7: toKebabCase("snake_case") converts the identifier.
      logCase(TAG, "toKebabCase(\"snake_case\")");
      expect(StringUtils.toKebabCase("snake_case")).assertEqual("snake_case");
      // Vector 8: toKebabCase("x") converts the identifier.
      logCase(TAG, "toKebabCase(\"x\")");
      expect(StringUtils.toKebabCase("x")).assertEqual("x");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_TXTT_0400
     * @tc.name      testTextTransformSweepCamel0001
     * @tc.desc      Verify toCamelCase drops separators and upper-cases the following character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextTransformSweepCamel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextTransformSweepCamel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toCamelCase("font-resource") converts the identifier.
      logCase(TAG, "toCamelCase(\"font-resource\")");
      expect(StringUtils.toCamelCase("font-resource")).assertEqual("fontResource");
      // Vector 2: toCamelCase("font_resource") converts the identifier.
      logCase(TAG, "toCamelCase(\"font_resource\")");
      expect(StringUtils.toCamelCase("font_resource")).assertEqual("fontResource");
      // Vector 3: toCamelCase("FontResource") converts the identifier.
      logCase(TAG, "toCamelCase(\"FontResource\")");
      expect(StringUtils.toCamelCase("FontResource")).assertEqual("fontResource");
      // Vector 4: toCamelCase("alreadyCamel") converts the identifier.
      logCase(TAG, "toCamelCase(\"alreadyCamel\")");
      expect(StringUtils.toCamelCase("alreadyCamel")).assertEqual("alreadyCamel");
      // Vector 5: toCamelCase("a-b_c") converts the identifier.
      logCase(TAG, "toCamelCase(\"a-b_c\")");
      expect(StringUtils.toCamelCase("a-b_c")).assertEqual("aBC");
      // Vector 6: toCamelCase("x") converts the identifier.
      logCase(TAG, "toCamelCase(\"x\")");
      expect(StringUtils.toCamelCase("x")).assertEqual("x");
      // Vector 7: toCamelCase("ABC") converts the identifier.
      logCase(TAG, "toCamelCase(\"ABC\")");
      expect(StringUtils.toCamelCase("ABC")).assertEqual("aBC");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
