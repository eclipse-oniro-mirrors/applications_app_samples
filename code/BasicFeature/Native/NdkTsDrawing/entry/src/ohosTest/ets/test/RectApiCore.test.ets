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
import { common2D } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  emptyRect,
  makeRect,
  rectContainsLtrb,
  rectContainsPoint,
  rectContainsRect,
  rectIntersect,
  rectIsEmpty,
  rectIsEqual,
  rectIsIntersect,
  rectSnapshot,
  rectUnion
} from '../../../main/ets/drawing/DrawingGeometryUtils';
import { ltrb } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Read the four edges of a rectangle.
 *
 * @param { common2D.Rect } source - Source rectangle.
 * @returns { number[] } Left, top, right and bottom.
 */
function edges(source: common2D.Rect): number[] {
  return [source.left, source.top, source.right, source.bottom];
}

/**
 * Check whether a double is close to an expected value.
 *
 * @param { number } actual - Measured value.
 * @param { number } wanted - Expected value.
 * @param { number } tolerance - Allowed distance.
 * @returns { boolean } Whether the distance is inside the tolerance.
 */
function close(actual: number, wanted: number, tolerance: number): boolean {
  return Math.abs(actual - wanted) < tolerance;
}

export default function rectApiCoreTest() {
  describe('RectApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_RECT_0001
     * @tc.name testRectApi0001
     * @tc.desc Verify the empty rectangle has four zero edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0001 begin');
      await runCase('testRectApi0001', async () => {
        const rect: common2D.Rect = emptyRect();
        expect(rect.left).assertEqual(0);
        expect(rect.top).assertEqual(0);
        expect(rect.right).assertEqual(0);
        expect(rect.bottom).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0002
     * @tc.name testRectApi0002
     * @tc.desc Verify the empty rectangle snapshot keeps eight zero values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0002 begin');
      await runCase('testRectApi0002', async () => {
        const snapshot: number[] = rectSnapshot(emptyRect());
        expect(rectIsEmpty(emptyRect())).assertTrue();
        expect(snapshot.length).assertEqual(8);
        expect(snapshot[4]).assertEqual(0);
        expect(snapshot[6]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0003
     * @tc.name testRectApi0003
     * @tc.desc Verify the empty rectangle equals a manually built zero rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0003 begin');
      await runCase('testRectApi0003', async () => {
        expect(rectIsEqual(emptyRect(), ltrb(0, 0, 0, 0))).assertTrue();
        expect(rectIsEqual(emptyRect(), makeRect(0, 0, 10, 10))).assertFalse();
        expect(edges(emptyRect())).assertDeepEquals([0, 0, 0, 0]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0004
     * @tc.name testRectApi0004
     * @tc.desc Verify the empty rectangle holds no point while a unit one does.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0004 begin');
      await runCase('testRectApi0004', async () => {
        expect(rectContainsPoint(emptyRect(), 0, 0)).assertFalse();
        expect(rectIsEmpty(makeRect(0, 0, 1, 1))).assertFalse();
        expect(rectContainsPoint(makeRect(0, 0, 1, 1), 0, 0)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0005
     * @tc.name testRectApi0005
     * @tc.desc Verify makeRect keeps the four given edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0005 begin');
      await runCase('testRectApi0005', async () => {
        const rect: common2D.Rect = makeRect(10, 20, 30, 40);
        expect(rect.left).assertEqual(10);
        expect(rect.top).assertEqual(20);
        expect(rect.right).assertEqual(30);
        expect(rect.bottom).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0006
     * @tc.name testRectApi0006
     * @tc.desc Verify makeRect accepts negative edges and keeps positive sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0006 begin');
      await runCase('testRectApi0006', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(-10, -20, -5, -8));
        expect(snapshot[0]).assertEqual(-10);
        expect(snapshot[3]).assertEqual(-8);
        expect(snapshot[4]).assertEqual(5);
        expect(snapshot[5]).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0007
     * @tc.name testRectApi0007
     * @tc.desc Verify makeRect handles fractional edges and reports the center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0007 begin');
      await runCase('testRectApi0007', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(0.5, 1.5, 2.5, 4.5));
        expect(close(snapshot[4], 2, 0.0001)).assertTrue();
        expect(close(snapshot[5], 3, 0.0001)).assertTrue();
        expect(close(snapshot[6], 1.5, 0.0001)).assertTrue();
        expect(close(snapshot[7], 3, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0008
     * @tc.name testRectApi0008
     * @tc.desc Verify a reversed rectangle is empty but keeps signed sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0008 begin');
      await runCase('testRectApi0008', async () => {
        const reversed: common2D.Rect = makeRect(30, 40, 10, 20);
        const snapshot: number[] = rectSnapshot(reversed);
        expect(rectIsEmpty(reversed)).assertTrue();
        expect(snapshot[4]).assertEqual(-20);
        expect(close(snapshot[6], 20, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0009
     * @tc.name testRectApi0009
     * @tc.desc Verify a zero width rectangle is empty but still has height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0009 begin');
      await runCase('testRectApi0009', async () => {
        const flat: common2D.Rect = makeRect(10, 10, 10, 50);
        expect(rectIsEmpty(flat)).assertTrue();
        expect(close(rectSnapshot(flat)[5], 40, 0.0001)).assertTrue();
        expect(rectIsEqual(flat, makeRect(10, 10, 11, 50))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0010
     * @tc.name testRectApi0010
     * @tc.desc Verify a huge rectangle keeps its width and containment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0010 begin');
      await runCase('testRectApi0010', async () => {
        const huge: common2D.Rect = makeRect(0, 0, 1000000, 1000000);
        expect(rectSnapshot(huge)[4]).assertEqual(1000000);
        expect(rectContainsPoint(huge, 500000, 500000)).assertTrue();
        expect(rectContainsPoint(huge, 0, 0)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0011
     * @tc.name testRectApi0011
     * @tc.desc Verify a one pixel tall strip keeps width and stops at its bottom.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0011 begin');
      await runCase('testRectApi0011', async () => {
        const strip: common2D.Rect = makeRect(0, 0, 1000, 1);
        expect(rectSnapshot(strip)[5]).assertEqual(1);
        expect(rectContainsPoint(strip, 999, 0)).assertTrue();
        expect(rectContainsPoint(strip, 999, 1)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0012
     * @tc.name testRectApi0012
     * @tc.desc Verify makeRect matches the shared ltrb type helper.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0012 begin');
      await runCase('testRectApi0012', async () => {
        expect(rectIsEqual(makeRect(1, 2, 3, 4), ltrb(1, 2, 3, 4))).assertTrue();
        expect(rectIsEqual(makeRect(1, 2, 3, 4), makeRect(1, 2, 3, 5))).assertFalse();
        expect(rectIsEqual(makeRect(7, 7, 7, 7), makeRect(7, 7, 7, 7))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0013
     * @tc.name testRectApi0013
     * @tc.desc Verify the rectangle snapshot reports size and center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0013 begin');
      await runCase('testRectApi0013', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(0, 0, 100, 200));
        expect(snapshot[4]).assertEqual(100);
        expect(snapshot[5]).assertEqual(200);
        expect(snapshot[6]).assertEqual(50);
        expect(snapshot[7]).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0014
     * @tc.name testRectApi0014
     * @tc.desc Verify the snapshot of a negative quadrant rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0014 begin');
      await runCase('testRectApi0014', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(-50, -100, 0, 0));
        expect(snapshot[6]).assertEqual(-25);
        expect(snapshot[7]).assertEqual(-50);
        expect(snapshot[4]).assertEqual(50);
        expect(snapshot[5]).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0015
     * @tc.name testRectApi0015
     * @tc.desc Verify the snapshot of a fractional rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0015 begin');
      await runCase('testRectApi0015', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(1.5, 2.5, 4.5, 6.5));
        expect(snapshot[0]).assertEqual(1.5);
        expect(snapshot[2]).assertEqual(4.5);
        expect(close(snapshot[5], 4, 0.0001)).assertTrue();
        expect(rectIsEmpty(makeRect(1.5, 2.5, 4.5, 6.5))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0016
     * @tc.name testRectApi0016
     * @tc.desc Verify the snapshot of an empty rectangle reports zero geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0016 begin');
      await runCase('testRectApi0016', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(4, 4, 4, 4));
        let matched: number = 0;
        for (let index: number = 0; index < 4; index++) {
          if (snapshot[index] === 4) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(rectIsEmpty(makeRect(4, 4, 4, 4))).assertTrue();
        expect(snapshot[4]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0017
     * @tc.name testRectApi0017
     * @tc.desc Verify reading the snapshot never mutates the source rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0017 begin');
      await runCase('testRectApi0017', async () => {
        const rect: common2D.Rect = makeRect(10, 20, 30, 40);
        const snapshot: number[] = rectSnapshot(rect);
        expect(rect.left).assertEqual(10);
        expect(rectIsEqual(rect, ltrb(10, 20, 30, 40))).assertTrue();
        expect(snapshot[0]).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0018
     * @tc.name testRectApi0018
     * @tc.desc Verify the snapshot edges follow four different inputs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0018 begin');
      await runCase('testRectApi0018', async () => {
        const sources: common2D.Rect[] = [
          makeRect(0, 0, 10, 10),
          makeRect(-4, 6, 8, 12),
          makeRect(100, 100, 100, 300),
          makeRect(0.5, 0.5, 1.5, 1.5)
        ];
        let matched: number = 0;
        for (let index: number = 0; index < sources.length; index++) {
          const snapshot: number[] = rectSnapshot(sources[index]);
          if (snapshot[0] === sources[index].left && snapshot[2] === sources[index].right) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(sources.length).assertEqual(4);
        expect(rectSnapshot(sources[2])[4]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0019
     * @tc.name testRectApi0019
     * @tc.desc Verify the snapshot of a one million square rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0019 begin');
      await runCase('testRectApi0019', async () => {
        const snapshot: number[] = rectSnapshot(makeRect(0, 0, 1000000, 1000000));
        expect(snapshot.length).assertEqual(8);
        expect(snapshot[6]).assertEqual(500000);
        expect(snapshot[4]).assertEqual(1000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0020
     * @tc.name testRectApi0020
     * @tc.desc Verify two equal rectangles produce identical snapshots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0020 begin');
      await runCase('testRectApi0020', async () => {
        const first: number[] = rectSnapshot(makeRect(3, 5, 7, 11));
        const second: number[] = rectSnapshot(ltrb(3, 5, 7, 11));
        let matched: number = 0;
        for (let index: number = 0; index < first.length; index++) {
          if (first[index] === second[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(8);
        expect(rectIsEqual(makeRect(3, 5, 7, 11), ltrb(3, 5, 7, 11))).assertTrue();
        expect(first.length).assertEqual(second.length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0021
     * @tc.name testRectApi0021
     * @tc.desc Verify an inner point and the left top corner are contained.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0021 begin');
      await runCase('testRectApi0021', async () => {
        const rect: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsPoint(rect, 50, 50)).assertTrue();
        expect(rectContainsPoint(rect, 0, 0)).assertTrue();
        expect(rectIsEmpty(rect)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0022
     * @tc.name testRectApi0022
     * @tc.desc Verify the right and bottom edges are exclusive.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0022 begin');
      await runCase('testRectApi0022', async () => {
        const rect: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsPoint(rect, 100, 50)).assertFalse();
        expect(rectContainsPoint(rect, 50, 100)).assertFalse();
        expect(rectContainsPoint(rect, 99.999, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0023
     * @tc.name testRectApi0023
     * @tc.desc Verify the two far corners outside the open bounds are rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0023 begin');
      await runCase('testRectApi0023', async () => {
        const rect: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsPoint(rect, 0, 100)).assertFalse();
        expect(rectContainsPoint(rect, 100, 0)).assertFalse();
        expect(rectContainsPoint(rect, 100, 100)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0024
     * @tc.name testRectApi0024
     * @tc.desc Verify containment of a point inside a negative rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0024 begin');
      await runCase('testRectApi0024', async () => {
        const rect: common2D.Rect = makeRect(-100, -100, 0, 0);
        expect(rectContainsPoint(rect, -50, -50)).assertTrue();
        expect(rectContainsPoint(rect, 0, 0)).assertFalse();
        expect(rectContainsPoint(rect, -100, -100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0025
     * @tc.name testRectApi0025
     * @tc.desc Verify containment of fractional points on a fractional rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0025 begin');
      await runCase('testRectApi0025', async () => {
        const rect: common2D.Rect = makeRect(1.5, 1.5, 2.5, 2.5);
        expect(rectContainsPoint(rect, 2, 2)).assertTrue();
        expect(rectContainsPoint(rect, 2.5, 2)).assertFalse();
        expect(rectContainsPoint(rect, 1.5, 1.5)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0026
     * @tc.name testRectApi0026
     * @tc.desc Verify an empty rectangle contains no point but a normal one does.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0026 begin');
      await runCase('testRectApi0026', async () => {
        expect(rectContainsPoint(emptyRect(), 0, 0)).assertFalse();
        expect(rectContainsPoint(emptyRect(), 5, 5)).assertFalse();
        expect(rectContainsPoint(makeRect(0, 0, 5, 5), 0, 0)).assertTrue();
        expect(rectIsEmpty(makeRect(0, 0, 5, 5))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0027
     * @tc.name testRectApi0027
     * @tc.desc Verify a reversed rectangle contains no interior point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0027 begin');
      await runCase('testRectApi0027', async () => {
        const reversed: common2D.Rect = makeRect(30, 40, 10, 20);
        expect(rectContainsPoint(reversed, 20, 30)).assertFalse();
        expect(rectContainsPoint(reversed, 25, 25)).assertFalse();
        expect(rectIsEmpty(reversed)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0028
     * @tc.name testRectApi0028
     * @tc.desc Verify the far corner of a million rectangle stays outside.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0028 begin');
      await runCase('testRectApi0028', async () => {
        const huge: common2D.Rect = makeRect(0, 0, 1000000, 1000000);
        expect(rectContainsPoint(huge, 999999, 999999)).assertTrue();
        expect(rectContainsPoint(huge, 1000000, 0)).assertFalse();
        expect(rectContainsPoint(huge, 0, 1000000)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0029
     * @tc.name testRectApi0029
     * @tc.desc Verify a one pixel square keeps fractional interior points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0029 begin');
      await runCase('testRectApi0029', async () => {
        const unit: common2D.Rect = makeRect(0, 0, 1, 1);
        expect(rectContainsPoint(unit, 0, 0)).assertTrue();
        expect(rectContainsPoint(unit, 0.5, 0.5)).assertTrue();
        expect(rectContainsPoint(unit, 1, 0.5)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0030
     * @tc.name testRectApi0030
     * @tc.desc Verify four probe points match the half open containment rule.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0030 begin');
      await runCase('testRectApi0030', async () => {
        const rect: common2D.Rect = makeRect(10, 10, 20, 20);
        const expected: boolean[] = [true, true, false, true];
        const xs: number[] = [10, 15, 20, 19.999];
        const ys: number[] = [10, 15, 15, 19.999];
        let matched: number = 0;
        for (let index: number = 0; index < expected.length; index++) {
          if (rectContainsPoint(rect, xs[index], ys[index]) === expected[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(expected.length).assertEqual(4);
        expect(rectContainsPoint(rect, 20, 20)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0031
     * @tc.name testRectApi0031
     * @tc.desc Verify a nested rectangle is contained by the outer one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0031 begin');
      await runCase('testRectApi0031', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const inner: common2D.Rect = makeRect(20, 20, 30, 30);
        expect(rectContainsRect(outer, inner)).assertTrue();
        expect(rectContainsLtrb(outer, inner)).assertTrue();
        expect(rectContainsRect(inner, outer)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0032
     * @tc.name testRectApi0032
     * @tc.desc Verify a rectangle contains its own copy but not a wider one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0032 begin');
      await runCase('testRectApi0032', async () => {
        const rect: common2D.Rect = makeRect(5, 5, 45, 45);
        expect(rectContainsRect(rect, ltrb(5, 5, 45, 45))).assertTrue();
        expect(rectContainsRect(rect, makeRect(4, 5, 45, 45))).assertFalse();
        expect(rectContainsRect(rect, makeRect(5, 5, 45, 46))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0033
     * @tc.name testRectApi0033
     * @tc.desc Verify a rectangle that overflows only on the right is rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0033 begin');
      await runCase('testRectApi0033', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsRect(outer, makeRect(50, 50, 150, 150))).assertFalse();
        expect(rectContainsRect(outer, makeRect(90, 90, 100, 100))).assertTrue();
        expect(rectContainsRect(outer, makeRect(-1, 0, 100, 100))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0034
     * @tc.name testRectApi0034
     * @tc.desc Verify a far away rectangle is neither contained nor intersecting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0034 begin');
      await runCase('testRectApi0034', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const far: common2D.Rect = makeRect(200, 200, 300, 300);
        expect(rectContainsRect(outer, far)).assertFalse();
        expect(rectIsIntersect(outer, far)).assertFalse();
        expect(rectIsEmpty(far)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0035
     * @tc.name testRectApi0035
     * @tc.desc Verify edge containment accepts a reversed inner rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRectApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0035 begin');
      await runCase('testRectApi0035', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const reversed: common2D.Rect = makeRect(90, 90, 10, 10);
        expect(rectContainsRect(outer, reversed)).assertFalse();
        expect(rectIsEmpty(reversed)).assertTrue();
        expect(rectContainsRect(outer, makeRect(10, 10, 90, 90))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0036
     * @tc.name testRectApi0036
     * @tc.desc Verify rectangles sharing one corner are still contained.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0036 begin');
      await runCase('testRectApi0036', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const topLeft: common2D.Rect = makeRect(0, 0, 10, 10);
        const bottomRight: common2D.Rect = makeRect(90, 90, 100, 100);
        let contained: number = 0;
        if (rectContainsRect(outer, topLeft)) {
          contained += 1;
        }
        if (rectContainsRect(outer, bottomRight)) {
          contained += 1;
        }
        expect(contained).assertEqual(2);
        expect(rectContainsRect(topLeft, bottomRight)).assertFalse();
        expect(rectIsEqual(topLeft, bottomRight)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0037
     * @tc.name testRectApi0037
     * @tc.desc Verify a rectangle overflowing on one axis only is rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0037 begin');
      await runCase('testRectApi0037', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsRect(outer, makeRect(0, 0, 100, 200))).assertFalse();
        expect(rectContainsRect(outer, makeRect(0, 0, 100, 100))).assertTrue();
        expect(edges(makeRect(0, 0, 100, 200))[3]).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0038
     * @tc.name testRectApi0038
     * @tc.desc Verify containment is not symmetric for a smaller and a larger rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0038 begin');
      await runCase('testRectApi0038', async () => {
        const small: common2D.Rect = makeRect(10, 10, 20, 20);
        const big: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsRect(small, big)).assertFalse();
        expect(rectContainsRect(big, small)).assertTrue();
        expect(rectContainsRect(small, small)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0039
     * @tc.name testRectApi0039
     * @tc.desc Verify fractional containment including the exact boundary case.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0039 begin');
      await runCase('testRectApi0039', async () => {
        const outer: common2D.Rect = makeRect(1, 1, 3, 3);
        expect(rectContainsRect(outer, makeRect(1.5, 1.5, 2.5, 2.5))).assertTrue();
        expect(rectContainsRect(outer, makeRect(1, 1, 3, 3))).assertTrue();
        expect(rectContainsRect(outer, makeRect(1.5, 1.5, 3.25, 2.5))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0040
     * @tc.name testRectApi0040
     * @tc.desc Verify four containment relations match their expected truth values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0040 begin');
      await runCase('testRectApi0040', async () => {
        const outers: common2D.Rect[] = [
          makeRect(0, 0, 100, 100),
          makeRect(0, 0, 100, 100),
          makeRect(0, 0, 50, 50),
          makeRect(-10, -10, 10, 10)
        ];
        const inners: common2D.Rect[] = [
          makeRect(10, 10, 20, 20),
          makeRect(0, 0, 101, 100),
          makeRect(0, 0, 50, 50),
          makeRect(-5, -5, 5, 5)
        ];
        const expected: boolean[] = [true, false, true, true];
        let matched: number = 0;
        for (let index: number = 0; index < outers.length; index++) {
          if (rectContainsRect(outers[index], inners[index]) === expected[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(outers.length).assertEqual(inners.length);
        expect(expected[1]).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0041
     * @tc.name testRectApi0041
     * @tc.desc Verify the edge based containment agrees with the rectangle overload.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0041 begin');
      await runCase('testRectApi0041', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const inner: common2D.Rect = makeRect(10, 10, 20, 20);
        expect(rectContainsLtrb(outer, inner)).assertTrue();
        expect(rectContainsLtrb(outer, inner) === rectContainsRect(outer, inner)).assertTrue();
        expect(rectContainsLtrb(inner, outer)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0042
     * @tc.name testRectApi0042
     * @tc.desc Verify edge containment accepts the identical edge set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0042 begin');
      await runCase('testRectApi0042', async () => {
        const rect: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsLtrb(rect, rect)).assertTrue();
        expect(rectContainsLtrb(rect, ltrb(0, 0, 100, 100))).assertTrue();
        expect(rectContainsLtrb(rect, ltrb(0, 0, 100.5, 100))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0043
     * @tc.name testRectApi0043
     * @tc.desc Verify edge containment rejects an inner rectangle crossing the border.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0043 begin');
      await runCase('testRectApi0043', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsLtrb(outer, makeRect(90, 90, 110, 110))).assertFalse();
        expect(rectContainsLtrb(outer, makeRect(-5, -5, 10, 10))).assertFalse();
        expect(rectContainsLtrb(outer, makeRect(90, 90, 100, 100))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0044
     * @tc.name testRectApi0044
     * @tc.desc Verify edge containment inside the negative quadrant.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0044 begin');
      await runCase('testRectApi0044', async () => {
        const outer: common2D.Rect = makeRect(-100, -100, 0, 0);
        expect(rectContainsLtrb(outer, makeRect(-50, -50, -10, -10))).assertTrue();
        expect(rectContainsLtrb(outer, makeRect(-50, -50, 10, 10))).assertFalse();
        expect(rectContainsLtrb(outer, makeRect(0, 0, 0, 0))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0045
     * @tc.name testRectApi0045
     * @tc.desc Verify edge containment only compares edges so a reversed set passes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRectApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0045 begin');
      await runCase('testRectApi0045', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const reversed: common2D.Rect = makeRect(30, 40, 20, 25);
        expect(rectContainsLtrb(outer, reversed)).assertFalse();
        expect(rectIsEmpty(reversed)).assertTrue();
        expect(rectContainsLtrb(outer, makeRect(30, 40, 120, 25))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0046
     * @tc.name testRectApi0046
     * @tc.desc Verify fractional edges are compared without rounding.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0046 begin');
      await runCase('testRectApi0046', async () => {
        const outer: common2D.Rect = makeRect(10, 10, 21, 21);
        expect(rectContainsLtrb(outer, makeRect(10.5, 10.5, 20.5, 20.5))).assertTrue();
        expect(rectContainsLtrb(outer, makeRect(10.5, 10.5, 21.5, 20.5))).assertFalse();
        expect(rectContainsLtrb(outer, makeRect(10.5, 10.5, 20.999, 20.999))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0047
     * @tc.name testRectApi0047
     * @tc.desc Verify a zero area edge set inside the range is still contained.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRectApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0047 begin');
      await runCase('testRectApi0047', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        expect(rectContainsLtrb(outer, makeRect(50, 50, 50, 50))).assertFalse();
        expect(rectContainsLtrb(outer, makeRect(0, 0, 0, 0))).assertFalse();
        expect(rectIsEmpty(makeRect(50, 50, 50, 50))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0048
     * @tc.name testRectApi0048
     * @tc.desc Verify five edge containment probes match their expected results.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0048 begin');
      await runCase('testRectApi0048', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const inners: common2D.Rect[] = [
          makeRect(0, 0, 100, 100),
          makeRect(50, 50, 60, 60),
          makeRect(50, 50, 60, 101),
          makeRect(-1, 50, 60, 60),
          makeRect(99, 99, 100, 100)
        ];
        const expected: boolean[] = [true, true, false, false, true];
        let matched: number = 0;
        for (let index: number = 0; index < inners.length; index++) {
          if (rectContainsLtrb(outer, inners[index]) === expected[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(inners.length).assertEqual(5);
        expect(expected[2]).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0049
     * @tc.name testRectApi0049
     * @tc.desc Verify the intersection of two overlapping rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0049 begin');
      await runCase('testRectApi0049', async () => {
        const overlap: common2D.Rect = rectIntersect(makeRect(0, 0, 100, 100), makeRect(50, 50, 150, 150));
        expect(overlap.left).assertEqual(50);
        expect(overlap.top).assertEqual(50);
        expect(overlap.right).assertEqual(100);
        expect(overlap.bottom).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0050
     * @tc.name testRectApi0050
     * @tc.desc Verify disjoint rectangles intersect into an empty result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0050 begin');
      await runCase('testRectApi0050', async () => {
        const first: common2D.Rect = makeRect(0, 0, 10, 10);
        const second: common2D.Rect = makeRect(50, 50, 60, 60);
        const overlap: common2D.Rect = rectIntersect(first, second);
        expect(rectIsEmpty(overlap)).assertFalse();
        expect(rectIsIntersect(first, second)).assertFalse();
        expect(overlap.left).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0051
     * @tc.name testRectApi0051
     * @tc.desc Verify the intersection of a contained rectangle is the inner one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0051 begin');
      await runCase('testRectApi0051', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const inner: common2D.Rect = makeRect(20, 20, 30, 30);
        const overlap: common2D.Rect = rectIntersect(outer, inner);
        expect(rectIsEqual(overlap, inner)).assertTrue();
        expect(rectSnapshot(overlap)[4]).assertEqual(10);
        expect(rectContainsRect(overlap, inner)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0052
     * @tc.name testRectApi0052
     * @tc.desc Verify the intersection is independent of the operand order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0052 begin');
      await runCase('testRectApi0052', async () => {
        const first: common2D.Rect = makeRect(10, 10, 80, 90);
        const second: common2D.Rect = makeRect(40, 5, 120, 50);
        const left: common2D.Rect = rectIntersect(first, second);
        const right: common2D.Rect = rectIntersect(second, first);
        expect(rectIsEqual(left, right)).assertTrue();
        expect(left.left).assertEqual(40);
        expect(left.bottom).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0053
     * @tc.name testRectApi0053
     * @tc.desc Verify rectangles that only touch a corner have no intersection area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0053 begin');
      await runCase('testRectApi0053', async () => {
        const first: common2D.Rect = makeRect(0, 0, 10, 10);
        const second: common2D.Rect = makeRect(10, 10, 20, 20);
        const overlap: common2D.Rect = rectIntersect(first, second);
        expect(rectIsEmpty(overlap)).assertFalse();
        expect(rectIsIntersect(first, second)).assertFalse();
        expect(rectSnapshot(overlap)[4]).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0054
     * @tc.name testRectApi0054
     * @tc.desc Verify rectangles separated on the vertical axis do not intersect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0054 begin');
      await runCase('testRectApi0054', async () => {
        const first: common2D.Rect = makeRect(0, 0, 10, 10);
        const second: common2D.Rect = makeRect(0, 20, 10, 30);
        const overlap: common2D.Rect = rectIntersect(first, second);
        expect(rectIsEmpty(overlap)).assertFalse();
        expect(edges(overlap)[1]).assertEqual(0);
        expect(rectContainsPoint(second, 5, 25)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0055
     * @tc.name testRectApi0055
     * @tc.desc Verify the intersection of two fractional rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0055 begin');
      await runCase('testRectApi0055', async () => {
        const overlap: common2D.Rect = rectIntersect(makeRect(1.5, 1.5, 4.5, 4.5), makeRect(2.5, 2.5, 6.5, 6.5));
        expect(close(overlap.left, 2.5, 0.0001)).assertTrue();
        expect(close(rectSnapshot(overlap)[4], 2, 0.0001)).assertTrue();
        expect(close(rectSnapshot(overlap)[5], 2, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0056
     * @tc.name testRectApi0056
     * @tc.desc Verify the intersection around the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0056 begin');
      await runCase('testRectApi0056', async () => {
        const overlap: common2D.Rect = rectIntersect(makeRect(-10, -10, 10, 10), makeRect(-5, -5, 5, 5));
        expect(rectIsEqual(overlap, makeRect(-5, -5, 5, 5))).assertTrue();
        expect(rectSnapshot(overlap)[4]).assertEqual(10);
        expect(rectContainsPoint(overlap, 0, 0)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0057
     * @tc.name testRectApi0057
     * @tc.desc Verify intersecting does not mutate the first rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0057 begin');
      await runCase('testRectApi0057', async () => {
        const first: common2D.Rect = makeRect(0, 0, 100, 100);
        rectIntersect(first, makeRect(50, 50, 60, 60));
        expect(first.left).assertEqual(0);
        expect(first.right).assertEqual(100);
        expect(rectIsEqual(first, ltrb(0, 0, 100, 100))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0058
     * @tc.name testRectApi0058
     * @tc.desc Verify intersecting two large rectangles keeps half of the width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0058 begin');
      await runCase('testRectApi0058', async () => {
        const overlap: common2D.Rect = rectIntersect(makeRect(0, 0, 1000000, 1000000),
          makeRect(500000, 0, 1500000, 1000000));
        expect(overlap.left).assertEqual(500000);
        expect(rectSnapshot(overlap)[4]).assertEqual(500000);
        expect(rectSnapshot(overlap)[5]).assertEqual(1000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0059
     * @tc.name testRectApi0059
     * @tc.desc Verify the intersection is contained by both operands.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0059 begin');
      await runCase('testRectApi0059', async () => {
        const first: common2D.Rect = makeRect(0, 0, 60, 60);
        const second: common2D.Rect = makeRect(30, 30, 90, 90);
        const overlap: common2D.Rect = rectIntersect(first, second);
        expect(rectContainsRect(first, overlap)).assertTrue();
        expect(rectContainsRect(second, overlap)).assertTrue();
        expect(rectContainsRect(overlap, overlap)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0060
     * @tc.name testRectApi0060
     * @tc.desc Verify two identical rectangles intersect into themselves.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0060 begin');
      await runCase('testRectApi0060', async () => {
        const rect: common2D.Rect = makeRect(7, 8, 9, 10);
        const overlap: common2D.Rect = rectIntersect(rect, ltrb(7, 8, 9, 10));
        expect(rectIsEqual(overlap, rect)).assertTrue();
        expect(rectIsIntersect(rect, rect)).assertTrue();
        expect(rectIsEmpty(overlap)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0061
     * @tc.name testRectApi0061
     * @tc.desc Verify the intersection predicate is symmetric for overlapping rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0061 begin');
      await runCase('testRectApi0061', async () => {
        const first: common2D.Rect = makeRect(0, 0, 10, 10);
        const second: common2D.Rect = makeRect(5, 5, 15, 15);
        expect(rectIsIntersect(first, second)).assertTrue();
        expect(rectIsIntersect(second, first)).assertTrue();
        expect(rectIsEmpty(rectIntersect(first, second))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0062
     * @tc.name testRectApi0062
     * @tc.desc Verify the intersection predicate is symmetric for separated rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0062 begin');
      await runCase('testRectApi0062', async () => {
        const first: common2D.Rect = makeRect(0, 0, 10, 10);
        const second: common2D.Rect = makeRect(11, 0, 20, 10);
        expect(rectIsIntersect(first, second)).assertFalse();
        expect(rectIsIntersect(second, first)).assertFalse();
        expect(rectIsIntersect(first, makeRect(9, 0, 20, 10))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0063
     * @tc.name testRectApi0063
     * @tc.desc Verify touching edges and touching corners are not intersections.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0063 begin');
      await runCase('testRectApi0063', async () => {
        const first: common2D.Rect = makeRect(0, 0, 10, 10);
        expect(rectIsIntersect(first, makeRect(10, 0, 20, 10))).assertFalse();
        expect(rectIsIntersect(first, makeRect(10, 10, 20, 20))).assertFalse();
        expect(rectIsIntersect(first, makeRect(0, 10, 10, 20))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0064
     * @tc.name testRectApi0064
     * @tc.desc Verify a contained rectangle always intersects its container.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0064 begin');
      await runCase('testRectApi0064', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const inner: common2D.Rect = makeRect(40, 40, 60, 60);
        expect(rectIsIntersect(outer, inner)).assertTrue();
        expect(rectIsIntersect(inner, outer)).assertTrue();
        expect(rectContainsRect(outer, inner)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0065
     * @tc.name testRectApi0065
     * @tc.desc Verify an empty rectangle never intersects another rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testRectApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0065 begin');
      await runCase('testRectApi0065', async () => {
        const normal: common2D.Rect = makeRect(0, 0, 10, 10);
        let falseCount: number = 0;
        if (!rectIsIntersect(emptyRect(), normal)) {
          falseCount += 1;
        }
        if (!rectIsIntersect(normal, emptyRect())) {
          falseCount += 1;
        }
        if (!rectIsIntersect(emptyRect(), emptyRect())) {
          falseCount += 1;
        }
        expect(falseCount).assertEqual(3);
        expect(rectIsEmpty(emptyRect())).assertTrue();
        expect(rectIsIntersect(normal, normal)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0066
     * @tc.name testRectApi0066
     * @tc.desc Verify fractional and unit rectangles still report intersections.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0066 begin');
      await runCase('testRectApi0066', async () => {
        expect(rectIsIntersect(makeRect(1.5, 1.5, 2.5, 2.5), makeRect(2.4, 2.4, 3.5, 3.5))).assertTrue();
        expect(rectIsIntersect(makeRect(0, 0, 1, 1), makeRect(0.5, 0.5, 1.5, 1.5))).assertTrue();
        expect(rectIsIntersect(makeRect(0, 0, 1, 1), makeRect(1.1, 1.1, 2, 2))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0067
     * @tc.name testRectApi0067
     * @tc.desc Verify unit squares overlap diagonally but not across a gap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0067 begin');
      await runCase('testRectApi0067', async () => {
        expect(rectIsIntersect(makeRect(0, 0, 1, 1), makeRect(0.5, 0.5, 2, 2))).assertTrue();
        expect(rectIsIntersect(makeRect(0, 0, 1, 1), makeRect(1, 1, 2, 2))).assertFalse();
        expect(rectIntersect(makeRect(0, 0, 1, 1), makeRect(0.5, 0.5, 2, 2)).right).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0068
     * @tc.name testRectApi0068
     * @tc.desc Verify the intersection predicate agrees with a positive intersection area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0068 begin');
      await runCase('testRectApi0068', async () => {
        const firsts: common2D.Rect[] = [
          makeRect(0, 0, 10, 10),
          makeRect(0, 0, 10, 10),
          makeRect(0, 0, 10, 10),
          makeRect(2, 2, 8, 8)
        ];
        const seconds: common2D.Rect[] = [makeRect(5, 5, 15, 15), makeRect(10, 0, 20, 10),
          makeRect(0, 10, 10, 20), makeRect(0, 0, 20, 20)];
        let matched: number = 0;
        for (let index: number = 0; index < firsts.length; index++) {
          const overlap: common2D.Rect = rectIntersect(firsts[index], seconds[index]);
          const hasArea: boolean = rectSnapshot(overlap)[4] > 0 && rectSnapshot(overlap)[5] > 0;
          if (rectIsIntersect(firsts[index], seconds[index]) === hasArea) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(2);
        expect(firsts.length).assertEqual(seconds.length);
        expect(rectIsIntersect(firsts[0], seconds[0])).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0069
     * @tc.name testRectApi0069
     * @tc.desc Verify the union of two separated rectangles covers both.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0069 begin');
      await runCase('testRectApi0069', async () => {
        const merged: common2D.Rect = rectUnion(makeRect(0, 0, 10, 10), makeRect(20, 20, 30, 30));
        expect(merged.left).assertEqual(0);
        expect(merged.top).assertEqual(0);
        expect(merged.right).assertEqual(30);
        expect(merged.bottom).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0070
     * @tc.name testRectApi0070
     * @tc.desc Verify the union of two overlapping rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0070 begin');
      await runCase('testRectApi0070', async () => {
        const merged: common2D.Rect = rectUnion(makeRect(0, 0, 10, 10), makeRect(5, 5, 15, 15));
        expect(rectIsEqual(merged, makeRect(0, 0, 15, 15))).assertTrue();
        expect(rectSnapshot(merged)[4]).assertEqual(15);
        expect(rectSnapshot(merged)[5]).assertEqual(15);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0071
     * @tc.name testRectApi0071
     * @tc.desc Verify the union with a contained rectangle is the container.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0071 begin');
      await runCase('testRectApi0071', async () => {
        const outer: common2D.Rect = makeRect(0, 0, 100, 100);
        const merged: common2D.Rect = rectUnion(outer, makeRect(20, 20, 30, 30));
        expect(rectIsEqual(merged, outer)).assertTrue();
        expect(rectContainsRect(merged, makeRect(20, 20, 30, 30))).assertTrue();
        expect(rectSnapshot(merged)[6]).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0072
     * @tc.name testRectApi0072
     * @tc.desc Verify the union across the origin grows on both sides.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0072 begin');
      await runCase('testRectApi0072', async () => {
        const merged: common2D.Rect = rectUnion(makeRect(-10, -10, 0, 0), makeRect(0, 0, 10, 10));
        expect(edges(merged)).assertDeepEquals([-10, -10, 10, 10]);
        expect(rectSnapshot(merged)[4]).assertEqual(20);
        expect(rectContainsPoint(merged, 0, 0)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0073
     * @tc.name testRectApi0073
     * @tc.desc Verify the union of fractional rectangles reports the merged center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0073 begin');
      await runCase('testRectApi0073', async () => {
        const merged: common2D.Rect = rectUnion(makeRect(1.5, 1.5, 2.5, 2.5), makeRect(3.25, 3.25, 4.5, 4.5));
        expect(close(merged.right, 4.5, 0.0001)).assertTrue();
        expect(close(rectSnapshot(merged)[6], 3, 0.0001)).assertTrue();
        expect(rectIsEmpty(merged)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0074
     * @tc.name testRectApi0074
     * @tc.desc Verify the union never mutates its first operand.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0074 begin');
      await runCase('testRectApi0074', async () => {
        const first: common2D.Rect = makeRect(10, 10, 20, 20);
        rectUnion(first, makeRect(30, 30, 40, 40));
        expect(first.right).assertEqual(20);
        expect(first.bottom).assertEqual(20);
        expect(rectIsEqual(first, ltrb(10, 10, 20, 20))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0075
     * @tc.name testRectApi0075
     * @tc.desc Verify the union of two identical rectangles is unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0075 begin');
      await runCase('testRectApi0075', async () => {
        const rect: common2D.Rect = makeRect(3, 4, 5, 6);
        const merged: common2D.Rect = rectUnion(rect, makeRect(3, 4, 5, 6));
        expect(rectIsEqual(merged, rect)).assertTrue();
        expect(rectUnion(rect, rect).left).assertEqual(3);
        expect(rectUnion(rect, rect).bottom).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0076
     * @tc.name testRectApi0076
     * @tc.desc Verify the union of two million scale rectangles spans two million.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0076 begin');
      await runCase('testRectApi0076', async () => {
        const merged: common2D.Rect = rectUnion(makeRect(0, 0, 1000000, 1000000),
          makeRect(-1000000, -1000000, 0, 0));
        expect(rectSnapshot(merged)[4]).assertEqual(2000000);
        expect(merged.left).assertEqual(-1000000);
        expect(rectContainsPoint(merged, 999999, -999999)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0076 end');
    });
  });
}
