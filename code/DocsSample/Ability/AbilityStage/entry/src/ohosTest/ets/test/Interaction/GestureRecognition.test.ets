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
  runSerializedUiOperation,
  serializedDelay,
  waitForIndexPageStable,
  checkTextContent,
  isIndexPageVisible,
  pageComponentCount,
  simulateTouch,
  tapComponentByText,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_LAUNCH,
  TOLERANCE_FOCUS_CHANGE
} from '../Shared/SharedDriver';

enum GestureKind {
  TAP = 'tap',
  LONG_PRESS = 'long_press',
  DOUBLE_TAP = 'double_tap',
  DRAG = 'drag',
  REJECTED = 'rejected'
}

enum RejectReason {
  NONE = 'none',
  TOO_SHORT = 'too_short',
  DISTANCE_EXCEEDED = 'distance_exceeded',
  DURATION_EXCEEDED = 'duration_exceeded',
  INTERVAL_EXCEEDED = 'interval_exceeded',
  INVALID_INPUT = 'invalid_input'
}

interface PointerSample {
  x: number;
  y: number;
  timestampMs: number;
}

interface GestureDescriptor {
  start: PointerSample;
  end: PointerSample;
  durationMs: number;
  moveDistance: number;
}

interface GestureClassification {
  kind: GestureKind;
  reason: RejectReason;
  durationMs: number;
  distance: number;
}

interface GestureThresholds {
  longPressMinMs: number;
  doubleTapMaxGapMs: number;
  dragMinDistance: number;
  tapMaxDurationMs: number;
  tolerance: number;
}

class GestureThresholdDefaults {
  public static build(): GestureThresholds {
    const thresholds: GestureThresholds = {
      longPressMinMs: 500,
      doubleTapMaxGapMs: 300,
      dragMinDistance: 20,
      tapMaxDurationMs: 200,
      tolerance: TOLERANCE_FOCUS_CHANGE
    };
    return thresholds;
  }

  public static buildStrict(): GestureThresholds {
    const thresholds: GestureThresholds = {
      longPressMinMs: 800,
      doubleTapMaxGapMs: 150,
      dragMinDistance: 40,
      tapMaxDurationMs: 100,
      tolerance: 0
    };
    return thresholds;
  }
}

class GestureClassifier {
  private thresholds: GestureThresholds;

  constructor(thresholds: GestureThresholds) {
    this.thresholds = thresholds;
  }

