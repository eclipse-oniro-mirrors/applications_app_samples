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
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const AREA: number = SIZE * SIZE;
const WIDE: number = 40;
const HALF_WIDE: number = WIDE / 2;

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
 * Build an open vertical line path.
 *
 * @param { number } x - X coordinate of the line.
 * @param { number } y0 - First end of the line.
 * @param { number } y1 - Second end of the line.
 * @returns { drawing.Path } Line path.
 */
function linePath(x: number, y0: number, y1: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(x, y0);
  path.lineTo(x, y1);
  return path;
}

/**
 * Build an open polyline with one right angle corner.
 *
 * @returns { drawing.Path } Two segment path.
 */
function elbowPath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(40, 40);
  path.lineTo(120, 40);
  path.lineTo(120, 160);
  return path;
}

/**
 * Build an open polyline with an obtuse corner.
 *
 * @returns { drawing.Path } Two segment path.
 */
function obtusePath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.moveTo(40, 150);
  path.lineTo(110, 70);
  path.lineTo(180, 150);
  return path;
}

/**
 * Build a closed rectangle path.
 *
 * @param { number } left - Left edge.
 * @param { number } top - Top edge.
 * @param { number } right - Right edge.
 * @param { number } bottom - Bottom edge.
 * @returns { drawing.Path } Rectangle path.
 */
function rectPath(left: number, top: number, right: number, bottom: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(left, top, right, bottom));
  return path;
}

/**
 * Build a closed circle path.
 *
 * @param { number } cx - Center x.
 * @param { number } cy - Center y.
 * @param { number } radius - Circle radius.
 * @returns { drawing.Path } Circle path.
 */
function circlePath(cx: number, cy: number, radius: number): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addCircle(cx, cy, radius);
  return path;
}

/**
 * Stroke one path with a prepared pen and read the pixels back.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { drawing.Pen } pen - Pen to apply.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeWith(path: drawing.Path, pen: drawing.Pen): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.attachPen(pen);
  target.canvas.drawPath(path);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Build a pen with one width, cap style and join style.
 *
 * @param { number } width - Stroke width in px.
 * @param { drawing.CapStyle } cap - Cap style.
 * @param { drawing.JoinStyle } join - Join style.
 * @returns { drawing.Pen } Configured pen.
 */
function buildPen(width: number, cap: drawing.CapStyle, join: drawing.JoinStyle): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 20, 60, 200));
  pen.setStrokeWidth(width);
  pen.setCapStyle(cap);
  pen.setJoinStyle(join);
  pen.setAntiAlias(false);
  return pen;
}

