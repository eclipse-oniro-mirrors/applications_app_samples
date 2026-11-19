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
import { roundRectCorners, roundRectSnapshot } from '../../../main/ets/drawing/DrawingGeometryUtils';
import {
  collectConicWeights,
  collectPoints,
  collectVerbs,
  iterateVerbs,
  PathSummary,
  summarize,
  verbName
} from '../../../main/ets/drawing/DrawingPathQuery';
import {
  loadSystemTypeface,
  makeTypefaceFromCurrent,
  typefaceVariation
} from '../../../main/ets/drawing/DrawingFontText';
import { clampChannel, ltrb, rgba, toArgb, toPair } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Read one rounded corner as a pair of radii.
 *
 * @param { drawing.RoundRect } roundRect - Source rounded rectangle.
 * @param { drawing.CornerPos } pos - Corner to read.
 * @returns { number[] } X radius and Y radius.
 */
function cornerOf(roundRect: drawing.RoundRect, pos: drawing.CornerPos): number[] {
  const corner: common2D.Point = roundRect.getCorner(pos);
  return [corner.x, corner.y];
}

/**
 * Read all four rounded corners in a fixed order.
 *
 * @param { drawing.RoundRect } roundRect - Source rounded rectangle.
 * @returns { number[] } Eight numbers, x and y for each corner.
 */
function cornersOf(roundRect: drawing.RoundRect): number[] {
  const positions: drawing.CornerPos[] = [
    drawing.CornerPos.TOP_LEFT_POS,
    drawing.CornerPos.TOP_RIGHT_POS,
    drawing.CornerPos.BOTTOM_RIGHT_POS,
    drawing.CornerPos.BOTTOM_LEFT_POS
  ];
  const corners: number[] = [];
  for (let index: number = 0; index < positions.length; index++) {
    const corner: common2D.Point = roundRect.getCorner(positions[index]);
    corners.push(corner.x);
    corners.push(corner.y);
  }
  return corners;
}

/**
 * Compare two flat number arrays element by element.
 *
 * @param { number[] } first - First array.
 * @param { number[] } second - Second array.
 * @returns { boolean } Whether both arrays hold the same values.
 */
function sameNumbers(first: number[], second: number[]): boolean {
  if (first.length !== second.length) {
    return false;
  }
  for (let index: number = 0; index < first.length; index++) {
    if (first[index] !== second[index]) {
      return false;
    }
  }
  return true;
}

/**
 * Check whether every value of a flat array equals one expected number.
 *
 * @param { number[] } values - Flat number array.
 * @param { number } expected - Expected value.
 * @returns { boolean } Whether the array is non empty and uniform.
 */
function allEqualTo(values: number[], expected: number): boolean {
  if (values.length === 0) {
    return false;
  }
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] !== expected) {
      return false;
    }
  }
  return true;
}

/**
 * Count how often a verb name appears in a name array.
 *
 * @param { string[] } names - Verb names.
 * @param { string } target - Verb name to count.
 * @returns { number } Number of occurrences.
 */
function countOf(names: string[], target: string): number {
  let count: number = 0;
  for (let index: number = 0; index < names.length; index++) {
    if (names[index] === target) {
      count = count + 1;
    }
  }
  return count;
}

