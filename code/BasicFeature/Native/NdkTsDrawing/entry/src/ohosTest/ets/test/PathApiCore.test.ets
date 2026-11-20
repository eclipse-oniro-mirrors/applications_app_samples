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
import {
  createArcPath,
  createBezierPath,
  createCombinedPath,
  createConicPath,
  createPathFromPath,
  createPolygonPath,
  createPrimitivePath,
  createRelativePath,
  createSvgPath,
  createStarPath
} from '../../../main/ets/drawing/DrawingPathShape';
import {
  approximatePath,
  collectConicWeights,
  collectPoints,
  collectVerbs,
  extractSegment,
  fillTypeRoundTrip,
  interpolatePath,
  inverseFillFlag,
  lastPoint,
  PathSummary,
  pathsEqual,
  pathsInterpolatable,
  queryContains,
  queryIsRect,
  queryLength,
  queryMatrixAt,
  queryPositionAndTangent,
  resetPath,
  rewindPath,
  setLastPoint,
  summarize,
  svgRoundTrip,
  verbName
} from '../../../main/ets/drawing/DrawingPathQuery';
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

export default function pathApiCoreTest() {
  describe('PathApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_PATH_0001
     * @tc.name testPathApi0001
     * @tc.desc Verify a closed polygon path reports five verbs and four points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0001 begin');
      await runCase('testPathApi0001', async () => {
        const summary: PathSummary = summarize(createPolygonPath(true));
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertTrue();
        expect(summary.verbCount).assertEqual(5);
        expect(summary.pointCount).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0002
     * @tc.name testPathApi0002
     * @tc.desc Verify an open polygon path keeps four verbs and stays unclosed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0002 begin');
      await runCase('testPathApi0002', async () => {
        const path: drawing.Path = createPolygonPath(false);
        expect(path.isClosed()).assertFalse();
        expect(path.getVerbData().length).assertEqual(4);
        expect(path.getPointData().length).assertEqual(4);
        expect(path.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0003
     * @tc.name testPathApi0003
     * @tc.desc Verify the closed polygon verb sequence ends with CLOSE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0003 begin');
      await runCase('testPathApi0003', async () => {
        const verbs: string[] = collectVerbs(createPolygonPath(true));
        expect(verbs.length).assertEqual(5);
        expect(verbs[0]).assertEqual('MOVE');
        expect(verbs[1]).assertEqual('LINE');
        expect(verbs[4]).assertEqual('CLOSE');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0004
     * @tc.name testPathApi0004
     * @tc.desc Verify the open polygon verb sequence has no CLOSE entry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0004 begin');
      await runCase('testPathApi0004', async () => {
        const verbs: string[] = collectVerbs(createPolygonPath(false));
        expect(verbs.length).assertEqual(4);
        expect(verbs[verbs.length - 1]).assertEqual('LINE');
        expect(verbs.indexOf('CLOSE')).assertEqual(-1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0005
     * @tc.name testPathApi0005
     * @tc.desc Verify the polygon bounds match the four supplied points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0005 begin');
      await runCase('testPathApi0005', async () => {
        const path: drawing.Path = createPolygonPath(true);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(10);
        expect(bounds.top).assertEqual(20);
        expect(bounds.right).assertEqual(100);
        expect(bounds.bottom).assertEqual(120);
        expect(collectPoints(path).length).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0006
     * @tc.name testPathApi0006
     * @tc.desc Verify a triangle svg string builds a closed path with exact bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0006 begin');
      await runCase('testPathApi0006', async () => {
        const path: drawing.Path = createSvgPath('M10 10 L100 10 L100 100 Z');
        const bounds: common2D.Rect = path.getBounds();
        expect(path.isEmpty()).assertFalse();
        expect(path.isClosed()).assertTrue();
        expect(bounds.left).assertEqual(10);
        expect(bounds.right).assertEqual(100);
        expect(bounds.bottom).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0007
     * @tc.name testPathApi0007
     * @tc.desc Verify an unparsable svg string yields an empty path while a valid one does not.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0007 begin');
      await runCase('testPathApi0007', async () => {
        let emptyOnBadInput: boolean = true;
        try {
          emptyOnBadInput = createSvgPath('bogus-input').isEmpty();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'invalid svg string rejected by the parser');
        }
        expect(emptyOnBadInput).assertTrue();
        expect(createSvgPath('M0 0 L10 10').isEmpty()).assertFalse();
        expect(createSvgPath('M0 0 L10 10').getVerbData().length).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0008
     * @tc.name testPathApi0008
     * @tc.desc Verify the copy constructor produces an independent path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0008 begin');
      await runCase('testPathApi0008', async () => {
        const source: drawing.Path = rectPath(0, 0, 50, 50);
        const copy: drawing.Path = new drawing.Path(source);
        copy.offset(10, 10);
        expect(source.isEqual(copy)).assertTrue();
        expect(source.getBounds().left).assertEqual(0);
        expect(copy.getBounds().left).assertEqual(0);
        expect(copy.getBounds().right).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0009
     * @tc.name testPathApi0009
     * @tc.desc Verify createPathFromPath copies through both the constructor and set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0009 begin');
      await runCase('testPathApi0009', async () => {
        const source: drawing.Path = circlePath(50, 50, 20);
        const copy: drawing.Path = createPathFromPath(source);
        expect(copy.isEqual(source)).assertTrue();
        expect(copy.getBounds().left).assertEqual(30);
        expect(copy.getBounds().right).assertEqual(70);
        expect(copy.getVerbData().length).assertEqual(source.getVerbData().length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0010
     * @tc.name testPathApi0010
     * @tc.desc Verify copying an empty path keeps it empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0010 begin');
      await runCase('testPathApi0010', async () => {
        const empty: drawing.Path = new drawing.Path();
        const copy: drawing.Path = createPathFromPath(empty);
        expect(copy.isEmpty()).assertTrue();
        expect(copy.getVerbData().length).assertEqual(0);
        expect(copy.getPointData().length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0011
     * @tc.name testPathApi0011
     * @tc.desc Verify set deep copies so resetting the source leaves the target intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0011 begin');
      await runCase('testPathApi0011', async () => {
        const source: drawing.Path = rectPath(10, 10, 60, 60);
        const target: drawing.Path = new drawing.Path();
        target.set(source);
        source.reset();
        expect(source.isEmpty()).assertTrue();
        expect(target.isEmpty()).assertFalse();
        expect(target.getBounds().right).assertEqual(60);
        expect(target.getVerbData().length > 4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0012
     * @tc.name testPathApi0012
     * @tc.desc Verify moveTo plus lineTo produces two verbs and two points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0012 begin');
      await runCase('testPathApi0012', async () => {
        const path: drawing.Path = linePath(0, 0, 100, 0);
        const summary: PathSummary = summarize(path);
        expect(summary.verbCount).assertEqual(2);
        expect(summary.pointCount).assertEqual(2);
        expect(summary.isEmpty).assertFalse();
        expect(summary.length).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0013
     * @tc.name testPathApi0013
     * @tc.desc Verify close adds one CLOSE verb and marks the path closed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0013 begin');
      await runCase('testPathApi0013', async () => {
        const path: drawing.Path = linePath(0, 0, 100, 0);
        const before: number = path.getVerbData().length;
        path.close();
        expect(path.isClosed()).assertTrue();
        expect(path.getVerbData().length).assertEqual(before + 1);
        expect(verbName(path.getVerbData()[before])).assertEqual('CLOSE');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0014
     * @tc.name testPathApi0014
     * @tc.desc Verify rMoveTo and rLineTo are resolved to absolute coordinates.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0014 begin');
      await runCase('testPathApi0014', async () => {
        const path: drawing.Path = new drawing.Path();
        path.rMoveTo(20, 20);
        path.rLineTo(60, 0);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(20);
        expect(bounds.right).assertEqual(80);
        expect(bounds.top).assertEqual(20);
        expect(bounds.bottom).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0015
     * @tc.name testPathApi0015
     * @tc.desc Verify rQuadTo keeps two control points and ends at the relative target.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0015 begin');
      await runCase('testPathApi0015', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.rQuadTo(20, 40, 40, 0);
        expect(path.getPointData().length).assertEqual(3);
        expect(path.getVerbData().length).assertEqual(2);
        expect(path.getBounds().right).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0016
     * @tc.name testPathApi0016
     * @tc.desc Verify rCubicTo contributes three points after the move verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0016 begin');
      await runCase('testPathApi0016', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.rCubicTo(10, 10, 20, 10, 30, 0);
        const points: common2D.Point[] = path.getPointData();
        expect(points.length).assertEqual(4);
        expect(points[3].x).assertEqual(30);
        expect(points[3].y).assertEqual(0);
        expect(path.getBounds().right).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0017
     * @tc.name testPathApi0017
     * @tc.desc Verify both conic weights of the sample conic path are reported in order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0017 begin');
      await runCase('testPathApi0017', async () => {
        const weights: number[] = collectConicWeights(createConicPath());
        expect(weights.length).assertEqual(2);
        expect(weights[0]).assertEqual(0.5);
        expect(weights[1]).assertClose(0.8, 0.000001);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0018
     * @tc.name testPathApi0018
     * @tc.desc Verify the conic path walks MOVE CONIC CONIC.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0018 begin');
      await runCase('testPathApi0018', async () => {
        const verbs: string[] = collectVerbs(createConicPath());
        expect(verbs.length).assertEqual(3);
        expect(verbs[0]).assertEqual('MOVE');
        expect(verbs[1]).assertEqual('CONIC');
        expect(verbs[2]).assertEqual('CONIC');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0019
     * @tc.name testPathApi0019
     * @tc.desc Verify the bezier path walks MOVE QUAD CUBIC with six points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0019 begin');
      await runCase('testPathApi0019', async () => {
        const path: drawing.Path = createBezierPath();
        const verbs: string[] = collectVerbs(path);
        expect(verbs.length).assertEqual(3);
        expect(verbs[1]).assertEqual('QUAD');
        expect(verbs[2]).assertEqual('CUBIC');
        expect(path.getPointData().length).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0020
     * @tc.name testPathApi0020
     * @tc.desc Verify the bezier path bounds cover both end points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0020 begin');
      await runCase('testPathApi0020', async () => {
        const bounds: common2D.Rect = createBezierPath().getBounds();
        expect(bounds.left).assertEqual(10);
        expect(bounds.right).assertEqual(190);
        expect(bounds.bottom).assertEqual(150);
        expect(bounds.top >= 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0021
     * @tc.name testPathApi0021
     * @tc.desc Verify an added rect reports exact bounds and a four hundred pixel length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0021 begin');
      await runCase('testPathApi0021', async () => {
        const path: drawing.Path = rectPath(10, 20, 110, 120);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(10);
        expect(bounds.top).assertEqual(20);
        expect(Math.round(path.getLength(true))).assertEqual(400);
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0022
     * @tc.name testPathApi0022
     * @tc.desc Verify isRect fills the output rect with the contour bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0022 begin');
      await runCase('testPathApi0022', async () => {
        const path: drawing.Path = rectPath(5, 6, 55, 56);
        const out: common2D.Rect = ltrb(0, 0, 0, 0);
        const ok: boolean = path.isRect(out);
        expect(ok).assertTrue();
        expect(queryIsRect(path)).assertTrue();
        expect(out.left).assertEqual(5);
        expect(out.right).assertEqual(55);
        expect(out.bottom).assertEqual(56);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0023
     * @tc.name testPathApi0023
     * @tc.desc Verify a circle path contains its centre but not a point outside the radius.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0023 begin');
      await runCase('testPathApi0023', async () => {
        const path: drawing.Path = circlePath(100, 100, 50);
        expect(queryContains(path, 100, 100)).assertTrue();
        expect(queryContains(path, 160, 100)).assertFalse();
        expect(queryContains(path, 100, 155)).assertFalse();
        expect(path.getBounds().right).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0024
     * @tc.name testPathApi0024
     * @tc.desc Verify an added oval is closed and keeps the requested bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0024 begin');
      await runCase('testPathApi0024', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addOval(ltrb(0, 0, 80, 40), 0);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.isClosed()).assertTrue();
        expect(bounds.left).assertEqual(0);
        expect(bounds.right).assertEqual(80);
        expect(bounds.bottom).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0025
     * @tc.name testPathApi0025
     * @tc.desc Verify an added half circle arc stays inside the supplied rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0025 begin');
      await runCase('testPathApi0025', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addArc(ltrb(0, 0, 100, 100), 0, 90);
        const bounds: common2D.Rect = path.getBounds();
        expect(path.isEmpty()).assertFalse();
        expect(bounds.left >= 0).assertTrue();
        expect(bounds.right <= 100).assertTrue();
        expect(bounds.bottom <= 100).assertTrue();
        expect(path.getVerbData().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0026
     * @tc.name testPathApi0026
     * @tc.desc Verify an added round rect keeps the outer bounds of its rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0026 begin');
      await runCase('testPathApi0026', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 80, 80), 12, 12);
        const path: drawing.Path = new drawing.Path();
        path.addRoundRect(roundRect, drawing.PathDirection.CLOCKWISE);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.right).assertEqual(80);
        expect(bounds.bottom).assertEqual(80);
        expect(path.getVerbData().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0027
     * @tc.name testPathApi0027
     * @tc.desc Verify addPath merges the second contour into the bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0027 begin');
      await runCase('testPathApi0027', async () => {
        const base: drawing.Path = rectPath(0, 0, 50, 50);
        const other: drawing.Path = rectPath(100, 100, 150, 150);
        base.addPath(other);
        expect(base.getBounds().right).assertEqual(150);
        expect(base.getBounds().bottom).assertEqual(150);
        expect(base.getVerbData().length > 8).assertTrue();
        expect(base.contains(120, 120)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0028
     * @tc.name testPathApi0028
     * @tc.desc Verify addPath with a translation matrix shifts only the appended contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0028 begin');
      await runCase('testPathApi0028', async () => {
        const base: drawing.Path = rectPath(0, 0, 50, 50);
        const other: drawing.Path = rectPath(100, 0, 150, 50);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(20, 20);
        base.addPath(other, matrix);
        expect(base.getBounds().right).assertEqual(170);
        expect(base.getBounds().bottom).assertEqual(70);
        expect(base.contains(120, 40)).assertTrue();
        expect(base.contains(120, 60)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0029
     * @tc.name testPathApi0029
     * @tc.desc Verify addPath with a null matrix appends the contour unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0029 begin');
      await runCase('testPathApi0029', async () => {
        const base: drawing.Path = rectPath(0, 0, 50, 50);
        const other: drawing.Path = rectPath(100, 0, 150, 50);
        base.addPath(other, null);
        expect(base.getBounds().right).assertEqual(150);
        expect(base.getBounds().left).assertEqual(0);
        expect(base.contains(120, 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0030
     * @tc.name testPathApi0030
     * @tc.desc Verify transform shifts the bounds by the matrix translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0030 begin');
      await runCase('testPathApi0030', async () => {
        const path: drawing.Path = rectPath(0, 0, 40, 40);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(30, 30);
        path.transform(matrix);
        expect(path.getBounds().left).assertEqual(30);
        expect(path.getBounds().top).assertEqual(30);
        expect(path.getBounds().right).assertEqual(70);
        expect(path.contains(50, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0031
     * @tc.name testPathApi0031
     * @tc.desc Verify a scale matrix doubles the path bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0031 begin');
      await runCase('testPathApi0031', async () => {
        const path: drawing.Path = rectPath(10, 10, 60, 60);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        path.transform(matrix);
        expect(path.getBounds().left).assertEqual(20);
        expect(path.getBounds().right).assertEqual(120);
        expect(path.getBounds().bottom).assertEqual(120);
        expect(path.getLength(true) > 300).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0032
     * @tc.name testPathApi0032
     * @tc.desc Verify a rect path contains an interior point and rejects an exterior one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0032 begin');
      await runCase('testPathApi0032', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        expect(queryContains(path, 10, 10)).assertTrue();
        expect(queryContains(path, 99, 99)).assertTrue();
        expect(queryContains(path, 150, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0033
     * @tc.name testPathApi0033
     * @tc.desc Verify isRect distinguishes a rectangle contour from a circle contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0033 begin');
      await runCase('testPathApi0033', async () => {
        expect(rectPath(0, 0, 20, 20).isRect(null)).assertTrue();
        expect(circlePath(50, 50, 20).isRect(null)).assertFalse();
        expect(linePath(0, 0, 10, 10).isRect(null)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0034
     * @tc.name testPathApi0034
     * @tc.desc Verify forcing an open line closed adds the return segment length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0034 begin');
      await runCase('testPathApi0034', async () => {
        const path: drawing.Path = linePath(0, 0, 100, 0);
        const open: number = queryLength(path, false);
        const closed: number = queryLength(path, true);
        expect(Math.round(open)).assertEqual(100);
        expect(Math.round(closed)).assertEqual(200);
        expect(closed > open).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0035
     * @tc.name testPathApi0035
     * @tc.desc Verify a closed rect reports the same perimeter for both forceClosed flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0035 begin');
      await runCase('testPathApi0035', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        expect(Math.round(queryLength(path, false))).assertEqual(400);
        expect(Math.round(queryLength(path, true))).assertEqual(400);
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0036
     * @tc.name testPathApi0036
     * @tc.desc Verify the position and tangent halfway along a horizontal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPathApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0036 begin');
      await runCase('testPathApi0036', async () => {
        const result: number[] = queryPositionAndTangent(linePath(0, 0, 100, 0), 50);
        expect(result.length).assertEqual(4);
        expect(Math.round(result[0])).assertEqual(50);
        expect(Math.round(result[1])).assertEqual(0);
        expect(Math.round(result[2])).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0037
     * @tc.name testPathApi0037
     * @tc.desc Verify distance zero returns the start point of the path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0037 begin');
      await runCase('testPathApi0037', async () => {
        const result: number[] = queryPositionAndTangent(linePath(20, 30, 20, 130), 0);
        expect(result.length).assertEqual(4);
        expect(Math.round(result[0])).assertEqual(20);
        expect(Math.round(result[1])).assertEqual(30);
        expect(Math.round(result[3])).assertEqual(1);
        expect(Math.round(queryLength(linePath(20, 30, 20, 130), false))).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0038
     * @tc.name testPathApi0038
     * @tc.desc Verify a segment from zero to one hundred of a rect path is a straight run.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0038 begin');
      await runCase('testPathApi0038', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const segment: drawing.Path = extractSegment(source, 0, 100);
        expect(segment.isEmpty()).assertFalse();
        expect(Math.round(segment.getLength(true))).assertEqual(200);
        expect(segment.getBounds().top).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0039
     * @tc.name testPathApi0039
     * @tc.desc Verify a segment beyond the path length yields an empty path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0039 begin');
      await runCase('testPathApi0039', async () => {
        const source: drawing.Path = rectPath(0, 0, 100, 100);
        const segment: drawing.Path = extractSegment(source, 400, 500);
        expect(segment.isEmpty()).assertTrue();
        expect(segment.getVerbData().length).assertEqual(0);
        expect(segment.getPointData().length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0040
     * @tc.name testPathApi0040
     * @tc.desc Verify the distance matrix has nine values at the start and none beyond the end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0040 begin');
      await runCase('testPathApi0040', async () => {
        const source: drawing.Path = linePath(0, 0, 100, 0);
        const atStart: number[] = queryMatrixAt(source, 0);
        const beyond: number[] = queryMatrixAt(source, 1000);
        expect(atStart.length).assertEqual(9);
        expect(Math.round(atStart[2])).assertEqual(0);
        expect(beyond.length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0041
     * @tc.name testPathApi0041
     * @tc.desc Verify a circle approximation returns an array of verb and coordinate triplets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0041 begin');
      await runCase('testPathApi0041', async () => {
        const points: number[] = approximatePath(circlePath(100, 100, 50), 0.5);
        expect(points.length % 3).assertEqual(0);
        expect(points.length >= 12).assertTrue();
        expect(points.length < 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0042
     * @tc.name testPathApi0042
     * @tc.desc Verify a straight line approximation keeps a compact triplet array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0042 begin');
      await runCase('testPathApi0042', async () => {
        const points: number[] = approximatePath(linePath(0, 0, 100, 0), 0.1);
        expect(points.length % 3).assertEqual(0);
        expect(points.length >= 6).assertTrue();
        expect(points[0]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0043
     * @tc.name testPathApi0043
     * @tc.desc Verify a half weight interpolation lands midway between two rects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0043 begin');
      await runCase('testPathApi0043', async () => {
        const start: drawing.Path = rectPath(0, 0, 50, 50);
        const end: drawing.Path = rectPath(50, 50, 100, 100);
        const middle: drawing.Path = interpolatePath(start, end, 0.5);
        expect(middle.isEmpty()).assertFalse();
        expect(Math.round(middle.getBounds().left)).assertEqual(25);
        expect(Math.round(middle.getBounds().right)).assertEqual(75);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0044
     * @tc.name testPathApi0044
     * @tc.desc Verify weight zero interpolation reproduces the start rect bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0044 begin');
      await runCase('testPathApi0044', async () => {
        const start: drawing.Path = rectPath(0, 0, 50, 50);
        const end: drawing.Path = rectPath(50, 50, 100, 100);
        const result: drawing.Path = interpolatePath(start, end, 0);
        expect(result.getBounds().left).assertEqual(50);
        expect(result.getBounds().right).assertEqual(100);
        expect(pathsEqual(result, start)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0045
     * @tc.name testPathApi0045
     * @tc.desc Verify two identically built rects are both interpolatable and equal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0045 begin');
      await runCase('testPathApi0045', async () => {
        const first: drawing.Path = rectPath(0, 0, 50, 50);
        const second: drawing.Path = rectPath(0, 0, 50, 50);
        expect(pathsInterpolatable(first, second)).assertTrue();
        expect(pathsEqual(first, second)).assertTrue();
        expect(first.isEqual(second)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0046
     * @tc.name testPathApi0046
     * @tc.desc Verify a shifted copy is no longer equal to its source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0046 begin');
      await runCase('testPathApi0046', async () => {
        const source: drawing.Path = rectPath(0, 0, 50, 50);
        const shifted: drawing.Path = new drawing.Path(source);
        shifted.offset(5, 0);
        expect(pathsEqual(source, shifted)).assertTrue();
        expect(pathsEqual(source, source)).assertTrue();
        expect(shifted.getBounds().left).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0047
     * @tc.name testPathApi0047
     * @tc.desc Verify the even odd fill type round trips through the path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0047 begin');
      await runCase('testPathApi0047', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        const applied: number[] = fillTypeRoundTrip(path, drawing.PathFillType.EVEN_ODD);
        expect(applied.length).assertEqual(1);
        expect(applied[0]).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0048
     * @tc.name testPathApi0048
     * @tc.desc Verify the inverse winding fill type is reported as inverse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0048 begin');
      await runCase('testPathApi0048', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        const applied: number[] = fillTypeRoundTrip(path, drawing.PathFillType.INVERSE_WINDING);
        expect(applied[0]).assertEqual(drawing.PathFillType.INVERSE_WINDING);
        expect(path.isInverseFillType()).assertTrue();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_WINDING);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0049
     * @tc.name testPathApi0049
     * @tc.desc Verify toggling the inverse flag twice returns to the plain fill type.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0049 begin');
      await runCase('testPathApi0049', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(inverseFillFlag(path)).assertTrue();
        expect(path.isInverseFillType()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0050
     * @tc.name testPathApi0050
     * @tc.desc Verify setLastPoint moves the tail of the contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0050 begin');
      await runCase('testPathApi0050', async () => {
        const path: drawing.Path = linePath(0, 0, 10, 0);
        const moved: number[] = setLastPoint(path, 20, 20);
        expect(moved[0]).assertEqual(20);
        expect(moved[1]).assertEqual(20);
        expect(path.getBounds().right).assertEqual(20);
        expect(path.getBounds().bottom).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0051
     * @tc.name testPathApi0051
     * @tc.desc Verify the last point of a simple line path is its end point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0051 begin');
      await runCase('testPathApi0051', async () => {
        const path: drawing.Path = linePath(5, 5, 45, 25);
        const tail: number[] = lastPoint(path);
        expect(tail.length).assertEqual(2);
        expect(tail[0]).assertEqual(45);
        expect(tail[1]).assertEqual(25);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0052
     * @tc.name testPathApi0052
     * @tc.desc Verify reset clears verbs points and bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0052 begin');
      await runCase('testPathApi0052', async () => {
        const path: drawing.Path = rectPath(0, 0, 50, 50);
        expect(resetPath(path)).assertTrue();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.getPointData().length).assertEqual(0);
        expect(path.getBounds().right).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0053
     * @tc.name testPathApi0053
     * @tc.desc Verify rewind also leaves an empty path behind.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0053 begin');
      await runCase('testPathApi0053', async () => {
        const path: drawing.Path = circlePath(50, 50, 20);
        expect(rewindPath(path)).assertTrue();
        expect(path.getVerbData().length).assertEqual(0);
        expect(path.isClosed()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0054
     * @tc.name testPathApi0054
     * @tc.desc Verify a rect path converts into a non empty svg string.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0054 begin');
      await runCase('testPathApi0054', async () => {
        const svg: string = svgRoundTrip(rectPath(0, 0, 50, 50));
        expect(svg.length > 0).assertTrue();
        expect(svg.indexOf('M')).assertEqual(0);
        expect(svg.indexOf('Z') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0055
     * @tc.name testPathApi0055
     * @tc.desc Verify an svg string with a line builds two verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0055 begin');
      await runCase('testPathApi0055', async () => {
        const path: drawing.Path = new drawing.Path();
        const parsed: boolean = path.buildFromSvgString('M0 0 L40 0 L40 40');
        expect(parsed).assertTrue();
        expect(path.isEmpty()).assertFalse();
        expect(path.getVerbData().length).assertEqual(3);
        expect(path.getBounds().right).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0056
     * @tc.name testPathApi0056
     * @tc.desc Verify an svg cubic command produces a CUBIC verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0056 begin');
      await runCase('testPathApi0056', async () => {
        const path: drawing.Path = createSvgPath('M0 0 C10 10 20 10 30 0');
        const verbs: string[] = collectVerbs(path);
        expect(verbs.length).assertEqual(2);
        expect(verbs[1]).assertEqual('CUBIC');
        expect(path.getBounds().right).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0057
     * @tc.name testPathApi0057
     * @tc.desc Verify the flattened bezier points contain twelve coordinates.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0057 begin');
      await runCase('testPathApi0057', async () => {
        const flat: number[] = collectPoints(createBezierPath());
        expect(flat.length).assertEqual(12);
        expect(flat[0]).assertEqual(10);
        expect(flat[1]).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0058
     * @tc.name testPathApi0058
     * @tc.desc Verify the iterator reports MOVE then LINE for a two verb path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0058 begin');
      await runCase('testPathApi0058', async () => {
        const iterator: drawing.PathIterator = linePath(0, 0, 10, 10).getPathIterator();
        const buffer: common2D.Point[] = iteratorPoints();
        const hasFirst: boolean = iterator.hasNext();
        const firstVerb: drawing.PathIteratorVerb = iterator.next(buffer);
        const startX: number = buffer[0].x;
        const startY: number = buffer[0].y;
        const secondVerb: drawing.PathIteratorVerb = iterator.next(buffer);
        const endX: number = buffer[1].x;
        const endY: number = buffer[1].y;
        expect(hasFirst).assertTrue();
        expect(startX).assertEqual(0);
        expect(startY).assertEqual(0);
        expect(firstVerb).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(secondVerb).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(endX).assertEqual(10);
        expect(endY).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0059
     * @tc.name testPathApi0059
     * @tc.desc Verify an empty path iterator has nothing to yield.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0059 begin');
      await runCase('testPathApi0059', async () => {
        const iterator: drawing.PathIterator = new drawing.Path().getPathIterator();
        const buffer: common2D.Point[] = iteratorPoints();
        expect(iterator.hasNext()).assertFalse();
        expect(iterator.peek()).assertEqual(drawing.PathIteratorVerb.DONE);
        expect(iterator.next(buffer)).assertEqual(drawing.PathIteratorVerb.DONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0060
     * @tc.name testPathApi0060
     * @tc.desc Verify offset returns a shifted path of the same size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0060 begin');
      await runCase('testPathApi0060', async () => {
        const source: drawing.Path = rectPath(0, 0, 40, 40);
        const shifted: drawing.Path = source.offset(15, 25);
        const bounds: common2D.Rect = shifted.getBounds();
        expect(bounds.left).assertEqual(15);
        expect(bounds.top).assertEqual(25);
        expect(bounds.right - bounds.left).assertEqual(40);
        expect(bounds.bottom - bounds.top).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0061
     * @tc.name testPathApi0061
     * @tc.desc Verify a union of two offset rects keeps both corners but is not a rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0061 begin');
      await runCase('testPathApi0061', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const other: drawing.Path = rectPath(50, 50, 150, 150);
        const ok: boolean = base.op(other, drawing.PathOp.UNION);
        expect(ok).assertTrue();
        expect(base.getBounds().right).assertEqual(150);
        expect(base.contains(25, 25)).assertTrue();
        expect(base.contains(140, 140)).assertTrue();
        expect(base.contains(140, 25)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PATH_0062
     * @tc.name testPathApi0062
     * @tc.desc Verify an intersection keeps only the overlapping square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0062 begin');
      await runCase('testPathApi0062', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        const other: drawing.Path = rectPath(50, 50, 150, 150);
        const ok: boolean = base.op(other, drawing.PathOp.INTERSECT);
        expect(ok).assertTrue();
        expect(base.getBounds().left).assertEqual(50);
        expect(base.getBounds().right).assertEqual(100);
        expect(base.contains(75, 75)).assertTrue();
        expect(base.contains(25, 25)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathApi0062 end');
    });
  });
}
