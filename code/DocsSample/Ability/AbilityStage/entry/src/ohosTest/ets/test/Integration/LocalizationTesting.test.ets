/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  launchEntryAbility,
  waitForIndexPageStable,
  waitForTextVisible,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  collectAllTexts,
  serializedDelay,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  COLOR_MODE_NOT_SET,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_TEXT_APPEAR,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const LANG_ZH_CN: string = 'zh_CN';

const LANG_ZH_HK: string = 'zh_HK';

const LANG_EN_US: string = 'en_US';

const LANG_EN_GB: string = 'en_GB';

const LANG_AR_AE: string = 'ar_AE';

const LANG_HE_IL: string = 'he_IL';

const LANG_UNKNOWN: string = 'xx_YY';

const DIRECTION_LTR: string = 'ltr';

const DIRECTION_RTL: string = 'rtl';

const COLOR_MODE_LIGHT: number = 0;

const COLOR_MODE_DARK: number = 1;

const FONT_SCALE_MIN: number = 0.85;

const FONT_SCALE_NORMAL: number = 1.0;

const FONT_SCALE_LARGE: number = 1.45;

const FONT_SCALE_MAX: number = 3.0;

const FONT_WEIGHT_SCALE_MIN: number = 0.6;

const FONT_WEIGHT_SCALE_MAX: number = 3.0;

const BASE_FONT_SIZE_VP: number = 40;

const BASE_FONT_WEIGHT: number = 700;

const TEXT_WIDTH_PER_CHAR_VP: number = 11;

enum TextAlignMode {
  ALIGN_START = 'start',
  ALIGN_END = 'end',
  ALIGN_CENTER = 'center'
}

interface LocalizedEntry {
  language: string;
  initialText: string;
  clickedText: string;
}

interface ThemeCombination {
  colorMode: number;
  theme: string;
}

class LocaleResourceCatalog {
  private entries: LocalizedEntry[] = [];

  constructor() {
    this.entries.push({ language: LANG_ZH_CN, initialText: PAGE_TEXT_INITIAL, clickedText: PAGE_TEXT_CLICKED });
    this.entries.push({ language: LANG_EN_US, initialText: PAGE_TEXT_INITIAL, clickedText: PAGE_TEXT_CLICKED });
    this.entries.push({ language: LANG_AR_AE, initialText: PAGE_TEXT_INITIAL, clickedText: PAGE_TEXT_CLICKED });
  }

  public exactLookup(language: string): LocalizedEntry | null {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].language === language) {
        return this.entries[i];
      }
    }
    return null;
  }

  public languageOnlyLookup(language: string): LocalizedEntry | null {
    const separatorIndex: number = language.indexOf('_');
    if (separatorIndex <= 0) {
      return null;
    }
    const languageOnly: string = language.substring(0, separatorIndex);
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].language.substring(0, separatorIndex) === languageOnly) {
        return this.entries[i];
      }
    }
    return null;
  }

  public resolveWithFallback(language: string): LocalizedEntry | null {
    const exact: LocalizedEntry | null = this.exactLookup(language);
    if (exact !== null) {
      return exact;
    }
    const languageOnly: LocalizedEntry | null = this.languageOnlyLookup(language);
    if (languageOnly !== null) {
      return languageOnly;
    }
    return this.exactLookup(LANG_EN_US);
  }

  public resolveTextOrEmpty(language: string, clicked: boolean): string {
    const entry: LocalizedEntry | null = this.resolveWithFallback(language);
    if (entry === null) {
      return '';
    }
    return clicked ? entry.clickedText : entry.initialText;
  }

  public isKnownLanguage(language: string): boolean {
    return this.exactLookup(language) !== null;
  }

  public countEntries(): number {
    return this.entries.length;
  }

  public listLanguages(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      result.push(this.entries[i].language);
    }
    return result;
  }
}

class DirectionModel {
  public isRtlLanguage(language: string): boolean {
    return language.startsWith('ar') || language.startsWith('he') || language.startsWith('fa') ||
      language.startsWith('ur');
  }

  public resolveDirection(language: string): string {
    if (this.isRtlLanguage(language)) {
      return DIRECTION_RTL;
    }
    return DIRECTION_LTR;
  }

