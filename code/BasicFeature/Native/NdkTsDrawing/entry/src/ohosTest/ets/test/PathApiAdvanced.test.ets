/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { drawing, common2D } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ltrb, point } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Build a path that contains one axis aligned rectangle contour.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { drawing.Path } Rectangle path.
 */
function rectPath(left: number, top: number, right: number, bottom: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(left, top, right, bottom));
  return path;
}

/**
 * Build a path with one straight segment.
 *
 * @param { number } x1 - Start x.
 * @param { number } y1 - Start y.
 * @param { number } x2 - End x.
 * @param { number } y2 - End y.
 * @returns { drawing.Path } Line path.
 */
function linePath(x1: number, y1: number, x2: number, y2: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(x1, y1);
  path.lineTo(x2, y2);
  return path;
}

/**
 * Build a path that contains one circle contour.
 *
 * @param { number } centerX - Circle centre x.
 * @param { number } centerY - Circle centre y.
 * @param { number } radius - Circle radius.
 * @returns { drawing.Path } Circle path.
 */
function circlePath(centerX: number, centerY: number, radius: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(centerX, centerY, radius);
  return path;
}

/**
 * Build a path that contains one arc of the given oval box.
 *
 * @param { number } size - Width and height of the oval box.
 * @param { number } startAngle - Start angle in degrees.
 * @param { number } sweepAngle - Sweep angle in degrees.
 * @returns { drawing.Path } Arc path.
 */
function arcPath(size: number, startAngle: number, sweepAngle: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addArc(ltrb(0, 0, size, size), startAngle, sweepAngle);
  return path;
}

/**
 * Build a path that contains the given number of evenly spread polygon points.
 *
 * @param { number } count - Number of points.
 * @param { number } radius - Radius of the circle the points sit on.
 * @returns { drawing.Path } Polygon path.
 */
function polygonPath(count: number, radius: number): drawing.Path {
  const points: common2D.Point[] = [];
  for (let index: number = 0; index < count; index++) {
    const angle: number = (2 * Math.PI * index) / count;
    points.push(point(100 + radius * Math.cos(angle), 100 + radius * Math.sin(angle)));
  }
  const path: drawing.Path = new drawing.Path();
  path.addPolygon(points, true);
  return path;
}

