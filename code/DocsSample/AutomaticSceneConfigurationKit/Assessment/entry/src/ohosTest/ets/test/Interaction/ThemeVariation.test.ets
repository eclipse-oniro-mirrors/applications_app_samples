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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  DELAY_KEY_NAVIGATION,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_INDEX_TITLE,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  findById,
  getDriver,
  launchAssessmentApp,
  pressAndWait,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The two theme folders of the sample. Every semantic token exists in both, only the value
// differs, which is the contract that a theme switch relies on.
const THEME_LIGHT: string = 'light';
const THEME_DARK: string = 'dark';

// The WCAG 2.1 thresholds used to judge a resolved token pair.
const WCAG_AA_NORMAL_TEXT: number = 4.5;
const WCAG_AA_LARGE_TEXT: number = 3.0;

// The maximum contrast a pair can reach, black over white.
const MAX_CONTRAST_RATIO: number = 21;

// Tokens of resources/base/element/color.json, the light theme.
const LIGHT_PAGE_BACKGROUND: string = '#F1F3F5';
const LIGHT_CARD_BACKGROUND: string = '#FFFFFF';
const LIGHT_TITLE_FONT: string = '#182431';
const LIGHT_BODY_FONT: string = '#182431';
const LIGHT_SECONDARY_FONT: string = '#99182431';
const LIGHT_DIVIDER: string = '#0D182431';
const LIGHT_BRAND: string = '#007DFF';
const LIGHT_WARNING: string = '#ED6F21';
const LIGHT_SUCCESS: string = '#64BB5C';

// Tokens of resources/dark/element/color.json, the dark theme. The brand, the warning and the
// success tokens are shared, only the surface and the font tokens flip.
const DARK_PAGE_BACKGROUND: string = '#000000';
const DARK_CARD_BACKGROUND: string = '#1C1C1E';
const DARK_TITLE_FONT: string = '#E5E5E5';
const DARK_BODY_FONT: string = '#E5E5E5';
const DARK_SECONDARY_FONT: string = '#99E5E5E5';
const DARK_DIVIDER: string = '#0DE5E5E5';
const DARK_BRAND: string = '#0A59F7';
const DARK_WARNING: string = '#ED6F21';
const DARK_SUCCESS: string = '#64BB5C';

// The names of the semantic tokens, they are the keys of the theme tables.
const TOKEN_PAGE_BACKGROUND: string = 'page_background';
const TOKEN_CARD_BACKGROUND: string = 'card_background';
const TOKEN_TITLE_FONT: string = 'title_font';
const TOKEN_BODY_FONT: string = 'body_font';
const TOKEN_SECONDARY_FONT: string = 'secondary_font';
const TOKEN_DIVIDER: string = 'divider';
const TOKEN_BRAND: string = 'brand';
const TOKEN_WARNING: string = 'warning';
const TOKEN_SUCCESS: string = 'success';

/**
 * The theme that a color resolver works with.
 */
enum ThemeMode {
  LIGHT = 0,
  DARK = 1
}

/**
 * How a token pair is graded by the contrast audit.
 */
enum ContrastGrade {
  AAA = 0,
  AA = 1,
  AA_LARGE = 2,
  FAIL = 3
}

/**
 * One semantic token binding of a theme.
 */
interface ThemeToken {
  name: string;
  value: string;
}

/**
 * A surface and the font that is painted on it, the pair is the unit of the contrast audit.
 */
interface ContrastPair {
  foreground: string;
  background: string;
  label: string;
}

/**
 * A plain RGBA color in the 0 to 255 channel range.
 *
 * Two sample tokens carry an alpha channel (#99182431 and #0D182431), so the contrast helper
 * needs the channels separately and it needs alpha blending against the surface.
 */
class ThemeColor {
  public red: number = 0;
  public green: number = 0;
  public blue: number = 0;
  public alpha: number = 1;

  /**
   * @param red red channel, 0 to 255.
   * @param green green channel, 0 to 255.
   * @param blue blue channel, 0 to 255.
   * @param alpha alpha channel, 0 to 1.
   */
  constructor(red: number = 0, green: number = 0, blue: number = 0, alpha: number = 1) {
    this.red = red;
    this.green = green;
    this.blue = blue;
    this.alpha = alpha;
  }

