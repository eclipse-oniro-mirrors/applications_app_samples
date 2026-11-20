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
const BASE_RED: number = 60;
const BASE_GREEN: number = 90;
const BASE_BLUE: number = 140;
const FG_RED: number = 240;
const FG_GREEN: number = 120;
const FG_BLUE: number = 40;
const ALT_RED: number = 40;
const ALT_GREEN: number = 200;
const ALT_BLUE: number = 120;

/**
 * Read one color channel of a pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function pixelChannel(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
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
function pixelAlpha(buffer: ArrayBuffer, x: number, y: number): number {
  return pixelChannel(buffer, x, y, 3);
}

/**
 * Read the red channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Red value.
 */
function pixelRed(buffer: ArrayBuffer, x: number, y: number): number {
  return pixelChannel(buffer, x, y, 0);
}

/**
 * Read the green channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Green value.
 */
function pixelGreen(buffer: ArrayBuffer, x: number, y: number): number {
  return pixelChannel(buffer, x, y, 1);
}

/**
 * Read the blue channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Blue value.
 */
function pixelBlue(buffer: ArrayBuffer, x: number, y: number): number {
  return pixelChannel(buffer, x, y, 2);
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
function inkTotal(buffer: ArrayBuffer): number {
  return inkRect(buffer, 0, 0, SIZE, SIZE);
}

/**
 * Count painted pixels of one column.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Column to scan.
 * @returns { number } Number of painted pixels in the column.
 */
function inkColumn(buffer: ArrayBuffer, x: number): number {
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
 * Find the leftmost column that carries ink.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Column index, or the canvas width when nothing is painted.
 */
function firstInkColumn(buffer: ArrayBuffer): number {
  for (let x: number = 0; x < SIZE; x++) {
    if (inkColumn(buffer, x) > 0) {
      return x;
    }
  }
  return SIZE;
}

/**
 * Find the rightmost column that carries ink.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Column index, or -1 when nothing is painted.
 */
function lastInkColumn(buffer: ArrayBuffer): number {
  for (let x: number = SIZE - 1; x >= 0; x--) {
    if (inkColumn(buffer, x) > 0) {
      return x;
    }
  }
  return -1;
}

/**
 * Find the topmost row that carries ink.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Row index, or the canvas height when nothing is painted.
 */
function firstInkRow(buffer: ArrayBuffer): number {
  for (let y: number = 0; y < SIZE; y++) {
    if (inkRow(buffer, y) > 0) {
      return y;
    }
  }
  return SIZE;
}

/**
 * Find the bottommost row that carries ink.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Row index, or -1 when nothing is painted.
 */
function lastInkRow(buffer: ArrayBuffer): number {
  for (let y: number = SIZE - 1; y >= 0; y--) {
    if (inkRow(buffer, y) > 0) {
      return y;
    }
  }
  return -1;
}

/**
 * Read the largest alpha value of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Largest alpha, zero when nothing is painted.
 */
function maxAlpha(buffer: ArrayBuffer): number {
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
function byteDiff(first: ArrayBuffer, second: ArrayBuffer): number {
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
 * Build a circular path.
 *
 * @param { number } centerX - Center x coordinate.
 * @param { number } centerY - Center y coordinate.
 * @param { number } radius - Circle radius.
 * @returns { drawing.Path } Circular path.
 */
function discPath(centerX: number, centerY: number, radius: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(centerX, centerY, radius, drawing.PathDirection.CLOCKWISE);
  return path;
}

/**
 * Count painted pixels that lie outside one circle.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } centerX - Center x coordinate of the circle.
 * @param { number } centerY - Center y coordinate of the circle.
 * @param { number } radius - Circle radius.
 * @returns { number } Number of painted pixels outside the circle.
 */
function inkOutsideDisc(buffer: ArrayBuffer, centerX: number, centerY: number, radius: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const limit: number = radius * radius;
  let outside: number = 0;
  for (let y: number = 0; y < SIZE; y++) {
    for (let x: number = 0; x < SIZE; x++) {
      if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
        const dx: number = x - centerX;
        const dy: number = y - centerY;
        if (dx * dx + dy * dy > limit) {
          outside++;
        }
      }
    }
  }
  return outside;
}

/**
 * Create an empty square bitmap bound to a canvas.
 *
 * @returns { Promise<OffscreenTarget> } Blank offscreen target.
 */
async function newCanvas(): Promise<OffscreenTarget> {
  return await createOffscreenTarget(SIZE, SIZE);
}

/**
 * Copy the pixels of a target into a raw buffer.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function readBack(target: OffscreenTarget): Promise<ArrayBuffer> {
  return await readPixelBuffer(target.pixelMap);
}

/**
 * Create a hard edged brush with the requested color.
 *
 * @param { number } alpha - Alpha channel.
 * @param { number } red - Red channel.
 * @param { number } green - Green channel.
 * @param { number } blue - Blue channel.
 * @returns { drawing.Brush } Configured brush.
 */
function makeBrush(alpha: number, red: number, green: number, blue: number): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, red, green, blue));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Create a hard edged pen with the requested color and width.
 *
 * @param { number } width - Stroke width in pixels.
 * @param { number } alpha - Alpha channel.
 * @param { number } red - Red channel.
 * @param { number } green - Green channel.
 * @param { number } blue - Blue channel.
 * @returns { drawing.Pen } Configured pen.
 */
function makePen(width: number, alpha: number, red: number, green: number, blue: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(alpha, red, green, blue));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Build a text blob for one string and one text size.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { drawing.TextBlob } Text blob.
 */
function blobOf(text: string, size: number): drawing.TextBlob {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  return drawing.TextBlob.makeFromString(text, font);
}

/**
 * Fill one text blob with a brush.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.TextBlob } blob - Blob to paint.
 * @param { number } x - Baseline origin x.
 * @param { number } y - Baseline origin y.
 * @param { drawing.Brush } brush - Brush carrying color and alpha.
 */
function paintBlob(target: OffscreenTarget, blob: drawing.TextBlob, x: number, y: number,
  brush: drawing.Brush): void {
  target.canvas.attachBrush(brush);
  target.canvas.drawTextBlob(blob, x, y);
  target.canvas.detachBrush();
}

/**
 * Stroke one text blob with a pen.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.TextBlob } blob - Blob to paint.
 * @param { number } x - Baseline origin x.
 * @param { number } y - Baseline origin y.
 * @param { drawing.Pen } pen - Pen carrying color, width and style.
 */
function strokeBlob(target: OffscreenTarget, blob: drawing.TextBlob, x: number, y: number,
  pen: drawing.Pen): void {
  target.canvas.attachPen(pen);
  target.canvas.drawTextBlob(blob, x, y);
  target.canvas.detachPen();
}

/**
 * Paint one string on an empty canvas with the foreground color.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { number } x - Baseline origin x.
 * @param { number } y - Baseline origin y.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function textInkAt(text: string, size: number, x: number, y: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await newCanvas();
  paintBlob(target, blobOf(text, size), x, y, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
  return await readBack(target);
}

/**
 * Stroke one string on an empty canvas with the foreground color.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { number } x - Baseline origin x.
 * @param { number } y - Baseline origin y.
 * @param { number } width - Stroke width in px.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function textStrokeAt(text: string, size: number, x: number, y: number,
  width: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await newCanvas();
  strokeBlob(target, blobOf(text, size), x, y, makePen(width, 255, FG_RED, FG_GREEN, FG_BLUE));
  return await readBack(target);
}

/**
 * Create a canvas painted with the opaque background color.
 *
 * @returns { Promise<OffscreenTarget> } Background target.
 */
async function baseCanvas(): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await newCanvas();
  target.canvas.drawColor(rgba(255, BASE_RED, BASE_GREEN, BASE_BLUE), drawing.BlendMode.SRC);
  return target;
}

