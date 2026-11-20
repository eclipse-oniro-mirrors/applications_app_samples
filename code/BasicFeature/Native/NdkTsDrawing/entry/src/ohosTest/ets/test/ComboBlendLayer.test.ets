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
const SIZE: number = 160;
const LINE_Y: number = 80;
const BOX_L: number = 20;
const BOX_T: number = 20;
const BOX_R: number = 100;
const BOX_B: number = 100;
const BOX_AREA: number = (BOX_R - BOX_L) * (BOX_B - BOX_T);
const BASE_RED: number = 160;
const BASE_GREEN: number = 90;
const BASE_BLUE: number = 40;
const FG_RED: number = 40;
const FG_GREEN: number = 120;
const FG_BLUE: number = 200;
const SEC_RED: number = 200;
const SEC_GREEN: number = 60;
const SEC_BLUE: number = 240;
const LEFT_L: number = 20;
const LEFT_R: number = 80;
const RIGHT_L: number = 60;
const RIGHT_R: number = 120;
const STRIP_T: number = 20;
const STRIP_B: number = 100;
const OVERLAP_X: number = 70;
const LEFT_ONLY_X: number = 40;
const RIGHT_ONLY_X: number = 100;

/**
 * Read one color channel of a pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function channelAt(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
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
  return channelAt(buffer, x, y, 3);
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
  return channelAt(buffer, x, y, 0);
}

/**
 * Read the green channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Green value.
 */
function greenAt(buffer: ArrayBuffer, x: number, y: number): number {
  return channelAt(buffer, x, y, 1);
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
  return channelAt(buffer, x, y, 2);
}

/**
 * Count painted pixels inside one rectangle of the bitmap.
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
 * Count the bytes that differ between two buffers inside one rectangle.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of differing bytes.
 */
function diffInBox(first: ArrayBuffer, second: ArrayBuffer, left: number, top: number,
  right: number, bottom: number): number {
  const bytesA: Uint8Array = new Uint8Array(first);
  const bytesB: Uint8Array = new Uint8Array(second);
  let diff: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      const offset: number = (y * SIZE + x) * 4;
      for (let channel: number = 0; channel < 4; channel++) {
        if (bytesA[offset + channel] !== bytesB[offset + channel]) {
          diff++;
        }
      }
    }
  }
  return diff;
}

/**
 * Count the bytes that differ between two equally sized buffers.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @returns { number } Number of differing bytes.
 */
function diffCount(first: ArrayBuffer, second: ArrayBuffer): number {
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
 * Compare two channel values with a small slack for rasterisation rounding.
 *
 * @param { number } value - Measured value.
 * @param { number } expected - Expected value.
 * @param { number } slack - Allowed absolute difference.
 * @returns { boolean } Whether the values are close enough.
 */
function closeTo(value: number, expected: number, slack: number): boolean {
  return Math.abs(value - expected) <= slack;
}

/**
 * Count the columns of one row whose channel is strictly below a threshold.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } y - Row to scan.
 * @param { number } channel - Channel index to read.
 * @param { number } limit - Exclusive upper bound.
 * @returns { number } Number of matching columns.
 */
function countRowBelow(buffer: ArrayBuffer, y: number, channel: number, limit: number): number {
  let matched: number = 0;
  for (let x: number = 0; x < SIZE; x++) {
    if (channelAt(buffer, x, y, channel) < limit) {
      matched++;
    }
  }
  return matched;
}

/**
 * Count the columns of one row whose channel is strictly above a threshold.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } y - Row to scan.
 * @param { number } channel - Channel index to read.
 * @param { number } limit - Exclusive lower bound.
 * @returns { number } Number of matching columns.
 */
function countRowAbove(buffer: ArrayBuffer, y: number, channel: number, limit: number): number {
  let matched: number = 0;
  for (let x: number = 0; x < SIZE; x++) {
    if (channelAt(buffer, x, y, channel) > limit) {
      matched++;
    }
  }
  return matched;
}

/**
 * Create an empty square bitmap bound to a canvas.
 *
 * @returns { Promise<OffscreenTarget> } Blank offscreen target.
 */
async function blankOf(): Promise<OffscreenTarget> {
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
 * Draw the opaque background over the whole canvas.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 */
function paintBase(target: OffscreenTarget): void {
  target.canvas.drawColor(rgba(255, BASE_RED, BASE_GREEN, BASE_BLUE), drawing.BlendMode.SRC);
}

/**
 * Create a canvas painted with the opaque background only.
 *
 * @returns { Promise<OffscreenTarget> } Background target.
 */
async function baseTarget(): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await blankOf();
  paintBase(target);
  return target;
}

/**
 * Read back the pixels of a canvas that carries the background only.
 *
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function baseBuffer(): Promise<ArrayBuffer> {
  return await pixelsOf(await baseTarget());
}

/**
 * Build a brush painting the foreground color with one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode of the brush.
 * @returns { drawing.Brush } Configured brush.
 */
function fgBrush(mode: drawing.BlendMode): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
  brush.setBlendMode(mode);
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a brush painting the foreground color with one alpha and blend mode.
 *
 * @param { number } alpha - Alpha channel of the source color.
 * @param { drawing.BlendMode } mode - Blend mode of the brush.
 * @returns { drawing.Brush } Configured brush.
 */
function fgBrushWith(alpha: number, mode: drawing.BlendMode): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, FG_RED, FG_GREEN, FG_BLUE));
  brush.setBlendMode(mode);
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a white opaque brush that acts as the paint of a layer.
 *
 * @param { drawing.BlendMode } mode - Blend mode applied when the layer is composited.
 * @returns { drawing.Brush } Configured layer brush.
 */
