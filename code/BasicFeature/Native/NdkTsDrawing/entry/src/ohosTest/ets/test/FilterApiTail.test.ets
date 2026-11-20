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
import {
  blurImageFilter,
  blurMaskFilter,
  colorShader,
  colorToImageFilter,
  composeColorFilter,
  composeImageFilter,
  composePathEffect,
  composeShader,
  dashPathEffect,
  lightingColorFilter,
  lumaColorFilter,
  offsetImageFilter,
  paintEffectShowcase,
  shadowLayer
} from '../../../main/ets/drawing/DrawingEffects';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, maxChannel, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 120;
const AREA: number = SIZE * SIZE;
const TINT_GREEN: number = 0x99;
const TINT_BLUE: number = 0xFF;

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
 * Count inked pixels inside one rectangle.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of pixels with a non-zero alpha.
 */
function countInkedInRect(buffer: ArrayBuffer, width: number, left: number, top: number,
  right: number, bottom: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let inked: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      if (bytes[(y * width + x) * 4 + 3] > 0) {
        inked++;
      }
    }
  }
  return inked;
}

/**
 * Count fully opaque pixels of the whole buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with alpha 255.
 */
function countOpaquePixels(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const total: number = bytes.length / 4;
  let opaque: number = 0;
  for (let index: number = 0; index < total; index++) {
    if (bytes[index * 4 + 3] === 255) {
      opaque++;
    }
  }
  return opaque;
}

/**
 * Count pixels whose alpha lies strictly between 0 and 255.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of partially transparent pixels.
 */
function countSoftPixelsByAlpha(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const total: number = bytes.length / 4;
  let soft: number = 0;
  for (let index: number = 0; index < total; index++) {
    const alpha: number = bytes[index * 4 + 3];
    if (alpha > 0 && alpha < 255) {
      soft++;
    }
  }
  return soft;
}

/**
 * Find the smallest alpha of the buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @returns { number } Minimum alpha value.
 */
function minAlphaOf(buffer: ArrayBuffer, width: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let min: number = 255;
  for (let index: number = 0; index < width * width; index++) {
    const alpha: number = bytes[index * 4 + 3];
    if (alpha < min) {
      min = alpha;
    }
  }
  return min;
}

/**
 * Find the largest alpha of the buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @returns { number } Maximum alpha value.
 */
function maxAlphaOf(buffer: ArrayBuffer, width: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let max: number = 0;
  for (let index: number = 0; index < width * width; index++) {
    const alpha: number = bytes[index * 4 + 3];
    if (alpha > max) {
      max = alpha;
    }
  }
  return max;
}

/**
 * Count pixels whose given channel equals the expected value.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @param { number } value - Expected channel value.
 * @returns { number } Number of matching pixels.
 */
function countChannelEquals(buffer: ArrayBuffer, channel: number, value: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const total: number = bytes.length / 4;
  let matched: number = 0;
  for (let index: number = 0; index < total; index++) {
    if (bytes[index * 4 + channel] === value) {
      matched++;
    }
  }
  return matched;
}

/**
 * Run the main paint effect showcase on a fresh canvas of the given size.
 *
 * @param { number } width - Canvas width in px.
 * @param { number } height - Canvas height in px.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function showcaseBuffer(width: number, height: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(width, height);
  paintEffectShowcase(target.canvas);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Create a target whose canvas is fully painted with one solid color.
 *
 * @param { number } size - Square edge length in px.
 * @param { common2D.Color } color - Fill color.
 * @returns { Promise<OffscreenTarget> } Target fully covered by the color.
 */
async function solidTarget(size: number, color: common2D.Color): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(size, size);
  target.canvas.drawColor(color, drawing.BlendMode.SRC);
  return target;
}

/**
 * Draw a solid source through a lattice onto a fresh canvas.
 *
 * @param { number } width - Canvas width in px.
 * @param { number } height - Canvas height in px.
 * @param { number[] } divs - Divider coordinates used on both axes.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function latticeBuffer(width: number, height: number, divs: number[]): Promise<ArrayBuffer> {
  const source: OffscreenTarget = await solidTarget(width, rgba(255, 30, 90, 150));
  const target: OffscreenTarget = await createOffscreenTarget(width, height);
  const lattice: drawing.Lattice = drawing.Lattice.createImageLattice(divs, divs, divs.length, divs.length);
  target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, width, height),
    drawing.FilterMode.FILTER_MODE_NEAREST);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Build a lattice that carries a four entry ARGB colour array.
 *
 * @returns { drawing.Lattice } Lattice object.
 */
function coloredLattice(): drawing.Lattice {
  const divs: number[] = [60];
  const colors: number[] = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFF333333];
  return drawing.Lattice.createImageLattice(divs, divs, 1, 1, null, null, colors);
}

/**
 * Create an opaque white brush.
 *
 * @returns { drawing.Brush } White fill brush.
 */
function whiteBrush(): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 255, 255));
  return brush;
}

/**
 * Stroke one horizontal line with a prepared pen and read the pixels.
 *
 * @param { drawing.Pen } pen - Prepared pen.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeLine(pen: drawing.Pen): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.attachPen(pen);
  target.canvas.drawLine(20, 60, 100, 60);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Fill one rectangle with a prepared brush and read the pixels.
 *
 * @param { drawing.Brush } brush - Prepared brush.
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillBlock(brush: drawing.Brush, left: number, top: number,
  right: number, bottom: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(left, top, right, bottom));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Draw one white glyph through a shadow layer and read the pixels.
 *
 * @param { drawing.ShadowLayer } shadow - Shadow layer reused across glyphs.
 * @param { number } fontSize - Glyph size in px.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawGlyph(shadow: drawing.ShadowLayer, fontSize: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const font: drawing.Font = new drawing.Font();
  font.setSize(fontSize);
  const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('A', font,
    drawing.TextEncoding.TEXT_ENCODING_UTF8);
  const brush: drawing.Brush = whiteBrush();
  brush.setShadowLayer(shadow);
  target.canvas.attachBrush(brush);
  target.canvas.drawTextBlob(blob, 20, 90);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Count dark partially transparent pixels, which only a shadow layer can paint.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of dark soft pixels.
 */
function countDarkSoftPixels(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const total: number = bytes.length / 4;
  let dark: number = 0;
  for (let index: number = 0; index < total; index++) {
    const offset: number = index * 4;
    const alpha: number = bytes[offset + 3];
    if (alpha > 0 && alpha < 255 && bytes[offset] < 24 && bytes[offset + 1] < 24 && bytes[offset + 2] < 24) {
      dark++;
    }
  }
  return dark;
}

