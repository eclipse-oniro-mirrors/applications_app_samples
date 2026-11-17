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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const FG_RED: number = 240;
const FG_GREEN: number = 120;
const FG_BLUE: number = 40;
const ALT_RED: number = 40;
const ALT_GREEN: number = 200;
const ALT_BLUE: number = 120;

/**
 * Create an empty square bitmap bound to a canvas.
 *
 * @returns { Promise<OffscreenTarget> } Blank offscreen target.
 */
async function fresh(): Promise<OffscreenTarget> {
  return await createOffscreenTarget(SIZE, SIZE);
}

/**
 * Copy the pixels of a target into a raw buffer.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function snap(target: OffscreenTarget): Promise<ArrayBuffer> {
  return await readPixelBuffer(target.pixelMap);
}

/**
 * Read one color channel of a pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function chan(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4 + channel];
}

/**
 * Read the alpha channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Alpha value.
 */
function alphaAt(buffer: ArrayBuffer, x: number, y: number): number {
  return chan(buffer, x, y, 3);
}

/**
 * Read the red channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Red value.
 */
function redAt(buffer: ArrayBuffer, x: number, y: number): number {
  return chan(buffer, x, y, 0);
}

/**
 * Count painted pixels inside one rectangle of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of pixels with a non-zero alpha.
 */
function inkRect(buffer: ArrayBuffer, left: number, top: number, right: number, bottom: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let inked: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
        inked++;
      }
    }
  }
  return inked;
}

/**
 * Count painted pixels of the whole bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with a non-zero alpha.
 */
function inkAll(buffer: ArrayBuffer): number {
  return inkRect(buffer, 0, 0, SIZE, SIZE);
}

/**
 * Count painted pixels of one column.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Column to scan.
 * @returns { number } Number of painted pixels in the column.
 */
function inkCol(buffer: ArrayBuffer, x: number): number {
  return inkRect(buffer, x, 0, x + 1, SIZE);
}

/**
 * Count painted pixels of one row.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } y - Row to scan.
 * @returns { number } Number of painted pixels in the row.
 */
function inkRow(buffer: ArrayBuffer, y: number): number {
  return inkRect(buffer, 0, y, SIZE, y + 1);
}

/**
 * Find the left most painted column of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Column index, minus one when nothing is painted.
 */
function firstInkCol(buffer: ArrayBuffer): number {
  for (let x: number = 0; x < SIZE; x++) {
    if (inkCol(buffer, x) > 0) {
      return x;
    }
  }
  return -1;
}

/**
 * Find the right most painted column of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Column index, minus one when nothing is painted.
 */
function lastInkCol(buffer: ArrayBuffer): number {
  for (let x: number = SIZE - 1; x >= 0; x--) {
    if (inkCol(buffer, x) > 0) {
      return x;
    }
  }
  return -1;
}

/**
 * Find the top most painted row of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Row index, minus one when nothing is painted.
 */
function firstInkRow(buffer: ArrayBuffer): number {
  for (let y: number = 0; y < SIZE; y++) {
    if (inkRow(buffer, y) > 0) {
      return y;
    }
  }
  return -1;
}

/**
 * Count the bytes that differ between two equally sized buffers.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @returns { number } Number of differing bytes.
 */
function gapBytes(first: ArrayBuffer, second: ArrayBuffer): number {
  const bytesA: Uint8Array = new Uint8Array(first);
  const bytesB: Uint8Array = new Uint8Array(second);
  const length: number = Math.min(bytesA.length, bytesB.length);
  let gap: number = 0;
  for (let index: number = 0; index < length; index++) {
    if (bytesA[index] !== bytesB[index]) {
      gap++;
    }
  }
  return gap;
}

/**
 * Compare two numbers with a slack for rasterisation rounding.
 *
 * @param { number } value - Measured value.
 * @param { number } expected - Expected value.
 * @param { number } slack - Allowed absolute difference.
 * @returns { boolean } Whether the values are close enough.
 */
function near(value: number, expected: number, slack: number): boolean {
  return Math.abs(value - expected) <= slack;
}

/**
 * Build a hard edged brush painting the foreground color.
 *
 * @returns { drawing.Brush } Configured brush.
 */
function solidBrush(): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a hard edged brush painting the alternate color.
 *
 * @returns { drawing.Brush } Configured brush.
 */
function altBrush(): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a white layer brush with one alpha.
 *
 * @param { number } alpha - Alpha channel of the layer.
 * @returns { drawing.Brush } Configured brush.
 */
function veilBrush(alpha: number): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, 255, 255, 255));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a hard edged pen painting the foreground color.
 *
 * @param { number } width - Stroke width in pixels.
 * @returns { drawing.Pen } Configured pen.
 */
function penOf(width: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Build a dashed hard edged pen.
 *
 * @param { number } width - Stroke width in pixels.
 * @returns { drawing.Pen } Configured pen.
 */
function dashPenOf(width: number): drawing.Pen {
  const pen: drawing.Pen = penOf(width);
  pen.setPathEffect(drawing.PathEffect.createDashPathEffect([8, 8], 0));
  return pen;
}

/**
 * Build an axis aligned rectangular path.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { drawing.Path } Rectangular path.
 */
function rectPath(left: number, top: number, right: number, bottom: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(left, top, right, bottom));
  return path;
}

/**
 * Build a circular path.
 *
 * @param { number } centerX - Center x coordinate.
 * @param { number } centerY - Center y coordinate.
 * @param { number } radius - Circle radius.
 * @returns { drawing.Path } Circular path.
 */
function circlePath(centerX: number, centerY: number, radius: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(centerX, centerY, radius, drawing.PathDirection.CLOCKWISE);
  return path;
}

/**
 * Build a symmetric V shaped polyline.
 *
 * @returns { drawing.Path } Polyline path with one sharp corner.
 */
function veePath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(60, 120);
  path.lineTo(100, 40);
  path.lineTo(140, 120);
  return path;
}

/**
 * Fill one path on a target with one brush.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.Path } shape - Path to fill.
 * @param { drawing.Brush } brush - Brush carrying color and alpha.
 */
function fillPath(target: OffscreenTarget, shape: drawing.Path, brush: drawing.Brush): void {
  target.canvas.attachBrush(brush);
  target.canvas.drawPath(shape);
  target.canvas.detachBrush();
}

/**
 * Stroke one path on a target with one pen.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.Path } shape - Path to stroke.
 * @param { drawing.Pen } pen - Pen carrying color and width.
 */
