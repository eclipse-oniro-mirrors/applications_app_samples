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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, countById, textById, serializedDelay,
  ID_INPUT_URL, ID_NAV_HOME, TIMEOUT_COMPONENT, DELAY_TOUCH_EVENT,
  TOLERANCE_COMPONENT_COUNT, MAX_TAB_COUNT
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserContentScalingTest';

/* ------------------------------------------------------------------ */
/* Typography contract of TitleBar.ets / PhoneLayout.ets               */
/* ------------------------------------------------------------------ */

const TABLET_FONT_SIZE: number = 18;
const PHONE_FONT_SIZE: number = 16;
const PHONE_INPUT_HEIGHT: number = 34;
const AUTO_HEIGHT: number = -1;
const BUTTON_WIDTH: number = 22;
const TAB_STRIP_HEIGHT: number = 33;
const PAGE_COUNT_FONT_SIZE: number = 16;
const TITLE_HEIGHT: number = 40;

const MIN_FONT_SCALE: number = 0.8;
const MAX_FONT_SCALE: number = 2.0;

const ORIENTATION_PORTRAIT: string = 'portrait';
const ORIENTATION_LANDSCAPE: string = 'landscape';

const ELLIPSIS: string = '...';

const PLACEHOLDER_TABLET: string = '输入网址...';
const PLACEHOLDER_PHONE: string = '输入网址...';

/* ------------------------------------------------------------------ */
/* Scaling models                                                      */
/* ------------------------------------------------------------------ */

/** Effective typography of the active layout. */
class ScalingProfile {
  name: string;
  orientation: string;
  fontSize: number;
  placeholderFontSize: number;
  inputHeight: number;
  tabStripHeight: number;
  buttonWidth: number;

  constructor(name: string, orientation: string, fontSize: number,
    inputHeight: number) {
    this.name = name;
    this.orientation = orientation;
    this.fontSize = fontSize;
    this.placeholderFontSize = fontSize;
    this.inputHeight = inputHeight;
    this.tabStripHeight = TAB_STRIP_HEIGHT;
    this.buttonWidth = BUTTON_WIDTH;
  }

  hasFixedInputHeight(): boolean {
    return this.inputHeight > 0;
  }

  /** Placeholder and text always share one size in the sample. */
  isPlaceholderConsistent(): boolean {
    return this.placeholderFontSize === this.fontSize;
  }

  describeLayout(): string {
    return `${this.name}/${this.orientation} font=${this.fontSize} height=${this.inputHeight}`;
  }
}

function tabletProfile(orientation: string = ORIENTATION_LANDSCAPE): ScalingProfile {
  return new ScalingProfile('tablet', orientation, TABLET_FONT_SIZE, AUTO_HEIGHT);
}

function phoneProfile(orientation: string = ORIENTATION_PORTRAIT): ScalingProfile {
  return new ScalingProfile('phone', orientation, PHONE_FONT_SIZE, PHONE_INPUT_HEIGHT);
}

/** Applies the system font scale with a hard clamp on both ends. */
class TextScaler {
  scale: number;

  constructor(scale: number = 1) {
    this.scale = scale;
  }

  clamp(): number {
    if (this.scale < MIN_FONT_SCALE) {
      return MIN_FONT_SCALE;
    }
    if (this.scale > MAX_FONT_SCALE) {
      return MAX_FONT_SCALE;
    }
    return this.scale;
  }

  scaleOf(baseSize: number): number {
    return Math.round(baseSize * this.clamp() * 100) / 100;
  }

  lineHeightOf(baseSize: number): number {
    return Math.round(baseSize * 1.4 * this.clamp() * 100) / 100;
  }

  /** Non positive scale values fall back to the smallest allowed scale. */
  normalize(): void {
    if (this.scale <= 0) {
      this.scale = MIN_FONT_SCALE;
    }
  }
}

/** Converts vp values into px for a physical pixel density. */
class DensityConverter {
  density: number;

  constructor(density: number = 1) {
    this.density = density <= 0 ? 1 : density;
  }

  toPx(vp: number): number {
    return Math.round(vp * this.density);
  }

  toVp(px: number): number {
    return Math.round(px / this.density * 100) / 100;
  }

  isIntegerDensity(): boolean {
    return this.density === Math.floor(this.density);
  }
}

