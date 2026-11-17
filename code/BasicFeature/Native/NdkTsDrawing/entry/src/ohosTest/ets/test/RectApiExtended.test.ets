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
  rectContainsPoint,
  rectCopy,
  rectInset,
  rectIsEmpty,
  rectIsEqual,
  rectOffset,
  rectOffsetTo,
  rectSetEmpty,
  rectSetLtrb,
  rectSetRect,
  rectSnapshot,
  rectSort
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

export default function rectApiExtendedTest() {
  describe('RectApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_RECT_0077
     * @tc.name testRectApi0077
     * @tc.desc Verify insetting shrinks every edge by the same delta.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0077 begin');
      await runCase('testRectApi0077', async () => {
        const shrunk: common2D.Rect = rectInset(makeRect(10, 10, 50, 50), 5);
        expect(edges(shrunk)).assertDeepEquals([15, 15, 45, 45]);
        expect(rectSnapshot(shrunk)[4]).assertEqual(30);
        expect(rectIsEmpty(shrunk)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0078
     * @tc.name testRectApi0078
     * @tc.desc Verify a zero inset leaves the rectangle unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0078 begin');
      await runCase('testRectApi0078', async () => {
        const source: common2D.Rect = makeRect(3, 4, 9, 12);
        const kept: common2D.Rect = rectInset(source, 0);
        expect(rectIsEqual(kept, source)).assertTrue();
        expect(rectIsEqual(kept, ltrb(3, 4, 9, 12))).assertTrue();
        expect(rectSnapshot(kept)[5]).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0079
     * @tc.name testRectApi0079
     * @tc.desc Verify a negative inset grows the rectangle on every side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0079 begin');
      await runCase('testRectApi0079', async () => {
        const grown: common2D.Rect = rectInset(makeRect(10, 10, 50, 50), -5);
        expect(grown.left).assertEqual(5);
        expect(grown.right).assertEqual(55);
        expect(rectSnapshot(grown)[4]).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0080
     * @tc.name testRectApi0080
     * @tc.desc Verify an oversized inset collapses the rectangle to empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0080 begin');
      await runCase('testRectApi0080', async () => {
        const collapsed: common2D.Rect = rectInset(makeRect(10, 10, 50, 50), 40);
        expect(rectIsEmpty(collapsed)).assertTrue();
        expect(collapsed.left).assertEqual(50);
        expect(collapsed.right).assertEqual(10);
        expect(rectSnapshot(collapsed)[4]).assertEqual(-40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0081
     * @tc.name testRectApi0081
     * @tc.desc Verify a fractional inset keeps fractional edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0081 begin');
      await runCase('testRectApi0081', async () => {
        const shrunk: common2D.Rect = rectInset(makeRect(10, 10, 50, 50), 0.5);
        expect(close(shrunk.left, 10.5, 0.0001)).assertTrue();
        expect(close(shrunk.bottom, 49.5, 0.0001)).assertTrue();
        expect(close(rectSnapshot(shrunk)[4], 39, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0082
     * @tc.name testRectApi0082
     * @tc.desc Verify insetting never mutates the source rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0082 begin');
      await runCase('testRectApi0082', async () => {
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        const shrunk: common2D.Rect = rectInset(source, 7);
        expect(source.left).assertEqual(10);
        expect(source.bottom).assertEqual(50);
        expect(shrunk.left).assertEqual(17);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0083
     * @tc.name testRectApi0083
     * @tc.desc Verify a unit square becomes empty after an inset of one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0083 begin');
      await runCase('testRectApi0083', async () => {
        const collapsed: common2D.Rect = rectInset(makeRect(0, 0, 1, 1), 1);
        expect(rectIsEmpty(collapsed)).assertTrue();
        expect(edges(collapsed)).assertDeepEquals([1, 1, 0, 0]);
        expect(rectContainsPoint(collapsed, 0, 0)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0084
     * @tc.name testRectApi0084
     * @tc.desc Verify three inset deltas each remove twice their width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0084 begin');
      await runCase('testRectApi0084', async () => {
        const deltas: number[] = [1, 4, 10];
        let matched: number = 0;
        for (let index: number = 0; index < deltas.length; index++) {
          const shrunk: common2D.Rect = rectInset(makeRect(0, 0, 40, 40), deltas[index]);
          if (rectSnapshot(shrunk)[4] === 40 - deltas[index] * 2) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(deltas.length).assertEqual(3);
        expect(rectSnapshot(rectInset(makeRect(0, 0, 40, 40), 10))[5]).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0085
     * @tc.name testRectApi0085
     * @tc.desc Verify a large inset keeps the geometry consistent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0085 begin');
      await runCase('testRectApi0085', async () => {
        const shrunk: common2D.Rect = rectInset(makeRect(0, 0, 1000000, 1000000), 100000);
        expect(shrunk.left).assertEqual(100000);
        expect(shrunk.right).assertEqual(900000);
        expect(rectSnapshot(shrunk)[4]).assertEqual(800000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0086
     * @tc.name testRectApi0086
     * @tc.desc Verify insetting a negative rectangle keeps its signed position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0086 begin');
      await runCase('testRectApi0086', async () => {
        const shrunk: common2D.Rect = rectInset(makeRect(-100, -100, 0, 0), 10);
        expect(shrunk.left).assertEqual(-90);
        expect(shrunk.top).assertEqual(-90);
        expect(rectSnapshot(shrunk)[4]).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0087
     * @tc.name testRectApi0087
     * @tc.desc Verify offsetting moves both axes without resizing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0087 begin');
      await runCase('testRectApi0087', async () => {
        const moved: common2D.Rect = rectOffset(makeRect(10, 10, 50, 50), 5, -5);
        expect(edges(moved)).assertDeepEquals([15, 5, 55, 45]);
        expect(rectSnapshot(moved)[4]).assertEqual(40);
        expect(rectSnapshot(moved)[6]).assertEqual(35);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0088
     * @tc.name testRectApi0088
     * @tc.desc Verify a zero offset leaves the rectangle identical.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0088 begin');
      await runCase('testRectApi0088', async () => {
        const kept: common2D.Rect = rectOffset(makeRect(10, 10, 50, 50), 0, 0);
        expect(rectIsEqual(kept, makeRect(10, 10, 50, 50))).assertTrue();
        expect(kept.top).assertEqual(10);
        expect(rectContainsPoint(kept, 10, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0089
     * @tc.name testRectApi0089
     * @tc.desc Verify a negative horizontal offset moves the rectangle left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0089 begin');
      await runCase('testRectApi0089', async () => {
        const moved: common2D.Rect = rectOffset(makeRect(10, 10, 50, 50), -5, 5);
        expect(moved.left).assertEqual(5);
        expect(moved.bottom).assertEqual(55);
        expect(rectIsEmpty(moved)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0090
     * @tc.name testRectApi0090
     * @tc.desc Verify a fractional offset preserves the width of the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0090 begin');
      await runCase('testRectApi0090', async () => {
        const moved: common2D.Rect = rectOffset(makeRect(10, 10, 50, 50), 2.5, 0);
        expect(close(moved.left, 12.5, 0.0001)).assertTrue();
        expect(close(moved.right, 52.5, 0.0001)).assertTrue();
        expect(close(rectSnapshot(moved)[4], 40, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0091
     * @tc.name testRectApi0091
     * @tc.desc Verify offsetting never mutates the source rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0091 begin');
      await runCase('testRectApi0091', async () => {
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        const moved: common2D.Rect = rectOffset(source, 100, 100);
        expect(source.right).assertEqual(50);
        expect(source.bottom).assertEqual(50);
        expect(moved.left).assertEqual(110);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0092
     * @tc.name testRectApi0092
     * @tc.desc Verify a large offset keeps the rectangle size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0092 begin');
      await runCase('testRectApi0092', async () => {
        const moved: common2D.Rect = rectOffset(makeRect(10, 10, 50, 50), 1000000, 0);
        expect(moved.left).assertEqual(1000010);
        expect(moved.right).assertEqual(1000050);
        expect(rectSnapshot(moved)[5]).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0093
     * @tc.name testRectApi0093
     * @tc.desc Verify three offsets all keep width and height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0093 begin');
      await runCase('testRectApi0093', async () => {
        const pairs: number[] = [1, -2, 7];
        let matched: number = 0;
        for (let index: number = 0; index < pairs.length; index++) {
          const moved: common2D.Rect = rectOffset(makeRect(0, 0, 30, 20), pairs[index], pairs[index]);
          const snapshot: number[] = rectSnapshot(moved);
          if (snapshot[4] === 30 && snapshot[5] === 20) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(pairs.length).assertEqual(3);
        expect(rectSnapshot(rectOffset(makeRect(0, 0, 30, 20), -2, -2))[1]).assertEqual(-2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0094
     * @tc.name testRectApi0094
     * @tc.desc Verify an empty rectangle stays empty after an offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0094 begin');
      await runCase('testRectApi0094', async () => {
        const moved: common2D.Rect = rectOffset(makeRect(5, 5, 5, 5), 10, 10);
        expect(rectIsEmpty(moved)).assertTrue();
        expect(edges(moved)).assertDeepEquals([15, 15, 15, 15]);
        expect(rectContainsPoint(moved, 15, 15)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0095
     * @tc.name testRectApi0095
     * @tc.desc Verify containment follows the offset rectangle bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0095 begin');
      await runCase('testRectApi0095', async () => {
        const moved: common2D.Rect = rectOffset(makeRect(10, 10, 20, 20), 5, 5);
        expect(rectContainsPoint(moved, 15, 15)).assertTrue();
        expect(rectContainsPoint(moved, 10, 10)).assertFalse();
        expect(rectContainsPoint(moved, 24, 24)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0096
     * @tc.name testRectApi0096
     * @tc.desc Verify two chained offsets equal one merged offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0096 begin');
      await runCase('testRectApi0096', async () => {
        const source: common2D.Rect = makeRect(10, 10, 20, 20);
        const chained: common2D.Rect = rectOffset(rectOffset(source, 3, 4), -1, 2);
        expect(rectIsEqual(chained, rectOffset(source, 2, 6))).assertTrue();
        expect(chained.left).assertEqual(12);
        expect(chained.top).assertEqual(16);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0097
     * @tc.name testRectApi0097
     * @tc.desc Verify offsetTo moves the origin while keeping the size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0097 begin');
      await runCase('testRectApi0097', async () => {
        const moved: common2D.Rect = rectOffsetTo(makeRect(10, 10, 50, 50), 0, 0);
        expect(edges(moved)).assertDeepEquals([0, 0, 40, 40]);
        expect(rectSnapshot(moved)[4]).assertEqual(40);
        expect(rectSnapshot(moved)[5]).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0098
     * @tc.name testRectApi0098
     * @tc.desc Verify offsetTo places the origin at the requested corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0098 begin');
      await runCase('testRectApi0098', async () => {
        const moved: common2D.Rect = rectOffsetTo(makeRect(10, 10, 50, 50), 100, 200);
        expect(moved.left).assertEqual(100);
        expect(moved.top).assertEqual(200);
        expect(rectSnapshot(moved)[6]).assertEqual(120);
        expect(rectSnapshot(moved)[7]).assertEqual(220);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0099
     * @tc.name testRectApi0099
     * @tc.desc Verify offsetTo never mutates the source rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0099 begin');
      await runCase('testRectApi0099', async () => {
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        rectOffsetTo(source, 0, 0);
        expect(source.left).assertEqual(10);
        expect(source.top).assertEqual(10);
        expect(rectIsEqual(source, ltrb(10, 10, 50, 50))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0100
     * @tc.name testRectApi0100
     * @tc.desc Verify offsetTo accepts a negative target origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0100 begin');
      await runCase('testRectApi0100', async () => {
        const moved: common2D.Rect = rectOffsetTo(makeRect(10, 10, 50, 50), -50, -50);
        expect(moved.left).assertEqual(-50);
        expect(moved.right).assertEqual(-10);
        expect(rectSnapshot(moved)[4]).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0101
     * @tc.name testRectApi0101
     * @tc.desc Verify offsetTo with a fractional target keeps the width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0101 begin');
      await runCase('testRectApi0101', async () => {
        const moved: common2D.Rect = rectOffsetTo(makeRect(10, 10, 50, 50), 0.5, 0.5);
        expect(close(moved.left, 0.5, 0.0001)).assertTrue();
        expect(close(moved.bottom, 40.5, 0.0001)).assertTrue();
        expect(close(rectSnapshot(moved)[4], 40, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0102
     * @tc.name testRectApi0102
     * @tc.desc Verify offsetTo on an empty rectangle stays empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0102 begin');
      await runCase('testRectApi0102', async () => {
        const moved: common2D.Rect = rectOffsetTo(makeRect(5, 5, 5, 5), 0, 0);
        expect(rectIsEmpty(moved)).assertTrue();
        expect(rectSnapshot(moved)[4]).assertEqual(0);
        expect(edges(moved)).assertDeepEquals([0, 0, 0, 0]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0103
     * @tc.name testRectApi0103
     * @tc.desc Verify offsetTo to the old left plus a delta equals a manual offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0103 begin');
      await runCase('testRectApi0103', async () => {
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        const movedTo: common2D.Rect = rectOffsetTo(source, 15, 15);
        const movedBy: common2D.Rect = rectOffset(source, 5, 5);
        expect(rectIsEqual(movedTo, movedBy)).assertTrue();
        expect(movedTo.left).assertEqual(15);
        expect(movedTo.bottom).assertEqual(55);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0104
     * @tc.name testRectApi0104
     * @tc.desc Verify three offsetTo targets all keep the source width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0104 begin');
      await runCase('testRectApi0104', async () => {
        const targets: number[] = [0, 50, -25];
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        let matched: number = 0;
        for (let index: number = 0; index < targets.length; index++) {
          const moved: common2D.Rect = rectOffsetTo(source, targets[index], targets[index]);
          if (rectSnapshot(moved)[4] === 40 && moved.left === targets[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(targets.length).assertEqual(3);
        expect(rectSnapshot(rectOffsetTo(source, -25, -25))[2]).assertEqual(15);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0105
     * @tc.name testRectApi0105
     * @tc.desc Verify a million scale target origin keeps the width intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0105 begin');
      await runCase('testRectApi0105', async () => {
        const moved: common2D.Rect = rectOffsetTo(makeRect(10, 10, 50, 50), 1000000, 0);
        expect(moved.left).assertEqual(1000000);
        expect(moved.right).assertEqual(1000040);
        expect(rectSnapshot(moved)[4]).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0106
     * @tc.name testRectApi0106
     * @tc.desc Verify containment follows the new origin after offsetTo.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0106 begin');
      await runCase('testRectApi0106', async () => {
        const moved: common2D.Rect = rectOffsetTo(makeRect(10, 10, 50, 50), 100, 100);
        expect(rectContainsPoint(moved, 100, 100)).assertTrue();
        expect(rectContainsPoint(moved, 50, 50)).assertFalse();
        expect(rectIsEmpty(moved)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0107
     * @tc.name testRectApi0107
     * @tc.desc Verify sorting a fully reversed rectangle restores the edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0107 begin');
      await runCase('testRectApi0107', async () => {
        const sorted: common2D.Rect = rectSort(makeRect(30, 40, 10, 20));
        expect(sorted.left).assertEqual(10);
        expect(sorted.top).assertEqual(20);
        expect(sorted.right).assertEqual(30);
        expect(sorted.bottom).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0108
     * @tc.name testRectApi0108
     * @tc.desc Verify sorting an already ordered rectangle leaves it unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0108 begin');
      await runCase('testRectApi0108', async () => {
        const source: common2D.Rect = makeRect(10, 20, 30, 40);
        const sorted: common2D.Rect = rectSort(source);
        expect(rectIsEqual(sorted, source)).assertTrue();
        expect(rectSnapshot(sorted)[4]).assertEqual(20);
        expect(rectIsEmpty(sorted)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0109
     * @tc.name testRectApi0109
     * @tc.desc Verify sorting a horizontally reversed rectangle only swaps x edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0109 begin');
      await runCase('testRectApi0109', async () => {
        const sorted: common2D.Rect = rectSort(makeRect(30, 20, 10, 40));
        expect(sorted.left).assertEqual(10);
        expect(sorted.right).assertEqual(30);
        expect(sorted.top).assertEqual(20);
        expect(sorted.bottom).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0110
     * @tc.name testRectApi0110
     * @tc.desc Verify sorting a vertically reversed rectangle only swaps y edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0110 begin');
      await runCase('testRectApi0110', async () => {
        const sorted: common2D.Rect = rectSort(makeRect(10, 40, 30, 20));
        expect(edges(sorted)).assertDeepEquals([10, 20, 30, 40]);
        expect(rectIsEqual(sorted, makeRect(10, 20, 30, 40))).assertTrue();
        expect(rectContainsPoint(sorted, 10, 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0111
     * @tc.name testRectApi0111
     * @tc.desc Verify a sorted reversed rectangle becomes measurable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0111 begin');
      await runCase('testRectApi0111', async () => {
        const raw: common2D.Rect = makeRect(20, 50, 0, 10);
        const sorted: common2D.Rect = rectSort(raw);
        expect(rectIsEmpty(sorted)).assertFalse();
        expect(rectSnapshot(sorted)[4]).assertEqual(20);
        expect(rectSnapshot(sorted)[5]).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0112
     * @tc.name testRectApi0112
     * @tc.desc Verify sorting never mutates the reversed source rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0112 begin');
      await runCase('testRectApi0112', async () => {
        const source: common2D.Rect = makeRect(30, 40, 10, 20);
        const sorted: common2D.Rect = rectSort(source);
        expect(source.left).assertEqual(30);
        expect(source.right).assertEqual(10);
        expect(sorted.left).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0113
     * @tc.name testRectApi0113
     * @tc.desc Verify sorting a reversed negative rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0113 begin');
      await runCase('testRectApi0113', async () => {
        const sorted: common2D.Rect = rectSort(makeRect(-10, -10, -30, -40));
        expect(sorted.left).assertEqual(-30);
        expect(sorted.top).assertEqual(-40);
        expect(rectSnapshot(sorted)[4]).assertEqual(20);
        expect(rectSnapshot(sorted)[5]).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0114
     * @tc.name testRectApi0114
     * @tc.desc Verify sorting fractional reversed edges keeps their precision.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0114 begin');
      await runCase('testRectApi0114', async () => {
        const sorted: common2D.Rect = rectSort(makeRect(4.5, 6.5, 2.5, 1.5));
        expect(sorted.left).assertEqual(2.5);
        expect(sorted.bottom).assertEqual(6.5);
        expect(close(rectSnapshot(sorted)[4], 2, 0.0001)).assertTrue();
        expect(close(rectSnapshot(sorted)[5], 5, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0115
     * @tc.name testRectApi0115
     * @tc.desc Verify three reversed rectangles all sort into non empty shapes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0115 begin');
      await runCase('testRectApi0115', async () => {
        const sources: common2D.Rect[] = [
          makeRect(20, 20, 5, 5),
          makeRect(9, 1, 3, 0),
          makeRect(100, 200, 50, 60)
        ];
        let matched: number = 0;
        for (let index: number = 0; index < sources.length; index++) {
          const sorted: common2D.Rect = rectSort(sources[index]);
          if (sorted.left <= sorted.right && sorted.top <= sorted.bottom && !rectIsEmpty(sorted)) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(sources.length).assertEqual(3);
        expect(rectSort(sources[0]).right).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0116
     * @tc.name testRectApi0116
     * @tc.desc Verify sorting a zero area rectangle leaves it empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0116 begin');
      await runCase('testRectApi0116', async () => {
        const sorted: common2D.Rect = rectSort(makeRect(10, 10, 10, 10));
        expect(rectIsEmpty(sorted)).assertTrue();
        expect(edges(sorted)).assertDeepEquals([10, 10, 10, 10]);
        expect(rectContainsPoint(sorted, 10, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0117
     * @tc.name testRectApi0117
     * @tc.desc Verify a copied rectangle equals the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testRectApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0117 begin');
      await runCase('testRectApi0117', async () => {
        const source: common2D.Rect = makeRect(1, 2, 30, 40);
        const copy: common2D.Rect = rectCopy(source);
        expect(rectIsEqual(copy, source)).assertTrue();
        expect(edges(copy)).assertDeepEquals([1, 2, 30, 40]);
        expect(rectIsEmpty(copy)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0118
     * @tc.name testRectApi0118
     * @tc.desc Verify a copied rectangle is independent from the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0118 begin');
      await runCase('testRectApi0118', async () => {
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        const copy: common2D.Rect = rectCopy(source);
        copy.left = 999;
        expect(source.left).assertEqual(10);
        expect(copy.left).assertEqual(999);
        expect(rectIsEqual(copy, source)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0119
     * @tc.name testRectApi0119
     * @tc.desc Verify copying an empty rectangle keeps every edge at zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0119 begin');
      await runCase('testRectApi0119', async () => {
        const copy: common2D.Rect = rectCopy(emptyRect());
        expect(rectIsEmpty(copy)).assertTrue();
        expect(edges(copy)).assertDeepEquals([0, 0, 0, 0]);
        expect(rectIsEqual(copy, emptyRect())).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0120
     * @tc.name testRectApi0120
     * @tc.desc Verify copying a fractional rectangle keeps its precision.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0120 begin');
      await runCase('testRectApi0120', async () => {
        const copy: common2D.Rect = rectCopy(makeRect(1.5, 2.5, 4.5, 6.5));
        expect(copy.left).assertEqual(1.5);
        expect(copy.bottom).assertEqual(6.5);
        expect(close(rectSnapshot(copy)[4], 3, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0121
     * @tc.name testRectApi0121
     * @tc.desc Verify two copies of the same rectangle stay separate objects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0121 begin');
      await runCase('testRectApi0121', async () => {
        const source: common2D.Rect = makeRect(3, 4, 5, 6);
        const first: common2D.Rect = rectCopy(source);
        const second: common2D.Rect = rectCopy(source);
        first.right = 0;
        expect(second.right).assertEqual(5);
        expect(rectIsEqual(first, second)).assertFalse();
        expect(rectIsEqual(second, source)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0122
     * @tc.name testRectApi0122
     * @tc.desc Verify a copy reports the same eight snapshot values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0122 begin');
      await runCase('testRectApi0122', async () => {
        const source: common2D.Rect = makeRect(8, 12, 20, 30);
        const copySnapshot: number[] = rectSnapshot(rectCopy(source));
        const sourceSnapshot: number[] = rectSnapshot(source);
        let matched: number = 0;
        for (let index: number = 0; index < copySnapshot.length; index++) {
          if (copySnapshot[index] === sourceSnapshot[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(8);
        expect(rectSnapshot(source)[7]).assertEqual(21);
        expect(copySnapshot.length).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0123
     * @tc.name testRectApi0123
     * @tc.desc Verify editing a copy right edge leaves the source untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0123 begin');
      await runCase('testRectApi0123', async () => {
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        const copy: common2D.Rect = rectCopy(source);
        copy.right = 90;
        expect(source.right).assertEqual(50);
        expect(rectSnapshot(source)[4]).assertEqual(40);
        expect(rectSnapshot(copy)[4]).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0124
     * @tc.name testRectApi0124
     * @tc.desc Verify copying a million scale rectangle keeps its size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0124 begin');
      await runCase('testRectApi0124', async () => {
        const copy: common2D.Rect = rectCopy(makeRect(0, 0, 1000000, 1000000));
        expect(copy.right).assertEqual(1000000);
        expect(rectSnapshot(copy)[5]).assertEqual(1000000);
        expect(rectIsEqual(copy, makeRect(0, 0, 1000000, 1000000))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0125
     * @tc.name testRectApi0125
     * @tc.desc Verify setRect overwrites the target edges with the source ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0125 begin');
      await runCase('testRectApi0125', async () => {
        const other: common2D.Rect = makeRect(5, 5, 20, 20);
        const updated: common2D.Rect = rectSetRect(makeRect(0, 0, 10, 10), other);
        expect(rectIsEqual(updated, other)).assertTrue();
        expect(edges(updated)).assertDeepEquals([5, 5, 20, 20]);
        expect(rectSnapshot(updated)[4]).assertEqual(15);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0126
     * @tc.name testRectApi0126
     * @tc.desc Verify setRect never mutates the target rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0126 begin');
      await runCase('testRectApi0126', async () => {
        const target: common2D.Rect = makeRect(0, 0, 10, 10);
        rectSetRect(target, makeRect(50, 50, 60, 60));
        expect(target.left).assertEqual(0);
        expect(target.right).assertEqual(10);
        expect(rectIsEqual(target, ltrb(0, 0, 10, 10))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0127
     * @tc.name testRectApi0127
     * @tc.desc Verify setRect from an empty rectangle yields an empty result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0127 begin');
      await runCase('testRectApi0127', async () => {
        const updated: common2D.Rect = rectSetRect(makeRect(0, 0, 10, 10), emptyRect());
        expect(rectIsEmpty(updated)).assertTrue();
        expect(edges(updated)).assertDeepEquals([0, 0, 0, 0]);
        expect(rectContainsPoint(updated, 0, 0)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0128
     * @tc.name testRectApi0128
     * @tc.desc Verify setRect with an identical rectangle keeps the geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0128 begin');
      await runCase('testRectApi0128', async () => {
        const target: common2D.Rect = makeRect(2, 3, 4, 5);
        const updated: common2D.Rect = rectSetRect(target, ltrb(2, 3, 4, 5));
        expect(rectIsEqual(updated, target)).assertTrue();
        expect(rectSnapshot(updated)[4]).assertEqual(2);
        expect(rectIsEmpty(updated)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0129
     * @tc.name testRectApi0129
     * @tc.desc Verify setRect copies fractional edges without rounding.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0129 begin');
      await runCase('testRectApi0129', async () => {
        const updated: common2D.Rect = rectSetRect(makeRect(0, 0, 1, 1), makeRect(1.5, 1.5, 4.5, 6.5));
        expect(updated.left).assertEqual(1.5);
        expect(close(rectSnapshot(updated)[4], 3, 0.0001)).assertTrue();
        expect(close(rectSnapshot(updated)[5], 5, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0130
     * @tc.name testRectApi0130
     * @tc.desc Verify setRect adopts a negative source rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0130 begin');
      await runCase('testRectApi0130', async () => {
        const updated: common2D.Rect = rectSetRect(makeRect(0, 0, 1, 1), makeRect(-10, -10, -5, -8));
        expect(updated.left).assertEqual(-10);
        expect(rectSnapshot(updated)[4]).assertEqual(5);
        expect(rectSnapshot(updated)[5]).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0131
     * @tc.name testRectApi0131
     * @tc.desc Verify containment after setRect follows the new bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0131 begin');
      await runCase('testRectApi0131', async () => {
        const updated: common2D.Rect = rectSetRect(makeRect(0, 0, 10, 10), makeRect(5, 5, 20, 20));
        expect(rectContainsPoint(updated, 10, 10)).assertTrue();
        expect(rectContainsPoint(updated, 0, 0)).assertFalse();
        expect(rectContainsPoint(updated, 19, 19)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0132
     * @tc.name testRectApi0132
     * @tc.desc Verify three setRect calls each return a copy equal to the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0132 begin');
      await runCase('testRectApi0132', async () => {
        const sources: common2D.Rect[] = [
          makeRect(1, 1, 2, 2),
          makeRect(-3, -3, 3, 3),
          makeRect(10, 20, 30, 40)
        ];
        let matched: number = 0;
        for (let index: number = 0; index < sources.length; index++) {
          const updated: common2D.Rect = rectSetRect(makeRect(0, 0, 100, 100), sources[index]);
          if (rectIsEqual(updated, sources[index])) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(sources.length).assertEqual(3);
        expect(rectSnapshot(rectSetRect(emptyRect(), sources[1]))[4]).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0133
     * @tc.name testRectApi0133
     * @tc.desc Verify setLtrb writes the four requested edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0133 begin');
      await runCase('testRectApi0133', async () => {
        const updated: common2D.Rect = rectSetLtrb(makeRect(0, 0, 10, 10), 5, 6, 7, 8);
        expect(edges(updated)).assertDeepEquals([5, 6, 7, 8]);
        expect(rectSnapshot(updated)[4]).assertEqual(2);
        expect(rectSnapshot(updated)[5]).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0134
     * @tc.name testRectApi0134
     * @tc.desc Verify setLtrb never mutates the target rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0134 begin');
      await runCase('testRectApi0134', async () => {
        const target: common2D.Rect = makeRect(0, 0, 10, 10);
        rectSetLtrb(target, 50, 50, 60, 60);
        expect(target.right).assertEqual(10);
        expect(target.bottom).assertEqual(10);
        expect(rectIsEqual(target, ltrb(0, 0, 10, 10))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0135
     * @tc.name testRectApi0135
     * @tc.desc Verify setLtrb accepts reversed edges and reports an empty rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0135 begin');
      await runCase('testRectApi0135', async () => {
        const updated: common2D.Rect = rectSetLtrb(makeRect(0, 0, 10, 10), 30, 40, 10, 20);
        expect(rectIsEmpty(updated)).assertTrue();
        expect(updated.left).assertEqual(30);
        expect(updated.right).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0136
     * @tc.name testRectApi0136
     * @tc.desc Verify setLtrb with a zero area keeps zero width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0136 begin');
      await runCase('testRectApi0136', async () => {
        const updated: common2D.Rect = rectSetLtrb(makeRect(0, 0, 10, 10), 5, 5, 5, 5);
        expect(rectSnapshot(updated)[4]).assertEqual(0);
        expect(rectIsEmpty(updated)).assertTrue();
        expect(rectContainsPoint(updated, 5, 5)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0136 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0137
     * @tc.name testRectApi0137
     * @tc.desc Verify setLtrb keeps fractional edges as given.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0137 begin');
      await runCase('testRectApi0137', async () => {
        const updated: common2D.Rect = rectSetLtrb(makeRect(0, 0, 1, 1), 1.5, 2.5, 4.5, 6.5);
        expect(close(updated.top, 2.5, 0.0001)).assertTrue();
        expect(close(rectSnapshot(updated)[4], 3, 0.0001)).assertTrue();
        expect(close(rectSnapshot(updated)[5], 4, 0.0001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0138
     * @tc.name testRectApi0138
     * @tc.desc Verify setLtrb on negative edges reports positive sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0138 begin');
      await runCase('testRectApi0138', async () => {
        const updated: common2D.Rect = rectSetLtrb(makeRect(0, 0, 1, 1), -10, -20, -2, -4);
        expect(rectSnapshot(updated)[4]).assertEqual(8);
        expect(rectSnapshot(updated)[5]).assertEqual(16);
        expect(updated.top).assertEqual(-20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0139
     * @tc.name testRectApi0139
     * @tc.desc Verify setLtrb output equals a freshly built rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0139 begin');
      await runCase('testRectApi0139', async () => {
        const updated: common2D.Rect = rectSetLtrb(makeRect(3, 3, 4, 4), 10, 11, 12, 13);
        expect(rectIsEqual(updated, makeRect(10, 11, 12, 13))).assertTrue();
        expect(rectIsEqual(updated, makeRect(10, 11, 12, 14))).assertFalse();
        expect(rectIsEmpty(updated)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0140
     * @tc.name testRectApi0140
     * @tc.desc Verify three setLtrb calls each land on the requested edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0140 begin');
      await runCase('testRectApi0140', async () => {
        const lefts: number[] = [0, -5, 100];
        const rightEdges: number[] = [10, 5, 200];
        let matched: number = 0;
        for (let index: number = 0; index < lefts.length; index++) {
          const updated: common2D.Rect = rectSetLtrb(emptyRect(), lefts[index], 0, rightEdges[index], 10);
          if (updated.left === lefts[index] && updated.right === rightEdges[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(lefts.length).assertEqual(rightEdges.length);
        expect(rectSnapshot(rectSetLtrb(emptyRect(), 0, 0, 10, 10))[4]).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0141
     * @tc.name testRectApi0141
     * @tc.desc Verify setEmpty clears all four edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0141 begin');
      await runCase('testRectApi0141', async () => {
        const cleared: common2D.Rect = rectSetEmpty(makeRect(10, 10, 50, 50));
        expect(edges(cleared)).assertDeepEquals([0, 0, 0, 0]);
        expect(rectIsEmpty(cleared)).assertTrue();
        expect(cleared.left).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0142
     * @tc.name testRectApi0142
     * @tc.desc Verify setEmpty never mutates the source rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0142 begin');
      await runCase('testRectApi0142', async () => {
        const source: common2D.Rect = makeRect(10, 10, 50, 50);
        rectSetEmpty(source);
        expect(source.left).assertEqual(10);
        expect(source.bottom).assertEqual(50);
        expect(rectIsEqual(source, ltrb(10, 10, 50, 50))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0143
     * @tc.name testRectApi0143
     * @tc.desc Verify setEmpty on an empty rectangle is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0143 begin');
      await runCase('testRectApi0143', async () => {
        const cleared: common2D.Rect = rectSetEmpty(emptyRect());
        expect(rectIsEmpty(cleared)).assertTrue();
        expect(rectIsEqual(cleared, emptyRect())).assertTrue();
        expect(rectContainsPoint(cleared, 0, 0)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0143 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0144
     * @tc.name testRectApi0144
     * @tc.desc Verify every snapshot edge of a cleared rectangle is zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0144 begin');
      await runCase('testRectApi0144', async () => {
        const snapshot: number[] = rectSnapshot(rectSetEmpty(makeRect(7, 8, 9, 10)));
        let zeroCount: number = 0;
        for (let index: number = 0; index < 4; index++) {
          if (snapshot[index] === 0) {
            zeroCount += 1;
          }
        }
        expect(zeroCount).assertEqual(4);
        expect(snapshot.length).assertEqual(8);
        expect(rectSnapshot(rectSetEmpty(makeRect(7, 8, 9, 10)))[6]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0145
     * @tc.name testRectApi0145
     * @tc.desc Verify setEmpty clears a negative rectangle completely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0145 begin');
      await runCase('testRectApi0145', async () => {
        const cleared: common2D.Rect = rectSetEmpty(makeRect(-100, -100, -20, -20));
        expect(rectIsEqual(cleared, emptyRect())).assertTrue();
        expect(rectContainsPoint(cleared, -50, -50)).assertFalse();
        expect(rectSnapshot(cleared)[5]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0146
     * @tc.name testRectApi0146
     * @tc.desc Verify a cleared rectangle reports zero size and zero center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0146 begin');
      await runCase('testRectApi0146', async () => {
        const snapshot: number[] = rectSnapshot(rectSetEmpty(makeRect(1, 2, 3, 4)));
        expect(snapshot[4]).assertEqual(0);
        expect(snapshot[5]).assertEqual(0);
        expect(snapshot[6]).assertEqual(0);
        expect(snapshot[7]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0147
     * @tc.name testRectApi0147
     * @tc.desc Verify the empty predicate covers zero width and zero height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0147 begin');
      await runCase('testRectApi0147', async () => {
        expect(rectIsEmpty(makeRect(0, 0, 10, 10))).assertFalse();
        expect(rectIsEmpty(makeRect(0, 0, 0, 10))).assertTrue();
        expect(rectIsEmpty(makeRect(0, 0, 10, 0))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0148
     * @tc.name testRectApi0148
     * @tc.desc Verify reversed and zero area rectangles are empty while a unit one is not.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0148 begin');
      await runCase('testRectApi0148', async () => {
        expect(rectIsEmpty(makeRect(30, 40, 10, 20))).assertTrue();
        expect(rectIsEmpty(makeRect(5, 5, 5, 5))).assertTrue();
        expect(rectIsEmpty(makeRect(5, 5, 5.001, 5))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0149
     * @tc.name testRectApi0149
     * @tc.desc Verify a sub unit height still counts as a valid rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0149 begin');
      await runCase('testRectApi0149', async () => {
        expect(rectIsEmpty(makeRect(1.5, 1.5, 1.5, 1.5))).assertTrue();
        expect(rectIsEmpty(makeRect(1.5, 1.5, 1.5, 1.5001))).assertTrue();
        expect(rectIsEmpty(makeRect(1.5, 1.5, 1.5, 1.4999))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0150
     * @tc.name testRectApi0150
     * @tc.desc Verify four rectangle shapes match their expected empty flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0150 begin');
      await runCase('testRectApi0150', async () => {
        const shapes: common2D.Rect[] = [
          makeRect(0, 0, 10, 10),
          makeRect(0, 0, 0, 10),
          makeRect(10, 10, 0, 0),
          makeRect(0, 0, 1, 1)
        ];
        const expected: boolean[] = [false, true, true, false];
        let matched: number = 0;
        for (let index: number = 0; index < shapes.length; index++) {
          if (rectIsEmpty(shapes[index]) === expected[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(shapes.length).assertEqual(expected.length);
        expect(rectIsEmpty(makeRect(1, 1, 0, 2))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0150 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0151
     * @tc.name testRectApi0151
     * @tc.desc Verify equality compares all four edges strictly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testRectApi0151', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0151 begin');
      await runCase('testRectApi0151', async () => {
        expect(rectIsEqual(makeRect(0, 0, 10, 10), ltrb(0, 0, 10, 10))).assertTrue();
        expect(rectIsEqual(makeRect(0, 0, 10, 10), makeRect(1, 0, 10, 10))).assertFalse();
        expect(rectIsEqual(makeRect(10, 10, 0, 0), ltrb(10, 10, 0, 0))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0151 end');
    });

    /** @tc.number SUB_NdkTsDrawing_RECT_0152
     * @tc.name testRectApi0152
     * @tc.desc Verify equality keeps fractional precision without a tolerance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testRectApi0152', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0152 begin');
      await runCase('testRectApi0152', async () => {
        expect(rectIsEqual(makeRect(1.5, 1.5, 2.5, 2.5), makeRect(1.5, 1.5, 2.5, 2.5))).assertTrue();
        expect(rectIsEqual(makeRect(1.5, 1.5, 2.5, 2.5), makeRect(1.5, 1.5, 2.5, 2.5000001))).assertTrue();
        expect(rectIsEqual(makeRect(0, 0, 0, 0), emptyRect())).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testRectApi0152 end');
    });
  });
}