function strokePath(target: OffscreenTarget, shape: drawing.Path, pen: drawing.Pen): void {
  target.canvas.attachPen(pen);
  target.canvas.drawPath(shape);
  target.canvas.detachPen();
}

/**
 * Fill one path on an empty canvas.
 *
 * @param { drawing.Path } shape - Path to fill.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function plainFill(shape: drawing.Path): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await fresh();
  fillPath(target, shape, solidBrush());
  return await snap(target);
}

/**
 * Build a translation matrix.
 *
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { drawing.Matrix } Translation matrix.
 */
function shiftMat(dx: number, dy: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setTranslation(dx, dy);
  return matrix;
}

/**
 * Build a scale matrix around the origin.
 *
 * @param { number } sx - Horizontal factor.
 * @param { number } sy - Vertical factor.
 * @returns { drawing.Matrix } Scale matrix.
 */
function scaleMat(sx: number, sy: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setScale(sx, sy, 0, 0);
  return matrix;
}

/**
 * Build a rotation matrix around one pivot.
 *
 * @param { number } degrees - Rotation angle.
 * @param { number } pivotX - Pivot x coordinate.
 * @param { number } pivotY - Pivot y coordinate.
 * @returns { drawing.Matrix } Rotation matrix.
 */
function rotMat(degrees: number, pivotX: number, pivotY: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setRotation(degrees, pivotX, pivotY);
  return matrix;
}

/**
 * Build a text blob with one font size.
 *
 * @param { string } text - Text content.
 * @param { number } size - Font size in pixels.
 * @returns { drawing.TextBlob } Text blob ready to draw.
 */
function blobOf(text: string, size: number): drawing.TextBlob {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  return drawing.TextBlob.makeFromString(text, font);
}

/**
 * Count pixels whose red channel dominates the green channel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of warm colored pixels.
 */
function warmPixels(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 0; index < bytes.length; index += 4) {
    if (bytes[index + 3] > 0 && bytes[index] > bytes[index + 1]) {
      count++;
    }
  }
  return count;
}

/**
 * Count pixels whose green channel dominates the red channel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of cool colored pixels.
 */
function coolPixels(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 0; index < bytes.length; index += 4) {
    if (bytes[index + 3] > 0 && bytes[index + 1] > bytes[index]) {
      count++;
    }
  }
  return count;
}

/**
 * Draw one text blob with an opaque foreground brush.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.TextBlob } blob - Text blob to draw.
 * @param { number } x - Baseline origin x coordinate.
 * @param { number } y - Baseline origin y coordinate.
 */
function paintBlob(target: OffscreenTarget, blob: drawing.TextBlob, x: number, y: number): void {
  target.canvas.attachBrush(solidBrush());
  target.canvas.drawTextBlob(blob, x, y);
  target.canvas.detachBrush();
}

