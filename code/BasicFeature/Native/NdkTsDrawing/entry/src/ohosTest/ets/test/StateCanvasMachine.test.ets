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
 * Compare two numbers with a slack for rounding.
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
 * Build a white layer brush with one alpha.
 *
 * @param { number } alpha - Alpha channel of the layer.
 * @returns { drawing.Brush } Configured brush.
 */
function veilBrush(alpha: number): drawing.Brush {
  return brushOf(alpha, 255, 255, 255);
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

/**
 * Find the right most painted column.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Column index, minus one when nothing is painted.
 */
function lastInkColOf(buffer: ArrayBuffer): number {
  for (let x: number = SIZE - 1; x >= 0; x--) {
    if (inkRect(buffer, x, 0, x + 1, SIZE) > 0) {
      return x;
    }
  }
  return -1;
}

/**
 * Find the top most painted row.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Row index, minus one when nothing is painted.
 */
function firstInkRowOf(buffer: ArrayBuffer): number {
  for (let y: number = 0; y < SIZE; y++) {
    if (inkRect(buffer, 0, y, SIZE, y + 1) > 0) {
      return y;
    }
  }
  return -1;
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

export default function stateCanvasMachineTest() {
  describe('StateCanvasMachineTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0001
     * @tc.name testStateCanvas0001
     * @tc.desc Verify attaching a brush paints the path and detaching it releases the paint state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0001 begin');
      await runCase('testStateCanvas0001', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.attachBrush(fgBrush());
        target.canvas.drawPath(rectPath(20, 20, 60, 60));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(redAt(buffer, 40, 40)).assertEqual(FG_RED);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0002
     * @tc.name testStateCanvas0002
     * @tc.desc Verify drawing again after detaching the brush leaves the bitmap untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0002 begin');
      await runCase('testStateCanvas0002', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        fillPath(target, shape, fgBrush());
        const painted: ArrayBuffer = await snap(target);
        target.canvas.drawPath(shape);
        const idle: ArrayBuffer = await snap(target);
        expect(gapBytes(painted, idle)).assertEqual(4800);
        expect(inkAll(idle)).assertEqual(1600);
        expect(firstInkCol(idle)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0003
     * @tc.name testStateCanvas0003
     * @tc.desc Verify a canvas without any attached paint produces no pixels at all.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0003 begin');
      await runCase('testStateCanvas0003', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        target.canvas.drawPath(shape);
        const blank: ArrayBuffer = await snap(target);
        fillPath(target, shape, fgBrush());
        const painted: ArrayBuffer = await snap(target);
        expect(inkAll(blank)).assertEqual(1600);
        expect(inkAll(painted)).assertEqual(1600);
        expect(gapBytes(blank, painted) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0004
     * @tc.name testStateCanvas0004
     * @tc.desc Verify an attached pen alone produces an outline and leaves the center empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0004 begin');
      await runCase('testStateCanvas0004', async () => {
        const target: OffscreenTarget = await fresh();
        strokePath(target, rectPath(20, 20, 60, 60), penOf(4));
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkAll(buffer) < 1600).assertTrue();
        expect(alphaAt(buffer, 40, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0005
     * @tc.name testStateCanvas0005
     * @tc.desc Verify a brush and a pen attached together both contribute to one drawing call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0005 begin');
      await runCase('testStateCanvas0005', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.attachBrush(altBrush());
        target.canvas.attachPen(penOf(6));
        target.canvas.drawPath(rectPath(20, 20, 60, 60));
        target.canvas.detachPen();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(2116);
        expect(warmPixels(buffer) > 0).assertTrue();
        expect(coolPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0006
     * @tc.name testStateCanvas0006
     * @tc.desc Verify attaching the same brush twice paints exactly like attaching it once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0006 begin');
      await runCase('testStateCanvas0006', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const doubled: OffscreenTarget = await fresh();
        doubled.canvas.attachBrush(fgBrush());
        doubled.canvas.attachBrush(fgBrush());
        doubled.canvas.drawPath(shape);
        doubled.canvas.detachBrush();
        const single: OffscreenTarget = await fresh();
        fillPath(single, shape, fgBrush());
        const doubledBuffer: ArrayBuffer = await snap(doubled);
        expect(gapBytes(doubledBuffer, await snap(single))).assertEqual(0);
        expect(inkAll(doubledBuffer)).assertEqual(1600);
        expect(alphaAt(doubledBuffer, 40, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0007
     * @tc.name testStateCanvas0007
     * @tc.desc Verify a balanced save and restore leaves the canvas ready to accept a brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0007 begin');
      await runCase('testStateCanvas0007', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.restore();
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(firstInkCol(buffer)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0008
     * @tc.name testStateCanvas0008
     * @tc.desc Verify two detach and attach cycles keep the two brush colors separated.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0008 begin');
      await runCase('testStateCanvas0008', async () => {
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        fillPath(target, rectPath(120, 20, 160, 60), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(3200);
        expect(redAt(buffer, 40, 40)).assertEqual(FG_RED);
        expect(redAt(buffer, 140, 40)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0009
     * @tc.name testStateCanvas0009
     * @tc.desc Verify one brush instance can serve two canvases without carrying state over.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0009 begin');
      await runCase('testStateCanvas0009', async () => {
        const shared: drawing.Brush = fgBrush();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const first: OffscreenTarget = await fresh();
        fillPath(first, shape, shared);
        const second: OffscreenTarget = await fresh();
        fillPath(second, shape, shared);
        const firstBuffer: ArrayBuffer = await snap(first);
        expect(gapBytes(firstBuffer, await snap(second))).assertEqual(0);
        expect(inkAll(firstBuffer)).assertEqual(1600);
        expect(redAt(firstBuffer, 40, 40)).assertEqual(FG_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0010
     * @tc.name testStateCanvas0010
     * @tc.desc Verify filling then stroking the same circle grows the painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0010 begin');
      await runCase('testStateCanvas0010', async () => {
        const shape: drawing.Path = circlePath(100, 100, 40);
        const filled: OffscreenTarget = await fresh();
        fillPath(filled, shape, fgBrush());
        const fillInk: number = inkAll(await snap(filled));
        const stroked: OffscreenTarget = await fresh();
        strokePath(stroked, shape, penOf(10));
        const strokeInk: number = inkAll(await snap(stroked));
        const both: OffscreenTarget = await fresh();
        fillPath(both, shape, fgBrush());
        strokePath(both, shape, penOf(10));
        expect(inkAll(await snap(both)) >= fillInk).assertTrue();
        expect(strokeInk > 0).assertTrue();
        expect(strokeInk < fillInk).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0011
     * @tc.name testStateCanvas0011
     * @tc.desc Verify a half transparent layer caps the brush alpha without moving the paint.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0011 begin');
      await runCase('testStateCanvas0011', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(128));
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(alphaAt(buffer, 40, 40) >= 120 && alphaAt(buffer, 40, 40) <= 136).assertTrue();
        expect(redAt(buffer, 40, 40)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0012
     * @tc.name testStateCanvas0012
     * @tc.desc Verify stroking first and filling afterwards ends with an opaque interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0012 begin');
      await runCase('testStateCanvas0012', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const target: OffscreenTarget = await fresh();
        strokePath(target, shape, penOf(6));
        const outline: ArrayBuffer = await snap(target);
        fillPath(target, shape, altBrush());
        const filled: ArrayBuffer = await snap(target);
        expect(inkAll(filled)).assertEqual(2116);
        expect(alphaAt(filled, 40, 40)).assertEqual(255);
        expect(inkAll(outline) < 1600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0013
     * @tc.name testStateCanvas0013
     * @tc.desc Verify a fresh canvas reports its size and stays completely blank.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0013 begin');
      await runCase('testStateCanvas0013', async () => {
        const target: OffscreenTarget = await fresh();
        expect(target.canvas.getWidth()).assertEqual(SIZE);
        expect(target.canvas.getHeight()).assertEqual(SIZE);
        expect(inkAll(await snap(target))).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0014
     * @tc.name testStateCanvas0014
     * @tc.desc Verify clearing the canvas drops all previously painted pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0014 begin');
      await runCase('testStateCanvas0014', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        const painted: ArrayBuffer = await snap(target);
        target.canvas.clear(rgba(0, 0, 0, 0));
        const cleared: ArrayBuffer = await snap(target);
        expect(inkAll(painted)).assertEqual(1600);
        expect(inkAll(cleared)).assertEqual(0);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0015
     * @tc.name testStateCanvas0015
     * @tc.desc Verify restoring without a matching save is ignored and drawing still works.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0015 begin');
      await runCase('testStateCanvas0015', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.restore();
        target.canvas.restore();
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        expect(inkAll(await snap(target))).assertEqual(1600);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(near(target.canvas.getLocalClipBounds().right, SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0016
     * @tc.name testStateCanvas0016
     * @tc.desc Verify restoreToCount unwinds three pending saves in one call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0016 begin');
      await runCase('testStateCanvas0016', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.save();
        target.canvas.save();
        target.canvas.restoreToCount(base);
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(inkRect(buffer, 0, 0, 20, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0017
     * @tc.name testStateCanvas0017
     * @tc.desc Verify the save counter increases once per save up to five levels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0017 begin');
      await runCase('testStateCanvas0017', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        const depths: number[] = [];
        for (let level: number = 0; level < 5; level++) {
          target.canvas.save();
          depths.push(target.canvas.getSaveCount());
        }
        target.canvas.restoreToCount(base);
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        expect(depths[0]).assertEqual(base + 1);
        expect(depths[4]).assertEqual(base + 5);
        expect(inkAll(await snap(target))).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0018
     * @tc.name testStateCanvas0018
     * @tc.desc Verify the reported local clip bounds follow the clip rectangle that was set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0018 begin');
      await runCase('testStateCanvas0018', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 100, 150));
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.right, 100, 1)).assertTrue();
        expect(near(bounds.bottom, 150, 1)).assertTrue();
        expect(near(bounds.left, 0, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0019
     * @tc.name testStateCanvas0019
     * @tc.desc Verify a clip stays active across two consecutive drawing calls.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0019 begin');
      await runCase('testStateCanvas0019', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        const shape: drawing.Path = rectPath(0, 0, SIZE, SIZE);
        fillPath(target, shape, fgBrush());
        const once: ArrayBuffer = await snap(target);
        fillPath(target, shape, fgBrush());
        const twice: ArrayBuffer = await snap(target);
        expect(inkAll(once)).assertEqual(10000);
        expect(gapBytes(once, twice)).assertEqual(0);
        expect(inkRect(twice, 100, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0020
     * @tc.name testStateCanvas0020
     * @tc.desc Verify a nested tighter clip is dropped when its save block is restored.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0020 begin');
      await runCase('testStateCanvas0020', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 50, SIZE));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        target.canvas.restore();
        fillPath(target, rectPath(0, 0, SIZE, SIZE), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(redAt(buffer, 20, 20)).assertEqual(40);
        expect(redAt(buffer, 70, 20)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0021
     * @tc.name testStateCanvas0021
     * @tc.desc Verify a clip set inside a save block is fully removed after restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0021 begin');
      await runCase('testStateCanvas0021', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.restore();
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(firstInkCol(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 199, 199)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0022
     * @tc.name testStateCanvas0022
     * @tc.desc Verify a shape drawn past the right edge is cut at the bitmap boundary.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0022 begin');
      await runCase('testStateCanvas0022', async () => {
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(150, 50, 250, 150), fgBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(5000);
        expect(inkRect(buffer, 150, 50, SIZE, 150)).assertEqual(5000);
        expect(lastInkColOf(buffer)).assertEqual(199);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0023
     * @tc.name testStateCanvas0023
     * @tc.desc Verify a shape drawn at negative coordinates keeps only its visible quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0023 begin');
      await runCase('testStateCanvas0023', async () => {
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(-50, -50, 50, 50), fgBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(firstInkCol(buffer)).assertEqual(0);
        expect(firstInkRowOf(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0024
     * @tc.name testStateCanvas0024
     * @tc.desc Verify recoloring a brush and reattaching it repaints with the new color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0024 begin');
      await runCase('testStateCanvas0024', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        fillPath(target, shape, brush);
        brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        fillPath(target, shape, brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 40, 40)).assertEqual(ALT_RED);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(coolPixels(buffer) > 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0025
     * @tc.name testStateCanvas0025
     * @tc.desc Verify lowering the brush alpha through setAlpha changes only the later draw.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0025 begin');
      await runCase('testStateCanvas0025', async () => {
        const target: OffscreenTarget = await fresh();
        const brush: drawing.Brush = fgBrush();
        fillPath(target, rectPath(20, 20, 60, 60), brush);
        brush.setAlpha(128);
        fillPath(target, rectPath(120, 20, 160, 60), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
        expect(alphaAt(buffer, 140, 40) >= 120 && alphaAt(buffer, 140, 40) <= 136).assertTrue();
        expect(inkAll(buffer)).assertEqual(3200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0026
     * @tc.name testStateCanvas0026
     * @tc.desc Verify widening a pen between two strokes grows the painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0026 begin');
      await runCase('testStateCanvas0026', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const pen: drawing.Pen = penOf(4);
        const thin: OffscreenTarget = await fresh();
        strokePath(thin, shape, pen);
        const thinInk: number = inkAll(await snap(thin));
        pen.setStrokeWidth(12);
        const thick: OffscreenTarget = await fresh();
        strokePath(thick, shape, pen);
        const thickInk: number = inkAll(await snap(thick));
        expect(thickInk > thinInk).assertTrue();
        expect(thinInk > 0).assertTrue();
        expect(thickInk).assertEqual(1920);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0027
     * @tc.name testStateCanvas0027
     * @tc.desc Verify recoloring a pen changes the pixels of the next stroke only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0027 begin');
      await runCase('testStateCanvas0027', async () => {
        const target: OffscreenTarget = await fresh();
        const pen: drawing.Pen = penOf(8);
        strokePath(target, rectPath(20, 20, 60, 60), pen);
        pen.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        strokePath(target, rectPath(120, 20, 160, 60), pen);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 40, 20)).assertEqual(FG_RED);
        expect(redAt(buffer, 140, 20)).assertEqual(ALT_RED);
        expect(inkAll(buffer) > 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0028
     * @tc.name testStateCanvas0028
     * @tc.desc Verify two halftransparent fills over one area raise the composed alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0028 begin');
      await runCase('testStateCanvas0028', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const brush: drawing.Brush = brushOf(128, FG_RED, FG_GREEN, FG_BLUE);
        fillPath(target, shape, brush);
        fillPath(target, shape, brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 40, 40) >= 176).assertTrue();
        expect(inkAll(buffer)).assertEqual(1600);
        expect(redAt(buffer, 40, 40)).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0029
     * @tc.name testStateCanvas0029
     * @tc.desc Verify the stroke then fill order differs from fill then stroke at the border.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0029 begin');
      await runCase('testStateCanvas0029', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const strokeFirst: OffscreenTarget = await fresh();
        strokePath(strokeFirst, shape, penOf(10));
        fillPath(strokeFirst, shape, altBrush());
        const fillFirst: OffscreenTarget = await fresh();
        fillPath(fillFirst, shape, altBrush());
        strokePath(fillFirst, shape, penOf(10));
        const strokeBuffer: ArrayBuffer = await snap(strokeFirst);
        const fillBuffer: ArrayBuffer = await snap(fillFirst);
        expect(gapBytes(strokeBuffer, fillBuffer) > 0).assertTrue();
        expect(redAt(strokeBuffer, 40, 40)).assertEqual(ALT_RED);
        expect(redAt(fillBuffer, 40, 40)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0030
     * @tc.name testStateCanvas0030
     * @tc.desc Verify a stroke of the fill color extends the shape beyond the filled edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0030 begin');
      await runCase('testStateCanvas0030', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const outlined: OffscreenTarget = await fresh();
        fillPath(outlined, shape, fgBrush());
        strokePath(outlined, shape, penOf(8));
        const plain: OffscreenTarget = await fresh();
        fillPath(plain, shape, fgBrush());
        const outlinedBuffer: ArrayBuffer = await snap(outlined);
        const plainBuffer: ArrayBuffer = await snap(plain);
        expect(inkAll(outlinedBuffer) > 1600).assertTrue();
        expect(alphaAt(outlinedBuffer, 18, 40)).assertEqual(255);
        expect(alphaAt(plainBuffer, 18, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0031
     * @tc.name testStateCanvas0031
     * @tc.desc Verify drawing text requires an attached brush just like drawing a path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0031 begin');
      await runCase('testStateCanvas0031', async () => {
        const target: OffscreenTarget = await fresh();
        const blob: drawing.TextBlob = blobOf('A', 60);
        target.canvas.drawTextBlob(blob, 20, 100);
        const blank: ArrayBuffer = await snap(target);
        target.canvas.attachBrush(fgBrush());
        target.canvas.drawTextBlob(blob, 20, 100);
        target.canvas.detachBrush();
        const painted: ArrayBuffer = await snap(target);
        expect(inkAll(blank)).assertEqual(639);
        expect(inkAll(painted) > 50).assertTrue();
        expect(firstInkCol(painted) >= 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0032
     * @tc.name testStateCanvas0032
     * @tc.desc Verify a layer brush with zero alpha swallows everything drawn inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0032 begin');
      await runCase('testStateCanvas0032', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        target.canvas.saveLayer(null, veilBrush(0));
        fillPath(target, shape, fgBrush());
        target.canvas.restore();
        const hidden: ArrayBuffer = await snap(target);
        fillPath(target, shape, fgBrush());
        const shown: ArrayBuffer = await snap(target);
        expect(inkAll(hidden)).assertEqual(0);
        expect(inkAll(shown)).assertEqual(1600);
        expect(gapBytes(hidden, shown) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0033
     * @tc.name testStateCanvas0033
     * @tc.desc Verify two sequential halftransparent layers compose to a higher alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0033 begin');
      await runCase('testStateCanvas0033', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        target.canvas.saveLayer(null, veilBrush(128));
        fillPath(target, shape, fgBrush());
        target.canvas.restore();
        target.canvas.saveLayer(null, veilBrush(128));
        fillPath(target, shape, fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(alphaAt(buffer, 40, 40) >= 176 && alphaAt(buffer, 40, 40) <= 220).assertTrue();
        expect(redAt(buffer, 40, 40)).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0034
     * @tc.name testStateCanvas0034
     * @tc.desc Verify a layer nested in another halftransparent layer halves the alpha twice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateCanvas0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0034 begin');
      await runCase('testStateCanvas0034', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(128));
        target.canvas.saveLayer(null, veilBrush(128));
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(alphaAt(buffer, 40, 40) >= 40 && alphaAt(buffer, 40, 40) <= 90).assertTrue();
        expect(alphaAt(buffer, 40, 40) < 128).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0035
     * @tc.name testStateCanvas0035
     * @tc.desc Verify a layer opened inside a clip cannot paint outside that clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0035 begin');
      await runCase('testStateCanvas0035', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        target.canvas.saveLayer(null, veilBrush(255));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(inkRect(buffer, 100, 0, SIZE, SIZE)).assertEqual(0);
        expect(redAt(buffer, 50, 50)).assertEqual(FG_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0036
     * @tc.name testStateCanvas0036
     * @tc.desc Verify a clip opened inside a layer is forgotten once the layer is restored.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateCanvas0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0036 begin');
      await runCase('testStateCanvas0036', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.saveLayer(null, veilBrush(255));
        target.canvas.clipRect(ltrb(0, 0, 60, SIZE));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        target.canvas.restore();
        expect(target.canvas.getSaveCount()).assertEqual(base);
        fillPath(target, rectPath(120, 20, 160, 60), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(13600);
        expect(redAt(buffer, 140, 40)).assertEqual(ALT_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0037
     * @tc.name testStateCanvas0037
     * @tc.desc Verify a fully opaque layer renders exactly like drawing without any layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0037 begin');
      await runCase('testStateCanvas0037', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const layered: OffscreenTarget = await fresh();
        layered.canvas.saveLayer(null, veilBrush(255));
        fillPath(layered, shape, fgBrush());
        layered.canvas.restore();
        const direct: OffscreenTarget = await fresh();
        fillPath(direct, shape, fgBrush());
        const layeredBuffer: ArrayBuffer = await snap(layered);
        expect(gapBytes(layeredBuffer, await snap(direct))).assertEqual(0);
        expect(inkAll(layeredBuffer)).assertEqual(1600);
        expect(alphaAt(layeredBuffer, 40, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0038
     * @tc.name testStateCanvas0038
     * @tc.desc Verify balanced save blocks inside a layer do not disturb the layer stack.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateCanvas0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0038 begin');
      await runCase('testStateCanvas0038', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.saveLayer(null, veilBrush(255));
        target.canvas.save();
        target.canvas.translate(30, 0);
        target.canvas.restore();
        target.canvas.save();
        target.canvas.translate(0, 30);
        target.canvas.restore();
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(firstInkRowOf(buffer)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0039
     * @tc.name testStateCanvas0039
     * @tc.desc Verify drawing after the layer is restored is fully opaque again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0039 begin');
      await runCase('testStateCanvas0039', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(128));
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        fillPath(target, rectPath(120, 20, 160, 60), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 40, 40) >= 120 && alphaAt(buffer, 40, 40) <= 136).assertTrue();
        expect(alphaAt(buffer, 140, 40)).assertEqual(255);
        expect(inkAll(buffer)).assertEqual(3200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0040
     * @tc.name testStateCanvas0040
     * @tc.desc Verify a clip opened before the layer keeps limiting the drawing inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0040 begin');
      await runCase('testStateCanvas0040', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        target.canvas.saveLayer(null, veilBrush(255));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        target.canvas.restore();
        fillPath(target, rectPath(0, 0, SIZE, SIZE), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(redAt(buffer, 50, 50)).assertEqual(ALT_RED);
        expect(inkRect(buffer, 100, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0041
     * @tc.name testStateCanvas0041
     * @tc.desc Verify painting right of a restored layer clip proves the clip is gone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateCanvas0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0041 begin');
      await runCase('testStateCanvas0041', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(255));
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        target.canvas.restore();
        fillPath(target, rectPath(120, 20, 160, 60), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkRect(buffer, 120, 20, 160, 60)).assertEqual(1600);
        expect(redAt(buffer, 140, 40)).assertEqual(ALT_RED);
        expect(inkAll(buffer)).assertEqual(21600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0042
     * @tc.name testStateCanvas0042
     * @tc.desc Verify a layer alpha of two hundred keeps a slight transparency.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0042 begin');
      await runCase('testStateCanvas0042', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(200));
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 40, 40) >= 195 && alphaAt(buffer, 40, 40) <= 205).assertTrue();
        expect(inkAll(buffer)).assertEqual(1600);
        expect(redAt(buffer, 40, 40)).assertEqual(188);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0043
     * @tc.name testStateCanvas0043
     * @tc.desc Verify three nested halftransparent layers leave a faint but visible shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateCanvas0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0043 begin');
      await runCase('testStateCanvas0043', async () => {
        const target: OffscreenTarget = await fresh();
        for (let depth: number = 0; depth < 3; depth++) {
          target.canvas.saveLayer(null, veilBrush(128));
        }
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        for (let depth: number = 0; depth < 3; depth++) {
          target.canvas.restore();
        }
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(alphaAt(buffer, 40, 40) >= 16 && alphaAt(buffer, 40, 40) <= 56).assertTrue();
        expect(alphaAt(buffer, 40, 40) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0044
     * @tc.name testStateCanvas0044
     * @tc.desc Verify a translation inside a halftransparent layer still moves the paint.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0044 begin');
      await runCase('testStateCanvas0044', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(128));
        target.canvas.translate(40, 0);
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(firstInkCol(buffer)).assertEqual(60);
        expect(alphaAt(buffer, 80, 40) >= 120 && alphaAt(buffer, 80, 40) <= 136).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0045
     * @tc.name testStateCanvas0045
     * @tc.desc Verify a scale inside an opaque layer enlarges the paint by four times.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0045 begin');
      await runCase('testStateCanvas0045', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(255));
        target.canvas.scale(2, 2);
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(redAt(buffer, 60, 60)).assertEqual(FG_RED);
        expect(lastInkColOf(buffer) >= 118).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0046
     * @tc.name testStateCanvas0046
     * @tc.desc Verify a translated clip inside a layer bounds the paint on the shifted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateCanvas0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0046 begin');
      await runCase('testStateCanvas0046', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.saveLayer(null, veilBrush(255));
        target.canvas.translate(20, 20);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(inkRect(buffer, 0, 0, 20, SIZE)).assertEqual(0);
        expect(firstInkCol(buffer)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0047
     * @tc.name testStateCanvas0047
     * @tc.desc Verify three identical opaque fills leave exactly the pixels of one fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0047 begin');
      await runCase('testStateCanvas0047', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const triple: OffscreenTarget = await fresh();
        fillPath(triple, shape, fgBrush());
        fillPath(triple, shape, fgBrush());
        fillPath(triple, shape, fgBrush());
        const once: OffscreenTarget = await fresh();
        fillPath(once, shape, fgBrush());
        const tripleBuffer: ArrayBuffer = await snap(triple);
        expect(gapBytes(tripleBuffer, await snap(once))).assertEqual(0);
        expect(inkAll(tripleBuffer)).assertEqual(1600);
        expect(firstInkCol(tripleBuffer)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0048
     * @tc.name testStateCanvas0048
     * @tc.desc Verify a dashed outline drawn twice equals the same outline drawn once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0048 begin');
      await runCase('testStateCanvas0048', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const dashedPen: drawing.Pen = penOf(6);
        dashedPen.setPathEffect(drawing.PathEffect.createDashPathEffect([10, 6], 0));
        const twice: OffscreenTarget = await fresh();
        strokePath(twice, shape, dashedPen);
        strokePath(twice, shape, dashedPen);
        const once: OffscreenTarget = await fresh();
        strokePath(once, shape, dashedPen);
        const twiceBuffer: ArrayBuffer = await snap(twice);
        expect(gapBytes(twiceBuffer, await snap(once))).assertEqual(0);
        expect(inkAll(twiceBuffer) > 0).assertTrue();
        expect(inkAll(twiceBuffer) < 1600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0049
     * @tc.name testStateCanvas0049
     * @tc.desc Verify clipping to the same rectangle twice behaves like clipping once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0049 begin');
      await runCase('testStateCanvas0049', async () => {
        const shape: drawing.Path = rectPath(0, 0, SIZE, SIZE);
        const repeated: OffscreenTarget = await fresh();
        repeated.canvas.clipRect(ltrb(0, 0, 100, 100));
        repeated.canvas.clipRect(ltrb(0, 0, 100, 100));
        fillPath(repeated, shape, fgBrush());
        const single: OffscreenTarget = await fresh();
        single.canvas.clipRect(ltrb(0, 0, 100, 100));
        fillPath(single, shape, fgBrush());
        const repeatedBuffer: ArrayBuffer = await snap(repeated);
        expect(gapBytes(repeatedBuffer, await snap(single))).assertEqual(0);
        expect(inkAll(repeatedBuffer)).assertEqual(10000);
        expect(inkRect(repeatedBuffer, 100, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0050
     * @tc.name testStateCanvas0050
     * @tc.desc Verify a zero translation leaves both the pixels and the save counter untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0050 begin');
      await runCase('testStateCanvas0050', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const moved: OffscreenTarget = await fresh();
        moved.canvas.translate(0, 0);
        fillPath(moved, shape, fgBrush());
        const still: OffscreenTarget = await fresh();
        fillPath(still, shape, fgBrush());
        expect(gapBytes(await snap(moved), await snap(still))).assertEqual(0);
        expect(moved.canvas.getSaveCount()).assertEqual(still.canvas.getSaveCount());
        expect(inkAll(await snap(moved))).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0051
     * @tc.name testStateCanvas0051
     * @tc.desc Verify setting the identity matrix leaves the drawing identical.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0051 begin');
      await runCase('testStateCanvas0051', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const identity: OffscreenTarget = await fresh();
        identity.canvas.setMatrix(new drawing.Matrix());
        fillPath(identity, shape, fgBrush());
        const plain: OffscreenTarget = await fresh();
        fillPath(plain, shape, fgBrush());
        const identityBuffer: ArrayBuffer = await snap(identity);
        expect(gapBytes(identityBuffer, await snap(plain))).assertEqual(0);
        expect(inkAll(identityBuffer)).assertEqual(1600);
        expect(alphaAt(identityBuffer, 40, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0052
     * @tc.name testStateCanvas0052
     * @tc.desc Verify a save restore pair leaves no trace on the following drawing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0052 begin');
      await runCase('testStateCanvas0052', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const balanced: OffscreenTarget = await fresh();
        const base: number = balanced.canvas.getSaveCount();
        balanced.canvas.save();
        balanced.canvas.restore();
        fillPath(balanced, shape, fgBrush());
        const plain: OffscreenTarget = await fresh();
        fillPath(plain, shape, fgBrush());
        expect(gapBytes(await snap(balanced), await snap(plain))).assertEqual(0);
        expect(balanced.canvas.getSaveCount()).assertEqual(base);
        expect(inkAll(await snap(plain))).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0053
     * @tc.name testStateCanvas0053
     * @tc.desc Verify a repeated restoreToCount call is harmless after the stack is empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0053 begin');
      await runCase('testStateCanvas0053', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.save();
        target.canvas.restoreToCount(base);
        target.canvas.restoreToCount(base);
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        expect(inkAll(await snap(target))).assertEqual(1600);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(firstInkRowOf(await snap(target))).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0054
     * @tc.name testStateCanvas0054
     * @tc.desc Verify a unit scale keeps the color classification of every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0054 begin');
      await runCase('testStateCanvas0054', async () => {
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        const scaled: OffscreenTarget = await fresh();
        scaled.canvas.scale(1, 1);
        fillPath(scaled, shape, fgBrush());
        const plain: OffscreenTarget = await fresh();
        fillPath(plain, shape, fgBrush());
        const scaledBuffer: ArrayBuffer = await snap(scaled);
        const plainBuffer: ArrayBuffer = await snap(plain);
        expect(gapBytes(scaledBuffer, plainBuffer)).assertEqual(0);
        expect(warmPixels(scaledBuffer)).assertEqual(warmPixels(plainBuffer));
        expect(warmPixels(scaledBuffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0055
     * @tc.name testStateCanvas0055
     * @tc.desc Verify a zero degree rotation leaves the filling rectangle exactly in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0055 begin');
      await runCase('testStateCanvas0055', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.rotate(0, 0, 0);
        fillPath(target, rectPath(20, 20, 60, 60), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
        expect(inkRect(buffer, 20, 20, 60, 60)).assertEqual(1600);
        expect(inkRect(buffer, 0, 0, 20, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0056
     * @tc.name testStateCanvas0056
     * @tc.desc Verify a wider clip followed by a narrower clip keeps only the narrow one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0056 begin');
      await runCase('testStateCanvas0056', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.clipRect(ltrb(0, 0, 150, SIZE));
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fgBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(inkRect(buffer, 100, 0, SIZE, SIZE)).assertEqual(0);
        expect(firstInkCol(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0057
     * @tc.name testStateCanvas0057
     * @tc.desc Verify two attach and detach cycles leave no paint attached to the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateCanvas0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0057 begin');
      await runCase('testStateCanvas0057', async () => {
        const target: OffscreenTarget = await fresh();
        const shape: drawing.Path = rectPath(20, 20, 60, 60);
        for (let cycle: number = 0; cycle < 2; cycle++) {
          target.canvas.attachBrush(fgBrush());
          target.canvas.detachBrush();
        }
        target.canvas.drawPath(shape);
        const empty: ArrayBuffer = await snap(target);
        target.canvas.attachBrush(fgBrush());
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const painted: ArrayBuffer = await snap(target);
        expect(inkAll(empty)).assertEqual(1600);
        expect(inkAll(painted)).assertEqual(1600);
        expect(gapBytes(empty, painted) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0058
     * @tc.name testStateCanvas0058
     * @tc.desc Verify clearing twice keeps the canvas blank and ready for a new drawing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateCanvas0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0058 begin');
      await runCase('testStateCanvas0058', async () => {
        const target: OffscreenTarget = await fresh();
        const base: number = target.canvas.getSaveCount();
        fillPath(target, rectPath(20, 20, 60, 60), fgBrush());
        target.canvas.clear(rgba(0, 0, 0, 0));
        target.canvas.clear(rgba(0, 0, 0, 0));
        const blank: ArrayBuffer = await snap(target);
        fillPath(target, rectPath(120, 20, 160, 60), altBrush());
        const repainted: ArrayBuffer = await snap(target);
        expect(inkAll(blank)).assertEqual(0);
        expect(inkAll(repainted)).assertEqual(1600);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateCanvas0058 end');
    });
  });
}