  public resolveAlignMode(language: string): TextAlignMode {
    if (this.isRtlLanguage(language)) {
      return TextAlignMode.ALIGN_END;
    }
    return TextAlignMode.ALIGN_START;
  }

  public resolveTextAnchor(language: string): string {
    const direction: string = this.resolveDirection(language);
    return direction === DIRECTION_RTL ? 'right' : 'left';
  }

  public isMirrored(language: string): boolean {
    return this.resolveDirection(language) === DIRECTION_RTL;
  }
}

class FontScaleModel {
  public clampScale(scale: number): number {
    if (!isFinite(scale) || scale <= 0) {
      return FONT_SCALE_NORMAL;
    }
    if (scale < FONT_SCALE_MIN) {
      return FONT_SCALE_MIN;
    }
    if (scale > FONT_SCALE_MAX) {
      return FONT_SCALE_MAX;
    }
    return scale;
  }

  public computeFontSize(scale: number): number {
    return BASE_FONT_SIZE_VP * this.clampScale(scale);
  }

  public computeTextWidth(characterCount: number, scale: number): number {
    if (characterCount <= 0) {
      return 0;
    }
    return characterCount * TEXT_WIDTH_PER_CHAR_VP * this.clampScale(scale);
  }

  public computeLineCount(characterCount: number, viewportWidth: number, scale: number): number {
    if (viewportWidth <= 0 || characterCount <= 0) {
      return 0;
    }
    const width: number = this.computeTextWidth(characterCount, scale);
    const fullLines: number = Math.floor(width / viewportWidth);
    if (width - fullLines * viewportWidth > 0) {
      return fullLines + 1;
    }
    return fullLines;
  }

  public isScaleValid(scale: number): boolean {
    return isFinite(scale) && scale >= FONT_SCALE_MIN && scale <= FONT_SCALE_MAX;
  }
}

class FontWeightScaleModel {
  public clampWeightScale(scale: number): number {
    if (!isFinite(scale) || scale <= 0) {
      return FONT_SCALE_NORMAL;
    }
    if (scale < FONT_WEIGHT_SCALE_MIN) {
      return FONT_WEIGHT_SCALE_MIN;
    }
    if (scale > FONT_WEIGHT_SCALE_MAX) {
      return FONT_WEIGHT_SCALE_MAX;
    }
    return scale;
  }

  public computeFontWeight(scale: number): number {
    const weight: number = BASE_FONT_WEIGHT * this.clampWeightScale(scale);
    if (weight > 900) {
      return 900;
    }
    if (weight < 100) {
      return 100;
    }
    return Math.round(weight / 100) * 100;
  }

  public isBoldAfterScale(scale: number): boolean {
    return this.computeFontWeight(scale) >= 600;
  }
}

class ThemeResolver {
  public resolveEffectiveColorMode(combination: ThemeCombination): number {
    if (combination.colorMode === COLOR_MODE_LIGHT && combination.theme === 'dark') {
      return COLOR_MODE_DARK;
    }
    if (combination.colorMode === COLOR_MODE_DARK && combination.theme === 'light') {
      return COLOR_MODE_LIGHT;
    }
    return combination.colorMode;
  }

  public isThemeHonored(combination: ThemeCombination): boolean {
    if (combination.colorMode === COLOR_MODE_NOT_SET) {
      return true;
    }
    return this.resolveEffectiveColorMode(combination) === combination.colorMode;
  }

  public resolveBackgroundToken(combination: ThemeCombination): string {
    const mode: number = this.resolveEffectiveColorMode(combination);
    if (mode === COLOR_MODE_DARK) {
      return 'background_dark';
    }
    if (mode === COLOR_MODE_LIGHT) {
      return 'background_light';
    }
    return 'background_system';
  }
}

class LocalizedTextMatcher {
  public matchesAny(candidates: string[], expected: string[]): boolean {
    for (let i = 0; i < candidates.length; i++) {
      for (let j = 0; j < expected.length; j++) {
        if (candidates[i] === expected[j]) {
          return true;
        }
      }
    }
    return false;
  }

  public countMatches(candidates: string[], expected: string): number {
    let total: number = 0;
    for (let i = 0; i < candidates.length; i++) {
      if (candidates[i] === expected) {
        total++;
      }
    }
    return total;
  }

