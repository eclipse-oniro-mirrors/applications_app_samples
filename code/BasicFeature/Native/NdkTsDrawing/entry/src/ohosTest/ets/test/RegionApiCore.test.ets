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
  regionFromPath,
  regionFromRect,
  regionFromSetRect,
  regionIsComplex,
  regionIsEmpty,
  regionIsEqual,
  regionIsRect,
  regionOffset,
  regionQuickContains,
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

export default function regionApiCoreTest() {
  describe('RegionApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_REGION_0001
     * @tc.name testRegionApi0001
     * @tc.desc Verify a default region is empty and neither a rectangle nor complex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRegionApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0001 begin');
      await runCase('testRegionApi0001', async () => {
        const region: drawing.Region = new drawing.Region();
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(regionIsComplex(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0002
     * @tc.name testRegionApi0002
     * @tc.desc Verify an empty region reports all zero bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0002 begin');
      await runCase('testRegionApi0002', async () => {
        const bounds: number[] = boundsOf(new drawing.Region());
        expect(bounds.length).assertEqual(4);
        expect(bounds[0]).assertEqual(0);
        expect(bounds[1]).assertEqual(0);
        expect(bounds[2]).assertEqual(0);
        expect(bounds[3]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0003
     * @tc.name testRegionApi0003
     * @tc.desc Verify the four edge constructor keeps the given bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRegionApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0003 begin');
      await runCase('testRegionApi0003', async () => {
        const region: drawing.Region = rectRegion(10, 20, 110, 120);
        expect(hasBounds(region, [10, 20, 110, 120])).assertTrue();
        expect(boundsOf(region)[2]).assertEqual(110);
        expect(boundsOf(region)[3]).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0004
     * @tc.name testRegionApi0004
     * @tc.desc Verify a rectangle region is a single non complex rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRegionApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0004 begin');
      await runCase('testRegionApi0004', async () => {
        const region: drawing.Region = rectRegion(0, 0, 50, 50);
        expect(regionIsEmpty(region)).assertFalse();
        expect(regionIsRect(region)).assertTrue();
        expect(regionIsComplex(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0005
     * @tc.name testRegionApi0005
     * @tc.desc Verify the copy constructor produces an equal region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0005 begin');
      await runCase('testRegionApi0005', async () => {
        const source: drawing.Region = rectRegion(5, 6, 55, 66);
        const copy: drawing.Region = new drawing.Region(source);
        expect(regionIsEqual(source, copy)).assertTrue();
        expect(hasBounds(copy, [5, 6, 55, 66])).assertTrue();
        expect(regionIsRect(copy)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0006
     * @tc.name testRegionApi0006
     * @tc.desc Verify a copied region can be modified without touching the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0006 begin');
      await runCase('testRegionApi0006', async () => {
        const source: drawing.Region = rectRegion(0, 0, 40, 40);
        const copy: drawing.Region = new drawing.Region(source);
        copy.offset(100, 100);
        expect(hasBounds(copy, [100, 100, 140, 140])).assertTrue();
        expect(hasBounds(source, [0, 0, 40, 40])).assertTrue();
        expect(regionIsEqual(source, copy)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0007
     * @tc.name testRegionApi0007
     * @tc.desc Verify a zero width constructor region counts as empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0007 begin');
      await runCase('testRegionApi0007', async () => {
        const region: drawing.Region = rectRegion(30, 30, 30, 80);
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(regionContainsPoint(region, 30, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0008
     * @tc.name testRegionApi0008
     * @tc.desc Verify setRect on a fresh region reports success and stores the rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRegionApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0008 begin');
      await runCase('testRegionApi0008', async () => {
        const region: drawing.Region = new drawing.Region();
        const ok: boolean = region.setRect(10, 10, 60, 60);
        expect(ok).assertTrue();
        expect(hasBounds(region, [10, 10, 60, 60])).assertTrue();
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0009
     * @tc.name testRegionApi0009
     * @tc.desc Verify a second setRect replaces the previous rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0009 begin');
      await runCase('testRegionApi0009', async () => {
        const region: drawing.Region = regionFromSetRect(ltrb(0, 0, 20, 20));
        region.setRect(100, 100, 150, 150);
        expect(hasBounds(region, [100, 100, 150, 150])).assertTrue();
        expect(regionContainsPoint(region, 10, 10)).assertFalse();
        expect(regionContainsPoint(region, 120, 120)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0010
     * @tc.name testRegionApi0010
     * @tc.desc Verify setRect with equal edges empties the region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0010 begin');
      await runCase('testRegionApi0010', async () => {
        const region: drawing.Region = new drawing.Region();
        region.setRect(40, 40, 40, 90);
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(regionIsComplex(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0011
     * @tc.name testRegionApi0011
     * @tc.desc Verify setRect with inverted edges does not keep any area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0011 begin');
      await runCase('testRegionApi0011', async () => {
        const region: drawing.Region = new drawing.Region();
        region.setRect(90, 90, 40, 40);
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(regionContainsPoint(region, 60, 60)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0012
     * @tc.name testRegionApi0012
     * @tc.desc Verify a region built from negative edges keeps negative bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0012 begin');
      await runCase('testRegionApi0012', async () => {
        const region: drawing.Region = rectRegion(-10, -10, 0, 0);
        expect(hasBounds(region, [-10, -10, 0, 0])).assertTrue();
        expect(regionContainsPoint(region, -5, -5)).assertTrue();
        expect(regionContainsPoint(region, 0, 0)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0013
     * @tc.name testRegionApi0013
     * @tc.desc Verify setEmpty on a set region clears bounds and content.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0013 begin');
      await runCase('testRegionApi0013', async () => {
        const region: drawing.Region = rectRegion(10, 10, 20, 20);
        region.setEmpty();
        expect(regionIsEmpty(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0014
     * @tc.name testRegionApi0014
     * @tc.desc Verify setting the same rectangle twice is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0014 begin');
      await runCase('testRegionApi0014', async () => {
        const region: drawing.Region = new drawing.Region();
        region.setRect(3, 4, 53, 54);
        const first: drawing.Region = new drawing.Region(region);
        region.setRect(3, 4, 53, 54);
        expect(regionIsEqual(first, region)).assertTrue();
        expect(hasBounds(region, [3, 4, 53, 54])).assertTrue();
        expect(regionIsEmpty(region)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0015
     * @tc.name testRegionApi0015
     * @tc.desc Verify the top left corner is contained and the far corner is not.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRegionApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0015 begin');
      await runCase('testRegionApi0015', async () => {
        const region: drawing.Region = rectRegion(10, 10, 110, 110);
        expect(regionContainsPoint(region, 10, 10)).assertTrue();
        expect(regionContainsPoint(region, 109, 109)).assertTrue();
        expect(regionContainsPoint(region, 110, 110)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0016
     * @tc.name testRegionApi0016
     * @tc.desc Verify points left and above the region are rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0016 begin');
      await runCase('testRegionApi0016', async () => {
        const region: drawing.Region = rectRegion(10, 10, 110, 110);
        expect(regionContainsPoint(region, 9, 10)).assertFalse();
        expect(regionContainsPoint(region, 10, 9)).assertFalse();
        expect(regionContainsPoint(region, 50, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0017
     * @tc.name testRegionApi0017
     * @tc.desc Verify the top edge row contains exactly the inner hundred columns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0017 begin');
      await runCase('testRegionApi0017', async () => {
        const region: drawing.Region = rectRegion(10, 10, 110, 110);
        let hits: number = 0;
        for (let x: number = 9; x <= 111; x++) {
          if (regionContainsPoint(region, x, 10)) {
            hits += 1;
          }
        }
        expect(hits).assertEqual(100);
        expect(regionContainsPoint(region, 9, 10)).assertFalse();
        expect(regionContainsPoint(region, 110, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0018
     * @tc.name testRegionApi0018
     * @tc.desc Verify point containment works for a negative region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0018 begin');
      await runCase('testRegionApi0018', async () => {
        const region: drawing.Region = rectRegion(-50, -50, -10, -10);
        expect(regionContainsPoint(region, -20, -20)).assertTrue();
        expect(regionContainsPoint(region, -60, -60)).assertFalse();
        expect(regionContainsPoint(region, -10, -10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0019
     * @tc.name testRegionApi0019
     * @tc.desc Verify an empty region contains no point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0019 begin');
      await runCase('testRegionApi0019', async () => {
        const region: drawing.Region = new drawing.Region();
        expect(regionIsEmpty(region)).assertTrue();
        expect(regionContainsPoint(region, 0, 0)).assertFalse();
        expect(regionContainsPoint(region, 5, 5)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0020
     * @tc.name testRegionApi0020
     * @tc.desc Verify containment follows a setRect update.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0020 begin');
      await runCase('testRegionApi0020', async () => {
        const region: drawing.Region = rectRegion(0, 0, 40, 40);
        region.setRect(200, 200, 260, 260);
        expect(regionContainsPoint(region, 220, 220)).assertTrue();
        expect(regionContainsPoint(region, 20, 20)).assertFalse();
        expect(hasBounds(region, [200, 200, 260, 260])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0021
     * @tc.name testRegionApi0021
     * @tc.desc Verify containment follows an offset of the region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0021 begin');
      await runCase('testRegionApi0021', async () => {
        const region: drawing.Region = rectRegion(0, 0, 30, 30);
        expect(regionContainsPoint(region, 10, 10)).assertTrue();
        const moved: drawing.Region = regionOffset(region, 50, 50);
        expect(regionContainsPoint(moved, 60, 60)).assertTrue();
        expect(regionContainsPoint(moved, 10, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0022
     * @tc.name testRegionApi0022
     * @tc.desc Verify a small region is contained in a larger one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0022 begin');
      await runCase('testRegionApi0022', async () => {
        const outer: drawing.Region = rectRegion(0, 0, 100, 100);
        const inner: drawing.Region = rectRegion(20, 20, 60, 60);
        expect(regionContainsRegion(outer, inner)).assertTrue();
        expect(regionContainsRegion(inner, outer)).assertFalse();
        expect(regionIsEqual(outer, inner)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0023
     * @tc.name testRegionApi0023
     * @tc.desc Verify a partially overlapping region is not contained.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0023 begin');
      await runCase('testRegionApi0023', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        const overlapping: drawing.Region = rectRegion(50, 50, 150, 150);
        expect(regionContainsRegion(base, overlapping)).assertFalse();
        expect(regionContainsRegion(overlapping, base)).assertFalse();
        expect(regionContainsPoint(base, 60, 60)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0024
     * @tc.name testRegionApi0024
     * @tc.desc Verify a region contains an equal region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0024 begin');
      await runCase('testRegionApi0024', async () => {
        const first: drawing.Region = rectRegion(15, 25, 35, 45);
        const second: drawing.Region = rectRegion(15, 25, 35, 45);
        expect(regionContainsRegion(first, second)).assertTrue();
        expect(regionContainsRegion(second, first)).assertTrue();
        expect(regionIsEqual(first, second)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0025
     * @tc.name testRegionApi0025
     * @tc.desc Verify containment breaks once the inner region is offset away.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0025 begin');
      await runCase('testRegionApi0025', async () => {
        const outer: drawing.Region = rectRegion(0, 0, 100, 100);
        const moved: drawing.Region = regionOffset(rectRegion(20, 20, 40, 40), 90, 90);
        expect(regionContainsRegion(outer, moved)).assertFalse();
        expect(hasBounds(moved, [110, 110, 130, 130])).assertTrue();
        expect(regionContainsRegion(outer, rectRegion(1, 1, 99, 99))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0026
     * @tc.name testRegionApi0026
     * @tc.desc Verify an empty region is not contained in a rectangle region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0026 begin');
      await runCase('testRegionApi0026', async () => {
        const filled: drawing.Region = rectRegion(0, 0, 100, 100);
        const empty: drawing.Region = new drawing.Region();
        expect(regionContainsRegion(filled, empty)).assertFalse();
        expect(regionContainsRegion(empty, filled)).assertFalse();
        expect(regionIsEqual(empty, filled)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0027
     * @tc.name testRegionApi0027
     * @tc.desc Verify a bigger region does not contain a smaller inspected one in reverse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0027 begin');
      await runCase('testRegionApi0027', async () => {
        const small: drawing.Region = rectRegion(10, 10, 20, 20);
        const large: drawing.Region = rectRegion(-100, -100, 200, 200);
        expect(regionContainsRegion(large, small)).assertTrue();
        expect(regionContainsRegion(small, large)).assertFalse();
        expect(regionContainsPoint(large, -50, 150)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0028
     * @tc.name testRegionApi0028
     * @tc.desc Verify two regions with the same bounds compare equal both ways.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRegionApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0028 begin');
      await runCase('testRegionApi0028', async () => {
        const first: drawing.Region = rectRegion(7, 8, 57, 58);
        const second: drawing.Region = regionFromSetRect(ltrb(7, 8, 57, 58));
        expect(regionIsEqual(first, second)).assertTrue();
        expect(regionIsEqual(second, first)).assertTrue();
        expect(regionIsEmpty(first)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0029
     * @tc.name testRegionApi0029
     * @tc.desc Verify regions with different bounds compare unequal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0029 begin');
      await runCase('testRegionApi0029', async () => {
        const first: drawing.Region = rectRegion(0, 0, 50, 50);
        const second: drawing.Region = rectRegion(0, 0, 51, 50);
        expect(regionIsEqual(first, second)).assertFalse();
        expect(regionIsEqual(second, first)).assertFalse();
        expect(boundsOf(second)[2]).assertEqual(51);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0030
     * @tc.name testRegionApi0030
     * @tc.desc Verify two empty regions compare equal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0030 begin');
      await runCase('testRegionApi0030', async () => {
        const first: drawing.Region = new drawing.Region();
        const second: drawing.Region = rectRegion(0, 0, 10, 10);
        second.setEmpty();
        expect(regionIsEqual(first, second)).assertTrue();
        expect(regionIsEmpty(second)).assertTrue();
        expect(regionIsRect(first)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0031
     * @tc.name testRegionApi0031
     * @tc.desc Verify two regions offset by different amounts stay unequal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0031 begin');
      await runCase('testRegionApi0031', async () => {
        const base: drawing.Region = rectRegion(0, 0, 10, 10);
        const far: drawing.Region = regionOffset(base, 5, 0);
        expect(regionIsEqual(base, far)).assertFalse();
        expect(regionIsEqual(base, rectRegion(0, 0, 10, 10))).assertTrue();
        expect(boundsOf(far)[0]).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0032
     * @tc.name testRegionApi0032
     * @tc.desc Verify a setRect region and a constructor region with the same edges compare equal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0032 begin');
      await runCase('testRegionApi0032', async () => {
        const fromCtor: drawing.Region = rectRegion(-30, -20, 70, 80);
        const fromSetter: drawing.Region = regionFromSetRect(ltrb(-30, -20, 70, 80));
        expect(regionIsEqual(fromCtor, fromSetter)).assertTrue();
        expect(hasBounds(fromCtor, [-30, -20, 70, 80])).assertTrue();
        expect(boundsOf(fromSetter)[1]).assertEqual(-20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0033
     * @tc.name testRegionApi0033
     * @tc.desc Verify a positive offset shifts the bounds right and down.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRegionApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0033 begin');
      await runCase('testRegionApi0033', async () => {
        const moved: drawing.Region = regionOffset(rectRegion(0, 0, 30, 30), 20, 40);
        expect(hasBounds(moved, [20, 40, 50, 70])).assertTrue();
        expect(regionContainsPoint(moved, 25, 45)).assertTrue();
        expect(regionContainsPoint(moved, 5, 5)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0034
     * @tc.name testRegionApi0034
     * @tc.desc Verify a negative offset shifts the bounds left and up.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0034 begin');
      await runCase('testRegionApi0034', async () => {
        const moved: drawing.Region = regionOffset(rectRegion(100, 100, 150, 150), -60, -70);
        expect(hasBounds(moved, [40, 30, 90, 80])).assertTrue();
        expect(regionContainsPoint(moved, 50, 40)).assertTrue();
        expect(regionContainsPoint(moved, 120, 120)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0035
     * @tc.name testRegionApi0035
     * @tc.desc Verify a zero offset leaves the region unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0035 begin');
      await runCase('testRegionApi0035', async () => {
        const base: drawing.Region = rectRegion(12, 34, 56, 78);
        const moved: drawing.Region = regionOffset(base, 0, 0);
        expect(hasBounds(moved, [12, 34, 56, 78])).assertTrue();
        expect(regionIsEqual(base, moved)).assertTrue();
        expect(regionContainsPoint(moved, 20, 40)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0036
     * @tc.name testRegionApi0036
     * @tc.desc Verify two consecutive offsets accumulate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0036 begin');
      await runCase('testRegionApi0036', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.offset(5, 5);
        region.offset(5, 5);
        expect(hasBounds(region, [10, 10, 20, 20])).assertTrue();
        expect(regionContainsPoint(region, 15, 15)).assertTrue();
        expect(regionContainsPoint(region, 5, 5)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0037
     * @tc.name testRegionApi0037
     * @tc.desc Verify offsetting an empty region keeps it empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0037 begin');
      await runCase('testRegionApi0037', async () => {
        const moved: drawing.Region = regionOffset(new drawing.Region(), 30, 40);
        expect(regionIsEmpty(moved)).assertTrue();
        expect(hasBounds(moved, [0, 0, 0, 0])).assertTrue();
        expect(regionIsRect(moved)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0038
     * @tc.name testRegionApi0038
     * @tc.desc Verify regionOffset returns a copy and keeps the source intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0038 begin');
      await runCase('testRegionApi0038', async () => {
        const source: drawing.Region = rectRegion(10, 10, 20, 20);
        const moved: drawing.Region = regionOffset(source, 300, 0);
        expect(hasBounds(source, [10, 10, 20, 20])).assertTrue();
        expect(hasBounds(moved, [310, 10, 320, 20])).assertTrue();
        expect(regionIsEqual(source, moved)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0039
     * @tc.name testRegionApi0039
     * @tc.desc Verify offset works on a region produced by setRect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0039 begin');
      await runCase('testRegionApi0039', async () => {
        const region: drawing.Region = regionFromSetRect(ltrb(5, 5, 25, 25));
        region.offset(-5, 15);
        expect(hasBounds(region, [0, 20, 20, 40])).assertTrue();
        expect(regionContainsPoint(region, 10, 30)).assertTrue();
        expect(regionIsRect(region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0040
     * @tc.name testRegionApi0040
     * @tc.desc Verify a very large offset is applied without clamping.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0040 begin');
      await runCase('testRegionApi0040', async () => {
        const moved: drawing.Region = regionOffset(rectRegion(0, 0, 10, 10), 10000, -10000);
        expect(hasBounds(moved, [10000, -10000, 10010, -9990])).assertTrue();
        expect(regionContainsPoint(moved, 10005, -9995)).assertTrue();
        expect(regionIsEmpty(moved)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0041
     * @tc.name testRegionApi0041
     * @tc.desc Verify setRegion copies the bounds of another region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0041 begin');
      await runCase('testRegionApi0041', async () => {
        const source: drawing.Region = rectRegion(30, 40, 80, 90);
        const target: drawing.Region = new drawing.Region();
        target.setRegion(source);
        expect(regionIsEqual(source, target)).assertTrue();
        expect(hasBounds(target, [30, 40, 80, 90])).assertTrue();
        expect(regionContainsPoint(target, 50, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0042
     * @tc.name testRegionApi0042
     * @tc.desc Verify the region copied by setRegion survives an emptied source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0042 begin');
      await runCase('testRegionApi0042', async () => {
        const source: drawing.Region = rectRegion(0, 0, 60, 60);
        const target: drawing.Region = new drawing.Region();
        target.setRegion(source);
        source.setEmpty();
        expect(regionIsEmpty(source)).assertTrue();
        expect(hasBounds(target, [0, 0, 60, 60])).assertTrue();
        expect(regionContainsPoint(target, 30, 30)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0043
     * @tc.name testRegionApi0043
     * @tc.desc Verify setRegion from an empty region empties the target.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0043 begin');
      await runCase('testRegionApi0043', async () => {
        const target: drawing.Region = rectRegion(10, 10, 90, 90);
        target.setRegion(new drawing.Region());
        expect(regionIsEmpty(target)).assertTrue();
        expect(hasBounds(target, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(target, 50, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0044
     * @tc.name testRegionApi0044
     * @tc.desc Verify emptying a copy leaves the original region intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0044 begin');
      await runCase('testRegionApi0044', async () => {
        const source: drawing.Region = rectRegion(1, 2, 3, 4);
        const copy: drawing.Region = new drawing.Region(source);
        copy.setEmpty();
        expect(regionIsEmpty(copy)).assertTrue();
        expect(hasBounds(source, [1, 2, 3, 4])).assertTrue();
        expect(regionIsEqual(source, copy)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0045
     * @tc.name testRegionApi0045
     * @tc.desc Verify a region built by setRegion can be offset independently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0045 begin');
      await runCase('testRegionApi0045', async () => {
        const source: drawing.Region = rectRegion(20, 20, 40, 40);
        const target: drawing.Region = new drawing.Region();
        target.setRegion(source);
        target.offset(10, 0);
        expect(hasBounds(target, [30, 20, 50, 40])).assertTrue();
        expect(hasBounds(source, [20, 20, 40, 40])).assertTrue();
        expect(regionIsEqual(source, target)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0046
     * @tc.name testRegionApi0046
     * @tc.desc Verify the union of two disjoint rectangles becomes complex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0046 begin');
      await runCase('testRegionApi0046', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        const ok: boolean = region.op(rectRegion(50, 50, 60, 60), drawing.RegionOp.UNION);
        expect(ok).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(regionIsComplex(region)).assertTrue();
        expect(hasBounds(region, [0, 0, 60, 60])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0047
     * @tc.name testRegionApi0047
     * @tc.desc Verify the union of two adjacent rectangles collapses into one rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0047 begin');
      await runCase('testRegionApi0047', async () => {
        const left: drawing.Region = rectRegion(0, 0, 50, 100);
        left.op(rectRegion(50, 0, 100, 100), drawing.RegionOp.UNION);
        expect(regionIsRect(left)).assertTrue();
        expect(hasBounds(left, [0, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(left, 75, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0048
     * @tc.name testRegionApi0048
     * @tc.desc Verify the intersection of overlapping rectangles keeps the overlap only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0048 begin');
      await runCase('testRegionApi0048', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(60, 60, 160, 160), drawing.RegionOp.INTERSECT);
        expect(hasBounds(base, [60, 60, 100, 100])).assertTrue();
        expect(regionIsRect(base)).assertTrue();
        expect(regionContainsPoint(base, 80, 80)).assertTrue();
        expect(regionContainsPoint(base, 40, 40)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0049
     * @tc.name testRegionApi0049
     * @tc.desc Verify an intersection that only shares an edge is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0049 begin');
      await runCase('testRegionApi0049', async () => {
        const base: drawing.Region = rectRegion(0, 0, 50, 50);
        base.op(rectRegion(50, 0, 100, 50), drawing.RegionOp.INTERSECT);
        expect(regionIsEmpty(base)).assertTrue();
        expect(hasBounds(base, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(base, 50, 25)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0050
     * @tc.name testRegionApi0050
     * @tc.desc Verify the intersection of two disjoint rectangles is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0050 begin');
      await runCase('testRegionApi0050', async () => {
        const base: drawing.Region = rectRegion(0, 0, 20, 20);
        base.op(rectRegion(100, 100, 120, 120), drawing.RegionOp.INTERSECT);
        expect(regionIsEmpty(base)).assertTrue();
        expect(regionIsComplex(base)).assertFalse();
        expect(regionContainsPoint(base, 10, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0051
     * @tc.name testRegionApi0051
     * @tc.desc Verify the difference of a left half removes that half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0051 begin');
      await runCase('testRegionApi0051', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(0, 0, 50, 100), drawing.RegionOp.DIFFERENCE);
        expect(hasBounds(base, [50, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(base, 25, 50)).assertFalse();
        expect(regionContainsPoint(base, 75, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0052
     * @tc.name testRegionApi0052
     * @tc.desc Verify removing a middle band makes the region complex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0052 begin');
      await runCase('testRegionApi0052', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(40, 0, 60, 100), drawing.RegionOp.DIFFERENCE);
        expect(regionIsRect(base)).assertFalse();
        expect(regionIsComplex(base)).assertTrue();
        expect(regionContainsPoint(base, 50, 50)).assertFalse();
        expect(regionContainsPoint(base, 20, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0053
     * @tc.name testRegionApi0053
     * @tc.desc Verify subtracting the whole region leaves it empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0053 begin');
      await runCase('testRegionApi0053', async () => {
        const base: drawing.Region = rectRegion(10, 10, 50, 50);
        base.op(rectRegion(0, 0, 100, 100), drawing.RegionOp.DIFFERENCE);
        expect(regionIsEmpty(base)).assertTrue();
        expect(hasBounds(base, [0, 0, 0, 0])).assertTrue();
        expect(regionIsRect(base)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0054
     * @tc.name testRegionApi0054
     * @tc.desc Verify subtracting a disjoint rectangle changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0054 begin');
      await runCase('testRegionApi0054', async () => {
        const base: drawing.Region = rectRegion(0, 0, 40, 40);
        base.op(rectRegion(200, 200, 300, 300), drawing.RegionOp.DIFFERENCE);
        expect(regionIsEqual(base, rectRegion(0, 0, 40, 40))).assertTrue();
        expect(hasBounds(base, [0, 0, 40, 40])).assertTrue();
        expect(regionContainsPoint(base, 20, 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0055
     * @tc.name testRegionApi0055
     * @tc.desc Verify the xor of two disjoint rectangles keeps both.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0055 begin');
      await runCase('testRegionApi0055', async () => {
        const base: drawing.Region = rectRegion(0, 0, 10, 10);
        base.op(rectRegion(90, 90, 100, 100), drawing.RegionOp.XOR);
        expect(regionIsComplex(base)).assertTrue();
        expect(hasBounds(base, [0, 0, 100, 100])).assertTrue();
        expect(regionContainsPoint(base, 5, 5)).assertTrue();
        expect(regionContainsPoint(base, 95, 95)).assertTrue();
        expect(regionContainsPoint(base, 50, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0056
     * @tc.name testRegionApi0056
     * @tc.desc Verify the xor of overlapping rectangles leaves a hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0056 begin');
      await runCase('testRegionApi0056', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(50, 50, 150, 150), drawing.RegionOp.XOR);
        expect(regionIsComplex(base)).assertTrue();
        expect(regionContainsPoint(base, 75, 75)).assertFalse();
        expect(regionContainsPoint(base, 25, 25)).assertTrue();
        expect(regionContainsPoint(base, 125, 125)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0057
     * @tc.name testRegionApi0057
     * @tc.desc Verify the reverse difference keeps only the other region part.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0057 begin');
      await runCase('testRegionApi0057', async () => {
        const base: drawing.Region = rectRegion(0, 0, 50, 50);
        base.op(rectRegion(0, 0, 100, 100), drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(hasBounds(base, [50, 0, 100, 100])).assertFalse();
        expect(regionContainsPoint(base, 75, 25)).assertTrue();
        expect(regionContainsPoint(base, 25, 25)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0058
     * @tc.name testRegionApi0058
     * @tc.desc Verify the replace operation copies the other region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0058 begin');
      await runCase('testRegionApi0058', async () => {
        const base: drawing.Region = rectRegion(0, 0, 10, 10);
        const other: drawing.Region = rectRegion(200, 300, 260, 360);
        base.op(other, drawing.RegionOp.REPLACE);
        expect(regionIsEqual(base, other)).assertTrue();
        expect(hasBounds(base, [200, 300, 260, 360])).assertTrue();
        expect(regionContainsPoint(base, 230, 330)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0059
     * @tc.name testRegionApi0059
     * @tc.desc Verify replacing with an empty region empties the receiver.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0059 begin');
      await runCase('testRegionApi0059', async () => {
        const base: drawing.Region = rectRegion(5, 5, 95, 95);
        base.op(new drawing.Region(), drawing.RegionOp.REPLACE);
        expect(regionIsEmpty(base)).assertTrue();
        expect(hasBounds(base, [0, 0, 0, 0])).assertTrue();
        expect(regionContainsPoint(base, 50, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0060
     * @tc.name testRegionApi0060
     * @tc.desc Verify quickContains accepts a rectangle inside the region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0060 begin');
      await runCase('testRegionApi0060', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        expect(regionQuickContains(region, ltrb(10, 10, 50, 50))).assertTrue();
        expect(regionQuickContains(region, ltrb(0, 0, 100, 100))).assertTrue();
        expect(regionQuickContains(region, ltrb(1, 2, 3, 4))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0061
     * @tc.name testRegionApi0061
     * @tc.desc Verify quickContains rejects a rectangle reaching outside.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0061 begin');
      await runCase('testRegionApi0061', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        expect(regionQuickContains(region, ltrb(-1, 0, 50, 50))).assertFalse();
        expect(regionQuickContains(region, ltrb(0, 0, 101, 50))).assertFalse();
        expect(regionQuickContains(region, ltrb(200, 200, 300, 300))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0062
     * @tc.name testRegionApi0062
     * @tc.desc Verify quickContains fails for a complex region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0062 begin');
      await runCase('testRegionApi0062', async () => {
        const region: drawing.Region = rectRegion(0, 0, 10, 10);
        region.op(rectRegion(50, 50, 60, 60), drawing.RegionOp.UNION);
        expect(regionIsComplex(region)).assertTrue();
        expect(regionQuickContains(region, ltrb(1, 1, 9, 9))).assertFalse();
        expect(regionQuickContains(region, ltrb(51, 51, 59, 59))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0063
     * @tc.name testRegionApi0063
     * @tc.desc Verify quickContains rejects a rectangle that only shares an edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0063 begin');
      await runCase('testRegionApi0063', async () => {
        const region: drawing.Region = rectRegion(0, 0, 100, 100);
        expect(regionQuickContains(region, ltrb(100, 0, 200, 100))).assertFalse();
        expect(regionQuickContains(region, ltrb(0, 100, 100, 200))).assertFalse();
        expect(regionQuickContains(region, ltrb(0, 0, 100, 100))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0064
     * @tc.name testRegionApi0064
     * @tc.desc Verify a rectangle path turns into a rectangle region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRegionApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0064 begin');
      await runCase('testRegionApi0064', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 20, 60, 70));
        const region: drawing.Region = new drawing.Region();
        const ok: boolean = region.setPath(path, wideClip());
        expect(ok).assertTrue();
        expect(hasBounds(region, [10, 20, 60, 70])).assertTrue();
        expect(regionIsRect(region)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0065
     * @tc.name testRegionApi0065
     * @tc.desc Verify a two rectangle path turns into a complex region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0065 begin');
      await runCase('testRegionApi0065', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 20, 20));
        path.addRect(ltrb(80, 80, 100, 100));
        const region: drawing.Region = regionFromPath(path);
        expect(regionIsComplex(region)).assertTrue();
        expect(regionIsRect(region)).assertFalse();
        expect(hasBounds(region, [0, 0, 100, 100])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0066
     * @tc.name testRegionApi0066
     * @tc.desc Verify the clip region clips the path driven region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0066 begin');
      await runCase('testRegionApi0066', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 60, 60));
        const region: drawing.Region = new drawing.Region();
        region.setPath(path, rectRegion(0, 0, 30, 100));
        expect(hasBounds(region, [10, 10, 30, 60])).assertTrue();
        expect(regionContainsPoint(region, 20, 20)).assertTrue();
        expect(regionContainsPoint(region, 50, 20)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0067
     * @tc.name testRegionApi0067
     * @tc.desc Verify a circle path produces a non rectangle region with circle bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0067 begin');
      await runCase('testRegionApi0067', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(50, 50, 20);
        const region: drawing.Region = regionFromPath(path);
        expect(regionIsRect(region)).assertFalse();
        expect(hasBounds(region, [30, 30, 70, 70])).assertTrue();
        expect(regionContainsPoint(region, 50, 50)).assertTrue();
        expect(regionContainsPoint(region, 31, 31)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_REGION_0068
     * @tc.name testRegionApi0068
     * @tc.desc Verify the boundary path of a rectangle region has the region bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRegionApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0068 begin');
      await runCase('testRegionApi0068', async () => {
        const region: drawing.Region = rectRegion(10, 20, 110, 120);
        const outline: drawing.Path = regionBoundaryPath(region);
        const bounds: common2D.Rect = outline.getBounds();
        expect(bounds.left).assertEqual(10);
        expect(bounds.top).assertEqual(20);
        expect(bounds.right).assertEqual(110);
        expect(bounds.bottom).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRegionApi0068 end');
    });
  });
}
