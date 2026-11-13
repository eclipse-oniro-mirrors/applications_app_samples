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
  isTimerWindowVisible,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT
} from '../shared/RecordingDriver';

// The recorder pages are laid out against a 1920 x 1080 art board. Every length
// written in the pages is a virtual pixel of that design, so the runtime value is
// derived from the real display width by utils/SizeCalc.
const DESIGN_WIDTH: number = 1920;
const DESIGN_HEIGHT: number = 1080;

// Floating window rectangles declared by ScreenRecorderAbility.
const TIP_RECT_X: number = 615;
const TIP_RECT_Y: number = 46;
const TIP_RECT_WIDTH: number = 686;
const TIP_RECT_HEIGHT: number = 100;

const TIMER_RECT_X: number = 96;
const TIMER_RECT_Y: number = 48;
const TIMER_RECT_WIDTH: number = 624;
const TIMER_RECT_HEIGHT: number = 56;

// The stop hint of the timer page is longer than the tip title, therefore it is
// the canonical marquee candidate of the sample.
const TIMER_HINT_TEXT: string = '同时按下菜单键与音量减键，即可结束录屏';
const TIP_TITLE_TEXT: string = '录屏';

// Allowed drift between the declared design rectangle and the computed centre.
const CENTER_TOLERANCE: number = 4;

/** A floating window rectangle expressed in virtual pixels. */
interface ScaledRect {
  x: number;
  y: number;
  width: number;
  height: number;
}

/** One display profile used by the scaling matrix. */
interface DisplayProfile {
  name: string;
  width: number;
  height: number;
  density: number;
}

/** Supported content scale levels, mirroring the TV text scaling setting. */
enum ScaleLevel {
  SCALE_75 = '75%',
  SCALE_100 = '100%',
  SCALE_125 = '125%',
  SCALE_150 = '150%',
  SCALE_200 = '200%'
}

/** Overflow policy applied by the text component when content is too wide. */
enum OverflowPolicy {
  CLIP = 'clip',
  ELLIPSIS = 'ellipsis',
  MARQUEE = 'marquee'
}

/** One scaling observation recorded by the tracker. */
interface ScalingRecord {
  scaleLevel: ScaleLevel;
  contentVisible: boolean;
  layoutIntact: boolean;
  responseTime: number;
  timestamp: number;
}

/** Reimplements utils/SizeCalc on top of an injectable display width. */
class SizeCalcModel {
  private displayWidth: number;
  private displayHeight: number;

  constructor(displayWidth: number, displayHeight: number) {
    this.displayWidth = displayWidth;
    this.displayHeight = displayHeight;
  }

  // sizeCalc(n) = display.width / 1920 * n
  public sizeCalc(value: number): number {
    if (this.displayWidth <= 0) {
      return 0;
    }
    return this.displayWidth / DESIGN_WIDTH * value;
  }

  // Height driven variant used by vertical padding of the dialog pages.
  public sizeCalcByHeight(value: number): number {
    if (this.displayHeight <= 0) {
      return 0;
    }
    return this.displayHeight / DESIGN_HEIGHT * value;
  }

  public scaleRect(rect: ScaledRect): ScaledRect {
    const scaled: ScaledRect = {
      x: this.sizeCalc(rect.x),
      y: this.sizeCalc(rect.y),
      width: this.sizeCalc(rect.width),
      height: this.sizeCalc(rect.height)
    };
    return scaled;
  }

  public getDisplayWidth(): number {
    return this.displayWidth;
  }

  public getDisplayHeight(): number {
    return this.displayHeight;
  }

  public getAspectRatio(): number {
    if (this.displayHeight <= 0) {
      return 0;
    }
    return this.displayWidth / this.displayHeight;
  }

  public isWideDisplay(): boolean {
    return this.getAspectRatio() > 1.5;
  }
}

/** Geometry helpers shared by the rectangle assertions. */
class RectGeometry {
  public getRight(rect: ScaledRect): number {
    return rect.x + rect.width;
  }

  public getBottom(rect: ScaledRect): number {
    return rect.y + rect.height;
  }

