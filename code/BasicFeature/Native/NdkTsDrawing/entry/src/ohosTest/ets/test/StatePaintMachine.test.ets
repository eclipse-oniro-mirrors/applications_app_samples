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
 * Read one color channel of a pixel.
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
 * Count painted pixels inside one rectangle.
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
 * Find the left most painted column.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Column index, minus one when nothing is painted.
 */
function firstInkCol(buffer: ArrayBuffer): number {
  for (let x: number = 0; x < SIZE; x++) {
    if (inkRect(buffer, x, 0, x + 1, SIZE) > 0) {
      return x;
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
 * Build a hard edged brush with explicit color.
 *
 * @param { number } alpha - Alpha channel.
 * @param { number } red - Red channel.
 * @param { number } green - Green channel.
 * @param { number } blue - Blue channel.
 * @returns { drawing.Brush } Configured brush.
 */
function brushOf(alpha: number, red: number, green: number, blue: number): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, red, green, blue));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a hard edged foreground brush.
 *
 * @returns { drawing.Brush } Configured brush.
 */
function fgBrush(): drawing.Brush {
  return brushOf(255, FG_RED, FG_GREEN, FG_BLUE);
}

/**
 * Build a hard edged alternate color brush.
 *
 * @returns { drawing.Brush } Configured brush.
 */
function altBrush(): drawing.Brush {
  return brushOf(255, ALT_RED, ALT_GREEN, ALT_BLUE);
}

/**
 * Build a hard edged foreground pen.
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
 * Fill one path with one brush and detach the brush afterwards.
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
 * Stroke one path with one pen and detach the pen afterwards.
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

export default function statePaintMachineTest() {
  describe('StatePaintMachineTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0059
     * @tc.name testStatePaint0001
     * @tc.desc Verify a stroke width written to a pen is readable back and affects the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0001 begin');
      await runCase('testStatePaint0001', async () => {
        const pen: drawing.Pen = penOf(4);
        pen.setStrokeWidth(9);
        const target: OffscreenTarget = await fresh();
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        expect(pen.getWidth()).assertEqual(9);
        expect(inkAll(await snap(target)) > 0).assertTrue();
        expect(alphaAt(await snap(target), 40, 20)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0060
     * @tc.name testStatePaint0002
     * @tc.desc Verify the pen alpha readback matches what was set and caps the stroke alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0002 begin');
      await runCase('testStatePaint0002', async () => {
        const pen: drawing.Pen = penOf(8);
        pen.setAlpha(128);
        const target: OffscreenTarget = await fresh();
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(pen.getAlpha()).assertEqual(128);
        expect(alphaAt(buffer, 40, 20) >= 120 && alphaAt(buffer, 40, 20) <= 136).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0061
     * @tc.name testStatePaint0003
     * @tc.desc Verify each pen color channel survives a write and read cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0003 begin');
      await runCase('testStatePaint0003', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(200, 30, 60, 90));
        expect(pen.getColor().alpha).assertEqual(200);
        expect(pen.getColor().red).assertEqual(30);
        expect(pen.getColor().green).assertEqual(60);
        expect(pen.getColor().blue).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0062
     * @tc.name testStatePaint0004
     * @tc.desc Verify the join style defaults to miter and follows a later round request.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0004 begin');
      await runCase('testStatePaint0004', async () => {
        const pen: drawing.Pen = penOf(10);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0063
     * @tc.name testStatePaint0005
     * @tc.desc Verify the cap style defaults to flat and follows a later round request.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0005 begin');
      await runCase('testStatePaint0005', async () => {
        const pen: drawing.Pen = penOf(10);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0064
     * @tc.name testStatePaint0006
     * @tc.desc Verify the miter limit written to a pen can be read back unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0006 begin');
      await runCase('testStatePaint0006', async () => {
        const pen: drawing.Pen = penOf(10);
        pen.setMiterLimit(8);
        expect(pen.getMiterLimit()).assertEqual(8);
        pen.setMiterLimit(2);
        expect(pen.getMiterLimit()).assertEqual(2);
        expect(pen.getWidth()).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0065
     * @tc.name testStatePaint0007
     * @tc.desc Verify a recolored pen only affects the strokes drawn after the change.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0007 begin');
      await runCase('testStatePaint0007', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(10);
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        const first: ArrayBuffer = await snap(target);
        pen.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        strokePath(target, rectPath(120, 20, 160, 60), pen);
        const second: ArrayBuffer = await snap(target);
        expect(redAt(first, 40, 20)).assertEqual(FG_RED);
        expect(redAt(second, 140, 20)).assertEqual(ALT_RED);
        expect(gapBytes(first, second) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0066
     * @tc.name testStatePaint0008
     * @tc.desc Verify two pens created with different widths stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0008 begin');
      await runCase('testStatePaint0008', async () => {
        const thin: drawing.Pen = penOf(4);
        const fat: drawing.Pen = penOf(16);
        expect(thin.getWidth()).assertEqual(4);
        expect(fat.getWidth()).assertEqual(16);
        expect(thin.getColor().red).assertEqual(fat.getColor().red);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0067
     * @tc.name testStatePaint0009
     * @tc.desc Verify a fully transparent pen paints invisible pixels but keeps the alpha zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0009 begin');
      await runCase('testStatePaint0009', async () => {
        const pen: drawing.Pen = penOf(12);
        pen.setAlpha(0);
        const target: OffscreenTarget = await fresh();
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(pen.getAlpha()).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 40, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0068
     * @tc.name testStatePaint0010
     * @tc.desc Verify three successive widths produce a growing painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0010 begin');
      await runCase('testStatePaint0010', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(2);
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        const afterTwo: number = inkAll(await snap(target));
        pen.setStrokeWidth(8);
        strokePath(target, rectPath(80, 20, 120, 60), pen);
        const afterEight: number = inkAll(await snap(target));
        pen.setStrokeWidth(20);
        strokePath(target, rectPath(140, 20, 180, 60), pen);
        const afterTwenty: number = inkAll(await snap(target));
        expect(afterEight > afterTwo).assertTrue();
        expect(afterTwenty > afterEight).assertTrue();
        expect(pen.getWidth()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0069
     * @tc.name testStatePaint0011
     * @tc.desc Verify three pen colors land in three clearly separated color classes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0011 begin');
      await runCase('testStatePaint0011', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(12);
        strokePath(target, rectPath(10, 10, 60, 60), pen);
        pen.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        strokePath(target, rectPath(70, 10, 120, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(warmPixels(buffer) > 100).assertTrue();
        expect(coolPixels(buffer) > 100).assertTrue();
        expect(inkAll(buffer) > 500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0070
     * @tc.name testStatePaint0012
     * @tc.desc Verify enabling anti alias on a pen keeps the stroke visible with soft edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0012 begin');
      await runCase('testStatePaint0012', async () => {
        const sharp: drawing.Pen = penOf(6);
        const smooth: drawing.Pen = penOf(6);
        smooth.setAntiAlias(true);
        const sharpTarget: OffscreenTarget = await fresh();
        strokePath(sharpTarget, rectPath(20, 20, 60, 60), sharp);
        const smoothTarget: OffscreenTarget = await fresh();
        strokePath(smoothTarget, rectPath(20, 20, 60, 60), smooth);
        const sharpInk: number = inkAll(await snap(sharpTarget));
        expect(sharpInk > 0).assertTrue();
        expect(inkAll(await snap(smoothTarget)) > 0).assertTrue();
        expect(Math.abs(inkAll(await snap(smoothTarget)) - sharpInk) < sharpInk).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0071
     * @tc.name testStatePaint0013
     * @tc.desc Verify clearing the path effect turns a dashed pen back into a solid pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0013 begin');
      await runCase('testStatePaint0013', async () => {
        const pen: drawing.Pen = penOf(6);
        pen.setPathEffect(drawing.PathEffect.createDashPathEffect([8, 8], 0));
        const dashedTarget: OffscreenTarget = await fresh();
        strokePath(dashedTarget, rectPath(20, 20, 60, 60), pen);
        const dashedInk: number = inkAll(await snap(dashedTarget));
        pen.setPathEffect(null);
        const solidTarget: OffscreenTarget = await fresh();
        strokePath(solidTarget, rectPath(20, 20, 60, 60), pen);
        const solidInk: number = inkAll(await snap(solidTarget));
        expect(dashedInk > 0).assertTrue();
        expect(solidInk > dashedInk).assertTrue();
        expect(solidInk < 1600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0072
     * @tc.name testStatePaint0014
     * @tc.desc Verify a mask filter state left on a pen stops applying once it is set to null.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0014 begin');
      await runCase('testStatePaint0014', async () => {
        const pen: drawing.Pen = penOf(8);
        pen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 6));
        const blurred: OffscreenTarget = await fresh();
        strokePath(blurred, rectPath(60, 60, 140, 140), pen);
        const blurredInk: number = inkAll(await snap(blurred));
        pen.setMaskFilter(null);
        const sharp: OffscreenTarget = await fresh();
        strokePath(sharp, rectPath(60, 60, 140, 140), pen);
        const sharpInk: number = inkAll(await snap(sharp));
        expect(blurredInk > sharpInk).assertTrue();
        expect(sharpInk > 0).assertTrue();
        expect(sharpInk).assertEqual(2560);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0073
     * @tc.name testStatePaint0015
     * @tc.desc Verify a pen keeps its width and color while only the alpha is changed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0015 begin');
      await runCase('testStatePaint0015', async () => {
        const pen: drawing.Pen = penOf(7);
        pen.setAlpha(64);
        expect(pen.getWidth()).assertEqual(7);
        expect(pen.getColor().red).assertEqual(FG_RED);
        expect(pen.getAlpha()).assertEqual(64);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0074
     * @tc.name testStatePaint0016
     * @tc.desc Verify setting a new pen color replaces the alpha carried by the old color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0016 begin');
      await runCase('testStatePaint0016', async () => {
        const pen: drawing.Pen = penOf(7);
        pen.setColor(rgba(90, 10, 20, 30));
        expect(pen.getAlpha()).assertEqual(90);
        pen.setColor(rgba(255, 10, 20, 30));
        expect(pen.getAlpha()).assertEqual(255);
        expect(pen.getColor().blue).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0075
     * @tc.name testStatePaint0017
     * @tc.desc Verify every brush color channel written by setColor can be read back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0017 begin');
      await runCase('testStatePaint0017', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(180, 12, 34, 56));
        expect(brush.getColor().alpha).assertEqual(180);
        expect(brush.getColor().red).assertEqual(12);
        expect(brush.getColor().green).assertEqual(34);
        expect(brush.getColor().blue).assertEqual(56);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0076
     * @tc.name testStatePaint0018
     * @tc.desc Verify a halftransparent brush paints a halftransparent rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0018 begin');
      await runCase('testStatePaint0018', async () => {
        const brush: drawing.Brush = fgBrush();
        brush.setAlpha(128);
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(brush.getAlpha()).assertEqual(128);
        expect(alphaAt(buffer, 40, 40) >= 120 && alphaAt(buffer, 40, 40) <= 136).assertTrue();
        expect(inkAll(buffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0077
     * @tc.name testStatePaint0019
     * @tc.desc Verify the packed hex color readback matches the color that was set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0019 begin');
      await runCase('testStatePaint0019', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0x11, 0x22, 0x33));
        expect(brush.getHexColor()).assertEqual(0xFF112233);
        brush.setColor(rgba(0x80, 0x44, 0x55, 0x66));
        expect(brush.getHexColor()).assertEqual(0x80445566);
        expect(brush.getAlpha()).assertEqual(0x80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0078
     * @tc.name testStatePaint0020
     * @tc.desc Verify a brush with zero alpha leaves the bitmap completely empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0020 begin');
      await runCase('testStatePaint0020', async () => {
        const brush: drawing.Brush = fgBrush();
        brush.setAlpha(0);
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 40, 40)).assertEqual(0);
        expect(firstInkCol(buffer)).assertEqual(-1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0079
     * @tc.name testStatePaint0021
     * @tc.desc Verify a quarter alpha brush produces a faint but complete rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0021 begin');
      await runCase('testStatePaint0021', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        brush.setAlpha(64);
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(alphaAt(buffer, 40, 40) >= 56 && alphaAt(buffer, 40, 40) <= 72).assertTrue();
        expect(redAt(buffer, 40, 40)).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0080
     * @tc.name testStatePaint0022
     * @tc.desc Verify setColor followed by setAlpha keeps the later alpha value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0022 begin');
      await runCase('testStatePaint0022', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 10, 20, 30));
        brush.setAlpha(90);
        expect(brush.getAlpha()).assertEqual(90);
        brush.setAlpha(255);
        expect(brush.getAlpha()).assertEqual(255);
        expect(brush.getColor().red).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0081
     * @tc.name testStatePaint0023
     * @tc.desc Verify a multiply blended brush darkens the rectangle painted below it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0023 begin');
      await runCase('testStatePaint0023', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        fillPath(target, shape, fgBrush());
        const base: ArrayBuffer = await snap(target);
        const overlay: drawing.Brush = altBrush();
        overlay.setBlendMode(drawing.BlendMode.MULTIPLY);
        fillPath(target, shape, overlay);
        const blended: ArrayBuffer = await snap(target);
        expect(redAt(blended, 40, 40) < redAt(base, 40, 40)).assertTrue();
        expect(redAt(blended, 40, 40) > 0).assertTrue();
        expect(alphaAt(blended, 40, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0082
     * @tc.name testStatePaint0024
     * @tc.desc Verify a source blended brush replaces the rectangle below it completely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0024 begin');
      await runCase('testStatePaint0024', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        fillPath(target, shape, fgBrush());
        const overlay: drawing.Brush = altBrush();
        overlay.setBlendMode(drawing.BlendMode.SRC);
        fillPath(target, shape, overlay);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 40, 40)).assertEqual(ALT_RED);
        expect(chan(buffer, 40, 40, 1)).assertEqual(ALT_GREEN);
        expect(inkAll(buffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0083
     * @tc.name testStatePaint0025
     * @tc.desc Verify a source in color filter replaces the painted color with the filter color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0025 begin');
      await runCase('testStatePaint0025', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        brush.setColorFilter(drawing.ColorFilter.createBlendModeColorFilter(
          rgba(255, 255, 0, 0), drawing.BlendMode.SRC_IN));
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(redAt(buffer, 40, 40)).assertEqual(255);
        expect(chan(buffer, 40, 40, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0084
     * @tc.name testStatePaint0026
     * @tc.desc Verify a blurred brush spreads ink beyond the rectangle edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0026 begin');
      await runCase('testStatePaint0026', async () => {
        const sharpTarget: OffscreenTarget = await fresh();
        fillPath(sharpTarget, rectPath(60, 60, 140, 140), fgBrush());
        const sharpInk: number = inkAll(await snap(sharpTarget));
        const blurredTarget: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        brush.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 6));
        fillPath(blurredTarget, rectPath(60, 60, 140, 140), brush);
        const blurredInk: number = inkAll(await snap(blurredTarget));
        expect(sharpInk).assertEqual(6400);
        expect(blurredInk > sharpInk).assertTrue();
        expect(blurredInk < 40000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0085
     * @tc.name testStatePaint0027
     * @tc.desc Verify two brushes keep their own alpha values without interfering.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0027 begin');
      await runCase('testStatePaint0027', async () => {
        const first: drawing.Brush = fgBrush();
        const second: drawing.Brush = altBrush();
        first.setAlpha(40);
        expect(first.getAlpha()).assertEqual(40);
        expect(second.getAlpha()).assertEqual(255);
        expect(second.getColor().red).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0086
     * @tc.name testStatePaint0028
     * @tc.desc Verify a reset brush repaints correctly once a new color is assigned.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0028 begin');
      await runCase('testStatePaint0028', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(20, 200, 30, 40));
        brush.reset();
        brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        brush.setAntiAlias(false);
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 40, 40)).assertEqual(ALT_RED);
        expect(brush.getAlpha()).assertEqual(255);
        expect(inkAll(buffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0087
     * @tc.name testStatePaint0029
     * @tc.desc Verify an existing brush still works after the canvas is cleared.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0029 begin');
      await runCase('testStatePaint0029', async () => {
        const brush: drawing.Brush = fgBrush();
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        target.canvas.clear(rgba(0, 0, 0, 0));
        fillPath(target, rectPath(120, 20, 160, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(firstInkCol(buffer)).assertEqual(120);
        expect(alphaAt(buffer, 40, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0088
     * @tc.name testStatePaint0030
     * @tc.desc Verify three descending alpha values produce three descending pixel alphas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0030 begin');
      await runCase('testStatePaint0030', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        fillPath(target, rectPath(10, 10, 50, 50), brush);
        brush.setAlpha(128);
        fillPath(target, rectPath(70, 10, 110, 50), brush);
        brush.setAlpha(64);
        fillPath(target, rectPath(130, 10, 170, 50), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 20, 20)).assertEqual(255);
        expect(alphaAt(buffer, 80, 20) >= 120 && alphaAt(buffer, 80, 20) <= 136).assertTrue();
        expect(alphaAt(buffer, 140, 20) >= 56 && alphaAt(buffer, 140, 20) <= 72).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0089
     * @tc.name testStatePaint0031
     * @tc.desc Verify three brush colors fill three rectangles without bleeding into each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0031 begin');
      await runCase('testStatePaint0031', async () => {
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(10, 10, 60, 60), fgBrush());
        fillPath(target, rectPath(70, 10, 120, 60), altBrush());
        fillPath(target, rectPath(130, 10, 180, 60), brushOf(255, 255, 255, 255));
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(7500);
        expect(warmPixels(buffer) > 1000).assertTrue();
        expect(coolPixels(buffer) > 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0090
     * @tc.name testStatePaint0032
     * @tc.desc Verify a brush used as a layer brush keeps the layer alpha of two hundred.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0032 begin');
      await runCase('testStatePaint0032', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, brushOf(200, 255, 255, 255));
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(alphaAt(buffer, 40, 40) >= 195 && alphaAt(buffer, 40, 40) <= 205).assertTrue();
        expect(redAt(buffer, 40, 40)).assertEqual(188);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0091
     * @tc.name testStatePaint0033
     * @tc.desc Verify a pen stroke and a later brush fill coexist on one canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0033 begin');
      await runCase('testStatePaint0033', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.attachPen(penOf(4));
        target.canvas.drawPath(rectPath(20, 40, 60, 80));
        target.canvas.detachPen();
        target.canvas.attachBrush(altBrush());
        target.canvas.drawPath(rectPath(80, 40, 120, 80));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer) > 1600).assertTrue();
        expect(redAt(buffer, 100, 60)).assertEqual(ALT_RED);
        expect(redAt(buffer, 40, 40)).assertEqual(FG_RED);
        expect(warmPixels(buffer)).assertEqual(640);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0092
     * @tc.name testStatePaint0034
     * @tc.desc Verify a pen color changed between two strokes colors only the later one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0034 begin');
      await runCase('testStatePaint0034', async () => {
        const pen: drawing.Pen = penOf(8);
        const target: OffscreenTarget = await fresh();
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        pen.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        strokePath(target, rectPath(120, 20, 160, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 40, 20)).assertEqual(FG_RED);
        expect(redAt(buffer, 140, 20)).assertEqual(ALT_RED);
        expect(inkRect(buffer, 100, 0, 180, 80) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0093
     * @tc.name testStatePaint0035
     * @tc.desc Verify the pen attached last is the one that paints the path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0035 begin');
      await runCase('testStatePaint0035', async () => {
        const first: drawing.Pen = penOf(20);
        const second: drawing.Pen = new drawing.Pen();
        second.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        second.setStrokeWidth(20);
        second.setAntiAlias(false);
        const target: OffscreenTarget = await fresh();
        target.canvas.attachPen(first);
        target.canvas.attachPen(second);
        target.canvas.drawPath(rectPath(40, 40, 120, 120));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 80, 40)).assertEqual(ALT_RED);
        expect(coolPixels(buffer) > 0).assertTrue();
        expect(warmPixels(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0094
     * @tc.name testStatePaint0036
     * @tc.desc Verify drawing after a detach leaves the bitmap untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0036 begin');
      await runCase('testStatePaint0036', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.attachBrush(fgBrush());
        target.canvas.detachBrush();
        target.canvas.drawPath(rectPath(20, 20, 60, 60));
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(firstInkCol(buffer)).assertEqual(20);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0095
     * @tc.name testStatePaint0037
     * @tc.desc Verify one brush reused by two attach cycles paints two identical blocks.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0037 begin');
      await runCase('testStatePaint0037', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        fillPath(target, rectPath(10, 10, 50, 50), brush);
        fillPath(target, rectPath(110, 110, 150, 150), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(3200);
        expect(inkRect(buffer, 0, 0, 60, 60)).assertEqual(1600);
        expect(inkRect(buffer, 100, 100, 160, 160)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0096
     * @tc.name testStatePaint0038
     * @tc.desc Verify a brush and a pen attached together both paint the same path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0038 begin');
      await runCase('testStatePaint0038', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.attachBrush(altBrush());
        target.canvas.attachPen(penOf(6));
        target.canvas.drawPath(rectPath(40, 40, 120, 120));
        target.canvas.detachBrush();
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 80, 80)).assertEqual(ALT_RED);
        expect(redAt(buffer, 80, 40)).assertEqual(FG_RED);
        expect(inkAll(buffer) > 6400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0097
     * @tc.name testStatePaint0039
     * @tc.desc Verify a brush alpha lowered between two cycles dims only the second block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0039 begin');
      await runCase('testStatePaint0039', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        brush.setAlpha(128);
        fillPath(target, rectPath(120, 20, 160, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
        expect(alphaAt(buffer, 140, 40) >= 120 && alphaAt(buffer, 140, 40) <= 136).assertTrue();
        expect(inkRect(buffer, 0, 0, 80, 80)).assertEqual(1600);
        expect(redAt(buffer, 140, 40)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0098
     * @tc.name testStatePaint0040
     * @tc.desc Verify a pen widened between two strokes thickens only the second outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0040 begin');
      await runCase('testStatePaint0040', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(2);
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        pen.setStrokeWidth(16);
        strokePath(target, rectPath(120, 20, 160, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(pen.getWidth()).assertEqual(16);
        expect(inkRect(buffer, 100, 0, 180, 100) > inkRect(buffer, 0, 0, 80, 100)).assertTrue();
        expect(redAt(buffer, 140, 20)).assertEqual(FG_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0099
     * @tc.name testStatePaint0041
     * @tc.desc Verify a half transparent brush drawn twice accumulates more alpha than once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0041 begin');
      await runCase('testStatePaint0041', async () => {
        const single: OffscreenTarget = await fresh();
        fillPath(single, rectPath(60, 60, 140, 140), brushOf(128, FG_RED, FG_GREEN, FG_BLUE));
        const singleBuffer: ArrayBuffer = await snap(single);
        const twice: OffscreenTarget = await fresh();
        const brush: drawing.Brush = brushOf(128, FG_RED, FG_GREEN, FG_BLUE);
        fillPath(twice, rectPath(60, 60, 140, 140), brush);
        fillPath(twice, rectPath(60, 60, 140, 140), brush);
        const twiceBuffer: ArrayBuffer = await snap(twice);
        expect(alphaAt(twiceBuffer, 100, 100) > alphaAt(singleBuffer, 100, 100)).assertTrue();
        expect(alphaAt(twiceBuffer, 100, 100) >= 180 && alphaAt(twiceBuffer, 100, 100) <= 200).assertTrue();
        expect(inkAll(twiceBuffer)).assertEqual(6400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0100
     * @tc.name testStatePaint0042
     * @tc.desc Verify repeated fills on one target raise the pixel alpha step by step.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0042 begin');
      await runCase('testStatePaint0042', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = brushOf(128, 255, 255, 255);
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        const afterFirst: number = alphaAt(await snap(target), 40, 40);
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        const afterSecond: number = alphaAt(await snap(target), 40, 40);
        expect(afterFirst >= 120 && afterFirst <= 136).assertTrue();
        expect(afterSecond > afterFirst).assertTrue();
        expect(inkAll(await snap(target))).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0101
     * @tc.name testStatePaint0043
     * @tc.desc Verify a pen alpha lowered between strokes dims only the second outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0043 begin');
      await runCase('testStatePaint0043', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(10);
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        pen.setAlpha(96);
        strokePath(target, rectPath(120, 20, 160, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 40, 20)).assertEqual(255);
        expect(alphaAt(buffer, 140, 20) >= 88 && alphaAt(buffer, 140, 20) <= 104).assertTrue();
        expect(redAt(buffer, 140, 20)).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0102
     * @tc.name testStatePaint0044
     * @tc.desc Verify re-attaching the same pen after a detach reproduces the same stroke weight.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0044 begin');
      await runCase('testStatePaint0044', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(6);
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        strokePath(target, rectPath(120, 20, 160, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        const left: number = inkRect(buffer, 0, 0, 80, 80);
        const right: number = inkRect(buffer, 100, 0, 180, 80);
        expect(left).assertEqual(right);
        expect(left > 0).assertTrue();
        expect(firstInkCol(buffer) >= 15 && firstInkCol(buffer) <= 21).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0103
     * @tc.name testStatePaint0045
     * @tc.desc Verify a pen applied over a filled block covers the border but not the interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0045 begin');
      await runCase('testStatePaint0045', async () => {
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 120, 120), altBrush());
        const pen: drawing.Pen = penOf(8);
        pen.setAlpha(128);
        strokePath(target, rectPath(40, 40, 120, 120), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 80, 80)).assertEqual(ALT_RED);
        expect(alphaAt(buffer, 80, 40)).assertEqual(255);
        expect(redAt(buffer, 80, 40) > ALT_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0104
     * @tc.name testStatePaint0046
     * @tc.desc Verify attaching one brush three times still paints a single opaque block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0046 begin');
      await runCase('testStatePaint0046', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        target.canvas.attachBrush(brush);
        target.canvas.attachBrush(brush);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(rectPath(20, 20, 60, 60));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(redAt(buffer, 40, 40)).assertEqual(FG_RED);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0105
     * @tc.name testStatePaint0047
     * @tc.desc Verify a dashed pen leaves less ink than the same solid pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0047 begin');
      await runCase('testStatePaint0047', async () => {
        const solidTarget: OffscreenTarget = await fresh();
        strokePath(solidTarget, rectPath(20, 20, 180, 180), penOf(8));
        const solidInk: number = inkAll(await snap(solidTarget));
        const dashTarget: OffscreenTarget = await fresh();
        const dashPen: drawing.Pen = penOf(8);
        dashPen.setPathEffect(drawing.PathEffect.createDashPathEffect([10, 10], 0));
        strokePath(dashTarget, rectPath(20, 20, 180, 180), dashPen);
        const dashInk: number = inkAll(await snap(dashTarget));
        expect(dashInk > 0).assertTrue();
        expect(dashInk < solidInk).assertTrue();
        expect(solidInk > 3000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0106
     * @tc.name testStatePaint0048
     * @tc.desc Verify changing the dash phase shifts which pixels of the outline are painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0048 begin');
      await runCase('testStatePaint0048', async () => {
        const baseTarget: OffscreenTarget = await fresh();
        const basePen: drawing.Pen = penOf(8);
        basePen.setPathEffect(drawing.PathEffect.createDashPathEffect([12, 12], 0));
        strokePath(baseTarget, rectPath(20, 20, 180, 180), basePen);
        const baseBuffer: ArrayBuffer = await snap(baseTarget);
        const shiftTarget: OffscreenTarget = await fresh();
        const shiftPen: drawing.Pen = penOf(8);
        shiftPen.setPathEffect(drawing.PathEffect.createDashPathEffect([12, 12], 10));
        strokePath(shiftTarget, rectPath(20, 20, 180, 180), shiftPen);
        const shiftBuffer: ArrayBuffer = await snap(shiftTarget);
        expect(inkAll(baseBuffer) > 0).assertTrue();
        expect(gapBytes(baseBuffer, shiftBuffer) > 0).assertTrue();
        expect(warmPixels(shiftBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0107
     * @tc.name testStatePaint0049
     * @tc.desc Verify a larger blur sigma spreads a filled block over more pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0049 begin');
      await runCase('testStatePaint0049', async () => {
        const sharpTarget: OffscreenTarget = await fresh();
        fillPath(sharpTarget, rectPath(60, 60, 140, 140), fgBrush());
        const sharpInk: number = inkAll(await snap(sharpTarget));
        const mediumTarget: OffscreenTarget = await fresh();
        const medium: drawing.Brush = fgBrush();
        medium.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 4));
        fillPath(mediumTarget, rectPath(60, 60, 140, 140), medium);
        const mediumInk: number = inkAll(await snap(mediumTarget));
        const heavyTarget: OffscreenTarget = await fresh();
        const heavy: drawing.Brush = fgBrush();
        heavy.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 10));
        fillPath(heavyTarget, rectPath(60, 60, 140, 140), heavy);
        const heavyInk: number = inkAll(await snap(heavyTarget));
        expect(sharpInk).assertEqual(6400);
        expect(mediumInk > sharpInk).assertTrue();
        expect(heavyInk > mediumInk).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0108
     * @tc.name testStatePaint0050
     * @tc.desc Verify a blend mode color filter replaces the brush color channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0050 begin');
      await runCase('testStatePaint0050', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        brush.setColorFilter(drawing.ColorFilter.createBlendModeColorFilter(rgba(255, 255, 0, 0),
          drawing.BlendMode.SRC_IN));
        fillPath(target, rectPath(40, 40, 120, 120), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 80, 80)).assertEqual(255);
        expect(chan(buffer, 80, 80, 1)).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(6400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0109
     * @tc.name testStatePaint0051
     * @tc.desc Verify a multiply blend darkens a block painted by another brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0051 begin');
      await runCase('testStatePaint0051', async () => {
        const base: OffscreenTarget = await fresh();
        fillPath(base, rectPath(40, 40, 120, 120), fgBrush());
        const baseBuffer: ArrayBuffer = await snap(base);
        const blended: OffscreenTarget = await fresh();
        fillPath(blended, rectPath(40, 40, 120, 120), fgBrush());
        const veil: drawing.Brush = altBrush();
        veil.setBlendMode(drawing.BlendMode.MULTIPLY);
        fillPath(blended, rectPath(40, 40, 120, 120), veil);
        const blendedBuffer: ArrayBuffer = await snap(blended);
        expect(redAt(blendedBuffer, 80, 80) < redAt(baseBuffer, 80, 80)).assertTrue();
        expect(chan(blendedBuffer, 80, 80, 1) < chan(baseBuffer, 80, 80, 1)).assertTrue();
        expect(inkAll(blendedBuffer)).assertEqual(6400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0110
     * @tc.name testStatePaint0052
     * @tc.desc Verify clearing the mask filter restores the sharp block ink count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0052 begin');
      await runCase('testStatePaint0052', async () => {
        const brush: drawing.Brush = fgBrush();
        const sharpTarget: OffscreenTarget = await fresh();
        fillPath(sharpTarget, rectPath(40, 40, 120, 120), brush);
        const sharpInk: number = inkAll(await snap(sharpTarget));
        brush.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 8));
        const blurredTarget: OffscreenTarget = await fresh();
        fillPath(blurredTarget, rectPath(40, 40, 120, 120), brush);
        const blurredInk: number = inkAll(await snap(blurredTarget));
        brush.setMaskFilter(null);
        const restoredTarget: OffscreenTarget = await fresh();
        fillPath(restoredTarget, rectPath(40, 40, 120, 120), brush);
        const restoredInk: number = inkAll(await snap(restoredTarget));
        expect(sharpInk).assertEqual(6400);
        expect(blurredInk > sharpInk).assertTrue();
        expect(restoredInk).assertEqual(sharpInk);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0111
     * @tc.name testStatePaint0053
     * @tc.desc Verify clearing the path effect turns a dashed pen back into a solid one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0053 begin');
      await runCase('testStatePaint0053', async () => {
        const pen: drawing.Pen = penOf(10);
        pen.setPathEffect(drawing.PathEffect.createDashPathEffect([6, 6], 0));
        const dashTarget: OffscreenTarget = await fresh();
        strokePath(dashTarget, rectPath(20, 20, 180, 180), pen);
        const dashInk: number = inkAll(await snap(dashTarget));
        pen.setPathEffect(null);
        const solidTarget: OffscreenTarget = await fresh();
        strokePath(solidTarget, rectPath(20, 20, 180, 180), pen);
        const solidInk: number = inkAll(await snap(solidTarget));
        expect(dashInk > 0).assertTrue();
        expect(dashInk < solidInk).assertTrue();
        expect(solidInk < 4 * SIZE * SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0112
     * @tc.name testStatePaint0054
     * @tc.desc Verify a darken blend keeps the darker channel of both brushes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0054 begin');
      await runCase('testStatePaint0054', async () => {
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 120, 120), fgBrush());
        const shade: drawing.Brush = altBrush();
        shade.setBlendMode(drawing.BlendMode.DARKEN);
        fillPath(target, rectPath(40, 40, 120, 120), shade);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 80, 80)).assertEqual(ALT_RED);
        expect(chan(buffer, 80, 80, 1)).assertEqual(FG_GREEN);
        expect(chan(buffer, 80, 80, 2)).assertEqual(FG_BLUE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0113
     * @tc.name testStatePaint0055
     * @tc.desc Verify a half transparent multiply layer keeps the page alpha and dims the block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0055 begin');
      await runCase('testStatePaint0055', async () => {
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 120, 120), brushOf(255, 255, 255, 255));
        const shade: drawing.Brush = altBrush();
        shade.setAlpha(128);
        shade.setBlendMode(drawing.BlendMode.MULTIPLY);
        fillPath(target, rectPath(40, 40, 120, 120), shade);
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 80, 80)).assertEqual(255);
        expect(redAt(buffer, 80, 80) > ALT_RED).assertTrue();
        expect(redAt(buffer, 80, 80) < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0114
     * @tc.name testStatePaint0056
     * @tc.desc Verify a blur added on top of a dashed pen spreads ink beyond the dashes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0056 begin');
      await runCase('testStatePaint0056', async () => {
        const hardTarget: OffscreenTarget = await fresh();
        const hard: drawing.Pen = penOf(12);
        hard.setPathEffect(drawing.PathEffect.createDashPathEffect([16, 16], 0));
        strokePath(hardTarget, rectPath(40, 40, 160, 160), hard);
        const hardInk: number = inkAll(await snap(hardTarget));
        const softTarget: OffscreenTarget = await fresh();
        const soft: drawing.Pen = penOf(12);
        soft.setPathEffect(drawing.PathEffect.createDashPathEffect([16, 16], 0));
        soft.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 4));
        strokePath(softTarget, rectPath(40, 40, 160, 160), soft);
        const softInk: number = inkAll(await snap(softTarget));
        expect(hardInk > 0).assertTrue();
        expect(softInk > hardInk).assertTrue();
        expect(softInk < 4 * SIZE * SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0115
     * @tc.name testStatePaint0057
     * @tc.desc Verify a dashed pen keeps its dash pattern across two separate strokes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0057 begin');
      await runCase('testStatePaint0057', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(10);
        pen.setPathEffect(drawing.PathEffect.createDashPathEffect([8, 8], 0));
        strokePath(target, rectPath(20, 20, 80, 80), pen);
        strokePath(target, rectPath(120, 20, 180, 80), pen);
        const buffer: ArrayBuffer = await snap(target);
        const left: number = inkRect(buffer, 0, 0, 100, 100);
        const right: number = inkRect(buffer, 100, 0, 200, 100);
        expect(left).assertEqual(right);
        expect(left > 0).assertTrue();
        expect(warmPixels(buffer)).assertEqual(left + right);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0116
     * @tc.name testStatePaint0058
     * @tc.desc Verify a reset pen drops the dash and blur effects it carried before.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0058 begin');
      await runCase('testStatePaint0058', async () => {
        const pen: drawing.Pen = penOf(10);
        pen.setPathEffect(drawing.PathEffect.createDashPathEffect([10, 10], 0));
        pen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 6));
        pen.reset();
        pen.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
        pen.setStrokeWidth(10);
        pen.setAntiAlias(false);
        const resetTarget: OffscreenTarget = await fresh();
        strokePath(resetTarget, rectPath(40, 40, 160, 160), pen);
        const resetBuffer: ArrayBuffer = await snap(resetTarget);
        const plainTarget: OffscreenTarget = await fresh();
        strokePath(plainTarget, rectPath(40, 40, 160, 160), penOf(10));
        const plainInk: number = inkAll(await snap(plainTarget));
        expect(inkAll(resetBuffer)).assertEqual(plainInk);
        expect(resetBuffer.byteLength > 0).assertTrue();
        expect(redAt(resetBuffer, 100, 40)).assertEqual(FG_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0117
     * @tc.name testStatePaint0059
     * @tc.desc Verify a reset pen accepts a new width and paints with it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0059 begin');
      await runCase('testStatePaint0059', async () => {
        const pen: drawing.Pen = penOf(18);
        pen.reset();
        pen.setStrokeWidth(6);
        pen.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
        pen.setAntiAlias(false);
        const target: OffscreenTarget = await fresh();
        strokePath(target, rectPath(40, 40, 120, 120), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(pen.getWidth()).assertEqual(6);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(redAt(buffer, 100, 40)).assertEqual(FG_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0118
     * @tc.name testStatePaint0060
     * @tc.desc Verify a reset path draws nothing until a new contour is added.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0060 begin');
      await runCase('testStatePaint0060', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        shape.reset();
        const emptyTarget: OffscreenTarget = await fresh();
        fillPath(emptyTarget, shape, fgBrush());
        const emptyInk: number = inkAll(await snap(emptyTarget));
        shape.addRect(ltrb(80, 80, 120, 120));
        const filledTarget: OffscreenTarget = await fresh();
        fillPath(filledTarget, shape, fgBrush());
        const filledBuffer: ArrayBuffer = await snap(filledTarget);
        expect(emptyInk).assertEqual(0);
        expect(inkAll(filledBuffer)).assertEqual(1600);
        expect(firstInkCol(filledBuffer)).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0060 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0119
     * @tc.name testStatePaint0061
     * @tc.desc Verify a reset matrix falls back to the identity values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0061 begin');
      await runCase('testStatePaint0061', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 3, 0, 0);
        expect(matrix.getValue(0)).assertEqual(2);
        matrix.reset();
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matrix.getValue(4)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0061 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0120
     * @tc.name testStatePaint0062
     * @tc.desc Verify a reset brush paints correctly once color and alpha are assigned again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0062 begin');
      await runCase('testStatePaint0062', async () => {
        const brush: drawing.Brush = fgBrush();
        brush.reset();
        brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        brush.setAlpha(77);
        brush.setAntiAlias(false);
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 120, 120), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(brush.getAlpha()).assertEqual(77);
        expect(redAt(buffer, 80, 80)).assertEqual(12);
        expect(alphaAt(buffer, 80, 80) >= 70 && alphaAt(buffer, 80, 80) <= 84).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0062 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0121
     * @tc.name testStatePaint0063
     * @tc.desc Verify a reset pen still stores the join and cap styles set after the reset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0063 begin');
      await runCase('testStatePaint0063', async () => {
        const pen: drawing.Pen = penOf(12);
        pen.reset();
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        pen.setStrokeWidth(12);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(pen.getWidth()).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0063 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0122
     * @tc.name testStatePaint0064
     * @tc.desc Verify a reset path drops the offset applied before the reset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0064 begin');
      await runCase('testStatePaint0064', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        shape.offset(100, 100);
        const movedTarget: OffscreenTarget = await fresh();
        fillPath(movedTarget, shape, fgBrush());
        const movedCol: number = firstInkCol(await snap(movedTarget));
        shape.reset();
        shape.addRect(ltrb(20, 20, 60, 60));
        const resetTarget: OffscreenTarget = await fresh();
        fillPath(resetTarget, shape, fgBrush());
        const resetBuffer: ArrayBuffer = await snap(resetTarget);
        expect(movedCol).assertEqual(20);
        expect(firstInkCol(resetBuffer)).assertEqual(20);
        expect(inkAll(resetBuffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0064 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0123
     * @tc.name testStatePaint0065
     * @tc.desc Verify two brushes on two canvases keep their own colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStatePaint0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0065 begin');
      await runCase('testStatePaint0065', async () => {
        const warm: OffscreenTarget = await fresh();
        fillPath(warm, rectPath(40, 40, 120, 120), fgBrush());
        const cool: OffscreenTarget = await fresh();
        fillPath(cool, rectPath(40, 40, 120, 120), altBrush());
        const warmBuffer: ArrayBuffer = await snap(warm);
        const coolBuffer: ArrayBuffer = await snap(cool);
        expect(gapBytes(warmBuffer, coolBuffer) > 0).assertTrue();
        expect(warmPixels(warmBuffer) > 6000).assertTrue();
        expect(coolPixels(coolBuffer) > 6000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0065 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0124
     * @tc.name testStatePaint0066
     * @tc.desc Verify two pens of different widths stay independent of each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0066 begin');
      await runCase('testStatePaint0066', async () => {
        const thin: OffscreenTarget = await fresh();
        strokePath(thin, rectPath(40, 40, 160, 160), penOf(4));
        const thick: OffscreenTarget = await fresh();
        strokePath(thick, rectPath(40, 40, 160, 160), penOf(16));
        const thinInk: number = inkAll(await snap(thin));
        const thickInk: number = inkAll(await snap(thick));
        expect(thinInk > 0).assertTrue();
        expect(thickInk > thinInk * 2).assertTrue();
        expect(thickInk < 4 * SIZE * SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0066 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0125
     * @tc.name testStatePaint0067
     * @tc.desc Verify one brush paints the same pixels on two separate canvases.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStatePaint0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0067 begin');
      await runCase('testStatePaint0067', async () => {
        const brush: drawing.Brush = altBrush();
        const first: OffscreenTarget = await fresh();
        fillPath(first, rectPath(30, 30, 90, 90), brush);
        const second: OffscreenTarget = await fresh();
        fillPath(second, rectPath(30, 30, 90, 90), brush);
        const firstBuffer: ArrayBuffer = await snap(first);
        const secondBuffer: ArrayBuffer = await snap(second);
        expect(gapBytes(firstBuffer, secondBuffer)).assertEqual(0);
        expect(inkAll(firstBuffer)).assertEqual(3600);
        expect(redAt(secondBuffer, 60, 60)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0067 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0126
     * @tc.name testStatePaint0068
     * @tc.desc Verify repainting a brush later does not change pixels already committed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0068 begin');
      await runCase('testStatePaint0068', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        fillPath(target, rectPath(40, 40, 120, 120), brush);
        const before: ArrayBuffer = await snap(target);
        brush.setAlpha(30);
        brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        const after: ArrayBuffer = await snap(target);
        expect(gapBytes(before, after)).assertEqual(0);
        expect(redAt(after, 80, 80)).assertEqual(FG_RED);
        expect(alphaAt(after, 80, 80)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0068 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0127
     * @tc.name testStatePaint0069
     * @tc.desc Verify repainting a pen later does not change the stroke already committed.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStatePaint0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0069 begin');
      await runCase('testStatePaint0069', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(12);
        strokePath(target, rectPath(40, 40, 160, 160), pen);
        const before: ArrayBuffer = await snap(target);
        pen.setStrokeWidth(40);
        pen.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        pen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 8));
        const after: ArrayBuffer = await snap(target);
        expect(gapBytes(before, after)).assertEqual(0);
        expect(redAt(after, 100, 40)).assertEqual(FG_RED);
        expect(coolPixels(after)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStatePaint0069 end');
    });
  });
}
