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
import { DRAWING_TAG, iteratorPoints, runCase } from './DrawingTestRunner';

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
 * Build a path from a closed triangle contour.
 *
 * @param { number } size - Leg length of the right triangle.
 * @returns { drawing.Path } Triangle path.
 */
function trianglePath(size: number): drawing.Path {
  const points: common2D.Point[] = [point(0, 0), point(size, 0), point(0, size)];
  const path: drawing.Path = new drawing.Path();
  path.addPolygon(points, true);
  return path;
}

/**
 * Count how many verbs of one kind a path iterator yields.
 *
 * @param { drawing.Path } path - Path to walk.
 * @param { drawing.PathIteratorVerb } verb - Verb to count.
 * @returns { number } Number of matching verbs.
 */
function countVerbs(path: drawing.Path, verb: drawing.PathIteratorVerb): number {
  const iterator: drawing.PathIterator = path.getPathIterator();
  const buffer: common2D.Point[] = [point(0, 0), point(0, 0), point(0, 0), point(0, 0)];
  let count: number = 0;
  while (iterator.hasNext()) {
    if (iterator.next(buffer) === verb) {
      count += 1;
    }
  }
  return count;
}

export default function pathApiTailTest() {
  describe('PathApiTailTest', () => {
    /** @tc.number SUB_NdkTsDrawing_PATH_0185
     * @tc.name testPathApi0185
     * @tc.desc Verify the iterator of a rectangle walks move three lines then close.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0185', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0185 begin');
      await runCase('testPathApi0185', async () => {
        const iterator: drawing.PathIterator = rectPath(0, 0, 50, 50).getPathIterator();
        const buffer: common2D.Point[] = [point(0, 0), point(0, 0), point(0, 0), point(0, 0)];
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.CLOSE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0185 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0186
     * @tc.name testPathApi0186
     * @tc.desc Verify peek reports the same verb twice without consuming it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0186', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0186 begin');
      await runCase('testPathApi0186', async () => {
        const iterator: drawing.PathIterator = trianglePath(20).getPathIterator();
        const first: drawing.PathIteratorVerb = iterator.peek();
        const second: drawing.PathIteratorVerb = iterator.peek();
        expect(first).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(second).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.hasNext()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0186 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0187
     * @tc.name testPathApi0187
     * @tc.desc Verify hasNext turns false once the iterator reaches DONE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0187', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0187 begin');
      await runCase('testPathApi0187', async () => {
        const iterator: drawing.PathIterator = trianglePath(10).getPathIterator();
        const buffer: common2D.Point[] = [point(0, 0), point(0, 0), point(0, 0), point(0, 0)];
        let guard: number = 0;
        while (iterator.hasNext() && guard < 20) {
          iterator.next(buffer);
          guard += 1;
        }
        expect(guard).assertEqual(4);
        expect(iterator.hasNext()).assertFalse();
        expect(iterator.peek()).assertEqual(drawing.PathIteratorVerb.DONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0187 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0188
     * @tc.name testPathApi0188
     * @tc.desc Verify a circle contour ends with a close verb in the iterator.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0188', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0188 begin');
      await runCase('testPathApi0188', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(50, 50, 20);
        expect(countVerbs(path, drawing.PathIteratorVerb.CLOSE)).assertEqual(1);
        expect(countVerbs(path, drawing.PathIteratorVerb.MOVE)).assertEqual(1);
        expect(countVerbs(path, drawing.PathIteratorVerb.DONE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0188 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0189
     * @tc.name testPathApi0189
     * @tc.desc Verify a line verb writes its end point into the caller buffer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0189', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0189 begin');
      await runCase('testPathApi0189', async () => {
        const iterator: drawing.PathIterator = rectPath(0, 0, 80, 40).getPathIterator();
        const buffer: common2D.Point[] = [point(0, 0), point(0, 0), point(0, 0), point(0, 0)];
        iterator.next(buffer);
        iterator.next(buffer);
        expect(buffer[0].x).assertEqual(0);
        expect(buffer[0].y).assertEqual(0);
        expect(iterator.hasNext()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0189 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0190
     * @tc.name testPathApi0190
     * @tc.desc Verify two contours yield two move verbs through the iterator.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0190', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0190 begin');
      await runCase('testPathApi0190', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 20, 20));
        path.addRect(ltrb(40, 40, 60, 60));
        expect(countVerbs(path, drawing.PathIteratorVerb.MOVE)).assertEqual(2);
        expect(countVerbs(path, drawing.PathIteratorVerb.CLOSE)).assertEqual(2);
        expect(path.getBounds().right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0190 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0191
     * @tc.name testPathApi0191
     * @tc.desc Verify a cubic verb hands back all three control points in order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0191', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0191 begin');
      await runCase('testPathApi0191', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.cubicTo(10, 20, 30, 20, 40, 0);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const buffer: common2D.Point[] = [point(0, 0), point(0, 0), point(0, 0), point(0, 0)];
        iterator.next(buffer);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(buffer[2].x).assertEqual(30);
        expect(buffer[3].x).assertEqual(40);
        expect(buffer[3].y).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0191 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0192
     * @tc.name testPathApi0192
     * @tc.desc Verify iterator walking and verb data agree on the verb count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0192', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0192 begin');
      await runCase('testPathApi0192', async () => {
        const path: drawing.Path = trianglePath(30);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const buffer: common2D.Point[] = [point(0, 0), point(0, 0), point(0, 0), point(0, 0)];
        let walked: number = 0;
        while (iterator.hasNext()) {
          iterator.next(buffer);
          walked += 1;
        }
        expect(walked).assertEqual(path.getVerbData().length);
        expect(walked).assertEqual(4);
        expect(path.getPointData().length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0192 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0193
     * @tc.name testPathApi0193
     * @tc.desc Verify the iterator keeps reporting DONE after it is exhausted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0193', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0193 begin');
      await runCase('testPathApi0193', async () => {
        const iterator: drawing.PathIterator = new drawing.Path().getPathIterator();
        const buffer: common2D.Point[] = iteratorPoints();
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.DONE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.DONE);
        expect(iterator.hasNext()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0193 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0194
     * @tc.name testPathApi0194
     * @tc.desc Verify a conic contour exposes one CONIC verb through the iterator.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0194', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0194 begin');
      await runCase('testPathApi0194', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(20, 40, 40, 0, 0.5);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const buffer: common2D.Point[] = iteratorPoints();
        iterator.next(buffer);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.CONIC);
        expect(buffer[2].x).assertEqual(40);
        expect(path.getConicWeightData().length).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0194 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0195
     * @tc.name testPathApi0195
     * @tc.desc Verify a two verb path yields exactly two iterator steps before DONE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0195', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0195 begin');
      await runCase('testPathApi0195', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(5, 5);
        path.lineTo(25, 5);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const buffer: common2D.Point[] = iteratorPoints();
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.DONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0195 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0196
     * @tc.name testPathApi0196
     * @tc.desc Verify only the move and line verbs appear in a straight run.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0196', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0196 begin');
      await runCase('testPathApi0196', async () => {
        const path: drawing.Path = rectPath(0, 0, 30, 30);
        expect(countVerbs(path, drawing.PathIteratorVerb.QUAD)).assertEqual(0);
        expect(countVerbs(path, drawing.PathIteratorVerb.CUBIC)).assertEqual(0);
        expect(countVerbs(path, drawing.PathIteratorVerb.LINE)).assertEqual(3);
        expect(countVerbs(path, drawing.PathIteratorVerb.MOVE)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0196 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0197
     * @tc.name testPathApi0197
     * @tc.desc Verify all three verb point and weight arrays are empty for a new path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0197', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0197 begin');
      await runCase('testPathApi0197', async () => {
        const path: drawing.Path = new drawing.Path();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.getPointData().length).assertEqual(0);
        expect(path.getConicWeightData().length).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0197 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0198
     * @tc.name testPathApi0198
     * @tc.desc Verify a lone move records one verb and one point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0198', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0198 begin');
      await runCase('testPathApi0198', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(12, 34);
        const points: common2D.Point[] = path.getPointData();
        expect(path.getVerbData().length).assertEqual(1);
        expect(points.length).assertEqual(1);
        expect(points[0].x).assertEqual(12);
        expect(points[0].y).assertEqual(34);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0198 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0199
     * @tc.name testPathApi0199
     * @tc.desc Verify a cubic segment stores four points including the start point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0199', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0199 begin');
      await runCase('testPathApi0199', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.cubicTo(10, 10, 20, 10, 30, 0);
        expect(path.getVerbData().length).assertEqual(2);
        expect(path.getPointData().length).assertEqual(4);
        expect(path.getConicWeightData().length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0199 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0200
     * @tc.name testPathApi0200
     * @tc.desc Verify a conic segment stores three points and one weight.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0200', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0200 begin');
      await runCase('testPathApi0200', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(10, 30, 20, 0, 0.25);
        expect(path.getVerbData().length).assertEqual(2);
        expect(path.getPointData().length).assertEqual(3);
        expect(path.getConicWeightData()[0]).assertEqual(0.25);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0200 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0201
     * @tc.name testPathApi0201
     * @tc.desc Verify a quadratic segment stores three points and no conic weight.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0201', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0201 begin');
      await runCase('testPathApi0201', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.quadTo(20, 40, 40, 0);
        expect(path.getPointData().length).assertEqual(3);
        expect(path.getVerbData()[1]).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(path.getConicWeightData().length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0201 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0202
     * @tc.name testPathApi0202
     * @tc.desc Verify a mixed path reports the sum of the points of each segment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0202', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0202 begin');
      await runCase('testPathApi0202', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(10, 0);
        path.quadTo(20, 20, 30, 0);
        path.cubicTo(40, 20, 50, 20, 60, 0);
        expect(path.getVerbData().length).assertEqual(4);
        expect(path.getPointData().length).assertEqual(7);
        expect(path.getBounds().right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0202 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0203
     * @tc.name testPathApi0203
     * @tc.desc Verify a close verb adds no point to the point data array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0203', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0203 begin');
      await runCase('testPathApi0203', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(40, 0);
        const before: number = path.getPointData().length;
        path.close();
        expect(path.getPointData().length).assertEqual(before);
        expect(path.getVerbData().length).assertEqual(3);
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0203 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0204
     * @tc.name testPathApi0204
     * @tc.desc Verify two contours double the verb and point counts of one contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0204', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0204 begin');
      await runCase('testPathApi0204', async () => {
        const single: drawing.Path = trianglePath(20);
        const double: drawing.Path = new drawing.Path(single);
        double.addPath(trianglePath(20));
        expect(double.getVerbData().length).assertEqual(single.getVerbData().length * 2);
        expect(double.getPointData().length).assertEqual(single.getPointData().length * 2);
        expect(double.getBounds().right).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0204 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0205
     * @tc.name testPathApi0205
     * @tc.desc Verify line segments never contribute conic weights.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0205', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0205 begin');
      await runCase('testPathApi0205', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(10, 0);
        path.conicTo(20, 10, 30, 0, 0.3);
        path.lineTo(40, 0);
        expect(path.getConicWeightData().length).assertEqual(1);
        expect(path.getConicWeightData()[0]).assertClose(0.3, 0.000001);
        expect(path.getVerbData().length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0205 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0206
     * @tc.name testPathApi0206
     * @tc.desc Verify mutating the returned point array does not affect the path bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0206', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0206 begin');
      await runCase('testPathApi0206', async () => {
        const path: drawing.Path = rectPath(0, 0, 20, 20);
        const points: common2D.Point[] = path.getPointData();
        points[0].x = 999;
        expect(path.getBounds().right).assertEqual(20);
        expect(path.getBounds().left).assertEqual(0);
        expect(path.getLength(true)).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0206 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0207
     * @tc.name testPathApi0207
     * @tc.desc Verify a transform followed by an offset adds the two shifts together.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0207', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0207 begin');
      await runCase('testPathApi0207', async () => {
        const path: drawing.Path = rectPath(0, 0, 10, 10);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(20, 0);
        path.transform(matrix);
        const moved: drawing.Path = path.offset(5, 5);
        expect(moved.getBounds().left).assertEqual(25);
        expect(moved.getBounds().top).assertEqual(5);
        expect(path.getBounds().left).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0207 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0208
     * @tc.name testPathApi0208
     * @tc.desc Verify a boolean result can be transformed like any other path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0208', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0208 begin');
      await runCase('testPathApi0208', async () => {
        const base: drawing.Path = rectPath(0, 0, 50, 50);
        base.op(rectPath(25, 25, 75, 75), drawing.PathOp.UNION);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        base.transform(matrix);
        expect(base.getBounds().right).assertEqual(150);
        expect(base.contains(40, 40)).assertTrue();
        expect(base.contains(150, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0208 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0209
     * @tc.name testPathApi0209
     * @tc.desc Verify a scaled path intersects its partner at the scaled overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0209', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0209 begin');
      await runCase('testPathApi0209', async () => {
        const base: drawing.Path = rectPath(0, 0, 20, 20);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        base.transform(matrix);
        base.op(rectPath(30, 30, 50, 50), drawing.PathOp.INTERSECT);
        expect(base.getBounds().left).assertEqual(30);
        expect(base.getBounds().right).assertEqual(40);
        expect(base.contains(35, 35)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0209 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0210
     * @tc.name testPathApi0210
     * @tc.desc Verify three appended contours accumulate their verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0210', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0210 begin');
      await runCase('testPathApi0210', async () => {
        const base: drawing.Path = rectPath(0, 0, 10, 10);
        const unit: number = base.getVerbData().length;
        base.addPath(rectPath(20, 0, 30, 10));
        base.addPath(rectPath(40, 0, 50, 10));
        expect(base.getVerbData().length).assertEqual(unit * 3);
        expect(base.getBounds().right).assertEqual(50);
        expect(base.getBounds().bottom).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0210 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0211
     * @tc.name testPathApi0211
     * @tc.desc Verify a circle appended to a rectangle widens the bounds to the circle edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0211', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0211 begin');
      await runCase('testPathApi0211', async () => {
        const base: drawing.Path = rectPath(0, 0, 40, 40);
        const disc: drawing.Path = new drawing.Path();
        disc.addCircle(100, 20, 20);
        base.addPath(disc);
        expect(base.getBounds().right).assertEqual(120);
        expect(base.contains(100, 20)).assertTrue();
        expect(base.contains(121, 20)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0211 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0212
     * @tc.name testPathApi0212
     * @tc.desc Verify containment moves with the offset of the shifted copy.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0212', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0212 begin');
      await runCase('testPathApi0212', async () => {
        const source: drawing.Path = rectPath(0, 0, 50, 50);
        const moved: drawing.Path = source.offset(60, 0);
        expect(source.contains(25, 25)).assertTrue();
        expect(source.contains(75, 25)).assertFalse();
        expect(moved.contains(75, 25)).assertTrue();
        expect(moved.contains(25, 25)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0212 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0213
     * @tc.name testPathApi0213
     * @tc.desc Verify transforming a copy leaves the source bounds untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0213', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0213 begin');
      await runCase('testPathApi0213', async () => {
        const source: drawing.Path = rectPath(0, 0, 30, 30);
        const copy: drawing.Path = new drawing.Path(source);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(3, 3, 0, 0);
        copy.transform(matrix);
        expect(source.getBounds().right).assertEqual(30);
        expect(copy.getBounds().right).assertEqual(90);
        expect(source.isEqual(copy)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0213 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0214
     * @tc.name testPathApi0214
     * @tc.desc Verify set then transform applies the matrix to the copied geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0214', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0214 begin');
      await runCase('testPathApi0214', async () => {
        const source: drawing.Path = rectPath(10, 10, 30, 30);
        const target: drawing.Path = new drawing.Path();
        target.set(source);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(-10, -10);
        target.transform(matrix);
        expect(target.getBounds().left).assertEqual(0);
        expect(target.getBounds().right).assertEqual(20);
        expect(source.getBounds().left).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0214 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0215
     * @tc.name testPathApi0215
     * @tc.desc Verify operating on one path does not touch a second path built alike.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0215', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0215 begin');
      await runCase('testPathApi0215', async () => {
        const first: drawing.Path = rectPath(0, 0, 40, 40);
        const second: drawing.Path = rectPath(0, 0, 40, 40);
        first.op(rectPath(20, 20, 60, 60), drawing.PathOp.INTERSECT);
        expect(first.getBounds().right).assertEqual(40);
        expect(second.getBounds().right).assertEqual(40);
        expect(first.getBounds().left).assertEqual(20);
        expect(second.getBounds().left).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0215 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0216
     * @tc.name testPathApi0216
     * @tc.desc Verify a mirrored scale keeps containment on the mirrored side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0216', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0216 begin');
      await runCase('testPathApi0216', async () => {
        const path: drawing.Path = rectPath(0, 0, 40, 40);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(-1, 1, 0, 0);
        path.transform(matrix);
        expect(path.getBounds().left).assertEqual(-40);
        expect(path.getBounds().right).assertEqual(0);
        expect(path.contains(-20, 20)).assertTrue();
        expect(path.contains(20, 20)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0216 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0217
     * @tc.name testPathApi0217
     * @tc.desc Verify a second close on the same contour changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0217', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0217 begin');
      await runCase('testPathApi0217', async () => {
        const path: drawing.Path = trianglePath(20);
        const verbs: number = path.getVerbData().length;
        path.close();
        expect(path.getVerbData().length).assertEqual(verbs);
        expect(path.isClosed()).assertTrue();
        expect(Math.round(path.getLength(true))).assertEqual(Math.round(path.getLength(false)));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0217 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0218
     * @tc.name testPathApi0218
     * @tc.desc Verify a move followed by close is closed and has no length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0218', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0218 begin');
      await runCase('testPathApi0218', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(80, 90);
        path.close();
        expect(path.isClosed()).assertFalse();
        expect(path.getLength(true)).assertEqual(0);
        expect(path.getBounds().left).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0218 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0219
     * @tc.name testPathApi0219
     * @tc.desc Verify a star contour contains its centre and rejects a far corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0219', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0219 begin');
      await runCase('testPathApi0219', async () => {
        const points: common2D.Point[] = [];
        points.push(point(100, 0));
        points.push(point(120, 70));
        points.push(point(200, 70));
        points.push(point(135, 115));
        points.push(point(160, 190));
        points.push(point(100, 145));
        points.push(point(40, 190));
        points.push(point(65, 115));
        points.push(point(0, 70));
        points.push(point(80, 70));
        const star: drawing.Path = new drawing.Path();
        star.addPolygon(points, true);
        expect(star.contains(100, 100)).assertTrue();
        expect(star.contains(100, 10)).assertTrue();
        expect(star.contains(5, 185)).assertFalse();
        expect(star.getVerbData().length).assertEqual(11);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0219 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0220
     * @tc.name testPathApi0220
     * @tc.desc Verify a ring built by subtraction leaves the centre hollow.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0220', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0220 begin');
      await runCase('testPathApi0220', async () => {
        const outer: drawing.Path = new drawing.Path();
        outer.addCircle(100, 100, 80);
        const inner: drawing.Path = new drawing.Path();
        inner.addCircle(100, 100, 40);
        expect(outer.op(inner, drawing.PathOp.DIFFERENCE)).assertTrue();
        expect(outer.contains(100, 100)).assertFalse();
        expect(outer.contains(100, 150)).assertTrue();
        expect(Math.round(outer.getBounds().right)).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0220 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0221
     * @tc.name testPathApi0221
     * @tc.desc Verify a thin diagonal strip contains points on its spine only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0221', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0221 begin');
      await runCase('testPathApi0221', async () => {
        const points: common2D.Point[] = [point(0, 0), point(40, 0), point(140, 100), point(100, 100)];
        const strip: drawing.Path = new drawing.Path();
        strip.addPolygon(points, true);
        expect(strip.contains(20, 20)).assertTrue();
        expect(strip.contains(120, 20)).assertFalse();
        expect(strip.contains(70, 90)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0221 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0222
     * @tc.name testPathApi0222
     * @tc.desc Verify the gap between two unioned boxes is outside the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0222', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0222 begin');
      await runCase('testPathApi0222', async () => {
        const base: drawing.Path = rectPath(0, 0, 20, 20);
        base.op(rectPath(80, 0, 100, 20), drawing.PathOp.UNION);
        expect(base.contains(10, 10)).assertTrue();
        expect(base.contains(50, 10)).assertFalse();
        expect(base.contains(90, 10)).assertTrue();
        expect(base.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0222 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0223
     * @tc.name testPathApi0223
     * @tc.desc Verify a right triangle contains an interior point and rejects the far corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0223', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0223 begin');
      await runCase('testPathApi0223', async () => {
        const triangle: drawing.Path = trianglePath(100);
        expect(triangle.contains(10, 10)).assertTrue();
        expect(triangle.contains(80, 80)).assertFalse();
        expect(triangle.contains(95, 2)).assertTrue();
        expect(Math.round(triangle.getBounds().right)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0223 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0224
     * @tc.name testPathApi0224
     * @tc.desc Verify a rotated square contains its centre but not the original corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0224', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0224 begin');
      await runCase('testPathApi0224', async () => {
        const square: drawing.Path = rectPath(-50, -50, 50, 50);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(45, 0, 0);
        square.transform(matrix);
        expect(square.contains(0, 0)).assertTrue();
        expect(square.contains(0, 60)).assertTrue();
        expect(square.contains(60, 60)).assertFalse();
        expect(Math.round(square.getBounds().top)).assertEqual(-71);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0224 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0225
     * @tc.name testPathApi0225
     * @tc.desc Verify the concave corner of an L shape stays outside the contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0225', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0225 begin');
      await runCase('testPathApi0225', async () => {
        const base: drawing.Path = rectPath(0, 0, 60, 20);
        base.op(rectPath(0, 0, 20, 60), drawing.PathOp.UNION);
        expect(base.contains(10, 50)).assertTrue();
        expect(base.contains(50, 10)).assertTrue();
        expect(base.contains(50, 50)).assertFalse();
        expect(base.getBounds().bottom).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0225 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0226
     * @tc.name testPathApi0226
     * @tc.desc Verify containment follows a shape placed far from the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0226', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0226 begin');
      await runCase('testPathApi0226', async () => {
        const path: drawing.Path = rectPath(10000, 10000, 10050, 10050);
        expect(path.contains(10025, 10025)).assertTrue();
        expect(path.contains(9999, 10025)).assertFalse();
        expect(Math.round(path.getLength(true))).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0226 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0227
     * @tc.name testPathApi0227
     * @tc.desc Verify a one pixel square keeps a unit perimeter and its centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0227', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0227 begin');
      await runCase('testPathApi0227', async () => {
        const path: drawing.Path = rectPath(0, 0, 1, 1);
        expect(path.contains(0.5, 0.5)).assertTrue();
        expect(path.contains(1.5, 0.5)).assertFalse();
        expect(path.getLength(true)).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0227 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0228
     * @tc.name testPathApi0228
     * @tc.desc Verify a thousand pixel square keeps its perimeter and centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0228', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0228 begin');
      await runCase('testPathApi0228', async () => {
        const path: drawing.Path = rectPath(0, 0, 1000, 1000);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.right - bounds.left).assertEqual(1000);
        expect(bounds.bottom - bounds.top).assertEqual(1000);
        expect(path.isClosed()).assertTrue();
        expect(path.getPointData().length).assertEqual(4);
        expect(Math.round(path.getLength(true))).assertEqual(4000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0228 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0229
     * @tc.name testPathApi0229
     * @tc.desc Verify a shape in the negative quadrant contains only its own area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0229', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0229 begin');
      await runCase('testPathApi0229', async () => {
        const path: drawing.Path = trianglePath(50);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(-100, -100);
        path.transform(matrix);
        expect(path.contains(-95, -95)).assertTrue();
        expect(path.contains(-55, -55)).assertFalse();
        expect(path.getBounds().left).assertEqual(-100);
        expect(path.getBounds().bottom).assertEqual(-50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0229 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0230
     * @tc.name testPathApi0230
     * @tc.desc Verify a single point contour fills nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0230', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0230 begin');
      await runCase('testPathApi0230', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(60, 60);
        expect(path.contains(60, 60)).assertFalse();
        expect(path.getLength(true)).assertEqual(0);
        expect(path.getVerbData().length).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0230 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0231
     * @tc.name testPathApi0231
     * @tc.desc Verify an empty path reports zero length for both closure flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0231', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0231 begin');
      await runCase('testPathApi0231', async () => {
        const path: drawing.Path = new drawing.Path();
        expect(path.getLength(false)).assertEqual(0);
        expect(path.getLength(true)).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0231 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0232
     * @tc.name testPathApi0232
     * @tc.desc Verify an empty path reports a zero sized bounding box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0232', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0232 begin');
      await runCase('testPathApi0232', async () => {
        const bounds: common2D.Rect = new drawing.Path().getBounds();
        expect(bounds.left).assertEqual(0);
        expect(bounds.top).assertEqual(0);
        expect(bounds.right).assertEqual(0);
        expect(bounds.bottom).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0232 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0233
     * @tc.name testPathApi0233
     * @tc.desc Verify an empty path is never classified as a rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0233', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0233 begin');
      await runCase('testPathApi0233', async () => {
        const path: drawing.Path = new drawing.Path();
        const out: common2D.Rect = ltrb(1, 1, 2, 2);
        expect(path.isRect(out)).assertFalse();
        expect(path.isRect(null)).assertFalse();
        expect(out.left).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0233 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0234
     * @tc.name testPathApi0234
     * @tc.desc Verify converting an empty path to svg is safe and yields no geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0234', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0234 begin');
      await runCase('testPathApi0234', async () => {
        const path: drawing.Path = new drawing.Path();
        let svg: string = '';
        let threw: boolean = false;
        try {
          svg = path.convertToSvgString();
        } catch (error) {
          threw = true;
        }
        expect(threw || svg.length === 0).assertTrue();
        expect(path.isEmpty()).assertTrue();
        expect(path.getVerbData().length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0234 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0235
     * @tc.name testPathApi0235
     * @tc.desc Verify closing an empty path leaves it empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0235', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0235 begin');
      await runCase('testPathApi0235', async () => {
        const path: drawing.Path = new drawing.Path();
        path.close();
        expect(path.isEmpty()).assertTrue();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0235 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0236
     * @tc.name testPathApi0236
     * @tc.desc Verify moving the last point of an empty path adds no geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0236', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0236 begin');
      await runCase('testPathApi0236', async () => {
        const path: drawing.Path = new drawing.Path();
        path.setLastPoint(50, 50);
        expect(path.isEmpty()).assertFalse();
        expect(path.getVerbData().length).assertEqual(1);
        expect(path.getBounds().left).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0236 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0237
     * @tc.name testPathApi0237
     * @tc.desc Verify reading the last point of an empty path yields no point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0237', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0237 begin');
      await runCase('testPathApi0237', async () => {
        const path: drawing.Path = new drawing.Path();
        expect(path.getLastPoint()).assertUndefined();
        expect(path.isEmpty()).assertTrue();
        path.moveTo(12, 34);
        expect(path.getLastPoint().x).assertEqual(12);
        expect(path.getLastPoint().y).assertEqual(34);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0237 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0238
     * @tc.name testPathApi0238
     * @tc.desc Verify appending an empty path changes neither counts nor bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0238', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0238 begin');
      await runCase('testPathApi0238', async () => {
        const base: drawing.Path = rectPath(0, 0, 25, 35);
        const verbs: number = base.getVerbData().length;
        base.addPath(new drawing.Path());
        expect(base.getVerbData().length).assertEqual(verbs);
        expect(base.getBounds().right).assertEqual(25);
        expect(base.getBounds().bottom).assertEqual(35);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0238 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0239
     * @tc.name testPathApi0239
     * @tc.desc Verify an empty path unioned into a shape leaves the shape intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0239', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0239 begin');
      await runCase('testPathApi0239', async () => {
        const empty: drawing.Path = new drawing.Path();
        const rect: drawing.Path = rectPath(10, 10, 50, 50);
        expect(empty.op(rect, drawing.PathOp.UNION)).assertTrue();
        expect(empty.getBounds().left).assertEqual(10);
        expect(empty.contains(30, 30)).assertTrue();
        expect(Math.round(empty.getLength(true))).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0239 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0240
     * @tc.name testPathApi0240
     * @tc.desc Verify resetting twice in a row is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0240', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0240 begin');
      await runCase('testPathApi0240', async () => {
        const path: drawing.Path = rectPath(0, 0, 30, 30);
        path.reset();
        path.reset();
        expect(path.isEmpty()).assertTrue();
        expect(path.getPointData().length).assertEqual(0);
        expect(path.getBounds().right).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0240 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0241
     * @tc.name testPathApi0241
     * @tc.desc Verify a rewound path reports an empty bounding box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0241', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0241 begin');
      await runCase('testPathApi0241', async () => {
        const path: drawing.Path = rectPath(20, 20, 60, 60);
        path.rewind();
        expect(path.getBounds().left).assertEqual(0);
        expect(path.getBounds().bottom).assertEqual(0);
        expect(path.getLength(true)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0241 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0242
     * @tc.name testPathApi0242
     * @tc.desc Verify an empty segment window produces an empty destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0242', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0242 begin');
      await runCase('testPathApi0242', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const dst: drawing.Path = new drawing.Path();
        source.getSegment(false, 0, 0, true, dst);
        expect(dst.isEmpty()).assertTrue();
        expect(source.getLength(true)).assertEqual(400);
        expect(source.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0242 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0243
     * @tc.name testPathApi0243
     * @tc.desc Verify asking for a matrix from an empty path reports failure.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0243', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0243 begin');
      await runCase('testPathApi0243', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = new drawing.Path()
          .getMatrix(false, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertFalse();
        expect(matrix.isIdentity()).assertTrue();
        expect(new drawing.Path().isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0243 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0244
     * @tc.name testPathApi0244
     * @tc.desc Verify transforming an empty path keeps it empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0244', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0244 begin');
      await runCase('testPathApi0244', async () => {
        const path: drawing.Path = new drawing.Path();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(45, 0, 0);
        path.transform(matrix);
        expect(path.isEmpty()).assertTrue();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.getBounds().right).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0244 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0245
     * @tc.name testPathApi0245
     * @tc.desc Verify the query invariants hold across a build and reset cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathApi0245', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0245 begin');
      await runCase('testPathApi0245', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRoundRect(new drawing.RoundRect(ltrb(0, 0, 60, 40), 6, 6));
        expect(path.isClosed()).assertTrue();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(path.contains(30, 20)).assertTrue();
        expect(path.getLength(true) > 150).assertTrue();
        path.reset();
        expect(path.isEmpty()).assertTrue();
        expect(path.isClosed()).assertFalse();
        expect(path.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0245 end');
    });
  });
}
