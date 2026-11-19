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
import {
  getDriver,
  logInfo,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  simulateTouch,
  pressAndWait,
  triggerEntryAbility,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  KEY_TAB,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum PointerCode {
  OK = 0,
  NEGATIVE_COORDINATE = 1,
  OUTSIDE_VIEWPORT = 2,
  DUPLICATE_POINTER_ID = 3,
  UNKNOWN_POINTER_ID = 4,
  POINTER_LIMIT_REACHED = 5,
  EMPTY_RECT = 6,
  INVALID_RADIUS = 7
}

enum HitZone {
  INSIDE = 'inside',
  BORDER = 'border',
  OUTSIDE = 'outside'
}

enum GestureKind {
  TAP = 'tap',
  LONG_PRESS = 'long_press',
  SWIPE = 'swipe',
  DRAG = 'drag',
  PINCH = 'pinch'
}

interface Point {
  x: number;
  y: number;
}

interface Rect {
  left: number;
  top: number;
  right: number;
  bottom: number;
}

interface Viewport {
  width: number;
  height: number;
}

interface PointerContact {
  pointerId: number;
  point: Point;
  kind: GestureKind;
}

interface NormalizedPoint {
  code: PointerCode;
  x: number;
  y: number;
}

interface HitResult {
  code: PointerCode;
  zone: HitZone;
  distance: number;
}

interface PointerStats {
  activeCount: number;
  maxActive: number;
  addedTotal: number;
  removedTotal: number;
  rejectedTotal: number;
}

function makePoint(x: number, y: number): Point {
  const point: Point = {
    x: x,
    y: y
  };
  return point;
}

function makeViewport(width: number, height: number): Viewport {
  const viewport: Viewport = {
    width: width,
    height: height
  };
  return viewport;
}

function makeRect(left: number, top: number, right: number, bottom: number): Rect {
  const rect: Rect = {
    left: left,
    top: top,
    right: right,
    bottom: bottom
  };
  return rect;
}

class PointerUtil {
  private viewport: Viewport;
  private contacts: PointerContact[] = [];
  private maxPointers: number;
  private addedTotal: number = 0;
  private removedTotal: number = 0;
  private rejectedTotal: number = 0;

  public constructor(viewport: Viewport, maxPointers: number) {
    this.viewport = viewport;
    this.maxPointers = maxPointers;
  }

  public getViewport(): Viewport {
    return this.viewport;
  }

  public setViewport(viewport: Viewport): void {
    this.viewport = viewport;
  }

  public normalize(x: number, y: number): NormalizedPoint {
    if (x < 0 || y < 0) {
      this.rejectedTotal++;
      const negative: NormalizedPoint = {
        code: PointerCode.NEGATIVE_COORDINATE,
        x: 0,
        y: 0
      };
      return negative;
    }
    if (x > this.viewport.width || y > this.viewport.height) {
      this.rejectedTotal++;
      const outside: NormalizedPoint = {
        code: PointerCode.OUTSIDE_VIEWPORT,
        x: this.clampPixel(x, this.viewport.width) / this.viewport.width,
        y: this.clampPixel(y, this.viewport.height) / this.viewport.height
      };
      return outside;
    }
    const normalized: NormalizedPoint = {
      code: PointerCode.OK,
      x: x / this.viewport.width,
      y: y / this.viewport.height
    };
    return normalized;
  }

  public denormalize(nx: number, ny: number): Point {
    const pixel: Point = {
      x: this.clampUnit(nx) * this.viewport.width,
      y: this.clampUnit(ny) * this.viewport.height
    };
    return pixel;
  }

  public clampPoint(point: Point): Point {
    const clamped: Point = {
      x: this.clampPixel(point.x, this.viewport.width),
      y: this.clampPixel(point.y, this.viewport.height)
    };
    return clamped;
  }

  public isInsideRect(rect: Rect, point: Point): HitResult {
    const width: number = rect.right - rect.left;
    const height: number = rect.bottom - rect.top;
    if (width <= 0 || height <= 0) {
      this.rejectedTotal++;
      const empty: HitResult = {
        code: PointerCode.EMPTY_RECT,
        zone: HitZone.OUTSIDE,
        distance: 0
      };
      return empty;
    }
    const centerX: number = rect.left + width / 2;
    const centerY: number = rect.top + height / 2;
    const distance: number = this.distance(point, makePoint(centerX, centerY));
    const insideX: boolean = point.x >= rect.left && point.x <= rect.right;
    const insideY: boolean = point.y >= rect.top && point.y <= rect.bottom;
    if (!insideX || !insideY) {
      const outside: HitResult = {
        code: PointerCode.OK,
        zone: HitZone.OUTSIDE,
        distance: distance
      };
      return outside;
    }
    const onEdge: boolean = point.x === rect.left || point.x === rect.right ||
      point.y === rect.top || point.y === rect.bottom;
    const inside: HitResult = {
      code: PointerCode.OK,
      zone: onEdge ? HitZone.BORDER : HitZone.INSIDE,
      distance: distance
    };
    return inside;
  }

  public distance(from: Point, to: Point): number {
    const dx: number = to.x - from.x;
    const dy: number = to.y - from.y;
    return Math.sqrt(dx * dx + dy * dy);
  }

  public angleDegrees(from: Point, to: Point): number {
    const dx: number = to.x - from.x;
    const dy: number = to.y - from.y;
    const radians: number = Math.atan2(dy, dx);
    let degrees: number = radians * 180 / Math.PI;
    if (degrees < 0) {
      degrees = degrees + 360;
    }
    return degrees;
  }

  public addPointer(pointerId: number, point: Point, kind: GestureKind): PointerCode {
    if (pointerId <= 0) {
      this.rejectedTotal++;
      return PointerCode.UNKNOWN_POINTER_ID;
    }
    if (this.indexOfPointer(pointerId) >= 0) {
      this.rejectedTotal++;
      return PointerCode.DUPLICATE_POINTER_ID;
    }
    if (this.contacts.length >= this.maxPointers) {
      this.rejectedTotal++;
      return PointerCode.POINTER_LIMIT_REACHED;
    }
    const contact: PointerContact = {
      pointerId: pointerId,
      point: point,
      kind: kind
    };
    this.contacts.push(contact);
    this.addedTotal++;
    return PointerCode.OK;
  }

  public removePointer(pointerId: number): PointerCode {
    const index: number = this.indexOfPointer(pointerId);
    if (index < 0) {
      this.rejectedTotal++;
      return PointerCode.UNKNOWN_POINTER_ID;
    }
    const kept: PointerContact[] = [];
    for (let i = 0; i < this.contacts.length; i++) {
      if (i !== index) {
        kept.push(this.contacts[i]);
      }
    }
    this.contacts = kept;
    this.removedTotal++;
    return PointerCode.OK;
  }

  public movePointer(pointerId: number, point: Point): PointerCode {
    const index: number = this.indexOfPointer(pointerId);
    if (index < 0) {
      this.rejectedTotal++;
      return PointerCode.UNKNOWN_POINTER_ID;
    }
    const moved: PointerContact = {
      pointerId: this.contacts[index].pointerId,
      point: point,
      kind: this.contacts[index].kind
    };
    this.contacts[index] = moved;
    return PointerCode.OK;
  }

  public getPointer(pointerId: number): PointerContact | null {
    const index: number = this.indexOfPointer(pointerId);
    if (index < 0) {
      return null;
    }
    return this.contacts[index];
  }

  public hasPointer(pointerId: number): boolean {
    return this.indexOfPointer(pointerId) >= 0;
  }

  public activeCount(): number {
    return this.contacts.length;
  }

  public getMaxPointers(): number {
    return this.maxPointers;
  }

  public centroid(): Point {
    if (this.contacts.length === 0) {
      const origin: Point = {
        x: 0,
        y: 0
      };
      return origin;
    }
    let sumX: number = 0;
    let sumY: number = 0;
    for (let i = 0; i < this.contacts.length; i++) {
      sumX += this.contacts[i].point.x;
      sumY += this.contacts[i].point.y;
    }
    const center: Point = {
      x: sumX / this.contacts.length,
      y: sumY / this.contacts.length
    };
    return center;
  }

  public spreadRadius(): number {
    if (this.contacts.length === 0) {
      return 0;
    }
    const center: Point = this.centroid();
    let maxDistance: number = 0;
    for (let i = 0; i < this.contacts.length; i++) {
      const current: number = this.distance(center, this.contacts[i].point);
      if (current > maxDistance) {
        maxDistance = current;
      }
    }
    return maxDistance;
  }

  public stats(): PointerStats {
    const stats: PointerStats = {
      activeCount: this.contacts.length,
      maxActive: this.maxPointers,
      addedTotal: this.addedTotal,
      removedTotal: this.removedTotal,
      rejectedTotal: this.rejectedTotal
    };
    return stats;
  }

  public clear(): void {
    this.contacts = [];
    this.addedTotal = 0;
    this.removedTotal = 0;
    this.rejectedTotal = 0;
  }

  private clampPixel(value: number, limit: number): number {
    if (value < 0) {
      return 0;
    }
    if (value > limit) {
      return limit;
    }
    return value;
  }

  private clampUnit(value: number): number {
    if (value < 0) {
      return 0;
    }
    if (value > 1) {
      return 1;
    }
    return value;
  }

  private indexOfPointer(pointerId: number): number {
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].pointerId === pointerId) {
        return i;
      }
    }
    return -1;
  }
}

