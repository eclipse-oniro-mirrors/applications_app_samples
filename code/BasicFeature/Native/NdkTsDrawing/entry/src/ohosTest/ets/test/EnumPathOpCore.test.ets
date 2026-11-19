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
import { common2D, drawing } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 160;
const AREA: number = SIZE * SIZE;
const BOX_AREA: number = 80 * 80;
const CIRCLE_AREA: number = 5027;

/**
 * Build an axis aligned rectangle path.
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
 * Build an axis aligned rectangle region.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { drawing.Region } Rectangle region.
 */
function rectRegion(left: number, top: number, right: number, bottom: number): drawing.Region {
  const region: drawing.Region = new drawing.Region();
  region.setRect(left, top, right, bottom);
  return region;
}

/**
 * Read the four bounds of a path into a fixed order array.
 *
 * @param { drawing.Path } path - Path under test.
 * @returns { number[] } Left, top, right and bottom.
 */
function boundsOf(path: drawing.Path): number[] {
  const rect: common2D.Rect = path.getBounds();
  return [rect.left, rect.top, rect.right, rect.bottom];
}

/**
 * Read the four bounds of a region into a fixed order array.
 *
 * @param { drawing.Region } region - Region under test.
 * @returns { number[] } Left, top, right and bottom.
 */
function boundsOfRegion(region: drawing.Region): number[] {
  const rect: common2D.Rect = region.getBounds();
  return [rect.left, rect.top, rect.right, rect.bottom];
}

/**
 * Count how many coordinate pairs are contained by a path.
 *
 * @param { drawing.Path } path - Path under test.
 * @param { number[] } coords - Flat list of x, y pairs.
 * @returns { number } Number of contained points.
 */
function countHits(path: drawing.Path, coords: number[]): number {
  let hits: number = 0;
  for (let i: number = 0; i < coords.length; i += 2) {
    if (path.contains(coords[i], coords[i + 1])) {
      hits++;
    }
  }
  return hits;
}

/**
 * Count how many coordinate pairs are contained by a region.
 *
 * @param { drawing.Region } region - Region under test.
 * @param { number[] } coords - Flat list of x, y pairs.
 * @returns { number } Number of contained points.
 */
function countRegionHits(region: drawing.Region, coords: number[]): number {
  let hits: number = 0;
  for (let i: number = 0; i < coords.length; i += 2) {
    if (region.isPointContained(coords[i], coords[i + 1])) {
      hits++;
    }
  }
  return hits;
}

/**
 * Read one alpha channel of a pixel in a square RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Alpha value of the pixel.
 */
function alphaAt(buffer: ArrayBuffer, x: number, y: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4 + 3];
}

