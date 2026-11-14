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
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TYPE_TEXT,
  TYPE_BUTTON,
  TEXT_WHITELIST_EMPTY,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_ACTION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  findComponentsByType,
  indexComponentCount,
  checkTextContent,
  containsTextFragment,
  collectTexts,
  waitForIndexPage,
  waitForStableIndex,
  isComponentEnabled,
  clickComponent,
  hideSoftKeyboard,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The sample declares every size in vp and every font in fp. A vp is one logical pixel and the
// rendered size of a vp depends on the density of the screen, the model uses the density of the
// reference device so that the numbers of the model and of the rendered page can be compared.
const DENSITY_RATIO: number = 3;

// The font scale candidates that the accessibility setting exposes. The scale multiplies every
// fp value of the sample, the vp values stay untouched.
const FONT_SCALE_COMPACT: number = 0.85;
const FONT_SCALE_NORMAL: number = 1.0;
const FONT_SCALE_MEDIUM: number = 1.15;
const FONT_SCALE_LARGE: number = 1.3;
const FONT_SCALE_MAXIMUM: number = 2.0;

// The font tokens of resources/base/element/float.json.
const FONT_SIZE_TITLE_FP: number = 24;
const FONT_SIZE_SECTION_FP: number = 18;
const FONT_SIZE_BODY_FP: number = 16;
const FONT_SIZE_CAPTION_FP: number = 14;

// The spacing tokens of resources/base/element/float.json.
const PAGE_PADDING_VP: number = 16;
const CARD_PADDING_VP: number = 16;
const CARD_SPACE_VP: number = 12;
const ROW_SPACE_VP: number = 8;

// The declared heights of the components of the entry page.
const OPERATION_BUTTON_HEIGHT_VP: number = 44;
const INPUT_HEIGHT_VP: number = 40;
const REMOVE_BUTTON_HEIGHT_VP: number = 28;

// The minimal touch target that the design system recommends for a primary action.
const MIN_TAP_TARGET_VP: number = 44;

// Geometry of the reference viewport. The entry page is a List that fills the window, the cards
// sit inside the page padding and their content sits inside the card padding.
const VIEWPORT_WIDTH_VP: number = 360;
const VIEWPORT_HEIGHT_VP: number = 780;

// The width of the remove button of a whitelist row is not declared, the design fixes it at the
// width of the localized Remove label plus the horizontal padding of the button.
const REMOVE_BUTTON_WIDTH_VP: number = 72;

// The width that the ellipsis of a single line Text occupies when the text overflows.
const ELLIPSIS_WIDTH_VP: number = 10;

// The average advance of a character of the default font, expressed as a fraction of the font
// size. The number is used to estimate how many characters fit into a column.
const AVERAGE_CHAR_WIDTH_RATIO: number = 0.55;

// A line box takes more vertical space than the font size, the extra leading is the line height
// multiplier of the default text style.
const LINE_HEIGHT_MULTIPLIER: number = 1.4;

// The longest bundle name that the suite types into the whitelist. The sample keeps the row on a
// single line, so the name is rendered with an ellipsis.
const LONG_BUNDLE_NAME: string = 'com.samples.assessment.with.a.very.long.bundle.name.for.scaling';

// The documented duration chip labels of the config card.
const TEXT_DURATION_DEFAULT: string = 'Default duration';
const TEXT_DURATION_TEN: string = '10 min';
const TEXT_DURATION_THIRTY: string = '30 min';
const TEXT_DURATION_SIXTY: string = '60 min';
const TEXT_BEGIN_LABEL: string = 'begin';
const TEXT_ADD_LABEL: string = 'Add';

/**
 * The named font scale levels of the accessibility setting.
 *
 * The enumeration is numeric so that the levels can be ordered, the human readable name is
 * carried by the ScaleSpec that is paired with every level.
 */
enum FontScaleLevel {
  COMPACT = 0,
  NORMAL = 1,
  MEDIUM = 2,
  LARGE = 3,
  MAXIMUM = 4
}

/**
 * One font scale candidate with its multiplier and its human readable name.
 */
class ScaleSpec {
  public level: FontScaleLevel = FontScaleLevel.NORMAL;
  public name: string = '';
  public factor: number = FONT_SCALE_NORMAL;

  constructor(level: FontScaleLevel = FontScaleLevel.NORMAL, name: string = '',
    factor: number = FONT_SCALE_NORMAL) {
    this.level = level;
    this.name = name;
    this.factor = factor;
  }

  /**
   * Scenario: a font size token is rendered at the scaled size.
   * Expectation: the size in fp is multiplied by the factor of the level.
   *
   * @param fontSizeFp declared font size in fp.
   * @returns the rendered font size in fp.
   */
  public scaledSizeFp(fontSizeFp: number): number {
    return fontSizeFp * this.factor;
  }

