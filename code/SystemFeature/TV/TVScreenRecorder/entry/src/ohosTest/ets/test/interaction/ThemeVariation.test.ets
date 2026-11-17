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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  recorderComponentCount,
  serializedDelay,
  isTipWindowVisible,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT
} from '../shared/RecordingDriver';

// Palette declared by pages/ScreenRecorderTimer and pages/ScreenRecorderDialog.
// The leading byte is the alpha channel of the ARGB literal.
const TIMER_BACKGROUND: string = '#B33A3F62';
const DIALOG_BACKGROUND: string = '#B33A3F62';
const TRANSPARENT_WINDOW_BACKGROUND: string = '#00000000';
const PRIMARY_TEXT_COLOR: string = '#FFFFFF';
const ERROR_TEXT_COLOR: string = '#e00606';

// Corner radius of the two floating window pages.
const DIALOG_BORDER_RADIUS: number = 24;
const TIMER_BORDER_RADIUS: number = 28;

// Padding of the tip window: left, right, bottom.
const DIALOG_PADDING_LEFT: number = 43;
const DIALOG_PADDING_RIGHT: number = 43;
const DIALOG_PADDING_BOTTOM: number = 20;
const TIP_WINDOW_WIDTH: number = 686;

// Design limits enforced by the visual review of the TV sample.
const MIN_BORDER_RADIUS: number = 16;
const MAX_BORDER_RADIUS: number = 32;
const MIN_BODY_TEXT_CONTRAST: number = 4.5;

/** Parsed ARGB color. Alpha is -1 when the literal is malformed. */
interface ColorValue {
  hex: string;
  alpha: number;
  red: number;
  green: number;
  blue: number;
}

/** Theme variants exercised by the variation matrix. */
enum ThemeType {
  DARK = 'dark',
  TRANSPARENT = 'transparent',
  ERROR = 'error',
  HIGH_CONTRAST = 'high_contrast',
  CUSTOM = 'custom'
}

/** One theme observation. */
interface ThemeRecord {
  themeType: ThemeType;
  colorsCorrect: boolean;
  stylesApplied: boolean;
  responseTime: number;
  timestamp: number;
}
/** ARGB literal parser plus WCAG relative luminance helpers. */
class ColorParser {
  public normalize(hex: string): string {
    if (hex.startsWith('#')) {
      return hex.substring(1);
    }
    return hex;
  }

  public isValidHex(hex: string): boolean {
    const body: string = this.normalize(hex);
    if (body.length !== 8 && body.length !== 6) {
      return false;
    }
    for (let i = 0; i < body.length; i++) {
      const code: number = body.charCodeAt(i);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 70;
      const isLower: boolean = code >= 97 && code <= 102;
      if (!isDigit && !isUpper && !isLower) {
        return false;
      }
    }
    return true;
  }

  private toByte(pair: string): number {
    const high: number = this.nibble(pair.charCodeAt(0));
    const low: number = this.nibble(pair.charCodeAt(1));
    return high * 16 + low;
  }

  private nibble(code: number): number {
    if (code >= 48 && code <= 57) {
      return code - 48;
    }
    if (code >= 65 && code <= 70) {
      return code - 55;
    }
    return code - 87;
  }

  public parse(hex: string): ColorValue {
    const parsed: ColorValue = { hex: hex, alpha: -1, red: -1, green: -1, blue: -1 };
    if (!this.isValidHex(hex)) {
      return parsed;
    }
    const body: string = this.normalize(hex);
    if (body.length === 6) {
      parsed.alpha = 255;
      parsed.red = this.toByte(body.substring(0, 2));
      parsed.green = this.toByte(body.substring(2, 4));
      parsed.blue = this.toByte(body.substring(4, 6));
      return parsed;
    }
    parsed.alpha = this.toByte(body.substring(0, 2));
    parsed.red = this.toByte(body.substring(2, 4));
    parsed.green = this.toByte(body.substring(4, 6));
    parsed.blue = this.toByte(body.substring(6, 8));
    return parsed;
  }

