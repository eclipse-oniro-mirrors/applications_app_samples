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
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const AREA: number = SIZE * SIZE;

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
 * Count the pixels carrying a partial alpha, which only anti-aliased edges create.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with a value between 1 and 254.
 */
function partialAlpha(buffer: ArrayBuffer): number {
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
 * Count the fully opaque pixels of a buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with alpha 255.
 */
function opaqueAlpha(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] === 255) {
      count++;
    }
  }
  return count;
}

/**
 * Read the largest alpha value of a buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Largest alpha value.
 */
function maxAlpha(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let largest: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > largest) {
      largest = bytes[index];
    }
  }
  return largest;
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
 * Build a font with one size, edging and hinting combination.
 *
 * @param { number } size - Text size in px.
 * @param { drawing.FontEdging } edging - Edging mode.
 * @param { drawing.FontHinting } hinting - Hinting mode.
 * @returns { drawing.Font } Configured font.
 */
function fontOf(size: number, edging: drawing.FontEdging, hinting: drawing.FontHinting): drawing.Font {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  font.setEdging(edging);
  font.setHinting(hinting);
  return font;
}

/**
 * Render one string with the given font settings and read the pixels back.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { drawing.FontEdging } edging - Edging mode.
 * @param { drawing.FontHinting } hinting - Hinting mode.
 * @param { number } x - Baseline start x.
 * @param { number } y - Baseline y.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderText(text: string, size: number, edging: drawing.FontEdging,
  hinting: drawing.FontHinting, x: number, y: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const font: drawing.Font = fontOf(size, edging, hinting);
  const blob: drawing.TextBlob = drawing.TextBlob.makeFromString(text, font,
    drawing.TextEncoding.TEXT_ENCODING_UTF8);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0, 0, 0));
  target.canvas.attachBrush(brush);
  target.canvas.drawTextBlob(blob, x, y);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Measure the UTF8 advance of a string with one font.
 *
 * @param { string } text - Source text.
 * @param { drawing.Font } font - Font used for measurement.
 * @returns { number } Advance width in px.
 */
function widthOf(text: string, font: drawing.Font): number {
  return font.measureText(text, drawing.TextEncoding.TEXT_ENCODING_UTF8);
}

/**
 * Measure the distance between the top and the bottom font metric.
 *
 * @param { drawing.Font } font - Font under test.
 * @returns { number } Metric span in px.
 */
function metricSpan(font: drawing.Font): number {
  const metrics: drawing.FontMetrics = font.getMetrics();
  return metrics.bottom - metrics.top;
}