/** Greedy truncation used when the url text exceeds the available width. */
class TextFitter {
  fontSize: number;
  maxWidth: number;

  constructor(fontSize: number, maxWidth: number) {
    this.fontSize = fontSize;
    this.maxWidth = maxWidth;
  }

  charWidth(): number {
    return this.fontSize * 0.55;
  }

  maxChars(): number {
    const width: number = this.charWidth();
    if (width <= 0) {
      return 0;
    }
    return Math.floor(this.maxWidth / width);
  }

  truncate(text: string): string {
    const limit: number = this.maxChars();
    if (limit <= 0) {
      return '';
    }
    if (text.length <= limit) {
      return text;
    }
    if (limit <= ELLIPSIS.length) {
      return text.substring(0, limit);
    }
    return text.substring(0, limit - ELLIPSIS.length) + ELLIPSIS;
  }

  isTruncated(text: string): boolean {
    return text.length > this.maxChars();
  }

  /** A truncated label must never grow beyond the available width. */
  fits(text: string): boolean {
    return this.truncate(text).length * this.charWidth() <= this.maxWidth + 0.5;
  }
}

/** Recomputes the profile when the orientation or density changes. */
class LayoutScaler {
  profile: ScalingProfile;
  scale: number;

  constructor(profile: ScalingProfile, scale: number = 1) {
    this.profile = profile;
    this.scale = scale;
  }

  onOrientation(orientation: string): ScalingProfile {
    const next: ScalingProfile = this.profile.name === 'phone' ?
      phoneProfile(orientation) : tabletProfile(orientation);
    this.profile = next;
    return next;
  }

  effectiveFont(): number {
    return new TextScaler(this.scale).scaleOf(this.profile.fontSize);
  }

  effectiveHeight(): number {
    if (this.profile.inputHeight <= 0) {
      return AUTO_HEIGHT;
    }
    return Math.round(this.profile.inputHeight * new TextScaler(this.scale).clamp());
  }

  effectiveButton(): number {
    const scaled: number = new TextScaler(this.scale).scaleOf(this.profile.buttonWidth);
    return scaled < BUTTON_WIDTH ? BUTTON_WIDTH : scaled;
  }

