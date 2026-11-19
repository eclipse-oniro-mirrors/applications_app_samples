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
const SIZE: number = 200;
const AREA: number = SIZE * SIZE;
const BOX_AREA: number = 80 * 80;

/**
 * Build a path holding one axis aligned rectangle with the default direction.
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
 * Build a rectangle path with an explicit contour direction.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @param { drawing.PathDirection } direction - Contour direction.
 * @returns { drawing.Path } Rectangle path.
 */
function directedRect(left: number, top: number, right: number, bottom: number,
  direction: drawing.PathDirection): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(left, top, right, bottom), direction);
  return path;
}

/**
 * Build a circle path with an explicit contour direction.
 *
 * @param { number } centerX - Horizontal center.
 * @param { number } centerY - Vertical center.
 * @param { number } radius - Circle radius.
 * @param { drawing.PathDirection } direction - Contour direction.
 * @returns { drawing.Path } Circle path.
 */
function circlePath(centerX: number, centerY: number, radius: number,
  direction: drawing.PathDirection): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(centerX, centerY, radius, direction);
  return path;
}

/**
 * Build an oval path with an explicit start angle and direction.
 *
 * @param { common2D.Rect } rect - Bounding rectangle.
 * @param { number } start - Start angle in degrees.
 * @param { drawing.PathDirection } direction - Contour direction.
 * @returns { drawing.Path } Oval path.
 */
function ovalPath(rect: common2D.Rect, start: number, direction: drawing.PathDirection): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addOval(rect, start, direction);
  return path;
}

/**
 * Build a rounded rectangle path with an explicit contour direction.
 *
 * @param { common2D.Rect } rect - Bounding rectangle.
 * @param { number } radius - Corner radius.
 * @param { drawing.PathDirection } direction - Contour direction.
 * @returns { drawing.Path } Rounded rectangle path.
 */
function roundRectPath(rect: common2D.Rect, radius: number,
  direction: drawing.PathDirection): drawing.Path {
  const roundRect: drawing.RoundRect = new drawing.RoundRect(rect, radius, radius);
  const path: drawing.Path = new drawing.Path();
  path.addRoundRect(roundRect, direction);
  return path;
}

/**
 * Build a straight open path between two points.
 *
 * @param { number } startX - Start x.
 * @param { number } startY - Start y.
 * @param { number } endX - End x.
 * @param { number } endY - End y.
 * @returns { drawing.Path } Line path.
 */
function linePath(startX: number, startY: number, endX: number, endY: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(startX, startY);
  path.lineTo(endX, endY);
  return path;
}

/**
 * Build a V shaped open path with the corner pointing down.
 *
 * @param { number } leftX - Left end x.
 * @param { number } rightX - Right end x.
 * @param { number } topY - Top end y.
 * @param { number } cornerY - Corner y.
 * @returns { drawing.Path } Two segment path.
 */
function vPath(leftX: number, rightX: number, topY: number, cornerY: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(leftX, topY);
  path.lineTo((leftX + rightX) / 2, cornerY);
  path.lineTo(rightX, topY);
  return path;
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
 * Count the painted pixels inside a rectangle of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of painted pixels inside the rectangle.
 */
function inkedInside(buffer: ArrayBuffer, left: number, top: number, right: number,
  bottom: number): number {
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
 * Find the leftmost column that carries at least one painted pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Column index, or SIZE when nothing is painted.
 */
function firstInkColumn(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  for (let x: number = 0; x < SIZE; x++) {
    for (let y: number = 0; y < SIZE; y++) {
      if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
        return x;
      }
    }
  }
  return SIZE;
}

/**
 * Count the painted pixels inside a column range of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } from - First column, inclusive.
 * @param { number } to - Last column, exclusive.
 * @returns { number } Number of painted pixels in the column range.
 */
function inkInColumns(buffer: ArrayBuffer, from: number, to: number): number {
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
 * Fill a path with a hard edged brush on a transparent canvas.
 *
 * @param { drawing.Path } path - Path to fill.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillBuffer(path: drawing.Path): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0, 120, 220));
  brush.setAntiAlias(false);
  target.canvas.attachBrush(brush);
  target.canvas.drawPath(path);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Fill a path and count the painted pixels.
 *
 * @param { drawing.Path } path - Path to fill.
 * @returns { Promise<number> } Number of painted pixels.
 */
async function fillInk(path: drawing.Path): Promise<number> {
  const buffer: ArrayBuffer = await fillBuffer(path);
  return countInkedPixels(buffer);
}

/**
 * Stroke a path with a solid pen and count the painted pixels.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { number } width - Stroke width.
 * @returns { Promise<number> } Number of painted pixels.
 */
async function strokeInk(path: drawing.Path, width: number): Promise<number> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 20, 40, 160));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
  target.canvas.attachPen(pen);
  target.canvas.drawPath(path);
  target.canvas.detachPen();
  return countInkedPixels(await readPixelBuffer(target.pixelMap));
}

/**
 * Build the square stamp used as the dash pattern.
 *
 * @returns { drawing.Path } Small square path.
 */
function dashStamp(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(0, 0, 8, 8));
  return path;
}

/**
 * Stroke a path with a dashed pen and return the raw pixels.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { number } advance - Distance between two dash stamps.
 * @param { number } phase - Phase offset of the dash pattern.
 * @param { drawing.PathDashStyle } style - Dash layout style.
 * @param { number } width - Stroke width.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function dashBuffer(path: drawing.Path, advance: number, phase: number,
  style: drawing.PathDashStyle, width: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 20, 40, 160));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
  pen.setPathEffect(drawing.PathEffect.createPathDashEffect(dashStamp(), advance, phase, style));
  target.canvas.attachPen(pen);
  target.canvas.drawPath(path);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stroke a path with a dashed pen and count the painted pixels.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { number } advance - Distance between two dash stamps.
 * @param { number } phase - Phase offset of the dash pattern.
 * @param { drawing.PathDashStyle } style - Dash layout style.
 * @param { number } width - Stroke width.
 * @returns { Promise<number> } Number of painted pixels.
 */
