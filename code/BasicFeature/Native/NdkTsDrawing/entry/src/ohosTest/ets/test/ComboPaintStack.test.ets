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
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const LINE_Y: number = 100;
const LINE_LEFT: number = 40;
const LINE_RIGHT: number = 160;
const LINE_SPAN: number = LINE_RIGHT - LINE_LEFT + 1;
const WIDE_WIDTH: number = 10;
const NARROW_WIDTH: number = 5;
const LAYER_ALPHA: number = 128;
const CENTER: number = 100;

/**
 * Build a hard edged opaque pen of one stroke width.
 *
 * @param { number } width - Stroke width in pixels.
 * @returns { drawing.Pen } Configured pen.
 */
function penOf(width: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setStrokeWidth(width);
  pen.setColor(rgba(255, 220, 30, 30));
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Build a hard edged pen of one stroke width and one alpha.
 *
 * @param { number } width - Stroke width in pixels.
 * @param { number } alpha - Alpha channel of the stroke color.
 * @returns { drawing.Pen } Configured pen.
 */
function penWith(width: number, alpha: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setStrokeWidth(width);
  pen.setColor(rgba(alpha, 20, 120, 220));
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Build a hard edged brush of one alpha.
 *
 * @param { number } alpha - Alpha channel of the fill color.
 * @returns { drawing.Brush } Configured brush.
 */
function brushWith(alpha: number): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, 30, 160, 90));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Create an empty square bitmap bound to a canvas.
 *
 * @returns { Promise<OffscreenTarget> } Blank offscreen target.
 */
async function blank(): Promise<OffscreenTarget> {
  return await createOffscreenTarget(SIZE, SIZE);
}

/**
 * Copy the pixels of a target into a raw buffer.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function pixelsOf(target: OffscreenTarget): Promise<ArrayBuffer> {
  return await readPixelBuffer(target.pixelMap);
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
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4 + 3];
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
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4];
}

/**
 * Read the blue channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Blue value.
 */
function blueAt(buffer: ArrayBuffer, x: number, y: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4 + 2];
}

/**
 * Count the pixels carrying a partial alpha, which only a soft edge produces.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with a value between 1 and 254.
 */
function partialCount(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > 0 && bytes[index] < 255) {
      count++;
    }
  }
  return count;
}

/**
 * Build a hard edged pen of one stroke width and one explicit color.
 *
 * @param { number } width - Stroke width in pixels.
 * @param { number } red - Red channel.
 * @param { number } blue - Blue channel.
 * @returns { drawing.Pen } Configured pen.
 */
function rgbPen(width: number, red: number, blue: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setStrokeWidth(width);
  pen.setColor(rgba(255, red, 0, blue));
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Count the painted rows of one column, which measures the stroke width of a
 * horizontal line drawn across that column.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Column to scan.
 * @returns { number } Number of painted pixels in the column.
 */
function columnSpan(buffer: ArrayBuffer, x: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let y: number = 0; y < SIZE; y++) {
    if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
      count++;
    }
  }
  return count;
}

/**
 * Count the painted columns of one row, which measures the length of the stroke.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } y - Row to scan.
 * @returns { number } Number of painted pixels in the row.
 */
function rowSpan(buffer: ArrayBuffer, y: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let x: number = 0; x < SIZE; x++) {
    if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
      count++;
    }
  }
  return count;
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
 * Count the bytes that differ between two equally sized buffers.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @returns { number } Number of differing bytes.
 */
function diffCount(first: ArrayBuffer, second: ArrayBuffer): number {
  const left: Uint8Array = new Uint8Array(first);
  const right: Uint8Array = new Uint8Array(second);
  const length: number = Math.min(left.length, right.length);
  let count: number = 0;
  for (let index: number = 0; index < length; index++) {
    if (left[index] !== right[index]) {
      count++;
    }
  }
  return count;
}

/**
 * Check whether a measured pixel count matches an expected count within one pixel
 * of rasterisation slack.
 *
 * @param { number } value - Measured value.
 * @param { number } expected - Expected value.
 * @returns { boolean } Whether both values are close.
 */
function near(value: number, expected: number): boolean {
  return Math.abs(value - expected) <= 1;
}

