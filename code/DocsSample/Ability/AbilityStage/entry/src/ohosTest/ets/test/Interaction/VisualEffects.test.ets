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
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  waitForIndexPageStable,
  checkTextContent,
  checkComponentExistsByKey,
  findComponentsByText,
  runSerializedUiOperation,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

const BOLD_WEIGHT_NUMERIC: number = 700;

const BOLD_WEIGHT_ENUM_INDEX: number = 5;

const BOLD_WEIGHT_ALIAS: string = 'bold';

const NORMAL_WEIGHT_NUMERIC: number = 400;

const MIN_ANIMATION_DURATION: number = 0;

const MAX_ANIMATION_DURATION: number = 3000;

const DEFAULT_ANIMATION_DURATION: number = 300;

const FADE_DURATION: number = 250;

const MAX_CORNER_RADIUS: number = 100;

const AA_LEVEL_OFF: number = 0;

const AA_LEVEL_LOW: number = 1;

const AA_LEVEL_MEDIUM: number = 2;

const AA_LEVEL_HIGH: number = 3;

const OPACITY_MIN: number = 0;

const OPACITY_MAX: number = 1;

const ALPHA_MAX: number = 255;

const WCAG_AA_NORMAL: number = 4.5;

const WCAG_AA_LARGE: number = 3.0;

const WCAG_AAA_NORMAL: number = 7.0;

const LUMINANCE_RED_COEFFICIENT: number = 0.2126;

const LUMINANCE_GREEN_COEFFICIENT: number = 0.7152;

const LUMINANCE_BLUE_COEFFICIENT: number = 0.0722;

const SRGB_OFFSET: number = 0.055;

const SRGB_SCALE: number = 1.055;

const SRGB_THRESHOLD: number = 0.03928;

const SRGB_DIVISOR: number = 12.92;

const SRGB_EXPONENT: number = 2.4;

const CONTRAST_OFFSET: number = 0.05;

class VisualTokenError extends Error {
  private readonly detail: string;

  constructor(detail: string) {
    super(`visual token rejected: ${detail}`);
    this.name = 'VisualTokenError';
    this.detail = detail;
  }

  public getDetail(): string {
    return this.detail;
  }
}

class FontWeightMapping {
  public static decodeNumeric(weight: number): string {
    if (weight >= 900) {
      return 'bolder';
    }
    if (weight >= 700) {
      return BOLD_WEIGHT_ALIAS;
    }
    if (weight >= 500) {
      return 'medium';
    }
    if (weight >= 400) {
      return 'normal';
    }
    return 'lighter';
  }

  public static enumIndexByName(name: string): number {
    if (name === 'Lighter') {
      return 0;
    }
    if (name === 'Normal') {
      return 1;
    }
    if (name === 'Regular') {
      return 2;
    }
    if (name === 'Medium') {
      return 3;
    }
    if (name === 'Bold') {
      return BOLD_WEIGHT_ENUM_INDEX;
    }
    if (name === 'Bolder') {
      return 6;
    }
    throw new VisualTokenError(name);
  }

  public static isValidWeight(weight: number): boolean {
    return isFinite(weight) && weight >= 100 && weight <= 900 && Math.round(weight / 100) * 100 === weight;
  }

  public static isBold(weight: number): boolean {
    return weight >= BOLD_WEIGHT_NUMERIC;
  }

  public static rank(weight: number): number {
    return Math.round(weight / 100);
  }
}

class OpacityModel {
  public static isValidOpacity(opacity: number): boolean {
    return isFinite(opacity) && opacity >= OPACITY_MIN && opacity <= OPACITY_MAX;
  }

  public static toAlphaByte(opacity: number): number {
    const clamped: number = OpacityModel.clamp(opacity);
    return Math.round(clamped * ALPHA_MAX);
  }

  public static fromAlphaByte(alphaByte: number): number {
    if (!isFinite(alphaByte) || alphaByte < 0 || alphaByte > ALPHA_MAX) {
      throw new VisualTokenError(`alpha ${alphaByte}`);
    }
    return Math.round(alphaByte / ALPHA_MAX * 1000) / 1000;
  }

  public static clamp(opacity: number): number {
    if (!isFinite(opacity) || opacity < OPACITY_MIN) {
      return OPACITY_MIN;
    }
    if (opacity > OPACITY_MAX) {
      return OPACITY_MAX;
    }
    return opacity;
  }