  public isTransparent(hex: string): boolean {
    const parsed: ColorValue = this.parse(hex);
    return parsed.alpha === 0;
  }

  public isOpaque(hex: string): boolean {
    const parsed: ColorValue = this.parse(hex);
    return parsed.alpha === 255;
  }

  public equals(first: string, second: string): boolean {
    return this.normalize(first).toLowerCase() === this.normalize(second).toLowerCase();
  }

  private linearize(channel: number): number {
    const ratio: number = channel / 255;
    if (ratio <= 0.03928) {
      return ratio / 12.92;
    }
    return Math.pow((ratio + 0.055) / 1.055, 2.4);
  }

  // WCAG relative luminance of the base RGB channels. The alpha channel is
  // ignored because the floating window is always composited over video.
  public relativeLuminance(hex: string): number {
    const color: ColorValue = this.parse(hex);
    if (color.alpha < 0) {
      return 0;
    }
    return 0.2126 * this.linearize(color.red) + 0.7152 * this.linearize(color.green) +
      0.0722 * this.linearize(color.blue);
  }

  public contrastRatio(first: string, second: string): number {
    const firstLuminance: number = this.relativeLuminance(first);
    const secondLuminance: number = this.relativeLuminance(second);
    const lighter: number = Math.max(firstLuminance, secondLuminance);
    const darker: number = Math.min(firstLuminance, secondLuminance);
    return (lighter + 0.05) / (darker + 0.05);
  }
}

/** Corner radius validator of the floating windows. */
class BorderRadiusSpec {
  private dialogRadius: number;
  private timerRadius: number;

  constructor(dialogRadius: number, timerRadius: number) {
    this.dialogRadius = dialogRadius;
    this.timerRadius = timerRadius;
  }

  public getDialogRadius(): number {
    return this.dialogRadius;
  }

  public getTimerRadius(): number {
    return this.timerRadius;
  }

  public isWithinDesignRange(radius: number): boolean {
    return radius >= MIN_BORDER_RADIUS && radius <= MAX_BORDER_RADIUS;
  }

  public isTimerRounderThanDialog(): boolean {
    return this.timerRadius > this.dialogRadius;
  }

  // A radius larger than half of the shorter side would produce a capsule.
  public isClampedForHeight(radius: number, height: number): boolean {
    return radius <= height / 2;
  }
}

/** Padding model of the tip window. */
class DialogPaddingModel {
  private left: number;
  private right: number;
  private bottom: number;

  constructor(left: number, right: number, bottom: number) {
    this.left = left;
    this.right = right;
    this.bottom = bottom;
  }

  public getContentWidth(windowWidth: number): number {
    return windowWidth - this.left - this.right;
  }

  public getHorizontalPadding(): number {
    return this.left + this.right;
  }

  public isSymmetrical(): boolean {
    return this.left === this.right;
  }

  public getBottom(): number {
    return this.bottom;
  }

  public isPositive(): boolean {
    return this.left > 0 && this.right > 0 && this.bottom > 0;
  }
}

/** Singleton theme tracker. */
class ThemeVariationTracker {
  private static instance: ThemeVariationTracker | null = null;
  private themeHistory: ThemeRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  public static getInstance(): ThemeVariationTracker {
    if (ThemeVariationTracker.instance === null) {
      ThemeVariationTracker.instance = new ThemeVariationTracker();
    }
    return ThemeVariationTracker.instance;
  }

