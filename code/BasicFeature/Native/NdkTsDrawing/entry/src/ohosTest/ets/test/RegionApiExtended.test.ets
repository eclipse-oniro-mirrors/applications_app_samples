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
import {
  regionBoundaryPath,
  regionContainsPoint,
  regionContainsRegion,
  regionCopy,
  regionFromPath,
  regionFromRect,
  regionIsComplex,
  regionIsEmpty,
  regionIsEqual,
  regionIsRect,
  regionOffset,
  regionQuickContains,
  regionQuickRejectRegion,
  regionSetEmpty,
  regionSnapshot
} from '../../../main/ets/drawing/DrawingGeometryUtils';
import { ltrb } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Create a rectangle region with the four edge constructor.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { drawing.Region } Rectangle region.
 */
function rectRegion(left: number, top: number, right: number, bottom: number): drawing.Region {
  return regionFromRect(left, top, right, bottom);
}

/**
 * Read the four bounds of a region.
 *
 * @param { drawing.Region } region - Source region.
 * @returns { number[] } Left, top, right and bottom.
 */
function boundsOf(region: drawing.Region): number[] {
  return regionSnapshot(region);
}

/**
 * Check whether a region reports the four expected bounds.
 *
 * @param { drawing.Region } region - Source region.
 * @param { number[] } wanted - Expected bounds.
 * @returns { boolean } Whether all four edges match.
 */
function hasBounds(region: drawing.Region, wanted: number[]): boolean {
  const actual: number[] = boundsOf(region);
  return actual[0] === wanted[0] && actual[1] === wanted[1] &&
    actual[2] === wanted[2] && actual[3] === wanted[3];
}

/**
 * Create a clip region large enough for every path based case.
 *
 * @returns { drawing.Region } Wide clip region.
 */
function wideClip(): drawing.Region {
  return rectRegion(0, 0, 1000, 1000);
}