export default function miscApiCoreTest() {
  describe('MiscApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_MISC_0001
     * @tc.name testMiscApi0001
     * @tc.desc Verify the helper reads eight radius numbers with paired corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0001 begin');
      await runCase('testMiscApi0001', async () => {
        const corners: number[] = roundRectCorners();
        expect(corners.length).assertEqual(8);
        expect(corners[0]).assertEqual(corners[1]);
        expect(corners[2]).assertEqual(corners[3]);
        expect(corners[6]).assertEqual(corners[7]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0002
     * @tc.name testMiscApi0002
     * @tc.desc Verify the helper corner radii match the frozen table.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0002 begin');
      await runCase('testMiscApi0002', async () => {
        const corners: number[] = roundRectCorners();
        expect(corners[0]).assertEqual(4);
        expect(corners[2]).assertEqual(6);
        expect(corners[4]).assertEqual(10);
        expect(corners[6]).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0003
     * @tc.name testMiscApi0003
     * @tc.desc Verify two helper calls return the same radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0003 begin');
      await runCase('testMiscApi0003', async () => {
        const first: number[] = roundRectCorners();
        const second: number[] = roundRectCorners();
        expect(first.length).assertEqual(8);
        expect(sameNumbers(first, second)).assertTrue();
        expect(first[7]).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0004
     * @tc.name testMiscApi0004
     * @tc.desc Verify the three argument constructor sets all four equal radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0004 begin');
      await runCase('testMiscApi0004', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 8, 8);
        const corners: number[] = cornersOf(roundRect);
        expect(corners.length).assertEqual(8);
        expect(allEqualTo(corners, 8)).assertTrue();
        expect(corners[0]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0005
     * @tc.name testMiscApi0005
     * @tc.desc Verify asymmetric constructor radii are kept on every corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0005 begin');
      await runCase('testMiscApi0005', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 3, 7);
        const corners: number[] = cornersOf(roundRect);
        expect(corners[0]).assertEqual(3);
        expect(corners[1]).assertEqual(7);
        expect(corners[6]).assertEqual(3);
        expect(corners[7]).assertEqual(7);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0006
     * @tc.name testMiscApi0006
     * @tc.desc Verify setCorner on the top left leaves the other corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0006 begin');
      await runCase('testMiscApi0006', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 4, 4);
        const corners: number[] = cornersOf(roundRect);
        expect(corners[0]).assertEqual(4);
        expect(corners[2]).assertEqual(8);
        expect(corners[4]).assertEqual(8);
        expect(corners[6]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0007
     * @tc.name testMiscApi0007
     * @tc.desc Verify setCorner on the top right only touches that corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0007 begin');
      await runCase('testMiscApi0007', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 6, 6);
        const changed: number[] = cornerOf(roundRect, drawing.CornerPos.TOP_RIGHT_POS);
        const kept: number[] = cornerOf(roundRect, drawing.CornerPos.TOP_LEFT_POS);
        expect(changed[0]).assertEqual(6);
        expect(kept[0]).assertEqual(8);
        expect(kept[1]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0008
     * @tc.name testMiscApi0008
     * @tc.desc Verify setCorner on the bottom right only touches that corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0008 begin');
      await runCase('testMiscApi0008', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 10, 10);
        const corners: number[] = cornersOf(roundRect);
        expect(corners[4]).assertEqual(10);
        expect(corners[5]).assertEqual(10);
        expect(corners[0]).assertEqual(8);
        expect(corners[2]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0009
     * @tc.name testMiscApi0009
     * @tc.desc Verify setCorner on the bottom left only touches that corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0009 begin');
      await runCase('testMiscApi0009', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 12, 12);
        const corners: number[] = cornersOf(roundRect);
        expect(corners[6]).assertEqual(12);
        expect(corners[7]).assertEqual(12);
        expect(corners[4]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0010
     * @tc.name testMiscApi0010
     * @tc.desc Verify setCorner keeps the two radii of one corner independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0010 begin');
      await runCase('testMiscApi0010', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 2, 9);
        const corner: number[] = cornerOf(roundRect, drawing.CornerPos.TOP_LEFT_POS);
        expect(corner[0]).assertEqual(2);
        expect(corner[1]).assertEqual(9);
        expect(corner[0] === corner[1]).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0011
     * @tc.name testMiscApi0011
     * @tc.desc Verify a second setCorner overwrites the previous radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0011 begin');
      await runCase('testMiscApi0011', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 4, 4);
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 6, 6);
        const corner: number[] = cornerOf(roundRect, drawing.CornerPos.TOP_LEFT_POS);
        expect(corner[0]).assertEqual(6);
        expect(corner[1]).assertEqual(6);
        expect(corner[0]).assertEqual(corner[1]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0012
     * @tc.name testMiscApi0012
     * @tc.desc Verify the copy constructor copies all four corner radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0012 begin');
      await runCase('testMiscApi0012', async () => {
        const source: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 8, 8);
        source.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 12, 12);
        const copy: drawing.RoundRect = new drawing.RoundRect(source);
        expect(sameNumbers(cornersOf(source), cornersOf(copy))).assertTrue();
        expect(cornerOf(copy, drawing.CornerPos.BOTTOM_LEFT_POS)[0]).assertEqual(12);
        expect(cornerOf(copy, drawing.CornerPos.TOP_LEFT_POS)[0]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0013
     * @tc.name testMiscApi0013
     * @tc.desc Verify changing a copied rounded rectangle leaves the source alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0013 begin');
      await runCase('testMiscApi0013', async () => {
        const source: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 8, 8);
        const copy: drawing.RoundRect = new drawing.RoundRect(source);
        copy.setCorner(drawing.CornerPos.TOP_LEFT_POS, 2, 2);
        expect(cornerOf(copy, drawing.CornerPos.TOP_LEFT_POS)[0]).assertEqual(2);
        expect(cornerOf(source, drawing.CornerPos.TOP_LEFT_POS)[0]).assertEqual(8);
        expect(allEqualTo(cornersOf(source), 8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0014
     * @tc.name testMiscApi0014
     * @tc.desc Verify offset moves the rounded rectangle without touching radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0014 begin');
      await runCase('testMiscApi0014', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 8, 8);
        roundRect.offset(30, 40);
        const corners: number[] = cornersOf(roundRect);
        expect(corners.length).assertEqual(8);
        expect(allEqualTo(corners, 8)).assertTrue();
        expect(cornerOf(roundRect, drawing.CornerPos.BOTTOM_RIGHT_POS)[1]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0015
     * @tc.name testMiscApi0015
     * @tc.desc Verify the source rectangle position does not change the radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0015 begin');
      await runCase('testMiscApi0015', async () => {
        const left: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 50, 50), 5, 5);
        const right: drawing.RoundRect = new drawing.RoundRect(ltrb(500, 600, 550, 650), 5, 5);
        expect(sameNumbers(cornersOf(left), cornersOf(right))).assertTrue();
        expect(allEqualTo(cornersOf(right), 5)).assertTrue();
        expect(cornersOf(left).length).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0016
     * @tc.name testMiscApi0016
     * @tc.desc Verify the snapshot helper reports uniform radii at zero offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0016 begin');
      await runCase('testMiscApi0016', async () => {
        const corners: number[] = roundRectSnapshot(0, 0);
        expect(corners.length).assertEqual(8);
        expect(allEqualTo(corners, 10)).assertTrue();
        expect(corners[0]).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0017
     * @tc.name testMiscApi0017
     * @tc.desc Verify a positive offset keeps the snapshot radii unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0017 begin');
      await runCase('testMiscApi0017', async () => {
        const base: number[] = roundRectSnapshot(0, 0);
        const moved: number[] = roundRectSnapshot(50, 25);
        expect(allEqualTo(moved, 10)).assertTrue();
        expect(sameNumbers(base, moved)).assertTrue();
        expect(moved.length).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0018
     * @tc.name testMiscApi0018
     * @tc.desc Verify a negative offset keeps the snapshot radii unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0018 begin');
      await runCase('testMiscApi0018', async () => {
        const moved: number[] = roundRectSnapshot(-30, -40);
        expect(moved.length).assertEqual(8);
        expect(sameNumbers(moved, roundRectSnapshot(0, 0))).assertTrue();
        expect(moved[6]).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0019
     * @tc.name testMiscApi0019
     * @tc.desc Verify the snapshot helper is deterministic for one offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0019 begin');
      await runCase('testMiscApi0019', async () => {
        const first: number[] = roundRectSnapshot(12, 34);
        const second: number[] = roundRectSnapshot(12, 34);
        expect(sameNumbers(first, second)).assertTrue();
        expect(allEqualTo(first, 10)).assertTrue();
        expect(first[0]).assertEqual(first[1]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0020
     * @tc.name testMiscApi0020
     * @tc.desc Verify a manual corner sequence matches the helper output.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0020 begin');
      await runCase('testMiscApi0020', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 8, 8);
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 4, 4);
        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 6, 6);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 10, 10);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 12, 12);
        expect(sameNumbers(cornersOf(roundRect), roundRectCorners())).assertTrue();
        expect(cornerOf(roundRect, drawing.CornerPos.TOP_RIGHT_POS)[1]).assertEqual(6);
        expect(cornerOf(roundRect, drawing.CornerPos.BOTTOM_LEFT_POS)[0]).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0021
     * @tc.name testMiscApi0021
     * @tc.desc Verify the MOVE verb name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0021 begin');
      await runCase('testMiscApi0021', async () => {
        const name: string = verbName(drawing.PathIteratorVerb.MOVE);
        expect(name).assertEqual('MOVE');
        expect(name.length).assertEqual(4);
        expect(name === 'LINE').assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0022
     * @tc.name testMiscApi0022
     * @tc.desc Verify the LINE verb name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0022 begin');
      await runCase('testMiscApi0022', async () => {
        const name: string = verbName(drawing.PathIteratorVerb.LINE);
        expect(name).assertEqual('LINE');
        expect(name === 'MOVE').assertFalse();
        expect(name.length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0023
     * @tc.name testMiscApi0023
     * @tc.desc Verify the QUAD verb name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0023 begin');
      await runCase('testMiscApi0023', async () => {
        const name: string = verbName(drawing.PathIteratorVerb.QUAD);
        expect(name).assertEqual('QUAD');
        expect(name === 'CONIC').assertFalse();
        expect(name.length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0024
     * @tc.name testMiscApi0024
     * @tc.desc Verify the CONIC verb name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0024 begin');
      await runCase('testMiscApi0024', async () => {
        const name: string = verbName(drawing.PathIteratorVerb.CONIC);
        expect(name).assertEqual('CONIC');
        expect(name === 'CUBIC').assertFalse();
        expect(name.length).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0025
     * @tc.name testMiscApi0025
     * @tc.desc Verify the CUBIC verb name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0025 begin');
      await runCase('testMiscApi0025', async () => {
        const name: string = verbName(drawing.PathIteratorVerb.CUBIC);
        expect(name).assertEqual('CUBIC');
        expect(name === 'CONIC').assertFalse();
        expect(name.length).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0026
     * @tc.name testMiscApi0026
     * @tc.desc Verify the CLOSE verb name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0026 begin');
      await runCase('testMiscApi0026', async () => {
        const name: string = verbName(drawing.PathIteratorVerb.CLOSE);
        expect(name).assertEqual('CLOSE');
        expect(name === 'DONE').assertFalse();
        expect(name.length).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0027
     * @tc.name testMiscApi0027
     * @tc.desc Verify the DONE verb name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0027 begin');
      await runCase('testMiscApi0027', async () => {
        const name: string = verbName(drawing.PathIteratorVerb.DONE);
        expect(name).assertEqual('DONE');
        expect(name === 'CLOSE').assertFalse();
        expect(name.length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0028
     * @tc.name testMiscApi0028
     * @tc.desc Verify a rectangle path ends with a CLOSE verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0028 begin');
      await runCase('testMiscApi0028', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 10, 10));
        const names: string[] = collectVerbs(path);
        const points: number[] = collectPoints(path);
        expect(names[0]).assertEqual('MOVE');
        expect(names[names.length - 1]).assertEqual('CLOSE');
        expect(names.length).assertEqual(points.length / 2 + 1);
        expect(countOf(names, 'LINE') >= 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0029
     * @tc.name testMiscApi0029
     * @tc.desc Verify an open line path reports exactly MOVE and LINE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0029 begin');
      await runCase('testMiscApi0029', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(5, 6);
        path.lineTo(15, 26);
        const names: string[] = collectVerbs(path);
        expect(names.length).assertEqual(2);
        expect(names[0]).assertEqual('MOVE');
        expect(names[1]).assertEqual('LINE');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0030
     * @tc.name testMiscApi0030
     * @tc.desc Verify the flat point array of a two point path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0030 begin');
      await runCase('testMiscApi0030', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(5, 6);
        path.lineTo(15, 26);
        const points: number[] = collectPoints(path);
        expect(points.length).assertEqual(4);
        expect(points[0]).assertEqual(5);
        expect(points[1]).assertEqual(6);
        expect(points[3]).assertEqual(26);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0031
     * @tc.name testMiscApi0031
     * @tc.desc Verify a rectangle path reports four flat points starting at the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0031 begin');
      await runCase('testMiscApi0031', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 10, 10));
        const points: number[] = collectPoints(path);
        expect(points.length).assertEqual(8);
        expect(points[0]).assertEqual(0);
        expect(points[1]).assertEqual(0);
        expect(points[2]).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0032
     * @tc.name testMiscApi0032
     * @tc.desc Verify the collectors agree with the path summary counts.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0032 begin');
      await runCase('testMiscApi0032', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(1, 2);
        path.lineTo(3, 4);
        const summary: PathSummary = summarize(path);
        expect(summary.verbCount).assertEqual(collectVerbs(path).length);
        expect(summary.pointCount * 2).assertEqual(collectPoints(path).length);
        expect(summary.isEmpty).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0033
     * @tc.name testMiscApi0033
     * @tc.desc Verify a straight path has no conic weights.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0033 begin');
      await runCase('testMiscApi0033', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(20, 0);
        const weights: number[] = collectConicWeights(path);
        expect(weights.length).assertEqual(0);
        expect(countOf(collectVerbs(path), 'CONIC')).assertEqual(0);
        expect(collectVerbs(path).length).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0034
     * @tc.name testMiscApi0034
     * @tc.desc Verify a circle path carries one weight per conic verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0034 begin');
      await runCase('testMiscApi0034', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(50, 50, 20);
        const weights: number[] = collectConicWeights(path);
        const conicCount: number = countOf(collectVerbs(path), 'CONIC');
        let sane: boolean = weights.length > 0;
        for (let index: number = 0; index < weights.length; index++) {
          sane = sane && weights[index] > 0 && weights[index] < 2;
        }
        expect(sane).assertTrue();
        expect(weights.length).assertEqual(conicCount);
        expect(collectVerbs(path)[0]).assertEqual('MOVE');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0035
     * @tc.name testMiscApi0035
     * @tc.desc Verify a circle path is a closed contour with curved verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0035 begin');
      await runCase('testMiscApi0035', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(50, 50, 20);
        const names: string[] = collectVerbs(path);
        expect(names[0]).assertEqual('MOVE');
        expect(names[names.length - 1]).assertEqual('CLOSE');
        expect(countOf(names, 'CONIC') + countOf(names, 'QUAD') > 0).assertTrue();
        expect(names.length > 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0036
     * @tc.name testMiscApi0036
     * @tc.desc Verify the iterator starts on the same verb as the verb collector.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0036 begin');
      await runCase('testMiscApi0036', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 40, 40));
        const iterated: string[] = iterateVerbs(path);
        const collected: string[] = collectVerbs(path);
        expect(iterated.length > 0).assertTrue();
        expect(iterated[0]).assertEqual(collected[0]);
        expect(iterated.length >= collected.length).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0037
     * @tc.name testMiscApi0037
     * @tc.desc Verify a quadratic path reports MOVE and QUAD.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0037 begin');
      await runCase('testMiscApi0037', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.quadTo(10, 20, 30, 0);
        const names: string[] = collectVerbs(path);
        expect(names.length).assertEqual(2);
        expect(names[0]).assertEqual('MOVE');
        expect(names[1]).assertEqual('QUAD');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0038
     * @tc.name testMiscApi0038
     * @tc.desc Verify a cubic path reports MOVE and CUBIC.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0038 begin');
      await runCase('testMiscApi0038', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.cubicTo(10, 20, 20, 20, 30, 0);
        const names: string[] = collectVerbs(path);
        expect(names.length).assertEqual(2);
        expect(names[0]).assertEqual('MOVE');
        expect(names[1]).assertEqual('CUBIC');
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0039
     * @tc.name testMiscApi0039
     * @tc.desc Verify a conic path reports MOVE, CONIC and one weight.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0039 begin');
      await runCase('testMiscApi0039', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.conicTo(10, 0, 20, 20, 0.5);
        const names: string[] = collectVerbs(path);
        expect(names.length).assertEqual(2);
        expect(names[1]).assertEqual('CONIC');
        expect(collectConicWeights(path).length).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0040
     * @tc.name testMiscApi0040
     * @tc.desc Verify closing a contour appends a CLOSE verb and marks the path closed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0040 begin');
      await runCase('testMiscApi0040', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(10, 0);
        path.close();
        const names: string[] = collectVerbs(path);
        expect(names.length).assertEqual(3);
        expect(names[2]).assertEqual('CLOSE');
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0041
     * @tc.name testMiscApi0041
     * @tc.desc Verify two contours report two MOVE verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0041 begin');
      await runCase('testMiscApi0041', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(10, 0);
        path.moveTo(0, 20);
        path.lineTo(10, 20);
        const names: string[] = collectVerbs(path);
        expect(names.length).assertEqual(4);
        expect(countOf(names, 'MOVE')).assertEqual(2);
        expect(countOf(names, 'LINE')).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0042
     * @tc.name testMiscApi0042
     * @tc.desc Verify a circle path is non empty, closed and has a positive length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0042 begin');
      await runCase('testMiscApi0042', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(50, 50, 20);
        const summary: PathSummary = summarize(path);
        expect(summary.isEmpty).assertFalse();
        expect(summary.isClosed).assertTrue();
        expect(summary.length > 100).assertTrue();
        expect(summary.left < summary.right).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0043
     * @tc.name testMiscApi0043
     * @tc.desc Verify variation arguments build a typeface with the system family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0043 begin');
      await runCase('testMiscApi0043', async () => {
        const base: drawing.Typeface = loadSystemTypeface();
        const varied: drawing.Typeface = base.makeFromCurrent(typefaceVariation());
        const family: string = varied.getFamilyName();
        expect(family.length > 0).assertTrue();
        expect(family).assertEqual(base.getFamilyName());
        expect(varied === base).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0044
     * @tc.name testMiscApi0044
     * @tc.desc Verify the helper built typeface keeps the system family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0044 begin');
      await runCase('testMiscApi0044', async () => {
        const family: string = makeTypefaceFromCurrent().getFamilyName();
        expect(family).assertEqual(loadSystemTypeface().getFamilyName());
        expect(family.length > 0).assertTrue();
        expect(family.length < 128).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0045
     * @tc.name testMiscApi0045
     * @tc.desc Verify empty arguments produce the same family as the system typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0045 begin');
      await runCase('testMiscApi0045', async () => {
        const empty: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        const built: drawing.Typeface = loadSystemTypeface().makeFromCurrent(empty);
        expect(built.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(built.getFamilyName().length > 0).assertTrue();
        expect(built.isBold()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0046
     * @tc.name testMiscApi0046
     * @tc.desc Verify the lowest weight axis value is accepted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0046 begin');
      await runCase('testMiscApi0046', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        let threw: boolean = false;
        try {
          args.addVariation('wght', 1);
        } catch (error) {
          threw = true;
        }
        expect(threw).assertFalse();
        const built: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(built.getFamilyName().length > 0).assertTrue();
        expect(built.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0047
     * @tc.name testMiscApi0047
     * @tc.desc Verify the highest weight axis value is accepted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0047 begin');
      await runCase('testMiscApi0047', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 1000);
        args.addVariation('wdth', 200);
        const built: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(built.getFamilyName().length > 0).assertTrue();
        expect(built.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(loadSystemTypeface().makeFromCurrent(args).getFamilyName()).assertEqual(built.getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0048
     * @tc.name testMiscApi0048
     * @tc.desc Verify two argument objects stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0048 begin');
      await runCase('testMiscApi0048', async () => {
        const first: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        const second: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        first.addVariation('wght', 300);
        const fromFirst: string = loadSystemTypeface().makeFromCurrent(first).getFamilyName();
        const fromSecond: string = loadSystemTypeface().makeFromCurrent(second).getFamilyName();
        expect(first === second).assertFalse();
        expect(fromSecond.length > 0).assertTrue();
        expect(fromFirst.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0049
     * @tc.name testMiscApi0049
     * @tc.desc Verify one argument object can drive two typeface builds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0049 begin');
      await runCase('testMiscApi0049', async () => {
        const args: drawing.TypefaceArguments = typefaceVariation();
        const built: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        const again: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(built.getFamilyName()).assertEqual(again.getFamilyName());
        expect(built.getFamilyName().length > 0).assertTrue();
        expect(built.isBold()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0050
     * @tc.name testMiscApi0050
     * @tc.desc Verify a regular weight variation is not bold.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0050 begin');
      await runCase('testMiscApi0050', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 400);
        const built: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(built.isBold()).assertFalse();
        expect(built.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(built.getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0051
     * @tc.name testMiscApi0051
     * @tc.desc Verify channel clamping at both limits.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0051 begin');
      await runCase('testMiscApi0051', async () => {
        expect(clampChannel(-5)).assertEqual(0);
        expect(clampChannel(0)).assertEqual(0);
        expect(clampChannel(300)).assertEqual(255);
        expect(clampChannel(255)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0052
     * @tc.name testMiscApi0052
     * @tc.desc Verify channel values are rounded.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0052 begin');
      await runCase('testMiscApi0052', async () => {
        expect(clampChannel(128.4)).assertEqual(128);
        expect(clampChannel(127.6)).assertEqual(128);
        expect(clampChannel(0.4)).assertEqual(0);
        expect(clampChannel(254.5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0053
     * @tc.name testMiscApi0053
     * @tc.desc Verify a NaN channel becomes zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMiscApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0053 begin');
      await runCase('testMiscApi0053', async () => {
        expect(clampChannel(NaN)).assertEqual(0);
        expect(clampChannel(-0.1)).assertEqual(0);
        expect(clampChannel(1000)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0054
     * @tc.name testMiscApi0054
     * @tc.desc Verify rgba clamps every channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0054 begin');
      await runCase('testMiscApi0054', async () => {
        const color: common2D.Color = rgba(300, -1, 128.6, 255);
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(0);
        expect(color.green).assertEqual(129);
        expect(color.blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0055
     * @tc.name testMiscApi0055
     * @tc.desc Verify rgba keeps the alpha first channel order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0055 begin');
      await runCase('testMiscApi0055', async () => {
        const color: common2D.Color = rgba(10, 20, 30, 40);
        expect(color.alpha).assertEqual(10);
        expect(color.red).assertEqual(20);
        expect(color.green).assertEqual(30);
        expect(color.blue).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0056
     * @tc.name testMiscApi0056
     * @tc.desc Verify an opaque black color packs to the high byte only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0056 begin');
      await runCase('testMiscApi0056', async () => {
        expect(toArgb(rgba(255, 0, 0, 0))).assertEqual(4278190080);
        expect(toArgb(rgba(255, 0, 0, 0)) > 0).assertTrue();
        expect(toArgb(rgba(254, 0, 0, 0))).assertEqual(4261412864);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0057
     * @tc.name testMiscApi0057
     * @tc.desc Verify opaque white packs to the maximum ARGB value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0057 begin');
      await runCase('testMiscApi0057', async () => {
        expect(toArgb(rgba(255, 255, 255, 255))).assertEqual(4294967295);
        expect(toArgb(rgba(255, 255, 0, 0))).assertEqual(4294901760);
        expect(toArgb(rgba(255, 255, 255, 255)) > toArgb(rgba(255, 255, 0, 0))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0058
     * @tc.name testMiscApi0058
     * @tc.desc Verify a fully transparent color packs to zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMiscApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0058 begin');
      await runCase('testMiscApi0058', async () => {
        expect(toArgb(rgba(0, 0, 0, 0))).assertEqual(0);
        expect(toArgb(rgba(128, 0, 0, 0))).assertEqual(2147483648);
        expect(toArgb(rgba(0, 255, 0, 0))).assertEqual(16711680);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0059
     * @tc.name testMiscApi0059
     * @tc.desc Verify the rectangle helper stores all four edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0059 begin');
      await runCase('testMiscApi0059', async () => {
        const rect: common2D.Rect = ltrb(1.5, 2, 30, 44);
        expect(rect.left).assertEqual(1.5);
        expect(rect.top).assertEqual(2);
        expect(rect.right).assertEqual(30);
        expect(rect.bottom).assertEqual(44);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_MISC_0060
     * @tc.name testMiscApi0060
     * @tc.desc Verify the pair helper keeps fractional and negative values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testMiscApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0060 begin');
      await runCase('testMiscApi0060', async () => {
        const pair: number[] = toPair(3.5, -2);
        expect(pair.length).assertEqual(2);
        expect(pair[0]).assertEqual(3.5);
        expect(pair[1]).assertEqual(-2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMiscApi0060 end');
    });
  });
}
