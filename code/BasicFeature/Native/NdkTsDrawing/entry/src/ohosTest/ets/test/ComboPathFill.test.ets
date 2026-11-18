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
import { DRAWING_TAG, iteratorPoints, readPixelBuffer, runCase } from './DrawingTestRunner';

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
 * Count painted pixels inside one rectangle of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of pixels with a non-zero alpha.
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
 * Count painted pixels of one row across the whole canvas width.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } y - Row to scan.
 * @returns { number } Number of painted pixels in the row.
 */
function inkRow(buffer: ArrayBuffer, y: number): number {
  return inkBox(buffer, 0, y, SIZE, y + 1);
}

/**
 * Count the bytes that differ between two equally sized buffers.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @returns { number } Number of differing bytes.
 */
function diffAll(first: ArrayBuffer, second: ArrayBuffer): number {
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
function diffBox(first: ArrayBuffer, second: ArrayBuffer, left: number, top: number,
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
 * Compare two numbers with a small slack for rasterisation rounding.
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
 * Create a canvas painted with the opaque background color.
 *
 * @returns { Promise<OffscreenTarget> } Background target.
 */
async function baseTarget(): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await blankOf();
  target.canvas.drawColor(rgba(255, BASE_RED, BASE_GREEN, BASE_BLUE), drawing.BlendMode.SRC);
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
 * Build a hard edged brush painting the foreground color.
 *
 * @returns { drawing.Brush } Configured brush.
 */
function fillBrush(): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
  brush.setAntiAlias(false);
  return brush;
}

/**
 * Build a hard edged brush painting the foreground color with one alpha.
 *
 * @param { number } alpha - Alpha channel of the fill.
 * @returns { drawing.Brush } Configured brush.
 */
function fillBrushWith(alpha: number): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, FG_RED, FG_GREEN, FG_BLUE));
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
 * Build a hard edged pen painting the foreground color.
 *
 * @param { number } width - Stroke width in pixels.
 * @returns { drawing.Pen } Configured pen.
 */
function strokePen(width: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, FG_RED, FG_GREEN, FG_BLUE));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Build a hard edged pen with one alpha.
 *
 * @param { number } width - Stroke width in pixels.
 * @param { number } alpha - Alpha channel of the stroke.
 * @returns { drawing.Pen } Configured pen.
 */
function strokePenWith(width: number, alpha: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(alpha, FG_RED, FG_GREEN, FG_BLUE));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Fill one path with one brush.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.Path } path - Path to fill.
 * @param { drawing.Brush } brush - Brush carrying color and alpha.
 */
function fillPath(target: OffscreenTarget, path: drawing.Path, brush: drawing.Brush): void {
  target.canvas.attachBrush(brush);
  target.canvas.drawPath(path);
  target.canvas.detachBrush();
}

/**
 * Stroke one path with one pen.
 *
 * @param { OffscreenTarget } target - Offscreen target.
 * @param { drawing.Path } path - Path to stroke.
 * @param { drawing.Pen } pen - Pen carrying color, width and style.
 */
function strokePath(target: OffscreenTarget, path: drawing.Path, pen: drawing.Pen): void {
  target.canvas.attachPen(pen);
  target.canvas.drawPath(path);
  target.canvas.detachPen();
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
function discPath(centerX: number, centerY: number, radius: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(centerX, centerY, radius, drawing.PathDirection.CLOCKWISE);
  return path;
}

/**
 * Fill one path on an empty canvas.
 *
 * @param { drawing.Path } path - Path to fill.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillOnBlank(path: drawing.Path): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await blankOf();
  fillPath(target, path, fillBrush());
  return await pixelsOf(target);
}

/**
 * Fill one path over the opaque background.
 *
 * @param { drawing.Path } path - Path to fill.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillOnBase(path: drawing.Path): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  fillPath(target, path, fillBrush());
  return await pixelsOf(target);
}

/**
 * Fill one path with one alpha over the opaque background.
 *
 * @param { drawing.Path } path - Path to fill.
 * @param { number } alpha - Alpha channel of the fill.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillOnBaseAlpha(path: drawing.Path, alpha: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  fillPath(target, path, fillBrushWith(alpha));
  return await pixelsOf(target);
}

/**
 * Stroke one path over the opaque background.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { number } width - Stroke width in pixels.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeOnBase(path: drawing.Path, width: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  strokePath(target, path, strokePen(width));
  return await pixelsOf(target);
}

/**
 * Stroke one path on an empty canvas.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { number } width - Stroke width in pixels.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeOnBlank(path: drawing.Path, width: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await blankOf();
  strokePath(target, path, strokePen(width));
  return await pixelsOf(target);
}

/**
 * Build a hard edged pen painting the alternate color.
 *
 * @param { number } width - Stroke width in pixels.
 * @returns { drawing.Pen } Configured pen.
 */
function altPen(width: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, ALT_RED, ALT_GREEN, ALT_BLUE));
  pen.setStrokeWidth(width);
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Stroke one path on an empty canvas with one prepared pen.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { drawing.Pen } pen - Pen carrying color, width and style.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeWithPen(path: drawing.Path, pen: drawing.Pen): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await blankOf();
  strokePath(target, path, pen);
  return await pixelsOf(target);
}

