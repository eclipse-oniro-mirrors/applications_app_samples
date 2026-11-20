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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import common2D from '@ohos.graphics.common2D';

const DOMAIN: number = 0xF814;
const TAG: string = 'DrawingGeometryCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

interface DrawingRect4 {
  left: number;
  top: number;
  right: number;
  bottom: number;
}

interface DrawingPoint2 {
  x: number;
  y: number;
}

function makeRect(left: number, top: number, right: number, bottom: number): DrawingRect4 {
  const rect: DrawingRect4 = { left: left, top: top, right: right, bottom: bottom };
  return rect;
}

function makePoint(x: number, y: number): DrawingPoint2 {
  const point: DrawingPoint2 = { x: x, y: y };
  return point;
}

function rectWidth(rect: DrawingRect4): number {
  return rect.right - rect.left;
}

function rectHeight(rect: DrawingRect4): number {
  return rect.bottom - rect.top;
}

function rectArea(rect: DrawingRect4): number {
  return rectWidth(rect) * rectHeight(rect);
}

function rectCenter(rect: DrawingRect4): DrawingPoint2 {
  return makePoint((rect.left + rect.right) / 2, (rect.top + rect.bottom) / 2);
}

function rectIsValid(rect: DrawingRect4): boolean {
  return rect.right >= rect.left && rect.bottom >= rect.top;
}

function rectsIntersect(a: DrawingRect4, b: DrawingRect4): boolean {
  return a.left <= b.right && b.left <= a.right && a.top <= b.bottom && b.top <= a.bottom;
}

function intersectRect(a: DrawingRect4, b: DrawingRect4): DrawingRect4 | null {
  if (!rectsIntersect(a, b)) {
    return null;
  }
  return makeRect(Math.max(a.left, b.left), Math.max(a.top, b.top),
    Math.min(a.right, b.right), Math.min(a.bottom, b.bottom));
}

function containsPoint(rect: DrawingRect4, point: DrawingPoint2): boolean {
  return point.x >= rect.left && point.x <= rect.right && point.y >= rect.top && point.y <= rect.bottom;
}

function clampPointToRect(point: DrawingPoint2, rect: DrawingRect4): DrawingPoint2 {
  const x: number = Math.min(Math.max(point.x, rect.left), rect.right);
  const y: number = Math.min(Math.max(point.y, rect.top), rect.bottom);
  return makePoint(x, y);
}

function midpoint(a: DrawingPoint2, b: DrawingPoint2): DrawingPoint2 {
  return makePoint((a.x + b.x) / 2, (a.y + b.y) / 2);
}

function distance(a: DrawingPoint2, b: DrawingPoint2): number {
  const dx: number = a.x - b.x;
  const dy: number = a.y - b.y;
  return Math.sqrt(dx * dx + dy * dy);
}

function pointOnCircle(center: DrawingPoint2, radius: number, angleDeg: number): DrawingPoint2 {
  const rad: number = angleDeg * Math.PI / 180;
  return makePoint(center.x + radius * Math.cos(rad), center.y + radius * Math.sin(rad));
}

function pentagonVertex(center: DrawingPoint2, sideLength: number, index: number): DrawingPoint2 {
  const angle: number = (2 * Math.PI / 5) * index;
  const x: number = center.x + sideLength * Math.cos(angle - 60);
  const y: number = center.y - sideLength * Math.sin(angle - 60);
  return makePoint(x, y);
}

function starVertex(centerX: number, centerY: number, outerRadius: number, innerRadius: number,
  index: number): DrawingPoint2 {
  const angle: number = (index * Math.PI) / 5;
  const radius: number = index % 2 === 0 ? outerRadius : innerRadius;
  const x: number = centerX + radius * Math.cos(angle + 60.0);
  const y: number = centerY + radius * Math.sin(angle + 60.0);
  return makePoint(x, y);
}

function scalePoint(point: DrawingPoint2, sx: number, sy: number): DrawingPoint2 {
  return makePoint(point.x * sx, point.y * sy);
}

function translatePoint(point: DrawingPoint2, dx: number, dy: number): DrawingPoint2 {
  return makePoint(point.x + dx, point.y + dy);
}

function rotatePointDeg(point: DrawingPoint2, angleDeg: number, pivot: DrawingPoint2): DrawingPoint2 {
  const rad: number = angleDeg * Math.PI / 180;
  const dx: number = point.x - pivot.x;
  const dy: number = point.y - pivot.y;
  const rx: number = dx * Math.cos(rad) - dy * Math.sin(rad);
  const ry: number = dx * Math.sin(rad) + dy * Math.cos(rad);
  return makePoint(pivot.x + rx, pivot.y + ry);
}

function cubicBezierPoint(p0: DrawingPoint2, p1: DrawingPoint2, p2: DrawingPoint2, p3: DrawingPoint2,
  t: number): DrawingPoint2 {
  const mt: number = 1 - t;
  const x: number = mt * mt * mt * p0.x + 3 * mt * mt * t * p1.x + 3 * mt * t * t * p2.x + t * t * t * p3.x;
  const y: number = mt * mt * mt * p0.y + 3 * mt * mt * t * p1.y + 3 * mt * t * t * p2.y + t * t * t * p3.y;
  return makePoint(x, y);
}

function copyRectToCommon2D(rect: DrawingRect4): common2D.Rect {
  const out: common2D.Rect = { left: rect.left, top: rect.top, right: rect.right, bottom: rect.bottom };
  return out;
}