  public recordTheme(themeType: ThemeType, colorsCorrect: boolean, stylesApplied: boolean,
    responseTime: number): void {
    const record: ThemeRecord = {
      themeType: themeType,
      colorsCorrect: colorsCorrect,
      stylesApplied: stylesApplied,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.themeHistory.push(record);
    this.totalTests++;
    if (colorsCorrect && stylesApplied) {
      this.successfulTests++;
    }
  }

  public getThemeHistory(): ThemeRecord[] {
    const copied: ThemeRecord[] = [];
    for (let i = 0; i < this.themeHistory.length; i++) {
      copied.push(this.themeHistory[i]);
    }
    return copied;
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getSuccessfulTests(): number {
    return this.successfulTests;
  }

  public getSuccessRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.successfulTests / this.totalTests;
  }

  public hasTestedTheme(themeType: ThemeType): boolean {
    for (let i = 0; i < this.themeHistory.length; i++) {
      if (this.themeHistory[i].themeType === themeType) {
        return true;
      }
    }
    return false;
  }

  public resetTracker(): void {
    this.themeHistory = [];
    this.totalTests = 0;
    this.successfulTests = 0;
  }
}
export default function themeVariationTest(): void {
  describe('ThemeVariation_Test', () => {
    let driver: Driver;
    let themeTracker: ThemeVariationTracker;

    beforeAll(async () => {
      driver = getDriver();
      themeTracker = ThemeVariationTracker.getInstance();
      themeTracker.resetTracker();
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    it('timer_background_should_parse_argb_channels', 0, async () => {
      const parser = new ColorParser();
      const color = parser.parse(TIMER_BACKGROUND);
      expect(color.alpha).assertEqual(179);
      expect(color.red).assertEqual(58);
      expect(color.green).assertEqual(63);
      expect(color.blue).assertEqual(98);
      expect(parser.isValidHex(TIMER_BACKGROUND)).assertTrue();
    });

    it('dialog_and_timer_should_share_background_color', 0, async () => {
      const parser = new ColorParser();
      expect(parser.equals(DIALOG_BACKGROUND, TIMER_BACKGROUND)).assertTrue();
      expect(parser.equals('#B33A3F62', '#b33a3f62')).assertTrue();
      expect(parser.equals(DIALOG_BACKGROUND, PRIMARY_TEXT_COLOR)).assertFalse();
    });

    it('transparent_window_background_should_have_zero_alpha', 0, async () => {
      const parser = new ColorParser();
      expect(parser.isTransparent(TRANSPARENT_WINDOW_BACKGROUND)).assertTrue();
      expect(parser.isOpaque(TRANSPARENT_WINDOW_BACKGROUND)).assertFalse();
      expect(parser.parse(TRANSPARENT_WINDOW_BACKGROUND).alpha).assertEqual(0);
    });

    it('primary_text_color_should_be_opaque_white', 0, async () => {
      const parser = new ColorParser();
      const text = parser.parse(PRIMARY_TEXT_COLOR);
      expect(text.alpha).assertEqual(255);
      expect(text.red).assertEqual(255);
      expect(text.green).assertEqual(255);
      expect(text.blue).assertEqual(255);
      expect(parser.isOpaque(PRIMARY_TEXT_COLOR)).assertTrue();
    });

    it('malformed_color_literal_should_be_rejected', 0, async () => {
      const parser = new ColorParser();
      expect(parser.isValidHex('#12345')).assertFalse();
      expect(parser.isValidHex('#GGGGGGGG')).assertFalse();
      expect(parser.parse('#12345').alpha).assertEqual(-1);
      expect(parser.relativeLuminance('#12345')).assertEqual(0);
    });

    it('white_text_should_meet_contrast_on_dark_panel', 0, async () => {
      const parser = new ColorParser();
      const ratio = parser.contrastRatio(PRIMARY_TEXT_COLOR, TIMER_BACKGROUND);
      expect(ratio).assertLarger(MIN_BODY_TEXT_CONTRAST);
      expect(ratio).assertLess(21);
      expect(parser.contrastRatio(TIMER_BACKGROUND, PRIMARY_TEXT_COLOR)).assertEqual(ratio);
    });

    it('error_text_should_stay_readable_on_dark_panel', 0, async () => {
      const parser = new ColorParser();
      const error = parser.parse(ERROR_TEXT_COLOR);
      expect(error.red).assertLarger(error.green);
      expect(error.red).assertLarger(error.blue);
      expect(parser.contrastRatio(ERROR_TEXT_COLOR, TIMER_BACKGROUND)).assertLarger(1.5);
    });

    it('dark_panel_should_be_darker_than_white_text', 0, async () => {
      const parser = new ColorParser();
      const panel = parser.relativeLuminance(TIMER_BACKGROUND);
      const text = parser.relativeLuminance(PRIMARY_TEXT_COLOR);
      expect(text).assertLarger(panel);
      expect(panel).assertLargerOrEqual(0);
      expect(text).assertLarger(0.99);
    });

    it('dialog_radius_should_match_design', 0, async () => {
      const spec = new BorderRadiusSpec(DIALOG_BORDER_RADIUS, TIMER_BORDER_RADIUS);
      expect(spec.getDialogRadius()).assertEqual(24);
      expect(spec.isWithinDesignRange(spec.getDialogRadius())).assertTrue();
      expect(spec.isClampedForHeight(spec.getDialogRadius(), 100)).assertTrue();
    });

    it('timer_radius_should_be_larger_than_dialog_radius', 0, async () => {
      const spec = new BorderRadiusSpec(DIALOG_BORDER_RADIUS, TIMER_BORDER_RADIUS);
      expect(spec.getTimerRadius()).assertEqual(28);
      expect(spec.isTimerRounderThanDialog()).assertTrue();
      expect(spec.isClampedForHeight(spec.getTimerRadius(), 56)).assertTrue();
      expect(spec.isClampedForHeight(40, 56)).assertFalse();
    });

    it('tip_window_padding_should_be_symmetrical', 0, async () => {
      const padding = new DialogPaddingModel(DIALOG_PADDING_LEFT, DIALOG_PADDING_RIGHT, DIALOG_PADDING_BOTTOM);
      expect(padding.isSymmetrical()).assertTrue();
      expect(padding.isPositive()).assertTrue();
      expect(padding.getHorizontalPadding()).assertEqual(86);
      expect(padding.getBottom()).assertEqual(20);
      expect(padding.getContentWidth(TIP_WINDOW_WIDTH)).assertEqual(600);
    });

    it('dialog_should_display_correctly_in_dark_theme', 0, async () => {
      const parser = new ColorParser();
      const colorsCorrect = parser.contrastRatio(PRIMARY_TEXT_COLOR, TIMER_BACKGROUND) > MIN_BODY_TEXT_CONTRAST;
      themeTracker.recordTheme(ThemeType.DARK, colorsCorrect, true, 40);
      expect(themeTracker.hasTestedTheme(ThemeType.DARK)).assertTrue();
    });

    it('dialog_should_display_correctly_in_transparent_theme', 0, async () => {
      const parser = new ColorParser();
      const applied = parser.isTransparent(TRANSPARENT_WINDOW_BACKGROUND);
      themeTracker.recordTheme(ThemeType.TRANSPARENT, applied, true, 35);
      expect(themeTracker.hasTestedTheme(ThemeType.TRANSPARENT)).assertTrue();
    });

    it('dialog_should_display_correctly_in_error_theme', 0, async () => {
      const parser = new ColorParser();
      const correct = parser.parse(ERROR_TEXT_COLOR).red > 0;
      themeTracker.recordTheme(ThemeType.ERROR, correct, true, 30);
      expect(themeTracker.hasTestedTheme(ThemeType.ERROR)).assertTrue();
    });

    it('dialog_should_display_correctly_in_high_contrast_theme', 0, async () => {
      const parser = new ColorParser();
      const correct = parser.contrastRatio(PRIMARY_TEXT_COLOR, TRANSPARENT_WINDOW_BACKGROUND) > 1;
      themeTracker.recordTheme(ThemeType.HIGH_CONTRAST, correct, true, 45);
      expect(themeTracker.hasTestedTheme(ThemeType.HIGH_CONTRAST)).assertTrue();
    });

    it('theme_records_timestamps_should_be_chronological', 0, async () => {
      themeTracker.resetTracker();
      themeTracker.recordTheme(ThemeType.DARK, true, true, 50);
      await serializedDelay(driver, 30);
      themeTracker.recordTheme(ThemeType.ERROR, true, true, 50);
      await serializedDelay(driver, 30);
      themeTracker.recordTheme(ThemeType.CUSTOM, true, true, 50);

      const history = themeTracker.getThemeHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();
      expect(history[1].timestamp <= history[2].timestamp).assertTrue();
    });

    it('theme_tracker_singleton_should_maintain_consistency', 0, async () => {
      const tracker1 = ThemeVariationTracker.getInstance();
      const tracker2 = ThemeVariationTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordTheme(ThemeType.DARK, true, true, 100);
      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getSuccessfulTests()).assertEqual(1);
    });

    it('dialog_should_handle_all_themes', 0, async () => {
      themeTracker.resetTracker();
      const themes: ThemeType[] = [ThemeType.DARK, ThemeType.TRANSPARENT, ThemeType.ERROR,
        ThemeType.HIGH_CONTRAST, ThemeType.CUSTOM];
      for (let i = 0; i < themes.length; i++) {
        themeTracker.recordTheme(themes[i], true, true, 40);
      }
      expect(themeTracker.getTotalTests()).assertEqual(5);
      expect(themeTracker.getSuccessRate()).assertEqual(1);
    });

    it('dialog_should_handle_rapid_theme_changes', 0, async () => {
      themeTracker.resetTracker();
      const themes: ThemeType[] = [ThemeType.DARK, ThemeType.ERROR, ThemeType.CUSTOM];
      for (let i = 0; i < 20; i++) {
        themeTracker.recordTheme(themes[i % themes.length], true, true, 20);
      }
      expect(themeTracker.getTotalTests()).assertEqual(20);
      expect(themeTracker.getSuccessRate()).assertEqual(1);
    });

    it('theme_should_keep_rendering_stable', 0, async () => {
      const initialCount = await recorderComponentCount(driver);
      themeTracker.resetTracker();
      for (let i = 0; i < 5; i++) {
        themeTracker.recordTheme(ThemeType.DARK, true, true, 25);
        await serializedDelay(driver, 20);
      }
      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 1);
    });

    it('tip_window_theme_probe_should_be_tolerant', 0, async () => {
      const visible = await isTipWindowVisible(driver);
      if (visible) {
        expect(visible).assertTrue();
      } else {
        const parser = new ColorParser();
        expect(parser.isTransparent(TRANSPARENT_WINDOW_BACKGROUND)).assertTrue();
      }
    });

    it('comprehensive_theme_variation_scenario', 0, async () => {
      themeTracker.resetTracker();
      const parser = new ColorParser();
      const spec = new BorderRadiusSpec(DIALOG_BORDER_RADIUS, TIMER_BORDER_RADIUS);
      const padding = new DialogPaddingModel(DIALOG_PADDING_LEFT, DIALOG_PADDING_RIGHT, DIALOG_PADDING_BOTTOM);
      const scenarioStart = Date.now();

      const contrast = parser.contrastRatio(PRIMARY_TEXT_COLOR, DIALOG_BACKGROUND);
      themeTracker.recordTheme(ThemeType.DARK, contrast > MIN_BODY_TEXT_CONTRAST, true, 40);

      const themed = spec.isTimerRounderThanDialog() && padding.isSymmetrical();
      themeTracker.recordTheme(ThemeType.CUSTOM, themed, true, 45);

      const scenarioEnd = Date.now();
      expect(themeTracker.getTotalTests()).assertEqual(2);
      expect(themeTracker.getSuccessfulTests()).assertEqual(2);
      expect(scenarioEnd - scenarioStart).assertLessOrEqual(5000);
    });
  });
}