  /**
   * Scenario: a font size token is converted into physical pixels.
   * Expectation: the scaled fp value is multiplied by the density ratio.
   *
   * @param fontSizeFp declared font size in fp.
   * @returns the rendered font size in px.
   */
  public scaledSizePx(fontSizeFp: number): number {
    return this.scaledSizeFp(fontSizeFp) * DENSITY_RATIO;
  }

  /**
   * Scenario: the level name is written into the log lines.
   * Expectation: the name and the factor describe the same level.
   *
   * @returns a compact description of the level.
   */
  public toString(): string {
    return `ScaleSpec{name=${this.name}, factor=${this.factor}}`;
  }
}

/**
 * Text measurement of the default font.
 *
 * The helpers are deterministic estimates, they are not a replacement for a real text measure,
 * but they reproduce the direction of every effect that the suite audits: a larger font scale
 * needs more horizontal room for the same string and produces a taller line box.
 */
class TextMetrics {
  /**
   * Scenario: a length in vp is converted into physical pixels.
   * Expectation: the conversion is linear and uses the density of the screen.
   *
   * @param vpValue length in vp.
   * @returns the same length in px.
   */
  public static vpToPx(vpValue: number): number {
    return vpValue * DENSITY_RATIO;
  }

  /**
   * Scenario: a length in px is converted back into vp.
   * Expectation: the round trip of the two conversions is lossless for integral inputs.
   *
   * @param pxValue length in px.
   * @returns the same length in vp.
   */
  public static pxToVp(pxValue: number): number {
    return pxValue / DENSITY_RATIO;
  }

  /**
   * Scenario: the advance of one character of the default font.
   * Expectation: the advance grows linearly with the font size and with the scale factor.
   *
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns the estimated character width in vp.
   */
  public static charWidthVp(fontSizeFp: number, factor: number): number {
    return fontSizeFp * factor * AVERAGE_CHAR_WIDTH_RATIO;
  }

  /**
   * Scenario: the height of one line box.
   * Expectation: the box is taller than the font size and grows with the scale factor.
   *
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns the estimated line height in vp.
   */
  public static lineHeightVp(fontSizeFp: number, factor: number): number {
    return fontSizeFp * factor * LINE_HEIGHT_MULTIPLIER;
  }

  /**
   * Scenario: the estimated width of a single line string.
   * Expectation: the width is the character count times the character advance.
   *
   * @param text text to measure.
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns the estimated width in vp.
   */
  public static textWidthVp(text: string, fontSizeFp: number, factor: number): number {
    return text.length * TextMetrics.charWidthVp(fontSizeFp, factor);
  }

  /**
   * Scenario: a single line text is laid out in a column of a known width.
   * Expectation: the text fits when its estimated width does not exceed the column.
   *
   * @param text text to lay out.
   * @param columnVp available column width in vp.
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns true when the text fits without an ellipsis.
   */
  public static fitsSingleLine(text: string, columnVp: number, fontSizeFp: number, factor: number): boolean {
    return TextMetrics.textWidthVp(text, fontSizeFp, factor) <= columnVp;
  }

  /**
   * Scenario: a single line text is laid out with an ellipsis when it does not fit.
   * Expectation: the ellipsis reserves a fixed width, the rest of the column carries characters.
   *
   * @param text text to lay out.
   * @param columnVp available column width in vp.
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns the number of characters that remain visible before the ellipsis.
   */
  public static visibleChars(text: string, columnVp: number, fontSizeFp: number, factor: number): number {
    const charWidth: number = TextMetrics.charWidthVp(fontSizeFp, factor);
    if (charWidth <= 0) {
      return 0;
    }
    const usableWidth: number = Math.max(0, columnVp - ELLIPSIS_WIDTH_VP);
    const visible: number = Math.floor(usableWidth / charWidth);
    return visible > text.length ? text.length : visible;
  }

  /**
   * Scenario: the truncation ratio of a long bundle name.
   * Expectation: the ratio lies between zero and one and grows with the font scale.
   *
   * @param text text to lay out.
   * @param columnVp available column width in vp.
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns the share of characters that are hidden behind the ellipsis.
   */
  public static truncationRatio(text: string, columnVp: number, fontSizeFp: number, factor: number): number {
    if (text.length === 0) {
      return 0;
    }
    const visible: number = TextMetrics.visibleChars(text, columnVp, fontSizeFp, factor);
    return (text.length - visible) / text.length;
  }

