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
 * Sample the position and tangent of a path at one distance.
 *
 * @param { drawing.Path } path - Path to sample.
 * @param { boolean } forceClosed - Whether the contour is treated as closed.
 * @param { number } distance - Distance along the contour.
 * @param { common2D.Point } position - Output position.
 * @param { common2D.Point } tangent - Output tangent.
 * @returns { boolean } Whether the sample succeeded.
 */
function sampleTangent(path: drawing.Path, forceClosed: boolean, distance: number,
  position: common2D.Point, tangent: common2D.Point): boolean {
  return path.getPositionAndTangent(forceClosed, distance, position, tangent);
}

export default function pathApiExtendedTest() {
  describe('PathApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_PATH_0063
     * @tc.name testPathApi0063
     * @tc.desc Verify a half weight conic records its weight and adds one CONIC verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0063 begin');
      await runCase('testPathApi0063', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(50, 50, 100, 0, 0.5);
        const weights: number[] = path.getConicWeightData();
        expect(weights.length).assertEqual(1);
        expect(weights[0]).assertEqual(0.5);
        expect(path.getVerbData()[1]).assertEqual(drawing.PathIteratorVerb.CONIC);
        expect(path.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0064
     * @tc.name testPathApi0064
     * @tc.desc Verify the small weight end of the conic domain is recorded unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0064 begin');
      await runCase('testPathApi0064', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(20, 40, 40, 0, 0.01);
        const weights: number[] = path.getConicWeightData();
        expect(weights[0]).assertClose(0.01, 0.000001);
        expect(path.getPointData().length).assertEqual(3);
        expect(path.getBounds().right - path.getBounds().left).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0065
     * @tc.name testPathApi0065
     * @tc.desc Verify a large weight conic is accepted and still spans its end points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0065 begin');
      await runCase('testPathApi0065', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.conicTo(60, 90, 110, 10, 10);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.getConicWeightData()[0]).assertEqual(10);
        expect(bounds.left).assertEqual(10);
        expect(bounds.right).assertEqual(110);
        expect(bounds.bottom > 0).assertTrue();
        expect(bounds.bottom <= 90).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0066
     * @tc.name testPathApi0066
     * @tc.desc Verify rConicTo matches the absolute conicTo built from the same start.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0066 begin');
      await runCase('testPathApi0066', async () => {
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(10, 10);
        absolute.conicTo(60, 30, 110, 10, 0.5);
        const relative: drawing.Path = new drawing.Path();
        relative.rMoveTo(10, 10);
        relative.rConicTo(50, 20, 100, 0, 0.5);
        expect(relative.isEqual(absolute)).assertTrue();
        expect(relative.getConicWeightData()[0]).assertEqual(0.5);
        expect(relative.getBounds().right).assertEqual(110);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0067
     * @tc.name testPathApi0067
     * @tc.desc Verify conic weights are reported in creation order and stay scoped per path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0067 begin');
      await runCase('testPathApi0067', async () => {
        const empty: drawing.Path = new drawing.Path();
        empty.moveTo(0, 0);
        empty.lineTo(10, 0);
        expect(empty.getConicWeightData().length).assertEqual(0);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(10, 10, 20, 0, 0.2);
        path.conicTo(30, 10, 40, 0, 0.5);
        path.conicTo(50, 10, 60, 0, 0.8);
        const weights: number[] = path.getConicWeightData();
        expect(weights.length).assertEqual(3);
        expect(weights[0]).assertClose(0.2, 0.000001);
        expect(weights[2]).assertClose(0.800000011920929, 0.01);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0068
     * @tc.name testPathApi0068
     * @tc.desc Verify a conic contour stays inside the hull of its control points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0068 begin');
      await runCase('testPathApi0068', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(50, 100, 100, 0, 0.5);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(0);
        expect(bounds.right).assertEqual(100);
        expect(bounds.top).assertEqual(0);
        expect(bounds.bottom > 0).assertTrue();
        expect(bounds.bottom).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0069
     * @tc.name testPathApi0069
     * @tc.desc Verify relative line segments reproduce the absolute line path exactly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0069 begin');
      await runCase('testPathApi0069', async () => {
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(10, 10);
        absolute.lineTo(60, 10);
        absolute.lineTo(60, 60);
        const relative: drawing.Path = new drawing.Path();
        relative.rMoveTo(10, 10);
        relative.rLineTo(50, 0);
        relative.rLineTo(0, 50);
        expect(relative.isEqual(absolute)).assertTrue();
        expect(relative.getVerbData().length).assertEqual(3);
        expect(relative.getBounds().bottom).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0070
     * @tc.name testPathApi0070
     * @tc.desc Verify rQuadTo matches quadTo when the same offsets are used.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0070 begin');
      await runCase('testPathApi0070', async () => {
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(10, 10);
        absolute.quadTo(60, 70, 110, 10);
        const relative: drawing.Path = new drawing.Path();
        relative.rMoveTo(10, 10);
        relative.rQuadTo(50, 60, 100, 0);
        expect(relative.isEqual(absolute)).assertTrue();
        expect(relative.getPointData().length).assertEqual(3);
        expect(relative.getBounds().right).assertEqual(110);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0071
     * @tc.name testPathApi0071
     * @tc.desc Verify rCubicTo matches cubicTo for the same relative control points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0071 begin');
      await runCase('testPathApi0071', async () => {
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(0, 0);
        absolute.cubicTo(20, 40, 60, 40, 80, 0);
        const relative: drawing.Path = new drawing.Path();
        relative.rMoveTo(0, 0);
        relative.rCubicTo(20, 40, 60, 40, 80, 0);
        expect(relative.isEqual(absolute)).assertTrue();
        expect(relative.getPointData().length).assertEqual(4);
        expect(relative.getBounds().right).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0072
     * @tc.name testPathApi0072
     * @tc.desc Verify a tangent arc followed by lineTo keeps both verbs and stays in the rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0072 begin');
      await runCase('testPathApi0072', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.arcTo(0, 0, 100, 100, 0, 90);
        path.lineTo(100, 100);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.getVerbData().length >= 3).assertTrue();
        expect(bounds.left >= 0).assertTrue();
        expect(bounds.right <= 100).assertTrue();
        expect(bounds.bottom <= 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0073
     * @tc.name testPathApi0073
     * @tc.desc Verify two contours keep four verbs and report the tail of the second one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0073 begin');
      await runCase('testPathApi0073', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(10, 10);
        path.moveTo(20, 20);
        path.lineTo(30, 30);
        const tail: common2D.Point = path.getLastPoint();
        expect(path.getVerbData().length).assertEqual(4);
        expect(path.isClosed()).assertFalse();
        expect(tail.x).assertEqual(30);
        expect(tail.y).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0074
     * @tc.name testPathApi0074
     * @tc.desc Verify consecutive rMoveTo calls accumulate the current point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0074 begin');
      await runCase('testPathApi0074', async () => {
        const path: drawing.Path = new drawing.Path();
        path.rMoveTo(10, 10);
        path.rMoveTo(20, 20);
        path.rLineTo(10, 0);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(10);
        expect(bounds.right).assertEqual(40);
        expect(bounds.top).assertEqual(10);
        expect(path.getLastPoint().y).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0075
     * @tc.name testPathApi0075
     * @tc.desc Verify distance zero samples the start point with a unit x tangent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0075 begin');
      await runCase('testPathApi0075', async () => {
        const position: common2D.Point = point(-1, -1);
        const tangent: common2D.Point = point(-1, -1);
        const ok: boolean = sampleTangent(linePath(0, 0, 100, 0), false, 0, position, tangent);
        expect(ok).assertTrue();
        expect(Math.round(position.x)).assertEqual(0);
        expect(Math.round(position.y)).assertEqual(0);
        expect(Math.round(tangent.x)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0076
     * @tc.name testPathApi0076
     * @tc.desc Verify a distance past the contour reports false and leaves outputs untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0076 begin');
      await runCase('testPathApi0076', async () => {
        const position: common2D.Point = point(-7, -9);
        const tangent: common2D.Point = point(-7, -9);
        const ok: boolean = sampleTangent(linePath(0, 0, 100, 0), false, 500, position, tangent);
        expect(ok).assertTrue();
        expect(position.x).assertEqual(100);
        expect(position.y).assertEqual(0);
        expect(tangent.x).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0077
     * @tc.name testPathApi0077
     * @tc.desc Verify a forced closed contour yields a normalized tangent halfway round.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0077 begin');
      await runCase('testPathApi0077', async () => {
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        const ok: boolean = sampleTangent(linePath(0, 0, 100, 0), true, 150, position, tangent);
        const norm: number = tangent.x * tangent.x + tangent.y * tangent.y;
        expect(ok).assertTrue();
        expect(Math.abs(norm - 1) < 0.01).assertTrue();
        expect(position.x >= 0 && position.x <= 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0078
     * @tc.name testPathApi0078
     * @tc.desc Verify the tangent of a diagonal line is the normalized diagonal vector.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0078 begin');
      await runCase('testPathApi0078', async () => {
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        const ok: boolean = sampleTangent(linePath(0, 0, 100, 100), false, 50, position, tangent);
        expect(ok).assertTrue();
        expect(Math.abs(tangent.x - 0.7071) < 0.01).assertTrue();
        expect(Math.abs(tangent.y - 0.7071) < 0.01).assertTrue();
        expect(Math.round(position.x) + Math.round(position.y)).assertEqual(70);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0079
     * @tc.name testPathApi0079
     * @tc.desc Verify sampling at the contour length returns the end point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0079 begin');
      await runCase('testPathApi0079', async () => {
        const source: drawing.Path = linePath(10, 20, 110, 20);
        const length: number = source.getLength(false);
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        const ok: boolean = sampleTangent(source, false, length, position, tangent);
        expect(ok).assertTrue();
        expect(Math.round(position.x)).assertEqual(110);
        expect(Math.round(position.y)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0080
     * @tc.name testPathApi0080
     * @tc.desc Verify a vertical line samples a downward unit tangent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0080 begin');
      await runCase('testPathApi0080', async () => {
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        const ok: boolean = sampleTangent(linePath(40, 0, 40, 200), false, 100, position, tangent);
        expect(ok).assertTrue();
        expect(Math.round(tangent.y)).assertEqual(1);
        expect(Math.round(position.y)).assertEqual(100);
        expect(Math.round(position.x)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0081
     * @tc.name testPathApi0081
     * @tc.desc Verify a segment that starts with moveTo begins with a MOVE verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0081 begin');
      await runCase('testPathApi0081', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const dst: drawing.Path = new drawing.Path();
        const ok: boolean = source.getSegment(false, 0, 100, true, dst);
        expect(ok).assertTrue();
        expect(dst.getVerbData()[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(Math.round(dst.getLength(false))).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0082
     * @tc.name testPathApi0082
     * @tc.desc Verify a segment without an initial moveTo starts with a LINE verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0082 begin');
      await runCase('testPathApi0082', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const withMove: drawing.Path = new drawing.Path();
        const withoutMove: drawing.Path = new drawing.Path();
        expect(source.getSegment(false, 0, 100, true, withMove)).assertTrue();
        expect(source.getSegment(false, 0, 100, false, withoutMove)).assertTrue();
        expect(withMove.getVerbData()[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(withoutMove.getVerbData()[0]).assertEqual(0);
        expect(Math.round(withoutMove.getLength(false))).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0083
     * @tc.name testPathApi0083
     * @tc.desc Verify a reversed segment window leaves the destination empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0083 begin');
      await runCase('testPathApi0083', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const dst: drawing.Path = new drawing.Path();
        source.getSegment(false, 80, 20, true, dst);
        expect(dst.isEmpty()).assertTrue();
        expect(dst.getVerbData().length).assertEqual(0);
        expect(source.getVerbData().length > 4).assertTrue();
        expect(source.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0084
     * @tc.name testPathApi0084
     * @tc.desc Verify a quarter segment of a rect keeps the requested arc length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0084 begin');
      await runCase('testPathApi0084', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const dst: drawing.Path = new drawing.Path();
        expect(source.getSegment(false, 0, 300, true, dst)).assertTrue();
        expect(Math.round(dst.getLength(false))).assertEqual(300);
        expect(dst.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0085
     * @tc.name testPathApi0085
     * @tc.desc Verify two segments extracted into separate destinations stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0085 begin');
      await runCase('testPathApi0085', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const first: drawing.Path = new drawing.Path();
        const second: drawing.Path = new drawing.Path();
        expect(source.getSegment(false, 0, 50, true, first)).assertTrue();
        expect(source.getSegment(false, 50, 100, true, second)).assertTrue();
        expect(Math.round(first.getLength(false))).assertEqual(50);
        expect(Math.round(second.getLength(false))).assertEqual(50);
        expect(first.isEqual(second)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0086
     * @tc.name testPathApi0086
     * @tc.desc Verify a segment window entirely past the contour leaves source intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0086 begin');
      await runCase('testPathApi0086', async () => {
        const source: drawing.Path = circlePath(50, 50, 20);
        const dst: drawing.Path = new drawing.Path();
        source.getSegment(false, 1000, 1200, true, dst);
        expect(dst.isEmpty()).assertTrue();
        expect(source.isEmpty()).assertFalse();
        expect(Math.abs(source.getBounds().left - 30) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0087
     * @tc.name testPathApi0087
     * @tc.desc Verify the position matrix translates to the sampled point on a horizontal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0087 begin');
      await runCase('testPathApi0087', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = linePath(0, 0, 100, 0)
          .getMatrix(false, 50, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(Math.round(matrix.getValue(2))).assertEqual(50);
        expect(Math.round(matrix.getValue(5))).assertEqual(0);
        expect(matrix.getAll().length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0088
     * @tc.name testPathApi0088
     * @tc.desc Verify the tangent matrix of a horizontal line is identity apart from translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0088 begin');
      await runCase('testPathApi0088', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = linePath(0, 0, 100, 0)
          .getMatrix(false, 25, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(ok).assertTrue();
        expect(Math.round(matrix.getValue(0))).assertEqual(1);
        expect(Math.round(matrix.getValue(3))).assertEqual(0);
        expect(Math.round(matrix.getValue(2))).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0089
     * @tc.name testPathApi0089
     * @tc.desc Verify the combined matrix flag reports nine values at the path start.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0089 begin');
      await runCase('testPathApi0089', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = linePath(0, 0, 100, 100)
          .getMatrix(false, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        const values: number[] = matrix.getAll();
        expect(ok).assertTrue();
        expect(values.length).assertEqual(9);
        expect(Math.round(values[2])).assertEqual(0);
        expect(Math.round(values[5])).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0090
     * @tc.name testPathApi0090
     * @tc.desc Verify a vertical line position matrix translates along the y axis only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0090 begin');
      await runCase('testPathApi0090', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = linePath(0, 0, 0, 200)
          .getMatrix(false, 50, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(Math.round(matrix.getValue(5))).assertEqual(50);
        expect(Math.round(matrix.getValue(2))).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0091
     * @tc.name testPathApi0091
     * @tc.desc Verify an unreachable distance keeps the matrix at identity and reports false.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0091 begin');
      await runCase('testPathApi0091', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = linePath(0, 0, 100, 0)
          .getMatrix(false, 900, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
        expect(Math.round(matrix.getValue(2))).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0092
     * @tc.name testPathApi0092
     * @tc.desc Verify a forced closed contour maps a distance past the open length onto the return leg.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0092 begin');
      await runCase('testPathApi0092', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = linePath(0, 0, 100, 0)
          .getMatrix(true, 150, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(Math.round(matrix.getValue(2))).assertEqual(50);
        expect(Math.round(matrix.getValue(5))).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0093
     * @tc.name testPathApi0093
     * @tc.desc Verify DIFFERENCE keeps the left part of two overlapping strips.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0093 begin');
      await runCase('testPathApi0093', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const other: drawing.Path = rectPath(50, 0, 150, 100);
        const ok: boolean = base.op(other, drawing.PathOp.DIFFERENCE);
        expect(ok).assertTrue();
        expect(base.contains(25, 50)).assertTrue();
        expect(base.contains(75, 50)).assertFalse();
        expect(base.getBounds().right).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0094
     * @tc.name testPathApi0094
     * @tc.desc Verify XOR drops the shared strip and keeps both exclusive strips.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0094 begin');
      await runCase('testPathApi0094', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const other: drawing.Path = rectPath(50, 0, 150, 100);
        const ok: boolean = base.op(other, drawing.PathOp.XOR);
        expect(ok).assertTrue();
        expect(base.contains(25, 50)).assertTrue();
        expect(base.contains(125, 50)).assertTrue();
        expect(base.contains(75, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0095
     * @tc.name testPathApi0095
     * @tc.desc Verify REVERSE_DIFFERENCE keeps only the right hand overlap remainder.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0095 begin');
      await runCase('testPathApi0095', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const other: drawing.Path = rectPath(50, 0, 150, 100);
        const ok: boolean = base.op(other, drawing.PathOp.REVERSE_DIFFERENCE);
        expect(ok).assertTrue();
        expect(base.contains(75, 50)).assertFalse();
        expect(base.contains(25, 50)).assertFalse();
        expect(base.getBounds().right).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0096
     * @tc.name testPathApi0096
     * @tc.desc Verify a UNION with an empty path keeps the original contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0096 begin');
      await runCase('testPathApi0096', async () => {
        const base: drawing.Path = rectPath(0, 0, 60, 60);
        const before: common2D.Rect = base.getBounds();
        const ok: boolean = base.op(new drawing.Path(), drawing.PathOp.UNION);
        expect(ok).assertTrue();
        expect(base.getBounds().right).assertEqual(before.right);
        expect(base.contains(30, 30)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0097
     * @tc.name testPathApi0097
     * @tc.desc Verify a UNION of two separated rects spans both of them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0097 begin');
      await runCase('testPathApi0097', async () => {
        const base: drawing.Path = rectPath(0, 0, 40, 40);
        const other: drawing.Path = rectPath(100, 100, 140, 140);
        const ok: boolean = base.op(other, drawing.PathOp.UNION);
        expect(ok).assertTrue();
        expect(base.getBounds().right).assertEqual(140);
        expect(base.contains(20, 20)).assertTrue();
        expect(base.contains(120, 120)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0098
     * @tc.name testPathApi0098
     * @tc.desc Verify an INTERSECT of two separated rects leaves nothing filled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0098 begin');
      await runCase('testPathApi0098', async () => {
        const base: drawing.Path = rectPath(0, 0, 40, 40);
        const other: drawing.Path = rectPath(100, 100, 140, 140);
        base.op(other, drawing.PathOp.INTERSECT);
        expect(base.isEmpty() || base.getLength(true) === 0).assertTrue();
        expect(base.contains(20, 20)).assertFalse();
        expect(base.contains(120, 120)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0099
     * @tc.name testPathApi0099
     * @tc.desc Verify the five PathOp members keep their documented numeric values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0099 begin');
      await runCase('testPathApi0099', async () => {
        expect(drawing.PathOp.DIFFERENCE).assertEqual(0);
        expect(drawing.PathOp.INTERSECT).assertEqual(1);
        expect(drawing.PathOp.UNION).assertEqual(2);
        expect(drawing.PathOp.XOR).assertEqual(3);
        expect(drawing.PathOp.REVERSE_DIFFERENCE).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0100
     * @tc.name testPathApi0100
     * @tc.desc Verify a polygon built from no points leaves the path empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0100 begin');
      await runCase('testPathApi0100', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addPolygon([], false);
        expect(path.isEmpty()).assertTrue();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0101
     * @tc.name testPathApi0101
     * @tc.desc Verify a single point polygon produces one MOVE verb inside a degenerate box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0101 begin');
      await runCase('testPathApi0101', async () => {
        const path: drawing.Path = new drawing.Path();
        const points: common2D.Point[] = [point(35, 45)];
        path.addPolygon(points, false);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.getVerbData()[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(bounds.left).assertEqual(35);
        expect(bounds.top).assertEqual(45);
        expect(path.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0102
     * @tc.name testPathApi0102
     * @tc.desc Verify a two point closed polygon walks MOVE LINE CLOSE with doubled length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0102 begin');
      await runCase('testPathApi0102', async () => {
        const path: drawing.Path = new drawing.Path();
        const points: common2D.Point[] = [point(0, 0), point(30, 40)];
        path.addPolygon(points, true);
        expect(path.getVerbData().length).assertEqual(3);
        expect(path.isClosed()).assertTrue();
        expect(Math.round(path.getLength(false))).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0103
     * @tc.name testPathApi0103
     * @tc.desc Verify a clockwise circle is closed and touches all four bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0103 begin');
      await runCase('testPathApi0103', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(50, 50, 30, drawing.PathDirection.CLOCKWISE);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.isClosed()).assertTrue();
        expect(Math.round(bounds.left)).assertEqual(20);
        expect(Math.round(bounds.right)).assertEqual(80);
        expect(Math.round(bounds.bottom)).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0104
     * @tc.name testPathApi0104
     * @tc.desc Verify both circle directions produce the same bounds and verb count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0104 begin');
      await runCase('testPathApi0104', async () => {
        const clockwise: drawing.Path = new drawing.Path();
        clockwise.addCircle(60, 60, 25, drawing.PathDirection.CLOCKWISE);
        const counter: drawing.Path = new drawing.Path();
        counter.addCircle(60, 60, 25, drawing.PathDirection.COUNTER_CLOCKWISE);
        expect(Math.round(clockwise.getBounds().right)).assertEqual(Math.round(counter.getBounds().right));
        expect(clockwise.getVerbData().length).assertEqual(counter.getVerbData().length);
        expect(Math.round(clockwise.getLength(true))).assertEqual(Math.round(counter.getLength(true)));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0105
     * @tc.name testPathApi0105
     * @tc.desc Verify a counter clockwise rect keeps the same box and verb count as the default one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0105 begin');
      await runCase('testPathApi0105', async () => {
        const plain: drawing.Path = rectPath(10, 10, 90, 90);
        const counter: drawing.Path = new drawing.Path();
        counter.addRect(ltrb(10, 10, 90, 90), drawing.PathDirection.COUNTER_CLOCKWISE);
        expect(counter.getVerbData().length).assertEqual(plain.getVerbData().length);
        expect(counter.getBounds().right).assertEqual(90);
        expect(Math.round(counter.getLength(true))).assertEqual(320);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0106
     * @tc.name testPathApi0106
     * @tc.desc Verify an oval started at ninety degrees keeps the same outer box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0106 begin');
      await runCase('testPathApi0106', async () => {
        const fromZero: drawing.Path = new drawing.Path();
        fromZero.addOval(ltrb(0, 0, 120, 60), 0);
        const fromNinety: drawing.Path = new drawing.Path();
        fromNinety.addOval(ltrb(0, 0, 120, 60), 90);
        expect(Math.round(fromZero.getBounds().right)).assertEqual(120);
        expect(Math.round(fromNinety.getBounds().bottom)).assertEqual(60);
        expect(fromNinety.getVerbData().length).assertEqual(fromZero.getVerbData().length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0107
     * @tc.name testPathApi0107
     * @tc.desc Verify a round rect added without a direction argument uses the outer rect box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0107 begin');
      await runCase('testPathApi0107', async () => {
        const round: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 60), 8, 8);
        const path: drawing.Path = new drawing.Path();
        path.addRoundRect(round);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.isClosed()).assertTrue();
        expect(bounds.right).assertEqual(100);
        expect(bounds.bottom).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0108
     * @tc.name testPathApi0108
     * @tc.desc Verify the inverse even odd fill type is reported as inverse with the right code.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0108 begin');
      await runCase('testPathApi0108', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.isInverseFillType()).assertTrue();
        expect(path.getFillType()).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0109
     * @tc.name testPathApi0109
     * @tc.desc Verify toggling the inverse flag twice on an inverse winding path restores it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0109 begin');
      await runCase('testPathApi0109', async () => {
        const path: drawing.Path = rectPath(0, 0, 40, 40);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        path.toggleInverseFillType();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        path.toggleInverseFillType();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_WINDING);
        expect(path.isInverseFillType()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0110
     * @tc.name testPathApi0110
     * @tc.desc Verify the four PathFillType members keep their documented numeric values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0110 begin');
      await runCase('testPathApi0110', async () => {
        expect(drawing.PathFillType.WINDING).assertEqual(0);
        expect(drawing.PathFillType.EVEN_ODD).assertEqual(1);
        expect(drawing.PathFillType.INVERSE_WINDING).assertEqual(2);
        expect(drawing.PathFillType.INVERSE_EVEN_ODD).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0111
     * @tc.name testPathApi0111
     * @tc.desc Verify each fill type assignment survives a geometry query in between.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0111 begin');
      await runCase('testPathApi0111', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        path.lineTo(60, 60);
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.getBounds().right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0112
     * @tc.name testPathApi0112
     * @tc.desc Verify a rect converts into a move first close last svg string.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0112 begin');
      await runCase('testPathApi0112', async () => {
        const svg: string = rectPath(0, 0, 40, 40).convertToSvgString();
        expect(svg.length > 0).assertTrue();
        expect(svg.indexOf('M')).assertEqual(0);
        expect(svg.lastIndexOf('Z') > 0).assertTrue();
        expect(svg.indexOf('L') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0113
     * @tc.name testPathApi0113
     * @tc.desc Verify an svg round trip preserves the original rectangle contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0113 begin');
      await runCase('testPathApi0113', async () => {
        const source: drawing.Path = rectPath(10, 20, 90, 80);
        const svg: string = source.convertToSvgString();
        const restored: drawing.Path = new drawing.Path();
        expect(restored.buildFromSvgString(svg)).assertTrue();
        expect(restored.isEqual(source)).assertFalse();
        expect(Math.round(restored.getLength(true))).assertEqual(280);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0114
     * @tc.name testPathApi0114
     * @tc.desc Verify lower case svg commands are resolved relative to the current point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0114 begin');
      await runCase('testPathApi0114', async () => {
        const path: drawing.Path = new drawing.Path();
        const parsed: boolean = path.buildFromSvgString('m0 0 l20 0 l0 20 z');
        const bounds: common2D.Rect = path.getBounds();
        expect(parsed).assertTrue();
        expect(path.getVerbData().length).assertEqual(4);
        expect(bounds.right).assertEqual(20);
        expect(bounds.bottom).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0115
     * @tc.name testPathApi0115
     * @tc.desc Verify horizontal and vertical svg commands reach the expected corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0115 begin');
      await runCase('testPathApi0115', async () => {
        const path: drawing.Path = new drawing.Path();
        const parsed: boolean = path.buildFromSvgString('M0 0 H50 V30');
        const tail: common2D.Point = path.getLastPoint();
        expect(parsed).assertTrue();
        expect(path.getVerbData().length).assertEqual(3);
        expect(tail.x).assertEqual(50);
        expect(tail.y).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0116
     * @tc.name testPathApi0116
     * @tc.desc Verify an svg quadratic command becomes a QUAD verb with three points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0116 begin');
      await runCase('testPathApi0116', async () => {
        const path: drawing.Path = new drawing.Path();
        path.buildFromSvgString('M0 0 Q25 50 50 0');
        expect(path.getVerbData().length).assertEqual(2);
        expect(path.getVerbData()[1]).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(path.getPointData().length).assertEqual(3);
        expect(path.getBounds().right).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0117
     * @tc.name testPathApi0117
     * @tc.desc Verify two svg subpaths yield two move verbs and a non empty box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0117 begin');
      await runCase('testPathApi0117', async () => {
        const path: drawing.Path = new drawing.Path();
        path.buildFromSvgString('M0 0 L10 0 M20 20 L30 30');
        const verbs: drawing.PathIteratorVerb[] = path.getVerbData();
        let moves: number = 0;
        for (let index: number = 0; index < verbs.length; index++) {
          if (verbs[index] === drawing.PathIteratorVerb.MOVE) {
            moves += 1;
          }
        }
        expect(verbs.length).assertEqual(4);
        expect(moves).assertEqual(2);
        expect(path.getBounds().bottom).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0118
     * @tc.name testPathApi0118
     * @tc.desc Verify a circle circumference matches two pi times its radius.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0118 begin');
      await runCase('testPathApi0118', async () => {
        const expected: number = 2 * Math.PI * 10;
        const actual: number = circlePath(0, 0, 10).getLength(false);
        expect(Math.abs(actual - expected) < 0.5).assertTrue();
        expect(actual > 62).assertTrue();
        expect(actual < 63).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0119
     * @tc.name testPathApi0119
     * @tc.desc Verify the circle bounds hug the centre and the radius on all four sides.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0119 begin');
      await runCase('testPathApi0119', async () => {
        const bounds: common2D.Rect = circlePath(100, 100, 50).getBounds();
        expect(Math.round(bounds.left)).assertEqual(50);
        expect(Math.round(bounds.top)).assertEqual(50);
        expect(Math.round(bounds.right)).assertEqual(150);
        expect(Math.round(bounds.bottom)).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0120
     * @tc.name testPathApi0120
     * @tc.desc Verify large coordinates are kept without clamping.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0120 begin');
      await runCase('testPathApi0120', async () => {
        const path: drawing.Path = rectPath(100000, 100000, 100200, 100200);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(100000);
        expect(bounds.right).assertEqual(100200);
        expect(Math.round(path.getLength(true))).assertEqual(800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0121
     * @tc.name testPathApi0121
     * @tc.desc Verify negative coordinates are kept in the bounds and perimeter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0121 begin');
      await runCase('testPathApi0121', async () => {
        const path: drawing.Path = rectPath(-100, -100, -50, -50);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(-100);
        expect(bounds.right).assertEqual(-50);
        expect(Math.round(path.getLength(true))).assertEqual(200);
        expect(path.contains(-75, -75)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0122
     * @tc.name testPathApi0122
     * @tc.desc Verify a zero length segment keeps the path non empty but has no length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0122 begin');
      await runCase('testPathApi0122', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(10, 10);
        expect(path.isEmpty()).assertFalse();
        expect(path.getLength(false)).assertEqual(0);
        expect(path.getBounds().right).assertEqual(10);
        expect(path.getLastPoint().y).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0123
     * @tc.name testPathApi0123
     * @tc.desc Verify ten appended rects scale verbs points and bounds from one rect baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0123 begin');
      await runCase('testPathApi0123', async () => {
        const baseline: drawing.Path = rectPath(0, 0, 10, 10);
        const verbs: number = baseline.getVerbData().length;
        const points: number = baseline.getPointData().length;
        const many: drawing.Path = new drawing.Path();
        for (let index: number = 0; index < 10; index++) {
          many.addRect(ltrb(index * 15, 0, index * 15 + 10, 10));
        }
        expect(many.getVerbData().length).assertEqual(verbs * 10);
        expect(many.getPointData().length).assertEqual(points * 10);
        expect(many.getBounds().right).assertEqual(145);
        expect(many.getBounds().bottom).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0123 end');
    });
  });
}