/**
 * Build a white layer brush with one alpha applied when the layer is composited.
 *
 * @param { number } alpha - Alpha of the layer paint.
 * @returns { drawing.Brush } Configured layer brush.
 */
function layerBrushWith(alpha: number): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, 255, 255, 255));
  brush.setAntiAlias(false);
  return brush;
}

export default function comboPathFillTest() {
  describe('ComboPathFillTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0121
     * @tc.name testComboPath0001
     * @tc.desc Verify a filled rectangle path inks exactly its pixel area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0001 begin');
      await runCase('testComboPath0001', async () => {
        const buffer: ArrayBuffer = await fillOnBlank(rectPath(20, 20, 120, 120));
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(10000);
        expect(alphaAt(buffer, 70, 70)).assertEqual(255);
        expect(alphaAt(buffer, 10, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0001 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0122
     * @tc.name testComboPath0002
     * @tc.desc Verify a filled circle path inks about pi times the squared radius.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0002 begin');
      await runCase('testComboPath0002', async () => {
        const buffer: ArrayBuffer = await fillOnBlank(discPath(100, 100, 50));
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(ink > 7400).assertTrue();
        expect(ink < 8300).assertTrue();
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 5, 5)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0002 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0123
     * @tc.name testComboPath0003
     * @tc.desc Verify EVEN_ODD turns two same direction circles into a ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0003 begin');
      await runCase('testComboPath0003', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 60);
        path.addCircle(100, 100, 30);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
        expect(alphaAt(buffer, 100, 45)).assertEqual(255);
        expect(ink > 7600).assertTrue();
        expect(ink < 9200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0003 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0124
     * @tc.name testComboPath0004
     * @tc.desc Verify INVERSE_WINDING inks the canvas around the circle instead of the circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0004 begin');
      await runCase('testComboPath0004', async () => {
        const path: drawing.Path = discPath(100, 100, 40);
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
        expect(alphaAt(buffer, 10, 10)).assertEqual(255);
        expect(ink > 33000).assertTrue();
        expect(ink < 36000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0004 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0125
     * @tc.name testComboPath0005
     * @tc.desc Verify the filled triangle agrees with Path.contains at three points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0005 begin');
      await runCase('testComboPath0005', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(40, 40);
        path.lineTo(160, 40);
        path.lineTo(100, 160);
        path.close();
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(path.contains(100, 60)).assertTrue();
        expect(alphaAt(buffer, 100, 60)).assertEqual(255);
        expect(path.contains(50, 120)).assertFalse();
        expect(alphaAt(buffer, 50, 120)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0005 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0126
     * @tc.name testComboPath0006
     * @tc.desc Verify two overlapping clockwise rectangles fill their union once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0006 begin');
      await runCase('testComboPath0006', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 120, 120));
        path.addRect(ltrb(80, 80, 180, 180));
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(18400);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 10, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0006 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0127
     * @tc.name testComboPath0007
     * @tc.desc Verify a counter clockwise inner rectangle punches a hole under WINDING.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0007 begin');
      await runCase('testComboPath0007', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 120, 120));
        path.addRect(ltrb(50, 50, 90, 90), drawing.PathDirection.COUNTER_CLOCKWISE);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(alphaAt(buffer, 70, 70)).assertEqual(0);
        expect(alphaAt(buffer, 30, 30)).assertEqual(255);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(8400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0007 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0128
     * @tc.name testComboPath0008
     * @tc.desc Verify a nested clockwise rectangle adds no hole because the winding is two.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0008 begin');
      await runCase('testComboPath0008', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 120, 120));
        path.addRect(ltrb(50, 50, 90, 90));
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(alphaAt(buffer, 70, 70)).assertEqual(255);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(10000);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0008 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0129
     * @tc.name testComboPath0009
     * @tc.desc Verify a half transparent path fill blends between the background and the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0009 begin');
      await runCase('testComboPath0009', async () => {
        const buffer: ArrayBuffer = await fillOnBaseAlpha(rectPath(20, 20, 120, 120), 128);
        expect(alphaAt(buffer, 70, 70)).assertEqual(255);
        expect(redAt(buffer, 70, 70) > BASE_RED).assertTrue();
        expect(redAt(buffer, 70, 70) < FG_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0009 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0130
     * @tc.name testComboPath0010
     * @tc.desc Verify a zero alpha path fill leaves the background untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPath0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0010 begin');
      await runCase('testComboPath0010', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const buffer: ArrayBuffer = await fillOnBaseAlpha(rectPath(20, 20, 120, 120), 0);
        expect(diffAll(base, buffer)).assertEqual(0);
        expect(redAt(buffer, 70, 70)).assertEqual(BASE_RED);
        expect(alphaAt(buffer, 70, 70)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0010 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0131
     * @tc.name testComboPath0011
     * @tc.desc Verify a stroked horizontal path inks its width times its length plus nothing else.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0011 begin');
      await runCase('testComboPath0011', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 100);
        path.lineTo(150, 100);
        const buffer: ArrayBuffer = await strokeOnBlank(path, 10);
        expect(inkRow(buffer, 100) > 95).assertTrue();
        expect(inkRow(buffer, 100) < 115).assertTrue();
        expect(inkRow(buffer, 70)).assertEqual(0);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0011 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0132
     * @tc.name testComboPath0012
     * @tc.desc Verify doubling the stroke width roughly doubles the inked pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0012 begin');
      await runCase('testComboPath0012', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 100);
        path.lineTo(150, 100);
        const narrow: ArrayBuffer = await strokeOnBlank(path, 10);
        const wide: ArrayBuffer = await strokeOnBlank(path, 20);
        const narrowInk: number = inkBox(narrow, 0, 0, SIZE, SIZE);
        const wideInk: number = inkBox(wide, 0, 0, SIZE, SIZE);
        expect(wideInk > narrowInk * 1.7).assertTrue();
        expect(wideInk < narrowInk * 2.3).assertTrue();
        expect(inkRow(wide, 100) >= inkRow(narrow, 100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0012 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0133
     * @tc.name testComboPath0013
     * @tc.desc Verify SQUARE_CAP extends an open stroke beyond its end points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0013 begin');
      await runCase('testComboPath0013', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 100);
        path.lineTo(150, 100);
        const flatPen: drawing.Pen = strokePen(10);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const squarePen: drawing.Pen = strokePen(10);
        squarePen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        const flat: ArrayBuffer = await strokeWithPen(path, flatPen);
        const square: ArrayBuffer = await strokeWithPen(path, squarePen);
        expect(inkRow(square, 100) > inkRow(flat, 100)).assertTrue();
        expect(alphaAt(square, 46, 100)).assertEqual(255);
        expect(alphaAt(flat, 46, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0013 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0134
     * @tc.name testComboPath0014
     * @tc.desc Verify MITER_JOIN fills the outer corner that ROUND_JOIN leaves empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0014 begin');
      await runCase('testComboPath0014', async () => {
        const angle: drawing.Path = new drawing.Path();
        angle.moveTo(60, 60);
        angle.lineTo(120, 60);
        angle.lineTo(120, 120);
        const miterPen: drawing.Pen = strokePen(20);
        miterPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        const roundPen: drawing.Pen = strokePen(20);
        roundPen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        const miter: ArrayBuffer = await strokeWithPen(angle, miterPen);
        const round: ArrayBuffer = await strokeWithPen(angle, roundPen);
        expect(alphaAt(miter, 128, 52)).assertEqual(255);
        expect(alphaAt(round, 128, 52)).assertEqual(0);
        expect(inkBox(miter, 0, 0, SIZE, SIZE) > inkBox(round, 0, 0, SIZE, SIZE)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0014 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0135
     * @tc.name testComboPath0015
     * @tc.desc Verify a miter limit below the corner ratio falls back to a flat join.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0015 begin');
      await runCase('testComboPath0015', async () => {
        const angle: drawing.Path = new drawing.Path();
        angle.moveTo(60, 60);
        angle.lineTo(120, 60);
        angle.lineTo(120, 120);
        const widePen: drawing.Pen = strokePen(20);
        widePen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        widePen.setMiterLimit(10);
        const tightPen: drawing.Pen = strokePen(20);
        tightPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        tightPen.setMiterLimit(1);
        const wide: ArrayBuffer = await strokeWithPen(angle, widePen);
        const tight: ArrayBuffer = await strokeWithPen(angle, tightPen);
        expect(alphaAt(wide, 128, 52)).assertEqual(255);
        expect(alphaAt(tight, 128, 52)).assertEqual(0);
        expect(inkBox(wide, 0, 0, SIZE, SIZE) > inkBox(tight, 0, 0, SIZE, SIZE)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0015 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0136
     * @tc.name testComboPath0016
     * @tc.desc Verify a dash path effect cuts the inked length of a stroked path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0016 begin');
      await runCase('testComboPath0016', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.lineTo(180, 100);
        const solid: ArrayBuffer = await strokeOnBlank(path, 10);
        const dashPen: drawing.Pen = strokePen(10);
        dashPen.setPathEffect(drawing.PathEffect.createDashPathEffect([20, 20], 0));
        const dashed: ArrayBuffer = await strokeWithPen(path, dashPen);
        expect(inkRow(dashed, 100) < inkRow(solid, 100) * 0.75).assertTrue();
        expect(inkRow(dashed, 100) > 40).assertTrue();
        expect(inkBox(dashed, 0, 0, SIZE, SIZE) > 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0016 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0137
     * @tc.name testComboPath0017
     * @tc.desc Verify a stroked circle inks its circumference but not its centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0017 begin');
      await runCase('testComboPath0017', async () => {
        const buffer: ArrayBuffer = await strokeOnBlank(discPath(100, 100, 50), 10);
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(ink > 2600).assertTrue();
        expect(ink < 3800).assertTrue();
        expect(alphaAt(buffer, 150, 100)).assertEqual(255);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0017 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0138
     * @tc.name testComboPath0018
     * @tc.desc Verify a stroke drawn after a fill keeps the fill centre and paints the rim.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0018 begin');
      await runCase('testComboPath0018', async () => {
        const target: OffscreenTarget = await blankOf();
        fillPath(target, rectPath(40, 40, 160, 160), fillBrush());
        const fillOnly: ArrayBuffer = await pixelsOf(target);
        strokePath(target, rectPath(40, 40, 160, 160), altPen(10));
        const combined: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(fillOnly, 0, 0, SIZE, SIZE)).assertEqual(14400);
        expect(greenAt(combined, 40, 100)).assertEqual(ALT_GREEN);
        expect(greenAt(combined, 100, 100)).assertEqual(FG_GREEN);
        expect(inkBox(combined, 0, 0, SIZE, SIZE) > 14400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0018 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0139
     * @tc.name testComboPath0019
     * @tc.desc Verify a half transparent stroke blends with the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0019 begin');
      await runCase('testComboPath0019', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 100);
        path.lineTo(150, 100);
        const target: OffscreenTarget = await baseTarget();
        strokePath(target, path, strokePenWith(10, 128));
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(redAt(buffer, 100, 100) > BASE_RED).assertTrue();
        expect(redAt(buffer, 100, 100) < FG_RED).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0019 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0140
     * @tc.name testComboPath0020
     * @tc.desc Verify a scaled canvas doubles both the stroke length and its width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0020 begin');
      await runCase('testComboPath0020', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 50);
        path.lineTo(70, 50);
        const target: OffscreenTarget = await blankOf();
        target.canvas.scale(2, 2);
        strokePath(target, path, strokePen(5));
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkRow(buffer, 100) > 95).assertTrue();
        expect(inkRow(buffer, 100) < 115).assertTrue();
        expect(alphaAt(buffer, 138, 100)).assertEqual(255);
        expect(alphaAt(buffer, 160, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0020 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0141
     * @tc.name testComboPath0021
     * @tc.desc Verify UNION keeps both disjoint rectangles and nothing between them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0021 begin');
      await runCase('testComboPath0021', async () => {
        const first: drawing.Path = rectPath(20, 20, 80, 80);
        const united: boolean = first.op(rectPath(120, 20, 180, 80), drawing.PathOp.UNION);
        const buffer: ArrayBuffer = await fillOnBlank(first);
        expect(united).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(7200);
        expect(alphaAt(buffer, 50, 50)).assertEqual(255);
        expect(alphaAt(buffer, 100, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0021 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0142
     * @tc.name testComboPath0022
     * @tc.desc Verify INTERSECT keeps exactly the overlapping area of two rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0022 begin');
      await runCase('testComboPath0022', async () => {
        const first: drawing.Path = rectPath(20, 20, 100, 100);
        first.op(rectPath(60, 60, 140, 140), drawing.PathOp.INTERSECT);
        const buffer: ArrayBuffer = await fillOnBlank(first);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(1600);
        expect(alphaAt(buffer, 80, 80)).assertEqual(255);
        expect(alphaAt(buffer, 40, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0022 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0143
     * @tc.name testComboPath0023
     * @tc.desc Verify DIFFERENCE removes the overlap from the left rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0023 begin');
      await runCase('testComboPath0023', async () => {
        const first: drawing.Path = rectPath(20, 20, 100, 100);
        first.op(rectPath(60, 60, 140, 140), drawing.PathOp.DIFFERENCE);
        const buffer: ArrayBuffer = await fillOnBlank(first);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(4800);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
        expect(alphaAt(buffer, 80, 80)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0023 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0144
     * @tc.name testComboPath0024
     * @tc.desc Verify XOR keeps both rectangles but drops their overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0024 begin');
      await runCase('testComboPath0024', async () => {
        const first: drawing.Path = rectPath(20, 20, 100, 100);
        first.op(rectPath(60, 60, 140, 140), drawing.PathOp.XOR);
        const buffer: ArrayBuffer = await fillOnBlank(first);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(9600);
        expect(alphaAt(buffer, 80, 80)).assertEqual(0);
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
        expect(alphaAt(buffer, 120, 120)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0024 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0145
     * @tc.name testComboPath0025
     * @tc.desc Verify REVERSE_DIFFERENCE removes the overlap from the right rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0025 begin');
      await runCase('testComboPath0025', async () => {
        const first: drawing.Path = rectPath(20, 20, 100, 100);
        first.op(rectPath(60, 60, 140, 140), drawing.PathOp.REVERSE_DIFFERENCE);
        const buffer: ArrayBuffer = await fillOnBlank(first);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(4800);
        expect(alphaAt(buffer, 120, 120)).assertEqual(255);
        expect(alphaAt(buffer, 40, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0025 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0146
     * @tc.name testComboPath0026
     * @tc.desc Verify an empty path takes the other operand for UNION and nothing for INTERSECT.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0026 begin');
      await runCase('testComboPath0026', async () => {
        const united: drawing.Path = new drawing.Path();
        expect(united.isEmpty()).assertTrue();
        united.op(rectPath(20, 20, 100, 100), drawing.PathOp.UNION);
        const buffer: ArrayBuffer = await fillOnBlank(united);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(6400);
        const hollow: drawing.Path = new drawing.Path();
        hollow.op(rectPath(20, 20, 100, 100), drawing.PathOp.INTERSECT);
        const second: ArrayBuffer = await fillOnBlank(hollow);
        expect(inkBox(second, 0, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0026 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0147
     * @tc.name testComboPath0027
     * @tc.desc Verify the DIFFERENCE result agrees with Path.contains at both sides.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0027 begin');
      await runCase('testComboPath0027', async () => {
        const first: drawing.Path = rectPath(20, 20, 100, 100);
        first.op(rectPath(60, 60, 140, 140), drawing.PathOp.DIFFERENCE);
        const buffer: ArrayBuffer = await fillOnBlank(first);
        expect(first.contains(40, 40)).assertTrue();
        expect(first.contains(80, 80)).assertFalse();
        expect(alphaAt(buffer, 40, 40)).assertEqual(255);
        expect(alphaAt(buffer, 80, 80)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0027 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0148
     * @tc.name testComboPath0028
     * @tc.desc Verify a UNION followed by an INTERSECT leaves only the middle band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0028 begin');
      await runCase('testComboPath0028', async () => {
        const shape: drawing.Path = rectPath(20, 20, 100, 100);
        shape.op(rectPath(60, 20, 140, 100), drawing.PathOp.UNION);
        shape.op(rectPath(40, 20, 120, 140), drawing.PathOp.INTERSECT);
        const buffer: ArrayBuffer = await fillOnBlank(shape);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(6400);
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
        expect(alphaAt(buffer, 130, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0028 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0149
     * @tc.name testComboPath0029
     * @tc.desc Verify a circle intersected with a square loses its four corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0029 begin');
      await runCase('testComboPath0029', async () => {
        const shape: drawing.Path = discPath(100, 100, 50);
        shape.op(rectPath(60, 60, 140, 140), drawing.PathOp.INTERSECT);
        const buffer: ArrayBuffer = await fillOnBlank(shape);
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 62, 62)).assertEqual(0);
        expect(ink > 4800).assertTrue();
        expect(ink < 6600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0029 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0150
     * @tc.name testComboPath0030
     * @tc.desc Verify the union result only changes the pixels outside the first rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0030 begin');
      await runCase('testComboPath0030', async () => {
        const plain: ArrayBuffer = await fillOnBlank(rectPath(20, 20, 100, 100));
        const shape: drawing.Path = rectPath(20, 20, 100, 100);
        shape.op(rectPath(60, 60, 140, 140), drawing.PathOp.UNION);
        const united: ArrayBuffer = await fillOnBlank(shape);
        expect(diffBox(plain, united, 100, 100, 140, 140) > 0).assertTrue();
        expect(diffBox(plain, united, 20, 20, 60, 60)).assertEqual(0);
        expect(alphaAt(united, 120, 120)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0030 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0151
     * @tc.name testComboPath0031
     * @tc.desc Verify a translated path fills the shifted rectangle and leaves the old one empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0031 begin');
      await runCase('testComboPath0031', async () => {
        const path: drawing.Path = rectPath(20, 20, 70, 70);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(60, 40);
        path.transform(shift);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(alphaAt(buffer, 100, 90)).assertEqual(255);
        expect(alphaAt(buffer, 40, 40)).assertEqual(0);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(2500);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0031 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0152
     * @tc.name testComboPath0032
     * @tc.desc Verify a path scaled by two covers four times its own area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0032 begin');
      await runCase('testComboPath0032', async () => {
        const path: drawing.Path = rectPath(20, 20, 70, 70);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        path.transform(zoom);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(10000);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 30, 30)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0032 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0153
     * @tc.name testComboPath0033
     * @tc.desc Verify a scaled canvas paints the same pixels as a scaled path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0033 begin');
      await runCase('testComboPath0033', async () => {
        const target: OffscreenTarget = await blankOf();
        target.canvas.scale(2, 2);
        fillPath(target, rectPath(20, 20, 70, 70), fillBrush());
        const scaled: ArrayBuffer = await pixelsOf(target);
        const moved: drawing.Path = rectPath(20, 20, 70, 70);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        moved.transform(zoom);
        const transformed: ArrayBuffer = await fillOnBlank(moved);
        expect(diffAll(scaled, transformed)).assertEqual(0);
        expect(alphaAt(scaled, 100, 100)).assertEqual(255);
        expect(alphaAt(scaled, 30, 30)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0033 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0154
     * @tc.name testComboPath0034
     * @tc.desc Verify a quarter turn swaps the width and the height of the filled area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0034 begin');
      await runCase('testComboPath0034', async () => {
        const target: OffscreenTarget = await blankOf();
        target.canvas.rotate(90, 100, 100);
        fillPath(target, rectPath(30, 60, 90, 100), fillBrush());
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(2400);
        expect(alphaAt(buffer, 120, 60)).assertEqual(255);
        expect(alphaAt(buffer, 60, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0034 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0155
     * @tc.name testComboPath0035
     * @tc.desc Verify offset returns a new path and leaves the original in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0035 begin');
      await runCase('testComboPath0035', async () => {
        const original: drawing.Path = rectPath(20, 20, 70, 70);
        const shifted: drawing.Path = original.offset(80, 0);
        const originalPixels: ArrayBuffer = await fillOnBlank(original);
        const shiftedPixels: ArrayBuffer = await fillOnBlank(shifted);
        expect(alphaAt(originalPixels, 40, 40)).assertEqual(255);
        expect(alphaAt(shiftedPixels, 40, 40)).assertEqual(0);
        expect(alphaAt(shiftedPixels, 120, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0035 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0156
     * @tc.name testComboPath0036
     * @tc.desc Verify a concatenated scale matrix enlarges the drawn path on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0036 begin');
      await runCase('testComboPath0036', async () => {
        const target: OffscreenTarget = await blankOf();
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        target.canvas.concatMatrix(zoom);
        fillPath(target, rectPath(20, 20, 60, 60), fillBrush());
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(6400);
        expect(alphaAt(buffer, 80, 80)).assertEqual(255);
        expect(alphaAt(buffer, 20, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0036 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0157
     * @tc.name testComboPath0037
     * @tc.desc Verify a half scale matrix shrinks the filled area to a quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0037 begin');
      await runCase('testComboPath0037', async () => {
        const path: drawing.Path = rectPath(40, 40, 120, 120);
        const shrink: drawing.Matrix = new drawing.Matrix();
        shrink.setScale(0.5, 0.5, 0, 0);
        path.transform(shrink);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(1600);
        expect(alphaAt(buffer, 30, 30)).assertEqual(255);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0037 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0158
     * @tc.name testComboPath0038
     * @tc.desc Verify a clip cuts the part of the transformed path that leaves the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0038 begin');
      await runCase('testComboPath0038', async () => {
        const path: drawing.Path = rectPath(20, 20, 70, 70);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(80, 0);
        path.transform(shift);
        const target: OffscreenTarget = await blankOf();
        target.canvas.clipRect(ltrb(0, 0, 120, SIZE));
        fillPath(target, path, fillBrush());
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(1000);
        expect(alphaAt(buffer, 110, 40)).assertEqual(255);
        expect(alphaAt(buffer, 140, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0038 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0159
     * @tc.name testComboPath0039
     * @tc.desc Verify setMatrix replaces the canvas transform instead of combining.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0039 begin');
      await runCase('testComboPath0039', async () => {
        const target: OffscreenTarget = await blankOf();
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(50, 50);
        target.canvas.setMatrix(shift);
        fillPath(target, rectPath(0, 0, 40, 40), fillBrush());
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(1600);
        expect(alphaAt(buffer, 70, 70)).assertEqual(255);
        expect(alphaAt(buffer, 20, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0039 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0160
     * @tc.name testComboPath0040
     * @tc.desc Verify a transformed circle matches a circle built at the target centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0040 begin');
      await runCase('testComboPath0040', async () => {
        const path: drawing.Path = discPath(60, 60, 30);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(40, 40);
        path.transform(shift);
        const moved: ArrayBuffer = await fillOnBlank(path);
        const direct: ArrayBuffer = await fillOnBlank(discPath(100, 100, 30));
        expect(diffAll(moved, direct)).assertEqual(0);
        expect(alphaAt(moved, 100, 100)).assertEqual(255);
        expect(inkBox(moved, 0, 0, SIZE, SIZE) > 2500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0040 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0161
     * @tc.name testComboPath0041
     * @tc.desc Verify getBounds reports the painted rectangle of a filled path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0041 begin');
      await runCase('testComboPath0041', async () => {
        const path: drawing.Path = rectPath(30, 50, 130, 110);
        const bounds: common2D.Rect = path.getBounds();
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(bounds.left).assertEqual(30);
        expect(bounds.top).assertEqual(50);
        expect(inkBox(buffer, 30, 50, 130, 110)).assertEqual(6000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0041 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0162
     * @tc.name testComboPath0042
     * @tc.desc Verify Path.contains agrees with the painted pixels inside and outside.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0042 begin');
      await runCase('testComboPath0042', async () => {
        const path: drawing.Path = discPath(100, 100, 50);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(path.contains(100, 100)).assertTrue();
        expect(path.contains(100, 155)).assertFalse();
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 100, 155)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0042 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0163
     * @tc.name testComboPath0043
     * @tc.desc Verify a closed rectangle path reports its four hundred pixel perimeter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0043 begin');
      await runCase('testComboPath0043', async () => {
        const path: drawing.Path = rectPath(50, 50, 150, 150);
        const closed: number = path.getLength(true);
        const open: number = path.getLength(false);
        expect(near(closed, 400, 1)).assertTrue();
        expect(closed).assertEqual(400);
        expect(open > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0043 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0164
     * @tc.name testComboPath0044
     * @tc.desc Verify isRect holds for a rectangular path and the fill matches its area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0044 begin');
      await runCase('testComboPath0044', async () => {
        const path: drawing.Path = rectPath(20, 30, 120, 130);
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(path.isRect(null)).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(10000);
        expect(alphaAt(buffer, 70, 80)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0044 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0165
     * @tc.name testComboPath0045
     * @tc.desc Verify switching the fill type between EVEN_ODD and WINDING adds the hole back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0045 begin');
      await runCase('testComboPath0045', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 60);
        path.addCircle(100, 100, 30);
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        const holed: ArrayBuffer = await fillOnBlank(path);
        path.setFillType(drawing.PathFillType.WINDING);
        const solid: ArrayBuffer = await fillOnBlank(path);
        expect(alphaAt(holed, 100, 100)).assertEqual(0);
        expect(alphaAt(solid, 100, 100)).assertEqual(255);
        expect(inkBox(solid, 0, 0, SIZE, SIZE) > inkBox(holed, 0, 0, SIZE, SIZE)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0045 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0166
     * @tc.name testComboPath0046
     * @tc.desc Verify an empty path reports itself empty and paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testComboPath0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0046 begin');
      await runCase('testComboPath0046', async () => {
        const empty: drawing.Path = new drawing.Path();
        const full: drawing.Path = rectPath(20, 20, 100, 100);
        expect(empty.isEmpty()).assertTrue();
        expect(full.isEmpty()).assertFalse();
        const buffer: ArrayBuffer = await fillOnBlank(empty);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0046 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0167
     * @tc.name testComboPath0047
     * @tc.desc Verify a copied path reports equality and paints identical pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0047 begin');
      await runCase('testComboPath0047', async () => {
        const source: drawing.Path = rectPath(20, 20, 100, 100);
        const copy: drawing.Path = new drawing.Path(source);
        expect(copy.isEqual(source)).assertTrue();
        const first: ArrayBuffer = await fillOnBlank(source);
        const second: ArrayBuffer = await fillOnBlank(copy);
        expect(diffAll(first, second)).assertEqual(0);
        expect(inkBox(first, 0, 0, SIZE, SIZE)).assertEqual(6400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0047 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0168
     * @tc.name testComboPath0048
     * @tc.desc Verify getSegment extracts a shorter sub path with a positive length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0048 begin');
      await runCase('testComboPath0048', async () => {
        const source: drawing.Path = rectPath(20, 20, 120, 120);
        const part: drawing.Path = new drawing.Path();
        const extracted: boolean = source.getSegment(true, 0, 50, true, part);
        const bounds: common2D.Rect = part.getBounds();
        expect(extracted).assertTrue();
        expect(part.isEmpty()).assertFalse();
        expect(part.getLength(true) > 0).assertTrue();
        expect(bounds.right <= 120).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0048 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0169
     * @tc.name testComboPath0049
     * @tc.desc Verify iterating the verbs of a rectangle yields verbs and that it still fills.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0049 begin');
      await runCase('testComboPath0049', async () => {
        const path: drawing.Path = rectPath(20, 20, 100, 100);
        const iterator: drawing.PathIterator = new drawing.PathIterator(path);
        const points: common2D.Point[] = iteratorPoints();
        let verbs: number = 0;
        while (iterator.hasNext()) {
          iterator.next(points);
          verbs++;
        }
        const buffer: ArrayBuffer = await fillOnBlank(path);
        expect(verbs > 0).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(6400);
        expect(alphaAt(buffer, 60, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0049 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0170
     * @tc.name testComboPath0050
     * @tc.desc Verify an svg built path paints the same pixels as the same rectangle path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0050 begin');
      await runCase('testComboPath0050', async () => {
        const fromSvg: drawing.Path = new drawing.Path();
        const parsed: boolean = fromSvg.buildFromSvgString('M20 20 L120 20 L120 120 L20 120 Z');
        const built: ArrayBuffer = await fillOnBlank(fromSvg);
        const direct: ArrayBuffer = await fillOnBlank(rectPath(20, 20, 120, 120));
        expect(parsed).assertTrue();
        expect(diffAll(built, direct) < 200).assertTrue();
        expect(inkBox(built, 0, 0, SIZE, SIZE)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0050 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0171
     * @tc.name testComboPath0051
     * @tc.desc Verify a half transparent layer keeps the path ink area but halves its alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0051 begin');
      await runCase('testComboPath0051', async () => {
        const target: OffscreenTarget = await blankOf();
        target.canvas.saveLayer(null, layerBrushWith(128));
        fillPath(target, rectPath(20, 20, 120, 120), fillBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(alphaAt(buffer, 70, 70), 128, 3)).assertTrue();
        expect(alphaAt(buffer, 10, 10)).assertEqual(0);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0051 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0172
     * @tc.name testComboPath0052
     * @tc.desc Verify a circular clip confines a full canvas rectangle fill to the disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0052 begin');
      await runCase('testComboPath0052', async () => {
        const target: OffscreenTarget = await blankOf();
        target.canvas.clipPath(discPath(100, 100, 50), drawing.ClipOp.INTERSECT, false);
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fillBrush());
        const buffer: ArrayBuffer = await pixelsOf(target);
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 10, 10)).assertEqual(0);
        expect(ink > 7400).assertTrue();
        expect(ink < 8300).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0052 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0173
     * @tc.name testComboPath0053
     * @tc.desc Verify a DIFFERENCE clip punches a hole that a full canvas fill cannot cover.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0053 begin');
      await runCase('testComboPath0053', async () => {
        const target: OffscreenTarget = await blankOf();
        target.canvas.clipPath(discPath(100, 100, 40), drawing.ClipOp.DIFFERENCE, false);
        fillPath(target, rectPath(0, 0, SIZE, SIZE), fillBrush());
        const buffer: ArrayBuffer = await pixelsOf(target);
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
        expect(alphaAt(buffer, 10, 10)).assertEqual(255);
        expect(ink > 33000).assertTrue();
        expect(ink < 36000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0053 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0174
     * @tc.name testComboPath0054
     * @tc.desc Verify a clipped path inside a translucent layer keeps both effects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0054 begin');
      await runCase('testComboPath0054', async () => {
        const target: OffscreenTarget = await blankOf();
        target.canvas.saveLayer(null, layerBrushWith(128));
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        fillPath(target, rectPath(20, 20, 120, 120), fillBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(alphaAt(buffer, 50, 60), 128, 3)).assertTrue();
        expect(alphaAt(buffer, 110, 60)).assertEqual(0);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(8000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0054 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0175
     * @tc.name testComboPath0055
     * @tc.desc Verify two nested translucent layers quarter the alpha of the path ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0055 begin');
      await runCase('testComboPath0055', async () => {
        const target: OffscreenTarget = await blankOf();
        target.canvas.saveLayer(null, layerBrushWith(128));
        target.canvas.saveLayer(null, layerBrushWith(128));
        fillPath(target, rectPath(20, 20, 120, 120), fillBrush());
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(alphaAt(buffer, 70, 70), 64, 6)).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(10000);
        expect(alphaAt(buffer, 10, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0055 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0176
     * @tc.name testComboPath0056
     * @tc.desc Verify restoreToCount closes two path layers and returns to the first save count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0056 begin');
      await runCase('testComboPath0056', async () => {
        const target: OffscreenTarget = await baseTarget();
        const before: ArrayBuffer = await pixelsOf(target);
        target.canvas.saveLayer(null, layerBrushWith(128));
        fillPath(target, discPath(100, 100, 50), fillBrush());
        target.canvas.saveLayer(null, layerBrushWith(128));
        fillPath(target, rectPath(20, 20, 80, 80), fillBrush());
        target.canvas.restoreToCount(1);
        const after: ArrayBuffer = await pixelsOf(target);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(diffAll(before, after) > 0).assertTrue();
        expect(alphaAt(after, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0056 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0177
     * @tc.name testComboPath0057
     * @tc.desc Verify a clip cuts a stroked path at the clip edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0057 begin');
      await runCase('testComboPath0057', async () => {
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.lineTo(180, 100);
        const target: OffscreenTarget = await blankOf();
        target.canvas.clipRect(ltrb(0, 0, 100, SIZE));
        strokePath(target, path, strokePen(10));
        const buffer: ArrayBuffer = await pixelsOf(target);
        const ink: number = inkBox(buffer, 0, 0, SIZE, SIZE);
        expect(ink > 700).assertTrue();
        expect(ink < 900).assertTrue();
        expect(alphaAt(buffer, 90, 100)).assertEqual(255);
        expect(alphaAt(buffer, 120, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0057 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0178
     * @tc.name testComboPath0058
     * @tc.desc Verify a zero alpha layer drops the path drawn inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0058 begin');
      await runCase('testComboPath0058', async () => {
        const base: ArrayBuffer = await baseBuffer();
        const target: OffscreenTarget = await baseTarget();
        target.canvas.saveLayer(null, layerBrushWith(0));
        fillPath(target, rectPath(20, 20, 120, 120), fillBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(diffAll(base, buffer)).assertEqual(0);
        expect(redAt(buffer, 70, 70)).assertEqual(BASE_RED);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0058 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0179
     * @tc.name testComboPath0059
     * @tc.desc Verify two canvases keep their own path drawings apart.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testComboPath0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0059 begin');
      await runCase('testComboPath0059', async () => {
        const left: OffscreenTarget = await blankOf();
        const right: OffscreenTarget = await blankOf();
        fillPath(left, rectPath(20, 20, 120, 120), fillBrush());
        fillPath(right, discPath(100, 100, 40), fillBrush());
        const leftPixels: ArrayBuffer = await pixelsOf(left);
        const rightPixels: ArrayBuffer = await pixelsOf(right);
        expect(alphaAt(leftPixels, 70, 70)).assertEqual(255);
        expect(alphaAt(rightPixels, 70, 70)).assertEqual(0);
        expect(alphaAt(rightPixels, 100, 100)).assertEqual(255);
        expect(diffAll(leftPixels, rightPixels) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0059 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_COMBO_0180
     * @tc.name testComboPath0060
     * @tc.desc Verify an op result drawn in a clipped translucent layer keeps both effects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testComboPath0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0060 begin');
      await runCase('testComboPath0060', async () => {
        const shape: drawing.Path = rectPath(20, 20, 120, 120);
        shape.op(discPath(120, 120, 40), drawing.PathOp.UNION);
        const target: OffscreenTarget = await blankOf();
        target.canvas.saveLayer(null, layerBrushWith(128));
        target.canvas.clipRect(ltrb(0, 0, 140, SIZE));
        fillPath(target, shape, fillBrush());
        target.canvas.restore();
        const buffer: ArrayBuffer = await pixelsOf(target);
        expect(near(alphaAt(buffer, 60, 60), 128, 3)).assertTrue();
        expect(near(alphaAt(buffer, 130, 130), 128, 3)).assertTrue();
        expect(alphaAt(buffer, 150, 150)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testComboPath0060 end');
    });
  });
}