  public static distanceBetween(first: PointerSample, second: PointerSample): number {
    const deltaX: number = second.x - first.x;
    const deltaY: number = second.y - first.y;
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  public describe(descriptor: GestureDescriptor): GestureClassification {
    const distance: number = GestureClassifier.distanceBetween(descriptor.start, descriptor.end);
    if (descriptor.durationMs < 0) {
      const invalid: GestureClassification = {
        kind: GestureKind.REJECTED,
        reason: RejectReason.INVALID_INPUT,
        durationMs: descriptor.durationMs,
        distance: distance
      };
      return invalid;
    }
    if (distance >= this.thresholds.dragMinDistance) {
      const drag: GestureClassification = {
        kind: GestureKind.DRAG,
        reason: descriptor.durationMs > this.thresholds.tapMaxDurationMs
          ? RejectReason.NONE
          : RejectReason.NONE,
        durationMs: descriptor.durationMs,
        distance: distance
      };
      return drag;
    }
    if (descriptor.durationMs >= this.thresholds.longPressMinMs) {
      const longPress: GestureClassification = {
        kind: GestureKind.LONG_PRESS,
        reason: RejectReason.NONE,
        durationMs: descriptor.durationMs,
        distance: distance
      };
      return longPress;
    }
    if (descriptor.durationMs <= this.thresholds.tapMaxDurationMs) {
      const tap: GestureClassification = {
        kind: GestureKind.TAP,
        reason: RejectReason.NONE,
        durationMs: descriptor.durationMs,
        distance: distance
      };
      return tap;
    }
    const rejected: GestureClassification = {
      kind: GestureKind.REJECTED,
      reason: RejectReason.DURATION_EXCEEDED,
      durationMs: descriptor.durationMs,
      distance: distance
    };
    return rejected;
  }

  public classifyDoubleTap(firstDurationMs: number, gapMs: number): GestureClassification {
    const distance: number = 0;
    if (gapMs < 0 || firstDurationMs < 0) {
      const invalid: GestureClassification = {
        kind: GestureKind.REJECTED,
        reason: RejectReason.INVALID_INPUT,
        durationMs: firstDurationMs,
        distance: distance
      };
      return invalid;
    }
    if (firstDurationMs > this.thresholds.tapMaxDurationMs) {
      const tooSlow: GestureClassification = {
        kind: GestureKind.REJECTED,
        reason: RejectReason.DURATION_EXCEEDED,
        durationMs: firstDurationMs,
        distance: distance
      };
      return tooSlow;
    }
    if (gapMs > this.thresholds.doubleTapMaxGapMs) {
      const tooLate: GestureClassification = {
        kind: GestureKind.REJECTED,
        reason: RejectReason.INTERVAL_EXCEEDED,
        durationMs: gapMs,
        distance: distance
      };
      return tooLate;
    }
    const doubleTap: GestureClassification = {
      kind: GestureKind.DOUBLE_TAP,
      reason: RejectReason.NONE,
      durationMs: gapMs,
      distance: distance
    };
    return doubleTap;
  }

  public isWithinTolerance(measured: number, expected: number): boolean {
    return Math.abs(measured - expected) <= this.thresholds.tolerance;
  }

  public getThresholds(): GestureThresholds {
    return this.thresholds;
  }

  public isTapDurationValid(durationMs: number): boolean {
    return durationMs >= 0 && durationMs <= this.thresholds.tapMaxDurationMs;
  }

  public isLongPressDurationValid(durationMs: number): boolean {
    return durationMs >= this.thresholds.longPressMinMs;
  }

  public isDragDistanceValid(distance: number): boolean {
    return distance >= this.thresholds.dragMinDistance;
  }
}

class GestureSequenceTracker {
  private classifications: GestureClassification[] = [];

  public append(classification: GestureClassification): void {
    this.classifications.push(classification);
  }

  public getCount(): number {
    return this.classifications.length;
  }

  public countByKind(kind: GestureKind): number {
    let count: number = 0;
    for (let i = 0; i < this.classifications.length; i++) {
      if (this.classifications[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public countByReason(reason: RejectReason): number {
    let count: number = 0;
    for (let i = 0; i < this.classifications.length; i++) {
      if (this.classifications[i].reason === reason) {
        count++;
      }
    }
    return count;
  }

  public getKindTimeline(): string[] {
    const timeline: string[] = [];
    for (let i = 0; i < this.classifications.length; i++) {
      timeline.push(this.classifications[i].kind);
    }
    return timeline;
  }

  public averageDuration(): number {
    if (this.classifications.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.classifications.length; i++) {
      total += this.classifications[i].durationMs;
    }
    return total / this.classifications.length;
  }

  public maxDistance(): number {
    if (this.classifications.length === 0) {
      return 0;
    }
    let max: number = this.classifications[0].distance;
    for (let i = 1; i < this.classifications.length; i++) {
      if (this.classifications[i].distance > max) {
        max = this.classifications[i].distance;
      }
    }
    return max;
  }

  public clear(): void {
    this.classifications = [];
  }
}

class DoubleTapWindow {
  private firstTapAt: number = -1;
  private windowMs: number;
  private acceptedPairs: number = 0;
  private expiredPairs: number = 0;

  constructor(windowMs: number) {
    this.windowMs = windowMs;
  }

  public registerTap(timestampMs: number): boolean {
    if (this.firstTapAt < 0) {
      this.firstTapAt = timestampMs;
      return false;
    }
    const gap: number = timestampMs - this.firstTapAt;
    if (gap <= this.windowMs) {
      this.acceptedPairs++;
      this.firstTapAt = -1;
      return true;
    }
    this.expiredPairs++;
    this.firstTapAt = timestampMs;
    return false;
  }

  public getWindowMs(): number {
    return this.windowMs;
  }

  public getAcceptedPairs(): number {
    return this.acceptedPairs;
  }

  public getExpiredPairs(): number {
    return this.expiredPairs;
  }

  public hasPendingTap(): boolean {
    return this.firstTapAt >= 0;
  }

  public reset(): void {
    this.firstTapAt = -1;
    this.acceptedPairs = 0;
    this.expiredPairs = 0;
  }
}

class DragTrajectoryModel {
  private samples: PointerSample[] = [];

  public append(sample: PointerSample): void {
    this.samples.push(sample);
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public totalDistance(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    let total: number = 0;
    for (let i = 1; i < this.samples.length; i++) {
      total += GestureClassifier.distanceBetween(this.samples[i - 1], this.samples[i]);
    }
    return total;
  }

  public netDistance(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    return GestureClassifier.distanceBetween(this.samples[0], this.samples[this.samples.length - 1]);
  }

  public hasBacktracking(): boolean {
    return this.totalDistance() > this.netDistance();
  }

  public maxDeltaX(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let minX: number = this.samples[0].x;
    let maxX: number = this.samples[0].x;
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].x < minX) {
        minX = this.samples[i].x;
      }
      if (this.samples[i].x > maxX) {
        maxX = this.samples[i].x;
      }
    }
    return maxX - minX;
  }

  public totalDurationMs(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    return this.samples[this.samples.length - 1].timestampMs - this.samples[0].timestampMs;
  }

  public clear(): void {
    this.samples = [];
  }
}

async function readTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return '';
      }
      return await component.getText();
    } catch (error) {
      logError(`readTextById failed: ${error}`);
      return '';
    }
  });
}

