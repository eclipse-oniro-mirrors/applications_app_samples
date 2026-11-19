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
import { countInkedPixels, DRAWING_TAG, maxChannel, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 120;
const AREA: number = SIZE * SIZE;
const HALF_AREA: number = (SIZE / 2) * SIZE;
const DST_R: number = 200;
const DST_G: number = 100;
const DST_B: number = 50;
const LINE_Y: number = 60;
const OFF_Y: number = 30;

/**
 * Read the four channels of one pixel into a fixed order array.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number[] } Channels in red, green, blue, alpha order.
 */
function pixelAt(buffer: ArrayBuffer, x: number, y: number): number[] {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const start: number = (y * SIZE + x) * 4;
  return [bytes[start], bytes[start + 1], bytes[start + 2], bytes[start + 3]];
}

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
 * Sum the three color channels of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Red plus green plus blue.
 */
function sumAt(buffer: ArrayBuffer, x: number, y: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  const start: number = (y * SIZE + x) * 4;
  return bytes[start] + bytes[start + 1] + bytes[start + 2];
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
  let matched: number = 0;
  for (let index: number = 0; index < AREA; index++) {
    if (bytes[index * 4 + channel] === value) {
      matched++;
    }
  }
  return matched;
}

/**
 * Count pixels whose given channel is greater than the reference value.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @param { number } value - Reference channel value.
 * @returns { number } Number of pixels above the reference.
 */
function countChannelGreater(buffer: ArrayBuffer, channel: number, value: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let matched: number = 0;
  for (let index: number = 0; index < AREA; index++) {
    if (bytes[index * 4 + channel] > value) {
      matched++;
    }
  }
  return matched;
}

/**
 * Count pixels whose given channel is lower than the reference value.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @param { number } value - Reference channel value.
 * @returns { number } Number of pixels below the reference.
 */
function countChannelLess(buffer: ArrayBuffer, channel: number, value: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let matched: number = 0;
  for (let index: number = 0; index < AREA; index++) {
    if (bytes[index * 4 + channel] < value) {
      matched++;
    }
  }
  return matched;
}

/**
 * Count fully opaque pixels of the whole buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with alpha 255.
 */
function countOpaque(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let opaque: number = 0;
  for (let index: number = 0; index < AREA; index++) {
    if (bytes[index * 4 + 3] === 255) {
      opaque++;
    }
  }
  return opaque;
}

/**
 * Count pixels that hold exactly the same four channels in both buffers.
 *
 * @param { ArrayBuffer } left - First raw RGBA_8888 buffer.
 * @param { ArrayBuffer } right - Second raw RGBA_8888 buffer.
 * @returns { number } Number of identical pixels.
 */
function samePixelCount(left: ArrayBuffer, right: ArrayBuffer): number {
  const leftBytes: Uint8Array = new Uint8Array(left);
  const rightBytes: Uint8Array = new Uint8Array(right);
  let same: number = 0;
  for (let index: number = 0; index < AREA * 4; index += 4) {
    if (leftBytes[index] === rightBytes[index] && leftBytes[index + 1] === rightBytes[index + 1] &&
      leftBytes[index + 2] === rightBytes[index + 2] && leftBytes[index + 3] === rightBytes[index + 3]) {
      same++;
    }
  }
  return same;
}

/**
 * Count pixels that differ in at least one channel between two buffers.
 *
 * @param { ArrayBuffer } left - First raw RGBA_8888 buffer.
 * @param { ArrayBuffer } right - Second raw RGBA_8888 buffer.
 * @returns { number } Number of differing pixels.
 */
function diffPixelCount(left: ArrayBuffer, right: ArrayBuffer): number {
  return AREA - samePixelCount(left, right);
}

/**
 * Sum the absolute differences of one channel between two buffers.
 *
 * @param { ArrayBuffer } left - First raw RGBA_8888 buffer.
 * @param { ArrayBuffer } right - Second raw RGBA_8888 buffer.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Accumulated absolute difference.
 */
function diffChannelTotal(left: ArrayBuffer, right: ArrayBuffer, channel: number): number {
  const leftBytes: Uint8Array = new Uint8Array(left);
  const rightBytes: Uint8Array = new Uint8Array(right);
  let total: number = 0;
  for (let index: number = 0; index < AREA; index++) {
    const offset: number = index * 4 + channel;
    total += Math.abs(leftBytes[offset] - rightBytes[offset]);
  }
  return total;
}

/**
 * Create a canvas fully painted with the opaque destination color.
 *
 * @returns { Promise<OffscreenTarget> } Target filled with the destination color.
 */
async function baseTarget(): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.drawColor(rgba(255, DST_R, DST_G, DST_B), drawing.BlendMode.SRC);
  return target;
}