async function dashInk(path: drawing.Path, advance: number, phase: number,
  style: drawing.PathDashStyle, width: number): Promise<number> {
  const buffer: ArrayBuffer = await dashBuffer(path, advance, phase, style, width);
  return countInkedPixels(buffer);
}

/**
 * Sample the measurement matrix of a path into a nine value array.
 *
 * @param { drawing.Path } path - Path used as the measured contour.
 * @param { boolean } closed - Whether the contour is treated as closed.
 * @param { number } distance - Distance from the contour start.
 * @param { drawing.PathMeasureMatrixFlags } flags - Which matrix parts to fill.
 * @returns { number[] } Matrix values in row major order.
 */
function measureMatrix(path: drawing.Path, closed: boolean, distance: number,
  flags: drawing.PathMeasureMatrixFlags): number[] {
  const matrix: drawing.Matrix = new drawing.Matrix();
  path.getMatrix(closed, distance, matrix, flags);
  return matrix.getAll();
}

/**
 * Sample only the position of a measured contour.
 *
 * @param { drawing.Path } path - Path used as the measured contour.
 * @param { boolean } closed - Whether the contour is treated as closed.
 * @param { number } distance - Distance from the contour start.
 * @returns { number[] } Position x and y.
 */
function positionAt(path: drawing.Path, closed: boolean, distance: number): number[] {
  const position: common2D.Point = { x: 0, y: 0 };
  const tangent: common2D.Point = { x: 0, y: 0 };
  path.getPositionAndTangent(closed, distance, position, tangent);
  return [position.x, position.y];
}

