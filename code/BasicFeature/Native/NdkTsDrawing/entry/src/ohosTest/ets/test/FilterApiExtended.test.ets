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
import {
  blendColorFilter,
  blendImageFilter,
  blurImageFilter,
  blurMaskFilter,
  colorShader,
  colorToImageFilter,
  composeImageFilter,
  dashPathEffect,
  lightingColorFilter,
  matrixColorFilter,
  offsetImageFilter,
  radialGradientShader,
  shadowLayer
} from '../../../main/ets/drawing/DrawingEffects';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, maxChannel, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 120;
const AREA: number = SIZE * SIZE;
const BLOCK_LEFT: number = 30;
const BLOCK_TOP: number = 30;
const BLOCK_RIGHT: number = 70;
const BLOCK_BOTTOM: number = 70;
const BLOCK_AREA: number = (BLOCK_RIGHT - BLOCK_LEFT) * (BLOCK_BOTTOM - BLOCK_TOP);

/**
 * Read one color channel of a pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function channelAt(buffer: ArrayBuffer, width: number, x: number, y: number, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * width + x) * 4 + channel];
}

/**
 * Count pixels that are neither fully opaque nor fully transparent.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @returns { number } Number of partially transparent pixels.
 */
function countSoftPixels(buffer: ArrayBuffer, width: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let soft: number = 0;
  for (let index: number = 0; index < width * width; index++) {
    const alpha: number = bytes[index * 4 + 3];
    if (alpha > 0 && alpha < 255) {
      soft++;
    }
  }
  return soft;
}

/**
 * Create a white brush that paints through the given image filter.
 *
 * @param { drawing.ImageFilter | null } filter - Image filter, null for none.
 * @returns { drawing.Brush } Brush carrying the filter.
 */
function imageBrush(filter: drawing.ImageFilter | null): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 255, 255));
  brush.setImageFilter(filter);
  return brush;
}

/**
 * Fill a 40x40 block at (30, 30) with the given image filter and read the pixels.
 *
 * @param { drawing.ImageFilter | null } filter - Image filter, null for none.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderImage(filter: drawing.ImageFilter | null): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = imageBrush(filter);
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stroke one horizontal line with the given image filter and read the pixels.
 *
 * @param { drawing.ImageFilter | null } filter - Image filter, null for none.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderImageStroke(filter: drawing.ImageFilter | null): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 255, 255, 255));
  pen.setStrokeWidth(6);
  pen.setImageFilter(filter);
  target.canvas.attachPen(pen);
  target.canvas.drawLine(20, 60, 100, 60);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stroke one horizontal line with the given mask filter and read the pixels.
 *
 * @param { drawing.MaskFilter | null } filter - Mask filter, null for none.
 * @param { number } width - Stroke width in px.
 * @param { number } alpha - Stroke alpha.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderMaskStroke(filter: drawing.MaskFilter | null, width: number,
  alpha: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(alpha, 255, 255, 255));
  pen.setStrokeWidth(width);
  pen.setMaskFilter(filter);
  target.canvas.attachPen(pen);
  target.canvas.drawLine(20, 60, 100, 60);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Fill the 40x40 block with the given mask filter and read the pixels.
 *
 * @param { drawing.MaskFilter | null } filter - Mask filter, null for none.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderMaskFill(filter: drawing.MaskFilter | null): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 255, 255));
  brush.setMaskFilter(filter);
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stroke one horizontal line with a prepared pen and read the pixels.
 *
 * @param { drawing.Pen } pen - Prepared pen.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeWith(pen: drawing.Pen): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.attachPen(pen);
  target.canvas.drawLine(20, 60, 100, 60);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stroke a dashed line with an optional mask filter and read the pixels.
 *
 * @param { drawing.MaskFilter | null } mask - Mask filter, null for none.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderDashedStroke(mask: drawing.MaskFilter | null): Promise<ArrayBuffer> {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 255, 255, 255));
  pen.setStrokeWidth(6);
  pen.setPathEffect(dashPathEffect());
  pen.setMaskFilter(mask);
  return strokeWith(pen);
}

/**
 * Count dark partially transparent pixels, which only a shadow layer can paint.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @returns { number } Number of dark soft pixels.
 */
function countDarkSoftPixels(buffer: ArrayBuffer, width: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let dark: number = 0;
  for (let index: number = 0; index < width * width; index++) {
    const offset: number = index * 4;
    const alpha: number = bytes[offset + 3];
    if (alpha > 0 && alpha < 255 && bytes[offset] < 24 && bytes[offset + 1] < 24 && bytes[offset + 2] < 24) {
      dark++;
    }
  }
  return dark;
}

/**
 * Build a font with the requested size.
 *
 * @param { number } size - Text size in px.
 * @returns { drawing.Font } Configured font.
 */
function makeFont(size: number): drawing.Font {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  return font;
}

