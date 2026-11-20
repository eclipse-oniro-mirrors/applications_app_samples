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
const BASE_RED: number = 200;
const BASE_GREEN: number = 100;
const BASE_BLUE: number = 50;
const SRC_BLUE: number = 255;
const LINE_Y: number = 60;
const OFF_Y: number = 30;

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
 * Count inked pixels inside one rectangle of the square canvas.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of pixels with a non-zero alpha.
 */
function countInkedInRect(buffer: ArrayBuffer, left: number, top: number,
  right: number, bottom: number): number {
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
 * Count fully opaque pixels of the whole buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels with alpha 255.
 */
function countOpaquePixels(buffer: ArrayBuffer): number {
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
 * Find the smallest alpha of the buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Minimum alpha value.
 */
function minAlphaOf(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let min: number = 255;
  for (let index: number = 0; index < AREA; index++) {
    const alpha: number = bytes[index * 4 + 3];
    if (alpha < min) {
      min = alpha;
    }
  }
  return min;
}

/**
 * Create a canvas fully painted with the opaque background color.
 *
 * @returns { Promise<OffscreenTarget> } Target filled with the base color.
 */
async function baseTarget(): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.drawColor(rgba(255, BASE_RED, BASE_GREEN, BASE_BLUE), drawing.BlendMode.SRC);
  return target;
}

/**
 * Composite an opaque source color over the base canvas with one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode under test.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function drawOver(mode: drawing.BlendMode): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await baseTarget();
  target.canvas.drawColor(rgba(255, 0, 0, SRC_BLUE), mode);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Fill the left half with an opaque source color using one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode under test.
 * @param { number } alpha - Source alpha.
 * @param { number } red - Source red channel.
 * @param { number } green - Source green channel.
 * @param { number } blue - Source blue channel.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function fillOver(mode: drawing.BlendMode, alpha: number, red: number,
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
 * Stroke one horizontal line over the base canvas with one blend mode.
 *
 * @param { drawing.BlendMode } mode - Blend mode under test.
 * @param { number } alpha - Source alpha.
 * @param { number } red - Source red channel.
 * @param { number } green - Source green channel.
 * @param { number } blue - Source blue channel.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeOver(mode: drawing.BlendMode, alpha: number, red: number,
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

export default function enumBlendModeCoreTest() {
  describe('EnumBlendModeCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0001
     * @tc.name testEnumBlend0001
     * @tc.desc Verify CLEAR leaves no inked pixel when composited over an opaque canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0001 begin');
      await runCase('testEnumBlend0001', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.CLEAR);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, 60, 60, 3)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0002
     * @tc.name testEnumBlend0002
     * @tc.desc Verify CLEAR only erases the rectangle it is painted on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0002 begin');
      await runCase('testEnumBlend0002', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.CLEAR, 255, 0, 0, SRC_BLUE);
        expect(countInkedInRect(buffer, 0, 0, SIZE / 2, SIZE)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
        expect(countOpaquePixels(buffer)).assertEqual(HALF_AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0003
     * @tc.name testEnumBlend0003
     * @tc.desc Verify CLEAR on a pen erases the stroke path only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0003 begin');
      await runCase('testEnumBlend0003', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.CLEAR, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 3)).assertEqual(0);
        expect(channelAt(buffer, 60, OFF_Y, 3)).assertEqual(255);
        expect(countChannelEquals(buffer, 3, 0) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0004
     * @tc.name testEnumBlend0004
     * @tc.desc Verify SRC replaces the whole canvas with the source color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlend0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0004 begin');
      await runCase('testEnumBlend0004', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.SRC);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(SRC_BLUE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0005
     * @tc.name testEnumBlend0005
     * @tc.desc Verify SRC inside a rectangle leaves the other half untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0005 begin');
      await runCase('testEnumBlend0005', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.SRC, 255, 0, 0, SRC_BLUE);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, 30, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(BASE_RED);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0006
     * @tc.name testEnumBlend0006
     * @tc.desc Verify SRC on a pen paints the stroke with the source color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0006 begin');
      await runCase('testEnumBlend0006', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.SRC, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 60, OFF_Y, 2)).assertEqual(BASE_BLUE);
        expect(channelAt(buffer, 60, OFF_Y, 1)).assertEqual(BASE_GREEN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0007
     * @tc.name testEnumBlend0007
     * @tc.desc Verify DST keeps the destination color on every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlend0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0007 begin');
      await runCase('testEnumBlend0007', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.DST);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(BASE_RED);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(BASE_GREEN);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(BASE_BLUE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0008
     * @tc.name testEnumBlend0008
     * @tc.desc Verify DST makes a filled rectangle invisible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0008 begin');
      await runCase('testEnumBlend0008', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.DST, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(channelAt(buffer, 90, 60, 0));
        expect(countChannelEquals(buffer, 2, BASE_BLUE)).assertEqual(AREA);
        expect(channelAt(buffer, 30, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0009
     * @tc.name testEnumBlend0009
     * @tc.desc Verify DST on a pen keeps the background under the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0009 begin');
      await runCase('testEnumBlend0009', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.DST, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 0)).assertEqual(BASE_RED);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(channelAt(buffer, 60, OFF_Y, 2));
        expect(countChannelEquals(buffer, 2, BASE_BLUE)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0010
     * @tc.name testEnumBlend0010
     * @tc.desc Verify SRC_OVER replaces an opaque destination with the source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlend0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0010 begin');
      await runCase('testEnumBlend0010', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.SRC_OVER);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0011
     * @tc.name testEnumBlend0011
     * @tc.desc Verify SRC_OVER covers a rectangle and keeps the rest of the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0011 begin');
      await runCase('testEnumBlend0011', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.SRC_OVER, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0012
     * @tc.name testEnumBlend0012
     * @tc.desc Verify SRC_OVER on a pen covers the stroke with the source color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0012 begin');
      await runCase('testEnumBlend0012', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.SRC_OVER, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 1)).assertEqual(0);
        expect(channelAt(buffer, 60, OFF_Y, 1)).assertEqual(BASE_GREEN);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0013
     * @tc.name testEnumBlend0013
     * @tc.desc Verify DST_OVER keeps the opaque destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumBlend0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0013 begin');
      await runCase('testEnumBlend0013', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.DST_OVER);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(BASE_RED);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(BASE_GREEN);
        expect(channelAt(buffer, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0014
     * @tc.name testEnumBlend0014
     * @tc.desc Verify DST_OVER hides a filled rectangle behind the opaque background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0014 begin');
      await runCase('testEnumBlend0014', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.DST_OVER, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(BASE_BLUE);
        expect(countChannelEquals(buffer, 1, BASE_GREEN)).assertEqual(AREA);
        expect(countOpaquePixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0015
     * @tc.name testEnumBlend0015
     * @tc.desc Verify DST_OVER on a pen leaves the stroke area unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0015 begin');
      await runCase('testEnumBlend0015', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.DST_OVER, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(BASE_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 1)).assertEqual(channelAt(buffer, 60, OFF_Y, 1));
        expect(countOpaquePixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0016
     * @tc.name testEnumBlend0016
     * @tc.desc Verify SRC_IN keeps the source because the destination is opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0016 begin');
      await runCase('testEnumBlend0016', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.SRC_IN);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(SRC_BLUE);
        expect(countChannelEquals(buffer, 2, SRC_BLUE)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0017
     * @tc.name testEnumBlend0017
     * @tc.desc Verify SRC_IN covers a rectangle and leaves the rest of the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0017 begin');
      await runCase('testEnumBlend0017', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.SRC_IN, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
        expect(countChannelEquals(buffer, 2, SRC_BLUE)).assertEqual(HALF_AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0018
     * @tc.name testEnumBlend0018
     * @tc.desc Verify SRC_IN on a pen paints the stroke over the opaque background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0018 begin');
      await runCase('testEnumBlend0018', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.SRC_IN, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(SRC_BLUE);
        expect(countChannelEquals(buffer, 2, SRC_BLUE) > 0).assertTrue();
        expect(countOpaquePixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0019
     * @tc.name testEnumBlend0019
     * @tc.desc Verify DST_IN keeps the opaque destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0019 begin');
      await runCase('testEnumBlend0019', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.DST_IN);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(BASE_RED);
        expect(countChannelEquals(buffer, 0, BASE_RED)).assertEqual(AREA);
        expect(countOpaquePixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0020
     * @tc.name testEnumBlend0020
     * @tc.desc Verify DST_IN keeps the background under a filled rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0020 begin');
      await runCase('testEnumBlend0020', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.DST_IN, 255, 0, 0, SRC_BLUE);
        expect(countChannelEquals(buffer, 0, BASE_RED)).assertEqual(AREA);
        expect(countOpaquePixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, 30, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0021
     * @tc.name testEnumBlend0021
     * @tc.desc Verify DST_IN on a pen changes nothing on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0021 begin');
      await runCase('testEnumBlend0021', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.DST_IN, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(BASE_BLUE);
        expect(countChannelEquals(buffer, 0, BASE_RED)).assertEqual(AREA);
        expect(countOpaquePixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0022
     * @tc.name testEnumBlend0022
     * @tc.desc Verify SRC_OUT clears the canvas because the destination is opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0022 begin');
      await runCase('testEnumBlend0022', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.SRC_OUT);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, 10, 10, 3)).assertEqual(0);
        expect(countOpaquePixels(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0023
     * @tc.name testEnumBlend0023
     * @tc.desc Verify SRC_OUT erases only the filled rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0023 begin');
      await runCase('testEnumBlend0023', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.SRC_OUT, 255, 0, 0, SRC_BLUE);
        expect(countInkedInRect(buffer, 0, 0, SIZE / 2, SIZE)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(BASE_RED);
        expect(countInkedPixels(buffer)).assertEqual(HALF_AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0024
     * @tc.name testEnumBlend0024
     * @tc.desc Verify SRC_OUT on a pen erases the stroke path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0024 begin');
      await runCase('testEnumBlend0024', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.SRC_OUT, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 3)).assertEqual(0);
        expect(channelAt(buffer, 60, OFF_Y, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0025
     * @tc.name testEnumBlend0025
     * @tc.desc Verify DST_OUT clears everything because the source is opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0025 begin');
      await runCase('testEnumBlend0025', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.DST_OUT);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(minAlphaOf(buffer)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0026
     * @tc.name testEnumBlend0026
     * @tc.desc Verify DST_OUT erases only the rectangle painted by the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0026 begin');
      await runCase('testEnumBlend0026', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.DST_OUT, 255, 0, 0, SRC_BLUE);
        expect(countOpaquePixels(buffer)).assertEqual(HALF_AREA);
        expect(channelAt(buffer, 30, 60, 3)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0027
     * @tc.name testEnumBlend0027
     * @tc.desc Verify DST_OUT on a pen clears the stroke and compares with SRC_OUT.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0027 begin');
      await runCase('testEnumBlend0027', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.DST_OUT, 255, 0, 0, SRC_BLUE);
        const mirror: ArrayBuffer = await strokeOver(drawing.BlendMode.SRC_OUT, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 3)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(countInkedPixels(mirror));
        expect(channelAt(buffer, 60, OFF_Y, 2)).assertEqual(BASE_BLUE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0028
     * @tc.name testEnumBlend0028
     * @tc.desc Verify SRC_ATOP paints the source because the destination is opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0028 begin');
      await runCase('testEnumBlend0028', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.SRC_ATOP);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 60, 60, 3)).assertEqual(255);
        expect(countChannelEquals(buffer, 1, 0)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0029
     * @tc.name testEnumBlend0029
     * @tc.desc Verify SRC_ATOP covers only the rectangle painted by the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0029 begin');
      await runCase('testEnumBlend0029', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.SRC_ATOP, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 1)).assertEqual(BASE_GREEN);
        expect(countChannelEquals(buffer, 1, 0)).assertEqual(HALF_AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0030
     * @tc.name testEnumBlend0030
     * @tc.desc Verify SRC_ATOP on a pen keeps the stroke inside the background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0030 begin');
      await runCase('testEnumBlend0030', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.SRC_ATOP, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 1)).assertEqual(0);
        expect(channelAt(buffer, 60, OFF_Y, 1)).assertEqual(BASE_GREEN);
        expect(countChannelEquals(buffer, 1, 0) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0031
     * @tc.name testEnumBlend0031
     * @tc.desc Verify DST_ATOP keeps the opaque destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0031 begin');
      await runCase('testEnumBlend0031', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.DST_ATOP);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(BASE_BLUE);
        expect(countChannelEquals(buffer, 1, BASE_GREEN)).assertEqual(AREA);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0032
     * @tc.name testEnumBlend0032
     * @tc.desc Verify DST_ATOP keeps the background under a filled rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0032 begin');
      await runCase('testEnumBlend0032', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.DST_ATOP, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(BASE_RED);
        expect(channelAt(buffer, 90, 60, 0)).assertEqual(BASE_RED);
        expect(countChannelEquals(buffer, 0, BASE_RED)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0033
     * @tc.name testEnumBlend0033
     * @tc.desc Verify DST_ATOP on a pen leaves the painted background intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0033 begin');
      await runCase('testEnumBlend0033', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.DST_ATOP, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(BASE_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 1)).assertEqual(BASE_GREEN);
        expect(countChannelEquals(buffer, 1, BASE_GREEN)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0034
     * @tc.name testEnumBlend0034
     * @tc.desc Verify XOR clears the canvas when both layers are opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0034 begin');
      await runCase('testEnumBlend0034', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.XOR);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(countOpaquePixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0035
     * @tc.name testEnumBlend0035
     * @tc.desc Verify XOR clears the rectangle and keeps the untouched half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0035 begin');
      await runCase('testEnumBlend0035', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.XOR, 255, 0, 0, SRC_BLUE);
        expect(countInkedPixels(buffer)).assertEqual(HALF_AREA);
        expect(channelAt(buffer, 30, 60, 3)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0036
     * @tc.name testEnumBlend0036
     * @tc.desc Verify XOR on a pen clears the stroke row only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0036 begin');
      await runCase('testEnumBlend0036', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.XOR, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 3)).assertEqual(0);
        expect(channelAt(buffer, 60, OFF_Y, 3)).assertEqual(255);
        expect(countInkedInRect(buffer, 0, LINE_Y, SIZE, LINE_Y + 1)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0037
     * @tc.name testEnumBlend0037
     * @tc.desc Verify PLUS adds both colors and clamps the blue channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0037 begin');
      await runCase('testEnumBlend0037', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.PLUS);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(BASE_RED);
        expect(countChannelEquals(buffer, 1, BASE_GREEN)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0038
     * @tc.name testEnumBlend0038
     * @tc.desc Verify PLUS brightens the painted rectangle only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0038 begin');
      await runCase('testEnumBlend0038', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.PLUS, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(BASE_RED);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
        expect(channelAt(buffer, 30, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0039
     * @tc.name testEnumBlend0039
     * @tc.desc Verify PLUS on a pen saturates the stroke blue channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0039 begin');
      await runCase('testEnumBlend0039', async () => {
        const buffer: ArrayBuffer = await strokeOver(drawing.BlendMode.PLUS, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 60, LINE_Y, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 60, OFF_Y, 2)).assertEqual(BASE_BLUE);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(countChannelEquals(buffer, 2, BASE_BLUE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0040
     * @tc.name testEnumBlend0040
     * @tc.desc Verify MODULATE multiplies the channels and keeps only the blue term.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0040 begin');
      await runCase('testEnumBlend0040', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.MODULATE);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(BASE_BLUE);
        expect(channelAt(buffer, 60, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0041
     * @tc.name testEnumBlend0041
     * @tc.desc Verify MODULATE darkens the painted rectangle only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0041 begin');
      await runCase('testEnumBlend0041', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.MODULATE, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(BASE_BLUE);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0042
     * @tc.name testEnumBlend0042
     * @tc.desc Verify MODULATE with a white source keeps the destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0042 begin');
      await runCase('testEnumBlend0042', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.MODULATE, 255, 255, 255, 255);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(channelAt(buffer, 90, 60, 0));
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(channelAt(buffer, 90, 60, 2));
        expect(countChannelEquals(buffer, 2, BASE_BLUE)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0043
     * @tc.name testEnumBlend0043
     * @tc.desc Verify SCREEN brightens the canvas and keeps the red term.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0043 begin');
      await runCase('testEnumBlend0043', async () => {
        const buffer: ArrayBuffer = await drawOver(drawing.BlendMode.SCREEN);
        expect(channelAt(buffer, 60, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 60, 60, 1)).assertEqual(BASE_GREEN);
        expect(countChannelEquals(buffer, 0, BASE_RED)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0044
     * @tc.name testEnumBlend0044
     * @tc.desc Verify SCREEN brightens the painted rectangle only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumBlend0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0044 begin');
      await runCase('testEnumBlend0044', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.SCREEN, 255, 0, 0, SRC_BLUE);
        expect(channelAt(buffer, 30, 60, 2)).assertEqual(SRC_BLUE);
        expect(channelAt(buffer, 90, 60, 2)).assertEqual(BASE_BLUE);
        expect(channelAt(buffer, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0045
     * @tc.name testEnumBlend0045
     * @tc.desc Verify SCREEN with a black source keeps the destination color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumBlend0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0045 begin');
      await runCase('testEnumBlend0045', async () => {
        const buffer: ArrayBuffer = await fillOver(drawing.BlendMode.SCREEN, 255, 0, 0, 0);
        expect(channelAt(buffer, 30, 60, 0)).assertEqual(BASE_RED);
        expect(channelAt(buffer, 30, 60, 1)).assertEqual(channelAt(buffer, 90, 60, 1));
        expect(countChannelEquals(buffer, 2, BASE_BLUE)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumBlend0045 end');
    });
  });
}
