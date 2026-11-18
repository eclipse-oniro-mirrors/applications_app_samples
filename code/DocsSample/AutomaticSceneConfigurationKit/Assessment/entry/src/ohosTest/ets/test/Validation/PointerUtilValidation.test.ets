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
  findById,
  getDriver,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_INDEX_TITLE,
  launchAssessmentApp,
  pressAndWait,
  serializedDelay,
  TIMEOUT_PAGE_TRANSITION,
  waitForIndexPage
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Coordinate system of the pointer utilities, the page works in vp and the framework in px.
const DEFAULT_DENSITY: number = 3.0;
const DENSITY_2X: number = 2.0;
const DENSITY_1_5X: number = 1.5;
const DENSITY_1X: number = 1.0;

// Slop thresholds in vp.
const TAP_SLOP_VP: number = 8;
const LONG_PRESS_THRESHOLD_MS: number = 500;
const DOUBLE_TAP_INTERVAL_MS: number = 300;
const DRAG_START_SLOP_VP: number = 12;
const MIN_VELOCITY_VP_PER_MS: number = 0.4;

// Page geometry used by the hit tests.
const PAGE_PADDING_VP: number = 16;
const CARD_WIDTH_VP: number = 328;
const CARD_HEIGHT_VP: number = 120;
const BUTTON_WIDTH_VP: number = 96;
const BUTTON_HEIGHT_VP: number = 44;

// Sentinel of an unresolved pointer position.
const INVALID_COORDINATE: number = -1;

/**
 * Kind of pointer gesture.
 */
enum GestureKind {
  TAP = 'tap',
  LONG_PRESS = 'long_press',
  DOUBLE_TAP = 'double_tap',
  DRAG = 'drag',
  FLING = 'fling',
  NONE = 'none'
}

/**
 * Phase of a pointer sequence.
 */
enum PointerPhase {
  DOWN = 'down',
  MOVE = 'move',
  UP = 'up',
  CANCEL = 'cancel'
}

/**
 * Coordinate space of a converted value, it documents the direction of a conversion.
 */
enum CoordinateSpace {
  VP = 'vp',
  PX = 'px'
}

/**
 * Rect in vp.
 */
interface PointerRect {
  left: number;
  top: number;
  right: number;
  bottom: number;
}

/**
 * Point in vp.
 */
interface PointerPoint {
  x: number;
  y: number;
}

/**
 * One recorded pointer sample.
 */
interface PointerSample {
  x: number;
  y: number;
  phase: PointerPhase;
  timestamp: number;
  pointerId: number;
}

/**
 * Result of a hit test.
 */
interface HitTestResult {
  hit: boolean;
  regionId: string;
  offsetX: number;
  offsetY: number;
  depth: number;
}

/**
 * Classification of a gesture.
 */
interface GestureClassification {
  kind: GestureKind;
  distance: number;
  durationMs: number;
  velocity: number;
}

/**
 * Metrics of a pointer sequence.
 */
interface PointerMetrics {
  samples: number;
  distance: number;
  durationMs: number;
  maxStep: number;
  averageStep: number;
}

/**
 * Conversion between vp and px.
 *
 * The utilities are pure functions so that the cases are independent of the real display
 * density of the device under test.
 */
class DensityConverter {
  private density: number;

  public constructor(density: number = DEFAULT_DENSITY) {
    this.density = density > 0 ? density : DEFAULT_DENSITY;
  }

  public getDensity(): number {
    return this.density;
  }

  public setDensity(density: number): void {
    if (density <= 0) {
      return;
    }
    this.density = density;
  }

  public vpToPx(value: number): number {
    return value * this.density;
  }

  public pxToVp(value: number): number {
    return value / this.density;
  }

  public vpRectToPx(rect: PointerRect): PointerRect {
    const converted: PointerRect = {
      left: this.vpToPx(rect.left),
      top: this.vpToPx(rect.top),
      right: this.vpToPx(rect.right),
      bottom: this.vpToPx(rect.bottom)
    };
    return converted;
  }

  public pxRectToVp(rect: PointerRect): PointerRect {
    const converted: PointerRect = {
      left: this.pxToVp(rect.left),
      top: this.pxToVp(rect.top),
      right: this.pxToVp(rect.right),
      bottom: this.pxToVp(rect.bottom)
    };
    return converted;
  }

  public vpPointToPx(point: PointerPoint): PointerPoint {
    const converted: PointerPoint = {
      x: this.vpToPx(point.x),
      y: this.vpToPx(point.y)
    };
    return converted;
  }

  public pxPointToVp(point: PointerPoint): PointerPoint {
    const converted: PointerPoint = {
      x: this.pxToVp(point.x),
      y: this.pxToVp(point.y)
    };
    return converted;
  }

  public conversionError(vp: number): number {
    const px: number = this.vpToPx(vp);
    return Math.abs(this.pxToVp(px) - vp);
  }

  public isIntegralPx(vp: number): boolean {
    const px: number = this.vpToPx(vp);
    return Math.round(px) === px;
  }
}

/**
 * Geometry helpers of pointer rects.
 */
class RectGeometry {
  public static width(rect: PointerRect): number {
    return rect.right - rect.left;
  }

  public static height(rect: PointerRect): number {
    return rect.bottom - rect.top;
  }

  public static area(rect: PointerRect): number {
    return RectGeometry.width(rect) * RectGeometry.height(rect);
  }

  public static centerX(rect: PointerRect): number {
    return rect.left + RectGeometry.width(rect) / 2;
  }

  public static centerY(rect: PointerRect): number {
    return rect.top + RectGeometry.height(rect) / 2;
  }

  public static center(rect: PointerRect): PointerPoint {
    const point: PointerPoint = {
      x: RectGeometry.centerX(rect),
      y: RectGeometry.centerY(rect)
    };
    return point;
  }

  // The containment test is inclusive on the left and top edges and exclusive on the right
  // and bottom edges, which is the convention of the framework hit test.
  public static contains(rect: PointerRect, point: PointerPoint): boolean {
    return point.x >= rect.left && point.x < rect.right &&
      point.y >= rect.top && point.y < rect.bottom;
  }

  public static containsInclusive(rect: PointerRect, point: PointerPoint): boolean {
    return point.x >= rect.left && point.x <= rect.right &&
      point.y >= rect.top && point.y <= rect.bottom;
  }

  public static intersects(left: PointerRect, right: PointerRect): boolean {
    return left.left < right.right && right.left < left.right &&
      left.top < right.bottom && right.top < left.bottom;
  }

  public static isInside(other: PointerRect, container: PointerRect): boolean {
    return other.left >= container.left && other.top >= container.top &&
      other.right <= container.right && other.bottom <= container.bottom;
  }

  public static expanded(rect: PointerRect, by: number): PointerRect {
    const expanded: PointerRect = {
      left: rect.left - by,
      top: rect.top - by,
      right: rect.right + by,
      bottom: rect.bottom + by
    };
    return expanded;
  }

  public static shrunk(rect: PointerRect, by: number): PointerRect {
    return RectGeometry.expanded(rect, -by);
  }

  public static offsetX(rect: PointerRect, point: PointerPoint): number {
    return point.x - rect.left;
  }

  public static offsetY(rect: PointerRect, point: PointerPoint): number {
    return point.y - rect.top;
  }

  public static isValid(rect: PointerRect): boolean {
    return rect.right > rect.left && rect.bottom > rect.top;
  }
}

/**
 * Distance helpers of pointer points.
 */
class PointMath {
  public static distance(left: PointerPoint, right: PointerPoint): number {
    const dx: number = right.x - left.x;
    const dy: number = right.y - left.y;
    return Math.sqrt(dx * dx + dy * dy);
  }

  public static manhattan(left: PointerPoint, right: PointerPoint): number {
    return Math.abs(right.x - left.x) + Math.abs(right.y - left.y);
  }

  public static midpoint(left: PointerPoint, right: PointerPoint): PointerPoint {
    const point: PointerPoint = {
      x: (left.x + right.x) / 2,
      y: (left.y + right.y) / 2
    };
    return point;
  }

  public static offset(point: PointerPoint, dx: number, dy: number): PointerPoint {
    const moved: PointerPoint = {
      x: point.x + dx,
      y: point.y + dy
    };
    return moved;
  }

  public static isWithinSlop(left: PointerPoint, right: PointerPoint, slop: number): boolean {
    return PointMath.distance(left, right) <= slop;
  }

  public static isAxisAligned(left: PointerPoint, right: PointerPoint, tolerance: number): boolean {
    return Math.abs(left.y - right.y) <= tolerance || Math.abs(left.x - right.x) <= tolerance;
  }
}

