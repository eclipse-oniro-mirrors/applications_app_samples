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
import { ltrb, point, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const AREA: number = SIZE * SIZE;
const HALF: number = SIZE / 2;
const QUARTER: number = HALF * HALF;

/**
 * Read one color channel of a pixel in a square RGBA_8888 buffer.
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
 * Count painted pixels inside a column range of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } from - First column, inclusive.
 * @param { number } to - Last column, exclusive.
 * @returns { number } Number of painted pixels.
 */
function inkColumns(buffer: ArrayBuffer, from: number, to: number): number {
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
 * Count pixels whose alpha is neither fully transparent nor fully opaque.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } from - First column, inclusive.
 * @param { number } to - Last column, exclusive.
 * @returns { number } Number of partially transparent pixels.
 */
function partialAlphaCount(buffer: ArrayBuffer, from: number, to: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let y: number = 0; y < SIZE; y++) {
    for (let x: number = from; x < to; x++) {
      const alpha: number = bytes[(y * SIZE + x) * 4 + 3];
      if (alpha > 0 && alpha < 255) {
        count++;
      }
    }
  }
  return count;
}

/**
 * Count how many different green values a coarse pixel grid contains.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of distinct green values.
 */
function distinctGreen(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const seen: number[] = [];
  for (let i: number = 0; i < 256; i++) {
    seen.push(0);
  }
  for (let y: number = 0; y < SIZE; y += 4) {
    for (let x: number = 0; x < SIZE; x += 4) {
      seen[bytes[(y * SIZE + x) * 4 + 1]] = 1;
    }
  }
  let count: number = 0;
  for (let i: number = 0; i < 256; i++) {
    if (seen[i] === 1) {
      count++;
    }
  }
  return count;
}

/**
 * Fill one rectangle of a canvas with a hard edged brush.
 *
 * @param { OffscreenTarget } target - Target owning the canvas.
 * @param { common2D.Rect } rect - Rectangle to paint.
 * @param { common2D.Color } color - Fill color.
 */
function fillRect(target: OffscreenTarget, rect: common2D.Rect, color: common2D.Color): void {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(color);
  brush.setAntiAlias(false);
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(rect);
  target.canvas.detachBrush();
}

/**
 * Count pixels whose channel value is above a limit.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @param { number } limit - Pixels above this value are counted.
 * @returns { number } Number of matching pixels.
 */
function channelAbove(buffer: ArrayBuffer, channel: number, limit: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let i: number = channel; i < bytes.length; i += 4) {
    if (bytes[i] > limit) {
      count++;
    }
  }
  return count;
}

/**
 * Create a square source image painted with one color.
 *
 * @param { common2D.Color } color - Fill color of the source.
 * @returns { Promise<OffscreenTarget> } Source target.
 */
async function solidSource(color: common2D.Color): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.clear(color);
  return target;
}

/**
 * Create a square source image split into a left and a right half.
 *
 * @param { number } size - Square edge length in px.
 * @param { common2D.Color } left - Color of the left half.
 * @param { common2D.Color } right - Color of the right half.
 * @returns { Promise<OffscreenTarget> } Source target.
 */
async function splitSource(size: number, left: common2D.Color,
  right: common2D.Color): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(size, size);
  fillRect(target, ltrb(0, 0, size / 2, size), left);
  fillRect(target, ltrb(size / 2, 0, size, size), right);
  return target;
}

/**
 * Create a square source image with three differently colored quadrants.
 *
 * @returns { Promise<OffscreenTarget> } Source target.
 */
async function quadSource(): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  fillRect(target, ltrb(0, 0, HALF, HALF), rgba(255, 255, 0, 0));
  fillRect(target, ltrb(HALF, 0, SIZE, HALF), rgba(255, 0, 255, 0));
  fillRect(target, ltrb(0, HALF, HALF, SIZE), rgba(255, 0, 0, 255));
  return target;
}

/**
 * Paint the whole canvas with one shader and read the pixels back.
 *
 * @param { drawing.ShaderEffect } shader - Shader to apply.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillShader(shader: drawing.ShaderEffect): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setShaderEffect(shader);
  brush.setColor(rgba(255, 255, 255, 255));
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(0, 0, SIZE, SIZE));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Build a horizontal black to white gradient with one tile mode.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the gradient span.
 * @param { number } x0 - Start x of the gradient.
 * @param { number } x1 - End x of the gradient.
 * @returns { drawing.ShaderEffect } Gradient shader.
 */
function linearShader(mode: drawing.TileMode, x0: number, x1: number): drawing.ShaderEffect {
  const colors: number[] = [0xFF000000, 0xFFFFFFFF];
  return drawing.ShaderEffect.createLinearGradient(point(x0, HALF), point(x1, HALF), colors, mode);
}

/**
 * Build a red to blue radial gradient centered on the canvas.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the radius.
 * @param { number } radius - Radius of the gradient.
 * @returns { drawing.ShaderEffect } Gradient shader.
 */
function radialShader(mode: drawing.TileMode, radius: number): drawing.ShaderEffect {
  const colors: number[] = [0xFFFF0000, 0xFF0000FF];
  return drawing.ShaderEffect.createRadialGradient(point(HALF, HALF), radius, colors, mode);
}

/**
 * Build a full circle green to blue sweep gradient centered on the canvas.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the sweep span.
 * @returns { drawing.ShaderEffect } Gradient shader.
 */
function sweepShader(mode: drawing.TileMode): drawing.ShaderEffect {
  const colors: number[] = [0xFF00FF00, 0xFF0000FF];
  return drawing.ShaderEffect.createSweepGradient(point(HALF, HALF), colors, mode, 0, 360);
}

/**
 * Build a red to blue conical gradient around the canvas center line.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the conical span.
 * @returns { drawing.ShaderEffect } Gradient shader.
 */
function conicalShader(mode: drawing.TileMode): drawing.ShaderEffect {
  const colors: number[] = [0xFFFF0000, 0xFF0000FF];
  return drawing.ShaderEffect.createConicalGradient(point(60, HALF), 10, point(140, HALF), 60, colors, mode);
}

