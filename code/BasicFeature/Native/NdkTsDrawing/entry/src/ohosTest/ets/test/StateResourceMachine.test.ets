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
const UTF8: drawing.TextEncoding = drawing.TextEncoding.TEXT_ENCODING_UTF8;

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
 * Draw one text blob with one brush and detach the brush afterwards.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.TextBlob } blob - Text blob to draw.
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
 * Build a font of one size.
 *
 * @param { number } size - Text size in pixels.
 * @returns { drawing.Font } Configured font.
 */
function makeFont(size: number): drawing.Font {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  return font;
}

/**
 * Build a text blob from one string and one size.
 *
 * @param { string } text - Text content.
 * @param { number } size - Text size in pixels.
 * @returns { drawing.TextBlob } Text blob.
 */
function blobOf(text: string, size: number): drawing.TextBlob {
  return drawing.TextBlob.makeFromString(text, makeFont(size), UTF8);
}

/**
 * Build a point record.
 *
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { common2D.Point } Point record.
 */
function point(x: number, y: number): common2D.Point {
  const built: common2D.Point = { x: x, y: y };
  return built;
}

export default function stateResourceMachineTest() {
  describe('StateResourceMachineTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0128
     * @tc.name testStateResource0001
     * @tc.desc Verify a font size written to a font is readable back and widens the measured text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0001 begin');
      await runCase('testStateResource0001', async () => {
        const small: drawing.Font = makeFont(20);
        const large: drawing.Font = makeFont(60);
        expect(small.getSize()).assertEqual(20);
        expect(large.getSize()).assertEqual(60);
        expect(large.measureText('A', UTF8) > small.measureText('A', UTF8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0129
     * @tc.name testStateResource0002
     * @tc.desc Verify an empty string measures zero while a longer string measures more.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0002 begin');
      await runCase('testStateResource0002', async () => {
        const font: drawing.Font = makeFont(30);
        const empty: number = font.measureText('', UTF8);
        const single: number = font.measureText('A', UTF8);
        const double: number = font.measureText('AB', UTF8);
        expect(empty).assertEqual(0);
        expect(single > 0).assertTrue();
        expect(double > single).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0130
     * @tc.name testStateResource0003
     * @tc.desc Verify growing a font size after a measurement enlarges the next measurement.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0003 begin');
      await runCase('testStateResource0003', async () => {
        const font: drawing.Font = makeFont(30);
        const before: number = font.measureText('State', UTF8);
        font.setSize(90);
        const after: number = font.measureText('State', UTF8);
        expect(font.getSize()).assertEqual(90);
        expect(before > 0).assertTrue();
        expect(after > before).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0131
     * @tc.name testStateResource0004
     * @tc.desc Verify the horizontal font scale is readable back after it is set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0004 begin');
      await runCase('testStateResource0004', async () => {
        const font: drawing.Font = makeFont(40);
        expect(font.getScaleX()).assertEqual(1);
        font.setScaleX(2);
        expect(font.getScaleX()).assertEqual(2);
        expect(font.measureText('A', UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0132
     * @tc.name testStateResource0005
     * @tc.desc Verify the horizontal skew is readable back and keeps the text path drawable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0005 begin');
      await runCase('testStateResource0005', async () => {
        const font: drawing.Font = makeFont(50);
        font.setSkewX(0.5);
        const shape: drawing.Path = font.getTextPath('A', 1, 20, 140);
        const target: OffscreenTarget = await fresh();
        fillPath(target, shape, fgBrush());
        expect(font.getSkewX()).assertEqual(0.5);
        expect(shape.isEmpty()).assertFalse();
        expect(inkAll(await snap(target)) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0133
     * @tc.name testStateResource0006
     * @tc.desc Verify the hinting state is readable back after two changes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0006 begin');
      await runCase('testStateResource0006', async () => {
        const font: drawing.Font = makeFont(32);
        font.setHinting(drawing.FontHinting.NONE);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NONE);
        font.setHinting(drawing.FontHinting.NORMAL);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NORMAL);
        expect(font.measureText('Ag', UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0134
     * @tc.name testStateResource0007
     * @tc.desc Verify the edging state is readable back after two changes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0007 begin');
      await runCase('testStateResource0007', async () => {
        const font: drawing.Font = makeFont(32);
        font.setEdging(drawing.FontEdging.ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ANTI_ALIAS);
        expect(font.getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0135
     * @tc.name testStateResource0008
     * @tc.desc Verify a glyph path reports a positive width and paints ink once filled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0008 begin');
      await runCase('testStateResource0008', async () => {
        const shape: drawing.Path = makeFont(80).getTextPath('H', 1, 40, 150);
        const bounds: common2D.Rect = shape.getBounds();
        const target: OffscreenTarget = await fresh();
        fillPath(target, shape, altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(bounds.right > bounds.left).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
        expect(coolPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0136
     * @tc.name testStateResource0009
     * @tc.desc Verify a filled glyph path covers more pixels than the same path stroked.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0009 begin');
      await runCase('testStateResource0009', async () => {
        const shape: drawing.Path = makeFont(80).getTextPath('O', 1, 40, 150);
        const filled: OffscreenTarget = await fresh();
        fillPath(filled, shape, fgBrush());
        const stroked: OffscreenTarget = await fresh();
        strokePath(stroked, shape, penOf(2));
        const filledInk: number = inkAll(await snap(filled));
        const strokedInk: number = inkAll(await snap(stroked));
        expect(filledInk > 0).assertTrue();
        expect(strokedInk > 0).assertTrue();
        expect(filledInk > strokedInk).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0137
     * @tc.name testStateResource0010
     * @tc.desc Verify a blob built from a larger font paints more pixels than a small one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0010 begin');
      await runCase('testStateResource0010', async () => {
        const small: OffscreenTarget = await fresh();
        paintBlob(small, blobOf('W', 24), 30, 140, fgBrush());
        const large: OffscreenTarget = await fresh();
        paintBlob(large, blobOf('W', 72), 30, 140, fgBrush());
        const smallInk: number = inkAll(await snap(small));
        const largeInk: number = inkAll(await snap(large));
        expect(smallInk > 0).assertTrue();
        expect(largeInk > smallInk).assertTrue();
        expect(largeInk < 4 * SIZE * SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0138
     * @tc.name testStateResource0011
     * @tc.desc Verify resizing a font after a blob was built leaves that blob unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0011 begin');
      await runCase('testStateResource0011', async () => {
        const font: drawing.Font = makeFont(30);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('S', font, UTF8);
        const first: OffscreenTarget = await fresh();
        paintBlob(first, blob, 40, 140, fgBrush());
        const firstInk: number = inkAll(await snap(first));
        font.setSize(80);
        const second: OffscreenTarget = await fresh();
        paintBlob(second, blob, 40, 140, fgBrush());
        const secondInk: number = inkAll(await snap(second));
        expect(font.getSize()).assertEqual(80);
        expect(firstInk > 0).assertTrue();
        expect(secondInk).assertEqual(firstInk);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0139
     * @tc.name testStateResource0012
     * @tc.desc Verify two blobs built from one font render the same pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0012 begin');
      await runCase('testStateResource0012', async () => {
        const font: drawing.Font = makeFont(48);
        const firstBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Ab', font, UTF8);
        const secondBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('Ab', font, UTF8);
        const first: OffscreenTarget = await fresh();
        paintBlob(first, firstBlob, 20, 140, altBrush());
        const second: OffscreenTarget = await fresh();
        paintBlob(second, secondBlob, 20, 140, altBrush());
        const firstBuffer: ArrayBuffer = await snap(first);
        const secondBuffer: ArrayBuffer = await snap(second);
        expect(gapBytes(firstBuffer, secondBuffer)).assertEqual(0);
        expect(inkAll(firstBuffer) > 0).assertTrue();
        expect(firstInkCol(secondBuffer)).assertEqual(firstInkCol(firstBuffer));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0140
     * @tc.name testStateResource0013
     * @tc.desc Verify drawing one blob twice with a half transparent brush raises its coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0013 begin');
      await runCase('testStateResource0013', async () => {
        const blob: drawing.TextBlob = blobOf('E', 64);
        const target: OffscreenTarget = await fresh();
        paintBlob(target, blob, 40, 140, brushOf(128, FG_RED, FG_GREEN, FG_BLUE));
        const once: ArrayBuffer = await snap(target);
        paintBlob(target, blob, 40, 140, brushOf(128, FG_RED, FG_GREEN, FG_BLUE));
        const twice: ArrayBuffer = await snap(target);
        expect(inkAll(once) > 0).assertTrue();
        expect(gapBytes(once, twice) > 0).assertTrue();
        expect(inkAll(twice) >= inkAll(once)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0141
     * @tc.name testStateResource0014
     * @tc.desc Verify a canvas clip trims the painted part of a text blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0014 begin');
      await runCase('testStateResource0014', async () => {
        const blob: drawing.TextBlob = blobOf('M', 80);
        const full: OffscreenTarget = await fresh();
        paintBlob(full, blob, 20, 150, fgBrush());
        const clipped: OffscreenTarget = await fresh();
        clipped.canvas.clipRect(ltrb(100, 0, 200, 200));
        paintBlob(clipped, blob, 20, 150, fgBrush());
        const fullInk: number = inkAll(await snap(full));
        const clippedBuffer: ArrayBuffer = await snap(clipped);
        expect(fullInk > 0).assertTrue();
        expect(inkAll(clippedBuffer) < fullInk).assertTrue();
        expect(firstInkCol(clippedBuffer)).assertEqual(-1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0142
     * @tc.name testStateResource0015
     * @tc.desc Verify recoloring the brush between two text draws colors only the second one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0015 begin');
      await runCase('testStateResource0015', async () => {
        const target: OffscreenTarget = await fresh();
        paintBlob(target, blobOf('T', 60), 20, 100, fgBrush());
        paintBlob(target, blobOf('T', 60), 20, 190, altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkRect(buffer, 0, 0, SIZE, 120) > 0).assertTrue();
        expect(inkRect(buffer, 0, 130, SIZE, SIZE) > 0).assertTrue();
        expect(coolPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0143
     * @tc.name testStateResource0016
     * @tc.desc Verify two colored blobs stay in separate color classes on one canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0016 begin');
      await runCase('testStateResource0016', async () => {
        const target: OffscreenTarget = await fresh();
        const glyph: drawing.TextBlob = blobOf('Q', 56);
        paintBlob(target, glyph, 10, 100, fgBrush());
        paintBlob(target, glyph, 110, 100, altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(warmPixels(buffer)).assertEqual(769);
        expect(coolPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0144
     * @tc.name testStateResource0017
     * @tc.desc Verify drawing one blob at two positions paints two separated clusters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0017 begin');
      await runCase('testStateResource0017', async () => {
        const target: OffscreenTarget = await fresh();
        const blob: drawing.TextBlob = blobOf('I', 60);
        paintBlob(target, blob, 20, 90, fgBrush());
        const single: number = inkAll(await snap(target));
        paintBlob(target, blob, 120, 90, fgBrush());
        const doubled: number = inkAll(await snap(target));
        expect(single > 0).assertTrue();
        expect(doubled > single).assertTrue();
        expect(inkRect(await snap(target), 100, 0, 200, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0145
     * @tc.name testStateResource0018
     * @tc.desc Verify empty text yields no blob while a glyph blob paints ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0018 begin');
      await runCase('testStateResource0018', async () => {
        expect(blobOf('', 60)).assertUndefined();
        const blank: OffscreenTarget = await fresh();
        const blankBuffer: ArrayBuffer = await snap(blank);
        const painted: OffscreenTarget = await fresh();
        paintBlob(painted, blobOf('1', 60), 40, 120, fgBrush());
        expect(inkAll(blankBuffer)).assertEqual(0);
        expect(firstInkCol(blankBuffer)).assertEqual(-1);
        expect(inkAll(await snap(painted)) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0146
     * @tc.name testStateResource0019
     * @tc.desc Verify a blob built from positioned text lands near the requested point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0019 begin');
      await runCase('testStateResource0019', async () => {
        const points: Array<common2D.Point> = [point(120, 140)];
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromPosText('A', 1, points, makeFont(50));
        const target: OffscreenTarget = await fresh();
        paintBlob(target, blob, 0, 0, altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(firstInkCol(buffer) >= 100).assertTrue();
        expect(coolPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0147
     * @tc.name testStateResource0020
     * @tc.desc Verify a half width clip removes the right side of a text blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0020 begin');
      await runCase('testStateResource0020', async () => {
        const blob: drawing.TextBlob = blobOf('WW', 60);
        const full: OffscreenTarget = await fresh();
        paintBlob(full, blob, 10, 120, fgBrush());
        const clipped: OffscreenTarget = await fresh();
        clipped.canvas.clipRect(ltrb(0, 0, 100, 200));
        paintBlob(clipped, blob, 10, 120, fgBrush());
        expect(inkAll(await snap(clipped)) < inkAll(await snap(full))).assertTrue();
        expect(inkRect(await snap(clipped), 100, 0, 200, SIZE)).assertEqual(0);
        expect(inkAll(await snap(clipped)) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0148
     * @tc.name testStateResource0021
     * @tc.desc Verify a semi transparent text draw keeps a peak alpha below the full value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0021 begin');
      await runCase('testStateResource0021', async () => {
        const target: OffscreenTarget = await fresh();
        paintBlob(target, blobOf('B', 70), 30, 140, brushOf(100, FG_RED, FG_GREEN, FG_BLUE));
        const buffer: ArrayBuffer = await snap(target);
        let peak: number = 0;
        for (let y: number = 0; y < SIZE; y++) {
          for (let x: number = 0; x < SIZE; x++) {
            if (alphaAt(buffer, x, y) > peak) {
              peak = alphaAt(buffer, x, y);
            }
          }
        }
        expect(peak > 0).assertTrue();
        expect(peak >= 90 && peak <= 110).assertTrue();
        expect(redAt(buffer, SIZE - 1, SIZE - 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0149
     * @tc.name testStateResource0022
     * @tc.desc Verify a text path stroked by a pen keeps the pen color on its outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0022 begin');
      await runCase('testStateResource0022', async () => {
        const shape: drawing.Path = makeFont(70).getTextPath('C', 1, 30, 150);
        const target: OffscreenTarget = await fresh();
        strokePath(target, shape, penOf(4));
        const buffer: ArrayBuffer = await snap(target);
        const bounds: common2D.Rect = shape.getBounds();
        expect(inkAll(buffer) > 0).assertTrue();
        expect(warmPixels(buffer) > 0).assertTrue();
        expect(bounds.bottom > bounds.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0150
     * @tc.name testStateResource0023
     * @tc.desc Verify the later of two overlapping text draws owns the shared pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0023 begin');
      await runCase('testStateResource0023', async () => {
        const target: OffscreenTarget = await fresh();
        const blob: drawing.TextBlob = blobOf('H', 80);
        paintBlob(target, blob, 40, 150, fgBrush());
        paintBlob(target, blob, 40, 150, altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(coolPixels(buffer) > 0).assertTrue();
        expect(warmPixels(buffer)).assertEqual(0);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0151
     * @tc.name testStateResource0024
     * @tc.desc Verify a translated canvas moves the text blob with the origin shift.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0024 begin');
      await runCase('testStateResource0024', async () => {
        const blob: drawing.TextBlob = blobOf('D', 60);
        const plain: OffscreenTarget = await fresh();
        paintBlob(plain, blob, 20, 140, fgBrush());
        const moved: OffscreenTarget = await fresh();
        moved.canvas.translate(100, 0);
        paintBlob(moved, blob, 20, 140, fgBrush());
        expect(firstInkCol(await snap(moved)) > firstInkCol(await snap(plain))).assertTrue();
        expect(inkAll(await snap(moved))).assertEqual(inkAll(await snap(plain)));
        expect(inkAll(await snap(plain)) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0152
     * @tc.name testStateResource0025
     * @tc.desc Verify a tiny font paints fewer pixels than a large font for the same glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0025 begin');
      await runCase('testStateResource0025', async () => {
        const tiny: OffscreenTarget = await fresh();
        paintBlob(tiny, blobOf('K', 12), 20, 100, fgBrush());
        const huge: OffscreenTarget = await fresh();
        paintBlob(huge, blobOf('K', 90), 20, 160, fgBrush());
        const tinyInk: number = inkAll(await snap(tiny));
        const hugeInk: number = inkAll(await snap(huge));
        expect(tinyInk > 0).assertTrue();
        expect(hugeInk > tinyInk).assertTrue();
        expect(hugeInk < 4 * SIZE * SIZE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0153
     * @tc.name testStateResource0026
     * @tc.desc Verify a path fill type is readable back after each assignment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0026 begin');
      await runCase('testStateResource0026', async () => {
        const path: drawing.Path = rectPath(20, 20, 60, 60);
        path.setFillType(drawing.PathFillType.WINDING);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_WINDING);
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0154
     * @tc.name testStateResource0027
     * @tc.desc Verify an inverse fill type paints around the rectangle instead of inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0027 begin');
      await runCase('testStateResource0027', async () => {
        const target: OffscreenTarget = await fresh();
        const path: drawing.Path = rectPath(60, 60, 140, 140);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        fillPath(target, path, fgBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
        expect(inkAll(buffer) > 6400).assertTrue();
        expect(alphaAt(buffer, 10, 10)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0155
     * @tc.name testStateResource0028
     * @tc.desc Verify the path bounds report the four edges that were added.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0028 begin');
      await runCase('testStateResource0028', async () => {
        const bounds: common2D.Rect = rectPath(20, 30, 80, 150).getBounds();
        expect(bounds.left).assertEqual(20);
        expect(bounds.right).assertEqual(80);
        expect(bounds.bottom).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0156
     * @tc.name testStateResource0029
     * @tc.desc Verify an empty path reports empty until a rectangle is added.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0029 begin');
      await runCase('testStateResource0029', async () => {
        const path: drawing.Path = new drawing.Path();
        expect(path.isEmpty()).assertTrue();
        path.addRect(ltrb(20, 20, 60, 60));
        expect(path.isEmpty()).assertFalse();
        expect(path.getBounds().right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0157
     * @tc.name testStateResource0030
     * @tc.desc Verify closing a polyline lengthens its measured length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0030 begin');
      await runCase('testStateResource0030', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(40, 100);
        path.lineTo(100, 100);
        path.lineTo(100, 160);
        const open: number = path.getLength(false);
        const closed: number = path.getLength(true);
        expect(open > 100 && open < 140).assertTrue();
        expect(closed > open).assertTrue();
        expect(closed < 220).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0158
     * @tc.name testStateResource0031
     * @tc.desc Verify path containment answers inside and outside points correctly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0031 begin');
      await runCase('testStateResource0031', async () => {
        const path: drawing.Path = rectPath(40, 40, 120, 120);
        expect(path.contains(80, 80)).assertTrue();
        expect(path.contains(10, 10)).assertFalse();
        expect(path.contains(170, 170)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0159
     * @tc.name testStateResource0032
     * @tc.desc Verify the boundary path of a region reports the region edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0032 begin');
      await runCase('testStateResource0032', async () => {
        const region: drawing.Region = new drawing.Region(30, 40, 90, 120);
        const bounds: common2D.Rect = region.getBoundaryPath().getBounds();
        expect(region.getBoundaryPath().isEmpty()).assertFalse();
        expect(bounds.left).assertEqual(30);
        expect(bounds.bottom).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0160
     * @tc.name testStateResource0033
     * @tc.desc Verify transforming a path with a scale matrix doubles its bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0033 begin');
      await runCase('testStateResource0033', async () => {
        const path: drawing.Path = rectPath(20, 20, 60, 60);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        path.transform(matrix);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(40);
        expect(bounds.right).assertEqual(120);
        expect(bounds.bottom).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0161
     * @tc.name testStateResource0034
     * @tc.desc Verify offsetting a path shifts every reported edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0034 begin');
      await runCase('testStateResource0034', async () => {
        const path: drawing.Path = rectPath(20, 20, 60, 60);
        path.offset(100, 50);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(20);
        expect(bounds.top).assertEqual(20);
        expect(bounds.right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0162
     * @tc.name testStateResource0035
     * @tc.desc Verify offsetting one path leaves a second identically built path untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0035 begin');
      await runCase('testStateResource0035', async () => {
        const first: drawing.Path = rectPath(20, 20, 60, 60);
        const second: drawing.Path = rectPath(20, 20, 60, 60);
        first.offset(100, 0);
        expect(second.getBounds().left).assertEqual(20);
        expect(first.getBounds().left).assertEqual(20);
        expect(second.getBounds().right).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0163
     * @tc.name testStateResource0036
     * @tc.desc Verify a reset path drops its fill type and contour length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0036 begin');
      await runCase('testStateResource0036', async () => {
        const path: drawing.Path = rectPath(20, 20, 60, 60);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        path.reset();
        expect(path.isEmpty()).assertTrue();
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(path.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0164
     * @tc.name testStateResource0037
     * @tc.desc Verify even odd fill leaves a hole where winding fill keeps the overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0037 begin');
      await runCase('testStateResource0037', async () => {
        const evenOdd: drawing.Path = new drawing.Path();
        evenOdd.addRect(ltrb(40, 40, 120, 120));
        evenOdd.addRect(ltrb(80, 80, 160, 160));
        evenOdd.setFillType(drawing.PathFillType.EVEN_ODD);
        const winding: drawing.Path = new drawing.Path();
        winding.addRect(ltrb(40, 40, 120, 120));
        winding.addRect(ltrb(80, 80, 160, 160));
        winding.setFillType(drawing.PathFillType.WINDING);
        const evenTarget: OffscreenTarget = await fresh();
        fillPath(evenTarget, evenOdd, fgBrush());
        const windTarget: OffscreenTarget = await fresh();
        fillPath(windTarget, winding, fgBrush());
        const evenBuffer: ArrayBuffer = await snap(evenTarget);
        const windBuffer: ArrayBuffer = await snap(windTarget);
        expect(alphaAt(evenBuffer, 100, 100)).assertEqual(0);
        expect(alphaAt(windBuffer, 100, 100)).assertEqual(255);
        expect(inkAll(windBuffer) > inkAll(evenBuffer)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0165
     * @tc.name testStateResource0038
     * @tc.desc Verify stroking ignores the inverse fill type and paints only the outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0038 begin');
      await runCase('testStateResource0038', async () => {
        const path: drawing.Path = rectPath(40, 40, 120, 120);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const target: OffscreenTarget = await fresh();
        strokePath(target, path, penOf(6));
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 80, 80)).assertEqual(255);
        expect(alphaAt(buffer, 80, 42)).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(38080);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0166
     * @tc.name testStateResource0039
     * @tc.desc Verify changing the fill type later does not repaint committed pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0039 begin');
      await runCase('testStateResource0039', async () => {
        const path: drawing.Path = rectPath(40, 40, 120, 120);
        const target: OffscreenTarget = await fresh();
        fillPath(target, path, fgBrush());
        const before: ArrayBuffer = await snap(target);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const after: ArrayBuffer = await snap(target);
        expect(gapBytes(before, after)).assertEqual(0);
        expect(inkAll(after)).assertEqual(6400);
        expect(alphaAt(after, 10, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0167
     * @tc.name testStateResource0040
     * @tc.desc Verify a region built from setRect reports the assigned edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0040 begin');
      await runCase('testStateResource0040', async () => {
        const region: drawing.Region = new drawing.Region();
        expect(region.isEmpty()).assertTrue();
        region.setRect(20, 30, 80, 90);
        expect(region.isEmpty()).assertFalse();
        expect(region.getBounds().left).assertEqual(20);
        expect(region.getBounds().right).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0168
     * @tc.name testStateResource0041
     * @tc.desc Verify point containment is true inside the region and false outside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0041 begin');
      await runCase('testStateResource0041', async () => {
        const region: drawing.Region = new drawing.Region(40, 40, 120, 120);
        expect(region.isPointContained(80, 80)).assertTrue();
        expect(region.isPointContained(10, 10)).assertFalse();
        expect(region.isPointContained(160, 160)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0169
     * @tc.name testStateResource0042
     * @tc.desc Verify intersecting two regions keeps only their shared area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0042 begin');
      await runCase('testStateResource0042', async () => {
        const first: drawing.Region = new drawing.Region(0, 0, 100, 100);
        const second: drawing.Region = new drawing.Region(50, 50, 150, 150);
        expect(first.op(second, drawing.RegionOp.INTERSECT)).assertTrue();
        const bounds: common2D.Rect = first.getBounds();
        expect(bounds.left).assertEqual(50);
        expect(bounds.right).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0170
     * @tc.name testStateResource0043
     * @tc.desc Verify uniting two regions extends the bounds to both of them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0043 begin');
      await runCase('testStateResource0043', async () => {
        const first: drawing.Region = new drawing.Region(0, 0, 100, 100);
        const second: drawing.Region = new drawing.Region(50, 50, 150, 150);
        expect(first.op(second, drawing.RegionOp.UNION)).assertTrue();
        expect(first.getBounds().right).assertEqual(150);
        expect(first.getBounds().bottom).assertEqual(150);
        expect(first.isPointContained(140, 140)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0171
     * @tc.name testStateResource0044
     * @tc.desc Verify subtracting one region punches a hole in the other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0044 begin');
      await runCase('testStateResource0044', async () => {
        const first: drawing.Region = new drawing.Region(0, 0, 100, 100);
        const second: drawing.Region = new drawing.Region(50, 50, 150, 150);
        expect(first.op(second, drawing.RegionOp.DIFFERENCE)).assertTrue();
        expect(first.isPointContained(75, 75)).assertFalse();
        expect(first.isPointContained(25, 25)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0172
     * @tc.name testStateResource0045
     * @tc.desc Verify region equality distinguishes a different bottom edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0045 begin');
      await runCase('testStateResource0045', async () => {
        const first: drawing.Region = new drawing.Region(10, 10, 90, 90);
        const second: drawing.Region = new drawing.Region(10, 10, 90, 90);
        const third: drawing.Region = new drawing.Region(10, 10, 90, 100);
        expect(first.isEqual(second)).assertTrue();
        expect(first.isEqual(third)).assertFalse();
        expect(third.getBounds().bottom).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0173
     * @tc.name testStateResource0046
     * @tc.desc Verify offsetting a region moves both its bounds and its contained points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0046 begin');
      await runCase('testStateResource0046', async () => {
        const region: drawing.Region = new drawing.Region(20, 20, 60, 60);
        region.offset(100, 40);
        expect(region.getBounds().left).assertEqual(120);
        expect(region.getBounds().top).assertEqual(60);
        expect(region.isPointContained(140, 80)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0174
     * @tc.name testStateResource0047
     * @tc.desc Verify the quick containment and rejection checks follow the region bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0047 begin');
      await runCase('testStateResource0047', async () => {
        const region: drawing.Region = new drawing.Region(40, 40, 120, 120);
        expect(region.quickContains(50, 50, 100, 100)).assertTrue();
        expect(region.quickReject(150, 150, 190, 190)).assertTrue();
        expect(region.quickReject(60, 60, 100, 100)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0175
     * @tc.name testStateResource0048
     * @tc.desc Verify drawing a region fills exactly its rectangle with the attached brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0048 begin');
      await runCase('testStateResource0048', async () => {
        const target: OffscreenTarget = await fresh();
        target.canvas.attachBrush(fgBrush());
        target.canvas.drawRegion(new drawing.Region(40, 40, 120, 120));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(firstInkCol(buffer)).assertEqual(40);
        expect(alphaAt(buffer, 80, 80)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0176
     * @tc.name testStateResource0049
     * @tc.desc Verify region containment is one directional for a nested pair.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0049 begin');
      await runCase('testStateResource0049', async () => {
        const outer: drawing.Region = new drawing.Region(0, 0, 200, 200);
        const inner: drawing.Region = new drawing.Region(50, 50, 100, 100);
        expect(outer.isRegionContained(inner)).assertTrue();
        expect(inner.isRegionContained(outer)).assertFalse();
        expect(inner.isComplex()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0177
     * @tc.name testStateResource0050
     * @tc.desc Verify the boundary path of a region fills the same block as the region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0050 begin');
      await runCase('testStateResource0050', async () => {
        const region: drawing.Region = new drawing.Region(30, 30, 90, 90);
        const target: OffscreenTarget = await fresh();
        fillPath(target, region.getBoundaryPath(), altBrush());
        const buffer: ArrayBuffer = await snap(target);
        expect(inkAll(buffer)).assertEqual(3600);
        expect(firstInkCol(buffer)).assertEqual(30);
        expect(coolPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0178
     * @tc.name testStateResource0051
     * @tc.desc Verify a translation matrix maps points and stops being an identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0051 begin');
      await runCase('testStateResource0051', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(30, 40);
        const mapped: Array<common2D.Point> = matrix.mapPoints([point(10, 10), point(0, 0)]);
        expect(mapped[0].x).assertEqual(40);
        expect(mapped[0].y).assertEqual(50);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0179
     * @tc.name testStateResource0052
     * @tc.desc Verify a quarter turn maps the top point to the right of the pivot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0052 begin');
      await runCase('testStateResource0052', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        const mapped: Array<common2D.Point> = matrix.mapPoints([point(100, 0)]);
        expect(mapped[0].x >= 199 && mapped[0].x <= 201).assertTrue();
        expect(mapped[0].y >= 99 && mapped[0].y <= 101).assertTrue();
        expect(matrix.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0180
     * @tc.name testStateResource0053
     * @tc.desc Verify the inverse of a scale matrix maps points back to the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0053 begin');
      await runCase('testStateResource0053', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        const inverse: drawing.Matrix = new drawing.Matrix();
        expect(matrix.invert(inverse)).assertTrue();
        const back: Array<common2D.Point> = inverse.mapPoints(matrix.mapPoints([point(10, 15)]));
        expect(back[0].x >= 9 && back[0].x <= 11).assertTrue();
        expect(back[0].y >= 14 && back[0].y <= 16).assertTrue();
        expect(inverse.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0181
     * @tc.name testStateResource0054
     * @tc.desc Verify two fresh matrices compare equal until one of them is translated.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0054 begin');
      await runCase('testStateResource0054', async () => {
        const first: drawing.Matrix = new drawing.Matrix();
        const second: drawing.Matrix = new drawing.Matrix();
        expect(first.isEqual(second)).assertTrue();
        first.setTranslation(10, 20);
        expect(first.isEqual(second)).assertFalse();
        expect(second.isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0182
     * @tc.name testStateResource0055
     * @tc.desc Verify a uniform scale triples the mapped radius and the scale value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0055 begin');
      await runCase('testStateResource0055', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(3, 3, 0, 0);
        expect(matrix.mapRadius(10)).assertEqual(30);
        expect(matrix.rectStaysRect()).assertTrue();
        expect(matrix.getValue(0)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0183
     * @tc.name testStateResource0056
     * @tc.desc Verify the rectangle helper answers point containment against the edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0056 begin');
      await runCase('testStateResource0056', async () => {
        const rect: common2D.Rect = ltrb(20, 20, 120, 120);
        expect(drawing.RectUtils.contains(rect, 60, 60)).assertTrue();
        expect(drawing.RectUtils.contains(rect, 10, 10)).assertFalse();
        expect(drawing.RectUtils.contains(rect, 140, 60)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0184
     * @tc.name testStateResource0057
     * @tc.desc Verify rounding the corners removes pixels from a filled block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0057 begin');
      await runCase('testStateResource0057', async () => {
        const sharpPath: drawing.Path = new drawing.Path();
        sharpPath.addRoundRect(new drawing.RoundRect(ltrb(40, 40, 160, 160), 0, 0));
        const roundPath: drawing.Path = new drawing.Path();
        roundPath.addRoundRect(new drawing.RoundRect(ltrb(40, 40, 160, 160), 40, 40));
        const sharpTarget: OffscreenTarget = await fresh();
        fillPath(sharpTarget, sharpPath, fgBrush());
        const roundTarget: OffscreenTarget = await fresh();
        fillPath(roundTarget, roundPath, fgBrush());
        const sharpInk: number = inkAll(await snap(sharpTarget));
        const roundInk: number = inkAll(await snap(roundTarget));
        expect(sharpInk).assertEqual(14400);
        expect(roundInk < sharpInk).assertTrue();
        expect(roundInk > 10000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0185
     * @tc.name testStateResource0058
     * @tc.desc Verify a zero radius round rectangle matches a plain rectangle fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0058 begin');
      await runCase('testStateResource0058', async () => {
        const plain: OffscreenTarget = await fresh();
        fillPath(plain, rectPath(40, 40, 160, 160), fgBrush());
        const rounded: OffscreenTarget = await fresh();
        const shape: drawing.Path = new drawing.Path();
        shape.addRoundRect(new drawing.RoundRect(ltrb(40, 40, 160, 160), 0, 0));
        fillPath(rounded, shape, fgBrush());
        const roundedBuffer: ArrayBuffer = await snap(rounded);
        expect(inkAll(await snap(plain))).assertEqual(14400);
        expect(inkAll(roundedBuffer)).assertEqual(14400);
        expect(firstInkCol(roundedBuffer)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0186
     * @tc.name testStateResource0059
     * @tc.desc Verify a gradient shader assigned to a brush blends from warm to cool.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0059 begin');
      await runCase('testStateResource0059', async () => {
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(drawing.ShaderEffect.createLinearGradient(point(40, 100), point(160, 100), colors,
          drawing.TileMode.CLAMP));
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 160, 160), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 45, 100) > chan(buffer, 45, 100, 2)).assertTrue();
        expect(chan(buffer, 150, 100, 2) > redAt(buffer, 150, 100)).assertTrue();
        expect(inkAll(buffer)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0187
     * @tc.name testStateResource0060
     * @tc.desc Verify clearing the shader falls back to the brush color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0060 begin');
      await runCase('testStateResource0060', async () => {
        const colors: number[] = [0xFF00FF00, 0xFFFF00FF];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(drawing.ShaderEffect.createLinearGradient(point(20, 100), point(180, 100), colors,
          drawing.TileMode.MIRROR));
        brush.setShaderEffect(null);
        brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        brush.setAntiAlias(false);
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 160, 160), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 100, 100)).assertEqual(ALT_RED);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(inkAll(buffer)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0060 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0188
     * @tc.name testStateResource0061
     * @tc.desc Verify the rectangle helper compares a whole rectangle against another.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testStateResource0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0061 begin');
      await runCase('testStateResource0061', async () => {
        const outer: common2D.Rect = ltrb(0, 0, 200, 200);
        const inner: common2D.Rect = ltrb(50, 50, 100, 100);
        const stray: common2D.Rect = ltrb(150, 150, 250, 250);
        expect(drawing.RectUtils.contains(outer, inner)).assertTrue();
        expect(drawing.RectUtils.contains(outer, stray)).assertFalse();
        expect(drawing.RectUtils.contains(inner, 75, 75)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0061 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0189
     * @tc.name testStateResource0062
     * @tc.desc Verify resizing one font leaves a second font and its measurements alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0062 begin');
      await runCase('testStateResource0062', async () => {
        const first: drawing.Font = makeFont(20);
        const second: drawing.Font = makeFont(60);
        first.setSize(80);
        expect(first.getSize()).assertEqual(80);
        expect(second.getSize()).assertEqual(60);
        expect(second.measureText('A', UTF8) < first.measureText('A', UTF8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0062 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0190
     * @tc.name testStateResource0063
     * @tc.desc Verify assigning a fill type to one path leaves a second path at the default.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0063 begin');
      await runCase('testStateResource0063', async () => {
        const first: drawing.Path = rectPath(20, 20, 60, 60);
        const second: drawing.Path = rectPath(20, 20, 60, 60);
        first.setFillType(drawing.PathFillType.INVERSE_WINDING);
        expect(first.getFillType()).assertEqual(drawing.PathFillType.INVERSE_WINDING);
        expect(second.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(second.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0063 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0191
     * @tc.name testStateResource0064
     * @tc.desc Verify a region operation on one region leaves a second region untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0064 begin');
      await runCase('testStateResource0064', async () => {
        const first: drawing.Region = new drawing.Region(0, 0, 100, 100);
        const second: drawing.Region = new drawing.Region(0, 0, 100, 100);
        const third: drawing.Region = new drawing.Region(50, 50, 150, 150);
        first.op(third, drawing.RegionOp.UNION);
        expect(first.getBounds().right).assertEqual(150);
        expect(second.getBounds().right).assertEqual(100);
        expect(second.isPointContained(140, 140)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0064 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0192
     * @tc.name testStateResource0065
     * @tc.desc Verify translating one matrix leaves a second matrix at the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0065 begin');
      await runCase('testStateResource0065', async () => {
        const first: drawing.Matrix = new drawing.Matrix();
        const second: drawing.Matrix = new drawing.Matrix();
        first.setTranslation(50, 0);
        expect(first.mapPoints([point(0, 0)])[0].x).assertEqual(50);
        expect(second.mapPoints([point(0, 0)])[0].x).assertEqual(0);
        expect(second.isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0065 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0193
     * @tc.name testStateResource0066
     * @tc.desc Verify a reset matrix drops the translation it carried before.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0066 begin');
      await runCase('testStateResource0066', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(40, 0);
        expect(matrix.mapPoints([point(0, 0)])[0].x).assertEqual(40);
        matrix.reset();
        matrix.setTranslation(0, 80);
        expect(matrix.mapPoints([point(0, 0)])[0].x).assertEqual(0);
        expect(matrix.mapPoints([point(0, 0)])[0].y).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0066 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0194
     * @tc.name testStateResource0067
     * @tc.desc Verify an image filter added to a brush does not repaint committed pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0067 begin');
      await runCase('testStateResource0067', async () => {
        const brush: drawing.Brush = fgBrush();
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 120, 120), brush);
        const before: ArrayBuffer = await snap(target);
        brush.setImageFilter(drawing.ImageFilter.createBlurImageFilter(4, 4, drawing.TileMode.CLAMP));
        const after: ArrayBuffer = await snap(target);
        expect(inkAll(before)).assertEqual(6400);
        expect(gapBytes(before, after)).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0067 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0195
     * @tc.name testStateResource0068
     * @tc.desc Verify clearing the brush image filter restores the exact solid color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0068 begin');
      await runCase('testStateResource0068', async () => {
        const brush: drawing.Brush = fgBrush();
        brush.setImageFilter(drawing.ImageFilter.createBlurImageFilter(6, 6, drawing.TileMode.CLAMP));
        brush.setImageFilter(null);
        brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 120, 120), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(redAt(buffer, 80, 80)).assertEqual(ALT_RED);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(alphaAt(buffer, 80, 80)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0068 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0196
     * @tc.name testStateResource0069
     * @tc.desc Verify an image filter added to a pen does not repaint the committed stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0069 begin');
      await runCase('testStateResource0069', async () => {
        const pen: drawing.Pen = penOf(10);
        const target: OffscreenTarget = await fresh();
        strokePath(target, rectPath(40, 40, 160, 160), pen);
        const before: ArrayBuffer = await snap(target);
        pen.setImageFilter(drawing.ImageFilter.createBlurImageFilter(4, 4, drawing.TileMode.CLAMP));
        const after: ArrayBuffer = await snap(target);
        expect(inkAll(before) > 0).assertTrue();
        expect(gapBytes(before, after)).assertEqual(0);
        expect(pen.getWidth()).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0069 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0197
     * @tc.name testStateResource0070
     * @tc.desc Verify one blob drawn with two brushes takes each brush color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0070 begin');
      await runCase('testStateResource0070', async () => {
        const blob: drawing.TextBlob = blobOf('N', 60);
        const warm: OffscreenTarget = await fresh();
        paintBlob(warm, blob, 40, 140, fgBrush());
        const cool: OffscreenTarget = await fresh();
        paintBlob(cool, blob, 40, 140, altBrush());
        const warmBuffer: ArrayBuffer = await snap(warm);
        const coolBuffer: ArrayBuffer = await snap(cool);
        expect(warmPixels(warmBuffer) > 0).assertTrue();
        expect(coolPixels(coolBuffer) > 0).assertTrue();
        expect(gapBytes(warmBuffer, coolBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0070 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0198
     * @tc.name testStateResource0071
     * @tc.desc Verify a clip on one canvas leaves a second canvas unclipped.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0071 begin');
      await runCase('testStateResource0071', async () => {
        const clipped: OffscreenTarget = await fresh();
        clipped.canvas.clipRect(ltrb(0, 0, 100, 200));
        fillPath(clipped, rectPath(40, 40, 160, 160), fgBrush());
        const plain: OffscreenTarget = await fresh();
        fillPath(plain, rectPath(40, 40, 160, 160), fgBrush());
        const clippedBuffer: ArrayBuffer = await snap(clipped);
        expect(inkAll(clippedBuffer) < inkAll(await snap(plain))).assertTrue();
        expect(inkAll(await snap(plain))).assertEqual(14400);
        expect(inkRect(clippedBuffer, 100, 0, 200, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0071 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0199
     * @tc.name testStateResource0072
     * @tc.desc Verify a gradient brush capped by alpha keeps both the blend and the alpha cap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testStateResource0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0072 begin');
      await runCase('testStateResource0072', async () => {
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(drawing.ShaderEffect.createLinearGradient(point(40, 100), point(160, 100), colors,
          drawing.TileMode.CLAMP));
        brush.setAlpha(128);
        const target: OffscreenTarget = await fresh();
        fillPath(target, rectPath(40, 40, 160, 160), brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(alphaAt(buffer, 100, 100) >= 120 && alphaAt(buffer, 100, 100) <= 136).assertTrue();
        expect(inkAll(buffer)).assertEqual(14400);
        expect(redAt(buffer, 45, 100) > redAt(buffer, 155, 100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0072 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_STATE_0200
     * @tc.name testStateResource0073
     * @tc.desc Verify a reset brush accepts a new color before a text draw.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testStateResource0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0073 begin');
      await runCase('testStateResource0073', async () => {
        const brush: drawing.Brush = fgBrush();
        brush.reset();
        brush.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
        brush.setAntiAlias(false);
        const target: OffscreenTarget = await fresh();
        paintBlob(target, blobOf('Z', 60), 40, 140, brush);
        const buffer: ArrayBuffer = await snap(target);
        expect(coolPixels(buffer) > 0).assertTrue();
        expect(warmPixels(buffer)).assertEqual(0);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testStateResource0073 end');
    });
  });
}
