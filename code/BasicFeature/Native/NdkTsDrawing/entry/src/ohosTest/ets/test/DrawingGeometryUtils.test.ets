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
import {
  colorFromResource,
  defaultSamplingOptions,
  emptyRect,
  makeRect,
  negatePoint,
  offsetPoint,
  rectContainsLtrb,
  rectContainsPoint,
  rectContainsRect,
  rectCopy,
  rectInset,
  rectIntersect,
  rectIsEmpty,
  rectIsEqual,
  rectIsIntersect,
  rectOffset,
  rectOffsetTo,
  rectSetEmpty,
  rectSetLtrb,
  rectSetRect,
  rectSnapshot,
  rectSort,
  rectUnion,
  regionBoundaryPath,
  regionContainsPoint,
  regionContainsRegion,
  regionCopy,
  regionFromPath,
  regionFromRect,
  regionFromSetRect,
  regionIsComplex,
  regionIsEmpty,
  regionIsEqual,
  regionIsRect,
  regionOffset,
  regionOp,
  regionQuickContains,
  regionQuickReject,
  regionQuickRejectRegion,
  regionSetEmpty,
  regionSnapshot,
  roundRectCorners,
  roundRectSnapshot,
  samplingOptions
} from '../../../main/ets/drawing/DrawingGeometryUtils';
import { ltrb, point } from '../../../main/ets/drawing/DrawingTypes';
import { runCase } from './DrawingTestRunner';

function baseRect(): common2D.Rect {
  return makeRect(0, 0, 100, 100);
}

