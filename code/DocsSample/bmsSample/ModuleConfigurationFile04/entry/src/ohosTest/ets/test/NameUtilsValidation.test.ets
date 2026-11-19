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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { TestLog } from '../harness/TestLog';
import { NameUtils } from '../harness/NameUtils';
export default function NameUtilsValidationTest(): void {
  describe('NameUtilsValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3700
     * @tc.name      testNameUtilsIsBlankEmpty
     * @tc.desc      Checks that an empty string is blank.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsIsBlankEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsIsBlankEmpty', 'case begin', 'isblankempty name helper check');
      TestLog.step('testNameUtilsIsBlankEmpty', 'isblankempty name helper check');
      const actual: boolean = NameUtils.isBlank('');
      TestLog.text('testNameUtilsIsBlankEmpty', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsIsBlankEmpty', 'case end', 'isblankempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3701
     * @tc.name      testNameUtilsIsBlankSpaces
     * @tc.desc      Checks that a whitespace string is blank.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsIsBlankSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsIsBlankSpaces', 'case begin', 'isblankspaces name helper check');
      TestLog.step('testNameUtilsIsBlankSpaces', 'isblankspaces name helper check');
      const actual: boolean = NameUtils.isBlank('   ');
      TestLog.text('testNameUtilsIsBlankSpaces', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsIsBlankSpaces', 'case end', 'isblankspaces name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3702
     * @tc.name      testNameUtilsIsBlankText
     * @tc.desc      Checks that a non empty string is not blank.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsIsBlankText',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsIsBlankText', 'case begin', 'isblanktext name helper check');
      TestLog.step('testNameUtilsIsBlankText', 'isblanktext name helper check');
      const actual: boolean = NameUtils.isBlank('entry');
      TestLog.text('testNameUtilsIsBlankText', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsIsBlankText', 'case end', 'isblanktext name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3703
     * @tc.name      testNameUtilsIsBlankTab
     * @tc.desc      Checks that a tab string is blank.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsIsBlankTab',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsIsBlankTab', 'case begin', 'isblanktab name helper check');
      TestLog.step('testNameUtilsIsBlankTab', 'isblanktab name helper check');
      const actual: boolean = NameUtils.isBlank('\t');
      TestLog.text('testNameUtilsIsBlankTab', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsIsBlankTab', 'case end', 'isblanktab name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3704
     * @tc.name      testNameUtilsPascalEntry
     * @tc.desc      Checks that an upper camel name is pascal case.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsPascalEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsPascalEntry', 'case begin', 'pascalentry name helper check');
      TestLog.step('testNameUtilsPascalEntry', 'pascalentry name helper check');
      const actual: boolean = NameUtils.isPascalCase('EntryAbility');
      TestLog.text('testNameUtilsPascalEntry', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsPascalEntry', 'case end', 'pascalentry name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3705
     * @tc.name      testNameUtilsPascalShort
     * @tc.desc      Checks that a single upper letter is pascal case.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsPascalShort',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsPascalShort', 'case begin', 'pascalshort name helper check');
      TestLog.step('testNameUtilsPascalShort', 'pascalshort name helper check');
      const actual: boolean = NameUtils.isPascalCase('A');
      TestLog.text('testNameUtilsPascalShort', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsPascalShort', 'case end', 'pascalshort name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3706
     * @tc.name      testNameUtilsPascalDigit
     * @tc.desc      Checks that a pascal name with digits is pascal case.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsPascalDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsPascalDigit', 'case begin', 'pascaldigit name helper check');
      TestLog.step('testNameUtilsPascalDigit', 'pascaldigit name helper check');
      const actual: boolean = NameUtils.isPascalCase('Entry2');
      TestLog.text('testNameUtilsPascalDigit', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsPascalDigit', 'case end', 'pascaldigit name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3707
     * @tc.name      testNameUtilsPascalLower
     * @tc.desc      Checks that a lower camel name is not pascal case.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsPascalLower',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsPascalLower', 'case begin', 'pascallower name helper check');
      TestLog.step('testNameUtilsPascalLower', 'pascallower name helper check');
      const actual: boolean = NameUtils.isPascalCase('entryAbility');
      TestLog.text('testNameUtilsPascalLower', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsPascalLower', 'case end', 'pascallower name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3708
     * @tc.name      testNameUtilsPascalDigitFirst
     * @tc.desc      Checks that a name starting with a digit is not pascal case.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsPascalDigitFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsPascalDigitFirst', 'case begin', 'pascaldigitfirst name helper check');
      TestLog.step('testNameUtilsPascalDigitFirst', 'pascaldigitfirst name helper check');
      const actual: boolean = NameUtils.isPascalCase('2Entry');
      TestLog.text('testNameUtilsPascalDigitFirst', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsPascalDigitFirst', 'case end', 'pascaldigitfirst name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3709
     * @tc.name      testNameUtilsPascalEmpty
     * @tc.desc      Checks that an empty name is not pascal case.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsPascalEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsPascalEmpty', 'case begin', 'pascalempty name helper check');
      TestLog.step('testNameUtilsPascalEmpty', 'pascalempty name helper check');
      const actual: boolean = NameUtils.isPascalCase('');
      TestLog.text('testNameUtilsPascalEmpty', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsPascalEmpty', 'case end', 'pascalempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3710
     * @tc.name      testNameUtilsPascalUnderscore
     * @tc.desc      Checks that an underscored name is not pascal case.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsPascalUnderscore',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsPascalUnderscore', 'case begin', 'pascalunderscore name helper check');
      TestLog.step('testNameUtilsPascalUnderscore', 'pascalunderscore name helper check');
      const actual: boolean = NameUtils.isPascalCase('Entry_Ability');
      TestLog.text('testNameUtilsPascalUnderscore', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsPascalUnderscore', 'case end', 'pascalunderscore name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3711
     * @tc.name      testNameUtilsLowerSnakeEntry
     * @tc.desc      Checks that a lower snake name is lower snake.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerSnakeEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerSnakeEntry', 'case begin', 'lowersnakeentry name helper check');
      TestLog.step('testNameUtilsLowerSnakeEntry', 'lowersnakeentry name helper check');
      const actual: boolean = NameUtils.isLowerSnake('entry');
      TestLog.text('testNameUtilsLowerSnakeEntry', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsLowerSnakeEntry', 'case end', 'lowersnakeentry name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3712
     * @tc.name      testNameUtilsLowerSnakeDigit
     * @tc.desc      Checks that a lower snake name with digits is lower snake.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerSnakeDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerSnakeDigit', 'case begin', 'lowersnakedigit name helper check');
      TestLog.step('testNameUtilsLowerSnakeDigit', 'lowersnakedigit name helper check');
      const actual: boolean = NameUtils.isLowerSnake('entry_2');
      TestLog.text('testNameUtilsLowerSnakeDigit', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsLowerSnakeDigit', 'case end', 'lowersnakedigit name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3713
     * @tc.name      testNameUtilsLowerSnakeUpper
     * @tc.desc      Checks that an upper name is not lower snake.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerSnakeUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerSnakeUpper', 'case begin', 'lowersnakeupper name helper check');
      TestLog.step('testNameUtilsLowerSnakeUpper', 'lowersnakeupper name helper check');
      const actual: boolean = NameUtils.isLowerSnake('Entry');
      TestLog.text('testNameUtilsLowerSnakeUpper', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsLowerSnakeUpper', 'case end', 'lowersnakeupper name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3714
     * @tc.name      testNameUtilsLowerSnakeDigitFirst
     * @tc.desc      Checks that a name starting with a digit is not lower snake.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerSnakeDigitFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerSnakeDigitFirst', 'case begin', 'lowersnakedigitfirst name helper check');
      TestLog.step('testNameUtilsLowerSnakeDigitFirst', 'lowersnakedigitfirst name helper check');
      const actual: boolean = NameUtils.isLowerSnake('1entry');
      TestLog.text('testNameUtilsLowerSnakeDigitFirst', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsLowerSnakeDigitFirst', 'case end', 'lowersnakedigitfirst name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3715
     * @tc.name      testNameUtilsLowerSnakeHyphen
     * @tc.desc      Checks that a hyphenated name is not lower snake.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerSnakeHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerSnakeHyphen', 'case begin', 'lowersnakehyphen name helper check');
      TestLog.step('testNameUtilsLowerSnakeHyphen', 'lowersnakehyphen name helper check');
      const actual: boolean = NameUtils.isLowerSnake('en-try');
      TestLog.text('testNameUtilsLowerSnakeHyphen', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsLowerSnakeHyphen', 'case end', 'lowersnakehyphen name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3716
     * @tc.name      testNameUtilsLowerSnakeEmpty
     * @tc.desc      Checks that an empty name is not lower snake.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerSnakeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerSnakeEmpty', 'case begin', 'lowersnakeempty name helper check');
      TestLog.step('testNameUtilsLowerSnakeEmpty', 'lowersnakeempty name helper check');
      const actual: boolean = NameUtils.isLowerSnake('');
      TestLog.text('testNameUtilsLowerSnakeEmpty', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsLowerSnakeEmpty', 'case end', 'lowersnakeempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3717
     * @tc.name      testNameUtilsSegmentSafeWord
     * @tc.desc      Checks that a plain word is segment safe.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSegmentSafeWord',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSegmentSafeWord', 'case begin', 'segmentsafeword name helper check');
      TestLog.step('testNameUtilsSegmentSafeWord', 'segmentsafeword name helper check');
      const actual: boolean = NameUtils.isSegmentSafe('main_pages');
      TestLog.text('testNameUtilsSegmentSafeWord', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsSegmentSafeWord', 'case end', 'segmentsafeword name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3718
     * @tc.name      testNameUtilsSegmentSafeUpper
     * @tc.desc      Checks that an upper word is segment safe.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSegmentSafeUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSegmentSafeUpper', 'case begin', 'segmentsafeupper name helper check');
      TestLog.step('testNameUtilsSegmentSafeUpper', 'segmentsafeupper name helper check');
      const actual: boolean = NameUtils.isSegmentSafe('MainPages');
      TestLog.text('testNameUtilsSegmentSafeUpper', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsSegmentSafeUpper', 'case end', 'segmentsafeupper name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3719
     * @tc.name      testNameUtilsSegmentSafeHyphen
     * @tc.desc      Checks that a hyphenated word is not segment safe.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSegmentSafeHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSegmentSafeHyphen', 'case begin', 'segmentsafehyphen name helper check');
      TestLog.step('testNameUtilsSegmentSafeHyphen', 'segmentsafehyphen name helper check');
      const actual: boolean = NameUtils.isSegmentSafe('main-pages');
      TestLog.text('testNameUtilsSegmentSafeHyphen', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsSegmentSafeHyphen', 'case end', 'segmentsafehyphen name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3720
     * @tc.name      testNameUtilsSegmentSafeDot
     * @tc.desc      Checks that a dotted word is not segment safe.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSegmentSafeDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSegmentSafeDot', 'case begin', 'segmentsafedot name helper check');
      TestLog.step('testNameUtilsSegmentSafeDot', 'segmentsafedot name helper check');
      const actual: boolean = NameUtils.isSegmentSafe('main.pages');
      TestLog.text('testNameUtilsSegmentSafeDot', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsSegmentSafeDot', 'case end', 'segmentsafedot name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3721
     * @tc.name      testNameUtilsSegmentSafeEmpty
     * @tc.desc      Checks that an empty word is not segment safe.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSegmentSafeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSegmentSafeEmpty', 'case begin', 'segmentsafeempty name helper check');
      TestLog.step('testNameUtilsSegmentSafeEmpty', 'segmentsafeempty name helper check');
      const actual: boolean = NameUtils.isSegmentSafe('');
      TestLog.text('testNameUtilsSegmentSafeEmpty', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsSegmentSafeEmpty', 'case end', 'segmentsafeempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3722
     * @tc.name      testNameUtilsBundleShapeSample
     * @tc.desc      Checks that the sample bundle name has a bundle shape.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsBundleShapeSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsBundleShapeSample', 'case begin', 'bundleshapesample name helper check');
      TestLog.step('testNameUtilsBundleShapeSample', 'bundleshapesample name helper check');
      const actual: boolean = NameUtils.isBundleNameShape('com.example.myapplication');
      TestLog.text('testNameUtilsBundleShapeSample', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsBundleShapeSample', 'case end', 'bundleshapesample name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3723
     * @tc.name      testNameUtilsBundleShapeShort
     * @tc.desc      Checks that a two segment bundle name has a bundle shape.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsBundleShapeShort',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsBundleShapeShort', 'case begin', 'bundleshapeshort name helper check');
      TestLog.step('testNameUtilsBundleShapeShort', 'bundleshapeshort name helper check');
      const actual: boolean = NameUtils.isBundleNameShape('com.example');
      TestLog.text('testNameUtilsBundleShapeShort', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsBundleShapeShort', 'case end', 'bundleshapeshort name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3724
     * @tc.name      testNameUtilsBundleShapeNoDot
     * @tc.desc      Checks that a bundle name without dots has no bundle shape.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsBundleShapeNoDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsBundleShapeNoDot', 'case begin', 'bundleshapenodot name helper check');
      TestLog.step('testNameUtilsBundleShapeNoDot', 'bundleshapenodot name helper check');
      const actual: boolean = NameUtils.isBundleNameShape('ohosapp');
      TestLog.text('testNameUtilsBundleShapeNoDot', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsBundleShapeNoDot', 'case end', 'bundleshapenodot name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3725
     * @tc.name      testNameUtilsBundleShapeEmptySegment
     * @tc.desc      Checks that a bundle name with an empty segment has no bundle shape.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsBundleShapeEmptySegment',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsBundleShapeEmptySegment', 'case begin', 'bundleshapeemptysegment name helper check');
      TestLog.step('testNameUtilsBundleShapeEmptySegment', 'bundleshapeemptysegment name helper check');
      const actual: boolean = NameUtils.isBundleNameShape('ohos..app');
      TestLog.text('testNameUtilsBundleShapeEmptySegment', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsBundleShapeEmptySegment', 'case end', 'bundleshapeemptysegment name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3726
     * @tc.name      testNameUtilsBundleShapeUpper
     * @tc.desc      Checks that an upper case bundle name has no bundle shape.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsBundleShapeUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsBundleShapeUpper', 'case begin', 'bundleshapeupper name helper check');
      TestLog.step('testNameUtilsBundleShapeUpper', 'bundleshapeupper name helper check');
      const actual: boolean = NameUtils.isBundleNameShape('Ohos.app');
      TestLog.text('testNameUtilsBundleShapeUpper', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsBundleShapeUpper', 'case end', 'bundleshapeupper name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3727
     * @tc.name      testNameUtilsHasUppercaseYes
     * @tc.desc      Checks that a mixed case value contains uppercase.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsHasUppercaseYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsHasUppercaseYes', 'case begin', 'hasuppercaseyes name helper check');
      TestLog.step('testNameUtilsHasUppercaseYes', 'hasuppercaseyes name helper check');
      const actual: boolean = NameUtils.hasUppercase('aBc');
      TestLog.text('testNameUtilsHasUppercaseYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsHasUppercaseYes', 'case end', 'hasuppercaseyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3728
     * @tc.name      testNameUtilsHasUppercaseNo
     * @tc.desc      Checks that a lower case value contains no uppercase.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsHasUppercaseNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsHasUppercaseNo', 'case begin', 'hasuppercaseno name helper check');
      TestLog.step('testNameUtilsHasUppercaseNo', 'hasuppercaseno name helper check');
      const actual: boolean = NameUtils.hasUppercase('abc1');
      TestLog.text('testNameUtilsHasUppercaseNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsHasUppercaseNo', 'case end', 'hasuppercaseno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3729
     * @tc.name      testNameUtilsWhitespaceYes
     * @tc.desc      Checks that a value with an inner space contains whitespace.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsWhitespaceYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsWhitespaceYes', 'case begin', 'whitespaceyes name helper check');
      TestLog.step('testNameUtilsWhitespaceYes', 'whitespaceyes name helper check');
      const actual: boolean = NameUtils.hasWhitespace('a b');
      TestLog.text('testNameUtilsWhitespaceYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsWhitespaceYes', 'case end', 'whitespaceyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3730
     * @tc.name      testNameUtilsWhitespaceTab
     * @tc.desc      Checks that a value with a tab contains whitespace.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsWhitespaceTab',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsWhitespaceTab', 'case begin', 'whitespacetab name helper check');
      TestLog.step('testNameUtilsWhitespaceTab', 'whitespacetab name helper check');
      const actual: boolean = NameUtils.hasWhitespace('a\tb');
      TestLog.text('testNameUtilsWhitespaceTab', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsWhitespaceTab', 'case end', 'whitespacetab name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3731
     * @tc.name      testNameUtilsWhitespaceNo
     * @tc.desc      Checks that a plain value contains no whitespace.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsWhitespaceNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsWhitespaceNo', 'case begin', 'whitespaceno name helper check');
      TestLog.step('testNameUtilsWhitespaceNo', 'whitespaceno name helper check');
      const actual: boolean = NameUtils.hasWhitespace('entry');
      TestLog.text('testNameUtilsWhitespaceNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsWhitespaceNo', 'case end', 'whitespaceno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3732
     * @tc.name      testNameUtilsStartsWithDigitYes
     * @tc.desc      Checks that a value starting with a digit is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsStartsWithDigitYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsStartsWithDigitYes', 'case begin', 'startswithdigityes name helper check');
      TestLog.step('testNameUtilsStartsWithDigitYes', 'startswithdigityes name helper check');
      const actual: boolean = NameUtils.startsWithDigit('1a');
      TestLog.text('testNameUtilsStartsWithDigitYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsStartsWithDigitYes', 'case end', 'startswithdigityes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3733
     * @tc.name      testNameUtilsStartsWithDigitNo
     * @tc.desc      Checks that a value starting with a letter is not detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsStartsWithDigitNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsStartsWithDigitNo', 'case begin', 'startswithdigitno name helper check');
      TestLog.step('testNameUtilsStartsWithDigitNo', 'startswithdigitno name helper check');
      const actual: boolean = NameUtils.startsWithDigit('a1');
      TestLog.text('testNameUtilsStartsWithDigitNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsStartsWithDigitNo', 'case end', 'startswithdigitno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3734
     * @tc.name      testNameUtilsStartsWithDigitEmpty
     * @tc.desc      Checks that an empty value does not start with a digit.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsStartsWithDigitEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsStartsWithDigitEmpty', 'case begin', 'startswithdigitempty name helper check');
      TestLog.step('testNameUtilsStartsWithDigitEmpty', 'startswithdigitempty name helper check');
      const actual: boolean = NameUtils.startsWithDigit('');
      TestLog.text('testNameUtilsStartsWithDigitEmpty', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsStartsWithDigitEmpty', 'case end', 'startswithdigitempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3735
     * @tc.name      testNameUtilsStartsWithYes
     * @tc.desc      Checks that a value starting with the marker is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsStartsWithYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsStartsWithYes', 'case begin', 'startswithyes name helper check');
      TestLog.step('testNameUtilsStartsWithYes', 'startswithyes name helper check');
      const actual: boolean = NameUtils.startsWith('$string:app', '$string');
      TestLog.text('testNameUtilsStartsWithYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsStartsWithYes', 'case end', 'startswithyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3736
     * @tc.name      testNameUtilsStartsWithNo
     * @tc.desc      Checks that a value starting with another marker is not detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsStartsWithNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsStartsWithNo', 'case begin', 'startswithno name helper check');
      TestLog.step('testNameUtilsStartsWithNo', 'startswithno name helper check');
      const actual: boolean = NameUtils.startsWith('$media:icon', '$string');
      TestLog.text('testNameUtilsStartsWithNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsStartsWithNo', 'case end', 'startswithno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3737
     * @tc.name      testNameUtilsEndsWithYes
     * @tc.desc      Checks that a value ending with the marker is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsEndsWithYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsEndsWithYes', 'case begin', 'endswithyes name helper check');
      TestLog.step('testNameUtilsEndsWithYes', 'endswithyes name helper check');
      const actual: boolean = NameUtils.endsWith('Entry.ets', '.ets');
      TestLog.text('testNameUtilsEndsWithYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsEndsWithYes', 'case end', 'endswithyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3738
     * @tc.name      testNameUtilsEndsWithNo
     * @tc.desc      Checks that a value ending with another marker is not detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsEndsWithNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsEndsWithNo', 'case begin', 'endswithno name helper check');
      TestLog.step('testNameUtilsEndsWithNo', 'endswithno name helper check');
      const actual: boolean = NameUtils.endsWith('Entry.ets', '.ts');
      TestLog.text('testNameUtilsEndsWithNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsEndsWithNo', 'case end', 'endswithno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3739
     * @tc.name      testNameUtilsEndsWithShort
     * @tc.desc      Checks that a value shorter than the marker does not end with it.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsEndsWithShort',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsEndsWithShort', 'case begin', 'endswithshort name helper check');
      TestLog.step('testNameUtilsEndsWithShort', 'endswithshort name helper check');
      const actual: boolean = NameUtils.endsWith('a', '.ets');
      TestLog.text('testNameUtilsEndsWithShort', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsEndsWithShort', 'case end', 'endswithshort name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3740
     * @tc.name      testNameUtilsContainsYes
     * @tc.desc      Checks that a value containing the fragment is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsContainsYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsContainsYes', 'case begin', 'containsyes name helper check');
      TestLog.step('testNameUtilsContainsYes', 'containsyes name helper check');
      const actual: boolean = NameUtils.contains('a..b', '..');
      TestLog.text('testNameUtilsContainsYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsContainsYes', 'case end', 'containsyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3741
     * @tc.name      testNameUtilsContainsNo
     * @tc.desc      Checks that a value without the fragment is not detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsContainsNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsContainsNo', 'case begin', 'containsno name helper check');
      TestLog.step('testNameUtilsContainsNo', 'containsno name helper check');
      const actual: boolean = NameUtils.contains('a.b', '..');
      TestLog.text('testNameUtilsContainsNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsContainsNo', 'case end', 'containsno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3742
     * @tc.name      testNameUtilsCountOccurrencesTwo
     * @tc.desc      Checks that two non overlapping fragments are counted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsCountOccurrencesTwo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsCountOccurrencesTwo', 'case begin', 'countoccurrencestwo name helper check');
      TestLog.step('testNameUtilsCountOccurrencesTwo', 'countoccurrencestwo name helper check');
      const actual: number = NameUtils.countOccurrences('aaaa', 'aa');
      TestLog.text('testNameUtilsCountOccurrencesTwo', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testNameUtilsCountOccurrencesTwo', 'case end', 'countoccurrencestwo name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3743
     * @tc.name      testNameUtilsCountOccurrencesNone
     * @tc.desc      Checks that zero fragments are counted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsCountOccurrencesNone',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsCountOccurrencesNone', 'case begin', 'countoccurrencesnone name helper check');
      TestLog.step('testNameUtilsCountOccurrencesNone', 'countoccurrencesnone name helper check');
      const actual: number = NameUtils.countOccurrences('abcd', 'xy');
      TestLog.text('testNameUtilsCountOccurrencesNone', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testNameUtilsCountOccurrencesNone', 'case end', 'countoccurrencesnone name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3744
     * @tc.name      testNameUtilsCountOccurrencesEmpty
     * @tc.desc      Checks that an empty fragment is never counted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsCountOccurrencesEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsCountOccurrencesEmpty', 'case begin', 'countoccurrencesempty name helper check');
      TestLog.step('testNameUtilsCountOccurrencesEmpty', 'countoccurrencesempty name helper check');
      const actual: number = NameUtils.countOccurrences('abc', '');
      TestLog.text('testNameUtilsCountOccurrencesEmpty', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testNameUtilsCountOccurrencesEmpty', 'case end', 'countoccurrencesempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3745
     * @tc.name      testNameUtilsSplitSegmentsDropsEmpty
     * @tc.desc      Checks that empty segments are dropped.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSplitSegmentsDropsEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSplitSegmentsDropsEmpty', 'case begin', 'splitsegmentsdropsempty name helper check');
      TestLog.step('testNameUtilsSplitSegmentsDropsEmpty', 'splitsegmentsdropsempty name helper check');
      const actual: number = NameUtils.splitSegments('a..b', '.').length;
      TestLog.text('testNameUtilsSplitSegmentsDropsEmpty', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testNameUtilsSplitSegmentsDropsEmpty', 'case end', 'splitsegmentsdropsempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3746
     * @tc.name      testNameUtilsSplitRawKeepsEmpty
     * @tc.desc      Checks that empty segments are kept.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSplitRawKeepsEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSplitRawKeepsEmpty', 'case begin', 'splitrawkeepsempty name helper check');
      TestLog.step('testNameUtilsSplitRawKeepsEmpty', 'splitrawkeepsempty name helper check');
      const actual: number = NameUtils.splitRaw('a..b', '.').length;
      TestLog.text('testNameUtilsSplitRawKeepsEmpty', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testNameUtilsSplitRawKeepsEmpty', 'case end', 'splitrawkeepsempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3747
     * @tc.name      testNameUtilsJoinSegments
     * @tc.desc      Checks that segments are joined with the separator.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsJoinSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsJoinSegments', 'case begin', 'joinsegments name helper check');
      TestLog.step('testNameUtilsJoinSegments', 'joinsegments name helper check');
      const actual: string = NameUtils.joinSegments(['a', 'b', 'c'], '.');
      TestLog.text('testNameUtilsJoinSegments', 'actual value', String(actual));
      expect(actual).assertEqual('a.b.c');
      TestLog.text('testNameUtilsJoinSegments', 'case end', 'joinsegments name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3748
     * @tc.name      testNameUtilsReservedApp
     * @tc.desc      Checks that the module name app is reserved.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsReservedApp',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsReservedApp', 'case begin', 'reservedapp name helper check');
      TestLog.step('testNameUtilsReservedApp', 'reservedapp name helper check');
      const actual: boolean = NameUtils.isReservedModuleName('app');
      TestLog.text('testNameUtilsReservedApp', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsReservedApp', 'case end', 'reservedapp name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3749
     * @tc.name      testNameUtilsReservedSystem
     * @tc.desc      Checks that the module name system is reserved.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsReservedSystem',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsReservedSystem', 'case begin', 'reservedsystem name helper check');
      TestLog.step('testNameUtilsReservedSystem', 'reservedsystem name helper check');
      const actual: boolean = NameUtils.isReservedModuleName('system');
      TestLog.text('testNameUtilsReservedSystem', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsReservedSystem', 'case end', 'reservedsystem name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3750
     * @tc.name      testNameUtilsReservedEntry
     * @tc.desc      Checks that the module name entry is not reserved.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsReservedEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsReservedEntry', 'case begin', 'reservedentry name helper check');
      TestLog.step('testNameUtilsReservedEntry', 'reservedentry name helper check');
      const actual: boolean = NameUtils.isReservedModuleName('entry');
      TestLog.text('testNameUtilsReservedEntry', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsReservedEntry', 'case end', 'reservedentry name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3751
     * @tc.name      testNameUtilsCapitalize
     * @tc.desc      Checks that the first letter is capitalized.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsCapitalize',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsCapitalize', 'case begin', 'capitalize name helper check');
      TestLog.step('testNameUtilsCapitalize', 'capitalize name helper check');
      const actual: string = NameUtils.capitalizeFirst('entry');
      TestLog.text('testNameUtilsCapitalize', 'actual value', String(actual));
      expect(actual).assertEqual('Entry');
      TestLog.text('testNameUtilsCapitalize', 'case end', 'capitalize name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3752
     * @tc.name      testNameUtilsCapitalizeEmpty
     * @tc.desc      Checks that an empty value stays empty when capitalized.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsCapitalizeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsCapitalizeEmpty', 'case begin', 'capitalizeempty name helper check');
      TestLog.step('testNameUtilsCapitalizeEmpty', 'capitalizeempty name helper check');
      const actual: string = NameUtils.capitalizeFirst('');
      TestLog.text('testNameUtilsCapitalizeEmpty', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testNameUtilsCapitalizeEmpty', 'case end', 'capitalizeempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3753
     * @tc.name      testNameUtilsLowerFirst
     * @tc.desc      Checks that the first letter is lower cased.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerFirst', 'case begin', 'lowerfirst name helper check');
      TestLog.step('testNameUtilsLowerFirst', 'lowerfirst name helper check');
      const actual: string = NameUtils.lowerFirst('Entry');
      TestLog.text('testNameUtilsLowerFirst', 'actual value', String(actual));
      expect(actual).assertEqual('entry');
      TestLog.text('testNameUtilsLowerFirst', 'case end', 'lowerfirst name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3754
     * @tc.name      testNameUtilsLowerFirstEmpty
     * @tc.desc      Checks that an empty value stays empty when lower cased.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsLowerFirstEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsLowerFirstEmpty', 'case begin', 'lowerfirstempty name helper check');
      TestLog.step('testNameUtilsLowerFirstEmpty', 'lowerfirstempty name helper check');
      const actual: string = NameUtils.lowerFirst('');
      TestLog.text('testNameUtilsLowerFirstEmpty', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testNameUtilsLowerFirstEmpty', 'case end', 'lowerfirstempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3755
     * @tc.name      testNameUtilsFormatIndex
     * @tc.desc      Checks that an index is zero padded.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsFormatIndex',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsFormatIndex', 'case begin', 'formatindex name helper check');
      TestLog.step('testNameUtilsFormatIndex', 'formatindex name helper check');
      const actual: string = NameUtils.formatIndex(7, 3);
      TestLog.text('testNameUtilsFormatIndex', 'actual value', String(actual));
      expect(actual).assertEqual('007');
      TestLog.text('testNameUtilsFormatIndex', 'case end', 'formatindex name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3756
     * @tc.name      testNameUtilsFormatIndexWide
     * @tc.desc      Checks that a wide index is not truncated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsFormatIndexWide',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsFormatIndexWide', 'case begin', 'formatindexwide name helper check');
      TestLog.step('testNameUtilsFormatIndexWide', 'formatindexwide name helper check');
      const actual: string = NameUtils.formatIndex(123, 2);
      TestLog.text('testNameUtilsFormatIndexWide', 'actual value', String(actual));
      expect(actual).assertEqual('123');
      TestLog.text('testNameUtilsFormatIndexWide', 'case end', 'formatindexwide name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3757
     * @tc.name      testNameUtilsFormatAbilityPath
     * @tc.desc      Checks that an ability path is composed from the module and ability names.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsFormatAbilityPath',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsFormatAbilityPath', 'case begin', 'formatabilitypath name helper check');
      TestLog.step('testNameUtilsFormatAbilityPath', 'formatabilitypath name helper check');
      const actual: string = NameUtils.formatAbilityPath('entry', 'EntryAbility');
      TestLog.text('testNameUtilsFormatAbilityPath', 'actual value', String(actual));
      expect(actual).assertEqual('./ets/entry/EntryAbility.ets');
      TestLog.text('testNameUtilsFormatAbilityPath', 'case end', 'formatabilitypath name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3758
     * @tc.name      testNameUtilsAllowedCharsYes
     * @tc.desc      Checks that a value inside the allowed set is accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsAllowedCharsYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsAllowedCharsYes', 'case begin', 'allowedcharsyes name helper check');
      TestLog.step('testNameUtilsAllowedCharsYes', 'allowedcharsyes name helper check');
      const actual: boolean = NameUtils.hasOnlyAllowedChars('abc', 'abc');
      TestLog.text('testNameUtilsAllowedCharsYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsAllowedCharsYes', 'case end', 'allowedcharsyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3759
     * @tc.name      testNameUtilsAllowedCharsNo
     * @tc.desc      Checks that a value outside the allowed set is rejected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsAllowedCharsNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsAllowedCharsNo', 'case begin', 'allowedcharsno name helper check');
      TestLog.step('testNameUtilsAllowedCharsNo', 'allowedcharsno name helper check');
      const actual: boolean = NameUtils.hasOnlyAllowedChars('abd', 'abc');
      TestLog.text('testNameUtilsAllowedCharsNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsAllowedCharsNo', 'case end', 'allowedcharsno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3760
     * @tc.name      testNameUtilsAllowedCharsEmpty
     * @tc.desc      Checks that an empty value is inside any allowed set.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsAllowedCharsEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsAllowedCharsEmpty', 'case begin', 'allowedcharsempty name helper check');
      TestLog.step('testNameUtilsAllowedCharsEmpty', 'allowedcharsempty name helper check');
      const actual: boolean = NameUtils.hasOnlyAllowedChars('', 'abc');
      TestLog.text('testNameUtilsAllowedCharsEmpty', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsAllowedCharsEmpty', 'case end', 'allowedcharsempty name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3761
     * @tc.name      testNameUtilsContainsAnyYes
     * @tc.desc      Checks that a rejected character is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsContainsAnyYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsContainsAnyYes', 'case begin', 'containsanyyes name helper check');
      TestLog.step('testNameUtilsContainsAnyYes', 'containsanyyes name helper check');
      const actual: boolean = NameUtils.containsAny('a-b', '-');
      TestLog.text('testNameUtilsContainsAnyYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsContainsAnyYes', 'case end', 'containsanyyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3762
     * @tc.name      testNameUtilsContainsAnyNo
     * @tc.desc      Checks that a missing rejected character is not detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsContainsAnyNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsContainsAnyNo', 'case begin', 'containsanyno name helper check');
      TestLog.step('testNameUtilsContainsAnyNo', 'containsanyno name helper check');
      const actual: boolean = NameUtils.containsAny('abc', '-');
      TestLog.text('testNameUtilsContainsAnyNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsContainsAnyNo', 'case end', 'containsanyno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3763
     * @tc.name      testNameUtilsSegmentCount
     * @tc.desc      Checks that three dotted segments are counted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsSegmentCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsSegmentCount', 'case begin', 'segmentcount name helper check');
      TestLog.step('testNameUtilsSegmentCount', 'segmentcount name helper check');
      const actual: number = NameUtils.segmentCount('a.b.c', '.');
      TestLog.text('testNameUtilsSegmentCount', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testNameUtilsSegmentCount', 'case end', 'segmentcount name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3764
     * @tc.name      testNameUtilsHasEmptySegmentYes
     * @tc.desc      Checks that an empty dotted segment is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsHasEmptySegmentYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsHasEmptySegmentYes', 'case begin', 'hasemptysegmentyes name helper check');
      TestLog.step('testNameUtilsHasEmptySegmentYes', 'hasemptysegmentyes name helper check');
      const actual: boolean = NameUtils.hasEmptySegment('a..b', '.');
      TestLog.text('testNameUtilsHasEmptySegmentYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testNameUtilsHasEmptySegmentYes', 'case end', 'hasemptysegmentyes name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3765
     * @tc.name      testNameUtilsHasEmptySegmentNo
     * @tc.desc      Checks that a filled dotted value has no empty segment.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsHasEmptySegmentNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsHasEmptySegmentNo', 'case begin', 'hasemptysegmentno name helper check');
      TestLog.step('testNameUtilsHasEmptySegmentNo', 'hasemptysegmentno name helper check');
      const actual: boolean = NameUtils.hasEmptySegment('a.b', '.');
      TestLog.text('testNameUtilsHasEmptySegmentNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testNameUtilsHasEmptySegmentNo', 'case end', 'hasemptysegmentno name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3766
     * @tc.name      testNameUtilsMaxSegmentLength
     * @tc.desc      Checks that the longest dotted segment is measured.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsMaxSegmentLength',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsMaxSegmentLength', 'case begin', 'maxsegmentlength name helper check');
      TestLog.step('testNameUtilsMaxSegmentLength', 'maxsegmentlength name helper check');
      const actual: number = NameUtils.maxSegmentLength('aa.bbb', '.');
      TestLog.text('testNameUtilsMaxSegmentLength', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testNameUtilsMaxSegmentLength', 'case end', 'maxsegmentlength name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3767
     * @tc.name      testNameUtilsRepeat
     * @tc.desc      Checks that a character is repeated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsRepeat',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsRepeat', 'case begin', 'repeat name helper check');
      TestLog.step('testNameUtilsRepeat', 'repeat name helper check');
      const actual: string = NameUtils.repeat('x', 3);
      TestLog.text('testNameUtilsRepeat', 'actual value', String(actual));
      expect(actual).assertEqual('xxx');
      TestLog.text('testNameUtilsRepeat', 'case end', 'repeat name helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3768
     * @tc.name      testNameUtilsRepeatZero
     * @tc.desc      Checks that a zero repetition is empty.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNameUtilsRepeatZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testNameUtilsRepeatZero', 'case begin', 'repeatzero name helper check');
      TestLog.step('testNameUtilsRepeatZero', 'repeatzero name helper check');
      const actual: string = NameUtils.repeat('x', 0);
      TestLog.text('testNameUtilsRepeatZero', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testNameUtilsRepeatZero', 'case end', 'repeatzero name helper check');
    })

  })
}
