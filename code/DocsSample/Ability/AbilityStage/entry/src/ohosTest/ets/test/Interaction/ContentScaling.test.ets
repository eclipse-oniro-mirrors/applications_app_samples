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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  getDriver,
  ensureIndexPageInitial,
  getAbilityDelegator,
  logInfo,
  logError,
  launchEntryAbility,
  waitForIndexPageStable,
  checkTextContent,
  checkComponentExists,
  checkComponentExistsByKey,
  pageComponentCount,
  collectAllTexts,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TOLERANCE_COMPONENT_COUNT,
  TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

const FONT_SIZE_BASELINE_FP: number = 50;

const MIN_FONT_SCALE: number = 0.5;

const MAX_FONT_SCALE: number = 3.0;

const MIN_RENDER_FONT_FP: number = 12;

const MAX_RENDER_FONT_FP: number = 200;

const LINE_HEIGHT_RATIO: number = 1.2;

const GLYPH_WIDTH_RATIO: number = 0.6;

const BOLD_WEIGHT_VALUE: number = 700;

const MIN_WEIGHT_VALUE: number = 100;

const MAX_WEIGHT_VALUE: number = 900;

const INITIAL_TEXT_LENGTH: number = 11;

const CLICKED_TEXT_LENGTH: number = 7;

const SCALE_SAMPLE_SET: number[] = [0.85, 1.0, 1.15, 1.3, 1.45, 2.0, 3.0];

function roundTo2(value: number): number {
  return Math.round(value * 100) / 100;
}

function clampTo(value: number, lower: number, upper: number): number {
  if (value < lower) {
    return lower;
  }
  if (value > upper) {
    return upper;
  }
  return value;
}

class FontScaleModel {
  private readonly baselineFp: number;

  constructor(baselineFp: number) {
    this.baselineFp = baselineFp;
  }

  public getBaselineFp(): number {
    return this.baselineFp;
  }

  public clampScale(scale: number): number {
    if (!isFinite(scale)) {
      return MIN_FONT_SCALE;
    }
    return clampTo(scale, MIN_FONT_SCALE, MAX_FONT_SCALE);
  }

  public isValidScale(scale: number): boolean {
    return isFinite(scale) && scale >= MIN_FONT_SCALE && scale <= MAX_FONT_SCALE;
  }

  public clampFontSize(fontSizeFp: number): number {
    return clampTo(fontSizeFp, MIN_RENDER_FONT_FP, MAX_RENDER_FONT_FP);
  }

  public fontSizeFp(scale: number): number {
    const appliedScale: number = this.clampScale(scale);
    const rawFontSize: number = roundTo2(this.baselineFp * appliedScale);
    return this.clampFontSize(rawFontSize);
  }

  public lineHeightFp(scale: number): number {
    return roundTo2(this.fontSizeFp(scale) * LINE_HEIGHT_RATIO);
  }

  public glyphWidthFp(scale: number, glyphCount: number): number {
    if (glyphCount <= 0) {
      return 0;
    }
    return roundTo2(this.fontSizeFp(scale) * GLYPH_WIDTH_RATIO * glyphCount);
  }

  public textWidthFp(scale: number, textLength: number): number {
    return this.glyphWidthFp(scale, textLength);
  }

  public fontRatio(scale: number): number {
    return roundTo2(this.fontSizeFp(scale) / this.baselineFp);
  }

  public fontWeightValue(weightScale: number): number {
    const appliedScale: number = this.clampScale(weightScale);
    const scaledWeight: number = BOLD_WEIGHT_VALUE * appliedScale;
    const steppedWeight: number = Math.round(scaledWeight / 100) * 100;
    return clampTo(steppedWeight, MIN_WEIGHT_VALUE, MAX_WEIGHT_VALUE);
  }

  public isClamped(scale: number): boolean {
    return isFinite(scale) && Math.abs(this.clampScale(scale) - scale) > 0;
  }
}

class ScaleClampResult {
  private readonly requestedScale: number;
  private readonly appliedScale: number;
  private readonly fontFp: number;

  constructor(requestedScale: number, appliedScale: number, fontFp: number) {
    this.requestedScale = requestedScale;
    this.appliedScale = appliedScale;
    this.fontFp = fontFp;
  }

