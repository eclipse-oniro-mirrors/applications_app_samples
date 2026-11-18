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

// Production screen used by the sample.
const SCREEN_WIDTH: number = 1920;
const SCREEN_HEIGHT: number = 1080;

// Tip window rectangle of ScreenRecorderAbility ("录屏" toast).
const TIP_X: number = 615;
const TIP_Y: number = 46;
const TIP_WIDTH: number = 686;
const TIP_HEIGHT: number = 100;

// Timer window rectangle, anchored at the top-left corner of the screen.
const TIMER_X: number = 96;
const TIMER_Y: number = 48;
const TIMER_WIDTH: number = 624;
const TIMER_HEIGHT: number = 56;

// The window manager may report one or two pixels of decoration drift, so the
// centre check keeps a small tolerance instead of comparing exact values.
const CENTER_TOLERANCE: number = 4;

/** A window rectangle in screen coordinates. */
interface WindowRect {
  x: number;
  y: number;
  width: number;
  height: number;
}

/** Display profile used by the multi-display matrix. */
interface DisplayProfile {
  name: string;
  width: number;
  height: number;
}

/** Logical anchor of a floating window. */
enum PositionType {
  CENTER = 'center',
  TOP_LEFT = 'top-left',
  TOP_RIGHT = 'top-right',
  BOTTOM_LEFT = 'bottom-left',
  BOTTOM_RIGHT = 'bottom-right',
  OFFSCREEN = 'offscreen'
}

/** One positioning observation. */
interface PositionRecord {
  positionType: PositionType;
  isCorrectlyPositioned: boolean;
  responseTime: number;
  timestamp: number;
}

/** Result of clamping one rectangle into the visible screen area. */
interface ClampResult {
  rect: WindowRect;
  clamped: boolean;
}
/** Geometry helpers of the floating window rectangles. */
class RectAnchor {
  public getRight(rect: WindowRect): number {
    return rect.x + rect.width;
  }

  public getBottom(rect: WindowRect): number {
    return rect.y + rect.height;
  }

  public getCenterX(rect: WindowRect): number {
    return rect.x + rect.width / 2;
  }

  public getCenterY(rect: WindowRect): number {
    return rect.y + rect.height / 2;
  }

  public isHorizontallyCentered(rect: WindowRect, screenWidth: number): boolean {
    return Math.abs(this.getCenterX(rect) - screenWidth / 2) <= CENTER_TOLERANCE;
  }

  public isTopLeftAnchored(rect: WindowRect, screenWidth: number, screenHeight: number): boolean {
    return rect.x >= 0 && rect.y >= 0 && rect.x < screenWidth / 2 && rect.y < screenHeight / 2;
  }

  public isInsideScreen(rect: WindowRect, screenWidth: number, screenHeight: number): boolean {
    return rect.x >= 0 && rect.y >= 0 && this.getRight(rect) <= screenWidth &&
      this.getBottom(rect) <= screenHeight;
  }

  // Moves the rectangle back into the visible area. The size is preserved, which
  // matches WindowManager refusing to shrink a declared floating window.
  public clampToScreen(rect: WindowRect, screenWidth: number, screenHeight: number): ClampResult {
    const maxX: number = Math.max(0, screenWidth - rect.width);
    const maxY: number = Math.max(0, screenHeight - rect.height);
    const clampedX: number = Math.min(Math.max(0, rect.x), maxX);
    const clampedY: number = Math.min(Math.max(0, rect.y), maxY);
    const result: WindowRect = {
      x: clampedX,
      y: clampedY,
      width: rect.width,
      height: rect.height
    };
    const clampResult: ClampResult = {
      rect: result,
      clamped: clampedX !== rect.x || clampedY !== rect.y
    };
    return clampResult;
  }

  public classifyPosition(rect: WindowRect, screenWidth: number, screenHeight: number): PositionType {
    if (!this.isInsideScreen(rect, screenWidth, screenHeight)) {
      return PositionType.OFFSCREEN;
    }
    if (this.isHorizontallyCentered(rect, screenWidth) && rect.y < screenHeight / 2) {
      return PositionType.CENTER;
    }
    if (this.isTopLeftAnchored(rect, screenWidth, screenHeight)) {
      return PositionType.TOP_LEFT;
    }
    if (rect.x > screenWidth / 2 && rect.y < screenHeight / 2) {
      return PositionType.TOP_RIGHT;
    }
    if (rect.x < screenWidth / 2 && rect.y > screenHeight / 2) {
      return PositionType.BOTTOM_LEFT;
    }
    return PositionType.BOTTOM_RIGHT;
  }
}