export default function drawingGeometryCoreTest(): void {
  describe('DrawingGeometryCoreTest', () => {
    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0201
     * @tc.name      testDrawingGeometry0201
     * @tc.desc      Verify makeRect stores the sample DrawRect bounds exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0201 begin');
      const rect: DrawingRect4 = makeRect(20, 150, 300, 250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.left=${rect.left}, expected=20`);
      expect(rect.left).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.top=${rect.top}, expected=150`);
      expect(rect.top).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.right=${rect.right}, expected=300`);
      expect(rect.right).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.bottom=${rect.bottom}, expected=250`);
      expect(rect.bottom).assertEqual(250);
      log('testDrawingGeometry0201 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0202
     * @tc.name      testDrawingGeometry0202
     * @tc.desc      Verify makeRect returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0202 begin');
      const rect: DrawingRect4 = makeRect(0, 0, 10, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof rect=${typeof rect}, expected='object'`);
      expect(typeof rect).assertEqual('object');
      log('testDrawingGeometry0202 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0203
     * @tc.name      testDrawingGeometry0203
     * @tc.desc      Verify rectWidth equals right minus left.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0203 begin');
      const width: number = rectWidth(makeRect(20, 150, 300, 250));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual width=${width}, expected=280`);
      expect(width).assertEqual(280);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof width=${typeof width}, expected='number'`);
      expect(typeof width).assertEqual('number');
      log('testDrawingGeometry0203 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0204
     * @tc.name      testDrawingGeometry0204
     * @tc.desc      Verify rectHeight equals bottom minus top.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0204 begin');
      const height: number = rectHeight(makeRect(20, 150, 300, 250));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual height=${height}, expected=100`);
      expect(height).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof height=${typeof height}, expected='number'`);
      expect(typeof height).assertEqual('number');
      log('testDrawingGeometry0204 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0205
     * @tc.name      testDrawingGeometry0205
     * @tc.desc      Verify degenerate zero-size rect has zero width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0205 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${rectWidth(makeRect(10, 10, 10, 10))}, expected=0`);
      expect(rectWidth(makeRect(10, 10, 10, 10))).assertEqual(0);
      log('testDrawingGeometry0205 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0206
     * @tc.name      testDrawingGeometry0206
     * @tc.desc      Verify rectCenter computes the exact midpoint of sample bounds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0206 begin');
      const center: DrawingPoint2 = rectCenter(makeRect(20, 150, 300, 250));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual center.x=${center.x}, expected=160`);
      expect(center.x).assertEqual(160);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual center.y=${center.y}, expected=200`);
      expect(center.y).assertEqual(200);
      log('testDrawingGeometry0206 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0207
     * @tc.name      testDrawingGeometry0207
     * @tc.desc      Verify rectCenter of the unit square equals its own corner.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0207 begin');
      const center: DrawingPoint2 = rectCenter(makeRect(0, 0, 2, 2));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual center.x=${center.x}, expected=1`);
      expect(center.x).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual center.y=${center.y}, expected=1`);
      expect(center.y).assertEqual(1);
      log('testDrawingGeometry0207 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0208
     * @tc.name      testDrawingGeometry0208
     * @tc.desc      Verify rectIsValid accepts a well formed rect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0208 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${rectIsValid(makeRect(20, 150, 300, 250))}`);
      expect(rectIsValid(makeRect(20, 150, 300, 250))).assertTrue();
      log('testDrawingGeometry0208 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0209
     * @tc.name      testDrawingGeometry0209
     * @tc.desc      Verify rectIsValid rejects inverted right edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0209 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${rectIsValid(makeRect(300, 150, 20, 250))}`);
      expect(rectIsValid(makeRect(300, 150, 20, 250))).assertFalse();
      log('testDrawingGeometry0209 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0210
     * @tc.name      testDrawingGeometry0210
     * @tc.desc      Verify rectIsValid rejects inverted bottom edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0210 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${rectIsValid(makeRect(20, 250, 300, 150))}`);
      expect(rectIsValid(makeRect(20, 250, 300, 150))).assertFalse();
      log('testDrawingGeometry0210 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0211
     * @tc.name      testDrawingGeometry0211
     * @tc.desc      Verify rectIsValid accepts a degenerate zero-size rect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0211 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${rectIsValid(makeRect(10, 10, 10, 10))}`);
      expect(rectIsValid(makeRect(10, 10, 10, 10))).assertTrue();
      log('testDrawingGeometry0211 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0212
     * @tc.name      testDrawingGeometry0212
     * @tc.desc      Verify rectIsValid rejects negative width rect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0212 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${rectIsValid(makeRect(50, 100, 40, 200))}`);
      expect(rectIsValid(makeRect(50, 100, 40, 200))).assertFalse();
      log('testDrawingGeometry0212 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0213
     * @tc.name      testDrawingGeometry0213
     * @tc.desc      Verify rectsIntersect detects partial overlap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0213 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rectsIntersect(makeRect(0, 0, 100, 100), makeRect(50, 50, ...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 100), makeRect(50, 50, 150, 150))).assertTrue();
      log('testDrawingGeometry0213 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0214
     * @tc.name      testDrawingGeometry0214
     * @tc.desc      Verify rectsIntersect is true for identical rects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0214 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rectsIntersect(makeRect(10, 10, 40, 40), makeRect(10, 10, ...`);
      expect(rectsIntersect(makeRect(10, 10, 40, 40), makeRect(10, 10, 40, 40))).assertTrue();
      log('testDrawingGeometry0214 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0215
     * @tc.name      testDrawingGeometry0215
     * @tc.desc      Verify rectsIntersect is true for contained rect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0215 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rectsIntersect(makeRect(0, 0, 100, 100), makeRect(25, 25, ...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 100), makeRect(25, 25, 30, 30))).assertTrue();
      log('testDrawingGeometry0215 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0216
     * @tc.name      testDrawingGeometry0216
     * @tc.desc      Verify rectsIntersect counts edge touching as intersecting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0216 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rectsIntersect(makeRect(0, 0, 100, 100), makeRect(100, 0, ...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 100), makeRect(100, 0, 200, 100))).assertTrue();
      log('testDrawingGeometry0216 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0217
     * @tc.name      testDrawingGeometry0217
     * @tc.desc      Verify rectsIntersect counts corner touching as intersecting.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0217 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue rectsIntersect(makeRect(0, 0, 100, 100), makeRect(100, 100...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 100), makeRect(100, 100, 200, 200))).assertTrue();
      log('testDrawingGeometry0217 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0218
     * @tc.name      testDrawingGeometry0218
     * @tc.desc      Verify rectsIntersect rejects horizontally disjoint rects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0218 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse rectsIntersect(makeRect(0, 0, 100, 100), makeRect(200, 0,...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 100), makeRect(200, 0, 300, 100))).assertFalse();
      log('testDrawingGeometry0218 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0219
     * @tc.name      testDrawingGeometry0219
     * @tc.desc      Verify rectsIntersect rejects vertically disjoint rects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0219 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse rectsIntersect(makeRect(0, 0, 100, 100), makeRect(0, 200,...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 100), makeRect(0, 200, 100, 300))).assertFalse();
      log('testDrawingGeometry0219 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0220
     * @tc.name      testDrawingGeometry0220
     * @tc.desc      Verify rectsIntersect rejects diagonal disjoint rects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0220 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse rectsIntersect(makeRect(0, 0, 100, 100), makeRect(200, 20...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 100), makeRect(200, 200, 300, 300))).assertFalse();
      log('testDrawingGeometry0220 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0221
     * @tc.name      testDrawingGeometry0221
     * @tc.desc      Verify rectsIntersect rejects y overlap without x overlap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0221 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse rectsIntersect(makeRect(0, 0, 10, 100), makeRect(20, 50, ...`);
      expect(rectsIntersect(makeRect(0, 0, 10, 100), makeRect(20, 50, 30, 150))).assertFalse();
      log('testDrawingGeometry0221 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0222
     * @tc.name      testDrawingGeometry0222
     * @tc.desc      Verify rectsIntersect rejects x overlap without y overlap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0222 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse rectsIntersect(makeRect(0, 0, 100, 10), makeRect(50, 20, ...`);
      expect(rectsIntersect(makeRect(0, 0, 100, 10), makeRect(50, 20, 150, 30))).assertFalse();
      log('testDrawingGeometry0222 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0223
     * @tc.name      testDrawingGeometry0223
     * @tc.desc      Verify intersectRect of identical rects keeps exact bounds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0223 begin');
      const inter: DrawingRect4 | null = intersectRect(makeRect(20, 150, 300, 250), makeRect(20, 150, 300, 250));
      if (inter === null) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'assertFail: this branch must not be reached');
        expect().assertFail();
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.left=${inter.left}, expected=20`);
      expect(inter.left).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.top=${inter.top}, expected=150`);
      expect(inter.top).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.right=${inter.right}, expected=300`);
      expect(inter.right).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.bottom=${inter.bottom}, expected=250`);
      expect(inter.bottom).assertEqual(250);
      log('testDrawingGeometry0223 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0224
     * @tc.name      testDrawingGeometry0224
     * @tc.desc      Verify intersectRect computes exact overlap bounds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0224 begin');
      const inter: DrawingRect4 | null = intersectRect(makeRect(20, 150, 300, 250), makeRect(30, 120, 150, 400));
      if (inter === null) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'assertFail: this branch must not be reached');
        expect().assertFail();
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.left=${inter.left}, expected=30`);
      expect(inter.left).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.top=${inter.top}, expected=150`);
      expect(inter.top).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.right=${inter.right}, expected=150`);
      expect(inter.right).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.bottom=${inter.bottom}, expected=250`);
      expect(inter.bottom).assertEqual(250);
      log('testDrawingGeometry0224 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0225
     * @tc.name      testDrawingGeometry0225
     * @tc.desc      Verify intersectRect with itself is not null.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0225 begin');
      const rect: DrawingRect4 = makeRect(0, 0, 50, 50);
      const inter: DrawingRect4 | null = intersectRect(rect, rect);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inter !== null=${inter !== null}`);
      expect(inter !== null).assertTrue();
      log('testDrawingGeometry0225 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0226
     * @tc.name      testDrawingGeometry0226
     * @tc.desc      Verify intersectRect returns null for disjoint rects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0226 begin');
      const inter: DrawingRect4 | null = intersectRect(makeRect(0, 0, 10, 10), makeRect(50, 50, 60, 60));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inter === null=${inter === null}`);
      expect(inter === null).assertTrue();
      log('testDrawingGeometry0226 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0227
     * @tc.name      testDrawingGeometry0227
     * @tc.desc      Verify intersectRect of contained rect equals the inner rect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0227 begin');
      const inter: DrawingRect4 | null = intersectRect(makeRect(0, 0, 100, 100), makeRect(25, 25, 30, 30));
      if (inter === null) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'assertFail: this branch must not be reached');
        expect().assertFail();
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.left=${inter.left}, expected=25`);
      expect(inter.left).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.top=${inter.top}, expected=25`);
      expect(inter.top).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.right=${inter.right}, expected=30`);
      expect(inter.right).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.bottom=${inter.bottom}, expected=30`);
      expect(inter.bottom).assertEqual(30);
      log('testDrawingGeometry0227 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0228
     * @tc.name      testDrawingGeometry0228
     * @tc.desc      Verify intersectRect for edge touching yields zero width band.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0228 begin');
      const inter: DrawingRect4 | null = intersectRect(makeRect(0, 0, 100, 100), makeRect(100, 0, 200, 100));
      if (inter === null) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'assertFail: this branch must not be reached');
        expect().assertFail();
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.left=${inter.left}, expected=100`);
      expect(inter.left).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual inter.right=${inter.right}, expected=100`);
      expect(inter.right).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rectWidth(inter)=${rectWidth(inter)}, expected=0`);
      expect(rectWidth(inter)).assertEqual(0);
      log('testDrawingGeometry0228 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0229
     * @tc.name      testDrawingGeometry0229
     * @tc.desc      Verify clamping keeps an inside point unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0229 begin');
      const clamped: DrawingPoint2 = clampPointToRect(makePoint(50, 60), makeRect(0, 0, 100, 100));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.x=${clamped.x}, expected=50`);
      expect(clamped.x).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.y=${clamped.y}, expected=60`);
      expect(clamped.y).assertEqual(60);
      log('testDrawingGeometry0229 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0230
     * @tc.name      testDrawingGeometry0230
     * @tc.desc      Verify clamping pulls a point left of the rect to the left edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0230 begin');
      const clamped: DrawingPoint2 = clampPointToRect(makePoint(-20, 50), makeRect(0, 0, 100, 100));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.x=${clamped.x}, expected=0`);
      expect(clamped.x).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.y=${clamped.y}, expected=50`);
      expect(clamped.y).assertEqual(50);
      log('testDrawingGeometry0230 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0231
     * @tc.name      testDrawingGeometry0231
     * @tc.desc      Verify clamping pulls a point right of the rect to the right edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0231 begin');
      const clamped: DrawingPoint2 = clampPointToRect(makePoint(180, 50), makeRect(0, 0, 100, 100));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.x=${clamped.x}, expected=100`);
      expect(clamped.x).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.y=${clamped.y}, expected=50`);
      expect(clamped.y).assertEqual(50);
      log('testDrawingGeometry0231 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0232
     * @tc.name      testDrawingGeometry0232
     * @tc.desc      Verify clamping pulls a point above the rect to the top edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0232 begin');
      const clamped: DrawingPoint2 = clampPointToRect(makePoint(50, -10), makeRect(0, 0, 100, 100));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.x=${clamped.x}, expected=50`);
      expect(clamped.x).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.y=${clamped.y}, expected=0`);
      expect(clamped.y).assertEqual(0);
      log('testDrawingGeometry0232 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0233
     * @tc.name      testDrawingGeometry0233
     * @tc.desc      Verify clamping pulls a point below the rect to the bottom edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0233 begin');
      const clamped: DrawingPoint2 = clampPointToRect(makePoint(50, 250), makeRect(0, 0, 100, 100));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.x=${clamped.x}, expected=50`);
      expect(clamped.x).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.y=${clamped.y}, expected=100`);
      expect(clamped.y).assertEqual(100);
      log('testDrawingGeometry0233 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0234
     * @tc.name      testDrawingGeometry0234
     * @tc.desc      Verify clamping a far corner point lands on the rect corner.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0234 begin');
      const clamped: DrawingPoint2 = clampPointToRect(makePoint(-5, 999), makeRect(0, 10, 100, 110));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.x=${clamped.x}, expected=0`);
      expect(clamped.x).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual clamped.y=${clamped.y}, expected=110`);
      expect(clamped.y).assertEqual(110);
      log('testDrawingGeometry0234 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0235
     * @tc.name      testDrawingGeometry0235
     * @tc.desc      Verify distance for a 3-4-5 triangle is exactly 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0235 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${distance(makePoint(0, 0), makePoint(3, 4))}`);
      expect(distance(makePoint(0, 0), makePoint(3, 4))).assertEqual(5);
      log('testDrawingGeometry0235 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0236
     * @tc.name      testDrawingGeometry0236
     * @tc.desc      Verify distance of identical points is zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0236 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${distance(makePoint(12, 34), makePoint(12, 34))}`);
      expect(distance(makePoint(12, 34), makePoint(12, 34))).assertEqual(0);
      log('testDrawingGeometry0236 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0237
     * @tc.name      testDrawingGeometry0237
     * @tc.desc      Verify distance is translation invariant for the 3-4-5 pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0237 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${distance(makePoint(1, 1), makePoint(4, 5))}`);
      expect(distance(makePoint(1, 1), makePoint(4, 5))).assertEqual(5);
      log('testDrawingGeometry0237 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0238
     * @tc.name      testDrawingGeometry0238
     * @tc.desc      Verify distance is symmetric for swapped arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0238 begin');
      const ab: number = distance(makePoint(2, 3), makePoint(7, 15));
      const ba: number = distance(makePoint(7, 15), makePoint(2, 3));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(ab - ba) < 1e-9=${Math.abs(ab - ba) < 1e-9}`);
      expect(Math.abs(ab - ba) < 1e-9).assertTrue();
      log('testDrawingGeometry0238 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0239
     * @tc.name      testDrawingGeometry0239
     * @tc.desc      Verify pointOnCircle at 0 degrees lands on the positive x axis.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0239 begin');
      const p: DrawingPoint2 = pointOnCircle(makePoint(100, 100), 50, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=150`);
      expect(p.x).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=100`);
      expect(p.y).assertEqual(100);
      log('testDrawingGeometry0239 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0240
     * @tc.name      testDrawingGeometry0240
     * @tc.desc      Verify pointOnCircle at 90 degrees lands below the center.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0240 begin');
      const p: DrawingPoint2 = pointOnCircle(makePoint(100, 100), 50, 90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x - 100) < 1e-9=${Math.abs(p.x - 100) < 1e-9}`);
      expect(Math.abs(p.x - 100) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 150) < 1e-9=${Math.abs(p.y - 150) < 1e-9}`);
      expect(Math.abs(p.y - 150) < 1e-9).assertTrue();
      log('testDrawingGeometry0240 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0241
     * @tc.name      testDrawingGeometry0241
     * @tc.desc      Verify pointOnCircle at 180 degrees lands on the negative x axis.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0241 begin');
      const p: DrawingPoint2 = pointOnCircle(makePoint(100, 100), 50, 180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x - 50) < 1e-9=${Math.abs(p.x - 50) < 1e-9}`);
      expect(Math.abs(p.x - 50) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 100) < 1e-9=${Math.abs(p.y - 100) < 1e-9}`);
      expect(Math.abs(p.y - 100) < 1e-9).assertTrue();
      log('testDrawingGeometry0241 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0242
     * @tc.name      testDrawingGeometry0242
     * @tc.desc      Verify pointOnCircle at 270 degrees lands above the center.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0242 begin');
      const p: DrawingPoint2 = pointOnCircle(makePoint(100, 100), 50, 270);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x - 100) < 1e-9=${Math.abs(p.x - 100) < 1e-9}`);
      expect(Math.abs(p.x - 100) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 50) < 1e-9=${Math.abs(p.y - 50) < 1e-9}`);
      expect(Math.abs(p.y - 50) < 1e-9).assertTrue();
      log('testDrawingGeometry0242 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0243
     * @tc.name      testDrawingGeometry0243
     * @tc.desc      Verify pointOnCircle preserves the radius for an oblique angle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0243 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const p: DrawingPoint2 = pointOnCircle(center, 60, 45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(distance(center, p) - 60) < 1e-6}`);
      expect(Math.abs(distance(center, p) - 60) < 1e-6).assertTrue();
      log('testDrawingGeometry0243 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0244
     * @tc.name      testDrawingGeometry0244
     * @tc.desc      Verify pointOnCircle returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0244 begin');
      const p: DrawingPoint2 = pointOnCircle(makePoint(0, 0), 10, 30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof p=${typeof p}, expected='object'`);
      expect(typeof p).assertEqual('object');
      log('testDrawingGeometry0244 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0245
     * @tc.name      testDrawingGeometry0245
     * @tc.desc      Verify pointOnCircle keeps the center offset for the sample star center.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0245 begin');
      const p: DrawingPoint2 = pointOnCircle(makePoint(450, 180), 80, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=530`);
      expect(p.x).assertEqual(530);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=180`);
      expect(p.y).assertEqual(180);
      log('testDrawingGeometry0245 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0246
     * @tc.name      testDrawingGeometry0246
     * @tc.desc      Verify sample pentagon vertex 0 stays on the side circle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0246 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const v: DrawingPoint2 = pentagonVertex(center, 60, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(distance(center, v) - 60) < 1e-6}`);
      expect(Math.abs(distance(center, v) - 60) < 1e-6).assertTrue();
      log('testDrawingGeometry0246 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0247
     * @tc.name      testDrawingGeometry0247
     * @tc.desc      Verify sample pentagon vertex 1 stays on the side circle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0247 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const v: DrawingPoint2 = pentagonVertex(center, 60, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(distance(center, v) - 60) < 1e-6}`);
      expect(Math.abs(distance(center, v) - 60) < 1e-6).assertTrue();
      log('testDrawingGeometry0247 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0248
     * @tc.name      testDrawingGeometry0248
     * @tc.desc      Verify sample pentagon vertex 2 stays on the side circle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0248 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const v: DrawingPoint2 = pentagonVertex(center, 60, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(distance(center, v) - 60) < 1e-6}`);
      expect(Math.abs(distance(center, v) - 60) < 1e-6).assertTrue();
      log('testDrawingGeometry0248 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0249
     * @tc.name      testDrawingGeometry0249
     * @tc.desc      Verify sample pentagon vertex 3 stays on the side circle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0249 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const v: DrawingPoint2 = pentagonVertex(center, 60, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(distance(center, v) - 60) < 1e-6}`);
      expect(Math.abs(distance(center, v) - 60) < 1e-6).assertTrue();
      log('testDrawingGeometry0249 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0250
     * @tc.name      testDrawingGeometry0250
     * @tc.desc      Verify sample pentagon vertex 4 stays on the side circle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0250 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const v: DrawingPoint2 = pentagonVertex(center, 60, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(distance(center, v) - 60) < 1e-6}`);
      expect(Math.abs(distance(center, v) - 60) < 1e-6).assertTrue();
      log('testDrawingGeometry0250 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0251
     * @tc.name      testDrawingGeometry0251
     * @tc.desc      Verify sample pentagon vertices 0 and 2 are distinct points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0251 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const v0: DrawingPoint2 = pentagonVertex(center, 60, 0);
      const v2: DrawingPoint2 = pentagonVertex(center, 60, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${v0.x === v2.x && v0.y === v2.y}`);
      expect(v0.x === v2.x && v0.y === v2.y).assertFalse();
      log('testDrawingGeometry0251 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0252
     * @tc.name      testDrawingGeometry0252
     * @tc.desc      Verify pentagonVertex returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0252 begin');
      const v: DrawingPoint2 = pentagonVertex(makePoint(70, 600), 60, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof v=${typeof v}, expected='object'`);
      expect(typeof v).assertEqual('object');
      log('testDrawingGeometry0252 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0253
     * @tc.name      testDrawingGeometry0253
     * @tc.desc      Verify sample pentagon vertices 1 and 3 share the same radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0253 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      const d1: number = distance(center, pentagonVertex(center, 60, 1));
      const d3: number = distance(center, pentagonVertex(center, 60, 3));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(d1 - d3) < 1e-6=${Math.abs(d1 - d3) < 1e-6}`);
      expect(Math.abs(d1 - d3) < 1e-6).assertTrue();
      log('testDrawingGeometry0253 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0254
     * @tc.name      testDrawingGeometry0254
     * @tc.desc      Verify sample star vertex 0 uses the outer radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0254 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6).assertTrue();
      log('testDrawingGeometry0254 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0255
     * @tc.name      testDrawingGeometry0255
     * @tc.desc      Verify sample star vertex 1 uses the inner radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0255 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 30) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 30) < 1e-6).assertTrue();
      log('testDrawingGeometry0255 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0256
     * @tc.name      testDrawingGeometry0256
     * @tc.desc      Verify sample star vertex 2 uses the outer radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0256 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6).assertTrue();
      log('testDrawingGeometry0256 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0257
     * @tc.name      testDrawingGeometry0257
     * @tc.desc      Verify sample star vertex 3 uses the inner radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0257 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 30) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 30) < 1e-6).assertTrue();
      log('testDrawingGeometry0257 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0258
     * @tc.name      testDrawingGeometry0258
     * @tc.desc      Verify sample star vertex 4 uses the outer radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0258 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6).assertTrue();
      log('testDrawingGeometry0258 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0259
     * @tc.name      testDrawingGeometry0259
     * @tc.desc      Verify sample star vertex 5 uses the inner radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0259 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 30) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 30) < 1e-6).assertTrue();
      log('testDrawingGeometry0259 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0260
     * @tc.name      testDrawingGeometry0260
     * @tc.desc      Verify sample star vertex 6 uses the outer radius again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0260 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6).assertTrue();
      log('testDrawingGeometry0260 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0261
     * @tc.name      testDrawingGeometry0261
     * @tc.desc      Verify sample star vertices 0 and 1 are distinct points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0261 begin');
      const v0: DrawingPoint2 = starVertex(450, 180, 80, 30, 0);
      const v1: DrawingPoint2 = starVertex(450, 180, 80, 30, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${v0.x === v1.x && v0.y === v1.y}`);
      expect(v0.x === v1.x && v0.y === v1.y).assertFalse();
      log('testDrawingGeometry0261 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0262
     * @tc.name      testDrawingGeometry0262
     * @tc.desc      Verify starVertex returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0262 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof v=${typeof v}, expected='object'`);
      expect(typeof v).assertEqual('object');
      log('testDrawingGeometry0262 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0263
     * @tc.name      testDrawingGeometry0263
     * @tc.desc      Verify sample star vertex 8 uses the outer radius by parity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0263 begin');
      const v: DrawingPoint2 = starVertex(450, 180, 80, 30, 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6`);
      expect(Math.abs(distance(makePoint(450, 180), v) - 80) < 1e-6).assertTrue();
      log('testDrawingGeometry0263 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0264
     * @tc.name      testDrawingGeometry0264
     * @tc.desc      Verify scalePoint mirrors the sample canvas scale 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0264 begin');
      const p: DrawingPoint2 = scalePoint(makePoint(60, 60), 1.5, 1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=90`);
      expect(p.x).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=90`);
      expect(p.y).assertEqual(90);
      log('testDrawingGeometry0264 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0265
     * @tc.name      testDrawingGeometry0265
     * @tc.desc      Verify scalePoint by one is the identity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0265 begin');
      const p: DrawingPoint2 = scalePoint(makePoint(42, 24), 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=42`);
      expect(p.x).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=24`);
      expect(p.y).assertEqual(24);
      log('testDrawingGeometry0265 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0266
     * @tc.name      testDrawingGeometry0266
     * @tc.desc      Verify scalePoint by zero collapses to the origin.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0266 begin');
      const p: DrawingPoint2 = scalePoint(makePoint(42, 24), 0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=0`);
      expect(p.x).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=0`);
      expect(p.y).assertEqual(0);
      log('testDrawingGeometry0266 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0267
     * @tc.name      testDrawingGeometry0267
     * @tc.desc      Verify scalePoint can scale the x axis only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0267 begin');
      const p: DrawingPoint2 = scalePoint(makePoint(60, 60), 2, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=120`);
      expect(p.x).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=60`);
      expect(p.y).assertEqual(60);
      log('testDrawingGeometry0267 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0268
     * @tc.name      testDrawingGeometry0268
     * @tc.desc      Verify translatePoint mirrors the sample canvas translate 100,100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0268 begin');
      const p: DrawingPoint2 = translatePoint(makePoint(100, 100), 100, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=200`);
      expect(p.x).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=200`);
      expect(p.y).assertEqual(200);
      log('testDrawingGeometry0268 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0269
     * @tc.name      testDrawingGeometry0269
     * @tc.desc      Verify translatePoint supports negative offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0269 begin');
      const p: DrawingPoint2 = translatePoint(makePoint(100, 100), -30, -40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=70`);
      expect(p.x).assertEqual(70);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=60`);
      expect(p.y).assertEqual(60);
      log('testDrawingGeometry0269 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0270
     * @tc.name      testDrawingGeometry0270
     * @tc.desc      Verify translatePoint by zero is the identity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0270 begin');
      const p: DrawingPoint2 = translatePoint(makePoint(33, 44), 0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=33`);
      expect(p.x).assertEqual(33);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=44`);
      expect(p.y).assertEqual(44);
      log('testDrawingGeometry0270 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0271
     * @tc.name      testDrawingGeometry0271
     * @tc.desc      Verify rotating by zero degrees keeps the point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0271 begin');
      const p: DrawingPoint2 = rotatePointDeg(makePoint(25, 75), 0, makePoint(0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x - 25) < 1e-9=${Math.abs(p.x - 25) < 1e-9}`);
      expect(Math.abs(p.x - 25) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 75) < 1e-9=${Math.abs(p.y - 75) < 1e-9}`);
      expect(Math.abs(p.y - 75) < 1e-9).assertTrue();
      log('testDrawingGeometry0271 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0272
     * @tc.name      testDrawingGeometry0272
     * @tc.desc      Verify rotating x axis unit by 90 degrees maps to y axis.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0272 begin');
      const p: DrawingPoint2 = rotatePointDeg(makePoint(1, 0), 90, makePoint(0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x - 0) < 1e-9=${Math.abs(p.x - 0) < 1e-9}`);
      expect(Math.abs(p.x - 0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 1) < 1e-9=${Math.abs(p.y - 1) < 1e-9}`);
      expect(Math.abs(p.y - 1) < 1e-9).assertTrue();
      log('testDrawingGeometry0272 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0273
     * @tc.name      testDrawingGeometry0273
     * @tc.desc      Verify rotating x axis unit by 180 degrees flips to negative x.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0273 begin');
      const p: DrawingPoint2 = rotatePointDeg(makePoint(1, 0), 180, makePoint(0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x + 1) < 1e-9=${Math.abs(p.x + 1) < 1e-9}`);
      expect(Math.abs(p.x + 1) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 0) < 1e-9=${Math.abs(p.y - 0) < 1e-9}`);
      expect(Math.abs(p.y - 0) < 1e-9).assertTrue();
      log('testDrawingGeometry0273 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0274
     * @tc.name      testDrawingGeometry0274
     * @tc.desc      Verify rotating by 360 degrees keeps the point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0274 begin');
      const p: DrawingPoint2 = rotatePointDeg(makePoint(3, 7), 360, makePoint(0, 0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x - 3) < 1e-6=${Math.abs(p.x - 3) < 1e-6}`);
      expect(Math.abs(p.x - 3) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 7) < 1e-6=${Math.abs(p.y - 7) < 1e-6}`);
      expect(Math.abs(p.y - 7) < 1e-6).assertTrue();
      log('testDrawingGeometry0274 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0275
     * @tc.name      testDrawingGeometry0275
     * @tc.desc      Verify rotating around the sample pivot keeps the pivot radius.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0275 begin');
      const pivot: DrawingPoint2 = makePoint(100, 100);
      const p: DrawingPoint2 = rotatePointDeg(makePoint(150, 100), 90, pivot);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.x - 100) < 1e-9=${Math.abs(p.x - 100) < 1e-9}`);
      expect(Math.abs(p.x - 100) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(p.y - 150) < 1e-9=${Math.abs(p.y - 150) < 1e-9}`);
      expect(Math.abs(p.y - 150) < 1e-9).assertTrue();
      log('testDrawingGeometry0275 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0276
     * @tc.name      testDrawingGeometry0276
     * @tc.desc      Verify cubic bezier at t 0 equals the start point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0276 begin');
      const p: DrawingPoint2 = cubicBezierPoint(makePoint(400, 350), makePoint(400, 420),
        makePoint(550, 380), makePoint(450, 500), 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=400`);
      expect(p.x).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=350`);
      expect(p.y).assertEqual(350);
      log('testDrawingGeometry0276 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0277
     * @tc.name      testDrawingGeometry0277
     * @tc.desc      Verify cubic bezier at t 1 equals the end point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0277 begin');
      const p: DrawingPoint2 = cubicBezierPoint(makePoint(400, 350), makePoint(400, 420),
        makePoint(550, 380), makePoint(450, 500), 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=450`);
      expect(p.x).assertEqual(450);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=500`);
      expect(p.y).assertEqual(500);
      log('testDrawingGeometry0277 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0278
     * @tc.name      testDrawingGeometry0278
     * @tc.desc      Verify cubic bezier midpoint uses the exact Bernstein weights.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0278 begin');
      const p: DrawingPoint2 = cubicBezierPoint(makePoint(0, 0), makePoint(0, 100),
        makePoint(100, 100), makePoint(100, 0), 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=50`);
      expect(p.x).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.y=${p.y}, expected=75`);
      expect(p.y).assertEqual(75);
      log('testDrawingGeometry0278 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0279
     * @tc.name      testDrawingGeometry0279
     * @tc.desc      Verify cubic bezier of symmetric controls stays symmetric.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0279 begin');
      const p: DrawingPoint2 = cubicBezierPoint(makePoint(0, 0), makePoint(50, 100),
        makePoint(150, 100), makePoint(200, 0), 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual p.x=${p.x}, expected=100`);
      expect(p.x).assertEqual(100);
      log('testDrawingGeometry0279 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0280
     * @tc.name      testDrawingGeometry0280
     * @tc.desc      Verify cubicBezierPoint returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0280 begin');
      const p: DrawingPoint2 = cubicBezierPoint(makePoint(0, 0), makePoint(0, 10),
        makePoint(10, 10), makePoint(10, 0), 0.25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof p=${typeof p}, expected='object'`);
      expect(typeof p).assertEqual('object');
      log('testDrawingGeometry0280 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0282
     * @tc.name      testDrawingGeometry0282
     * @tc.desc      Verify sample star vertex 1 radius equals the inner circle exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0282 begin');
      const d: number = distance(makePoint(450, 180), starVertex(450, 180, 80, 30, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(d - 30) < 1e-9=${Math.abs(d - 30) < 1e-9}`);
      expect(Math.abs(d - 30) < 1e-9).assertTrue();
      log('testDrawingGeometry0282 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0283
     * @tc.name      testDrawingGeometry0283
     * @tc.desc      Verify all five sample pentagon vertices stay in the clip x range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0283 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      let inRange: boolean = true;
      for (let i: number = 0; i < 5; i++) {
        const v: DrawingPoint2 = pentagonVertex(center, 60, i);
        if (v.x < 10 || v.x > 130) {
          inRange = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inRange=${inRange}`);
      expect(inRange).assertTrue();
      log('testDrawingGeometry0283 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0284
     * @tc.name      testDrawingGeometry0284
     * @tc.desc      Verify all five sample pentagon vertices stay in the clip y range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0284 begin');
      const center: DrawingPoint2 = makePoint(70, 600);
      let inRange: boolean = true;
      for (let i: number = 0; i < 5; i++) {
        const v: DrawingPoint2 = pentagonVertex(center, 60, i);
        if (v.y < 540 || v.y > 660) {
          inRange = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inRange=${inRange}`);
      expect(inRange).assertTrue();
      log('testDrawingGeometry0284 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0285
     * @tc.name      testDrawingGeometry0285
     * @tc.desc      Verify copyRectToCommon2D preserves all four bounds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0285 begin');
      const rect: common2D.Rect = copyRectToCommon2D(makeRect(20, 150, 300, 250));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.left=${rect.left}, expected=20`);
      expect(rect.left).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.top=${rect.top}, expected=150`);
      expect(rect.top).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.right=${rect.right}, expected=300`);
      expect(rect.right).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rect.bottom=${rect.bottom}, expected=250`);
      expect(rect.bottom).assertEqual(250);
      log('testDrawingGeometry0285 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0286
     * @tc.name      testDrawingGeometry0286
     * @tc.desc      Verify copyRectToCommon2D returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0286 begin');
      const rect: common2D.Rect = copyRectToCommon2D(makeRect(0, 0, 1, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof rect=${typeof rect}, expected='object'`);
      expect(typeof rect).assertEqual('object');
      log('testDrawingGeometry0286 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0287
     * @tc.name      testDrawingGeometry0287
     * @tc.desc      Verify containsPoint accepts the rect center.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0287 begin');
      const rect: DrawingRect4 = makeRect(0, 0, 100, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${containsPoint(rect, rectCenter(rect))}`);
      expect(containsPoint(rect, rectCenter(rect))).assertTrue();
      log('testDrawingGeometry0287 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0288
     * @tc.name      testDrawingGeometry0288
     * @tc.desc      Verify containsPoint rejects a far outside point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0288 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse containsPoint(makeRect(0, 0, 100, 100), makePoint(150, 50))`);
      expect(containsPoint(makeRect(0, 0, 100, 100), makePoint(150, 50))).assertFalse();
      log('testDrawingGeometry0288 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0289
     * @tc.name      testDrawingGeometry0289
     * @tc.desc      Verify containsPoint includes the left edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0289 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue containsPoint(makeRect(0, 0, 100, 100), makePoint(0, 50))`);
      expect(containsPoint(makeRect(0, 0, 100, 100), makePoint(0, 50))).assertTrue();
      log('testDrawingGeometry0289 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0290
     * @tc.name      testDrawingGeometry0290
     * @tc.desc      Verify containsPoint includes the bottom edge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0290 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue containsPoint(makeRect(0, 0, 100, 100), makePoint(50, 100))`);
      expect(containsPoint(makeRect(0, 0, 100, 100), makePoint(50, 100))).assertTrue();
      log('testDrawingGeometry0290 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0291
     * @tc.name      testDrawingGeometry0291
     * @tc.desc      Verify containsPoint includes the top right corner.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0291 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue containsPoint(makeRect(0, 0, 100, 100), makePoint(100, 0))`);
      expect(containsPoint(makeRect(0, 0, 100, 100), makePoint(100, 0))).assertTrue();
      log('testDrawingGeometry0291 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0292
     * @tc.name      testDrawingGeometry0292
     * @tc.desc      Verify rectArea of the sample DrawRect bounds is exact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0292 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${rectArea(makeRect(20, 150, 300, 250))}`);
      expect(rectArea(makeRect(20, 150, 300, 250))).assertEqual(28000);
      log('testDrawingGeometry0292 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0293
     * @tc.name      testDrawingGeometry0293
     * @tc.desc      Verify rectArea of a degenerate rect is zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0293 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${rectArea(makeRect(10, 10, 10, 10))}, expected=0`);
      expect(rectArea(makeRect(10, 10, 10, 10))).assertEqual(0);
      log('testDrawingGeometry0293 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0294
     * @tc.name      testDrawingGeometry0294
     * @tc.desc      Verify rectArea of an inverted rect is negative.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0294 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${rectArea(makeRect(300, 150, 20, 250))}`);
      expect(rectArea(makeRect(300, 150, 20, 250))).assertEqual(-28000);
      log('testDrawingGeometry0294 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0295
     * @tc.name      testDrawingGeometry0295
     * @tc.desc      Verify midpoint computes exact component average.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0295 begin');
      const mid: DrawingPoint2 = midpoint(makePoint(0, 0), makePoint(100, 200));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual mid.x=${mid.x}, expected=50`);
      expect(mid.x).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual mid.y=${mid.y}, expected=100`);
      expect(mid.y).assertEqual(100);
      log('testDrawingGeometry0295 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0296
     * @tc.name      testDrawingGeometry0296
     * @tc.desc      Verify midpoint of rect corners equals rectCenter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0296 begin');
      const rect: DrawingRect4 = makeRect(20, 150, 300, 250);
      const mid: DrawingPoint2 = midpoint(makePoint(rect.left, rect.top), makePoint(rect.right, rect.bottom));
      const center: DrawingPoint2 = rectCenter(rect);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual mid.x=${mid.x}, expected=center.x`);
      expect(mid.x).assertEqual(center.x);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual mid.y=${mid.y}, expected=center.y`);
      expect(mid.y).assertEqual(center.y);
      log('testDrawingGeometry0296 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0297
     * @tc.name      testDrawingGeometry0297
     * @tc.desc      Verify midpoint returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0297 begin');
      const mid: DrawingPoint2 = midpoint(makePoint(1, 2), makePoint(3, 4));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof mid=${typeof mid}, expected='object'`);
      expect(typeof mid).assertEqual('object');
      log('testDrawingGeometry0297 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0298
     * @tc.name      testDrawingGeometry0298
     * @tc.desc      Verify distance from center to circle point equals radius at 37 degrees.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0298 begin');
      const center: DrawingPoint2 = makePoint(450, 180);
      const d: number = distance(center, pointOnCircle(center, 80, 37));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(d - 80) < 1e-6=${Math.abs(d - 80) < 1e-6}`);
      expect(Math.abs(d - 80) < 1e-6).assertTrue();
      log('testDrawingGeometry0298 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0299
     * @tc.name      testDrawingGeometry0299
     * @tc.desc      Verify rotating twice by 90 degrees equals one 180 degree rotation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0299 begin');
      const origin: DrawingPoint2 = makePoint(0, 0);
      const once: DrawingPoint2 = rotatePointDeg(rotatePointDeg(makePoint(3, 7), 90, origin), 90, origin);
      const direct: DrawingPoint2 = rotatePointDeg(makePoint(3, 7), 180, origin);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(once.x - direct.x) < 1e-6}`);
      expect(Math.abs(once.x - direct.x) < 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(once.y - direct.y) < 1e-6}`);
      expect(Math.abs(once.y - direct.y) < 1e-6).assertTrue();
      log('testDrawingGeometry0299 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_GEOMETRY_0300
     * @tc.name      testDrawingGeometry0300
     * @tc.desc      Verify translate then scale composition matches manual math.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingGeometry0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingGeometry0300 begin');
      const moved: DrawingPoint2 = translatePoint(makePoint(20, 0), 10, 0);
      const scaled: DrawingPoint2 = scalePoint(moved, 2, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual scaled.x=${scaled.x}, expected=60`);
      expect(scaled.x).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual scaled.y=${scaled.y}, expected=0`);
      expect(scaled.y).assertEqual(0);
      log('testDrawingGeometry0300 end');
    })
  })
}