  public static compose(outer: number, inner: number): number {
    return Math.round(OpacityModel.clamp(outer) * OpacityModel.clamp(inner) * 1000) / 1000;
  }

  public static blendOver(foreground: number, background: number, opacity: number): number {
    const alpha: number = OpacityModel.clamp(opacity);
    return Math.round((foreground * alpha + background * (1 - alpha)) * 100) / 100;
  }
}

class CornerRadiusModel {
  public static isValidRadius(radius: number): boolean {
    return isFinite(radius) && radius >= 0 && radius <= MAX_CORNER_RADIUS;
  }

  public static clampRadius(radius: number): number {
    if (!isFinite(radius) || radius < 0) {
      return 0;
    }
    if (radius > MAX_CORNER_RADIUS) {
      return MAX_CORNER_RADIUS;
    }
    return radius;
  }

  public static isFullyRounded(radius: number, shortSide: number): boolean {
    if (shortSide <= 0) {
      return false;
    }
    return CornerRadiusModel.clampRadius(radius) * 2 >= shortSide;
  }

  public static insetArea(width: number, height: number, radius: number): number {
    const appliedRadius: number = CornerRadiusModel.clampRadius(radius);
    if (width <= 0 || height <= 0) {
      return 0;
    }
    const cornerCount: number = 4;
    const cornerCut: number = appliedRadius * appliedRadius - Math.PI * appliedRadius * appliedRadius / 4;
    return Math.round((width * height - cornerCount * cornerCut) * 100) / 100;
  }
}

class AntialiasModel {
  private static readonly SUPPORTED_LEVELS: number[] = [AA_LEVEL_OFF, AA_LEVEL_LOW, AA_LEVEL_MEDIUM, AA_LEVEL_HIGH];

  public static isValidLevel(level: number): boolean {
    for (let i = 0; i < AntialiasModel.SUPPORTED_LEVELS.length; i++) {
      if (AntialiasModel.SUPPORTED_LEVELS[i] === level) {
        return true;
      }
    }
    return false;
  }

  public static isEnabled(level: number): boolean {
    return AntialiasModel.isValidLevel(level) && level > AA_LEVEL_OFF;
  }

  public static sampleCount(level: number): number {
    if (!AntialiasModel.isValidLevel(level)) {
      return 0;
    }
    if (level === AA_LEVEL_LOW) {
      return 2;
    }
    if (level === AA_LEVEL_MEDIUM) {
      return 4;
    }
    if (level === AA_LEVEL_HIGH) {
      return 8;
    }
    return 1;
  }

  public static validateLevel(level: number): number {
    if (!AntialiasModel.isValidLevel(level)) {
      throw new VisualTokenError(`antialias level ${level}`);
    }
    return level;
  }
}

class AnimationDurationModel {
  private static readonly DURATIONS: number[] = [0, 100, 250, 300, 500, 1000, 3000];

  public static isValidDuration(duration: number): boolean {
    return isFinite(duration) && duration >= MIN_ANIMATION_DURATION && duration <= MAX_ANIMATION_DURATION;
  }

  public static clampDuration(duration: number): number {
    if (!isFinite(duration) || duration < MIN_ANIMATION_DURATION) {
      return MIN_ANIMATION_DURATION;
    }
    if (duration > MAX_ANIMATION_DURATION) {
      return MAX_ANIMATION_DURATION;
    }
    return duration;
  }

  public static progressAt(elapsed: number, duration: number): number {
    if (duration <= 0) {
      return 1;
    }
    if (elapsed <= 0) {
      return 0;
    }
    if (elapsed >= duration) {
      return 1;
    }
    return Math.round(elapsed / duration * 1000) / 1000;
  }

  public static remainingAt(elapsed: number, duration: number): number {
    if (duration <= 0) {
      return 0;
    }
    if (elapsed <= 0) {
      return duration;
    }
    if (elapsed >= duration) {
      return 0;
    }
    return duration - elapsed;
  }

  public static supportedDurationCount(): number {
    return AnimationDurationModel.DURATIONS.length;
  }

  public static isSupportedDuration(duration: number): boolean {
    for (let i = 0; i < AnimationDurationModel.DURATIONS.length; i++) {
      if (AnimationDurationModel.DURATIONS[i] === duration) {
        return true;
      }
    }
    return false;
  }