  /**
   * Scenario: a paragraph is laid out in a fixed width column.
   * Expectation: the estimated line count grows with the font scale and never drops below one.
   *
   * @param text paragraph to lay out.
   * @param columnVp available column width in vp.
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns the estimated number of lines.
   */
  public static lineCount(text: string, columnVp: number, fontSizeFp: number, factor: number): number {
    const width: number = TextMetrics.textWidthVp(text, fontSizeFp, factor);
    if (columnVp <= 0 || width <= columnVp) {
      return 1;
    }
    return Math.ceil(width / columnVp);
  }
}

/**
 * A rectangular layout box of a rendered component.
 */
class LayoutBox {
  public id: string = '';
  public widthVp: number = 0;
  public heightVp: number = 0;
  public layoutWeight: number = 0;

  constructor(id: string = '', widthVp: number = 0, heightVp: number = 0, layoutWeight: number = 0) {
    this.id = id;
    this.widthVp = widthVp;
    this.heightVp = heightVp;
    this.layoutWeight = layoutWeight;
  }

  /**
   * Scenario: a box that is laid out with a weight and has no declared width.
   * Expectation: the box claims the free space in proportion to its weight.
   *
   * @param availableVp width that the row distributes.
   * @param totalWeight sum of the weights of the row.
   * @returns the width of the box in vp.
   */
  public weightedWidthVp(availableVp: number, totalWeight: number): number {
    if (totalWeight <= 0) {
      return 0;
    }
    return availableVp * this.layoutWeight / totalWeight;
  }

  /**
   * Scenario: the tap target audit of a component.
   * Expectation: a declared height of at least forty four vp passes, a shorter one fails.
   *
   * @returns true when the declared height satisfies the minimum tap target.
   */
  public meetsTapTarget(): boolean {
    return this.heightVp >= MIN_TAP_TARGET_VP;
  }

  /**
   * Scenario: the height of a box that must hold one line of its own text.
   * Expectation: the declared height wins until the line box outgrows it.
   *
   * @param fontSizeFp declared font size in fp.
   * @param factor font scale factor.
   * @returns the effective height in vp.
   */
  public effectiveHeightVp(fontSizeFp: number, factor: number): number {
    return Math.max(this.heightVp, TextMetrics.lineHeightVp(fontSizeFp, factor));
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `LayoutBox{id=${this.id}, width=${this.widthVp}, height=${this.heightVp}, ` +
      `weight=${this.layoutWeight}}`;
  }
}

/**
 * The result of one scaling observation.
 */
interface ScalingSample {
  level: FontScaleLevel;
  name: string;
  titleHeightVp: number;
  captionFits: boolean;
  tapTargetMet: boolean;
}

/**
 * Audit of the scaling samples that the suite collects.
 *
 * The audit keeps the samples and computes the aggregates, so that the live cases and the model
 * cases report their observations through the same bookkeeping.
 */
class ScalingAudit {
  private samples: ScalingSample[] = [];

  /**
   * Scenario: a sample is appended to the audit.
   * Expectation: the sample keeps the level and the measured values.
   *
   * @param sample sample to append.
   */
  public append(sample: ScalingSample): void {
    this.samples.push(sample);
  }

  /**
   * @returns the number of collected samples.
   */
  public size(): number {
    return this.samples.length;
  }

  /**
   * @returns the number of samples whose caption still fit the column.
   */
  public fittingCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].captionFits) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns the number of samples whose tap target was met.
   */
  public tapTargetCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].tapTargetMet) {
        count++;
      }
    }
    return count;
  }

  /**
   * @param level font scale level to look for.
   * @returns the first sample of the level, null when the level was not observed.
   */
  public sampleOf(level: FontScaleLevel): ScalingSample | null {
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].level === level) {
        return this.samples[i];
      }
    }
    return null;
  }

  /**
   * @returns the share of samples with a fitting caption, zero for an empty audit.
   */
  public fittingRate(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.fittingCount() / this.samples.length;
  }

  /**
   * @returns the sample with the tallest title box, null for an empty audit.
   */
  public tallestTitle(): ScalingSample | null {
    if (this.samples.length === 0) {
      return null;
    }
    let best: ScalingSample = this.samples[0];
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].titleHeightVp > best.titleHeightVp) {
        best = this.samples[i];
      }
    }
    return best;
  }

  /**
   * Clears every sample.
   */
  public reset(): void {
    this.samples = [];
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `ScalingAudit{samples=${this.samples.length}, fitting=${this.fittingCount()}}`;
  }
}

/**
 * Builds the ordered list of font scale candidates.
 *
 * @returns the scale specifications in ascending order.
 */