/**
 * Fill the canvas with a linear gradient and read the pixels back.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the gradient span.
 * @param { number } x0 - Start x of the gradient.
 * @param { number } x1 - End x of the gradient.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function linearBuffer(mode: drawing.TileMode, x0: number, x1: number): Promise<ArrayBuffer> {
  return fillShader(linearShader(mode, x0, x1));
}

/**
 * Fill the canvas with a radial gradient and read the pixels back.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the radius.
 * @param { number } radius - Radius of the gradient.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function radialBuffer(mode: drawing.TileMode, radius: number): Promise<ArrayBuffer> {
  return fillShader(radialShader(mode, radius));
}

/**
 * Fill the canvas with a sweep gradient and read the pixels back.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the sweep span.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function sweepBuffer(mode: drawing.TileMode): Promise<ArrayBuffer> {
  return fillShader(sweepShader(mode));
}

/**
 * Fill the canvas with a conical gradient and read the pixels back.
 *
 * @param { drawing.TileMode } mode - Tile mode applied outside the conical span.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function conicalBuffer(mode: drawing.TileMode): Promise<ArrayBuffer> {
  return fillShader(conicalShader(mode));
}

/**
 * Blur a centered rectangle with one tile mode and read the pixels back.
 *
 * @param { number } sigma - Blur sigma in px.
 * @param { drawing.TileMode } mode - Tile mode of the blur.
 * @param { drawing.ImageFilter | null } base - Optional inner filter.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function blurBuffer(sigma: number, mode: drawing.TileMode,
  base: drawing.ImageFilter | null): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0, 160, 60));
  brush.setImageFilter(drawing.ImageFilter.createBlurImageFilter(sigma, sigma, mode, base));
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(40, 40, 160, 160));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Copy a source image onto a fresh canvas with the given sampling filter.
 *
 * @param { OffscreenTarget } source - Source image.
 * @param { drawing.FilterMode } mode - Sampling filter.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawImageAt(source: OffscreenTarget, mode: drawing.FilterMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const options: drawing.SamplingOptions = new drawing.SamplingOptions(mode);
  target.canvas.drawImage(source.pixelMap, 0, 0, options);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Scale a source image into a destination rectangle with the given sampling filter.
 *
 * @param { OffscreenTarget } source - Source image.
 * @param { common2D.Rect } dst - Destination rectangle.
 * @param { drawing.FilterMode } mode - Sampling filter.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawImageRectAt(source: OffscreenTarget, dst: common2D.Rect,
  mode: drawing.FilterMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const options: drawing.SamplingOptions = new drawing.SamplingOptions(mode);
  target.canvas.drawImageRect(source.pixelMap, dst, options);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stretch a source image over the canvas with the nine patch API.
 *
 * @param { OffscreenTarget } source - Source image.
 * @param { common2D.Rect } center - Center patch of the source.
 * @param { drawing.FilterMode } mode - Sampling filter.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawImageNineAt(source: OffscreenTarget, center: common2D.Rect,
  mode: drawing.FilterMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.drawImageNine(source.pixelMap, center, ltrb(0, 0, SIZE, SIZE), mode);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Build a lattice with one interior divider on each axis.
 *
 * @param { number } divider - Divider position in source pixels.
 * @returns { drawing.Lattice } One cell lattice.
 */
function singleCellLattice(divider: number): drawing.Lattice {
  const xDivs: number[] = [divider];
  const yDivs: number[] = [divider];
  return drawing.Lattice.createImageLattice(xDivs, yDivs, 1, 1);
}

/**
 * Stretch a lattice of a source image over the canvas.
 *
 * @param { OffscreenTarget } source - Source image.
 * @param { drawing.Lattice } lattice - Lattice describing the patches.
 * @param { drawing.FilterMode } mode - Sampling filter.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawLatticeAt(source: OffscreenTarget, lattice: drawing.Lattice,
  mode: drawing.FilterMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE), mode);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Draw one source rectangle into a destination rectangle with an explicit constraint.
 *
 * @param { OffscreenTarget } source - Source image.
 * @param { common2D.Rect } src - Source rectangle.
 * @param { common2D.Rect } dst - Destination rectangle.
 * @param { drawing.FilterMode } mode - Sampling filter.
 * @param { drawing.SrcRectConstraint } constraint - Rectangle constraint.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawSrcRectAt(source: OffscreenTarget, src: common2D.Rect, dst: common2D.Rect,
  mode: drawing.FilterMode, constraint: drawing.SrcRectConstraint): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const options: drawing.SamplingOptions = new drawing.SamplingOptions(mode);
  target.canvas.drawImageRectWithSrc(source.pixelMap, src, dst, options, constraint);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Draw one source rectangle into a destination rectangle without a constraint.
 *
 * @param { OffscreenTarget } source - Source image.
 * @param { common2D.Rect } src - Source rectangle.
 * @param { common2D.Rect } dst - Destination rectangle.
 * @param { drawing.FilterMode } mode - Sampling filter.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawSrcRectDefault(source: OffscreenTarget, src: common2D.Rect, dst: common2D.Rect,
  mode: drawing.FilterMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const options: drawing.SamplingOptions = new drawing.SamplingOptions(mode);
  target.canvas.drawImageRectWithSrc(source.pixelMap, src, dst, options);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Repeat one rectangle type for all four cells of a lattice.
 *
 * @param { drawing.RectType } type - Rectangle type of every cell.
 * @returns { drawing.RectType[] } Four rectangle types.
 */
function uniformTypes(type: drawing.RectType): drawing.RectType[] {
  const types: drawing.RectType[] = [type, type, type, type];
  return types;
}

/**
 * Repeat one palette color for all four cells of a lattice.
 *
 * @param { common2D.Color } color - Palette color of every cell.
 * @returns { common2D.Color[] } Four palette colors.
 */
function uniformColors(color: common2D.Color): common2D.Color[] {
  const colors: common2D.Color[] = [color, color, color, color];
  return colors;
}

/**
 * Build a three by two lattice with two interior dividers on the x axis.
 *
 * @param { drawing.RectType[] } types - Rectangle type per cell.
 * @param { common2D.Color[] } colors - Fixed color per cell.
 * @returns { drawing.Lattice } Lattice with six cells.
 */
function rowLattice(types: drawing.RectType[], colors: common2D.Color[]): drawing.Lattice {
  const xDivs: number[] = [60, 140];
  const yDivs: number[] = [HALF];
  return drawing.Lattice.createImageLattice(xDivs, yDivs, 2, 1, null, types, colors);
}

/**
 * Build a two by two lattice whose cells carry explicit rectangle types.
 *
 * @param { drawing.RectType[] } types - Rectangle type per cell.
 * @param { common2D.Color[] } colors - Fixed color per cell.
 * @returns { drawing.Lattice } Lattice with four cells.
 */
function quadLattice(types: drawing.RectType[], colors: common2D.Color[]): drawing.Lattice {
  const xDivs: number[] = [HALF];
  const yDivs: number[] = [HALF];
  return drawing.Lattice.createImageLattice(xDivs, yDivs, 1, 1, null, types, colors);
}