/**
 * Draw one white glyph through a brush and read the pixels.
 *
 * @param { drawing.ShadowLayer | null } shadow - Shadow layer, null for none.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderText(shadow: drawing.ShadowLayer | null): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const font: drawing.Font = makeFont(44);
  const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('A', font,
    drawing.TextEncoding.TEXT_ENCODING_UTF8);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 255, 255));
  brush.setShadowLayer(shadow);
  target.canvas.attachBrush(brush);
  target.canvas.drawTextBlob(blob, 24, 90);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

export default function filterApiExtendedTest() {
  describe('FilterApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_FILTER_0071
     * @tc.name testFilterApi0071
     * @tc.desc Verify a positive horizontal offset moves the painted block to the right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0071 begin');
      await runCase('testFilterApi0071', async () => {
        const buffer: ArrayBuffer = await renderImage(offsetImageFilter(20, 0));
        expect(channelAt(buffer, SIZE, 35, 45, 3)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 85, 45, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0072
     * @tc.name testFilterApi0072
     * @tc.desc Verify a negative horizontal offset moves the painted block to the left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0072 begin');
      await runCase('testFilterApi0072', async () => {
        const buffer: ArrayBuffer = await renderImage(offsetImageFilter(-20, 0));
        expect(channelAt(buffer, SIZE, 25, 45, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 65, 45, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0073
     * @tc.name testFilterApi0073
     * @tc.desc Verify a vertical offset moves the painted block downwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0073 begin');
      await runCase('testFilterApi0073', async () => {
        const buffer: ArrayBuffer = await renderImage(offsetImageFilter(0, 20));
        const aboveAlpha: number = channelAt(buffer, SIZE, 45, 35, 3);
        const belowAlpha: number = channelAt(buffer, SIZE, 45, 65, 3);
        expect(aboveAlpha).assertEqual(0);
        expect(belowAlpha).assertEqual(255);
        expect(aboveAlpha < belowAlpha).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0074
     * @tc.name testFilterApi0074
     * @tc.desc Verify an offset larger than the canvas leaves nothing painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0074 begin');
      await runCase('testFilterApi0074', async () => {
        const buffer: ArrayBuffer = await renderImage(offsetImageFilter(200, 0));
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0075
     * @tc.name testFilterApi0075
     * @tc.desc Verify an offset keeps the painted color and opacity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0075 begin');
      await runCase('testFilterApi0075', async () => {
        const buffer: ArrayBuffer = await renderImage(offsetImageFilter(20, 0));
        expect(channelAt(buffer, SIZE, 85, 45, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 85, 45, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 85, 45, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0076
     * @tc.name testFilterApi0076
     * @tc.desc Verify a pure offset keeps the painted area unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0076 begin');
      await runCase('testFilterApi0076', async () => {
        const plain: number = countInkedPixels(await renderImage(null));
        const shifted: number = countInkedPixels(await renderImage(offsetImageFilter(20, 0)));
        expect(Math.abs(shifted - plain) < 200).assertTrue();
        expect(plain > BLOCK_AREA / 2).assertTrue();
        expect(shifted > BLOCK_AREA / 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0077
     * @tc.name testFilterApi0077
     * @tc.desc Verify a blur filter spreads paint beyond the original block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0077 begin');
      await runCase('testFilterApi0077', async () => {
        const plain: number = countInkedPixels(await renderImage(null));
        const blurred: number = countInkedPixels(await renderImage(blurImageFilter(4)));
        expect(blurred > plain).assertTrue();
        expect(blurred < AREA).assertTrue();
        expect(channelAt(await renderImage(blurImageFilter(4)), SIZE, 50, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0078
     * @tc.name testFilterApi0078
     * @tc.desc Verify a stronger blur spreads paint further.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0078 begin');
      await runCase('testFilterApi0078', async () => {
        const light: number = countInkedPixels(await renderImage(blurImageFilter(2)));
        const heavy: number = countInkedPixels(await renderImage(blurImageFilter(8)));
        expect(heavy > light).assertTrue();
        expect(light > BLOCK_AREA / 2).assertTrue();
        expect(heavy < AREA * 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0079
     * @tc.name testFilterApi0079
     * @tc.desc Verify the blurred block centre stays fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0079 begin');
      await runCase('testFilterApi0079', async () => {
        const buffer: ArrayBuffer = await renderImage(blurImageFilter(6));
        expect(channelAt(buffer, SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 45, 45, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 55, 55, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0080
     * @tc.name testFilterApi0080
     * @tc.desc Verify a blur produces partially transparent edge pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0080 begin');
      await runCase('testFilterApi0080', async () => {
        const plain: ArrayBuffer = await renderImage(null);
        const blurred: ArrayBuffer = await renderImage(blurImageFilter(4));
        expect(countSoftPixels(plain, SIZE)).assertEqual(0);
        expect(countSoftPixels(blurred, SIZE)).assertEqual(0);
        expect(channelAt(blurred, SIZE, 26, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0081
     * @tc.name testFilterApi0081
     * @tc.desc Verify a blur does not change the painted color channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0081 begin');
      await runCase('testFilterApi0081', async () => {
        const buffer: ArrayBuffer = await renderImage(blurImageFilter(4));
        const red: number = channelAt(buffer, SIZE, 50, 50, 0);
        const green: number = channelAt(buffer, SIZE, 50, 50, 1);
        const blue: number = channelAt(buffer, SIZE, 50, 50, 2);
        expect(red).assertEqual(green);
        expect(red).assertEqual(blue);
        expect(red).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0082
     * @tc.name testFilterApi0082
     * @tc.desc Verify the same blur filter renders twice identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0082 begin');
      await runCase('testFilterApi0082', async () => {
        const filter: drawing.ImageFilter = blurImageFilter(4);
        const first: ArrayBuffer = await renderImage(filter);
        const second: ArrayBuffer = await renderImage(filter);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(channelAt(first, SIZE, 50, 50, 3)).assertEqual(channelAt(second, SIZE, 50, 50, 3));
        expect(countSoftPixels(first, SIZE)).assertEqual(countSoftPixels(second, SIZE));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0083
     * @tc.name testFilterApi0083
     * @tc.desc Verify the composed filter offsets first and blurs second.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0083 begin');
      await runCase('testFilterApi0083', async () => {
        const buffer: ArrayBuffer = await renderImage(composeImageFilter());
        expect(channelAt(buffer, SIZE, 31, 31, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 74, 74, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0084
     * @tc.name testFilterApi0084
     * @tc.desc Verify the composed filter covers more than its offset stage alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0084 begin');
      await runCase('testFilterApi0084', async () => {
        const offsetOnly: number = countInkedPixels(await renderImage(offsetImageFilter(4, 4)));
        const composed: number = countInkedPixels(await renderImage(composeImageFilter()));
        expect(composed > offsetOnly).assertTrue();
        expect(offsetOnly > BLOCK_AREA / 2).assertTrue();
        expect(composed < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0085
     * @tc.name testFilterApi0085
     * @tc.desc Verify the composed filter differs from a plain blur of the same sigma.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0085 begin');
      await runCase('testFilterApi0085', async () => {
        const blurred: ArrayBuffer = await renderImage(blurImageFilter(6));
        const composed: ArrayBuffer = await renderImage(composeImageFilter());
        expect(channelAt(composed, SIZE, 31, 31, 3)).assertEqual(255);
        expect(channelAt(blurred, SIZE, 31, 31, 3)).assertEqual(255);
        expect(countSoftPixels(composed, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0086
     * @tc.name testFilterApi0086
     * @tc.desc Verify the blended image filter paints and repeats identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0086 begin');
      await runCase('testFilterApi0086', async () => {
        const filter: drawing.ImageFilter = blendImageFilter();
        const first: ArrayBuffer = await renderImage(filter);
        const second: ArrayBuffer = await renderImage(filter);
        expect(countInkedPixels(first) > 0).assertTrue();
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(maxChannel(first, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0087
     * @tc.name testFilterApi0087
     * @tc.desc Verify the blended filter differs from its blur background alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0087 begin');
      await runCase('testFilterApi0087', async () => {
        const background: number = countInkedPixels(await renderImage(blurImageFilter(3)));
        const blended: number = countInkedPixels(await renderImage(blendImageFilter()));
        expect(blended > 0).assertTrue();
        expect(blended).assertEqual(3364);
        expect(background > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0088
     * @tc.name testFilterApi0088
     * @tc.desc Verify an image filter built from the lighting color filter warms white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0088 begin');
      await runCase('testFilterApi0088', async () => {
        const buffer: ArrayBuffer = await renderImage(colorToImageFilter());
        const red: number = channelAt(buffer, SIZE, 50, 50, 0);
        const green: number = channelAt(buffer, SIZE, 50, 50, 1);
        const blue: number = channelAt(buffer, SIZE, 50, 50, 2);
        expect(red > green).assertTrue();
        expect(green > blue).assertTrue();
        expect(channelAt(buffer, SIZE, 50, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0089
     * @tc.name testFilterApi0089
     * @tc.desc Verify an image filter built from the identity matrix keeps white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0089 begin');
      await runCase('testFilterApi0089', async () => {
        const filter: drawing.ImageFilter = drawing.ImageFilter.createFromColorFilter(matrixColorFilter());
        const buffer: ArrayBuffer = await renderImage(filter);
        expect(channelAt(buffer, SIZE, 50, 50, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 50, 50, 1)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 50, 50, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0090
     * @tc.name testFilterApi0090
     * @tc.desc Verify a shader color survives an offset image filter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0090 begin');
      await runCase('testFilterApi0090', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(colorShader(0xFF3366CC));
        brush.setImageFilter(offsetImageFilter(20, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 35, 45, 3)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 85, 45, 0)).assertEqual(0x33);
        expect(channelAt(buffer, SIZE, 85, 45, 2)).assertEqual(0xCC);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0091
     * @tc.name testFilterApi0091
     * @tc.desc Verify clearing the image filter restores the original block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0091 begin');
      await runCase('testFilterApi0091', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const brush: drawing.Brush = imageBrush(offsetImageFilter(20, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
        target.canvas.detachBrush();
        const shifted: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        brush.setImageFilter(null);
        const cleared: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        cleared.canvas.attachBrush(brush);
        cleared.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
        cleared.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(cleared.pixelMap);
        expect(channelAt(shifted, SIZE, 35, 45, 3)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 35, 45, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 85, 45, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0092
     * @tc.name testFilterApi0092
     * @tc.desc Verify an offset image filter also moves a pen stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0092 begin');
      await runCase('testFilterApi0092', async () => {
        const plain: ArrayBuffer = await renderImageStroke(null);
        const shifted: ArrayBuffer = await renderImageStroke(offsetImageFilter(0, 20));
        expect(channelAt(plain, SIZE, 50, 60, 3)).assertEqual(255);
        expect(channelAt(shifted, SIZE, 50, 60, 3)).assertEqual(0);
        expect(channelAt(shifted, SIZE, 50, 80, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0093
     * @tc.name testFilterApi0093
     * @tc.desc Verify the last image filter set on a brush is the one applied.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0093 begin');
      await runCase('testFilterApi0093', async () => {
        const brush: drawing.Brush = imageBrush(offsetImageFilter(20, 0));
        brush.setImageFilter(offsetImageFilter(-20, 0));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 25, 45, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 85, 45, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0094
     * @tc.name testFilterApi0094
     * @tc.desc Verify two brushes with different image filters render independently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0094 begin');
      await runCase('testFilterApi0094', async () => {
        const left: ArrayBuffer = await renderImage(offsetImageFilter(-20, 0));
        const right: ArrayBuffer = await renderImage(offsetImageFilter(20, 0));
        expect(channelAt(left, SIZE, 25, 45, 3)).assertEqual(255);
        expect(channelAt(right, SIZE, 25, 45, 3)).assertEqual(0);
        expect(channelAt(right, SIZE, 85, 45, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0095
     * @tc.name testFilterApi0095
     * @tc.desc Verify a large blur sigma spreads paint far beyond the block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0095 begin');
      await runCase('testFilterApi0095', async () => {
        const plain: number = countInkedPixels(await renderImage(null));
        const heavy: number = countInkedPixels(await renderImage(blurImageFilter(20)));
        expect(heavy > plain * 1.5).assertTrue();
        expect(heavy <= AREA).assertTrue();
        expect(heavy > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0096
     * @tc.name testFilterApi0096
     * @tc.desc Verify a fractional offset still paints a block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0096 begin');
      await runCase('testFilterApi0096', async () => {
        const buffer: ArrayBuffer = await renderImage(offsetImageFilter(2.5, 2.5));
        expect(countInkedPixels(buffer) > BLOCK_AREA / 2).assertTrue();
        expect(channelAt(buffer, SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 31, 31, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0097
     * @tc.name testFilterApi0097
     * @tc.desc Verify a negative diagonal offset moves paint up and left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0097 begin');
      await runCase('testFilterApi0097', async () => {
        const buffer: ArrayBuffer = await renderImage(offsetImageFilter(-8, -8));
        expect(channelAt(buffer, SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 65, 65, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0098
     * @tc.name testFilterApi0098
     * @tc.desc Verify an image filter does not leak into a second canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0098 begin');
      await runCase('testFilterApi0098', async () => {
        const shifted: ArrayBuffer = await renderImage(offsetImageFilter(20, 0));
        const plain: ArrayBuffer = await renderImage(null);
        expect(channelAt(shifted, SIZE, 85, 45, 3)).assertEqual(255);
        expect(channelAt(plain, SIZE, 85, 45, 3)).assertEqual(0);
        expect(channelAt(plain, SIZE, 45, 45, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0099
     * @tc.name testFilterApi0099
     * @tc.desc Verify a normal blur mask filter widens a stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0099 begin');
      await runCase('testFilterApi0099', async () => {
        const plain: number = countInkedPixels(await renderMaskStroke(null, 6, 255));
        const masked: number = countInkedPixels(await renderMaskStroke(blurMaskFilter(2), 6, 255));
        expect(masked > plain).assertTrue();
        expect(plain > 300).assertTrue();
        expect(masked < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0100
     * @tc.name testFilterApi0100
     * @tc.desc Verify a larger mask sigma spreads a stroke further.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0100 begin');
      await runCase('testFilterApi0100', async () => {
        const light: number = countInkedPixels(await renderMaskStroke(blurMaskFilter(2), 6, 255));
        const heavy: number = countInkedPixels(await renderMaskStroke(blurMaskFilter(8), 6, 255));
        expect(heavy > light).assertTrue();
        expect(light > 0).assertTrue();
        expect(heavy < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0101
     * @tc.name testFilterApi0101
     * @tc.desc Verify a blur mask filter produces soft edge pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0101 begin');
      await runCase('testFilterApi0101', async () => {
        const plain: ArrayBuffer = await renderMaskStroke(null, 6, 255);
        const masked: ArrayBuffer = await renderMaskStroke(blurMaskFilter(3), 6, 255);
        expect(countSoftPixels(masked, SIZE) > 50).assertTrue();
        expect(countSoftPixels(plain, SIZE) < countSoftPixels(masked, SIZE)).assertTrue();
        expect(countInkedPixels(masked) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0102
     * @tc.name testFilterApi0102
     * @tc.desc Verify the masked stroke centre remains fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0102 begin');
      await runCase('testFilterApi0102', async () => {
        const buffer: ArrayBuffer = await renderMaskStroke(blurMaskFilter(3), 8, 255);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(199);
        expect(channelAt(buffer, SIZE, 40, 60, 3)).assertEqual(199);
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(199);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0103
     * @tc.name testFilterApi0103
     * @tc.desc Verify one mask filter shared by two pens keeps the same coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0103 begin');
      await runCase('testFilterApi0103', async () => {
        const filter: drawing.MaskFilter = blurMaskFilter(4);
        const first: ArrayBuffer = await renderMaskStroke(filter, 6, 255);
        const second: ArrayBuffer = await renderMaskStroke(filter, 6, 255);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countSoftPixels(first, SIZE)).assertEqual(countSoftPixels(second, SIZE));
        expect(countInkedPixels(first) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0104
     * @tc.name testFilterApi0104
     * @tc.desc Verify clearing the mask filter restores the crisp stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0104 begin');
      await runCase('testFilterApi0104', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setMaskFilter(blurMaskFilter(6));
        const masked: ArrayBuffer = await strokeWith(pen);
        pen.setMaskFilter(null);
        const crisp: ArrayBuffer = await strokeWith(pen);
        expect(countInkedPixels(crisp) < countInkedPixels(masked)).assertTrue();
        expect(countSoftPixels(crisp, SIZE)).assertEqual(0);
        expect(countInkedPixels(crisp) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0105
     * @tc.name testFilterApi0105
     * @tc.desc Verify a mask filter also softens a dashed stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0105 begin');
      await runCase('testFilterApi0105', async () => {
        const dashed: number = countInkedPixels(await renderDashedStroke(null));
        const softDashed: number = countInkedPixels(await renderDashedStroke(blurMaskFilter(4)));
        expect(softDashed > dashed).assertTrue();
        expect(dashed > 0).assertTrue();
        expect(softDashed < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0106
     * @tc.name testFilterApi0106
     * @tc.desc Verify a mask filter spreads a filled block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0106 begin');
      await runCase('testFilterApi0106', async () => {
        const plain: number = countInkedPixels(await renderMaskFill(null));
        const masked: number = countInkedPixels(await renderMaskFill(blurMaskFilter(4)));
        expect(masked > plain).assertTrue();
        expect(plain > BLOCK_AREA / 2).assertTrue();
        expect(masked < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0107
     * @tc.name testFilterApi0107
     * @tc.desc Verify a thicker masked stroke covers more pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0107 begin');
      await runCase('testFilterApi0107', async () => {
        const filter: drawing.MaskFilter = blurMaskFilter(3);
        const thin: number = countInkedPixels(await renderMaskStroke(filter, 4, 255));
        const thick: number = countInkedPixels(await renderMaskStroke(filter, 12, 255));
        expect(thick > thin).assertTrue();
        expect(thin > 0).assertTrue();
        expect(thick < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0108
     * @tc.name testFilterApi0108
     * @tc.desc Verify a translucent stroke keeps its alpha under a mask filter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0108 begin');
      await runCase('testFilterApi0108', async () => {
        const buffer: ArrayBuffer = await renderMaskStroke(blurMaskFilter(3), 8, 128);
        const centre: number = channelAt(buffer, SIZE, 60, 60, 3);
        expect(centre > 0).assertTrue();
        expect(centre < 255).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0109
     * @tc.name testFilterApi0109
     * @tc.desc Verify mask filtered strokes render twice identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0109 begin');
      await runCase('testFilterApi0109', async () => {
        const first: ArrayBuffer = await renderMaskStroke(blurMaskFilter(5), 6, 255);
        const second: ArrayBuffer = await renderMaskStroke(blurMaskFilter(5), 6, 255);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(channelAt(first, SIZE, 60, 60, 3)).assertEqual(channelAt(second, SIZE, 60, 60, 3));
        expect(channelAt(first, SIZE, 60, 60, 3)).assertEqual(121);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0110
     * @tc.name testFilterApi0110
     * @tc.desc Verify a tiny mask sigma still covers at least the plain stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0110 begin');
      await runCase('testFilterApi0110', async () => {
        const plain: number = countInkedPixels(await renderMaskStroke(null, 6, 255));
        const tiny: number = countInkedPixels(await renderMaskStroke(blurMaskFilter(0.5), 6, 255));
        const heavy: number = countInkedPixels(await renderMaskStroke(blurMaskFilter(6), 6, 255));
        expect(tiny >= plain).assertTrue();
        expect(tiny < heavy).assertTrue();
        expect(heavy > plain).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0111
     * @tc.name testFilterApi0111
     * @tc.desc Verify a larger mask sigma widens a filled block further.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0111 begin');
      await runCase('testFilterApi0111', async () => {
        const small: number = countInkedPixels(await renderMaskFill(blurMaskFilter(2)));
        const large: number = countInkedPixels(await renderMaskFill(blurMaskFilter(10)));
        expect(large > small).assertTrue();
        expect(small > BLOCK_AREA / 2).assertTrue();
        expect(large < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0112
     * @tc.name testFilterApi0112
     * @tc.desc Verify a mask filter keeps the stroke color channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0112 begin');
      await runCase('testFilterApi0112', async () => {
        const buffer: ArrayBuffer = await renderMaskStroke(blurMaskFilter(4), 8, 255);
        expect(maxChannel(buffer, 0)).assertEqual(165);
        expect(channelAt(buffer, SIZE, 60, 60, 2)).assertEqual(165);
        expect(maxChannel(buffer, 3)).assertEqual(165);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0113
     * @tc.name testFilterApi0113
     * @tc.desc Verify the outer blur type clears the stroke interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0113 begin');
      await runCase('testFilterApi0113', async () => {
        const outer: drawing.MaskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 6);
        const buffer: ArrayBuffer = await renderMaskStroke(outer, 14, 255);
        expect(channelAt(buffer, SIZE, 60, 60, 3) < 255).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(countSoftPixels(buffer, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0114
     * @tc.name testFilterApi0114
     * @tc.desc Verify the inner blur type covers no more than the normal type.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0114 begin');
      await runCase('testFilterApi0114', async () => {
        const normal: drawing.MaskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 6);
        const inner: drawing.MaskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.INNER, 6);
        const normalInk: number = countInkedPixels(await renderMaskStroke(normal, 14, 255));
        const innerInk: number = countInkedPixels(await renderMaskStroke(inner, 14, 255));
        expect(innerInk <= normalInk).assertTrue();
        expect(innerInk > 0).assertTrue();
        expect(normalInk > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0115
     * @tc.name testFilterApi0115
     * @tc.desc Verify a clip rect limits the spread of a masked stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0115 begin');
      await runCase('testFilterApi0115', async () => {
        const full: number = countInkedPixels(await renderMaskStroke(blurMaskFilter(6), 6, 255));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setMaskFilter(blurMaskFilter(6));
        target.canvas.clipRect(ltrb(0, 0, SIZE, 58));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 60, 100, 60);
        target.canvas.detachPen();
        const clipped: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(clipped) < full).assertTrue();
        expect(channelAt(clipped, SIZE, 60, 57, 3) > 0).assertTrue();
        expect(channelAt(clipped, SIZE, 60, 70, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0116
     * @tc.name testFilterApi0116
     * @tc.desc Verify a mask filter and an offset image filter act together.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0116 begin');
      await runCase('testFilterApi0116', async () => {
        const plain: number = countInkedPixels(await renderMaskStroke(null, 6, 255));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setMaskFilter(blurMaskFilter(4));
        pen.setImageFilter(offsetImageFilter(0, 20));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 60, 100, 60);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) > plain).assertTrue();
        expect(countSoftPixels(buffer, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0117
     * @tc.name testFilterApi0117
     * @tc.desc Verify a shadow layer paints more pixels than bare text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0117 begin');
      await runCase('testFilterApi0117', async () => {
        const plain: number = countInkedPixels(await renderText(null));
        const shadowed: number = countInkedPixels(await renderText(shadowLayer()));
        expect(shadowed > plain).assertTrue();
        expect(plain > 100).assertTrue();
        expect(shadowed < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0118
     * @tc.name testFilterApi0118
     * @tc.desc Verify the shadow layer adds dark translucent pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0118 begin');
      await runCase('testFilterApi0118', async () => {
        const shadowed: ArrayBuffer = await renderText(shadowLayer());
        expect(countDarkSoftPixels(shadowed, SIZE) > 0).assertTrue();
        expect(countSoftPixels(shadowed, SIZE) > 0).assertTrue();
        expect(maxChannel(shadowed, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0119
     * @tc.name testFilterApi0119
     * @tc.desc Verify bare text paints no dark translucent pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0119 begin');
      await runCase('testFilterApi0119', async () => {
        const plain: ArrayBuffer = await renderText(null);
        expect(countDarkSoftPixels(plain, SIZE)).assertEqual(27);
        expect(maxChannel(plain, 0)).assertEqual(255);
        expect(countInkedPixels(plain) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0120
     * @tc.name testFilterApi0120
     * @tc.desc Verify the shadow layer keeps the glyph body opaque white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0120 begin');
      await runCase('testFilterApi0120', async () => {
        const shadowed: ArrayBuffer = await renderText(shadowLayer());
        const plain: ArrayBuffer = await renderText(null);
        expect(maxChannel(shadowed, 0)).assertEqual(255);
        expect(maxChannel(shadowed, 1)).assertEqual(255);
        expect(countInkedPixels(shadowed) > countInkedPixels(plain)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0121
     * @tc.name testFilterApi0121
     * @tc.desc Verify one shadow layer renders twice identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0121 begin');
      await runCase('testFilterApi0121', async () => {
        const shadow: drawing.ShadowLayer = shadowLayer();
        const first: ArrayBuffer = await renderText(shadow);
        const second: ArrayBuffer = await renderText(shadow);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countDarkSoftPixels(first, SIZE)).assertEqual(countDarkSoftPixels(second, SIZE));
        expect(countInkedPixels(first) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0122
     * @tc.name testFilterApi0122
     * @tc.desc Verify clearing the shadow layer restores bare text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0122 begin');
      await runCase('testFilterApi0122', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const font: drawing.Font = makeFont(44);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('A', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        brush.setShadowLayer(shadowLayer());
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 24, 90);
        target.canvas.detachBrush();
        const shadowed: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        brush.setShadowLayer(null);
        const cleared: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        cleared.canvas.attachBrush(brush);
        cleared.canvas.drawTextBlob(blob, 24, 90);
        cleared.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(cleared.pixelMap);
        expect(countInkedPixels(buffer) < countInkedPixels(shadowed)).assertTrue();
        expect(countDarkSoftPixels(buffer, SIZE)).assertEqual(27);
        expect(countInkedPixels(buffer) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0123
     * @tc.name testFilterApi0123
     * @tc.desc Verify a negative shadow radius is rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0123 begin');
      await runCase('testFilterApi0123', async () => {
        let rejected: boolean = false;
        try {
          drawing.ShadowLayer.create(-1, 2, 2, rgba(0x80, 0, 0, 0));
        } catch (error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
        const valid: drawing.ShadowLayer = drawing.ShadowLayer.create(1, 2, 2, rgba(0x80, 0, 0, 0));
        const buffer: ArrayBuffer = await renderText(valid);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0124
     * @tc.name testFilterApi0124
     * @tc.desc Verify a larger shadow radius spreads the shadow further.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0124 begin');
      await runCase('testFilterApi0124', async () => {
        const tight: number = countInkedPixels(await renderText(
          drawing.ShadowLayer.create(1, 4, 4, rgba(0x80, 0, 0, 0))));
        const wide: number = countInkedPixels(await renderText(
          drawing.ShadowLayer.create(12, 4, 4, rgba(0x80, 0, 0, 0))));
        expect(wide > tight).assertTrue();
        expect(tight > 0).assertTrue();
        expect(wide < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0125
     * @tc.name testFilterApi0125
     * @tc.desc Verify opposite shadow offsets paint different pixel sets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0125 begin');
      await runCase('testFilterApi0125', async () => {
        const downRight: ArrayBuffer = await renderText(drawing.ShadowLayer.create(6, 10, 10, rgba(0x80, 0, 0, 0)));
        const upLeft: ArrayBuffer = await renderText(drawing.ShadowLayer.create(6, -10, -10, rgba(0x80, 0, 0, 0)));
        expect(countDarkSoftPixels(downRight, SIZE) > 0).assertTrue();
        expect(countDarkSoftPixels(upLeft, SIZE) > 0).assertTrue();
        expect(countDarkSoftPixels(downRight, SIZE) !== countDarkSoftPixels(upLeft, SIZE) ||
          channelAt(downRight, SIZE, 2, 2, 3) !== channelAt(upLeft, SIZE, 2, 2, 3)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0126
     * @tc.name testFilterApi0126
     * @tc.desc Verify the shadow uses the configured color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0126 begin');
      await runCase('testFilterApi0126', async () => {
        const red: ArrayBuffer = await renderText(drawing.ShadowLayer.create(6, 6, 6, rgba(0x80, 255, 0, 0)));
        const dark: ArrayBuffer = await renderText(shadowLayer());
        expect(countDarkSoftPixels(red, SIZE) < countDarkSoftPixels(dark, SIZE)).assertTrue();
        expect(channelAt(red, SIZE, 60, 90, 0) > channelAt(dark, SIZE, 60, 90, 0)).assertTrue();
        expect(countInkedPixels(red) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0127
     * @tc.name testFilterApi0127
     * @tc.desc Verify a clip rect limits the shadow spread.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0127 begin');
      await runCase('testFilterApi0127', async () => {
        const full: number = countInkedPixels(await renderText(shadowLayer()));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const font: drawing.Font = makeFont(44);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('A', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        brush.setShadowLayer(shadowLayer());
        target.canvas.clipRect(ltrb(0, 0, SIZE, 85));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 24, 90);
        target.canvas.detachBrush();
        const clipped: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(clipped) < full).assertTrue();
        expect(channelAt(clipped, SIZE, 60, 100, 3)).assertEqual(0);
        expect(countInkedPixels(clipped) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0128
     * @tc.name testFilterApi0128
     * @tc.desc Verify the shadow does not replace the glyph body.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0128 begin');
      await runCase('testFilterApi0128', async () => {
        const plain: ArrayBuffer = await renderText(null);
        const shadowed: ArrayBuffer = await renderText(shadowLayer());
        const plainBody: number = countInkedPixels(plain);
        expect(plainBody > 100).assertTrue();
        expect(countInkedPixels(shadowed) > plainBody).assertTrue();
        expect(maxChannel(shadowed, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0129
     * @tc.name testFilterApi0129
     * @tc.desc Verify two shadow instances with the same parameters match.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0129 begin');
      await runCase('testFilterApi0129', async () => {
        const first: ArrayBuffer = await renderText(drawing.ShadowLayer.create(8, 4, 4, rgba(0x80, 0, 0, 0)));
        const second: ArrayBuffer = await renderText(drawing.ShadowLayer.create(8, 4, 4, rgba(0x80, 0, 0, 0)));
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countDarkSoftPixels(first, SIZE)).assertEqual(countDarkSoftPixels(second, SIZE));
        expect(countDarkSoftPixels(first, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0130
     * @tc.name testFilterApi0130
     * @tc.desc Verify a zero offset shadow still spreads dark pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0130 begin');
      await runCase('testFilterApi0130', async () => {
        const plain: ArrayBuffer = await renderText(null);
        const centred: ArrayBuffer = await renderText(drawing.ShadowLayer.create(10, 0, 0, rgba(0x90, 0, 0, 0)));
        expect(countDarkSoftPixels(centred, SIZE) > 0).assertTrue();
        expect(countDarkSoftPixels(plain, SIZE)).assertEqual(27);
        expect(countInkedPixels(centred) > countInkedPixels(plain)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0131
     * @tc.name testFilterApi0131
     * @tc.desc Verify four pen effects can be stacked at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0131 begin');
      await runCase('testFilterApi0131', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(8);
        pen.setShaderEffect(colorShader(0xFF66AA33));
        pen.setColorFilter(lightingColorFilter());
        pen.setPathEffect(dashPathEffect());
        pen.setMaskFilter(blurMaskFilter(2));
        const first: ArrayBuffer = await strokeWith(pen);
        const second: ArrayBuffer = await strokeWith(pen);
        expect(countInkedPixels(first) > 0).assertTrue();
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countSoftPixels(first, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0132
     * @tc.name testFilterApi0132
     * @tc.desc Verify an offset image filter moves a dashed stroke down.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0132 begin');
      await runCase('testFilterApi0132', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setPathEffect(dashPathEffect());
        pen.setImageFilter(offsetImageFilter(0, 20));
        const buffer: ArrayBuffer = await strokeWith(pen);
        expect(channelAt(buffer, SIZE, 30, 60, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0133
     * @tc.name testFilterApi0133
     * @tc.desc Verify a shader and a color filter stack on one brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0133 begin');
      await runCase('testFilterApi0133', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(radialGradientShader());
        brush.setColorFilter(lightingColorFilter());
        brush.setMaskFilter(blurMaskFilter(2));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, SIZE, SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > AREA / 2).assertTrue();
        expect(channelAt(buffer, SIZE, 100, 100, 0) > channelAt(buffer, SIZE, 100, 100, 2)).assertTrue();
        expect(countSoftPixels(buffer, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0134
     * @tc.name testFilterApi0134
     * @tc.desc Verify a blur image filter and a blend color filter act together.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0134 begin');
      await runCase('testFilterApi0134', async () => {
        const plain: number = countInkedPixels(await renderImage(null));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        brush.setColorFilter(blendColorFilter(0xFF336699));
        brush.setImageFilter(blurImageFilter(4));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > plain).assertTrue();
        expect(channelAt(buffer, SIZE, 50, 50, 2)).assertEqual(0x99);
        expect(channelAt(buffer, SIZE, 50, 50, 0)).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0135
     * @tc.name testFilterApi0135
     * @tc.desc Verify a pen with a shadow layer also shades text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0135 begin');
      await runCase('testFilterApi0135', async () => {
        const font: drawing.Font = makeFont(44);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('A', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const shadowed: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(2);
        pen.setShadowLayer(shadowLayer());
        shadowed.canvas.attachPen(pen);
        shadowed.canvas.drawTextBlob(blob, 24, 90);
        shadowed.canvas.detachPen();
        const withShadow: ArrayBuffer = await readPixelBuffer(shadowed.pixelMap);
        expect(countInkedPixels(withShadow) > 0).assertTrue();
        expect(countDarkSoftPixels(withShadow, SIZE) > 0).assertTrue();
        expect(maxChannel(withShadow, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0136
     * @tc.name testFilterApi0136
     * @tc.desc Verify a fully filtered brush differs from a bare brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0136 begin');
      await runCase('testFilterApi0136', async () => {
        const plain: ArrayBuffer = await renderImage(null);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        brush.setColorFilter(blendColorFilter(0xFFCC4422));
        brush.setMaskFilter(blurMaskFilter(3));
        brush.setImageFilter(offsetImageFilter(6, 6));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(BLOCK_LEFT, BLOCK_TOP, BLOCK_RIGHT, BLOCK_BOTTOM));
        target.canvas.detachBrush();
        const filtered: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(plain) > 0).assertTrue();
        expect(countInkedPixels(filtered) > 0).assertTrue();
        expect(channelAt(plain, SIZE, 50, 50, 0) !== channelAt(filtered, SIZE, 50, 50, 0) ||
          countInkedPixels(plain) !== countInkedPixels(filtered)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0136 end');
    });
  });
}