  /**
   * Parses a color token, both #RRGGBB and #AARRGGBB are accepted.
   *
   * @param hex color token of the resource file.
   * @returns the parsed color, opaque black when the token cannot be parsed.
   */
  public static fromHex(hex: string): ThemeColor {
    let value: string = hex;
    if (value.startsWith('#')) {
      value = value.substring(1);
    }
    if (value.length === 8) {
      const alphaChannel: number = ThemeColor.parseChannel(value.substring(0, 2));
      const redChannel: number = ThemeColor.parseChannel(value.substring(2, 4));
      const greenChannel: number = ThemeColor.parseChannel(value.substring(4, 6));
      const blueChannel: number = ThemeColor.parseChannel(value.substring(6, 8));
      return new ThemeColor(redChannel, greenChannel, blueChannel, alphaChannel / 255);
    }
    if (value.length === 6) {
      const redChannel: number = ThemeColor.parseChannel(value.substring(0, 2));
      const greenChannel: number = ThemeColor.parseChannel(value.substring(2, 4));
      const blueChannel: number = ThemeColor.parseChannel(value.substring(4, 6));
      return new ThemeColor(redChannel, greenChannel, blueChannel, 1);
    }
    return new ThemeColor(0, 0, 0, 1);
  }

  /**
   * Parses one two digit hex channel.
   *
   * @param token two hex characters.
   * @returns the channel value, zero when the token is not a hex number.
   */
  private static parseChannel(token: string): number {
    const parsed: number = parseInt(token, 16);
    if (Number.isNaN(parsed)) {
      return 0;
    }
    return parsed;
  }

  /**
   * @returns true when the color has no transparency.
   */
  public isOpaque(): boolean {
    return this.alpha >= 1;
  }

  /**
   * Composites the color over an opaque surface.
   *
   * @param background opaque surface color.
   * @returns the blended color with an alpha of one.
   */
  public blendOver(background: ThemeColor): ThemeColor {
    if (this.isOpaque()) {
      return new ThemeColor(this.red, this.green, this.blue, 1);
    }
    const inverse: number = 1 - this.alpha;
    const redChannel: number = this.red * this.alpha + background.red * inverse;
    const greenChannel: number = this.green * this.alpha + background.green * inverse;
    const blueChannel: number = this.blue * this.alpha + background.blue * inverse;
    return new ThemeColor(redChannel, greenChannel, blueChannel, 1);
  }

  /**
   * @returns a compact css-like description used by the log lines.
   */
  public toCss(): string {
    return `rgba(${Math.round(this.red)}, ${Math.round(this.green)}, ${Math.round(this.blue)}, ` +
      `${this.alpha.toFixed(2)})`;
  }
}

/**
 * Relative luminance and contrast ratio helper of the theme audit.
 */
class ThemeContrast {
  /**
   * @param channel channel value in the 0 to 255 range.
   * @returns the linear channel value.
   */
  public static channelToLinear(channel: number): number {
    const normalized: number = channel / 255;
    if (normalized <= 0.03928) {
      return normalized / 12.92;
    }
    return Math.pow((normalized + 0.055) / 1.055, 2.4);
  }

  /**
   * @param color opaque color to inspect.
   * @returns the relative luminance between zero and one.
   */
  public static luminance(color: ThemeColor): number {
    return ThemeContrast.channelToLinear(color.red) * 0.2126 +
      ThemeContrast.channelToLinear(color.green) * 0.7152 +
      ThemeContrast.channelToLinear(color.blue) * 0.0722;
  }

  /**
   * @param first first opaque color.
   * @param second second opaque color.
   * @returns the ratio between one and twenty one.
   */
  public static ratio(first: ThemeColor, second: ThemeColor): number {
    const firstLuminance: number = ThemeContrast.luminance(first);
    const secondLuminance: number = ThemeContrast.luminance(second);
    const lighter: number = Math.max(firstLuminance, secondLuminance);
    const darker: number = Math.min(firstLuminance, secondLuminance);
    return (lighter + 0.05) / (darker + 0.05);
  }