/**
 * Hit tester over a list of named rects.
 *
 * The regions are tested from the last one to the first one, the last drawn region wins,
 * which mirrors the z order of the page.
 */
class HitTester {
  private rects: PointerRect[] = [];
  private ids: string[] = [];

  public register(id: string, rect: PointerRect): void {
    this.ids.push(id);
    this.rects.push(rect);
  }

  public count(): number {
    return this.rects.length;
  }

  public rectOf(id: string): PointerRect | null {
    const index: number = this.ids.indexOf(id);
    if (index < 0) {
      return null;
    }
    return this.rects[index];
  }

  public hitTest(point: PointerPoint): HitTestResult {
    for (let i = this.rects.length - 1; i >= 0; i--) {
      if (RectGeometry.contains(this.rects[i], point)) {
        const result: HitTestResult = {
          hit: true,
          regionId: this.ids[i],
          offsetX: RectGeometry.offsetX(this.rects[i], point),
          offsetY: RectGeometry.offsetY(this.rects[i], point),
          depth: this.rects.length - 1 - i
        };
        return result;
      }
    }
    const miss: HitTestResult = {
      hit: false,
      regionId: '',
      offsetX: INVALID_COORDINATE,
      offsetY: INVALID_COORDINATE,
      depth: INVALID_COORDINATE
    };
    return miss;
  }

  public hitTestAll(point: PointerPoint): string[] {
    const matches: string[] = [];
    for (let i = this.rects.length - 1; i >= 0; i--) {
      if (RectGeometry.contains(this.rects[i], point)) {
        matches.push(this.ids[i]);
      }
    }
    return matches;
  }

  public hitCount(point: PointerPoint): number {
    return this.hitTestAll(point).length;
  }

  public clear(): void {
    this.rects = [];
    this.ids = [];
  }

  public idsInOrder(): string[] {
    return this.ids.slice();
  }
}

/**
 * Slop and threshold configuration of the gesture classifier.
 */
class GestureConfig {
  private tapSlop: number = TAP_SLOP_VP;
  private longPressMs: number = LONG_PRESS_THRESHOLD_MS;
  private doubleTapMs: number = DOUBLE_TAP_INTERVAL_MS;
  private dragSlop: number = DRAG_START_SLOP_VP;
  private minVelocity: number = MIN_VELOCITY_VP_PER_MS;

  public getTapSlop(): number {
    return this.tapSlop;
  }

  public getLongPressMs(): number {
    return this.longPressMs;
  }

  public getDoubleTapMs(): number {
    return this.doubleTapMs;
  }

  public getDragSlop(): number {
    return this.dragSlop;
  }

  public getMinVelocity(): number {
    return this.minVelocity;
  }

  public setTapSlop(value: number): void {
    if (value < 0) {
      return;
    }
    this.tapSlop = value;
  }

  public setLongPressMs(value: number): void {
    if (value <= 0) {
      return;
    }
    this.longPressMs = value;
  }

  public setDoubleTapMs(value: number): void {
    if (value <= 0) {
      return;
    }
    this.doubleTapMs = value;
  }

  public setDragSlop(value: number): void {
    if (value < 0) {
      return;
    }
    this.dragSlop = value;
  }
}

/**
 * Classifier of a pointer sequence.
 *
 * The classifier receives the down point, the up point and the elapsed time and answers the
 * gesture kind the page should handle.
 */
class GestureClassifier {
  private config: GestureConfig;

  public constructor(config: GestureConfig = new GestureConfig()) {
    this.config = config;
  }

  public getConfig(): GestureConfig {
    return this.config;
  }

  public classify(down: PointerPoint, up: PointerPoint, durationMs: number): GestureClassification {
    const distance: number = PointMath.distance(down, up);
    const duration: number = durationMs > 0 ? durationMs : 0;
    if (duration >= this.config.getLongPressMs() && distance <= this.config.getTapSlop()) {
      const longPress: GestureClassification = {
        kind: GestureKind.LONG_PRESS,
        distance: distance,
        durationMs: duration,
        velocity: 0
      };
      return longPress;
    }
    if (distance > this.config.getDragSlop()) {
      const velocity: number = duration > 0 ? distance / duration : distance;
      const drag: GestureClassification = {
        kind: GestureKind.DRAG,
        distance: distance,
        durationMs: duration,
        velocity: velocity
      };
      return drag;
    }
    if (distance <= this.config.getTapSlop()) {
      const tap: GestureClassification = {
        kind: GestureKind.TAP,
        distance: distance,
        durationMs: duration,
        velocity: 0
      };
      return tap;
    }
    const none: GestureClassification = {
      kind: GestureKind.NONE,
      distance: distance,
      durationMs: duration,
      velocity: 0
    };
    return none;
  }

  public isTap(down: PointerPoint, up: PointerPoint, durationMs: number): boolean {
    return this.classify(down, up, durationMs).kind === GestureKind.TAP;
  }

  public isLongPress(down: PointerPoint, up: PointerPoint, durationMs: number): boolean {
    return this.classify(down, up, durationMs).kind === GestureKind.LONG_PRESS;
  }

  public isDrag(down: PointerPoint, up: PointerPoint, durationMs: number): boolean {
    return this.classify(down, up, durationMs).kind === GestureKind.DRAG;
  }

  // Two consecutive taps form a double tap when they are close in space and in time.
  public isDoubleTap(firstUp: PointerPoint, secondDown: PointerPoint, gapMs: number): boolean {
    if (gapMs < 0 || gapMs > this.config.getDoubleTapMs()) {
      return false;
    }
    return PointMath.isWithinSlop(firstUp, secondDown, this.config.getTapSlop());
  }

  public isFling(classification: GestureClassification, threshold: number): boolean {
    return classification.kind === GestureKind.DRAG &&
      classification.velocity >= threshold;
  }

  public thresholdOf(kind: GestureKind): number {
    if (kind === GestureKind.TAP) {
      return this.config.getTapSlop();
    }
    if (kind === GestureKind.LONG_PRESS) {
      return this.config.getLongPressMs();
    }
    if (kind === GestureKind.DOUBLE_TAP) {
      return this.config.getDoubleTapMs();
    }
    if (kind === GestureKind.DRAG) {
      return this.config.getDragSlop();
    }
    return 0;
  }
}

/**
 * Records a pointer sequence and aggregates its metrics.
 */
class PointerTrace {
  private samples: PointerSample[] = [];

  public down(point: PointerPoint, timestamp: number, pointerId: number = 0): void {
    this.append(point, PointerPhase.DOWN, timestamp, pointerId);
  }

  public move(point: PointerPoint, timestamp: number, pointerId: number = 0): void {
    this.append(point, PointerPhase.MOVE, timestamp, pointerId);
  }

  public up(point: PointerPoint, timestamp: number, pointerId: number = 0): void {
    this.append(point, PointerPhase.UP, timestamp, pointerId);
  }

  public cancel(point: PointerPoint, timestamp: number, pointerId: number = 0): void {
    this.append(point, PointerPhase.CANCEL, timestamp, pointerId);
  }

  private append(point: PointerPoint, phase: PointerPhase, timestamp: number, pointerId: number): void {
    const sample: PointerSample = {
      x: point.x,
      y: point.y,
      phase: phase,
      timestamp: timestamp,
      pointerId: pointerId
    };
    this.samples.push(sample);
  }

  public size(): number {
    return this.samples.length;
  }

  public getAll(): PointerSample[] {
    return this.samples.slice();
  }

  public first(): PointerSample | null {
    if (this.samples.length === 0) {
      return null;
    }
    return this.samples[0];
  }

  public last(): PointerSample | null {
    if (this.samples.length === 0) {
      return null;
    }
    return this.samples[this.samples.length - 1];
  }

  public clear(): void {
    this.samples = [];
  }

  public countOf(phase: PointerPhase): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].phase === phase) {
        count++;
      }
    }
    return count;
  }

  public durationMs(): number {
    const first: PointerSample | null = this.first();
    const last: PointerSample | null = this.last();
    if (first === null || last === null) {
      return 0;
    }
    return last.timestamp - first.timestamp;
  }

  public distance(): number {
    let total: number = 0;
    for (let i = 1; i < this.samples.length; i++) {
      total += PointMath.distance(
        { x: this.samples[i - 1].x, y: this.samples[i - 1].y },
        { x: this.samples[i].x, y: this.samples[i].y });
    }
    return total;
  }

  public maxStep(): number {
    let max: number = 0;
    for (let i = 1; i < this.samples.length; i++) {
      const step: number = PointMath.distance(
        { x: this.samples[i - 1].x, y: this.samples[i - 1].y },
        { x: this.samples[i].x, y: this.samples[i].y });
      if (step > max) {
        max = step;
      }
    }
    return max;
  }

  public averageStep(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    return this.distance() / (this.samples.length - 1);
  }

  public metrics(): PointerMetrics {
    const metrics: PointerMetrics = {
      samples: this.samples.length,
      distance: this.distance(),
      durationMs: this.durationMs(),
      maxStep: this.maxStep(),
      averageStep: this.averageStep()
    };
    return metrics;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].timestamp < this.samples[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public pointerIds(): number[] {
    const ids: number[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      if (ids.indexOf(this.samples[i].pointerId) < 0) {
        ids.push(this.samples[i].pointerId);
      }
    }
    return ids;
  }
}