/**
 * Stretch a typed lattice of a source image over the canvas.
 *
 * @param { OffscreenTarget } source - Source image.
 * @param { drawing.RectType[] } types - Rectangle type per cell.
 * @param { common2D.Color[] } colors - Fixed color per cell.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function typedLatticeBuffer(source: OffscreenTarget, types: drawing.RectType[],
  colors: common2D.Color[]): Promise<ArrayBuffer> {
  const lattice: drawing.Lattice = quadLattice(types, colors);
  return drawLatticeAt(source, lattice, drawing.FilterMode.FILTER_MODE_NEAREST);
}

export default function enumSamplingTest() {
  describe('EnumSamplingTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0298
     * @tc.name testEnumSampling0298
     * @tc.desc Verify FilterMode.FILTER_MODE_NEAREST keeps index 0 and copies a whole image.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0298', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0298 begin');
      await runCase('testEnumSampling0298', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 40, 90, 255));
        const buffer: ArrayBuffer = await drawImageAt(source, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(drawing.FilterMode.FILTER_MODE_NEAREST).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(alphaAt(buffer, 199, 199)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0298 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0299
     * @tc.name testEnumSampling0299
     * @tc.desc Verify nearest sampling shrinks a source image into a quarter destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0299', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0299 begin');
      await runCase('testEnumSampling0299', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 40, 90, 255));
        const buffer: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, HALF, HALF),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(countInkedPixels(buffer)).assertEqual(QUARTER);
        expect(alphaAt(buffer, 50, 50)).assertEqual(255);
        expect(alphaAt(buffer, 150, 150)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0299 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0300
     * @tc.name testEnumSampling0300
     * @tc.desc Verify the nine patch API stretches a nearest sampled source over the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0300', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0300 begin');
      await runCase('testEnumSampling0300', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 40, 90, 255));
        const buffer: ArrayBuffer = await drawImageNineAt(source, ltrb(50, 50, 150, 150),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(countInkedPixels(buffer) > 20000).assertTrue();
        expect(alphaAt(buffer, 0, 0)).assertEqual(255);
        expect(alphaAt(buffer, 199, 199)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0300 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0301
     * @tc.name testEnumSampling0301
     * @tc.desc Verify a lattice drawn with nearest sampling keeps the source color everywhere.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0301', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0301 begin');
      await runCase('testEnumSampling0301', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 30, 60, 255));
        const lattice: drawing.Lattice = singleCellLattice(HALF);
        const buffer: ArrayBuffer = await drawLatticeAt(source, lattice,
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(countInkedPixels(buffer) > 30000).assertTrue();
        expect(redAt(buffer, 100, 100)).assertEqual(30);
        expect(greenAt(buffer, 30, 170)).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0301 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0302
     * @tc.name testEnumSampling0302
     * @tc.desc Verify nearest and linear sampling cover the same area for a solid source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0302', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0302 begin');
      await runCase('testEnumSampling0302', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 200, 10, 30));
        const nearest: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, HALF, HALF),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const linear: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, HALF, HALF),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(countInkedPixels(nearest)).assertEqual(countInkedPixels(linear));
        expect(countInkedPixels(linear)).assertEqual(QUARTER);
        expect(alphaAt(linear, 50, 50)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0302 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0303
     * @tc.name testEnumSampling0303
     * @tc.desc Verify nearest sampling keeps a hard edge when a source grows twofold.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0303', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0303 begin');
      await runCase('testEnumSampling0303', async () => {
        const source: OffscreenTarget = await splitSource(HALF, rgba(255, 255, 0, 0), rgba(0, 0, 0, 0));
        const buffer: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(partialAlphaCount(buffer, 90, 110)).assertEqual(0);
        expect(redAt(buffer, 20, 100)).assertEqual(255);
        expect(alphaAt(buffer, 190, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0303 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0304
     * @tc.name testEnumSampling0304
     * @tc.desc Verify a one to one nearest copy preserves every source quadrant color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0304', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0304 begin');
      await runCase('testEnumSampling0304', async () => {
        const source: OffscreenTarget = await quadSource();
        const buffer: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(countInkedPixels(buffer)).assertEqual(30000);
        expect(redAt(buffer, 50, 50)).assertEqual(255);
        expect(greenAt(buffer, 150, 50)).assertEqual(255);
        expect(blueAt(buffer, 50, 150)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0304 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0305
     * @tc.name testEnumSampling0305
     * @tc.desc Verify FilterMode.FILTER_MODE_LINEAR keeps index 1 and copies a whole image.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0305', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0305 begin');
      await runCase('testEnumSampling0305', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 20, 220, 90));
        const buffer: ArrayBuffer = await drawImageAt(source, drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(drawing.FilterMode.FILTER_MODE_LINEAR).assertEqual(1);
        expect(drawing.FilterMode.FILTER_MODE_NEAREST
          < drawing.FilterMode.FILTER_MODE_LINEAR).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(blueAt(buffer, 0, 0)).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0305 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0306
     * @tc.name testEnumSampling0306
     * @tc.desc Verify linear sampling shrinks a source image into a fifty pixel square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0306', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0306 begin');
      await runCase('testEnumSampling0306', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 60, 120, 180));
        const buffer: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, 50, 50),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(inkColumns(buffer, 60, 200)).assertEqual(0);
        expect(alphaAt(buffer, 25, 25)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0306 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0307
     * @tc.name testEnumSampling0307
     * @tc.desc Verify the nine patch API stretches a linearly sampled source over the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0307', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0307 begin');
      await runCase('testEnumSampling0307', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 60, 120, 180));
        const buffer: ArrayBuffer = await drawImageNineAt(source, ltrb(60, 60, 140, 140),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(countInkedPixels(buffer) > 20000).assertTrue();
        expect(alphaAt(buffer, 5, 5)).assertEqual(255);
        expect(alphaAt(buffer, 195, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0307 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0308
     * @tc.name testEnumSampling0308
     * @tc.desc Verify a lattice drawn with linear sampling covers the canvas with the source color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0308', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0308 begin');
      await runCase('testEnumSampling0308', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 30, 60, 255));
        const lattice: drawing.Lattice = singleCellLattice(50);
        const buffer: ArrayBuffer = await drawLatticeAt(source, lattice,
          drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(greenAt(buffer, 10, 10)).assertEqual(60);
        expect(alphaAt(buffer, 199, 199)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0308 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0309
     * @tc.name testEnumSampling0309
     * @tc.desc Verify linear sampling blends a transparent edge into partial alpha columns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0309', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0309 begin');
      await runCase('testEnumSampling0309', async () => {
        const source: OffscreenTarget = await splitSource(HALF, rgba(255, 255, 0, 0), rgba(0, 0, 0, 0));
        const buffer: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(partialAlphaCount(buffer, 90, 110) > 0).assertTrue();
        expect(alphaAt(buffer, 10, 100)).assertEqual(255);
        expect(alphaAt(buffer, 190, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0309 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0310
     * @tc.name testEnumSampling0310
     * @tc.desc Verify two sampling options built from the same filter behave identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0310', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0310 begin');
      await runCase('testEnumSampling0310', async () => {
        const source: OffscreenTarget = await splitSource(HALF, rgba(255, 255, 0, 0), rgba(0, 0, 0, 0));
        const first: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        const second: ArrayBuffer = await drawImageRectAt(source, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countInkedPixels(first) > 0).assertTrue();
        expect(partialAlphaCount(first, 90, 110)).assertEqual(partialAlphaCount(second, 90, 110));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0310 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0311
     * @tc.name testEnumSampling0311
     * @tc.desc Verify a linear sampled lattice keeps quadrant colors at one to one scale.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0311', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0311 begin');
      await runCase('testEnumSampling0311', async () => {
        const source: OffscreenTarget = await quadSource();
        const lattice: drawing.Lattice = singleCellLattice(HALF);
        const buffer: ArrayBuffer = await drawLatticeAt(source, lattice,
          drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(countInkedPixels(buffer)).assertEqual(30000);
        expect(redAt(buffer, 50, 50)).assertEqual(255);
        expect(greenAt(buffer, 150, 50)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0311 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0312
     * @tc.name testEnumSampling0312
     * @tc.desc Verify TileMode.CLAMP keeps index 0 and replicates the gradient end colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0312', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0312 begin');
      await runCase('testEnumSampling0312', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.CLAMP, 50, 150);
        expect(drawing.TileMode.CLAMP).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(greenAt(buffer, 5, 100)).assertEqual(0);
        expect(greenAt(buffer, 195, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0312 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0313
     * @tc.name testEnumSampling0313
     * @tc.desc Verify a clamped linear gradient interpolates only inside its own span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0313', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0313 begin');
      await runCase('testEnumSampling0313', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.CLAMP, 50, 150);
        const middle: number = greenAt(buffer, 100, 100);
        expect(middle > 118).assertTrue();
        expect(middle < 138).assertTrue();
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(greenAt(buffer, 40, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0313 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0314
     * @tc.name testEnumSampling0314
     * @tc.desc Verify clamping paints the two outside bands with the first and last color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0314', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0314 begin');
      await runCase('testEnumSampling0314', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.CLAMP, 50, 150);
        expect(inkColumns(buffer, 0, 50)).assertEqual(50 * SIZE);
        expect(inkColumns(buffer, 150, 200)).assertEqual(50 * SIZE);
        expect([greenAt(buffer, 2, 2), greenAt(buffer, 2, 197)]).assertDeepEquals([0, 0]);
        expect([greenAt(buffer, 190, 3), greenAt(buffer, 190, 196)]).assertDeepEquals([255, 255]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0314 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0315
     * @tc.name testEnumSampling0315
     * @tc.desc Verify a clamped radial gradient fills the area outside its radius with the end color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0315', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0315 begin');
      await runCase('testEnumSampling0315', async () => {
        const buffer: ArrayBuffer = await radialBuffer(drawing.TileMode.CLAMP, 40);
        expect(blueAt(buffer, 5, 5)).assertEqual(255);
        expect(redAt(buffer, 5, 5)).assertEqual(0);
        expect(redAt(buffer, 100, 100)).assertEqual(250);
        expect(alphaAt(buffer, 199, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0315 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0316
     * @tc.name testEnumSampling0316
     * @tc.desc Verify a clamped sweep gradient still covers the whole canvas with a color ramp.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0316', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0316 begin');
      await runCase('testEnumSampling0316', async () => {
        const buffer: ArrayBuffer = await sweepBuffer(drawing.TileMode.CLAMP);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(distinctGreen(buffer) > 4).assertTrue();
        expect(greenAt(buffer, 195, 100) + blueAt(buffer, 195, 100) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0316 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0317
     * @tc.name testEnumSampling0317
     * @tc.desc Verify a clamped conical gradient paints every corner of the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0317', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0317 begin');
      await runCase('testEnumSampling0317', async () => {
        const buffer: ArrayBuffer = await conicalBuffer(drawing.TileMode.CLAMP);
        expect(alphaAt(buffer, 0, 0)).assertEqual(0);
        expect(alphaAt(buffer, 199, 199)).assertEqual(255);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(18700);
        expect(redAt(buffer, 100, 100) + blueAt(buffer, 100, 100) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0317 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0318
     * @tc.name testEnumSampling0318
     * @tc.desc Verify a clamped blur filter keeps the inner block solid and bleeds past its edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0318', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0318 begin');
      await runCase('testEnumSampling0318', async () => {
        const buffer: ArrayBuffer = await blurBuffer(10, drawing.TileMode.CLAMP, null);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(inkBox(buffer, 40, 40, 160, 160)).assertEqual(120 * 120);
        expect(inkBox(buffer, 0, 0, 40, 40) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0318 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0319
     * @tc.name testEnumSampling0319
     * @tc.desc Verify all four gradient creators accept TileMode.CLAMP and cover the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0319', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0319 begin');
      await runCase('testEnumSampling0319', async () => {
        const linear: ArrayBuffer = await linearBuffer(drawing.TileMode.CLAMP, 60, 140);
        const radial: ArrayBuffer = await radialBuffer(drawing.TileMode.CLAMP, 60);
        const sweep: ArrayBuffer = await sweepBuffer(drawing.TileMode.CLAMP);
        const conical: ArrayBuffer = await conicalBuffer(drawing.TileMode.CLAMP);
        expect(countInkedPixels(linear)).assertEqual(AREA);
        expect(countInkedPixels(radial)).assertEqual(AREA);
        expect(countInkedPixels(sweep)).assertEqual(AREA);
        expect(countInkedPixels(conical)).assertEqual(18700);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0319 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0320
     * @tc.name testEnumSampling0320
     * @tc.desc Verify TileMode.REPEAT keeps index 1 and tiles the gradient outside its span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0320', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0320 begin');
      await runCase('testEnumSampling0320', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.REPEAT, 50, 150);
        expect(drawing.TileMode.REPEAT).assertEqual(1);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(greenAt(buffer, 10, 100) > 50).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0320 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0321
     * @tc.name testEnumSampling0321
     * @tc.desc Verify a repeated gradient repeats with the span period across the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0321', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0321 begin');
      await runCase('testEnumSampling0321', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.REPEAT, 50, 150);
        const outside: number = greenAt(buffer, 30, 100);
        const inside: number = greenAt(buffer, 130, 100);
        expect(Math.abs(outside - inside) <= 3).assertTrue();
        expect(outside > 180).assertTrue();
        expect(greenAt(buffer, 100, 100) > 118).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0321 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0322
     * @tc.name testEnumSampling0322
     * @tc.desc Verify repeat and clamp tile modes give different colors outside one gradient span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0322', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0322 begin');
      await runCase('testEnumSampling0322', async () => {
        const repeat: ArrayBuffer = await linearBuffer(drawing.TileMode.REPEAT, 50, 150);
        const clamp: ArrayBuffer = await linearBuffer(drawing.TileMode.CLAMP, 50, 150);
        expect(greenAt(repeat, 10, 100) > greenAt(clamp, 10, 100)).assertTrue();
        expect(greenAt(repeat, 190, 100) < greenAt(clamp, 190, 100)).assertTrue();
        expect(alphaAt(repeat, 10, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0322 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0323
     * @tc.name testEnumSampling0323
     * @tc.desc Verify a repeated vertical gradient repeats along the vertical axis only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0323', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0323 begin');
      await runCase('testEnumSampling0323', async () => {
        const colors: number[] = [0xFF000000, 0xFFFFFFFF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createLinearGradient(point(HALF, 20),
          point(HALF, 80), colors, drawing.TileMode.REPEAT);
        const buffer: ArrayBuffer = await fillShader(shader);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(Math.abs(greenAt(buffer, HALF, 130) - greenAt(buffer, HALF, 190)) <= 3).assertTrue();
        expect(alphaAt(buffer, HALF, 5)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0323 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0324
     * @tc.name testEnumSampling0324
     * @tc.desc Verify a repeated radial gradient repeats every radius distance from the center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0324', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0324 begin');
      await runCase('testEnumSampling0324', async () => {
        const buffer: ArrayBuffer = await radialBuffer(drawing.TileMode.REPEAT, 40);
        const near: number = redAt(buffer, 120, 100);
        const far: number = redAt(buffer, 160, 100);
        expect(Math.abs(near - far) <= 3).assertTrue();
        expect(alphaAt(buffer, 160, 100)).assertEqual(255);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0324 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0325
     * @tc.name testEnumSampling0325
     * @tc.desc Verify a repeated conical gradient paints the whole canvas with the ramp colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0325', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0325 begin');
      await runCase('testEnumSampling0325', async () => {
        const buffer: ArrayBuffer = await conicalBuffer(drawing.TileMode.REPEAT);
        expect(countInkedPixels(buffer)).assertEqual(18700);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(redAt(buffer, 100, 100) + blueAt(buffer, 100, 100) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0325 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0326
     * @tc.name testEnumSampling0326
     * @tc.desc Verify a full circle sweep is unaffected by switching from clamp to repeat.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0326', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0326 begin');
      await runCase('testEnumSampling0326', async () => {
        const repeat: ArrayBuffer = await sweepBuffer(drawing.TileMode.REPEAT);
        const clamp: ArrayBuffer = await sweepBuffer(drawing.TileMode.CLAMP);
        expect(countInkedPixels(repeat)).assertEqual(countInkedPixels(clamp));
        expect(greenAt(repeat, 100, 5)).assertEqual(greenAt(clamp, 100, 5));
        expect(greenAt(repeat, 5, 100)).assertEqual(greenAt(clamp, 5, 100));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0326 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0327
     * @tc.name testEnumSampling0327
     * @tc.desc Verify a narrow repeated span tiles many times over the canvas width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0327', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0327 begin');
      await runCase('testEnumSampling0327', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.REPEAT, 100, 110);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(Math.abs(greenAt(buffer, 5, 50) - greenAt(buffer, 15, 50)) <= 3).assertTrue();
        expect(greenAt(buffer, 105, 50) > 118).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0327 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0328
     * @tc.name testEnumSampling0328
     * @tc.desc Verify TileMode.MIRROR keeps index 2 and still paints the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0328', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0328 begin');
      await runCase('testEnumSampling0328', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.MIRROR, 50, 150);
        expect(drawing.TileMode.MIRROR).assertEqual(2);
        expect(drawing.TileMode.REPEAT < drawing.TileMode.MIRROR).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0328 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0329
     * @tc.name testEnumSampling0329
     * @tc.desc Verify mirroring folds the left start edge back instead of jumping to the end color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0329', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0329 begin');
      await runCase('testEnumSampling0329', async () => {
        const mirror: ArrayBuffer = await linearBuffer(drawing.TileMode.MIRROR, 50, 150);
        const repeat: ArrayBuffer = await linearBuffer(drawing.TileMode.REPEAT, 50, 150);
        expect(greenAt(mirror, 10, 100) > 50).assertTrue();
        expect(greenAt(mirror, 10, 100) < greenAt(repeat, 10, 100)).assertTrue();
        expect(alphaAt(mirror, 10, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0329 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0330
     * @tc.name testEnumSampling0330
     * @tc.desc Verify a mirrored gradient is symmetric around the left edge of its span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0330', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0330 begin');
      await runCase('testEnumSampling0330', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.MIRROR, 50, 150);
        const outside: number = greenAt(buffer, 30, 100);
        const inside: number = greenAt(buffer, 70, 100);
        expect(Math.abs(outside - inside) <= 3).assertTrue();
        expect(outside < 80).assertTrue();
        expect(greenAt(buffer, 50, 100)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0330 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0331
     * @tc.name testEnumSampling0331
     * @tc.desc Verify a mirrored gradient stays darker than the clamped end color on the right side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0331', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0331 begin');
      await runCase('testEnumSampling0331', async () => {
        const mirror: ArrayBuffer = await linearBuffer(drawing.TileMode.MIRROR, 50, 150);
        const clamp: ArrayBuffer = await linearBuffer(drawing.TileMode.CLAMP, 50, 150);
        const edge: number = greenAt(mirror, 190, 100);
        expect(edge < greenAt(clamp, 190, 100)).assertTrue();
        expect(edge > 100).assertTrue();
        expect(greenAt(mirror, 190, 20)).assertEqual(edge);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0331 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0332
     * @tc.name testEnumSampling0332
     * @tc.desc Verify mirror and repeat order the same outside pixel differently on the right side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0332', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0332 begin');
      await runCase('testEnumSampling0332', async () => {
        const mirror: ArrayBuffer = await linearBuffer(drawing.TileMode.MIRROR, 50, 150);
        const repeat: ArrayBuffer = await linearBuffer(drawing.TileMode.REPEAT, 50, 150);
        expect(greenAt(repeat, 185, 100) < greenAt(mirror, 185, 100)).assertTrue();
        expect(greenAt(mirror, 185, 100) > 120).assertTrue();
        expect(greenAt(repeat, 185, 100) < 130).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0332 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0333
     * @tc.name testEnumSampling0333
     * @tc.desc Verify a mirrored vertical gradient folds above its top edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0333', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0333 begin');
      await runCase('testEnumSampling0333', async () => {
        const colors: number[] = [0xFF000000, 0xFFFFFFFF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createLinearGradient(point(HALF, 40),
          point(HALF, 100), colors, drawing.TileMode.MIRROR);
        const buffer: ArrayBuffer = await fillShader(shader);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(Math.abs(greenAt(buffer, HALF, 30) - greenAt(buffer, HALF, 50))).assertEqual(5);
        expect(greenAt(buffer, HALF, 40)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0333 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0334
     * @tc.name testEnumSampling0334
     * @tc.desc Verify a mirrored radial gradient folds around its outer radius boundary.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0334', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0334 begin');
      await runCase('testEnumSampling0334', async () => {
        const buffer: ArrayBuffer = await radialBuffer(drawing.TileMode.MIRROR, 40);
        const inner: number = redAt(buffer, 130, 100);
        const outer: number = redAt(buffer, 150, 100);
        expect(Math.abs(inner - outer) <= 12).assertTrue();
        expect(alphaAt(buffer, 150, 100)).assertEqual(255);
        expect(redAt(buffer, 100, 100)).assertEqual(250);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0334 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0335
     * @tc.name testEnumSampling0335
     * @tc.desc Verify every tile mode keeps full coverage on a conical gradient.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0335', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0335 begin');
      await runCase('testEnumSampling0335', async () => {
        const clamp: ArrayBuffer = await conicalBuffer(drawing.TileMode.CLAMP);
        const repeat: ArrayBuffer = await conicalBuffer(drawing.TileMode.REPEAT);
        const mirror: ArrayBuffer = await conicalBuffer(drawing.TileMode.MIRROR);
        const decal: ArrayBuffer = await conicalBuffer(drawing.TileMode.DECAL);
        expect(countInkedPixels(clamp)).assertEqual(18700);
        expect(countInkedPixels(repeat)).assertEqual(18700);
        expect(countInkedPixels(mirror)).assertEqual(18700);
        expect(countInkedPixels(decal)).assertEqual(1238);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0335 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0336
     * @tc.name testEnumSampling0336
     * @tc.desc Verify TileMode.DECAL keeps index 3 and drops pixels outside the gradient span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0336', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0336 begin');
      await runCase('testEnumSampling0336', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.DECAL, 50, 150);
        expect(drawing.TileMode.DECAL).assertEqual(3);
        expect(alphaAt(buffer, 10, 100)).assertEqual(0);
        expect(inkColumns(buffer, 0, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0336 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0337
     * @tc.name testEnumSampling0337
     * @tc.desc Verify decal paints only the columns covered by its gradient span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0337', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0337 begin');
      await runCase('testEnumSampling0337', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.DECAL, 50, 150);
        expect(inkColumns(buffer, 60, 140)).assertEqual(80 * SIZE);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 18000).assertTrue();
        expect(inked < 22000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0337 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0338
     * @tc.name testEnumSampling0338
     * @tc.desc Verify decal covers less canvas than clamp while keeping the span opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0338', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0338 begin');
      await runCase('testEnumSampling0338', async () => {
        const decal: ArrayBuffer = await linearBuffer(drawing.TileMode.DECAL, 50, 150);
        const clamp: ArrayBuffer = await linearBuffer(drawing.TileMode.CLAMP, 50, 150);
        expect(countInkedPixels(decal) < countInkedPixels(clamp)).assertTrue();
        expect(alphaAt(decal, 100, 100)).assertEqual(255);
        expect(alphaAt(decal, 150, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0338 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0339
     * @tc.name testEnumSampling0339
     * @tc.desc Verify a decal radial gradient leaves the canvas corners transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0339', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0339 begin');
      await runCase('testEnumSampling0339', async () => {
        const buffer: ArrayBuffer = await radialBuffer(drawing.TileMode.DECAL, 40);
        expect(alphaAt(buffer, 0, 0)).assertEqual(0);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 4500).assertTrue();
        expect(inked < 5500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0339 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0340
     * @tc.name testEnumSampling0340
     * @tc.desc Verify a decal sweep gradient needs no tiling and fills the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0340', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0340 begin');
      await runCase('testEnumSampling0340', async () => {
        const buffer: ArrayBuffer = await sweepBuffer(drawing.TileMode.DECAL);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(alphaAt(buffer, 0, 0)).assertEqual(255);
        expect(alphaAt(buffer, 199, 199)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0340 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0341
     * @tc.name testEnumSampling0341
     * @tc.desc Verify a decal blur filter fades the blurred block to transparent at the corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0341', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0341 begin');
      await runCase('testEnumSampling0341', async () => {
        const buffer: ArrayBuffer = await blurBuffer(10, drawing.TileMode.DECAL, null);
        expect(alphaAt(buffer, 5, 5)).assertEqual(0);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 14400).assertTrue();
        expect(inked < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0341 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0342
     * @tc.name testEnumSampling0342
     * @tc.desc Verify a narrow decal span inks only its own twenty columns.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0342', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0342 begin');
      await runCase('testEnumSampling0342', async () => {
        const buffer: ArrayBuffer = await linearBuffer(drawing.TileMode.DECAL, 90, 110);
        expect(inkColumns(buffer, 0, 90)).assertEqual(0);
        expect(inkColumns(buffer, 110, 200)).assertEqual(0);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 3600).assertTrue();
        expect(inked < 4400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0342 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0343
     * @tc.name testEnumSampling0343
     * @tc.desc Verify a decal gradient drawn inside a small rectangle clips at the span start.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0343', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0343 begin');
      await runCase('testEnumSampling0343', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(linearShader(drawing.TileMode.DECAL, 50, 150));
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(20, 20, 80, 80));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkColumns(buffer, 20, 50)).assertEqual(0);
        expect(alphaAt(buffer, 60, 40)).assertEqual(255);
        expect(alphaAt(buffer, 90, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0343 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0344
     * @tc.name testEnumSampling0344
     * @tc.desc Verify SrcRectConstraint.STRICT keeps index 0 and copies a whole image.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0344', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0344 begin');
      await runCase('testEnumSampling0344', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 90, 40, 10));
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(0, 0, SIZE, SIZE),
          ltrb(0, 0, SIZE, SIZE), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.STRICT);
        expect(drawing.SrcRectConstraint.STRICT).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(greenAt(buffer, 100, 100)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0344 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0345
     * @tc.name testEnumSampling0345
     * @tc.desc Verify SrcRectConstraint.FAST keeps index 1 and copies a whole image.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0345', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0345 begin');
      await runCase('testEnumSampling0345', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 90, 40, 10));
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(0, 0, SIZE, SIZE),
          ltrb(0, 0, SIZE, SIZE), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.FAST);
        expect(drawing.SrcRectConstraint.FAST).assertEqual(1);
        expect(drawing.SrcRectConstraint.STRICT
          < drawing.SrcRectConstraint.FAST).assertTrue();
        expect(alphaAt(buffer, 0, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0345 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0346
     * @tc.name testEnumSampling0346
     * @tc.desc Verify strict and fast constraints match for an unscaled whole image copy.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0346', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0346 begin');
      await runCase('testEnumSampling0346', async () => {
        const source: OffscreenTarget = await quadSource();
        const view: common2D.Rect = ltrb(0, 0, SIZE, SIZE);
        const strict: ArrayBuffer = await drawSrcRectAt(source, view, view,
          drawing.FilterMode.FILTER_MODE_NEAREST, drawing.SrcRectConstraint.STRICT);
        const fast: ArrayBuffer = await drawSrcRectAt(source, view, view,
          drawing.FilterMode.FILTER_MODE_NEAREST, drawing.SrcRectConstraint.FAST);
        expect(countInkedPixels(strict)).assertEqual(countInkedPixels(fast));
        expect(redAt(strict, 20, 180)).assertEqual(redAt(fast, 20, 180));
        expect(alphaAt(fast, 20, 180)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0346 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0347
     * @tc.name testEnumSampling0347
     * @tc.desc Verify the omitted constraint behaves like SrcRectConstraint.STRICT.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0347', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0347 begin');
      await runCase('testEnumSampling0347', async () => {
        const source: OffscreenTarget = await quadSource();
        const view: common2D.Rect = ltrb(HALF, HALF, SIZE, SIZE);
        const fallback: ArrayBuffer = await drawSrcRectDefault(source, view, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const strict: ArrayBuffer = await drawSrcRectAt(source, view, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST, drawing.SrcRectConstraint.STRICT);
        expect(countInkedPixels(fallback)).assertEqual(countInkedPixels(strict));
        expect(redAt(fallback, 100, 100)).assertEqual(redAt(strict, 100, 100));
        expect(countInkedPixels(strict) < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0347 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0348
     * @tc.name testEnumSampling0348
     * @tc.desc Verify a strict crop of the red quadrant expands to the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0348', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0348 begin');
      await runCase('testEnumSampling0348', async () => {
        const source: OffscreenTarget = await quadSource();
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(0, 0, HALF, HALF),
          ltrb(0, 0, SIZE, SIZE), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.STRICT);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(redAt(buffer, 5, 5)).assertEqual(255);
        expect(greenAt(buffer, 190, 190)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0348 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0349
     * @tc.name testEnumSampling0349
     * @tc.desc Verify a fast crop of the green quadrant expands to the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0349', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0349 begin');
      await runCase('testEnumSampling0349', async () => {
        const source: OffscreenTarget = await quadSource();
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(HALF, 0, SIZE, HALF),
          ltrb(0, 0, SIZE, SIZE), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.FAST);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(greenAt(buffer, 100, 100)).assertEqual(255);
        expect(redAt(buffer, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0349 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0350
     * @tc.name testEnumSampling0350
     * @tc.desc Verify a blue quadrant crop drawn into a quarter destination stays in that corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0350', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0350 begin');
      await runCase('testEnumSampling0350', async () => {
        const source: OffscreenTarget = await quadSource();
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(0, HALF, HALF, SIZE),
          ltrb(0, 0, HALF, HALF), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.STRICT);
        expect(countInkedPixels(buffer)).assertEqual(QUARTER);
        expect(blueAt(buffer, 50, 50)).assertEqual(255);
        expect(inkColumns(buffer, 110, 200)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0350 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0351
     * @tc.name testEnumSampling0351
     * @tc.desc Verify cropping the transparent quadrant with fast sampling paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0351', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0351 begin');
      await runCase('testEnumSampling0351', async () => {
        const source: OffscreenTarget = await quadSource();
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(HALF, HALF, SIZE, SIZE),
          ltrb(0, 0, SIZE, SIZE), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.FAST);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
        expect(inkColumns(buffer, 0, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0351 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0352
     * @tc.name testEnumSampling0352
     * @tc.desc Verify a strict small crop magnified four times fills the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0352', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0352 begin');
      await runCase('testEnumSampling0352', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 70, 140, 210));
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(0, 0, 50, 50),
          ltrb(0, 0, SIZE, SIZE), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.STRICT);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(blueAt(buffer, 0, 0)).assertEqual(210);
        expect(alphaAt(buffer, 199, 199)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0352 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0353
     * @tc.name testEnumSampling0353
     * @tc.desc Verify fast and strict constraints agree on a solid magnified crop.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0353', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0353 begin');
      await runCase('testEnumSampling0353', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 70, 140, 210));
        const crop: common2D.Rect = ltrb(0, 0, 50, 50);
        const fast: ArrayBuffer = await drawSrcRectAt(source, crop, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR, drawing.SrcRectConstraint.FAST);
        const strict: ArrayBuffer = await drawSrcRectAt(source, crop, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR, drawing.SrcRectConstraint.STRICT);
        expect(countInkedPixels(fast)).assertEqual(countInkedPixels(strict));
        expect(greenAt(fast, 0, 199)).assertEqual(greenAt(strict, 0, 199));
        expect(greenAt(strict, 0, 199)).assertEqual(140);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0353 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0354
     * @tc.name testEnumSampling0354
     * @tc.desc Verify a strict crop drawn into a smaller destination leaves the rest untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0354', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0354 begin');
      await runCase('testEnumSampling0354', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 20, 240, 20));
        const buffer: ArrayBuffer = await drawSrcRectAt(source, ltrb(20, 20, 120, 120),
          ltrb(0, 0, 100, 100), drawing.FilterMode.FILTER_MODE_NEAREST,
          drawing.SrcRectConstraint.STRICT);
        expect(countInkedPixels(buffer)).assertEqual(QUARTER);
        expect(greenAt(buffer, 50, 50)).assertEqual(240);
        expect(inkColumns(buffer, QUARTER / SIZE, SIZE)).assertEqual(5000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0354 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0355
     * @tc.name testEnumSampling0355
     * @tc.desc Verify strict and fast crops can be combined on one canvas without overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0355', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0355 begin');
      await runCase('testEnumSampling0355', async () => {
        const source: OffscreenTarget = await splitSource(SIZE, rgba(255, 255, 0, 0), rgba(255, 0, 0, 255));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const options: drawing.SamplingOptions = new drawing.SamplingOptions(
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, HALF, SIZE), ltrb(0, 0, HALF, SIZE),
          options, drawing.SrcRectConstraint.STRICT);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(HALF, 0, SIZE, SIZE),
          ltrb(HALF, 0, SIZE, SIZE), options, drawing.SrcRectConstraint.FAST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(redAt(buffer, 50, 100)).assertEqual(255);
        expect(blueAt(buffer, 150, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0355 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0356
     * @tc.name testEnumSampling0356
     * @tc.desc Verify RectType.DEFAULT keeps index 0 and draws the image into every lattice cell.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0356', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0356 begin');
      await runCase('testEnumSampling0356', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await typedLatticeBuffer(source, uniformTypes(drawing.RectType.DEFAULT),
          uniformColors(rgba(255, 255, 0, 0)));
        expect(drawing.RectType.DEFAULT).assertEqual(0);
        expect(countInkedPixels(buffer) > 30000).assertTrue();
        expect(greenAt(buffer, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0356 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0357
     * @tc.name testEnumSampling0357
     * @tc.desc Verify RectType.TRANSPARENT keeps index 1 and leaves the whole lattice empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0357', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0357 begin');
      await runCase('testEnumSampling0357', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await typedLatticeBuffer(source,
          uniformTypes(drawing.RectType.TRANSPARENT), uniformColors(rgba(255, 255, 0, 0)));
        expect(drawing.RectType.TRANSPARENT).assertEqual(1);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0357 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0358
     * @tc.name testEnumSampling0358
     * @tc.desc Verify RectType.FIXEDCOLOR keeps index 2 and fills cells with the palette color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumSampling0358', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0358 begin');
      await runCase('testEnumSampling0358', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await typedLatticeBuffer(source,
          uniformTypes(drawing.RectType.FIXEDCOLOR), uniformColors(rgba(255, 255, 0, 0)));
        expect(drawing.RectType.FIXEDCOLOR).assertEqual(2);
        expect(countInkedPixels(buffer) > 30000).assertTrue();
        expect(redAt(buffer, 100, 100)).assertEqual(255);
        expect(greenAt(buffer, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0358 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0359
     * @tc.name testEnumSampling0359
     * @tc.desc Verify the three rectangle types are ordered DEFAULT then TRANSPARENT then FIXEDCOLOR.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumSampling0359', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0359 begin');
      await runCase('testEnumSampling0359', async () => {
        expect(drawing.RectType.DEFAULT < drawing.RectType.TRANSPARENT).assertTrue();
        expect(drawing.RectType.TRANSPARENT < drawing.RectType.FIXEDCOLOR).assertTrue();
        expect(drawing.RectType.FIXEDCOLOR - drawing.RectType.DEFAULT).assertEqual(2);
        expect(drawing.RectType.DEFAULT + drawing.RectType.TRANSPARENT).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0359 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0360
     * @tc.name testEnumSampling0360
     * @tc.desc Verify mixing default and transparent cells drops ink from half of the lattice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0360', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0360 begin');
      await runCase('testEnumSampling0360', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const types: drawing.RectType[] = [drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
          drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT];
        const buffer: ArrayBuffer = await typedLatticeBuffer(source, types, uniformColors(rgba(255, 255, 0, 0)));
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) < AREA).assertTrue();
        expect(channelAbove(buffer, 1, 200) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0360 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0361
     * @tc.name testEnumSampling0361
     * @tc.desc Verify one fixed color cell among transparent cells only inks the palette color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0361', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0361 begin');
      await runCase('testEnumSampling0361', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const types: drawing.RectType[] = [drawing.RectType.FIXEDCOLOR, drawing.RectType.TRANSPARENT,
          drawing.RectType.TRANSPARENT, drawing.RectType.TRANSPARENT];
        const buffer: ArrayBuffer = await typedLatticeBuffer(source, types, uniformColors(rgba(255, 255, 0, 0)));
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(channelAbove(buffer, 0, 200) > 0).assertTrue();
        expect(channelAbove(buffer, 1, 200)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0361 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0362
     * @tc.name testEnumSampling0362
     * @tc.desc Verify a four color palette fills the lattice with all four palette colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0362', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0362 begin');
      await runCase('testEnumSampling0362', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const colors: common2D.Color[] = [rgba(255, 255, 0, 0), rgba(255, 0, 255, 0),
          rgba(255, 0, 0, 255), rgba(255, 255, 255, 0)];
        const buffer: ArrayBuffer = await typedLatticeBuffer(source,
          uniformTypes(drawing.RectType.FIXEDCOLOR), colors);
        expect(countInkedPixels(buffer) > 30000).assertTrue();
        expect(channelAbove(buffer, 0, 200) > 0).assertTrue();
        expect(channelAbove(buffer, 1, 200) > 0).assertTrue();
        expect(channelAbove(buffer, 2, 200) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0362 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0363
     * @tc.name testEnumSampling0363
     * @tc.desc Verify a fully transparent palette color leaves a fixed color lattice empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0363', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0363 begin');
      await runCase('testEnumSampling0363', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await typedLatticeBuffer(source,
          uniformTypes(drawing.RectType.FIXEDCOLOR), uniformColors(rgba(0, 255, 0, 0)));
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 50, 150)).assertEqual(0);
        expect(channelAbove(buffer, 3, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0363 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0364
     * @tc.name testEnumSampling0364
     * @tc.desc Verify default and fixed color lattices cover the same area with different colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumSampling0364', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0364 begin');
      await runCase('testEnumSampling0364', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const drawn: ArrayBuffer = await typedLatticeBuffer(source, uniformTypes(drawing.RectType.DEFAULT),
          uniformColors(rgba(255, 255, 0, 0)));
        const filled: ArrayBuffer = await typedLatticeBuffer(source, uniformTypes(drawing.RectType.FIXEDCOLOR),
          uniformColors(rgba(255, 255, 0, 0)));
        expect(countInkedPixels(filled)).assertEqual(countInkedPixels(drawn));
        expect(countInkedPixels(filled) > 30000).assertTrue();
        expect(redAt(filled, 100, 100) > redAt(drawn, 100, 100)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0364 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0365
     * @tc.name testEnumSampling0365
     * @tc.desc Verify a six cell lattice with default types draws the image everywhere.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0365', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0365 begin');
      await runCase('testEnumSampling0365', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const types: drawing.RectType[] = [drawing.RectType.DEFAULT, drawing.RectType.DEFAULT,
          drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT, drawing.RectType.DEFAULT];
        const colors: common2D.Color[] = [rgba(255, 255, 0, 0), rgba(255, 255, 0, 0), rgba(255, 255, 0, 0),
          rgba(255, 255, 0, 0), rgba(255, 255, 0, 0), rgba(255, 255, 0, 0)];
        const buffer: ArrayBuffer = await drawLatticeAt(source, rowLattice(types, colors),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(countInkedPixels(buffer) > 30000).assertTrue();
        expect(greenAt(buffer, 60, 100)).assertEqual(255);
        expect(redAt(buffer, 180, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0365 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0366
     * @tc.name testEnumSampling0366
     * @tc.desc Verify a six cell lattice of transparent types paints nothing at all.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0366', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0366 begin');
      await runCase('testEnumSampling0366', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const types: drawing.RectType[] = [drawing.RectType.TRANSPARENT, drawing.RectType.TRANSPARENT,
          drawing.RectType.TRANSPARENT, drawing.RectType.TRANSPARENT, drawing.RectType.TRANSPARENT,
          drawing.RectType.TRANSPARENT];
        const colors: common2D.Color[] = [rgba(255, 255, 0, 0), rgba(255, 255, 0, 0), rgba(255, 255, 0, 0),
          rgba(255, 255, 0, 0), rgba(255, 255, 0, 0), rgba(255, 255, 0, 0)];
        const buffer: ArrayBuffer = await drawLatticeAt(source, rowLattice(types, colors),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
        expect(inkColumns(buffer, 0, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0366 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0367
     * @tc.name testEnumSampling0367
     * @tc.desc Verify alternating default and transparent cells ink part of a six cell lattice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumSampling0367', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0367 begin');
      await runCase('testEnumSampling0367', async () => {
        const source: OffscreenTarget = await solidSource(rgba(255, 0, 255, 0));
        const types: drawing.RectType[] = [drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT,
          drawing.RectType.DEFAULT, drawing.RectType.TRANSPARENT, drawing.RectType.DEFAULT,
          drawing.RectType.TRANSPARENT];
        const colors: common2D.Color[] = [rgba(255, 255, 0, 0), rgba(255, 255, 0, 0), rgba(255, 255, 0, 0),
          rgba(255, 255, 0, 0), rgba(255, 255, 0, 0), rgba(255, 255, 0, 0)];
        const buffer: ArrayBuffer = await drawLatticeAt(source, rowLattice(types, colors),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) < AREA).assertTrue();
        expect(channelAbove(buffer, 1, 200)).assertEqual(20000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumSampling0367 end');
    });
  });
}