export default function enumFontEdgeTest() {
  describe('EnumFontEdgeTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0438
     * @tc.name testEnumFontEdge0438
     * @tc.desc Verify FontEdging.ALIAS keeps index 0 and round trips through the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontEdge0438', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0438 begin');
      await runCase('testEnumFontEdge0438', async () => {
        const font: drawing.Font = fontOf(48, drawing.FontEdging.ALIAS, drawing.FontHinting.NONE);
        expect(drawing.FontEdging.ALIAS).assertEqual(0);
        expect(drawing.FontEdging.ALIAS < drawing.FontEdging.ANTI_ALIAS).assertTrue();
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0438 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0439
     * @tc.name testEnumFontEdge0439
     * @tc.desc Verify an aliased glyph has no partial alpha anywhere on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontEdge0439', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0439 begin');
      await runCase('testEnumFontEdge0439', async () => {
        const buffer: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(partialAlpha(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0439 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0440
     * @tc.name testEnumFontEdge0440
     * @tc.desc Verify a small aliased glyph also keeps hard edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0440', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0440 begin');
      await runCase('testEnumFontEdge0440', async () => {
        const buffer: ArrayBuffer = await renderText('A', 24, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(partialAlpha(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(inkBox(buffer, 0, 140, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0440 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0441
     * @tc.name testEnumFontEdge0441
     * @tc.desc Verify a CJK glyph rendered with ALIAS only paints fully opaque pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0441', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0441 begin');
      await runCase('testEnumFontEdge0441', async () => {
        const buffer: ArrayBuffer = await renderText('图', 48, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 30, 140);
        expect(partialAlpha(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer) > 200).assertTrue();
        expect(opaqueAlpha(buffer)).assertEqual(countInkedPixels(buffer));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0441 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0442
     * @tc.name testEnumFontEdge0442
     * @tc.desc Verify a display size aliased glyph stays fully hard edged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0442', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0442 begin');
      await runCase('testEnumFontEdge0442', async () => {
        const buffer: ArrayBuffer = await renderText('A', 96, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 20, 170);
        expect(partialAlpha(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer) > 800).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0442 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0443
     * @tc.name testEnumFontEdge0443
     * @tc.desc Verify ALIAS paints no more ink than the anti-aliased counterpart.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0443', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0443 begin');
      await runCase('testEnumFontEdge0443', async () => {
        const alias: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        const smooth: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(partialAlpha(alias)).assertEqual(0);
        expect(partialAlpha(smooth) > 0).assertTrue();
        expect(countInkedPixels(alias) <= countInkedPixels(smooth) + 40).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0443 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0444
     * @tc.name testEnumFontEdge0444
     * @tc.desc Verify switching back from anti-aliasing restores the hard edged raster.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0444', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0444 begin');
      await runCase('testEnumFontEdge0444', async () => {
        const font: drawing.Font = fontOf(48, drawing.FontEdging.ANTI_ALIAS, drawing.FontHinting.NONE);
        font.setEdging(drawing.FontEdging.ALIAS);
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('A', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 20, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
        expect(partialAlpha(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0444 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0445
     * @tc.name testEnumFontEdge0445
     * @tc.desc Verify two aliased renders of the same glyph are pixel identical in size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0445', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0445 begin');
      await runCase('testEnumFontEdge0445', async () => {
        const first: number = countInkedPixels(await renderText('H', 40, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 30, 120));
        const second: number = countInkedPixels(await renderText('H', 40, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 30, 120));
        expect(first).assertEqual(second);
        expect(first > 0).assertTrue();
        expect(first < AREA / 4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0445 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0446
     * @tc.name testEnumFontEdge0446
     * @tc.desc Verify ALIAS dominates the raster even when full hinting is requested.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0446', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0446 begin');
      await runCase('testEnumFontEdge0446', async () => {
        const font: drawing.Font = fontOf(32, drawing.FontEdging.ALIAS, drawing.FontHinting.FULL);
        const buffer: ArrayBuffer = await renderText('A', 32, font.getEdging(), font.getHinting(), 20, 120);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
        expect(partialAlpha(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0446 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0447
     * @tc.name testEnumFontEdge0447
     * @tc.desc Verify edging never changes the measured advance or the font metrics.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0447', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0447 begin');
      await runCase('testEnumFontEdge0447', async () => {
        const aliasFont: drawing.Font = fontOf(40, drawing.FontEdging.ALIAS, drawing.FontHinting.NONE);
        const smoothFont: drawing.Font = fontOf(40, drawing.FontEdging.ANTI_ALIAS, drawing.FontHinting.NONE);
        expect(Math.abs(widthOf('Hello', aliasFont) - widthOf('Hello', smoothFont)) < 0.5).assertTrue();
        expect(Math.abs(metricSpan(aliasFont) - metricSpan(smoothFont)) < 1).assertTrue();
        expect(aliasFont.getEdging() < smoothFont.getEdging()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0447 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0448
     * @tc.name testEnumFontEdge0448
     * @tc.desc Verify FontEdging.ANTI_ALIAS keeps index 1 and round trips through the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontEdge0448', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0448 begin');
      await runCase('testEnumFontEdge0448', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontEdging.ANTI_ALIAS, drawing.FontHinting.NONE);
        expect(drawing.FontEdging.ANTI_ALIAS).assertEqual(1);
        expect(drawing.FontEdging.ANTI_ALIAS > drawing.FontEdging.ALIAS).assertTrue();
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ANTI_ALIAS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0448 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0449
     * @tc.name testEnumFontEdge0449
     * @tc.desc Verify an anti-aliased glyph produces partial alpha pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontEdge0449', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0449 begin');
      await runCase('testEnumFontEdge0449', async () => {
        const buffer: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0449 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0450
     * @tc.name testEnumFontEdge0450
     * @tc.desc Verify the smooth edges stay a small part of the painted glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0450', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0450 begin');
      await runCase('testEnumFontEdge0450', async () => {
        const buffer: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        const inked: number = countInkedPixels(buffer);
        expect(partialAlpha(buffer) > 10).assertTrue();
        expect(partialAlpha(buffer) < inked).assertTrue();
        expect(inked < AREA / 4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0450 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0451
     * @tc.name testEnumFontEdge0451
     * @tc.desc Verify a CJK glyph with anti-aliasing keeps opaque interior pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0451', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0451 begin');
      await runCase('testEnumFontEdge0451', async () => {
        const buffer: ArrayBuffer = await renderText('图', 48, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 30, 140);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 200).assertTrue();
        expect(opaqueAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0451 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0452
     * @tc.name testEnumFontEdge0452
     * @tc.desc Verify anti-aliasing covers at least the aliased glyph area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0452', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0452 begin');
      await runCase('testEnumFontEdge0452', async () => {
        const alias: ArrayBuffer = await renderText('H', 40, drawing.FontEdging.ALIAS,
          drawing.FontHinting.NONE, 30, 120);
        const smooth: ArrayBuffer = await renderText('H', 40, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 30, 120);
        expect(countInkedPixels(smooth) >= countInkedPixels(alias)).assertTrue();
        expect(partialAlpha(smooth) > 0).assertTrue();
        expect(partialAlpha(alias)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0452 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0453
     * @tc.name testEnumFontEdge0453
     * @tc.desc Verify a small anti-aliased glyph still gets smooth edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0453', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0453 begin');
      await runCase('testEnumFontEdge0453', async () => {
        const buffer: ArrayBuffer = await renderText('A', 24, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0453 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0454
     * @tc.name testEnumFontEdge0454
     * @tc.desc Verify the smooth glyph keeps both an opaque core and a soft rim.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0454', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0454 begin');
      await runCase('testEnumFontEdge0454', async () => {
        const buffer: ArrayBuffer = await renderText('B', 40, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(maxAlpha(buffer)).assertEqual(255);
        expect(opaqueAlpha(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0454 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0455
     * @tc.name testEnumFontEdge0455
     * @tc.desc Verify two edging switches end on the last value and keep the soft raster.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0455', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0455 begin');
      await runCase('testEnumFontEdge0455', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontEdging.ANTI_ALIAS, drawing.FontHinting.NONE);
        font.setEdging(drawing.FontEdging.ALIAS);
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        const buffer: ArrayBuffer = await renderText('A', 40, font.getEdging(), font.getHinting(), 20, 120);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ANTI_ALIAS);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0455 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0456
     * @tc.name testEnumFontEdge0456
     * @tc.desc Verify smooth edging leaves the advance and metrics of the font untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0456', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0456 begin');
      await runCase('testEnumFontEdge0456', async () => {
        const smoothFont: drawing.Font = fontOf(40, drawing.FontEdging.ANTI_ALIAS, drawing.FontHinting.NONE);
        const aliasFont: drawing.Font = fontOf(40, drawing.FontEdging.ALIAS, drawing.FontHinting.NONE);
        const buffer: ArrayBuffer = await renderText('A', 40, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(Math.abs(widthOf('Hello', smoothFont) - widthOf('Hello', aliasFont)) < 0.5).assertTrue();
        expect(Math.abs(metricSpan(smoothFont) - metricSpan(aliasFont)) < 1).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0456 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0457
     * @tc.name testEnumFontEdge0457
     * @tc.desc Verify anti-aliased text stays well inside the canvas area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0457', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0457 begin');
      await runCase('testEnumFontEdge0457', async () => {
        const buffer: ArrayBuffer = await renderText('Hi', 40, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 0).assertTrue();
        expect(partialAlpha(buffer) < inked).assertTrue();
        expect(inked < AREA / 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0457 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0458
     * @tc.name testEnumFontEdge0458
     * @tc.desc Verify FontEdging.SUBPIXEL_ANTI_ALIAS keeps index 2 and is the last member.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontEdge0458', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0458 begin');
      await runCase('testEnumFontEdge0458', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS, drawing.FontHinting.NONE);
        expect(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS).assertEqual(2);
        expect(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS > drawing.FontEdging.ANTI_ALIAS).assertTrue();
        expect(font.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0458 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0459
     * @tc.name testEnumFontEdge0459
     * @tc.desc Verify sub-pixel anti-aliased glyph also blends its edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontEdge0459', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0459 begin');
      await runCase('testEnumFontEdge0459', async () => {
        const buffer: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0459 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0460
     * @tc.name testEnumFontEdge0460
     * @tc.desc Verify sub-pixel edging paints about the same area as plain anti-aliasing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0460', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0460 begin');
      await runCase('testEnumFontEdge0460', async () => {
        const subpixel: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        const smooth: ArrayBuffer = await renderText('A', 48, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        const delta: number = Math.abs(countInkedPixels(subpixel) - countInkedPixels(smooth));
        expect(delta < countInkedPixels(smooth) / 2).assertTrue();
        expect(partialAlpha(subpixel) > 0).assertTrue();
        expect(partialAlpha(smooth) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0460 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0461
     * @tc.name testEnumFontEdge0461
     * @tc.desc Verify a CJK glyph drawn with sub-pixel edging keeps full pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0461', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0461 begin');
      await runCase('testEnumFontEdge0461', async () => {
        const buffer: ArrayBuffer = await renderText('图', 48, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NONE, 30, 140);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 200).assertTrue();
        expect(opaqueAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0461 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0462
     * @tc.name testEnumFontEdge0462
     * @tc.desc Verify the three edging members form a strictly increasing sequence.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontEdge0462', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0462 begin');
      await runCase('testEnumFontEdge0462', async () => {
        expect(drawing.FontEdging.ALIAS < drawing.FontEdging.ANTI_ALIAS).assertTrue();
        expect(drawing.FontEdging.ANTI_ALIAS < drawing.FontEdging.SUBPIXEL_ANTI_ALIAS).assertTrue();
        expect(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS - drawing.FontEdging.ALIAS).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0462 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0463
     * @tc.name testEnumFontEdge0463
     * @tc.desc Verify two sub-pixel switches end on the last value and keep blended edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0463', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0463 begin');
      await runCase('testEnumFontEdge0463', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NONE);
        font.setEdging(drawing.FontEdging.ALIAS);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        const buffer: ArrayBuffer = await renderText('A', 40, font.getEdging(), font.getHinting(), 20, 120);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0463 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0464
     * @tc.name testEnumFontEdge0464
     * @tc.desc Verify a small sub-pixel glyph also blends its edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0464', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0464 begin');
      await runCase('testEnumFontEdge0464', async () => {
        const buffer: ArrayBuffer = await renderText('A', 24, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NONE, 20, 120);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) < 4000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0464 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0465
     * @tc.name testEnumFontEdge0465
     * @tc.desc Verify all three edging modes measure the same advance for the same text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0465', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0465 begin');
      await runCase('testEnumFontEdge0465', async () => {
        const alias: drawing.Font = fontOf(40, drawing.FontEdging.ALIAS, drawing.FontHinting.NONE);
        const smooth: drawing.Font = fontOf(40, drawing.FontEdging.ANTI_ALIAS, drawing.FontHinting.NONE);
        const subpixel: drawing.Font = fontOf(40, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NONE);
        expect(Math.abs(widthOf('Hello', alias) - widthOf('Hello', smooth)) < 0.5).assertTrue();
        expect(Math.abs(widthOf('Hello', smooth) - widthOf('Hello', subpixel)) < 0.5).assertTrue();
        expect(widthOf('Hello', subpixel) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0465 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0466
     * @tc.name testEnumFontEdge0466
     * @tc.desc Verify the font metrics stay identical under all three edging modes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontEdge0466', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0466 begin');
      await runCase('testEnumFontEdge0466', async () => {
        const alias: drawing.Font = fontOf(40, drawing.FontEdging.ALIAS, drawing.FontHinting.NONE);
        const smooth: drawing.Font = fontOf(40, drawing.FontEdging.ANTI_ALIAS, drawing.FontHinting.NONE);
        const subpixel: drawing.Font = fontOf(40, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NONE);
        expect(Math.abs(metricSpan(alias) - metricSpan(smooth)) < 1).assertTrue();
        expect(Math.abs(metricSpan(smooth) - metricSpan(subpixel)) < 1).assertTrue();
        expect(metricSpan(subpixel) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0466 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0467
     * @tc.name testEnumFontEdge0467
     * @tc.desc Verify sub-pixel edging leaves the size and hinting setters intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontEdge0467', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0467 begin');
      await runCase('testEnumFontEdge0467', async () => {
        const font: drawing.Font = fontOf(36, drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          drawing.FontHinting.NORMAL);
        const buffer: ArrayBuffer = await renderText('A', 36, font.getEdging(), font.getHinting(), 20, 120);
        expect(font.getSize()).assertEqual(36);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NORMAL);
        expect(partialAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontEdge0467 end');
    });
  });
}
