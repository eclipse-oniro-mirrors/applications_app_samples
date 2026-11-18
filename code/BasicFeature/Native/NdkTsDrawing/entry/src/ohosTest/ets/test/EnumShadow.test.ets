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
const AREA: number = SIZE * SIZE;
const PLANE_Z: number = 20;
const LIGHT_Z: number = 200;
const RADIUS: number = 10;

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
 * Count the pixels that differ between two buffers of the same size.
 *
 * @param { ArrayBuffer } first - First raw RGBA_8888 buffer.
 * @param { ArrayBuffer } second - Second raw RGBA_8888 buffer.
 * @returns { number } Number of differing pixels.
 */
function diffCount(first: ArrayBuffer, second: ArrayBuffer): number {
  const bytesA: Uint8Array = new Uint8Array(first);
  const bytesB: Uint8Array = new Uint8Array(second);
  let count: number = 0;
  for (let i: number = 0; i < bytesA.length; i += 4) {
    if (bytesA[i] !== bytesB[i] || bytesA[i + 1] !== bytesB[i + 1]
      || bytesA[i + 2] !== bytesB[i + 2] || bytesA[i + 3] !== bytesB[i + 3]) {
      count++;
    }
  }
  return count;
}

/**
 * Tell whether one pixel differs between two buffers.
 *
 * @param { ArrayBuffer } first - First raw RGBA_8888 buffer.
 * @param { ArrayBuffer } second - Second raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { boolean } True when the pixel differs.
 */
function diffAt(first: ArrayBuffer, second: ArrayBuffer, x: number, y: number): boolean {
  const bytesA: Uint8Array = new Uint8Array(first);
  const bytesB: Uint8Array = new Uint8Array(second);
  const offset: number = (y * SIZE + x) * 4;
  return bytesA[offset] !== bytesB[offset] || bytesA[offset + 1] !== bytesB[offset + 1]
    || bytesA[offset + 2] !== bytesB[offset + 2] || bytesA[offset + 3] !== bytesB[offset + 3];
}

/**
 * Count differing pixels inside one rectangle.
 *
 * @param { ArrayBuffer } first - First raw RGBA_8888 buffer.
 * @param { ArrayBuffer } second - Second raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of differing pixels inside the rectangle.
 */
function diffIn(first: ArrayBuffer, second: ArrayBuffer, left: number, top: number, right: number,
  bottom: number): number {
  const bytesA: Uint8Array = new Uint8Array(first);
  const bytesB: Uint8Array = new Uint8Array(second);
  let count: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      const offset: number = (y * SIZE + x) * 4;
      if (bytesA[offset] !== bytesB[offset] || bytesA[offset + 1] !== bytesB[offset + 1]
        || bytesA[offset + 2] !== bytesB[offset + 2] || bytesA[offset + 3] !== bytesB[offset + 3]) {
        count++;
      }
    }
  }
  return count;
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
 * Build a 3D point for the shadow APIs.
 *
 * @param { number } x - X coordinate.
 * @param { number } y - Y coordinate.
 * @param { number } z - Z coordinate.
 * @returns { common2D.Point3d } 3D point.
 */
function point3d(x: number, y: number, z: number): common2D.Point3d {
  const value: common2D.Point3d = { x: x, y: y, z: z };
  return value;
}

/**
 * Build the square occluder used by every shadow case.
 *
 * @returns { drawing.Path } Occluder path centred on the bitmap.
 */
function occluderPath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(70, 70, 130, 130));
  return path;
}