/**
 * Clip a rectangle then paint the whole canvas red.
 *
 * @param { drawing.ClipOp } op - Clip operation under test.
 * @param { common2D.Rect } clip - Clip rectangle.
 * @param { boolean } antiAlias - Anti alias switch of the clip.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function clipRectBuffer(op: drawing.ClipOp, clip: common2D.Rect,
  antiAlias: boolean): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.clipRect(clip, op, antiAlias);
  target.canvas.drawColor(rgba(255, 0, 200, 0), drawing.BlendMode.SRC);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Clip a path then paint the whole canvas red.
 *
 * @param { drawing.ClipOp } op - Clip operation under test.
 * @param { drawing.Path } clip - Clip path.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function clipPathBuffer(op: drawing.ClipOp, clip: drawing.Path): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.clipPath(clip, op, true);
  target.canvas.drawColor(rgba(255, 0, 200, 0), drawing.BlendMode.SRC);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Clip a region then paint the whole canvas red.
 *
 * @param { drawing.ClipOp } op - Clip operation under test.
 * @param { drawing.Region } clip - Clip region.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function clipRegionBuffer(op: drawing.ClipOp, clip: drawing.Region): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.clipRegion(clip, op);
  target.canvas.drawColor(rgba(255, 0, 200, 0), drawing.BlendMode.SRC);
  return readPixelBuffer(target.pixelMap);
}

export default function enumPathOpCoreTest() {
  describe('EnumPathOpCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0088
     * @tc.name testEnumPathOp0088
     * @tc.desc Verify PathOp.DIFFERENCE keeps the bounds of the left operand.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0088 begin');
      await runCase('testEnumPathOp0088', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        const ok: boolean = base.op(rectPath(50, 50, 110, 110), drawing.PathOp.DIFFERENCE);
        const bounds: number[] = boundsOf(base);
        expect(ok).assertTrue();
        expect(bounds[2]).assertEqual(80);
        expect(countHits(base, [30, 30, 100, 100, 75, 75])).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0089
     * @tc.name testEnumPathOp0089
     * @tc.desc Verify PathOp.DIFFERENCE cuts an inner hole out of a big rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0089 begin');
      await runCase('testEnumPathOp0089', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        base.op(rectPath(30, 30, 70, 70), drawing.PathOp.DIFFERENCE);
        expect(base.contains(50, 50)).assertFalse();
        expect(base.contains(10, 10)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0090
     * @tc.name testEnumPathOp0090
     * @tc.desc Verify PathOp.DIFFERENCE with a disjoint path keeps the left operand.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0090 begin');
      await runCase('testEnumPathOp0090', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(100, 20, 160, 80), drawing.PathOp.DIFFERENCE);
        const bounds: number[] = boundsOf(base);
        expect(bounds[0]).assertEqual(20);
        expect(bounds[3]).assertEqual(80);
        expect(countHits(base, [30, 30, 120, 50])).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0091
     * @tc.name testEnumPathOp0091
     * @tc.desc Verify PathOp.DIFFERENCE with a covering path empties the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0091 begin');
      await runCase('testEnumPathOp0091', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(0, 0, 160, 160), drawing.PathOp.DIFFERENCE);
        expect(base.isEmpty()).assertTrue();
        expect(base.contains(50, 50)).assertFalse();
        expect(base.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0092
     * @tc.name testEnumPathOp0092
     * @tc.desc Verify PathOp.DIFFERENCE probe table on an L shaped result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0092 begin');
      await runCase('testEnumPathOp0092', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.DIFFERENCE);
        const probes: number[] = [25, 25, 25, 75, 75, 25, 75, 75, 60, 60, 100, 100];
        expect(countHits(base, probes)).assertEqual(3);
        expect(base.contains(75, 25)).assertTrue();
        expect(base.contains(60, 60)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0093
     * @tc.name testEnumPathOp0093
     * @tc.desc Verify two chained PathOp.DIFFERENCE calls carve two opposite quarters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0093 begin');
      await runCase('testEnumPathOp0093', async () => {
        const base: drawing.Path = rectPath(0, 0, 120, 120);
        base.op(rectPath(0, 0, 60, 60), drawing.PathOp.DIFFERENCE);
        base.op(rectPath(60, 60, 120, 120), drawing.PathOp.DIFFERENCE);
        expect(countHits(base, [30, 90, 90, 30, 30, 30, 90, 90])).assertEqual(2);
        expect(base.contains(30, 90)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0094
     * @tc.name testEnumPathOp0094
     * @tc.desc Verify PathOp.INTERSECT bounds equal the overlapping rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0094 begin');
      await runCase('testEnumPathOp0094', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        expect(base.op(rectPath(50, 50, 110, 110), drawing.PathOp.INTERSECT)).assertTrue();
        const bounds: number[] = boundsOf(base);
        expect(bounds[0]).assertEqual(50);
        expect(bounds[3]).assertEqual(80);
        expect(base.contains(60, 60)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0095
     * @tc.name testEnumPathOp0095
     * @tc.desc Verify PathOp.INTERSECT of two disjoint rectangles is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0095 begin');
      await runCase('testEnumPathOp0095', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(100, 100, 160, 160), drawing.PathOp.INTERSECT);
        expect(base.isEmpty()).assertTrue();
        expect(base.contains(50, 50)).assertFalse();
        expect(base.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0096
     * @tc.name testEnumPathOp0096
     * @tc.desc Verify PathOp.INTERSECT with a contained path yields the inner box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0096 begin');
      await runCase('testEnumPathOp0096', async () => {
        const base: drawing.Path = rectPath(20, 20, 100, 100);
        base.op(rectPath(40, 40, 60, 60), drawing.PathOp.INTERSECT);
        const bounds: number[] = boundsOf(base);
        expect(bounds[1]).assertEqual(40);
        expect(bounds[2]).assertEqual(60);
        expect(base.contains(25, 25)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0097
     * @tc.name testEnumPathOp0097
     * @tc.desc Verify PathOp.INTERSECT with a self copy keeps the original path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0097 begin');
      await runCase('testEnumPathOp0097', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        const length: number = base.getLength(false);
        base.op(new drawing.Path(base), drawing.PathOp.INTERSECT);
        expect(Math.abs(base.getLength(false) - length) < 1).assertTrue();
        expect(base.contains(30, 30)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0098
     * @tc.name testEnumPathOp0098
     * @tc.desc Verify PathOp.INTERSECT probe table on a quarter overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0098 begin');
      await runCase('testEnumPathOp0098', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.INTERSECT);
        const probes: number[] = [60, 60, 70, 70, 40, 40, 90, 90, 20, 50, 50, 20];
        expect(countHits(base, probes)).assertEqual(2);
        expect(base.contains(90, 90)).assertFalse();
        expect(base.getBounds().right).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0099
     * @tc.name testEnumPathOp0099
     * @tc.desc Verify a rectangle can be added after PathOp.INTERSECT.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0099 begin');
      await runCase('testEnumPathOp0099', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.INTERSECT);
        base.addRect(ltrb(0, 0, 10, 10));
        expect(base.contains(5, 5)).assertTrue();
        expect(base.contains(60, 60)).assertTrue();
        expect(boundsOf(base)[0]).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0100
     * @tc.name testEnumPathOp0100
     * @tc.desc Verify PathOp.UNION expands the bounds to cover both rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0100 begin');
      await runCase('testEnumPathOp0100', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.UNION);
        const bounds: number[] = boundsOf(base);
        expect(bounds[2]).assertEqual(110);
        expect(bounds[3]).assertEqual(110);
        expect(countHits(base, [25, 25, 105, 105])).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0101
     * @tc.name testEnumPathOp0101
     * @tc.desc Verify PathOp.UNION of two disjoint rectangles keeps the gap empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0101 begin');
      await runCase('testEnumPathOp0101', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(100, 20, 160, 80), drawing.PathOp.UNION);
        expect(base.contains(90, 50)).assertFalse();
        expect(base.contains(30, 50)).assertTrue();
        expect(base.contains(120, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0102
     * @tc.name testEnumPathOp0102
     * @tc.desc Verify PathOp.UNION with a contained path keeps the outer bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0102 begin');
      await runCase('testEnumPathOp0102', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        base.op(rectPath(20, 20, 60, 60), drawing.PathOp.UNION);
        const bounds: number[] = boundsOf(base);
        expect(bounds[0]).assertEqual(0);
        expect(bounds[2]).assertEqual(100);
        expect(countHits(base, [10, 10, 50, 50, 90, 90])).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0103
     * @tc.name testEnumPathOp0103
     * @tc.desc Verify three chained PathOp.UNION calls build one long bar.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0103 begin');
      await runCase('testEnumPathOp0103', async () => {
        const base: drawing.Path = rectPath(0, 0, 40, 40);
        base.op(rectPath(40, 0, 80, 40), drawing.PathOp.UNION);
        base.op(rectPath(80, 0, 120, 40), drawing.PathOp.UNION);
        expect(boundsOf(base)[2]).assertEqual(120);
        expect(base.contains(100, 20)).assertTrue();
        expect(base.contains(140, 20)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0104
     * @tc.name testEnumPathOp0104
     * @tc.desc Verify PathOp.UNION produces a longer outline than one rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0104 begin');
      await runCase('testEnumPathOp0104', async () => {
        const single: drawing.Path = rectPath(0, 0, 40, 40);
        const singleLength: number = single.getLength(false);
        single.op(rectPath(80, 0, 120, 40), drawing.PathOp.UNION);
        const unionLength: number = single.getLength(false);
        expect(unionLength).assertEqual(160);
        expect(unionLength < singleLength * 2).assertTrue();
        expect(single.contains(100, 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0105
     * @tc.name testEnumPathOp0105
     * @tc.desc Verify PathOp.UNION matches the addPath composition of the same boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0105 begin');
      await runCase('testEnumPathOp0105', async () => {
        const merged: drawing.Path = rectPath(20, 20, 80, 80);
        merged.op(rectPath(50, 50, 110, 110), drawing.PathOp.UNION);
        const added: drawing.Path = rectPath(20, 20, 80, 80);
        added.addPath(rectPath(50, 50, 110, 110));
        const probes: number[] = [25, 25, 105, 105, 60, 60, 90, 30];
        expect(countHits(merged, probes)).assertEqual(countHits(added, probes));
        expect(merged.contains(90, 30)).assertFalse();
        expect(boundsOf(merged)[2]).assertEqual(boundsOf(added)[2]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0106
     * @tc.name testEnumPathOp0106
     * @tc.desc Verify PathOp.XOR removes the overlap and keeps both outer tails.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0106 begin');
      await runCase('testEnumPathOp0106', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.XOR);
        expect(base.contains(60, 60)).assertFalse();
        expect(base.getBounds().left).assertEqual(20);
        expect(base.getLength(false) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0107
     * @tc.name testEnumPathOp0107
     * @tc.desc Verify PathOp.XOR of two disjoint rectangles keeps both boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0107 begin');
      await runCase('testEnumPathOp0107', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(100, 20, 160, 80), drawing.PathOp.XOR);
        expect(countHits(base, [30, 50, 120, 50])).assertEqual(2);
        expect(base.isEmpty()).assertFalse();
        expect(boundsOf(base)[2]).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0108
     * @tc.name testEnumPathOp0108
     * @tc.desc Verify PathOp.XOR with a contained path builds a ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0108 begin');
      await runCase('testEnumPathOp0108', async () => {
        const base: drawing.Path = rectPath(0, 0, 100, 100);
        base.op(rectPath(30, 30, 70, 70), drawing.PathOp.XOR);
        expect(base.contains(50, 50)).assertFalse();
        expect(countHits(base, [10, 10, 90, 90])).assertEqual(2);
        expect(base.getBounds().right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0109
     * @tc.name testEnumPathOp0109
     * @tc.desc Verify PathOp.XOR of a path with itself is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0109 begin');
      await runCase('testEnumPathOp0109', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(new drawing.Path(base), drawing.PathOp.XOR);
        expect(base.isEmpty()).assertTrue();
        expect(base.getLength(false)).assertEqual(0);
        expect(base.contains(30, 30)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0110
     * @tc.name testEnumPathOp0110
     * @tc.desc Verify PathOp.XOR probe table on two overlapping rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0110 begin');
      await runCase('testEnumPathOp0110', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.XOR);
        const probes: number[] = [30, 30, 60, 60, 100, 100, 45, 45, 90, 60];
        expect(countHits(base, probes)).assertEqual(4);
        expect(base.contains(45, 45)).assertTrue();
        expect(base.contains(90, 60)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0111
     * @tc.name testEnumPathOp0111
     * @tc.desc Verify a second PathOp.XOR restores the original rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0111 begin');
      await runCase('testEnumPathOp0111', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        const other: drawing.Path = rectPath(50, 50, 110, 110);
        base.op(other, drawing.PathOp.XOR);
        base.op(other, drawing.PathOp.XOR);
        expect(base.contains(30, 30)).assertTrue();
        expect(base.contains(100, 100)).assertFalse();
        expect(countHits(base, [30, 30, 60, 60, 100, 100])).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0112
     * @tc.name testEnumPathOp0112
     * @tc.desc Verify PathOp.REVERSE_DIFFERENCE keeps the right operand tail.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0112 begin');
      await runCase('testEnumPathOp0112', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.REVERSE_DIFFERENCE);
        expect(base.contains(100, 100)).assertTrue();
        expect(base.getBounds().left).assertEqual(50);
        expect(base.getLength(false) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0113
     * @tc.name testEnumPathOp0113
     * @tc.desc Verify PathOp.REVERSE_DIFFERENCE mirrors the swapped DIFFERENCE bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0113 begin');
      await runCase('testEnumPathOp0113', async () => {
        const forward: drawing.Path = rectPath(20, 20, 80, 80);
        forward.op(rectPath(50, 50, 110, 110), drawing.PathOp.REVERSE_DIFFERENCE);
        const mirrored: drawing.Path = rectPath(50, 50, 110, 110);
        mirrored.op(rectPath(20, 20, 80, 80), drawing.PathOp.DIFFERENCE);
        const forwardBounds: number[] = boundsOf(forward);
        const mirroredBounds: number[] = boundsOf(mirrored);
        expect(forwardBounds[0]).assertEqual(mirroredBounds[0]);
        expect(forwardBounds[3]).assertEqual(mirroredBounds[3]);
        expect(forward.contains(100, 100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0114
     * @tc.name testEnumPathOp0114
     * @tc.desc Verify PathOp.REVERSE_DIFFERENCE with a bigger right operand builds a ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0114 begin');
      await runCase('testEnumPathOp0114', async () => {
        const small: drawing.Path = rectPath(40, 40, 60, 60);
        small.op(rectPath(20, 20, 80, 80), drawing.PathOp.REVERSE_DIFFERENCE);
        expect(small.contains(50, 50)).assertFalse();
        expect(small.contains(25, 25)).assertTrue();
        expect(small.contains(75, 75)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0115
     * @tc.name testEnumPathOp0115
     * @tc.desc Verify PathOp.REVERSE_DIFFERENCE with a contained right operand is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0115 begin');
      await runCase('testEnumPathOp0115', async () => {
        const base: drawing.Path = rectPath(0, 0, 120, 120);
        base.op(rectPath(20, 20, 80, 80), drawing.PathOp.REVERSE_DIFFERENCE);
        expect(base.isEmpty()).assertTrue();
        expect(base.contains(30, 30)).assertFalse();
        expect(base.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0116
     * @tc.name testEnumPathOp0116
     * @tc.desc Verify PathOp.REVERSE_DIFFERENCE with a disjoint operand keeps the right box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0116 begin');
      await runCase('testEnumPathOp0116', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(100, 20, 160, 80), drawing.PathOp.REVERSE_DIFFERENCE);
        expect(base.contains(120, 50)).assertTrue();
        expect(countHits(base, [30, 30, 120, 50])).assertEqual(1);
        expect(boundsOf(base)[2]).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0117
     * @tc.name testEnumPathOp0117
     * @tc.desc Verify PathOp.REVERSE_DIFFERENCE probe table on the right tail.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0117 begin');
      await runCase('testEnumPathOp0117', async () => {
        const base: drawing.Path = rectPath(20, 20, 80, 80);
        base.op(rectPath(50, 50, 110, 110), drawing.PathOp.REVERSE_DIFFERENCE);
        const probes: number[] = [30, 30, 60, 60, 100, 100, 90, 60, 70, 70, 40, 40];
        expect(countHits(base, probes)).assertEqual(2);
        expect(base.contains(90, 60)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0118
     * @tc.name testEnumPathOp0118
     * @tc.desc Verify RegionOp.UNION merges adjacent boxes into a plain rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0118 begin');
      await runCase('testEnumPathOp0118', async () => {
        const base: drawing.Region = rectRegion(0, 0, 40, 40);
        base.op(rectRegion(40, 0, 80, 40), drawing.RegionOp.UNION);
        expect(base.isRect()).assertTrue();
        expect(base.isComplex()).assertFalse();
        expect(base.isPointContained(60, 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0119
     * @tc.name testEnumPathOp0119
     * @tc.desc Verify RegionOp.UNION of two disjoint boxes keeps the gap empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0119 begin');
      await runCase('testEnumPathOp0119', async () => {
        const base: drawing.Region = rectRegion(0, 0, 40, 40);
        base.op(rectRegion(100, 0, 140, 40), drawing.RegionOp.UNION);
        expect(base.isPointContained(120, 20)).assertTrue();
        expect(base.isPointContained(60, 20)).assertFalse();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0120
     * @tc.name testEnumPathOp0120
     * @tc.desc Verify RegionOp.UNION with a contained region keeps the outer bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0120 begin');
      await runCase('testEnumPathOp0120', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(20, 20, 60, 60), drawing.RegionOp.UNION);
        const bounds: number[] = boundsOfRegion(base);
        expect(bounds[3]).assertEqual(100);
        expect(countRegionHits(base, [10, 10, 50, 50, 90, 90])).assertEqual(3);
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0121
     * @tc.name testEnumPathOp0121
     * @tc.desc Verify three chained RegionOp.UNION calls extend one horizontal band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0121 begin');
      await runCase('testEnumPathOp0121', async () => {
        const base: drawing.Region = rectRegion(0, 0, 40, 40);
        base.op(rectRegion(40, 0, 80, 40), drawing.RegionOp.UNION);
        base.op(rectRegion(80, 0, 120, 40), drawing.RegionOp.UNION);
        expect(boundsOfRegion(base)[2]).assertEqual(120);
        expect(base.isPointContained(100, 20)).assertTrue();
        expect(base.isComplex()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0122
     * @tc.name testEnumPathOp0122
     * @tc.desc Verify RegionOp.UNION grows the bounds on both axes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0122 begin');
      await runCase('testEnumPathOp0122', async () => {
        const base: drawing.Region = rectRegion(10, 10, 60, 60);
        base.op(rectRegion(100, 20, 140, 90), drawing.RegionOp.UNION);
        const bounds: number[] = boundsOfRegion(base);
        expect(bounds[0]).assertEqual(10);
        expect(bounds[2]).assertEqual(140);
        expect(bounds[3]).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0123
     * @tc.name testEnumPathOp0123
     * @tc.desc Verify RegionOp.INTERSECT keeps only the overlapping block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0123 begin');
      await runCase('testEnumPathOp0123', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(50, 50, 150, 150), drawing.RegionOp.INTERSECT);
        expect(base.isPointContained(60, 60)).assertTrue();
        expect(base.isPointContained(20, 20)).assertFalse();
        expect(boundsOfRegion(base)[2]).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0124
     * @tc.name testEnumPathOp0124
     * @tc.desc Verify RegionOp.INTERSECT of two disjoint regions is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0124 begin');
      await runCase('testEnumPathOp0124', async () => {
        const base: drawing.Region = rectRegion(0, 0, 40, 40);
        base.op(rectRegion(100, 100, 140, 140), drawing.RegionOp.INTERSECT);
        expect(base.isEmpty()).assertTrue();
        expect(base.isPointContained(20, 20)).assertFalse();
        expect(base.quickReject(0, 0, 40, 40)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0125
     * @tc.name testEnumPathOp0125
     * @tc.desc Verify RegionOp.INTERSECT with a contained region yields the inner box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0125 begin');
      await runCase('testEnumPathOp0125', async () => {
        const base: drawing.Region = rectRegion(0, 0, 120, 120);
        base.op(rectRegion(40, 40, 60, 60), drawing.RegionOp.INTERSECT);
        expect(base.isEqual(rectRegion(40, 40, 60, 60))).assertTrue();
        expect(base.isPointContained(50, 50)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0126
     * @tc.name testEnumPathOp0126
     * @tc.desc Verify two chained RegionOp.INTERSECT calls shrink the bounds twice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0126 begin');
      await runCase('testEnumPathOp0126', async () => {
        const base: drawing.Region = rectRegion(0, 0, 120, 120);
        base.op(rectRegion(20, 20, 100, 100), drawing.RegionOp.INTERSECT);
        base.op(rectRegion(30, 30, 70, 70), drawing.RegionOp.INTERSECT);
        const bounds: number[] = boundsOfRegion(base);
        expect(bounds[0]).assertEqual(30);
        expect(bounds[2]).assertEqual(70);
        expect(base.isPointContained(50, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0127
     * @tc.name testEnumPathOp0127
     * @tc.desc Verify RegionOp.INTERSECT probe table on a quarter overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0127 begin');
      await runCase('testEnumPathOp0127', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(50, 50, 150, 150), drawing.RegionOp.INTERSECT);
        const probes: number[] = [60, 60, 90, 90, 20, 20, 120, 120, 40, 60];
        expect(countRegionHits(base, probes)).assertEqual(2);
        expect(base.isPointContained(90, 90)).assertTrue();
        expect(base.isPointContained(120, 120)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0128
     * @tc.name testEnumPathOp0128
     * @tc.desc Verify RegionOp.DIFFERENCE removes the overlapping half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0128 begin');
      await runCase('testEnumPathOp0128', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(50, 0, 150, 100), drawing.RegionOp.DIFFERENCE);
        expect(base.isPointContained(25, 50)).assertTrue();
        expect(base.isPointContained(75, 50)).assertFalse();
        expect(boundsOfRegion(base)[2]).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0129
     * @tc.name testEnumPathOp0129
     * @tc.desc Verify RegionOp.DIFFERENCE cuts a complex hole in the middle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0129 begin');
      await runCase('testEnumPathOp0129', async () => {
        const base: drawing.Region = rectRegion(0, 0, 120, 120);
        base.op(rectRegion(40, 40, 80, 80), drawing.RegionOp.DIFFERENCE);
        expect(base.isPointContained(60, 60)).assertFalse();
        expect(base.isPointContained(20, 20)).assertTrue();
        expect(base.isComplex()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0130
     * @tc.name testEnumPathOp0130
     * @tc.desc Verify RegionOp.DIFFERENCE of a region with itself is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0130 begin');
      await runCase('testEnumPathOp0130', async () => {
        const base: drawing.Region = rectRegion(20, 20, 80, 80);
        base.op(new drawing.Region(base), drawing.RegionOp.DIFFERENCE);
        expect(base.isEmpty()).assertTrue();
        expect(base.isPointContained(30, 30)).assertFalse();
        expect(base.quickReject(20, 20, 80, 80)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0131
     * @tc.name testEnumPathOp0131
     * @tc.desc Verify RegionOp.DIFFERENCE with an unrelated region changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0131 begin');
      await runCase('testEnumPathOp0131', async () => {
        const base: drawing.Region = rectRegion(0, 0, 40, 40);
        base.op(rectRegion(100, 100, 140, 140), drawing.RegionOp.DIFFERENCE);
        expect(base.isEqual(rectRegion(0, 0, 40, 40))).assertTrue();
        expect(base.isPointContained(10, 10)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0132
     * @tc.name testEnumPathOp0132
     * @tc.desc Verify RegionOp.DIFFERENCE probe table around a middle hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0132 begin');
      await runCase('testEnumPathOp0132', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(30, 30, 70, 70), drawing.RegionOp.DIFFERENCE);
        const probes: number[] = [10, 10, 50, 50, 90, 90, 40, 60, 80, 20, 20, 80];
        expect(countRegionHits(base, probes)).assertEqual(4);
        expect(base.isPointContained(50, 50)).assertFalse();
        expect(base.isPointContained(90, 90)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0133
     * @tc.name testEnumPathOp0133
     * @tc.desc Verify RegionOp.XOR keeps the two outer tails of an overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0133 begin');
      await runCase('testEnumPathOp0133', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(60, 0, 160, 100), drawing.RegionOp.XOR);
        expect(base.isPointContained(25, 50)).assertTrue();
        expect(base.isPointContained(80, 50)).assertFalse();
        expect(base.isPointContained(120, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0134
     * @tc.name testEnumPathOp0134
     * @tc.desc Verify RegionOp.XOR of two disjoint regions keeps both boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0134 begin');
      await runCase('testEnumPathOp0134', async () => {
        const base: drawing.Region = rectRegion(0, 0, 40, 40);
        base.op(rectRegion(100, 0, 140, 40), drawing.RegionOp.XOR);
        expect(base.isPointContained(20, 20)).assertTrue();
        expect(base.isPointContained(120, 20)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0135
     * @tc.name testEnumPathOp0135
     * @tc.desc Verify RegionOp.XOR of a region with itself is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0135 begin');
      await runCase('testEnumPathOp0135', async () => {
        const base: drawing.Region = rectRegion(10, 10, 90, 90);
        base.op(new drawing.Region(base), drawing.RegionOp.XOR);
        expect(base.isEmpty()).assertTrue();
        expect(countRegionHits(base, [50, 50, 20, 20, 80, 80])).assertEqual(0);
        expect(base.isPointContained(80, 80)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0136
     * @tc.name testEnumPathOp0136
     * @tc.desc Verify a second RegionOp.XOR restores the original region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0136 begin');
      await runCase('testEnumPathOp0136', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        const original: drawing.Region = new drawing.Region(base);
        const other: drawing.Region = rectRegion(60, 0, 160, 100);
        base.op(other, drawing.RegionOp.XOR);
        base.op(new drawing.Region(rectRegion(60, 0, 160, 100)), drawing.RegionOp.XOR);
        expect(base.isEqual(original)).assertTrue();
        expect(base.isPointContained(80, 50)).assertTrue();
        expect(base.isPointContained(140, 50)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0136 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0137
     * @tc.name testEnumPathOp0137
     * @tc.desc Verify RegionOp.XOR probe table on a partial overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0137 begin');
      await runCase('testEnumPathOp0137', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(60, 0, 160, 100), drawing.RegionOp.XOR);
        const probes: number[] = [25, 50, 80, 50, 120, 50, 10, 10, 150, 50, 70, 20];
        expect(countRegionHits(base, probes)).assertEqual(4);
        expect(base.isPointContained(150, 50)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0138
     * @tc.name testEnumPathOp0138
     * @tc.desc Verify RegionOp.REVERSE_DIFFERENCE keeps the right operand tail.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0138 begin');
      await runCase('testEnumPathOp0138', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(60, 0, 160, 100), drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(base.isPointContained(120, 50)).assertTrue();
        expect(base.isPointContained(50, 50)).assertFalse();
        expect(boundsOfRegion(base)[0]).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0139
     * @tc.name testEnumPathOp0139
     * @tc.desc Verify RegionOp.REVERSE_DIFFERENCE with a contained operand builds a ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0139 begin');
      await runCase('testEnumPathOp0139', async () => {
        const base: drawing.Region = rectRegion(40, 40, 60, 60);
        base.op(rectRegion(0, 0, 100, 100), drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(base.isPointContained(50, 50)).assertFalse();
        expect(base.isPointContained(10, 10)).assertTrue();
        expect(boundsOfRegion(base)[2]).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0140
     * @tc.name testEnumPathOp0140
     * @tc.desc Verify RegionOp.REVERSE_DIFFERENCE of a region with itself is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0140 begin');
      await runCase('testEnumPathOp0140', async () => {
        const base: drawing.Region = rectRegion(0, 0, 60, 60);
        base.op(new drawing.Region(base), drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(base.isEmpty()).assertTrue();
        expect(base.isPointContained(30, 30)).assertFalse();
        expect(base.quickReject(0, 0, 60, 60)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0141
     * @tc.name testEnumPathOp0141
     * @tc.desc Verify RegionOp.REVERSE_DIFFERENCE complements the swapped DIFFERENCE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0141 begin');
      await runCase('testEnumPathOp0141', async () => {
        const reverse: drawing.Region = rectRegion(0, 0, 100, 100);
        reverse.op(rectRegion(60, 0, 160, 100), drawing.RegionOp.REVERSE_DIFFERENCE);
        const forward: drawing.Region = rectRegion(60, 0, 160, 100);
        forward.op(rectRegion(0, 0, 100, 100), drawing.RegionOp.DIFFERENCE);
        const probes: number[] = [30, 50, 80, 50, 120, 50, 150, 20, 10, 90];
        expect(countRegionHits(reverse, probes)).assertEqual(countRegionHits(forward, probes));
        expect(reverse.isPointContained(150, 20)).assertTrue();
        expect(reverse.isComplex()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0142
     * @tc.name testEnumPathOp0142
     * @tc.desc Verify RegionOp.REVERSE_DIFFERENCE probe table on the right tail.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0142 begin');
      await runCase('testEnumPathOp0142', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(60, 0, 160, 100), drawing.RegionOp.REVERSE_DIFFERENCE);
        const probes: number[] = [10, 10, 50, 50, 90, 90, 120, 50, 150, 20, 70, 70];
        expect(countRegionHits(base, probes)).assertEqual(2);
        expect(base.isPointContained(120, 50)).assertTrue();
        expect(base.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0143
     * @tc.name testEnumPathOp0143
     * @tc.desc Verify RegionOp.REPLACE swaps in the given region entirely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0143 begin');
      await runCase('testEnumPathOp0143', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(rectRegion(100, 0, 140, 60), drawing.RegionOp.REPLACE);
        expect(base.isPointContained(120, 30)).assertTrue();
        expect(base.isPointContained(25, 50)).assertFalse();
        expect(boundsOfRegion(base)[0]).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0143 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0144
     * @tc.name testEnumPathOp0144
     * @tc.desc Verify RegionOp.REPLACE with an empty region empties the target.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0144 begin');
      await runCase('testEnumPathOp0144', async () => {
        const base: drawing.Region = rectRegion(0, 0, 100, 100);
        base.op(new drawing.Region(), drawing.RegionOp.REPLACE);
        expect(base.isEmpty()).assertTrue();
        expect(base.isPointContained(50, 50)).assertFalse();
        expect(base.quickReject(0, 0, 100, 100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0145
     * @tc.name testEnumPathOp0145
     * @tc.desc Verify RegionOp.REPLACE with a copy of itself changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0145 begin');
      await runCase('testEnumPathOp0145', async () => {
        const base: drawing.Region = rectRegion(20, 20, 90, 90);
        base.op(new drawing.Region(base), drawing.RegionOp.REPLACE);
        expect(base.isEqual(rectRegion(20, 20, 90, 90))).assertTrue();
        expect(base.isPointContained(50, 50)).assertTrue();
        expect(boundsOfRegion(base)[3]).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0146
     * @tc.name testEnumPathOp0146
     * @tc.desc Verify RegionOp.REPLACE makes the bounds follow the new region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0146 begin');
      await runCase('testEnumPathOp0146', async () => {
        const base: drawing.Region = rectRegion(0, 0, 30, 30);
        base.op(rectRegion(100, 20, 140, 90), drawing.RegionOp.REPLACE);
        const bounds: number[] = boundsOfRegion(base);
        expect(bounds[1]).assertEqual(20);
        expect(bounds[2]).assertEqual(140);
        expect(bounds[3]).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0147
     * @tc.name testEnumPathOp0147
     * @tc.desc Verify RegionOp.REPLACE accepts a larger region and keeps it simple.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0147 begin');
      await runCase('testEnumPathOp0147', async () => {
        const base: drawing.Region = rectRegion(10, 10, 40, 40);
        base.op(rectRegion(0, 0, 160, 120), drawing.RegionOp.REPLACE);
        expect(base.isPointContained(150, 100)).assertTrue();
        expect(base.isPointContained(155, 130)).assertFalse();
        expect(base.isRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0148
     * @tc.name testEnumPathOp0148
     * @tc.desc Verify ClipOp.INTERSECT limits painting to the clip rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0148 begin');
      await runCase('testEnumPathOp0148', async () => {
        const buffer: ArrayBuffer =
          await clipRectBuffer(drawing.ClipOp.INTERSECT, ltrb(20, 20, 100, 100), true);
        expect(countInkedPixels(buffer)).assertEqual(BOX_AREA);
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
        expect(alphaAt(buffer, 5, 5)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0149
     * @tc.name testEnumPathOp0149
     * @tc.desc Verify ClipOp.INTERSECT with a circle path keeps a disc of ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0149 begin');
      await runCase('testEnumPathOp0149', async () => {
        const circle: drawing.Path = new drawing.Path();
        circle.addCircle(80, 80, 40);
        const buffer: ArrayBuffer = await clipPathBuffer(drawing.ClipOp.INTERSECT, circle);
        const inked: number = countInkedPixels(buffer);
        expect(inked > CIRCLE_AREA * 0.9).assertTrue();
        expect(inked < CIRCLE_AREA * 1.1).assertTrue();
        expect(alphaAt(buffer, 80, 80)).assertEqual(255);
        expect(alphaAt(buffer, 5, 5)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0150
     * @tc.name testEnumPathOp0150
     * @tc.desc Verify ClipOp.INTERSECT with a region clips like a rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0150 begin');
      await runCase('testEnumPathOp0150', async () => {
        const buffer: ArrayBuffer =
          await clipRegionBuffer(drawing.ClipOp.INTERSECT, rectRegion(20, 20, 100, 100));
        expect(countInkedPixels(buffer)).assertEqual(BOX_AREA);
        expect(alphaAt(buffer, 95, 95)).assertEqual(255);
        expect(alphaAt(buffer, 120, 120)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0150 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0151
     * @tc.name testEnumPathOp0151
     * @tc.desc Verify two ClipOp.INTERSECT calls compose into a smaller window.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0151', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0151 begin');
      await runCase('testEnumPathOp0151', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100), drawing.ClipOp.INTERSECT, true);
        target.canvas.clipRect(ltrb(40, 0, 160, 100), drawing.ClipOp.INTERSECT, true);
        target.canvas.drawColor(rgba(255, 0, 200, 0), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(60 * 100);
        expect(alphaAt(buffer, 80, 50)).assertEqual(255);
        expect(alphaAt(buffer, 20, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0151 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0152
     * @tc.name testEnumPathOp0152
     * @tc.desc Verify the anti alias switch does not change an axis aligned clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0152', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0152 begin');
      await runCase('testEnumPathOp0152', async () => {
        const smooth: ArrayBuffer =
          await clipRectBuffer(drawing.ClipOp.INTERSECT, ltrb(20, 20, 100, 100), true);
        const hard: ArrayBuffer =
          await clipRectBuffer(drawing.ClipOp.INTERSECT, ltrb(20, 20, 100, 100), false);
        expect(countInkedPixels(smooth)).assertEqual(countInkedPixels(hard));
        expect(alphaAt(smooth, 60, 60)).assertEqual(alphaAt(hard, 60, 60));
        expect(alphaAt(smooth, 5, 5)).assertEqual(alphaAt(hard, 5, 5));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0152 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0153
     * @tc.name testEnumPathOp0153
     * @tc.desc Verify ClipOp.DIFFERENCE punches a hole in the painted canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathOp0153', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0153 begin');
      await runCase('testEnumPathOp0153', async () => {
        const buffer: ArrayBuffer =
          await clipRectBuffer(drawing.ClipOp.DIFFERENCE, ltrb(20, 20, 100, 100), true);
        expect(countInkedPixels(buffer)).assertEqual(AREA - BOX_AREA);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
        expect(alphaAt(buffer, 5, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0153 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0154
     * @tc.name testEnumPathOp0154
     * @tc.desc Verify a rectangle drawn under ClipOp.DIFFERENCE keeps the hole empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0154', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0154 begin');
      await runCase('testEnumPathOp0154', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 200, 0));
        target.canvas.clipRect(ltrb(20, 20, 100, 100), drawing.ClipOp.DIFFERENCE, true);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, SIZE, SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(AREA - BOX_AREA);
        expect(alphaAt(buffer, 80, 80)).assertEqual(0);
        expect(alphaAt(buffer, 10, 10)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0154 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0155
     * @tc.name testEnumPathOp0155
     * @tc.desc Verify ClipOp.DIFFERENCE with a circle path cuts a round hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0155', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0155 begin');
      await runCase('testEnumPathOp0155', async () => {
        const circle: drawing.Path = new drawing.Path();
        circle.addCircle(80, 80, 40);
        const buffer: ArrayBuffer = await clipPathBuffer(drawing.ClipOp.DIFFERENCE, circle);
        const inked: number = countInkedPixels(buffer);
        expect(inked < AREA).assertTrue();
        expect(inked > AREA - CIRCLE_AREA * 1.1).assertTrue();
        expect(alphaAt(buffer, 80, 80)).assertEqual(0);
        expect(alphaAt(buffer, 5, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0155 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0156
     * @tc.name testEnumPathOp0156
     * @tc.desc Verify ClipOp.DIFFERENCE with a region removes exactly its area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0156', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0156 begin');
      await runCase('testEnumPathOp0156', async () => {
        const buffer: ArrayBuffer =
          await clipRegionBuffer(drawing.ClipOp.DIFFERENCE, rectRegion(20, 20, 100, 100));
        expect(countInkedPixels(buffer)).assertEqual(AREA - BOX_AREA);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
        expect(alphaAt(buffer, 140, 140)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0156 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0157
     * @tc.name testEnumPathOp0157
     * @tc.desc Verify ClipOp.DIFFERENCE over the whole canvas cancels every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathOp0157', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0157 begin');
      await runCase('testEnumPathOp0157', async () => {
        const buffer: ArrayBuffer =
          await clipRectBuffer(drawing.ClipOp.DIFFERENCE, ltrb(0, 0, SIZE, SIZE), true);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 0, 0)).assertEqual(0);
        expect(alphaAt(buffer, SIZE - 1, SIZE - 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathOp0157 end');
    });
  });
}