export default function drawingGeometryUtilsTest() {
  describe('DrawingGeometryUtilsTest', () => {
    /**
     * @tc.number SUB_GEOMETRY_UTILS_0100
     * @tc.name testGeometryUtils0001
     * @tc.desc Verify the empty rectangle has zero size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0001', 0, async (done: Function) => {
      await runCase('testGeometryUtils0001', async () => {
        const rect: common2D.Rect = emptyRect();
        const snapshot: number[] = rectSnapshot(rect);
        expect(rectIsEmpty(rect)).assertTrue();
        expect(snapshot[4]).assertEqual(0);
        expect(snapshot[5]).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0200
     * @tc.name testGeometryUtils0002
     * @tc.desc Verify the rectangle built from four edges.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0002', 0, async (done: Function) => {
      await runCase('testGeometryUtils0002', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(10, 20, 110, 120));
        expect(snapshot[0]).assertEqual(10);
        expect(snapshot[2]).assertEqual(110);
        expect(snapshot[4]).assertEqual(100);
        expect(snapshot[5]).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0300
     * @tc.name testGeometryUtils0003
     * @tc.desc Verify the rectangle center computation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0003', 0, async (done: Function) => {
      await runCase('testGeometryUtils0003', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(0, 0, 80, 60));
        expect(snapshot[1]).assertEqual(0);
        expect(snapshot[3]).assertEqual(60);
        expect(snapshot[6]).assertEqual(40);
        expect(snapshot[7]).assertEqual(30);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0400
     * @tc.name testGeometryUtils0004
     * @tc.desc Verify the point containment query on a rectangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0004', 0, async (done: Function) => {
      await runCase('testGeometryUtils0004', async () => {
        const rect: common2D.Rect = baseRect();
        expect(rectContainsPoint(rect, 50, 50)).assertTrue();
        expect(rectContainsPoint(rect, 0, 0)).assertTrue();
        expect(rectContainsPoint(rect, 150, 50)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0500
     * @tc.name testGeometryUtils0005
     * @tc.desc Verify the rectangle containment query.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0005', 0, async (done: Function) => {
      await runCase('testGeometryUtils0005', async () => {
        const outer: common2D.Rect = baseRect();
        expect(rectContainsRect(outer, makeRect(10, 10, 90, 90))).assertTrue();
        expect(rectContainsRect(outer, makeRect(10, 10, 110, 90))).assertFalse();
        expect(rectContainsRect(outer, outer)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0600
     * @tc.name testGeometryUtils0006
     * @tc.desc Verify the edge based rectangle containment query.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0006', 0, async (done: Function) => {
      await runCase('testGeometryUtils0006', async () => {
        const outer: common2D.Rect = baseRect();
        expect(rectContainsLtrb(outer, makeRect(10, 10, 90, 90))).assertTrue();
        expect(rectContainsLtrb(outer, makeRect(-10, 10, 90, 90))).assertFalse();
        expect(rectContainsLtrb(outer, emptyRect())).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0700
     * @tc.name testGeometryUtils0007
     * @tc.desc Verify the intersection of two overlapping rectangles.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0007', 0, async (done: Function) => {
      await runCase('testGeometryUtils0007', async () => {
        const result: common2D.Rect = rectIntersect(baseRect(), makeRect(50, 50, 150, 150));
        expect(result.left).assertEqual(50);
        expect(result.top).assertEqual(50);
        expect(result.right).assertEqual(100);
        expect(result.bottom).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0800
     * @tc.name testGeometryUtils0008
     * @tc.desc Verify the intersection query result for both cases.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0008', 0, async (done: Function) => {
      await runCase('testGeometryUtils0008', async () => {
        expect(rectIsIntersect(baseRect(), makeRect(50, 50, 150, 150))).assertTrue();
        expect(rectIsIntersect(baseRect(), makeRect(200, 200, 300, 300))).assertFalse();
        expect(rectIsIntersect(baseRect(), makeRect(101, 0, 200, 100))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_0900
     * @tc.name testGeometryUtils0009
     * @tc.desc Verify the union of two disjoint rectangles.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0009', 0, async (done: Function) => {
      await runCase('testGeometryUtils0009', async () => {
        const result: common2D.Rect = rectUnion(makeRect(0, 0, 50, 50), makeRect(60, 60, 100, 100));
        expect(result.left).assertEqual(0);
        expect(result.top).assertEqual(0);
        expect(result.right).assertEqual(100);
        expect(result.bottom).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1000
     * @tc.name testGeometryUtils0010
     * @tc.desc Verify the inset applied on every rectangle edge.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0010', 0, async (done: Function) => {
      await runCase('testGeometryUtils0010', async () => {
        const result: common2D.Rect = rectInset(baseRect(), 5);
        expect(result.left).assertEqual(5);
        expect(result.top).assertEqual(5);
        expect(result.right).assertEqual(95);
        expect(result.bottom).assertEqual(95);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1100
     * @tc.name testGeometryUtils0011
     * @tc.desc Verify the rectangle offset keeps its size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0011', 0, async (done: Function) => {
      await runCase('testGeometryUtils0011', async () => {
        const result: common2D.Rect = rectOffset(baseRect(), 10, 20);
        expect(result.left).assertEqual(10);
        expect(result.top).assertEqual(20);
        expect(result.right).assertEqual(110);
        expect(result.bottom).assertEqual(120);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1200
     * @tc.name testGeometryUtils0012
     * @tc.desc Verify moving the rectangle origin.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0012', 0, async (done: Function) => {
      await runCase('testGeometryUtils0012', async () => {
        const result: common2D.Rect = rectOffsetTo(makeRect(10, 10, 60, 60), 0, 0);
        expect(result.left).assertEqual(0);
        expect(result.top).assertEqual(0);
        expect(result.right).assertEqual(50);
        expect(result.bottom).assertEqual(50);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1300
     * @tc.name testGeometryUtils0013
     * @tc.desc Verify the rectangle edges are sorted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0013', 0, async (done: Function) => {
      await runCase('testGeometryUtils0013', async () => {
        const result: common2D.Rect = rectSort(makeRect(100, 100, 20, 40));
        expect(result.left).assertEqual(20);
        expect(result.top).assertEqual(40);
        expect(result.right).assertEqual(100);
        expect(result.bottom).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1400
     * @tc.name testGeometryUtils0014
     * @tc.desc Verify the empty and equality queries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0014', 0, async (done: Function) => {
      await runCase('testGeometryUtils0014', async () => {
        expect(rectIsEmpty(emptyRect())).assertTrue();
        expect(rectIsEmpty(baseRect())).assertFalse();
        expect(rectIsEqual(baseRect(), makeRect(0, 0, 100, 100))).assertTrue();
        expect(rectIsEqual(baseRect(), makeRect(0, 0, 100, 120))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1500
     * @tc.name testGeometryUtils0015
     * @tc.desc Verify the rectangle copy and the setRect overwrite.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0015', 0, async (done: Function) => {
      await runCase('testGeometryUtils0015', async () => {
        const copy: common2D.Rect = rectCopy(baseRect());
        const resized: common2D.Rect = rectSetRect(copy, makeRect(10, 10, 20, 20));
        expect(rectIsEqual(copy, baseRect())).assertTrue();
        expect(resized.left).assertEqual(10);
        expect(resized.right).assertEqual(20);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1600
     * @tc.name testGeometryUtils0016
     * @tc.desc Verify the explicit edge overwrite and the empty overwrite.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0016', 0, async (done: Function) => {
      await runCase('testGeometryUtils0016', async () => {
        const moved: common2D.Rect = rectSetLtrb(baseRect(), 5, 5, 25, 25);
        const cleared: common2D.Rect = rectSetEmpty(baseRect());
        expect(moved.left).assertEqual(5);
        expect(moved.right).assertEqual(25);
        expect(rectIsEmpty(cleared)).assertTrue();
        expect(rectIsEqual(cleared, emptyRect())).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1700
     * @tc.name testGeometryUtils0017
     * @tc.desc Verify the region built from four edges.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0017', 0, async (done: Function) => {
      await runCase('testGeometryUtils0017', async () => {
        const region: drawing.Region = regionFromRect(10, 20, 110, 120);
        const snapshot: number[] = regionSnapshot(region);
        expect(snapshot[0]).assertEqual(10);
        expect(snapshot[1]).assertEqual(20);
        expect(snapshot[2]).assertEqual(110);
        expect(snapshot[3]).assertEqual(120);
        expect(regionIsRect(region)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1800
     * @tc.name testGeometryUtils0018
     * @tc.desc Verify the region built with setRect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0018', 0, async (done: Function) => {
      await runCase('testGeometryUtils0018', async () => {
        const region: drawing.Region = regionFromSetRect(makeRect(0, 0, 50, 50));
        const snapshot: number[] = regionSnapshot(region);
        expect(snapshot[0]).assertEqual(0);
        expect(snapshot[2]).assertEqual(50);
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_1900
     * @tc.name testGeometryUtils0019
     * @tc.desc Verify the point containment query on a region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0019', 0, async (done: Function) => {
      await runCase('testGeometryUtils0019', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 100, 100);
        expect(regionContainsPoint(region, 50, 50)).assertTrue();
        expect(regionContainsPoint(region, 10, 10)).assertTrue();
        expect(regionContainsPoint(region, 150, 150)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2000
     * @tc.name testGeometryUtils0020
     * @tc.desc Verify the region containment query.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0020', 0, async (done: Function) => {
      await runCase('testGeometryUtils0020', async () => {
        const outer: drawing.Region = regionFromRect(0, 0, 100, 100);
        expect(regionContainsRegion(outer, regionFromRect(10, 10, 90, 90))).assertTrue();
        expect(regionContainsRegion(outer, regionFromRect(10, 10, 110, 90))).assertFalse();
        expect(regionContainsRegion(outer, outer)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2100
     * @tc.name testGeometryUtils0021
     * @tc.desc Verify the union operation between two regions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0021', 0, async (done: Function) => {
      await runCase('testGeometryUtils0021', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 50, 50);
        const changed: boolean = regionOp(region, regionFromRect(50, 50, 100, 100), drawing.RegionOp.UNION);
        const snapshot: number[] = regionSnapshot(region);
        expect(changed).assertTrue();
        expect(snapshot[0]).assertEqual(0);
        expect(snapshot[2]).assertEqual(100);
        expect(snapshot[3]).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2200
     * @tc.name testGeometryUtils0022
     * @tc.desc Verify the intersect operation between two regions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0022', 0, async (done: Function) => {
      await runCase('testGeometryUtils0022', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 100, 100);
        const changed: boolean = regionOp(region, regionFromRect(50, 50, 150, 150), drawing.RegionOp.INTERSECT);
        const snapshot: number[] = regionSnapshot(region);
        expect(changed).assertTrue();
        expect(snapshot[0]).assertEqual(50);
        expect(snapshot[2]).assertEqual(100);
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2300
     * @tc.name testGeometryUtils0023
     * @tc.desc Verify the difference operation between two regions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0023', 0, async (done: Function) => {
      await runCase('testGeometryUtils0023', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 100, 100);
        regionOp(region, regionFromRect(50, 0, 100, 100), drawing.RegionOp.DIFFERENCE);
        const snapshot: number[] = regionSnapshot(region);
        expect(snapshot[0]).assertEqual(0);
        expect(snapshot[2]).assertEqual(50);
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2400
     * @tc.name testGeometryUtils0024
     * @tc.desc Verify the quick reject query with rectangles.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0024', 0, async (done: Function) => {
      await runCase('testGeometryUtils0024', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 100, 100);
        expect(regionQuickReject(region, makeRect(200, 200, 300, 300))).assertTrue();
        expect(regionQuickReject(region, makeRect(10, 10, 20, 20))).assertFalse();
        expect(regionQuickReject(region, makeRect(120, 120, 130, 130))).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2500
     * @tc.name testGeometryUtils0025
     * @tc.desc Verify the quick reject query with regions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0025', 0, async (done: Function) => {
      await runCase('testGeometryUtils0025', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 100, 100);
        expect(regionQuickRejectRegion(region, regionFromRect(300, 300, 400, 400))).assertTrue();
        expect(regionQuickRejectRegion(region, regionFromRect(10, 10, 20, 20))).assertFalse();
        expect(regionQuickRejectRegion(region, regionFromRect(150, 150, 200, 200))).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2600
     * @tc.name testGeometryUtils0026
     * @tc.desc Verify the quick contains query with rectangles.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0026', 0, async (done: Function) => {
      await runCase('testGeometryUtils0026', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 100, 100);
        expect(regionQuickContains(region, makeRect(10, 10, 90, 90))).assertTrue();
        expect(regionQuickContains(region, makeRect(10, 10, 110, 90))).assertFalse();
        expect(regionQuickContains(region, makeRect(-10, -10, 10, 10))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2700
     * @tc.name testGeometryUtils0027
     * @tc.desc Verify the boundary path of a rectangle region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0027', 0, async (done: Function) => {
      await runCase('testGeometryUtils0027', async () => {
        const path: drawing.Path = regionBoundaryPath(regionFromRect(10, 20, 110, 120));
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(10);
        expect(bounds.top).assertEqual(20);
        expect(bounds.right).assertEqual(110);
        expect(bounds.bottom).assertEqual(120);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2800
     * @tc.name testGeometryUtils0028
     * @tc.desc Verify a region can be built from a rectangle path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0028', 0, async (done: Function) => {
      await runCase('testGeometryUtils0028', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 60, 60));
        const region: drawing.Region = regionFromPath(path);
        const snapshot: number[] = regionSnapshot(region);
        expect(regionIsEmpty(region)).assertFalse();
        expect(snapshot[0]).assertEqual(10);
        expect(snapshot[2]).assertEqual(60);
        expect(regionIsRect(region)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_2900
     * @tc.name testGeometryUtils0029
     * @tc.desc Verify an empty path produces an empty region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0029', 0, async (done: Function) => {
      await runCase('testGeometryUtils0029', async () => {
        const region: drawing.Region = regionFromPath(new drawing.Path());
        const snapshot: number[] = regionSnapshot(region);
        expect(regionIsEmpty(region)).assertTrue();
        expect(snapshot[2]).assertEqual(0);
        expect(snapshot[3]).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_3000
     * @tc.name testGeometryUtils0030
     * @tc.desc Verify the rectangle and complexity queries on regions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0030', 0, async (done: Function) => {
      await runCase('testGeometryUtils0030', async () => {
        const simple: drawing.Region = regionFromRect(0, 0, 100, 100);
        expect(regionIsRect(simple)).assertTrue();
        expect(regionIsComplex(simple)).assertFalse();
        const complex: drawing.Region = regionFromRect(0, 0, 10, 10);
        regionOp(complex, regionFromRect(50, 50, 60, 60), drawing.RegionOp.UNION);
        expect(regionIsComplex(complex)).assertTrue();
        expect(regionIsRect(complex)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_3100
     * @tc.name testGeometryUtils0031
     * @tc.desc Verify the region copy, offset and equality queries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0031', 0, async (done: Function) => {
      await runCase('testGeometryUtils0031', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 50, 50);
        const copy: drawing.Region = regionCopy(region);
        expect(regionIsEqual(copy, region)).assertTrue();
        const shifted: drawing.Region = regionOffset(region, 10, 20);
        const snapshot: number[] = regionSnapshot(shifted);
        expect(snapshot[0]).assertEqual(10);
        expect(snapshot[1]).assertEqual(20);
        expect(regionIsEqual(shifted, region)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_3200
     * @tc.name testGeometryUtils0032
     * @tc.desc Verify the empty overwrite of a region keeps the source intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0032', 0, async (done: Function) => {
      await runCase('testGeometryUtils0032', async () => {
        const region: drawing.Region = regionFromRect(0, 0, 50, 50);
        const emptied: drawing.Region = regionSetEmpty(region);
        expect(regionIsEmpty(emptied)).assertTrue();
        expect(regionIsEmpty(region)).assertFalse();
        expect(regionSnapshot(emptied)[2]).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_3300
     * @tc.name testGeometryUtils0033
     * @tc.desc Verify the corner radii of rounded rectangles.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGeometryUtils0033', 0, async (done: Function) => {
      await runCase('testGeometryUtils0033', async () => {
        const corners: number[] = roundRectCorners();
        expect(corners.length).assertEqual(8);
        expect(corners[0]).assertEqual(4);
        expect(corners[2]).assertEqual(6);
        expect(corners[4]).assertEqual(10);
        expect(corners[6]).assertEqual(12);
        const shifted: number[] = roundRectSnapshot(10, 20);
        expect(shifted.length).assertEqual(8);
        expect(shifted[0]).assertEqual(10);
        expect(shifted[7]).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_GEOMETRY_UTILS_3400
     * @tc.name testGeometryUtils0034
     * @tc.desc Verify the point helpers, sampling options and color conversion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGeometryUtils0034', 0, async (done: Function) => {
      await runCase('testGeometryUtils0034', async () => {
        const negated: number[] = negatePoint(point(3, -4));
        expect(negated[0]).assertEqual(-3);
        expect(negated[1]).assertEqual(4);
        const moved: number[] = offsetPoint(point(1, 2), 5, -3);
        expect(moved[0]).assertEqual(6);
        expect(moved[1]).assertEqual(-1);
        const sampling: drawing.SamplingOptions = samplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(typeof sampling).assertEqual('object');
        expect(typeof defaultSamplingOptions()).assertEqual('object');
        const color: common2D.Color = colorFromResource();
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(0x33);
      }, done);
    });
  });
}