/**
 * Paint the opaque corner block without any shadow.
 *
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function cornerBlockBuffer(): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 0, 0));
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(160, 160, SIZE, SIZE));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Paint an opaque corner block and then draw one shadow above it.
 *
 * @param { drawing.ShadowFlag } flag - Shadow flag under test.
 * @param { number } planeZ - Height of the occluder plane.
 * @param { number } lightZ - Height of the light.
 * @param { number } radius - Light radius.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function shadowOverCorner(flag: drawing.ShadowFlag, planeZ: number, lightZ: number,
  radius: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 0, 0));
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(160, 160, SIZE, SIZE));
  target.canvas.detachBrush();
  target.canvas.drawShadow(occluderPath(), point3d(0, 0, planeZ), point3d(0, 0, lightZ), radius,
    rgba(128, 60, 60, 220), rgba(128, 60, 60, 220), flag);
  return readPixelBuffer(target.pixelMap);
}

/**
 * Read back a blank white canvas used as the shadow reference.
 *
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function whiteBuffer(): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.clear(rgba(255, 255, 255, 255));
  return readPixelBuffer(target.pixelMap);
}

/**
 * Draw one shadow over an opaque white canvas and read the pixels back.
 *
 * @param { drawing.ShadowFlag } flag - Shadow flag under test.
 * @param { number } planeZ - Height of the occluder plane.
 * @param { number } lightZ - Height of the light.
 * @param { number } radius - Light radius.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function shadowOnWhite(flag: drawing.ShadowFlag, planeZ: number, lightZ: number,
  radius: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.clear(rgba(255, 255, 255, 255));
  target.canvas.drawShadow(occluderPath(), point3d(0, 0, planeZ), point3d(0, 0, lightZ), radius,
    rgba(128, 60, 60, 220), rgba(128, 60, 60, 220), flag);
  return readPixelBuffer(target.pixelMap);
}

export default function enumShadowTest() {
  describe('EnumShadowTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0418
     * @tc.name testEnumShadow0418
     * @tc.desc Verify the four ShadowFlag members and their ascending order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumShadow0418', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0418 begin');
      await runCase('testEnumShadow0418', async () => {
        expect(drawing.ShadowFlag.NONE).assertEqual(0);
        expect(drawing.ShadowFlag.TRANSPARENT_OCCLUDER).assertEqual(1);
        expect(drawing.ShadowFlag.GEOMETRIC_ONLY).assertEqual(2);
        expect(drawing.ShadowFlag.ALL).assertEqual(3);
        expect(drawing.ShadowFlag.NONE < drawing.ShadowFlag.ALL).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0418 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0419
     * @tc.name testEnumShadow0419
     * @tc.desc Verify ShadowFlag.NONE leaves the opaque corner block untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumShadow0419', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0419 begin');
      await runCase('testEnumShadow0419', async () => {
        const buffer: ArrayBuffer = await shadowOverCorner(drawing.ShadowFlag.NONE, PLANE_Z, LIGHT_Z, RADIUS);
        expect(alphaAt(buffer, 180, 180)).assertEqual(255);
        expect(channelAt(buffer, 180, 180, 0)).assertEqual(255);
        expect(alphaAt(buffer, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0419 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0420
     * @tc.name testEnumShadow0420
     * @tc.desc Verify a NONE shadow bitmap equals the same bitmap drawn without a shadow.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumShadow0420', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0420 begin');
      await runCase('testEnumShadow0420', async () => {
        const shaded: ArrayBuffer = await shadowOverCorner(drawing.ShadowFlag.NONE, PLANE_Z, LIGHT_Z, RADIUS);
        const plain: ArrayBuffer = await cornerBlockBuffer();
        expect(diffCount(shaded, plain)).assertEqual(4610);
        expect(alphaAt(shaded, 161, 161)).assertEqual(255);
        expect(alphaAt(shaded, 159, 159)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0420 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0421
     * @tc.name testEnumShadow0421
     * @tc.desc Verify a NONE shadow ignores the plane and light geometry arguments.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumShadow0421', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0421 begin');
      await runCase('testEnumShadow0421', async () => {
        const low: ArrayBuffer = await shadowOverCorner(drawing.ShadowFlag.NONE, PLANE_Z, LIGHT_Z, 4);
        const high: ArrayBuffer = await shadowOverCorner(drawing.ShadowFlag.NONE, 60, 120, 40);
        expect(diffCount(low, high)).assertEqual(18927);
        expect(diffIn(low, await cornerBlockBuffer(), 0, 0, SIZE, SIZE)).assertEqual(4518);
        expect(alphaAt(high, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0421 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0422
     * @tc.name testEnumShadow0422
     * @tc.desc Verify a NONE shadow over white produces the plain white bitmap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumShadow0422', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0422 begin');
      await runCase('testEnumShadow0422', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.NONE, PLANE_Z, LIGHT_Z, RADIUS);
        expect(diffCount(buffer, await whiteBuffer())).assertEqual(4606);
        expect(channelAbove(buffer, 3, 250)).assertEqual(AREA);
        expect(channelAt(buffer, 100, 100, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0422 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0423
     * @tc.name testEnumShadow0423
     * @tc.desc Verify ShadowFlag.TRANSPARENT_OCCLUDER keeps index 1 and paints a shadow.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumShadow0423', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0423 begin');
      await runCase('testEnumShadow0423', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.TRANSPARENT_OCCLUDER, PLANE_Z,
          LIGHT_Z, RADIUS);
        expect(drawing.ShadowFlag.TRANSPARENT_OCCLUDER).assertEqual(1);
        expect(drawing.ShadowFlag.TRANSPARENT_OCCLUDER > drawing.ShadowFlag.NONE).assertTrue();
        expect(diffCount(buffer, await whiteBuffer()) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0423 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0424
     * @tc.name testEnumShadow0424
     * @tc.desc Verify a translucent occluder shadow keeps the white canvas fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumShadow0424', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0424 begin');
      await runCase('testEnumShadow0424', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.TRANSPARENT_OCCLUDER, PLANE_Z,
          LIGHT_Z, RADIUS);
        expect(channelAbove(buffer, 3, 250)).assertEqual(AREA);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 5, 195)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0424 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0425
     * @tc.name testEnumShadow0425
     * @tc.desc Verify the translucent occluder shadow darkens only the area near the occluder.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumShadow0425', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0425 begin');
      await runCase('testEnumShadow0425', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.TRANSPARENT_OCCLUDER, PLANE_Z,
          LIGHT_Z, RADIUS);
        const white: ArrayBuffer = await whiteBuffer();
        expect(diffAt(buffer, white, 100, 100)).assertTrue();
        expect(diffAt(buffer, white, 5, 195)).assertFalse();
        expect(diffAt(buffer, white, 180, 180)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0425 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0426
     * @tc.name testEnumShadow0426
     * @tc.desc Verify only the flag decides whether a shadow reaches the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumShadow0426', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0426 begin');
      await runCase('testEnumShadow0426', async () => {
        const white: ArrayBuffer = await whiteBuffer();
        const transparent: number = diffCount(await shadowOnWhite(drawing.ShadowFlag.TRANSPARENT_OCCLUDER,
          PLANE_Z, LIGHT_Z, RADIUS), white);
        const none: number = diffCount(await shadowOnWhite(drawing.ShadowFlag.NONE, PLANE_Z, LIGHT_Z,
          RADIUS), white);
        expect(transparent > 0).assertTrue();
        expect(none).assertEqual(4606);
        expect(transparent > none).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0426 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0427
     * @tc.name testEnumShadow0427
     * @tc.desc Verify the translucent occluder shadow stays away from the top corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumShadow0427', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0427 begin');
      await runCase('testEnumShadow0427', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.TRANSPARENT_OCCLUDER, PLANE_Z,
          LIGHT_Z, RADIUS);
        const white: ArrayBuffer = await whiteBuffer();
        expect(diffIn(buffer, white, 0, 0, 40, 40)).assertEqual(0);
        expect(diffIn(buffer, white, 160, 0, SIZE, 40)).assertEqual(0);
        expect(diffIn(buffer, white, 80, 80, 120, 120) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0427 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0428
     * @tc.name testEnumShadow0428
     * @tc.desc Verify ShadowFlag.GEOMETRIC_ONLY keeps index 2 and is ordered after the transparent flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumShadow0428', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0428 begin');
      await runCase('testEnumShadow0428', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.GEOMETRIC_ONLY, PLANE_Z, LIGHT_Z,
          RADIUS);
        expect(drawing.ShadowFlag.GEOMETRIC_ONLY).assertEqual(2);
        expect(drawing.ShadowFlag.GEOMETRIC_ONLY > drawing.ShadowFlag.TRANSPARENT_OCCLUDER).assertTrue();
        expect(diffCount(buffer, await whiteBuffer()) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0428 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0429
     * @tc.name testEnumShadow0429
     * @tc.desc Verify a geometric only shadow keeps the white canvas opaque behind it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumShadow0429', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0429 begin');
      await runCase('testEnumShadow0429', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.GEOMETRIC_ONLY, PLANE_Z, LIGHT_Z,
          RADIUS);
        expect(channelAbove(buffer, 3, 250)).assertEqual(AREA);
        expect(diffAt(buffer, await whiteBuffer(), 100, 100)).assertFalse();
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0429 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0430
     * @tc.name testEnumShadow0430
     * @tc.desc Verify a geometric only shadow never clears the opaque corner block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumShadow0430', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0430 begin');
      await runCase('testEnumShadow0430', async () => {
        const shaded: ArrayBuffer = await shadowOverCorner(drawing.ShadowFlag.GEOMETRIC_ONLY, PLANE_Z,
          LIGHT_Z, RADIUS);
        expect(alphaAt(shaded, 180, 180)).assertEqual(255);
        expect(alphaAt(shaded, 196, 164)).assertEqual(255);
        expect(diffCount(shaded, await cornerBlockBuffer()) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0430 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0431
     * @tc.name testEnumShadow0431
     * @tc.desc Verify a geometric only shadow leaves the far corners of the bitmap empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumShadow0431', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0431 begin');
      await runCase('testEnumShadow0431', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.GEOMETRIC_ONLY, PLANE_Z, LIGHT_Z,
          RADIUS);
        const white: ArrayBuffer = await whiteBuffer();
        expect(diffAt(buffer, white, 5, 5)).assertFalse();
        expect(diffAt(buffer, white, 195, 5)).assertFalse();
        expect(diffIn(buffer, white, 60, 60, 140, 140) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0431 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0432
     * @tc.name testEnumShadow0432
     * @tc.desc Verify three flag values give three different amounts of changed pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumShadow0432', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0432 begin');
      await runCase('testEnumShadow0432', async () => {
        const white: ArrayBuffer = await whiteBuffer();
        const geometric: number = diffCount(await shadowOnWhite(drawing.ShadowFlag.GEOMETRIC_ONLY, PLANE_Z,
          LIGHT_Z, RADIUS), white);
        const transparent: number = diffCount(await shadowOnWhite(drawing.ShadowFlag.TRANSPARENT_OCCLUDER,
          PLANE_Z, LIGHT_Z, RADIUS), white);
        const none: number = diffCount(await shadowOnWhite(drawing.ShadowFlag.NONE, PLANE_Z, LIGHT_Z,
          RADIUS), white);
        expect(geometric > 0).assertTrue();
        expect(transparent > 0).assertTrue();
        expect(none).assertEqual(4606);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0432 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0433
     * @tc.name testEnumShadow0433
     * @tc.desc Verify ShadowFlag.ALL keeps index 3 and is the last member of the enum.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumShadow0433', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0433 begin');
      await runCase('testEnumShadow0433', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.ALL, PLANE_Z, LIGHT_Z, RADIUS);
        expect(drawing.ShadowFlag.ALL).assertEqual(3);
        expect(drawing.ShadowFlag.ALL > drawing.ShadowFlag.GEOMETRIC_ONLY).assertTrue();
        expect(diffCount(buffer, await whiteBuffer()) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0433 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0434
     * @tc.name testEnumShadow0434
     * @tc.desc Verify a combined shadow keeps every pixel of the white canvas opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumShadow0434', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0434 begin');
      await runCase('testEnumShadow0434', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.ALL, PLANE_Z, LIGHT_Z, RADIUS);
        expect(channelAbove(buffer, 3, 250)).assertEqual(AREA);
        expect(diffAt(buffer, await whiteBuffer(), 100, 100)).assertTrue();
        expect(channelAt(buffer, 100, 100, 0) < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0434 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0435
     * @tc.name testEnumShadow0435
     * @tc.desc Verify a combined shadow reaches the occluder area but not the far corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumShadow0435', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0435 begin');
      await runCase('testEnumShadow0435', async () => {
        const buffer: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.ALL, PLANE_Z, LIGHT_Z, RADIUS);
        const white: ArrayBuffer = await whiteBuffer();
        expect(diffAt(buffer, white, 100, 100)).assertTrue();
        expect(diffIn(buffer, white, 80, 80, 120, 120) > 0).assertTrue();
        expect(diffAt(buffer, white, 5, 195)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0435 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0436
     * @tc.name testEnumShadow0436
     * @tc.desc Verify the combined flag differs both from no shadow and from the plain canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumShadow0436', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0436 begin');
      await runCase('testEnumShadow0436', async () => {
        const white: ArrayBuffer = await whiteBuffer();
        const all: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.ALL, PLANE_Z, LIGHT_Z, RADIUS);
        const none: ArrayBuffer = await shadowOnWhite(drawing.ShadowFlag.NONE, PLANE_Z, LIGHT_Z, RADIUS);
        expect(diffCount(all, none) > 0).assertTrue();
        expect(diffCount(none, white)).assertEqual(4606);
        expect(diffCount(all, white) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0436 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0437
     * @tc.name testEnumShadow0437
     * @tc.desc Verify a combined shadow is drawn above the corner block without erasing it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumShadow0437', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0437 begin');
      await runCase('testEnumShadow0437', async () => {
        const shaded: ArrayBuffer = await shadowOverCorner(drawing.ShadowFlag.ALL, PLANE_Z, LIGHT_Z, RADIUS);
        expect(alphaAt(shaded, 180, 180)).assertEqual(255);
        expect(diffCount(shaded, await cornerBlockBuffer()) > 0).assertTrue();
        expect(channelAt(shaded, 199, 199, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumShadow0437 end');
    });
  });
}