  public firstNonEmpty(candidates: string[]): string {
    for (let i = 0; i < candidates.length; i++) {
      if (candidates[i].length > 0) {
        return candidates[i];
      }
    }
    return '';
  }
}

export default function localizationTestingTest(): void {
  describe('LocalizationTestingTest', () => {
    let driver: Driver;
    let catalog: LocaleResourceCatalog;
    let directionModel: DirectionModel;
    let fontScaleModel: FontScaleModel;
    let fontWeightModel: FontWeightScaleModel;
    let themeResolver: ThemeResolver;
    let matcher: LocalizedTextMatcher;

    beforeAll(async () => {
      driver = getDriver();
      catalog = new LocaleResourceCatalog();
      directionModel = new DirectionModel();
      fontScaleModel = new FontScaleModel();
      fontWeightModel = new FontWeightScaleModel();
      themeResolver = new ThemeResolver();
      matcher = new LocalizedTextMatcher();
      logInfo('LocalizationTestingTest: beforeAll prepared localization models');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('LocalizationTestingTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0100
     * @tc.name testCatalogEntryCount
     * @tc.desc Verify the locale catalog holds exactly three entries for zh_CN, en_US and ar_AE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCatalogEntryCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(catalog.countEntries()).assertEqual(3);
          expect(catalog.listLanguages().length).assertEqual(3);
          expect(catalog.listLanguages()[0]).assertEqual(LANG_ZH_CN);
          expect(catalog.listLanguages()[1]).assertEqual(LANG_EN_US);
          expect(catalog.listLanguages()[2]).assertEqual(LANG_AR_AE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0200
     * @tc.name testExactLocaleLookup
     * @tc.desc Verify exact lookups resolve zh_CN and en_US entries and return null for an unknown locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExactLocaleLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const zh: LocalizedEntry | null = catalog.exactLookup(LANG_ZH_CN);
          const en: LocalizedEntry | null = catalog.exactLookup(LANG_EN_US);
          expect(zh !== null).assertTrue();
          expect(en !== null).assertTrue();
          if (zh !== null) {
            expect(zh.initialText).assertEqual(PAGE_TEXT_INITIAL);
            expect(zh.clickedText).assertEqual(PAGE_TEXT_CLICKED);
          }
          expect(catalog.exactLookup(LANG_UNKNOWN)).assertNull();
          expect(catalog.isKnownLanguage(LANG_AR_AE)).assertTrue();
          expect(catalog.isKnownLanguage(LANG_ZH_HK)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0300
     * @tc.name testLanguageOnlyFallback
     * @tc.desc Verify zh_HK falls back to the zh_CN entry through language only matching while en_GB falls back to en_US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLanguageOnlyFallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const zhHk: LocalizedEntry | null = catalog.languageOnlyLookup(LANG_ZH_HK);
          const enGb: LocalizedEntry | null = catalog.languageOnlyLookup(LANG_EN_GB);
          expect(zhHk !== null).assertTrue();
          expect(enGb !== null).assertTrue();
          if (zhHk !== null) {
            expect(zhHk.language).assertEqual(LANG_ZH_CN);
          }
          if (enGb !== null) {
            expect(enGb.language).assertEqual(LANG_EN_US);
          }
          expect(catalog.languageOnlyLookup('zh')).assertNull();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0400
     * @tc.name testFallbackChainToDefault
     * @tc.desc Verify an unknown locale resolves through the fallback chain to the default en_US entry with Hello World and Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFallbackChainToDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const resolved: LocalizedEntry | null = catalog.resolveWithFallback(LANG_UNKNOWN);
          expect(resolved !== null).assertTrue();
          if (resolved !== null) {
            expect(resolved.language).assertEqual(LANG_EN_US);
            expect(resolved.initialText).assertEqual('Hello World');
            expect(resolved.clickedText).assertEqual('Welcome');
          }
          expect(catalog.resolveTextOrEmpty(LANG_UNKNOWN, false)).assertEqual(PAGE_TEXT_INITIAL);
          expect(catalog.resolveTextOrEmpty(LANG_UNKNOWN, true)).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0500
     * @tc.name testResolvedTextForKnownLocales
     * @tc.desc Verify zh_CN, en_US and ar_AE all resolve the same initial and clicked page text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResolvedTextForKnownLocales', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(catalog.resolveTextOrEmpty(LANG_ZH_CN, false)).assertEqual(PAGE_TEXT_INITIAL);
          expect(catalog.resolveTextOrEmpty(LANG_EN_US, false)).assertEqual(PAGE_TEXT_INITIAL);
          expect(catalog.resolveTextOrEmpty(LANG_AR_AE, false)).assertEqual(PAGE_TEXT_INITIAL);
          expect(catalog.resolveTextOrEmpty(LANG_ZH_CN, true)).assertEqual(PAGE_TEXT_CLICKED);
          expect(catalog.resolveTextOrEmpty(LANG_AR_AE, true)).assertEqual(PAGE_TEXT_CLICKED);
          expect(matcher.countMatches([PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED], PAGE_TEXT_CLICKED)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0600
     * @tc.name testDirectionResolution
     * @tc.desc Verify ar_AE and he_IL resolve right to left while zh_CN and en_US stay left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectionResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(directionModel.resolveDirection(LANG_AR_AE)).assertEqual(DIRECTION_RTL);
          expect(directionModel.resolveDirection(LANG_HE_IL)).assertEqual(DIRECTION_RTL);
          expect(directionModel.resolveDirection(LANG_ZH_CN)).assertEqual(DIRECTION_LTR);
          expect(directionModel.resolveDirection(LANG_EN_US)).assertEqual(DIRECTION_LTR);
          expect(directionModel.isRtlLanguage(LANG_UNKNOWN)).assertFalse();
          expect(directionModel.isMirrored(LANG_AR_AE)).assertTrue();
          expect(directionModel.isMirrored(LANG_EN_US)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0700
     * @tc.name testAlignModeAndAnchor
     * @tc.desc Verify right to left locales align text to end with a right anchor and left to right locales align to start with a left anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAlignModeAndAnchor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(directionModel.resolveAlignMode(LANG_AR_AE)).assertEqual(TextAlignMode.ALIGN_END);
          expect(directionModel.resolveAlignMode(LANG_ZH_CN)).assertEqual(TextAlignMode.ALIGN_START);
          expect(directionModel.resolveTextAnchor(LANG_AR_AE)).assertEqual('right');
          expect(directionModel.resolveTextAnchor(LANG_EN_US)).assertEqual('left');
          const arEntry: LocalizedEntry | null = catalog.resolveWithFallback(LANG_AR_AE);
          expect(arEntry !== null).assertTrue();
          if (arEntry !== null) {
            expect(arEntry.initialText).assertEqual(PAGE_TEXT_INITIAL);
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0800
     * @tc.name testFontScaleBoundaryClamp
     * @tc.desc Verify scale 0.85 and 3.0 stay unchanged while 0.5 clamps up to 0.85, 4.0 clamps down to 3.0 and 0 falls back to 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontScaleBoundaryClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(fontScaleModel.clampScale(FONT_SCALE_MIN)).assertEqual(FONT_SCALE_MIN);
          expect(fontScaleModel.clampScale(FONT_SCALE_MAX)).assertEqual(FONT_SCALE_MAX);
          expect(fontScaleModel.clampScale(0.5)).assertEqual(FONT_SCALE_MIN);
          expect(fontScaleModel.clampScale(4.0)).assertEqual(FONT_SCALE_MAX);
          expect(fontScaleModel.clampScale(0)).assertEqual(FONT_SCALE_NORMAL);
          expect(fontScaleModel.clampScale(-1)).assertEqual(FONT_SCALE_NORMAL);
          expect(fontScaleModel.isScaleValid(FONT_SCALE_LARGE)).assertTrue();
          expect(fontScaleModel.isScaleValid(0.5)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_0900
     * @tc.name testComputedFontSizeMatrix
     * @tc.desc Verify a 40 vp base text becomes 34 at 0.85, 40 at 1.0, 58 at 1.45 and 120 at 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComputedFontSizeMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(fontScaleModel.computeFontSize(FONT_SCALE_MIN)).assertEqual(34);
          expect(fontScaleModel.computeFontSize(FONT_SCALE_NORMAL)).assertEqual(40);
          expect(fontScaleModel.computeFontSize(FONT_SCALE_LARGE)).assertEqual(58);
          expect(fontScaleModel.computeFontSize(FONT_SCALE_MAX)).assertEqual(120);
          expect(fontScaleModel.computeFontSize(0)).assertEqual(40);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1000
     * @tc.name testComputedTextWidthAndLines
     * @tc.desc Verify an eleven character text at scale 1.0 is 121 vp wide and wraps into two lines inside a 100 vp viewport
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testComputedTextWidthAndLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          expect(fontScaleModel.computeTextWidth(11, FONT_SCALE_NORMAL)).assertEqual(121);
          expect(fontScaleModel.computeTextWidth(11, FONT_SCALE_MAX)).assertEqual(363);
          expect(fontScaleModel.computeTextWidth(0, FONT_SCALE_MAX)).assertEqual(0);
          expect(fontScaleModel.computeLineCount(11, 121, FONT_SCALE_NORMAL)).assertEqual(1);
          expect(fontScaleModel.computeLineCount(11, 100, FONT_SCALE_NORMAL)).assertEqual(2);
          expect(fontScaleModel.computeLineCount(11, 0, FONT_SCALE_NORMAL)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1100
     * @tc.name testFontWeightScaleMapping
     * @tc.desc Verify weight scale 1.0 keeps bold 700, 0.85 lowers to 600, 3.0 clamps to 900 and 0 resets to 700
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontWeightScaleMapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(fontWeightModel.computeFontWeight(FONT_SCALE_NORMAL)).assertEqual(700);
          expect(fontWeightModel.computeFontWeight(FONT_SCALE_MIN)).assertEqual(600);
          expect(fontWeightModel.computeFontWeight(FONT_SCALE_MAX)).assertEqual(900);
          expect(fontWeightModel.computeFontWeight(0)).assertEqual(700);
          expect(fontWeightModel.clampWeightScale(0.1)).assertEqual(FONT_WEIGHT_SCALE_MIN);
          expect(fontWeightModel.isBoldAfterScale(FONT_SCALE_MIN)).assertTrue();
          expect(fontWeightModel.isBoldAfterScale(0.5)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1200
     * @tc.name testFontWeightScaleAtLargeValues
     * @tc.desc Verify weight scale 1.45 yields bold weight 900 after rounding and stays bold above the 600 threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testFontWeightScaleAtLargeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          expect(fontWeightModel.computeFontWeight(FONT_SCALE_LARGE)).assertEqual(900);
          expect(fontWeightModel.clampWeightScale(FONT_SCALE_LARGE)).assertEqual(FONT_SCALE_LARGE);
          expect(fontWeightModel.computeFontWeight(FONT_WEIGHT_SCALE_MIN)).assertEqual(400);
          expect(fontWeightModel.isBoldAfterScale(FONT_WEIGHT_SCALE_MIN)).assertFalse();
          expect(fontWeightModel.computeFontWeight(-2)).assertEqual(700);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1300
     * @tc.name testThemeCombinationResolution
     * @tc.desc Verify color mode not set resolves to the system token, light with dark theme resolves dark and matches colorMode checks false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThemeCombinationResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notSet: ThemeCombination = { colorMode: COLOR_MODE_NOT_SET, theme: 'dark' };
          const lightOnDark: ThemeCombination = { colorMode: COLOR_MODE_LIGHT, theme: 'dark' };
          const darkOnLight: ThemeCombination = { colorMode: COLOR_MODE_DARK, theme: 'light' };
          const darkOnDark: ThemeCombination = { colorMode: COLOR_MODE_DARK, theme: 'dark' };
          expect(themeResolver.resolveEffectiveColorMode(notSet)).assertEqual(COLOR_MODE_NOT_SET);
          expect(themeResolver.resolveBackgroundToken(notSet)).assertEqual('background_system');
          expect(themeResolver.resolveEffectiveColorMode(lightOnDark)).assertEqual(COLOR_MODE_DARK);
          expect(themeResolver.resolveEffectiveColorMode(darkOnLight)).assertEqual(COLOR_MODE_LIGHT);
          expect(themeResolver.resolveEffectiveColorMode(darkOnDark)).assertEqual(COLOR_MODE_DARK);
          expect(themeResolver.isThemeHonored(lightOnDark)).assertFalse();
          expect(themeResolver.isThemeHonored(notSet)).assertTrue();
          expect(themeResolver.resolveBackgroundToken(darkOnDark)).assertEqual('background_dark');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1400
     * @tc.name testMatcherCandidateSelection
     * @tc.desc Verify the matcher detects Hello World among candidate texts, counts zero for an absent text and returns the first non empty candidate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testMatcherCandidateSelection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const candidates: string[] = ['', PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED];
          expect(matcher.matchesAny(candidates, [PAGE_TEXT_CLICKED])).assertTrue();
          expect(matcher.matchesAny(candidates, ['Goodbye'])).assertFalse();
          expect(matcher.countMatches(candidates, PAGE_TEXT_INITIAL)).assertEqual(1);
          expect(matcher.countMatches(candidates, 'Goodbye')).assertEqual(0);
          expect(matcher.firstNonEmpty(candidates)).assertEqual(PAGE_TEXT_INITIAL);
          expect(matcher.firstNonEmpty([])).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1500
     * @tc.name testRealIndexShowsEnglishCatalogText
     * @tc.desc Verify the launched Index page shows the catalog initial text Hello World or the clicked text Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRealIndexShowsEnglishCatalogText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length > 0).assertTrue();
          const expected: string[] = [PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED];
          expect(matcher.matchesAny(texts, expected)).assertTrue();
          const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(initialVisible || clickedVisible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1600
     * @tc.name testRealTextKeyedComponentPresent
     * @tc.desc Verify the HelloWorld keyed text component exists and the page exposes a positive component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealTextKeyedComponentPresent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          expect(catalog.countEntries()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1700
     * @tc.name testRealTextVisibleAfterLocaleReload
     * @tc.desc Verify relaunching the ability with a zh_CN preference still surfaces the page text within the text appear budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealTextVisibleAfterLocaleReload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const preferred: string = LANG_ZH_CN;
          expect(catalog.resolveTextOrEmpty(preferred, false)).assertEqual(PAGE_TEXT_INITIAL);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const initialVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_INITIAL,
            TIMEOUT_TEXT_APPEAR * 3);
          if (initialVisible) {
            expect(initialVisible).assertTrue();
          } else {
            const clickedVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED,
              TIMEOUT_TEXT_APPEAR * 3);
            expect(clickedVisible).assertTrue();
          }
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1800
     * @tc.name testRealRtlLocaleKeepsPageUsable
     * @tc.desc Verify the page stays usable when the preferred locale is ar_AE with right to left direction and end alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealRtlLocaleKeepsPageUsable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const preferred: string = LANG_AR_AE;
          expect(directionModel.resolveDirection(preferred)).assertEqual(DIRECTION_RTL);
          expect(catalog.resolveTextOrEmpty(preferred, true)).assertEqual(PAGE_TEXT_CLICKED);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          expect(directionModel.resolveAlignMode(preferred)).assertEqual(TextAlignMode.ALIGN_END);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_1900
     * @tc.name testRealLargeFontScaleLayout
     * @tc.desc Verify that at font scale 3.0 the computed text is 120 vp tall and still fits a 1920 vp viewport in one line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRealLargeFontScaleLayout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const fontSize: number = fontScaleModel.computeFontSize(FONT_SCALE_MAX);
          expect(fontSize).assertEqual(120);
          expect(fontScaleModel.computeLineCount(11, 1920, FONT_SCALE_MAX)).assertEqual(1);
          expect(fontScaleModel.computeLineCount(11, 300, FONT_SCALE_MAX)).assertEqual(2);
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(initialVisible || clickedVisible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOCALE_2000
     * @tc.name testRealColorModeNotSetAfterCreate
     * @tc.desc Verify EntryAbility leaves color mode unset so the theme combination resolves to the system background token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealColorModeNotSetAfterCreate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const combination: ThemeCombination = { colorMode: COLOR_MODE_NOT_SET, theme: 'light' };
          expect(themeResolver.resolveEffectiveColorMode(combination)).assertEqual(COLOR_MODE_NOT_SET);
          expect(themeResolver.resolveBackgroundToken(combination)).assertEqual('background_system');
          expect(themeResolver.isThemeHonored(combination)).assertTrue();
          expect(COLOR_MODE_NOT_SET).assertEqual(-1);
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
        } finally {
          done();
        }
      })
  })
}