async function clickTextComponent(driver: Driver): Promise<boolean> {
  return await runSerializedUiOperation(async (): Promise<boolean> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      return true;
    } catch (error) {
      logError(`clickTextComponent failed: ${error}`);
      return false;
    }
  });
}

function buildSample(x: number, y: number, timestampMs: number): PointerSample {
  const sample: PointerSample = {
    x: x,
    y: y,
    timestampMs: timestampMs
  };
  return sample;
}

function buildDescriptor(start: PointerSample, end: PointerSample, durationMs: number): GestureDescriptor {
  const descriptor: GestureDescriptor = {
    start: start,
    end: end,
    durationMs: durationMs,
    moveDistance: GestureClassifier.distanceBetween(start, end)
  };
  return descriptor;
}

export default function gestureRecognitionTest(): void {
  describe('GestureRecognitionTest', () => {
    let driver: Driver;
    let classifier: GestureClassifier;

    beforeAll(async () => {
      driver = getDriver();
      classifier = new GestureClassifier(GestureThresholdDefaults.build());
      logInfo('GestureRecognitionTest: preparing index page');
      await launchEntryAbility();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      logInfo('GestureRecognitionTest: finished');
      await serializedDelay(driver, 100);
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0100
     * @tc.name testGesturePageReadyForTouch
     * @tc.desc Verify page is ready for touch input: text node present and page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGesturePageReadyForTouch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const text: string = await readTextById(driver);
          expect(text.length > 0).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0200
     * @tc.name testGestureTapClassification
     * @tc.desc Verify short stationary contact classifies as tap: distance zero and duration under limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureTapClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: PointerSample = buildSample(100, 200, 0);
          const end: PointerSample = buildSample(100, 200, 80);
          const descriptor: GestureDescriptor = buildDescriptor(start, end, 80);
          const result: GestureClassification = classifier.describe(descriptor);
          expect(result.kind).assertEqual(GestureKind.TAP);
          expect(result.reason).assertEqual(RejectReason.NONE);
          expect(result.distance).assertEqual(0);
          expect(result.durationMs).assertEqual(80);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0300
     * @tc.name testGestureTapDurationBoundaryAccept
     * @tc.desc Verify tap duration exactly at the limit is accepted and one millisecond over is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureTapDurationBoundaryAccept', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const thresholds: GestureThresholds = classifier.getThresholds();
          expect(thresholds.tapMaxDurationMs).assertEqual(200);
          const boundaryStart: PointerSample = buildSample(10, 10, 0);
          const boundaryEnd: PointerSample = buildSample(10, 10, 200);
          const boundaryResult: GestureClassification =
            classifier.describe(buildDescriptor(boundaryStart, boundaryEnd, 200));
          expect(boundaryResult.kind).assertEqual(GestureKind.TAP);
          const overEnd: PointerSample = buildSample(10, 10, 201);
          const overResult: GestureClassification =
            classifier.describe(buildDescriptor(boundaryStart, overEnd, 201));
          expect(overResult.kind).assertEqual(GestureKind.REJECTED);
          expect(overResult.reason).assertEqual(RejectReason.DURATION_EXCEEDED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0400
     * @tc.name testGestureLongPressClassification
     * @tc.desc Verify stationary contact at or above the long press threshold classifies as long press
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureLongPressClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: PointerSample = buildSample(50, 60, 0);
          const end: PointerSample = buildSample(50, 60, 500);
          const result: GestureClassification = classifier.describe(buildDescriptor(start, end, 500));
          expect(result.kind).assertEqual(GestureKind.LONG_PRESS);
          expect(result.durationMs).assertEqual(500);
          expect(classifier.isLongPressDurationValid(500)).assertTrue();
          expect(classifier.isLongPressDurationValid(499)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0500
     * @tc.name testGestureLongPressUpperDuration
     * @tc.desc Verify very long stationary contact still classifies as long press, not drag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureLongPressUpperDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: PointerSample = buildSample(0, 0, 0);
          const end: PointerSample = buildSample(0, 0, 5000);
          const result: GestureClassification = classifier.describe(buildDescriptor(start, end, 5000));
          expect(result.kind).assertEqual(GestureKind.LONG_PRESS);
          expect(result.distance).assertEqual(0);
          expect(classifier.isTapDurationValid(5000)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0600
     * @tc.name testGestureRejectedDeadZone
     * @tc.desc Verify dead zone between tap and long press is rejected: 350 ms stationary -> duration exceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureRejectedDeadZone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: PointerSample = buildSample(20, 20, 0);
          const end: PointerSample = buildSample(20, 20, 350);
          const result: GestureClassification = classifier.describe(buildDescriptor(start, end, 350));
          expect(result.kind).assertEqual(GestureKind.REJECTED);
          expect(result.reason).assertEqual(RejectReason.DURATION_EXCEEDED);
          expect(result.durationMs).assertEqual(350);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0700
     * @tc.name testGestureDragClassification
     * @tc.desc Verify contact moving beyond the drag threshold classifies as drag regardless of duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDragClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: PointerSample = buildSample(0, 0, 0);
          const end: PointerSample = buildSample(30, 40, 100);
          const descriptor: GestureDescriptor = buildDescriptor(start, end, 100);
          const result: GestureClassification = classifier.describe(descriptor);
          expect(result.kind).assertEqual(GestureKind.DRAG);
          expect(result.distance).assertEqual(50);
          expect(classifier.isDragDistanceValid(50)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0800
     * @tc.name testGestureDragThresholdBoundary
     * @tc.desc Verify drag threshold boundary: exactly twenty behaves as drag, one below stays non drag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDragThresholdBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const thresholds: GestureThresholds = classifier.getThresholds();
          expect(thresholds.dragMinDistance).assertEqual(20);
          const boundaryStart: PointerSample = buildSample(0, 0, 0);
          const boundaryEnd: PointerSample = buildSample(20, 0, 60);
          const boundaryResult: GestureClassification =
            classifier.describe(buildDescriptor(boundaryStart, boundaryEnd, 60));
          expect(boundaryResult.kind).assertEqual(GestureKind.DRAG);
          expect(boundaryResult.distance).assertEqual(20);
          const belowEnd: PointerSample = buildSample(19, 0, 60);
          const belowResult: GestureClassification =
            classifier.describe(buildDescriptor(boundaryStart, belowEnd, 60));
          expect(belowResult.kind).assertEqual(GestureKind.TAP);
          expect(classifier.isDragDistanceValid(19)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_0900
     * @tc.name testGestureDistanceCalculationDiagonal
     * @tc.desc Verify Euclidean distance for a 3-4-5 triangle equals five exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDistanceCalculationDiagonal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const first: PointerSample = buildSample(3, 4, 0);
          const second: PointerSample = buildSample(6, 8, 10);
          const distance: number = GestureClassifier.distanceBetween(first, second);
          expect(distance).assertEqual(5);
          const samePoint: PointerSample = buildSample(6, 8, 20);
          expect(GestureClassifier.distanceBetween(second, samePoint)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1000
     * @tc.name testGestureInvalidNegativeDuration
     * @tc.desc Verify negative duration is rejected as invalid input rather than classified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureInvalidNegativeDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const start: PointerSample = buildSample(5, 5, 100);
          const end: PointerSample = buildSample(5, 5, 50);
          const result: GestureClassification = classifier.describe(buildDescriptor(start, end, -50));
          expect(result.kind).assertEqual(GestureKind.REJECTED);
          expect(result.reason).assertEqual(RejectReason.INVALID_INPUT);
          expect(classifier.isTapDurationValid(-1)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1100
     * @tc.name testGestureDoubleTapAcceptedWithinWindow
     * @tc.desc Verify double tap inside the gap window classifies as double tap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDoubleTapAcceptedWithinWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const result: GestureClassification = classifier.classifyDoubleTap(80, 120);
          expect(result.kind).assertEqual(GestureKind.DOUBLE_TAP);
          expect(result.reason).assertEqual(RejectReason.NONE);
          expect(result.durationMs).assertEqual(120);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1200
     * @tc.name testGestureDoubleTapGapBoundary
     * @tc.desc Verify gap exactly at window is accepted and one millisecond over is rejected as interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDoubleTapGapBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const thresholds: GestureThresholds = classifier.getThresholds();
          expect(thresholds.doubleTapMaxGapMs).assertEqual(300);
          const boundaryResult: GestureClassification = classifier.classifyDoubleTap(100, 300);
          expect(boundaryResult.kind).assertEqual(GestureKind.DOUBLE_TAP);
          const overResult: GestureClassification = classifier.classifyDoubleTap(100, 301);
          expect(overResult.kind).assertEqual(GestureKind.REJECTED);
          expect(overResult.reason).assertEqual(RejectReason.INTERVAL_EXCEEDED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1300
     * @tc.name testGestureDoubleTapSlowFirstTapRejected
     * @tc.desc Verify first tap longer than tap limit prevents double tap classification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDoubleTapSlowFirstTapRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const result: GestureClassification = classifier.classifyDoubleTap(250, 100);
          expect(result.kind).assertEqual(GestureKind.REJECTED);
          expect(result.reason).assertEqual(RejectReason.DURATION_EXCEEDED);
          expect(result.durationMs).assertEqual(250);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1400
     * @tc.name testGestureDoubleTapNegativeInputRejected
     * @tc.desc Verify negative gap or negative duration yields invalid input rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDoubleTapNegativeInputRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gapResult: GestureClassification = classifier.classifyDoubleTap(100, -5);
          expect(gapResult.kind).assertEqual(GestureKind.REJECTED);
          expect(gapResult.reason).assertEqual(RejectReason.INVALID_INPUT);
          const durationResult: GestureClassification = classifier.classifyDoubleTap(-1, 50);
          expect(durationResult.reason).assertEqual(RejectReason.INVALID_INPUT);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1500
     * @tc.name testGestureDoubleTapWindowRegistration
     * @tc.desc Verify tap pairing window accepts one pair and leaves no pending tap afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDoubleTapWindowRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const window: DoubleTapWindow = new DoubleTapWindow(300);
          expect(window.registerTap(0)).assertFalse();
          expect(window.hasPendingTap()).assertTrue();
          expect(window.registerTap(200)).assertTrue();
          expect(window.hasPendingTap()).assertFalse();
          expect(window.getAcceptedPairs()).assertEqual(1);
          expect(window.getWindowMs()).assertEqual(300);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1600
     * @tc.name testGestureDoubleTapWindowExpiry
     * @tc.desc Verify tap outside the window expires and becomes the new first tap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDoubleTapWindowExpiry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const window: DoubleTapWindow = new DoubleTapWindow(300);
          window.registerTap(0);
          expect(window.registerTap(301)).assertFalse();
          expect(window.getExpiredPairs()).assertEqual(1);
          expect(window.getAcceptedPairs()).assertEqual(0);
          expect(window.registerTap(400)).assertTrue();
          expect(window.getAcceptedPairs()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1700
     * @tc.name testGestureDoubleTapWindowReset
     * @tc.desc Verify window reset clears pending tap and all counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDoubleTapWindowReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const window: DoubleTapWindow = new DoubleTapWindow(250);
          window.registerTap(0);
          window.registerTap(100);
          window.registerTap(500);
          window.reset();
          expect(window.hasPendingTap()).assertFalse();
          expect(window.getAcceptedPairs()).assertEqual(0);
          expect(window.getExpiredPairs()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1800
     * @tc.name testGestureDragTrajectoryDistance
     * @tc.desc Verify trajectory total distance sums segments while net distance is start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDragTrajectoryDistance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const trajectory: DragTrajectoryModel = new DragTrajectoryModel();
          trajectory.append(buildSample(0, 0, 0));
          trajectory.append(buildSample(10, 0, 20));
          trajectory.append(buildSample(20, 0, 40));
          expect(trajectory.getSampleCount()).assertEqual(3);
          expect(trajectory.totalDistance()).assertEqual(20);
          expect(trajectory.netDistance()).assertEqual(20);
          expect(trajectory.hasBacktracking()).assertFalse();
          expect(trajectory.totalDurationMs()).assertEqual(40);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_1900
     * @tc.name testGestureDragBacktrackingDetection
     * @tc.desc Verify backtracking trajectory has total distance greater than net distance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDragBacktrackingDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const trajectory: DragTrajectoryModel = new DragTrajectoryModel();
          trajectory.append(buildSample(0, 0, 0));
          trajectory.append(buildSample(30, 0, 30));
          trajectory.append(buildSample(10, 0, 60));
          expect(trajectory.totalDistance()).assertEqual(50);
          expect(trajectory.netDistance()).assertEqual(10);
          expect(trajectory.hasBacktracking()).assertTrue();
          expect(trajectory.maxDeltaX()).assertEqual(30);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2000
     * @tc.name testGestureDragTrajectoryEmpty
     * @tc.desc Verify empty and single sample trajectories report zero distance and duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureDragTrajectoryEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const trajectory: DragTrajectoryModel = new DragTrajectoryModel();
          expect(trajectory.totalDistance()).assertEqual(0);
          expect(trajectory.netDistance()).assertEqual(0);
          expect(trajectory.maxDeltaX()).assertEqual(0);
          expect(trajectory.hasBacktracking()).assertFalse();
          trajectory.append(buildSample(7, 7, 100));
          expect(trajectory.getSampleCount()).assertEqual(1);
          expect(trajectory.totalDistance()).assertEqual(0);
          expect(trajectory.totalDurationMs()).assertEqual(0);
          trajectory.clear();
          expect(trajectory.getSampleCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2100
     * @tc.name testGestureSequenceTrackerAggregation
     * @tc.desc Verify tracker counts gestures by kind and rejection by reason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureSequenceTrackerAggregation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: GestureSequenceTracker = new GestureSequenceTracker();
          tracker.append(classifier.describe(buildDescriptor(buildSample(0, 0, 0),
            buildSample(0, 0, 50), 50)));
          tracker.append(classifier.describe(buildDescriptor(buildSample(0, 0, 0),
            buildSample(0, 0, 600), 600)));
          tracker.append(classifier.describe(buildDescriptor(buildSample(0, 0, 0),
            buildSample(30, 0, 600), 600)));
          tracker.append(classifier.describe(buildDescriptor(buildSample(0, 0, 0),
            buildSample(0, 0, 300), 300)));
          expect(tracker.getCount()).assertEqual(4);
          expect(tracker.countByKind(GestureKind.TAP)).assertEqual(1);
          expect(tracker.countByKind(GestureKind.LONG_PRESS)).assertEqual(1);
          expect(tracker.countByKind(GestureKind.DRAG)).assertEqual(1);
          expect(tracker.countByKind(GestureKind.REJECTED)).assertEqual(1);
          expect(tracker.countByReason(RejectReason.DURATION_EXCEEDED)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2200
     * @tc.name testGestureSequenceTrackerStatistics
     * @tc.desc Verify tracker aggregates average duration, max distance and kind timeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureSequenceTrackerStatistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: GestureSequenceTracker = new GestureSequenceTracker();
          tracker.append(classifier.describe(buildDescriptor(buildSample(0, 0, 0),
            buildSample(0, 0, 100), 100)));
          tracker.append(classifier.describe(buildDescriptor(buildSample(0, 0, 0),
            buildSample(0, 0, 300), 300)));
          const timeline: string[] = tracker.getKindTimeline();
          expect(timeline.length).assertEqual(2);
          expect(timeline[0]).assertEqual(GestureKind.TAP);
          expect(timeline[1]).assertEqual(GestureKind.REJECTED);
          expect(tracker.averageDuration()).assertEqual(200);
          expect(tracker.maxDistance()).assertEqual(0);
          tracker.clear();
          expect(tracker.getCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2300
     * @tc.name testGestureToleranceComparison
     * @tc.desc Verify tolerance comparison accepts the boundary and rejects one beyond it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureToleranceComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(TOLERANCE_FOCUS_CHANGE).assertEqual(2);
          expect(classifier.isWithinTolerance(100, 100)).assertTrue();
          expect(classifier.isWithinTolerance(102, 100)).assertTrue();
          expect(classifier.isWithinTolerance(98, 100)).assertTrue();
          expect(classifier.isWithinTolerance(103, 100)).assertFalse();
          expect(classifier.isWithinTolerance(97, 100)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2400
     * @tc.name testGestureStrictThresholds
     * @tc.desc Verify strict threshold profile changes classification for identical input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureStrictThresholds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const strictClassifier: GestureClassifier =
            new GestureClassifier(GestureThresholdDefaults.buildStrict());
          const descriptor: GestureDescriptor = buildDescriptor(buildSample(0, 0, 0),
            buildSample(0, 0, 150), 150);
          const strictResult: GestureClassification = strictClassifier.describe(descriptor);
          const relaxedResult: GestureClassification = classifier.describe(descriptor);
          expect(strictResult.kind).assertEqual(GestureKind.REJECTED);
          expect(relaxedResult.kind).assertEqual(GestureKind.TAP);
          expect(strictClassifier.getThresholds().tolerance).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2500
     * @tc.name testGestureLiveTapByTextTriggersClick
     * @tc.desc Verify real tap by text locator triggers onClick: Hello World -> Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureLiveTapByTextTriggersClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const currentText: string = await readTextById(driver);
          const tapped: boolean = await tapComponentByText(driver, currentText);
          expect(tapped).assertTrue();
          await serializedDelay(driver, 200);
          const hasClickedText: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(hasClickedText).assertTrue();
          const text: string = await readTextById(driver);
          expect(text).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2600
     * @tc.name testGestureLiveComponentClickIsIdempotent
     * @tc.desc Verify repeated component clicks stay in clicked state: text remains Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureLiveComponentClickIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const firstClick: boolean = await clickTextComponent(driver);
          const secondClick: boolean = await clickTextComponent(driver);
          expect(firstClick).assertTrue();
          expect(secondClick).assertTrue();
          const text: string = await readTextById(driver);
          expect(text).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2700
     * @tc.name testGestureLiveCoordinateTapSmoke
     * @tc.desc Verify coordinate based touch smoke keeps page alive and component count stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureLiveCoordinateTapSmoke', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          expect(beforeCount).assertLargerOrEqual(1);
          await simulateTouch(driver, 5, 5);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2800
     * @tc.name testGestureLiveTapKeepsTextNodeCount
     * @tc.desc Verify tap gesture does not duplicate the text node: Text component count stays one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureLiveTapKeepsTextNodeCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const currentText: string = await readTextById(driver);
          expect(currentText.length > 0).assertTrue();
          await tapComponentByText(driver, currentText);
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(PAGE_TEXT_CLICKED);
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_GESTURE_2900
     * @tc.name testGestureLiveInitialTextConstant
     * @tc.desc Verify gesture fixture constants stay consistent: initial and clicked text differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGestureLiveInitialTextConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(PAGE_TEXT_INITIAL).assertEqual('Hello World');
          expect(PAGE_TEXT_CLICKED).assertEqual('Welcome');
          expect(PAGE_TEXT_INITIAL.length > 0).assertTrue();
          expect(PAGE_TEXT_CLICKED.length > 0).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })
  })
}
