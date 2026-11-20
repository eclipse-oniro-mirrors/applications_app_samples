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
  createArcPath,
  createBezierPath,
  createCombinedPath,
  createConicPath,
  createPathFromPath,
  createPolygonPath,
  createPrimitivePath,
  createRelativePath,
  createStarPath,
  createSvgPath
} from '../../../main/ets/drawing/DrawingPathShape';
import {
  collectConicWeights,
  collectVerbs,
  PathSummary,
  pathsEqual,
  queryIsRect,
  queryLength,
  resetPath,
  summarize,
  svgRoundTrip
} from '../../../main/ets/drawing/DrawingPathQuery';
import { runCase } from './DrawingTestRunner';

function containsName(names: string[], expected: string): boolean {
  for (let index: number = 0; index < names.length; index++) {
    if (names[index] === expected) {
      return true;
    }
  }
  return false;
}

export default function drawingPathShapeTest() {
  describe('DrawingPathShapeTest', () => {
    /**
     * @tc.number SUB_PATH_SHAPE_0100
     * @tc.name testPathShape0001
     * @tc.desc Verify the star path is a closed and non empty contour.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0001', 0, async (done: Function) => {
      await runCase('testPathShape0001', async () => {
        const summary: PathSummary = summarize(createStarPath());
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertTrue();
        expect(summary.verbCount).assertLarger(3);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0200
     * @tc.name testPathShape0002
     * @tc.desc Verify the star path bounds cover the expected geometry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0002', 0, async (done: Function) => {
      await runCase('testPathShape0002', async () => {
        const summary: PathSummary = summarize(createStarPath());
        expect(summary.right).assertLarger(summary.left);
        expect(summary.bottom).assertLarger(summary.top);
        expect(summary.length).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0300
     * @tc.name testPathShape0003
     * @tc.desc Verify the star path closing length is larger than the open one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0003', 0, async (done: Function) => {
      await runCase('testPathShape0003', async () => {
        const path: drawing.Path = createStarPath();
        const closed: number = queryLength(path, true);
        const open: number = queryLength(path, false);
        expect(closed).assertLarger(0);
        expect(closed).assertClose(1189.662841796875, 0.01);
        expect(open).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0400
     * @tc.name testPathShape0004
     * @tc.desc Verify the arc path is open and reaches the line end point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0004', 0, async (done: Function) => {
      await runCase('testPathShape0004', async () => {
        const summary: PathSummary = summarize(createArcPath());
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertFalse();
        expect(summary.right).assertEqual(180);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0500
     * @tc.name testPathShape0005
     * @tc.desc Verify the arc path starts from the moved point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0005', 0, async (done: Function) => {
      await runCase('testPathShape0005', async () => {
        const summary: PathSummary = summarize(createArcPath());
        expect(summary.left).assertEqual(20);
        expect(summary.bottom).assertEqual(180);
        expect(summary.length).assertLarger(180);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0600
     * @tc.name testPathShape0006
     * @tc.desc Verify the bezier path spans the requested horizontal range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0006', 0, async (done: Function) => {
      await runCase('testPathShape0006', async () => {
        const summary: PathSummary = summarize(createBezierPath());
        expect(summary.left).assertEqual(10);
        expect(summary.right).assertEqual(190);
        expect(summary.isEmpty).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0700
     * @tc.name testPathShape0007
     * @tc.desc Verify the bezier path is open and curved above the baseline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0007', 0, async (done: Function) => {
      await runCase('testPathShape0007', async () => {
        const summary: PathSummary = summarize(createBezierPath());
        expect(summary.isClosed).assertFalse();
        expect(summary.top < 150).assertTrue();
        expect(summary.length).assertLarger(180);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0800
     * @tc.name testPathShape0008
     * @tc.desc Verify the conic path records both conic weights.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0008', 0, async (done: Function) => {
      await runCase('testPathShape0008', async () => {
        const weights: number[] = collectConicWeights(createConicPath());
        expect(weights.length).assertEqual(2);
        expect(weights[0]).assertEqual(0.5);
        expect(weights[1]).assertClose(0.8, 0.000001);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_0900
     * @tc.name testPathShape0009
     * @tc.desc Verify the conic path reaches the relative end point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0009', 0, async (done: Function) => {
      await runCase('testPathShape0009', async () => {
        const summary: PathSummary = summarize(createConicPath());
        expect(summary.left).assertEqual(10);
        expect(summary.right).assertEqual(170);
        expect(summary.isClosed).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1000
     * @tc.name testPathShape0010
     * @tc.desc Verify the relative path starts from the moved point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0010', 0, async (done: Function) => {
      await runCase('testPathShape0010', async () => {
        const summary: PathSummary = summarize(createRelativePath());
        expect(summary.left).assertEqual(20);
        expect(summary.top).assertEqual(-10);
        expect(summary.isEmpty).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1100
     * @tc.name testPathShape0011
     * @tc.desc Verify the relative segments end at the accumulated position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0011', 0, async (done: Function) => {
      await runCase('testPathShape0011', async () => {
        const summary: PathSummary = summarize(createRelativePath());
        expect(summary.right).assertEqual(180);
        expect(summary.length).assertLarger(160);
        expect(summary.isClosed).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1200
     * @tc.name testPathShape0012
     * @tc.desc Verify the primitive path contains several shapes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0012', 0, async (done: Function) => {
      await runCase('testPathShape0012', async () => {
        const summary: PathSummary = summarize(createPrimitivePath());
        expect(summary.isEmpty).assertFalse();
        expect(summary.left).assertEqual(0);
        expect(summary.top).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1300
     * @tc.name testPathShape0013
     * @tc.desc Verify the primitive path bounds reach the added rectangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0013', 0, async (done: Function) => {
      await runCase('testPathShape0013', async () => {
        const summary: PathSummary = summarize(createPrimitivePath());
        expect(summary.right).assertEqual(180);
        expect(summary.bottom).assertEqual(180);
        expect(summary.verbCount).assertLarger(5);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1400
     * @tc.name testPathShape0014
     * @tc.desc Verify the combined path keeps the union of the two sources.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0014', 0, async (done: Function) => {
      await runCase('testPathShape0014', async () => {
        const summary: PathSummary = summarize(createCombinedPath());
        expect(summary.isEmpty).assertFalse();
        expect(summary.right).assertLarger(0);
        expect(summary.bottom).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1500
     * @tc.name testPathShape0015
     * @tc.desc Verify the closed polygon path reports itself as closed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0015', 0, async (done: Function) => {
      await runCase('testPathShape0015', async () => {
        const summary: PathSummary = summarize(createPolygonPath(true));
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertTrue();
        expect(summary.right).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1600
     * @tc.name testPathShape0016
     * @tc.desc Verify the open polygon path reports itself as open.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0016', 0, async (done: Function) => {
      await runCase('testPathShape0016', async () => {
        const summary: PathSummary = summarize(createPolygonPath(false));
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertFalse();
        expect(summary.left).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1700
     * @tc.name testPathShape0017
     * @tc.desc Verify a valid svg string builds a closed triangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0017', 0, async (done: Function) => {
      await runCase('testPathShape0017', async () => {
        const summary: PathSummary = summarize(createSvgPath('M10 10 L100 10 L100 100 Z'));
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertTrue();
        expect(summary.right).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1800
     * @tc.name testPathShape0018
     * @tc.desc Verify an empty svg string produces an empty path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0018', 0, async (done: Function) => {
      await runCase('testPathShape0018', async () => {
        const summary: PathSummary = summarize(createSvgPath(''));
        expect(summary.isEmpty).assertTrue();
        expect(summary.length).assertEqual(0);
        expect(summary.isClosed).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_1900
     * @tc.name testPathShape0019
     * @tc.desc Verify an invalid svg string produces an empty path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0019', 0, async (done: Function) => {
      await runCase('testPathShape0019', async () => {
        const summary: PathSummary = summarize(createSvgPath('not an svg path'));
        expect(summary.isEmpty).assertTrue();
        expect(summary.verbCount < 2).assertTrue();
        expect(summary.right).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2000
     * @tc.name testPathShape0020
     * @tc.desc Verify a copied star path equals the source path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0020', 0, async (done: Function) => {
      await runCase('testPathShape0020', async () => {
        const source: drawing.Path = createStarPath();
        const copy: drawing.Path = createPathFromPath(source);
        expect(pathsEqual(source, copy)).assertTrue();
        expect(summarize(copy).isEmpty).assertFalse();
        expect(summarize(copy).length).assertEqual(summarize(source).length);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2100
     * @tc.name testPathShape0021
     * @tc.desc Verify the copied path is independent from the source path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0021', 0, async (done: Function) => {
      await runCase('testPathShape0021', async () => {
        const source: drawing.Path = createStarPath();
        const copy: drawing.Path = createPathFromPath(source);
        resetPath(copy);
        expect(summarize(copy).isEmpty).assertTrue();
        expect(summarize(source).isEmpty).assertFalse();
        expect(pathsEqual(source, copy)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2200
     * @tc.name testPathShape0022
     * @tc.desc Verify the svg round trip of the star path keeps commands.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0022', 0, async (done: Function) => {
      await runCase('testPathShape0022', async () => {
        const svg: string = svgRoundTrip(createStarPath());
        expect(svg.length).assertLarger(10);
        expect(svg.indexOf('M') >= 0).assertTrue();
        expect(svg.indexOf('L') >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2300
     * @tc.name testPathShape0023
     * @tc.desc Verify the arc path verbs start with a move and contain a line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0023', 0, async (done: Function) => {
      await runCase('testPathShape0023', async () => {
        const verbs: string[] = collectVerbs(createArcPath());
        expect(verbs.length).assertLarger(2);
        expect(verbs[0]).assertEqual('MOVE');
        expect(containsName(verbs, 'LINE')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2400
     * @tc.name testPathShape0024
     * @tc.desc Verify the bezier path verbs contain both curve types.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0024', 0, async (done: Function) => {
      await runCase('testPathShape0024', async () => {
        const verbs: string[] = collectVerbs(createBezierPath());
        expect(verbs[0]).assertEqual('MOVE');
        expect(containsName(verbs, 'QUAD')).assertTrue();
        expect(containsName(verbs, 'CUBIC')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2500
     * @tc.name testPathShape0025
     * @tc.desc Verify the conic path verbs contain conic segments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0025', 0, async (done: Function) => {
      await runCase('testPathShape0025', async () => {
        const verbs: string[] = collectVerbs(createConicPath());
        expect(verbs[0]).assertEqual('MOVE');
        expect(containsName(verbs, 'CONIC')).assertTrue();
        expect(verbs.length).assertLarger(2);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2600
     * @tc.name testPathShape0026
     * @tc.desc Verify the closed polygon verbs end with a close command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0026', 0, async (done: Function) => {
      await runCase('testPathShape0026', async () => {
        const verbs: string[] = collectVerbs(createPolygonPath(true));
        expect(containsName(verbs, 'CLOSE')).assertTrue();
        expect(verbs[verbs.length - 1]).assertEqual('CLOSE');
        expect(verbs.length).assertLarger(4);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2700
     * @tc.name testPathShape0027
     * @tc.desc Verify the open polygon verbs do not contain a close command.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0027', 0, async (done: Function) => {
      await runCase('testPathShape0027', async () => {
        const verbs: string[] = collectVerbs(createPolygonPath(false));
        expect(containsName(verbs, 'CLOSE')).assertFalse();
        expect(containsName(verbs, 'LINE')).assertTrue();
        expect(verbs.length).assertLargerOrEqual(4);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2800
     * @tc.name testPathShape0028
     * @tc.desc Verify two star paths built separately are equal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPathShape0028', 0, async (done: Function) => {
      await runCase('testPathShape0028', async () => {
        const first: drawing.Path = createStarPath();
        const second: drawing.Path = createStarPath();
        expect(pathsEqual(first, second)).assertTrue();
        expect(summarize(first).length).assertEqual(summarize(second).length);
        expect(summarize(second).isEmpty).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_2900
     * @tc.name testPathShape0029
     * @tc.desc Verify the combined path differs from a plain rectangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0029', 0, async (done: Function) => {
      await runCase('testPathShape0029', async () => {
        const combined: drawing.Path = createCombinedPath();
        const rect: drawing.Path = new drawing.Path();
        rect.addRect({ left: 10, top: 10, right: 90, bottom: 90 });
        expect(pathsEqual(combined, rect)).assertFalse();
        expect(summarize(combined).length > summarize(rect).length).assertTrue();
        expect(summarize(rect).isEmpty).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_3000
     * @tc.name testPathShape0030
     * @tc.desc Verify an svg string with decimal coordinates is parsed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0030', 0, async (done: Function) => {
      await runCase('testPathShape0030', async () => {
        const summary: PathSummary = summarize(createSvgPath('M10.5 10.5 L100.5 10.5 L50 80.5 Z'));
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertTrue();
        expect(summary.right).assertEqual(100.5);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_3100
     * @tc.name testPathShape0031
     * @tc.desc Verify the arc path is longer than the straight chord.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0031', 0, async (done: Function) => {
      await runCase('testPathShape0031', async () => {
        const length: number = queryLength(createArcPath(), false);
        expect(length).assertLarger(160);
        expect(length < 1000).assertTrue();
        expect(queryIsRect(createArcPath())).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_3200
     * @tc.name testPathShape0032
     * @tc.desc Verify the primitive path is not a single rectangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0032', 0, async (done: Function) => {
      await runCase('testPathShape0032', async () => {
        expect(queryIsRect(createPrimitivePath())).assertFalse();
        expect(queryIsRect(createStarPath())).assertFalse();
        expect(queryIsRect(createCombinedPath())).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_3300
     * @tc.name testPathShape0033
     * @tc.desc Verify copying an empty path keeps it empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0033', 0, async (done: Function) => {
      await runCase('testPathShape0033', async () => {
        const empty: drawing.Path = new drawing.Path();
        const copy: drawing.Path = createPathFromPath(empty);
        expect(copy.isEmpty()).assertTrue();
        expect(pathsEqual(empty, copy)).assertTrue();
        expect(queryLength(copy, true)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PATH_SHAPE_3400
     * @tc.name testPathShape0034
     * @tc.desc Verify the combined path is larger than its own rectangle source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPathShape0034', 0, async (done: Function) => {
      await runCase('testPathShape0034', async () => {
        const summary: PathSummary = summarize(createCombinedPath());
        expect(summary.length).assertLarger(0);
        expect(summary.right - summary.left > 80).assertTrue();
        expect(summary.bottom - summary.top > 80).assertTrue();
      }, done);
    });
  });
}