/**
 * Stroke one path with a fresh pen and read the pixels back.
 *
 * @param { drawing.Path } path - Path to stroke.
 * @param { number } width - Stroke width in px.
 * @param { drawing.CapStyle } cap - Cap style.
 * @param { drawing.JoinStyle } join - Join style.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function strokeBuffer(path: drawing.Path, width: number, cap: drawing.CapStyle,
  join: drawing.JoinStyle): Promise<ArrayBuffer> {
  return strokeWith(path, buildPen(width, cap, join));
}

/**
 * Paint an opaque square in the bottom right corner and then draw a shadow.
 *
 * @param { drawing.ShadowFlag } flag - Shadow flag under test.
 * @param { number } planeZ - Height of the occluder.
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
  target.canvas.drawShadow(rectPath(70, 70, 130, 130), point3d(0, 0, planeZ), point3d(0, 0, lightZ),
    radius, rgba(128, 60, 60, 220), rgba(128, 60, 60, 220), flag);
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
 * Draw one shadow over a white canvas and read the pixels back.
 *
 * @param { drawing.Path } path - Occluder path.
 * @param { drawing.ShadowFlag } flag - Shadow flag under test.
 * @param { number } planeZ - Height of the occluder.
 * @param { number } lightZ - Height of the light.
 * @param { number } radius - Light radius.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function shadowOnWhite(path: drawing.Path, flag: drawing.ShadowFlag, planeZ: number,
  lightZ: number, radius: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.clear(rgba(255, 255, 255, 255));
  target.canvas.drawShadow(path, point3d(0, 0, planeZ), point3d(0, 0, lightZ), radius,
    rgba(128, 60, 60, 220), rgba(128, 60, 60, 220), flag);
  return readPixelBuffer(target.pixelMap);
}

export default function enumStrokeTest() {
  describe('EnumStrokeTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0368
     * @tc.name testEnumStroke0368
     * @tc.desc Verify JoinStyle.MITER_JOIN keeps index 0 and paints a stroked polyline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0368', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0368 begin');
      await runCase('testEnumStroke0368', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.MITER_JOIN);
        expect(drawing.JoinStyle.MITER_JOIN).assertEqual(0);
        expect(drawing.JoinStyle.MITER_JOIN < drawing.JoinStyle.ROUND_JOIN).assertTrue();
        expect(countInkedPixels(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0368 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0369
     * @tc.name testEnumStroke0369
     * @tc.desc Verify Pen.getJoinStyle returns the miter style that was set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0369', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0369 begin');
      await runCase('testEnumStroke0369', async () => {
        const pen: drawing.Pen = buildPen(WIDE, drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        const buffer: ArrayBuffer = await strokeWith(elbowPath(), pen);
        expect(alphaAt(buffer, 60, 40)).assertEqual(255);
        expect(alphaAt(buffer, 120, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0369 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0370
     * @tc.name testEnumStroke0370
     * @tc.desc Verify a mitered elbow covers both arms plus the sharp corner wedge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0370', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0370 begin');
      await runCase('testEnumStroke0370', async () => {
        const inked: number = countInkedPixels(await strokeBuffer(elbowPath(), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN));
        expect(inked > 6300).assertTrue();
        expect(inked).assertEqual(8000);
        expect(inkBox(await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.MITER_JOIN), 0, 0, 40, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0370 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0371
     * @tc.name testEnumStroke0371
     * @tc.desc Verify the miter wedge reaches the outer diagonal point of a right angle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0371', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0371 begin');
      await runCase('testEnumStroke0371', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 141, 19)).assertEqual(0);
        expect(alphaAt(buffer, 139, 21)).assertEqual(255);
        expect(alphaAt(buffer, 150, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0371 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0372
     * @tc.name testEnumStroke0372
     * @tc.desc Verify the miter wedge point stays empty under round and bevel joins.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0372', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0372 begin');
      await runCase('testEnumStroke0372', async () => {
        const round: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.ROUND_JOIN);
        const bevel: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.BEVEL_JOIN);
        expect(alphaAt(round, 141, 19)).assertEqual(0);
        expect(alphaAt(bevel, 141, 19)).assertEqual(0);
        expect(alphaAt(bevel, 120, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0372 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0373
     * @tc.name testEnumStroke0373
     * @tc.desc Verify the miter wedge shrinks with a half width pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0373', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0373 begin');
      await runCase('testEnumStroke0373', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE / 2, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 133, 27)).assertEqual(0);
        expect(alphaAt(buffer, 141, 19)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(4000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0373 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0374
     * @tc.name testEnumStroke0374
     * @tc.desc Verify an obtuse miter corner grows a shorter spike than a right angle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0374', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0374 begin');
      await runCase('testEnumStroke0374', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(obtusePath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 110, 40)).assertEqual(255);
        expect(alphaAt(buffer, 110, 30)).assertEqual(0);
        expect(countInkedPixels(buffer) > 4000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0374 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0375
     * @tc.name testEnumStroke0375
     * @tc.desc Verify a closed rectangle with miter joins fills all four sharp corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0375', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0375 begin');
      await runCase('testEnumStroke0375', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(rectPath(40, 40, 160, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 15, 15)).assertEqual(0);
        expect(alphaAt(buffer, 185, 15)).assertEqual(0);
        expect(inkBox(buffer, 60, 60, 140, 140)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0375 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0376
     * @tc.name testEnumStroke0376
     * @tc.desc Verify a tiny miter limit cuts the miter wedge into a bevel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0376', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0376 begin');
      await runCase('testEnumStroke0376', async () => {
        const pen: drawing.Pen = buildPen(WIDE, drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        pen.setMiterLimit(1);
        const buffer: ArrayBuffer = await strokeWith(elbowPath(), pen);
        expect(alphaAt(buffer, 141, 19)).assertEqual(0);
        expect(alphaAt(buffer, 120, 100)).assertEqual(255);
        expect(alphaAt(buffer, 60, 42)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0376 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0377
     * @tc.name testEnumStroke0377
     * @tc.desc Verify JoinStyle.ROUND_JOIN keeps index 1 and is ordered after miter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0377', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0377 begin');
      await runCase('testEnumStroke0377', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.ROUND_JOIN);
        expect(drawing.JoinStyle.ROUND_JOIN).assertEqual(1);
        expect(drawing.JoinStyle.ROUND_JOIN > drawing.JoinStyle.MITER_JOIN).assertTrue();
        expect(alphaAt(buffer, 120, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0377 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0378
     * @tc.name testEnumStroke0378
     * @tc.desc Verify Pen.getJoinStyle returns the round style that was set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0378', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0378 begin');
      await runCase('testEnumStroke0378', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getJoinStyle() === drawing.JoinStyle.BEVEL_JOIN).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0378 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0379
     * @tc.name testEnumStroke0379
     * @tc.desc Verify the round corner arc fills a point inside the quarter circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0379', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0379 begin');
      await runCase('testEnumStroke0379', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.ROUND_JOIN);
        expect(alphaAt(buffer, 132, 28)).assertEqual(255);
        expect(alphaAt(buffer, 136, 24)).assertEqual(0);
        expect(alphaAt(buffer, 145, 15)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0379 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0380
     * @tc.name testEnumStroke0380
     * @tc.desc Verify a bevel join leaves the same interior arc point empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0380', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0380 begin');
      await runCase('testEnumStroke0380', async () => {
        const round: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.ROUND_JOIN);
        const bevel: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.BEVEL_JOIN);
        expect(alphaAt(bevel, 132, 28)).assertEqual(0);
        expect(alphaAt(round, 132, 28)).assertEqual(255);
        expect(alphaAt(bevel, 120, 20)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0380 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0381
     * @tc.name testEnumStroke0381
     * @tc.desc Verify the round corner arc never reaches the miter diagonal point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0381', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0381 begin');
      await runCase('testEnumStroke0381', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.ROUND_JOIN);
        const wedge: number = inkBox(buffer, 128, 12, 148, 32);
        expect(alphaAt(buffer, 141, 19)).assertEqual(0);
        expect(wedge > 60).assertTrue();
        expect(wedge < 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0381 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0382
     * @tc.name testEnumStroke0382
     * @tc.desc Verify the round corner radius follows half of the stroke width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0382', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0382 begin');
      await runCase('testEnumStroke0382', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE / 2, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.ROUND_JOIN);
        expect(alphaAt(buffer, 125, 34)).assertEqual(255);
        expect(alphaAt(buffer, 130, 30)).assertEqual(0);
        expect(alphaAt(buffer, 120, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0382 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0383
     * @tc.name testEnumStroke0383
     * @tc.desc Verify a closed rectangle with round joins clips the outer corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0383', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0383 begin');
      await runCase('testEnumStroke0383', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(rectPath(40, 40, 160, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.ROUND_JOIN);
        expect(alphaAt(buffer, 15, 15)).assertEqual(0);
        expect(alphaAt(buffer, 25, 25)).assertEqual(0);
        expect(alphaAt(buffer, 100, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0383 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0384
     * @tc.name testEnumStroke0384
     * @tc.desc Verify a round join covers more ink than a bevel join on the same path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0384', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0384 begin');
      await runCase('testEnumStroke0384', async () => {
        const round: number = countInkedPixels(await strokeBuffer(elbowPath(), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.ROUND_JOIN));
        const bevel: number = countInkedPixels(await strokeBuffer(elbowPath(), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.BEVEL_JOIN));
        expect(round > bevel).assertTrue();
        expect(round - bevel > 60).assertTrue();
        expect(bevel > 6000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0384 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0385
     * @tc.name testEnumStroke0385
     * @tc.desc Verify JoinStyle.BEVEL_JOIN keeps index 2 and is ordered last.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0385', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0385 begin');
      await runCase('testEnumStroke0385', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.BEVEL_JOIN);
        expect(drawing.JoinStyle.BEVEL_JOIN).assertEqual(2);
        expect(drawing.JoinStyle.BEVEL_JOIN > drawing.JoinStyle.ROUND_JOIN).assertTrue();
        expect(alphaAt(buffer, 60, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0385 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0386
     * @tc.name testEnumStroke0386
     * @tc.desc Verify Pen.getJoinStyle returns the bevel style that was set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0386', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0386 begin');
      await runCase('testEnumStroke0386', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        const buffer: ArrayBuffer = await strokeWith(elbowPath(), pen);
        expect(alphaAt(buffer, 120, 100)).assertEqual(255);
        expect(alphaAt(buffer, 60, 40)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0386 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0387
     * @tc.name testEnumStroke0387
     * @tc.desc Verify the bevel chord removes the round arc interior point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0387', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0387 begin');
      await runCase('testEnumStroke0387', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.BEVEL_JOIN);
        expect(alphaAt(buffer, 132, 28)).assertEqual(0);
        expect(alphaAt(buffer, 134, 26)).assertEqual(0);
        expect(alphaAt(buffer, 128, 32)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0387 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0388
     * @tc.name testEnumStroke0388
     * @tc.desc Verify a beveled closed rectangle leaves the outer corner wedge empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0388', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0388 begin');
      await runCase('testEnumStroke0388', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(rectPath(40, 40, 160, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.BEVEL_JOIN);
        expect(alphaAt(buffer, 15, 15)).assertEqual(0);
        expect(alphaAt(buffer, 40, 20)).assertEqual(255);
        expect(inkBox(buffer, 60, 60, 140, 140)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0388 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0389
     * @tc.name testEnumStroke0389
     * @tc.desc Verify the bevel join paints the smallest corner of the three join styles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0389', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0389 begin');
      await runCase('testEnumStroke0389', async () => {
        const bevel: number = countInkedPixels(await strokeBuffer(elbowPath(), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.BEVEL_JOIN));
        const miter: number = countInkedPixels(await strokeBuffer(elbowPath(), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN));
        expect(miter > bevel).assertTrue();
        expect(miter - bevel > 60).assertTrue();
        expect(bevel).assertEqual(7810);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0389 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0390
     * @tc.name testEnumStroke0390
     * @tc.desc Verify a half width bevel corner keeps the chord but drops the spike point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0390', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0390 begin');
      await runCase('testEnumStroke0390', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE / 2, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.BEVEL_JOIN);
        expect(alphaAt(buffer, 128, 32)).assertEqual(0);
        expect(alphaAt(buffer, 122, 38)).assertEqual(255);
        expect(alphaAt(buffer, 120, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0390 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0391
     * @tc.name testEnumStroke0391
     * @tc.desc Verify an obtuse bevel corner keeps a wide flat chord at the apex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0391', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0391 begin');
      await runCase('testEnumStroke0391', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(obtusePath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.BEVEL_JOIN);
        expect(alphaAt(buffer, 110, 70)).assertEqual(255);
        expect(alphaAt(buffer, 100, 82)).assertEqual(255);
        expect(alphaAt(buffer, 110, 45)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0391 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0392
     * @tc.name testEnumStroke0392
     * @tc.desc Verify a bevel join does not extend the open ends of the polyline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0392', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0392 begin');
      await runCase('testEnumStroke0392', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(elbowPath(), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.BEVEL_JOIN);
        expect(alphaAt(buffer, 38, 40)).assertEqual(0);
        expect(inkBox(buffer, 0, 20, 36, 60)).assertEqual(0);
        expect(alphaAt(buffer, 120, 162)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0392 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0393
     * @tc.name testEnumStroke0393
     * @tc.desc Verify CapStyle.FLAT_CAP keeps index 0 and strokes an open line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0393', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0393 begin');
      await runCase('testEnumStroke0393', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(drawing.CapStyle.FLAT_CAP).assertEqual(0);
        expect(drawing.CapStyle.FLAT_CAP < drawing.CapStyle.SQUARE_CAP).assertTrue();
        expect(countInkedPixels(buffer) > 4000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0393 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0394
     * @tc.name testEnumStroke0394
     * @tc.desc Verify Pen.getCapStyle returns the flat style that was set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0394', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0394 begin');
      await runCase('testEnumStroke0394', async () => {
        const pen: drawing.Pen = buildPen(WIDE, drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        const buffer: ArrayBuffer = await strokeWith(linePath(100, 40, 160), pen);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
        expect(alphaAt(buffer, 100, 60)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0394 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0395
     * @tc.name testEnumStroke0395
     * @tc.desc Verify a flat cap cuts the stroke exactly at the first path point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0395', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0395 begin');
      await runCase('testEnumStroke0395', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 100, 21)).assertEqual(0);
        expect(alphaAt(buffer, 100, 30)).assertEqual(0);
        expect(alphaAt(buffer, 100, 50)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0395 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0396
     * @tc.name testEnumStroke0396
     * @tc.desc Verify a flat cap cuts the stroke exactly at the last path point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0396', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0396 begin');
      await runCase('testEnumStroke0396', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 100, 180)).assertEqual(0);
        expect(inkBox(buffer, 78, 161, 122, SIZE)).assertEqual(0);
        expect(alphaAt(buffer, 100, 150)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0396 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0397
     * @tc.name testEnumStroke0397
     * @tc.desc Verify the flat cap area equals width times path length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0397', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0397 begin');
      await runCase('testEnumStroke0397', async () => {
        const inked: number = countInkedPixels(await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN));
        expect(inked > 4600).assertTrue();
        expect(inked < 5000).assertTrue();
        expect(inkBox(await strokeBuffer(linePath(100, 40, 160), WIDE, drawing.CapStyle.FLAT_CAP,
          drawing.JoinStyle.MITER_JOIN), 0, 0, 78, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0397 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0398
     * @tc.name testEnumStroke0398
     * @tc.desc Verify the flat cap keeps the stroke band centered on the line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0398', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0398 begin');
      await runCase('testEnumStroke0398', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 82, 100)).assertEqual(255);
        expect(alphaAt(buffer, 118, 100)).assertEqual(255);
        expect(inkBox(buffer, 121, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0398 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0399
     * @tc.name testEnumStroke0399
     * @tc.desc Verify no ink appears above the flat capped top end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0399', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0399 begin');
      await runCase('testEnumStroke0399', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(inkBox(buffer, 78, 0, 122, 40)).assertEqual(0);
        expect(inkBox(buffer, 78, 40, 122, 60) > 700).assertTrue();
        expect(inkBox(buffer, 78, 40, 122, 60) < 900).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0399 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0400
     * @tc.name testEnumStroke0400
     * @tc.desc Verify no ink appears below the flat capped bottom end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0400', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0400 begin');
      await runCase('testEnumStroke0400', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(inkBox(buffer, 78, 161, 122, SIZE)).assertEqual(0);
        expect(inkBox(buffer, 78, 140, 122, 160) > 700).assertTrue();
        expect(alphaAt(buffer, 100, 161)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0400 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0401
     * @tc.name testEnumStroke0401
     * @tc.desc Verify a square cap paints more than a flat cap on the same line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0401', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0401 begin');
      await runCase('testEnumStroke0401', async () => {
        const flat: number = countInkedPixels(await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN));
        const square: number = countInkedPixels(await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN));
        expect(square > flat).assertTrue();
        expect(square - flat > 1200).assertTrue();
        expect(flat < 5000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0401 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0402
     * @tc.name testEnumStroke0402
     * @tc.desc Verify CapStyle.SQUARE_CAP keeps index 1 and is ordered after flat.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0402', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0402 begin');
      await runCase('testEnumStroke0402', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(drawing.CapStyle.SQUARE_CAP).assertEqual(1);
        expect(drawing.CapStyle.SQUARE_CAP > drawing.CapStyle.FLAT_CAP).assertTrue();
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0402 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0403
     * @tc.name testEnumStroke0403
     * @tc.desc Verify Pen.getCapStyle returns the square style that was set twice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0403', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0403 begin');
      await runCase('testEnumStroke0403', async () => {
        const pen: drawing.Pen = buildPen(WIDE, drawing.CapStyle.FLAT_CAP, drawing.JoinStyle.MITER_JOIN);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        const buffer: ArrayBuffer = await strokeWith(linePath(100, 40, 160), pen);
        expect(alphaAt(buffer, 100, 25)).assertEqual(255);
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0403 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0404
     * @tc.name testEnumStroke0404
     * @tc.desc Verify a square cap extends the line past its top end by half the width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0404', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0404 begin');
      await runCase('testEnumStroke0404', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 100, 25)).assertEqual(255);
        expect(alphaAt(buffer, 100, 18)).assertEqual(0);
        expect(countInkedPixels(buffer) > 5800).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0404 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0405
     * @tc.name testEnumStroke0405
     * @tc.desc Verify a square cap extends the line past its bottom end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0405', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0405 begin');
      await runCase('testEnumStroke0405', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 100, 175)).assertEqual(255);
        expect(inkBox(buffer, 78, 160, 122, 181) > 700).assertTrue();
        expect(alphaAt(buffer, 100, 182)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0405 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0406
     * @tc.name testEnumStroke0406
     * @tc.desc Verify the square cap extension is a square corner, not a round one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0406', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0406 begin');
      await runCase('testEnumStroke0406', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 119, 21)).assertEqual(255);
        expect(alphaAt(buffer, 125, 21)).assertEqual(0);
        expect(alphaAt(buffer, 100, 21)).assertEqual(255);
        expect(alphaAt(buffer, 100, 19)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0406 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0407
     * @tc.name testEnumStroke0407
     * @tc.desc Verify the square cap extension covers one half width rectangle at the top.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0407', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0407 begin');
      await runCase('testEnumStroke0407', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(inkBox(buffer, 78, 20, 122, 40) > 760).assertTrue();
        expect(inkBox(buffer, 78, 20, 122, 40) < 860).assertTrue();
        expect(countInkedPixels(buffer) < 6700).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0407 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0408
     * @tc.name testEnumStroke0408
     * @tc.desc Verify a round cap drops the square corner that a square cap keeps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0408', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0408 begin');
      await runCase('testEnumStroke0408', async () => {
        const square: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN);
        const round: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(square, 119, 21)).assertEqual(255);
        expect(alphaAt(round, 119, 21)).assertEqual(0);
        expect(alphaAt(round, 100, 21)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0408 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0409
     * @tc.name testEnumStroke0409
     * @tc.desc Verify one square cap extension measures exactly half the pen width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0409', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0409 begin');
      await runCase('testEnumStroke0409', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 100, 21)).assertEqual(255);
        expect(alphaAt(buffer, 100, 19)).assertEqual(0);
        expect(inkBox(buffer, 78, 160, 122, 181) > 700).assertTrue();
        expect(alphaAt(buffer, 100, 178)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0409 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0410
     * @tc.name testEnumStroke0410
     * @tc.desc Verify CapStyle.ROUND_CAP keeps index 2 and is ordered after square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0410', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0410 begin');
      await runCase('testEnumStroke0410', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(drawing.CapStyle.ROUND_CAP).assertEqual(2);
        expect(drawing.CapStyle.ROUND_CAP > drawing.CapStyle.SQUARE_CAP).assertTrue();
        expect(alphaAt(buffer, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0410 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0411
     * @tc.name testEnumStroke0411
     * @tc.desc Verify a pen built step by step reports the round cap it holds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumStroke0411', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0411 begin');
      await runCase('testEnumStroke0411', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 20, 60, 200));
        pen.setStrokeWidth(WIDE);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        const buffer: ArrayBuffer = await strokeWith(linePath(100, 40, 160), pen);
        expect(alphaAt(buffer, 100, 88)).assertEqual(255);
        expect(alphaAt(buffer, 100, 70)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0411 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0412
     * @tc.name testEnumStroke0412
     * @tc.desc Verify a round cap bulges past the top end by half the width at the center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumStroke0412', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0412 begin');
      await runCase('testEnumStroke0412', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 100, 23)).assertEqual(255);
        expect(alphaAt(buffer, 100, 18)).assertEqual(0);
        expect(alphaAt(buffer, 100, 30)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0412 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0413
     * @tc.name testEnumStroke0413
     * @tc.desc Verify the round cap arc cuts both top corners of the stroke band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0413', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0413 begin');
      await runCase('testEnumStroke0413', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 118, 25)).assertEqual(0);
        expect(alphaAt(buffer, 81, 23)).assertEqual(0);
        expect(alphaAt(buffer, 100, 25)).assertEqual(255);
        expect(inkBox(buffer, 80, 20, 121, 40) < 800).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0413 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0414
     * @tc.name testEnumStroke0414
     * @tc.desc Verify the round cap covers less area than the square cap on one line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0414', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0414 begin');
      await runCase('testEnumStroke0414', async () => {
        const round: number = countInkedPixels(await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN));
        const square: number = countInkedPixels(await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.SQUARE_CAP, drawing.JoinStyle.MITER_JOIN));
        expect(round < square).assertTrue();
        expect(round > 5800).assertTrue();
        expect(square - round > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0414 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0415
     * @tc.name testEnumStroke0415
     * @tc.desc Verify the round cap also bulges past the bottom end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumStroke0415', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0415 begin');
      await runCase('testEnumStroke0415', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 100, 177)).assertEqual(255);
        expect(alphaAt(buffer, 100, 182)).assertEqual(0);
        expect(alphaAt(buffer, 100, 170)).assertEqual(255);
        expect(countInkedPixels(buffer) < 6400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0415 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0416
     * @tc.name testEnumStroke0416
     * @tc.desc Verify the round cap fills about a half disc above the top end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0416', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0416 begin');
      await runCase('testEnumStroke0416', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 114, 26)).assertEqual(255);
        expect(alphaAt(buffer, 117, 23)).assertEqual(0);
        const capArea: number = inkBox(buffer, 80, 20, 121, 40);
        expect(capArea > 300).assertTrue();
        expect(capArea < 800).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0416 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0417
     * @tc.name testEnumStroke0417
     * @tc.desc Verify the round cap never paints outside the disc around the path end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumStroke0417', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0417 begin');
      await runCase('testEnumStroke0417', async () => {
        const buffer: ArrayBuffer = await strokeBuffer(linePath(100, 40, 160), WIDE,
          drawing.CapStyle.ROUND_CAP, drawing.JoinStyle.MITER_JOIN);
        expect(alphaAt(buffer, 79, 30)).assertEqual(0);
        expect(alphaAt(buffer, 100, 30)).assertEqual(255);
        expect(countInkedPixels(buffer) < 6400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumStroke0417 end');
    });
  });
}