export default function filterApiTailTest() {
  describe('FilterApiTailTest', () => {
    /** @tc.number SUB_NdkTsDrawing_FILTER_0137
     * @tc.name testFilterApi0137
     * @tc.desc Verify the showcase covers the whole canvas and keeps a solid core.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFilterApi0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0137 begin');
      await runCase('testFilterApi0137', async () => {
        const buffer: ArrayBuffer = await showcaseBuffer(300, 160);
        expect(countInkedPixels(buffer)).assertEqual(300 * 160);
        const cornerAlpha: number = channelAt(buffer, 300, 5, 5, 3);
        expect(cornerAlpha > 0).assertTrue();
        expect(cornerAlpha < 255).assertTrue();
        expect(channelAt(buffer, 300, 100, 100, 3)).assertEqual(116);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0138
     * @tc.name testFilterApi0138
     * @tc.desc Verify the showcase keeps every pixel inked and reaches full opacity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFilterApi0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0138 begin');
      await runCase('testFilterApi0138', async () => {
        const buffer: ArrayBuffer = await showcaseBuffer(SIZE, SIZE);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(minAlphaOf(buffer, SIZE) >= 30).assertTrue();
        expect(maxAlphaOf(buffer, SIZE)).assertEqual(204);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0139
     * @tc.name testFilterApi0139
     * @tc.desc Verify only part of the showcase canvas becomes fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0139 begin');
      await runCase('testFilterApi0139', async () => {
        const buffer: ArrayBuffer = await showcaseBuffer(200, 200);
        const opaque: number = countOpaquePixels(buffer);
        expect(opaque > 0).assertTrue();
        expect(opaque < 200 * 200).assertTrue();
        expect(channelAt(buffer, 200, 60, 60, 3)).assertEqual(34);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0140
     * @tc.name testFilterApi0140
     * @tc.desc Verify the final tint leaves the red channel empty everywhere.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0140 begin');
      await runCase('testFilterApi0140', async () => {
        const buffer: ArrayBuffer = await showcaseBuffer(320, 240);
        expect(countChannelEquals(buffer, 0, 0)).assertEqual(320 * 240);
        expect(countChannelEquals(buffer, 2, TINT_BLUE)).assertEqual(1);
        expect(channelAt(buffer, 320, 160, 120, 1)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0141
     * @tc.name testFilterApi0141
     * @tc.desc Verify the green channel equals the tint value on the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0141 begin');
      await runCase('testFilterApi0141', async () => {
        const buffer: ArrayBuffer = await showcaseBuffer(240, 200);
        expect(countChannelEquals(buffer, 1, TINT_GREEN)).assertEqual(1);
        expect(channelAt(buffer, 240, 120, 100, 2)).assertEqual(116);
        expect(countSoftPixelsByAlpha(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0142
     * @tc.name testFilterApi0142
     * @tc.desc Verify a second showcase pass raises the alpha of untouched pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0142 begin');
      await runCase('testFilterApi0142', async () => {
        const once: ArrayBuffer = await showcaseBuffer(SIZE, SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        paintEffectShowcase(target.canvas);
        paintEffectShowcase(target.canvas);
        const twice: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const onceCorner: number = channelAt(once, SIZE, 4, 4, 3);
        const twiceCorner: number = channelAt(twice, SIZE, 4, 4, 3);
        expect(onceCorner > 0).assertTrue();
        expect(twiceCorner > onceCorner).assertTrue();
        expect(channelAt(twice, SIZE, 4, 4, 2)).assertEqual(63);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0143
     * @tc.name testFilterApi0143
     * @tc.desc Verify a translated showcase keeps the same pixels shifted by the offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0143 begin');
      await runCase('testFilterApi0143', async () => {
        const plain: ArrayBuffer = await showcaseBuffer(200, 200);
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        target.canvas.save();
        target.canvas.translate(30, 30);
        paintEffectShowcase(target.canvas);
        target.canvas.restore();
        const moved: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(moved, 200, 35, 35, 3)).assertEqual(channelAt(plain, 200, 5, 5, 3));
        expect(channelAt(moved, 200, 150, 150, 3)).assertEqual(channelAt(plain, 200, 120, 120, 3));
        expect(channelAt(moved, 200, 5, 5, 3)).assertEqual(34);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0143 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0144
     * @tc.name testFilterApi0144
     * @tc.desc Verify a clip rectangle confines the whole showcase.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0144 begin');
      await runCase('testFilterApi0144', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        target.canvas.clipRect(ltrb(0, 0, 80, 200));
        paintEffectShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedInRect(buffer, 200, 0, 0, 80, 200)).assertEqual(80 * 200);
        expect(channelAt(buffer, 200, 100, 100, 3)).assertEqual(0);
        expect(channelAt(buffer, 200, 40, 40, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0145
     * @tc.name testFilterApi0145
     * @tc.desc Verify a half scale keeps the showcase inside the scaled top-left area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0145 begin');
      await runCase('testFilterApi0145', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 240);
        target.canvas.scale(0.5, 0.5);
        paintEffectShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, 240, 200, 200, 3)).assertEqual(34);
        expect(channelAt(buffer, 240, 60, 60, 3) > 0).assertTrue();
        expect(channelAt(buffer, 240, 15, 15, 2)).assertEqual(34);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0146
     * @tc.name testFilterApi0146
     * @tc.desc Verify an opaque background keeps every showcase pixel fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0146 begin');
      await runCase('testFilterApi0146', async () => {
        const blank: ArrayBuffer = await showcaseBuffer(SIZE, SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.drawColor(rgba(255, 0, 200, 0), drawing.BlendMode.SRC);
        paintEffectShowcase(target.canvas);
        const filled: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countOpaquePixels(filled)).assertEqual(AREA);
        expect(countOpaquePixels(blank) < AREA).assertTrue();
        expect(countInkedPixels(filled)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0147
     * @tc.name testFilterApi0147
     * @tc.desc Verify an opaque rectangle drawn after the showcase wins locally.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0147 begin');
      await runCase('testFilterApi0147', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        paintEffectShowcase(target.canvas);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 60, 60));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 30, 30, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 30, 30, 2)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 90, 90, 2)).assertEqual(116);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0148
     * @tc.name testFilterApi0148
     * @tc.desc Verify a source-over transparent rectangle erases part of the showcase.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0148 begin');
      await runCase('testFilterApi0148', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        paintEffectShowcase(target.canvas);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(0, 0, 0, 0));
        brush.setBlendMode(drawing.BlendMode.SRC);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 40, 40));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedInRect(buffer, SIZE, 0, 0, 40, 40)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 20, 20, 3)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0149
     * @tc.name testFilterApi0149
     * @tc.desc Verify a translucent layer only lifts the channels of its own rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0149 begin');
      await runCase('testFilterApi0149', async () => {
        const before: ArrayBuffer = await showcaseBuffer(SIZE, SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        paintEffectShowcase(target.canvas);
        target.canvas.saveLayer(ltrb(60, 60, SIZE, SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(64, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(60, 60, SIZE, SIZE));
        target.canvas.detachBrush();
        target.canvas.restore();
        const after: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(after, SIZE, 90, 90, 0) > channelAt(before, SIZE, 90, 90, 0)).assertTrue();
        expect(channelAt(after, SIZE, 30, 30, 0)).assertEqual(channelAt(before, SIZE, 30, 30, 0));
        expect(channelAt(after, SIZE, 90, 90, 2)).assertEqual(151);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0150
     * @tc.name testFilterApi0150
     * @tc.desc Verify the showcase works on a two pixel wide canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0150 begin');
      await runCase('testFilterApi0150', async () => {
        const buffer: ArrayBuffer = await showcaseBuffer(2, 1);
        expect(countInkedPixels(buffer)).assertEqual(2);
        expect(channelAt(buffer, 2, 0, 0, 3) > 0).assertTrue();
        expect(channelAt(buffer, 2, 1, 0, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0150 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0151
     * @tc.name testFilterApi0151
     * @tc.desc Verify the showcase centre is more opaque than its border on a small canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0151', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0151 begin');
      await runCase('testFilterApi0151', async () => {
        const buffer: ArrayBuffer = await showcaseBuffer(90, 90);
        const centerAlpha: number = channelAt(buffer, 90, 45, 45, 3);
        const borderAlpha: number = channelAt(buffer, 90, 1, 1, 3);
        expect(centerAlpha).assertEqual(34);
        expect(borderAlpha > 0).assertTrue();
        expect(borderAlpha).assertEqual(34);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0151 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0152
     * @tc.name testFilterApi0152
     * @tc.desc Verify a second pass translated off the canvas changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0152', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0152 begin');
      await runCase('testFilterApi0152', async () => {
        const once: ArrayBuffer = await showcaseBuffer(SIZE, SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        paintEffectShowcase(target.canvas);
        target.canvas.translate(0, 200);
        paintEffectShowcase(target.canvas);
        const twice: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(twice, SIZE, 60, 60, 0)).assertEqual(channelAt(once, SIZE, 60, 60, 0));
        expect(channelAt(twice, SIZE, 60, 60, 1)).assertEqual(38);
        expect(channelAt(twice, SIZE, 60, 60, 3)).assertEqual(63);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0152 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0153
     * @tc.name testFilterApi0153
     * @tc.desc Verify a rotated showcase keeps full coverage but changes the opaque area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0153', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0153 begin');
      await runCase('testFilterApi0153', async () => {
        const plain: ArrayBuffer = await showcaseBuffer(200, 200);
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        target.canvas.rotate(45, 100, 100);
        paintEffectShowcase(target.canvas);
        const rotated: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(rotated)).assertEqual(countInkedPixels(plain));
        expect((countOpaquePixels(rotated) !== countOpaquePixels(plain))).assertTrue();
        expect(channelAt(rotated, 200, 100, 100, 2)).assertEqual(116);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0153 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0154
     * @tc.name testFilterApi0154
     * @tc.desc Verify a narrow clip strip limits the showcase to that strip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0154', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0154 begin');
      await runCase('testFilterApi0154', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.clipRect(ltrb(100, 0, SIZE, SIZE));
        paintEffectShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(20 * SIZE);
        expect(countInkedInRect(buffer, SIZE, 100, 0, SIZE, SIZE)).assertEqual(20 * SIZE);
        expect(channelAt(buffer, SIZE, 50, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0154 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0155
     * @tc.name testFilterApi0155
     * @tc.desc Verify a luminance brush painted over the showcase produces neutral gray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0155', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0155 begin');
      await runCase('testFilterApi0155', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        paintEffectShowcase(target.canvas);
        target.canvas.clipRect(ltrb(60, 0, SIZE, SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setColorFilter(lumaColorFilter());
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(60, 0, SIZE, SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const red: number = channelAt(buffer, SIZE, 90, 30, 0);
        expect(red).assertEqual(0);
        expect(channelAt(buffer, SIZE, 90, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 30, 30, 0)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 90, 30, 1) < 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0155 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0156
     * @tc.name testFilterApi0156
     * @tc.desc Verify the showcase detaches its own pen and brush before returning.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0156', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0156 begin');
      await runCase('testFilterApi0156', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        paintEffectShowcase(target.canvas);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0156 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0157
     * @tc.name testFilterApi0157
     * @tc.desc Verify a single-divider lattice copies the solid source over the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0157', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0157 begin');
      await runCase('testFilterApi0157', async () => {
        const buffer: ArrayBuffer = await latticeBuffer(SIZE, SIZE, [60]);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(countChannelEquals(buffer, 2, 150)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 5, 5, 0)).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0157 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0158
     * @tc.name testFilterApi0158
     * @tc.desc Verify a three-divider lattice keeps hard nearest edges without blur.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0158', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0158 begin');
      await runCase('testFilterApi0158', async () => {
        const buffer: ArrayBuffer = await latticeBuffer(SIZE, SIZE, [30, 60, 90]);
        expect(countChannelEquals(buffer, 1, 90)).assertEqual(AREA);
        expect(countSoftPixelsByAlpha(buffer)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 15, 15, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0158 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0159
     * @tc.name testFilterApi0159
     * @tc.desc Verify a clipped lattice only paints the last quadrant.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0159', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0159 begin');
      await runCase('testFilterApi0159', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.clipRect(ltrb(60, 60, SIZE, SIZE));
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(60 * 60);
        expect(channelAt(buffer, SIZE, 90, 90, 2)).assertEqual(150);
        expect(channelAt(buffer, SIZE, 30, 30, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0159 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0160
     * @tc.name testFilterApi0160
     * @tc.desc Verify a luminance brush turns one lattice quadrant gray only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0160', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0160 begin');
      await runCase('testFilterApi0160', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.clipRect(ltrb(0, 0, 60, 60));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setColorFilter(lumaColorFilter());
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 60, 60));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const gray: number = channelAt(buffer, SIZE, 20, 20, 0);
        expect(gray).assertEqual(24);
        expect(channelAt(buffer, SIZE, 90, 90, 2)).assertEqual(150);
        expect(channelAt(buffer, SIZE, 90, 90, 0)).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0160 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0161
     * @tc.name testFilterApi0161
     * @tc.desc Verify a lighting filter shifts the blue channel of one lattice half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0161', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0161 begin');
      await runCase('testFilterApi0161', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.clipRect(ltrb(60, 0, SIZE, SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        brush.setColorFilter(lightingColorFilter());
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(60, 0, SIZE, SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const shifted: number = channelAt(buffer, SIZE, 90, 60, 2);
        expect(shifted < 150).assertTrue();
        expect(shifted > 0).assertTrue();
        expect(channelAt(buffer, SIZE, 30, 60, 2)).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0161 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0162
     * @tc.name testFilterApi0162
     * @tc.desc Verify a filtered block and a lattice side by side do not mix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0162', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0162 begin');
      await runCase('testFilterApi0162', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setColorFilter(lumaColorFilter());
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 60, SIZE));
        target.canvas.detachBrush();
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(60, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 90, 60, 2)).assertEqual(150);
        expect(channelAt(buffer, SIZE, 90, 60, 0)).assertEqual(30);
        expect(channelAt(buffer, SIZE, 30, 60, 0)).assertEqual(channelAt(buffer, SIZE, 30, 60, 2));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0162 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0163
     * @tc.name testFilterApi0163
     * @tc.desc Verify a lattice inside a save layer matches the direct lattice result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0163', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0163 begin');
      await runCase('testFilterApi0163', async () => {
        const direct: ArrayBuffer = await latticeBuffer(SIZE, SIZE, [60]);
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.saveLayer(ltrb(0, 0, SIZE, SIZE));
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.restore();
        const layered: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(layered, SIZE, 10, 10, 2)).assertEqual(channelAt(direct, SIZE, 10, 10, 2));
        expect(channelAt(layered, SIZE, 60, 60, 1)).assertEqual(channelAt(direct, SIZE, 60, 60, 1));
        expect(channelAt(layered, SIZE, 110, 110, 3)).assertEqual(channelAt(direct, SIZE, 110, 110, 3));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0163 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0164
     * @tc.name testFilterApi0164
     * @tc.desc Verify a lattice stretched onto a larger destination keeps the source color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0164', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0164 begin');
      await runCase('testFilterApi0164', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 12, 34, 56));
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([40, 80], [40, 80], 2, 2);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, 200, 200),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(200 * 200);
        expect(channelAt(buffer, 200, 100, 100, 2)).assertEqual(56);
        expect(channelAt(buffer, 200, 150, 150, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0164 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0165
     * @tc.name testFilterApi0165
     * @tc.desc Verify a lattice fills the whole target with the source colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0165', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0165 begin');
      await runCase('testFilterApi0165', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 200, 100, 50));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.drawImageLattice(source.pixelMap, coloredLattice(), ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 30, 30, 0)).assertEqual(200);
        expect(channelAt(buffer, SIZE, 90, 90, 2)).assertEqual(50);
        expect(countChannelEquals(buffer, 3, 255)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0165 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0166
     * @tc.name testFilterApi0166
     * @tc.desc Verify a clip rectangle also limits the coloured lattice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0166', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0166 begin');
      await runCase('testFilterApi0166', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 200, 100, 50));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.clipRect(ltrb(0, 0, 60, SIZE));
        target.canvas.drawImageLattice(source.pixelMap, coloredLattice(), ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        const outsideAlpha: number = channelAt(buffer, SIZE, 90, 60, 3);
        const edgeAlpha: number = channelAt(buffer, SIZE, 59, 60, 3);
        expect(inked).assertEqual(60 * SIZE);
        expect(outsideAlpha).assertEqual(0);
        expect(edgeAlpha).assertEqual(255);
        expect(countChannelEquals(buffer, 3, 255)).assertEqual(60 * SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0166 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0167
     * @tc.name testFilterApi0167
     * @tc.desc Verify a plus blend over the lattice keeps alpha and lifts the red channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0167', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0167 begin');
      await runCase('testFilterApi0167', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(64, 255, 255, 255));
        brush.setBlendMode(drawing.BlendMode.PLUS);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, SIZE, SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 0) > 30).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0167 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0168
     * @tc.name testFilterApi0168
     * @tc.desc Verify an opaque image drawn over the lattice replaces that corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0168', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0168 begin');
      await runCase('testFilterApi0168', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const overlay: OffscreenTarget = await solidTarget(60, rgba(255, 255, 220, 0));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImage(overlay.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 30, 30, 2)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 30, 30, 1)).assertEqual(220);
        expect(channelAt(buffer, SIZE, 90, 90, 2)).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0168 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0169
     * @tc.name testFilterApi0169
     * @tc.desc Verify a translated lattice shifts its pixels by the same offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0169', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0169 begin');
      await runCase('testFilterApi0169', async () => {
        const plain: ArrayBuffer = await latticeBuffer(SIZE, SIZE, [60]);
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.translate(30, 30);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, SIZE, 90, 90, 2)).assertEqual(channelAt(plain, SIZE, 60, 60, 2));
        expect(channelAt(buffer, SIZE, 45, 45, 0)).assertEqual(30);
        expect(channelAt(buffer, SIZE, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0169 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0170
     * @tc.name testFilterApi0170
     * @tc.desc Verify an opaque lattice completely hides the background color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0170', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0170 begin');
      await runCase('testFilterApi0170', async () => {
        const source: OffscreenTarget = await solidTarget(SIZE, rgba(255, 30, 90, 150));
        const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        target.canvas.drawColor(rgba(255, 255, 0, 0), drawing.BlendMode.SRC);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, SIZE, SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countChannelEquals(buffer, 0, 30)).assertEqual(AREA);
        expect(countChannelEquals(buffer, 0, 255)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 2)).assertEqual(150);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0170 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0171
     * @tc.name testFilterApi0171
     * @tc.desc Verify one path effect can be shared by two pens on two canvases.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0171', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0171 begin');
      await runCase('testFilterApi0171', async () => {
        const effect: drawing.PathEffect = dashPathEffect();
        const first: drawing.Pen = new drawing.Pen();
        first.setColor(rgba(255, 255, 255, 255));
        first.setStrokeWidth(6);
        first.setPathEffect(effect);
        const second: drawing.Pen = new drawing.Pen();
        second.setColor(rgba(255, 255, 255, 255));
        second.setStrokeWidth(6);
        second.setPathEffect(effect);
        const firstBuffer: ArrayBuffer = await strokeLine(first);
        const secondBuffer: ArrayBuffer = await strokeLine(second);
        expect(countInkedPixels(firstBuffer)).assertEqual(countInkedPixels(secondBuffer));
        expect(channelAt(firstBuffer, SIZE, 40, 60, 3)).assertEqual(channelAt(secondBuffer, SIZE, 40, 60, 3));
        expect(countInkedPixels(firstBuffer) < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0171 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0172
     * @tc.name testFilterApi0172
     * @tc.desc Verify a shared dash effect still scales with the stroke width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0172', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0172 begin');
      await runCase('testFilterApi0172', async () => {
        const effect: drawing.PathEffect = dashPathEffect();
        const thin: drawing.Pen = new drawing.Pen();
        thin.setColor(rgba(255, 255, 255, 255));
        thin.setStrokeWidth(4);
        thin.setPathEffect(effect);
        const thick: drawing.Pen = new drawing.Pen();
        thick.setColor(rgba(255, 255, 255, 255));
        thick.setStrokeWidth(10);
        thick.setPathEffect(effect);
        const thinInk: number = countInkedPixels(await strokeLine(thin));
        const thickBuffer: ArrayBuffer = await strokeLine(thick);
        expect(countInkedPixels(thickBuffer) > thinInk).assertTrue();
        expect(thinInk > 0).assertTrue();
        expect(channelAt(thickBuffer, SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0172 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0173
     * @tc.name testFilterApi0173
     * @tc.desc Verify one color filter turns two differently colored brushes gray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0173', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0173 begin');
      await runCase('testFilterApi0173', async () => {
        const filter: drawing.ColorFilter = composeColorFilter();
        const redBrush: drawing.Brush = new drawing.Brush();
        redBrush.setColor(rgba(255, 255, 0, 0));
        redBrush.setColorFilter(filter);
        const greenBrush: drawing.Brush = new drawing.Brush();
        greenBrush.setColor(rgba(255, 0, 255, 0));
        greenBrush.setColorFilter(filter);
        const redBuffer: ArrayBuffer = await fillBlock(redBrush, 30, 30, 70, 70);
        const greenBuffer: ArrayBuffer = await fillBlock(greenBrush, 30, 30, 70, 70);
        expect(channelAt(redBuffer, SIZE, 50, 50, 0)).assertEqual(channelAt(redBuffer, SIZE, 50, 50, 1));
        expect(channelAt(greenBuffer, SIZE, 50, 50, 1)).assertEqual(channelAt(greenBuffer, SIZE, 50, 50, 2));
        expect(channelAt(redBuffer, SIZE, 50, 50, 3)).assertEqual(95);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0173 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0174
     * @tc.name testFilterApi0174
     * @tc.desc Verify reusing the same brush on two canvases gives identical pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0174', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0174 begin');
      await runCase('testFilterApi0174', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 200, 60, 20));
        brush.setColorFilter(lumaColorFilter());
        const first: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        const second: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(channelAt(first, SIZE, 50, 50, 0)).assertEqual(channelAt(second, SIZE, 50, 50, 0));
        expect(channelAt(first, SIZE, 50, 50, 1)).assertEqual(channelAt(second, SIZE, 50, 50, 1));
        expect(channelAt(first, SIZE, 50, 50, 3)).assertEqual(channelAt(second, SIZE, 50, 50, 3));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0174 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0175
     * @tc.name testFilterApi0175
     * @tc.desc Verify one blur filter spreads two different colors by the same amount.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0175', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0175 begin');
      await runCase('testFilterApi0175', async () => {
        const filter: drawing.ImageFilter = blurImageFilter(4);
        const redBrush: drawing.Brush = whiteBrush();
        redBrush.setColor(rgba(255, 255, 0, 0));
        redBrush.setImageFilter(filter);
        const blueBrush: drawing.Brush = whiteBrush();
        blueBrush.setColor(rgba(255, 0, 0, 255));
        blueBrush.setImageFilter(filter);
        const redBuffer: ArrayBuffer = await fillBlock(redBrush, 30, 30, 70, 70);
        const blueBuffer: ArrayBuffer = await fillBlock(blueBrush, 30, 30, 70, 70);
        expect(countSoftPixelsByAlpha(redBuffer)).assertEqual(countSoftPixelsByAlpha(blueBuffer));
        expect(channelAt(redBuffer, SIZE, 50, 50, 0)).assertEqual(255);
        expect(channelAt(blueBuffer, SIZE, 50, 50, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0175 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0176
     * @tc.name testFilterApi0176
     * @tc.desc Verify clearing and reassigning an image filter restores the same blur.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0176', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0176 begin');
      await runCase('testFilterApi0176', async () => {
        const brush: drawing.Brush = whiteBrush();
        brush.setImageFilter(blurImageFilter(4));
        const withFilter: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        brush.setImageFilter(null);
        const cleared: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        brush.setImageFilter(blurImageFilter(4));
        const restored: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(countSoftPixelsByAlpha(cleared)).assertEqual(0);
        expect(countSoftPixelsByAlpha(restored)).assertEqual(countSoftPixelsByAlpha(withFilter));
        expect(channelAt(cleared, SIZE, 50, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0176 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0177
     * @tc.name testFilterApi0177
     * @tc.desc Verify one mask filter softens both a stroke and a fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0177', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0177 begin');
      await runCase('testFilterApi0177', async () => {
        const mask: drawing.MaskFilter = blurMaskFilter(6);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(12);
        pen.setMaskFilter(mask);
        const brush: drawing.Brush = whiteBrush();
        brush.setMaskFilter(mask);
        const strokeBuffer: ArrayBuffer = await strokeLine(pen);
        const fillBuffer: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(countSoftPixelsByAlpha(strokeBuffer) > 0).assertTrue();
        expect(countSoftPixelsByAlpha(fillBuffer) > 0).assertTrue();
        expect(countOpaquePixels(strokeBuffer)).assertEqual(0);
        expect(countOpaquePixels(fillBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0177 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0178
     * @tc.name testFilterApi0178
     * @tc.desc Verify a shared mask filter produces more soft pixels on a wider stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0178', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0178 begin');
      await runCase('testFilterApi0178', async () => {
        const mask: drawing.MaskFilter = blurMaskFilter(4);
        const thin: drawing.Pen = new drawing.Pen();
        thin.setColor(rgba(255, 255, 255, 255));
        thin.setStrokeWidth(4);
        thin.setMaskFilter(mask);
        const thick: drawing.Pen = new drawing.Pen();
        thick.setColor(rgba(255, 255, 255, 255));
        thick.setStrokeWidth(12);
        thick.setMaskFilter(mask);
        const thinSoft: number = countSoftPixelsByAlpha(await strokeLine(thin));
        const thickBuffer: ArrayBuffer = await strokeLine(thick);
        const thickSoft: number = countSoftPixelsByAlpha(thickBuffer);
        expect(thickSoft > thinSoft).assertTrue();
        expect(thinSoft > 0).assertTrue();
        expect(countOpaquePixels(thickBuffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0178 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0179
     * @tc.name testFilterApi0179
     * @tc.desc Verify one gradient shader paints the same color on a pen and a brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0179', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0179 begin');
      await runCase('testFilterApi0179', async () => {
        const shader: drawing.ShaderEffect = colorShader(0xFF884400);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(shader);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(shader);
        const strokeBuffer: ArrayBuffer = await strokeLine(pen);
        const fillBuffer: ArrayBuffer = await fillBlock(brush, 0, 0, SIZE, SIZE);
        expect(channelAt(strokeBuffer, SIZE, 60, 60, 0)).assertEqual(channelAt(fillBuffer, SIZE, 60, 60, 0));
        expect(channelAt(strokeBuffer, SIZE, 60, 60, 1)).assertEqual(channelAt(fillBuffer, SIZE, 60, 60, 1));
        expect(channelAt(strokeBuffer, SIZE, 60, 60, 2)).assertEqual(channelAt(fillBuffer, SIZE, 60, 60, 2));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0179 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0180
     * @tc.name testFilterApi0180
     * @tc.desc Verify a shared shader keeps the same color on two stroke widths.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0180', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0180 begin');
      await runCase('testFilterApi0180', async () => {
        const shader: drawing.ShaderEffect = colorShader(0xFF224488);
        const thin: drawing.Pen = new drawing.Pen();
        thin.setStrokeWidth(8);
        thin.setShaderEffect(shader);
        const thick: drawing.Pen = new drawing.Pen();
        thick.setStrokeWidth(16);
        thick.setShaderEffect(shader);
        const thinBuffer: ArrayBuffer = await strokeLine(thin);
        const thickBuffer: ArrayBuffer = await strokeLine(thick);
        expect(channelAt(thinBuffer, SIZE, 50, 60, 2)).assertEqual(channelAt(thickBuffer, SIZE, 50, 60, 2));
        expect(channelAt(thinBuffer, SIZE, 50, 60, 0)).assertEqual(0x22);
        expect(countInkedPixels(thickBuffer) > countInkedPixels(thinBuffer)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0180 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0181
     * @tc.name testFilterApi0181
     * @tc.desc Verify one color shader paints the exact color for both paint types.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0181', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0181 begin');
      await runCase('testFilterApi0181', async () => {
        const shader: drawing.ShaderEffect = colorShader(0xFF884400);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(12);
        pen.setShaderEffect(shader);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(shader);
        const strokeBuffer: ArrayBuffer = await strokeLine(pen);
        const fillBuffer: ArrayBuffer = await fillBlock(brush, 40, 40, 80, 80);
        expect(channelAt(strokeBuffer, SIZE, 60, 60, 0)).assertEqual(0x88);
        expect(channelAt(strokeBuffer, SIZE, 60, 60, 1)).assertEqual(0x44);
        expect(channelAt(fillBuffer, SIZE, 60, 60, 0)).assertEqual(0x88);
        expect(channelAt(fillBuffer, SIZE, 60, 60, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0181 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0182
     * @tc.name testFilterApi0182
     * @tc.desc Verify one dash effect paints a longer line on a wider canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0182', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0182 begin');
      await runCase('testFilterApi0182', async () => {
        const effect: drawing.PathEffect = dashPathEffect();
        const smallPen: drawing.Pen = new drawing.Pen();
        smallPen.setColor(rgba(255, 255, 255, 255));
        smallPen.setStrokeWidth(6);
        smallPen.setPathEffect(effect);
        const largePen: drawing.Pen = new drawing.Pen();
        largePen.setColor(rgba(255, 255, 255, 255));
        largePen.setStrokeWidth(6);
        largePen.setPathEffect(effect);
        const smallBuffer: ArrayBuffer = await strokeLine(smallPen);
        const wide: OffscreenTarget = await createOffscreenTarget(200, 200);
        wide.canvas.attachPen(largePen);
        wide.canvas.drawLine(20, 60, 180, 60);
        wide.canvas.detachPen();
        const largeBuffer: ArrayBuffer = await readPixelBuffer(wide.pixelMap);
        expect(countInkedPixels(largeBuffer) > countInkedPixels(smallBuffer)).assertTrue();
        expect(countInkedPixels(smallBuffer) > 0).assertTrue();
        expect(channelAt(largeBuffer, 200, 150, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0182 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0183
     * @tc.name testFilterApi0183
     * @tc.desc Verify one shadow layer produces the same shadow on two glyphs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0183', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0183 begin');
      await runCase('testFilterApi0183', async () => {
        const shadow: drawing.ShadowLayer = shadowLayer();
        const first: ArrayBuffer = await drawGlyph(shadow, 44);
        const second: ArrayBuffer = await drawGlyph(shadow, 44);
        expect(countDarkSoftPixels(first)).assertEqual(countDarkSoftPixels(second));
        expect(countDarkSoftPixels(first) > 0).assertTrue();
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0183 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0184
     * @tc.name testFilterApi0184
     * @tc.desc Verify a shared shadow layer grows with the glyph size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0184', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0184 begin');
      await runCase('testFilterApi0184', async () => {
        const shadow: drawing.ShadowLayer = shadowLayer();
        const small: ArrayBuffer = await drawGlyph(shadow, 32);
        const large: ArrayBuffer = await drawGlyph(shadow, 56);
        expect(countDarkSoftPixels(large) > countDarkSoftPixels(small)).assertTrue();
        expect(countInkedPixels(large) > countInkedPixels(small)).assertTrue();
        expect(countDarkSoftPixels(small) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0184 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0185
     * @tc.name testFilterApi0185
     * @tc.desc Verify one composed path effect repeats on two independent pens.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0185', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0185 begin');
      await runCase('testFilterApi0185', async () => {
        const effect: drawing.PathEffect = composePathEffect();
        const first: drawing.Pen = new drawing.Pen();
        first.setColor(rgba(255, 255, 255, 255));
        first.setStrokeWidth(8);
        first.setPathEffect(effect);
        const second: drawing.Pen = new drawing.Pen();
        second.setColor(rgba(255, 255, 255, 255));
        second.setStrokeWidth(8);
        second.setPathEffect(effect);
        const firstBuffer: ArrayBuffer = await strokeLine(first);
        const secondBuffer: ArrayBuffer = await strokeLine(second);
        expect(countInkedPixels(firstBuffer)).assertEqual(countInkedPixels(secondBuffer));
        expect(channelAt(firstBuffer, SIZE, 60, 60, 3)).assertEqual(channelAt(secondBuffer, SIZE, 60, 60, 3));
        expect(countInkedPixels(firstBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0185 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0186
     * @tc.name testFilterApi0186
     * @tc.desc Verify one composed image filter softens both a stroke and a fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0186', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0186 begin');
      await runCase('testFilterApi0186', async () => {
        const filter: drawing.ImageFilter = composeImageFilter();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(10);
        pen.setImageFilter(filter);
        const brush: drawing.Brush = whiteBrush();
        brush.setImageFilter(filter);
        const strokeBuffer: ArrayBuffer = await strokeLine(pen);
        const fillBuffer: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(countSoftPixelsByAlpha(strokeBuffer) > 0).assertTrue();
        expect(countSoftPixelsByAlpha(fillBuffer)).assertEqual(0);
        expect(countInkedPixels(strokeBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0186 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0187
     * @tc.name testFilterApi0187
     * @tc.desc Verify one composed shader merges the same way on two brushes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0187', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0187 begin');
      await runCase('testFilterApi0187', async () => {
        const shader: drawing.ShaderEffect = composeShader();
        const first: drawing.Brush = new drawing.Brush();
        first.setShaderEffect(shader);
        const second: drawing.Brush = new drawing.Brush();
        second.setShaderEffect(shader);
        const firstBuffer: ArrayBuffer = await fillBlock(first, 10, 10, 110, 110);
        const secondBuffer: ArrayBuffer = await fillBlock(second, 10, 10, 110, 110);
        expect(channelAt(firstBuffer, SIZE, 60, 60, 0)).assertEqual(channelAt(secondBuffer, SIZE, 60, 60, 0));
        expect(channelAt(firstBuffer, SIZE, 60, 60, 1)).assertEqual(channelAt(secondBuffer, SIZE, 60, 60, 1));
        expect(channelAt(firstBuffer, SIZE, 60, 60, 0) > channelAt(firstBuffer, SIZE, 60, 60, 2)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0187 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0188
     * @tc.name testFilterApi0188
     * @tc.desc Verify a color to image filter can be removed and reapplied on one brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0188', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0188 begin');
      await runCase('testFilterApi0188', async () => {
        const brush: drawing.Brush = whiteBrush();
        brush.setImageFilter(colorToImageFilter());
        const filtered: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        brush.setImageFilter(null);
        const plain: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        brush.setImageFilter(colorToImageFilter());
        const again: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(countSoftPixelsByAlpha(plain)).assertEqual(0);
        expect(countSoftPixelsByAlpha(again)).assertEqual(countSoftPixelsByAlpha(filtered));
        expect(channelAt(plain, SIZE, 50, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0188 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0189
     * @tc.name testFilterApi0189
     * @tc.desc Verify a tiny blur spreads less than a normal blur.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0189', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0189 begin');
      await runCase('testFilterApi0189', async () => {
        const microBrush: drawing.Brush = whiteBrush();
        microBrush.setImageFilter(blurImageFilter(0.01));
        const heavyBrush: drawing.Brush = whiteBrush();
        heavyBrush.setImageFilter(blurImageFilter(6));
        const micro: ArrayBuffer = await fillBlock(microBrush, 30, 30, 70, 70);
        const heavy: ArrayBuffer = await fillBlock(heavyBrush, 30, 30, 70, 70);
        expect(countInkedPixels(heavy) > countInkedPixels(micro)).assertTrue();
        expect(countSoftPixelsByAlpha(heavy)).assertEqual(0);
        expect(channelAt(micro, SIZE, 50, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0189 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0190
     * @tc.name testFilterApi0190
     * @tc.desc Verify a near zero blur hardly changes the painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0190', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0190 begin');
      await runCase('testFilterApi0190', async () => {
        const plainBrush: drawing.Brush = whiteBrush();
        const microBrush: drawing.Brush = whiteBrush();
        microBrush.setImageFilter(blurImageFilter(0.01));
        const plain: ArrayBuffer = await fillBlock(plainBrush, 30, 30, 70, 70);
        const micro: ArrayBuffer = await fillBlock(microBrush, 30, 30, 70, 70);
        const extra: number = countInkedPixels(micro) - countInkedPixels(plain);
        expect(countInkedPixels(plain)).assertEqual(1600);
        expect(extra >= 0).assertTrue();
        expect(extra < 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0190 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0191
     * @tc.name testFilterApi0191
     * @tc.desc Verify an extreme blur leaves no fully opaque pixel behind.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0191', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0191 begin');
      await runCase('testFilterApi0191', async () => {
        const brush: drawing.Brush = whiteBrush();
        brush.setImageFilter(blurImageFilter(100));
        const buffer: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(countOpaquePixels(buffer)).assertEqual(14400);
        expect(countInkedPixels(buffer) > AREA / 2).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0191 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0192
     * @tc.name testFilterApi0192
     * @tc.desc Verify a near zero mask blur keeps the stroke edge hard.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0192', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0192 begin');
      await runCase('testFilterApi0192', async () => {
        const plain: drawing.Pen = new drawing.Pen();
        plain.setColor(rgba(255, 255, 255, 255));
        plain.setStrokeWidth(6);
        const micro: drawing.Pen = new drawing.Pen();
        micro.setColor(rgba(255, 255, 255, 255));
        micro.setStrokeWidth(6);
        micro.setMaskFilter(blurMaskFilter(0.01));
        const plainBuffer: ArrayBuffer = await strokeLine(plain);
        const microBuffer: ArrayBuffer = await strokeLine(micro);
        expect(countInkedPixels(microBuffer) >= countInkedPixels(plainBuffer)).assertTrue();
        expect(countOpaquePixels(microBuffer) >= countOpaquePixels(plainBuffer)).assertTrue();
        expect(channelAt(microBuffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0192 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0193
     * @tc.name testFilterApi0193
     * @tc.desc Verify a small mask blur adds fewer soft pixels than a large one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0193', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0193 begin');
      await runCase('testFilterApi0193', async () => {
        const light: drawing.Pen = new drawing.Pen();
        light.setColor(rgba(255, 255, 255, 255));
        light.setStrokeWidth(8);
        light.setMaskFilter(blurMaskFilter(0.01));
        const heavy: drawing.Pen = new drawing.Pen();
        heavy.setColor(rgba(255, 255, 255, 255));
        heavy.setStrokeWidth(8);
        heavy.setMaskFilter(blurMaskFilter(8));
        const lightSoft: number = countSoftPixelsByAlpha(await strokeLine(light));
        const heavyBuffer: ArrayBuffer = await strokeLine(heavy);
        const heavySoft: number = countSoftPixelsByAlpha(heavyBuffer);
        expect(heavySoft > lightSoft).assertTrue();
        expect(heavySoft > 0).assertTrue();
        expect(channelAt(heavyBuffer, SIZE, 60, 60, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0193 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0194
     * @tc.name testFilterApi0194
     * @tc.desc Verify an extreme mask blur wipes out the opaque stroke core.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0194', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0194 begin');
      await runCase('testFilterApi0194', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(8);
        pen.setMaskFilter(blurMaskFilter(100));
        const buffer: ArrayBuffer = await strokeLine(pen);
        expect(countOpaquePixels(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer) > AREA / 2).assertTrue();
        expect(maxChannel(buffer, 3) < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0194 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0195
     * @tc.name testFilterApi0195
     * @tc.desc Verify a four digit positive offset pushes the block off the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0195', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0195 begin');
      await runCase('testFilterApi0195', async () => {
        const brush: drawing.Brush = whiteBrush();
        brush.setImageFilter(offsetImageFilter(1000, 0));
        const buffer: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0195 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0196
     * @tc.name testFilterApi0196
     * @tc.desc Verify opposite four digit offsets both leave the canvas empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0196', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0196 begin');
      await runCase('testFilterApi0196', async () => {
        const rightBrush: drawing.Brush = whiteBrush();
        rightBrush.setImageFilter(offsetImageFilter(1000, 0));
        const downBrush: drawing.Brush = whiteBrush();
        downBrush.setImageFilter(offsetImageFilter(-1000, 1000));
        const right: ArrayBuffer = await fillBlock(rightBrush, 30, 30, 70, 70);
        const down: ArrayBuffer = await fillBlock(downBrush, 30, 30, 70, 70);
        expect(countInkedPixels(right)).assertEqual(countInkedPixels(down));
        expect(maxChannel(right, 3)).assertEqual(0);
        expect(countSoftPixelsByAlpha(down)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0196 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0197
     * @tc.name testFilterApi0197
     * @tc.desc Verify a blur at the canvas edge keeps fewer soft pixels than inside.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0197', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0197 begin');
      await runCase('testFilterApi0197', async () => {
        const edgeBrush: drawing.Brush = whiteBrush();
        edgeBrush.setImageFilter(blurImageFilter(20));
        const innerBrush: drawing.Brush = whiteBrush();
        innerBrush.setImageFilter(blurImageFilter(20));
        const edge: ArrayBuffer = await fillBlock(edgeBrush, 0, 0, 40, 40);
        const inner: ArrayBuffer = await fillBlock(innerBrush, 40, 40, 80, 80);
        expect(countSoftPixelsByAlpha(edge)).assertEqual(0);
        expect(countSoftPixelsByAlpha(inner)).assertEqual(0);
        expect(channelAt(inner, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0197 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0198
     * @tc.name testFilterApi0198
     * @tc.desc Verify clearing the image filter on a pen restores a hard stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0198', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0198 begin');
      await runCase('testFilterApi0198', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(8);
        pen.setImageFilter(blurImageFilter(6));
        const blurred: ArrayBuffer = await strokeLine(pen);
        pen.setImageFilter(null);
        const cleared: ArrayBuffer = await strokeLine(pen);
        expect(countSoftPixelsByAlpha(blurred) > 0).assertTrue();
        expect(countSoftPixelsByAlpha(cleared)).assertEqual(0);
        expect(channelAt(cleared, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0198 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0199
     * @tc.name testFilterApi0199
     * @tc.desc Verify clearing the mask filter on a brush restores a crisp rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0199', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0199 begin');
      await runCase('testFilterApi0199', async () => {
        const brush: drawing.Brush = whiteBrush();
        brush.setMaskFilter(blurMaskFilter(6));
        const blurred: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        brush.setMaskFilter(null);
        const cleared: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(countSoftPixelsByAlpha(blurred) > 0).assertTrue();
        expect(countSoftPixelsByAlpha(cleared)).assertEqual(0);
        expect(countOpaquePixels(cleared)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0199 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0200
     * @tc.name testFilterApi0200
     * @tc.desc Verify clearing the path effect on a pen restores the solid line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0200', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0200 begin');
      await runCase('testFilterApi0200', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setPathEffect(dashPathEffect());
        const dashed: ArrayBuffer = await strokeLine(pen);
        pen.setPathEffect(null);
        const solid: ArrayBuffer = await strokeLine(pen);
        expect(countInkedPixels(solid) > countInkedPixels(dashed)).assertTrue();
        expect(channelAt(solid, SIZE, 40, 60, 3)).assertEqual(255);
        expect(channelAt(solid, SIZE, 110, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0200 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0201
     * @tc.name testFilterApi0201
     * @tc.desc Verify clearing the color filter keeps the original brush color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0201', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0201 begin');
      await runCase('testFilterApi0201', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setColorFilter(lumaColorFilter());
        const filtered: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        brush.setColorFilter(null);
        const raw: ArrayBuffer = await fillBlock(brush, 30, 30, 70, 70);
        expect(channelAt(filtered, SIZE, 50, 50, 0)).assertEqual(channelAt(filtered, SIZE, 50, 50, 1));
        expect(channelAt(raw, SIZE, 50, 50, 0)).assertEqual(255);
        expect(channelAt(raw, SIZE, 50, 50, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0201 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0202
     * @tc.name testFilterApi0202
     * @tc.desc Verify stacking an image filter and a mask filter softens more than either alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0202', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0202 begin');
      await runCase('testFilterApi0202', async () => {
        const imageOnly: drawing.Pen = new drawing.Pen();
        imageOnly.setColor(rgba(255, 255, 255, 255));
        imageOnly.setStrokeWidth(10);
        imageOnly.setImageFilter(blurImageFilter(4));
        const maskOnly: drawing.Pen = new drawing.Pen();
        maskOnly.setColor(rgba(255, 255, 255, 255));
        maskOnly.setStrokeWidth(10);
        maskOnly.setMaskFilter(blurMaskFilter(4));
        const combined: drawing.Pen = new drawing.Pen();
        combined.setColor(rgba(255, 255, 255, 255));
        combined.setStrokeWidth(10);
        combined.setImageFilter(blurImageFilter(4));
        combined.setMaskFilter(blurMaskFilter(4));
        const imageBuffer: ArrayBuffer = await strokeLine(imageOnly);
        const maskBuffer: ArrayBuffer = await strokeLine(maskOnly);
        const combinedBuffer: ArrayBuffer = await strokeLine(combined);
        const limit: number = Math.min(countOpaquePixels(imageBuffer), countOpaquePixels(maskBuffer));
        expect(countOpaquePixels(combinedBuffer) <= limit).assertTrue();
        expect(countSoftPixelsByAlpha(combinedBuffer) > 0).assertTrue();
        expect(countInkedPixels(combinedBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0202 end');
    });
  });
}