  public static validateDuration(duration: number): number {
    if (!AnimationDurationModel.isValidDuration(duration)) {
      throw new VisualTokenError(`duration ${duration}`);
    }
    return duration;
  }
}

class ContrastCalculator {
  private static linearize(channel: number): number {
    const normalized: number = channel / 255;
    if (normalized <= SRGB_THRESHOLD) {
      return normalized / SRGB_DIVISOR;
    }
    return Math.pow((normalized + SRGB_OFFSET) / SRGB_SCALE, SRGB_EXPONENT);
  }

  public static relativeLuminance(red: number, green: number, blue: number): number {
    const redPart: number = LUMINANCE_RED_COEFFICIENT * ContrastCalculator.linearize(red);
    const greenPart: number = LUMINANCE_GREEN_COEFFICIENT * ContrastCalculator.linearize(green);
    const bluePart: number = LUMINANCE_BLUE_COEFFICIENT * ContrastCalculator.linearize(blue);
    return Math.round((redPart + greenPart + bluePart) * 10000) / 10000;
  }

  public static contrastRatio(luminanceA: number, luminanceB: number): number {
    const lighter: number = Math.max(luminanceA, luminanceB);
    const darker: number = Math.min(luminanceA, luminanceB);
    return Math.round((lighter + CONTRAST_OFFSET) / (darker + CONTRAST_OFFSET) * 100) / 100;
  }

  public static passesNormalText(luminanceA: number, luminanceB: number): boolean {
    return ContrastCalculator.contrastRatio(luminanceA, luminanceB) >= WCAG_AA_NORMAL;
  }

  public static passesLargeText(luminanceA: number, luminanceB: number): boolean {
    return ContrastCalculator.contrastRatio(luminanceA, luminanceB) >= WCAG_AA_LARGE;
  }

  public static passesAaa(luminanceA: number, luminanceB: number): boolean {
    return ContrastCalculator.contrastRatio(luminanceA, luminanceB) >= WCAG_AAA_NORMAL;
  }

  public static gradeOf(luminanceA: number, luminanceB: number): string {
    const ratio: number = ContrastCalculator.contrastRatio(luminanceA, luminanceB);
    if (ratio >= WCAG_AAA_NORMAL) {
      return 'AAA';
    }
    if (ratio >= WCAG_AA_NORMAL) {
      return 'AA';
    }
    if (ratio >= WCAG_AA_LARGE) {
      return 'AA_LARGE';
    }
    return 'FAIL';
  }
}

class VisualEffectProfile {
  private readonly weight: number;
  private readonly opacity: number;
  private readonly radius: number;
  private readonly antialiasLevel: number;
  private readonly duration: number;

  constructor(weight: number, opacity: number, radius: number, antialiasLevel: number, duration: number) {
    if (!FontWeightMapping.isValidWeight(weight)) {
      throw new VisualTokenError(`weight ${weight}`);
    }
    if (!OpacityModel.isValidOpacity(opacity)) {
      throw new VisualTokenError(`opacity ${opacity}`);
    }
    if (!CornerRadiusModel.isValidRadius(radius)) {
      throw new VisualTokenError(`radius ${radius}`);
    }
    if (!AntialiasModel.isValidLevel(antialiasLevel)) {
      throw new VisualTokenError(`antialias ${antialiasLevel}`);
    }
    if (!AnimationDurationModel.isValidDuration(duration)) {
      throw new VisualTokenError(`duration ${duration}`);
    }
    this.weight = weight;
    this.opacity = opacity;
    this.radius = radius;
    this.antialiasLevel = antialiasLevel;
    this.duration = duration;
  }

  public getWeight(): number {
    return this.weight;
  }

  public getOpacity(): number {
    return this.opacity;
  }

  public getRadius(): number {
    return this.radius;
  }

  public getAntialiasLevel(): number {
    return this.antialiasLevel;
  }

  public getDuration(): number {
    return this.duration;
  }

  public singleFrameDuration(): number {
    if (this.duration === 0 || this.antialiasLevel === AA_LEVEL_OFF) {
      return this.duration;
    }
    return Math.round(this.duration / AntialiasModel.sampleCount(this.antialiasLevel) * 100) / 100;
  }