/**
 * Read the pixels of the untouched destination canvas.
 *
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function baseBuffer(): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Composite one source color over the whole canvas with one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode under test.
 * @param { number } alpha - Source alpha.
 * @param { number } red - Source red channel.
 * @param { number } green - Source green channel.
 * @param { number } blue - Source blue channel.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function overColor(mode: drawing.BlendMode, alpha: number, red: number,
  green: number, blue: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  target.canvas.drawColor(rgba(alpha, red, green, blue), mode);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Fill the left half with one source color using one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode under test.
 * @param { number } alpha - Source alpha.
 * @param { number } red - Source red channel.
 * @param { number } green - Source green channel.
 * @param { number } blue - Source blue channel.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function overFill(mode: drawing.BlendMode, alpha: number, red: number,
  green: number, blue: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(alpha, red, green, blue));
  brush.setBlendMode(mode);
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(0, 0, SIZE / 2, SIZE));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stroke one horizontal line over the canvas using one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode under test.
 * @param { number } alpha - Source alpha.
 * @param { number } red - Source red channel.
 * @param { number } green - Source green channel.
 * @param { number } blue - Source blue channel.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function overStroke(mode: drawing.BlendMode, alpha: number, red: number,
  green: number, blue: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(alpha, red, green, blue));
  pen.setStrokeWidth(12);
  pen.setBlendMode(mode);
  target.canvas.attachPen(pen);
  target.canvas.drawLine(20, LINE_Y, 100, LINE_Y);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

export default function enumBlendModeTailTest() {
  describe('EnumBlendModeTailTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0046
     * @tc.name testEnumBlend0046
     * @tc.desc Verify DARKEN with a white source keeps the destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0046 begin');
      await runCase('testEnumBlend0046', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.DARKEN, 255, 255, 255, 255);
        const base: ArrayBuffer = await baseBuffer();
        expect(samePixelCount(buffer, base)).assertEqual(AREA);
        expect(channelAt(buffer, 0, 0, 0)).assertEqual(DST_R);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0047
     * @tc.name testEnumBlend0047
     * @tc.desc Verify DARKEN with a black brush clears the painted rectangle only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0047 begin');
      await runCase('testEnumBlend0047', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.DARKEN, 255, 0, 0, 0);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(DST_R);
        expect(countOpaque(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0048
     * @tc.name testEnumBlend0048
     * @tc.desc Verify DARKEN on a pen keeps the lower blue channel of both layers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0048 begin');
      await runCase('testEnumBlend0048', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.DARKEN, 255, 0, 0, 255);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(DST_B);
        expect(channelAt(buffer, 60, OFF_Y, 2)).assertEqual(DST_B);
        expect(countChannelLess(buffer, 3, 255)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0049
     * @tc.name testEnumBlend0049
     * @tc.desc Verify LIGHTEN with a black source keeps every destination pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0049 begin');
      await runCase('testEnumBlend0049', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.LIGHTEN, 255, 0, 0, 0);
        const base: ArrayBuffer = await baseBuffer();
        expect(diffChannelTotal(buffer, base, 0)).assertEqual(0);
        expect(channelAt(buffer, SIZE - 1, SIZE - 1, 2)).assertEqual(DST_B);
        expect(countChannelEquals(buffer, 1, DST_G)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0050
     * @tc.name testEnumBlend0050
     * @tc.desc Verify LIGHTEN with a blue source saturates the blue channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0050 begin');
      await runCase('testEnumBlend0050', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.LIGHTEN, 255, 0, 0, 255);
        expect(countChannelEquals(buffer, 2, 255)).assertEqual(AREA);
        expect(channelAt(buffer, 10, 10, 0)).assertEqual(DST_R);
        expect(countChannelEquals(buffer, 1, DST_G)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0051
     * @tc.name testEnumBlend0051
     * @tc.desc Verify LIGHTEN applies the maximum only inside the filled rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0051 begin');
      await runCase('testEnumBlend0051', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.LIGHTEN, 255, 0, 0, 255);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(255);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(DST_B);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0052
     * @tc.name testEnumBlend0052
     * @tc.desc Verify OVERLAY with a white source never darkens a channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0052 begin');
      await runCase('testEnumBlend0052', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.OVERLAY, 255, 255, 255, 255);
        expect(countChannelLess(buffer, 0, DST_R)).assertEqual(0);
        expect(countChannelGreater(buffer, 1, DST_G) > 0).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0053
     * @tc.name testEnumBlend0053
     * @tc.desc Verify OVERLAY with a black source never brightens a channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0053 begin');
      await runCase('testEnumBlend0053', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.OVERLAY, 255, 0, 0, 0);
        const base: ArrayBuffer = await baseBuffer();
        expect(countChannelGreater(buffer, 0, DST_R)).assertEqual(0);
        expect(countChannelLess(buffer, 2, DST_B) > 0).assertTrue();
        expect(diffPixelCount(buffer, base) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0054
     * @tc.name testEnumBlend0054
     * @tc.desc Verify OVERLAY on a brush darkens the painted half only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0054 begin');
      await runCase('testEnumBlend0054', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.OVERLAY, 255, 0, 0, 0);
        expect(sumAt(buffer, 30, 60) < sumAt(buffer, 90, 60)).assertTrue();
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(DST_R);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0055
     * @tc.name testEnumBlend0055
     * @tc.desc Verify COLOR_DODGE with a black source keeps the destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0055 begin');
      await runCase('testEnumBlend0055', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.COLOR_DODGE, 255, 0, 0, 0);
        const base: ArrayBuffer = await baseBuffer();
        expect(diffPixelCount(buffer, base)).assertEqual(0);
        const pixel: number[] = pixelAt(buffer, 40, 40);
        expect(pixel[1]).assertEqual(DST_G);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0056
     * @tc.name testEnumBlend0056
     * @tc.desc Verify COLOR_DODGE with a white source clamps the canvas to white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0056 begin');
      await runCase('testEnumBlend0056', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.COLOR_DODGE, 255, 255, 255, 255);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(255);
        expect(countChannelEquals(buffer, 1, 255)).assertEqual(AREA);
        expect(countChannelEquals(buffer, 2, 255)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0057
     * @tc.name testEnumBlend0057
     * @tc.desc Verify COLOR_DODGE on a pen turns the whole stroke white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0057 begin');
      await runCase('testEnumBlend0057', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.COLOR_DODGE, 255, 0, 0, 255);
        expect(channelAt(buffer, 60, LINE_Y, 0)).assertEqual(200);
        expect(channelAt(buffer, 60, LINE_Y, 1)).assertEqual(100);
        expect(channelAt(buffer, 60, OFF_Y, 0)).assertEqual(DST_R);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0058
     * @tc.name testEnumBlend0058
     * @tc.desc Verify COLOR_BURN with a white source keeps the destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0058 begin');
      await runCase('testEnumBlend0058', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.COLOR_BURN, 255, 255, 255, 255);
        const base: ArrayBuffer = await baseBuffer();
        expect(diffChannelTotal(buffer, base, 1)).assertEqual(0);
        expect(channelAt(buffer, 5, 5, 0)).assertEqual(DST_R);
        expect(channelAt(buffer, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0059
     * @tc.name testEnumBlend0059
     * @tc.desc Verify COLOR_BURN with a black source burns the canvas to black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0059 begin');
      await runCase('testEnumBlend0059', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.COLOR_BURN, 255, 0, 0, 0);
        expect(countChannelEquals(buffer, 0, 0)).assertEqual(AREA);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0060
     * @tc.name testEnumBlend0060
     * @tc.desc Verify COLOR_BURN on a brush burns the painted half only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0060 begin');
      await runCase('testEnumBlend0060', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.COLOR_BURN, 255, 0, 0, 0);
        expect(countChannelEquals(buffer, 0, 0)).assertEqual(HALF_AREA);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(DST_B);
        expect(channelAt(buffer, 30, 60, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0061
     * @tc.name testEnumBlend0061
     * @tc.desc Verify HARD_LIGHT with a black source turns the canvas black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0061 begin');
      await runCase('testEnumBlend0061', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.HARD_LIGHT, 255, 0, 0, 0);
        expect(channelAt(buffer, 60, 60, 3)).assertEqual(255);
        expect(countChannelEquals(buffer, 1, 0)).assertEqual(AREA);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0062
     * @tc.name testEnumBlend0062
     * @tc.desc Verify HARD_LIGHT with a white source turns the canvas white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0062 begin');
      await runCase('testEnumBlend0062', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.HARD_LIGHT, 255, 255, 255, 255);
        expect(countChannelEquals(buffer, 0, 255)).assertEqual(AREA);
        expect(channelAt(buffer, 90, 90, 1)).assertEqual(255);
        expect(countChannelGreater(buffer, 2, DST_B)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0063
     * @tc.name testEnumBlend0063
     * @tc.desc Verify HARD_LIGHT on a pen illuminates the stroke row only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0063 begin');
      await runCase('testEnumBlend0063', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.HARD_LIGHT, 255, 255, 255, 255);
        expect(channelAt(buffer, 60, LINE_Y, 0)).assertEqual(255);
        expect(channelAt(buffer, 60, OFF_Y, 0)).assertEqual(DST_R);
        expect(countChannelGreater(buffer, 0, DST_R) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0064
     * @tc.name testEnumBlend0064
     * @tc.desc Verify SOFT_LIGHT with a white source brightens without clipping.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0064 begin');
      await runCase('testEnumBlend0064', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.SOFT_LIGHT, 255, 255, 255, 255);
        const base: ArrayBuffer = await baseBuffer();
        expect(countChannelLess(buffer, 0, DST_R)).assertEqual(0);
        expect(diffPixelCount(buffer, base) > 0).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0065
     * @tc.name testEnumBlend0065
     * @tc.desc Verify SOFT_LIGHT with a black source darkens every channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0065 begin');
      await runCase('testEnumBlend0065', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.SOFT_LIGHT, 255, 0, 0, 0);
        expect(countChannelGreater(buffer, 2, DST_B)).assertEqual(0);
        expect(channelAt(buffer, 60, 60, 0) < DST_R).assertTrue();
        expect(countOpaque(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0066
     * @tc.name testEnumBlend0066
     * @tc.desc Verify SOFT_LIGHT on a brush keeps the untouched half intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0066 begin');
      await runCase('testEnumBlend0066', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.SOFT_LIGHT, 255, 0, 0, 0);
        expect(sumAt(buffer, 30, 60) < sumAt(buffer, 90, 60)).assertTrue();
        expect(channelAt(buffer, 90, 60, 1)).assertEqual(DST_G);
        expect(channelAt(buffer, 30, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0067
     * @tc.name testEnumBlend0067
     * @tc.desc Verify DIFFERENCE subtracts the source from the destination channel wise.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0067 begin');
      await runCase('testEnumBlend0067', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.DIFFERENCE, 255, 0, 0, 255);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(DST_R);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(DST_G);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(255 - DST_B);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0068
     * @tc.name testEnumBlend0068
     * @tc.desc Verify DIFFERENCE on a brush leaves the opposite half untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0068 begin');
      await runCase('testEnumBlend0068', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.DIFFERENCE, 255, 0, 0, 255);
        expect(countChannelEquals(buffer, 2, 255 - DST_B)).assertEqual(HALF_AREA);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(DST_B);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(DST_R);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0069
     * @tc.name testEnumBlend0069
     * @tc.desc Verify DIFFERENCE on a pen only alters the stroke row.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0069 begin');
      await runCase('testEnumBlend0069', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.DIFFERENCE, 255, 0, 0, 255);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(255 - DST_B);
        expect(channelAt(buffer, 60, OFF_Y, 2)).assertEqual(DST_B);
        expect(countChannelEquals(buffer, 2, 255 - DST_B) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0070
     * @tc.name testEnumBlend0070
     * @tc.desc Verify EXCLUSION with a white source inverts every channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0070 begin');
      await runCase('testEnumBlend0070', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.EXCLUSION, 255, 255, 255, 255);
        const pixel: number[] = pixelAt(buffer, 60, 60);
        expect(pixel[0]).assertEqual(255 - DST_R);
        expect(pixel[1]).assertEqual(255 - DST_G);
        expect(pixel[2]).assertEqual(255 - DST_B);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0071
     * @tc.name testEnumBlend0071
     * @tc.desc Verify EXCLUSION on a brush inverts the painted half only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0071 begin');
      await runCase('testEnumBlend0071', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.EXCLUSION, 255, 255, 255, 255);
        expect(countChannelEquals(buffer, 0, 255 - DST_R)).assertEqual(HALF_AREA);
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(DST_R);
        expect(channelAt(buffer, 30, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0072
     * @tc.name testEnumBlend0072
     * @tc.desc Verify EXCLUSION on a pen inverts the stroke row and keeps alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0072 begin');
      await runCase('testEnumBlend0072', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.EXCLUSION, 255, 255, 255, 255);
        expect(channelAt(buffer, 60, LINE_Y, 0)).assertEqual(255 - DST_R);
        expect(channelAt(buffer, 60, OFF_Y, 0)).assertEqual(DST_R);
        expect(countChannelEquals(buffer, 0, 255 - DST_R) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0073
     * @tc.name testEnumBlend0073
     * @tc.desc Verify MULTIPLY with a white source keeps the destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0073 begin');
      await runCase('testEnumBlend0073', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.MULTIPLY, 255, 255, 255, 255);
        const base: ArrayBuffer = await baseBuffer();
        expect(samePixelCount(buffer, base)).assertEqual(AREA);
        expect(diffChannelTotal(buffer, base, 2)).assertEqual(0);
        expect(countChannelEquals(buffer, 0, DST_R)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0074
     * @tc.name testEnumBlend0074
     * @tc.desc Verify MULTIPLY with a black source multiplies the canvas to black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0074 begin');
      await runCase('testEnumBlend0074', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.MULTIPLY, 255, 0, 0, 0);
        expect(countChannelEquals(buffer, 2, 0)).assertEqual(AREA);
        expect(channelAt(buffer, 0, 0, 1)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0075
     * @tc.name testEnumBlend0075
     * @tc.desc Verify MULTIPLY with a blue brush keeps only the destination blue term.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0075 begin');
      await runCase('testEnumBlend0075', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.MULTIPLY, 255, 0, 0, 255);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(DST_B);
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(DST_R);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0076
     * @tc.name testEnumBlend0076
     * @tc.desc Verify HUE with the destination color leaves the canvas unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0076 begin');
      await runCase('testEnumBlend0076', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.HUE, 255, DST_R, DST_G, DST_B);
        const base: ArrayBuffer = await baseBuffer();
        const pixel: number[] = pixelAt(buffer, 20, 20);
        expect(pixel[2]).assertEqual(DST_B);
        expect(diffPixelCount(buffer, base)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0077
     * @tc.name testEnumBlend0077
     * @tc.desc Verify HUE with a gray source drops the chroma of the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0077 begin');
      await runCase('testEnumBlend0077', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.HUE, 255, 128, 128, 128);
        const pixel: number[] = pixelAt(buffer, 60, 60);
        expect(Math.abs(pixel[0] - pixel[1]) <= 2).assertTrue();
        expect(Math.abs(pixel[1] - pixel[2]) <= 2).assertTrue();
        expect(countOpaque(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0078
     * @tc.name testEnumBlend0078
     * @tc.desc Verify HUE on a pen keeps the stroke row identical to the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0078 begin');
      await runCase('testEnumBlend0078', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.HUE, 255, DST_R, DST_G, DST_B);
        expect(channelAt(buffer, 60, LINE_Y, 0)).assertEqual(DST_R);
        expect(channelAt(buffer, 60, OFF_Y, 1)).assertEqual(DST_G);
        expect(countChannelEquals(buffer, 2, DST_B)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0079
     * @tc.name testEnumBlend0079
     * @tc.desc Verify SATURATION with the destination color keeps every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0079 begin');
      await runCase('testEnumBlend0079', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.SATURATION, 255, DST_R, DST_G, DST_B);
        const base: ArrayBuffer = await baseBuffer();
        expect(diffChannelTotal(buffer, base, 3)).assertEqual(0);
        expect(samePixelCount(buffer, base)).assertEqual(AREA);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0080
     * @tc.name testEnumBlend0080
     * @tc.desc Verify SATURATION with a gray source removes the color of the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0080 begin');
      await runCase('testEnumBlend0080', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.SATURATION, 255, 90, 90, 90);
        const pixel: number[] = pixelAt(buffer, 30, 90);
        expect(Math.abs(pixel[0] - pixel[2]) <= 2).assertTrue();
        expect(Math.abs(pixel[1] - pixel[2]) <= 2).assertTrue();
        expect(countChannelEquals(buffer, 3, 255)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0081
     * @tc.name testEnumBlend0081
     * @tc.desc Verify SATURATION on a pen paints a gray stroke over the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0081 begin');
      await runCase('testEnumBlend0081', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.SATURATION, 255, 90, 90, 90);
        const pixel: number[] = pixelAt(buffer, 60, LINE_Y);
        expect(Math.abs(pixel[0] - pixel[1]) <= 2).assertTrue();
        expect(channelAt(buffer, 60, OFF_Y, 0)).assertEqual(DST_R);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0082
     * @tc.name testEnumBlend0082
     * @tc.desc Verify COLOR with the destination color keeps the canvas unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0082 begin');
      await runCase('testEnumBlend0082', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.COLOR, 255, DST_R, DST_G, DST_B);
        const base: ArrayBuffer = await baseBuffer();
        const pixel: number[] = pixelAt(buffer, 100, 10);
        expect(pixel[0]).assertEqual(DST_R);
        expect(countChannelEquals(buffer, 2, DST_B)).assertEqual(AREA);
        expect(diffPixelCount(buffer, base)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0083
     * @tc.name testEnumBlend0083
     * @tc.desc Verify COLOR with a black brush desaturates the painted half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0083 begin');
      await runCase('testEnumBlend0083', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.COLOR, 255, 0, 0, 0);
        const pixel: number[] = pixelAt(buffer, 30, 60);
        expect(Math.abs(pixel[0] - pixel[2]) <= 3).assertTrue();
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(DST_R);
        expect(countChannelEquals(buffer, 1, DST_G)).assertEqual(HALF_AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0084
     * @tc.name testEnumBlend0084
     * @tc.desc Verify COLOR on a white pen desaturates the stroke row.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0084 begin');
      await runCase('testEnumBlend0084', async () => {
        const buffer: ArrayBuffer = await overStroke(drawing.BlendMode.COLOR, 255, 255, 255, 255);
        const red: number = channelAt(buffer, 60, LINE_Y, 0);
        const green: number = channelAt(buffer, 60, LINE_Y, 1);
        expect(Math.abs(red - green) <= 3).assertTrue();
        expect(Math.abs(green - channelAt(buffer, 60, LINE_Y, 2)) <= 3).assertTrue();
        expect(channelAt(buffer, 60, OFF_Y, 2)).assertEqual(DST_B);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0085
     * @tc.name testEnumBlend0085
     * @tc.desc Verify LUMINOSITY with the destination color keeps every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0085 begin');
      await runCase('testEnumBlend0085', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.LUMINOSITY, 255, DST_R, DST_G, DST_B);
        const base: ArrayBuffer = await baseBuffer();
        expect(samePixelCount(buffer, base)).assertEqual(AREA);
        expect(channelAt(buffer, 60, 60, 3)).assertEqual(255);
        expect(diffChannelTotal(buffer, base, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0086
     * @tc.name testEnumBlend0086
     * @tc.desc Verify LUMINOSITY with a gray source keeps the channel ordering.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0086 begin');
      await runCase('testEnumBlend0086', async () => {
        const buffer: ArrayBuffer = await overColor(drawing.BlendMode.LUMINOSITY, 255, 128, 128, 128);
        expect(channelAt(buffer, 60, 60, 0) > channelAt(buffer, 60, 60, 1)).assertTrue();
        expect(channelAt(buffer, 60, 60, 1) > channelAt(buffer, 60, 60, 2)).assertTrue();
        expect(countOpaque(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0087
     * @tc.name testEnumBlend0087
     * @tc.desc Verify LUMINOSITY with a white brush lifts the painted half only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0087 begin');
      await runCase('testEnumBlend0087', async () => {
        const buffer: ArrayBuffer = await overFill(drawing.BlendMode.LUMINOSITY, 255, 255, 255, 255);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, 30, 60, 1) > channelAt(buffer, 90, 60, 1)).assertTrue();
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(DST_R);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0087 end');
    });
  });
}
