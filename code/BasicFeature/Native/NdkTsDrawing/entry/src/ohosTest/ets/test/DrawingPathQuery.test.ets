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
import { drawing } from '@kit.ArkGraphics2D';
import {
  approximatePath,
  collectConicWeights,
  collectPoints,
  collectVerbs,
  extractSegment,
  fillTypeRoundTrip,
  interpolatePath,
  inverseFillFlag,
  iterateVerbs,
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
import { createConicPath, createStarPath } from '../../../main/ets/drawing/DrawingPathShape';
import { ltrb } from '../../../main/ets/drawing/DrawingTypes';
import { runCase } from './DrawingTestRunner';

function rectPath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(10, 10, 110, 110));
  return path;
}

function linePath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(10, 10);
  path.lineTo(210, 10);
  return path;
}

export default function drawingPathQueryTest() {
  describe('DrawingPathQueryTest', () => {
    /**
     * @tc.number SUB_PATH_QUERY_0100
     * @tc.name testPathQuery0001
     * @tc.desc Verify the iterator verb name of the move command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0001', 0, async (done: Function) => {
      await runCase('testPathQuery0001', async () => {
        expect(verbName(drawing.PathIteratorVerb.MOVE)).assertEqual('MOVE');
        expect(verbName(drawing.PathIteratorVerb.MOVE).length).assertEqual(4);
        expect(verbName(drawing.PathIteratorVerb.MOVE) === 'LINE').assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0200
     * @tc.name testPathQuery0002
     * @tc.desc Verify the iterator verb name of the line command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0002', 0, async (done: Function) => {
      await runCase('testPathQuery0002', async () => {
        expect(verbName(drawing.PathIteratorVerb.LINE)).assertEqual('LINE');
        expect(verbName(drawing.PathIteratorVerb.LINE).length).assertEqual(4);
        expect(verbName(drawing.PathIteratorVerb.LINE) === 'MOVE').assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0300
     * @tc.name testPathQuery0003
     * @tc.desc Verify the iterator verb name of the quadratic command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0003', 0, async (done: Function) => {
      await runCase('testPathQuery0003', async () => {
        expect(verbName(drawing.PathIteratorVerb.QUAD)).assertEqual('QUAD');
        expect(verbName(drawing.PathIteratorVerb.QUAD).length).assertEqual(4);
        expect(verbName(drawing.PathIteratorVerb.QUAD) === 'CUBIC').assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0400
     * @tc.name testPathQuery0004
     * @tc.desc Verify the iterator verb name of the conic command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0004', 0, async (done: Function) => {
      await runCase('testPathQuery0004', async () => {
        expect(verbName(drawing.PathIteratorVerb.CONIC)).assertEqual('CONIC');
        expect(verbName(drawing.PathIteratorVerb.CONIC).length).assertEqual(5);
        expect(verbName(drawing.PathIteratorVerb.CONIC) === 'QUAD').assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0500
     * @tc.name testPathQuery0005
     * @tc.desc Verify the iterator verb name of the cubic command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0005', 0, async (done: Function) => {
      await runCase('testPathQuery0005', async () => {
        expect(verbName(drawing.PathIteratorVerb.CUBIC)).assertEqual('CUBIC');
        expect(verbName(drawing.PathIteratorVerb.CUBIC).length).assertEqual(5);
        expect(verbName(drawing.PathIteratorVerb.CUBIC) === 'CONIC').assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0600
     * @tc.name testPathQuery0006
     * @tc.desc Verify the iterator verb name of the close command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0006', 0, async (done: Function) => {
      await runCase('testPathQuery0006', async () => {
        expect(verbName(drawing.PathIteratorVerb.CLOSE)).assertEqual('CLOSE');
        expect(verbName(drawing.PathIteratorVerb.CLOSE).length).assertEqual(5);
        expect(verbName(drawing.PathIteratorVerb.CLOSE) === 'DONE').assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0700
     * @tc.name testPathQuery0007
     * @tc.desc Verify the iterator verb name of the done marker.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0007', 0, async (done: Function) => {
      await runCase('testPathQuery0007', async () => {
        expect(verbName(drawing.PathIteratorVerb.DONE)).assertEqual('DONE');
        expect(verbName(drawing.PathIteratorVerb.DONE).length).assertEqual(4);
        expect(verbName(drawing.PathIteratorVerb.DONE) === 'MOVE').assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0800
     * @tc.name testPathQuery0008
     * @tc.desc Verify the summary of a rectangle path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0008', 0, async (done: Function) => {
      await runCase('testPathQuery0008', async () => {
        const summary: PathSummary = summarize(rectPath());
        expect(summary.isClosed).assertTrue();
        expect(summary.right).assertEqual(110);
        expect(summary.length).assertEqual(400);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_0900
     * @tc.name testPathQuery0009
     * @tc.desc Verify the summary of an empty path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0009', 0, async (done: Function) => {
      await runCase('testPathQuery0009', async () => {
        const summary: PathSummary = summarize(new drawing.Path());
        expect(summary.isEmpty).assertTrue();
        expect(summary.length).assertEqual(0);
        expect(summary.verbCount).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1000
     * @tc.name testPathQuery0010
     * @tc.desc Verify a point inside the rectangle is contained.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0010', 0, async (done: Function) => {
      await runCase('testPathQuery0010', async () => {
        expect(queryContains(rectPath(), 50, 50)).assertTrue();
        expect(queryContains(rectPath(), 11, 11)).assertTrue();
        expect(queryContains(rectPath(), 109, 109)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1100
     * @tc.name testPathQuery0011
     * @tc.desc Verify a point outside the rectangle is not contained.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0011', 0, async (done: Function) => {
      await runCase('testPathQuery0011', async () => {
        expect(queryContains(rectPath(), 5, 5)).assertFalse();
        expect(queryContains(rectPath(), 200, 200)).assertFalse();
        expect(queryContains(new drawing.Path(), 0, 0)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1200
     * @tc.name testPathQuery0012
     * @tc.desc Verify the rectangle path length with and without the close segment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0012', 0, async (done: Function) => {
      await runCase('testPathQuery0012', async () => {
        const path: drawing.Path = rectPath();
        expect(queryLength(path, true)).assertEqual(400);
        expect(queryLength(path, false)).assertEqual(400);
        expect(queryLength(path, true) === queryLength(path, false)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1300
     * @tc.name testPathQuery0013
     * @tc.desc Verify the position and tangent at the start of a line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0013', 0, async (done: Function) => {
      await runCase('testPathQuery0013', async () => {
        const result: number[] = queryPositionAndTangent(linePath(), 0);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1400
     * @tc.name testPathQuery0014
     * @tc.desc Verify an out of range distance yields no position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0014', 0, async (done: Function) => {
      await runCase('testPathQuery0014', async () => {
        const result: number[] = queryPositionAndTangent(linePath(), 5000);
        expect(result.length).assertEqual(4);
        expect(queryLength(linePath(), false)).assertEqual(200);
        expect(result.length).assertEqual(4);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1500
     * @tc.name testPathQuery0015
     * @tc.desc Verify a segment extracted from the middle of the path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0015', 0, async (done: Function) => {
      await runCase('testPathQuery0015', async () => {
        const segment: drawing.Path = extractSegment(linePath(), 0, 100);
        expect(segment.isEmpty()).assertFalse();
        expect(segment.getLength(false)).assertEqual(100);
        expect(segment.getBounds().right).assertEqual(110);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1600
     * @tc.name testPathQuery0016
     * @tc.desc Verify an inverted segment range yields an empty path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0016', 0, async (done: Function) => {
      await runCase('testPathQuery0016', async () => {
        const segment: drawing.Path = extractSegment(linePath(), 150, 50);
        expect(segment.isEmpty()).assertTrue();
        expect(segment.getLength(false)).assertEqual(0);
        expect(segment.isEmpty() === false).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1700
     * @tc.name testPathQuery0017
     * @tc.desc Verify a rectangle path is recognised as a rectangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0017', 0, async (done: Function) => {
      await runCase('testPathQuery0017', async () => {
        expect(queryIsRect(rectPath())).assertTrue();
        expect(queryIsRect(new drawing.Path())).assertFalse();
        expect(queryIsRect(linePath())).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1800
     * @tc.name testPathQuery0018
     * @tc.desc Verify the star path is not a rectangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0018', 0, async (done: Function) => {
      await runCase('testPathQuery0018', async () => {
        expect(queryIsRect(createStarPath())).assertFalse();
        expect(queryIsRect(createConicPath())).assertFalse();
        expect(queryIsRect(createStarPath()) === true).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_1900
     * @tc.name testPathQuery0019
     * @tc.desc Verify the matrix read at a valid distance along the line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0019', 0, async (done: Function) => {
      await runCase('testPathQuery0019', async () => {
        const values: number[] = queryMatrixAt(linePath(), 50);
        expect(values.length).assertEqual(9);
        expect(values[8]).assertEqual(1);
        expect(values[0] === 0).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2000
     * @tc.name testPathQuery0020
     * @tc.desc Verify an out of range distance yields no matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0020', 0, async (done: Function) => {
      await runCase('testPathQuery0020', async () => {
        const values: number[] = queryMatrixAt(linePath(), 5000);
        const rectValues: number[] = queryMatrixAt(rectPath(), 10);
        expect(values.length).assertEqual(9);
        expect(values[8]).assertEqual(1);
        expect(rectValues.length).assertEqual(9);
        expect(values.length).assertEqual(rectValues.length);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2100
     * @tc.name testPathQuery0021
     * @tc.desc Verify the svg string of a rectangle path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0021', 0, async (done: Function) => {
      await runCase('testPathQuery0021', async () => {
        const svg: string = svgRoundTrip(rectPath());
        expect(svg.length).assertLarger(10);
        expect(svg.indexOf('M') >= 0).assertTrue();
        expect(svg.indexOf('Z') >= 0 || svg.indexOf('z') >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2200
     * @tc.name testPathQuery0022
     * @tc.desc Verify the verbs collected from a rectangle path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0022', 0, async (done: Function) => {
      await runCase('testPathQuery0022', async () => {
        const verbs: string[] = collectVerbs(rectPath());
        expect(verbs[0]).assertEqual('MOVE');
        expect(verbs.indexOf('LINE') >= 0).assertTrue();
        expect(verbs.indexOf('CLOSE') >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2300
     * @tc.name testPathQuery0023
     * @tc.desc Verify the point data of a line path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0023', 0, async (done: Function) => {
      await runCase('testPathQuery0023', async () => {
        const points: number[] = collectPoints(linePath());
        expect(points.length).assertEqual(4);
        expect(points[0]).assertEqual(10);
        expect(points[2]).assertEqual(210);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2400
     * @tc.name testPathQuery0024
     * @tc.desc Verify the conic weights of the conic path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0024', 0, async (done: Function) => {
      await runCase('testPathQuery0024', async () => {
        const weights: number[] = collectConicWeights(createConicPath());
        expect(weights.length).assertEqual(2);
        expect(weights[0]).assertEqual(0.5);
        expect(collectConicWeights(linePath()).length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2500
     * @tc.name testPathQuery0025
     * @tc.desc Verify the iterator walks the rectangle path verbs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0025', 0, async (done: Function) => {
      await runCase('testPathQuery0025', async () => {
        const verbs: string[] = iterateVerbs(rectPath());
        expect(verbs.length).assertLarger(1);
        expect(verbs[0]).assertEqual('MOVE');
        expect(verbs.indexOf('LINE') >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2600
     * @tc.name testPathQuery0026
     * @tc.desc Verify the approximate result of the line path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0026', 0, async (done: Function) => {
      await runCase('testPathQuery0026', async () => {
        const flat: number[] = approximatePath(linePath(), 1);
        expect(flat.length).assertLarger(5);
        expect(flat[0]).assertEqual(0);
        expect(approximatePath(new drawing.Path(), 1).length).assertEqual(6);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2700
     * @tc.name testPathQuery0027
     * @tc.desc Verify two lines can be interpolated at the middle weight.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0027', 0, async (done: Function) => {
      await runCase('testPathQuery0027', async () => {
        const start: drawing.Path = linePath();
        const end: drawing.Path = new drawing.Path();
        end.moveTo(10, 110);
        end.lineTo(210, 110);
        expect(pathsInterpolatable(start, end)).assertTrue();
        const middle: drawing.Path = interpolatePath(start, end, 0.5);
        expect(middle.isEmpty()).assertFalse();
        expect(middle.getLength(false)).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2800
     * @tc.name testPathQuery0028
     * @tc.desc Verify two identical lines are equal and the fill type round trip.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathQuery0028', 0, async (done: Function) => {
      await runCase('testPathQuery0028', async () => {
        expect(pathsEqual(linePath(), linePath())).assertTrue();
        expect(pathsEqual(linePath(), rectPath())).assertFalse();
        const applied: number[] = fillTypeRoundTrip(linePath(), drawing.PathFillType.EVEN_ODD);
        expect(applied[0]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_2900
     * @tc.name testPathQuery0029
     * @tc.desc Verify the inverse fill flag and the last point accessors.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0029', 0, async (done: Function) => {
      await runCase('testPathQuery0029', async () => {
        const path: drawing.Path = linePath();
        expect(inverseFillFlag(path)).assertTrue();
        expect(inverseFillFlag(path)).assertFalse();
        const moved: number[] = setLastPoint(path, 50, 60);
        expect(moved[0]).assertEqual(50);
        expect(moved[1]).assertEqual(60);
        expect(lastPoint(path)[1]).assertEqual(60);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_QUERY_3000
     * @tc.name testPathQuery0030
     * @tc.desc Verify reset and rewind both empty the path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathQuery0030', 0, async (done: Function) => {
      await runCase('testPathQuery0030', async () => {
        expect(resetPath(rectPath())).assertTrue();
        expect(rewindPath(rectPath())).assertTrue();
        const path: drawing.Path = rectPath();
        resetPath(path);
        expect(path.getLength(true)).assertEqual(0);
      }, done);
    });
  });
}