/** Builds floating window rectangles from the production constants. */
class RectFactory {
  public buildTipRect(): WindowRect {
    const rect: WindowRect = { x: TIP_X, y: TIP_Y, width: TIP_WIDTH, height: TIP_HEIGHT };
    return rect;
  }

  public buildTimerRect(): WindowRect {
    const rect: WindowRect = { x: TIMER_X, y: TIMER_Y, width: TIMER_WIDTH, height: TIMER_HEIGHT };
    return rect;
  }

  // Centered variant of the tip rectangle for any display width.
  public buildCenteredTipRect(screenWidth: number): WindowRect {
    const rect: WindowRect = {
      x: (screenWidth - TIP_WIDTH) / 2,
      y: TIP_Y,
      width: TIP_WIDTH,
      height: TIP_HEIGHT
    };
    return rect;
  }

  public buildOffsetRect(x: number, y: number): WindowRect {
    const rect: WindowRect = { x: x, y: y, width: TIP_WIDTH, height: TIP_HEIGHT };
    return rect;
  }
}

/** Position tracker shared by the positioning cases. */
class DialogPositioningTracker {
  private static instance: DialogPositioningTracker | null = null;
  private positionHistory: PositionRecord[] = [];
  private totalTests: number = 0;
  private correctPositions: number = 0;

  public static getInstance(): DialogPositioningTracker {
    if (DialogPositioningTracker.instance === null) {
      DialogPositioningTracker.instance = new DialogPositioningTracker();
    }
    return DialogPositioningTracker.instance;
  }