export default function enumPathStyleTest() {
  describe('EnumPathStyleTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0158
     * @tc.name testEnumPathStyle0158
     * @tc.desc Verify a new path defaults to PathFillType.WINDING and fills one box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumPathStyle0158', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0158 begin');
      await runCase('testEnumPathStyle0158', async () => {
        const path: drawing.Path = new drawing.Path();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        path.addRect(ltrb(40, 40, 120, 120));
        expect(path.contains(80, 80)).assertTrue();
        expect(path.contains(10, 10)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0158 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0159
     * @tc.name testEnumPathStyle0159
     * @tc.desc Verify PathFillType.WINDING keeps a nested same direction contour filled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0159', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0159 begin');
      await runCase('testEnumPathStyle0159', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(40, 40, 80, 80));
        path.setFillType(drawing.PathFillType.WINDING);
        expect(path.contains(60, 60)).assertTrue();
        expect(await fillInk(path)).assertEqual(14400);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0159 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0160
     * @tc.name testEnumPathStyle0160
     * @tc.desc Verify the winding fill paints the inner contour of a nested same direction box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0160', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0160 begin');
      await runCase('testEnumPathStyle0160', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(40, 40, 80, 80));
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(inkedInside(buffer, 40, 40, 80, 80)).assertEqual(1600);
        expect(inkedInside(buffer, 0, 0, 120, 120)).assertEqual(14400);
        expect(countInkedPixels(buffer)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0160 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0161
     * @tc.name testEnumPathStyle0161
     * @tc.desc Verify the winding fill leaves a hole when two nested contours run in opposite directions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0161', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0161 begin');
      await runCase('testEnumPathStyle0161', async () => {
        const outer: drawing.Path = directedRect(0, 0, 120, 120, drawing.PathDirection.CLOCKWISE);
        outer.addRect(ltrb(40, 40, 80, 80), drawing.PathDirection.COUNTER_CLOCKWISE);
        outer.setFillType(drawing.PathFillType.WINDING);
        expect(outer.contains(60, 60)).assertFalse();
        expect(outer.contains(10, 10)).assertTrue();
        expect(await fillInk(outer)).assertEqual(12800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0161 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0162
     * @tc.name testEnumPathStyle0162
     * @tc.desc Verify the winding fill of two overlapping boxes keeps the shared band painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0162', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0162 begin');
      await runCase('testEnumPathStyle0162', async () => {
        const path: drawing.Path = rectPath(0, 0, 80, 80);
        path.addRect(ltrb(40, 40, 120, 120));
        path.setFillType(drawing.PathFillType.WINDING);
        expect(path.contains(60, 60)).assertTrue();
        expect(path.contains(20, 20)).assertTrue();
        expect(await fillInk(path)).assertEqual(11200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0162 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0163
     * @tc.name testEnumPathStyle0163
     * @tc.desc Verify switching from PathFillType.EVEN_ODD back to WINDING refills the hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0163', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0163 begin');
      await runCase('testEnumPathStyle0163', async () => {
        const path: drawing.Path = rectPath(0, 0, 100, 100);
        path.addRect(ltrb(20, 20, 60, 60));
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        const hole: boolean = path.contains(40, 40);
        path.setFillType(drawing.PathFillType.WINDING);
        expect(hole).assertFalse();
        expect(path.contains(40, 40)).assertTrue();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0163 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0164
     * @tc.name testEnumPathStyle0164
     * @tc.desc Verify PathFillType.WINDING keeps its numeric value and fills a disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0164', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0164 begin');
      await runCase('testEnumPathStyle0164', async () => {
        const path: drawing.Path = circlePath(100, 100, 60, drawing.PathDirection.CLOCKWISE);
        path.setFillType(drawing.PathFillType.WINDING);
        const ink: number = await fillInk(path);
        expect(drawing.PathFillType.WINDING).assertEqual(0);
        expect(Math.abs(ink - Math.PI * 3600) < 200).assertTrue();
        expect(path.contains(100, 100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0164 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0165
     * @tc.name testEnumPathStyle0165
     * @tc.desc Verify PathFillType.EVEN_ODD turns two nested same direction contours into a ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0165', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0165 begin');
      await runCase('testEnumPathStyle0165', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(40, 40, 80, 80));
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(path.contains(60, 60)).assertFalse();
        expect(path.contains(10, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0165 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0166
     * @tc.name testEnumPathStyle0166
     * @tc.desc Verify the even odd fill paints only the ring band of two nested boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0166', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0166 begin');
      await runCase('testEnumPathStyle0166', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(40, 40, 80, 80));
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(countInkedPixels(buffer)).assertEqual(12800);
        expect(inkedInside(buffer, 40, 40, 80, 80)).assertEqual(0);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0166 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0167
     * @tc.name testEnumPathStyle0167
     * @tc.desc Verify PathFillType.EVEN_ODD empties the shared band of two overlapping boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0167', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0167 begin');
      await runCase('testEnumPathStyle0167', async () => {
        const path: drawing.Path = rectPath(0, 0, 80, 80);
        path.addRect(ltrb(40, 40, 120, 120));
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(path.contains(60, 60)).assertFalse();
        expect(path.contains(20, 20)).assertTrue();
        expect(await fillInk(path)).assertEqual(9600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0167 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0168
     * @tc.name testEnumPathStyle0168
     * @tc.desc Verify the even odd ring leaves a transparent core on a square frame.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0168', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0168 begin');
      await runCase('testEnumPathStyle0168', async () => {
        const path: drawing.Path = rectPath(0, 0, 160, 160);
        path.addRect(ltrb(40, 40, 120, 120));
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(alphaAt(buffer, 80, 80)).assertEqual(0);
        expect(alphaAt(buffer, 10, 80)).assertEqual(255);
        expect(countInkedPixels(buffer)).assertEqual(25600 - 6400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0168 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0169
     * @tc.name testEnumPathStyle0169
     * @tc.desc Verify three nested boxes alternate between painted and empty under EVEN_ODD.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0169', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0169 begin');
      await runCase('testEnumPathStyle0169', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(20, 20, 100, 100));
        path.addRect(ltrb(40, 40, 80, 80));
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(path.contains(60, 60)).assertTrue();
        expect(path.contains(30, 60)).assertFalse();
        expect(await fillInk(path)).assertEqual(9600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0169 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0170
     * @tc.name testEnumPathStyle0170
     * @tc.desc Verify PathFillType.EVEN_ODD keeps its numeric value on a counterclockwise circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0170', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0170 begin');
      await runCase('testEnumPathStyle0170', async () => {
        const path: drawing.Path = circlePath(80, 80, 40, drawing.PathDirection.COUNTER_CLOCKWISE);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(drawing.PathFillType.EVEN_ODD).assertEqual(1);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(path.contains(80, 80)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0170 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0171
     * @tc.name testEnumPathStyle0171
     * @tc.desc Verify the same nested path paints one box more under WINDING than under EVEN_ODD.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0171', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0171 begin');
      await runCase('testEnumPathStyle0171', async () => {
        const evenOdd: drawing.Path = rectPath(0, 0, 120, 120);
        evenOdd.addRect(ltrb(40, 40, 80, 80));
        evenOdd.setFillType(drawing.PathFillType.EVEN_ODD);
        const winding: drawing.Path = rectPath(0, 0, 120, 120);
        winding.addRect(ltrb(40, 40, 80, 80));
        winding.setFillType(drawing.PathFillType.WINDING);
        expect(evenOdd.contains(60, 60)).assertFalse();
        expect(winding.contains(60, 60)).assertTrue();
        const windingInk: number = await fillInk(winding);
        const evenOddInk: number = await fillInk(evenOdd);
        expect(windingInk - evenOddInk).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0171 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0172
     * @tc.name testEnumPathStyle0172
     * @tc.desc Verify PathFillType.INVERSE_WINDING swaps the inside and outside of one box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0172', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0172 begin');
      await runCase('testEnumPathStyle0172', async () => {
        const path: drawing.Path = rectPath(40, 40, 120, 120);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_WINDING);
        expect(path.contains(80, 80)).assertFalse();
        expect(path.contains(10, 10)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0172 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0173
     * @tc.name testEnumPathStyle0173
     * @tc.desc Verify the inverse winding fill paints the canvas minus one box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0173', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0173 begin');
      await runCase('testEnumPathStyle0173', async () => {
        const path: drawing.Path = rectPath(40, 40, 120, 120);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(countInkedPixels(buffer)).assertEqual(AREA - 6400);
        expect(alphaAt(buffer, 80, 80)).assertEqual(0);
        expect(alphaAt(buffer, 5, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0173 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0174
     * @tc.name testEnumPathStyle0174
     * @tc.desc Verify the inverse winding fill punches a disc out of the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0174', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0174 begin');
      await runCase('testEnumPathStyle0174', async () => {
        const path: drawing.Path = circlePath(100, 100, 50, drawing.PathDirection.CLOCKWISE);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const ink: number = await fillInk(path);
        expect(path.contains(100, 100)).assertFalse();
        expect(Math.abs(ink - (AREA - Math.PI * 2500)) < 300).assertTrue();
        expect(path.contains(5, 5)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0174 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0175
     * @tc.name testEnumPathStyle0175
     * @tc.desc Verify inverse winding rejects both bands of two nested same direction boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0175', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0175 begin');
      await runCase('testEnumPathStyle0175', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(40, 40, 80, 80));
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        expect(path.contains(60, 60)).assertFalse();
        expect(path.contains(20, 20)).assertFalse();
        expect(await fillInk(path)).assertEqual(AREA - 14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0175 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0176
     * @tc.name testEnumPathStyle0176
     * @tc.desc Verify PathFillType.INVERSE_WINDING keeps its numeric value across a fill type switch.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0176', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0176 begin');
      await runCase('testEnumPathStyle0176', async () => {
        const path: drawing.Path = rectPath(20, 20, 100, 100);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        expect(drawing.PathFillType.INVERSE_WINDING).assertEqual(2);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_WINDING);
        expect(path.contains(60, 60)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0176 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0177
     * @tc.name testEnumPathStyle0177
     * @tc.desc Verify inverse winding punches two separate holes for two disjoint boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0177', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0177 begin');
      await runCase('testEnumPathStyle0177', async () => {
        const path: drawing.Path = rectPath(0, 0, 60, 60);
        path.addRect(ltrb(140, 140, 200, 200));
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const ink: number = await fillInk(path);
        expect(ink).assertEqual(AREA - 7200);
        expect(path.contains(30, 30)).assertFalse();
        expect(path.contains(170, 170)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0177 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0178
     * @tc.name testEnumPathStyle0178
     * @tc.desc Verify winding and inverse winding split the canvas into two complementary areas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0178', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0178 begin');
      await runCase('testEnumPathStyle0178', async () => {
        const winding: drawing.Path = rectPath(40, 40, 120, 120);
        const inverse: drawing.Path = rectPath(40, 40, 120, 120);
        inverse.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const part: number = await fillInk(winding);
        const rest: number = await fillInk(inverse);
        expect(part).assertEqual(BOX_AREA);
        expect(rest).assertEqual(AREA - BOX_AREA);
        expect(part + rest).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0178 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0179
     * @tc.name testEnumPathStyle0179
     * @tc.desc Verify PathFillType.INVERSE_EVEN_ODD swaps the inside and outside of one box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0179', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0179 begin');
      await runCase('testEnumPathStyle0179', async () => {
        const path: drawing.Path = rectPath(60, 60, 140, 140);
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.contains(100, 100)).assertFalse();
        expect(path.contains(10, 190)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0179 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0180
     * @tc.name testEnumPathStyle0180
     * @tc.desc Verify the inverse even odd fill keeps the box interior and one margin empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0180', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0180 begin');
      await runCase('testEnumPathStyle0180', async () => {
        const path: drawing.Path = rectPath(40, 40, 120, 120);
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(inkedInside(buffer, 40, 40, 120, 120)).assertEqual(0);
        expect(inkedInside(buffer, 0, 0, 40, 200)).assertEqual(40 * 200);
        expect(countInkedPixels(buffer)).assertEqual(AREA - 6400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0180 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0181
     * @tc.name testEnumPathStyle0181
     * @tc.desc Verify inverse even odd repaints the inner box of two nested same direction contours.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0181', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0181 begin');
      await runCase('testEnumPathStyle0181', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(40, 40, 80, 80));
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.contains(60, 60)).assertTrue();
        expect(path.contains(20, 20)).assertFalse();
        expect(await fillInk(path)).assertEqual(AREA - 12800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0181 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0182
     * @tc.name testEnumPathStyle0182
     * @tc.desc Verify inverse even odd keeps only the shared band of two overlapping boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0182', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0182 begin');
      await runCase('testEnumPathStyle0182', async () => {
        const path: drawing.Path = rectPath(0, 0, 80, 80);
        path.addRect(ltrb(40, 40, 120, 120));
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(path.contains(60, 60)).assertTrue();
        expect(alphaAt(buffer, 20, 20)).assertEqual(0);
        expect(inkedInside(buffer, 40, 40, 80, 80)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0182 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0183
     * @tc.name testEnumPathStyle0183
     * @tc.desc Verify PathFillType.INVERSE_EVEN_ODD keeps its numeric value after a fill type switch.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0183', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0183 begin');
      await runCase('testEnumPathStyle0183', async () => {
        const path: drawing.Path = rectPath(10, 10, 90, 90);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(drawing.PathFillType.INVERSE_EVEN_ODD).assertEqual(3);
        expect(path.contains(50, 50)).assertFalse();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_EVEN_ODD);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0183 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0184
     * @tc.name testEnumPathStyle0184
     * @tc.desc Verify three nested boxes alternate again under the inverse even odd fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0184', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0184 begin');
      await runCase('testEnumPathStyle0184', async () => {
        const path: drawing.Path = rectPath(0, 0, 120, 120);
        path.addRect(ltrb(20, 20, 100, 100));
        path.addRect(ltrb(40, 40, 80, 80));
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        expect(path.contains(60, 60)).assertFalse();
        expect(path.contains(30, 60)).assertTrue();
        expect(path.contains(10, 60)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0184 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0185
     * @tc.name testEnumPathStyle0185
     * @tc.desc Verify even odd and inverse even odd split the canvas into two complementary areas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0185', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0185 begin');
      await runCase('testEnumPathStyle0185', async () => {
        const evenOdd: drawing.Path = rectPath(0, 0, 120, 120);
        evenOdd.addRect(ltrb(40, 40, 80, 80));
        evenOdd.setFillType(drawing.PathFillType.EVEN_ODD);
        const inverse: drawing.Path = rectPath(0, 0, 120, 120);
        inverse.addRect(ltrb(40, 40, 80, 80));
        inverse.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        const ring: number = await fillInk(evenOdd);
        const rest: number = await fillInk(inverse);
        expect(ring).assertEqual(12800);
        expect(rest).assertEqual(AREA - 12800);
        expect(ring + rest).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0185 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0186
     * @tc.name testEnumPathStyle0186
     * @tc.desc Verify PathDirection.CLOCKWISE builds a closed rectangle with a 320 long outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0186', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0186 begin');
      await runCase('testEnumPathStyle0186', async () => {
        const path: drawing.Path = directedRect(10, 10, 90, 90, drawing.PathDirection.CLOCKWISE);
        expect(Math.round(path.getLength(true))).assertEqual(320);
        expect(path.contains(50, 50)).assertTrue();
        expect(boundsOf(path)[0]).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0186 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0187
     * @tc.name testEnumPathStyle0187
     * @tc.desc Verify PathDirection.CLOCKWISE builds a circle whose outline matches its circumference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0187', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0187 begin');
      await runCase('testEnumPathStyle0187', async () => {
        const path: drawing.Path = circlePath(100, 100, 40, drawing.PathDirection.CLOCKWISE);
        expect(Math.abs(path.getLength(true) - Math.PI * 80) < 6).assertTrue();
        expect(path.contains(100, 100)).assertTrue();
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0187 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0188
     * @tc.name testEnumPathStyle0188
     * @tc.desc Verify PathDirection.CLOCKWISE keeps the oval inside its bounding rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0188', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0188 begin');
      await runCase('testEnumPathStyle0188', async () => {
        const path: drawing.Path = ovalPath(ltrb(40, 60, 160, 120), 0, drawing.PathDirection.CLOCKWISE);
        const bounds: number[] = boundsOf(path);
        expect(bounds[2]).assertEqual(160);
        expect(bounds[1]).assertEqual(60);
        expect(path.contains(100, 90)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0188 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0189
     * @tc.name testEnumPathStyle0189
     * @tc.desc Verify two nested clockwise boxes stay completely filled under the winding rule.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0189', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0189 begin');
      await runCase('testEnumPathStyle0189', async () => {
        const path: drawing.Path = directedRect(0, 0, 120, 120, drawing.PathDirection.CLOCKWISE);
        path.addRect(ltrb(40, 40, 80, 80), drawing.PathDirection.CLOCKWISE);
        expect(path.contains(60, 60)).assertTrue();
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(inkedInside(buffer, 40, 40, 80, 80)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0189 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0190
     * @tc.name testEnumPathStyle0190
     * @tc.desc Verify a clockwise outer box and a counterclockwise inner box leave a hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0190', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0190 begin');
      await runCase('testEnumPathStyle0190', async () => {
        const path: drawing.Path = directedRect(0, 0, 120, 120, drawing.PathDirection.CLOCKWISE);
        path.addRect(ltrb(40, 40, 80, 80), drawing.PathDirection.COUNTER_CLOCKWISE);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(path.contains(60, 60)).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(12800);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0190 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0191
     * @tc.name testEnumPathStyle0191
     * @tc.desc Verify PathDirection.CLOCKWISE is accepted by the rounded rectangle overload.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0191', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0191 begin');
      await runCase('testEnumPathStyle0191', async () => {
        const path: drawing.Path = roundRectPath(ltrb(20, 20, 140, 120), 20,
          drawing.PathDirection.CLOCKWISE);
        expect(path.contains(80, 70)).assertTrue();
        expect(path.getLength(true) > 300).assertTrue();
        expect(boundsOf(path)[3]).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0191 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0192
     * @tc.name testEnumPathStyle0192
     * @tc.desc Verify PathDirection.COUNTER_CLOCKWISE keeps the same outline and vertex count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0192', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0192 begin');
      await runCase('testEnumPathStyle0192', async () => {
        const path: drawing.Path = directedRect(30, 30, 130, 110,
          drawing.PathDirection.COUNTER_CLOCKWISE);
        expect(path.getPointData().length).assertEqual(4);
        expect(path.getLength(true)).assertEqual(path.getLength(false));
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0192 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0193
     * @tc.name testEnumPathStyle0193
     * @tc.desc Verify both circle directions produce the same circumference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0193', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0193 begin');
      await runCase('testEnumPathStyle0193', async () => {
        const counter: drawing.Path = circlePath(90, 90, 35, drawing.PathDirection.COUNTER_CLOCKWISE);
        const clockwise: drawing.Path = circlePath(90, 90, 35, drawing.PathDirection.CLOCKWISE);
        expect(Math.abs(counter.getLength(true) - clockwise.getLength(true)) < 0.5).assertTrue();
        expect(counter.contains(90, 90)).assertTrue();
        expect(counter.getPointData().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0193 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0194
     * @tc.name testEnumPathStyle0194
     * @tc.desc Verify both oval directions keep the same bounds and outline length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0194', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0194 begin');
      await runCase('testEnumPathStyle0194', async () => {
        const counter: drawing.Path = ovalPath(ltrb(60, 40, 160, 120), 0,
          drawing.PathDirection.COUNTER_CLOCKWISE);
        const clockwise: drawing.Path = ovalPath(ltrb(60, 40, 160, 120), 0,
          drawing.PathDirection.CLOCKWISE);
        expect(Math.round(counter.getLength(true))).assertEqual(Math.round(clockwise.getLength(true)));
        expect(boundsOf(counter)[0]).assertEqual(60);
        expect(counter.contains(110, 80)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0194 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0195
     * @tc.name testEnumPathStyle0195
     * @tc.desc Verify two nested counterclockwise boxes stay filled at every sampled pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0195', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0195 begin');
      await runCase('testEnumPathStyle0195', async () => {
        const path: drawing.Path = directedRect(0, 0, 120, 120,
          drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addRect(ltrb(40, 40, 80, 80), drawing.PathDirection.COUNTER_CLOCKWISE);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(path.contains(60, 60)).assertTrue();
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
        expect(inkedInside(buffer, 40, 40, 80, 80)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0195 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0196
     * @tc.name testEnumPathStyle0196
     * @tc.desc Verify a counterclockwise outer box and a clockwise inner box leave a ring band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0196', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0196 begin');
      await runCase('testEnumPathStyle0196', async () => {
        const path: drawing.Path = directedRect(0, 0, 120, 120,
          drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addRect(ltrb(40, 40, 80, 80), drawing.PathDirection.CLOCKWISE);
        const buffer: ArrayBuffer = await fillBuffer(path);
        expect(path.contains(60, 60)).assertFalse();
        expect(inkedInside(buffer, 40, 40, 80, 80)).assertEqual(0);
        expect(inkedInside(buffer, 0, 0, 120, 40)).assertEqual(4800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0196 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0197
     * @tc.name testEnumPathStyle0197
     * @tc.desc Verify both rounded rectangle directions keep the same outline length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0197', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0197 begin');
      await runCase('testEnumPathStyle0197', async () => {
        const counter: drawing.Path = roundRectPath(ltrb(20, 20, 140, 120), 20,
          drawing.PathDirection.COUNTER_CLOCKWISE);
        const clockwise: drawing.Path = roundRectPath(ltrb(20, 20, 140, 120), 20,
          drawing.PathDirection.CLOCKWISE);
        expect(Math.abs(counter.getLength(true) - clockwise.getLength(true)) < 0.5).assertTrue();
        expect(counter.contains(80, 70)).assertTrue();
        expect(counter.getFillType()).assertEqual(drawing.PathFillType.WINDING);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0197 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0198
     * @tc.name testEnumPathStyle0198
     * @tc.desc Verify PathDashStyle.TRANSLATE leaves gaps in a straight stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0198', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0198 begin');
      await runCase('testEnumPathStyle0198', async () => {
        const line: drawing.Path = linePath(20, 60, 180, 60);
        const dashed: number = await dashInk(line, 24, 0, drawing.PathDashStyle.TRANSLATE, 6);
        const solid: number = await strokeInk(line, 6);
        expect(dashed > 0).assertTrue();
        expect(dashed < solid).assertTrue();
        expect(solid > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0198 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0199
     * @tc.name testEnumPathStyle0199
     * @tc.desc Verify a wider advance reduces the painted area of a translated dash.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0199', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0199 begin');
      await runCase('testEnumPathStyle0199', async () => {
        const line: drawing.Path = linePath(20, 60, 180, 60);
        const dense: number = await dashInk(line, 24, 0, drawing.PathDashStyle.TRANSLATE, 6);
        const sparse: number = await dashInk(line, 48, 0, drawing.PathDashStyle.TRANSLATE, 6);
        const solid: number = await strokeInk(line, 6);
        expect(dense > sparse).assertTrue();
        expect(sparse > 0).assertTrue();
        expect(dense < solid).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0199 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0200
     * @tc.name testEnumPathStyle0200
     * @tc.desc Verify a non zero phase removes the first translated dash stamp.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0200', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0200 begin');
      await runCase('testEnumPathStyle0200', async () => {
        const line: drawing.Path = linePath(20, 60, 180, 60);
        const base: ArrayBuffer = await dashBuffer(line, 40, 0, drawing.PathDashStyle.TRANSLATE, 6);
        const shifted: ArrayBuffer = await dashBuffer(line, 40, 20, drawing.PathDashStyle.TRANSLATE, 6);
        expect(inkInColumns(base, 20, 26) > 0).assertTrue();
        expect(inkInColumns(shifted, 20, 26)).assertEqual(0);
        expect(countInkedPixels(shifted) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0200 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0201
     * @tc.name testEnumPathStyle0201
     * @tc.desc Verify PathDashStyle.TRANSLATE works on a closed circle contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0201', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0201 begin');
      await runCase('testEnumPathStyle0201', async () => {
        const circle: drawing.Path = circlePath(100, 100, 60, drawing.PathDirection.CLOCKWISE);
        const dashed: number = await dashInk(circle, 20, 0, drawing.PathDashStyle.TRANSLATE, 6);
        const solid: number = await strokeInk(circle, 6);
        expect(dashed > 0).assertTrue();
        expect(dashed < solid).assertTrue();
        expect(solid).assertEqual(2255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0201 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0202
     * @tc.name testEnumPathStyle0202
     * @tc.desc Verify a large advance paints translated stamps only at the expected columns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0202', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0202 begin');
      await runCase('testEnumPathStyle0202', async () => {
        const line: drawing.Path = linePath(20, 60, 180, 60);
        const buffer: ArrayBuffer = await dashBuffer(line, 100, 0, drawing.PathDashStyle.TRANSLATE, 6);
        expect(inkInColumns(buffer, 40, 100)).assertEqual(0);
        expect(inkInColumns(buffer, 20, 30) > 0).assertTrue();
        expect(inkInColumns(buffer, 115, 130) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0202 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0203
     * @tc.name testEnumPathStyle0203
     * @tc.desc Verify PathDashStyle.ROTATE leaves gaps on a diagonal stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0203', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0203 begin');
      await runCase('testEnumPathStyle0203', async () => {
        const diagonal: drawing.Path = linePath(40, 40, 160, 160);
        const dashed: number = await dashInk(diagonal, 30, 0, drawing.PathDashStyle.ROTATE, 6);
        const solid: number = await strokeInk(diagonal, 6);
        expect(dashed > 0).assertTrue();
        expect(dashed < solid).assertTrue();
        expect(diagonal.getLength(false) > 160).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0203 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0204
     * @tc.name testEnumPathStyle0204
     * @tc.desc Verify a wider advance reduces the painted area of a rotated dash.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0204', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0204 begin');
      await runCase('testEnumPathStyle0204', async () => {
        const diagonal: drawing.Path = linePath(40, 40, 160, 160);
        const dense: number = await dashInk(diagonal, 30, 0, drawing.PathDashStyle.ROTATE, 6);
        const sparse: number = await dashInk(diagonal, 60, 0, drawing.PathDashStyle.ROTATE, 6);
        const solid: number = await strokeInk(diagonal, 6);
        expect(sparse > 0).assertTrue();
        expect(dense).assertLarger(sparse);
        expect(sparse < solid).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0204 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0205
     * @tc.name testEnumPathStyle0205
     * @tc.desc Verify a phase shift moves the first rotated stamp further along the diagonal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0205', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0205 begin');
      await runCase('testEnumPathStyle0205', async () => {
        const diagonal: drawing.Path = linePath(40, 40, 160, 160);
        const base: ArrayBuffer = await dashBuffer(diagonal, 40, 0, drawing.PathDashStyle.ROTATE, 6);
        const shifted: ArrayBuffer = await dashBuffer(diagonal, 40, 20, drawing.PathDashStyle.ROTATE, 6);
        expect(firstInkColumn(shifted) > firstInkColumn(base)).assertTrue();
        expect(firstInkColumn(base)).assertEqual(34);
        expect(countInkedPixels(shifted) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0205 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0206
     * @tc.name testEnumPathStyle0206
     * @tc.desc Verify PathDashStyle.ROTATE works on a counterclockwise circle contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0206', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0206 begin');
      await runCase('testEnumPathStyle0206', async () => {
        const circle: drawing.Path = circlePath(110, 100, 50, drawing.PathDirection.COUNTER_CLOCKWISE);
        const dashed: number = await dashInk(circle, 25, 0, drawing.PathDashStyle.ROTATE, 8);
        const solid: number = await strokeInk(circle, 8);
        expect(dashed > 0).assertTrue();
        expect(dashed < solid).assertTrue();
        expect(circle.getLength(true) > 300).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0206 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0207
     * @tc.name testEnumPathStyle0207
     * @tc.desc Verify PathDashStyle.ROTATE follows the rounded corners of a frame.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0207', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0207 begin');
      await runCase('testEnumPathStyle0207', async () => {
        const frame: drawing.Path = roundRectPath(ltrb(30, 30, 170, 130), 16,
          drawing.PathDirection.CLOCKWISE);
        const dashed: number = await dashInk(frame, 28, 0, drawing.PathDashStyle.ROTATE, 6);
        const solid: number = await strokeInk(frame, 6);
        expect(dashed > 0).assertTrue();
        expect(dashed < solid).assertTrue();
        expect(boundsOf(frame)[2]).assertEqual(170);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0207 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0208
     * @tc.name testEnumPathStyle0208
     * @tc.desc Verify PathDashStyle.MORPH leaves gaps on a horizontal stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0208', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0208 begin');
      await runCase('testEnumPathStyle0208', async () => {
        const line: drawing.Path = linePath(20, 100, 180, 100);
        const dashed: number = await dashInk(line, 24, 0, drawing.PathDashStyle.MORPH, 6);
        const solid: number = await strokeInk(line, 6);
        expect(dashed > 0).assertTrue();
        expect(dashed < solid).assertTrue();
        expect(dashed > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0208 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0209
     * @tc.name testEnumPathStyle0209
     * @tc.desc Verify a wider advance reduces the painted area of a morphed dash on a circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0209', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0209 begin');
      await runCase('testEnumPathStyle0209', async () => {
        const circle: drawing.Path = circlePath(100, 100, 55, drawing.PathDirection.CLOCKWISE);
        const dense: number = await dashInk(circle, 20, 0, drawing.PathDashStyle.MORPH, 6);
        const sparse: number = await dashInk(circle, 40, 0, drawing.PathDashStyle.MORPH, 6);
        expect(dense > sparse).assertTrue();
        expect(sparse > 0).assertTrue();
        expect(circle.contains(100, 100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0209 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0210
     * @tc.name testEnumPathStyle0210
     * @tc.desc Verify a phase shift moves the first morphed stamp along the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0210', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0210 begin');
      await runCase('testEnumPathStyle0210', async () => {
        const line: drawing.Path = linePath(30, 140, 170, 140);
        const base: ArrayBuffer = await dashBuffer(line, 36, 0, drawing.PathDashStyle.MORPH, 6);
        const shifted: ArrayBuffer = await dashBuffer(line, 36, 18, drawing.PathDashStyle.MORPH, 6);
        expect(inkInColumns(base, 30, 36) > 0).assertTrue();
        expect(inkInColumns(shifted, 30, 36)).assertEqual(0);
        expect(firstInkColumn(shifted) > firstInkColumn(base)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0210 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0211
     * @tc.name testEnumPathStyle0211
     * @tc.desc Verify PathDashStyle.MORPH handles a path with a sharp corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0211', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0211 begin');
      await runCase('testEnumPathStyle0211', async () => {
        const bend: drawing.Path = vPath(20, 180, 40, 120);
        const dashed: number = await dashInk(bend, 22, 0, drawing.PathDashStyle.MORPH, 6);
        const solid: number = await strokeInk(bend, 6);
        expect(dashed > 0).assertTrue();
        expect(dashed < solid).assertTrue();
        expect(bend.getLength(false) > 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0211 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0212
     * @tc.name testEnumPathStyle0212
     * @tc.desc Verify a wider advance reduces the painted area of a morphed dash on a corner path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0212', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0212 begin');
      await runCase('testEnumPathStyle0212', async () => {
        const bend: drawing.Path = vPath(20, 180, 40, 160);
        const dense: number = await dashInk(bend, 18, 0, drawing.PathDashStyle.MORPH, 8);
        const sparse: number = await dashInk(bend, 36, 0, drawing.PathDashStyle.MORPH, 8);
        const solid: number = await strokeInk(bend, 8);
        expect(sparse > 0).assertTrue();
        expect(dense > sparse).assertTrue();
        expect(dense < solid).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0212 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0213
     * @tc.name testEnumPathStyle0213
     * @tc.desc Verify GET_POSITION_MATRIX reports the sampled point on a diagonal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0213', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0213 begin');
      await runCase('testEnumPathStyle0213', async () => {
        const diagonal: drawing.Path = linePath(0, 0, 100, 100);
        const values: number[] = measureMatrix(diagonal, false, 50,
          drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(values.length).assertEqual(9);
        expect(Math.abs(values[2] - 35.36) < 0.5).assertTrue();
        expect(Math.abs(values[5] - 35.36) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0213 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0214
     * @tc.name testEnumPathStyle0214
     * @tc.desc Verify GET_POSITION_MATRIX only translates along a horizontal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0214', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0214 begin');
      await runCase('testEnumPathStyle0214', async () => {
        const line: drawing.Path = linePath(0, 0, 200, 0);
        const values: number[] = measureMatrix(line, false, 120,
          drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(Math.round(values[2])).assertEqual(120);
        expect(Math.round(values[5])).assertEqual(0);
        expect(Math.abs(values[4] - 1) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0214 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0215
     * @tc.name testEnumPathStyle0215
     * @tc.desc Verify GET_POSITION_MATRIX only translates along a vertical line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0215', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0215 begin');
      await runCase('testEnumPathStyle0215', async () => {
        const line: drawing.Path = linePath(0, 0, 0, 200);
        const values: number[] = measureMatrix(line, false, 130,
          drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(Math.round(values[5])).assertEqual(130);
        expect(Math.round(values[2])).assertEqual(0);
        expect(values[0]).assertLarger(0.99);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0215 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0216
     * @tc.name testEnumPathStyle0216
     * @tc.desc Verify a quarter distance on a circle lands on its lowest point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0216', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0216 begin');
      await runCase('testEnumPathStyle0216', async () => {
        const circle: drawing.Path = circlePath(100, 100, 40, drawing.PathDirection.CLOCKWISE);
        const quarter: number = circle.getLength(true) / 4;
        const values: number[] = measureMatrix(circle, true, quarter,
          drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(Math.abs(values[2] - 100) < 2).assertTrue();
        expect(Math.abs(values[5] - 140) < 2).assertTrue();
        expect(values.length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0216 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0217
     * @tc.name testEnumPathStyle0217
     * @tc.desc Verify an unreachable distance keeps the position matrix at identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0217', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0217 begin');
      await runCase('testEnumPathStyle0217', async () => {
        const line: drawing.Path = linePath(0, 0, 100, 0);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = line.getMatrix(false, 900, matrix,
          drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
        expect(Math.round(matrix.getValue(2))).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0217 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0218
     * @tc.name testEnumPathStyle0218
     * @tc.desc Verify GET_TANGENT_MATRIX rotates by 45 degrees on a rising diagonal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0218', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0218 begin');
      await runCase('testEnumPathStyle0218', async () => {
        const diagonal: drawing.Path = linePath(0, 0, 120, 120);
        const values: number[] = measureMatrix(diagonal, false, 20,
          drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(Math.abs(values[0] - 0.7071) < 0.02).assertTrue();
        expect(Math.abs(values[3] - 0.7071) < 0.02).assertTrue();
        expect(values.length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0218 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0219
     * @tc.name testEnumPathStyle0219
     * @tc.desc Verify GET_TANGENT_MATRIX stays axis aligned on a horizontal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0219', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0219 begin');
      await runCase('testEnumPathStyle0219', async () => {
        const line: drawing.Path = linePath(0, 0, 160, 0);
        const values: number[] = measureMatrix(line, false, 60,
          drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(Math.round(values[0])).assertEqual(1);
        expect(Math.round(values[3])).assertEqual(0);
        expect(Math.abs(values[4] - 1) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0219 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0220
     * @tc.name testEnumPathStyle0220
     * @tc.desc Verify GET_TANGENT_MATRIX mirrors its sine terms on a falling diagonal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0220', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0220 begin');
      await runCase('testEnumPathStyle0220', async () => {
        const reverse: drawing.Path = linePath(0, 120, 120, 0);
        const values: number[] = measureMatrix(reverse, false, 30,
          drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(Math.abs(Math.abs(values[0]) - 0.7071) < 0.02).assertTrue();
        expect(Math.abs(Math.abs(values[1]) - 0.7071) < 0.02).assertTrue();
        expect(Math.abs(Math.abs(values[3]) - 0.7071) < 0.02).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0220 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0221
     * @tc.name testEnumPathStyle0221
     * @tc.desc Verify GET_TANGENT_MATRIX turns a vertical line by ninety degrees.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0221', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0221 begin');
      await runCase('testEnumPathStyle0221', async () => {
        const line: drawing.Path = linePath(0, 0, 0, 100);
        const values: number[] = measureMatrix(line, false, 25,
          drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(Math.abs(values[0]) < 0.02).assertTrue();
        expect(Math.abs(Math.abs(values[3]) - 1) < 0.02).assertTrue();
        expect(Math.round(values[2])).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0221 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0222
     * @tc.name testEnumPathStyle0222
     * @tc.desc Verify GET_TANGENT_MATRIX carries the rotation but no translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0222', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0222 begin');
      await runCase('testEnumPathStyle0222', async () => {
        const diagonal: drawing.Path = linePath(0, 0, 100, 100);
        const values: number[] = measureMatrix(diagonal, false, 50,
          drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(Math.round(values[2])).assertEqual(0);
        expect(Math.round(values[5])).assertEqual(0);
        expect(Math.abs(values[0] - 0.7071) < 0.02).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0222 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0223
     * @tc.name testEnumPathStyle0223
     * @tc.desc Verify GET_POSITION_AND_TANGENT_MATRIX fills translation and rotation together.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0223', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0223 begin');
      await runCase('testEnumPathStyle0223', async () => {
        const diagonal: drawing.Path = linePath(0, 0, 100, 100);
        const values: number[] = measureMatrix(diagonal, false, 50,
          drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        expect(Math.abs(values[2] - 35.36) < 0.5).assertTrue();
        expect(Math.abs(values[5] - 35.36) < 0.5).assertTrue();
        expect(Math.abs(values[0] - 0.7071) < 0.02).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0223 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0224
     * @tc.name testEnumPathStyle0224
     * @tc.desc Verify the combined matrix of a horizontal line is a pure translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumPathStyle0224', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0224 begin');
      await runCase('testEnumPathStyle0224', async () => {
        const line: drawing.Path = linePath(0, 0, 160, 0);
        const values: number[] = measureMatrix(line, false, 80,
          drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        expect(Math.round(values[2])).assertEqual(80);
        expect(Math.round(values[5])).assertEqual(0);
        expect(Math.round(values[0])).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0224 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0225
     * @tc.name testEnumPathStyle0225
     * @tc.desc Verify the combined matrix translation matches getPositionAndTangent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0225', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0225 begin');
      await runCase('testEnumPathStyle0225', async () => {
        const diagonal: drawing.Path = linePath(0, 0, 120, 120);
        const values: number[] = measureMatrix(diagonal, false, 40,
          drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        const position: number[] = positionAt(diagonal, false, 40);
        expect(Math.abs(values[2] - position[0]) < 0.01).assertTrue();
        expect(Math.abs(values[5] - position[1]) < 0.01).assertTrue();
        expect(Math.abs(position[0] - position[1]) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0225 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0226
     * @tc.name testEnumPathStyle0226
     * @tc.desc Verify the combined matrix follows a falling diagonal line downwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0226', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0226 begin');
      await runCase('testEnumPathStyle0226', async () => {
        const reverse: drawing.Path = linePath(0, 120, 120, 0);
        const values: number[] = measureMatrix(reverse, false, 40,
          drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        expect(Math.abs(values[2] - 28.28) < 0.5).assertTrue();
        expect(Math.abs(values[5] - 91.72) < 0.5).assertTrue();
        expect(Math.abs(Math.abs(values[1]) - 0.7071) < 0.02).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0226 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0227
     * @tc.name testEnumPathStyle0227
     * @tc.desc Verify the combined matrix at a circle quarter reports a ninety degree turn.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumPathStyle0227', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0227 begin');
      await runCase('testEnumPathStyle0227', async () => {
        const circle: drawing.Path = circlePath(100, 100, 40, drawing.PathDirection.CLOCKWISE);
        const quarter: number = circle.getLength(true) / 4;
        const values: number[] = measureMatrix(circle, true, quarter,
          drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        expect(Math.abs(values[2] - 100) < 2).assertTrue();
        expect(Math.abs(values[5] - 140) < 2).assertTrue();
        expect(Math.abs(values[0])).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumPathStyle0227 end');
    });
  });
}