  public getRequestedScale(): number {
    return this.requestedScale;
  }

  public getAppliedScale(): number {
    return this.appliedScale;
  }

  public getFontFp(): number {
    return this.fontFp;
  }

  public wasAdjusted(): boolean {
    return Math.abs(this.requestedScale - this.appliedScale) > 0;
  }
}

export default function contentScalingTest(): void {
  describe('ContentScalingTest', () => {
    let driver: Driver;
    let model: FontScaleModel;

    beforeAll(async () => {
      driver = getDriver();
      model = new FontScaleModel(FONT_SIZE_BASELINE_FP);
      logInfo('ContentScalingTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('ContentScalingTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('ContentScalingTest: afterAll start');
      await driver.delayMs(100);
      logInfo('ContentScalingTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0100
     * @tc.name testContentScalingBaseline
     * @tc.desc Verify baseline scale 1.0 keeps font size at the 50fp resource value and text is rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        expect(model.fontSizeFp(1.0)).assertEqual(FONT_SIZE_BASELINE_FP);
        expect(model.fontRatio(1.0)).assertEqual(1.0);
        const visible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
          await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(visible).assertTrue();
      } catch (e) {
        logError(`testContentScalingBaseline failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0200
     * @tc.name testContentScalingCompactScale
     * @tc.desc Verify compact scale 0.85 scales 50fp to 42.5fp with a 51fp line height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingCompactScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontSizeFp(0.85)).assertEqual(42.5);
        expect(model.lineHeightFp(0.85)).assertEqual(51);
        expect(model.fontRatio(0.85)).assertEqual(0.85);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0300
     * @tc.name testContentScalingComfortScale
     * @tc.desc Verify comfort scale 1.15 scales 50fp to 57.5fp and produces a 69fp line height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingComfortScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontSizeFp(1.15)).assertEqual(57.5);
        expect(model.lineHeightFp(1.15)).assertEqual(69);
        expect(model.isValidScale(1.15)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0400
     * @tc.name testContentScalingLargeScale
     * @tc.desc Verify large scale 1.3 scales 50fp to 65fp and keeps a 78fp line height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingLargeScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontSizeFp(1.3)).assertEqual(65);
        expect(model.lineHeightFp(1.3)).assertEqual(78);
        expect(model.isClamped(1.3)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0500
     * @tc.name testContentScalingExtraLargeScale
     * @tc.desc Verify extra large scale 1.45 scales 50fp to 72.5fp and yields an 87fp line height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingExtraLargeScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontSizeFp(1.45)).assertEqual(72.5);
        expect(model.lineHeightFp(1.45)).assertEqual(87);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0600
     * @tc.name testContentScalingDoubleScale
     * @tc.desc Verify double scale 2.0 scales 50fp to 100fp and stays inside the render clamp interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingDoubleScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontSizeFp(2.0)).assertEqual(100);
        expect(model.lineHeightFp(2.0)).assertEqual(120);
        expect(model.fontRatio(2.0)).assertEqual(2.0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0700
     * @tc.name testContentScalingTripleScale
     * @tc.desc Verify triple scale 3.0 scales 50fp to 150fp and keeps a 180fp line height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingTripleScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontSizeFp(3.0)).assertEqual(150);
        expect(model.lineHeightFp(3.0)).assertEqual(180);
        expect(model.isClamped(3.0)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0800
     * @tc.name testContentScalingBelowRangeClamp
     * @tc.desc Verify scale 0.1 below the lower bound is clamped to 0.5 producing 25fp instead of 5fp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingBelowRangeClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const result: ScaleClampResult =
          new ScaleClampResult(0.1, model.clampScale(0.1), model.fontSizeFp(0.1));
        expect(result.getAppliedScale()).assertEqual(0.5);
        expect(result.getFontFp()).assertEqual(25);
        expect(result.wasAdjusted()).assertTrue();
        expect(model.isValidScale(0.1)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_0900
     * @tc.name testContentScalingAboveRangeClamp
     * @tc.desc Verify scale 5.0 above the upper bound is clamped to 3.0 producing 150fp instead of 250fp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingAboveRangeClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const result: ScaleClampResult =
          new ScaleClampResult(5.0, model.clampScale(5.0), model.fontSizeFp(5.0));
        expect(result.getAppliedScale()).assertEqual(3.0);
        expect(result.getFontFp()).assertEqual(150);
        expect(result.wasAdjusted()).assertTrue();
        expect(model.isValidScale(5.0)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1000
     * @tc.name testContentScalingFontLowerBound
     * @tc.desc Verify a 20fp baseline at scale 0.5 yields 10fp before clamping up to the 12fp render floor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingFontLowerBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const smallModel: FontScaleModel = new FontScaleModel(20);
        expect(smallModel.clampFontSize(10)).assertEqual(MIN_RENDER_FONT_FP);
        expect(smallModel.fontSizeFp(0.5)).assertEqual(MIN_RENDER_FONT_FP);
        expect(smallModel.fontSizeFp(1.0)).assertEqual(20);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1100
     * @tc.name testContentScalingFontUpperBound
     * @tc.desc Verify a 300fp baseline at scale 3.0 yields 900fp before clamping down to the 200fp render ceiling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingFontUpperBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const largeModel: FontScaleModel = new FontScaleModel(300);
        expect(largeModel.fontSizeFp(3.0)).assertEqual(MAX_RENDER_FONT_FP);
        expect(largeModel.clampFontSize(240)).assertEqual(MAX_RENDER_FONT_FP);
        expect(largeModel.clampFontSize(200)).assertEqual(200);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1200
     * @tc.name testContentScalingTextWidth
     * @tc.desc Verify the 11 glyph Hello World text width scales to 330fp at 1.0 and 280.5fp at 0.85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingTextWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.textWidthFp(1.0, INITIAL_TEXT_LENGTH)).assertEqual(330);
        expect(model.textWidthFp(0.85, INITIAL_TEXT_LENGTH)).assertEqual(280.5);
        expect(model.textWidthFp(2.0, CLICKED_TEXT_LENGTH)).assertEqual(420);
        expect(model.glyphWidthFp(1.0, 0)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1300
     * @tc.name testContentScalingWeightScale
     * @tc.desc Verify bold weight 700 steps to 600 at 0.85, 700 at 1.0 and 800 at 1.15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingWeightScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontWeightValue(0.85)).assertEqual(600);
        expect(model.fontWeightValue(1.0)).assertEqual(700);
        expect(model.fontWeightValue(1.15)).assertEqual(800);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1400
     * @tc.name testContentScalingWeightUpperClamp
     * @tc.desc Verify weight scale 3.0 would step to 2100 but is clamped to the 900 maximum weight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingWeightUpperClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontWeightValue(3.0)).assertEqual(MAX_WEIGHT_VALUE);
        expect(model.fontWeightValue(1.3)).assertEqual(900);
        expect(model.fontWeightValue(0.5)).assertEqual(400);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1500
     * @tc.name testContentScalingRatioPreserved
     * @tc.desc Verify every sample scale in 0.85 to 3.0 round trips back to the same font ratio
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingRatioPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let matched: number = 0;
        for (let i = 0; i < SCALE_SAMPLE_SET.length; i++) {
          const scale: number = SCALE_SAMPLE_SET[i];
          if (model.fontRatio(scale) === scale) {
            matched++;
          }
        }
        expect(matched).assertEqual(SCALE_SAMPLE_SET.length);
        expect(model.fontRatio(0.85)).assertEqual(0.85);
        expect(model.fontRatio(3.0)).assertEqual(3.0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1600
     * @tc.name testContentScalingInvalidScaleRejected
     * @tc.desc Verify negative and zero scales are rejected while a finite in-range scale is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingInvalidScaleRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.isValidScale(-1)).assertFalse();
        expect(model.isValidScale(0)).assertFalse();
        expect(model.isValidScale(1.0)).assertTrue();
        expect(model.fontSizeFp(-1)).assertEqual(25);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1700
     * @tc.name testContentScalingRealUiBaselineVisible
     * @tc.desc Verify the running page is visible with the HelloWorld copy in either bound state through the driver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingRealUiBaselineVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasInitial || hasClicked).assertTrue();
        logInfo(`testContentScalingRealUiBaselineVisible: initial ${hasInitial} clicked ${hasClicked}`);
      } catch (e) {
        logError(`testContentScalingRealUiBaselineVisible failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1800
     * @tc.name testContentScalingRealUiIdLocatable
     * @tc.desc Verify the id HelloWorld and the Text and RelativeContainer nodes exist on the live page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingRealUiIdLocatable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        const textExists: boolean = await checkComponentExists(driver, 'Text');
        expect(textExists).assertTrue();
        const containerExists: boolean = await checkComponentExists(driver, 'RelativeContainer');
        expect(containerExists).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_1900
     * @tc.name testContentScalingRealUiFontResource
     * @tc.desc Verify app.float.page_text_font_size resolves repeatedly to the same positive value, scales linearly below the clamp and saturates at 200fp above it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingRealUiFontResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
        const firstResolve: number = delegator.getAppContext().resourceManager
          .getNumberByName('page_text_font_size');
        const secondResolve: number = delegator.getAppContext().resourceManager
          .getNumberByName('page_text_font_size');
        expect(firstResolve > 0).assertTrue();
        expect(secondResolve).assertEqual(firstResolve);
        const resourceModel: FontScaleModel = new FontScaleModel(firstResolve);
        expect(resourceModel.fontRatio(1.0)).assertEqual(1.0);
        expect(resourceModel.fontSizeFp(2.0)).assertEqual(roundTo2(firstResolve * 2.0));
        expect(resourceModel.fontSizeFp(0.85)).assertEqual(roundTo2(firstResolve * 0.85));
        const rawAtMaxScale: number = roundTo2(firstResolve * MAX_FONT_SCALE);
        const expectedAtMaxScale: number =
          rawAtMaxScale > MAX_RENDER_FONT_FP ? MAX_RENDER_FONT_FP : rawAtMaxScale;
        expect(resourceModel.fontSizeFp(MAX_FONT_SCALE)).assertEqual(expectedAtMaxScale);
        expect(resourceModel.fontRatio(MAX_FONT_SCALE))
          .assertEqual(roundTo2(expectedAtMaxScale / firstResolve));
        logInfo(`testContentScalingRealUiFontResource: resolved ${firstResolve}, saturated ${expectedAtMaxScale}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_2000
     * @tc.name testContentScalingRealUiTextCollect
     * @tc.desc Verify collected live texts contain exactly one of the two bound copies and never both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingRealUiTextCollect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: string[] = await collectAllTexts(driver);
        expect(texts.length > 0).assertTrue();
        let initialCount: number = 0;
        let clickedCount: number = 0;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_INITIAL) {
            initialCount++;
          }
          if (texts[i] === PAGE_TEXT_CLICKED) {
            clickedCount++;
          }
        }
        expect(initialCount + clickedCount).assertEqual(1);
        logInfo(`testContentScalingRealUiTextCollect: collected ${texts.length} texts`);
      } catch (e) {
        logError(`testContentScalingRealUiTextCollect failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_2100
     * @tc.name testContentScalingRealUiComponentCountStable
     * @tc.desc Verify repeated component counts differ by no more than the shared count tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingRealUiComponentCountStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const firstCount: number = await pageComponentCount(driver);
        await driver.delayMs(100);
        const secondCount: number = await pageComponentCount(driver);
        expect(firstCount > 0).assertTrue();
        expect(Math.abs(secondCount - firstCount) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        logInfo(`testContentScalingRealUiComponentCountStable: ${firstCount} then ${secondCount}`);
      } catch (e) {
        logError(`testContentScalingRealUiComponentCountStable failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SCALING_2200
     * @tc.name testContentScalingRealUiScaleBoundaryStillRenders
     * @tc.desc Verify page stays rendered after boundary scale evaluation of 0.5 and 3.0 keeps text visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentScalingRealUiScaleBoundaryStillRenders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(model.fontSizeFp(0.5)).assertEqual(25);
        expect(model.fontSizeFp(3.0)).assertEqual(150);
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
      } catch (e) {
        logError(`testContentScalingRealUiScaleBoundaryStillRenders failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })
  })
}