  /**
   * @param foregroundHex foreground token, it is blended over the surface first.
   * @param backgroundHex opaque surface token.
   * @returns the ratio between one and twenty one.
   */
  public static ratioOfHex(foregroundHex: string, backgroundHex: string): number {
    const background: ThemeColor = ThemeColor.fromHex(backgroundHex);
    const foreground: ThemeColor = ThemeColor.fromHex(foregroundHex).blendOver(background);
    return ThemeContrast.ratio(foreground, background);
  }

  /**
   * @param ratio ratio to grade.
   * @returns the grade of the pair.
   */
  public static grade(ratio: number): ContrastGrade {
    if (ratio >= 7) {
      return ContrastGrade.AAA;
    }
    if (ratio >= WCAG_AA_NORMAL_TEXT) {
      return ContrastGrade.AA;
    }
    if (ratio >= WCAG_AA_LARGE_TEXT) {
      return ContrastGrade.AA_LARGE;
    }
    return ContrastGrade.FAIL;
  }

  /**
   * @param grade grade to name.
   * @returns the grade name used by the log lines.
   */
  public static gradeName(grade: ContrastGrade): string {
    if (grade === ContrastGrade.AAA) {
      return 'AAA';
    }
    if (grade === ContrastGrade.AA) {
      return 'AA';
    }
    if (grade === ContrastGrade.AA_LARGE) {
      return 'AA-Large';
    }
    return 'Fail';
  }
}

/**
 * The color table of one theme, it is the in test mirror of resources/<theme>/element/color.json.
 */
class ThemePalette {
  private mode: ThemeMode;
  private tokens: Map<string, string> = new Map<string, string>();
  private order: string[] = [];

  /**
   * @param mode theme that this palette describes.
   */
  constructor(mode: ThemeMode) {
    this.mode = mode;
    if (mode === ThemeMode.LIGHT) {
      this.declare(TOKEN_PAGE_BACKGROUND, LIGHT_PAGE_BACKGROUND);
      this.declare(TOKEN_CARD_BACKGROUND, LIGHT_CARD_BACKGROUND);
      this.declare(TOKEN_TITLE_FONT, LIGHT_TITLE_FONT);
      this.declare(TOKEN_BODY_FONT, LIGHT_BODY_FONT);
      this.declare(TOKEN_SECONDARY_FONT, LIGHT_SECONDARY_FONT);
      this.declare(TOKEN_DIVIDER, LIGHT_DIVIDER);
      this.declare(TOKEN_BRAND, LIGHT_BRAND);
      this.declare(TOKEN_WARNING, LIGHT_WARNING);
      this.declare(TOKEN_SUCCESS, LIGHT_SUCCESS);
    } else {
      this.declare(TOKEN_PAGE_BACKGROUND, DARK_PAGE_BACKGROUND);
      this.declare(TOKEN_CARD_BACKGROUND, DARK_CARD_BACKGROUND);
      this.declare(TOKEN_TITLE_FONT, DARK_TITLE_FONT);
      this.declare(TOKEN_BODY_FONT, DARK_BODY_FONT);
      this.declare(TOKEN_SECONDARY_FONT, DARK_SECONDARY_FONT);
      this.declare(TOKEN_DIVIDER, DARK_DIVIDER);
      this.declare(TOKEN_BRAND, DARK_BRAND);
      this.declare(TOKEN_WARNING, DARK_WARNING);
      this.declare(TOKEN_SUCCESS, DARK_SUCCESS);
    }
  }

  /**
   * @returns the theme of the palette.
   */
  public getMode(): ThemeMode {
    return this.mode;
  }

  /**
   * @returns the file name of the theme, which is the resource folder that carries the table.
   */
  public getThemeName(): string {
    return this.mode === ThemeMode.LIGHT ? THEME_LIGHT : THEME_DARK;
  }

  /**
   * Lists the tokens of the palette in declaration order.
   *
   * @returns one entry per token.
   */
  public tokenList(): ThemeToken[] {
    const result: ThemeToken[] = [];
    const keys: string[] = this.names();
    for (let i = 0; i < keys.length; i++) {
      result.push({ name: keys[i], value: this.resolve(keys[i]) });
    }
    return result;
  }