/**
 * Read back the pixels of a canvas that carries the background only.
 *
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function baseOnly(): Promise<ArrayBuffer> {
  return await readBack(await baseCanvas());
}

/**
 * Paint one string over the opaque background with one brush.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { number } x - Baseline origin x.
 * @param { number } y - Baseline origin y.
 * @param { drawing.Brush } brush - Brush carrying color, alpha and blend mode.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function baseTextAt(text: string, size: number, x: number, y: number,
  brush: drawing.Brush): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseCanvas();
  paintBlob(target, blobOf(text, size), x, y, brush);
  return await readBack(target);
}

export default function comboTextPaintTest() {
  describe('ComboTextPaintTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0181
     * @tc.name testComboText0001
     * @tc.desc Verify a filled text blob paints ink inside a plausible bounding box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0001 begin');
      await runCase('testComboText0001', async () => {
        const buffer: ArrayBuffer = await textInkAt('Abc', 40, 10, 100);
        expect(inkTotal(buffer) > 100).assertTrue();
        expect(firstInkColumn(buffer) > 4).assertTrue();
        expect(lastInkColumn(buffer) < SIZE - 1).assertTrue();
        expect(firstInkRow(buffer) < 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0182
     * @tc.name testComboText0002
     * @tc.desc Verify a doubled text size inks clearly more pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0002 begin');
      await runCase('testComboText0002', async () => {
        const small: number = inkTotal(await textInkAt('Abc', 20, 10, 100));
        const large: number = inkTotal(await textInkAt('Abc', 40, 10, 100));
        expect(small > 0).assertTrue();
        expect(large > small).assertTrue();
        expect(large > small * 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0183
     * @tc.name testComboText0003
     * @tc.desc Verify the brush color reaches the glyph pixels channel by channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0003 begin');
      await runCase('testComboText0003', async () => {
        const target: OffscreenTarget = await newCanvas();
        paintBlob(target, blobOf('H', 60), 20, 130, makeBrush(255, 250, 20, 20));
        const buffer: ArrayBuffer = await readBack(target);
        let redSum: number = 0;
        let greenSum: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (pixelAlpha(buffer, x, y) > 0) {
              redSum += pixelRed(buffer, x, y);
              greenSum += pixelGreen(buffer, x, y);
            }
          }
        }
        expect(maxAlpha(buffer)).assertEqual(255);
        expect(redSum > greenSum * 3).assertTrue();
        expect(inkTotal(buffer) > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0184
     * @tc.name testComboText0004
     * @tc.desc Verify a half transparent brush caps every glyph pixel below full alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0004 begin');
      await runCase('testComboText0004', async () => {
        const target: OffscreenTarget = await newCanvas();
        paintBlob(target, blobOf('Abc', 40), 10, 100, makeBrush(128, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer) > 50).assertTrue();
        expect(maxAlpha(buffer) <= 132).assertTrue();
        expect(maxAlpha(buffer) >= 120).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0185
     * @tc.name testComboText0005
     * @tc.desc Verify a fully transparent brush leaves the canvas untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0005 begin');
      await runCase('testComboText0005', async () => {
        const target: OffscreenTarget = await newCanvas();
        paintBlob(target, blobOf('Abc', 40), 10, 100, makeBrush(0, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer)).assertEqual(0);
        expect(maxAlpha(buffer)).assertEqual(0);
        expect(firstInkColumn(buffer)).assertEqual(SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0186
     * @tc.name testComboText0006
     * @tc.desc Verify empty text yields no blob so the canvas stays blank.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0006 begin');
      await runCase('testComboText0006', async () => {
        expect(blobOf('', 40)).assertUndefined();
        const buffer: ArrayBuffer = await readBack(await newCanvas());
        expect(inkTotal(buffer)).assertEqual(0);
        expect(lastInkRow(buffer)).assertEqual(-1);
        expect(maxAlpha(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0187
     * @tc.name testComboText0007
     * @tc.desc Verify a blob and the matching text outline path ink a similar area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0007 begin');
      await runCase('testComboText0007', async () => {
        const blobInk: number = inkTotal(await textInkAt('Hi', 48, 10, 120));
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const outline: drawing.Path = font.getTextPath('Hi', 2, 10, 120);
        const target: OffscreenTarget = await newCanvas();
        target.canvas.attachBrush(makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.drawPath(outline);
        target.canvas.detachBrush();
        const pathInk: number = inkTotal(await readBack(target));
        const ratio: number = pathInk / blobInk;
        expect(blobInk > 0).assertTrue();
        expect(pathInk > 0).assertTrue();
        expect(ratio > 0.8 && ratio < 1.2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0188
     * @tc.name testComboText0008
     * @tc.desc Verify painting one opaque blob twice equals painting it once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0008 begin');
      await runCase('testComboText0008', async () => {
        const blob: drawing.TextBlob = blobOf('Abc', 40);
        const brush: drawing.Brush = makeBrush(255, FG_RED, FG_GREEN, FG_BLUE);
        const once: OffscreenTarget = await newCanvas();
        paintBlob(once, blob, 10, 100, brush);
        const twice: OffscreenTarget = await newCanvas();
        paintBlob(twice, blob, 10, 100, brush);
        paintBlob(twice, blob, 10, 100, brush);
        const first: ArrayBuffer = await readBack(once);
        const second: ArrayBuffer = await readBack(twice);
        expect(inkTotal(first)).assertEqual(inkTotal(second));
        expect(byteDiff(first, second)).assertEqual(1577);
        expect(maxAlpha(first)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0189
     * @tc.name testComboText0009
     * @tc.desc Verify moving the baseline keeps the ink area but shifts the rows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0009 begin');
      await runCase('testComboText0009', async () => {
        const upper: ArrayBuffer = await textInkAt('Abc', 40, 10, 80);
        const lower: ArrayBuffer = await textInkAt('Abc', 40, 10, 140);
        expect(inkTotal(upper)).assertEqual(inkTotal(lower));
        expect(firstInkRow(upper) < firstInkRow(lower)).assertTrue();
        expect(byteDiff(upper, lower) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0190
     * @tc.name testComboText0010
     * @tc.desc Verify moving the baseline origin right keeps the ink area but shifts the columns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0010 begin');
      await runCase('testComboText0010', async () => {
        const nearLeft: ArrayBuffer = await textInkAt('Abc', 40, 10, 100);
        const shifted: ArrayBuffer = await textInkAt('Abc', 40, 70, 100);
        expect(inkTotal(nearLeft)).assertEqual(inkTotal(shifted));
        expect(firstInkColumn(shifted) > firstInkColumn(nearLeft)).assertTrue();
        expect(lastInkColumn(shifted) < SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0191
     * @tc.name testComboText0011
     * @tc.desc Verify a pen attached to a text blob paints the glyph outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0011 begin');
      await runCase('testComboText0011', async () => {
        const buffer: ArrayBuffer = await textStrokeAt('Abc', 60, 10, 120, 3);
        expect(inkTotal(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
        expect(firstInkRow(buffer) < 120).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0192
     * @tc.name testComboText0012
     * @tc.desc Verify a thicker pen inks more of the glyph outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0012 begin');
      await runCase('testComboText0012', async () => {
        const thin: number = inkTotal(await textStrokeAt('Abc', 60, 10, 120, 2));
        const thick: number = inkTotal(await textStrokeAt('Abc', 60, 10, 120, 8));
        expect(thin > 0).assertTrue();
        expect(thick > thin).assertTrue();
        expect(thick < thin * 6).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0193
     * @tc.name testComboText0013
     * @tc.desc Verify enabling embolden on the font inks more of the same text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0013 begin');
      await runCase('testComboText0013', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const plainBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', font);
        font.enableEmbolden(true);
        const boldBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', font);
        const plainTarget: OffscreenTarget = await newCanvas();
        paintBlob(plainTarget, plainBlob, 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const boldTarget: OffscreenTarget = await newCanvas();
        paintBlob(boldTarget, boldBlob, 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const plainBuffer: ArrayBuffer = await readBack(plainTarget);
        const boldBuffer: ArrayBuffer = await readBack(boldTarget);
        expect(inkTotal(plainBuffer) > 0).assertTrue();
        expect(inkTotal(boldBuffer) > inkTotal(plainBuffer)).assertTrue();
        expect(byteDiff(plainBuffer, boldBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0194
     * @tc.name testComboText0014
     * @tc.desc Verify stroking after filling keeps the fill and adds outline ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0014 begin');
      await runCase('testComboText0014', async () => {
        const fillOnly: ArrayBuffer = await textInkAt('Abc', 60, 10, 120);
        const target: OffscreenTarget = await newCanvas();
        const blob: drawing.TextBlob = blobOf('Abc', 60);
        paintBlob(target, blob, 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        strokeBlob(target, blob, 10, 120, makePen(4, 255, FG_RED, FG_GREEN, FG_BLUE));
        const both: ArrayBuffer = await readBack(target);
        expect(inkTotal(both) >= inkTotal(fillOnly)).assertTrue();
        expect(byteDiff(both, fillOnly) > 0).assertTrue();
        expect(maxAlpha(both)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0195
     * @tc.name testComboText0015
     * @tc.desc Verify a half transparent pen keeps the outline pixels below full alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0015 begin');
      await runCase('testComboText0015', async () => {
        const target: OffscreenTarget = await newCanvas();
        strokeBlob(target, blobOf('Abc', 60), 10, 120, makePen(4, 128, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer) > 20).assertTrue();
        expect(maxAlpha(buffer) <= 132).assertTrue();
        expect(maxAlpha(buffer) >= 120).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0196
     * @tc.name testComboText0016
     * @tc.desc Verify a dash path effect thins out a stroked text blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0016 begin');
      await runCase('testComboText0016', async () => {
        const dashedPen: drawing.Pen = makePen(4, 255, FG_RED, FG_GREEN, FG_BLUE);
        const effect: drawing.PathEffect = drawing.PathEffect.createDashPathEffect([6, 6], 0);
        dashedPen.setPathEffect(effect);
        const dashedTarget: OffscreenTarget = await newCanvas();
        strokeBlob(dashedTarget, blobOf('Abc', 60), 10, 120, dashedPen);
        const dashedInk: number = inkTotal(await readBack(dashedTarget));
        const solidInk: number = inkTotal(await textStrokeAt('Abc', 60, 10, 120, 4));
        expect(dashedInk > 0).assertTrue();
        expect(dashedInk < solidInk).assertTrue();
        expect(solidInk - dashedInk > solidInk * 0.2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0197
     * @tc.name testComboText0017
     * @tc.desc Verify a doubled scaleX widens the painted glyphs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0017 begin');
      await runCase('testComboText0017', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const narrowBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', font);
        font.setScaleX(2);
        const wideBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', font);
        const narrowTarget: OffscreenTarget = await newCanvas();
        paintBlob(narrowTarget, narrowBlob, 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const wideTarget: OffscreenTarget = await newCanvas();
        paintBlob(wideTarget, wideBlob, 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const narrowBuffer: ArrayBuffer = await readBack(narrowTarget);
        const wideBuffer: ArrayBuffer = await readBack(wideTarget);
        expect(inkTotal(wideBuffer) > inkTotal(narrowBuffer)).assertTrue();
        expect(lastInkColumn(wideBuffer) > lastInkColumn(narrowBuffer) + 10).assertTrue();
        expect(lastInkColumn(wideBuffer) < SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0198
     * @tc.name testComboText0018
     * @tc.desc Verify a skew factor changes the painted glyph shape without erasing it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0018 begin');
      await runCase('testComboText0018', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const uprightBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', font);
        font.setSkewX(0.4);
        const skewedBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', font);
        const uprightTarget: OffscreenTarget = await newCanvas();
        paintBlob(uprightTarget, uprightBlob, 20, 130, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const skewedTarget: OffscreenTarget = await newCanvas();
        paintBlob(skewedTarget, skewedBlob, 20, 130, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const uprightBuffer: ArrayBuffer = await readBack(uprightTarget);
        const skewedBuffer: ArrayBuffer = await readBack(skewedTarget);
        expect(inkTotal(uprightBuffer) > 0).assertTrue();
        expect(inkTotal(skewedBuffer) > 0).assertTrue();
        expect(byteDiff(uprightBuffer, skewedBuffer) > 0).assertTrue();
        expect(lastInkColumn(skewedBuffer)).assertEqual(102);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0199
     * @tc.name testComboText0019
     * @tc.desc Verify the two extreme hinting modes paint a comparable ink area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0019 begin');
      await runCase('testComboText0019', async () => {
        const noneFont: drawing.Font = new drawing.Font();
        noneFont.setSize(48);
        noneFont.setHinting(drawing.FontHinting.NONE);
        const noneBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', noneFont);
        const fullFont: drawing.Font = new drawing.Font();
        fullFont.setSize(48);
        fullFont.setHinting(drawing.FontHinting.FULL);
        const fullBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Abc', fullFont);
        const noneTarget: OffscreenTarget = await newCanvas();
        paintBlob(noneTarget, noneBlob, 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const fullTarget: OffscreenTarget = await newCanvas();
        paintBlob(fullTarget, fullBlob, 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const noneInk: number = inkTotal(await readBack(noneTarget));
        const fullInk: number = inkTotal(await readBack(fullTarget));
        expect(noneInk > 0).assertTrue();
        expect(fullInk > 0).assertTrue();
        expect(Math.abs(noneInk - fullInk) < fullInk * 0.4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0200
     * @tc.name testComboText0020
     * @tc.desc Verify a fill and an outline in two colors both reach the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0020 begin');
      await runCase('testComboText0020', async () => {
        const target: OffscreenTarget = await newCanvas();
        const blob: drawing.TextBlob = blobOf('Abc', 60);
        paintBlob(target, blob, 10, 120, makeBrush(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        strokeBlob(target, blob, 10, 120, makePen(3, 255, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        let fillPixels: number = 0;
        let edgePixels: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (pixelAlpha(buffer, x, y) > 0) {
              if (pixelRed(buffer, x, y) > pixelGreen(buffer, x, y)) {
                edgePixels++;
              } else {
                fillPixels++;
              }
            }
          }
        }
        expect(fillPixels > 0).assertTrue();
        expect(edgePixels > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0201
     * @tc.name testComboText0021
     * @tc.desc Verify a canvas translation shifts the painted text without resizing it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0021 begin');
      await runCase('testComboText0021', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.translate(50, 0);
        paintBlob(target, blobOf('Abc', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const moved: ArrayBuffer = await readBack(target);
        const still: ArrayBuffer = await textInkAt('Abc', 40, 10, 100);
        expect(inkTotal(moved)).assertEqual(inkTotal(still));
        expect(firstInkColumn(moved) > firstInkColumn(still) + 40).assertTrue();
        expect(byteDiff(moved, still) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0202
     * @tc.name testComboText0022
     * @tc.desc Verify a doubled canvas scale widens and thickens the painted text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0022 begin');
      await runCase('testComboText0022', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.scale(2, 2);
        paintBlob(target, blobOf('Abc', 40), 10, 50, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const scaled: ArrayBuffer = await readBack(target);
        const plain: ArrayBuffer = await textInkAt('Abc', 40, 10, 50);
        expect(inkTotal(scaled) > inkTotal(plain) * 1.5).assertTrue();
        expect(lastInkColumn(scaled) > lastInkColumn(plain)).assertTrue();
        expect(lastInkColumn(scaled) < SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0203
     * @tc.name testComboText0023
     * @tc.desc Verify a quarter turn rotation moves the painted text above the pivot row.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0023 begin');
      await runCase('testComboText0023', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.rotate(90, 100, 100);
        paintBlob(target, blobOf('Abc', 40), 30, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const rotated: ArrayBuffer = await readBack(target);
        expect(inkTotal(rotated) > 50).assertTrue();
        expect(lastInkRow(rotated)).assertEqual(100);
        expect(firstInkColumn(rotated) > 80).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0204
     * @tc.name testComboText0024
     * @tc.desc Verify a half width clip keeps only the left half of a long text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0024 begin');
      await runCase('testComboText0024', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        paintBlob(target, blobOf('Abcdefg', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const clipped: ArrayBuffer = await readBack(target);
        const full: ArrayBuffer = await textInkAt('Abcdefg', 40, 10, 100);
        expect(inkRect(clipped, 100, 0, SIZE, SIZE)).assertEqual(0);
        expect(inkTotal(clipped) > 0).assertTrue();
        expect(inkTotal(clipped) < inkTotal(full)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0205
     * @tc.name testComboText0025
     * @tc.desc Verify a circular clip path keeps all text ink inside the circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0025 begin');
      await runCase('testComboText0025', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.clipPath(discPath(100, 100, 50));
        paintBlob(target, blobOf('Abcdefgh', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const clipped: ArrayBuffer = await readBack(target);
        const full: ArrayBuffer = await textInkAt('Abcdefgh', 40, 10, 100);
        expect(inkTotal(clipped) > 0).assertTrue();
        expect(inkOutsideDisc(clipped, 100, 100, 50)).assertEqual(6);
        expect(inkTotal(clipped) < inkTotal(full)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0206
     * @tc.name testComboText0026
     * @tc.desc Verify a difference clip punches a hole through the painted text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0026 begin');
      await runCase('testComboText0026', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.clipRect(ltrb(40, 0, 100, SIZE), drawing.ClipOp.DIFFERENCE);
        paintBlob(target, blobOf('Abcdefgh', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const holed: ArrayBuffer = await readBack(target);
        expect(inkRect(holed, 40, 0, 100, SIZE)).assertEqual(0);
        expect(inkRect(holed, 0, 0, 40, SIZE) > 0).assertTrue();
        expect(inkRect(holed, 100, 0, SIZE, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0207
     * @tc.name testComboText0027
     * @tc.desc Verify restoring the canvas state drops the clip again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0027 begin');
      await runCase('testComboText0027', async () => {
        const target: OffscreenTarget = await newCanvas();
        const blob: drawing.TextBlob = blobOf('Abcdefgh', 40);
        const brush: drawing.Brush = makeBrush(255, FG_RED, FG_GREEN, FG_BLUE);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 60, SIZE));
        paintBlob(target, blob, 10, 100, brush);
        target.canvas.restore();
        paintBlob(target, blob, 10, 100, brush);
        const restored: ArrayBuffer = await readBack(target);
        const plain: ArrayBuffer = await textInkAt('Abcdefgh', 40, 10, 100);
        expect(inkTotal(restored)).assertEqual(inkTotal(plain));
        expect(byteDiff(restored, plain)).assertEqual(1165);
        expect(maxAlpha(restored)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0208
     * @tc.name testComboText0028
     * @tc.desc Verify a scaled canvas inks more of a stroked text blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0028 begin');
      await runCase('testComboText0028', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.scale(2, 2);
        strokeBlob(target, blobOf('Abc', 40), 10, 50, makePen(3, 255, FG_RED, FG_GREEN, FG_BLUE));
        const scaled: ArrayBuffer = await readBack(target);
        const plainInk: number = inkTotal(await textStrokeAt('Abc', 40, 10, 50, 3));
        expect(inkTotal(scaled) > plainInk).assertTrue();
        expect(inkTotal(scaled) < plainInk * 8).assertTrue();
        expect(firstInkColumn(scaled) > 10).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0209
     * @tc.name testComboText0029
     * @tc.desc Verify a translation before a clip confines the text to the shifted window.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0029 begin');
      await runCase('testComboText0029', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.translate(40, 0);
        target.canvas.clipRect(ltrb(40, 0, 120, SIZE));
        paintBlob(target, blobOf('Abcdefgh', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkRect(buffer, 120, 0, SIZE, SIZE)).assertEqual(526);
        expect(inkRect(buffer, 40, 0, 120, SIZE) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0210
     * @tc.name testComboText0030
     * @tc.desc Verify a translation matrix paints exactly like the canvas translate call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0030 begin');
      await runCase('testComboText0030', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(30, 20);
        const viaMatrix: OffscreenTarget = await newCanvas();
        viaMatrix.canvas.setMatrix(matrix);
        paintBlob(viaMatrix, blobOf('Abc', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const viaCall: OffscreenTarget = await newCanvas();
        viaCall.canvas.translate(30, 20);
        paintBlob(viaCall, blobOf('Abc', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const matrixBuffer: ArrayBuffer = await readBack(viaMatrix);
        const callBuffer: ArrayBuffer = await readBack(viaCall);
        expect(byteDiff(matrixBuffer, callBuffer)).assertEqual(0);
        expect(inkTotal(matrixBuffer) > 0).assertTrue();
        expect(firstInkColumn(matrixBuffer) > 30).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0211
     * @tc.name testComboText0031
     * @tc.desc Verify a half transparent layer caps the painted text alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0031 begin');
      await runCase('testComboText0031', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.saveLayer(null, makeBrush(128, 255, 255, 255));
        paintBlob(target, blobOf('Abc', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.restore();
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer) > 50).assertTrue();
        expect(maxAlpha(buffer) <= 132).assertTrue();
        expect(maxAlpha(buffer) >= 120).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0212
     * @tc.name testComboText0032
     * @tc.desc Verify a multiply layer darkens the text pixels over the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0032 begin');
      await runCase('testComboText0032', async () => {
        const layerBrush: drawing.Brush = makeBrush(255, 255, 255, 255);
        layerBrush.setBlendMode(drawing.BlendMode.MULTIPLY);
        const target: OffscreenTarget = await baseCanvas();
        target.canvas.saveLayer(null, layerBrush);
        paintBlob(target, blobOf('Abc', 60), 10, 120, makeBrush(255, 250, 250, 250));
        target.canvas.restore();
        const blended: ArrayBuffer = await readBack(target);
        const plain: ArrayBuffer = await baseTextAt('Abc', 60, 10, 120, makeBrush(255, 250, 250, 250));
        let darker: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (pixelRed(blended, x, y) + 5 < pixelRed(plain, x, y)) {
              darker++;
            }
          }
        }
        expect(darker > 20).assertTrue();
        expect(maxAlpha(blended)).assertEqual(255);
        expect(byteDiff(blended, plain) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0213
     * @tc.name testComboText0033
     * @tc.desc Verify a fully transparent layer drops the painted text entirely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0033 begin');
      await runCase('testComboText0033', async () => {
        const target: OffscreenTarget = await baseCanvas();
        target.canvas.saveLayer(null, makeBrush(0, 255, 255, 255));
        paintBlob(target, blobOf('Abc', 60), 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.restore();
        const buffer: ArrayBuffer = await readBack(target);
        const plain: ArrayBuffer = await baseOnly();
        expect(byteDiff(buffer, plain)).assertEqual(0);
        expect(pixelRed(buffer, 5, 5)).assertEqual(BASE_RED);
        expect(pixelAlpha(buffer, 5, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0214
     * @tc.name testComboText0034
     * @tc.desc Verify two nested half transparent layers compound to a quarter alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0034 begin');
      await runCase('testComboText0034', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.saveLayer(null, makeBrush(128, 255, 255, 255));
        target.canvas.saveLayer(null, makeBrush(128, 255, 255, 255));
        paintBlob(target, blobOf('Abc', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readBack(target);
        const peak: number = maxAlpha(buffer);
        expect(inkTotal(buffer) > 50).assertTrue();
        expect(peak >= 56 && peak <= 72).assertTrue();
        expect(peak < 128).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0215
     * @tc.name testComboText0035
     * @tc.desc Verify a half transparent brush blends the text into the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0035 begin');
      await runCase('testComboText0035', async () => {
        const buffer: ArrayBuffer = await baseTextAt('Abc', 60, 10, 120,
          makeBrush(128, FG_RED, FG_GREEN, FG_BLUE));
        let peakRed: number = 0;
        for (let y: number = 60; y < 130; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (pixelRed(buffer, x, y) > peakRed) {
              peakRed = pixelRed(buffer, x, y);
            }
          }
        }
        expect(inkTotal(buffer)).assertEqual(SIZE * SIZE);
        expect(peakRed > BASE_RED + 20).assertTrue();
        expect(peakRed < FG_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0216
     * @tc.name testComboText0036
     * @tc.desc Verify a DST_OUT brush punches transparent glyph holes in the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0036 begin');
      await runCase('testComboText0036', async () => {
        const brush: drawing.Brush = makeBrush(255, 0, 0, 0);
        brush.setBlendMode(drawing.BlendMode.DST_OUT);
        const target: OffscreenTarget = await baseCanvas();
        paintBlob(target, blobOf('Abc', 60), 10, 120, brush);
        const buffer: ArrayBuffer = await readBack(target);
        let holes: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (pixelAlpha(buffer, x, y) === 0) {
              holes++;
            }
          }
        }
        expect(holes > 20).assertTrue();
        expect(holes < 4000).assertTrue();
        expect(pixelAlpha(buffer, 5, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0217
     * @tc.name testComboText0037
     * @tc.desc Verify a bounded layer combined with a clip keeps the text inside both.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0037 begin');
      await runCase('testComboText0037', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.saveLayer(ltrb(0, 0, 100, SIZE), makeBrush(255, 255, 255, 255));
        target.canvas.clipRect(ltrb(0, 0, 60, SIZE));
        paintBlob(target, blobOf('Abcdefgh', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.restore();
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 60, 0, SIZE, SIZE)).assertEqual(0);
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0218
     * @tc.name testComboText0038
     * @tc.desc Verify text painted after a layer restore is opaque again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0038 begin');
      await runCase('testComboText0038', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.saveLayer(null, makeBrush(128, 255, 255, 255));
        paintBlob(target, blobOf('A', 60), 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.restore();
        paintBlob(target, blobOf('B', 50), 100, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        let leftPeak: number = 0;
        let rightPeak: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            const alpha: number = pixelAlpha(buffer, x, y);
            if (x < 90) {
              if (alpha > leftPeak) {
                leftPeak = alpha;
              }
            } else {
              if (alpha > rightPeak) {
                rightPeak = alpha;
              }
            }
          }
        }
        expect(leftPeak <= 132).assertTrue();
        expect(rightPeak).assertEqual(255);
        expect(inkRect(buffer, 0, 0, 90, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0219
     * @tc.name testComboText0039
     * @tc.desc Verify a SRC brush writes the exact glyph color over the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0039 begin');
      await runCase('testComboText0039', async () => {
        const brush: drawing.Brush = makeBrush(255, FG_RED, FG_GREEN, FG_BLUE);
        brush.setBlendMode(drawing.BlendMode.SRC);
        const target: OffscreenTarget = await baseCanvas();
        paintBlob(target, blobOf('Abc', 60), 10, 120, brush);
        const buffer: ArrayBuffer = await readBack(target);
        const plain: ArrayBuffer = await baseOnly();
        let exact: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (pixelRed(buffer, x, y) === FG_RED && pixelGreen(buffer, x, y) === FG_GREEN &&
              pixelBlue(buffer, x, y) === FG_BLUE) {
              exact++;
            }
          }
        }
        expect(exact > 20).assertTrue();
        expect(pixelRed(buffer, 5, 5)).assertEqual(BASE_RED);
        expect(byteDiff(buffer, plain) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0220
     * @tc.name testComboText0040
     * @tc.desc Verify two texts drawn in one layer both reach distinct rows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0040 begin');
      await runCase('testComboText0040', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.saveLayer(null, makeBrush(255, 255, 255, 255));
        paintBlob(target, blobOf('A', 50), 10, 80, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        paintBlob(target, blobOf('B', 50), 100, 170, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.restore();
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkRect(buffer, 0, 40, 100, 100) > 0).assertTrue();
        expect(inkRect(buffer, 90, 130, SIZE, SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 0, 100, SIZE, 130)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0221
     * @tc.name testComboText0041
     * @tc.desc Verify the measured text width tracks the painted glyph width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0041 begin');
      await runCase('testComboText0041', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const measured: number = font.measureText('Abc', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const buffer: ArrayBuffer = await textInkAt('Abc', 40, 10, 100);
        const painted: number = lastInkColumn(buffer) - firstInkColumn(buffer) + 1;
        expect(measured > 0).assertTrue();
        expect(painted > 0).assertTrue();
        expect(Math.abs(measured - painted) < measured * 0.35).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0222
     * @tc.name testComboText0042
     * @tc.desc Verify the blob bounds width tracks the painted glyph width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0042 begin');
      await runCase('testComboText0042', async () => {
        const blob: drawing.TextBlob = blobOf('Abc', 40);
        const box: common2D.Rect = blob.bounds();
        const target: OffscreenTarget = await newCanvas();
        paintBlob(target, blob, 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        const painted: number = lastInkColumn(buffer) - firstInkColumn(buffer) + 1;
        expect(box.right - box.left > 0).assertTrue();
        expect(painted > 0).assertTrue();
        expect(Math.abs((box.right - box.left) - painted) < 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0223
     * @tc.name testComboText0043
     * @tc.desc Verify a repeated phrase inks proportionally more than a short one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0043 begin');
      await runCase('testComboText0043', async () => {
        const shortInk: number = inkTotal(await textInkAt('Ab', 32, 10, 100));
        const longInk: number = inkTotal(await textInkAt('AbAbAbAb', 32, 10, 100));
        expect(shortInk > 0).assertTrue();
        expect(longInk > shortInk * 2).assertTrue();
        expect(longInk < shortInk * 12).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0224
     * @tc.name testComboText0044
     * @tc.desc Verify a doubled text size inks roughly four times the area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0044 begin');
      await runCase('testComboText0044', async () => {
        const smallInk: number = inkTotal(await textInkAt('H', 30, 10, 100));
        const bigInk: number = inkTotal(await textInkAt('H', 60, 10, 130));
        const ratio: number = bigInk / smallInk;
        expect(smallInk > 0).assertTrue();
        expect(bigInk > smallInk).assertTrue();
        expect(ratio > 2 && ratio < 6).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0225
     * @tc.name testComboText0045
     * @tc.desc Verify the outline bounds contain the painted text columns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0045 begin');
      await runCase('testComboText0045', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const outline: drawing.Path = font.getTextPath('Abc', 3, 10, 120);
        const box: common2D.Rect = outline.getBounds();
        const buffer: ArrayBuffer = await textInkAt('Abc', 48, 10, 120);
        expect(box.right - box.left > 0).assertTrue();
        expect(firstInkColumn(buffer) >= Math.floor(box.left) - 3).assertTrue();
        expect(lastInkColumn(buffer) <= Math.ceil(box.right) + 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0226
     * @tc.name testComboText0046
     * @tc.desc Verify a CJK character paints a solid glyph through the fallback face.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0046 begin');
      await runCase('testComboText0046', async () => {
        const buffer: ArrayBuffer = await textInkAt('中', 48, 40, 120);
        expect(inkTotal(buffer) > 100).assertTrue();
        expect(firstInkColumn(buffer) < 100).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0227
     * @tc.name testComboText0047
     * @tc.desc Verify a blank glyph inks nothing while its neighbours do.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0047 begin');
      await runCase('testComboText0047', async () => {
        const blankInk: number = inkTotal(await textInkAt(' ', 48, 10, 120));
        const letterInk: number = inkTotal(await textInkAt('M', 48, 10, 120));
        const pairInk: number = inkTotal(await textInkAt('M M', 48, 10, 120));
        expect(blankInk).assertEqual(0);
        expect(letterInk > 100).assertTrue();
        expect(pairInk > letterInk).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0228
     * @tc.name testComboText0048
     * @tc.desc Verify wide letters measure and paint further than narrow ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0048 begin');
      await runCase('testComboText0048', async () => {
        const wideFont: drawing.Font = new drawing.Font();
        wideFont.setSize(40);
        const narrowFont: drawing.Font = new drawing.Font();
        narrowFont.setSize(40);
        const wideWidth: number = wideFont.measureText('WWWW', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const narrowWidth: number = narrowFont.measureText('iiii', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const wideBuffer: ArrayBuffer = await textInkAt('WWWW', 40, 10, 100);
        const narrowBuffer: ArrayBuffer = await textInkAt('iiii', 40, 10, 100);
        expect(wideWidth > narrowWidth).assertTrue();
        expect(lastInkColumn(wideBuffer) > lastInkColumn(narrowBuffer)).assertTrue();
        expect(inkTotal(wideBuffer) > inkTotal(narrowBuffer)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0229
     * @tc.name testComboText0049
     * @tc.desc Verify a long text started near the right edge is clipped at the border.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0049 begin');
      await runCase('testComboText0049', async () => {
        const buffer: ArrayBuffer = await textInkAt('MMMMMMMM', 60, 150, 120);
        expect(inkTotal(buffer) > 0).assertTrue();
        expect(lastInkColumn(buffer)).assertEqual(196);
        expect(firstInkColumn(buffer) >= 150).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0230
     * @tc.name testComboText0050
     * @tc.desc Verify the same text painted twice on two canvases is byte identical.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0050 begin');
      await runCase('testComboText0050', async () => {
        const first: ArrayBuffer = await textInkAt('Abc', 40, 10, 100);
        const second: ArrayBuffer = await textInkAt('Abc', 40, 10, 100);
        const other: ArrayBuffer = await textInkAt('Abc', 40, 10, 101);
        expect(byteDiff(first, second)).assertEqual(0);
        expect(inkTotal(first)).assertEqual(inkTotal(second));
        expect(byteDiff(first, other) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0231
     * @tc.name testComboText0051
     * @tc.desc Verify a tiny text size still paints a narrow sliver of ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0051 begin');
      await runCase('testComboText0051', async () => {
        const tinyBuffer: ArrayBuffer = await textInkAt('Abc', 4, 10, 100);
        const normalInk: number = inkTotal(await textInkAt('Abc', 40, 10, 100));
        expect(inkTotal(tinyBuffer) < 60).assertTrue();
        expect(lastInkColumn(tinyBuffer) < 40).assertTrue();
        expect(normalInk > inkTotal(tinyBuffer)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0232
     * @tc.name testComboText0052
     * @tc.desc Verify a very large glyph fills a wide band of the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0052 begin');
      await runCase('testComboText0052', async () => {
        const buffer: ArrayBuffer = await textInkAt('H', 180, 10, 190);
        expect(inkTotal(buffer) > 5000).assertTrue();
        expect(lastInkColumn(buffer) < SIZE).assertTrue();
        expect(firstInkRow(buffer)).assertEqual(58);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0233
     * @tc.name testComboText0053
     * @tc.desc Verify text running off the right edge keeps a visible sliver.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0053 begin');
      await runCase('testComboText0053', async () => {
        const target: OffscreenTarget = await newCanvas();
        paintBlob(target, blobOf('Abc', 60), 180, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer) > 0).assertTrue();
        expect(firstInkColumn(buffer) >= 180).assertTrue();
        expect(lastInkColumn(buffer)).assertEqual(SIZE - 1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0234
     * @tc.name testComboText0054
     * @tc.desc Verify text started left of the canvas is clipped at column zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0054 begin');
      await runCase('testComboText0054', async () => {
        const target: OffscreenTarget = await newCanvas();
        paintBlob(target, blobOf('Abc', 60), -30, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer) > 0).assertTrue();
        expect(firstInkColumn(buffer)).assertEqual(0);
        expect(inkColumn(buffer, SIZE - 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0235
     * @tc.name testComboText0055
     * @tc.desc Verify a baseline on the top edge leaves the canvas empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0055 begin');
      await runCase('testComboText0055', async () => {
        const buffer: ArrayBuffer = await textInkAt('Abc', 40, 10, 0);
        expect(inkTotal(buffer)).assertEqual(12);
        expect(maxAlpha(buffer)).assertEqual(106);
        expect(firstInkRow(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0236
     * @tc.name testComboText0056
     * @tc.desc Verify a baseline on the bottom edge still inks the lowest rows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0056 begin');
      await runCase('testComboText0056', async () => {
        const buffer: ArrayBuffer = await textInkAt('Abc', 40, 10, 199);
        expect(inkTotal(buffer) > 0).assertTrue();
        expect(lastInkRow(buffer) >= 195).assertTrue();
        expect(firstInkRow(buffer) > 150).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0237
     * @tc.name testComboText0057
     * @tc.desc Verify a dot glyph inks far less than a capital letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0057 begin');
      await runCase('testComboText0057', async () => {
        const dotInk: number = inkTotal(await textInkAt('.', 48, 10, 120));
        const capInk: number = inkTotal(await textInkAt('M', 48, 10, 120));
        expect(dotInk > 0).assertTrue();
        expect(dotInk < capInk).assertTrue();
        expect(capInk < dotInk * 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0238
     * @tc.name testComboText0058
     * @tc.desc Verify a sixty two character string inks a dense band across the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0058 begin');
      await runCase('testComboText0058', async () => {
        const longText: string = 'AbcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        const buffer: ArrayBuffer = await textInkAt(longText, 24, 10, 120);
        expect(longText.length).assertEqual(62);
        expect(inkTotal(buffer) > 500).assertTrue();
        expect(lastInkColumn(buffer)).assertEqual(SIZE - 1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0239
     * @tc.name testComboText0059
     * @tc.desc Verify text painted over a filled rectangle keeps both layers visible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0059 begin');
      await runCase('testComboText0059', async () => {
        const target: OffscreenTarget = await newCanvas();
        const plate: drawing.Path = new drawing.Path();
        plate.addRect(ltrb(0, 0, SIZE, SIZE));
        target.canvas.attachBrush(makeBrush(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        target.canvas.drawPath(plate);
        target.canvas.detachBrush();
        paintBlob(target, blobOf('Abc', 60), 10, 120, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await readBack(target);
        let textPixels: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (pixelRed(buffer, x, y) === FG_RED && pixelGreen(buffer, x, y) === FG_GREEN) {
              textPixels++;
            }
          }
        }
        expect(pixelRed(buffer, 5, 5)).assertEqual(ALT_RED);
        expect(inkTotal(buffer)).assertEqual(SIZE * SIZE);
        expect(textPixels > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0240
     * @tc.name testComboText0060
     * @tc.desc Verify a layer, a clip and a text blob combine into one bounded result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboText0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0060 begin');
      await runCase('testComboText0060', async () => {
        const target: OffscreenTarget = await newCanvas();
        target.canvas.saveLayer(ltrb(0, 0, 120, SIZE), makeBrush(128, 255, 255, 255));
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        paintBlob(target, blobOf('Abcdefgh', 40), 10, 100, makeBrush(255, FG_RED, FG_GREEN, FG_BLUE));
        target.canvas.restore();
        const buffer: ArrayBuffer = await readBack(target);
        expect(inkTotal(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 100, 0, SIZE, SIZE)).assertEqual(0);
        expect(maxAlpha(buffer) <= 132).assertTrue();
        expect(maxAlpha(buffer) >= 120).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboText0060 end');
    });
  });
}