function layerBrush(mode: drawing.BlendMode): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 255, 255));
  brush.setBlendMode(mode);
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a pen painting the foreground color with one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode of the pen.
 * @param { number } width - Stroke width in pixels.
 * @returns { drawing.Pen } Configured pen.
 */
function penOf(mode: drawing.BlendMode, width: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
  pen.setStrokeWidth(width);
  pen.setBlendMode(mode);
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Fill the reference square with one brush.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.Brush } brush - Brush carrying color and blend mode.
 */
function fillBox(target: OffscreenTarget, brush: drawing.Brush): void {
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(BOX_L, BOX_T, BOX_R, BOX_B);
  target.canvas.detachBrush();
}

/**
 * Fill one explicit rectangle with one blend mode.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.BlendMode } mode - Blend mode of the brush.
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 */
function fillRect(target: OffscreenTarget, mode: drawing.BlendMode, left: number, top: number,
  right: number, bottom: number): void {
  target.canvas.attachBrush(fgBrush(mode));
  target.canvas.drawRect(left, top, right, bottom);
  target.canvas.detachBrush();
}

/**
 * Draw the background then the reference square with one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode of the square.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function baseWithBox(mode: drawing.BlendMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  fillBox(target, fgBrush(mode));
  return await pixelsOf(target);
}

/**
 * Draw the background, open a layer whose paint carries one blend mode, paint the
 * reference square inside the layer and close it again.
 *
 * @param { drawing.BlendMode } mode - Blend mode of the layer paint.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function layerWithBox(mode: drawing.BlendMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  target.canvas.saveLayer(null, layerBrush(mode));
  fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
  target.canvas.restore();
  return await pixelsOf(target);
}

/**
 * Composite two full canvas colors in sequence over the background.
 *
 * @param { drawing.BlendMode } firstMode - Blend mode of the first color.
 * @param { drawing.BlendMode } secondMode - Blend mode of the second color.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function twoPass(firstMode: drawing.BlendMode, secondMode: drawing.BlendMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  target.canvas.drawColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE), firstMode);
  target.canvas.drawColor(rgba(255, SEC_RED, SEC_GREEN, SEC_BLUE), secondMode);
  return await pixelsOf(target);
}

/**
 * Count the rows of one column whose channel is strictly below a threshold.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Column to scan.
 * @param { number } channel - Channel index to read.
 * @param { number } limit - Exclusive upper bound.
 * @returns { number } Number of matching rows.
 */
function countColumnBelow(buffer: ArrayBuffer, x: number, channel: number, limit: number): number {
  let matched: number = 0;
  for (let y: number = 0; y < SIZE; y++) {
    if (channelAt(buffer, x, y, channel) < limit) {
      matched++;
    }
  }
  return matched;
}

/**
 * Composite one full canvas color over the background.
 *
 * @param { drawing.BlendMode } mode - Blend mode of the color.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function onePass(mode: drawing.BlendMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  target.canvas.drawColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE), mode);
  return await pixelsOf(target);
}

/**
 * Composite one translucent color once over a blank canvas.
 *
 * @param { number } alpha - Alpha of the pass.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function overlayOnce(alpha: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await blankOf();
  target.canvas.drawColor(rgba(alpha, FG_RED, FG_GREEN, FG_BLUE), drawing.BlendMode.SRC_OVER);
  return await pixelsOf(target);
}

/**
 * Composite one translucent color twice with SRC_OVER over a blank canvas.
 *
 * @param { number } alpha - Alpha of each pass.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function overlayTwice(alpha: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await blankOf();
  target.canvas.drawColor(rgba(alpha, FG_RED, FG_GREEN, FG_BLUE), drawing.BlendMode.SRC_OVER);
  target.canvas.drawColor(rgba(alpha, FG_RED, FG_GREEN, FG_BLUE), drawing.BlendMode.SRC_OVER);
  return await pixelsOf(target);
}

/**
 * Composite three full canvas colors in sequence over the background.
 *
 * @param { drawing.BlendMode } firstMode - Blend mode of the foreground color.
 * @param { drawing.BlendMode } secondMode - Blend mode of the secondary color.
 * @param { drawing.BlendMode } thirdMode - Blend mode of the repeated foreground color.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function threePass(firstMode: drawing.BlendMode, secondMode: drawing.BlendMode,
  thirdMode: drawing.BlendMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  target.canvas.drawColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE), firstMode);
  target.canvas.drawColor(rgba(255, SEC_RED, SEC_GREEN, SEC_BLUE), secondMode);
  target.canvas.drawColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE), thirdMode);
  return await pixelsOf(target);
}

/**
 * Build a translucent layer brush with one alpha and blend mode.
 *
 * @param { number } alpha - Alpha applied when the layer is composited.
 * @param { drawing.BlendMode } mode - Blend mode applied when the layer is composited.
 * @returns { drawing.Brush } Configured layer brush.
 */
function layerBrushWith(alpha: number, mode: drawing.BlendMode): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, 255, 255, 255));
  brush.setBlendMode(mode);
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Fill the whole canvas with a translucent foreground color and one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode of the brush.
 * @param { number } alpha - Alpha of the source color.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function blendAlpha(mode: drawing.BlendMode, alpha: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  target.canvas.attachBrush(fgBrushWith(alpha, mode));
  target.canvas.drawRect(0, 0, SIZE, SIZE);
  target.canvas.detachBrush();
  return await pixelsOf(target);
}