  /**
   * @returns the token names of the palette, in declaration order.
   */
  public names(): string[] {
    return this.order.slice();
  }

  /**
   * Declares one token, the name is also appended to the declaration order.
   *
   * @param name token name.
   * @param value token value.
   */
  private declare(name: string, value: string): void {
    this.tokens.set(name, value);
    this.order.push(name);
  }

  /**
   * @param name token name.
   * @returns the token value, an empty string when the palette has no such token.
   */
  public resolve(name: string): string {
    const value: string | undefined = this.tokens.get(name);
    return value === undefined ? '' : value;
  }

  /**
   * @param name token name.
   * @returns true when the palette declares the token.
   */
  public has(name: string): boolean {
    return this.tokens.has(name);
  }

  /**
   * @returns the number of tokens of the palette.
   */
  public size(): number {
    return this.tokens.size;
  }

  /**
   * Compares the token names with another palette, both themes must declare the same set so
   * that a theme switch never leaves a component without a color.
   *
   * @param other palette to compare with.
   * @returns the names that only one of the two palettes declares.
   */
  public diffNames(other: ThemePalette): string[] {
    const diff: string[] = [];
    const mine: string[] = this.names();
    for (let i = 0; i < mine.length; i++) {
      if (!other.has(mine[i])) {
        diff.push(mine[i]);
      }
    }
    const theirs: string[] = other.names();
    for (let i = 0; i < theirs.length; i++) {
      if (!this.has(theirs[i])) {
        diff.push(theirs[i]);
      }
    }
    return diff;
  }

  /**
   * Lists the tokens whose value differs from the other palette.
   *
   * @param other palette to compare with.
   * @returns the names of the tokens that change between the two themes.
   */
  public changedTokens(other: ThemePalette): string[] {
    const changed: string[] = [];
    const mine: string[] = this.names();
    for (let i = 0; i < mine.length; i++) {
      const otherValue: string = other.resolve(mine[i]);
      if (otherValue !== '' && otherValue !== this.resolve(mine[i])) {
        changed.push(mine[i]);
      }
    }
    return changed;
  }

  /**
   * @param name token name.
   * @param backgroundName name of the surface token.
   * @returns the contrast ratio of the token over the surface.
   */
  public ratioOn(name: string, backgroundName: string): number {
    return ThemeContrast.ratioOfHex(this.resolve(name), this.resolve(backgroundName));
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `ThemePalette{mode=${this.mode}, size=${this.tokens.size}}`;
  }
}

/**
 * Resolves a semantic token from the theme palettes and measures the resulting pairs.
 */
class ThemeStyleResolver {
  private light: ThemePalette;
  private dark: ThemePalette;
  private mode: ThemeMode = ThemeMode.LIGHT;

  /**
   * @param light light palette.
   * @param dark dark palette.
   */
  constructor(light: ThemePalette = new ThemePalette(ThemeMode.LIGHT),
    dark: ThemePalette = new ThemePalette(ThemeMode.DARK)) {
    this.light = light;
    this.dark = dark;
  }

  /**
   * @returns the active theme.
   */
  public getMode(): ThemeMode {
    return this.mode;
  }

  /**
   * Switches the active theme.
   *
   * @param mode theme to activate.
   */
  public setMode(mode: ThemeMode): void {
    this.mode = mode;
  }

  /**
   * @returns the palette of the active theme.
   */
  public active(): ThemePalette {
    return this.mode === ThemeMode.LIGHT ? this.light : this.dark;
  }

  /**
   * @param name token name.
   * @returns the value of the token in the active theme.
   */
  public resolve(name: string): string {
    return this.active().resolve(name);
  }

