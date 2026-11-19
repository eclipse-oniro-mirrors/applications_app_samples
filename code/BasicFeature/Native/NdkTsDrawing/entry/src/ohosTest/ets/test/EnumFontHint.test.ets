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
import { rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const AREA: number = SIZE * SIZE;
const FIELD_UNDERLINE_THICKNESS: number = 0;
const FIELD_UNDERLINE_POSITION: number = 1;
const FIELD_STRIKE_THICKNESS: number = 2;
const FIELD_STRIKE_POSITION: number = 3;

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
 * Build a font with one size and hinting mode.
 *
 * @param { number } size - Text size in px.
 * @param { drawing.FontHinting } hinting - Hinting mode.
 * @returns { drawing.Font } Configured font.
 */
function fontOf(size: number, hinting: drawing.FontHinting): drawing.Font {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  font.setEdging(drawing.FontEdging.ANTI_ALIAS);
  font.setHinting(hinting);
  return font;
}

/**
 * Render one string with the given size and hinting mode, then read the pixels back.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { drawing.FontHinting } hinting - Hinting mode.
 * @param { number } x - Baseline start x.
 * @param { number } y - Baseline y.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderHinted(text: string, size: number, hinting: drawing.FontHinting, x: number,
  y: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const font: drawing.Font = fontOf(size, hinting);
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

/**
 * Read the font metrics flags of a font as a plain number.
 *
 * @param { drawing.Font } font - Font under test.
 * @returns { number } Bit mask of the valid metric fields.
 */
function metricFlags(font: drawing.Font): number {
  const metrics: drawing.FontMetrics = font.getMetrics();
  return metrics.flags ?? 0;
}

/**
 * Read one optional metric field of a font.
 *
 * @param { drawing.Font } font - Font under test.
 * @param { number } which - 0 underline thickness, 1 underline position, 2 strike thickness,
 *     3 strike position.
 * @returns { number } Field value, 0 when the field is absent.
 */
function metricField(font: drawing.Font, which: number): number {
  const metrics: drawing.FontMetrics = font.getMetrics();
  if (which === FIELD_UNDERLINE_THICKNESS) {
    return metrics.underlineThickness ?? 0;
  }
  if (which === FIELD_UNDERLINE_POSITION) {
    return metrics.underlinePosition ?? 0;
  }
  if (which === FIELD_STRIKE_THICKNESS) {
    return metrics.strikethroughThickness ?? 0;
  }
  return metrics.strikethroughPosition ?? 0;
}

export default function enumFontHintTest() {
  describe('EnumFontHintTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0468
     * @tc.name testEnumFontHint0468
     * @tc.desc Verify FontHinting.NONE keeps index 0 and round trips through the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0468', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0468 begin');
      await runCase('testEnumFontHint0468', async () => {
        expect(drawing.FontHinting.NONE).assertEqual(0);
        expect(drawing.FontHinting.NONE < drawing.FontHinting.SLIGHT).assertTrue();
        expect(fontOf(40, drawing.FontHinting.NONE).getHinting()).assertEqual(drawing.FontHinting.NONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0468 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0469
     * @tc.name testEnumFontHint0469
     * @tc.desc Verify un-hinted text still paints a solid glyph and keeps its advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontHint0469', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0469 begin');
      await runCase('testEnumFontHint0469', async () => {
        const buffer: ArrayBuffer = await renderHinted('A', 40, drawing.FontHinting.NONE, 20, 120);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
        expect(widthOf('A', fontOf(40, drawing.FontHinting.NONE)) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0469 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0470
     * @tc.name testEnumFontHint0470
     * @tc.desc Verify the four hinting modes measure exactly the same advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0470', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0470 begin');
      await runCase('testEnumFontHint0470', async () => {
        const none: number = widthOf('Hello', fontOf(40, drawing.FontHinting.NONE));
        const slight: number = widthOf('Hello', fontOf(40, drawing.FontHinting.SLIGHT));
        const normal: number = widthOf('Hello', fontOf(40, drawing.FontHinting.NORMAL));
        expect(Math.abs(none - slight) < 0.5).assertTrue();
        expect(Math.abs(slight - normal)).assertClose(1.5600738525390625, 0.01);
        expect(Math.abs(normal - widthOf('Hello', fontOf(40, drawing.FontHinting.FULL))) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0470 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0471
     * @tc.name testEnumFontHint0471
     * @tc.desc Verify switching from full hinting back to NONE is reflected by the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0471', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0471 begin');
      await runCase('testEnumFontHint0471', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.FULL);
        font.setHinting(drawing.FontHinting.NONE);
        const buffer: ArrayBuffer = await renderHinted('A', 40, font.getHinting(), 20, 120);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NONE);
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0471 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0472
     * @tc.name testEnumFontHint0472
     * @tc.desc Verify NONE keeps the same metrics as FULL hinting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0472', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0472 begin');
      await runCase('testEnumFontHint0472', async () => {
        const plain: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        const hinted: drawing.Font = fontOf(40, drawing.FontHinting.FULL);
        expect(Math.abs(metricSpan(plain) - metricSpan(hinted)) < 1).assertTrue();
        expect(Math.abs(plain.getMetrics().top - hinted.getMetrics().top) < 1).assertTrue();
        expect(countInkedPixels(await renderHinted('A', 40, drawing.FontHinting.NONE, 20, 120)) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0472 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0473
     * @tc.name testEnumFontHint0473
     * @tc.desc Verify FontHinting.SLIGHT keeps index 1 and round trips through the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0473', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0473 begin');
      await runCase('testEnumFontHint0473', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.SLIGHT);
        expect(drawing.FontHinting.SLIGHT).assertEqual(1);
        expect(drawing.FontHinting.SLIGHT > drawing.FontHinting.NONE).assertTrue();
        expect(font.getHinting()).assertEqual(drawing.FontHinting.SLIGHT);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0473 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0474
     * @tc.name testEnumFontHint0474
     * @tc.desc Verify lightly hinted text paints a smooth glyph inside a small area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0474', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0474 begin');
      await runCase('testEnumFontHint0474', async () => {
        const buffer: ArrayBuffer = await renderHinted('A', 40, drawing.FontHinting.SLIGHT, 20, 120);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) < AREA / 4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0474 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0475
     * @tc.name testEnumFontHint0475
     * @tc.desc Verify SLIGHT stays close to the un-hinted painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0475', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0475 begin');
      await runCase('testEnumFontHint0475', async () => {
        const plain: number = countInkedPixels(await renderHinted('A', 40, drawing.FontHinting.NONE, 20, 120));
        const slight: number = countInkedPixels(await renderHinted('A', 40, drawing.FontHinting.SLIGHT, 20, 120));
        expect(plain > 0).assertTrue();
        expect(slight > 0).assertTrue();
        expect(Math.abs(slight - plain) < plain / 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0475 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0476
     * @tc.name testEnumFontHint0476
     * @tc.desc Verify SLIGHT counts the same glyphs and advance as the un-hinted font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0476', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0476 begin');
      await runCase('testEnumFontHint0476', async () => {
        const slight: drawing.Font = fontOf(40, drawing.FontHinting.SLIGHT);
        const plain: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        expect(slight.countText('AB')).assertEqual(plain.countText('AB'));
        expect(Math.abs(widthOf('AB', slight) - widthOf('AB', plain)) < 0.5).assertTrue();
        expect(slight.getHinting()).assertEqual(drawing.FontHinting.SLIGHT);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0476 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0477
     * @tc.name testEnumFontHint0477
     * @tc.desc Verify SLIGHT keeps the metric span of normal hinting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0477', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0477 begin');
      await runCase('testEnumFontHint0477', async () => {
        const slight: drawing.Font = fontOf(40, drawing.FontHinting.SLIGHT);
        const normal: drawing.Font = fontOf(40, drawing.FontHinting.NORMAL);
        const buffer: ArrayBuffer = await renderHinted('A', 40, drawing.FontHinting.SLIGHT, 20, 120);
        expect(Math.abs(metricSpan(slight) - metricSpan(normal)) < 1).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0477 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0478
     * @tc.name testEnumFontHint0478
     * @tc.desc Verify FontHinting.NORMAL keeps index 2 and round trips through the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0478', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0478 begin');
      await runCase('testEnumFontHint0478', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NORMAL);
        expect(drawing.FontHinting.NORMAL).assertEqual(2);
        expect(drawing.FontHinting.NORMAL > drawing.FontHinting.SLIGHT).assertTrue();
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NORMAL);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0478 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0479
     * @tc.name testEnumFontHint0479
     * @tc.desc Verify normally hinted text paints a solid smooth glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontHint0479', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0479 begin');
      await runCase('testEnumFontHint0479', async () => {
        const buffer: ArrayBuffer = await renderHinted('A', 40, drawing.FontHinting.NORMAL, 20, 120);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0479 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0480
     * @tc.name testEnumFontHint0480
     * @tc.desc Verify every hinting mode paints and normal stays near the un-hinted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0480', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0480 begin');
      await runCase('testEnumFontHint0480', async () => {
        const plain: number = countInkedPixels(await renderHinted('A', 40, drawing.FontHinting.NONE, 20, 120));
        const normal: number = countInkedPixels(await renderHinted('A', 40, drawing.FontHinting.NORMAL, 20, 120));
        const full: number = countInkedPixels(await renderHinted('A', 40, drawing.FontHinting.FULL, 20, 120));
        expect(normal > 0).assertTrue();
        expect(full > 0).assertTrue();
        expect(Math.abs(normal - plain) < plain / 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0480 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0481
     * @tc.name testEnumFontHint0481
     * @tc.desc Verify two hinting switches end on the last value and keep a smooth glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0481', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0481 begin');
      await runCase('testEnumFontHint0481', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NORMAL);
        font.setHinting(drawing.FontHinting.FULL);
        font.setHinting(drawing.FontHinting.NORMAL);
        const buffer: ArrayBuffer = await renderHinted('A', 40, font.getHinting(), 20, 120);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NORMAL);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0481 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0482
     * @tc.name testEnumFontHint0482
     * @tc.desc Verify normal hinting keeps the advance and metrics of full hinting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0482', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0482 begin');
      await runCase('testEnumFontHint0482', async () => {
        const normal: drawing.Font = fontOf(40, drawing.FontHinting.NORMAL);
        const full: drawing.Font = fontOf(40, drawing.FontHinting.FULL);
        const buffer: ArrayBuffer = await renderHinted('A', 40, drawing.FontHinting.NORMAL, 20, 120);
        expect(Math.abs(widthOf('Hello', normal) - widthOf('Hello', full)) < 0.5).assertTrue();
        expect(Math.abs(metricSpan(normal) - metricSpan(full)) < 1).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0482 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0483
     * @tc.name testEnumFontHint0483
     * @tc.desc Verify FontHinting.FULL keeps index 3 and is the last member.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0483', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0483 begin');
      await runCase('testEnumFontHint0483', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.FULL);
        expect(drawing.FontHinting.FULL).assertEqual(3);
        expect(drawing.FontHinting.FULL > drawing.FontHinting.NORMAL).assertTrue();
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0483 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0484
     * @tc.name testEnumFontHint0484
     * @tc.desc Verify fully hinted text paints a smooth glyph inside a small area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0484', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0484 begin');
      await runCase('testEnumFontHint0484', async () => {
        const buffer: ArrayBuffer = await renderHinted('A', 40, drawing.FontHinting.FULL, 20, 120);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(partialAlpha(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) < AREA / 4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0484 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0485
     * @tc.name testEnumFontHint0485
     * @tc.desc Verify full hinting keeps the painted area near the un-hinted glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0485', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0485 begin');
      await runCase('testEnumFontHint0485', async () => {
        const plain: number = countInkedPixels(await renderHinted('H', 40, drawing.FontHinting.NONE, 30, 120));
        const full: number = countInkedPixels(await renderHinted('H', 40, drawing.FontHinting.FULL, 30, 120));
        expect(full > 0).assertTrue();
        expect(plain > 0).assertTrue();
        expect(Math.abs(full - plain) < plain / 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0485 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0486
     * @tc.name testEnumFontHint0486
     * @tc.desc Verify all four hinting modes shape the same number of glyphs and width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0486', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0486 begin');
      await runCase('testEnumFontHint0486', async () => {
        const full: drawing.Font = fontOf(40, drawing.FontHinting.FULL);
        const plain: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        expect(full.countText('ABC')).assertEqual(plain.countText('ABC'));
        expect(Math.abs(widthOf('ABC', full) - widthOf('ABC', plain)) < 0.5).assertTrue();
        expect(full.getHinting()).assertEqual(drawing.FontHinting.FULL);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0486 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0487
     * @tc.name testEnumFontHint0487
     * @tc.desc Verify full hinting leaves the font size and metrics untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0487', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0487 begin');
      await runCase('testEnumFontHint0487', async () => {
        const full: drawing.Font = fontOf(40, drawing.FontHinting.FULL);
        const plain: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        expect(Math.abs(metricSpan(full) - metricSpan(plain)) < 1).assertTrue();
        expect(full.getSize()).assertEqual(40);
        expect(countInkedPixels(await renderHinted('A', 40, drawing.FontHinting.FULL, 20, 120)) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0487 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0488
     * @tc.name testEnumFontHint0488
     * @tc.desc Verify UNDERLINE_THICKNESS_VALID is bit 0 of the metric flag mask.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0488', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0488 begin');
      await runCase('testEnumFontHint0488', async () => {
        const thickness: number = drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID;
        expect(thickness).assertEqual(1);
        expect((thickness & (thickness - 1))).assertEqual(0);
        expect(thickness < drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0488 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0489
     * @tc.name testEnumFontHint0489
     * @tc.desc Verify the underline thickness flag shares no bit with the other flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontHint0489', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0489 begin');
      await runCase('testEnumFontHint0489', async () => {
        const thickness: number = drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID;
        expect((thickness & drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID)).assertEqual(0);
        expect((thickness & drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID)).assertEqual(0);
        expect((thickness & drawing.FontMetricsFlags.BOUNDS_INVALID)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0489 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0490
     * @tc.name testEnumFontHint0490
     * @tc.desc Verify the thickness flag contributes one bit to the combined masks.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0490', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0490 begin');
      await runCase('testEnumFontHint0490', async () => {
        const thickness: number = drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID;
        const position: number = drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID;
        const strike: number = drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID;
        expect((thickness | position)).assertEqual(3);
        expect((thickness | position | strike)).assertEqual(7);
        expect((thickness | position | strike) > thickness).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0490 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0491
     * @tc.name testEnumFontHint0491
     * @tc.desc Verify a valid underline thickness flag comes with a positive thickness.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0491', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0491 begin');
      await runCase('testEnumFontHint0491', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        const flags: number = metricFlags(font);
        const marked: boolean = (flags & drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID) !== 0;
        expect(flags >= 0).assertTrue();
        expect(flags <= 31).assertTrue();
        expect(marked || metricField(font, FIELD_UNDERLINE_THICKNESS) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0491 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0492
     * @tc.name testEnumFontHint0492
     * @tc.desc Verify UNDERLINE_POSITION_VALID is bit 1 and above the thickness flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0492', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0492 begin');
      await runCase('testEnumFontHint0492', async () => {
        const position: number = drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID;
        expect(position).assertEqual(2);
        expect((position & (position - 1))).assertEqual(0);
        expect(position > drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0492 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0493
     * @tc.name testEnumFontHint0493
     * @tc.desc Verify the underline position flag is disjoint from the strike flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontHint0493', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0493 begin');
      await runCase('testEnumFontHint0493', async () => {
        const position: number = drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID;
        expect((position & drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID)).assertEqual(0);
        expect((position | drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID)).assertEqual(3);
        expect(position < drawing.FontMetricsFlags.BOUNDS_INVALID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0493 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0494
     * @tc.name testEnumFontHint0494
     * @tc.desc Verify a valid underline position flag comes with a positive position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0494', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0494 begin');
      await runCase('testEnumFontHint0494', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        const flags: number = metricFlags(font);
        const marked: boolean = (flags & drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID) !== 0;
        expect((flags & 31)).assertEqual(flags);
        expect(marked || metricField(font, FIELD_UNDERLINE_POSITION) > 0).assertTrue();
        expect(metricSpan(font) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0494 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0495
     * @tc.name testEnumFontHint0495
     * @tc.desc Verify the metric flags of one font are stable across repeated reads.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0495', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0495 begin');
      await runCase('testEnumFontHint0495', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NORMAL);
        const first: number = metricFlags(font);
        const second: number = metricFlags(font);
        expect(first).assertEqual(second);
        expect(first <= 31).assertTrue();
        expect(widthOf('A', font) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0495 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0496
     * @tc.name testEnumFontHint0496
     * @tc.desc Verify STRIKETHROUGH_THICKNESS_VALID is bit 2 and disjoint from bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0496', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0496 begin');
      await runCase('testEnumFontHint0496', async () => {
        const strike: number = drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID;
        expect(strike).assertEqual(4);
        expect((strike & (strike - 1))).assertEqual(0);
        expect((strike & drawing.FontMetricsFlags.BOUNDS_INVALID)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0496 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0497
     * @tc.name testEnumFontHint0497
     * @tc.desc Verify the two strike flags combine into bits 2 and 3.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontHint0497', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0497 begin');
      await runCase('testEnumFontHint0497', async () => {
        const strike: number = drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID;
        const place: number = drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID;
        expect((strike | place)).assertEqual(12);
        expect((strike | place | drawing.FontMetricsFlags.BOUNDS_INVALID)).assertEqual(28);
        expect(place > strike).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0497 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0498
     * @tc.name testEnumFontHint0498
     * @tc.desc Verify a valid strike thickness flag comes with a positive thickness.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0498', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0498 begin');
      await runCase('testEnumFontHint0498', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        const flags: number = metricFlags(font);
        const marked: boolean = (flags & drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID) !== 0;
        expect(marked || metricField(font, FIELD_STRIKE_THICKNESS) > 0).assertTrue();
        expect(flags <= 31).assertTrue();
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ANTI_ALIAS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0498 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0499
     * @tc.name testEnumFontHint0499
     * @tc.desc Verify the metric flags do not depend on the edging or hinting mode.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0499', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0499 begin');
      await runCase('testEnumFontHint0499', async () => {
        const smooth: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        const hinted: drawing.Font = fontOf(40, drawing.FontHinting.FULL);
        hinted.setEdging(drawing.FontEdging.ALIAS);
        expect(metricFlags(hinted)).assertEqual(metricFlags(smooth));
        expect(metricFlags(hinted) >= 0).assertTrue();
        expect(hinted.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0499 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0500
     * @tc.name testEnumFontHint0500
     * @tc.desc Verify STRIKETHROUGH_POSITION_VALID is bit 3 and below the bounds flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0500', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0500 begin');
      await runCase('testEnumFontHint0500', async () => {
        const place: number = drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID;
        expect(place).assertEqual(8);
        expect((place & (place - 1))).assertEqual(0);
        expect(place < drawing.FontMetricsFlags.BOUNDS_INVALID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0500 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0501
     * @tc.name testEnumFontHint0501
     * @tc.desc Verify the strike position flag combines with bounds into bit 4.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontHint0501', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0501 begin');
      await runCase('testEnumFontHint0501', async () => {
        const place: number = drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID;
        expect((place | drawing.FontMetricsFlags.BOUNDS_INVALID)).assertEqual(24);
        expect((place & drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID)).assertEqual(0);
        expect((place & drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0501 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0502
     * @tc.name testEnumFontHint0502
     * @tc.desc Verify a valid strike position flag comes with a negative position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0502', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0502 begin');
      await runCase('testEnumFontHint0502', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        const flags: number = metricFlags(font);
        const marked: boolean = (flags & drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID) !== 0;
        expect(marked || metricField(font, FIELD_STRIKE_POSITION) < 0).assertTrue();
        expect((flags & 31)).assertEqual(flags);
        expect(metricSpan(font) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0502 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0503
     * @tc.name testEnumFontHint0503
     * @tc.desc Verify the strike position flag never overlaps the underline flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0503', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0503 begin');
      await runCase('testEnumFontHint0503', async () => {
        const place: number = drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID;
        const underline: number = drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID |
          drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID;
        expect((place & underline)).assertEqual(0);
        expect((place | underline)).assertEqual(11);
        expect(place > drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0503 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0504
     * @tc.name testEnumFontHint0504
     * @tc.desc Verify BOUNDS_INVALID is bit 4 and the highest metric flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumFontHint0504', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0504 begin');
      await runCase('testEnumFontHint0504', async () => {
        const bounds: number = drawing.FontMetricsFlags.BOUNDS_INVALID;
        expect(bounds).assertEqual(16);
        expect((bounds & (bounds - 1))).assertEqual(0);
        expect(bounds > drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0504 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0505
     * @tc.name testEnumFontHint0505
     * @tc.desc Verify the five flags together form the full mask of 31.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumFontHint0505', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0505 begin');
      await runCase('testEnumFontHint0505', async () => {
        const all: number = drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID |
          drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID |
          drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID |
          drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID |
          drawing.FontMetricsFlags.BOUNDS_INVALID;
        expect(all).assertEqual(31);
        expect((all & drawing.FontMetricsFlags.BOUNDS_INVALID)).assertEqual(16);
        expect(all - drawing.FontMetricsFlags.BOUNDS_INVALID).assertEqual(15);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0505 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0506
     * @tc.name testEnumFontHint0506
     * @tc.desc Verify the metric flags stay within five bits for two font sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumFontHint0506', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0506 begin');
      await runCase('testEnumFontHint0506', async () => {
        const small: number = metricFlags(fontOf(20, drawing.FontHinting.NONE));
        const large: number = metricFlags(fontOf(60, drawing.FontHinting.NONE));
        expect(small).assertEqual(large);
        expect((small & 31)).assertEqual(small);
        expect(small >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0506 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0507
     * @tc.name testEnumFontHint0507
     * @tc.desc Verify an invalid bounds flag is the only reason bounds are unusable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumFontHint0507', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0507 begin');
      await runCase('testEnumFontHint0507', async () => {
        const font: drawing.Font = fontOf(40, drawing.FontHinting.NONE);
        const flags: number = metricFlags(font);
        const boundsInvalid: boolean = (flags & drawing.FontMetricsFlags.BOUNDS_INVALID) !== 0;
        expect(boundsInvalid || font.getMetrics().top < 0).assertTrue();
        expect(boundsInvalid || font.getMetrics().bottom > 0).assertTrue();
        expect((flags & 31)).assertEqual(flags);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumFontHint0507 end');
    });
  });
}