/**
 * Stroke one horizontal line on a fresh canvas and read the pixels back.
 *
 * @param { drawing.Pen } pen - Pen carrying the stroke settings.
 * @param { number } left - Left end of the line.
 * @param { number } right - Right end of the line.
 * @param { number } y - Vertical position of the line.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeLine(pen: drawing.Pen, left: number, right: number, y: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await blank();
  target.canvas.attachPen(pen);
  target.canvas.drawLine(left, y, right, y);
  target.canvas.detachPen();
  return await pixelsOf(target);
}

export default function comboPaintStackTest() {
  describe('ComboPaintStackTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0001
     * @tc.name testComboPaintStack0001
     * @tc.desc Verify the reference stroke without any canvas transform covers ten rows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testComboPaintStack0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0001 begin');
      await runCase('testComboPaintStack0001', async () => {
        const buffer: ArrayBuffer = await strokeLine(penOf(WIDE_WIDTH), LINE_LEFT, LINE_RIGHT, LINE_Y);
        expect(near(columnSpan(buffer, CENTER), WIDE_WIDTH)).assertTrue();
        expect(near(rowSpan(buffer, LINE_Y), LINE_SPAN)).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, LINE_Y - 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0002
     * @tc.name testComboPaintStack0002
     * @tc.desc Verify a uniform two times scale doubles the stroke width on screen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0002 begin');
      await runCase('testComboPaintStack0002', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.scale(2, 2);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT / 2, LINE_Y / 2, LINE_RIGHT / 2, LINE_Y / 2);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(columnSpan(buffer, CENTER), WIDE_WIDTH * 2)).assertTrue();
        expect(near(rowSpan(buffer, LINE_Y), LINE_SPAN)).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, 80)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0003
     * @tc.name testComboPaintStack0003
     * @tc.desc Verify a half width pen under the same scale reaches the reference width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0003 begin');
      await runCase('testComboPaintStack0003', async () => {
        const large: ArrayBuffer = await strokeLine(penOf(WIDE_WIDTH), LINE_LEFT, LINE_RIGHT, LINE_Y);
        const target: OffscreenTarget = await blank();
        target.canvas.scale(2, 2);
        target.canvas.attachPen(penOf(NARROW_WIDTH));
        target.canvas.drawLine(LINE_LEFT / 2, LINE_Y / 2, LINE_RIGHT / 2, LINE_Y / 2);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(columnSpan(buffer, CENTER)).assertEqual(columnSpan(large, CENTER));
        expect(near(columnSpan(buffer, CENTER), WIDE_WIDTH)).assertTrue();
        expect(near(rowSpan(buffer, LINE_Y), LINE_SPAN)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0004
     * @tc.name testComboPaintStack0004
     * @tc.desc Verify a half scale halves the stroke width on screen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0004 begin');
      await runCase('testComboPaintStack0004', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.scale(0.5, 0.5);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT * 2, LINE_Y * 2, LINE_RIGHT * 2, LINE_Y * 2);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(columnSpan(buffer, CENTER), NARROW_WIDTH)).assertTrue();
        expect(near(rowSpan(buffer, LINE_Y), LINE_SPAN)).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, LINE_Y - 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0005
     * @tc.name testComboPaintStack0005
     * @tc.desc Verify a horizontal only scale with halved coordinates reproduces the plain stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0005 begin');
      await runCase('testComboPaintStack0005', async () => {
        const plain: ArrayBuffer = await strokeLine(penOf(WIDE_WIDTH), LINE_LEFT, LINE_RIGHT, LINE_Y);
        const target: OffscreenTarget = await blank();
        target.canvas.scale(2, 1);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT / 2, LINE_Y, LINE_RIGHT / 2, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(columnSpan(buffer, CENTER)).assertEqual(columnSpan(plain, CENTER));
        expect(rowSpan(buffer, LINE_Y)).assertEqual(rowSpan(plain, LINE_Y));
        expect(diffCount(buffer, plain) < 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0006
     * @tc.name testComboPaintStack0006
     * @tc.desc Verify a vertical only scale doubles the screen stroke width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0006 begin');
      await runCase('testComboPaintStack0006', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.scale(1, 2);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y / 2, LINE_RIGHT, LINE_Y / 2);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(columnSpan(buffer, CENTER), WIDE_WIDTH * 2)).assertTrue();
        expect(alphaAt(buffer, CENTER, LINE_Y - NARROW_WIDTH)).assertEqual(255);
        expect(alphaAt(buffer, CENTER, LINE_Y + 2 * WIDE_WIDTH)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0007
     * @tc.name testComboPaintStack0007
     * @tc.desc Verify the painted area grows with the stroke width on the same canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0007 begin');
      await runCase('testComboPaintStack0007', async () => {
        const thin: ArrayBuffer = await strokeLine(penOf(4), LINE_LEFT, LINE_RIGHT, LINE_Y);
        const thick: ArrayBuffer = await strokeLine(penOf(20), LINE_LEFT, LINE_RIGHT, LINE_Y);
        expect(near(columnSpan(thin, CENTER), 4)).assertTrue();
        expect(near(columnSpan(thick, CENTER), 20)).assertTrue();
        expect(inkBox(thick, 0, 0, SIZE, SIZE) > inkBox(thin, 0, 0, SIZE, SIZE) * 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0008
     * @tc.name testComboPaintStack0008
     * @tc.desc Verify a translation moves the stroke without changing its width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0008 begin');
      await runCase('testComboPaintStack0008', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.translate(30, 0);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(columnSpan(buffer, CENTER), WIDE_WIDTH)).assertTrue();
        expect(alphaAt(buffer, LINE_LEFT + 2, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, LINE_LEFT + 30 + 2, LINE_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0009
     * @tc.name testComboPaintStack0009
     * @tc.desc Verify a quarter turn around the center swaps the measured spans.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0009 begin');
      await runCase('testComboPaintStack0009', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.rotate(90, CENTER, CENTER);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(columnSpan(buffer, CENTER), LINE_SPAN)).assertTrue();
        expect(near(rowSpan(buffer, LINE_Y), WIDE_WIDTH)).assertTrue();
        expect(alphaAt(buffer, LINE_LEFT + 10, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0010
     * @tc.name testComboPaintStack0010
     * @tc.desc Verify the pen keeps its configured width while the canvas scales.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0010 begin');
      await runCase('testComboPaintStack0010', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const target: OffscreenTarget = await blank();
        target.canvas.scale(2, 2);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(LINE_LEFT / 2, LINE_Y / 2, LINE_RIGHT / 2, LINE_Y / 2);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(pen.getWidth()).assertEqual(WIDE_WIDTH);
        expect(near(columnSpan(buffer, CENTER), WIDE_WIDTH * 2)).assertTrue();
        expect(rowSpan(buffer, LINE_Y) > LINE_SPAN - 5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0011
     * @tc.name testComboPaintStack0011
     * @tc.desc Verify a half canvas clip removes the stroke on the clipped side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0011 begin');
      await runCase('testComboPaintStack0011', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, LINE_LEFT + 10, LINE_Y)).assertEqual(255);
        expect(alphaAt(buffer, LINE_RIGHT - 10, LINE_Y)).assertEqual(0);
        expect(near(rowSpan(buffer, LINE_Y), CENTER - LINE_LEFT)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0012
     * @tc.name testComboPaintStack0012
     * @tc.desc Verify a full canvas clip leaves the stroke identical to the plain stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0012 begin');
      await runCase('testComboPaintStack0012', async () => {
        const plain: ArrayBuffer = await strokeLine(penOf(WIDE_WIDTH), LINE_LEFT, LINE_RIGHT, LINE_Y);
        const target: OffscreenTarget = await blank();
        target.canvas.clipRect(ltrb(0, 0, SIZE, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(diffCount(buffer, plain)).assertEqual(0);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(rowSpan(plain, LINE_Y));
        expect(columnSpan(buffer, CENTER)).assertEqual(columnSpan(plain, CENTER));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0013
     * @tc.name testComboPaintStack0013
     * @tc.desc Verify the clip edge cuts a stroke that crosses it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0013 begin');
      await runCase('testComboPaintStack0013', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(60, LINE_Y, 140, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER - 2, LINE_Y)).assertEqual(255);
        expect(alphaAt(buffer, CENTER + 2, LINE_Y)).assertEqual(0);
        expect(inkBox(buffer, CENTER + 1, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0014
     * @tc.name testComboPaintStack0014
     * @tc.desc Verify two nested clips intersect before the stroke is drawn.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0014 begin');
      await runCase('testComboPaintStack0014', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        target.canvas.clipRect(ltrb(50, 0, SIZE, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 60, LINE_Y)).assertEqual(255);
        expect(alphaAt(buffer, 45, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, 120, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0015
     * @tc.name testComboPaintStack0015
     * @tc.desc Verify a circular path clip keeps only the stroke segment inside the disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0015 begin');
      await runCase('testComboPaintStack0015', async () => {
        const target: OffscreenTarget = await blank();
        const disc: drawing.Path = new drawing.Path();
        disc.addCircle(CENTER, CENTER, 40);
        target.canvas.clipPath(disc, drawing.ClipOp.INTERSECT, true);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER, LINE_Y)).assertEqual(255);
        expect(alphaAt(buffer, 50, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, 150, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0016
     * @tc.name testComboPaintStack0016
     * @tc.desc Verify a right side clip keeps the right half of the stroke only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0016 begin');
      await runCase('testComboPaintStack0016', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.clipRect(ltrb(120, 0, SIZE, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 130, LINE_Y)).assertEqual(255);
        expect(alphaAt(buffer, 110, LINE_Y)).assertEqual(0);
        expect(near(rowSpan(buffer, LINE_Y), LINE_RIGHT - 120 + 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0017
     * @tc.name testComboPaintStack0017
     * @tc.desc Verify a restore drops the clip so the next stroke is painted in full.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0017 begin');
      await runCase('testComboPaintStack0017', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.restore();
        target.canvas.drawLine(LINE_LEFT, 140, LINE_RIGHT, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 150, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, 150, 140)).assertEqual(255);
        expect(rowSpan(buffer, 140)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0018
     * @tc.name testComboPaintStack0018
     * @tc.desc Verify a clipped wide stroke fills only the clipped half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0018 begin');
      await runCase('testComboPaintStack0018', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        target.canvas.attachPen(penOf(40));
        target.canvas.drawLine(20, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        const painted: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(painted > 3000).assertTrue();
        expect(painted < 5000).assertTrue();
        expect(inkBox(buffer, CENTER, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0019
     * @tc.name testComboPaintStack0019
     * @tc.desc Verify a clip applied after a translation moves together with the transform.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0019 begin');
      await runCase('testComboPaintStack0019', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.translate(50, 0);
        target.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 60, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, 40, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, 160, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0020
     * @tc.name testComboPaintStack0020
     * @tc.desc Verify a detached pen leaves the clipped canvas empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0020 begin');
      await runCase('testComboPaintStack0020', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.detachPen();
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(120);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(60);
        expect(alphaAt(buffer, CENTER, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0021
     * @tc.name testComboPaintStack0021
     * @tc.desc Verify a half transparent layer attenuates a stroke drawn inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0021 begin');
      await runCase('testComboPaintStack0021', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, brushWith(LAYER_ALPHA));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(alphaAt(buffer, CENTER, LINE_Y), LAYER_ALPHA)).assertTrue();
        expect(alphaAt(buffer, CENTER, LINE_Y) < 200).assertTrue();
        expect(rowSpan(buffer, LINE_Y) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0022
     * @tc.name testComboPaintStack0022
     * @tc.desc Verify the same stroke stays opaque without a layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0022 begin');
      await runCase('testComboPaintStack0022', async () => {
        const plain: ArrayBuffer = await strokeLine(penOf(WIDE_WIDTH), LINE_LEFT, LINE_RIGHT, LINE_Y);
        const second: ArrayBuffer = await strokeLine(penOf(WIDE_WIDTH), LINE_LEFT, LINE_RIGHT, LINE_Y);
        expect(alphaAt(plain, CENTER, LINE_Y)).assertEqual(255);
        expect(alphaAt(second, CENTER, LINE_Y)).assertEqual(255);
        expect(diffCount(plain, second)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0023
     * @tc.name testComboPaintStack0023
     * @tc.desc Verify the stroke after a layer restore is painted again at full alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0023 begin');
      await runCase('testComboPaintStack0023', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, brushWith(LAYER_ALPHA));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.restore();
        target.canvas.drawLine(LINE_LEFT, 140, LINE_RIGHT, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER, LINE_Y) < 200).assertTrue();
        expect(alphaAt(buffer, CENTER, 140)).assertEqual(255);
        expect(rowSpan(buffer, 140)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0024
     * @tc.name testComboPaintStack0024
     * @tc.desc Verify two nested half transparent layers compose into about a quarter alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0024 begin');
      await runCase('testComboPaintStack0024', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, brushWith(LAYER_ALPHA));
        target.canvas.saveLayer(null, brushWith(LAYER_ALPHA));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        const alpha: number = alphaAt(buffer, CENTER, LINE_Y);
        expect(alpha > 55).assertTrue();
        expect(alpha < 72).assertTrue();
        expect(rowSpan(buffer, LINE_Y) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0025
     * @tc.name testComboPaintStack0025
     * @tc.desc Verify a bounded layer drops the stroke outside its bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0025 begin');
      await runCase('testComboPaintStack0025', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(ltrb(0, 0, CENTER, SIZE), null);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 80, LINE_Y)).assertEqual(255);
        expect(alphaAt(buffer, 120, LINE_Y)).assertEqual(0);
        expect(inkBox(buffer, CENTER, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0026
     * @tc.name testComboPaintStack0026
     * @tc.desc Verify a filled rectangle inside a layer survives a stroke drawn after restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0026 begin');
      await runCase('testComboPaintStack0026', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, null);
        target.canvas.attachBrush(brushWith(255));
        target.canvas.drawRect(20, 20, 80, 80);
        target.canvas.detachBrush();
        target.canvas.restore();
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, 150, LINE_RIGHT, 150);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 50, 50)).assertEqual(255);
        expect(alphaAt(buffer, CENTER, 150)).assertEqual(255);
        expect(inkBox(buffer, 0, 0, SIZE, 100)).assertEqual(60 * 60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0027
     * @tc.name testComboPaintStack0027
     * @tc.desc Verify a fully transparent layer discards the stroke inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0027 begin');
      await runCase('testComboPaintStack0027', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, brushWith(0));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(0);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, CENTER, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0028
     * @tc.name testComboPaintStack0028
     * @tc.desc Verify an opaque layer keeps the stroke identical to the plain stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0028 begin');
      await runCase('testComboPaintStack0028', async () => {
        const plain: ArrayBuffer = await strokeLine(penOf(WIDE_WIDTH), LINE_LEFT, LINE_RIGHT, LINE_Y);
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, brushWith(255));
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(rowSpan(plain, LINE_Y));
        expect(columnSpan(buffer, CENTER)).assertEqual(columnSpan(plain, CENTER));
        expect(diffCount(buffer, plain) < 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0029
     * @tc.name testComboPaintStack0029
     * @tc.desc Verify strokes drawn in nested layers keep their own rows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0029 begin');
      await runCase('testComboPaintStack0029', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, null);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, 80, LINE_RIGHT, 80);
        target.canvas.saveLayer(null, null);
        target.canvas.drawLine(LINE_LEFT, 120, LINE_RIGHT, 120);
        target.canvas.detachPen();
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER, 80)).assertEqual(255);
        expect(alphaAt(buffer, CENTER, 120)).assertEqual(255);
        expect(inkBox(buffer, 0, 0, SIZE, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0030
     * @tc.name testComboPaintStack0030
     * @tc.desc Verify restoreToCount closes every layer before the next stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0030 begin');
      await runCase('testComboPaintStack0030', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, brushWith(LAYER_ALPHA));
        target.canvas.saveLayer(null, brushWith(LAYER_ALPHA));
        target.canvas.restoreToCount(1);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER, LINE_Y)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0031
     * @tc.name testComboPaintStack0031
     * @tc.desc Verify a pen attached inside a save block is still bound after the restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0031 begin');
      await runCase('testComboPaintStack0031', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.save();
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.restore();
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER, LINE_Y)).assertEqual(255);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(120);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0032
     * @tc.name testComboPaintStack0032
     * @tc.desc Verify a detach inside a save block survives the restore as well.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0032 begin');
      await runCase('testComboPaintStack0032', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.save();
        target.canvas.detachPen();
        target.canvas.restore();
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(240);
        expect(alphaAt(buffer, CENTER, LINE_Y)).assertEqual(128);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0033
     * @tc.name testComboPaintStack0033
     * @tc.desc Verify the pen attached last defines the color of the next stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0033 begin');
      await runCase('testComboPaintStack0033', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(rgbPen(WIDE_WIDTH, 255, 0));
        target.canvas.drawLine(LINE_LEFT, 60, LINE_RIGHT, 60);
        target.canvas.attachPen(rgbPen(WIDE_WIDTH, 0, 255));
        target.canvas.drawLine(LINE_LEFT, 140, LINE_RIGHT, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, CENTER, 60)).assertEqual(255);
        expect(blueAt(buffer, CENTER, 140)).assertEqual(255);
        expect(redAt(buffer, CENTER, 140)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0034
     * @tc.name testComboPaintStack0034
     * @tc.desc Verify a detach performed inside a save block is not rolled back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0034 begin');
      await runCase('testComboPaintStack0034', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.save();
        target.canvas.detachPen();
        target.canvas.restore();
        const before: number = inkBox(await pixelsOf(target), 0, 0, SIZE, SIZE);
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        const after: ArrayBuffer = await pixelsOf(target);
        expect(before).assertEqual(0);
        expect(inkBox(after, 0, 0, SIZE, SIZE)).assertEqual(240);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0035
     * @tc.name testComboPaintStack0035
     * @tc.desc Verify attaching or detaching a pen never changes the save count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0035 begin');
      await runCase('testComboPaintStack0035', async () => {
        const target: OffscreenTarget = await blank();
        const start: number = target.canvas.getSaveCount();
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        const attached: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.detachPen();
        const detached: number = target.canvas.getSaveCount();
        target.canvas.restore();
        expect(start).assertEqual(attached);
        expect(detached).assertEqual(attached + 1);
        expect(target.canvas.getSaveCount()).assertEqual(start);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0036
     * @tc.name testComboPaintStack0036
     * @tc.desc Verify restoreToCount does not unbind a pen attached inside the popped block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0036 begin');
      await runCase('testComboPaintStack0036', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.save();
        target.canvas.save();
        target.canvas.attachPen(penOf(NARROW_WIDTH));
        target.canvas.restoreToCount(1);
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(columnSpan(buffer, CENTER), NARROW_WIDTH)).assertTrue();
        expect(rowSpan(buffer, LINE_Y)).assertEqual(120);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0037
     * @tc.name testComboPaintStack0037
     * @tc.desc Verify a pen attached inside a layer stays bound after the layer restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0037 begin');
      await runCase('testComboPaintStack0037', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.saveLayer(null, null);
        target.canvas.attachPen(penOf(WIDE_WIDTH));
        target.canvas.restore();
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER, LINE_Y)).assertEqual(255);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(120);
        expect(near(columnSpan(buffer, CENTER), WIDE_WIDTH)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0038
     * @tc.name testComboPaintStack0038
     * @tc.desc Verify two canvases keep their own bound pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0038 begin');
      await runCase('testComboPaintStack0038', async () => {
        const first: OffscreenTarget = await blank();
        const second: OffscreenTarget = await blank();
        first.canvas.attachPen(rgbPen(WIDE_WIDTH, 255, 0));
        second.canvas.attachPen(rgbPen(WIDE_WIDTH, 0, 255));
        first.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        second.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        first.canvas.detachPen();
        second.canvas.detachPen();
        const left: ArrayBuffer = await pixelsOf(first);
        const right: ArrayBuffer = await pixelsOf(second);
        expect(redAt(left, CENTER, LINE_Y)).assertEqual(255);
        expect(blueAt(right, CENTER, LINE_Y)).assertEqual(255);
        expect(redAt(right, CENTER, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0039
     * @tc.name testComboPaintStack0039
     * @tc.desc Verify the last pen attached inside nested blocks wins after a bulk close.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0039 begin');
      await runCase('testComboPaintStack0039', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.save();
        target.canvas.attachPen(rgbPen(WIDE_WIDTH, 255, 0));
        target.canvas.save();
        target.canvas.attachPen(rgbPen(WIDE_WIDTH, 0, 255));
        target.canvas.restoreToCount(1);
        target.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(blueAt(buffer, CENTER, LINE_Y)).assertEqual(255);
        expect(redAt(buffer, CENTER, LINE_Y)).assertEqual(0);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0040
     * @tc.name testComboPaintStack0040
     * @tc.desc Verify a brush attached inside a save block still fills after the restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0040 begin');
      await runCase('testComboPaintStack0040', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.save();
        target.canvas.attachBrush(brushWith(255));
        target.canvas.restore();
        target.canvas.drawRect(20, 20, 80, 80);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(60 * 60);
        expect(alphaAt(buffer, 50, 50)).assertEqual(255);
        expect(alphaAt(buffer, 100, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0041
     * @tc.name testComboPaintStack0041
     * @tc.desc Verify one pen painting two canvases yields the same pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0041 begin');
      await runCase('testComboPaintStack0041', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const first: OffscreenTarget = await blank();
        const second: OffscreenTarget = await blank();
        first.canvas.attachPen(pen);
        first.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        second.canvas.detachPen();
        const left: ArrayBuffer = await pixelsOf(first);
        const right: ArrayBuffer = await pixelsOf(second);
        expect(diffCount(left, right)).assertEqual(0);
        expect(rowSpan(left, LINE_Y)).assertEqual(rowSpan(right, LINE_Y));
        expect(columnSpan(left, CENTER)).assertEqual(columnSpan(right, CENTER));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0042
     * @tc.name testComboPaintStack0042
     * @tc.desc Verify a color change reaches the second canvas through the shared pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0042 begin');
      await runCase('testComboPaintStack0042', async () => {
        const pen: drawing.Pen = rgbPen(WIDE_WIDTH, 255, 0);
        const first: OffscreenTarget = await blank();
        const second: OffscreenTarget = await blank();
        first.canvas.attachPen(pen);
        first.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        first.canvas.detachPen();
        pen.setColor(rgba(255, 0, 0, 255));
        second.canvas.attachPen(pen);
        second.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        second.canvas.detachPen();
        const left: ArrayBuffer = await pixelsOf(first);
        const right: ArrayBuffer = await pixelsOf(second);
        expect(redAt(right, CENTER, LINE_Y)).assertEqual(0);
        expect(blueAt(right, CENTER, LINE_Y)).assertEqual(255);
        expect(diffCount(left, right) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0043
     * @tc.name testComboPaintStack0043
     * @tc.desc Verify a width change reaches the second canvas through the shared pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0043 begin');
      await runCase('testComboPaintStack0043', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const first: ArrayBuffer = await strokeLine(pen, LINE_LEFT, LINE_RIGHT, LINE_Y);
        pen.setStrokeWidth(20);
        const second: ArrayBuffer = await strokeLine(pen, LINE_LEFT, LINE_RIGHT, LINE_Y);
        expect(near(columnSpan(first, CENTER), WIDE_WIDTH)).assertTrue();
        expect(near(columnSpan(second, CENTER), 20)).assertTrue();
        expect(inkBox(second, 0, 0, SIZE, SIZE) > inkBox(first, 0, 0, SIZE, SIZE)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0044
     * @tc.name testComboPaintStack0044
     * @tc.desc Verify one brush filling two canvases yields the same pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPaintStack0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0044 begin');
      await runCase('testComboPaintStack0044', async () => {
        const brush: drawing.Brush = brushWith(255);
        const first: OffscreenTarget = await blank();
        const second: OffscreenTarget = await blank();
        first.canvas.attachBrush(brush);
        first.canvas.drawRect(30, 30, 130, 130);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawRect(30, 30, 130, 130);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await pixelsOf(first);
        const right: ArrayBuffer = await pixelsOf(second);
        expect(diffCount(left, right)).assertEqual(0);
        expect(inkBox(left, 0, 0, SIZE, SIZE)).assertEqual(100 * 100);
        expect(alphaAt(right, 80, 80)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0045
     * @tc.name testComboPaintStack0045
     * @tc.desc Verify a clip on one canvas leaves the other canvas untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0045 begin');
      await runCase('testComboPaintStack0045', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const clipped: OffscreenTarget = await blank();
        const free: OffscreenTarget = await blank();
        clipped.canvas.clipRect(ltrb(0, 0, CENTER, SIZE));
        clipped.canvas.attachPen(pen);
        clipped.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        clipped.canvas.detachPen();
        free.canvas.attachPen(pen);
        free.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        free.canvas.detachPen();
        const left: ArrayBuffer = await pixelsOf(clipped);
        const right: ArrayBuffer = await pixelsOf(free);
        expect(rowSpan(left, LINE_Y) < rowSpan(right, LINE_Y)).assertTrue();
        expect(alphaAt(right, LINE_RIGHT - 10, LINE_Y)).assertEqual(255);
        expect(alphaAt(left, LINE_RIGHT - 10, LINE_Y)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0046
     * @tc.name testComboPaintStack0046
     * @tc.desc Verify a scale on one canvas leaves the other canvas scale untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0046 begin');
      await runCase('testComboPaintStack0046', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const scaled: OffscreenTarget = await blank();
        const plain: OffscreenTarget = await blank();
        scaled.canvas.scale(2, 2);
        scaled.canvas.attachPen(pen);
        scaled.canvas.drawLine(LINE_LEFT / 2, LINE_Y / 2, LINE_RIGHT / 2, LINE_Y / 2);
        scaled.canvas.detachPen();
        plain.canvas.attachPen(pen);
        plain.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        plain.canvas.detachPen();
        const wide: ArrayBuffer = await pixelsOf(scaled);
        const thin: ArrayBuffer = await pixelsOf(plain);
        expect(columnSpan(wide, CENTER) > columnSpan(thin, CENTER)).assertTrue();
        expect(near(columnSpan(thin, CENTER), WIDE_WIDTH)).assertTrue();
        expect(rowSpan(wide, LINE_Y)).assertEqual(rowSpan(thin, LINE_Y));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0047
     * @tc.name testComboPaintStack0047
     * @tc.desc Verify three canvases painted by one pen agree with each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0047 begin');
      await runCase('testComboPaintStack0047', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const buffers: ArrayBuffer[] = [];
        for (let index: number = 0; index < 3; index++) {
          buffers.push(await strokeLine(pen, LINE_LEFT, LINE_RIGHT, LINE_Y));
        }
        expect(diffCount(buffers[0], buffers[1])).assertEqual(0);
        expect(diffCount(buffers[1], buffers[2])).assertEqual(0);
        expect(inkBox(buffers[2], 0, 0, SIZE, SIZE)).assertEqual(inkBox(buffers[0], 0, 0, SIZE, SIZE));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0048
     * @tc.name testComboPaintStack0048
     * @tc.desc Verify one pen attached to two canvases in turn paints both of them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0048 begin');
      await runCase('testComboPaintStack0048', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const first: OffscreenTarget = await blank();
        const second: OffscreenTarget = await blank();
        first.canvas.attachPen(pen);
        second.canvas.attachPen(pen);
        first.canvas.drawLine(LINE_LEFT, 60, LINE_RIGHT, 60);
        second.canvas.drawLine(LINE_LEFT, 140, LINE_RIGHT, 140);
        first.canvas.detachPen();
        second.canvas.detachPen();
        const left: ArrayBuffer = await pixelsOf(first);
        const right: ArrayBuffer = await pixelsOf(second);
        expect(alphaAt(left, CENTER, 60)).assertEqual(255);
        expect(alphaAt(right, CENTER, 140)).assertEqual(255);
        expect(alphaAt(left, CENTER, 140)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0049
     * @tc.name testComboPaintStack0049
     * @tc.desc Verify the save stack of one canvas is independent from the other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0049 begin');
      await runCase('testComboPaintStack0049', async () => {
        const first: OffscreenTarget = await blank();
        const second: OffscreenTarget = await blank();
        first.canvas.save();
        first.canvas.save();
        first.canvas.saveLayer(null, null);
        expect(second.canvas.getSaveCount()).assertEqual(1);
        expect(first.canvas.getSaveCount() > 1).assertTrue();
        first.canvas.restoreToCount(1);
        expect(first.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0050
     * @tc.name testComboPaintStack0050
     * @tc.desc Verify a canvas that already carries content accepts the shared pen without blending loss.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0050 begin');
      await runCase('testComboPaintStack0050', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const busy: OffscreenTarget = await blank();
        busy.canvas.attachBrush(brushWith(255));
        busy.canvas.drawRect(0, 0, 20, 20);
        busy.canvas.detachBrush();
        busy.canvas.attachPen(pen);
        busy.canvas.drawLine(LINE_LEFT, LINE_Y, LINE_RIGHT, LINE_Y);
        busy.canvas.detachPen();
        const empty: ArrayBuffer = await strokeLine(pen, LINE_LEFT, LINE_RIGHT, LINE_Y);
        const buffer: ArrayBuffer = await pixelsOf(busy);
        expect(rowSpan(buffer, LINE_Y)).assertEqual(rowSpan(empty, LINE_Y));
        expect(columnSpan(buffer, CENTER)).assertEqual(columnSpan(empty, CENTER));
        expect(alphaAt(buffer, 10, 10)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0051
     * @tc.name testComboPaintStack0051
     * @tc.desc Verify a pen recolored after attach paints the new color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0051 begin');
      await runCase('testComboPaintStack0051', async () => {
        const pen: drawing.Pen = rgbPen(WIDE_WIDTH, 255, 0);
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(pen);
        target.canvas.drawLine(LINE_LEFT, 60, LINE_RIGHT, 60);
        pen.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawLine(LINE_LEFT, 140, LINE_RIGHT, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, CENTER, 60)).assertEqual(255);
        expect(blueAt(buffer, CENTER, 140)).assertEqual(0);
        expect(redAt(buffer, CENTER, 140)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0052
     * @tc.name testComboPaintStack0052
     * @tc.desc Verify a pen widened after attach paints a thicker stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0052 begin');
      await runCase('testComboPaintStack0052', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(pen);
        target.canvas.drawLine(90, 60, 110, 60);
        pen.setStrokeWidth(20);
        target.canvas.drawLine(90, 140, 110, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 90, 40, 110, 80)).assertEqual(WIDE_WIDTH * 20);
        expect(inkBox(buffer, 90, 120, 110, 160)).assertEqual(200);
        expect(alphaAt(buffer, CENTER, 140)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0053
     * @tc.name testComboPaintStack0053
     * @tc.desc Verify a pen switched to the square cap after attach extends the stroke ends.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0053 begin');
      await runCase('testComboPaintStack0053', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(pen);
        target.canvas.drawLine(LINE_LEFT, 60, LINE_RIGHT, 60);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        target.canvas.drawLine(LINE_LEFT, 140, LINE_RIGHT, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(rowSpan(buffer, 60)).assertEqual(120);
        expect(rowSpan(buffer, 140)).assertEqual(120);
        expect(alphaAt(buffer, LINE_LEFT - 2, 140)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0054
     * @tc.name testComboPaintStack0054
     * @tc.desc Verify a pen dimmed after attach paints a translucent stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0054 begin');
      await runCase('testComboPaintStack0054', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(pen);
        target.canvas.drawLine(LINE_LEFT, 60, LINE_RIGHT, 60);
        pen.setAlpha(100);
        target.canvas.drawLine(LINE_LEFT, 140, LINE_RIGHT, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, CENTER, 60)).assertEqual(255);
        expect(alphaAt(buffer, CENTER, 140)).assertEqual(255);
        expect(rowSpan(buffer, 140)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0055
     * @tc.name testComboPaintStack0055
     * @tc.desc Verify anti aliasing enabled after attach softens a diagonal stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0055 begin');
      await runCase('testComboPaintStack0055', async () => {
        const pen: drawing.Pen = penOf(WIDE_WIDTH);
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(pen);
        target.canvas.drawLine(40, 40, 80, 80);
        pen.setAntiAlias(true);
        target.canvas.drawLine(120, 40, 160, 80);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(partialCount(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
        expect(alphaAt(buffer, 140, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0056
     * @tc.name testComboPaintStack0056
     * @tc.desc Verify a brush recolored after attach fills with the new color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0056 begin');
      await runCase('testComboPaintStack0056', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 220, 30, 30));
        brush.setAntiAlias(false);
        const target: OffscreenTarget = await blank();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(20, 20, 80, 80);
        brush.setColor(rgba(255, 20, 120, 220));
        target.canvas.drawRect(120, 120, 180, 180);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 50, 50)).assertEqual(220);
        expect(blueAt(buffer, 150, 150)).assertEqual(30);
        expect(alphaAt(buffer, 150, 150)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0057
     * @tc.name testComboPaintStack0057
     * @tc.desc Verify a brush dimmed after attach fills at the new alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0057 begin');
      await runCase('testComboPaintStack0057', async () => {
        const brush: drawing.Brush = brushWith(255);
        const target: OffscreenTarget = await blank();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(20, 20, 80, 80);
        brush.setAlpha(90);
        target.canvas.drawRect(120, 120, 180, 180);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 50, 50)).assertEqual(255);
        expect(alphaAt(buffer, 150, 150)).assertEqual(255);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(60 * 60 * 2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0058
     * @tc.name testComboPaintStack0058
     * @tc.desc Verify two rectangles filled by one brush keep their own colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPaintStack0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0058 begin');
      await runCase('testComboPaintStack0058', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setAntiAlias(false);
        const target: OffscreenTarget = await blank();
        target.canvas.attachBrush(brush);
        brush.setColor(rgba(255, 200, 0, 0));
        target.canvas.drawRect(20, 20, 80, 80);
        brush.setColor(rgba(255, 0, 200, 0));
        target.canvas.drawRect(120, 20, 180, 80);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 50, 50)).assertEqual(0);
        expect(blueAt(buffer, 150, 50)).assertEqual(0);
        expect(redAt(buffer, 150, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0059
     * @tc.name testComboPaintStack0059
     * @tc.desc Verify a pen reconfigured while detached paints with the new width after attach.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0059 begin');
      await runCase('testComboPaintStack0059', async () => {
        const pen: drawing.Pen = penOf(NARROW_WIDTH);
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(pen);
        target.canvas.drawLine(90, 60, 110, 60);
        target.canvas.detachPen();
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(90, 140, 110, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 90, 40, 110, 80)).assertEqual(NARROW_WIDTH * 20);
        expect(inkBox(buffer, 90, 120, 110, 160)).assertEqual(20 * 20);
        expect(pen.getWidth()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0060
     * @tc.name testComboPaintStack0060
     * @tc.desc Verify a pen and a brush attached at the same time each drive their own draw call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPaintStack0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0060 begin');
      await runCase('testComboPaintStack0060', async () => {
        const target: OffscreenTarget = await blank();
        target.canvas.attachPen(rgbPen(WIDE_WIDTH, 220, 30));
        target.canvas.attachBrush(brushWith(255));
        target.canvas.drawLine(LINE_LEFT, 60, LINE_RIGHT, 60);
        target.canvas.drawRect(20, 120, 80, 180);
        target.canvas.detachPen();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, CENTER, 60)).assertEqual(220);
        expect(alphaAt(buffer, 50, 150)).assertEqual(255);
        expect(inkBox(buffer, 0, 100, SIZE, SIZE)).assertEqual(4900);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPaintStack0060 end');
    });
  });
}