export default function regionApiExtendedTest() {
  describe('RegionApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_REGION_0069
     * @tc.name testRegionApi0069
     * @tc.desc Verify a union of three rectangles spans all of them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0069 begin');
      await runCase('testRegionApi0069', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(20, 0, 30, 10), drawing.RegionOp.UNION);
        region.op(rectRegion(0, 20, 10, 30), drawing.RegionOp.UNION);
        expect(regionIsComplex(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 30, 30])).assertTrue();
        expect(regionContainsPoint(region, 25, 5)).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0070
     * @tc.name testRegionApi0070
     * @tc.desc Verify a union followed by an intersection shrinks the bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0070 begin');
      await runCase('testRegionApi0070', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        region.op(rectRegion(50, 50, 150, 150), drawing.RegionOp.UNION);
        region.op(rectRegion(60, 60, 200, 200), drawing.RegionOp.INTERSECT);
        expect(hasBounds(region, [60, 60, 100, 100])).assertFalse();
        expect(regionContainsPoint(region, 80, 80)).assertTrue();
        expect(regionContainsPoint(region, 40, 40)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0071
     * @tc.name testRegionApi0071
     * @tc.desc Verify intersecting and then uniting with a superset keeps the region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0071 begin');
      await runCase('testRegionApi0071', async () => {
        const region: drawing.Region = rectRegion(10, 10, 90, 90);
        region.op(rectRegion(0, 0, 100, 100), drawing.RegionOp.INTERSECT);
        expect(hasBounds(region, [10, 10, 90, 90])).assertTrue();
        region.op(rectRegion(0, 0, 100, 100), drawing.RegionOp.UNION);
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0072
     * @tc.name testRegionApi0072
     * @tc.desc Verify two successive differences carve both sides away.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0072 begin');
      await runCase('testRegionApi0072', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        region.op(rectRegion(0, 0, 30, 100), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [30, 0, 100, 100])).assertTrue();
        region.op(rectRegion(70, 0, 100, 100), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [30, 0, 70, 100])).assertTrue();
        expect(regionContainsPoint(region, 50, 50)).assertTrue();
        expect(regionContainsPoint(region, 80, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0073
     * @tc.name testRegionApi0073
     * @tc.desc Verify two successive xor operations remove the shared part.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0073 begin');
      await runCase('testRegionApi0073', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        region.op(rectRegion(0, 0, 50, 100), drawing.RegionOp.XOR);
        expect(hasBounds(region, [50, 0, 100, 100])).assertTrue();
        region.op(rectRegion(50, 0, 75, 100), drawing.RegionOp.XOR);
        expect(hasBounds(region, [75, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(region, 60, 50)).assertFalse();
        expect(regionContainsPoint(region, 85, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0074
     * @tc.name testRegionApi0074
     * @tc.desc Verify replace followed by a difference follows the new geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0074 begin');
      await runCase('testRegionApi0074', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(0, 0, 100, 100), drawing.RegionOp.REPLACE);
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
        region.op(rectRegion(0, 0, 25, 100), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [25, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(region, 10, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0075
     * @tc.name testRegionApi0075
     * @tc.desc Verify a union with an equal copy changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0075 begin');
      await runCase('testRegionApi0075', async () => {
        const region: drawing.Region = rectRegion(5, 5, 45, 45);
        region.op(new drawing.Region(region), drawing.RegionOp.UNION);
        expect(hasBounds(region, [5, 5, 45, 45])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionContainsPoint(region, 20, 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0076
     * @tc.name testRegionApi0076
     * @tc.desc Verify an intersection with an equal copy changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0076 begin');
      await runCase('testRegionApi0076', async () => {
        const region: drawing.Region = rectRegion(2, 4, 22, 24);
        region.op(new drawing.Region(region), drawing.RegionOp.INTERSECT);
        expect(regionIsEqual(region, rectRegion(2, 4, 22, 24))).assertTrue();
        expect(regionIsEmpty(region)).assertFalse();
        expect(boundsOf(region)[2]).assertEqual(22);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0077
     * @tc.name testRegionApi0077
     * @tc.desc Verify subtracting a region from itself leaves nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0077 begin');
      await runCase('testRegionApi0077', async () => {
        const region: drawing.Region = rectRegion(0, 0, 70, 70);
        region.op(new drawing.Region(region), drawing.RegionOp.DIFFERENCE);
        expect(regionIsEmpty(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(region, 35, 35)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0078
     * @tc.name testRegionApi0078
     * @tc.desc Verify the xor of a region with itself leaves nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0078 begin');
      await runCase('testRegionApi0078', async () => {
        const region: drawing.Region = rectRegion(3, 3, 33, 33);
        region.op(new drawing.Region(region), drawing.RegionOp.XOR);
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsComplex(region)).assertFalse();
        expect(regionIsRect(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0079
     * @tc.name testRegionApi0079
     * @tc.desc Verify a union with an empty region keeps the rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0079 begin');
      await runCase('testRegionApi0079', async () => {
        const region: drawing.Region = rectRegion(10, 20, 30, 40);
        region.op(new drawing.Region(), drawing.RegionOp.UNION);
        expect(hasBounds(region, [10, 20, 30, 40])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionContainsPoint(region, 15, 25)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0080
     * @tc.name testRegionApi0080
     * @tc.desc Verify an intersection with an empty region empties the receiver.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0080 begin');
      await runCase('testRegionApi0080', async () => {
        const region: drawing.Region = rectRegion(10, 20, 30, 40);
        region.op(new drawing.Region(), drawing.RegionOp.INTERSECT);
        expect(regionIsEmpty(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(region, 15, 25)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0081
     * @tc.name testRegionApi0081
     * @tc.desc Verify a difference with an empty region keeps the rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0081 begin');
      await runCase('testRegionApi0081', async () => {
        const region: drawing.Region = rectRegion(40, 40, 80, 80);
        region.op(new drawing.Region(), drawing.RegionOp.DIFFERENCE);
        expect(regionIsEqual(region, rectRegion(40, 40, 80, 80))).assertTrue();
        expect(regionIsEmpty(region)).assertFalse();
        expect(boundsOf(region)[0]).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0082
     * @tc.name testRegionApi0082
     * @tc.desc Verify an xor with an empty region keeps the rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0082 begin');
      await runCase('testRegionApi0082', async () => {
        const region: drawing.Region = rectRegion(1, 2, 31, 32);
        region.op(new drawing.Region(), drawing.RegionOp.XOR);
        expect(hasBounds(region, [1, 2, 31, 32])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0083
     * @tc.name testRegionApi0083
     * @tc.desc Verify two vertically adjacent rectangles merge into one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0083 begin');
      await runCase('testRegionApi0083', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 50);
        region.op(rectRegion(0, 50, 100, 100), drawing.RegionOp.UNION);
        expect(regionIsRect(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(region, 50, 75)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0084
     * @tc.name testRegionApi0084
     * @tc.desc Verify two rectangles meeting at one corner stay complex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0084 begin');
      await runCase('testRegionApi0084', async () => {
        const region: drawing.Region = rectRegion(0, 0, 50, 50);
        region.op(rectRegion(50, 50, 100, 100), drawing.RegionOp.UNION);
        expect(regionIsComplex(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(region, 75, 25)).assertFalse();
        expect(regionContainsPoint(region, 75, 75)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0085
     * @tc.name testRegionApi0085
     * @tc.desc Verify removing a middle column splits the region in two.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0085 begin');
      await runCase('testRegionApi0085', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        region.op(rectRegion(40, 0, 60, 100), drawing.RegionOp.DIFFERENCE);
        expect(regionIsComplex(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(region, 50, 50)).assertFalse();
        expect(regionContainsPoint(region, 20, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0086
     * @tc.name testRegionApi0086
     * @tc.desc Verify intersecting a large region with a small one yields the small one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0086 begin');
      await runCase('testRegionApi0086', async () => {
        const region: drawing.Region = rectRegion(0, 0, 200, 200);
        region.op(rectRegion(10, 10, 20, 20), drawing.RegionOp.INTERSECT);
        expect(regionIsEqual(region, rectRegion(10, 10, 20, 20))).assertTrue();
        expect(hasBounds(region, [10, 10, 20, 20])).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0087
     * @tc.name testRegionApi0087
     * @tc.desc Verify the reverse difference of equal regions is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0087 begin');
      await runCase('testRegionApi0087', async () => {
        const region: drawing.Region = rectRegion(20, 20, 60, 60);
        region.op(new drawing.Region(region), drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(boundsOf(region)[2]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0088
     * @tc.name testRegionApi0088
     * @tc.desc Verify a four step operation chain lands on the last geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRegionApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0088 begin');
      await runCase('testRegionApi0088', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(20, 20, 30, 30), drawing.RegionOp.UNION);
        region.op(rectRegion(0, 0, 30, 30), drawing.RegionOp.INTERSECT);
        expect(hasBounds(region, [0, 0, 30, 30])).assertTrue();
        region.op(rectRegion(0, 0, 10, 10), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [20, 20, 30, 30])).assertTrue();
        expect(regionContainsPoint(region, 25, 25)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0089
     * @tc.name testRegionApi0089
     * @tc.desc Verify setEmpty after an operation clears the merged region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0089 begin');
      await runCase('testRegionApi0089', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(20, 0, 30, 10), drawing.RegionOp.UNION);
        expect(regionIsEmpty(region)).assertFalse();
        region.setEmpty();
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsComplex(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0090
     * @tc.name testRegionApi0090
     * @tc.desc Verify operations work on regions placed in the negative quadrant.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0090 begin');
      await runCase('testRegionApi0090', async () => {
        const region: drawing.Region = rectRegion(-50, -50, -10, -10);
        region.op(rectRegion(-10, -10, 10, 10), drawing.RegionOp.UNION);
        expect(hasBounds(region, [-50, -50, 10, 10])).assertTrue();
        expect(regionIsComplex(region)).assertTrue();
        expect(regionContainsPoint(region, -5, -5)).assertTrue();
        expect(regionContainsPoint(region, -30, -30)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0091
     * @tc.name testRegionApi0091
     * @tc.desc Verify the bounds of three scattered rectangles cover the extreme edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0091 begin');
      await runCase('testRegionApi0091', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(50, 0, 60, 10), drawing.RegionOp.UNION);
        region.op(rectRegion(0, 50, 10, 60), drawing.RegionOp.UNION);
        expect(hasBounds(region, [0, 0, 60, 60])).assertTrue();
        expect(regionIsComplex(region)).assertTrue();
        expect(regionContainsPoint(region, 55, 5)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0092
     * @tc.name testRegionApi0092
     * @tc.desc Verify offsetting a complex region moves every part.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0092 begin');
      await runCase('testRegionApi0092', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(40, 0, 50, 10), drawing.RegionOp.UNION);
        const moved: drawing.Region = regionOffset(region, 5, 5);
        expect(hasBounds(moved, [5, 5, 55, 15])).assertTrue();
        expect(regionIsComplex(moved)).assertTrue();
        expect(regionContainsPoint(moved, 45, 10)).assertTrue();
        expect(regionContainsPoint(moved, 30, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0093
     * @tc.name testRegionApi0093
     * @tc.desc Verify a one pixel gap keeps the union complex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0093 begin');
      await runCase('testRegionApi0093', async () => {
        const region: drawing.Region = rectRegion(0, 0, 50, 100);
        region.op(rectRegion(51, 0, 100, 100), drawing.RegionOp.UNION);
        expect(regionIsRect(region)).assertFalse();
        expect(regionIsComplex(region)).assertTrue();
        expect(regionContainsPoint(region, 50, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0094
     * @tc.name testRegionApi0094
     * @tc.desc Verify a merged rectangle stays simple after a self union.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0094 begin');
      await runCase('testRegionApi0094', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(new drawing.Region(region), drawing.RegionOp.UNION);
        expect(regionIsComplex(region)).assertFalse();
        expect(regionIsEmpty(region)).assertFalse();
        expect(regionIsRect(region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0095
     * @tc.name testRegionApi0095
     * @tc.desc Verify a complex region is neither empty nor a rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0095 begin');
      await runCase('testRegionApi0095', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(30, 30, 40, 40), drawing.RegionOp.UNION);
        expect(regionIsEmpty(region)).assertFalse();
        expect(regionIsRect(region)).assertFalse();
        expect(hasBounds(region, [0, 0, 40, 40])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0096
     * @tc.name testRegionApi0096
     * @tc.desc Verify the gap between two rectangles holds no point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0096 begin');
      await runCase('testRegionApi0096', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(20, 0, 30, 10), drawing.RegionOp.UNION);
        expect(regionContainsPoint(region, 15, 5)).assertFalse();
        expect(regionContainsPoint(region, 5, 5)).assertTrue();
        expect(regionContainsPoint(region, 25, 5)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0097
     * @tc.name testRegionApi0097
     * @tc.desc Verify the shared edge of two merged rectangles is interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0097 begin');
      await runCase('testRegionApi0097', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(10, 0, 20, 10), drawing.RegionOp.UNION);
        expect(regionIsRect(region)).assertTrue();
        expect(regionContainsPoint(region, 10, 5)).assertTrue();
        expect(hasBounds(region, [0, 0, 20, 10])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0098
     * @tc.name testRegionApi0098
     * @tc.desc Verify three construction routes produce equal regions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0098 begin');
      await runCase('testRegionApi0098', async () => {
        const viaCtor: drawing.Region = rectRegion(0, 0, 10, 10);
        const viaSetter: drawing.Region = new drawing.Region();
        viaSetter.setRect(0, 0, 10, 10);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 10, 10));
        const viaPath: drawing.Region = regionFromPath(path);
        expect(regionIsEqual(viaCtor, viaSetter)).assertTrue();
        expect(regionIsEqual(viaCtor, viaPath)).assertTrue();
        expect(regionIsEqual(viaSetter, viaPath)).assertTrue();
        expect(regionIsEmpty(viaPath)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0099
     * @tc.name testRegionApi0099
     * @tc.desc Verify a copied complex region keeps both parts.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0099 begin');
      await runCase('testRegionApi0099', async () => {
        const source: drawing.Region = rectRegion(0, 0, 10, 10);
        source.op(rectRegion(20, 20, 30, 30), drawing.RegionOp.UNION);
        const copy: drawing.Region = new drawing.Region(source);
        expect(regionIsEqual(source, copy)).assertTrue();
        expect(hasBounds(copy, [0, 0, 30, 30])).assertTrue();
        expect(regionContainsPoint(copy, 25, 25)).assertTrue();
        expect(regionIsComplex(copy)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0100
     * @tc.name testRegionApi0100
     * @tc.desc Verify a complex region keeps its shape after being offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0100 begin');
      await runCase('testRegionApi0100', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(20, 0, 30, 10), drawing.RegionOp.UNION);
        region.offset(100, 0);
        expect(hasBounds(region, [100, 0, 130, 10])).assertTrue();
        expect(regionIsComplex(region)).assertTrue();
        expect(regionContainsPoint(region, 125, 5)).assertTrue();
        expect(regionContainsPoint(region, 115, 5)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0101
     * @tc.name testRegionApi0101
     * @tc.desc Verify setRegion copies a complex region in full.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0101 begin');
      await runCase('testRegionApi0101', async () => {
        const source: drawing.Region = rectRegion(0, 0, 10, 10);
        source.op(rectRegion(40, 40, 50, 50), drawing.RegionOp.UNION);
        const target: drawing.Region = new drawing.Region();
        target.setRegion(source);
        expect(regionIsEqual(source, target)).assertTrue();
        expect(regionIsComplex(target)).assertTrue();
        expect(hasBounds(target, [0, 0, 50, 50])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0102
     * @tc.name testRegionApi0102
     * @tc.desc Verify an intersection with a far away region empties the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0102 begin');
      await runCase('testRegionApi0102', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(500, 500, 600, 600), drawing.RegionOp.INTERSECT);
        expect(regionIsEmpty(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
        expect(regionIsComplex(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0103
     * @tc.name testRegionApi0103
     * @tc.desc Verify a clip smaller than the path bounds trims the region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0103 begin');
      await runCase('testRegionApi0103', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 100, 100));
        const region: drawing.Region = new drawing.Region();
        const ok: boolean = region.setPath(path, rectRegion(20, 20, 60, 120));
        expect(ok).assertTrue();
        expect(hasBounds(region, [20, 20, 60, 100])).assertTrue();
        expect(regionContainsPoint(region, 40, 40)).assertTrue();
        expect(regionContainsPoint(region, 10, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0104
     * @tc.name testRegionApi0104
     * @tc.desc Verify a clip away from the path leaves an empty region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0104 begin');
      await runCase('testRegionApi0104', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 40, 40));
        const region: drawing.Region = new drawing.Region();
        region.setPath(path, rectRegion(100, 100, 200, 200));
        expect(regionIsEmpty(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(region, 10, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0105
     * @tc.name testRegionApi0105
     * @tc.desc Verify the boundary path of a complex region rebuilds the same region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0105 begin');
      await runCase('testRegionApi0105', async () => {
        const region: drawing.Region = rectRegion(0, 0, 20, 20);
        region.op(rectRegion(60, 60, 80, 80), drawing.RegionOp.UNION);
        const outline: drawing.Path = regionBoundaryPath(region);
        const bounds: common2D.Rect = outline.getBounds();
        expect(bounds.left).assertEqual(0);
        expect(bounds.right).assertEqual(80);
        expect(regionIsEqual(regionFromPath(outline), region)).assertTrue();
        expect(regionContainsPoint(region, 40, 40)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0106
     * @tc.name testRegionApi0106
     * @tc.desc Verify the boundary path of a circle region matches the circle bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0106 begin');
      await runCase('testRegionApi0106', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(60, 60, 25);
        const region: drawing.Region = regionFromPath(path);
        const outline: drawing.Path = regionBoundaryPath(region);
        const bounds: common2D.Rect = outline.getBounds();
        expect(bounds.left).assertEqual(35);
        expect(bounds.top).assertEqual(35);
        expect(regionIsRect(region)).assertFalse();
        expect(hasBounds(region, [35, 35, 85, 85])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0107
     * @tc.name testRegionApi0107
     * @tc.desc Verify quickContains accepts a rectangle inside a merged single rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0107 begin');
      await runCase('testRegionApi0107', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 50);
        region.op(rectRegion(100, 0, 200, 50), drawing.RegionOp.UNION);
        expect(regionIsRect(region)).assertTrue();
        expect(regionQuickContains(region, ltrb(10, 10, 190, 40))).assertTrue();
        expect(regionQuickContains(region, ltrb(0, 0, 200, 50))).assertTrue();
        expect(regionQuickContains(region, ltrb(0, 0, 201, 50))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0108
     * @tc.name testRegionApi0108
     * @tc.desc Verify quickContains follows the region after an offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0108 begin');
      await runCase('testRegionApi0108', async () => {
        const region: drawing.Region = rectRegion(0, 0, 50, 50);
        region.offset(20, 20);
        expect(regionQuickContains(region, ltrb(20, 20, 70, 70))).assertTrue();
        expect(regionQuickContains(region, ltrb(21, 21, 69, 69))).assertTrue();
        expect(regionQuickContains(region, ltrb(0, 0, 50, 50))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0109
     * @tc.name testRegionApi0109
     * @tc.desc Verify a clip equal to the path bounds keeps the whole path region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0109 begin');
      await runCase('testRegionApi0109', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 70, 70));
        const region: drawing.Region = new drawing.Region();
        region.setPath(path, rectRegion(10, 10, 70, 70));
        expect(hasBounds(region, [10, 10, 70, 70])).assertTrue();
        expect(regionIsEqual(region, rectRegion(10, 10, 70, 70))).assertTrue();
        expect(regionContainsPoint(region, 69, 69)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0110
     * @tc.name testRegionApi0110
     * @tc.desc Verify setPath replaces a region previously built with setRect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0110 begin');
      await runCase('testRegionApi0110', async () => {
        const region: drawing.Region = rectRegion(0, 0, 200, 200);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(100, 100, 140, 140));
        region.setPath(path, wideClip());
        expect(hasBounds(region, [100, 100, 140, 140])).assertTrue();
        expect(regionContainsPoint(region, 50, 50)).assertFalse();
        expect(regionIsRect(region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0111
     * @tc.name testRegionApi0111
     * @tc.desc Verify setRect on an offset region resets the geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0111 begin');
      await runCase('testRegionApi0111', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.offset(50, 50);
        region.setRect(0, 0, 20, 20);
        expect(hasBounds(region, [0, 0, 20, 20])).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertTrue();
        expect(regionContainsPoint(region, 60, 60)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0112
     * @tc.name testRegionApi0112
     * @tc.desc Verify regionSetEmpty empties the copy and keeps the source complex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0112 begin');
      await runCase('testRegionApi0112', async () => {
        const source: drawing.Region = rectRegion(0, 0, 10, 10);
        source.op(rectRegion(20, 0, 30, 10), drawing.RegionOp.UNION);
        const emptied: drawing.Region = regionSetEmpty(source);
        expect(regionIsEmpty(emptied)).assertTrue();
        expect(regionIsComplex(source)).assertTrue();
        expect(hasBounds(source, [0, 0, 30, 10])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0113
     * @tc.name testRegionApi0113
     * @tc.desc Verify three successive setEmpty calls are idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0113 begin');
      await runCase('testRegionApi0113', async () => {
        const region: drawing.Region = rectRegion(0, 0, 50, 50);
        region.setEmpty();
        region.setEmpty();
        region.setEmpty();
        expect(regionIsEmpty(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(regionIsEqual(region, new drawing.Region())).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0114
     * @tc.name testRegionApi0114
     * @tc.desc Verify setRegion from itself keeps the region unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0114 begin');
      await runCase('testRegionApi0114', async () => {
        const region: drawing.Region = rectRegion(5, 5, 55, 55);
        region.setRegion(region);
        expect(hasBounds(region, [5, 5, 55, 55])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionIsEqual(region, rectRegion(5, 5, 55, 55))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0115
     * @tc.name testRegionApi0115
     * @tc.desc Verify replace with an equal region keeps the shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0115 begin');
      await runCase('testRegionApi0115', async () => {
        const region: drawing.Region = rectRegion(0, 0, 80, 80);
        region.op(new drawing.Region(region), drawing.RegionOp.REPLACE);
        expect(hasBounds(region, [0, 0, 80, 80])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionContainsPoint(region, 40, 40)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0116
     * @tc.name testRegionApi0116
     * @tc.desc Verify a union after an offset joins the old and new positions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0116 begin');
      await runCase('testRegionApi0116', async () => {
        const region: drawing.Region = rectRegion(0, 0, 20, 20);
        region.offset(40, 0);
        region.op(rectRegion(0, 0, 20, 20), drawing.RegionOp.UNION);
        expect(hasBounds(region, [0, 0, 60, 20])).assertTrue();
        expect(regionIsComplex(region)).assertTrue();
        expect(regionContainsPoint(region, 30, 10)).assertFalse();
        expect(regionContainsPoint(region, 50, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0117
     * @tc.name testRegionApi0117
     * @tc.desc Verify a five step operation chain ends on the expected geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRegionApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0117 begin');
      await runCase('testRegionApi0117', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        region.op(rectRegion(10, 10, 90, 90), drawing.RegionOp.INTERSECT);
        region.op(rectRegion(10, 10, 50, 90), drawing.RegionOp.DIFFERENCE);
        region.op(rectRegion(0, 0, 20, 20), drawing.RegionOp.UNION);
        region.op(rectRegion(0, 0, 10, 10), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [10, 0, 90, 90])).assertFalse();
        expect(regionIsComplex(region)).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertTrue();
        expect(regionContainsPoint(region, 5, 5)).assertFalse();
        expect(regionContainsPoint(region, 70, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0118
     * @tc.name testRegionApi0118
     * @tc.desc Verify the same xor applied twice restores the original region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0118 begin');
      await runCase('testRegionApi0118', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        region.op(rectRegion(30, 30, 60, 60), drawing.RegionOp.XOR);
        expect(regionContainsPoint(region, 45, 45)).assertFalse();
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
        region.op(rectRegion(30, 30, 60, 60), drawing.RegionOp.XOR);
        expect(regionContainsPoint(region, 45, 45)).assertTrue();
        expect(regionIsEqual(region, rectRegion(0, 0, 100, 100))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0119
     * @tc.name testRegionApi0119
     * @tc.desc Verify opposite offsets cancel out and restore the bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0119 begin');
      await runCase('testRegionApi0119', async () => {
        const original: drawing.Region = rectRegion(10, 10, 60, 60);
        const region: drawing.Region = new drawing.Region(original);
        region.offset(5, 5);
        expect(hasBounds(region, [15, 15, 65, 65])).assertTrue();
        region.offset(-5, -5);
        expect(hasBounds(region, [10, 10, 60, 60])).assertTrue();
        expect(regionIsEqual(region, original)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0120
     * @tc.name testRegionApi0120
     * @tc.desc Verify modifying a copied region leaves the source untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0120 begin');
      await runCase('testRegionApi0120', async () => {
        const source: drawing.Region = rectRegion(0, 0, 10, 10);
        source.op(rectRegion(20, 0, 30, 10), drawing.RegionOp.UNION);
        const copy: drawing.Region = regionCopy(source);
        copy.offset(100, 0);
        expect(hasBounds(source, [0, 0, 30, 10])).assertTrue();
        expect(hasBounds(copy, [100, 0, 130, 10])).assertTrue();
        expect(regionIsEqual(source, copy)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0121
     * @tc.name testRegionApi0121
     * @tc.desc Verify two copies of one region stay independent of each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0121 begin');
      await runCase('testRegionApi0121', async () => {
        const source: drawing.Region = rectRegion(0, 0, 40, 40);
        const first: drawing.Region = regionCopy(source);
        const second: drawing.Region = regionCopy(source);
        first.setEmpty();
        second.op(rectRegion(60, 60, 100, 100), drawing.RegionOp.UNION);
        expect(regionIsEmpty(first)).assertTrue();
        expect(regionIsComplex(second)).assertTrue();
        expect(hasBounds(source, [0, 0, 40, 40])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0122
     * @tc.name testRegionApi0122
     * @tc.desc Verify a second setPath replaces the first path region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0122 begin');
      await runCase('testRegionApi0122', async () => {
        const region: drawing.Region = new drawing.Region();
        const first: drawing.Path = new drawing.Path();
        first.addRect(ltrb(0, 0, 50, 50));
        region.setPath(first, wideClip());
        expect(hasBounds(region, [0, 0, 50, 50])).assertTrue();
        const second: drawing.Path = new drawing.Path();
        second.addRect(ltrb(100, 100, 150, 150));
        region.setPath(second, wideClip());
        expect(hasBounds(region, [100, 100, 150, 150])).assertTrue();
        expect(regionContainsPoint(region, 25, 25)).assertFalse();
        expect(regionContainsPoint(region, 120, 120)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0123
     * @tc.name testRegionApi0123
     * @tc.desc Verify setEmpty clears a region built from a path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0123 begin');
      await runCase('testRegionApi0123', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 80, 80));
        const region: drawing.Region = regionFromPath(path);
        expect(hasBounds(region, [20, 20, 80, 80])).assertTrue();
        region.setEmpty();
        expect(regionIsEmpty(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(region, 40, 40)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0124
     * @tc.name testRegionApi0124
     * @tc.desc Verify bounds after every step of a four operation chain.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRegionApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0124 begin');
      await runCase('testRegionApi0124', async () => {
        const region: drawing.Region = rectRegion(0, 0, 40, 40);
        region.op(rectRegion(10, 10, 50, 50), drawing.RegionOp.INTERSECT);
        expect(hasBounds(region, [10, 10, 40, 40])).assertTrue();
        region.op(rectRegion(0, 0, 20, 20), drawing.RegionOp.UNION);
        expect(hasBounds(region, [0, 0, 40, 40])).assertTrue();
        region.op(rectRegion(30, 30, 40, 40), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [0, 0, 40, 40])).assertTrue();
        region.op(rectRegion(0, 0, 10, 40), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [10, 0, 40, 40])).assertTrue();
        expect(regionContainsPoint(region, 35, 20)).assertTrue();
        expect(regionContainsPoint(region, 5, 5)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0125
     * @tc.name testRegionApi0125
     * @tc.desc Verify a hole punched by difference is filled back by union.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0125 begin');
      await runCase('testRegionApi0125', async () => {
        const hole: drawing.Region = rectRegion(40, 40, 60, 60);
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        region.op(hole, drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(region, 50, 50)).assertFalse();
        region.op(rectRegion(40, 40, 60, 60), drawing.RegionOp.UNION);
        expect(regionContainsPoint(region, 50, 50)).assertTrue();
        expect(regionIsEqual(region, rectRegion(0, 0, 100, 100))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0126
     * @tc.name testRegionApi0126
     * @tc.desc Verify three nested intersections leave one rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0126 begin');
      await runCase('testRegionApi0126', async () => {
        const region: drawing.Region = rectRegion(0, 0, 80, 80);
        region.op(rectRegion(20, 20, 100, 100), drawing.RegionOp.INTERSECT);
        region.op(rectRegion(30, 30, 90, 90), drawing.RegionOp.INTERSECT);
        expect(hasBounds(region, [30, 30, 80, 80])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionContainsPoint(region, 50, 50)).assertTrue();
        expect(regionContainsPoint(region, 85, 85)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0127
     * @tc.name testRegionApi0127
     * @tc.desc Verify three offsets accumulate into the final position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0127 begin');
      await runCase('testRegionApi0127', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.offset(10, 0);
        region.offset(0, 10);
        region.offset(5, 5);
        expect(hasBounds(region, [15, 15, 25, 25])).assertTrue();
        expect(regionContainsPoint(region, 20, 20)).assertTrue();
        expect(regionContainsPoint(region, 5, 5)).assertFalse();
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0128
     * @tc.name testRegionApi0128
     * @tc.desc Verify the bounds of a complex region are stable and cover it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0128 begin');
      await runCase('testRegionApi0128', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(20, 20, 30, 30), drawing.RegionOp.UNION);
        const first: number[] = boundsOf(region);
        const second: number[] = boundsOf(region);
        expect(first[2]).assertEqual(second[2]);
        expect(first[3]).assertEqual(second[3]);
        const rebuilt: drawing.Region = rectRegion(first[0], first[1], first[2], first[3]);
        expect(regionIsRect(rebuilt)).assertTrue();
        expect(regionContainsRegion(rebuilt, region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0129
     * @tc.name testRegionApi0129
     * @tc.desc Verify large coordinates are kept without loss.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0129 begin');
      await runCase('testRegionApi0129', async () => {
        const region: drawing.Region = rectRegion(100000, 200000, 100500, 200400);
        expect(hasBounds(region, [100000, 200000, 100500, 200400])).assertTrue();
        expect(regionContainsPoint(region, 100250, 200200)).assertTrue();
        expect(regionContainsPoint(region, 99999, 200200)).assertFalse();
        expect(regionIsRect(region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0130
     * @tc.name testRegionApi0130
     * @tc.desc Verify a one pixel region contains only its own pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0130 begin');
      await runCase('testRegionApi0130', async () => {
        const region: drawing.Region = rectRegion(5, 5, 6, 6);
        expect(hasBounds(region, [5, 5, 6, 6])).assertTrue();
        expect(regionContainsPoint(region, 5, 5)).assertTrue();
        expect(regionContainsPoint(region, 6, 6)).assertFalse();
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0131
     * @tc.name testRegionApi0131
     * @tc.desc Verify a region crossing the origin keeps both edge exclusions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0131 begin');
      await runCase('testRegionApi0131', async () => {
        const region: drawing.Region = rectRegion(-50, -50, 50, 50);
        expect(hasBounds(region, [-50, -50, 50, 50])).assertTrue();
        expect(regionContainsPoint(region, 0, 0)).assertTrue();
        expect(regionContainsPoint(region, -51, 0)).assertFalse();
        expect(regionContainsPoint(region, 50, 0)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0132
     * @tc.name testRegionApi0132
     * @tc.desc Verify two single pixel rectangles joined at the seam turn into one rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0132 begin');
      await runCase('testRegionApi0132', async () => {
        const region: drawing.Region = rectRegion(0, 0, 1, 1);
        region.op(rectRegion(1, 0, 2, 1), drawing.RegionOp.UNION);
        expect(hasBounds(region, [0, 0, 2, 1])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionContainsPoint(region, 1, 0)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0133
     * @tc.name testRegionApi0133
     * @tc.desc Verify a union of far apart extremes rejects unrelated bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRegionApi0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0133 begin');
      await runCase('testRegionApi0133', async () => {
        const region: drawing.Region = rectRegion(-1000, -1000, -900, -900);
        region.op(rectRegion(900, 900, 1000, 1000), drawing.RegionOp.UNION);
        expect(hasBounds(region, [-1000, -1000, 1000, 1000])).assertTrue();
        expect(regionIsComplex(region)).assertTrue();
        expect(regionQuickRejectRegion(region, rectRegion(2000, 2000, 2100, 2100))).assertTrue();
        expect(regionQuickRejectRegion(region, rectRegion(0, 0, 10, 10))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0134
     * @tc.name testRegionApi0134
     * @tc.desc Verify an offset across the origin produces negative bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0134 begin');
      await runCase('testRegionApi0134', async () => {
        const region: drawing.Region = rectRegion(10, 10, 20, 20);
        region.offset(-100, -100);
        expect(hasBounds(region, [-90, -90, -80, -80])).assertTrue();
        expect(regionContainsPoint(region, -85, -85)).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertFalse();
        expect(regionIsRect(region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0135
     * @tc.name testRegionApi0135
     * @tc.desc Verify setRect with inverted edges collapses a complex region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0135 begin');
      await runCase('testRegionApi0135', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(20, 0, 30, 10), drawing.RegionOp.UNION);
        region.setRect(50, 50, 10, 10);
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsComplex(region)).assertFalse();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0136
     * @tc.name testRegionApi0136
     * @tc.desc Verify a far away path stays inside the automatic clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0136 begin');
      await runCase('testRegionApi0136', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(900, 900, 950, 950));
        const region: drawing.Region = regionFromPath(path);
        expect(hasBounds(region, [900, 900, 950, 950])).assertTrue();
        expect(regionContainsPoint(region, 925, 925)).assertTrue();
        expect(regionIsRect(region)).assertTrue();
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0136 end');
    });
  });
}