export default function pointerUtilValidationTest(): void {
  describe('PointerUtilValidationTest', () => {
    let driver: Driver;
    let util: PointerUtil;

    beforeAll(async () => {
      driver = getDriver();
      util = new PointerUtil(makeViewport(1080, 2340), 10);
      logInfo('PointerUtilValidationTest: beforeAll start');
      await triggerEntryAbility(driver);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('PointerUtilValidationTest: beforeAll finished');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      driver = getDriver();
      await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
      logInfo('PointerUtilValidationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0100
     * @tc.name testPointerCodeEnumValues
     * @tc.desc Verify pointer status codes enumerate their documented numeric values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPointerCodeEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(PointerCode.OK).assertEqual(0);
        expect(PointerCode.NEGATIVE_COORDINATE).assertEqual(1);
        expect(PointerCode.OUTSIDE_VIEWPORT).assertEqual(2);
        expect(PointerCode.DUPLICATE_POINTER_ID).assertEqual(3);
        expect(PointerCode.UNKNOWN_POINTER_ID).assertEqual(4);
        expect(PointerCode.POINTER_LIMIT_REACHED).assertEqual(5);
        expect(PointerCode.EMPTY_RECT).assertEqual(6);
        expect(PointerCode.INVALID_RADIUS).assertEqual(7);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0200
     * @tc.name testHitZoneAndGestureEnums
     * @tc.desc Verify hit zone and gesture kind enums expose their declared string literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHitZoneAndGestureEnums', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(HitZone.INSIDE).assertEqual('inside');
        expect(HitZone.BORDER).assertEqual('border');
        expect(HitZone.OUTSIDE).assertEqual('outside');
        expect(GestureKind.TAP).assertEqual('tap');
        expect(GestureKind.LONG_PRESS).assertEqual('long_press');
        expect(GestureKind.SWIPE).assertEqual('swipe');
        expect(GestureKind.DRAG).assertEqual('drag');
        expect(GestureKind.PINCH).assertEqual('pinch');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0300
     * @tc.name testNormalizeCenterPoint
     * @tc.desc Verify the viewport center normalizes to exactly zero point five on both axes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalizeCenterPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const normalized: NormalizedPoint = util.normalize(540, 1170);
        expect(normalized.code).assertEqual(PointerCode.OK);
        expect(normalized.x).assertEqual(0.5);
        expect(normalized.y).assertEqual(0.5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0400
     * @tc.name testNormalizeOriginCorner
     * @tc.desc Verify the top-left origin normalizes to zero on both axes with OK status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalizeOriginCorner', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const normalized: NormalizedPoint = util.normalize(0, 0);
        expect(normalized.code).assertEqual(PointerCode.OK);
        expect(normalized.x).assertEqual(0);
        expect(normalized.y).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0500
     * @tc.name testNormalizeBottomRightCorner
     * @tc.desc Verify the bottom-right corner normalizes to exactly one on both axes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalizeBottomRightCorner', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const normalized: NormalizedPoint = util.normalize(1080, 2340);
        expect(normalized.code).assertEqual(PointerCode.OK);
        expect(normalized.x).assertEqual(1);
        expect(normalized.y).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0600
     * @tc.name testNormalizeQuarterPoints
     * @tc.desc Verify quarter and three-quarter pixel positions normalize to 0.25 and 0.75 respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalizeQuarterPoints', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const quarter: NormalizedPoint = util.normalize(270, 585);
        expect(quarter.x).assertEqual(0.25);
        expect(quarter.y).assertEqual(0.25);
        const threeQuarter: NormalizedPoint = util.normalize(810, 1755);
        expect(threeQuarter.x).assertEqual(0.75);
        expect(threeQuarter.y).assertEqual(0.75);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0700
     * @tc.name testNormalizeNegativeCoordinates
     * @tc.desc Verify negative coordinates are reported as negative and pinned to zero before normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalizeNegativeCoordinates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const negativeX: NormalizedPoint = util.normalize(-10, 100);
        expect(negativeX.code).assertEqual(PointerCode.NEGATIVE_COORDINATE);
        expect(negativeX.x).assertEqual(0);
        expect(negativeX.y).assertEqual(0);
        const negativeY: NormalizedPoint = util.normalize(100, -1);
        expect(negativeY.code).assertEqual(PointerCode.NEGATIVE_COORDINATE);
        expect(negativeY.y).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0800
     * @tc.name testNormalizeOverflowClampsToMax
     * @tc.desc Verify coordinates beyond the viewport are reported outside and clamped to the maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalizeOverflowClampsToMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const overflow: NormalizedPoint = util.normalize(2000, 3000);
        expect(overflow.code).assertEqual(PointerCode.OUTSIDE_VIEWPORT);
        expect(overflow.x).assertEqual(1);
        expect(overflow.y).assertEqual(1);
        const singleAxis: NormalizedPoint = util.normalize(1081, 1170);
        expect(singleAxis.code).assertEqual(PointerCode.OUTSIDE_VIEWPORT);
        expect(singleAxis.x).assertEqual(1);
        expect(singleAxis.y).assertEqual(0.5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_0900
     * @tc.name testDenormalizeRoundTrip
     * @tc.desc Verify normalized coordinates convert back to the original pixel position exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDenormalizeRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const pixel: Point = util.denormalize(0.5, 0.5);
        expect(pixel.x).assertEqual(540);
        expect(pixel.y).assertEqual(1170);
        const origin: Point = util.denormalize(0, 0);
        expect(origin.x).assertEqual(0);
        expect(origin.y).assertEqual(0);
        const corner: Point = util.denormalize(1, 1);
        expect(corner.x).assertEqual(1080);
        expect(corner.y).assertEqual(2340);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1000
     * @tc.name testDenormalizeClampsUnitRange
     * @tc.desc Verify normalized values below zero and above one are clamped into the valid unit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDenormalizeClampsUnitRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const below: Point = util.denormalize(-0.5, -2);
        expect(below.x).assertEqual(0);
        expect(below.y).assertEqual(0);
        const above: Point = util.denormalize(1.5, 2.5);
        expect(above.x).assertEqual(1080);
        expect(above.y).assertEqual(2340);
        const mid: Point = util.denormalize(0.25, 0.75);
        expect(mid.x).assertEqual(270);
        expect(mid.y).assertEqual(1755);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1100
     * @tc.name testClampPointBoundaries
     * @tc.desc Verify point clamping pins negatives to zero keeps in-range values and caps overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClampPointBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const negative: Point = util.clampPoint(makePoint(-100, -50));
        expect(negative.x).assertEqual(0);
        expect(negative.y).assertEqual(0);
        const overflow: Point = util.clampPoint(makePoint(5000, 9000));
        expect(overflow.x).assertEqual(1080);
        expect(overflow.y).assertEqual(2340);
        const inside: Point = util.clampPoint(makePoint(300, 400));
        expect(inside.x).assertEqual(300);
        expect(inside.y).assertEqual(400);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1200
     * @tc.name testRectContainsCenter
     * @tc.desc Verify a point at the rect center is reported inside with a zero distance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRectContainsCenter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const rect: Rect = makeRect(100, 200, 300, 400);
        const result: HitResult = util.isInsideRect(rect, makePoint(200, 300));
        expect(result.code).assertEqual(PointerCode.OK);
        expect(result.zone).assertEqual(HitZone.INSIDE);
        expect(result.distance).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1300
     * @tc.name testRectContainsBorder
     * @tc.desc Verify a point exactly on the left edge is reported as border rather than inside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRectContainsBorder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const rect: Rect = makeRect(100, 200, 300, 400);
        const leftEdge: HitResult = util.isInsideRect(rect, makePoint(100, 300));
        expect(leftEdge.zone).assertEqual(HitZone.BORDER);
        const bottomEdge: HitResult = util.isInsideRect(rect, makePoint(200, 400));
        expect(bottomEdge.zone).assertEqual(HitZone.BORDER);
        expect(leftEdge.distance).assertEqual(100);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1400
     * @tc.name testRectRejectsOutsidePoint
     * @tc.desc Verify points to the left or below the rect are reported outside with a positive distance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRectRejectsOutsidePoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const rect: Rect = makeRect(100, 200, 300, 400);
        const left: HitResult = util.isInsideRect(rect, makePoint(50, 300));
        expect(left.zone).assertEqual(HitZone.OUTSIDE);
        expect(left.distance > 0).assertTrue();
        const below: HitResult = util.isInsideRect(rect, makePoint(200, 500));
        expect(below.zone).assertEqual(HitZone.OUTSIDE);
        expect(below.distance).assertEqual(200);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1500
     * @tc.name testRectEmptyRejected
     * @tc.desc Verify a zero-width rect is rejected with empty-rect code and an outside zone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRectEmptyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const degenerated: Rect = makeRect(100, 200, 100, 400);
        const result: HitResult = util.isInsideRect(degenerated, makePoint(100, 300));
        expect(result.code).assertEqual(PointerCode.EMPTY_RECT);
        expect(result.zone).assertEqual(HitZone.OUTSIDE);
        const inverted: Rect = makeRect(300, 400, 100, 200);
        expect(util.isInsideRect(inverted, makePoint(200, 300)).code).assertEqual(PointerCode.EMPTY_RECT);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1600
     * @tc.name testDistanceAxisAligned
     * @tc.desc Verify axis-aligned distances equal the plain coordinate delta on both axes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDistanceAxisAligned', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const origin: Point = makePoint(0, 0);
        expect(util.distance(origin, makePoint(3, 0))).assertEqual(3);
        expect(util.distance(origin, makePoint(0, 4))).assertEqual(4);
        expect(util.distance(makePoint(10, 10), makePoint(10, 10))).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1700
     * @tc.name testDistanceDiagonalTriangle
     * @tc.desc Verify a three-four-five triangle yields a hypotenuse of exactly five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDistanceDiagonalTriangle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const from: Point = makePoint(0, 0);
        const to: Point = makePoint(3, 4);
        expect(util.distance(from, to)).assertEqual(5);
        const reversed: number = util.distance(to, from);
        expect(reversed).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1800
     * @tc.name testAngleCardinalDirections
     * @tc.desc Verify the four cardinal directions map to zero ninety one-eighty and two-seventy degrees
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAngleCardinalDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const origin: Point = makePoint(0, 0);
        expect(util.angleDegrees(origin, makePoint(10, 0))).assertEqual(0);
        expect(util.angleDegrees(origin, makePoint(0, 10))).assertEqual(90);
        expect(util.angleDegrees(origin, makePoint(-10, 0))).assertEqual(180);
        expect(util.angleDegrees(origin, makePoint(0, -10))).assertEqual(270);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_1900
     * @tc.name testAngleDiagonalQuadrants
     * @tc.desc Verify diagonal vectors in each quadrant yield the expected forty-five degree angles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAngleDiagonalQuadrants', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const origin: Point = makePoint(0, 0);
        expect(util.angleDegrees(origin, makePoint(10, 10))).assertEqual(45);
        expect(util.angleDegrees(origin, makePoint(-10, 10))).assertEqual(135);
        expect(util.angleDegrees(origin, makePoint(-10, -10))).assertEqual(225);
        expect(util.angleDegrees(origin, makePoint(10, -10))).assertEqual(315);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2000
     * @tc.name testAddPointerSuccess
     * @tc.desc Verify adding one pointer returns OK and exposes it by id with the requested gesture kind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAddPointerSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        const status: PointerCode = local.addPointer(1, makePoint(100, 200), GestureKind.TAP);
        expect(status).assertEqual(PointerCode.OK);
        expect(local.activeCount()).assertEqual(1);
        expect(local.hasPointer(1)).assertTrue();
        const contact: PointerContact | null = local.getPointer(1);
        expect(contact === null).assertFalse();
        if (contact !== null) {
          expect(contact.kind).assertEqual(GestureKind.TAP);
          expect(contact.point.x).assertEqual(100);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2100
     * @tc.name testAddPointerDuplicateId
     * @tc.desc Verify a second add with the same pointer id is rejected as duplicate and leaves count intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAddPointerDuplicateId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        local.addPointer(7, makePoint(10, 10), GestureKind.TAP);
        const duplicate: PointerCode = local.addPointer(7, makePoint(20, 20), GestureKind.DRAG);
        expect(duplicate).assertEqual(PointerCode.DUPLICATE_POINTER_ID);
        expect(local.activeCount()).assertEqual(1);
        const contact: PointerContact | null = local.getPointer(7);
        if (contact !== null) {
          expect(contact.kind).assertEqual(GestureKind.TAP);
          expect(contact.point.x).assertEqual(10);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2200
     * @tc.name testAddPointerInvalidId
     * @tc.desc Verify zero and negative pointer ids are rejected as unknown pointer ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAddPointerInvalidId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        expect(local.addPointer(0, makePoint(1, 1), GestureKind.TAP)).assertEqual(PointerCode.UNKNOWN_POINTER_ID);
        expect(local.addPointer(-4, makePoint(1, 1), GestureKind.TAP)).assertEqual(PointerCode.UNKNOWN_POINTER_ID);
        expect(local.activeCount()).assertEqual(0);
        expect(local.stats().rejectedTotal).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2300
     * @tc.name testPointerLimitEnforced
     * @tc.desc Verify a third add beyond a two-pointer limit is rejected and the active count stays at two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPointerLimitEnforced', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 2);
        expect(local.addPointer(1, makePoint(10, 10), GestureKind.TAP)).assertEqual(PointerCode.OK);
        expect(local.addPointer(2, makePoint(20, 20), GestureKind.TAP)).assertEqual(PointerCode.OK);
        expect(local.addPointer(3, makePoint(30, 30), GestureKind.TAP)).assertEqual(PointerCode.POINTER_LIMIT_REACHED);
        expect(local.activeCount()).assertEqual(2);
        expect(local.hasPointer(3)).assertFalse();
        expect(local.getMaxPointers()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2400
     * @tc.name testRemovePointerFreesSlot
     * @tc.desc Verify removing one of two pointers frees a slot so a third pointer can be added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRemovePointerFreesSlot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 2);
        local.addPointer(1, makePoint(10, 10), GestureKind.TAP);
        local.addPointer(2, makePoint(20, 20), GestureKind.TAP);
        expect(local.removePointer(1)).assertEqual(PointerCode.OK);
        expect(local.activeCount()).assertEqual(1);
        expect(local.addPointer(3, makePoint(30, 30), GestureKind.SWIPE)).assertEqual(PointerCode.OK);
        expect(local.activeCount()).assertEqual(2);
        expect(local.stats().removedTotal).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2500
     * @tc.name testRemoveUnknownPointer
     * @tc.desc Verify removing a pointer id that is not active reports unknown pointer id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRemoveUnknownPointer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        local.addPointer(1, makePoint(10, 10), GestureKind.TAP);
        expect(local.removePointer(99)).assertEqual(PointerCode.UNKNOWN_POINTER_ID);
        expect(local.activeCount()).assertEqual(1);
        expect(local.stats().removedTotal).assertEqual(0);
        expect(local.stats().rejectedTotal).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2600
     * @tc.name testMovePointerUpdatesPosition
     * @tc.desc Verify moving an active pointer updates its coordinates and preserves the gesture kind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMovePointerUpdatesPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        local.addPointer(1, makePoint(10, 20), GestureKind.DRAG);
        const moved: PointerCode = local.movePointer(1, makePoint(300, 400));
        expect(moved).assertEqual(PointerCode.OK);
        const contact: PointerContact | null = local.getPointer(1);
        if (contact !== null) {
          expect(contact.point.x).assertEqual(300);
          expect(contact.point.y).assertEqual(400);
          expect(contact.kind).assertEqual(GestureKind.DRAG);
        }
        expect(local.activeCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2700
     * @tc.name testMoveUnknownPointer
     * @tc.desc Verify moving a pointer id that is not active reports unknown pointer id and changes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMoveUnknownPointer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        local.addPointer(1, makePoint(10, 20), GestureKind.TAP);
        expect(local.movePointer(2, makePoint(500, 600))).assertEqual(PointerCode.UNKNOWN_POINTER_ID);
        const contact: PointerContact | null = local.getPointer(1);
        if (contact !== null) {
          expect(contact.point.x).assertEqual(10);
        }
        expect(local.stats().rejectedTotal).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2800
     * @tc.name testCentroidOfEmptyContacts
     * @tc.desc Verify the centroid of an empty contact set is the origin with a zero spread radius
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCentroidOfEmptyContacts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        const center: Point = local.centroid();
        expect(center.x).assertEqual(0);
        expect(center.y).assertEqual(0);
        expect(local.spreadRadius()).assertEqual(0);
        expect(local.activeCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_2900
     * @tc.name testCentroidOfTwoContacts
     * @tc.desc Verify the centroid of two symmetric contacts is the midpoint and the spread equals half the gap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCentroidOfTwoContacts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        local.addPointer(1, makePoint(100, 100), GestureKind.PINCH);
        local.addPointer(2, makePoint(300, 100), GestureKind.PINCH);
        const center: Point = local.centroid();
        expect(center.x).assertEqual(200);
        expect(center.y).assertEqual(100);
        expect(local.spreadRadius()).assertEqual(100);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3000
     * @tc.name testCentroidOfThreeContacts
     * @tc.desc Verify the centroid of three collinear contacts equals the middle contact position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCentroidOfThreeContacts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        local.addPointer(1, makePoint(0, 0), GestureKind.PINCH);
        local.addPointer(2, makePoint(30, 60), GestureKind.PINCH);
        local.addPointer(3, makePoint(60, 120), GestureKind.PINCH);
        const center: Point = local.centroid();
        expect(center.x).assertEqual(30);
        expect(center.y).assertEqual(60);
        expect(local.activeCount()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3100
     * @tc.name testStatsAccounting
     * @tc.desc Verify stats track additions removals and rejections without double counting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStatsAccounting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 3);
        local.addPointer(1, makePoint(10, 10), GestureKind.TAP);
        local.addPointer(2, makePoint(20, 20), GestureKind.TAP);
        local.addPointer(2, makePoint(20, 20), GestureKind.TAP);
        local.removePointer(1);
        local.removePointer(1);
        const stats: PointerStats = local.stats();
        expect(stats.activeCount).assertEqual(1);
        expect(stats.maxActive).assertEqual(3);
        expect(stats.addedTotal).assertEqual(2);
        expect(stats.removedTotal).assertEqual(1);
        expect(stats.rejectedTotal).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3200
     * @tc.name testClearResetsContactsAndCounters
     * @tc.desc Verify clear drops all contacts and resets addition removal and rejection counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearResetsContactsAndCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 5);
        local.addPointer(1, makePoint(10, 10), GestureKind.TAP);
        local.addPointer(2, makePoint(20, 20), GestureKind.TAP);
        local.removePointer(1);
        local.addPointer(2, makePoint(20, 20), GestureKind.TAP);
        expect(local.activeCount()).assertEqual(1);
        local.clear();
        expect(local.activeCount()).assertEqual(0);
        expect(local.hasPointer(2)).assertFalse();
        const stats: PointerStats = local.stats();
        expect(stats.addedTotal).assertEqual(0);
        expect(stats.removedTotal).assertEqual(0);
        expect(stats.rejectedTotal).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3300
     * @tc.name testViewportChangeRecomputesNormalization
     * @tc.desc Verify changing the viewport updates normalization ratios while preserving pixel semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testViewportChangeRecomputesNormalization', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(100, 200), 5);
        const before: NormalizedPoint = local.normalize(50, 100);
        expect(before.x).assertEqual(0.5);
        expect(before.y).assertEqual(0.5);
        local.setViewport(makeViewport(200, 200));
        expect(local.getViewport().width).assertEqual(200);
        const after: NormalizedPoint = local.normalize(50, 100);
        expect(after.x).assertEqual(0.25);
        expect(after.y).assertEqual(0.5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3400
     * @tc.name testHitTestAcrossMultipleRects
     * @tc.desc Verify one point hits exactly one of three stacked rects and misses the other two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHitTestAcrossMultipleRects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const rects: Rect[] = [
          makeRect(0, 0, 100, 100),
          makeRect(100, 0, 200, 100),
          makeRect(200, 0, 300, 100)
        ];
        const point: Point = makePoint(150, 50);
        let insideCount: number = 0;
        let hitIndex: number = -1;
        for (let i = 0; i < rects.length; i++) {
          const result: HitResult = util.isInsideRect(rects[i], point);
          if (result.zone === HitZone.INSIDE) {
            insideCount++;
            hitIndex = i;
          }
        }
        expect(insideCount).assertEqual(1);
        expect(hitIndex).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3500
     * @tc.name testPointerChurnStress
     * @tc.desc Verify fifty add-remove cycles leave zero active contacts and balanced counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPointerChurnStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(1080, 2340), 4);
        for (let i = 0; i < 50; i++) {
          const status: PointerCode = local.addPointer(1, makePoint(i, i), GestureKind.TAP);
          expect(status).assertEqual(PointerCode.OK);
          const removed: PointerCode = local.removePointer(1);
          expect(removed).assertEqual(PointerCode.OK);
        }
        expect(local.activeCount()).assertEqual(0);
        const stats: PointerStats = local.stats();
        expect(stats.addedTotal).assertEqual(50);
        expect(stats.removedTotal).assertEqual(50);
        expect(stats.rejectedTotal).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3600
     * @tc.name testUiPageVisibleForPointerProbe
     * @tc.desc Verify the index page is visible before dispatching real pointer events from the driver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageVisibleForPointerProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3700
     * @tc.name testUiCenterTapSmoke
     * @tc.desc Verify a real center tap on the live window leaves the index page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiCenterTapSmoke', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const viewport: Viewport = local.getViewport();
        const center: Point = local.denormalize(0.5, 0.5);
        expect(center.x).assertEqual(viewport.width / 2);
        expect(center.y).assertEqual(viewport.height / 2);
        await simulateTouch(driver, center.x, center.y);
        await driver.delayMs(DELAY_TOUCH_EVENT);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3800
     * @tc.name testUiTapGridKeepsPageAlive
     * @tc.desc Verify tapping four normalized grid points keeps the page visible and components present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTapGridKeepsPageAlive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const ratios: number[] = [0.25, 0.5, 0.75];
        for (let i = 0; i < ratios.length; i++) {
          const point: Point = local.denormalize(ratios[i], ratios[i]);
          const normalized: NormalizedPoint = local.normalize(point.x, point.y);
          expect(normalized.code).assertEqual(PointerCode.OK);
          await simulateTouch(driver, point.x, point.y);
        }
        await driver.delayMs(DELAY_TOUCH_EVENT);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_3900
     * @tc.name testUiCornerTapClampedIntoViewport
     * @tc.desc Verify an over-large coordinate clamps into the viewport before the real tap is dispatched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiCornerTapClampedIntoViewport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const viewport: Viewport = local.getViewport();
        const overflow: Point = local.clampPoint(makePoint(viewport.width + 500, viewport.height + 500));
        expect(overflow.x).assertEqual(viewport.width);
        expect(overflow.y).assertEqual(viewport.height);
        await simulateTouch(driver, overflow.x, overflow.y);
        await driver.delayMs(DELAY_TOUCH_EVENT);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4000
     * @tc.name testUiHitTestAgainstWindowRect
     * @tc.desc Verify the window rect constructed from the viewport reports its center as inside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiHitTestAgainstWindowRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const viewport: Viewport = local.getViewport();
        const windowRect: Rect = makeRect(0, 0, viewport.width, viewport.height);
        const centerPoint: Point = local.denormalize(0.5, 0.5);
        const hit: HitResult = util.isInsideRect(windowRect, centerPoint);
        expect(hit.code).assertEqual(PointerCode.OK);
        expect(hit.zone).assertEqual(HitZone.INSIDE);
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4100
     * @tc.name testUiPointerContactAfterRealTouch
     * @tc.desc Verify a contact registered around the real touch point stays addressable by its pointer id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPointerContactAfterRealTouch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const center: Point = local.denormalize(0.5, 0.5);
        await simulateTouch(driver, center.x, center.y);
        expect(local.addPointer(11, center, GestureKind.TAP)).assertEqual(PointerCode.OK);
        const contact: PointerContact | null = local.getPointer(11);
        expect(contact === null).assertFalse();
        if (contact !== null) {
          expect(contact.point.x).assertEqual(center.x);
          expect(contact.kind).assertEqual(GestureKind.TAP);
        }
        expect(local.removePointer(11)).assertEqual(PointerCode.OK);
        expect(local.activeCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4200
     * @tc.name testUiTapAndNormalizeLivePoint
     * @tc.desc Verify a real tap point converted to normalized form round-trips back to the same pixel pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTapAndNormalizeLivePoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const tapPoint: Point = local.denormalize(0.5, 0.75);
        expect(tapPoint.x).assertEqual(180);
        expect(tapPoint.y).assertEqual(480);
        const normalized: NormalizedPoint = local.normalize(tapPoint.x, tapPoint.y);
        expect(normalized.code).assertEqual(PointerCode.OK);
        expect(normalized.x).assertEqual(0.5);
        expect(normalized.y).assertEqual(0.75);
        await simulateTouch(driver, tapPoint.x, tapPoint.y);
        await driver.delayMs(DELAY_TOUCH_EVENT);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4300
     * @tc.name testUiHitTestLiveCenterInsideWindow
     * @tc.desc Verify the live window rect contains its center point and rejects a point below the bottom edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiHitTestLiveCenterInsideWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const windowRect: Rect = makeRect(0, 0, 360, 640);
        const inside: HitResult = local.isInsideRect(windowRect, makePoint(180, 320));
        expect(inside.zone).assertEqual(HitZone.INSIDE);
        const below: HitResult = local.isInsideRect(windowRect, makePoint(180, 700));
        expect(below.zone).assertEqual(HitZone.OUTSIDE);
        expect(below.distance > 0).assertTrue();
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4400
     * @tc.name testUiMultiTouchContactsOnLivePage
     * @tc.desc Verify three simulated contacts over the live page produce a bounded centroid and spread radius
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMultiTouchContactsOnLivePage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        expect(local.addPointer(1, makePoint(100, 200), GestureKind.PINCH)).assertEqual(PointerCode.OK);
        expect(local.addPointer(2, makePoint(260, 200), GestureKind.PINCH)).assertEqual(PointerCode.OK);
        expect(local.addPointer(3, makePoint(180, 440), GestureKind.PINCH)).assertEqual(PointerCode.OK);
        const center: Point = local.centroid();
        expect(center.x).assertEqual(180);
        expect(center.y).assertEqual(280);
        expect(local.spreadRadius()).assertEqual(160);
        await simulateTouch(driver, center.x, center.y);
        await driver.delayMs(DELAY_TOUCH_EVENT);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(local.activeCount()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4500
     * @tc.name testUiAngleBetweenLivePoints
     * @tc.desc Verify the angle and distance between two live-screen points match the geometric expectation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiAngleBetweenLivePoints', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const start: Point = local.denormalize(0.25, 0.25);
        const end: Point = local.denormalize(0.5, 0.25);
        expect(start.x).assertEqual(90);
        expect(end.x).assertEqual(180);
        expect(local.distance(start, end)).assertEqual(90);
        expect(local.angleDegrees(start, end)).assertEqual(0);
        const down: Point = local.denormalize(0.25, 0.5);
        expect(local.angleDegrees(start, down)).assertEqual(90);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4600
     * @tc.name testUiSwipePathAcrossLiveViewport
     * @tc.desc Verify a normalized swipe path touches the live window at each sampled step without clipping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSwipePathAcrossLiveViewport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const steps: number = 3;
        for (let i = 0; i < steps; i++) {
          const ratio: number = i / steps;
          const point: Point = local.denormalize(ratio, 0.5);
          expect(point.x >= 0).assertTrue();
          expect(point.x <= 360).assertTrue();
          await simulateTouch(driver, point.x, point.y);
        }
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(local.stats().rejectedTotal).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4700
     * @tc.name testUiPinchSpreadOnLivePage
     * @tc.desc Verify a two finger pinch around the live center reports a stable centroid and positive spread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPinchSpreadOnLivePage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const center: Point = local.denormalize(0.5, 0.5);
        await simulateTouch(driver, center.x, center.y);
        expect(local.addPointer(1, makePoint(center.x - 40, center.y), GestureKind.PINCH)).assertEqual(PointerCode.OK);
        expect(local.addPointer(2, makePoint(center.x + 40, center.y), GestureKind.PINCH)).assertEqual(PointerCode.OK);
        const centroid: Point = local.centroid();
        expect(centroid.x).assertEqual(center.x);
        expect(centroid.y).assertEqual(center.y);
        expect(local.spreadRadius()).assertEqual(40);
        expect(local.stats().activeCount).assertEqual(2);
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4800
     * @tc.name testUiDragContactPathOnLivePage
     * @tc.desc Verify a drag contact moved across live touch points keeps its identifier and final position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDragContactPathOnLivePage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const start: Point = local.denormalize(0.25, 0.5);
        expect(local.addPointer(21, start, GestureKind.DRAG)).assertEqual(PointerCode.OK);
        await simulateTouch(driver, start.x, start.y);
        const middle: Point = local.denormalize(0.5, 0.5);
        expect(local.movePointer(21, middle)).assertEqual(PointerCode.OK);
        await simulateTouch(driver, middle.x, middle.y);
        const end: Point = local.denormalize(0.75, 0.5);
        expect(local.movePointer(21, end)).assertEqual(PointerCode.OK);
        const contact: PointerContact | null = local.getPointer(21);
        expect(contact === null).assertFalse();
        if (contact !== null) {
          expect(contact.point.x).assertEqual(270);
          expect(contact.kind).assertEqual(GestureKind.DRAG);
        }
        expect(local.stats().rejectedTotal).assertEqual(0);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_POINTER_4900
     * @tc.name testUiLongPressContactInsideWindowRect
     * @tc.desc Verify a long press contact registered at the live center falls inside the window hit rect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiLongPressContactInsideWindowRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: PointerUtil = new PointerUtil(makeViewport(360, 640), 5);
        const center: Point = local.denormalize(0.5, 0.5);
        await simulateTouch(driver, center.x, center.y);
        expect(local.addPointer(31, center, GestureKind.LONG_PRESS)).assertEqual(PointerCode.OK);
        const windowRect: Rect = makeRect(0, 0, 360, 640);
        const hit: HitResult = local.isInsideRect(windowRect, center);
        expect(hit.zone).assertEqual(HitZone.INSIDE);
        expect(hit.distance).assertEqual(0);
        const corner: Point = local.denormalize(0, 1);
        expect(local.isInsideRect(windowRect, corner).zone).assertEqual(HitZone.BORDER);
        expect(local.removePointer(31)).assertEqual(PointerCode.OK);
        expect(local.activeCount()).assertEqual(0);
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } finally {
        done();
      }
    })
  })
}
