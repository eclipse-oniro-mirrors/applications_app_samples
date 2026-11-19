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
import { BusinessError } from '@kit.BasicServicesKit';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const STROKE: number = 8;

/**
 * Build a point array from a flat list of x and y values.
 *
 * @param { number[] } coords - Flat list of x and y values.
 * @returns { common2D.Point[] } Point array with half the length of the input.
 */
function pointsOf(coords: number[]): common2D.Point[] {
  const points: common2D.Point[] = [];
  for (let i: number = 0; i < coords.length; i += 2) {
    points.push({ x: coords[i], y: coords[i + 1] });
  }
  return points;
}

/**
 * Build the four element scratch array required by PathIterator.next.
 *
 * @returns { common2D.Point[] } Four zeroed points.
 */
function scratch(): common2D.Point[] {
  const points: common2D.Point[] = [];
  for (let i: number = 0; i < 4; i++) {
    points.push({ x: 0, y: 0 });
  }
  return points;
}

/**
 * Read the verb table of a path.
 *
 * @param { drawing.Path } path - Path under test.
 * @returns { drawing.PathIteratorVerb[] } Verbs in contour order.
 */
function verbList(path: drawing.Path): drawing.PathIteratorVerb[] {
  return path.getVerbData();
}

/**
 * Count how often one verb appears in a verb list.
 *
 * @param { drawing.PathIteratorVerb[] } verbs - Verb list to scan.
 * @param { drawing.PathIteratorVerb } verb - Verb to count.
 * @returns { number } Number of occurrences.
 */
function verbCount(verbs: drawing.PathIteratorVerb[], verb: drawing.PathIteratorVerb): number {
  let count: number = 0;
  for (let i: number = 0; i < verbs.length; i++) {
    if (verbs[i] === verb) {
      count++;
    }
  }
  return count;
}

/**
 * Walk an iterator until the DONE verb and collect every visited verb.
 *
 * @param { drawing.Path } path - Path under test.
 * @returns { drawing.PathIteratorVerb[] } Visited verbs including the trailing DONE.
 */
function drainVerbs(path: drawing.Path): drawing.PathIteratorVerb[] {
  const iterator: drawing.PathIterator = path.getPathIterator();
  const points: common2D.Point[] = scratch();
  const verbs: drawing.PathIteratorVerb[] = [];
  let guard: number = 0;
  while (guard < 64) {
    const verb: drawing.PathIteratorVerb = iterator.next(points);
    verbs.push(verb);
    guard++;
    if (verb === drawing.PathIteratorVerb.DONE) {
      break;
    }
  }
  return verbs;
}

/**
 * Read one alpha channel of a pixel in a square RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Alpha value of the pixel.
 */
function alphaOf(buffer: ArrayBuffer, x: number, y: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4 + 3];
}

/**
 * Count painted pixels inside a rectangle of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of painted pixels.
 */
function inkBox(buffer: ArrayBuffer, left: number, top: number, right: number, bottom: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
        count++;
      }
    }
  }
  return count;
}

/**
 * Count painted pixels inside a column range of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } from - First column, inclusive.
 * @param { number } to - Last column, exclusive.
 * @returns { number } Number of painted pixels.
 */
function inkColumns(buffer: ArrayBuffer, from: number, to: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let x: number = from; x < to; x++) {
    for (let y: number = 0; y < SIZE; y++) {
      if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
        count++;
      }
    }
  }
  return count;
}

/**
 * Draw points with a hard edged pen and return the raw pixels.
 *
 * @param { common2D.Point[] } points - Points to draw.
 * @param { drawing.PointMode | null } mode - Point mode, null keeps the default mode.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function pointsBuffer(points: common2D.Point[],
  mode: drawing.PointMode | null): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(200, 255, 0, 90));
  pen.setStrokeWidth(STROKE);
  pen.setAntiAlias(false);
  target.canvas.attachPen(pen);
  if (mode === null) {
    target.canvas.drawPoints(points);
  } else {
    target.canvas.drawPoints(points, mode);
  }
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Draw points and count the painted pixels.
 *
 * @param { common2D.Point[] } points - Points to draw.
 * @param { drawing.PointMode | null } mode - Point mode, null keeps the default mode.
 * @returns { Promise<number> } Number of painted pixels.
 */
async function pointsInk(points: common2D.Point[], mode: drawing.PointMode | null): Promise<number> {
  const buffer: ArrayBuffer = await pointsBuffer(points, mode);
  return countInkedPixels(buffer);
}

/**
 * Fill a triangle mesh with a hard edged brush and return the raw pixels.
 *
 * @param { drawing.VertexMode } mode - Vertex connection mode.
 * @param { common2D.Point[] } positions - Vertex positions.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function verticesBuffer(mode: drawing.VertexMode,
  positions: common2D.Point[]): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(200, 255, 40, 140));
  brush.setAntiAlias(false);
  target.canvas.attachBrush(brush);
  target.canvas.drawVertices(mode, positions.length, positions, null, null, 0, null,
    drawing.BlendMode.SRC_OVER);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Fill a triangle mesh and count the painted pixels.
 *
 * @param { drawing.VertexMode } mode - Vertex connection mode.
 * @param { common2D.Point[] } positions - Vertex positions.
 * @returns { Promise<number> } Number of painted pixels.
 */
async function verticesInk(mode: drawing.VertexMode, positions: common2D.Point[]): Promise<number> {
  const buffer: ArrayBuffer = await verticesBuffer(mode, positions);
  return countInkedPixels(buffer);
}