export default function comboBlendLayerTest() {
  describe('ComboBlendLayerTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0061
     * @tc.name testComboBlend0001
     * @tc.desc Verify an opaque layer painted with SRC_OVER reproduces the plain square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0001 begin');
      await runCase('testComboBlend0001', async () => {
        const plain: ArrayBuffer = await baseWithBox(drawing.BlendMode.SRC_OVER);
        const layered: ArrayBuffer = await layerWithBox(drawing.BlendMode.SRC_OVER);
        expect(diffCount(plain, layered) < 100).assertTrue();
        expect(closeTo(redAt(layered, 60, 60), FG_RED, 2)).assertTrue();
        expect(diffInBox(plain, layered, BOX_R + 5, BOX_T, SIZE, BOX_B)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0062
     * @tc.name testComboBlend0002
     * @tc.desc Verify a layer painted with CLEAR drops the square drawn inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0002 begin');
      await runCase('testComboBlend0002', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const buffer: ArrayBuffer = await layerWithBox(drawing.BlendMode.CLEAR);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE) < SIZE * SIZE).assertTrue();
        expect(diffCount(base, buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0063
     * @tc.name testComboBlend0003
     * @tc.desc Verify a layer painted with DST keeps the destination and drops the layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0003 begin');
      await runCase('testComboBlend0003', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const buffer: ArrayBuffer = await layerWithBox(drawing.BlendMode.DST);
        expect(diffInBox(base, buffer, BOX_L, BOX_T, BOX_R, BOX_B)).assertEqual(0);
        expect(blueAt(buffer, 60, 60)).assertEqual(BASE_BLUE);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(SIZE * SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0064
     * @tc.name testComboBlend0004
     * @tc.desc Verify a layer painted with SRC replaces the background by the layer content.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0004 begin');
      await runCase('testComboBlend0004', async () => {
        const buffer: ArrayBuffer = await layerWithBox(drawing.BlendMode.SRC);
        expect(closeTo(redAt(buffer, 60, 60), FG_RED, 2)).assertTrue();
        expect(alphaAt(buffer, 10, 10)).assertEqual(0);
        expect(closeTo(inkBox(buffer, 0, 0, SIZE, SIZE), BOX_AREA, 200)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0065
     * @tc.name testComboBlend0005
     * @tc.desc Verify a layer painted with MODULATE matches the same mode used by the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0005 begin');
      await runCase('testComboBlend0005', async () => {
        const plain: ArrayBuffer = await baseWithBox(drawing.BlendMode.MODULATE);
        const layered: ArrayBuffer = await layerWithBox(drawing.BlendMode.MODULATE);
        expect(diffCount(plain, layered)).assertEqual(76800);
        expect(redAt(layered, 60, 60) < BASE_RED).assertTrue();
        expect(blueAt(layered, 60, 60) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0066
     * @tc.name testComboBlend0006
     * @tc.desc Verify a layer painted with MULTIPLY darkens the square only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0006 begin');
      await runCase('testComboBlend0006', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const buffer: ArrayBuffer = await layerWithBox(drawing.BlendMode.MULTIPLY);
        expect(redAt(buffer, 60, 60) < BASE_RED).assertTrue();
        expect(greenAt(buffer, 60, 60) < BASE_GREEN).assertTrue();
        expect(diffInBox(base, buffer, BOX_R + 5, BOX_T, SIZE, BOX_B)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0067
     * @tc.name testComboBlend0007
     * @tc.desc Verify a layer painted with DST_OUT erases the destination under the square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0007 begin');
      await runCase('testComboBlend0007', async () => {
        const buffer: ArrayBuffer = await layerWithBox(drawing.BlendMode.DST_OUT);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
        expect(alphaAt(buffer, LINE_Y, 10)).assertEqual(255);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE) < SIZE * SIZE - BOX_AREA / 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0068
     * @tc.name testComboBlend0008
     * @tc.desc Verify a layer painted with PLUS brightens the square without touching the rest.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0008 begin');
      await runCase('testComboBlend0008', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const buffer: ArrayBuffer = await layerWithBox(drawing.BlendMode.PLUS);
        expect(redAt(buffer, 60, 60) > BASE_RED).assertTrue();
        expect(blueAt(buffer, 60, 60) > BASE_BLUE).assertTrue();
        expect(diffInBox(base, buffer, 5, 5, BOX_L - 5, SIZE - 5)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0069
     * @tc.name testComboBlend0009
     * @tc.desc Verify a layer painted with SRC_IN keeps the square because the base is opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0009 begin');
      await runCase('testComboBlend0009', async () => {
        const over: ArrayBuffer = await layerWithBox(drawing.BlendMode.SRC_OVER);
        const inside: ArrayBuffer = await layerWithBox(drawing.BlendMode.SRC_IN);
        expect(closeTo(redAt(inside, 60, 60), FG_RED, 2)).assertTrue();
        expect(alphaAt(inside, 60, 60)).assertEqual(255);
        expect(alphaAt(inside, 10, 10)).assertEqual(0);
        expect(redAt(over, 60, 60)).assertEqual(redAt(inside, 60, 60));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0070
     * @tc.name testComboBlend0010
     * @tc.desc Verify a layer painted with LIGHTEN keeps the larger channel of base and square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0010 begin');
      await runCase('testComboBlend0010', async () => {
        const buffer: ArrayBuffer = await layerWithBox(drawing.BlendMode.LIGHTEN);
        expect(closeTo(redAt(buffer, 60, 60), BASE_RED, 2)).assertTrue();
        expect(closeTo(greenAt(buffer, 60, 60), FG_GREEN, 2)).assertTrue();
        expect(closeTo(blueAt(buffer, 60, 60), FG_BLUE, 2)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0071
     * @tc.name testComboBlend0011
     * @tc.desc Verify two adjacent squares darken and brighten their own side only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0011 begin');
      await runCase('testComboBlend0011', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.MULTIPLY, LEFT_L, STRIP_T, LEFT_R, STRIP_B);
        fillRect(target, drawing.BlendMode.SCREEN, RIGHT_L, STRIP_T, RIGHT_R, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, LEFT_ONLY_X, LINE_Y) < BASE_RED).assertTrue();
        expect(redAt(buffer, RIGHT_ONLY_X, LINE_Y) > BASE_RED).assertTrue();
        expect(alphaAt(buffer, LEFT_L - 2, LINE_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0072
     * @tc.name testComboBlend0012
     * @tc.desc Verify two overlapping MULTIPLY squares make the overlap darker than each side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0012 begin');
      await runCase('testComboBlend0012', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.MULTIPLY, LEFT_L, STRIP_T, LEFT_R, STRIP_B);
        fillRect(target, drawing.BlendMode.MULTIPLY, RIGHT_L, STRIP_T, RIGHT_R, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, OVERLAP_X, LINE_Y) < redAt(buffer, LEFT_ONLY_X, LINE_Y)).assertTrue();
        expect(redAt(buffer, OVERLAP_X, LINE_Y) < redAt(buffer, RIGHT_ONLY_X, LINE_Y)).assertTrue();
        expect(redAt(buffer, LEFT_ONLY_X, LINE_Y) < BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0073
     * @tc.name testComboBlend0013
     * @tc.desc Verify two overlapping SCREEN squares brighten the overlap further.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0013 begin');
      await runCase('testComboBlend0013', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.SCREEN, LEFT_L, STRIP_T, LEFT_R, STRIP_B);
        fillRect(target, drawing.BlendMode.SCREEN, RIGHT_L, STRIP_T, RIGHT_R, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, OVERLAP_X, LINE_Y) > redAt(buffer, LEFT_ONLY_X, LINE_Y)).assertTrue();
        expect(greenAt(buffer, OVERLAP_X, LINE_Y) > greenAt(buffer, LEFT_ONLY_X, LINE_Y)).assertTrue();
        expect(redAt(buffer, RIGHT_ONLY_X, LINE_Y) > BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0074
     * @tc.name testComboBlend0014
     * @tc.desc Verify two overlapping DIFFERENCE squares leave a distinct overlap color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0014 begin');
      await runCase('testComboBlend0014', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.DIFFERENCE, LEFT_L, STRIP_T, LEFT_R, STRIP_B);
        fillRect(target, drawing.BlendMode.DIFFERENCE, RIGHT_L, STRIP_T, RIGHT_R, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, OVERLAP_X, LINE_Y) !== redAt(buffer, LEFT_ONLY_X, LINE_Y)).assertTrue();
        expect(redAt(buffer, LEFT_ONLY_X, LINE_Y) !== BASE_RED).assertTrue();
        expect(alphaAt(buffer, OVERLAP_X, LINE_Y)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0075
     * @tc.name testComboBlend0015
     * @tc.desc Verify two overlapping PLUS squares saturate the overlap channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0015 begin');
      await runCase('testComboBlend0015', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.PLUS, LEFT_L, STRIP_T, LEFT_R, STRIP_B);
        fillRect(target, drawing.BlendMode.PLUS, RIGHT_L, STRIP_T, RIGHT_R, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, OVERLAP_X, LINE_Y) >= redAt(buffer, LEFT_ONLY_X, LINE_Y)).assertTrue();
        expect(blueAt(buffer, OVERLAP_X, LINE_Y)).assertEqual(255);
        expect(redAt(buffer, LEFT_ONLY_X, LINE_Y) > BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0076
     * @tc.name testComboBlend0016
     * @tc.desc Verify two overlapping DST_OUT squares erase both the sides and the overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0016 begin');
      await runCase('testComboBlend0016', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.DST_OUT, LEFT_L, STRIP_T, LEFT_R, STRIP_B);
        fillRect(target, drawing.BlendMode.DST_OUT, RIGHT_L, STRIP_T, RIGHT_R, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, LEFT_ONLY_X, LINE_Y)).assertEqual(0);
        expect(alphaAt(buffer, OVERLAP_X, LINE_Y)).assertEqual(0);
        expect(redAt(buffer, SIZE - 5, LINE_Y)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0077
     * @tc.name testComboBlend0017
     * @tc.desc Verify three side by side strips keep the channel order set by their modes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0017 begin');
      await runCase('testComboBlend0017', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.MULTIPLY, 0, STRIP_T, 50, STRIP_B);
        fillRect(target, drawing.BlendMode.SRC_OVER, 55, STRIP_T, 105, STRIP_B);
        fillRect(target, drawing.BlendMode.SCREEN, 110, STRIP_T, SIZE, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        const dark: number = redAt(buffer, 25, LINE_Y);
        const flat: number = redAt(buffer, 80, LINE_Y);
        const bright: number = redAt(buffer, 135, LINE_Y);
        expect(dark < flat).assertTrue();
        expect(flat < bright).assertTrue();
        expect(closeTo(flat, FG_RED, 2)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0078
     * @tc.name testComboBlend0018
     * @tc.desc Verify two vertically overlapping MULTIPLY squares darken their shared rows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0018 begin');
      await runCase('testComboBlend0018', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, 20, BOX_R, 80);
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, 60, BOX_R, 120);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 60, 70) < redAt(buffer, 60, 40)).assertTrue();
        expect(redAt(buffer, 60, 70) < redAt(buffer, 60, 100)).assertTrue();
        expect(alphaAt(buffer, 60, 70)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0079
     * @tc.name testComboBlend0019
     * @tc.desc Verify the darkened column count matches the covered width of both squares.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0019 begin');
      await runCase('testComboBlend0019', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.MULTIPLY, LEFT_L, STRIP_T, LEFT_R, STRIP_B);
        fillRect(target, drawing.BlendMode.MULTIPLY, RIGHT_L, STRIP_T, RIGHT_R, STRIP_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(countRowBelow(buffer, LINE_Y, 0, BASE_RED)).assertEqual(RIGHT_R - LEFT_L);
        expect(countRowBelow(buffer, LINE_Y, 0, 12)).assertEqual(LEFT_R - RIGHT_L);
        expect(countRowBelow(buffer, 10, 0, BASE_RED)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0080
     * @tc.name testComboBlend0020
     * @tc.desc Verify a blended strip keeps the ink area of the unblended strip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0020 begin');
      await runCase('testComboBlend0020', async () => {
        const plain: ArrayBuffer = await baseWithBox(drawing.BlendMode.SRC_OVER);
        const blended: ArrayBuffer = await baseWithBox(drawing.BlendMode.OVERLAY);
        expect(inkBox(blended, 0, 0, SIZE, SIZE)).assertEqual(inkBox(plain, 0, 0, SIZE, SIZE));
        expect(diffInBox(plain, blended, BOX_L, BOX_T, BOX_R, BOX_B) > 0).assertTrue();
        expect(alphaAt(blended, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0081
     * @tc.name testComboBlend0021
     * @tc.desc Verify swapping a SCREEN and a MULTIPLY pass changes the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0021 begin');
      await runCase('testComboBlend0021', async () => {
        const screenFirst: ArrayBuffer = await twoPass(drawing.BlendMode.SCREEN, drawing.BlendMode.MULTIPLY);
        const multiplyFirst: ArrayBuffer = await twoPass(drawing.BlendMode.MULTIPLY, drawing.BlendMode.SCREEN);
        expect(redAt(screenFirst, 60, 60) !== redAt(multiplyFirst, 60, 60)).assertTrue();
        expect(diffCount(screenFirst, multiplyFirst) > 0).assertTrue();
        expect(alphaAt(screenFirst, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0082
     * @tc.name testComboBlend0022
     * @tc.desc Verify a second MULTIPLY pass darkens the result of the first one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0022 begin');
      await runCase('testComboBlend0022', async () => {
        const single: ArrayBuffer = await onePass(drawing.BlendMode.MULTIPLY);
        const twice: ArrayBuffer = await twoPass(drawing.BlendMode.MULTIPLY, drawing.BlendMode.MULTIPLY);
        expect(redAt(twice, 60, 60) < redAt(single, 60, 60)).assertTrue();
        expect(greenAt(twice, 60, 60) < greenAt(single, 60, 60)).assertTrue();
        expect(alphaAt(twice, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0083
     * @tc.name testComboBlend0023
     * @tc.desc Verify two PLUS passes saturate every channel to white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0023 begin');
      await runCase('testComboBlend0023', async () => {
        const buffer: ArrayBuffer = await twoPass(drawing.BlendMode.PLUS, drawing.BlendMode.PLUS);
        expect(redAt(buffer, 60, 60)).assertEqual(255);
        expect(greenAt(buffer, 60, 60)).assertEqual(255);
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0084
     * @tc.name testComboBlend0024
     * @tc.desc Verify the alpha of two translucent SRC_OVER passes exceeds one pass.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0024 begin');
      await runCase('testComboBlend0024', async () => {
        const once: ArrayBuffer = await overlayOnce(80);
        const twice: ArrayBuffer = await overlayTwice(80);
        expect(alphaAt(once, 60, 60)).assertEqual(80);
        expect(alphaAt(twice, 60, 60) > alphaAt(once, 60, 60)).assertTrue();
        expect(alphaAt(twice, 60, 60) < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0085
     * @tc.name testComboBlend0025
     * @tc.desc Verify DST_OVER never changes a canvas that is already opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0025 begin');
      await runCase('testComboBlend0025', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const buffer: ArrayBuffer = await twoPass(drawing.BlendMode.DST_OVER, drawing.BlendMode.DST_OVER);
        expect(diffCount(base, buffer)).assertEqual(0);
        expect(redAt(buffer, 60, 60)).assertEqual(BASE_RED);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(SIZE * SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0086
     * @tc.name testComboBlend0026
     * @tc.desc Verify a second DIFFERENCE pass differs from a single one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0026 begin');
      await runCase('testComboBlend0026', async () => {
        const single: ArrayBuffer = await onePass(drawing.BlendMode.DIFFERENCE);
        const twice: ArrayBuffer = await twoPass(drawing.BlendMode.DIFFERENCE, drawing.BlendMode.DIFFERENCE);
        expect(redAt(twice, 60, 60) !== redAt(single, 60, 60)).assertTrue();
        expect(redAt(twice, 60, 60) !== BASE_RED).assertTrue();
        expect(alphaAt(twice, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0087
     * @tc.name testComboBlend0027
     * @tc.desc Verify a SRC pass followed by SRC_OVER keeps the second color only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0027 begin');
      await runCase('testComboBlend0027', async () => {
        const mixed: ArrayBuffer = await twoPass(drawing.BlendMode.SRC, drawing.BlendMode.SRC_OVER);
        const plain: ArrayBuffer = await twoPass(drawing.BlendMode.SRC, drawing.BlendMode.SRC);
        expect(closeTo(redAt(mixed, 60, 60), SEC_RED, 2)).assertTrue();
        expect(diffCount(mixed, plain) < 100).assertTrue();
        expect(alphaAt(mixed, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0088
     * @tc.name testComboBlend0028
     * @tc.desc Verify MULTIPLY then SCREEN ends brighter than SCREEN then MULTIPLY.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0028 begin');
      await runCase('testComboBlend0028', async () => {
        const darkFirst: ArrayBuffer = await twoPass(drawing.BlendMode.MULTIPLY, drawing.BlendMode.SCREEN);
        const brightFirst: ArrayBuffer = await twoPass(drawing.BlendMode.SCREEN, drawing.BlendMode.MULTIPLY);
        expect(redAt(darkFirst, 60, 60) > redAt(brightFirst, 60, 60)).assertTrue();
        expect(blueAt(darkFirst, 60, 60) > blueAt(brightFirst, 60, 60)).assertTrue();
        expect(alphaAt(darkFirst, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0089
     * @tc.name testComboBlend0029
     * @tc.desc Verify LIGHTEN then DARKEN ends darker than the reversed order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0029 begin');
      await runCase('testComboBlend0029', async () => {
        const darkLast: ArrayBuffer = await twoPass(drawing.BlendMode.LIGHTEN, drawing.BlendMode.DARKEN);
        const lightLast: ArrayBuffer = await twoPass(drawing.BlendMode.DARKEN, drawing.BlendMode.LIGHTEN);
        expect(redAt(darkLast, 60, 60) < redAt(lightLast, 60, 60)).assertTrue();
        expect(diffCount(darkLast, lightLast) > 0).assertTrue();
        expect(alphaAt(lightLast, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0090
     * @tc.name testComboBlend0030
     * @tc.desc Verify a three pass chain depends on the order of its modes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0030 begin');
      await runCase('testComboBlend0030', async () => {
        const rising: ArrayBuffer = await threePass(drawing.BlendMode.SCREEN, drawing.BlendMode.MULTIPLY,
          drawing.BlendMode.PLUS);
        const sinking: ArrayBuffer = await threePass(drawing.BlendMode.MULTIPLY, drawing.BlendMode.SCREEN,
          drawing.BlendMode.DARKEN);
        expect(redAt(rising, 60, 60) > redAt(sinking, 60, 60)).assertTrue();
        expect(diffCount(rising, sinking) > 0).assertTrue();
        expect(alphaAt(rising, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0091
     * @tc.name testComboBlend0031
     * @tc.desc Verify a clipped MULTIPLY square darkens the clipped half only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0031 begin');
      await runCase('testComboBlend0031', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.clipRect(ltrb(0, 0, 80, SIZE));
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, BOX_T, BOX_R, BOX_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 40, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 90, 60)).assertEqual(BASE_RED);
        expect(alphaAt(buffer, 90, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0092
     * @tc.name testComboBlend0032
     * @tc.desc Verify a scaled MULTIPLY square covers four times the blended area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0032 begin');
      await runCase('testComboBlend0032', async () => {
        const short: ArrayBuffer = await baseWithBox(drawing.BlendMode.MULTIPLY);
        const target: OffscreenTarget = await baseTarget();
        target.canvas.scale(2, 2);
        fillRect(target, drawing.BlendMode.MULTIPLY, 10, 10, 70, 70);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(countRowBelow(buffer, LINE_Y, 0, BASE_RED) > countRowBelow(short, LINE_Y, 0, BASE_RED)).assertTrue();
        expect(redAt(buffer, 60, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 10, 10)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0093
     * @tc.name testComboBlend0033
     * @tc.desc Verify a translated MULTIPLY square moves its darkened area to the right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0033 begin');
      await runCase('testComboBlend0033', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.translate(40, 0);
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, BOX_T, BOX_R, BOX_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 30, 60)).assertEqual(BASE_RED);
        expect(redAt(buffer, 80, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 130, 60) < BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0094
     * @tc.name testComboBlend0034
     * @tc.desc Verify a quarter turn moves the blended square to the mirrored position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0034 begin');
      await runCase('testComboBlend0034', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.rotate(90, 80, 80);
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, BOX_T, BOX_R, BOX_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 130, 30) < BASE_RED).assertTrue();
        expect(redAt(buffer, 30, 30)).assertEqual(BASE_RED);
        expect(redAt(buffer, 80, 80) < BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0095
     * @tc.name testComboBlend0035
     * @tc.desc Verify a circular clip confines a MULTIPLY square to the disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0035 begin');
      await runCase('testComboBlend0035', async () => {
        const target: OffscreenTarget = await baseTarget();
        const disc: drawing.Path = new drawing.Path();
        disc.addCircle(80, 80, 50);
        target.canvas.clipPath(disc, drawing.ClipOp.INTERSECT, false);
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, BOX_T, BOX_R, BOX_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 80, 80) < BASE_RED).assertTrue();
        expect(redAt(buffer, 5, 5)).assertEqual(BASE_RED);
        expect(redAt(buffer, 70, 35) < BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0096
     * @tc.name testComboBlend0036
     * @tc.desc Verify two nested clips restrict SCREEN to their intersection.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0036 begin');
      await runCase('testComboBlend0036', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        target.canvas.clipRect(ltrb(50, 0, SIZE, SIZE));
        fillRect(target, drawing.BlendMode.SCREEN, BOX_L, BOX_T, BOX_R, BOX_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 60, 60) > BASE_RED).assertTrue();
        expect(redAt(buffer, 40, 60)).assertEqual(BASE_RED);
        expect(redAt(buffer, 95, 60) > BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0097
     * @tc.name testComboBlend0037
     * @tc.desc Verify a restore drops the clip before the next blended square is drawn.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0037 begin');
      await runCase('testComboBlend0037', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 80, SIZE));
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, BOX_T, BOX_R, BOX_B);
        target.canvas.restore();
        fillRect(target, drawing.BlendMode.SCREEN, 110, BOX_T, 150, BOX_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 40, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 130, 60) > BASE_RED).assertTrue();
        expect(redAt(buffer, 105, 60)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0098
     * @tc.name testComboBlend0038
     * @tc.desc Verify a scaled MULTIPLY pen thickens the darkened rows of its stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0038 begin');
      await runCase('testComboBlend0038', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.scale(2, 2);
        target.canvas.attachPen(penOf(drawing.BlendMode.MULTIPLY, 10));
        target.canvas.drawLine(40, LINE_Y / 2, 120, LINE_Y / 2);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(countColumnBelow(buffer, 80, 0, BASE_RED)).assertEqual(20);
        expect(redAt(buffer, 80, LINE_Y) < BASE_RED).assertTrue();
        expect(redAt(buffer, 80, 20)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0099
     * @tc.name testComboBlend0039
     * @tc.desc Verify a clipped layer painted with MULTIPLY stays inside the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0039 begin');
      await runCase('testComboBlend0039', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const target: OffscreenTarget = await baseTarget();
        target.canvas.clipRect(ltrb(0, 0, 80, SIZE));
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.MULTIPLY));
        fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 40, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 90, 60)).assertEqual(BASE_RED);
        expect(diffInBox(base, buffer, 80, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0100
     * @tc.name testComboBlend0040
     * @tc.desc Verify a clipped blended square keeps the clipped ink area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0040 begin');
      await runCase('testComboBlend0040', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.clipRect(ltrb(0, 0, 80, SIZE));
        fillRect(target, drawing.BlendMode.MULTIPLY, BOX_L, BOX_T, BOX_R, BOX_B);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, 80, SIZE)).assertEqual(80 * SIZE);
        expect(countRowBelow(buffer, 60, 0, BASE_RED)).assertEqual(60);
        expect(redAt(buffer, 90, 60)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0101
     * @tc.name testComboBlend0041
     * @tc.desc Verify a translucent SRC_OVER lands between the background and the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0041 begin');
      await runCase('testComboBlend0041', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.SRC_OVER, 128);
        expect(redAt(buffer, 60, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 60, 60) > FG_RED).assertTrue();
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0102
     * @tc.name testComboBlend0042
     * @tc.desc Verify a translucent SRC keeps the source color at its own alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0042 begin');
      await runCase('testComboBlend0042', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.SRC, 128);
        expect(closeTo(alphaAt(buffer, 60, 60), 128, 2)).assertTrue();
        expect(redAt(buffer, 60, 60)).assertEqual(20);
        expect(blueAt(buffer, 60, 60)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0103
     * @tc.name testComboBlend0043
     * @tc.desc Verify a translucent SRC_IN scales the source alpha by the opaque destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0043 begin');
      await runCase('testComboBlend0043', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.SRC_IN, 128);
        expect(closeTo(alphaAt(buffer, 60, 60), 128, 2)).assertTrue();
        expect(redAt(buffer, 60, 60)).assertEqual(20);
        expect(redAt(buffer, 60, 60) !== BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0104
     * @tc.name testComboBlend0044
     * @tc.desc Verify a translucent DST_IN keeps the destination color at the source alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0044 begin');
      await runCase('testComboBlend0044', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.DST_IN, 128);
        expect(closeTo(alphaAt(buffer, 60, 60), 128, 3)).assertTrue();
        expect(redAt(buffer, 60, 60)).assertEqual(80);
        expect(greenAt(buffer, 60, 60)).assertEqual(45);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0105
     * @tc.name testComboBlend0045
     * @tc.desc Verify a translucent SRC_OUT yields nothing over an opaque destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0045 begin');
      await runCase('testComboBlend0045', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.SRC_OUT, 128);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(0);
        expect(redAt(buffer, 60, 60) !== BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0106
     * @tc.name testComboBlend0046
     * @tc.desc Verify a translucent DST_OUT dims the destination by the source alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0046 begin');
      await runCase('testComboBlend0046', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.DST_OUT, 128);
        expect(closeTo(alphaAt(buffer, 60, 60), 127, 3)).assertTrue();
        expect(redAt(buffer, 60, 60)).assertEqual(80);
        expect(alphaAt(buffer, 60, 60) < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0107
     * @tc.name testComboBlend0047
     * @tc.desc Verify a translucent SRC_ATOP keeps the destination alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0047 begin');
      await runCase('testComboBlend0047', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.SRC_ATOP, 128);
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
        expect(redAt(buffer, 60, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 60, 60) > FG_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0108
     * @tc.name testComboBlend0048
     * @tc.desc Verify a translucent DST_ATOP fades the destination while SRC_ATOP tints it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0048 begin');
      await runCase('testComboBlend0048', async () => {
        const faded: ArrayBuffer = await blendAlpha(drawing.BlendMode.DST_ATOP, 128);
        const tinted: ArrayBuffer = await blendAlpha(drawing.BlendMode.SRC_ATOP, 128);
        expect(redAt(faded, 60, 60)).assertEqual(80);
        expect(alphaAt(faded, 60, 60) < 255).assertTrue();
        expect(redAt(tinted, 60, 60) < BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0109
     * @tc.name testComboBlend0049
     * @tc.desc Verify a translucent XOR drops the alpha below both operands.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0049 begin');
      await runCase('testComboBlend0049', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.XOR, 128);
        expect(alphaAt(buffer, 60, 60) < 255).assertTrue();
        expect(alphaAt(buffer, 60, 60) > 0).assertTrue();
        expect(redAt(buffer, 60, 60)).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0110
     * @tc.name testComboBlend0050
     * @tc.desc Verify a translucent PLUS adds the scaled source to the destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0050 begin');
      await runCase('testComboBlend0050', async () => {
        const buffer: ArrayBuffer = await blendAlpha(drawing.BlendMode.PLUS, 128);
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
        expect(redAt(buffer, 60, 60) > BASE_RED).assertTrue();
        expect(blueAt(buffer, 60, 60) > BASE_BLUE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0111
     * @tc.name testComboBlend0051
     * @tc.desc Verify an inner SCREEN layer does not change the result of the outer MULTIPLY layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0051 begin');
      await runCase('testComboBlend0051', async () => {
        const single: ArrayBuffer = await layerWithBox(drawing.BlendMode.MULTIPLY);
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.MULTIPLY));
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.SCREEN));
        fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(diffCount(single, buffer) < 100).assertTrue();
        expect(redAt(buffer, 60, 60) < BASE_RED).assertTrue();
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0112
     * @tc.name testComboBlend0052
     * @tc.desc Verify restoreToCount closes a CLEAR layer and a DST layer at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0052 begin');
      await runCase('testComboBlend0052', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.CLEAR));
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.DST));
        fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.restoreToCount(1);
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(diffCount(base, buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0113
     * @tc.name testComboBlend0053
     * @tc.desc Verify a clip inside the layer bounds the area that the layer blends.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0053 begin');
      await runCase('testComboBlend0053', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.MULTIPLY));
        target.canvas.clipRect(ltrb(0, 0, 80, SIZE));
        fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 40, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 90, 60)).assertEqual(BASE_RED);
        expect(alphaAt(buffer, 90, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0114
     * @tc.name testComboBlend0054
     * @tc.desc Verify a layer blend and a pen blend coexist on the same canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0054 begin');
      await runCase('testComboBlend0054', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.MULTIPLY));
        fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.restore();
        target.canvas.attachPen(penOf(drawing.BlendMode.SCREEN, 12));
        target.canvas.drawLine(20, 130, 140, 130);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 60, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 80, 130) > BASE_RED).assertTrue();
        expect(alphaAt(buffer, 80, 130)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0115
     * @tc.name testComboBlend0055
     * @tc.desc Verify a CLEAR layer bounded to the left half also wipes what was painted there.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0055 begin');
      await runCase('testComboBlend0055', async () => {
        const target: OffscreenTarget = await baseTarget();
        fillRect(target, drawing.BlendMode.SRC_OVER, 10, 10, 60, 60);
        target.canvas.saveLayer(ltrb(0, 0, 80, SIZE), layerBrush(drawing.BlendMode.CLEAR));
        fillRect(target, drawing.BlendMode.SRC_OVER, 100, 100, 150, 150);
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 35, 35)).assertEqual(0);
        expect(alphaAt(buffer, 125, 125)).assertEqual(0);
        expect(redAt(buffer, 125, 125)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0116
     * @tc.name testComboBlend0056
     * @tc.desc Verify a translucent MULTIPLY layer darkens less than an opaque one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0056 begin');
      await runCase('testComboBlend0056', async () => {
        const opaque: ArrayBuffer = await layerWithBox(drawing.BlendMode.MULTIPLY);
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrushWith(128, drawing.BlendMode.MULTIPLY));
        fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 60, 60) > redAt(opaque, 60, 60)).assertTrue();
        expect(redAt(buffer, 60, 60) < BASE_RED).assertTrue();
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0117
     * @tc.name testComboBlend0057
     * @tc.desc Verify two sequentially restored layers clear only the bounded left half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0057 begin');
      await runCase('testComboBlend0057', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(ltrb(0, 0, 80, SIZE), layerBrush(drawing.BlendMode.CLEAR));
        fillRect(target, drawing.BlendMode.SRC_OVER, 10, 10, 60, 60);
        target.canvas.restore();
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.DST));
        fillRect(target, drawing.BlendMode.SRC_OVER, 100, 100, 150, 150);
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, 80, SIZE)).assertEqual(0);
        expect(inkBox(buffer, 80, 0, SIZE, SIZE)).assertEqual(0);
        expect(redAt(buffer, 125, 125)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0118
     * @tc.name testComboBlend0058
     * @tc.desc Verify a translated square inside a MULTIPLY layer blends at its new place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0058 begin');
      await runCase('testComboBlend0058', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.MULTIPLY));
        target.canvas.translate(40, 0);
        fillBox(target, fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 30, 60)).assertEqual(BASE_RED);
        expect(redAt(buffer, 80, 60) < BASE_RED).assertTrue();
        expect(redAt(buffer, 130, 60) < BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0119
     * @tc.name testComboBlend0059
     * @tc.desc Verify rebinding a brush inside a MULTIPLY layer keeps the layer mode.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboBlend0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0059 begin');
      await runCase('testComboBlend0059', async () => {
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrush(drawing.BlendMode.MULTIPLY));
        fillRect(target, drawing.BlendMode.SRC_OVER, 20, 20, 60, 60);
        target.canvas.attachBrush(fgBrush(drawing.BlendMode.SRC_OVER));
        target.canvas.drawRect(100, 100, 140, 140);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(redAt(buffer, 40, 40) < BASE_RED).assertTrue();
        expect(redAt(buffer, 120, 120) < BASE_RED).assertTrue();
        expect(redAt(buffer, 80, 80)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0120
     * @tc.name testComboBlend0060
     * @tc.desc Verify a blended layer on one canvas leaves a second canvas untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboBlend0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0060 begin');
      await runCase('testComboBlend0060', async () => {
        const blended: OffscreenTarget = await baseTarget();
        const plain: OffscreenTarget = await baseTarget();
        blended.canvas.saveLayer(null, layerBrush(drawing.BlendMode.MULTIPLY));
        fillBox(blended, fgBrush(drawing.BlendMode.SRC_OVER));
        blended.canvas.restore();
        const left: ArrayBuffer = await pixelsOf(blended);
        const right: ArrayBuffer = await pixelsOf(plain);
        expect(diffCount(left, right) > 0).assertTrue();
        expect(redAt(right, 60, 60)).assertEqual(BASE_RED);
        expect(redAt(left, 60, 60) < BASE_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboBlend0060 end');
    });
  });
}