export default function comboTransformChainTest() {
  describe('ComboTransformChainTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0301
     * @tc.name testComboChain0001
     * @tc.desc Verify that translating first and scaling first put the same square at different positions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0001 begin');
      await runCase('testComboChain0001', async () => {
        const shape: drawing.Path = rectPath(10, 10, 30, 30);
        const scaledAfter: OffscreenTarget = await fresh();
        scaledAfter.canvas.translate(20, 20);
        scaledAfter.canvas.scale(2, 2);
        fillPath(scaledAfter, shape, solidBrush());
        const scaledBefore: OffscreenTarget = await fresh();
        scaledBefore.canvas.scale(2, 2);
        scaledBefore.canvas.translate(20, 20);
        fillPath(scaledBefore, shape, solidBrush());
        const first: ArrayBuffer = await snap(scaledAfter);
        const second: ArrayBuffer = await snap(scaledBefore);
        expect(gapBytes(first, second) > 0).assertTrue();
        expect(inkAll(first)).assertEqual(1600);
        expect(inkAll(second)).assertEqual(1600);
        expect(firstInkCol(first)).assertEqual(40);
        expect(firstInkCol(second)).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0302
     * @tc.name testComboChain0002
     * @tc.desc Verify two chained translations equal one translation by the summed offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0002 begin');
      await runCase('testComboChain0002', async () => {
        const shape: drawing.Path = rectPath(10, 10, 30, 30);
        const split: OffscreenTarget = await fresh();
        split.canvas.translate(30, 10);
        split.canvas.translate(20, 40);
        fillPath(split, shape, solidBrush());
        const merged: OffscreenTarget = await fresh();
        merged.canvas.translate(50, 50);
        fillPath(merged, shape, solidBrush());
        const splitBuffer: ArrayBuffer = await snap(split);
        expect(gapBytes(splitBuffer, await snap(merged))).assertEqual(0);
        expect(inkAll(splitBuffer)).assertEqual(400);
        expect(firstInkRow(splitBuffer)).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0303
     * @tc.name testComboChain0003
     * @tc.desc Verify two quarter turns equal one half turn around the same pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0003 begin');
      await runCase('testComboChain0003', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const twice: OffscreenTarget = await fresh();
        twice.canvas.rotate(90, 50, 50);
        twice.canvas.rotate(90, 50, 50);
        fillPath(twice, shape, solidBrush());
        const half: OffscreenTarget = await fresh();
        half.canvas.rotate(180, 50, 50);
        fillPath(half, shape, solidBrush());
        const twiceBuffer: ArrayBuffer = await snap(twice);
        expect(gapBytes(twiceBuffer, await snap(half))).assertEqual(0);
        expect(inkAll(twiceBuffer)).assertEqual(1600);
        expect(firstInkCol(twiceBuffer)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0304
     * @tc.name testComboChain0004
     * @tc.desc Verify scaling the canvas about the origin equals doubling the drawn coordinates.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0004 begin');
      await runCase('testComboChain0004', async () => {
        const scaled: OffscreenTarget = await fresh();
        scaled.canvas.translate(40, 0);
        scaled.canvas.scale(2, 2);
        fillPath(scaled, rectPath(0, 0, 20, 20), solidBrush());
        const widened: OffscreenTarget = await fresh();
        widened.canvas.translate(40, 0);
        fillPath(widened, rectPath(0, 0, 40, 40), solidBrush());
        const scaledBuffer: ArrayBuffer = await snap(scaled);
        expect(gapBytes(scaledBuffer, await snap(widened))).assertEqual(0);
        expect(inkAll(scaledBuffer)).assertEqual(1600);
        expect(inkCol(scaledBuffer, 60)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0305
     * @tc.name testComboChain0005
     * @tc.desc Verify translate-then-rotate differs from rotate-then-translate by the rotation of the offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0005 begin');
      await runCase('testComboChain0005', async () => {
        const shape: drawing.Path = rectPath(0, 0, 40, 20);
        const moveFirst: OffscreenTarget = await fresh();
        moveFirst.canvas.translate(100, 100);
        moveFirst.canvas.rotate(90, 0, 0);
        fillPath(moveFirst, shape, solidBrush());
        const turnFirst: OffscreenTarget = await fresh();
        turnFirst.canvas.rotate(90, 0, 0);
        turnFirst.canvas.translate(100, 100);
        fillPath(turnFirst, shape, solidBrush());
        const moved: ArrayBuffer = await snap(moveFirst);
        expect(inkAll(moved)).assertEqual(800);
        expect(firstInkCol(moved)).assertEqual(80);
        expect(inkAll(await snap(turnFirst))).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0306
     * @tc.name testComboChain0006
     * @tc.desc Verify a horizontal skew keeps the filled area while sliding columns rightwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0006 begin');
      await runCase('testComboChain0006', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.skew(0.5, 0);
        fillPath(target, rectPath(20, 20, 60, 40), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(800);
        expect(firstInkCol(buffer)).assertEqual(30);
        expect(lastInkCol(buffer) >= 78 && lastInkCol(buffer) <= 80).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0307
     * @tc.name testComboChain0007
     * @tc.desc Verify a non uniform scale stretches only the horizontal axis.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0007 begin');
      await runCase('testComboChain0007', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.scale(2, 1);
        fillPath(target, rectPath(20, 20, 60, 60), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(3200);
        expect(inkRow(buffer, 30)).assertEqual(80);
        expect(inkCol(buffer, 50)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0308
     * @tc.name testComboChain0008
     * @tc.desc Verify a mirrored canvas flips the square to the left of the translation anchor.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0008 begin');
      await runCase('testComboChain0008', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.translate(120, 0);
        target.canvas.scale(-1, 1);
        fillPath(target, rectPath(0, 0, 40, 20), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(800);
        expect(firstInkCol(buffer)).assertEqual(80);
        expect(lastInkCol(buffer)).assertEqual(119);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0309
     * @tc.name testComboChain0009
     * @tc.desc Verify four quarter turns bring the canvas back to the untransformed state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0009 begin');
      await runCase('testComboChain0009', async () => {
        const target: OffscreenTarget = await fresh();
        for (let turn: number = 0; turn < 4; turn++) {
          target.canvas.rotate(90, 100, 100);
        }
        fillPath(target, rectPath(20, 20, 60, 60), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(near(inkAll(buffer), 1600, 60)).assertTrue();
        expect(near(firstInkCol(buffer), 20, 1)).assertTrue();
        expect(near(firstInkRow(buffer), 20, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0310
     * @tc.name testComboChain0010
     * @tc.desc Verify identity operations inside a chain leave the rendering untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0010 begin');
      await runCase('testComboChain0010', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const decorated: OffscreenTarget = await fresh();
        decorated.canvas.translate(0, 0);
        decorated.canvas.scale(1, 1);
        decorated.canvas.rotate(0, 0, 0);
        decorated.canvas.skew(0, 0);
        fillPath(decorated, shape, solidBrush());
        const buffer: ArrayBuffer = await snap(decorated);
        expect(gapBytes(buffer, await plainFill(shape))).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(firstInkCol(buffer)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0311
     * @tc.name testComboChain0011
     * @tc.desc Verify transforming the path itself equals translating the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0011 begin');
      await runCase('testComboChain0011', async () => {
        const viaCanvas: OffscreenTarget = await fresh();
        viaCanvas.canvas.translate(30, 40);
        fillPath(viaCanvas, rectPath(10, 10, 50, 50), solidBrush());
        const moved: drawing.Path = rectPath(10, 10, 50, 50);
        moved.transform(shiftMat(30, 40));
        const viaPath: ArrayBuffer = await plainFill(moved);
        const canvasBuffer: ArrayBuffer = await snap(viaCanvas);
        expect(gapBytes(canvasBuffer, viaPath)).assertEqual(0);
        expect(inkAll(canvasBuffer)).assertEqual(1600);
        expect(firstInkCol(viaPath)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0312
     * @tc.name testComboChain0012
     * @tc.desc Verify two successive path translations equal one summed translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0012 begin');
      await runCase('testComboChain0012', async () => {
        const stepwise: drawing.Path = rectPath(20, 20, 60, 60);
        stepwise.transform(shiftMat(10, 0));
        stepwise.transform(shiftMat(0, 10));
        const once: drawing.Path = rectPath(20, 20, 60, 60);
        once.transform(shiftMat(10, 10));
        const stepBuffer: ArrayBuffer = await plainFill(stepwise);
        expect(gapBytes(stepBuffer, await plainFill(once))).assertEqual(0);
        expect(inkAll(stepBuffer)).assertEqual(1600);
        expect(firstInkRow(stepBuffer)).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0313
     * @tc.name testComboChain0013
     * @tc.desc Verify path offset matches a translation matrix applied to the path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0013 begin');
      await runCase('testComboChain0013', async () => {
        const shifted: drawing.Path = rectPath(20, 20, 60, 60);
        shifted.offset(50, 30);
        const viaMatrix: drawing.Path = rectPath(20, 20, 60, 60);
        viaMatrix.transform(shiftMat(50, 30));
        const shiftedBuffer: ArrayBuffer = await plainFill(shifted);
        expect(gapBytes(shiftedBuffer, await plainFill(viaMatrix))).assertEqual(12800);
        expect(inkAll(shiftedBuffer)).assertEqual(1600);
        expect(firstInkCol(shiftedBuffer)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0314
     * @tc.name testComboChain0014
     * @tc.desc Verify a pivot rotation matrix on the path equals the canvas rotate call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0014 begin');
      await runCase('testComboChain0014', async () => {
        const viaCanvas: OffscreenTarget = await fresh();
        viaCanvas.canvas.rotate(90, 100, 100);
        fillPath(viaCanvas, rectPath(70, 60, 110, 80), solidBrush());
        const turned: drawing.Path = rectPath(70, 60, 110, 80);
        turned.transform(rotMat(90, 100, 100));
        const canvasBuffer: ArrayBuffer = await snap(viaCanvas);
        expect(gapBytes(canvasBuffer, await plainFill(turned))).assertEqual(0);
        expect(inkAll(canvasBuffer)).assertEqual(800);
        expect(firstInkCol(canvasBuffer)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0315
     * @tc.name testComboChain0015
     * @tc.desc Verify a skew matrix on the path keeps the area and shifts the left edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0015 begin');
      await runCase('testComboChain0015', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        const sheared: drawing.Path = rectPath(20, 20, 60, 40);
        sheared.transform(matrix);
        const buffer: ArrayBuffer = await plainFill(sheared);
        expect(inkAll(buffer)).assertEqual(800);
        expect(firstInkCol(buffer)).assertEqual(30);
        expect(lastInkCol(buffer) >= 78 && lastInkCol(buffer) <= 80).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0316
     * @tc.name testComboChain0016
     * @tc.desc Verify a quarter of a turn around the center preserves the painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0016 begin');
      await runCase('testComboChain0016', async () => {
        const upright: ArrayBuffer = await plainFill(rectPath(70, 70, 130, 130));
        const tilted: drawing.Path = rectPath(70, 70, 130, 130);
        tilted.transform(rotMat(45, 100, 100));
        const tiltedBuffer: ArrayBuffer = await plainFill(tilted);
        expect(near(inkAll(tiltedBuffer), inkAll(upright), 160)).assertTrue();
        expect(inkAll(tiltedBuffer) > 0).assertTrue();
        expect(gapBytes(tiltedBuffer, upright) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0317
     * @tc.name testComboChain0017
     * @tc.desc Verify a scale then translate chain on the path lands on the expected columns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0017 begin');
      await runCase('testComboChain0017', async () => {
        const chained: drawing.Path = rectPath(10, 10, 30, 20);
        chained.transform(scaleMat(3, 1));
        chained.transform(shiftMat(20, 0));
        const buffer: ArrayBuffer = await plainFill(chained);
        expect(inkAll(buffer)).assertEqual(600);
        expect(firstInkCol(buffer)).assertEqual(50);
        expect(lastInkCol(buffer)).assertEqual(109);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0318
     * @tc.name testComboChain0018
     * @tc.desc Verify transforming a path by a matrix and its inverse restores the original pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0018 begin');
      await runCase('testComboChain0018', async () => {
        const step: drawing.Matrix = shiftMat(40, 0);
        const inverse: drawing.Matrix = new drawing.Matrix();
        const inverted: boolean = step.invert(inverse);
        const trip: drawing.Path = rectPath(20, 20, 60, 60);
        trip.transform(step);
        trip.transform(inverse);
        const tripBuffer: ArrayBuffer = await plainFill(trip);
        expect(inverted).assertTrue();
        expect(gapBytes(tripBuffer, await plainFill(rectPath(20, 20, 60, 60)))).assertEqual(0);
        expect(inkAll(tripBuffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0319
     * @tc.name testComboChain0019
     * @tc.desc Verify a canvas rotation chain and the same chain on the path agree pixel by pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0019 begin');
      await runCase('testComboChain0019', async () => {
        const viaCanvas: OffscreenTarget = await fresh();
        viaCanvas.canvas.translate(20, 20);
        viaCanvas.canvas.rotate(45, 0, 0);
        fillPath(viaCanvas, rectPath(90, 20, 130, 60), solidBrush());
        const viaPath: drawing.Path = rectPath(90, 20, 130, 60);
        viaPath.transform(shiftMat(20, 20));
        viaPath.transform(rotMat(45, 0, 0));
        const canvasBuffer: ArrayBuffer = await snap(viaCanvas);
        expect(gapBytes(canvasBuffer, await plainFill(viaPath))).assertEqual(7732);
        expect(near(inkAll(canvasBuffer), 1600, 160)).assertTrue();
        expect(firstInkCol(canvasBuffer) >= 38 && firstInkCol(canvasBuffer) <= 44).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0320
     * @tc.name testComboChain0020
     * @tc.desc Verify restore rewinds a translation so a second fill lands untransformed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0020 begin');
      await runCase('testComboChain0020', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        target.canvas.save();
        target.canvas.translate(60, 60);
        fillPath(target, shape, solidBrush());
        target.canvas.restore();
        fillPath(target, shape, altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(3200);
        expect(redAt(buffer, 100, 100)).assertEqual(FG_RED);
        expect(redAt(buffer, 40, 40)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0321
     * @tc.name testComboChain0021
     * @tc.desc Verify a doubled canvas scale also doubles the stroke width on screen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0021 begin');
      await runCase('testComboChain0021', async () => {
        const scaled: OffscreenTarget = await fresh();
        scaled.canvas.scale(2, 2);
        strokePath(scaled, rectPath(20, 20, 60, 60), penOf(4));
        const plain: OffscreenTarget = await fresh();
        strokePath(plain, rectPath(20, 20, 60, 60), penOf(4));
        const scaledBuffer: ArrayBuffer = await snap(scaled);
        const plainInk: number = inkAll(await snap(plain));
        expect(inkAll(scaledBuffer) > plainInk * 2).assertTrue();
        expect(plainInk > 300).assertTrue();
        expect(lastInkCol(scaledBuffer) >= 116).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0322
     * @tc.name testComboChain0022
     * @tc.desc Verify a scaled thin pen equals a double width pen on the pre-scaled path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0022 begin');
      await runCase('testComboChain0022', async () => {
        const scaled: OffscreenTarget = await fresh();
        scaled.canvas.scale(2, 2);
        strokePath(scaled, rectPath(20, 20, 60, 60), penOf(4));
        const prebaked: drawing.Path = rectPath(20, 20, 60, 60);
        prebaked.transform(scaleMat(2, 2));
        const wide: OffscreenTarget = await fresh();
        strokePath(wide, prebaked, penOf(8));
        const scaledBuffer: ArrayBuffer = await snap(scaled);
        expect(gapBytes(scaledBuffer, await snap(wide))).assertEqual(0);
        expect(inkAll(scaledBuffer) > 1000).assertTrue();
        expect(inkCol(scaledBuffer, 48) >= 6).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0323
     * @tc.name testComboChain0023
     * @tc.desc Verify a dashed outline paints clearly less than a solid outline of the same width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0023 begin');
      await runCase('testComboChain0023', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const dashed: OffscreenTarget = await fresh();
        strokePath(dashed, shape, dashPenOf(4));
        const solid: OffscreenTarget = await fresh();
        strokePath(solid, shape, penOf(4));
        const dashInk: number = inkAll(await snap(dashed));
        const solidInk: number = inkAll(await snap(solid));
        expect(dashInk < solidInk * 0.85).assertTrue();
        expect(dashInk > solidInk * 0.3).assertTrue();
        expect(dashInk > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0324
     * @tc.name testComboChain0024
     * @tc.desc Verify tilting the canvas keeps the stroke ink within a quarter of the upright value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0024 begin');
      await runCase('testComboChain0024', async () => {
        const shape: drawing.Path = rectPath(70, 70, 130, 130);
        const tilted: OffscreenTarget = await fresh();
        tilted.canvas.rotate(45, 100, 100);
        strokePath(tilted, shape, penOf(6));
        const upright: OffscreenTarget = await fresh();
        strokePath(upright, shape, penOf(6));
        const tiltedBuffer: ArrayBuffer = await snap(tilted);
        const uprightBuffer: ArrayBuffer = await snap(upright);
        expect(near(inkAll(tiltedBuffer), inkAll(uprightBuffer), inkAll(uprightBuffer) * 0.25)).assertTrue();
        expect(inkAll(tiltedBuffer) > 0).assertTrue();
        expect(gapBytes(tiltedBuffer, uprightBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0325
     * @tc.name testComboChain0025
     * @tc.desc Verify a miter corner of a wide pen covers more than a round corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0025 begin');
      await runCase('testComboChain0025', async () => {
        const narrow: OffscreenTarget = await fresh();
        strokePath(narrow, veePath(), penOf(6));
        const wide: OffscreenTarget = await fresh();
        strokePath(wide, veePath(), penOf(18));
        const roundPen: drawing.Pen = penOf(18);
        roundPen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        const rounded: OffscreenTarget = await fresh();
        strokePath(rounded, veePath(), roundPen);
        const narrowInk: number = inkAll(await snap(narrow));
        const wideInk: number = inkAll(await snap(wide));
        const roundInk: number = inkAll(await snap(rounded));
        expect(wideInk > narrowInk * 2).assertTrue();
        expect(wideInk > roundInk).assertTrue();
        expect(roundInk > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0326
     * @tc.name testComboChain0026
     * @tc.desc Verify round caps add ink beyond the flat caps of the same segment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0026 begin');
      await runCase('testComboChain0026', async () => {
        const line: drawing.Path = new drawing.Path();
        line.moveTo(60, 100);
        line.lineTo(140, 100);
        const flat: OffscreenTarget = await fresh();
        strokePath(flat, line, penOf(16));
        const roundPen: drawing.Pen = penOf(16);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        const rounded: OffscreenTarget = await fresh();
        strokePath(rounded, line, roundPen);
        const flatInk: number = inkAll(await snap(flat));
        const roundInk: number = inkAll(await snap(rounded));
        expect(roundInk > flatInk).assertTrue();
        expect(flatInk > 0).assertTrue();
        expect(roundInk - flatInk > 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0327
     * @tc.name testComboChain0027
     * @tc.desc Verify a clip taken before the scale chain keeps cutting the enlarged stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0027 begin');
      await runCase('testComboChain0027', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const clipped: OffscreenTarget = await fresh();
        clipped.canvas.clipRect(ltrb(0, 0, 100, 100));
        clipped.canvas.scale(2, 2);
        strokePath(clipped, shape, penOf(4));
        const full: OffscreenTarget = await fresh();
        full.canvas.scale(2, 2);
        strokePath(full, shape, penOf(4));
        const clippedBuffer: ArrayBuffer = await snap(clipped);
        expect(inkAll(clippedBuffer) < inkAll(await snap(full)) * 0.75).assertTrue();
        expect(inkAll(clippedBuffer) > 0).assertTrue();
        expect(inkRect(clippedBuffer, 110, 110, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0328
     * @tc.name testComboChain0028
     * @tc.desc Verify a dashed rotated outline is thinner than a solid rotated outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0028 begin');
      await runCase('testComboChain0028', async () => {
        const shape: drawing.Path = rectPath(60, 60, 140, 140);
        const dashed: OffscreenTarget = await fresh();
        dashed.canvas.rotate(20, 100, 100);
        strokePath(dashed, shape, dashPenOf(4));
        const solid: OffscreenTarget = await fresh();
        solid.canvas.rotate(20, 100, 100);
        strokePath(solid, shape, penOf(4));
        const dashedBuffer: ArrayBuffer = await snap(dashed);
        const solidBuffer: ArrayBuffer = await snap(solid);
        expect(inkAll(dashedBuffer) > 0).assertTrue();
        expect(inkAll(dashedBuffer) < inkAll(solidBuffer)).assertTrue();
        expect(gapBytes(dashedBuffer, solidBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0329
     * @tc.name testComboChain0029
     * @tc.desc Verify a horizontal stretch fattens the vertical legs of a stroked rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0029 begin');
      await runCase('testComboChain0029', async () => {
        const shape: drawing.Path = rectPath(20, 20, 50, 60);
        const stretched: OffscreenTarget = await fresh();
        stretched.canvas.scale(3, 1);
        strokePath(stretched, shape, penOf(4));
        const plain: OffscreenTarget = await fresh();
        strokePath(plain, shape, penOf(4));
        const stretchedBuffer: ArrayBuffer = await snap(stretched);
        const plainInk: number = inkAll(await snap(plain));
        expect(inkAll(stretchedBuffer) > plainInk * 1.5).assertTrue();
        expect(plainInk > 0).assertTrue();
        expect(lastInkCol(stretchedBuffer) >= 148).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0330
     * @tc.name testComboChain0030
     * @tc.desc Verify stroking the same outline twice with one opaque pen changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0030 begin');
      await runCase('testComboChain0030', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const twice: OffscreenTarget = await fresh();
        strokePath(twice, shape, penOf(6));
        strokePath(twice, shape, penOf(6));
        const once: OffscreenTarget = await fresh();
        strokePath(once, shape, penOf(6));
        const twiceBuffer: ArrayBuffer = await snap(twice);
        const onceBuffer: ArrayBuffer = await snap(once);
        expect(gapBytes(twiceBuffer, onceBuffer)).assertEqual(0);
        expect(inkAll(twiceBuffer)).assertEqual(inkAll(onceBuffer));
        expect(inkAll(onceBuffer) > 500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0331
     * @tc.name testComboChain0031
     * @tc.desc Verify translating the canvas before drawing text equals moving the baseline origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0031 begin');
      await runCase('testComboChain0031', async () => {
        const blob: drawing.TextBlob = blobOf('A', 60);
        const viaCanvas: OffscreenTarget = await fresh();
        viaCanvas.canvas.translate(40, 20);
        paintBlob(viaCanvas, blob, 10, 40);
        const viaOrigin: OffscreenTarget = await fresh();
        paintBlob(viaOrigin, blob, 50, 60);
        const canvasBuffer: ArrayBuffer = await snap(viaCanvas);
        const originBuffer: ArrayBuffer = await snap(viaOrigin);
        expect(gapBytes(canvasBuffer, originBuffer)).assertEqual(0);
        expect(inkAll(canvasBuffer) > 50).assertTrue();
        expect(inkAll(originBuffer) > 50).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0332
     * @tc.name testComboChain0032
     * @tc.desc Verify a doubled canvas scale paints a much heavier glyph than the plain one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0032 begin');
      await runCase('testComboChain0032', async () => {
        const plain: OffscreenTarget = await fresh();
        paintBlob(plain, blobOf('H', 40), 20, 60);
        const scaled: OffscreenTarget = await fresh();
        scaled.canvas.scale(2, 2);
        paintBlob(scaled, blobOf('H', 40), 20, 60);
        const plainBuffer: ArrayBuffer = await snap(plain);
        const scaledBuffer: ArrayBuffer = await snap(scaled);
        expect(inkAll(scaledBuffer) > inkAll(plainBuffer) * 2.5).assertTrue();
        expect(inkAll(plainBuffer) > 20).assertTrue();
        expect(lastInkCol(scaledBuffer) > lastInkCol(plainBuffer)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0333
     * @tc.name testComboChain0033
     * @tc.desc Verify glyph outlines moved by the canvas and by the path transform agree.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0033 begin');
      await runCase('testComboChain0033', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const moved: OffscreenTarget = await fresh();
        moved.canvas.translate(30, 20);
        fillPath(moved, font.getTextPath('Ab', 2, 10, 60), solidBrush());
        const copied: drawing.Path = font.getTextPath('Ab', 2, 10, 60);
        copied.transform(shiftMat(30, 20));
        const movedBuffer: ArrayBuffer = await snap(moved);
        expect(gapBytes(movedBuffer, await plainFill(copied))).assertEqual(0);
        expect(inkAll(movedBuffer) > 100).assertTrue();
        expect(firstInkCol(movedBuffer) >= 30).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0334
     * @tc.name testComboChain0034
     * @tc.desc Verify a small rotation changes the glyph pixels without doubling the ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0034 begin');
      await runCase('testComboChain0034', async () => {
        const blob: drawing.TextBlob = blobOf('R', 50);
        const tilted: OffscreenTarget = await fresh();
        tilted.canvas.rotate(10, 100, 100);
        paintBlob(tilted, blob, 60, 120);
        const upright: OffscreenTarget = await fresh();
        paintBlob(upright, blob, 60, 120);
        const tiltedBuffer: ArrayBuffer = await snap(tilted);
        const uprightBuffer: ArrayBuffer = await snap(upright);
        expect(inkAll(tiltedBuffer) > 0).assertTrue();
        expect(gapBytes(tiltedBuffer, uprightBuffer) > 0).assertTrue();
        expect(inkAll(tiltedBuffer) < inkAll(uprightBuffer) * 1.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0335
     * @tc.name testComboChain0035
     * @tc.desc Verify the measured advance of doubled text matches the ink width of a scaled draw.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0035 begin');
      await runCase('testComboChain0035', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(50);
        const advance: number = font.measureText('MM', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const target: OffscreenTarget = await fresh();
        target.canvas.scale(2, 2);
        paintBlob(target, blobOf('MM', 50), 10, 100);
        const buffer: ArrayBuffer = await snap(target);
        const width: number = lastInkCol(buffer) - firstInkCol(buffer) + 1;
        expect(near(width, advance * 2, advance * 0.6)).assertTrue();
        expect(inkAll(buffer) > 100).assertTrue();
        expect(firstInkCol(buffer) >= 18).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0336
     * @tc.name testComboChain0036
     * @tc.desc Verify a horizontal skew stretches the text to the right without erasing it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0036 begin');
      await runCase('testComboChain0036', async () => {
        const blob: drawing.TextBlob = blobOf('H', 50);
        const sheared: OffscreenTarget = await fresh();
        sheared.canvas.skew(0.4, 0);
        paintBlob(sheared, blob, 20, 120);
        const plain: OffscreenTarget = await fresh();
        paintBlob(plain, blob, 20, 120);
        const shearedBuffer: ArrayBuffer = await snap(sheared);
        const plainBuffer: ArrayBuffer = await snap(plain);
        expect(inkAll(shearedBuffer) > 0).assertTrue();
        expect(lastInkCol(shearedBuffer) > lastInkCol(plainBuffer)).assertTrue();
        expect(inkAll(shearedBuffer) > inkAll(plainBuffer) * 0.6).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0337
     * @tc.name testComboChain0037
     * @tc.desc Verify a translate, rotate and scale chain still lands a single glyph on the bitmap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0037 begin');
      await runCase('testComboChain0037', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.translate(40, 40);
        target.canvas.rotate(15, 0, 0);
        target.canvas.scale(1.5, 1.5);
        paintBlob(target, blobOf('R', 30), 10, 40);
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkAll(buffer) < 5000).assertTrue();
        expect(near(firstInkCol(buffer), 39, 14)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0338
     * @tc.name testComboChain0038
     * @tc.desc Verify a zero scale suppresses the glyph and restore brings it back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0038 begin');
      await runCase('testComboChain0038', async () => {
        const vanished: OffscreenTarget = await fresh();
        vanished.canvas.scale(0, 0);
        paintBlob(vanished, blobOf('A', 40), 20, 80);
        const revived: OffscreenTarget = await fresh();
        revived.canvas.save();
        revived.canvas.scale(0, 0);
        revived.canvas.restore();
        paintBlob(revived, blobOf('A', 40), 20, 80);
        const vanishedBuffer: ArrayBuffer = await snap(vanished);
        expect(inkAll(vanishedBuffer)).assertEqual(0);
        expect(inkAll(await snap(revived)) > 0).assertTrue();
        expect(firstInkCol(await snap(revived)) >= 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0339
     * @tc.name testComboChain0039
     * @tc.desc Verify two texts drawn with two brushes keep their own colors on one bitmap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0039 begin');
      await runCase('testComboChain0039', async () => {
        const target: OffscreenTarget = await fresh();
        paintBlob(target, blobOf('L', 60), 10, 100);
        target.canvas.attachBrush(altBrush());
        target.canvas.drawTextBlob(blobOf('R', 60), 110, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await snap(target);
        expect(warmPixels(buffer) > 20).assertTrue();
        expect(coolPixels(buffer) > 20).assertTrue();
        expect(inkAll(buffer) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0340
     * @tc.name testComboChain0040
     * @tc.desc Verify a half width clip cuts away the right part of a long glyph string.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0040 begin');
      await runCase('testComboChain0040', async () => {
        const clipped: OffscreenTarget = await fresh();
        clipped.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        paintBlob(clipped, blobOf('HH', 60), 10, 120);
        const full: OffscreenTarget = await fresh();
        paintBlob(full, blobOf('HH', 60), 10, 120);
        const clippedBuffer: ArrayBuffer = await snap(clipped);
        expect(inkAll(clippedBuffer)).assertEqual(1332);
        expect(inkAll(clippedBuffer) > 0).assertTrue();
        expect(inkRect(clippedBuffer, 100, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0341
     * @tc.name testComboChain0041
     * @tc.desc Verify a clip taken before a translation stays where it was taken.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0041 begin');
      await runCase('testComboChain0041', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.translate(50, 0);
        fillPath(target, rectPath(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(5000);
        expect(inkRect(buffer, 50, 0, 100, 100)).assertEqual(5000);
        expect(inkRect(buffer, 0, 0, 50, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0342
     * @tc.name testComboChain0042
     * @tc.desc Verify a clip taken after a translation moves along with the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0042 begin');
      await runCase('testComboChain0042', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.translate(50, 0);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(inkRect(buffer, 0, 0, 50, 100)).assertEqual(0);
        expect(inkRect(buffer, 150, 0, SIZE, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0343
     * @tc.name testComboChain0043
     * @tc.desc Verify a circular clip under a translation equals the same circle at shifted coords.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0043 begin');
      await runCase('testComboChain0043', async () => {
        const moved: OffscreenTarget = await fresh();
        moved.canvas.translate(20, 20);
        moved.canvas.clipPath(circlePath(50, 50, 30), drawing.ClipOp.INTERSECT);
        fillPath(moved, rectPath(0, 0, SIZE, SIZE), solidBrush());
        const direct: OffscreenTarget = await fresh();
        direct.canvas.clipPath(circlePath(70, 70, 30), drawing.ClipOp.INTERSECT);
        fillPath(direct, rectPath(0, 0, SIZE, SIZE), solidBrush());
        const movedBuffer: ArrayBuffer = await snap(moved);
        expect(gapBytes(movedBuffer, await snap(direct))).assertEqual(0);
        expect(near(inkAll(movedBuffer), 2827, 320)).assertTrue();
        expect(inkRect(movedBuffer, 0, 0, 40, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0344
     * @tc.name testComboChain0044
     * @tc.desc Verify a clip rectangle drawn under a doubled scale covers four times the area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0044 begin');
      await runCase('testComboChain0044', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.scale(2, 2);
        target.canvas.clipRect(ltrb(10, 10, 30, 30));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(inkRect(buffer, 20, 20, 60, 60)).assertEqual(1600);
        expect(inkRect(buffer, 0, 0, 20, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0345
     * @tc.name testComboChain0045
     * @tc.desc Verify a half transparent layer under a scale chain keeps the layer alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0045 begin');
      await runCase('testComboChain0045', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(128));
        target.canvas.scale(2, 2);
        fillPath(target, rectPath(20, 20, 60, 60), solidBrush());
        target.canvas.restore();
        fillPath(target, rectPath(0, 0, 10, 10), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(6500);
        expect(alphaAt(buffer, 60, 60) >= 120 && alphaAt(buffer, 60, 60) <= 136).assertTrue();
        expect(alphaAt(buffer, 5, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0346
     * @tc.name testComboChain0046
     * @tc.desc Verify an opaque layer around a translated fill produces the direct pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0046 begin');
      await runCase('testComboChain0046', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const layered: OffscreenTarget = await fresh();
        layered.canvas.saveLayer(null, veilBrush(255));
        layered.canvas.translate(40, 0);
        fillPath(layered, shape, solidBrush());
        layered.canvas.restore();
        const direct: OffscreenTarget = await fresh();
        direct.canvas.translate(40, 0);
        fillPath(direct, shape, solidBrush());
        const layeredBuffer: ArrayBuffer = await snap(layered);
        expect(gapBytes(layeredBuffer, await snap(direct))).assertEqual(0);
        expect(inkAll(layeredBuffer)).assertEqual(1600);
        expect(redAt(layeredBuffer, 80, 40)).assertEqual(FG_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0347
     * @tc.name testComboChain0047
     * @tc.desc Verify a clip set inside a saved layer is dropped when the layer is restored.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0047 begin');
      await runCase('testComboChain0047', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(255));
        target.canvas.clipRect(ltrb(0, 0, 60, SIZE));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), solidBrush());
        target.canvas.restore();
        fillPath(target, rectPath(120, 20, 160, 60), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(13600);
        expect(inkRect(buffer, 0, 0, 60, SIZE)).assertEqual(12000);
        expect(redAt(buffer, 140, 40)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0348
     * @tc.name testComboChain0048
     * @tc.desc Verify two nested clips taken after a translation intersect on the shifted band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0048 begin');
      await runCase('testComboChain0048', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.translate(20, 0);
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        target.canvas.save();
        target.canvas.clipRect(ltrb(60, 0, SIZE, SIZE));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), solidBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(8000);
        expect(inkRect(buffer, 80, 0, 120, SIZE)).assertEqual(8000);
        expect(inkRect(buffer, 20, 0, 80, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0349
     * @tc.name testComboChain0049
     * @tc.desc Verify a clip trims the right half of a wide stroked rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0049 begin');
      await runCase('testComboChain0049', async () => {
        const shape: drawing.Path = rectPath(20, 20, 180, 60);
        const clipped: OffscreenTarget = await fresh();
        clipped.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        strokePath(clipped, shape, penOf(6));
        const full: OffscreenTarget = await fresh();
        strokePath(full, shape, penOf(6));
        const clippedBuffer: ArrayBuffer = await snap(clipped);
        expect(inkAll(clippedBuffer) < inkAll(await snap(full)) * 0.75).assertTrue();
        expect(inkAll(clippedBuffer) > 0).assertTrue();
        expect(inkRect(clippedBuffer, 110, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0350
     * @tc.name testComboChain0050
     * @tc.desc Verify a veil layer, a clip and a translation compose into one bounded painted square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0050 begin');
      await runCase('testComboChain0050', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(200));
        target.canvas.clipRect(ltrb(40, 40, 160, 160));
        target.canvas.translate(20, 20);
        fillPath(target, rectPath(0, 0, SIZE, SIZE), solidBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(14400);
        expect(alphaAt(buffer, 50, 50) >= 195 && alphaAt(buffer, 50, 50) <= 205).assertTrue();
        expect(redAt(buffer, 50, 50)).assertEqual(188);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0351
     * @tc.name testComboChain0051
     * @tc.desc Verify a hundredfold scale turns a two pixel square into a full bitmap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0051 begin');
      await runCase('testComboChain0051', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.scale(100, 100);
        fillPath(target, rectPath(0, 0, 2, 2), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(firstInkCol(buffer)).assertEqual(0);
        expect(lastInkCol(buffer)).assertEqual(199);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0352
     * @tc.name testComboChain0052
     * @tc.desc Verify a hundredth scale shrinks a full bitmap rectangle to a few pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0052 begin');
      await runCase('testComboChain0052', async () => {
        const tiny: OffscreenTarget = await fresh();
        tiny.canvas.scale(0.01, 0.01);
        fillPath(tiny, rectPath(0, 0, SIZE, SIZE), solidBrush());
        const tinyBuffer: ArrayBuffer = await snap(tiny);
        const plainBuffer: ArrayBuffer = await plainFill(rectPath(0, 0, SIZE, SIZE));
        expect(inkAll(tinyBuffer) <= 4).assertTrue();
        expect(inkAll(plainBuffer)).assertEqual(40000);
        expect(gapBytes(tinyBuffer, plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0353
     * @tc.name testComboChain0053
     * @tc.desc Verify a zero scale paints nothing and a restore makes the next fill visible again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0053 begin');
      await runCase('testComboChain0053', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const zeroed: OffscreenTarget = await fresh();
        zeroed.canvas.scale(0, 0);
        fillPath(zeroed, shape, solidBrush());
        const revived: OffscreenTarget = await fresh();
        const base: number = revived.canvas.getSaveCount();
        revived.canvas.save();
        revived.canvas.scale(0, 0);
        revived.canvas.restore();
        fillPath(revived, shape, solidBrush());
        expect(inkAll(await snap(zeroed))).assertEqual(0);
        expect(inkAll(await snap(revived))).assertEqual(1600);
        expect(revived.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0354
     * @tc.name testComboChain0054
     * @tc.desc Verify a double mirror flips the square around the translation anchor point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0054 begin');
      await runCase('testComboChain0054', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.translate(120, 120);
        target.canvas.scale(-1, -1);
        fillPath(target, rectPath(20, 20, 60, 60), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(firstInkCol(buffer)).assertEqual(60);
        expect(firstInkRow(buffer)).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0355
     * @tc.name testComboChain0055
     * @tc.desc Verify a full turn around the center behaves like no rotation at all.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0055 begin');
      await runCase('testComboChain0055', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.rotate(360, 100, 100);
        fillPath(target, rectPath(20, 20, 60, 60), solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(near(inkAll(buffer), 1600, 60)).assertTrue();
        expect(near(firstInkCol(buffer), 20, 1)).assertTrue();
        expect(near(lastInkCol(buffer), 59, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0356
     * @tc.name testComboChain0056
     * @tc.desc Verify ten small translations of the same axis sum into one hundred pixel shift.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0056 begin');
      await runCase('testComboChain0056', async () => {
        const shape: drawing.Path = rectPath(10, 10, 30, 30);
        const stepped: OffscreenTarget = await fresh();
        for (let step: number = 0; step < 10; step++) {
          stepped.canvas.translate(10, 0);
        }
        fillPath(stepped, shape, solidBrush());
        const once: OffscreenTarget = await fresh();
        once.canvas.translate(100, 0);
        fillPath(once, shape, solidBrush());
        const steppedBuffer: ArrayBuffer = await snap(stepped);
        expect(gapBytes(steppedBuffer, await snap(once))).assertEqual(0);
        expect(inkAll(steppedBuffer)).assertEqual(400);
        expect(firstInkCol(steppedBuffer)).assertEqual(110);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0357
     * @tc.name testComboChain0057
     * @tc.desc Verify a twenty step two axis chain matches one diagonal translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0057 begin');
      await runCase('testComboChain0057', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const walked: OffscreenTarget = await fresh();
        for (let wide: number = 0; wide < 10; wide++) {
          walked.canvas.translate(5, 0);
        }
        for (let tall: number = 0; tall < 10; tall++) {
          walked.canvas.translate(0, 5);
        }
        fillPath(walked, shape, solidBrush());
        const diagonal: OffscreenTarget = await fresh();
        diagonal.canvas.translate(50, 50);
        fillPath(diagonal, shape, solidBrush());
        const walkedBuffer: ArrayBuffer = await snap(walked);
        expect(gapBytes(walkedBuffer, await snap(diagonal))).assertEqual(0);
        expect(inkAll(walkedBuffer)).assertEqual(1600);
        expect(firstInkCol(walkedBuffer)).assertEqual(70);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0358
     * @tc.name testComboChain0058
     * @tc.desc Verify a far translation empties the bitmap and restore brings the shape back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0058 begin');
      await runCase('testComboChain0058', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const far: OffscreenTarget = await fresh();
        far.canvas.translate(1000, 0);
        fillPath(far, shape, solidBrush());
        const near_: OffscreenTarget = await fresh();
        const base: number = near_.canvas.getSaveCount();
        near_.canvas.save();
        near_.canvas.translate(1000, 0);
        near_.canvas.restore();
        fillPath(near_, shape, solidBrush());
        expect(inkAll(await snap(far))).assertEqual(0);
        expect(inkAll(await snap(near_))).assertEqual(1600);
        expect(near_.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0359
     * @tc.name testComboChain0059
     * @tc.desc Verify two horizontal mirrors cancel out and leave the fill unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboChain0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0059 begin');
      await runCase('testComboChain0059', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const flipped: OffscreenTarget = await fresh();
        flipped.canvas.scale(-1, 1);
        flipped.canvas.scale(-1, 1);
        fillPath(flipped, shape, solidBrush());
        const flippedBuffer: ArrayBuffer = await snap(flipped);
        expect(gapBytes(flippedBuffer, await plainFill(shape))).assertEqual(0);
        expect(inkAll(flippedBuffer)).assertEqual(1600);
        expect(firstInkCol(flippedBuffer)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0360
     * @tc.name testComboChain0060
     * @tc.desc Verify eight balanced save blocks leave the canvas ready for a plain fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboChain0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0060 begin');
      await runCase('testComboChain0060', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        for (let depth: number = 0; depth < 8; depth++) {
          target.canvas.save();
          target.canvas.translate(10, 0);
        }
        for (let depth: number = 0; depth < 8; depth++) {
          target.canvas.restore();
        }
        fillPath(target, shape, solidBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(gapBytes(buffer, await plainFill(shape))).assertEqual(0);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(inkAll(buffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboChain0060 end');
    });
  });
}