export default function pathApiAdvancedTest() {
  describe('PathApiAdvancedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_PATH_0124
     * @tc.name testPathApi0124
     * @tc.desc Verify a half circle arc spans the full width and half the height of its box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0124 begin');
      await runCase('testPathApi0124', async () => {
        const path: drawing.Path = arcPath(100, 0, 180);
        const bounds: common2D.Rect = path.getBounds();
        expect(Math.round(bounds.left)).assertEqual(0);
        expect(Math.round(bounds.right)).assertEqual(100);
        expect(bounds.top === 0 || bounds.bottom === 100).assertTrue();
        expect(Math.abs(path.getLength(false) - Math.PI * 50) < 5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0125
     * @tc.name testPathApi0125
     * @tc.desc Verify a negative sweep arc stays inside its box and keeps a positive length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0125 begin');
      await runCase('testPathApi0125', async () => {
        const path: drawing.Path = arcPath(100, 0, -90);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.isEmpty()).assertFalse();
        expect(path.getLength(false) > 50).assertTrue();
        expect(bounds.left >= -0.5).assertTrue();
        expect(bounds.bottom <= 100.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0126
     * @tc.name testPathApi0126
     * @tc.desc Verify a sweep of seven hundred twenty degrees matches a full turn.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0126 begin');
      await runCase('testPathApi0126', async () => {
        const full: drawing.Path = arcPath(80, 0, 360);
        const twice: drawing.Path = arcPath(80, 0, 720);
        expect(Math.round(full.getBounds().right)).assertEqual(Math.round(twice.getBounds().right));
        expect(Math.round(full.getBounds().bottom)).assertEqual(Math.round(twice.getBounds().bottom));
        expect(Math.abs(full.getLength(false) - twice.getLength(false)) < 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0127
     * @tc.name testPathApi0127
     * @tc.desc Verify an arc inside a wide box keeps the box width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0127 begin');
      await runCase('testPathApi0127', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addArc(ltrb(0, 0, 200, 40), 0, 180);
        const bounds: common2D.Rect = path.getBounds();
        expect(Math.round(bounds.left)).assertEqual(0);
        expect(Math.round(bounds.right)).assertEqual(200);
        expect(path.getLength(false) > 150).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0128
     * @tc.name testPathApi0128
     * @tc.desc Verify the tangent arcTo keeps the moving point and adds curve verbs only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0128 begin');
      await runCase('testPathApi0128', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.arcTo(0, 0, 100, 100, 0, 90);
        const verbs: drawing.PathIteratorVerb[] = path.getVerbData();
        expect(verbs.length >= 2).assertTrue();
        expect(verbs[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(path.getPointData().length >= 2).assertTrue();
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0129
     * @tc.name testPathApi0129
     * @tc.desc Verify lineTo after an arc continues from the arc end point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0129 begin');
      await runCase('testPathApi0129', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addArc(ltrb(0, 0, 100, 100), 0, 90);
        path.lineTo(150, 150);
        const tail: common2D.Point = path.getLastPoint();
        expect(tail.x).assertEqual(150);
        expect(tail.y).assertEqual(150);
        expect(path.getBounds().right).assertEqual(150);
        expect(path.isClosed()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0130
     * @tc.name testPathApi0130
     * @tc.desc Verify a full circle arc reports the circumference of its radius.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0130 begin');
      await runCase('testPathApi0130', async () => {
        const path: drawing.Path = arcPath(100, 0, 360);
        const circumference: number = 2 * Math.PI * 50;
        expect(Math.abs(path.getLength(false) - circumference) < 2).assertTrue();
        expect(Math.round(path.getBounds().left)).assertEqual(0);
        expect(Math.round(path.getBounds().right)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0131
     * @tc.name testPathApi0131
     * @tc.desc Verify two quarter arcs make up the same box as one full circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0131 begin');
      await runCase('testPathApi0131', async () => {
        const halves: drawing.Path = new drawing.Path();
        halves.addArc(ltrb(0, 0, 100, 100), 0, 180);
        halves.addArc(ltrb(0, 0, 100, 100), 180, 180);
        const whole: drawing.Path = circlePath(50, 50, 50);
        expect(Math.round(halves.getBounds().right)).assertEqual(Math.round(whole.getBounds().right));
        expect(Math.round(halves.getBounds().bottom)).assertEqual(Math.round(whole.getBounds().bottom));
        expect(Math.abs(halves.getLength(false) - whole.getLength(false))).assertClose(156.8258514404297, 0.01);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0132
     * @tc.name testPathApi0132
     * @tc.desc Verify a three quarter arc is shorter than the full circumference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0132 begin');
      await runCase('testPathApi0132', async () => {
        const partial: number = arcPath(100, 0, 270).getLength(false);
        const full: number = arcPath(100, 0, 360).getLength(false);
        expect(partial > 200).assertTrue();
        expect(partial < full).assertTrue();
        expect(Math.abs(partial - full * 0.75) < 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0133
     * @tc.name testPathApi0133
     * @tc.desc Verify a ninety degree rotation swaps the rectangle width and height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0133 begin');
      await runCase('testPathApi0133', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 50);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 0, 0);
        path.transform(matrix);
        const bounds: common2D.Rect = path.getBounds();
        expect(Math.round(bounds.left)).assertEqual(-50);
        expect(Math.round(bounds.right)).assertEqual(0);
        expect(Math.round(bounds.bottom)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0134
     * @tc.name testPathApi0134
     * @tc.desc Verify a half scale matrix halves both bounds and perimeter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0134 begin');
      await runCase('testPathApi0134', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0.5, 0.5, 0, 0);
        path.transform(matrix);
        expect(path.getBounds().right).assertEqual(50);
        expect(Math.round(path.getLength(true))).assertEqual(200);
        expect(path.contains(25, 25)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0135
     * @tc.name testPathApi0135
     * @tc.desc Verify a translation then scale matrix applies in the documented order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0135 begin');
      await runCase('testPathApi0135', async () => {
        const path: drawing.Path = rectPath(0, 0, 20, 20);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(10, 10);
        matrix.postScale(2, 2, 0, 0);
        path.transform(matrix);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(20);
        expect(bounds.right).assertEqual(60);
        expect(bounds.bottom).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0136
     * @tc.name testPathApi0136
     * @tc.desc Verify a skew keeps the verb count while widening the bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0136 begin');
      await runCase('testPathApi0136', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        const verbsBefore: number = path.getVerbData().length;
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        path.transform(matrix);
        expect(path.getVerbData().length).assertEqual(verbsBefore);
        expect(path.getBounds().right).assertEqual(150);
        expect(path.getBounds().bottom).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0136 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0137
     * @tc.name testPathApi0137
     * @tc.desc Verify containment follows the contour after a rotation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0137 begin');
      await runCase('testPathApi0137', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 0, 0);
        path.transform(matrix);
        expect(path.contains(-50, 50)).assertTrue();
        expect(path.contains(50, 50)).assertFalse();
        expect(path.getBounds().top).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0138
     * @tc.name testPathApi0138
     * @tc.desc Verify two translations accumulate into the sum of their offsets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0138 begin');
      await runCase('testPathApi0138', async () => {
        const path: drawing.Path = rectPath(0, 0, 10, 10);
        const first: drawing.Matrix = new drawing.Matrix();
        first.setTranslation(10, 0);
        const second: drawing.Matrix = new drawing.Matrix();
        second.setTranslation(0, 25);
        path.transform(first);
        path.transform(second);
        expect(path.getBounds().left).assertEqual(10);
        expect(path.getBounds().top).assertEqual(25);
        expect(path.getBounds().right).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0139
     * @tc.name testPathApi0139
     * @tc.desc Verify an identity transform leaves bounds and perimeter untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0139 begin');
      await runCase('testPathApi0139', async () => {
        const path: drawing.Path = rectPath(5, 5, 45, 45);
        const lengthBefore: number = path.getLength(true);
        path.transform(new drawing.Matrix());
        expect(path.getBounds().left).assertEqual(5);
        expect(path.getBounds().right).assertEqual(45);
        expect(Math.abs(path.getLength(true) - lengthBefore) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0140
     * @tc.name testPathApi0140
     * @tc.desc Verify an axis aligned transform keeps a rectangle recognisable as a rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0140 begin');
      await runCase('testPathApi0140', async () => {
        const path: drawing.Path = rectPath(0, 0, 40, 20);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(15, 15);
        matrix.postScale(2, 2, 0, 0);
        path.transform(matrix);
        const out: common2D.Rect = ltrb(0, 0, 0, 0);
        expect(path.isRect(out)).assertTrue();
        expect(out.left).assertEqual(30);
        expect(out.right).assertEqual(110);
        expect(out.bottom).assertEqual(70);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0141
     * @tc.name testPathApi0141
     * @tc.desc Verify a doubled scale doubles the perimeter of a square path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0141 begin');
      await runCase('testPathApi0141', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        const before: number = path.getLength(true);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        path.transform(matrix);
        expect(Math.round(before)).assertEqual(200);
        expect(Math.round(path.getLength(true))).assertEqual(400);
        expect(path.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0142
     * @tc.name testPathApi0142
     * @tc.desc Verify three interior points of a rectangle are all contained.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0142 begin');
      await runCase('testPathApi0142', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        expect(path.contains(1, 1)).assertTrue();
        expect(path.contains(50, 50)).assertTrue();
        expect(path.contains(99, 99)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0143
     * @tc.name testPathApi0143
     * @tc.desc Verify four points outside a rectangle are all rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0143 begin');
      await runCase('testPathApi0143', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        expect(path.contains(-1, 50)).assertFalse();
        expect(path.contains(101, 50)).assertFalse();
        expect(path.contains(50, -1)).assertFalse();
        expect(path.contains(50, 101)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0143 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0144
     * @tc.name testPathApi0144
     * @tc.desc Verify the circle corner of its bounding box is outside the contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0144 begin');
      await runCase('testPathApi0144', async () => {
        const path: drawing.Path = circlePath(50, 50, 50);
        expect(path.contains(50, 50)).assertTrue();
        expect(path.contains(5, 5)).assertFalse();
        expect(path.contains(95, 95)).assertFalse();
        expect(path.contains(5, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0145
     * @tc.name testPathApi0145
     * @tc.desc Verify a union of two circles contains both centres and their outer edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0145 begin');
      await runCase('testPathApi0145', async () => {
        const left: drawing.Path = circlePath(50, 50, 30);
        const right: drawing.Path = circlePath(100, 50, 30);
        expect(left.op(right, drawing.PathOp.UNION)).assertTrue();
        expect(left.contains(50, 50)).assertTrue();
        expect(left.contains(100, 50)).assertTrue();
        expect(left.getBounds().left < 25).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0146
     * @tc.name testPathApi0146
     * @tc.desc Verify subtracting a circle carves a hole in the middle of a rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0146 begin');
      await runCase('testPathApi0146', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const hole: drawing.Path = circlePath(50, 50, 20);
        expect(base.op(hole, drawing.PathOp.DIFFERENCE)).assertTrue();
        expect(base.contains(50, 50)).assertFalse();
        expect(base.contains(10, 10)).assertTrue();
        expect(base.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0147
     * @tc.name testPathApi0147
     * @tc.desc Verify a zero area rectangle contains no interior point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0147 begin');
      await runCase('testPathApi0147', async () => {
        const path: drawing.Path = rectPath(10, 10, 10, 10);
        expect(path.contains(10, 10)).assertFalse();
        expect(path.contains(11, 11)).assertFalse();
        expect(path.getLength(true)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0148
     * @tc.name testPathApi0148
     * @tc.desc Verify a sub pixel wide rectangle still contains its centre line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0148 begin');
      await runCase('testPathApi0148', async () => {
        const path: drawing.Path = rectPath(10, 10, 10.5, 60);
        expect(path.contains(10.25, 35)).assertTrue();
        expect(path.contains(10.25, 70)).assertFalse();
        expect(Math.abs(path.getLength(true) - 101) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0149
     * @tc.name testPathApi0149
     * @tc.desc Verify a five point star polygon walks six verbs and five points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0149 begin');
      await runCase('testPathApi0149', async () => {
        const points: common2D.Point[] = [];
        for (let index: number = 0; index < 5; index++) {
          points.push(point(100 + 60 * Math.cos((2 * Math.PI * index) / 5),
            100 + 60 * Math.sin((2 * Math.PI * index) / 5)));
        }
        const path: drawing.Path = new drawing.Path();
        path.addPolygon(points, true);
        expect(path.getVerbData().length).assertEqual(6);
        expect(path.getPointData().length).assertEqual(5);
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0150
     * @tc.name testPathApi0150
     * @tc.desc Verify repeated polygon points keep the verb count of a normal polygon.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0150 begin');
      await runCase('testPathApi0150', async () => {
        const points: common2D.Point[] = [point(0, 0), point(0, 0), point(40, 0), point(40, 40)];
        const path: drawing.Path = new drawing.Path();
        path.addPolygon(points, true);
        expect(path.getVerbData().length).assertEqual(5);
        expect(path.getBounds().right).assertEqual(40);
        expect(path.getLength(true) > 130).assertTrue();
        expect(path.getLength(true) < 140).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0150 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0151
     * @tc.name testPathApi0151
     * @tc.desc Verify a sixty four point polygon is recorded one verb per point plus close.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0151', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0151 begin');
      await runCase('testPathApi0151', async () => {
        const path: drawing.Path = polygonPath(64, 50);
        expect(path.getVerbData().length).assertEqual(65);
        expect(path.getPointData().length).assertEqual(64);
        expect(path.getBounds().right > 145).assertTrue();
        expect(path.getBounds().right < 155).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0151 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0152
     * @tc.name testPathApi0152
     * @tc.desc Verify closing a polygon adds exactly the first segment length back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0152', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0152 begin');
      await runCase('testPathApi0152', async () => {
        const open: drawing.Path = new drawing.Path();
        open.addPolygon([point(0, 0), point(30, 0), point(30, 40)], false);
        const closed: drawing.Path = new drawing.Path();
        closed.addPolygon([point(0, 0), point(30, 0), point(30, 40)], true);
        expect(Math.round(open.getLength(false))).assertEqual(70);
        expect(Math.round(closed.getLength(false))).assertEqual(120);
        expect(closed.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0152 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0153
     * @tc.name testPathApi0153
     * @tc.desc Verify move verbs alone contribute no length to a multi contour path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0153', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0153 begin');
      await runCase('testPathApi0153', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.moveTo(50, 50);
        path.moveTo(100, 100);
        expect(path.getVerbData().length).assertEqual(3);
        expect(path.getLength(false)).assertEqual(0);
        expect(path.getBounds().right).assertEqual(100);
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0153 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0154
     * @tc.name testPathApi0154
     * @tc.desc Verify setLastPoint then lineTo draws from the moved tail.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0154', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0154 begin');
      await runCase('testPathApi0154', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.setLastPoint(10, 0);
        path.lineTo(10, 40);
        const tail: common2D.Point = path.getLastPoint();
        expect(tail.x).assertEqual(10);
        expect(tail.y).assertEqual(40);
        expect(path.getBounds().bottom).assertEqual(40);
        expect(Math.round(path.getLength(false))).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0154 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0155
     * @tc.name testPathApi0155
     * @tc.desc Verify a circle unioned with a rectangle contains a centre of each shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0155', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0155 begin');
      await runCase('testPathApi0155', async () => {
        const base: drawing.Path = rectPath(0, 0, 60, 60);
        const disc: drawing.Path = circlePath(100, 100, 40);
        expect(base.op(disc, drawing.PathOp.UNION)).assertTrue();
        expect(base.contains(30, 30)).assertTrue();
        expect(base.contains(100, 100)).assertTrue();
        expect(base.getBounds().right).assertEqual(140);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0155 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0156
     * @tc.name testPathApi0156
     * @tc.desc Verify intersecting with a circle trims the rectangle corners off.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0156', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0156 begin');
      await runCase('testPathApi0156', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const disc: drawing.Path = circlePath(50, 50, 40);
        expect(base.op(disc, drawing.PathOp.INTERSECT)).assertTrue();
        expect(base.contains(50, 50)).assertTrue();
        expect(base.contains(5, 5)).assertFalse();
        expect(base.getBounds().right).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0156 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0157
     * @tc.name testPathApi0157
     * @tc.desc Verify two chained unions accumulate the bounds of all three shapes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0157', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0157 begin');
      await runCase('testPathApi0157', async () => {
        const base: drawing.Path = rectPath(0, 0, 40, 40);
        base.op(rectPath(60, 60, 100, 100), drawing.PathOp.UNION);
        base.op(rectPath(120, 120, 160, 160), drawing.PathOp.UNION);
        expect(base.contains(20, 20)).assertTrue();
        expect(base.contains(140, 140)).assertTrue();
        expect(base.getBounds().right).assertEqual(160);
        expect(base.getBounds().bottom).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0157 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0158
     * @tc.name testPathApi0158
     * @tc.desc Verify a boolean operation keeps the fill type that was set before it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0158', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0158 begin');
      await runCase('testPathApi0158', async () => {
        const base: drawing.Path = rectPath(0, 0, 80, 80);
        base.setFillType(drawing.PathFillType.EVEN_ODD);
        base.op(rectPath(40, 40, 120, 120), drawing.PathOp.UNION);
        expect(base.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(base.isInverseFillType()).assertFalse();
        expect(base.contains(10, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0158 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0159
     * @tc.name testPathApi0159
     * @tc.desc Verify a union of a path with itself leaves the same box and length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0159', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0159 begin');
      await runCase('testPathApi0159', async () => {
        const rect: drawing.Path = rectPath(0, 0, 50, 50);
        const base: drawing.Path = new drawing.Path(rect);
        expect(base.op(rect, drawing.PathOp.UNION)).assertTrue();
        expect(base.getBounds().right).assertEqual(50);
        expect(Math.round(base.getLength(true))).assertEqual(200);
        expect(base.contains(25, 25)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0159 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0160
     * @tc.name testPathApi0160
     * @tc.desc Verify an XOR of a path with itself erases the filled area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0160', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0160 begin');
      await runCase('testPathApi0160', async () => {
        const rect: drawing.Path = rectPath(0, 0, 40, 40);
        const base: drawing.Path = new drawing.Path(rect);
        base.op(rect, drawing.PathOp.XOR);
        expect(base.contains(20, 20)).assertFalse();
        expect(base.getLength(true) < 1).assertTrue();
        expect(base.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0160 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0161
     * @tc.name testPathApi0161
     * @tc.desc Verify a bare move and close svg keeps the single start point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0161', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0161 begin');
      await runCase('testPathApi0161', async () => {
        const path: drawing.Path = new drawing.Path();
        const parsed: boolean = path.buildFromSvgString('M10 10 Z');
        expect(parsed).assertTrue();
        expect(path.getBounds().left).assertEqual(10);
        expect(path.getBounds().top).assertEqual(10);
        expect(path.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0161 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0162
     * @tc.name testPathApi0162
     * @tc.desc Verify two closed svg subpaths produce two close verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0162', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0162 begin');
      await runCase('testPathApi0162', async () => {
        const path: drawing.Path = new drawing.Path();
        path.buildFromSvgString('M0 0 L10 10 Z M20 20 L30 30 Z');
        const verbs: drawing.PathIteratorVerb[] = path.getVerbData();
        let closes: number = 0;
        for (let index: number = 0; index < verbs.length; index++) {
          if (verbs[index] === drawing.PathIteratorVerb.CLOSE) {
            closes += 1;
          }
        }
        expect(verbs.length).assertEqual(6);
        expect(closes).assertEqual(2);
        expect(path.getBounds().bottom).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0162 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0163
     * @tc.name testPathApi0163
     * @tc.desc Verify svg commands separated by extra spaces still parse into two verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0163', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0163 begin');
      await runCase('testPathApi0163', async () => {
        const path: drawing.Path = new drawing.Path();
        const parsed: boolean = path.buildFromSvgString('M 0 0   L 10 0');
        expect(parsed).assertTrue();
        expect(path.getVerbData().length).assertEqual(2);
        expect(path.getBounds().right).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0163 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0164
     * @tc.name testPathApi0164
     * @tc.desc Verify fractional svg coordinates are preserved in the bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0164', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0164 begin');
      await runCase('testPathApi0164', async () => {
        const path: drawing.Path = new drawing.Path();
        path.buildFromSvgString('M0.5 0.5 L10.5 10.5');
        const bounds: common2D.Rect = path.getBounds();
        expect(Math.abs(bounds.left - 0.5) < 0.01).assertTrue();
        expect(Math.abs(bounds.right - 10.5) < 0.01).assertTrue();
        expect(Math.abs(path.getLength(false) - Math.sqrt(200)) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0164 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0165
     * @tc.name testPathApi0165
     * @tc.desc Verify the lower case and upper case close commands build equal paths.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0165', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0165 begin');
      await runCase('testPathApi0165', async () => {
        const upper: drawing.Path = new drawing.Path();
        upper.buildFromSvgString('M0 0 L20 0 L20 20 Z');
        const lower: drawing.Path = new drawing.Path();
        lower.buildFromSvgString('M0 0 L20 0 L20 20 z');
        expect(upper.isEqual(lower)).assertTrue();
        expect(lower.isClosed()).assertTrue();
        expect(Math.round(lower.getLength(true))).assertEqual(68);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0165 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0166
     * @tc.name testPathApi0166
     * @tc.desc Verify an empty svg string is rejected without polluting the path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0166', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0166 begin');
      await runCase('testPathApi0166', async () => {
        const path: drawing.Path = new drawing.Path();
        let parsed: boolean = true;
        let threw: boolean = false;
        try {
          parsed = path.buildFromSvgString('');
        } catch (error) {
          threw = true;
        }
        expect(threw || !parsed).assertFalse();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0166 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0167
     * @tc.name testPathApi0167
     * @tc.desc Verify set copies the contour so later edits to the copy are isolated.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0167', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0167 begin');
      await runCase('testPathApi0167', async () => {
        const source: drawing.Path = rectPath(0, 0, 30, 30);
        const copy: drawing.Path = new drawing.Path();
        copy.set(source);
        copy.offset(70, 0);
        expect(source.getBounds().right).assertEqual(30);
        expect(copy.getBounds().left).assertEqual(0);
        expect(source.isEqual(copy)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0167 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0168
     * @tc.name testPathApi0168
     * @tc.desc Verify reset clears recorded conic weights as well as geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0168', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0168 begin');
      await runCase('testPathApi0168', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(10, 20, 20, 0, 0.7);
        expect(path.getConicWeightData().length).assertEqual(1);
        path.reset();
        expect(path.getConicWeightData().length).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0168 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0169
     * @tc.name testPathApi0169
     * @tc.desc Verify a rewound path accepts new drawing commands again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0169', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0169 begin');
      await runCase('testPathApi0169', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        path.rewind();
        expect(path.isEmpty()).assertTrue();
        path.moveTo(0, 0);
        path.lineTo(30, 40);
        expect(path.getVerbData().length).assertEqual(2);
        expect(Math.round(path.getLength(false))).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0169 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0170
     * @tc.name testPathApi0170
     * @tc.desc Verify the defaults of a fresh path are empty winding and open.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0170', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0170 begin');
      await runCase('testPathApi0170', async () => {
        const path: drawing.Path = new drawing.Path();
        expect(path.isEmpty()).assertTrue();
        expect(path.isClosed()).assertFalse();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(path.isInverseFillType()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0170 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0171
     * @tc.name testPathApi0171
     * @tc.desc Verify a negative offset moves the contour up and to the left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0171', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0171 begin');
      await runCase('testPathApi0171', async () => {
        const shifted: drawing.Path = rectPath(50, 50, 90, 90).offset(-20, -30);
        const bounds: common2D.Rect = shifted.getBounds();
        expect(bounds.left).assertEqual(30);
        expect(bounds.top).assertEqual(20);
        expect(bounds.right).assertEqual(70);
        expect(bounds.bottom).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0171 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0172
     * @tc.name testPathApi0172
     * @tc.desc Verify offset returns a new path and leaves the receiver in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0172', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0172 begin');
      await runCase('testPathApi0172', async () => {
        const source: drawing.Path = rectPath(0, 0, 10, 10);
        const shifted: drawing.Path = source.offset(100, 100);
        expect(source.getBounds().left).assertEqual(0);
        expect(shifted.getBounds().left).assertEqual(100);
        expect(shifted.isEqual(source)).assertFalse();
        expect(Math.round(shifted.getLength(true))).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0172 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0173
     * @tc.name testPathApi0173
     * @tc.desc Verify changing the fill type of a copy leaves the source fill type alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0173', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0173 begin');
      await runCase('testPathApi0173', async () => {
        const source: drawing.Path = rectPath(0, 0, 20, 20);
        const copy: drawing.Path = new drawing.Path(source);
        copy.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(source.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(copy.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(copy.getBounds().right).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0173 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0174
     * @tc.name testPathApi0174
     * @tc.desc Verify emptiness flips on as soon as the first point is recorded.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0174', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0174 begin');
      await runCase('testPathApi0174', async () => {
        const path: drawing.Path = new drawing.Path();
        expect(path.isEmpty()).assertTrue();
        path.moveTo(5, 5);
        expect(path.isEmpty()).assertFalse();
        path.lineTo(5, 5);
        expect(path.getVerbData().length).assertEqual(2);
        path.reset();
        expect(path.isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0174 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0175
     * @tc.name testPathApi0175
     * @tc.desc Verify one million pixel coordinates survive without clamping.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0175', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0175 begin');
      await runCase('testPathApi0175', async () => {
        const path: drawing.Path = rectPath(1000000, 1000000, 1000200, 1000200);
        expect(path.contains(1000100, 1000100)).assertTrue();
        expect(path.contains(999999, 1000100)).assertFalse();
        expect(path.isRect(null)).assertTrue();
        expect(Math.round(path.getLength(true))).assertEqual(800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0175 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0176
     * @tc.name testPathApi0176
     * @tc.desc Verify an extremely large circle radius is honoured in bounds and length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0176', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0176 begin');
      await runCase('testPathApi0176', async () => {
        const path: drawing.Path = circlePath(0, 0, 100000);
        const bounds: common2D.Rect = path.getBounds();
        expect(Math.round(bounds.left)).assertEqual(-100000);
        expect(Math.round(bounds.right)).assertEqual(100000);
        expect(path.getLength(false) > 600000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0176 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0177
     * @tc.name testPathApi0177
     * @tc.desc Verify a zero size rectangle keeps its anchor in a degenerate box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0177', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0177 begin');
      await runCase('testPathApi0177', async () => {
        const path: drawing.Path = rectPath(10, 10, 10, 10);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(10);
        expect(bounds.right - bounds.left).assertEqual(0);
        expect(bounds.bottom - bounds.top).assertEqual(0);
        expect(path.getLength(true)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0177 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0178
     * @tc.name testPathApi0178
     * @tc.desc Verify a thousand unit segments accumulate one thousand units of length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0178', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0178 begin');
      await runCase('testPathApi0178', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        for (let index: number = 0; index < 1000; index++) {
          path.lineTo(index + 1, 0);
        }
        expect(path.getVerbData().length).assertEqual(1001);
        expect(Math.round(path.getLength(false))).assertEqual(1000);
        expect(path.getBounds().right).assertEqual(1000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0178 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0179
     * @tc.name testPathApi0179
     * @tc.desc Verify a tighter acceptable error yields at least as many approximate points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0179', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0179 begin');
      await runCase('testPathApi0179', async () => {
        const precise: number[] = circlePath(50, 50, 40).approximate(0.1);
        const coarse: number[] = circlePath(50, 50, 40).approximate(50);
        expect(precise.length % 3).assertEqual(0);
        expect(coarse.length % 3).assertEqual(0);
        expect(precise.length >= coarse.length).assertTrue();
        expect(precise.length >= 12).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0179 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0180
     * @tc.name testPathApi0180
     * @tc.desc Verify a weight of one interpolation reproduces the second rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0180', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0180 begin');
      await runCase('testPathApi0180', async () => {
        const start: drawing.Path = rectPath(0, 0, 50, 50);
        const end: drawing.Path = rectPath(50, 50, 100, 100);
        const out: drawing.Path = new drawing.Path();
        expect(start.interpolate(end, 1, out)).assertTrue();
        expect(out.getBounds().left).assertEqual(0);
        expect(out.getBounds().right).assertEqual(50);
        expect(out.isEqual(end)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0180 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0181
     * @tc.name testPathApi0181
     * @tc.desc Verify a quarter weight interpolation lands a quarter of the way across.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0181', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0181 begin');
      await runCase('testPathApi0181', async () => {
        const start: drawing.Path = rectPath(0, 0, 50, 50);
        const end: drawing.Path = rectPath(50, 50, 100, 100);
        const out: drawing.Path = new drawing.Path();
        start.interpolate(end, 0.25, out);
        expect(Math.round(out.getBounds().left)).assertEqual(38);
        expect(Math.round(out.getBounds().right)).assertEqual(88);
        expect(out.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0181 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0182
     * @tc.name testPathApi0182
     * @tc.desc Verify a rectangle and a circle are not interpolatable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0182', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0182 begin');
      await runCase('testPathApi0182', async () => {
        const rect: drawing.Path = rectPath(0, 0, 40, 40);
        const disc: drawing.Path = circlePath(60, 60, 20);
        expect(rect.isInterpolate(disc)).assertFalse();
        expect(disc.isInterpolate(rect)).assertFalse();
        expect(rect.isInterpolate(rect)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0182 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0183
     * @tc.name testPathApi0183
     * @tc.desc Verify two rectangles of the same structure are mutually interpolatable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0183', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0183 begin');
      await runCase('testPathApi0183', async () => {
        const first: drawing.Path = rectPath(0, 0, 10, 10);
        const second: drawing.Path = rectPath(40, 40, 90, 90);
        expect(first.isInterpolate(second)).assertTrue();
        expect(second.isInterpolate(first)).assertTrue();
        expect(first.isEqual(second)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0183 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0184
     * @tc.name testPathApi0184
     * @tc.desc Verify a build transform op offset chain ends with a parsable svg path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0184', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0184 begin');
      await runCase('testPathApi0184', async () => {
        const base: drawing.Path = rectPath(0, 0, 40, 40);
        base.op(rectPath(60, 0, 100, 40), drawing.PathOp.UNION);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        base.transform(matrix);
        const shifted: drawing.Path = base.offset(10, 10);
        const restored: drawing.Path = new drawing.Path();
        expect(restored.buildFromSvgString(shifted.convertToSvgString())).assertTrue();
        expect(restored.isEqual(shifted)).assertFalse();
        expect(restored.getBounds().right).assertEqual(210);
        expect(restored.getBounds().bottom).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0184 end');
    });
  });
}