  /**
   * Builds the contrast pairs of the entry page for the active theme: the title and the body
   * font on the card, the secondary font on the card, and the button label on the brand.
   *
   * @returns the pairs that the audit checks.
   */
  public entryPagePairs(): ContrastPair[] {
    const pairs: ContrastPair[] = [];
    pairs.push({
      foreground: this.resolve(TOKEN_TITLE_FONT),
      background: this.resolve(TOKEN_CARD_BACKGROUND),
      label: 'title_on_card'
    });
    pairs.push({
      foreground: this.resolve(TOKEN_BODY_FONT),
      background: this.resolve(TOKEN_CARD_BACKGROUND),
      label: 'body_on_card'
    });
    pairs.push({
      foreground: this.resolve(TOKEN_SECONDARY_FONT),
      background: this.resolve(TOKEN_CARD_BACKGROUND),
      label: 'secondary_on_card'
    });
    pairs.push({
      foreground: this.resolve(TOKEN_CARD_BACKGROUND),
      background: this.resolve(TOKEN_BRAND),
      label: 'chip_label_on_brand'
    });
    return pairs;
  }

  /**
   * @param pair pair to judge.
   * @returns the contrast grade of the pair.
   */
  public gradeOf(pair: ContrastPair): ContrastGrade {
    return ThemeContrast.grade(ThemeContrast.ratioOfHex(pair.foreground, pair.background));
  }