function buildScaleLevels(): ScaleSpec[] {
  return [
    new ScaleSpec(FontScaleLevel.COMPACT, 'compact', FONT_SCALE_COMPACT),
    new ScaleSpec(FontScaleLevel.NORMAL, 'normal', FONT_SCALE_NORMAL),
    new ScaleSpec(FontScaleLevel.MEDIUM, 'medium', FONT_SCALE_MEDIUM),
    new ScaleSpec(FontScaleLevel.LARGE, 'large', FONT_SCALE_LARGE),
    new ScaleSpec(FontScaleLevel.MAXIMUM, 'maximum', FONT_SCALE_MAXIMUM)
  ];
}

/**
 * @param levels scale candidates.
 * @param level level to look for.
 * @returns the specification of the level, null when the level is absent.
 */
function findScale(levels: ScaleSpec[], level: FontScaleLevel): ScaleSpec | null {
  for (let i = 0; i < levels.length; i++) {
    if (levels[i].level === level) {
      return levels[i];
    }
  }
  return null;
}

/**
 * The width that a card gives to its content.
 *
 * @param cardPaddingVp horizontal padding of one side of the card.
 * @returns the content width in vp.
 */
function cardContentWidthVp(cardPaddingVp: number): number {
  return VIEWPORT_WIDTH_VP - 2 * PAGE_PADDING_VP - 2 * cardPaddingVp;
}

/**
 * The width of the column of the bundle names inside a whitelist row.
 *
 * @returns the column width in vp.
 */
function whitelistNameColumnVp(): number {
  return cardContentWidthVp(CARD_PADDING_VP) - ROW_SPACE_VP - REMOVE_BUTTON_WIDTH_VP;
}