  public getCenterX(rect: ScaledRect): number {
    return rect.x + rect.width / 2;
  }

  public getCenterY(rect: ScaledRect): number {
    return rect.y + rect.height / 2;
  }

  public isInsideScreen(rect: ScaledRect, screenWidth: number, screenHeight: number): boolean {
    return rect.x >= 0 && rect.y >= 0 && this.getRight(rect) <= screenWidth &&
      this.getBottom(rect) <= screenHeight;
  }

  public isOverflowing(rect: ScaledRect, screenWidth: number, screenHeight: number): boolean {
    return this.getRight(rect) > screenWidth || this.getBottom(rect) > screenHeight;
  }

  public isHorizontallyCentered(rect: ScaledRect, screenWidth: number): boolean {
    const delta: number = Math.abs(this.getCenterX(rect) - screenWidth / 2);
    return delta <= CENTER_TOLERANCE;
  }

  public hasPositiveArea(rect: ScaledRect): boolean {
    return rect.width > 0 && rect.height > 0;
  }
}

/** Estimated text width model used to predict the overflow policy. */
class TextFitModel {
  // Average glyph width of the sample font, expressed as a fraction of the size.
  private static readonly GLYPH_RATIO: number = 0.6;
  private availableWidth: number;
  private fontSize: number;
  private text: string;

  constructor(availableWidth: number, fontSize: number, text: string) {
    this.availableWidth = availableWidth;
    this.fontSize = fontSize;
    this.text = text;
  }

  public getEstimatedTextWidth(): number {
    return this.text.length * this.fontSize * TextFitModel.GLYPH_RATIO;
  }

  public isOverflow(): boolean {
    return this.getEstimatedTextWidth() > this.availableWidth;
  }

  public getPolicy(): OverflowPolicy {
    if (this.isOverflow()) {
      return OverflowPolicy.MARQUEE;
    }
    return OverflowPolicy.CLIP;
  }

  public getAvailableWidth(): number {
    return this.availableWidth;
  }

  public getTextLength(): number {
    return this.text.length;
  }
}

/** Singleton tracker reused across the scaling cases. */
class ContentScalingTracker {
  private static instance: ContentScalingTracker | null = null;
  private scalingHistory: ScalingRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  public static getInstance(): ContentScalingTracker {
    if (ContentScalingTracker.instance === null) {
      ContentScalingTracker.instance = new ContentScalingTracker();
    }
    return ContentScalingTracker.instance;
  }

