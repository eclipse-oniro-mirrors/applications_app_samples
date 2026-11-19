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
const BASE_RED: number = 60;
const BASE_GREEN: number = 90;
const BASE_BLUE: number = 140;

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
async function snapshot(target: OffscreenTarget): Promise<ArrayBuffer> {
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
function px(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
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
function alphaOf(buffer: ArrayBuffer, x: number, y: number): number {
  return px(buffer, x, y, 3);
}

/**
 * Read the red channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Red value.
 */
function redOf(buffer: ArrayBuffer, x: number, y: number): number {
  return px(buffer, x, y, 0);
}

/**
 * Read the green channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Green value.
 */
function greenOf(buffer: ArrayBuffer, x: number, y: number): number {
  return px(buffer, x, y, 1);
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
function inkIn(buffer: ArrayBuffer, left: number, top: number, right: number, bottom: number): number {
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
  return inkIn(buffer, 0, 0, SIZE, SIZE);
}

/**
 * Count painted pixels of one row.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } y - Row to scan.
 * @returns { number } Number of painted pixels in the row.
 */
function inkRowAt(buffer: ArrayBuffer, y: number): number {
  return inkIn(buffer, 0, y, SIZE, y + 1);
}

/**
 * Find the largest alpha value of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Largest alpha, zero when nothing is painted.
 */
function peakAlpha(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let peak: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > peak) {
      peak = bytes[index];
    }
  }
  return peak;
}

/**
 * Count the bytes that differ between two equally sized buffers.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @returns { number } Number of differing bytes.
 */
function diffBytes(first: ArrayBuffer, second: ArrayBuffer): number {
  const bytesA: Uint8Array = new Uint8Array(first);
  const bytesB: Uint8Array = new Uint8Array(second);
  const length: number = Math.min(bytesA.length, bytesB.length);
  let diff: number = 0;
  for (let index: number = 0; index < length; index++) {
    if (bytesA[index] !== bytesB[index]) {
      diff++;
    }
  }
  return diff;
}

/**
 * Compare two numbers with a small slack for rasterisation rounding.
 *
 * @param { number } value - Measured value.
 * @param { number } expected - Expected value.
 * @param { number } slack - Allowed absolute difference.
 * @returns { boolean } Whether the values are close enough.
 */
function closeEnough(value: number, expected: number, slack: number): boolean {
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
function layerBrush(alpha: number): drawing.Brush {
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
function solidPen(width: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
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
function rectShape(left: number, top: number, right: number, bottom: number): drawing.Path {
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
function circleShape(centerX: number, centerY: number, radius: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(centerX, centerY, radius, drawing.PathDirection.CLOCKWISE);
  return path;
}

/**
 * Fill one path on a target with one brush.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.Path } shape - Path to fill.
 * @param { drawing.Brush } brush - Brush carrying color and alpha.
 */
function fillShape(target: OffscreenTarget, shape: drawing.Path, brush: drawing.Brush): void {
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
function strokeShape(target: OffscreenTarget, shape: drawing.Path, pen: drawing.Pen): void {
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
async function paintPlain(shape: drawing.Path): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await fresh();
  fillShape(target, shape, solidBrush());
  return await snapshot(target);
}

/**
 * Build a scale matrix around the origin.
 *
 * @param { number } factor - Scale factor of both axes.
 * @returns { drawing.Matrix } Scale matrix.
 */
function scaleMatrix(factor: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setScale(factor, factor, 0, 0);
  return matrix;
}

/**
 * Build a translation matrix.
 *
 * @param { number } dx - Horizontal offset.
 * @param { number } dy - Vertical offset.
 * @returns { drawing.Matrix } Translation matrix.
 */
function shiftMatrix(dx: number, dy: number): drawing.Matrix {
  const matrix: drawing.Matrix = new drawing.Matrix();
  matrix.setTranslation(dx, dy);
  return matrix;
}

export default function comboMatrixLayerTest() {
  describe('ComboMatrixLayerTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0241
     * @tc.name testComboMatrix0001
     * @tc.desc Verify a scale matrix on the canvas equals transforming the circle itself.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0001 begin');
      await runCase('testComboMatrix0001', async () => {
        const factor: drawing.Matrix = scaleMatrix(2);
        const shape: drawing.Path = circleShape(50, 50, 20);
        const viaCanvas: OffscreenTarget = await fresh();
        viaCanvas.canvas.setMatrix(factor);
        fillShape(viaCanvas, shape, solidBrush());
        const copied: drawing.Path = new drawing.Path(shape);
        copied.transform(factor);
        const viaPath: OffscreenTarget = await fresh();
        fillShape(viaPath, copied, solidBrush());
        const canvasBuffer: ArrayBuffer = await snapshot(viaCanvas);
        const pathBuffer: ArrayBuffer = await snapshot(viaPath);
        expect(diffBytes(canvasBuffer, pathBuffer)).assertEqual(0);
        expect(closeEnough(inkAll(canvasBuffer), 5026, 400)).assertTrue();
        expect(inkIn(canvasBuffer, 150, 150, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0242
     * @tc.name testComboMatrix0002
     * @tc.desc Verify a rotation matrix on the canvas equals the rotate call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0002 begin');
      await runCase('testComboMatrix0002', async () => {
        const rotate: drawing.Matrix = new drawing.Matrix();
        rotate.setRotation(90, 100, 100);
        const shape: drawing.Path = rectShape(20, 20, 80, 60);
        const viaMatrix: OffscreenTarget = await fresh();
        viaMatrix.canvas.setMatrix(rotate);
        fillShape(viaMatrix, shape, solidBrush());
        const viaCall: OffscreenTarget = await fresh();
        viaCall.canvas.rotate(90, 100, 100);
        fillShape(viaCall, shape, solidBrush());
        const matrixBuffer: ArrayBuffer = await snapshot(viaMatrix);
        expect(diffBytes(matrixBuffer, await snapshot(viaCall))).assertEqual(0);
        expect(inkAll(matrixBuffer)).assertEqual(2400);
        expect(inkIn(matrixBuffer, 120, 0, SIZE, 80)).assertEqual(2400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0243
     * @tc.name testComboMatrix0003
     * @tc.desc Verify concatenating the identity matrix changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0003 begin');
      await runCase('testComboMatrix0003', async () => {
        const shape: drawing.Path = rectShape(10, 10, 90, 70);
        const withIdentity: OffscreenTarget = await fresh();
        withIdentity.canvas.concatMatrix(new drawing.Matrix());
        fillShape(withIdentity, shape, solidBrush());
        const withIdentityTwice: OffscreenTarget = await fresh();
        withIdentityTwice.canvas.concatMatrix(new drawing.Matrix());
        withIdentityTwice.canvas.concatMatrix(new drawing.Matrix());
        fillShape(withIdentityTwice, shape, solidBrush());
        const first: ArrayBuffer = await snapshot(withIdentity);
        expect(diffBytes(first, await paintPlain(shape))).assertEqual(0);
        expect(diffBytes(first, await snapshot(withIdentityTwice))).assertEqual(0);
        expect(inkAll(first)).assertEqual(4800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0244
     * @tc.name testComboMatrix0004
     * @tc.desc Verify a later setMatrix call replaces the earlier matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0004 begin');
      await runCase('testComboMatrix0004', async () => {
        const shape: drawing.Path = rectShape(10, 10, 50, 50);
        const overwritten: OffscreenTarget = await fresh();
        overwritten.canvas.setMatrix(shiftMatrix(60, 0));
        overwritten.canvas.setMatrix(scaleMatrix(2));
        fillShape(overwritten, shape, solidBrush());
        const onlyScale: OffscreenTarget = await fresh();
        onlyScale.canvas.setMatrix(scaleMatrix(2));
        fillShape(onlyScale, shape, solidBrush());
        const overwrittenBuffer: ArrayBuffer = await snapshot(overwritten);
        expect(diffBytes(overwrittenBuffer, await snapshot(onlyScale))).assertEqual(0);
        expect(inkAll(overwrittenBuffer)).assertEqual(6400);
        expect(inkIn(overwrittenBuffer, 0, 0, 20, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0245
     * @tc.name testComboMatrix0005
     * @tc.desc Verify an identity matrix on the canvas equals no matrix at all.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0005 begin');
      await runCase('testComboMatrix0005', async () => {
        const shape: drawing.Path = circleShape(100, 100, 40);
        const identity: OffscreenTarget = await fresh();
        identity.canvas.setMatrix(new drawing.Matrix());
        fillShape(identity, shape, solidBrush());
        const identityBuffer: ArrayBuffer = await snapshot(identity);
        expect(diffBytes(identityBuffer, await paintPlain(shape))).assertEqual(0);
        expect(diffBytes(identityBuffer, await paintPlain(circleShape(100, 100, 40)))).assertEqual(0);
        expect(closeEnough(inkAll(identityBuffer), 5026, 400)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0246
     * @tc.name testComboMatrix0006
     * @tc.desc Verify a clip rectangle is scaled together with the canvas matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0006 begin');
      await runCase('testComboMatrix0006', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(inkIn(buffer, 0, 0, 100, 100)).assertEqual(10000);
        expect(inkRowAt(buffer, 120)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0247
     * @tc.name testComboMatrix0007
     * @tc.desc Verify a translated canvas moves the clip window with it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0007 begin');
      await runCase('testComboMatrix0007', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(shiftMatrix(40, 0));
        target.canvas.clipRect(ltrb(0, 0, 60, SIZE));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(12000);
        expect(inkIn(buffer, 40, 0, 100, SIZE)).assertEqual(12000);
        expect(inkIn(buffer, 0, 0, 40, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0248
     * @tc.name testComboMatrix0008
     * @tc.desc Verify a rotated canvas turns the clip window by a quarter turn.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0008 begin');
      await runCase('testComboMatrix0008', async () => {
        const rotate: drawing.Matrix = new drawing.Matrix();
        rotate.setRotation(90, 100, 100);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(rotate);
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(closeEnough(inkAll(buffer), 20000, 400)).assertTrue();
        expect(inkIn(buffer, 0, 0, SIZE, 100)).assertEqual(20000);
        expect(inkIn(buffer, 0, 100, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0249
     * @tc.name testComboMatrix0009
     * @tc.desc Verify a half transparent layer still applies under a canvas matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0009 begin');
      await runCase('testComboMatrix0009', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.saveLayer(null, layerBrush(128));
        fillShape(target, rectShape(20, 20, 60, 60), solidBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(peakAlpha(buffer) >= 120 && peakAlpha(buffer) <= 132).assertTrue();
        expect(inkIn(buffer, 0, 0, 40, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0250
     * @tc.name testComboMatrix0010
     * @tc.desc Verify painting one shape twice under a matrix equals painting it once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0010 begin');
      await runCase('testComboMatrix0010', async () => {
        const shape: drawing.Path = rectShape(20, 20, 60, 40);
        const twice: OffscreenTarget = await fresh();
        twice.canvas.setMatrix(shiftMatrix(20, 30));
        fillShape(twice, shape, solidBrush());
        fillShape(twice, shape, solidBrush());
        const once: OffscreenTarget = await fresh();
        once.canvas.setMatrix(shiftMatrix(20, 30));
        fillShape(once, shape, solidBrush());
        const twiceBuffer: ArrayBuffer = await snapshot(twice);
        expect(diffBytes(twiceBuffer, await snapshot(once))).assertEqual(0);
        expect(inkAll(twiceBuffer)).assertEqual(800);
        expect(inkIn(twiceBuffer, 40, 50, 81, 71)).assertEqual(800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0251
     * @tc.name testComboMatrix0011
     * @tc.desc Verify restore undoes a translation applied inside one save block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0011 begin');
      await runCase('testComboMatrix0011', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.save();
        target.canvas.translate(80, 60);
        fillShape(target, rectShape(10, 10, 40, 40), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(10, 10, 40, 40), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(1800);
        expect(redOf(buffer, 100, 80)).assertEqual(FG_RED);
        expect(redOf(buffer, 20, 20)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0252
     * @tc.name testComboMatrix0012
     * @tc.desc Verify restore undoes a scale applied inside one save block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0012 begin');
      await runCase('testComboMatrix0012', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.save();
        target.canvas.scale(2, 2);
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(10, 10, 30, 30), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(1900);
        expect(redOf(buffer, 50, 50)).assertEqual(FG_RED);
        expect(redOf(buffer, 15, 15)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0253
     * @tc.name testComboMatrix0013
     * @tc.desc Verify three nested save blocks accumulate their translations.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0013 begin');
      await runCase('testComboMatrix0013', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.save();
        target.canvas.translate(20, 0);
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.save();
        target.canvas.translate(20, 0);
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.save();
        target.canvas.translate(20, 0);
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.restore();
        target.canvas.restore();
        target.canvas.restore();
        fillShape(target, rectShape(10, 10, 30, 30), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(inkIn(buffer, 30, 10, 50, 30)).assertEqual(400);
        expect(inkIn(buffer, 70, 10, 90, 30)).assertEqual(400);
        expect(redOf(buffer, 20, 20)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0254
     * @tc.name testComboMatrix0014
     * @tc.desc Verify the save count rises and falls with every save and restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0014 begin');
      await runCase('testComboMatrix0014', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        const afterOne: number = target.canvas.getSaveCount();
        target.canvas.save();
        const afterTwo: number = target.canvas.getSaveCount();
        target.canvas.restore();
        const afterRestore: number = target.canvas.getSaveCount();
        target.canvas.restore();
        expect(afterOne).assertEqual(base + 1);
        expect(afterTwo).assertEqual(base + 2);
        expect(afterRestore).assertEqual(base + 1);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0255
     * @tc.name testComboMatrix0015
     * @tc.desc Verify restoreToCount unwinds every nested transformation at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0015 begin');
      await runCase('testComboMatrix0015', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.translate(60, 0);
        target.canvas.save();
        target.canvas.scale(2, 2);
        target.canvas.restoreToCount(base);
        fillShape(target, rectShape(10, 10, 40, 40), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(900);
        expect(inkIn(buffer, 10, 10, 40, 40)).assertEqual(900);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0256
     * @tc.name testComboMatrix0016
     * @tc.desc Verify restore brings back the matrix that was active before the save.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0016 begin');
      await runCase('testComboMatrix0016', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(shiftMatrix(30, 0));
        target.canvas.save();
        target.canvas.setMatrix(shiftMatrix(0, 60));
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(10, 10, 30, 30), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(800);
        expect(redOf(buffer, 20, 80)).assertEqual(FG_RED);
        expect(redOf(buffer, 50, 20)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0257
     * @tc.name testComboMatrix0017
     * @tc.desc Verify a nested clip intersects the outer clip instead of replacing it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0017 begin');
      await runCase('testComboMatrix0017', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 120, SIZE));
        target.canvas.save();
        target.canvas.clipRect(ltrb(60, 0, SIZE, SIZE));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(0, 0, SIZE, SIZE), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(24000);
        expect(inkIn(buffer, 60, 0, 120, SIZE)).assertEqual(12000);
        expect(redOf(buffer, 30, 100)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0258
     * @tc.name testComboMatrix0018
     * @tc.desc Verify a restored layer no longer swallows what is painted afterwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0018 begin');
      await runCase('testComboMatrix0018', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.save();
        target.canvas.saveLayer(null, layerBrush(0));
        fillShape(target, rectShape(10, 10, 50, 50), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(100, 100, 150, 150), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkIn(buffer, 0, 0, 90, 90)).assertEqual(0);
        expect(inkIn(buffer, 90, 90, SIZE, SIZE)).assertEqual(2500);
        expect(peakAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0259
     * @tc.name testComboMatrix0019
     * @tc.desc Verify a partial unwinding keeps the outer translation in force.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0019 begin');
      await runCase('testComboMatrix0019', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.translate(20, 0);
        target.canvas.save();
        target.canvas.translate(20, 0);
        target.canvas.restore();
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(400);
        expect(inkIn(buffer, 30, 10, 50, 30)).assertEqual(400);
        expect(target.canvas.getSaveCount()).assertEqual(base + 1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0260
     * @tc.name testComboMatrix0020
     * @tc.desc Verify eight nested saves all unwind back to the baseline transform.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0020 begin');
      await runCase('testComboMatrix0020', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        for (let index: number = 0; index < 8; index++) {
          target.canvas.save();
          target.canvas.scale(2, 2);
        }
        for (let index: number = 0; index < 8; index++) {
          target.canvas.restore();
        }
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(inkIn(buffer, 10, 10, 30, 30)).assertEqual(400);
        expect(inkAll(buffer)).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0261
     * @tc.name testComboMatrix0021
     * @tc.desc Verify a scaled clip window covers the matching device area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0021 begin');
      await runCase('testComboMatrix0021', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.clipRect(ltrb(0, 0, 60, 60));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(14400);
        expect(inkIn(buffer, 0, 0, 120, 120)).assertEqual(14400);
        expect(inkIn(buffer, 120, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0262
     * @tc.name testComboMatrix0022
     * @tc.desc Verify a translation shifts the clip rectangle in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0022 begin');
      await runCase('testComboMatrix0022', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(shiftMatrix(30, 40));
        target.canvas.clipRect(ltrb(0, 0, 80, 60));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(4800);
        expect(inkIn(buffer, 30, 40, 110, 100)).assertEqual(4800);
        expect(inkRowAt(buffer, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0263
     * @tc.name testComboMatrix0023
     * @tc.desc Verify a rotated canvas moves the square clip window to the right half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0023 begin');
      await runCase('testComboMatrix0023', async () => {
        const rotate: drawing.Matrix = new drawing.Matrix();
        rotate.setRotation(90, 100, 100);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(rotate);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(closeEnough(inkAll(buffer), 10000, 300)).assertTrue();
        expect(inkIn(buffer, 100, 0, SIZE, 100)).assertEqual(10000);
        expect(inkIn(buffer, 0, 0, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0264
     * @tc.name testComboMatrix0024
     * @tc.desc Verify a scaled circular clip keeps all ink inside the device circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0024 begin');
      await runCase('testComboMatrix0024', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.clipPath(circleShape(50, 50, 30));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(closeEnough(inkAll(buffer), 11310, 800)).assertTrue();
        expect(inkIn(buffer, 0, 0, 20, 20)).assertEqual(0);
        expect(inkIn(buffer, 95, 95, 105, 105)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0265
     * @tc.name testComboMatrix0025
     * @tc.desc Verify a difference clip under a scale matrix removes the scaled hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0025 begin');
      await runCase('testComboMatrix0025', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.clipRect(ltrb(50, 50, 100, 100), drawing.ClipOp.DIFFERENCE);
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(closeEnough(inkAll(buffer), 30000, 600)).assertTrue();
        expect(inkIn(buffer, 100, 100, SIZE, SIZE)).assertEqual(0);
        expect(inkIn(buffer, 0, 0, 100, 100)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0266
     * @tc.name testComboMatrix0026
     * @tc.desc Verify a matrix, a layer and a clip stack into one bounded result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0026 begin');
      await runCase('testComboMatrix0026', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.saveLayer(null, layerBrush(128));
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(inkIn(buffer, 100, 0, SIZE, SIZE)).assertEqual(0);
        expect(peakAlpha(buffer) >= 120 && peakAlpha(buffer) <= 132).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0267
     * @tc.name testComboMatrix0027
     * @tc.desc Verify a reduced matrix shrinks the clipped area by four.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0027 begin');
      await runCase('testComboMatrix0027', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(0.5));
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(inkIn(buffer, 0, 0, 50, 50)).assertEqual(2500);
        expect(inkIn(buffer, 50, 50, SIZE, SIZE)).assertEqual(0);
        expect(inkRowAt(buffer, 25)).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0268
     * @tc.name testComboMatrix0028
     * @tc.desc Verify a scaled clip equals clipping then transforming the shape itself.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0028 begin');
      await runCase('testComboMatrix0028', async () => {
        const factor: drawing.Matrix = scaleMatrix(2);
        const viaMatrix: OffscreenTarget = await fresh();
        viaMatrix.canvas.setMatrix(factor);
        viaMatrix.canvas.clipRect(ltrb(0, 0, 60, 60));
        fillShape(viaMatrix, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const viaPath: OffscreenTarget = await fresh();
        viaPath.canvas.clipRect(ltrb(0, 0, 120, 120));
        const grown: drawing.Path = rectShape(0, 0, SIZE, SIZE);
        grown.transform(factor);
        fillShape(viaPath, grown, solidBrush());
        const matrixBuffer: ArrayBuffer = await snapshot(viaMatrix);
        expect(diffBytes(matrixBuffer, await snapshot(viaPath))).assertEqual(0);
        expect(inkAll(matrixBuffer)).assertEqual(14400);
        expect(inkIn(matrixBuffer, 0, 0, 120, 120)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0269
     * @tc.name testComboMatrix0029
     * @tc.desc Verify a clip taken before a matrix change stays in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0029 begin');
      await runCase('testComboMatrix0029', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        target.canvas.setMatrix(scaleMatrix(2));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(inkIn(buffer, 100, 0, SIZE, SIZE)).assertEqual(0);
        expect(inkRowAt(buffer, 150)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0270
     * @tc.name testComboMatrix0030
     * @tc.desc Verify an oversized shape fills the canvas under any affine matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0030 begin');
      await runCase('testComboMatrix0030', async () => {
        const shifted: OffscreenTarget = await fresh();
        shifted.canvas.setMatrix(shiftMatrix(20, 20));
        fillShape(shifted, rectShape(-100, -100, 300, 300), solidBrush());
        const rotated: OffscreenTarget = await fresh();
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(30, 100, 100);
        rotated.canvas.setMatrix(turn);
        fillShape(rotated, rectShape(-200, -200, 400, 400), solidBrush());
        const shiftBuffer: ArrayBuffer = await snapshot(shifted);
        const turnBuffer: ArrayBuffer = await snapshot(rotated);
        expect(inkAll(shiftBuffer)).assertEqual(SIZE * SIZE);
        expect(inkAll(turnBuffer)).assertEqual(SIZE * SIZE);
        expect(diffBytes(shiftBuffer, turnBuffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0271
     * @tc.name testComboMatrix0031
     * @tc.desc Verify a scale applied inside a layer does not leak past restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0031 begin');
      await runCase('testComboMatrix0031', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, layerBrush(255));
        target.canvas.scale(2, 2);
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(100, 100, 130, 130), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(redOf(buffer, 50, 50)).assertEqual(FG_RED);
        expect(redOf(buffer, 110, 110)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0272
     * @tc.name testComboMatrix0032
     * @tc.desc Verify a matrix set inside a half transparent layer is still applied.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0032 begin');
      await runCase('testComboMatrix0032', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, layerBrush(128));
        target.canvas.setMatrix(scaleMatrix(2));
        fillShape(target, rectShape(20, 20, 60, 60), solidBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(inkIn(buffer, 40, 40, 120, 120)).assertEqual(6400);
        expect(peakAlpha(buffer) >= 120 && peakAlpha(buffer) <= 132).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0273
     * @tc.name testComboMatrix0033
     * @tc.desc Verify a bounded layer is allocated at the transformed device area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0033 begin');
      await runCase('testComboMatrix0033', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(shiftMatrix(50, 0));
        target.canvas.saveLayer(ltrb(0, 0, 100, 50), layerBrush(255));
        fillShape(target, rectShape(0, 0, SIZE, SIZE), solidBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer) > 1000).assertTrue();
        expect(inkAll(buffer) <= 5200).assertTrue();
        expect(inkIn(buffer, 0, 0, 50, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0274
     * @tc.name testComboMatrix0034
     * @tc.desc Verify a multiply layer darkens a matrix transformed shape over the base.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0034 begin');
      await runCase('testComboMatrix0034', async () => {
        const multiply: drawing.Brush = layerBrush(255);
        multiply.setBlendMode(drawing.BlendMode.MULTIPLY);
        const target: OffscreenTarget = await fresh();
        target.canvas.drawColor(rgba(255, BASE_RED, BASE_GREEN, BASE_BLUE), drawing.BlendMode.SRC);
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.saveLayer(null, multiply);
        fillShape(target, rectShape(20, 20, 50, 50), altBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        let darker: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (greenOf(buffer, x, y) < BASE_GREEN) {
              darker++;
            }
          }
        }
        expect(darker > 1000).assertTrue();
        expect(inkAll(buffer)).assertEqual(SIZE * SIZE);
        expect(redOf(buffer, 5, 5)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0275
     * @tc.name testComboMatrix0035
     * @tc.desc Verify the matrix order around saveLayer does not change the pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0035 begin');
      await runCase('testComboMatrix0035', async () => {
        const before: OffscreenTarget = await fresh();
        before.canvas.setMatrix(scaleMatrix(2));
        before.canvas.saveLayer(null, layerBrush(255));
        fillShape(before, rectShape(20, 20, 40, 40), solidBrush());
        before.canvas.restore();
        const after: OffscreenTarget = await fresh();
        after.canvas.saveLayer(null, layerBrush(255));
        after.canvas.setMatrix(scaleMatrix(2));
        fillShape(after, rectShape(20, 20, 40, 40), solidBrush());
        after.canvas.restore();
        const beforeBuffer: ArrayBuffer = await snapshot(before);
        expect(diffBytes(beforeBuffer, await snapshot(after))).assertEqual(0);
        expect(inkAll(beforeBuffer)).assertEqual(1600);
        expect(inkIn(beforeBuffer, 40, 40, 80, 80)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0276
     * @tc.name testComboMatrix0036
     * @tc.desc Verify a rotation inside a layer is undone by the layer restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0036 begin');
      await runCase('testComboMatrix0036', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, layerBrush(255));
        target.canvas.rotate(90, 100, 100);
        fillShape(target, rectShape(20, 20, 80, 60), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(20, 20, 40, 40), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(2800);
        expect(redOf(buffer, 160, 50)).assertEqual(FG_RED);
        expect(redOf(buffer, 25, 25)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0277
     * @tc.name testComboMatrix0037
     * @tc.desc Verify a matrix used in one layer leaves the next drawing untransformed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0037 begin');
      await runCase('testComboMatrix0037', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, layerBrush(255));
        target.canvas.setMatrix(scaleMatrix(2));
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.restore();
        fillShape(target, rectShape(100, 100, 130, 130), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(redOf(buffer, 30, 30)).assertEqual(FG_RED);
        expect(redOf(buffer, 110, 110)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0278
     * @tc.name testComboMatrix0038
     * @tc.desc Verify a scaled shape in a layer keeps the layer alpha value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0038 begin');
      await runCase('testComboMatrix0038', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, layerBrush(200));
        target.canvas.setMatrix(scaleMatrix(2));
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(peakAlpha(buffer) >= 195 && peakAlpha(buffer) <= 205).assertTrue();
        expect(redOf(buffer, 30, 30)).assertEqual(188);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0279
     * @tc.name testComboMatrix0039
     * @tc.desc Verify a DST_OUT brush inside a layer cannot punch through the base.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0039 begin');
      await runCase('testComboMatrix0039', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.drawColor(rgba(255, BASE_RED, BASE_GREEN, BASE_BLUE), drawing.BlendMode.SRC);
        target.canvas.saveLayer(null, layerBrush(255));
        const cutter: drawing.Brush = new drawing.Brush();
        cutter.setColor(rgba(255, 0, 0, 0));
        cutter.setBlendMode(drawing.BlendMode.DST_OUT);
        target.canvas.attachBrush(cutter);
        target.canvas.drawPath(rectShape(50, 50, 100, 100));
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(SIZE * SIZE);
        expect(redOf(buffer, 75, 75)).assertEqual(BASE_RED);
        expect(alphaOf(buffer, 75, 75)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0280
     * @tc.name testComboMatrix0040
     * @tc.desc Verify a new matrix set after a layer restore drives the next shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0040 begin');
      await runCase('testComboMatrix0040', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, layerBrush(255));
        target.canvas.setMatrix(scaleMatrix(2));
        fillShape(target, rectShape(10, 10, 20, 20), solidBrush());
        target.canvas.restore();
        target.canvas.setMatrix(shiftMatrix(10, 10));
        fillShape(target, rectShape(60, 60, 80, 80), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(800);
        expect(redOf(buffer, 30, 30)).assertEqual(FG_RED);
        expect(redOf(buffer, 75, 75)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0281
     * @tc.name testComboMatrix0041
     * @tc.desc Verify postScale and preScale place the same shape at different spots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0041 begin');
      await runCase('testComboMatrix0041', async () => {
        const post: drawing.Matrix = new drawing.Matrix();
        post.setTranslation(40, 0);
        post.postScale(2, 2, 0, 0);
        const pre: drawing.Matrix = new drawing.Matrix();
        pre.setTranslation(40, 0);
        pre.preScale(2, 2, 0, 0);
        const shape: drawing.Path = rectShape(10, 10, 30, 30);
        const postTarget: OffscreenTarget = await fresh();
        postTarget.canvas.setMatrix(post);
        fillShape(postTarget, shape, solidBrush());
        const preTarget: OffscreenTarget = await fresh();
        preTarget.canvas.setMatrix(pre);
        fillShape(preTarget, shape, solidBrush());
        const postBuffer: ArrayBuffer = await snapshot(postTarget);
        const preBuffer: ArrayBuffer = await snapshot(preTarget);
        expect(inkIn(postBuffer, 60, 0, 100, SIZE)).assertEqual(0);
        expect(inkIn(postBuffer, 100, 0, SIZE, SIZE)).assertEqual(1600);
        expect(inkIn(preBuffer, 100, 0, 140, SIZE)).assertEqual(0);
        expect(diffBytes(postBuffer, preBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0282
     * @tc.name testComboMatrix0042
     * @tc.desc Verify the order of scale and translate on the canvas changes the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0042 begin');
      await runCase('testComboMatrix0042', async () => {
        const shape: drawing.Path = rectShape(10, 10, 30, 30);
        const scaleFirst: OffscreenTarget = await fresh();
        scaleFirst.canvas.scale(2, 2);
        scaleFirst.canvas.translate(10, 10);
        fillShape(scaleFirst, shape, solidBrush());
        const translateFirst: OffscreenTarget = await fresh();
        translateFirst.canvas.translate(10, 10);
        translateFirst.canvas.scale(2, 2);
        fillShape(translateFirst, shape, solidBrush());
        const scaleBuffer: ArrayBuffer = await snapshot(scaleFirst);
        const shiftBuffer: ArrayBuffer = await snapshot(translateFirst);
        expect(inkIn(scaleBuffer, 40, 0, 80, SIZE)).assertEqual(1600);
        expect(inkIn(shiftBuffer, 30, 0, 70, SIZE)).assertEqual(1600);
        expect(diffBytes(scaleBuffer, shiftBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0283
     * @tc.name testComboMatrix0043
     * @tc.desc Verify the inverse matrix brings a painted shape back to the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0043 begin');
      await runCase('testComboMatrix0043', async () => {
        const move: drawing.Matrix = shiftMatrix(40, 20);
        const back: drawing.Matrix = new drawing.Matrix();
        const inverted: boolean = move.invert(back);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(move);
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        target.canvas.setMatrix(back);
        fillShape(target, rectShape(10, 10, 30, 30), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inverted).assertTrue();
        expect(inkIn(buffer, 50, 30, 70, 50)).assertEqual(400);
        expect(redOf(buffer, 20, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0284
     * @tc.name testComboMatrix0044
     * @tc.desc Verify inverting a matrix twice restores the original transform.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0044 begin');
      await runCase('testComboMatrix0044', async () => {
        const source: drawing.Matrix = scaleMatrix(2);
        const once: drawing.Matrix = new drawing.Matrix();
        const twice: drawing.Matrix = new drawing.Matrix();
        source.invert(once);
        once.invert(twice);
        const shape: drawing.Path = rectShape(20, 20, 50, 50);
        const direct: OffscreenTarget = await fresh();
        direct.canvas.setMatrix(source);
        fillShape(direct, shape, solidBrush());
        const roundTrip: OffscreenTarget = await fresh();
        roundTrip.canvas.setMatrix(twice);
        fillShape(roundTrip, shape, solidBrush());
        const directBuffer: ArrayBuffer = await snapshot(direct);
        expect(diffBytes(directBuffer, await snapshot(roundTrip))).assertEqual(0);
        expect(inkAll(directBuffer)).assertEqual(3600);
        expect(inkIn(directBuffer, 40, 40, 100, 100)).assertEqual(3600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0285
     * @tc.name testComboMatrix0045
     * @tc.desc Verify a quarter turn keeps the inked area of a hard edged rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0045 begin');
      await runCase('testComboMatrix0045', async () => {
        const shape: drawing.Path = rectShape(60, 60, 140, 140);
        const plainInk: number = inkAll(await paintPlain(shape));
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(45, 100, 100);
        const rotated: OffscreenTarget = await fresh();
        rotated.canvas.setMatrix(turn);
        fillShape(rotated, shape, solidBrush());
        const rotatedInk: number = inkAll(await snapshot(rotated));
        expect(plainInk).assertEqual(6400);
        expect(closeEnough(rotatedInk, plainInk, plainInk * 0.05)).assertTrue();
        expect(rotatedInk > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0286
     * @tc.name testComboMatrix0046
     * @tc.desc Verify a zero scale matrix collapses the shape into nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0046 begin');
      await runCase('testComboMatrix0046', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(0));
        fillShape(target, rectShape(10, 10, 90, 90), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(0);
        expect(peakAlpha(buffer)).assertEqual(0);
        expect(diffBytes(buffer, await paintPlain(new drawing.Path()))).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0287
     * @tc.name testComboMatrix0047
     * @tc.desc Verify a negative scale mirrors the shape around its pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0047 begin');
      await runCase('testComboMatrix0047', async () => {
        const mirror: drawing.Matrix = new drawing.Matrix();
        mirror.setScale(-1, -1, 100, 100);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(mirror);
        fillShape(target, rectShape(20, 20, 80, 40), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(1200);
        expect(inkIn(buffer, 120, 160, 180, 180)).assertEqual(1200);
        expect(inkIn(buffer, 20, 20, 80, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0288
     * @tc.name testComboMatrix0048
     * @tc.desc Verify a far translation pushes the shape off the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0048 begin');
      await runCase('testComboMatrix0048', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(shiftMatrix(400, 0));
        fillShape(target, rectShape(10, 10, 90, 90), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(0);
        expect(inkRowAt(buffer, 50)).assertEqual(0);
        expect(peakAlpha(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0289
     * @tc.name testComboMatrix0049
     * @tc.desc Verify an extreme shrink leaves almost no visible ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0049 begin');
      await runCase('testComboMatrix0049', async () => {
        const shape: drawing.Path = rectShape(10, 10, 90, 90);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(0.01));
        fillShape(target, shape, solidBrush());
        const shrunk: ArrayBuffer = await snapshot(target);
        expect(inkAll(shrunk) <= 4).assertTrue();
        expect(inkAll(shrunk) < inkAll(await paintPlain(shape))).assertTrue();
        expect(inkIn(shrunk, 20, 20, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0290
     * @tc.name testComboMatrix0050
     * @tc.desc Verify a matrix, a clip, a layer and a pen combine into one bounded stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0050 begin');
      await runCase('testComboMatrix0050', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        target.canvas.clipRect(ltrb(0, 0, 70, 70));
        target.canvas.saveLayer(null, layerBrush(128));
        strokeShape(target, rectShape(10, 10, 50, 50), solidPen(6));
        target.canvas.restore();
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer) > 500).assertTrue();
        expect(inkIn(buffer, 140, 0, SIZE, SIZE)).assertEqual(0);
        expect(peakAlpha(buffer) >= 120 && peakAlpha(buffer) <= 132).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0291
     * @tc.name testComboMatrix0051
     * @tc.desc Verify painting the same shape twice under one matrix is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0051 begin');
      await runCase('testComboMatrix0051', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(30, 100, 100);
        const shape: drawing.Path = rectShape(40, 40, 100, 100);
        const once: OffscreenTarget = await fresh();
        once.canvas.setMatrix(matrix);
        fillShape(once, shape, solidBrush());
        const twice: OffscreenTarget = await fresh();
        twice.canvas.setMatrix(matrix);
        fillShape(twice, shape, solidBrush());
        fillShape(twice, shape, solidBrush());
        const onceBuffer: ArrayBuffer = await snapshot(once);
        expect(diffBytes(onceBuffer, await snapshot(twice))).assertEqual(0);
        expect(inkAll(onceBuffer) > 3000).assertTrue();
        expect(inkAll(onceBuffer) < 5000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0292
     * @tc.name testComboMatrix0052
     * @tc.desc Verify two canvases driven by one matrix produce equal pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0052 begin');
      await runCase('testComboMatrix0052', async () => {
        const matrix: drawing.Matrix = scaleMatrix(1.5);
        const first: OffscreenTarget = await fresh();
        first.canvas.setMatrix(matrix);
        fillShape(first, circleShape(60, 60, 30), solidBrush());
        const second: OffscreenTarget = await fresh();
        second.canvas.setMatrix(matrix);
        fillShape(second, circleShape(60, 60, 30), solidBrush());
        const firstBuffer: ArrayBuffer = await snapshot(first);
        expect(diffBytes(firstBuffer, await snapshot(second))).assertEqual(0);
        expect(inkAll(firstBuffer) > 5000).assertTrue();
        expect(inkIn(firstBuffer, 150, 150, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0293
     * @tc.name testComboMatrix0053
     * @tc.desc Verify one matrix instance can drive two canvases without cross talk.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0053 begin');
      await runCase('testComboMatrix0053', async () => {
        const shared: drawing.Matrix = shiftMatrix(25, 35);
        const first: OffscreenTarget = await fresh();
        first.canvas.setMatrix(shared);
        fillShape(first, rectShape(10, 10, 40, 40), solidBrush());
        const second: OffscreenTarget = await fresh();
        second.canvas.setMatrix(shared);
        fillShape(second, rectShape(10, 10, 40, 40), solidBrush());
        const firstBuffer: ArrayBuffer = await snapshot(first);
        const secondBuffer: ArrayBuffer = await snapshot(second);
        expect(diffBytes(firstBuffer, secondBuffer)).assertEqual(0);
        expect(inkAll(firstBuffer)).assertEqual(900);
        expect(inkIn(firstBuffer, 35, 45, 65, 75)).assertEqual(900);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0294
     * @tc.name testComboMatrix0054
     * @tc.desc Verify editing a matrix between two draws moves only the second shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0054 begin');
      await runCase('testComboMatrix0054', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(0, 0);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(matrix);
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        matrix.setTranslation(60, 0);
        target.canvas.setMatrix(matrix);
        fillShape(target, rectShape(10, 10, 30, 30), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(800);
        expect(redOf(buffer, 20, 20)).assertEqual(FG_RED);
        expect(redOf(buffer, 80, 20)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0295
     * @tc.name testComboMatrix0055
     * @tc.desc Verify the total matrix read back from the canvas matches what was set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0055 begin');
      await runCase('testComboMatrix0055', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(shiftMatrix(30, 20));
        const total: drawing.Matrix = target.canvas.getTotalMatrix();
        fillShape(target, rectShape(10, 10, 30, 30), solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(total.getValue(2)).assertEqual(30);
        expect(total.getValue(5)).assertEqual(20);
        expect(inkIn(buffer, 40, 30, 60, 50)).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0296
     * @tc.name testComboMatrix0056
     * @tc.desc Verify a boolean union under a matrix inks the combined device area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0056 begin');
      await runCase('testComboMatrix0056', async () => {
        const first: drawing.Path = rectShape(10, 10, 40, 40);
        const second: drawing.Path = rectShape(30, 30, 60, 60);
        first.op(second, drawing.PathOp.UNION);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        fillShape(target, first, solidBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer)).assertEqual(6800);
        expect(inkIn(buffer, 0, 0, 20, SIZE)).assertEqual(0);
        expect(inkIn(buffer, 20, 20, 120, 120)).assertEqual(6800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0297
     * @tc.name testComboMatrix0057
     * @tc.desc Verify a dashed stroke under a matrix inks less than a solid one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0057 begin');
      await runCase('testComboMatrix0057', async () => {
        const line: drawing.Path = new drawing.Path();
        line.moveTo(10, 50);
        line.lineTo(90, 50);
        const solid: OffscreenTarget = await fresh();
        solid.canvas.setMatrix(scaleMatrix(2));
        strokeShape(solid, line, solidPen(4));
        const dashed: OffscreenTarget = await fresh();
        dashed.canvas.setMatrix(scaleMatrix(2));
        const dashedPen: drawing.Pen = solidPen(4);
        dashedPen.setPathEffect(drawing.PathEffect.createDashPathEffect([10, 10], 0));
        strokeShape(dashed, line, dashedPen);
        const solidInk: number = inkAll(await snapshot(solid));
        const dashedInk: number = inkAll(await snapshot(dashed));
        expect(solidInk > 1000).assertTrue();
        expect(dashedInk > 0).assertTrue();
        expect(dashedInk < solidInk * 0.8).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0298
     * @tc.name testComboMatrix0058
     * @tc.desc Verify a half transparent stroke under a matrix stays below full alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0058 begin');
      await runCase('testComboMatrix0058', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(128, FG_RED, FG_GREEN, FG_BLUE));
        pen.setStrokeWidth(6);
        pen.setAntiAlias(false);
        const target: OffscreenTarget = await fresh();
        target.canvas.setMatrix(scaleMatrix(2));
        strokeShape(target, rectShape(20, 20, 60, 60), pen);
        const buffer: ArrayBuffer = await snapshot(target);
        expect(inkAll(buffer) > 500).assertTrue();
        expect(peakAlpha(buffer) >= 120 && peakAlpha(buffer) <= 132).assertTrue();
        expect(inkIn(buffer, 0, 0, 30, 30)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0299
     * @tc.name testComboMatrix0059
     * @tc.desc Verify a half turn equals a double mirror about the same pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0059 begin');
      await runCase('testComboMatrix0059', async () => {
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(180, 100, 100);
        const mirror: drawing.Matrix = new drawing.Matrix();
        mirror.setScale(-1, -1, 100, 100);
        const shape: drawing.Path = rectShape(20, 20, 60, 40);
        const turned: OffscreenTarget = await fresh();
        turned.canvas.setMatrix(turn);
        fillShape(turned, shape, solidBrush());
        const mirrored: OffscreenTarget = await fresh();
        mirrored.canvas.setMatrix(mirror);
        fillShape(mirrored, shape, solidBrush());
        const turnBuffer: ArrayBuffer = await snapshot(turned);
        expect(diffBytes(turnBuffer, await snapshot(mirrored))).assertEqual(0);
        expect(inkAll(turnBuffer)).assertEqual(800);
        expect(inkIn(turnBuffer, 140, 160, 180, 180)).assertEqual(800);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0300
     * @tc.name testComboMatrix0060
     * @tc.desc Verify a saved transform stack unwinds fully after a layered stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboMatrix0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0060 begin');
      await runCase('testComboMatrix0060', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.translate(30, 0);
        target.canvas.save();
        target.canvas.scale(2, 2);
        target.canvas.save();
        target.canvas.setMatrix(shiftMatrix(0, 20));
        target.canvas.clipRect(ltrb(0, 0, 40, 40));
        target.canvas.saveLayer(null, layerBrush(255));
        fillShape(target, rectShape(0, 0, 40, 40), solidBrush());
        target.canvas.restoreToCount(base);
        fillShape(target, rectShape(10, 10, 30, 30), altBrush());
        const buffer: ArrayBuffer = await snapshot(target);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(inkAll(buffer)).assertEqual(1800);
        expect(redOf(buffer, 20, 25)).assertEqual(ALT_RED);
        expect(inkIn(buffer, 0, 0, SIZE, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboMatrix0060 end');
    });
  });
}