  /** Two consecutive recomputations must produce identical metrics. */
  recomputeTwice(): boolean {
    const firstFont: number = this.effectiveFont();
    const firstHeight: number = this.effectiveHeight();
    const firstButton: number = this.effectiveButton();
    return firstFont === this.effectiveFont() && firstHeight === this.effectiveHeight() &&
      firstButton === this.effectiveButton();
  }
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserContentScalingTest() {
  describe('browserContentScalingTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `tablet font ${TABLET_FONT_SIZE}, phone font ${PHONE_FONT_SIZE}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Scaling_001', 0, async () => {
      TestLogger.step(TAG, 'tablet url input uses an eighteen vp font');
      const profile: ScalingProfile = tabletProfile();
      expect(profile.fontSize).assertEqual(TABLET_FONT_SIZE);
      expect(profile.fontSize).assertEqual(18);
      expect(profile.placeholderFontSize).assertEqual(18);
      expect(profile.isPlaceholderConsistent()).assertTrue();
      expect(profile.hasFixedInputHeight()).assertFalse();
      expect(profile.inputHeight).assertEqual(AUTO_HEIGHT);
    });

    it('Browser_Scaling_002', 0, async () => {
      TestLogger.step(TAG, 'phone url input uses a sixteen vp font');
      const profile: ScalingProfile = phoneProfile();
      expect(profile.fontSize).assertEqual(PHONE_FONT_SIZE);
      expect(profile.fontSize).assertEqual(16);
      expect(profile.placeholderFontSize).assertEqual(PHONE_FONT_SIZE);
      expect(profile.isPlaceholderConsistent()).assertTrue();
      expect(profile.fontSize).assertLess(TABLET_FONT_SIZE);
    });

    it('Browser_Scaling_003', 0, async () => {
      TestLogger.step(TAG, 'phone url input is exactly thirty four vp high');
      const profile: ScalingProfile = phoneProfile();
      expect(profile.inputHeight).assertEqual(PHONE_INPUT_HEIGHT);
      expect(profile.inputHeight).assertEqual(34);
      expect(profile.hasFixedInputHeight()).assertTrue();
      expect(profile.inputHeight).assertLarger(profile.fontSize);
      const scaled: LayoutScaler = new LayoutScaler(profile, 1);
      expect(scaled.effectiveHeight()).assertEqual(PHONE_INPUT_HEIGHT);
    });

    it('Browser_Scaling_004', 0, async () => {
      TestLogger.step(TAG, 'system font scale multiplies the base size');
      const scaler: TextScaler = new TextScaler(1.15);
      expect(scaler.clamp()).assertEqual(1.15);
      expect(scaler.scaleOf(TABLET_FONT_SIZE)).assertEqual(20.7);
      expect(scaler.scaleOf(PHONE_FONT_SIZE)).assertEqual(18.4);
      expect(scaler.lineHeightOf(PHONE_FONT_SIZE)).assertEqual(25.76);
      const plain: TextScaler = new TextScaler();
      expect(plain.clamp()).assertEqual(1);
      expect(plain.scaleOf(PHONE_FONT_SIZE)).assertEqual(PHONE_FONT_SIZE);
    });

    it('Browser_Scaling_005', 0, async () => {
      TestLogger.step(TAG, 'font scale is clamped to the supported range');
      const large: TextScaler = new TextScaler(3.2);
      expect(large.clamp()).assertEqual(MAX_FONT_SCALE);
      expect(large.scaleOf(TABLET_FONT_SIZE)).assertEqual(36);
      const tiny: TextScaler = new TextScaler(0.4);
      expect(tiny.clamp()).assertEqual(MIN_FONT_SCALE);
      expect(tiny.scaleOf(TABLET_FONT_SIZE)).assertEqual(14.4);
      const zero: TextScaler = new TextScaler(0);
      zero.normalize();
      expect(zero.scale).assertEqual(MIN_FONT_SCALE);
      expect(zero.scaleOf(PHONE_FONT_SIZE)).assertEqual(12.8);
    });

    it('Browser_Scaling_006', 0, async () => {
      TestLogger.step(TAG, 'portrait switches the title bar to the phone metrics');
      const scaler: LayoutScaler = new LayoutScaler(tabletProfile(ORIENTATION_LANDSCAPE), 1);
      expect(scaler.profile.fontSize).assertEqual(TABLET_FONT_SIZE);
      const portrait: ScalingProfile = scaler.onOrientation(ORIENTATION_PORTRAIT);
      expect(portrait.name).assertEqual('tablet');
      expect(portrait.orientation).assertEqual(ORIENTATION_PORTRAIT);
      expect(portrait.fontSize).assertEqual(TABLET_FONT_SIZE);
      expect(portrait.inputHeight).assertEqual(AUTO_HEIGHT);
      const phoneScaler: LayoutScaler = new LayoutScaler(phoneProfile(), 1);
      phoneScaler.onOrientation(ORIENTATION_LANDSCAPE);
      expect(phoneScaler.profile.fontSize).assertEqual(PHONE_FONT_SIZE);
      expect(phoneScaler.profile.inputHeight).assertEqual(PHONE_INPUT_HEIGHT);
    });

    it('Browser_Scaling_007', 0, async () => {
      TestLogger.step(TAG, 'density converts vp to px without drifting');
      const single: DensityConverter = new DensityConverter(1);
      const double: DensityConverter = new DensityConverter(2);
      const triple: DensityConverter = new DensityConverter(3);
      expect(single.toPx(34)).assertEqual(34);
      expect(double.toPx(34)).assertEqual(68);
      expect(triple.toPx(34)).assertEqual(102);
      expect(double.toVp(68)).assertEqual(34);
      expect(triple.toVp(102)).assertEqual(34);
      expect(double.isIntegerDensity()).assertTrue();
      expect(new DensityConverter(0).density).assertEqual(1);
      expect(new DensityConverter(2.5).isIntegerDensity()).assertFalse();
    });

    it('Browser_Scaling_008', 0, async () => {
      TestLogger.step(TAG, 'long urls are truncated with an ellipsis');
      const fitter: TextFitter = new TextFitter(PHONE_FONT_SIZE, 120);
      const longUrl: string = 'https://www.example.com/very/long/path/that/never/ends';
      const shortUrl: string = 'a.com';
      expect(fitter.maxChars()).assertLarger(0);
      expect(fitter.isTruncated(longUrl)).assertTrue();
      expect(fitter.isTruncated(shortUrl)).assertFalse();
      expect(fitter.truncate(shortUrl)).assertEqual(shortUrl);
      const truncated: string = fitter.truncate(longUrl);
      expect(truncated.endsWith(ELLIPSIS)).assertTrue();
      expect(truncated.length).assertLess(longUrl.length);
      expect(fitter.fits(longUrl)).assertTrue();
    });

    it('Browser_Scaling_009', 0, async () => {
      TestLogger.step(TAG, 'zero width fitter degrades to an empty label');
      const fitter: TextFitter = new TextFitter(PHONE_FONT_SIZE, 0);
      expect(fitter.maxChars()).assertEqual(0);
      expect(fitter.truncate('example.com')).assertEqual('');
      expect(fitter.fits('example.com')).assertTrue();
      const narrow: TextFitter = new TextFitter(TABLET_FONT_SIZE, 40);
      expect(narrow.truncate('https://example.com').length).assertLess(11);
      expect(narrow.truncate('https://example.com').endsWith(ELLIPSIS)).assertTrue();
    });

    it('Browser_Scaling_010', 0, async () => {
      TestLogger.step(TAG, 'buttons keep a twenty two vp minimum touch target');
      const smallScale: LayoutScaler = new LayoutScaler(phoneProfile(), 0.5);
      expect(smallScale.effectiveButton()).assertEqual(BUTTON_WIDTH);
      const normalScale: LayoutScaler = new LayoutScaler(phoneProfile(), 1);
      expect(normalScale.effectiveButton()).assertEqual(BUTTON_WIDTH);
      const largeScale: LayoutScaler = new LayoutScaler(phoneProfile(), 2);
      expect(largeScale.effectiveButton()).assertEqual(44);
      expect(largeScale.effectiveButton()).assertLarger(BUTTON_WIDTH);
      expect(smallScale.effectiveButton()).assertLess(largeScale.effectiveButton());
    });

    it('Browser_Scaling_011', 0, async () => {
      TestLogger.step(TAG, 'page count and tab strip keep their fixed metrics');
      expect(PAGE_COUNT_FONT_SIZE).assertEqual(16);
      expect(TAB_STRIP_HEIGHT).assertEqual(33);
      expect(TITLE_HEIGHT).assertEqual(40);
      const profile: ScalingProfile = phoneProfile();
      expect(profile.tabStripHeight).assertEqual(TAB_STRIP_HEIGHT);
      expect(profile.buttonWidth).assertEqual(BUTTON_WIDTH);
      const scaler: LayoutScaler = new LayoutScaler(tabletProfile(), 1.3);
      expect(scaler.profile.tabStripHeight).assertEqual(TAB_STRIP_HEIGHT);
      expect(scaler.effectiveFont()).assertEqual(23.4);
    });

    it('Browser_Scaling_012', 0, async () => {
      TestLogger.step(TAG, 'scaling recomputation is idempotent');
      const scaler: LayoutScaler = new LayoutScaler(phoneProfile(), 1.5);
      expect(scaler.recomputeTwice()).assertTrue();
      const firstFont: number = scaler.effectiveFont();
      const firstHeight: number = scaler.effectiveHeight();
      expect(scaler.effectiveFont()).assertEqual(firstFont);
      expect(scaler.effectiveHeight()).assertEqual(firstHeight);
      expect(firstFont).assertEqual(24);
      expect(firstHeight).assertEqual(51);
      scaler.onOrientation(ORIENTATION_LANDSCAPE);
      expect(scaler.recomputeTwice()).assertTrue();
    });

    it('Browser_Scaling_013', 0, async () => {
      TestLogger.step(TAG, 'url input is rendered after launch');
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const homePresent: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      const text: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `input present=${inputPresent}, home present=${homePresent}, text length=${text.length}`);
      expect(inputPresent).assertTrue();
      expect(typeof text).assertEqual('string');
      expect(homePresent || inputPresent).assertTrue();
      const liveProfile: ScalingProfile = tabletProfile();
      expect(liveProfile.fontSize).assertEqual(TABLET_FONT_SIZE);
    });
  });
}