/**
 * Builds the rects of the entry page cards.
 */
class PageLayout {
  public static card(index: number): PointerRect {
    const top: number = PAGE_PADDING_VP + index * (CARD_HEIGHT_VP + PAGE_PADDING_VP);
    const rect: PointerRect = {
      left: PAGE_PADDING_VP,
      top: top,
      right: PAGE_PADDING_VP + CARD_WIDTH_VP,
      bottom: top + CARD_HEIGHT_VP
    };
    return rect;
  }

  public static button(originX: number, originY: number): PointerRect {
    const rect: PointerRect = {
      left: originX,
      top: originY,
      right: originX + BUTTON_WIDTH_VP,
      bottom: originY + BUTTON_HEIGHT_VP
    };
    return rect;
  }

  public static page(width: number, height: number): PointerRect {
    const rect: PointerRect = {
      left: 0,
      top: 0,
      right: width,
      bottom: height
    };
    return rect;
  }

  public static buildHitTester(): HitTester {
    const tester: HitTester = new HitTester();
    tester.register('config_card', PageLayout.card(0));
    tester.register('operation_card', PageLayout.card(1));
    tester.register('status_card', PageLayout.card(2));
    return tester;
  }

  public static buildNestedHitTester(): HitTester {
    const tester: HitTester = new HitTester();
    const card: PointerRect = PageLayout.card(1);
    tester.register('operation_card', card);
    const button: PointerRect = PageLayout.button(card.left + PAGE_PADDING_VP, card.top + PAGE_PADDING_VP);
    tester.register('begin_button', button);
    return tester;
  }
}