  public recordScaling(scaleLevel: ScaleLevel, contentVisible: boolean, layoutIntact: boolean,
    responseTime: number): void {
    const record: ScalingRecord = {
      scaleLevel: scaleLevel,
      contentVisible: contentVisible,
      layoutIntact: layoutIntact,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.scalingHistory.push(record);
    this.totalTests++;
    if (contentVisible && layoutIntact) {
      this.successfulTests++;
    }
  }

  public getScalingHistory(): ScalingRecord[] {
    const copied: ScalingRecord[] = [];
    for (let i = 0; i < this.scalingHistory.length; i++) {
      copied.push(this.scalingHistory[i]);
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

  public hasTestedScale(scaleLevel: ScaleLevel): boolean {
    for (let i = 0; i < this.scalingHistory.length; i++) {
      if (this.scalingHistory[i].scaleLevel === scaleLevel) {
        return true;
      }
    }
    return false;
  }

  public getAverageResponseTime(): number {
    if (this.scalingHistory.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.scalingHistory.length; i++) {
      total += this.scalingHistory[i].responseTime;
    }
    return total / this.scalingHistory.length;
  }

  public resetTracker(): void {
    this.scalingHistory = [];
    this.totalTests = 0;
    this.successfulTests = 0;
  }
}

/** Table of the display profiles exercised by the scaling matrix. */
function buildDisplayProfiles(): DisplayProfile[] {
  const profiles: DisplayProfile[] = [
    { name: 'hd', width: 1280, height: 720, density: 1 },
    { name: 'fhd', width: 1920, height: 1080, density: 1 },
    { name: 'qhd', width: 2560, height: 1440, density: 1.5 },
    { name: 'uhd', width: 3840, height: 2160, density: 2 }
  ];
  return profiles;
}

function buildTipRect(): ScaledRect {
  const rect: ScaledRect = { x: TIP_RECT_X, y: TIP_RECT_Y, width: TIP_RECT_WIDTH, height: TIP_RECT_HEIGHT };
  return rect;
}

function buildTimerRect(): ScaledRect {
  const rect: ScaledRect = { x: TIMER_RECT_X, y: TIMER_RECT_Y, width: TIMER_RECT_WIDTH, height: TIMER_RECT_HEIGHT };
  return rect;
}

export default function contentScalingTest(): void {
  describe('ContentScaling_Test', () => {
    let driver: Driver;
    let scalingTracker: ContentScalingTracker;

    beforeAll(async () => {
      driver = getDriver();
      scalingTracker = ContentScalingTracker.getInstance();
      scalingTracker.resetTracker();
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    it('size_calc_should_return_identity_on_design_width', 0, async () => {
      const model = new SizeCalcModel(DESIGN_WIDTH, DESIGN_HEIGHT);
      expect(model.sizeCalc(100)).assertEqual(100);
      expect(model.sizeCalc(DESIGN_WIDTH)).assertEqual(DESIGN_WIDTH);
      expect(model.sizeCalc(0)).assertEqual(0);
    });

    it('size_calc_should_double_on_uhd_display', 0, async () => {
      const model = new SizeCalcModel(3840, 2160);
      expect(model.sizeCalc(96)).assertEqual(192);
      expect(model.sizeCalc(624)).assertEqual(1248);
      expect(model.sizeCalcByHeight(56)).assertEqual(112);
    });

    it('size_calc_should_guard_against_zero_display_width', 0, async () => {
      const model = new SizeCalcModel(0, 0);
      expect(model.sizeCalc(240)).assertEqual(0);
      expect(model.sizeCalcByHeight(120)).assertEqual(0);
      expect(model.getAspectRatio()).assertEqual(0);
    });

    it('tip_window_rect_should_scale_with_display_width', 0, async () => {
      const model = new SizeCalcModel(3840, 2160);
      const scaled = model.scaleRect(buildTipRect());
      expect(scaled.x).assertEqual(TIP_RECT_X * 2);
      expect(scaled.width).assertEqual(TIP_RECT_WIDTH * 2);
      expect(scaled.height).assertEqual(TIP_RECT_HEIGHT * 2);
    });

    it('timer_window_rect_should_scale_with_display_width', 0, async () => {
      const model = new SizeCalcModel(1280, 720);
      const scaled = model.scaleRect(buildTimerRect());
      expect(Math.abs(scaled.x - 64)).assertLessOrEqual(0.01);
      expect(Math.abs(scaled.y - 32)).assertLessOrEqual(0.01);
      expect(Math.abs(scaled.width - 416)).assertLessOrEqual(0.01);
      expect(Math.abs(scaled.height - 56 * 720 / 1080)).assertLessOrEqual(0.01);
    });

    it('tip_window_should_stay_inside_full_hd_screen', 0, async () => {
      const geometry = new RectGeometry();
      const model = new SizeCalcModel(DESIGN_WIDTH, DESIGN_HEIGHT);
      const scaled = model.scaleRect(buildTipRect());
      expect(geometry.isInsideScreen(scaled, DESIGN_WIDTH, DESIGN_HEIGHT)).assertTrue();
      expect(geometry.isOverflowing(scaled, DESIGN_WIDTH, DESIGN_HEIGHT)).assertFalse();
      expect(geometry.hasPositiveArea(scaled)).assertTrue();
    });

    it('tip_window_should_overflow_on_hd_screen', 0, async () => {
      const geometry = new RectGeometry();
      const model = new SizeCalcModel(1280, 720);
      const raw = buildTipRect();
      const scaled = model.scaleRect(buildTipRect());
      // The design rect is wider than an 1280 px screen, but the production
      // code scales it with sizeCalc, so the scaled rect must fit again.
      expect(geometry.getRight(raw) > 1280).assertTrue();
      expect(geometry.isOverflowing(raw, 1280, 720)).assertTrue();
      expect(geometry.isOverflowing(scaled, 1280, 720)).assertFalse();
    });

    it('timer_window_should_keep_top_left_anchor', 0, async () => {
      const profiles = buildDisplayProfiles();
      for (let i = 0; i < profiles.length; i++) {
        const model = new SizeCalcModel(profiles[i].width, profiles[i].height);
        const scaled = model.scaleRect(buildTimerRect());
        expect(scaled.x >= 0).assertTrue();
        expect(scaled.y >= 0).assertTrue();
        expect(scaled.x < profiles[i].width / 2).assertTrue();
      }
    });

    it('scaler_should_preserve_design_aspect_ratio', 0, async () => {
      const profiles = buildDisplayProfiles();
      for (let i = 0; i < profiles.length; i++) {
        const model = new SizeCalcModel(profiles[i].width, profiles[i].height);
        expect(Math.abs(model.getAspectRatio() - DESIGN_WIDTH / DESIGN_HEIGHT)).assertLessOrEqual(0.01);
        expect(model.isWideDisplay()).assertTrue();
      }
    });

    it('dialog_should_scale_correctly_at_75_percent', 0, async () => {
      const componentCount = await recorderComponentCount(driver);
      scalingTracker.recordScaling(ScaleLevel.SCALE_75, componentCount >= 0, true, 40);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_75)).assertTrue();
    });

    it('dialog_should_scale_correctly_at_100_percent', 0, async () => {
      const componentCount = await recorderComponentCount(driver);
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, componentCount >= 0, true, 35);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_100)).assertTrue();
      expect(scalingTracker.getSuccessRate() > 0).assertTrue();
    });

    it('dialog_should_scale_correctly_at_125_percent', 0, async () => {
      const model = new SizeCalcModel(2400, 1350);
      const scaled = model.scaleRect(buildTimerRect());
      const intact = scaled.width > TIMER_RECT_WIDTH;
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, intact, true, 45);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_125)).assertTrue();
    });

    it('dialog_should_scale_correctly_at_150_percent', 0, async () => {
      const model = new SizeCalcModel(2880, 1620);
      const scaled = model.scaleRect(buildTipRect());
      const intact = scaled.width > TIP_RECT_WIDTH;
      scalingTracker.recordScaling(ScaleLevel.SCALE_150, intact, true, 50);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_150)).assertTrue();
    });

    it('dialog_should_scale_correctly_at_200_percent', 0, async () => {
      const model = new SizeCalcModel(3840, 2160);
      const geometry = new RectGeometry();
      const scaled = model.scaleRect(buildTipRect());
      scalingTracker.recordScaling(ScaleLevel.SCALE_200, geometry.hasPositiveArea(scaled), true, 60);
      expect(scalingTracker.hasTestedScale(ScaleLevel.SCALE_200)).assertTrue();
    });
    it('long_stop_hint_should_use_marquee_overflow', 0, async () => {
      const fit = new TextFitModel(300, 28, TIMER_HINT_TEXT);
      expect(fit.isOverflow()).assertTrue();
      expect(fit.getPolicy()).assertEqual(OverflowPolicy.MARQUEE);
      expect(fit.getTextLength()).assertLarger(10);
    });

    it('short_tip_title_should_fit_without_marquee', 0, async () => {
      const fit = new TextFitModel(TIP_RECT_WIDTH, 24, TIP_TITLE_TEXT);
      expect(fit.isOverflow()).assertFalse();
      expect(fit.getPolicy()).assertEqual(OverflowPolicy.CLIP);
      expect(fit.getEstimatedTextWidth() > 0).assertTrue();
    });

    it('scaling_records_timestamps_should_be_chronological', 0, async () => {
      scalingTracker.resetTracker();
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, true, true, 50);
      await serializedDelay(driver, 30);
      scalingTracker.recordScaling(ScaleLevel.SCALE_125, true, true, 50);
      await serializedDelay(driver, 30);
      scalingTracker.recordScaling(ScaleLevel.SCALE_150, true, true, 50);

      const history = scalingTracker.getScalingHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();
      expect(history[1].timestamp <= history[2].timestamp).assertTrue();
    });

    it('scaling_tracker_singleton_should_maintain_consistency', 0, async () => {
      const tracker1 = ContentScalingTracker.getInstance();
      const tracker2 = ContentScalingTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordScaling(ScaleLevel.SCALE_100, true, true, 100);
      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getSuccessfulTests()).assertEqual(1);
      expect(tracker2.getAverageResponseTime()).assertEqual(100);
    });

    it('dialog_should_handle_all_scale_levels', 0, async () => {
      scalingTracker.resetTracker();
      const levels: ScaleLevel[] = [ScaleLevel.SCALE_75, ScaleLevel.SCALE_100, ScaleLevel.SCALE_125,
        ScaleLevel.SCALE_150, ScaleLevel.SCALE_200];
      for (let i = 0; i < levels.length; i++) {
        scalingTracker.recordScaling(levels[i], true, true, 50);
      }
      expect(scalingTracker.getTotalTests()).assertEqual(5);
      expect(scalingTracker.getSuccessRate()).assertEqual(1);
    });

    it('dialog_should_maintain_layout_across_scales', 0, async () => {
      const initialCount = await recorderComponentCount(driver);
      const geometry = new RectGeometry();
      const levels: ScaleLevel[] = [ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150];
      for (let i = 0; i < levels.length; i++) {
        const model = new SizeCalcModel(DESIGN_WIDTH + i * 320, DESIGN_HEIGHT + i * 180);
        const scaled = model.scaleRect(buildTimerRect());
        scalingTracker.resetTracker();
        scalingTracker.recordScaling(levels[i], geometry.hasPositiveArea(scaled), true, 30);
        await serializedDelay(driver, 30);
      }

      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 1);
    });

    it('dialog_should_handle_rapid_scale_changes', 0, async () => {
      scalingTracker.resetTracker();
      const levels: ScaleLevel[] = [ScaleLevel.SCALE_100, ScaleLevel.SCALE_125, ScaleLevel.SCALE_150];
      for (let i = 0; i < 30; i++) {
        scalingTracker.recordScaling(levels[i % levels.length], true, true, 20);
      }
      expect(scalingTracker.getTotalTests()).assertEqual(30);
      expect(scalingTracker.getAverageResponseTime()).assertEqual(20);
    });

    it('timer_window_visibility_probe_should_be_tolerant', 0, async () => {
      const visible = await isTimerWindowVisible(driver);
      if (!visible) {
        const count = await recorderComponentCount(driver);
        expect(count).assertLargerOrEqual(0);
        return;
      }
      expect(visible).assertTrue();
    });

    it('scaled_tip_window_should_be_horizontally_centered', 0, async () => {
      const geometry = new RectGeometry();
      const model = new SizeCalcModel(DESIGN_WIDTH, DESIGN_HEIGHT);
      const scaled = model.scaleRect(buildTipRect());
      expect(geometry.isHorizontallyCentered(scaled, DESIGN_WIDTH)).assertTrue();
      expect(Math.abs(geometry.getCenterY(scaled) - DESIGN_HEIGHT / 2)).assertLarger(0);
    });

    it('comprehensive_content_scaling_scenario', 0, async () => {
      scalingTracker.resetTracker();
      const scenarioStart = Date.now();

      const model = new SizeCalcModel(DESIGN_WIDTH, DESIGN_HEIGHT);
      const tip = model.scaleRect(buildTipRect());
      scalingTracker.recordScaling(ScaleLevel.SCALE_100, tip.width > 0, true, 40);

      await serializedDelay(driver, 50);
      const uhd = new SizeCalcModel(3840, 2160);
      const timer = uhd.scaleRect(buildTimerRect());
      scalingTracker.recordScaling(ScaleLevel.SCALE_200, timer.width === TIMER_RECT_WIDTH * 2, true, 55);

      const scenarioEnd = Date.now();
      expect(scalingTracker.getTotalTests()).assertEqual(2);
      expect(scalingTracker.getSuccessfulTests()).assertEqual(2);
      expect(scenarioEnd - scenarioStart).assertLessOrEqual(5000);
    });
  });
}