/**
 * Build a path from a rectangle whose corners are square by default and rounded on demand.
 *
 * @param { common2D.Rect } rect - Frame of the shape.
 * @param { drawing.CornerPos | null } corner - Corner to round, null keeps every corner square.
 * @param { number } radiusX - Horizontal radius applied to the corner.
 * @param { number } radiusY - Vertical radius applied to the corner.
 * @returns { drawing.Path } Path holding the rounded rectangle.
 */
function cornerPath(rect: common2D.Rect, corner: drawing.CornerPos | null, radiusX: number,
  radiusY: number): drawing.Path {
  const roundRect: drawing.RoundRect = new drawing.RoundRect(rect, 0, 0);
  if (corner !== null) {
    roundRect.setCorner(corner, radiusX, radiusY);
  }
  const path: drawing.Path = new drawing.Path();
  path.addRoundRect(roundRect);
  return path;
}

/**
 * Fill a path with a hard edged brush and return the raw pixels.
 *
 * @param { drawing.Path } path - Path to fill.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillBuffer(path: drawing.Path): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(200, 255, 30, 120));
  brush.setAntiAlias(false);
  target.canvas.attachBrush(brush);
  target.canvas.drawPath(path);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

export default function enumPathIterTest() {
  describe('EnumPathIterTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0228
     * @tc.name testEnumPathIter0228
     * @tc.desc Verify a move command appears as PathIteratorVerb.MOVE in the verb table.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathIter0228', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0228 begin');
      await runCase('testEnumPathIter0228', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(60, 10);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs.length).assertEqual(2);
        expect(verbs[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(verbCount(verbs, drawing.PathIteratorVerb.MOVE)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0228 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0229
     * @tc.name testEnumPathIter0229
     * @tc.desc Verify peek reports MOVE twice without moving the iterator forward.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0229', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0229 begin');
      await runCase('testEnumPathIter0229', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 20);
        path.lineTo(80, 20);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const peekFirst: drawing.PathIteratorVerb = iterator.peek();
        const peekSecond: drawing.PathIteratorVerb = iterator.peek();
        expect(peekFirst).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(peekSecond).assertEqual(peekFirst);
        expect(iterator.hasNext()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0229 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0230
     * @tc.name testEnumPathIter0230
     * @tc.desc Verify next fills the single MOVE coordinate into the output array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0230', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0230 begin');
      await runCase('testEnumPathIter0230', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 30);
        path.lineTo(70, 30);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const points: common2D.Point[] = scratch();
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(points[0].x).assertEqual(20);
        expect(points[0].y).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0230 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0231
     * @tc.name testEnumPathIter0231
     * @tc.desc Verify PathIteratorVerb.MOVE keeps index 0 and opens every new contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0231', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0231 begin');
      await runCase('testEnumPathIter0231', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(40, 10);
        path.moveTo(60, 60);
        path.lineTo(90, 60);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(drawing.PathIteratorVerb.MOVE).assertEqual(0);
        expect(verbCount(verbs, drawing.PathIteratorVerb.MOVE)).assertEqual(2);
        expect(verbs[2]).assertEqual(drawing.PathIteratorVerb.MOVE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0231 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0232
     * @tc.name testEnumPathIter0232
     * @tc.desc Verify two line commands appear as two PathIteratorVerb.LINE entries.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0232', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0232 begin');
      await runCase('testEnumPathIter0232', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(50, 0);
        path.lineTo(50, 50);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbCount(verbs, drawing.PathIteratorVerb.LINE)).assertEqual(2);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(verbs.length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0232 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0233
     * @tc.name testEnumPathIter0233
     * @tc.desc Verify the iterator advances from MOVE to LINE and still has more data.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0233', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0233 begin');
      await runCase('testEnumPathIter0233', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(90, 10);
        path.lineTo(90, 90);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const points: common2D.Point[] = scratch();
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.hasNext()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0233 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0234
     * @tc.name testEnumPathIter0234
     * @tc.desc Verify PathIteratorVerb.LINE keeps index 1 and leaves the contour open.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0234', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0234 begin');
      await runCase('testEnumPathIter0234', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(100, 0);
        expect(drawing.PathIteratorVerb.LINE).assertEqual(1);
        expect(path.isClosed()).assertFalse();
        expect(verbCount(verbList(path), drawing.PathIteratorVerb.LINE)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0234 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0235
     * @tc.name testEnumPathIter0235
     * @tc.desc Verify two line commands build an L contour whose measured length is 200.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0235', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0235 begin');
      await runCase('testEnumPathIter0235', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 20);
        path.lineTo(120, 20);
        path.lineTo(120, 120);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(verbs[2]).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(Math.round(path.getLength(false))).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0235 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0236
     * @tc.name testEnumPathIter0236
     * @tc.desc Verify a quadratic curve appears as a single PathIteratorVerb.QUAD entry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0236', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0236 begin');
      await runCase('testEnumPathIter0236', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.quadTo(100, 20, 180, 100);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs.length).assertEqual(2);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(verbCount(verbs, drawing.PathIteratorVerb.QUAD)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0236 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0237
     * @tc.name testEnumPathIter0237
     * @tc.desc Verify peek reports QUAD after the leading move has been consumed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0237', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0237 begin');
      await runCase('testEnumPathIter0237', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.quadTo(100, 20, 180, 100);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const points: common2D.Point[] = scratch();
        iterator.next(points);
        expect(iterator.peek()).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(iterator.hasNext()).assertTrue();
        expect(drawing.PathIteratorVerb.QUAD).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0237 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0238
     * @tc.name testEnumPathIter0238
     * @tc.desc Verify a quadratic curve is longer than its chord and bows above the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0238', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0238 begin');
      await runCase('testEnumPathIter0238', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.quadTo(100, 20, 180, 100);
        const length: number = path.getLength(false);
        expect(length > 160).assertTrue();
        expect(length < 400).assertTrue();
        expect(path.getBounds().top < 90).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0238 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0239
     * @tc.name testEnumPathIter0239
     * @tc.desc Verify a quad followed by a line keeps both verbs in the verb table.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0239', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0239 begin');
      await runCase('testEnumPathIter0239', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.quadTo(50, 50, 100, 0);
        path.lineTo(100, 100);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs.length).assertEqual(3);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(verbs[2]).assertEqual(drawing.PathIteratorVerb.LINE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0239 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0240
     * @tc.name testEnumPathIter0240
     * @tc.desc Verify a conic curve appears as one PathIteratorVerb.CONIC with one weight.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0240', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0240 begin');
      await runCase('testEnumPathIter0240', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.conicTo(100, 20, 180, 100, 0.7071);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs.length).assertEqual(2);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.CONIC);
        expect(path.getConicWeightData().length).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0240 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0241
     * @tc.name testEnumPathIter0241
     * @tc.desc Verify PathIteratorVerb.CONIC keeps index 3 and stores a positive weight.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0241', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0241 begin');
      await runCase('testEnumPathIter0241', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.conicTo(100, 20, 180, 100, 0.5);
        const weights: number[] = path.getConicWeightData();
        expect(drawing.PathIteratorVerb.CONIC).assertEqual(3);
        expect(weights.length).assertEqual(1);
        expect(weights[0] > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0241 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0242
     * @tc.name testEnumPathIter0242
     * @tc.desc Verify the iterator walks MOVE then CONIC then DONE on a conic path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0242', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0242 begin');
      await runCase('testEnumPathIter0242', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.conicTo(100, 20, 180, 100, 1);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const points: common2D.Point[] = scratch();
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.next(points)).assertEqual(2);
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.DONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0242 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0243
     * @tc.name testEnumPathIter0243
     * @tc.desc Verify the conic weight changes the measured length of the same contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0243', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0243 begin');
      await runCase('testEnumPathIter0243', async () => {
        const flat: drawing.Path = new drawing.Path();
        flat.moveTo(20, 100);
        flat.conicTo(100, 20, 180, 100, 0.3);
        const round: drawing.Path = new drawing.Path();
        round.moveTo(20, 100);
        round.conicTo(100, 20, 180, 100, 2);
        const delta: number = Math.abs(flat.getLength(false) - round.getLength(false));
        expect(delta > 1).assertTrue();
        expect(flat.getConicWeightData()[0]).assertClose(0.3, 0.000001);
        expect(round.getConicWeightData()[0]).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0243 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0244
     * @tc.name testEnumPathIter0244
     * @tc.desc Verify a cubic curve appears as one PathIteratorVerb.CUBIC entry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0244', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0244 begin');
      await runCase('testEnumPathIter0244', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.cubicTo(60, 20, 140, 20, 180, 100);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs.length).assertEqual(2);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(verbCount(verbs, drawing.PathIteratorVerb.CUBIC)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0244 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0245
     * @tc.name testEnumPathIter0245
     * @tc.desc Verify PathIteratorVerb.CUBIC keeps index 4 and is visible through peek.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0245', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0245 begin');
      await runCase('testEnumPathIter0245', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.cubicTo(60, 20, 140, 20, 180, 100);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const points: common2D.Point[] = scratch();
        iterator.next(points);
        expect(drawing.PathIteratorVerb.CUBIC).assertEqual(4);
        expect(iterator.peek()).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(iterator.hasNext()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0245 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0246
     * @tc.name testEnumPathIter0246
     * @tc.desc Verify a cubic curve is longer than its chord and stays inside the control box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0246', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0246 begin');
      await runCase('testEnumPathIter0246', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.cubicTo(60, 20, 140, 20, 180, 100);
        const length: number = path.getLength(false);
        const bounds: common2D.Rect = path.getBounds();
        expect(length > 160).assertTrue();
        expect(length < 500).assertTrue();
        expect(bounds.top > 19).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0246 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0247
     * @tc.name testEnumPathIter0247
     * @tc.desc Verify a closed cubic contour ends with PathIteratorVerb.CLOSE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0247', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0247 begin');
      await runCase('testEnumPathIter0247', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(100, 20);
        path.cubicTo(160, 60, 160, 140, 100, 180);
        path.close();
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs.length).assertEqual(3);
        expect(verbs[2]).assertEqual(drawing.PathIteratorVerb.CLOSE);
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0247 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0248
     * @tc.name testEnumPathIter0248
     * @tc.desc Verify closing a line contour appends PathIteratorVerb.CLOSE as the last verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0248', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0248 begin');
      await runCase('testEnumPathIter0248', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 20);
        path.lineTo(120, 20);
        path.lineTo(120, 120);
        path.close();
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs[verbs.length - 1]).assertEqual(drawing.PathIteratorVerb.CLOSE);
        expect(verbCount(verbs, drawing.PathIteratorVerb.CLOSE)).assertEqual(1);
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0248 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0249
     * @tc.name testEnumPathIter0249
     * @tc.desc Verify PathIteratorVerb.CLOSE keeps index 5 and is followed by DONE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0249', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0249 begin');
      await runCase('testEnumPathIter0249', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 20);
        path.lineTo(100, 20);
        path.lineTo(100, 100);
        path.close();
        const drained: drawing.PathIteratorVerb[] = drainVerbs(path);
        expect(drawing.PathIteratorVerb.CLOSE).assertEqual(5);
        expect(drained[drained.length - 2]).assertEqual(drawing.PathIteratorVerb.CLOSE);
        expect(drained[drained.length - 1]).assertEqual(drawing.PathIteratorVerb.DONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0249 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0250
     * @tc.name testEnumPathIter0250
     * @tc.desc Verify two closed contours produce exactly two CLOSE verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0250', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0250 begin');
      await runCase('testEnumPathIter0250', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(60, 10);
        path.lineTo(60, 60);
        path.close();
        path.moveTo(100, 100);
        path.lineTo(150, 100);
        path.lineTo(150, 150);
        path.close();
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbCount(verbs, drawing.PathIteratorVerb.CLOSE)).assertEqual(2);
        expect(verbs.length).assertEqual(8);
        expect(verbCount(verbs, drawing.PathIteratorVerb.MOVE)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0250 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0251
     * @tc.name testEnumPathIter0251
     * @tc.desc Verify close keeps the force closed length and flips the closed flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0251', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0251 begin');
      await runCase('testEnumPathIter0251', async () => {
        const open: drawing.Path = new drawing.Path();
        open.moveTo(20, 20);
        open.lineTo(120, 20);
        open.lineTo(120, 120);
        const closed: drawing.Path = new drawing.Path();
        closed.moveTo(20, 20);
        closed.lineTo(120, 20);
        closed.lineTo(120, 120);
        closed.close();
        expect(open.isClosed()).assertFalse();
        expect(closed.isClosed()).assertTrue();
        expect(closed.getLength(true)).assertEqual(open.getLength(true));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0251 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0252
     * @tc.name testEnumPathIter0252
     * @tc.desc Verify PathIteratorVerb.DONE equals CLOSE plus one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathIter0252', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0252 begin');
      await runCase('testEnumPathIter0252', async () => {
        expect(drawing.PathIteratorVerb.DONE).assertEqual(6);
        expect(drawing.PathIteratorVerb.DONE)
          .assertEqual(drawing.PathIteratorVerb.CLOSE + 1);
        expect(drawing.PathIteratorVerb.DONE > drawing.PathIteratorVerb.CLOSE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0252 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0253
     * @tc.name testEnumPathIter0253
     * @tc.desc Verify the iterator returns DONE once and then reports no next element.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0253', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0253 begin');
      await runCase('testEnumPathIter0253', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(40, 0);
        const iterator: drawing.PathIterator = path.getPathIterator();
        const points: common2D.Point[] = scratch();
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.DONE);
        expect(iterator.hasNext()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0253 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0254
     * @tc.name testEnumPathIter0254
     * @tc.desc Verify the verb table lists only real commands and never DONE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0254', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0254 begin');
      await runCase('testEnumPathIter0254', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(40, 0);
        path.lineTo(40, 40);
        const verbs: drawing.PathIteratorVerb[] = verbList(path);
        expect(verbs.length).assertEqual(3);
        expect(verbCount(verbs, drawing.PathIteratorVerb.DONE)).assertEqual(0);
        expect(verbs[2]).assertEqual(drawing.PathIteratorVerb.LINE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0254 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0255
     * @tc.name testEnumPathIter0255
     * @tc.desc Verify a two contour path is drained with exactly one trailing DONE.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0255', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0255 begin');
      await runCase('testEnumPathIter0255', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(0, 0);
        path.lineTo(10, 0);
        path.moveTo(20, 20);
        path.lineTo(30, 20);
        const drained: drawing.PathIteratorVerb[] = drainVerbs(path);
        expect(drained.length).assertEqual(5);
        expect(verbCount(drained, drawing.PathIteratorVerb.DONE)).assertEqual(1);
        expect(drained[4]).assertEqual(drawing.PathIteratorVerb.DONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0255 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0256
     * @tc.name testEnumPathIter0256
     * @tc.desc Verify PointMode.POINTS keeps index 0 and inks three separate dots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathIter0256', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0256 begin');
      await runCase('testEnumPathIter0256', async () => {
        const points: common2D.Point[] = pointsOf([50, 100, 100, 100, 150, 100]);
        const buffer: ArrayBuffer = await pointsBuffer(points, drawing.PointMode.POINTS);
        const inked: number = countInkedPixels(buffer);
        expect(drawing.PointMode.POINTS).assertEqual(0);
        expect(alphaOf(buffer, 50, 100)).assertEqual(200);
        expect(inked < 600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0256 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0257
     * @tc.name testEnumPathIter0257
     * @tc.desc Verify POINTS mode leaves the columns between two dots untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0257', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0257 begin');
      await runCase('testEnumPathIter0257', async () => {
        const points: common2D.Point[] = pointsOf([50, 100, 100, 100, 150, 100]);
        const buffer: ArrayBuffer = await pointsBuffer(points, drawing.PointMode.POINTS);
        expect(inkColumns(buffer, 60, 90)).assertEqual(0);
        expect(inkBox(buffer, 44, 94, 56, 106) > 0).assertTrue();
        expect(inkBox(buffer, 144, 94, 156, 106) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0257 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0258
     * @tc.name testEnumPathIter0258
     * @tc.desc Verify the same pair of points inks less in POINTS mode than in LINES mode.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0258', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0258 begin');
      await runCase('testEnumPathIter0258', async () => {
        const points: common2D.Point[] = pointsOf([40, 60, 160, 60]);
        const dots: number = await pointsInk(points, drawing.PointMode.POINTS);
        const segments: number = await pointsInk(points, drawing.PointMode.LINES);
        expect(dots < segments).assertTrue();
        expect(dots > 0).assertTrue();
        expect(drawing.PointMode.LINES).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0258 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0259
     * @tc.name testEnumPathIter0259
     * @tc.desc Verify the omitted mode argument behaves like PointMode.POINTS.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0259', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0259 begin');
      await runCase('testEnumPathIter0259', async () => {
        const points: common2D.Point[] = pointsOf([70, 70, 130, 130]);
        const implicitBuffer: ArrayBuffer = await pointsBuffer(points, null);
        const implicitInk: number = countInkedPixels(implicitBuffer);
        const explicitInk: number = await pointsInk(points, drawing.PointMode.POINTS);
        expect(Math.abs(implicitInk - explicitInk) < 4).assertTrue();
        expect(implicitInk > 0).assertTrue();
        expect(alphaOf(implicitBuffer, 70, 70)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0259 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0260
     * @tc.name testEnumPathIter0260
     * @tc.desc Verify two dots stay narrow and keep the midpoint column empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0260', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0260 begin');
      await runCase('testEnumPathIter0260', async () => {
        const points: common2D.Point[] = pointsOf([60, 120, 140, 120]);
        const buffer: ArrayBuffer = await pointsBuffer(points, drawing.PointMode.POINTS);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertLarger(0);
        expect(inked < 200).assertTrue();
        expect(alphaOf(buffer, 100, 120)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0260 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0261
     * @tc.name testEnumPathIter0261
     * @tc.desc Verify PointMode.LINES keeps index 1 and inks the span between two points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathIter0261', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0261 begin');
      await runCase('testEnumPathIter0261', async () => {
        const points: common2D.Point[] = pointsOf([40, 100, 160, 100]);
        const buffer: ArrayBuffer = await pointsBuffer(points, drawing.PointMode.LINES);
        expect(drawing.PointMode.LINES).assertEqual(1);
        expect(alphaOf(buffer, 100, 100)).assertEqual(200);
        expect(countInkedPixels(buffer) > 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0261 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0262
     * @tc.name testEnumPathIter0262
     * @tc.desc Verify three collinear points become two separate line spans.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0262', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0262 begin');
      await runCase('testEnumPathIter0262', async () => {
        const points: common2D.Point[] = pointsOf([40, 100, 100, 100, 160, 100]);
        const buffer: ArrayBuffer = await pointsBuffer(points, drawing.PointMode.LINES);
        expect(inkColumns(buffer, 50, 90) > 0).assertTrue();
        expect(inkColumns(buffer, 110, 150)).assertEqual(0);
        expect(inkColumns(buffer, 170, 200)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0262 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0263
     * @tc.name testEnumPathIter0263
     * @tc.desc Verify four points in LINES mode ink more than two points do.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0263', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0263 begin');
      await runCase('testEnumPathIter0263', async () => {
        const two: number = await pointsInk(pointsOf([30, 80, 170, 80]), drawing.PointMode.LINES);
        const four: number = await pointsInk(pointsOf([30, 80, 170, 80, 30, 140, 170, 140]),
          drawing.PointMode.LINES);
        expect(four).assertLarger(two);
        expect(two).assertLarger(100);
        expect(four < two * 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0263 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0264
     * @tc.name testEnumPathIter0264
     * @tc.desc Verify one point in LINES mode inks nothing while POINTS mode inks a dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0264', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0264 begin');
      await runCase('testEnumPathIter0264', async () => {
        const single: common2D.Point[] = pointsOf([100, 100]);
        const buffer: ArrayBuffer = await pointsBuffer(single, drawing.PointMode.LINES);
        const dots: number = await pointsInk(single, drawing.PointMode.POINTS);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(alphaOf(buffer, 100, 100)).assertEqual(0);
        expect(dots > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0264 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0265
     * @tc.name testEnumPathIter0265
     * @tc.desc Verify POLYGON mode closes the outline that LINES mode leaves open.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0265', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0265 begin');
      await runCase('testEnumPathIter0265', async () => {
        const triangle: common2D.Point[] = pointsOf([50, 50, 150, 50, 100, 150]);
        const open: number = await pointsInk(triangle, drawing.PointMode.LINES);
        const loop: number = await pointsInk(triangle, drawing.PointMode.POLYGON);
        expect(loop).assertLarger(open);
        expect(Math.abs(loop - open) > 0).assertTrue();
        expect(drawing.PointMode.POLYGON).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0265 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0266
     * @tc.name testEnumPathIter0266
     * @tc.desc Verify every vertex of a POLYGON outline carries ink on the pen edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0266', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0266 begin');
      await runCase('testEnumPathIter0266', async () => {
        const triangle: common2D.Point[] = pointsOf([50, 50, 150, 50, 100, 150]);
        const buffer: ArrayBuffer = await pointsBuffer(triangle, drawing.PointMode.POLYGON);
        expect(drawing.PointMode.POLYGON).assertEqual(2);
        expect(alphaOf(buffer, 50, 50)).assertEqual(200);
        expect(alphaOf(buffer, 100, 150)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0266 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0267
     * @tc.name testEnumPathIter0267
     * @tc.desc Verify a four vertex POLYGON is an outline whose interior stays empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0267', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0267 begin');
      await runCase('testEnumPathIter0267', async () => {
        const square: common2D.Point[] = pointsOf([50, 50, 150, 50, 150, 150, 50, 150]);
        const buffer: ArrayBuffer = await pointsBuffer(square, drawing.PointMode.POLYGON);
        expect(inkBox(buffer, 46, 60, 58, 140)).assertEqual(0);
        expect(inkBox(buffer, 80, 80, 120, 120)).assertEqual(0);
        expect(inkColumns(buffer, 0, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0267 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0268
     * @tc.name testEnumPathIter0268
     * @tc.desc Verify the four edges of a POLYGON square stay within the outline budget.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0268', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0268 begin');
      await runCase('testEnumPathIter0268', async () => {
        const square: common2D.Point[] = pointsOf([50, 50, 150, 50, 150, 150, 50, 150]);
        const buffer: ArrayBuffer = await pointsBuffer(square, drawing.PointMode.POLYGON);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 2000).assertTrue();
        expect(inked < 4500).assertTrue();
        expect(inkBox(buffer, 54, 46, 146, 58) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0268 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0269
     * @tc.name testEnumPathIter0269
     * @tc.desc Verify a two vertex POLYGON covers the same pixels as a LINES segment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0269', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0269 begin');
      await runCase('testEnumPathIter0269', async () => {
        const segment: common2D.Point[] = pointsOf([40, 100, 160, 100]);
        const poly: ArrayBuffer = await pointsBuffer(segment, drawing.PointMode.POLYGON);
        const line: ArrayBuffer = await pointsBuffer(segment, drawing.PointMode.LINES);
        expect(Math.abs(countInkedPixels(poly) - countInkedPixels(line)) < 8).assertTrue();
        expect(countInkedPixels(poly) > 0).assertTrue();
        expect(alphaOf(poly, 100, 100)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0269 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0270
     * @tc.name testEnumPathIter0270
     * @tc.desc Verify the three point modes keep their ascending declaration order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0270', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0270 begin');
      await runCase('testEnumPathIter0270', async () => {
        const triangle: common2D.Point[] = pointsOf([50, 50, 150, 50, 100, 150]);
        const buffer: ArrayBuffer = await pointsBuffer(triangle, drawing.PointMode.POLYGON);
        expect(inkColumns(buffer, 0, 40)).assertEqual(0);
        expect(drawing.PointMode.POINTS < drawing.PointMode.POLYGON).assertTrue();
        expect(drawing.PointMode.LINES < drawing.PointMode.POLYGON).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0270 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0271
     * @tc.name testEnumPathIter0271
     * @tc.desc Verify VertexMode.TRIANGLES_VERTEXMODE keeps index 0 and fills one triangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathIter0271', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0271 begin');
      await runCase('testEnumPathIter0271', async () => {
        const positions: common2D.Point[] = pointsOf([40, 20, 160, 20, 100, 160]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLES_VERTEXMODE, positions);
        const inked: number = countInkedPixels(buffer);
        expect(drawing.VertexMode.TRIANGLES_VERTEXMODE).assertEqual(0);
        expect(alphaOf(buffer, 100, 60)).assertEqual(200);
        expect(inked > 6000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0271 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0272
     * @tc.name testEnumPathIter0272
     * @tc.desc Verify six vertices in TRIANGLES_VERTEXMODE become two disjoint triangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0272', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0272 begin');
      await runCase('testEnumPathIter0272', async () => {
        const positions: common2D.Point[] = pointsOf([10, 10, 60, 10, 35, 60, 140, 140, 190, 140, 165, 190]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLES_VERTEXMODE, positions);
        expect(inkBox(buffer, 0, 0, 80, 80) > 0).assertTrue();
        expect(inkBox(buffer, 120, 120, 200, 200) > 0).assertTrue();
        expect(inkBox(buffer, 90, 90, 110, 110)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0272 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0273
     * @tc.name testEnumPathIter0273
     * @tc.desc Verify six shared vertices fill more area than three isolated ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0273', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0273 begin');
      await runCase('testEnumPathIter0273', async () => {
        const single: number = await verticesInk(drawing.VertexMode.TRIANGLES_VERTEXMODE,
          pointsOf([40, 20, 160, 20, 100, 160]));
        const pair: number = await verticesInk(drawing.VertexMode.TRIANGLES_VERTEXMODE,
          pointsOf([40, 20, 160, 20, 100, 160, 40, 180, 160, 180, 100, 160]));
        expect(pair).assertLarger(single);
        expect(single).assertLarger(1000);
        expect(pair < single * 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0273 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0274
     * @tc.name testEnumPathIter0274
     * @tc.desc Verify the three vertex modes keep their ascending declaration order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0274', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0274 begin');
      await runCase('testEnumPathIter0274', async () => {
        expect(drawing.VertexMode.TRIANGLES_VERTEXMODE
          < drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE).assertTrue();
        expect(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE
          < drawing.VertexMode.TRIANGLESFAN_VERTEXMODE).assertTrue();
        expect(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0274 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0275
     * @tc.name testEnumPathIter0275
     * @tc.desc Verify a single TRIANGLES_VERTEXMODE triangle stays inside its bounding box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0275', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0275 begin');
      await runCase('testEnumPathIter0275', async () => {
        const positions: common2D.Point[] = pointsOf([40, 20, 160, 20, 100, 160]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLES_VERTEXMODE, positions);
        const inked: number = countInkedPixels(buffer);
        expect(inked < 19600).assertTrue();
        expect(alphaOf(buffer, 20, 20)).assertEqual(0);
        expect(inked).assertLarger(5000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0275 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0276
     * @tc.name testEnumPathIter0276
     * @tc.desc Verify a four vertex strip fills the quadrilateral between the strips.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathIter0276', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0276 begin');
      await runCase('testEnumPathIter0276', async () => {
        const positions: common2D.Point[] = pointsOf([20, 20, 180, 20, 20, 180, 180, 180]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, positions);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 20000).assertTrue();
        expect(inked < 32000).assertTrue();
        expect(alphaOf(buffer, 100, 100)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0276 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0277
     * @tc.name testEnumPathIter0277
     * @tc.desc Verify a three vertex strip covers the same pixels as one tile triangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0277', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0277 begin');
      await runCase('testEnumPathIter0277', async () => {
        const positions: common2D.Point[] = pointsOf([40, 20, 160, 20, 100, 160]);
        const strip: number = await verticesInk(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, positions);
        const tiles: number = await verticesInk(drawing.VertexMode.TRIANGLES_VERTEXMODE, positions);
        expect(Math.abs(strip - tiles) < 8).assertTrue();
        expect(strip).assertLarger(1000);
        expect(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0277 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0278
     * @tc.name testEnumPathIter0278
     * @tc.desc Verify a fifth strip vertex extends the covered area of the mesh.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0278', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0278 begin');
      await runCase('testEnumPathIter0278', async () => {
        const four: number = await verticesInk(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE,
          pointsOf([10, 10, 90, 10, 10, 90, 90, 90]));
        const five: number = await verticesInk(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE,
          pointsOf([10, 10, 90, 10, 10, 90, 90, 90, 10, 170]));
        expect(five).assertLarger(four);
        expect(four).assertLarger(5000);
        expect(five < 40000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0278 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0279
     * @tc.name testEnumPathIter0279
     * @tc.desc Verify the strip mesh leaves the bitmap corners outside the mesh transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0279', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0279 begin');
      await runCase('testEnumPathIter0279', async () => {
        const positions: common2D.Point[] = pointsOf([20, 20, 180, 20, 20, 180, 180, 180]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, positions);
        expect(alphaOf(buffer, 5, 5)).assertEqual(0);
        expect(alphaOf(buffer, 195, 195)).assertEqual(0);
        expect(inkColumns(buffer, 0, 15)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0279 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0280
     * @tc.name testEnumPathIter0280
     * @tc.desc Verify the central column of the strip mesh carries a full ink band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0280', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0280 begin');
      await runCase('testEnumPathIter0280', async () => {
        const positions: common2D.Point[] = pointsOf([20, 20, 180, 20, 20, 180, 180, 180]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, positions);
        expect(inkBox(buffer, 90, 30, 110, 170) > 2000).assertTrue();
        expect(alphaOf(buffer, 100, 25)).assertEqual(200);
        expect(inkBox(buffer, 20, 20, 180, 180) > 20000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0280 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0281
     * @tc.name testEnumPathIter0281
     * @tc.desc Verify a four vertex fan fills the two wedges around the first vertex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0281', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0281 begin');
      await runCase('testEnumPathIter0281', async () => {
        const positions: common2D.Point[] = pointsOf([100, 100, 20, 100, 100, 20, 180, 100]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE, positions);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 4500).assertTrue();
        expect(inked < 8500).assertTrue();
        expect(alphaOf(buffer, 80, 70)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0281 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0282
     * @tc.name testEnumPathIter0282
     * @tc.desc Verify a three vertex fan matches the tile triangle on the same vertices.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0282', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0282 begin');
      await runCase('testEnumPathIter0282', async () => {
        const positions: common2D.Point[] = pointsOf([40, 20, 160, 20, 100, 160]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE, positions);
        const fan: number = countInkedPixels(buffer);
        const tiles: number = await verticesInk(drawing.VertexMode.TRIANGLES_VERTEXMODE, positions);
        expect(Math.abs(fan - tiles) < 8).assertTrue();
        expect(alphaOf(buffer, 100, 60)).assertEqual(200);
        expect(fan > 6000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0282 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0283
     * @tc.name testEnumPathIter0283
     * @tc.desc Verify a fifth fan vertex adds another wedge around the hub vertex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0283', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0283 begin');
      await runCase('testEnumPathIter0283', async () => {
        const four: number = await verticesInk(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE,
          pointsOf([100, 100, 20, 100, 100, 20, 180, 100]));
        const five: number = await verticesInk(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE,
          pointsOf([100, 100, 20, 100, 100, 20, 180, 100, 100, 180]));
        expect(five).assertLarger(four);
        expect(four).assertLarger(4000);
        expect(five < 14000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0283 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0284
     * @tc.name testEnumPathIter0284
     * @tc.desc Verify fan and strip join the same five vertices into different areas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumPathIter0284', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0284 begin');
      await runCase('testEnumPathIter0284', async () => {
        const zigzag: common2D.Point[] = pointsOf([20, 100, 60, 20, 100, 100, 140, 20, 180, 100]);
        const fan: number = await verticesInk(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE, zigzag);
        const strip: number = await verticesInk(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, zigzag);
        expect(Math.abs(fan - strip) > 0).assertTrue();
        expect(fan).assertLarger(0);
        expect(strip).assertLarger(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0284 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0285
     * @tc.name testEnumPathIter0285
     * @tc.desc Verify the fan hub vertex is inked while a far corner stays transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0285', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0285 begin');
      await runCase('testEnumPathIter0285', async () => {
        const positions: common2D.Point[] = pointsOf([100, 100, 20, 100, 100, 20, 180, 100]);
        const buffer: ArrayBuffer = await verticesBuffer(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE, positions);
        expect(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE).assertEqual(2);
        expect(alphaOf(buffer, 100, 100)).assertEqual(0);
        expect(alphaOf(buffer, 10, 190)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0285 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0286
     * @tc.name testEnumPathIter0286
     * @tc.desc Verify CornerPos.TOP_LEFT_POS keeps index 0 and reads back the uniform radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathIter0286', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0286 begin');
      await runCase('testEnumPathIter0286', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 180, 180), 16, 16);
        const corner: common2D.Point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(drawing.CornerPos.TOP_LEFT_POS).assertEqual(0);
        expect(corner.x).assertEqual(16);
        expect(corner.y).assertEqual(16);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0286 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0287
     * @tc.name testEnumPathIter0287
     * @tc.desc Verify setCorner on the top left corner keeps the other corners untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0287', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0287 begin');
      await runCase('testEnumPathIter0287', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 180, 180), 12, 12);
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 30, 4);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS).x).assertEqual(30);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS).y).assertEqual(4);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS).x).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0287 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0288
     * @tc.name testEnumPathIter0288
     * @tc.desc Verify a rounded top left corner removes ink from that corner of the fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0288', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0288 begin');
      await runCase('testEnumPathIter0288', async () => {
        const path: drawing.Path = cornerPath(ltrb(20, 20, 180, 180),
          drawing.CornerPos.TOP_LEFT_POS, 60, 60);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(alphaOf(buffer, 30, 30)).assertEqual(0);
        expect(alphaOf(buffer, 175, 25)).assertEqual(200);
        expect(countInkedPixels(buffer) < 25600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0288 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0289
     * @tc.name testEnumPathIter0289
     * @tc.desc Verify CornerPos.TOP_RIGHT_POS keeps index 1 and reads back its radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0289', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0289 begin');
      await runCase('testEnumPathIter0289', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 150, 150), 9, 9);
        expect(drawing.CornerPos.TOP_RIGHT_POS).assertEqual(1);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS).x).assertEqual(9);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS).y).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0289 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0290
     * @tc.name testEnumPathIter0290
     * @tc.desc Verify the top right corner can hold two different radii on one corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0290', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0290 begin');
      await runCase('testEnumPathIter0290', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 150, 150), 5, 5);
        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 8, 24);
        const corner: common2D.Point = roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(corner.x).assertEqual(8);
        expect(corner.y).assertEqual(24);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS).y).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0290 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0291
     * @tc.name testEnumPathIter0291
     * @tc.desc Verify rounding only the top right corner trims ink on that side alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0291', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0291 begin');
      await runCase('testEnumPathIter0291', async () => {
        const path: drawing.Path = cornerPath(ltrb(20, 20, 180, 180),
          drawing.CornerPos.TOP_RIGHT_POS, 60, 60);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(inkBox(buffer, 120, 20, 180, 80)).assertLess(inkBox(buffer, 20, 20, 80, 80));
        expect(alphaOf(buffer, 25, 25)).assertEqual(200);
        expect(alphaOf(buffer, 175, 25)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0291 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0292
     * @tc.name testEnumPathIter0292
     * @tc.desc Verify CornerPos.BOTTOM_RIGHT_POS keeps index 2 and reads back its radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0292', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0292 begin');
      await runCase('testEnumPathIter0292', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(30, 30, 170, 170), 14, 14);
        expect(drawing.CornerPos.BOTTOM_RIGHT_POS).assertEqual(2);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS).x).assertEqual(14);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS).y).assertEqual(14);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0292 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0293
     * @tc.name testEnumPathIter0293
     * @tc.desc Verify clearing one corner radius restores a square corner on that side only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0293', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0293 begin');
      await runCase('testEnumPathIter0293', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(30, 30, 170, 170), 20, 20);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 0, 0);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS).x).assertEqual(0);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS).x).assertEqual(20);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS).y).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0293 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0294
     * @tc.name testEnumPathIter0294
     * @tc.desc Verify a rounded bottom right corner keeps ink on the bottom left side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0294', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0294 begin');
      await runCase('testEnumPathIter0294', async () => {
        const path: drawing.Path = cornerPath(ltrb(20, 20, 180, 180),
          drawing.CornerPos.BOTTOM_RIGHT_POS, 70, 70);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(alphaOf(buffer, 175, 175)).assertEqual(0);
        expect(alphaOf(buffer, 25, 175)).assertEqual(200);
        expect(inkBox(buffer, 140, 140, 180, 180) < inkBox(buffer, 20, 140, 60, 180)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0294 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0295
     * @tc.name testEnumPathIter0295
     * @tc.desc Verify the four corners of one round rect can hold four different radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0295', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0295 begin');
      await runCase('testEnumPathIter0295', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 0, 0);
        roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 4, 4);
        roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 8, 8);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 12, 12);
        roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 16, 16);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS).x).assertEqual(4);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS).x).assertEqual(12);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS).x).assertEqual(16);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0295 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0296
     * @tc.name testEnumPathIter0296
     * @tc.desc Verify the four corner identifiers follow the clockwise declaration order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathIter0296', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0296 begin');
      await runCase('testEnumPathIter0296', async () => {
        expect(drawing.CornerPos.TOP_LEFT_POS < drawing.CornerPos.TOP_RIGHT_POS).assertTrue();
        expect(drawing.CornerPos.TOP_RIGHT_POS < drawing.CornerPos.BOTTOM_RIGHT_POS).assertTrue();
        expect(drawing.CornerPos.BOTTOM_RIGHT_POS < drawing.CornerPos.BOTTOM_LEFT_POS).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0296 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0297
     * @tc.name testEnumPathIter0297
     * @tc.desc Verify rounding one corner shrinks the filled area of the same rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathIter0297', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0297 begin');
      await runCase('testEnumPathIter0297', async () => {
        const square: ArrayBuffer = await fillBuffer(cornerPath(ltrb(20, 20, 180, 180), null, 0, 0));
        const rounded: ArrayBuffer = await fillBuffer(cornerPath(ltrb(20, 20, 180, 180),
          drawing.CornerPos.TOP_LEFT_POS, 80, 80));
        expect(countInkedPixels(square)).assertEqual(25600);
        expect(countInkedPixels(rounded)).assertLess(countInkedPixels(square));
        expect(alphaOf(rounded, 60, 60)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathIter0297 end');
    });
  });
}