/**
 * Reads the text of a component and normalizes a driver failure to an empty string.
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
 * Makes sure that the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const title: Component | null = await findById(driver, ID_INDEX_TITLE);
  if (title !== null) {
    return true;
  }
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'ensureIndexPage: the entry page is not rendered');
  }
  return rendered;
}

export default function contentScalingTest() {
  describe('ContentScaling_Test', () => {
    let driver: Driver;
    let levels: ScaleSpec[];
    let audit: ScalingAudit;

    beforeAll(async () => {
      driver = getDriver();
      levels = buildScaleLevels();
      audit = new ScalingAudit();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
      hilog.info(DOMAIN, TAG, 'ContentScaling_Test beforeAll, %{public}d levels', levels.length);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the scale candidate table is complete.
     * Expectation: five levels are declared, the values ascend and the normal level is the
     * identity of the scale.
     */
    it('Assessment_ContentScaling_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_003, begin');
      expect(levels.length).assertEqual(5);
      expect(levels[0].factor).assertEqual(FONT_SCALE_COMPACT);
      expect(levels[1].factor).assertEqual(FONT_SCALE_NORMAL);
      expect(levels[4].factor).assertEqual(FONT_SCALE_MAXIMUM);
      for (let i = 1; i < levels.length; i++) {
        expect(levels[i].factor > levels[i - 1].factor).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
          BUNDLE + 'ContentScaling_003', levels[i].toString());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_003, end');
    });

    /**
     * Scenario: the vp to px conversion of the model.
     * Expectation: the conversion is linear, the round trip is lossless and zero maps to zero.
     */
    it('Assessment_ContentScaling_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_004, begin');
      expect(TextMetrics.vpToPx(0)).assertEqual(0);
      expect(TextMetrics.vpToPx(1)).assertEqual(DENSITY_RATIO);
      expect(TextMetrics.vpToPx(44)).assertEqual(44 * DENSITY_RATIO);
      expect(TextMetrics.pxToVp(TextMetrics.vpToPx(44))).assertEqual(44);
      expect(TextMetrics.pxToVp(TextMetrics.vpToPx(360))).assertEqual(VIEWPORT_WIDTH_VP);
      hilog.info(DOMAIN, TAG, '%{public}s 44vp -> %{public}d px',
        BUNDLE + 'ContentScaling_004', TextMetrics.vpToPx(44));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_004, end');
    });

    /**
     * Scenario: the title font token is rendered at every scale.
     * Expectation: the rendered size equals the token multiplied by the factor, and the normal
     * level keeps the declared token untouched.
     */
    it('Assessment_ContentScaling_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_005, begin');
      const normal: ScaleSpec | null = findScale(levels, FontScaleLevel.NORMAL);
      expect(normal !== null).assertTrue();
      if (normal !== null) {
        expect(normal.scaledSizeFp(FONT_SIZE_TITLE_FP)).assertEqual(FONT_SIZE_TITLE_FP);
        expect(normal.scaledSizePx(FONT_SIZE_TITLE_FP)).assertEqual(FONT_SIZE_TITLE_FP * DENSITY_RATIO);
      }
      const maximum: ScaleSpec | null = findScale(levels, FontScaleLevel.MAXIMUM);
      expect(maximum !== null).assertTrue();
      if (maximum !== null) {
        const scaled: number = maximum.scaledSizeFp(FONT_SIZE_TITLE_FP);
        hilog.info(DOMAIN, TAG, '%{public}s maximum title size: %{public}s',
          BUNDLE + 'ContentScaling_005', scaled.toFixed(1));
        expect(scaled).assertEqual(FONT_SIZE_TITLE_FP * FONT_SCALE_MAXIMUM);
        expect(scaled > FONT_SIZE_TITLE_FP).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_005, end');
    });

    /**
     * Scenario: the compact level shrinks the title.
     * Expectation: every token of the compact level is smaller than the same token at the
     * normal level.
     */
    it('Assessment_ContentScaling_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_006, begin');
      const compact: ScaleSpec | null = findScale(levels, FontScaleLevel.COMPACT);
      expect(compact !== null).assertTrue();
      if (compact !== null) {
        expect(compact.scaledSizeFp(FONT_SIZE_TITLE_FP) < FONT_SIZE_TITLE_FP).assertTrue();
        expect(compact.scaledSizeFp(FONT_SIZE_SECTION_FP) < FONT_SIZE_SECTION_FP).assertTrue();
        expect(compact.scaledSizeFp(FONT_SIZE_BODY_FP) < FONT_SIZE_BODY_FP).assertTrue();
        expect(compact.scaledSizeFp(FONT_SIZE_CAPTION_FP) < FONT_SIZE_CAPTION_FP).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_006, end');
    });

    /**
     * Scenario: the body and the caption tokens keep their order at every scale.
     * Expectation: the title is larger than the section, the section larger than the body and
     * the body larger than the caption, which keeps the visual hierarchy intact.
     */
    it('Assessment_ContentScaling_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_007, begin');
      for (let i = 0; i < levels.length; i++) {
        const spec: ScaleSpec = levels[i];
        const title: number = spec.scaledSizeFp(FONT_SIZE_TITLE_FP);
        const section: number = spec.scaledSizeFp(FONT_SIZE_SECTION_FP);
        const body: number = spec.scaledSizeFp(FONT_SIZE_BODY_FP);
        const caption: number = spec.scaledSizeFp(FONT_SIZE_CAPTION_FP);
        expect(title > section).assertTrue();
        expect(section > body).assertTrue();
        expect(body > caption).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_007, end');
    });

    /**
     * Scenario: the line box of the title grows with the scale.
     * Expectation: the line height is larger than the font size and strictly monotonic over the
     * five levels.
     */
    it('Assessment_ContentScaling_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_008, begin');
      let previous: number = 0;
      for (let i = 0; i < levels.length; i++) {
        const height: number = TextMetrics.lineHeightVp(FONT_SIZE_TITLE_FP, levels[i].factor);
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s line height: %{public}s',
          BUNDLE + 'ContentScaling_008', levels[i].name, height.toFixed(2));
        expect(height > levels[i].scaledSizeFp(FONT_SIZE_TITLE_FP)).assertTrue();
        expect(height > previous).assertTrue();
        previous = height;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_008, end');
    });

    /**
     * Scenario: the default bundle name of the whitelist is laid out at the normal level.
     * Expectation: the name fits the column without an ellipsis and nothing is truncated.
     */
    it('Assessment_ContentScaling_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_009, begin');
      const column: number = whitelistNameColumnVp();
      const name: string = 'com.samples.assessment';
      const fits: boolean = TextMetrics.fitsSingleLine(name, column, FONT_SIZE_CAPTION_FP,
        FONT_SCALE_NORMAL);
      const width: number = TextMetrics.textWidthVp(name, FONT_SIZE_CAPTION_FP, FONT_SCALE_NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s column: %{public}d, width: %{public}s',
        BUNDLE + 'ContentScaling_009', column, width.toFixed(1));
      expect(column > 0).assertTrue();
      expect(fits).assertTrue();
      expect(TextMetrics.truncationRatio(name, column, FONT_SIZE_CAPTION_FP, FONT_SCALE_NORMAL))
        .assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_009, end');
    });

    /**
     * Scenario: the truncation of a long bundle name at every font scale.
     * Expectation: the hidden share never shrinks when the scale grows, which is the monotonic
     * behaviour that the ellipsis policy of the sample relies on.
     */
    it('Assessment_ContentScaling_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_011, begin');
      const column: number = whitelistNameColumnVp();
      let previous: number = -1;
      for (let i = 0; i < levels.length; i++) {
        const ratio: number = TextMetrics.truncationRatio(LONG_BUNDLE_NAME, column,
          FONT_SIZE_CAPTION_FP, levels[i].factor);
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s ratio: %{public}s',
          BUNDLE + 'ContentScaling_011', levels[i].name, ratio.toFixed(3));
        expect(ratio >= previous).assertTrue();
        previous = ratio;
      }
      expect(previous > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_011, end');
    });

    /**
     * Scenario: the truncation reaches a single character at the maximum scale.
     * Expectation: at least the first character of the bundle name stays visible and the
     * ellipsis never consumes the entire column.
     */
    it('Assessment_ContentScaling_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_012, begin');
      const column: number = whitelistNameColumnVp();
      const visible: number = TextMetrics.visibleChars(LONG_BUNDLE_NAME, column, FONT_SIZE_CAPTION_FP,
        FONT_SCALE_MAXIMUM);
      hilog.info(DOMAIN, TAG, '%{public}s visible characters at maximum: %{public}d',
        BUNDLE + 'ContentScaling_012', visible);
      expect(visible >= 1).assertTrue();
      expect(visible <= LONG_BUNDLE_NAME.length).assertTrue();
      const ratio: number = TextMetrics.truncationRatio(LONG_BUNDLE_NAME, column, FONT_SIZE_CAPTION_FP,
        FONT_SCALE_MAXIMUM);
      expect(ratio < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_012, end');
    });

    /**
     * Scenario: a very narrow column.
     * Expectation: the model refuses to divide by zero and reports no visible character when
     * the ellipsis already fills the column.
     */
    it('Assessment_ContentScaling_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_013, begin');
      expect(TextMetrics.visibleChars(LONG_BUNDLE_NAME, 0, FONT_SIZE_CAPTION_FP,
        FONT_SCALE_NORMAL)).assertEqual(0);
      expect(TextMetrics.visibleChars(LONG_BUNDLE_NAME, ELLIPSIS_WIDTH_VP, FONT_SIZE_CAPTION_FP,
        FONT_SCALE_NORMAL)).assertEqual(0);
      expect(TextMetrics.truncationRatio('', whitelistNameColumnVp(), FONT_SIZE_CAPTION_FP,
        FONT_SCALE_NORMAL)).assertEqual(0);
      expect(TextMetrics.charWidthVp(FONT_SIZE_CAPTION_FP, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_013, end');
    });

    /**
     * Scenario: the two operation buttons share the row by weight.
     * Expectation: both boxes claim the same width, the space between them is removed from the
     * distributable width and the sum plus the space equals the row width.
     */
    it('Assessment_ContentScaling_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_014, begin');
      const rowWidth: number = cardContentWidthVp(CARD_PADDING_VP);
      const distributable: number = rowWidth - CARD_SPACE_VP;
      const begin: LayoutBox = new LayoutBox(ID_BEGIN_BUTTON, 0, OPERATION_BUTTON_HEIGHT_VP, 1);
      const end: LayoutBox = new LayoutBox(ID_END_BUTTON, 0, OPERATION_BUTTON_HEIGHT_VP, 1);
      const beginWidth: number = begin.weightedWidthVp(distributable, 2);
      const endWidth: number = end.weightedWidthVp(distributable, 2);
      hilog.info(DOMAIN, TAG, '%{public}s row: %{public}d, each: %{public}s',
        BUNDLE + 'ContentScaling_014', rowWidth, beginWidth.toFixed(1));
      expect(beginWidth).assertEqual(endWidth);
      expect(beginWidth * 2 + CARD_SPACE_VP).assertEqual(rowWidth);
      expect(beginWidth > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_014, end');
    });

    /**
     * Scenario: a weighted box with a zero weight.
     * Expectation: the box claims no width, the free space is not distributed to it and the
     * helper never divides by zero.
     */
    it('Assessment_ContentScaling_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_015, begin');
      const box: LayoutBox = new LayoutBox(ID_BUNDLE_INPUT, 0, INPUT_HEIGHT_VP, 0);
      expect(box.weightedWidthVp(200, 1)).assertEqual(0);
      expect(box.weightedWidthVp(200, 0)).assertEqual(0);
      expect(box.meetsTapTarget()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ContentScaling_015', box.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_015, end');
    });

    /**
     * Scenario: the input box and the add button share their row.
     * Expectation: the input claims the remaining width after the add button was laid out, so
     * the weighted input is wider than the button.
     */
    it('Assessment_ContentScaling_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_016, begin');
      const rowWidth: number = cardContentWidthVp(CARD_PADDING_VP);
      const add: LayoutBox = new LayoutBox(ID_ADD_BUTTON, 80, INPUT_HEIGHT_VP, 0);
      const input: LayoutBox = new LayoutBox(ID_BUNDLE_INPUT, 0, INPUT_HEIGHT_VP, 1);
      const inputWidth: number = input.weightedWidthVp(rowWidth - ROW_SPACE_VP - add.widthVp, 1);
      hilog.info(DOMAIN, TAG, '%{public}s input width: %{public}s',
        BUNDLE + 'ContentScaling_016', inputWidth.toFixed(1));
      expect(inputWidth).assertEqual(rowWidth - ROW_SPACE_VP - add.widthVp);
      expect(inputWidth > add.widthVp).assertTrue();
      expect(inputWidth > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_016, end');
    });

    /**
     * Scenario: the tap target audit of the operation buttons.
     * Expectation: the declared height of forty four vp meets the minimum at every scale,
     * because a vp value is not affected by the font scale.
     */
    it('Assessment_ContentScaling_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_017, begin');
      const box: LayoutBox = new LayoutBox(ID_BEGIN_BUTTON, 0, OPERATION_BUTTON_HEIGHT_VP, 1);
      expect(box.meetsTapTarget()).assertTrue();
      for (let i = 0; i < levels.length; i++) {
        const effective: number = box.effectiveHeightVp(FONT_SIZE_CAPTION_FP, levels[i].factor);
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s effective height: %{public}s',
          BUNDLE + 'ContentScaling_017', levels[i].name, effective.toFixed(2));
        expect(effective >= MIN_TAP_TARGET_VP).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_017, end');
    });

    /**
     * Scenario: the tap target audit of the remove button.
     * Expectation: the relaxed secondary action keeps its declared twenty eight vp, which is
     * below the primary threshold and is therefore reported as a violation by the strict audit.
     */
    it('Assessment_ContentScaling_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_018, begin');
      const remove: LayoutBox = new LayoutBox('assessment_remove_button', REMOVE_BUTTON_WIDTH_VP,
        REMOVE_BUTTON_HEIGHT_VP, 0);
      expect(remove.meetsTapTarget()).assertFalse();
      expect(REMOVE_BUTTON_HEIGHT_VP < MIN_TAP_TARGET_VP).assertTrue();
      expect(remove.effectiveHeightVp(FONT_SIZE_CAPTION_FP, FONT_SCALE_NORMAL) >= REMOVE_BUTTON_HEIGHT_VP)
        .assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ContentScaling_018', remove.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_018, end');
    });

    /**
     * Scenario: a declared height that is outgrown by its own line box.
     * Expectation: the effective height follows the line box at the maximum scale and the
     * declared height wins at the compact scale.
     */
    it('Assessment_ContentScaling_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_019, begin');
      const chip: LayoutBox = new LayoutBox('assessment_duration_chip', 90, 28, 0);
      const compactHeight: number = chip.effectiveHeightVp(FONT_SIZE_CAPTION_FP, FONT_SCALE_COMPACT);
      const maximumHeight: number = chip.effectiveHeightVp(FONT_SIZE_CAPTION_FP, FONT_SCALE_MAXIMUM);
      hilog.info(DOMAIN, TAG, '%{public}s compact: %{public}s, maximum: %{public}s',
        BUNDLE + 'ContentScaling_019', compactHeight.toFixed(2), maximumHeight.toFixed(2));
      expect(compactHeight).assertEqual(28);
      expect(maximumHeight > 28).assertTrue();
      expect(maximumHeight).assertEqual(TextMetrics.lineHeightVp(FONT_SIZE_CAPTION_FP, FONT_SCALE_MAXIMUM));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_019, end');
    });

    /**
     * Scenario: the intro paragraph wraps at the maximum scale.
     * Expectation: the paragraph needs more than one line at the maximum scale and exactly one
     * line at the compact scale.
     */
    it('Assessment_ContentScaling_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_020, begin');
      const paragraph: string = 'Call begin to enter assessment mode.';
      const column: number = cardContentWidthVp(0);
      const compactLines: number = TextMetrics.lineCount(paragraph, column, FONT_SIZE_CAPTION_FP,
        FONT_SCALE_COMPACT);
      const maximumLines: number = TextMetrics.lineCount(paragraph, column, FONT_SIZE_CAPTION_FP,
        FONT_SCALE_MAXIMUM);
      hilog.info(DOMAIN, TAG, '%{public}s compact lines: %{public}d, maximum lines: %{public}d',
        BUNDLE + 'ContentScaling_020', compactLines, maximumLines);
      expect(compactLines).assertEqual(1);
      expect(maximumLines > 1).assertTrue();
      expect(maximumLines >= compactLines).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_020, end');
    });

    /**
     * Scenario: the scaling audit collects one sample per level.
     * Expectation: the audit reports five samples, a monotone title height and a full tap
     * target count because the buttons declare their height in vp.
     */
    it('Assessment_ContentScaling_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_021, begin');
      audit.reset();
      const column: number = whitelistNameColumnVp();
      for (let i = 0; i < levels.length; i++) {
        const titleHeight: number = TextMetrics.lineHeightVp(FONT_SIZE_TITLE_FP, levels[i].factor);
        const sample: ScalingSample = {
          level: levels[i].level,
          name: levels[i].name,
          titleHeightVp: titleHeight,
          captionFits: TextMetrics.fitsSingleLine('Remove', column, FONT_SIZE_CAPTION_FP, levels[i].factor),
          tapTargetMet: OPERATION_BUTTON_HEIGHT_VP >= MIN_TAP_TARGET_VP
        };
        audit.append(sample);
      }
      expect(audit.size()).assertEqual(levels.length);
      expect(audit.tapTargetCount()).assertEqual(levels.length);
      expect(audit.fittingCount()).assertEqual(levels.length);
      expect(audit.fittingRate()).assertEqual(1);
      const tallest: ScalingSample | null = audit.tallestTitle();
      expect(tallest !== null).assertTrue();
      if (tallest !== null) {
        expect(tallest.name).assertEqual('maximum');
      }
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ContentScaling_021', audit.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_021, end');
    });

    /**
     * Scenario: the audit lookup by level.
     * Expectation: an observed level is found with its own values, an absent level answers with
     * null and the empty audit reports a zero fitting rate.
     */
    it('Assessment_ContentScaling_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_022, begin');
      const local: ScalingAudit = new ScalingAudit();
      expect(local.fittingRate()).assertEqual(0);
      expect(local.tallestTitle() === null).assertTrue();
      local.append({
        level: FontScaleLevel.LARGE,
        name: 'large',
        titleHeightVp: 43.68,
        captionFits: false,
        tapTargetMet: true
      });
      const found: ScalingSample | null = local.sampleOf(FontScaleLevel.LARGE);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.captionFits).assertFalse();
        expect(found.tapTargetMet).assertTrue();
      }
      expect(local.sampleOf(FontScaleLevel.COMPACT) === null).assertTrue();
      expect(local.fittingRate()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_022, end');
    });

    /**
     * Scenario: the whitelist input keeps its declared height at every scale.
     * Expectation: the input box model height is forty vp, which stays below the primary tap
     * target but above the minimum input height of the design system.
     */
    it('Assessment_ContentScaling_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_031, begin');
      const input: LayoutBox = new LayoutBox(ID_BUNDLE_INPUT, 0, INPUT_HEIGHT_VP, 1);
      expect(input.heightVp).assertEqual(INPUT_HEIGHT_VP);
      expect(input.heightVp > REMOVE_BUTTON_HEIGHT_VP).assertTrue();
      for (let i = 0; i < levels.length; i++) {
        expect(input.effectiveHeightVp(FONT_SIZE_CAPTION_FP, levels[i].factor) >= INPUT_HEIGHT_VP)
          .assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ContentScaling_031', input.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_031, end');
    });

    /**
     * Scenario: the density conversion of the page width.
     * Expectation: the reference viewport is three hundred sixty vp wide and one thousand
     * eighty pixels wide, and the card content width stays inside it.
     */
    it('Assessment_ContentScaling_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_032, begin');
      expect(TextMetrics.vpToPx(VIEWPORT_WIDTH_VP)).assertEqual(VIEWPORT_WIDTH_VP * DENSITY_RATIO);
      const content: number = cardContentWidthVp(CARD_PADDING_VP);
      hilog.info(DOMAIN, TAG, '%{public}s content width: %{public}d', BUNDLE + 'ContentScaling_032', content);
      expect(content).assertEqual(VIEWPORT_WIDTH_VP - 2 * PAGE_PADDING_VP - 2 * CARD_PADDING_VP);
      expect(content < VIEWPORT_WIDTH_VP).assertTrue();
      expect(content > 0).assertTrue();
      expect(TextMetrics.vpToPx(VIEWPORT_HEIGHT_VP) > TextMetrics.vpToPx(content)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_032, end');
    });

    /**
     * Scenario: the scaling audit of the running suite.
     * Expectation: the suite level audit still answers with a consistent aggregate after the
     * live cases ran, a reset empties it and keeps the helpers safe.
     */
    it('Assessment_ContentScaling_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_034, begin');
      const before: number = audit.size();
      hilog.info(DOMAIN, TAG, '%{public}s audit before reset: %{public}d', BUNDLE + 'ContentScaling_034',
        before);
      audit.reset();
      expect(audit.size()).assertEqual(0);
      expect(audit.fittingCount()).assertEqual(0);
      expect(audit.tapTargetCount()).assertEqual(0);
      expect(audit.fittingRate()).assertEqual(0);
      expect(audit.tallestTitle() === null).assertTrue();
      expect(audit.toString().indexOf('samples=0') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContentScaling_034, end');
    });
  });
}