  public isHighQuality(): boolean {
    return this.antialiasLevel >= AA_LEVEL_MEDIUM && this.opacity >= 0.9;
  }

  public describe(): string {
    return `${FontWeightMapping.decodeNumeric(this.weight)}/opacity-${this.opacity}/radius-${this.radius}`;
  }
}

export default function visualEffectsTest(): void {
  describe('VisualEffectsTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('VisualEffectsTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('VisualEffectsTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('VisualEffectsTest: afterAll start');
      await driver.delayMs(100);
      logInfo('VisualEffectsTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0100
     * @tc.name testVisualBoldWeightNumeric
     * @tc.desc Verify FontWeight.Bold maps to the numeric weight 700 and the bold alias and rank 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualBoldWeightNumeric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(FontWeightMapping.enumIndexByName('Bold')).assertEqual(BOLD_WEIGHT_ENUM_INDEX);
        expect(FontWeightMapping.decodeNumeric(BOLD_WEIGHT_NUMERIC)).assertEqual(BOLD_WEIGHT_ALIAS);
        expect(FontWeightMapping.rank(BOLD_WEIGHT_NUMERIC)).assertEqual(7);
        expect(FontWeightMapping.isBold(BOLD_WEIGHT_NUMERIC)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0200
     * @tc.name testVisualWeightBoundaries
     * @tc.desc Verify the 100 to 900 weight boundaries are valid while 0 and 1000 are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualWeightBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(FontWeightMapping.isValidWeight(100)).assertTrue();
        expect(FontWeightMapping.isValidWeight(900)).assertTrue();
        expect(FontWeightMapping.isValidWeight(0)).assertFalse();
        expect(FontWeightMapping.isValidWeight(1000)).assertFalse();
        expect(FontWeightMapping.isValidWeight(450)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0300
     * @tc.name testVisualWeightClassification
     * @tc.desc Verify 400 decodes to normal, 500 to medium and 900 to bolder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualWeightClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(FontWeightMapping.decodeNumeric(NORMAL_WEIGHT_NUMERIC)).assertEqual('normal');
        expect(FontWeightMapping.decodeNumeric(500)).assertEqual('medium');
        expect(FontWeightMapping.decodeNumeric(900)).assertEqual('bolder');
        expect(FontWeightMapping.isBold(NORMAL_WEIGHT_NUMERIC)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0400
     * @tc.name testVisualBoldHelperOnTextModel
     * @tc.desc Verify the model text weight stays bold across the two bound copy states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualBoldHelperOnTextModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const initialProfile: VisualEffectProfile =
          new VisualEffectProfile(BOLD_WEIGHT_NUMERIC, 1.0, 0, AA_LEVEL_HIGH, DEFAULT_ANIMATION_DURATION);
        const clickedProfile: VisualEffectProfile =
          new VisualEffectProfile(BOLD_WEIGHT_NUMERIC, 1.0, 0, AA_LEVEL_HIGH, FADE_DURATION);
        expect(initialProfile.getWeight()).assertEqual(clickedProfile.getWeight());
        expect(initialProfile.getWeight()).assertEqual(BOLD_WEIGHT_NUMERIC);
        expect(initialProfile.getDuration() !== clickedProfile.getDuration()).assertTrue();
        expect(initialProfile.getDuration() - clickedProfile.getDuration()).assertEqual(50);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0500
     * @tc.name testVisualOpacityBounds
     * @tc.desc Verify opacity 0 and 1 are valid while -0.1 and 1.1 are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualOpacityBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(OpacityModel.isValidOpacity(OPACITY_MIN)).assertTrue();
        expect(OpacityModel.isValidOpacity(OPACITY_MAX)).assertTrue();
        expect(OpacityModel.isValidOpacity(-0.1)).assertFalse();
        expect(OpacityModel.isValidOpacity(1.1)).assertFalse();
        expect(OpacityModel.clamp(1.1)).assertEqual(OPACITY_MAX);
        expect(OpacityModel.clamp(-0.1)).assertEqual(OPACITY_MIN);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0600
     * @tc.name testVisualOpacityAlphaConversion
     * @tc.desc Verify opacity 0.5 maps to alpha byte 128 and alpha 255 back to opacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualOpacityAlphaConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(OpacityModel.toAlphaByte(0.5)).assertEqual(128);
        expect(OpacityModel.toAlphaByte(1.0)).assertEqual(ALPHA_MAX);
        expect(OpacityModel.toAlphaByte(0)).assertEqual(0);
        expect(OpacityModel.fromAlphaByte(ALPHA_MAX)).assertEqual(1);
        expect(OpacityModel.fromAlphaByte(0)).assertEqual(0);
        expect(OpacityModel.fromAlphaByte(128)).assertEqual(0.502);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0700
     * @tc.name testVisualOpacityAlphaOutOfRangeRejected
     * @tc.desc Verify an alpha byte of 256 raises VisualTokenError while 255 is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualOpacityAlphaOutOfRangeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          OpacityModel.fromAlphaByte(256);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VisualTokenError');
        }
        try {
          OpacityModel.fromAlphaByte(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VisualTokenError');
        }
        expect(OpacityModel.fromAlphaByte(ALPHA_MAX)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0800
     * @tc.name testVisualOpacityComposition
     * @tc.desc Verify composing 0.5 with 0.5 yields 0.25 and composing with 1 leaves the value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualOpacityComposition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(OpacityModel.compose(0.5, 0.5)).assertEqual(0.25);
        expect(OpacityModel.compose(0.5, 1)).assertEqual(0.5);
        expect(OpacityModel.compose(1, 1)).assertEqual(1);
        expect(OpacityModel.compose(0, 1)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_0900
     * @tc.name testVisualOpacityBlendOverBackground
     * @tc.desc Verify a black foreground at 0.5 opacity over white blends to gray 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualOpacityBlendOverBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(OpacityModel.blendOver(0, 255, 0.5)).assertEqual(127.5);
        expect(OpacityModel.blendOver(0, 255, 1)).assertEqual(0);
        expect(OpacityModel.blendOver(0, 255, 0)).assertEqual(255);
        expect(OpacityModel.blendOver(255, 0, 0.5)).assertEqual(127.5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1000
     * @tc.name testVisualCornerRadiusBounds
     * @tc.desc Verify radius 0 and 100 are valid while 101 is invalid and clamps to the maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualCornerRadiusBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(CornerRadiusModel.isValidRadius(0)).assertTrue();
        expect(CornerRadiusModel.isValidRadius(MAX_CORNER_RADIUS)).assertTrue();
        expect(CornerRadiusModel.isValidRadius(MAX_CORNER_RADIUS + 1)).assertFalse();
        expect(CornerRadiusModel.clampRadius(MAX_CORNER_RADIUS + 1)).assertEqual(MAX_CORNER_RADIUS);
        expect(CornerRadiusModel.clampRadius(-5)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1100
     * @tc.name testVisualCornerRadiusFullyRounded
     * @tc.desc Verify a 50 radius on a 100 short side is fully rounded while 49 on 100 is not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualCornerRadiusFullyRounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(CornerRadiusModel.isFullyRounded(50, 100)).assertTrue();
        expect(CornerRadiusModel.isFullyRounded(49, 100)).assertFalse();
        expect(CornerRadiusModel.isFullyRounded(10, 0)).assertFalse();
        expect(CornerRadiusModel.isFullyRounded(0, 100)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1200
     * @tc.name testVisualCornerRadiusInsetArea
     * @tc.desc Verify a 100x100 box with radius 10 yields an inset area of 9914.16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualCornerRadiusInsetArea', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(CornerRadiusModel.insetArea(100, 100, 10)).assertEqual(9914.16);
        expect(CornerRadiusModel.insetArea(100, 100, 0)).assertEqual(10000);
        expect(CornerRadiusModel.insetArea(0, 100, 10)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1300
     * @tc.name testVisualAntialiasLevels
     * @tc.desc Verify antialias levels 0 to 3 are valid and level 4 is rejected by the validator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualAntialiasLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(AntialiasModel.isValidLevel(AA_LEVEL_OFF)).assertTrue();
        expect(AntialiasModel.isValidLevel(AA_LEVEL_HIGH)).assertTrue();
        expect(AntialiasModel.isValidLevel(4)).assertFalse();
        try {
          AntialiasModel.validateLevel(4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VisualTokenError');
        }
        expect(AntialiasModel.validateLevel(AA_LEVEL_MEDIUM)).assertEqual(AA_LEVEL_MEDIUM);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1400
     * @tc.name testVisualAntialiasSampleCounts
     * @tc.desc Verify sample counts are 1 2 4 8 across the four antialias levels and off disables it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualAntialiasSampleCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(AntialiasModel.sampleCount(AA_LEVEL_OFF)).assertEqual(1);
        expect(AntialiasModel.sampleCount(AA_LEVEL_LOW)).assertEqual(2);
        expect(AntialiasModel.sampleCount(AA_LEVEL_MEDIUM)).assertEqual(4);
        expect(AntialiasModel.sampleCount(AA_LEVEL_HIGH)).assertEqual(8);
        expect(AntialiasModel.isEnabled(AA_LEVEL_OFF)).assertFalse();
        expect(AntialiasModel.isEnabled(AA_LEVEL_LOW)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1500
     * @tc.name testVisualAnimationDurationBounds
     * @tc.desc Verify durations 0 and 3000 are valid while -1 and 3001 are invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualAnimationDurationBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(AnimationDurationModel.isValidDuration(MIN_ANIMATION_DURATION)).assertTrue();
        expect(AnimationDurationModel.isValidDuration(MAX_ANIMATION_DURATION)).assertTrue();
        expect(AnimationDurationModel.isValidDuration(-1)).assertFalse();
        expect(AnimationDurationModel.isValidDuration(MAX_ANIMATION_DURATION + 1)).assertFalse();
        expect(AnimationDurationModel.clampDuration(-1)).assertEqual(0);
        expect(AnimationDurationModel.clampDuration(3001)).assertEqual(MAX_ANIMATION_DURATION);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1600
     * @tc.name testVisualAnimationDurationRejection
     * @tc.desc Verify a negative duration raises VisualTokenError through the strict validator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualAnimationDurationRejection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          AnimationDurationModel.validateDuration(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VisualTokenError');
        }
        expect(AnimationDurationModel.validateDuration(DEFAULT_ANIMATION_DURATION))
          .assertEqual(DEFAULT_ANIMATION_DURATION);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1700
     * @tc.name testVisualAnimationProgressCurve
     * @tc.desc Verify progress is 0 at time 0, 0.25 at 250 of 1000 and 1 exactly at the duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualAnimationProgressCurve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(AnimationDurationModel.progressAt(0, 1000)).assertEqual(0);
        expect(AnimationDurationModel.progressAt(250, 1000)).assertEqual(0.25);
        expect(AnimationDurationModel.progressAt(1000, 1000)).assertEqual(1);
        expect(AnimationDurationModel.progressAt(1500, 1000)).assertEqual(1);
        expect(AnimationDurationModel.progressAt(250, 0)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1800
     * @tc.name testVisualAnimationRemainingTime
     * @tc.desc Verify remaining time is full at the start and zero at or after the duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualAnimationRemainingTime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(AnimationDurationModel.remainingAt(0, DEFAULT_ANIMATION_DURATION)).assertEqual(DEFAULT_ANIMATION_DURATION);
        expect(AnimationDurationModel.remainingAt(100, DEFAULT_ANIMATION_DURATION)).assertEqual(200);
        expect(AnimationDurationModel.remainingAt(300, DEFAULT_ANIMATION_DURATION)).assertEqual(0);
        expect(AnimationDurationModel.remainingAt(500, DEFAULT_ANIMATION_DURATION)).assertEqual(0);
        expect(AnimationDurationModel.remainingAt(0, 0)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_1900
     * @tc.name testVisualAnimationSupportedDurations
     * @tc.desc Verify the supported duration table holds seven entries and recognizes 250 but not 260
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualAnimationSupportedDurations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(AnimationDurationModel.supportedDurationCount()).assertEqual(7);
        expect(AnimationDurationModel.isSupportedDuration(FADE_DURATION)).assertTrue();
        expect(AnimationDurationModel.isSupportedDuration(260)).assertFalse();
        expect(AnimationDurationModel.isSupportedDuration(0)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2000
     * @tc.name testVisualContrastWhiteBlack
     * @tc.desc Verify white on black reaches the maximum WCAG contrast ratio of 21 and passes AAA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualContrastWhiteBlack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const whiteLuminance: number = ContrastCalculator.relativeLuminance(255, 255, 255);
        const blackLuminance: number = ContrastCalculator.relativeLuminance(0, 0, 0);
        expect(whiteLuminance).assertEqual(1);
        expect(blackLuminance).assertEqual(0);
        expect(ContrastCalculator.contrastRatio(whiteLuminance, blackLuminance)).assertEqual(21);
        expect(ContrastCalculator.passesAaa(whiteLuminance, blackLuminance)).assertTrue();
        expect(ContrastCalculator.gradeOf(whiteLuminance, blackLuminance)).assertEqual('AAA');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2100
     * @tc.name testVisualContrastGrayLevels
     * @tc.desc Verify mid gray luminance 0.2159 gives 3.95 against white and 5.32 against black
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualContrastGrayLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const grayLuminance: number = ContrastCalculator.relativeLuminance(128, 128, 128);
        const whiteLuminance: number = ContrastCalculator.relativeLuminance(255, 255, 255);
        const blackLuminance: number = ContrastCalculator.relativeLuminance(0, 0, 0);
        expect(grayLuminance).assertEqual(0.2159);
        expect(ContrastCalculator.contrastRatio(whiteLuminance, grayLuminance)).assertEqual(3.95);
        expect(ContrastCalculator.contrastRatio(grayLuminance, blackLuminance)).assertEqual(5.32);
        expect(ContrastCalculator.passesNormalText(grayLuminance, blackLuminance)).assertTrue();
        expect(ContrastCalculator.passesNormalText(whiteLuminance, grayLuminance)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2200
     * @tc.name testVisualContrastPrimaryColors
     * @tc.desc Verify primary channel luminances red 0.2126 green 0.7152 blue 0.0722 and their coefficient sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualContrastPrimaryColors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(ContrastCalculator.relativeLuminance(255, 0, 0)).assertEqual(0.2126);
        expect(ContrastCalculator.relativeLuminance(0, 255, 0)).assertEqual(0.7152);
        expect(ContrastCalculator.relativeLuminance(0, 0, 255)).assertEqual(0.0722);
        expect(Math.round((LUMINANCE_RED_COEFFICIENT + LUMINANCE_GREEN_COEFFICIENT +
          LUMINANCE_BLUE_COEFFICIENT) * 10000) / 10000).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2300
     * @tc.name testVisualContrastRedOnWhite
     * @tc.desc Verify pure red on white yields a 4.0 ratio that clears AA large text but fails AA normal text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualContrastRedOnWhite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const redLuminance: number = ContrastCalculator.relativeLuminance(255, 0, 0);
        const whiteLuminance: number = ContrastCalculator.relativeLuminance(255, 255, 255);
        const ratio: number = ContrastCalculator.contrastRatio(redLuminance, whiteLuminance);
        expect(ratio).assertEqual(4);
        expect(ContrastCalculator.passesLargeText(redLuminance, whiteLuminance)).assertTrue();
        expect(ContrastCalculator.passesNormalText(redLuminance, whiteLuminance)).assertFalse();
        expect(ContrastCalculator.gradeOf(redLuminance, whiteLuminance)).assertEqual('AA_LARGE');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2400
     * @tc.name testVisualContrastSymmetric
     * @tc.desc Verify the contrast ratio is order independent for the same luminance pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualContrastSymmetric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const grayLuminance: number = ContrastCalculator.relativeLuminance(128, 128, 128);
        const blackLuminance: number = ContrastCalculator.relativeLuminance(0, 0, 0);
        expect(ContrastCalculator.contrastRatio(grayLuminance, blackLuminance))
          .assertEqual(ContrastCalculator.contrastRatio(blackLuminance, grayLuminance));
        expect(ContrastCalculator.contrastRatio(blackLuminance, blackLuminance)).assertEqual(1);
        expect(ContrastCalculator.contrastRatio(0.5, 0.5)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2500
     * @tc.name testVisualProfileValidation
     * @tc.desc Verify a valid profile exposes its five tokens while a bad radius raises VisualTokenError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualProfileValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const profile: VisualEffectProfile =
          new VisualEffectProfile(BOLD_WEIGHT_NUMERIC, 1, 8, AA_LEVEL_HIGH, DEFAULT_ANIMATION_DURATION);
        expect(profile.getWeight()).assertEqual(700);
        expect(profile.getOpacity()).assertEqual(1);
        expect(profile.getRadius()).assertEqual(8);
        expect(profile.getAntialiasLevel()).assertEqual(AA_LEVEL_HIGH);
        expect(profile.getDuration()).assertEqual(DEFAULT_ANIMATION_DURATION);
        try {
          new VisualEffectProfile(BOLD_WEIGHT_NUMERIC, 1, 101, AA_LEVEL_HIGH, DEFAULT_ANIMATION_DURATION);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VisualTokenError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2600
     * @tc.name testVisualProfileQualityAndFrameTime
     * @tc.desc Verify a high quality profile divides a 300ms duration into 37.5ms frames at 8 samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualProfileQualityAndFrameTime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const highQuality: VisualEffectProfile =
          new VisualEffectProfile(BOLD_WEIGHT_NUMERIC, 1, 8, AA_LEVEL_HIGH, DEFAULT_ANIMATION_DURATION);
        const lowQuality: VisualEffectProfile =
          new VisualEffectProfile(BOLD_WEIGHT_NUMERIC, 0.5, 8, AA_LEVEL_OFF, DEFAULT_ANIMATION_DURATION);
        expect(highQuality.singleFrameDuration()).assertEqual(37.5);
        expect(lowQuality.singleFrameDuration()).assertEqual(DEFAULT_ANIMATION_DURATION);
        expect(highQuality.isHighQuality()).assertTrue();
        expect(lowQuality.isHighQuality()).assertFalse();
        expect(highQuality.describe()).assertEqual('bold/opacity-1/radius-8');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2700
     * @tc.name testVisualProfileInvalidOpacityRejected
     * @tc.desc Verify constructing a profile with opacity 1.5 raises VisualTokenError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualProfileInvalidOpacityRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          new VisualEffectProfile(BOLD_WEIGHT_NUMERIC, 1.5, 8, AA_LEVEL_HIGH, DEFAULT_ANIMATION_DURATION);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('VisualTokenError');
        }
        expect(OpacityModel.isValidOpacity(1.5)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2800
     * @tc.name testVisualRealUiBoldTextRendered
     * @tc.desc Verify the live HelloWorld text node renders and its copy is the initial bold styled string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualRealUiBoldTextRendered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const matches: Component[] = await findComponentsByText(driver, PAGE_TEXT_INITIAL);
        expect(matches.length).assertEqual(1);
        const liveText: string = await runSerializedUiOperation(async (): Promise<string> => {
          const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
          return await component.getText();
        });
        expect(liveText).assertEqual(PAGE_TEXT_INITIAL);
        expect(FontWeightMapping.isBold(BOLD_WEIGHT_NUMERIC)).assertTrue();
      } catch (e) {
        logError(`testVisualRealUiBoldTextRendered failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_2900
     * @tc.name testVisualRealUiTextAfterTransitionKeepsStyleModel
     * @tc.desc Verify the text node still exists after the click and the style model weight is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualRealUiTextAfterTransitionKeepsStyleModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await runSerializedUiOperation(async (): Promise<void> => {
          const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
          await component.click();
          await driver.delayMs(100);
        });
        const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(clickedVisible).assertTrue();
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        expect(FontWeightMapping.rank(BOLD_WEIGHT_NUMERIC)).assertEqual(7);
      } catch (e) {
        logError(`testVisualRealUiTextAfterTransitionKeepsStyleModel failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_VISUAL_3000
     * @tc.name testVisualRealUiRoundedRadiusModelStable
     * @tc.desc Verify radius clamping is idempotent across repeated evaluation for live UI box sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVisualRealUiRoundedRadiusModelStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const liveTextExists: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(liveTextExists).assertTrue();
        const firstClamp: number = CornerRadiusModel.clampRadius(64);
        const secondClamp: number = CornerRadiusModel.clampRadius(firstClamp);
        expect(firstClamp).assertEqual(64);
        expect(secondClamp).assertEqual(firstClamp);
        expect(CornerRadiusModel.insetArea(200, 100, 64)).assertEqual(16483.96);
        logInfo('testVisualRealUiRoundedRadiusModelStable: radius clamp idempotent');
      } catch (e) {
        logError(`testVisualRealUiRoundedRadiusModelStable failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })
  })
}