  /**
   * Counts the pairs that stay below the normal text threshold.
   *
   * @returns the number of low contrast pairs of the active theme.
   */
  public lowContrastCount(): number {
    const pairs: ContrastPair[] = this.entryPagePairs();
    let count: number = 0;
    for (let i = 0; i < pairs.length; i++) {
      if (this.gradeOf(pairs[i]) === ContrastGrade.FAIL) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `ThemeStyleResolver{mode=${this.mode}, pairs=${this.entryPagePairs().length}}`;
  }
}

/**
 * Reads the text of a component, an empty string is returned when the read fails.
 *
 * @param component component to read.
 * @returns the text of the component.
 */
async function readTextSafely(component: Component): Promise<string> {
  try {
    return await getTextSerialized(component);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'readTextSafely failed: %{public}s', err.message);
    return '';
  }
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function guardEntryPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'guardEntryPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function themeVariationTest() {
  describe('ThemeVariation_Test', () => {
    let driver: Driver;
    let light: ThemePalette;
    let dark: ThemePalette;
    let resolver: ThemeStyleResolver;

    beforeAll(async () => {
      driver = getDriver();
      light = new ThemePalette(ThemeMode.LIGHT);
      dark = new ThemePalette(ThemeMode.DARK);
      resolver = new ThemeStyleResolver(light, dark);
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: both theme files are loaded into the model.
     * Expectation: the two palettes declare the same number of tokens and the light palette
     * carries the documented light surface.
     */
    it('Assessment_ThemeVariation_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_001, begin');
      const rendered: boolean = await guardEntryPage(driver);
      if (!rendered) {
        hilog.warn(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_001, skipped');
        return;
      }
      expect(light.size()).assertEqual(9);
      expect(dark.size()).assertEqual(9);
      expect(light.resolve(TOKEN_PAGE_BACKGROUND)).assertEqual(LIGHT_PAGE_BACKGROUND);
      expect(dark.resolve(TOKEN_PAGE_BACKGROUND)).assertEqual(DARK_PAGE_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s / %{public}s',
        BUNDLE + 'ThemeVariation_001', light.toString(), dark.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_001, end');
    });

    /**
     * Scenario: the token names of the two themes are compared.
     * Expectation: the difference is empty, so a theme switch never leaves a token unresolved.
     */
    it('Assessment_ThemeVariation_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_002, begin');
      const diff: string[] = light.diffNames(dark);
      hilog.info(DOMAIN, TAG, '%{public}s token name diff: %{public}d',
        BUNDLE + 'ThemeVariation_002', diff.length);
      expect(diff.length).assertEqual(0);
      expect(dark.diffNames(light).length).assertEqual(0);
      for (let i = 0; i < light.names().length; i++) {
        expect(dark.has(light.names()[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_002, end');
    });

    /**
     * Scenario: the tokens that change between the two themes.
     * Expectation: the surfaces, the fonts and the divider change, the brand, the warning and
     * the success color are shared, which is what the design system specifies.
     */
    it('Assessment_ThemeVariation_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_003, begin');
      const changed: string[] = light.changedTokens(dark);
      hilog.info(DOMAIN, TAG, '%{public}s changed tokens: %{public}s',
        BUNDLE + 'ThemeVariation_003', changed.join(','));
      expect(changed.indexOf(TOKEN_PAGE_BACKGROUND) >= 0).assertTrue();
      expect(changed.indexOf(TOKEN_CARD_BACKGROUND) >= 0).assertTrue();
      expect(changed.indexOf(TOKEN_TITLE_FONT) >= 0).assertTrue();
      expect(changed.indexOf(TOKEN_SECONDARY_FONT) >= 0).assertTrue();
      expect(changed.indexOf(TOKEN_DIVIDER) >= 0).assertTrue();
      expect(changed.indexOf(TOKEN_SUCCESS) < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_003, end');
    });

    /**
     * Scenario: the brand color of the two themes.
     * Expectation: the light theme uses the brighter brand and the dark theme the darker one,
     * which keeps the white label readable on both.
     */
    it('Assessment_ThemeVariation_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_004, begin');
      expect(light.resolve(TOKEN_BRAND)).assertEqual(LIGHT_BRAND);
      expect(dark.resolve(TOKEN_BRAND)).assertEqual(DARK_BRAND);
      expect(light.resolve(TOKEN_BRAND) === dark.resolve(TOKEN_BRAND)).assertFalse();
      const lightRatio: number = light.ratioOn(TOKEN_BRAND, TOKEN_CARD_BACKGROUND);
      const darkRatio: number = dark.ratioOn(TOKEN_BRAND, TOKEN_CARD_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s brand over card: light=%{public}s, dark=%{public}s',
        BUNDLE + 'ThemeVariation_004', lightRatio.toFixed(2), darkRatio.toFixed(2));
      expect(lightRatio > 1).assertTrue();
      expect(darkRatio > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_004, end');
    });

    /**
     * Scenario: the title font over the card in both themes.
     * Expectation: both pairs reach the AAA threshold, so the title stays legible after a
     * theme switch.
     */
    it('Assessment_ThemeVariation_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_005, begin');
      const lightRatio: number = light.ratioOn(TOKEN_TITLE_FONT, TOKEN_CARD_BACKGROUND);
      const darkRatio: number = dark.ratioOn(TOKEN_TITLE_FONT, TOKEN_CARD_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s title contrast: light=%{public}s, dark=%{public}s',
        BUNDLE + 'ThemeVariation_005', lightRatio.toFixed(2), darkRatio.toFixed(2));
      expect(ThemeContrast.grade(lightRatio)).assertEqual(ContrastGrade.AAA);
      expect(ThemeContrast.grade(darkRatio)).assertEqual(ContrastGrade.AAA);
      expect(lightRatio > 10).assertTrue();
      expect(darkRatio > 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_005, end');
    });

    /**
     * Scenario: the translucent secondary font token of each theme.
     * Expectation: the alpha blend over the card keeps the token above the large text
     * threshold but below the normal text threshold in the light theme.
     */
    it('Assessment_ThemeVariation_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_006, begin');
      const lightRatio: number = light.ratioOn(TOKEN_SECONDARY_FONT, TOKEN_CARD_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s secondary contrast: %{public}s',
        BUNDLE + 'ThemeVariation_006', lightRatio.toFixed(2));
      expect(lightRatio >= WCAG_AA_LARGE_TEXT).assertTrue();
      expect(lightRatio < WCAG_AA_NORMAL_TEXT).assertTrue();
      const blended: ThemeColor =
        ThemeColor.fromHex(LIGHT_SECONDARY_FONT).blendOver(ThemeColor.fromHex(LIGHT_CARD_BACKGROUND));
      expect(blended.isOpaque()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s blended: %{public}s',
        BUNDLE + 'ThemeVariation_006', blended.toCss());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_006, end');
    });

    /**
     * Scenario: the dark theme secondary font over the dark card.
     * Expectation: the pair passes the normal text threshold because the card is dark and the
     * font is light.
     */
    it('Assessment_ThemeVariation_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_007, begin');
      const ratio: number = dark.ratioOn(TOKEN_SECONDARY_FONT, TOKEN_CARD_BACKGROUND);
      hilog.info(DOMAIN, TAG, '%{public}s dark secondary contrast: %{public}s',
        BUNDLE + 'ThemeVariation_007', ratio.toFixed(2));
      expect(ratio >= WCAG_AA_NORMAL_TEXT).assertTrue();
      expect(ThemeContrast.gradeName(ThemeContrast.grade(ratio)) === 'Fail').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_007, end');
    });

    /**
     * Scenario: the divider token of each theme.
     * Expectation: the divider is translucent in both themes, so it blends with the card
     * instead of drawing a hard line.
     */
    it('Assessment_ThemeVariation_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_008, begin');
      const lightDivider: ThemeColor = ThemeColor.fromHex(LIGHT_DIVIDER);
      const darkDivider: ThemeColor = ThemeColor.fromHex(DARK_DIVIDER);
      expect(lightDivider.isOpaque()).assertFalse();
      expect(darkDivider.isOpaque()).assertFalse();
      expect(Math.abs(lightDivider.alpha - 0.05) < 0.01).assertTrue();
      expect(Math.abs(darkDivider.alpha - 0.05) < 0.01).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s divider alpha: light=%{public}s, dark=%{public}s',
        BUNDLE + 'ThemeVariation_008', lightDivider.alpha.toFixed(2), darkDivider.alpha.toFixed(2));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_008, end');
    });

    /**
     * Scenario: the semantic mapping of the status text.
     * Expectation: the active state uses the success token and the inactive state the secondary
     * font token, which is the documented binding of the status card.
     */
    it('Assessment_ThemeVariation_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_009, begin');
      const resolverProbe: ThemeStyleResolver = new ThemeStyleResolver(light, dark);
      expect(resolverProbe.resolve(TOKEN_SUCCESS)).assertEqual(LIGHT_SUCCESS);
      resolverProbe.setMode(ThemeMode.DARK);
      expect(resolverProbe.resolve(TOKEN_SUCCESS)).assertEqual(DARK_SUCCESS);
      expect(resolverProbe.resolve(TOKEN_SECONDARY_FONT)).assertEqual(DARK_SECONDARY_FONT);
      expect(resolverProbe.getMode()).assertEqual(ThemeMode.DARK);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'ThemeVariation_009', resolverProbe.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_009, end');
    });

    /**
     * Scenario: the warning token is used by the end button and the remove action.
     * Expectation: the warning token is identical in both themes, so the destructive action
     * keeps the same emphasis after a theme switch.
     */
    it('Assessment_ThemeVariation_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_010, begin');
      expect(light.resolve(TOKEN_WARNING)).assertEqual(LIGHT_WARNING);
      expect(dark.resolve(TOKEN_WARNING)).assertEqual(DARK_WARNING);
      expect(light.resolve(TOKEN_WARNING)).assertEqual(dark.resolve(TOKEN_WARNING));
      expect(light.resolve(TOKEN_SUCCESS)).assertEqual(dark.resolve(TOKEN_SUCCESS));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_010, end');
    });

    /**
     * Scenario: the complete pair audit of the entry page in the light theme.
     * Expectation: only the button label on the brand and the secondary font fall below the
     * normal threshold, the title and the body pass.
     */
    it('Assessment_ThemeVariation_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_011, begin');
      resolver.setMode(ThemeMode.LIGHT);
      const pairs: ContrastPair[] = resolver.entryPagePairs();
      expect(pairs.length).assertEqual(4);
      for (let i = 0; i < pairs.length; i++) {
        const grade: ContrastGrade = resolver.gradeOf(pairs[i]);
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s grade: %{public}s',
          BUNDLE + 'ThemeVariation_011', pairs[i].label, ThemeContrast.gradeName(grade));
      }
      expect(resolver.gradeOf(pairs[0])).assertEqual(ContrastGrade.AAA);
      expect(resolver.gradeOf(pairs[1])).assertEqual(ContrastGrade.AAA);
      expect(resolver.gradeOf(pairs[2])).assertEqual(ContrastGrade.AA_LARGE);
      expect(resolver.gradeOf(pairs[3])).assertEqual(ContrastGrade.AA_LARGE);
      expect(resolver.lowContrastCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_011, end');
    });

    /**
     * Scenario: the same pair audit in the dark theme.
     * Expectation: the secondary font improves because the dark card is much darker than the
     * font, so the audit reports a better grade for it.
     */
    it('Assessment_ThemeVariation_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_012, begin');
      resolver.setMode(ThemeMode.DARK);
      const pairs: ContrastPair[] = resolver.entryPagePairs();
      const secondaryRatio: number = ThemeContrast.ratioOfHex(pairs[2].foreground, pairs[2].background);
      hilog.info(DOMAIN, TAG, '%{public}s dark secondary ratio: %{public}s',
        BUNDLE + 'ThemeVariation_012', secondaryRatio.toFixed(2));
      expect(secondaryRatio >= WCAG_AA_NORMAL_TEXT).assertTrue();
      expect(resolver.getMode()).assertEqual(ThemeMode.DARK);
      expect(resolver.lowContrastCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_012, end');
    });

    /**
     * Scenario: a token name that neither palette declares.
     * Expectation: the resolver returns an empty string and the palette reports the miss, so a
     * typo in a component does not silently fall back to another token.
     */
    it('Assessment_ThemeVariation_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_013, begin');
      expect(light.resolve('missing_token')).assertEqual('');
      expect(light.has('missing_token')).assertFalse();
      expect(dark.resolve('missing_token')).assertEqual('');
      expect(dark.has(TOKEN_BRAND)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_013, end');
    });

    /**
     * Scenario: the contrast helper is symmetric and a color against itself yields one.
     * Expectation: both properties hold for a token pair of the light theme.
     */
    it('Assessment_ThemeVariation_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_015, begin');
      const title: ThemeColor = ThemeColor.fromHex(LIGHT_TITLE_FONT);
      const card: ThemeColor = ThemeColor.fromHex(LIGHT_CARD_BACKGROUND);
      const forward: number = ThemeContrast.ratio(title, card);
      const backward: number = ThemeContrast.ratio(card, title);
      expect(Math.abs(forward - backward) < 0.0001).assertTrue();
      const same: number = ThemeContrast.ratio(card, card);
      expect(Math.abs(same - 1) < 0.0001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_015, end');
    });

    /**
     * Scenario: the theme resolver is reconstructed for every case.
     * Expectation: two independent resolvers start in the light theme, which keeps the cases
     * independent from each other.
     */
    it('Assessment_ThemeVariation_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_019, begin');
      const first: ThemeStyleResolver = new ThemeStyleResolver();
      const second: ThemeStyleResolver = new ThemeStyleResolver();
      expect(first.getMode()).assertEqual(ThemeMode.LIGHT);
      expect(second.getMode()).assertEqual(ThemeMode.LIGHT);
      first.setMode(ThemeMode.DARK);
      expect(first.getMode()).assertEqual(ThemeMode.DARK);
      expect(second.getMode()).assertEqual(ThemeMode.LIGHT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_019, end');
    });

    /**
     * Scenario: the palette description is used in a triage.
     * Expectation: the description carries the theme and the token count, the theme name is the
     * resource folder of the table and every token list entry pairs a name with a value.
     */
    it('Assessment_ThemeVariation_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_020, begin');
      const text: string = dark.toString();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ThemeVariation_020', text);
      expect(text.indexOf('size=9') >= 0).assertTrue();
      expect(dark.getMode()).assertEqual(ThemeMode.DARK);
      expect(light.getMode()).assertEqual(ThemeMode.LIGHT);
      expect(dark.getThemeName()).assertEqual(THEME_DARK);
      expect(light.getThemeName()).assertEqual(THEME_LIGHT);
      const tokens: ThemeToken[] = dark.tokenList();
      expect(tokens.length).assertEqual(dark.size());
      let mismatched: number = 0;
      for (let i = 0; i < tokens.length; i++) {
        if (tokens[i].value !== dark.resolve(tokens[i].name) || tokens[i].name.length === 0) {
          mismatched++;
        }
      }
      expect(mismatched).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThemeVariation_020, end');
    });
  });
}