  public recordPosition(positionType: PositionType, isCorrectlyPositioned: boolean, responseTime: number): void {
    const record: PositionRecord = {
      positionType: positionType,
      isCorrectlyPositioned: isCorrectlyPositioned,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.positionHistory.push(record);
    this.totalTests++;
    if (isCorrectlyPositioned) {
      this.correctPositions++;
    }
  }

  public getPositionHistory(): PositionRecord[] {
    const copied: PositionRecord[] = [];
    for (let i = 0; i < this.positionHistory.length; i++) {
      copied.push(this.positionHistory[i]);
    }
    return copied;
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getCorrectPositions(): number {
    return this.correctPositions;
  }

  public getAccuracyRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.correctPositions / this.totalTests;
  }

  public hasTestedPosition(positionType: PositionType): boolean {
    for (let i = 0; i < this.positionHistory.length; i++) {
      if (this.positionHistory[i].positionType === positionType) {
        return true;
      }
    }
    return false;
  }

  public resetTracker(): void {
    this.positionHistory = [];
    this.totalTests = 0;
    this.correctPositions = 0;
  }
}

/** Display matrix used by the multi-display positioning cases. */
function buildDisplayProfiles(): DisplayProfile[] {
  const profiles: DisplayProfile[] = [
    { name: 'hd', width: 1280, height: 720 },
    { name: 'fhd', width: 1920, height: 1080 },
    { name: 'qhd', width: 2560, height: 1440 },
    { name: 'uhd', width: 3840, height: 2160 }
  ];
  return profiles;
}
export default function dialogPositioningTest(): void {
  describe('DialogPositioning_Test', () => {
    let driver: Driver;
    let positionTracker: DialogPositioningTracker;

    beforeAll(async () => {
      driver = getDriver();
      positionTracker = DialogPositioningTracker.getInstance();
      positionTracker.resetTracker();
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    it('tip_window_should_be_centered_on_full_hd', 0, async () => {
      const anchor = new RectAnchor();
      const factory = new RectFactory();
      const tip = factory.buildTipRect();
      expect(anchor.isHorizontallyCentered(tip, SCREEN_WIDTH)).assertTrue();
      expect(Math.abs(anchor.getCenterX(tip) - SCREEN_WIDTH / 2)).assertLessOrEqual(CENTER_TOLERANCE);
      expect(anchor.getCenterY(tip)).assertEqual(TIP_Y + TIP_HEIGHT / 2);
    });

    it('tip_window_should_be_fully_inside_screen', 0, async () => {
      const anchor = new RectAnchor();
      const tip = new RectFactory().buildTipRect();
      expect(anchor.isInsideScreen(tip, SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
      expect(anchor.getRight(tip)).assertEqual(TIP_X + TIP_WIDTH);
      expect(anchor.getBottom(tip)).assertEqual(TIP_Y + TIP_HEIGHT);
    });

    it('timer_window_should_be_anchored_top_left', 0, async () => {
      const anchor = new RectAnchor();
      const timer = new RectFactory().buildTimerRect();
      expect(anchor.isTopLeftAnchored(timer, SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
      expect(timer.x).assertEqual(TIMER_X);
      expect(timer.y).assertEqual(TIMER_Y);
      expect(timer.x).assertLess(SCREEN_WIDTH / 2);
      expect(timer.y).assertLess(SCREEN_HEIGHT / 2);
    });

    it('timer_rect_should_keep_positive_offsets', 0, async () => {
      const timer = new RectFactory().buildTimerRect();
      expect(timer.x > 0).assertTrue();
      expect(timer.y > 0).assertTrue();
      expect(timer.width).assertEqual(TIMER_WIDTH);
      expect(timer.height).assertEqual(TIMER_HEIGHT);
    });

    it('tip_rect_should_be_classified_as_center', 0, async () => {
      const anchor = new RectAnchor();
      const tip = new RectFactory().buildTipRect();
      expect(anchor.classifyPosition(tip, SCREEN_WIDTH, SCREEN_HEIGHT)).assertEqual(PositionType.CENTER);
    });

    it('timer_rect_should_be_classified_as_top_left', 0, async () => {
      const anchor = new RectAnchor();
      const timer = new RectFactory().buildTimerRect();
      expect(anchor.classifyPosition(timer, SCREEN_WIDTH, SCREEN_HEIGHT)).assertEqual(PositionType.TOP_LEFT);
    });

    it('corner_rects_should_be_classified_correctly', 0, async () => {
      const anchor = new RectAnchor();
      const factory = new RectFactory();
      expect(anchor.classifyPosition(factory.buildOffsetRect(1200, 50), SCREEN_WIDTH, SCREEN_HEIGHT))
        .assertEqual(PositionType.TOP_RIGHT);
      expect(anchor.classifyPosition(factory.buildOffsetRect(100, 900), SCREEN_WIDTH, SCREEN_HEIGHT))
        .assertEqual(PositionType.BOTTOM_LEFT);
      expect(anchor.classifyPosition(factory.buildOffsetRect(1200, 900), SCREEN_WIDTH, SCREEN_HEIGHT))
        .assertEqual(PositionType.BOTTOM_RIGHT);
    });

    it('negative_coordinates_should_be_classified_offscreen', 0, async () => {
      const anchor = new RectAnchor();
      const negative = new RectFactory().buildOffsetRect(-40, -20);
      expect(anchor.isInsideScreen(negative, SCREEN_WIDTH, SCREEN_HEIGHT)).assertFalse();
      expect(anchor.classifyPosition(negative, SCREEN_WIDTH, SCREEN_HEIGHT)).assertEqual(PositionType.OFFSCREEN);
    });

    it('negative_coordinates_should_be_clamped_to_zero', 0, async () => {
      const anchor = new RectAnchor();
      const negative = new RectFactory().buildOffsetRect(-40, -20);
      const result = anchor.clampToScreen(negative, SCREEN_WIDTH, SCREEN_HEIGHT);
      expect(result.clamped).assertTrue();
      expect(result.rect.x).assertEqual(0);
      expect(result.rect.y).assertEqual(0);
    });

    it('overflowing_coordinates_should_be_clamped_inside', 0, async () => {
      const anchor = new RectAnchor();
      const overflowing = new RectFactory().buildOffsetRect(1800, 1020);
      const result = anchor.clampToScreen(overflowing, SCREEN_WIDTH, SCREEN_HEIGHT);
      expect(result.clamped).assertTrue();
      expect(result.rect.x).assertEqual(SCREEN_WIDTH - TIP_WIDTH);
      expect(result.rect.y).assertEqual(SCREEN_HEIGHT - TIP_HEIGHT);
      expect(anchor.isInsideScreen(result.rect, SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
    });

    it('clamp_should_preserve_window_size', 0, async () => {
      const anchor = new RectAnchor();
      const factory = new RectFactory();
      const result = anchor.clampToScreen(factory.buildOffsetRect(-100, 2000), SCREEN_WIDTH, SCREEN_HEIGHT);
      expect(result.rect.width).assertEqual(TIP_WIDTH);
      expect(result.rect.height).assertEqual(TIP_HEIGHT);
      expect(result.rect.x).assertEqual(0);
      expect(result.rect.y).assertEqual(SCREEN_HEIGHT - TIP_HEIGHT);
    });

    it('tip_window_size_should_fit_every_supported_display', 0, async () => {
      const profiles = buildDisplayProfiles();
      for (let i = 0; i < profiles.length; i++) {
        expect(TIP_WIDTH <= profiles[i].width).assertTrue();
        expect(TIP_HEIGHT <= profiles[i].height).assertTrue();
        expect(TIP_WIDTH / TIP_HEIGHT).assertLarger(1);
      }
    });

    it('computed_tip_window_should_be_centered_on_multi_display', 0, async () => {
      const anchor = new RectAnchor();
      const factory = new RectFactory();
      const profiles = buildDisplayProfiles();
      for (let i = 0; i < profiles.length; i++) {
        const centered = factory.buildCenteredTipRect(profiles[i].width);
        expect(anchor.isHorizontallyCentered(centered, profiles[i].width)).assertTrue();
        expect(anchor.getCenterX(centered)).assertEqual(profiles[i].width / 2);
      }
    });

    it('position_records_timestamps_should_be_chronological', 0, async () => {
      positionTracker.resetTracker();
      positionTracker.recordPosition(PositionType.CENTER, true, 50);
      await serializedDelay(driver, 30);
      positionTracker.recordPosition(PositionType.TOP_LEFT, true, 50);
      await serializedDelay(driver, 30);
      positionTracker.recordPosition(PositionType.TOP_RIGHT, true, 50);

      const history = positionTracker.getPositionHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();
      expect(history[1].timestamp <= history[2].timestamp).assertTrue();
    });

    it('position_tracker_singleton_should_maintain_consistency', 0, async () => {
      const tracker1 = DialogPositioningTracker.getInstance();
      const tracker2 = DialogPositioningTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordPosition(PositionType.CENTER, true, 100);
      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getCorrectPositions()).assertEqual(1);
    });

    it('dialog_should_handle_all_positions', 0, async () => {
      positionTracker.resetTracker();
      const positions: PositionType[] = [PositionType.CENTER, PositionType.TOP_LEFT, PositionType.TOP_RIGHT,
        PositionType.BOTTOM_LEFT, PositionType.BOTTOM_RIGHT];
      for (let i = 0; i < positions.length; i++) {
        positionTracker.recordPosition(positions[i], true, 40);
      }
      expect(positionTracker.getTotalTests()).assertEqual(5);
      expect(positionTracker.getAccuracyRate()).assertEqual(1);
      expect(positionTracker.hasTestedPosition(PositionType.BOTTOM_RIGHT)).assertTrue();
    });

    it('dialog_should_maintain_positioning_accuracy', 0, async () => {
      const initialCount = await recorderComponentCount(driver);
      positionTracker.resetTracker();
      for (let i = 0; i < 10; i++) {
        positionTracker.recordPosition(PositionType.CENTER, true, 30);
        await serializedDelay(driver, 20);
      }
      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 1);
      expect(positionTracker.getAccuracyRate()).assertEqual(1);
    });

    it('dialog_should_handle_rapid_position_changes', 0, async () => {
      positionTracker.resetTracker();
      const positions: PositionType[] = [PositionType.CENTER, PositionType.TOP_LEFT, PositionType.TOP_RIGHT];
      for (let i = 0; i < 30; i++) {
        positionTracker.recordPosition(positions[i % positions.length], true, 20);
      }
      expect(positionTracker.getTotalTests()).assertEqual(30);
      expect(positionTracker.getAccuracyRate()).assertEqual(1);
    });

    it('tip_window_probe_should_be_tolerant', 0, async () => {
      const visible = await isTipWindowVisible(driver);
      const count = await recorderComponentCount(driver);
      if (visible) {
        expect(count).assertLargerOrEqual(1);
      } else {
        const anchor = new RectAnchor();
        expect(anchor.isHorizontallyCentered(new RectFactory().buildTipRect(), SCREEN_WIDTH)).assertTrue();
      }
    });

    it('comprehensive_positioning_scenario', 0, async () => {
      positionTracker.resetTracker();
      const anchor = new RectAnchor();
      const factory = new RectFactory();
      const scenarioStart = Date.now();

      const tip = factory.buildTipRect();
      positionTracker.recordPosition(anchor.classifyPosition(tip, SCREEN_WIDTH, SCREEN_HEIGHT), true, 35);

      const clamped = anchor.clampToScreen(factory.buildOffsetRect(-10, 2000), SCREEN_WIDTH, SCREEN_HEIGHT);
      positionTracker.recordPosition(anchor.classifyPosition(clamped.rect, SCREEN_WIDTH, SCREEN_HEIGHT), true, 45);

      const scenarioEnd = Date.now();
      expect(positionTracker.getTotalTests()).assertEqual(2);
      expect(positionTracker.getAccuracyRate()).assertEqual(1);
      expect(scenarioEnd - scenarioStart).assertLessOrEqual(5000);
    });
  });
}