export default function pointerUtilValidationTest() {
  describe('PointerUtilValidation_Test', () => {
    let driver: Driver;
    let converter: DensityConverter;
    let classifier: GestureClassifier;

    beforeAll(async () => {
      driver = getDriver();
      converter = new DensityConverter();
      classifier = new GestureClassifier();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the default density of the converter.
     * Expectation: the converter reports the documented density of the sample device.
     */
    it('Assessment_PointerDensityDefault_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDensityDefault_001, begin');
      expect(converter.getDensity()).assertEqual(DEFAULT_DENSITY);
      expect(DEFAULT_DENSITY).assertEqual(3);
      converter.setDensity(0);
      expect(converter.getDensity()).assertEqual(DEFAULT_DENSITY);
      converter.setDensity(-2);
      expect(converter.getDensity()).assertEqual(DEFAULT_DENSITY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDensityDefault_001, end');
    });

    /**
     * Scenario: changing the density of the converter.
     * Expectation: the new density is used by the following conversions.
     */
    it('Assessment_PointerDensityChange_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDensityChange_002, begin');
      const local: DensityConverter = new DensityConverter(DENSITY_1X);
      expect(local.vpToPx(10)).assertEqual(10);
      local.setDensity(DENSITY_2X);
      expect(local.getDensity()).assertEqual(2);
      expect(local.vpToPx(10)).assertEqual(20);
      local.setDensity(DENSITY_1_5X);
      expect(local.vpToPx(10)).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDensityChange_002, end');
    });

    /**
     * Scenario: the vp to px conversion at the default density.
     * Expectation: every value is multiplied by the density.
     */
    it('Assessment_PointerVpToPx_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerVpToPx_003, begin');
      expect(converter.vpToPx(0)).assertEqual(0);
      expect(converter.vpToPx(1)).assertEqual(3);
      expect(converter.vpToPx(16)).assertEqual(48);
      expect(converter.vpToPx(100)).assertEqual(300);
      expect(converter.vpToPx(2.5)).assertEqual(7.5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerVpToPx_003, end');
    });

    /**
     * Scenario: the px to vp conversion at the default density.
     * Expectation: every value is divided by the density.
     */
    it('Assessment_PointerPxToVp_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerPxToVp_004, begin');
      expect(converter.pxToVp(0)).assertEqual(0);
      expect(converter.pxToVp(3)).assertEqual(1);
      expect(converter.pxToVp(48)).assertEqual(16);
      expect(converter.pxToVp(300)).assertEqual(100);
      expect(converter.pxToVp(7.5)).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerPxToVp_004, end');
    });

    /**
     * Scenario: the round trip of a vp value.
     * Expectation: the conversion back returns the original value.
     */
    it('Assessment_PointerRoundTrip_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRoundTrip_005, begin');
      const values: number[] = [0, 1, 8, 16, 32, 44, 100, 328];
      for (let i = 0; i < values.length; i++) {
        expect(converter.pxToVp(converter.vpToPx(values[i]))).assertEqual(values[i]);
        expect(converter.conversionError(values[i])).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRoundTrip_005, end');
    });

    /**
     * Scenario: the integral pixel predicate.
     * Expectation: values that map to a whole pixel are recognized.
     */
    it('Assessment_PointerIntegralPixels_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerIntegralPixels_006, begin');
      expect(converter.isIntegralPx(0)).assertTrue();
      expect(converter.isIntegralPx(1)).assertTrue();
      expect(converter.isIntegralPx(2)).assertTrue();
      const fractional: DensityConverter = new DensityConverter(DENSITY_1_5X);
      expect(fractional.isIntegralPx(2)).assertTrue();
      expect(fractional.isIntegralPx(1)).assertFalse();
      expect(fractional.vpToPx(1)).assertEqual(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerIntegralPixels_006, end');
    });

    /**
     * Scenario: converting a rect from vp to px.
     * Expectation: all four edges are scaled.
     */
    it('Assessment_PointerRectToPx_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectToPx_007, begin');
      const rect: PointerRect = { left: 16, top: 16, right: 344, bottom: 136 };
      const px: PointerRect = converter.vpRectToPx(rect);
      expect(px.left).assertEqual(48);
      expect(px.top).assertEqual(48);
      expect(px.right).assertEqual(1032);
      expect(px.bottom).assertEqual(408);
      expect(RectGeometry.width(px)).assertEqual(RectGeometry.width(rect) * 3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectToPx_007, end');
    });

    /**
     * Scenario: converting a rect from px to vp.
     * Expectation: all four edges are divided by the density.
     */
    it('Assessment_PointerRectToVp_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectToVp_008, begin');
      const rect: PointerRect = { left: 48, top: 48, right: 1032, bottom: 408 };
      const vp: PointerRect = converter.pxRectToVp(rect);
      expect(vp.left).assertEqual(16);
      expect(vp.top).assertEqual(16);
      expect(vp.right).assertEqual(344);
      expect(vp.bottom).assertEqual(136);
      expect(RectGeometry.height(vp)).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectToVp_008, end');
    });

    /**
     * Scenario: converting a point between the two spaces.
     * Expectation: both coordinates are scaled and the round trip restores the input.
     */
    it('Assessment_PointerPointConversion_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerPointConversion_009, begin');
      const point: PointerPoint = { x: 100, y: 50 };
      const px: PointerPoint = converter.vpPointToPx(point);
      expect(px.x).assertEqual(300);
      expect(px.y).assertEqual(150);
      const back: PointerPoint = converter.pxPointToVp(px);
      expect(back.x).assertEqual(100);
      expect(back.y).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerPointConversion_009, end');
    });

    /**
     * Scenario: the dimensions of a page card.
     * Expectation: the rect keeps the documented card size.
     */
    it('Assessment_PointerCardGeometry_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardGeometry_010, begin');
      const card: PointerRect = PageLayout.card(0);
      expect(RectGeometry.width(card)).assertEqual(CARD_WIDTH_VP);
      expect(RectGeometry.height(card)).assertEqual(CARD_HEIGHT_VP);
      expect(card.left).assertEqual(PAGE_PADDING_VP);
      expect(card.top).assertEqual(PAGE_PADDING_VP);
      expect(RectGeometry.isValid(card)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardGeometry_010, end');
    });

    /**
     * Scenario: the vertical stacking of the cards.
     * Expectation: consecutive cards never overlap and keep the documented gap.
     */
    it('Assessment_PointerCardStacking_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardStacking_011, begin');
      const first: PointerRect = PageLayout.card(0);
      const second: PointerRect = PageLayout.card(1);
      const third: PointerRect = PageLayout.card(2);
      expect(RectGeometry.intersects(first, second)).assertFalse();
      expect(RectGeometry.intersects(second, third)).assertFalse();
      expect(second.top - first.bottom).assertEqual(PAGE_PADDING_VP);
      expect(third.top > second.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardStacking_011, end');
    });

    /**
     * Scenario: the centre of a card rect.
     * Expectation: the centre is derived from the card size.
     */
    it('Assessment_PointerCardCenter_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardCenter_012, begin');
      const card: PointerRect = PageLayout.card(0);
      expect(RectGeometry.centerX(card)).assertEqual(PAGE_PADDING_VP + CARD_WIDTH_VP / 2);
      expect(RectGeometry.centerY(card)).assertEqual(PAGE_PADDING_VP + CARD_HEIGHT_VP / 2);
      const center: PointerPoint = RectGeometry.center(card);
      expect(center.x).assertEqual(RectGeometry.centerX(card));
      expect(center.y).assertEqual(RectGeometry.centerY(card));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardCenter_012, end');
    });

    /**
     * Scenario: the area of a card rect.
     * Expectation: the area is the product of the two edges.
     */
    it('Assessment_PointerCardArea_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardArea_013, begin');
      const card: PointerRect = PageLayout.card(0);
      expect(RectGeometry.area(card)).assertEqual(CARD_WIDTH_VP * CARD_HEIGHT_VP);
      const button: PointerRect = PageLayout.button(0, 0);
      expect(RectGeometry.area(button)).assertEqual(BUTTON_WIDTH_VP * BUTTON_HEIGHT_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCardArea_013, end');
    });

    /**
     * Scenario: the containment test on the edges of a rect.
     * Expectation: the left and top edges are inside, the right and bottom edges are outside.
     */
    it('Assessment_PointerRectEdges_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectEdges_014, begin');
      const rect: PointerRect = { left: 10, top: 20, right: 110, bottom: 220 };
      expect(RectGeometry.contains(rect, { x: 10, y: 20 })).assertTrue();
      expect(RectGeometry.contains(rect, { x: 109, y: 219 })).assertTrue();
      expect(RectGeometry.contains(rect, { x: 110, y: 100 })).assertFalse();
      expect(RectGeometry.contains(rect, { x: 50, y: 220 })).assertFalse();
      expect(RectGeometry.containsInclusive(rect, { x: 110, y: 220 })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectEdges_014, end');
    });

    /**
     * Scenario: the containment test outside a rect.
     * Expectation: points on each side of the rect are rejected.
     */
    it('Assessment_PointerRectOutside_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectOutside_015, begin');
      const rect: PointerRect = { left: 10, top: 20, right: 110, bottom: 220 };
      expect(RectGeometry.contains(rect, { x: 9, y: 100 })).assertFalse();
      expect(RectGeometry.contains(rect, { x: 51, y: 19 })).assertFalse();
      expect(RectGeometry.contains(rect, { x: 1000, y: 100 })).assertFalse();
      expect(RectGeometry.contains(rect, { x: 50, y: 1000 })).assertFalse();
      expect(RectGeometry.contains(rect, { x: -1, y: -1 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectOutside_015, end');
    });

    /**
     * Scenario: the intersection of two rects.
     * Expectation: overlapping rects intersect and distant rects do not.
     */
    it('Assessment_PointerRectIntersection_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectIntersection_016, begin');
      const left: PointerRect = { left: 0, top: 0, right: 100, bottom: 100 };
      const overlapping: PointerRect = { left: 50, top: 50, right: 150, bottom: 150 };
      const distant: PointerRect = { left: 200, top: 200, right: 300, bottom: 300 };
      const touching: PointerRect = { left: 100, top: 0, right: 200, bottom: 100 };
      expect(RectGeometry.intersects(left, overlapping)).assertTrue();
      expect(RectGeometry.intersects(left, distant)).assertFalse();
      expect(RectGeometry.intersects(left, touching)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectIntersection_016, end');
    });

    /**
     * Scenario: the containment of a rect inside another rect.
     * Expectation: a nested rect is inside and a crossing rect is not.
     */
    it('Assessment_PointerRectNesting_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectNesting_017, begin');
      const outer: PointerRect = { left: 0, top: 0, right: 300, bottom: 300 };
      const inner: PointerRect = { left: 20, top: 20, right: 100, bottom: 100 };
      const crossing: PointerRect = { left: 250, top: 250, right: 400, bottom: 400 };
      expect(RectGeometry.isInside(inner, outer)).assertTrue();
      expect(RectGeometry.isInside(crossing, outer)).assertFalse();
      expect(RectGeometry.isInside(outer, inner)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectNesting_017, end');
    });

    /**
     * Scenario: expanding and shrinking a rect.
     * Expectation: the edges move by the requested amount.
     */
    it('Assessment_PointerRectExpand_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectExpand_018, begin');
      const rect: PointerRect = { left: 10, top: 10, right: 110, bottom: 210 };
      const expanded: PointerRect = RectGeometry.expanded(rect, 8);
      expect(expanded.left).assertEqual(2);
      expect(expanded.top).assertEqual(2);
      expect(expanded.right).assertEqual(118);
      expect(expanded.bottom).assertEqual(218);
      const shrunk: PointerRect = RectGeometry.shrunk(rect, 4);
      expect(shrunk.left).assertEqual(14);
      expect(shrunk.right).assertEqual(106);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectExpand_018, end');
    });

    /**
     * Scenario: the offsets of a point inside a rect.
     * Expectation: the offsets are measured from the top left corner.
     */
    it('Assessment_PointerRectOffsets_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectOffsets_019, begin');
      const rect: PointerRect = { left: 16, top: 32, right: 200, bottom: 200 };
      expect(RectGeometry.offsetX(rect, { x: 40, y: 60 })).assertEqual(24);
      expect(RectGeometry.offsetY(rect, { x: 40, y: 60 })).assertEqual(28);
      expect(RectGeometry.offsetX(rect, { x: 16, y: 32 })).assertEqual(0);
      expect(RectGeometry.offsetY(rect, { x: 16, y: 32 })).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectOffsets_019, end');
    });

    /**
     * Scenario: the validity check of a rect.
     * Expectation: a zero or inverted rect is invalid.
     */
    it('Assessment_PointerRectValidity_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectValidity_020, begin');
      expect(RectGeometry.isValid({ left: 0, top: 0, right: 10, bottom: 10 })).assertTrue();
      expect(RectGeometry.isValid({ left: 0, top: 0, right: 0, bottom: 10 })).assertFalse();
      expect(RectGeometry.isValid({ left: 0, top: 0, right: 10, bottom: 0 })).assertFalse();
      expect(RectGeometry.isValid({ left: 10, top: 10, right: 5, bottom: 5 })).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerRectValidity_020, end');
    });

    /**
     * Scenario: the Euclidean distance between two points.
     * Expectation: the distance follows the Pythagorean theorem.
     */
    it('Assessment_PointerDistance_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDistance_021, begin');
      expect(PointMath.distance({ x: 0, y: 0 }, { x: 3, y: 4 })).assertEqual(5);
      expect(PointMath.distance({ x: 0, y: 0 }, { x: 0, y: 0 })).assertEqual(0);
      expect(PointMath.distance({ x: 10, y: 10 }, { x: 10, y: 20 })).assertEqual(10);
      expect(PointMath.distance({ x: 10, y: 10 }, { x: 20, y: 10 })).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDistance_021, end');
    });

    /**
     * Scenario: the Manhattan distance between two points.
     * Expectation: the distance is the sum of the axis deltas.
     */
    it('Assessment_PointerManhattan_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerManhattan_022, begin');
      expect(PointMath.manhattan({ x: 0, y: 0 }, { x: 3, y: 4 })).assertEqual(7);
      expect(PointMath.manhattan({ x: 10, y: 10 }, { x: 10, y: 10 })).assertEqual(0);
      expect(PointMath.manhattan({ x: 0, y: 0 }, { x: -3, y: -4 })).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerManhattan_022, end');
    });

    /**
     * Scenario: the midpoint of two points.
     * Expectation: the midpoint is the arithmetic mean of both coordinates.
     */
    it('Assessment_PointerMidpoint_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerMidpoint_023, begin');
      const mid: PointerPoint = PointMath.midpoint({ x: 0, y: 0 }, { x: 10, y: 20 });
      expect(mid.x).assertEqual(5);
      expect(mid.y).assertEqual(10);
      const same: PointerPoint = PointMath.midpoint({ x: 4, y: 4 }, { x: 4, y: 4 });
      expect(same.x).assertEqual(4);
      expect(same.y).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerMidpoint_023, end');
    });

    /**
     * Scenario: offsetting a point.
     * Expectation: the returned point is moved and the input stays untouched.
     */
    it('Assessment_PointerOffset_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerOffset_024, begin');
      const origin: PointerPoint = { x: 10, y: 20 };
      const moved: PointerPoint = PointMath.offset(origin, 5, -5);
      expect(moved.x).assertEqual(15);
      expect(moved.y).assertEqual(15);
      expect(origin.x).assertEqual(10);
      expect(origin.y).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerOffset_024, end');
    });

    /**
     * Scenario: the slop predicate between two points.
     * Expectation: a distance at the slop is accepted and above the slop is rejected.
     */
    it('Assessment_PointerSlopPredicate_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerSlopPredicate_025, begin');
      expect(PointMath.isWithinSlop({ x: 0, y: 0 }, { x: 3, y: 4 }, TAP_SLOP_VP)).assertTrue();
      expect(PointMath.isWithinSlop({ x: 0, y: 0 }, { x: 8, y: 0 }, TAP_SLOP_VP)).assertTrue();
      expect(PointMath.isWithinSlop({ x: 0, y: 0 }, { x: 9, y: 0 }, TAP_SLOP_VP)).assertFalse();
      expect(PointMath.isWithinSlop({ x: 0, y: 0 }, { x: 0, y: 0 }, 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerSlopPredicate_025, end');
    });

    /**
     * Scenario: the axis alignment predicate of a move.
     * Expectation: a horizontal and a vertical move are both axis aligned.
     */
    it('Assessment_PointerAxisAlignment_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerAxisAlignment_026, begin');
      expect(PointMath.isAxisAligned({ x: 0, y: 0 }, { x: 50, y: 0 }, 1)).assertTrue();
      expect(PointMath.isAxisAligned({ x: 0, y: 0 }, { x: 0, y: 50 }, 1)).assertTrue();
      expect(PointMath.isAxisAligned({ x: 0, y: 0 }, { x: 50, y: 50 }, 1)).assertFalse();
      expect(PointMath.isAxisAligned({ x: 0, y: 0 }, { x: 50, y: 0.5 }, 1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerAxisAlignment_026, end');
    });

    /**
     * Scenario: the hit tester over the three page cards.
     * Expectation: a point inside a card resolves to the card identifier.
     */
    it('Assessment_PointerHitTesterCards_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterCards_027, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      expect(tester.count()).assertEqual(3);
      const first: HitTestResult = tester.hitTest({ x: 50, y: 50 });
      expect(first.hit).assertTrue();
      expect(first.regionId).assertEqual('config_card');
      const second: HitTestResult = tester.hitTest({ x: 50, y: 200 });
      expect(second.regionId).assertEqual('operation_card');
      const third: HitTestResult = tester.hitTest({ x: 50, y: 350 });
      expect(third.regionId).assertEqual('status_card');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterCards_027, end');
    });

    /**
     * Scenario: a hit test outside every card.
     * Expectation: the result is a miss with the sentinel offsets.
     */
    it('Assessment_PointerHitTesterMiss_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterMiss_028, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const miss: HitTestResult = tester.hitTest({ x: 1000, y: 1000 });
      expect(miss.hit).assertFalse();
      expect(miss.regionId).assertEqual('');
      expect(miss.offsetX).assertEqual(INVALID_COORDINATE);
      expect(miss.offsetY).assertEqual(INVALID_COORDINATE);
      expect(miss.depth).assertEqual(INVALID_COORDINATE);
      expect(tester.hitCount({ x: 1000, y: 1000 })).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterMiss_028, end');
    });

    /**
     * Scenario: the offsets of a hit test result.
     * Expectation: the offsets are relative to the top left corner of the hit region.
     */
    it('Assessment_PointerHitTesterOffsets_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterOffsets_029, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const card: PointerRect = PageLayout.card(0);
      const result: HitTestResult = tester.hitTest({ x: card.left + 20, y: card.top + 30 });
      expect(result.regionId).assertEqual('config_card');
      expect(result.offsetX).assertEqual(20);
      expect(result.offsetY).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterOffsets_029, end');
    });

    /**
     * Scenario: a nested button inside a card.
     * Expectation: the button wins because it is registered after the card.
     */
    it('Assessment_PointerHitTesterNested_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterNested_030, begin');
      const tester: HitTester = PageLayout.buildNestedHitTester();
      const card: PointerRect = PageLayout.card(1);
      const insideButton: HitTestResult =
        tester.hitTest({ x: card.left + 20, y: card.top + 20 });
      expect(insideButton.regionId).assertEqual('begin_button');
      expect(insideButton.depth).assertEqual(0);
      const outsideButton: HitTestResult =
        tester.hitTest({ x: card.right - 5, y: card.bottom - 5 });
      expect(outsideButton.regionId).assertEqual('operation_card');
      expect(outsideButton.depth).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterNested_030, end');
    });

    /**
     * Scenario: every region that contains a point.
     * Expectation: the nested point resolves to two regions in z order.
     */
    it('Assessment_PointerHitTesterAll_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterAll_031, begin');
      const tester: HitTester = PageLayout.buildNestedHitTester();
      const card: PointerRect = PageLayout.card(1);
      const matches: string[] = tester.hitTestAll({ x: card.left + 20, y: card.top + 20 });
      expect(matches.length).assertEqual(2);
      expect(matches[0]).assertEqual('begin_button');
      expect(matches[1]).assertEqual('operation_card');
      expect(tester.hitCount({ x: card.left + 20, y: card.top + 20 })).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterAll_031, end');
    });

    /**
     * Scenario: the rect lookup of the hit tester.
     * Expectation: a known identifier answers its rect and an unknown one answers null.
     */
    it('Assessment_PointerHitTesterRectLookup_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterRectLookup_032, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const rect: PointerRect | null = tester.rectOf('config_card');
      expect(rect !== null).assertTrue();
      if (rect !== null) {
        expect(rect.left).assertEqual(PAGE_PADDING_VP);
        expect(RectGeometry.width(rect)).assertEqual(CARD_WIDTH_VP);
      }
      expect(tester.rectOf('unknown') === null).assertTrue();
      expect(tester.idsInOrder().length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterRectLookup_032, end');
    });

    /**
     * Scenario: clearing the hit tester.
     * Expectation: every region is dropped and a hit test misses.
     */
    it('Assessment_PointerHitTesterClear_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterClear_033, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      expect(tester.count()).assertEqual(3);
      tester.clear();
      expect(tester.count()).assertEqual(0);
      expect(tester.hitTest({ x: 50, y: 50 }).hit).assertFalse();
      expect(tester.idsInOrder().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterClear_033, end');
    });

    /**
     * Scenario: a hit test on the exact top left corner of a card.
     * Expectation: the corner belongs to the card.
     */
    it('Assessment_PointerHitTesterCorner_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterCorner_034, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const card: PointerRect = PageLayout.card(0);
      const topLeft: HitTestResult = tester.hitTest({ x: card.left, y: card.top });
      expect(topLeft.hit).assertTrue();
      expect(topLeft.offsetX).assertEqual(0);
      expect(topLeft.offsetY).assertEqual(0);
      const bottomRight: HitTestResult = tester.hitTest({ x: card.right, y: card.bottom });
      expect(bottomRight.hit).assertFalse();
      expect(bottomRight.regionId).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerHitTesterCorner_034, end');
    });

    /**
     * Scenario: the default gesture configuration.
     * Expectation: every threshold matches the documented value.
     */
    it('Assessment_PointerGestureConfig_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureConfig_035, begin');
      const config: GestureConfig = classifier.getConfig();
      expect(config.getTapSlop()).assertEqual(8);
      expect(config.getLongPressMs()).assertEqual(500);
      expect(config.getDoubleTapMs()).assertEqual(300);
      expect(config.getDragSlop()).assertEqual(12);
      expect(config.getMinVelocity()).assertEqual(0.4);
      expect(TAP_SLOP_VP).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureConfig_035, end');
    });

    /**
     * Scenario: changing the thresholds of the configuration.
     * Expectation: valid values are adopted and invalid values are ignored.
     */
    it('Assessment_PointerGestureConfigChange_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureConfigChange_036, begin');
      const config: GestureConfig = new GestureConfig();
      config.setTapSlop(4);
      expect(config.getTapSlop()).assertEqual(4);
      config.setTapSlop(-1);
      expect(config.getTapSlop()).assertEqual(4);
      config.setLongPressMs(800);
      expect(config.getLongPressMs()).assertEqual(800);
      config.setLongPressMs(0);
      expect(config.getLongPressMs()).assertEqual(800);
      config.setDoubleTapMs(200);
      expect(config.getDoubleTapMs()).assertEqual(200);
      config.setDragSlop(20);
      expect(config.getDragSlop()).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureConfigChange_036, end');
    });

    /**
     * Scenario: the threshold accessor per gesture kind.
     * Expectation: every kind answers its documented threshold.
     */
    it('Assessment_PointerGestureThresholds_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureThresholds_037, begin');
      expect(classifier.thresholdOf(GestureKind.TAP)).assertEqual(TAP_SLOP_VP);
      expect(classifier.thresholdOf(GestureKind.LONG_PRESS)).assertEqual(LONG_PRESS_THRESHOLD_MS);
      expect(classifier.thresholdOf(GestureKind.DOUBLE_TAP)).assertEqual(DOUBLE_TAP_INTERVAL_MS);
      expect(classifier.thresholdOf(GestureKind.DRAG)).assertEqual(DRAG_START_SLOP_VP);
      expect(classifier.thresholdOf(GestureKind.NONE)).assertEqual(0);
      expect(classifier.thresholdOf(GestureKind.FLING)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureThresholds_037, end');
    });

    /**
     * Scenario: a quick pointer sequence without movement.
     * Expectation: the sequence is classified as a tap.
     */
    it('Assessment_PointerGestureTap_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureTap_038, begin');
      const down: PointerPoint = { x: 100, y: 100 };
      const up: PointerPoint = { x: 102, y: 101 };
      const result: GestureClassification = classifier.classify(down, up, 120);
      expect(result.kind).assertEqual(GestureKind.TAP);
      expect(result.durationMs).assertEqual(120);
      expect(result.velocity).assertEqual(0);
      expect(classifier.isTap(down, up, 120)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureTap_038, end');
    });

    /**
     * Scenario: a slow pointer sequence without movement.
     * Expectation: the sequence is classified as a long press.
     */
    it('Assessment_PointerGestureLongPress_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureLongPress_039, begin');
      const down: PointerPoint = { x: 100, y: 100 };
      const up: PointerPoint = { x: 101, y: 100 };
      const result: GestureClassification = classifier.classify(down, up, LONG_PRESS_THRESHOLD_MS);
      expect(result.kind).assertEqual(GestureKind.LONG_PRESS);
      expect(classifier.isLongPress(down, up, 600)).assertTrue();
      expect(classifier.isTap(down, up, 600)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureLongPress_039, end');
    });

    /**
     * Scenario: the boundary between a tap and a long press.
     * Expectation: one millisecond below the threshold is still a tap.
     */
    it('Assessment_PointerGestureLongPressBoundary_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureLongPressBoundary_040, begin');
      const down: PointerPoint = { x: 100, y: 100 };
      const up: PointerPoint = { x: 100, y: 100 };
      expect(classifier.classify(down, up, LONG_PRESS_THRESHOLD_MS - 1).kind).assertEqual(GestureKind.TAP);
      expect(classifier.classify(down, up, LONG_PRESS_THRESHOLD_MS).kind)
        .assertEqual(GestureKind.LONG_PRESS);
      expect(classifier.classify(down, up, LONG_PRESS_THRESHOLD_MS + 1).kind)
        .assertEqual(GestureKind.LONG_PRESS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureLongPressBoundary_040, end');
    });

    /**
     * Scenario: a moving pointer sequence.
     * Expectation: the sequence is classified as a drag with a positive velocity.
     */
    it('Assessment_PointerGestureDrag_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDrag_041, begin');
      const down: PointerPoint = { x: 100, y: 100 };
      const up: PointerPoint = { x: 200, y: 100 };
      const result: GestureClassification = classifier.classify(down, up, 100);
      expect(result.kind).assertEqual(GestureKind.DRAG);
      expect(result.distance).assertEqual(100);
      expect(result.velocity).assertEqual(1);
      expect(classifier.isDrag(down, up, 100)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDrag_041, end');
    });

    /**
     * Scenario: the boundary between a tap and a drag.
     * Expectation: a move still inside the tap slop is a tap, a move between the two slops is
     * unclassified and a move beyond the drag slop starts a drag.
     */
    it('Assessment_PointerGestureDragBoundary_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDragBoundary_042, begin');
      const down: PointerPoint = { x: 100, y: 100 };
      const atTapSlop: PointerPoint = { x: 100 + TAP_SLOP_VP, y: 100 };
      const insideDragSlop: PointerPoint = { x: 100 + DRAG_START_SLOP_VP, y: 100 };
      const outsideSlop: PointerPoint = { x: 100 + DRAG_START_SLOP_VP + 1, y: 100 };
      expect(classifier.classify(down, atTapSlop, 100).kind).assertEqual(GestureKind.TAP);
      expect(classifier.classify(down, insideDragSlop, 100).kind).assertEqual(GestureKind.NONE);
      expect(classifier.classify(down, outsideSlop, 100).kind).assertEqual(GestureKind.DRAG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDragBoundary_042, end');
    });

    /**
     * Scenario: a long press that moved beyond the tap slop.
     * Expectation: the movement wins, the sequence is classified as a drag.
     */
    it('Assessment_PointerGestureLongPressWithMove_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureLongPressWithMove_043, begin');
      const down: PointerPoint = { x: 100, y: 100 };
      const up: PointerPoint = { x: 200, y: 100 };
      const result: GestureClassification = classifier.classify(down, up, 900);
      expect(result.kind).assertEqual(GestureKind.DRAG);
      expect(classifier.isLongPress(down, up, 900)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureLongPressWithMove_043, end');
    });

    /**
     * Scenario: a pointer sequence with a negative duration.
     * Expectation: the negative duration is clamped to zero before the classification.
     */
    it('Assessment_PointerGestureNegativeDuration_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureNegativeDuration_044, begin');
      const down: PointerPoint = { x: 100, y: 100 };
      const up: PointerPoint = { x: 100, y: 100 };
      const result: GestureClassification = classifier.classify(down, up, -50);
      expect(result.kind).assertEqual(GestureKind.TAP);
      expect(result.durationMs).assertEqual(0);
      expect(result.distance).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureNegativeDuration_044, end');
    });

    /**
     * Scenario: a double tap inside the interval.
     * Expectation: the second down close to the first up forms a double tap.
     */
    it('Assessment_PointerGestureDoubleTap_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDoubleTap_045, begin');
      const firstUp: PointerPoint = { x: 100, y: 100 };
      const secondDown: PointerPoint = { x: 103, y: 102 };
      expect(classifier.isDoubleTap(firstUp, secondDown, 150)).assertTrue();
      expect(classifier.isDoubleTap(firstUp, secondDown, DOUBLE_TAP_INTERVAL_MS)).assertTrue();
      expect(classifier.isDoubleTap(firstUp, secondDown, DOUBLE_TAP_INTERVAL_MS + 1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDoubleTap_045, end');
    });

    /**
     * Scenario: a double tap with a large spatial gap.
     * Expectation: the spatial slop rejects the pair even inside the interval.
     */
    it('Assessment_PointerGestureDoubleTapGap_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDoubleTapGap_046, begin');
      const firstUp: PointerPoint = { x: 100, y: 100 };
      const farDown: PointerPoint = { x: 200, y: 100 };
      expect(classifier.isDoubleTap(firstUp, farDown, 100)).assertFalse();
      expect(classifier.isDoubleTap(firstUp, farDown, -1)).assertFalse();
      const nearDown: PointerPoint = { x: 100, y: 100 };
      expect(classifier.isDoubleTap(firstUp, nearDown, 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureDoubleTapGap_046, end');
    });

    /**
     * Scenario: a fling detected from a fast drag.
     * Expectation: a velocity above the threshold qualifies as a fling.
     */
    it('Assessment_PointerGestureFling_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureFling_047, begin');
      const down: PointerPoint = { x: 0, y: 0 };
      const up: PointerPoint = { x: 400, y: 0 };
      const result: GestureClassification = classifier.classify(down, up, 100);
      expect(result.kind).assertEqual(GestureKind.DRAG);
      expect(result.velocity).assertEqual(4);
      expect(classifier.isFling(result, MIN_VELOCITY_VP_PER_MS)).assertTrue();
      expect(classifier.isFling(result, 10)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureFling_047, end');
    });

    /**
     * Scenario: a slow drag that is not a fling.
     * Expectation: a low velocity fails the fling threshold.
     */
    it('Assessment_PointerGestureSlowDrag_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureSlowDrag_048, begin');
      const down: PointerPoint = { x: 0, y: 0 };
      const up: PointerPoint = { x: 20, y: 0 };
      const result: GestureClassification = classifier.classify(down, up, 1000);
      expect(result.kind).assertEqual(GestureKind.DRAG);
      expect(result.velocity < MIN_VELOCITY_VP_PER_MS).assertTrue();
      expect(result.velocity > 0).assertTrue();
      expect(classifier.isFling(result, MIN_VELOCITY_VP_PER_MS)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureSlowDrag_048, end');
    });

    /**
     * Scenario: a zero duration drag.
     * Expectation: the velocity falls back to the distance so the fling check still works.
     */
    it('Assessment_PointerGestureZeroDurationDrag_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureZeroDurationDrag_049, begin');
      const down: PointerPoint = { x: 0, y: 0 };
      const up: PointerPoint = { x: 50, y: 0 };
      const result: GestureClassification = classifier.classify(down, up, 0);
      expect(result.kind).assertEqual(GestureKind.DRAG);
      expect(result.velocity).assertEqual(50);
      expect(classifier.isFling(result, MIN_VELOCITY_VP_PER_MS)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureZeroDurationDrag_049, end');
    });

    /**
     * Scenario: a custom config of the classifier.
     * Expectation: the classifier respects the tightened thresholds.
     */
    it('Assessment_PointerGestureCustomConfig_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureCustomConfig_050, begin');
      const config: GestureConfig = new GestureConfig();
      config.setTapSlop(2);
      config.setLongPressMs(1000);
      const strict: GestureClassifier = new GestureClassifier(config);
      const down: PointerPoint = { x: 0, y: 0 };
      const near: PointerPoint = { x: 2, y: 0 };
      const up: PointerPoint = { x: 5, y: 0 };
      expect(strict.classify(down, near, 100).kind).assertEqual(GestureKind.TAP);
      expect(strict.classify(down, up, 100).kind).assertEqual(GestureKind.NONE);
      expect(strict.classify(down, near, 600).kind).assertEqual(GestureKind.TAP);
      expect(strict.classify(down, near, 1000).kind).assertEqual(GestureKind.LONG_PRESS);
      expect(strict.getConfig().getTapSlop()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerGestureCustomConfig_050, end');
    });

    /**
     * Scenario: a fresh pointer trace.
     * Expectation: it is empty and the metrics collapse to zero.
     */
    it('Assessment_PointerTraceFresh_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceFresh_051, begin');
      const trace: PointerTrace = new PointerTrace();
      expect(trace.size()).assertEqual(0);
      expect(trace.first() === null).assertTrue();
      expect(trace.last() === null).assertTrue();
      const metrics: PointerMetrics = trace.metrics();
      expect(metrics.samples).assertEqual(0);
      expect(metrics.distance).assertEqual(0);
      expect(metrics.durationMs).assertEqual(0);
      expect(metrics.maxStep).assertEqual(0);
      expect(metrics.averageStep).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceFresh_051, end');
    });

    /**
     * Scenario: a tap trace with a down and an up sample.
     * Expectation: the trace holds both phases and no distance.
     */
    it('Assessment_PointerTraceTap_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceTap_052, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 100, y: 100 }, 0);
      trace.up({ x: 100, y: 100 }, 120);
      expect(trace.size()).assertEqual(2);
      expect(trace.countOf(PointerPhase.DOWN)).assertEqual(1);
      expect(trace.countOf(PointerPhase.UP)).assertEqual(1);
      expect(trace.durationMs()).assertEqual(120);
      expect(trace.distance()).assertEqual(0);
      expect(trace.isChronological()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceTap_052, end');
    });

    /**
     * Scenario: a drag trace with intermediate samples.
     * Expectation: the distance is the sum of the segment lengths.
     */
    it('Assessment_PointerTraceDrag_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceDrag_053, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 0, y: 0 }, 0);
      trace.move({ x: 10, y: 0 }, 50);
      trace.move({ x: 20, y: 0 }, 100);
      trace.up({ x: 30, y: 0 }, 150);
      expect(trace.size()).assertEqual(4);
      expect(trace.countOf(PointerPhase.MOVE)).assertEqual(2);
      expect(trace.distance()).assertEqual(30);
      expect(trace.durationMs()).assertEqual(150);
      expect(trace.maxStep()).assertEqual(10);
      expect(trace.averageStep()).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceDrag_053, end');
    });

    /**
     * Scenario: a trace with unequal segments.
     * Expectation: the maximum step differs from the average step.
     */
    it('Assessment_PointerTraceUnequalSteps_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceUnequalSteps_054, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 0, y: 0 }, 0);
      trace.move({ x: 5, y: 0 }, 10);
      trace.move({ x: 25, y: 0 }, 20);
      trace.up({ x: 45, y: 0 }, 30);
      const metrics: PointerMetrics = trace.metrics();
      expect(metrics.samples).assertEqual(4);
      expect(metrics.distance).assertEqual(45);
      expect(metrics.maxStep).assertEqual(20);
      expect(metrics.averageStep).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceUnequalSteps_054, end');
    });

    /**
     * Scenario: a cancelled pointer sequence.
     * Expectation: the cancel sample is recorded and counted.
     */
    it('Assessment_PointerTraceCancel_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceCancel_055, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 10, y: 10 }, 0);
      trace.move({ x: 20, y: 10 }, 20);
      trace.cancel({ x: 20, y: 10 }, 40);
      expect(trace.countOf(PointerPhase.CANCEL)).assertEqual(1);
      expect(trace.countOf(PointerPhase.UP)).assertEqual(0);
      expect(trace.last()?.phase).assertEqual(PointerPhase.CANCEL);
      expect(trace.size()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceCancel_055, end');
    });

    /**
     * Scenario: two pointers in one trace.
     * Expectation: both pointer identifiers are reported distinctly.
     */
    it('Assessment_PointerTraceMultiPointer_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceMultiPointer_056, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 10, y: 10 }, 0, 0);
      trace.down({ x: 100, y: 100 }, 5, 1);
      trace.move({ x: 20, y: 20 }, 20, 0);
      trace.move({ x: 110, y: 110 }, 25, 1);
      trace.up({ x: 20, y: 20 }, 40, 0);
      trace.up({ x: 110, y: 110 }, 45, 1);
      const ids: number[] = trace.pointerIds();
      expect(ids.length).assertEqual(2);
      expect(ids[0]).assertEqual(0);
      expect(ids[1]).assertEqual(1);
      expect(trace.size()).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceMultiPointer_056, end');
    });

    /**
     * Scenario: the chronology check of a trace.
     * Expectation: a decreasing timestamp is detected.
     */
    it('Assessment_PointerTraceChronology_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceChronology_057, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 0, y: 0 }, 100);
      trace.up({ x: 0, y: 0 }, 200);
      expect(trace.isChronological()).assertTrue();
      const broken: PointerTrace = new PointerTrace();
      broken.down({ x: 0, y: 0 }, 200);
      broken.up({ x: 0, y: 0 }, 100);
      expect(broken.isChronological()).assertFalse();
      expect(broken.durationMs()).assertEqual(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceChronology_057, end');
    });

    /**
     * Scenario: the sample getter of the trace.
     * Expectation: the returned list is a defensive copy.
     */
    it('Assessment_PointerTraceCopy_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceCopy_058, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 0, y: 0 }, 0);
      const copy: PointerSample[] = trace.getAll();
      copy.push({ x: 99, y: 99, phase: PointerPhase.UP, timestamp: 5, pointerId: 0 });
      expect(trace.size()).assertEqual(1);
      expect(trace.getAll().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceCopy_058, end');
    });

    /**
     * Scenario: clearing the trace.
     * Expectation: every sample is dropped and the metrics collapse again.
     */
    it('Assessment_PointerTraceClear_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceClear_059, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 0, y: 0 }, 0);
      trace.up({ x: 10, y: 0 }, 20);
      expect(trace.size()).assertEqual(2);
      trace.clear();
      expect(trace.size()).assertEqual(0);
      expect(trace.metrics().samples).assertEqual(0);
      expect(trace.first() === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceClear_059, end');
    });

    /**
     * Scenario: the first and last samples of a trace.
     * Expectation: they address the two ends of the recorded sequence.
     */
    it('Assessment_PointerTraceEndpoints_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceEndpoints_060, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 5, y: 6 }, 0);
      trace.move({ x: 7, y: 8 }, 10);
      trace.up({ x: 9, y: 10 }, 20);
      const first: PointerSample | null = trace.first();
      const last: PointerSample | null = trace.last();
      expect(first !== null).assertTrue();
      expect(last !== null).assertTrue();
      if (first !== null && last !== null) {
        expect(first.phase).assertEqual(PointerPhase.DOWN);
        expect(first.x).assertEqual(5);
        expect(last.phase).assertEqual(PointerPhase.UP);
        expect(last.y).assertEqual(10);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceEndpoints_060, end');
    });

    /**
     * Scenario: the tap classification driven by a trace.
     * Expectation: the classifier agrees with the trace endpoints and duration.
     */
    it('Assessment_PointerTraceWithClassifier_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceWithClassifier_061, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 100, y: 100 }, 0);
      trace.move({ x: 101, y: 100 }, 30);
      trace.up({ x: 102, y: 100 }, 90);
      const down: PointerSample | null = trace.first();
      const up: PointerSample | null = trace.last();
      expect(down !== null).assertTrue();
      expect(up !== null).assertTrue();
      if (down !== null && up !== null) {
        const result: GestureClassification = classifier.classify(
          { x: down.x, y: down.y }, { x: up.x, y: up.y }, trace.durationMs());
        expect(result.kind).assertEqual(GestureKind.TAP);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceWithClassifier_061, end');
    });

    /**
     * Scenario: a drag classification driven by a trace.
     * Expectation: the classifier reports a drag with the trace distance.
     */
    it('Assessment_PointerTraceDragClassification_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceDragClassification_062, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 0, y: 0 }, 0);
      trace.move({ x: 50, y: 0 }, 40);
      trace.move({ x: 120, y: 0 }, 80);
      trace.up({ x: 120, y: 0 }, 100);
      const down: PointerSample | null = trace.first();
      const up: PointerSample | null = trace.last();
      expect(down !== null).assertTrue();
      expect(up !== null).assertTrue();
      if (down !== null && up !== null) {
        const result: GestureClassification = classifier.classify(
          { x: down.x, y: down.y }, { x: up.x, y: up.y }, trace.durationMs());
        expect(result.kind).assertEqual(GestureKind.DRAG);
        expect(result.distance).assertEqual(120);
      }
      expect(trace.distance()).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceDragClassification_062, end');
    });

    /**
     * Scenario: a long press classification driven by a trace.
     * Expectation: the long duration and the small distance produce a long press.
     */
    it('Assessment_PointerTraceLongPressClassification_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceLongPressClassification_063, begin');
      const trace: PointerTrace = new PointerTrace();
      trace.down({ x: 100, y: 100 }, 0);
      trace.move({ x: 101, y: 100 }, 300);
      trace.up({ x: 101, y: 100 }, 800);
      const down: PointerSample | null = trace.first();
      const up: PointerSample | null = trace.last();
      expect(down !== null).assertTrue();
      expect(up !== null).assertTrue();
      if (down !== null && up !== null) {
        const result: GestureClassification = classifier.classify(
          { x: down.x, y: down.y }, { x: up.x, y: up.y }, trace.durationMs());
        expect(result.kind).assertEqual(GestureKind.LONG_PRESS);
      }
      expect(trace.durationMs()).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTraceLongPressClassification_063, end');
    });

    /**
     * Scenario: a tap on a card resolved by the hit tester.
     * Expectation: the tap point resolves to the card that contains it.
     */
    it('Assessment_PointerTapOnCard_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTapOnCard_064, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const card: PointerRect = PageLayout.card(1);
      const center: PointerPoint = RectGeometry.center(card);
      const result: HitTestResult = tester.hitTest(center);
      expect(result.hit).assertTrue();
      expect(result.regionId).assertEqual('operation_card');
      expect(RectGeometry.contains(card, center)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTapOnCard_064, end');
    });

    /**
     * Scenario: a tap converted from px to vp before the hit test.
     * Expectation: the converted point resolves to the same region as the vp point.
     */
    it('Assessment_PointerTapFromPx_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTapFromPx_065, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const card: PointerRect = PageLayout.card(0);
      const vpPoint: PointerPoint = { x: card.left + 20, y: card.top + 20 };
      const pxPoint: PointerPoint = converter.vpPointToPx(vpPoint);
      const converted: PointerPoint = converter.pxPointToVp(pxPoint);
      const result: HitTestResult = tester.hitTest(converted);
      expect(result.hit).assertTrue();
      expect(result.regionId).assertEqual('config_card');
      expect(result.offsetX).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerTapFromPx_065, end');
    });

    /**
     * Scenario: a drag that starts on a card and ends outside it.
     * Expectation: only the start point decides the gesture target.
     */
    it('Assessment_PointerDragAcrossCards_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDragAcrossCards_066, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const start: PointerPoint = RectGeometry.center(PageLayout.card(0));
      const end: PointerPoint = RectGeometry.center(PageLayout.card(2));
      expect(tester.hitTest(start).regionId).assertEqual('config_card');
      expect(tester.hitTest(end).regionId).assertEqual('status_card');
      const result: GestureClassification = classifier.classify(start, end, 400);
      expect(result.kind).assertEqual(GestureKind.DRAG);
      expect(result.distance > DRAG_START_SLOP_VP).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerDragAcrossCards_066, end');
    });

    /**
     * Scenario: a button hit inside a converted card.
     * Expectation: the px rect and the px point resolve consistently.
     */
    it('Assessment_PointerButtonInPx_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerButtonInPx_067, begin');
      const card: PointerRect = PageLayout.card(1);
      const button: PointerRect = PageLayout.button(card.left + PAGE_PADDING_VP, card.top + PAGE_PADDING_VP);
      const buttonPx: PointerRect = converter.vpRectToPx(button);
      const centerPx: PointerPoint = RectGeometry.center(buttonPx);
      expect(RectGeometry.contains(buttonPx, centerPx)).assertTrue();
      const centerVp: PointerPoint = converter.pxPointToVp(centerPx);
      expect(RectGeometry.contains(button, centerVp)).assertTrue();
      expect(RectGeometry.contains(card, centerVp)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerButtonInPx_067, end');
    });

    /**
     * Scenario: the slop expansion of a small button.
     * Expectation: the expanded rect accepts a point that the original rect rejects.
     */
    it('Assessment_PointerButtonSlop_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerButtonSlop_068, begin');
      const button: PointerRect = PageLayout.button(100, 100);
      const outside: PointerPoint = { x: 100, y: 100 + BUTTON_HEIGHT_VP + 4 };
      expect(RectGeometry.contains(button, outside)).assertFalse();
      const expanded: PointerRect = RectGeometry.expanded(button, TAP_SLOP_VP);
      expect(RectGeometry.contains(expanded, outside)).assertTrue();
      expect(RectGeometry.width(expanded)).assertEqual(BUTTON_WIDTH_VP + 2 * TAP_SLOP_VP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerButtonSlop_068, end');
    });

    /**
     * Scenario: an end to end pointer scenario.
     * Expectation: conversion, hit testing, classification and metrics agree.
     */
    it('Assessment_PointerComprehensive_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerComprehensive_070, begin');
      const tester: HitTester = PageLayout.buildHitTester();
      const trace: PointerTrace = new PointerTrace();
      const card: PointerRect = PageLayout.card(1);
      const center: PointerPoint = RectGeometry.center(card);
      trace.down(center, 0);
      trace.move(PointMath.offset(center, 3, 0), 40);
      trace.up(PointMath.offset(center, 5, 0), 90);
      const hit: HitTestResult = tester.hitTest(center);
      expect(hit.regionId).assertEqual('operation_card');
      const pxCenter: PointerPoint = converter.vpPointToPx(center);
      expect(converter.pxPointToVp(pxCenter).x).assertEqual(center.x);
      const classification: GestureClassification =
        classifier.classify(center, PointMath.offset(center, 5, 0), trace.durationMs());
      expect(classification.kind).assertEqual(GestureKind.TAP);
      expect(trace.distance()).assertEqual(5);
      expect(trace.metrics().samples).assertEqual(3);
      expect(trace.isChronological()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerComprehensive_070, end');
    });

    /**
     * Scenario: the coordinate space labels of a conversion.
     * Expectation: the vp and px spaces are distinct constant tokens.
     */
    it('Assessment_PointerCoordinateSpaces_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCoordinateSpaces_075, begin');
      expect(CoordinateSpace.VP).assertEqual('vp');
      expect(CoordinateSpace.PX).assertEqual('px');
      // The two members are distinct enum constants, the comparison goes through the value
      // array so that the compiler does not fold it into a literal type comparison.
      const spaces: string[] = [CoordinateSpace.VP, CoordinateSpace.PX];
      expect(spaces.length).assertEqual(2);
      expect(spaces[0] === spaces[1]).assertFalse();
      expect(spaces.indexOf(CoordinateSpace.PX)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PointerCoordinateSpaces_075, end');
    });
  });
}
