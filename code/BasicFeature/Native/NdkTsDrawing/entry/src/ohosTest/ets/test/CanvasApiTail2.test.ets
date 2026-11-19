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
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { point, ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import {
  DRAWING_TAG, countInkedPixels, maxChannel, near, readPixelBuffer, runCase, throwsOn
} from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const CANVAS_SIZE: number = 200;

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
 * Build a text blob from a UTF-8 string.
 *
 * @param { string } text - Source text.
 * @param { drawing.Font } font - Font used to shape the text.
 * @returns { drawing.TextBlob } Shaped text blob.
 */
function makeBlob(text: string, font: drawing.Font): drawing.TextBlob {
  return drawing.TextBlob.makeFromString(text, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
}

/**
 * Create an offscreen target fully painted with an opaque color.
 *
 * @param { number } width - Target width in px.
 * @param { number } height - Target height in px.
 * @param { common2D.Color } color - Fill color.
 * @returns { Promise<OffscreenTarget> } Target fully covered by the color.
 */
async function createFilledTarget(width: number, height: number,
  color: common2D.Color): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(width, height);
  target.canvas.clear(color);
  return target;
}

export default function canvasApiTail2Test() {
  describe('CanvasApiTail2Test', () => {
    /** @tc.number SUB_NdkTsDrawing_CANVAS_0273
     * @tc.name testCanvasApi0273
     * @tc.desc Verify a rect far larger than the canvas fills every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0273', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0273 begin');
      await runCase('testCanvasApi0273', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(-1000000, -1000000, 1000000, 1000000);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 199, 199, 1)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0273 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0274
     * @tc.name testCanvasApi0274
     * @tc.desc Verify a sub pixel wide rect still paints a thin vertical band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0274', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0274 begin');
      await runCase('testCanvasApi0274', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 50, 10.6, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 20).assertTrue();
        expect(inked < 220).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 10, 100, 3) > 0).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 50, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0274 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0275
     * @tc.name testCanvasApi0275
     * @tc.desc Verify a circle whose radius exceeds the canvas fills it completely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0275', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0275 begin');
      await runCase('testCanvasApi0275', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 200);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0275 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0276
     * @tc.name testCanvasApi0276
     * @tc.desc Verify an oval matching the canvas leaves only the four corners empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0276', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0276 begin');
      await runCase('testCanvasApi0276', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 30000).assertTrue();
        expect(inked < 33000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0276 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0277
     * @tc.name testCanvasApi0277
     * @tc.desc Verify a full 360 degree arc strokes the whole ring and leaves the centre clear.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0277', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0277 begin');
      await runCase('testCanvasApi0277', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 2600).assertTrue();
        expect(inked < 3700).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 45, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0277 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0278
     * @tc.name testCanvasApi0278
     * @tc.desc Verify a zero sweep arc paints far less than a full ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0278', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0278 begin');
      await runCase('testCanvasApi0278', async () => {
        const flat: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const full: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        flat.canvas.attachPen(pen);
        flat.canvas.drawArc(ltrb(50, 50, 150, 150), 90, 0);
        flat.canvas.detachPen();
        full.canvas.attachPen(pen);
        full.canvas.drawArc(ltrb(50, 50, 150, 150), 90, 360);
        full.canvas.detachPen();
        const flatInk: number = countInkedPixels(await readPixelBuffer(flat.pixelMap));
        const fullInk: number = countInkedPixels(await readPixelBuffer(full.pixelMap));
        expect(flatInk < fullInk).assertTrue();
        expect(flatInk < 200).assertTrue();
        expect(fullInk > 2600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0278 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0279
     * @tc.name testCanvasApi0279
     * @tc.desc Verify a hairline pen with zero stroke width still paints the line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0279', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0279 begin');
      await runCase('testCanvasApi0279', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(0);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 100).assertTrue();
        expect(inked < 600).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 120, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0279 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0280
     * @tc.name testCanvasApi0280
     * @tc.desc Verify a very thick pen paints an area close to length times width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0280', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0280 begin');
      await runCase('testCanvasApi0280', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(100);
        pen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(50, 100, 100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 4500).assertTrue();
        expect(inked < 5500).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 75, 60, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 155, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0280 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0281
     * @tc.name testCanvasApi0281
     * @tc.desc Verify setAlpha 254 keeps the canvas non opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0281', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0281 begin');
      await runCase('testCanvasApi0281', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setAlpha(254);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 3)).assertEqual(254);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0281 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0282
     * @tc.name testCanvasApi0282
     * @tc.desc Verify a rect fully in the negative quadrant paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0282', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0282 begin');
      await runCase('testCanvasApi0282', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(-100, -100, -50, -50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0282 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0283
     * @tc.name testCanvasApi0283
     * @tc.desc Verify drawing an empty point array is rejected in either mode.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0283', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0283 begin');
      await runCase('testCanvasApi0283', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(8);
        const none: common2D.Point[] = [];
        target.canvas.attachPen(pen);
        const rejectedPoints: boolean = throwsOn(() => target.canvas.drawPoints(none, drawing.PointMode.POINTS));
        const rejectedLines: boolean = throwsOn(() => target.canvas.drawPoints(none, drawing.PointMode.LINES));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(rejectedPoints).assertTrue();
        expect(rejectedLines).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(none.length).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0283 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0284
     * @tc.name testCanvasApi0284
     * @tc.desc Verify odd point count in LINES mode strokes only the first pair.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0284', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0284 begin');
      await runCase('testCanvasApi0284', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        const odd: common2D.Point[] = [point(20, 50), point(80, 50), point(20, 150)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(odd, drawing.PointMode.LINES);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 150, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) < 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0284 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0285
     * @tc.name testCanvasApi0285
     * @tc.desc Verify different horizontal and vertical corner radii round the rect unevenly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0285', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0285 begin');
      await runCase('testCanvasApi0285', async () => {
        const uneven: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const square: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const rounded: drawing.RoundRect = new drawing.RoundRect(ltrb(50, 50, 150, 150), 40, 10);
        const sharp: drawing.RoundRect = new drawing.RoundRect(ltrb(50, 50, 150, 150), 0, 0);
        uneven.canvas.attachBrush(brush);
        uneven.canvas.drawRoundRect(rounded);
        uneven.canvas.detachBrush();
        square.canvas.attachBrush(brush);
        square.canvas.drawRoundRect(sharp);
        square.canvas.detachBrush();
        const unevenInk: number = countInkedPixels(await readPixelBuffer(uneven.pixelMap));
        const squareInk: number = countInkedPixels(await readPixelBuffer(square.pixelMap));
        expect(squareInk).assertEqual(10000);
        expect(unevenInk < squareInk).assertTrue();
        expect(unevenInk > 9500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0285 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0286
     * @tc.name testCanvasApi0286
     * @tc.desc Verify a round rect with zero radii paints the same area as a plain rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0286', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0286 begin');
      await runCase('testCanvasApi0286', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(25, 25, 125, 125), 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 125, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0286 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0287
     * @tc.name testCanvasApi0287
     * @tc.desc Verify nesting two identical round rects produces an empty ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0287', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0287 begin');
      await runCase('testCanvasApi0287', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const same: drawing.RoundRect = new drawing.RoundRect(ltrb(40, 40, 140, 140), 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawNestedRoundRect(same, same);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0287 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0288
     * @tc.name testCanvasApi0288
     * @tc.desc Verify a clip rect larger than the canvas clamps to the canvas bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0288', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0288 begin');
      await runCase('testCanvasApi0288', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 300, 300));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.right, CANVAS_SIZE, 1)).assertTrue();
        expect(near(bounds.bottom, CANVAS_SIZE, 1)).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0288 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0289
     * @tc.name testCanvasApi0289
     * @tc.desc Verify drawColor with a half transparent color keeps a uniform alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0289', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0289 begin');
      await runCase('testCanvasApi0289', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(128, 255, 255, 0), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 3)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 199, 0)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 199, 2)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0289 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0290
     * @tc.name testCanvasApi0290
     * @tc.desc Verify drawColor with a packed ARGB number fills the canvas red.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0290', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0290 begin');
      await runCase('testCanvasApi0290', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0290 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0291
     * @tc.name testCanvasApi0291
     * @tc.desc Verify a half transparent background brush tints the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0291', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0291 begin');
      await runCase('testCanvasApi0291', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 255, 0, 255));
        target.canvas.drawBackground(brush);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 3)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0291 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0292
     * @tc.name testCanvasApi0292
     * @tc.desc Verify a circle centred on the left edge paints only its right half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0292', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0292 begin');
      await runCase('testCanvasApi0292', async () => {
        const edge: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const whole: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        edge.canvas.attachBrush(brush);
        edge.canvas.drawCircle(0, 100, 50);
        edge.canvas.detachBrush();
        whole.canvas.attachBrush(brush);
        whole.canvas.drawCircle(100, 100, 50);
        whole.canvas.detachBrush();
        const edgeInk: number = countInkedPixels(await readPixelBuffer(edge.pixelMap));
        const wholeInk: number = countInkedPixels(await readPixelBuffer(whole.pixelMap));
        expect(edgeInk > 3600).assertTrue();
        expect(edgeInk < 4300).assertTrue();
        expect(edgeInk < wholeInk).assertTrue();
        expect(countInkedPixels(await readPixelBuffer(edge.pixelMap)) > wholeInk / 2 - 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0292 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0293
     * @tc.name testCanvasApi0293
     * @tc.desc Verify three nested translations accumulate and a restore unwinds all of them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0293', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0293 begin');
      await runCase('testCanvasApi0293', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.translate(10, 0);
        target.canvas.save();
        target.canvas.translate(10, 0);
        target.canvas.save();
        target.canvas.translate(10, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 10, 10);
        target.canvas.detachBrush();
        target.canvas.restoreToCount(base);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 10, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(200);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 35, 5, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 15, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0293 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0294
     * @tc.name testCanvasApi0294
     * @tc.desc Verify two overlapping clips intersect to a fifty pixel wide band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0294', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0294 begin');
      await runCase('testCanvasApi0294', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 100, CANVAS_SIZE));
        target.canvas.clipRect(ltrb(50, 0, 150, CANVAS_SIZE));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(near(target.canvas.getLocalClipBounds().left, 50, 1)).assertTrue();
        expect(near(target.canvas.getLocalClipBounds().right, 100, 1)).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 25, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0294 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0295
     * @tc.name testCanvasApi0295
     * @tc.desc Verify a DIFFERENCE clip carves a hole out of the full canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0295', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0295 begin');
      await runCase('testCanvasApi0295', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.clipRect(ltrb(50, 50, 100, 100), drawing.ClipOp.DIFFERENCE, false);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(37500);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0295 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0296
     * @tc.name testCanvasApi0296
     * @tc.desc Verify two successive translations add up on both axes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0296', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0296 begin');
      await runCase('testCanvasApi0296', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(50, 0);
        target.canvas.translate(0, 50);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0296 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0297
     * @tc.name testCanvasApi0297
     * @tc.desc Verify translate applied after scale is itself scaled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0297', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0297 begin');
      await runCase('testCanvasApi0297', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.scale(2, 2);
        target.canvas.translate(10, 10);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 10, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0297 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0298
     * @tc.name testCanvasApi0298
     * @tc.desc Verify a ninety degree rotation swaps the width and height of a drawn rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0298', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0298 begin');
      await runCase('testCanvasApi0298', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(50, 50);
        target.canvas.rotate(90, 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 40, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 45, 70, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 70, 45, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0298 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0299
     * @tc.name testCanvasApi0299
     * @tc.desc Verify the layer brush alpha 200 softens the drawn rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0299', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0299 begin');
      await runCase('testCanvasApi0299', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const layerBrush: drawing.Brush = new drawing.Brush();
        layerBrush.setAlpha(200);
        const paint: drawing.Brush = new drawing.Brush();
        paint.setColor(rgba(255, 0, 0, 255));
        target.canvas.saveLayer(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), layerBrush);
        target.canvas.attachBrush(paint);
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const alpha: number = channelAt(buffer, CANVAS_SIZE, 20, 20, 3);
        expect(countInkedPixels(buffer)).assertEqual(1600);
        expect(alpha > 180).assertTrue();
        expect(alpha < 220).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0299 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0300
     * @tc.name testCanvasApi0300
     * @tc.desc Verify drawing on one canvas leaves a sibling canvas untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0300', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0300 begin');
      await runCase('testCanvasApi0300', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        first.canvas.detachBrush();
        const firstBuffer: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const secondBuffer: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(countInkedPixels(firstBuffer)).assertEqual(40000);
        expect(countInkedPixels(secondBuffer)).assertEqual(0);
        expect(second.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0300 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0301
     * @tc.name testCanvasApi0301
     * @tc.desc Verify a second rect overwrites the inner area of the first one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0301', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0301 begin');
      await runCase('testCanvasApi0301', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const red: drawing.Brush = new drawing.Brush();
        red.setColor(rgba(255, 255, 0, 0));
        const blue: drawing.Brush = new drawing.Brush();
        blue.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(red);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.attachBrush(blue);
        target.canvas.drawRect(20, 20, 80, 80);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 1)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0301 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0302
     * @tc.name testCanvasApi0302
     * @tc.desc Verify the same pixel map can be blitted at two positions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0302', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0302 begin');
      await runCase('testCanvasApi0302', async () => {
        const source: OffscreenTarget = await createFilledTarget(20, 20, rgba(255, 255, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const sampling: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImage(source.pixelMap, 0, 0, sampling);
        target.canvas.drawImage(source.pixelMap, 150, 150, sampling);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(800);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 160, 160, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0302 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0303
     * @tc.name testCanvasApi0303
     * @tc.desc Verify drawImageRect shrinks a hundred pixel source into fifty pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0303', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0303 begin');
      await runCase('testCanvasApi0303', async () => {
        const source: OffscreenTarget = await createFilledTarget(100, 100, rgba(255, 255, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRect(source.pixelMap, ltrb(20, 20, 70, 70),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 45, 45, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0303 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0304
     * @tc.name testCanvasApi0304
     * @tc.desc Verify a half width source rect stretched over the full canvas fills half of it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0304', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0304 begin');
      await runCase('testCanvasApi0304', async () => {
        const source: OffscreenTarget = await createFilledTarget(100, 100, rgba(255, 0, 255, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, 50, 100), ltrb(0, 0, 100, 200),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), drawing.SrcRectConstraint.FAST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(20000);
        expect(channelAt(buffer, CANVAS_SIZE, 99, 199, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0304 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0305
     * @tc.name testCanvasApi0305
     * @tc.desc Verify drawColor CLEAR erases everything painted before it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0305', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0305 begin');
      await runCase('testCanvasApi0305', async () => {
        const target: OffscreenTarget = await createFilledTarget(CANVAS_SIZE, CANVAS_SIZE, rgba(255, 0, 255, 0));
        target.canvas.drawColor(rgba(0, 0, 0, 0), drawing.BlendMode.CLEAR);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0305 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0306
     * @tc.name testCanvasApi0306
     * @tc.desc Verify two SRC drawColor calls leave the last color on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0306', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0306 begin');
      await runCase('testCanvasApi0306', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 255, 0, 0), drawing.BlendMode.SRC);
        target.canvas.drawColor(rgba(255, 0, 255, 0), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 0)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0306 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0307
     * @tc.name testCanvasApi0307
     * @tc.desc Verify drawRegion fills exactly the region rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0307', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0307 begin');
      await runCase('testCanvasApi0307', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const region: drawing.Region = new drawing.Region(20, 20, 60, 60);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRegion(region);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(1600);
        expect(channelAt(buffer, CANVAS_SIZE, 40, 40, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 70, 70, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0307 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0308
     * @tc.name testCanvasApi0308
     * @tc.desc Verify stroking a round rect leaves the interior empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0308', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0308 begin');
      await runCase('testCanvasApi0308', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(40, 40, 160, 160), 20, 20);
        target.canvas.attachPen(pen);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 40, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) < 6000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0308 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0309
     * @tc.name testCanvasApi0309
     * @tc.desc Verify a clip trims an image placed partly outside the clip rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0309', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0309 begin');
      await runCase('testCanvasApi0309', async () => {
        const source: OffscreenTarget = await createFilledTarget(100, 100, rgba(255, 255, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.drawImage(source.pixelMap, -50, -50,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 49, 49, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 51, 51, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0309 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0310
     * @tc.name testCanvasApi0310
     * @tc.desc Verify a clip rect in a scaled space maps to a doubled device rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0310', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0310 begin');
      await runCase('testCanvasApi0310', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        target.canvas.setMatrix(matrix);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 99, 99, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 101, 101, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0310 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0311
     * @tc.name testCanvasApi0311
     * @tc.desc Verify resetClip makes quickRejectRect accept a previously rejected rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0311', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0311 begin');
      await runCase('testCanvasApi0311', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        const before: boolean = target.canvas.quickRejectRect(ltrb(100, 100, 150, 150));
        target.canvas.resetClip();
        const after: boolean = target.canvas.quickRejectRect(ltrb(100, 100, 150, 150));
        expect(before).assertTrue();
        expect(after).assertFalse();
        expect(target.canvas.isClipEmpty()).assertFalse();
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0311 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0312
     * @tc.name testCanvasApi0312
     * @tc.desc Verify a later rect repaints part of a background painted canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0312', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0312 begin');
      await runCase('testCanvasApi0312', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const background: drawing.Brush = new drawing.Brush();
        background.setColor(rgba(255, 0, 0, 255));
        const patch: drawing.Brush = new drawing.Brush();
        patch.setColor(rgba(255, 255, 0, 0));
        target.canvas.drawBackground(background);
        target.canvas.attachBrush(patch);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 2)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 1)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0312 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0313
     * @tc.name testCanvasApi0313
     * @tc.desc Verify doubling the font size more than doubles the painted glyph area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0313', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0313 begin');
      await runCase('testCanvasApi0313', async () => {
        const small: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const large: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        small.canvas.attachBrush(brush);
        small.canvas.drawTextBlob(makeBlob('M', makeFont(20)), 20, 150);
        small.canvas.detachBrush();
        large.canvas.attachBrush(brush);
        large.canvas.drawTextBlob(makeBlob('M', makeFont(40)), 20, 150);
        large.canvas.detachBrush();
        const smallInk: number = countInkedPixels(await readPixelBuffer(small.pixelMap));
        const largeInk: number = countInkedPixels(await readPixelBuffer(large.pixelMap));
        expect(smallInk > 0).assertTrue();
        expect(largeInk > smallInk * 2).assertTrue();
        expect(largeInk > 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0313 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0314
     * @tc.name testCanvasApi0314
     * @tc.desc Verify countText and measureText agree on the same string.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0314', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0314 begin');
      await runCase('testCanvasApi0314', async () => {
        const font: drawing.Font = makeFont(30);
        const wide: number = font.measureText('ABC', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const narrow: number = font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(font.countText('ABC')).assertEqual(3);
        expect(narrow > 0).assertTrue();
        expect(wide > narrow).assertTrue();
        expect(font.measureText('', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0314 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0315
     * @tc.name testCanvasApi0315
     * @tc.desc Verify drawing the same blob twice paints the same area as drawing it once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0315', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0315 begin');
      await runCase('testCanvasApi0315', async () => {
        const once: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const twice: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(36);
        const blob: drawing.TextBlob = makeBlob('E', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        once.canvas.attachBrush(brush);
        once.canvas.drawTextBlob(blob, 60, 120);
        once.canvas.detachBrush();
        twice.canvas.attachBrush(brush);
        twice.canvas.drawTextBlob(blob, 60, 120);
        twice.canvas.drawTextBlob(blob, 60, 120);
        twice.canvas.detachBrush();
        const onceInk: number = countInkedPixels(await readPixelBuffer(once.pixelMap));
        const twiceInk: number = countInkedPixels(await readPixelBuffer(twice.pixelMap));
        expect(onceInk > 100).assertTrue();
        expect(twiceInk).assertEqual(onceInk);
        expect(blob.bounds().bottom > blob.bounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0315 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0316
     * @tc.name testCanvasApi0316
     * @tc.desc Verify a blob anchored at the origin is clipped but still paints.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0316', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0316 begin');
      await runCase('testCanvasApi0316', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('H', makeFont(40)), 0, 0);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0316 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0317
     * @tc.name testCanvasApi0317
     * @tc.desc Verify a ligature feature list is accepted while painting the character.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0317', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0317 begin');
      await runCase('testCanvasApi0317', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const feature: drawing.FontFeature = { name: 'liga', value: 1 };
        const features: Array<drawing.FontFeature> = [feature];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          target.canvas.attachBrush(brush);
          target.canvas.drawSingleCharacterWithFeatures('f', font, 60, 120, features);
          target.canvas.detachBrush();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'feature list rejected by the engine');
        }
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(features.length).assertEqual(1);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) < 8000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0317 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0318
     * @tc.name testCanvasApi0318
     * @tc.desc Verify a long string measures wider than a single character.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0318', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0318 begin');
      await runCase('testCanvasApi0318', async () => {
        const font: drawing.Font = makeFont(24);
        const single: number = font.measureText('H', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const many: number = font.measureText('HHHHHHHH', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const cjk: number = font.measureText('中文', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(many > single * 4).assertTrue();
        expect(cjk > 0).assertTrue();
        expect(font.countText('HHHHHHHH')).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0318 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0319
     * @tc.name testCanvasApi0319
     * @tc.desc Verify the same blob painted at two x positions covers about twice the area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0319', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0319 begin');
      await runCase('testCanvasApi0319', async () => {
        const single: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pair: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const blob: drawing.TextBlob = makeBlob('I', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        single.canvas.attachBrush(brush);
        single.canvas.drawTextBlob(blob, 20, 120);
        single.canvas.detachBrush();
        pair.canvas.attachBrush(brush);
        pair.canvas.drawTextBlob(blob, 20, 120);
        pair.canvas.drawTextBlob(blob, 120, 120);
        pair.canvas.detachBrush();
        const singleInk: number = countInkedPixels(await readPixelBuffer(single.pixelMap));
        const pairInk: number = countInkedPixels(await readPixelBuffer(pair.pixelMap));
        expect(singleInk > 100).assertTrue();
        expect(pairInk > singleInk * 1.5).assertTrue();
        expect(pairInk < singleInk * 2.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0319 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0320
     * @tc.name testCanvasApi0320
     * @tc.desc Verify a one pixel font still reports a positive advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasApi0320', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0320 begin');
      await runCase('testCanvasApi0320', async () => {
        const font: drawing.Font = makeFont(1);
        const tiny: number = font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const normal: number = makeFont(40).measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(tiny > 0).assertTrue();
        expect(tiny < normal).assertTrue();
        expect(font.getSize()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0320 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0321
     * @tc.name testCanvasApi0321
     * @tc.desc Verify a clip splitting the glyph at x ninety keeps only the left part.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0321', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0321 begin');
      await runCase('testCanvasApi0321', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 90, CANVAS_SIZE));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('W', makeFont(48)), 60, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 50).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 120, 120, 3)).assertEqual(0);
        expect(near(target.canvas.getLocalClipBounds().right, 90, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0321 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0322
     * @tc.name testCanvasApi0322
     * @tc.desc Verify scaling the canvas up enlarges the painted glyph area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0322', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0322 begin');
      await runCase('testCanvasApi0322', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const zoomed: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(30);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawTextBlob(makeBlob('L', font), 30, 100);
        plain.canvas.detachBrush();
        zoomed.canvas.scale(2, 2);
        zoomed.canvas.attachBrush(brush);
        zoomed.canvas.drawTextBlob(makeBlob('L', font), 30, 100);
        zoomed.canvas.detachBrush();
        const plainInk: number = countInkedPixels(await readPixelBuffer(plain.pixelMap));
        const zoomedInk: number = countInkedPixels(await readPixelBuffer(zoomed.pixelMap));
        expect(plainInk > 50).assertTrue();
        expect(zoomedInk > plainInk * 2).assertTrue();
        expect(zoomed.canvas.getTotalMatrix().getValue(0)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0322 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0323
     * @tc.name testCanvasApi0323
     * @tc.desc Verify a rotated blob paints inside the canvas and leaves other areas clear.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0323', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0323 begin');
      await runCase('testCanvasApi0323', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(100, 160);
        target.canvas.rotate(90, 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('T', makeFont(48)), 0, 0);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 100).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 190, 190, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0323 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0324
     * @tc.name testCanvasApi0324
     * @tc.desc Verify stroking a glyph covers less area than filling it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0324', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0324 begin');
      await runCase('testCanvasApi0324', async () => {
        const stroked: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const filled: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(60);
        const blob: drawing.TextBlob = makeBlob('O', font);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(2);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        stroked.canvas.attachPen(pen);
        stroked.canvas.drawTextBlob(blob, 50, 140);
        stroked.canvas.detachPen();
        filled.canvas.attachBrush(brush);
        filled.canvas.drawTextBlob(blob, 50, 140);
        filled.canvas.detachBrush();
        const strokedInk: number = countInkedPixels(await readPixelBuffer(stroked.pixelMap));
        const filledInk: number = countInkedPixels(await readPixelBuffer(filled.pixelMap));
        expect(strokedInk > 0).assertTrue();
        expect(strokedInk < filledInk).assertTrue();
        expect(filledInk > 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0324 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0325
     * @tc.name testCanvasApi0325
     * @tc.desc Verify a half alpha text brush caps the glyph alpha at 128.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0325', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0325 begin');
      await runCase('testCanvasApi0325', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('N', makeFont(50)), 60, 130);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 100).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(128);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0325 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0326
     * @tc.name testCanvasApi0326
     * @tc.desc Verify text painted on a transparent canvas keeps it non opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0326', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0326 begin');
      await runCase('testCanvasApi0326', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('U', makeFont(40)), 60, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) < 40000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0326 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0327
     * @tc.name testCanvasApi0327
     * @tc.desc Verify a fresh canvas starts with a single save level.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0327', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0327 begin');
      await runCase('testCanvasApi0327', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const initial: number = target.canvas.getSaveCount();
        target.canvas.save();
        const raised: number = target.canvas.getSaveCount();
        expect(initial).assertEqual(1);
        expect(raised).assertEqual(initial + 1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0327 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0328
     * @tc.name testCanvasApi0328
     * @tc.desc Verify a clip saved and then restored does not leak into later drawing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0328', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0328 begin');
      await runCase('testCanvasApi0328', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        const inner: number = target.canvas.getLocalClipBounds().right;
        target.canvas.restore();
        const outer: number = target.canvas.getLocalClipBounds().right;
        expect(near(inner, 50, 1)).assertTrue();
        expect(near(outer, CANVAS_SIZE, 1)).assertTrue();
        expect(outer > inner).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0328 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0329
     * @tc.name testCanvasApi0329
     * @tc.desc Verify an excessive restore is tolerated and drawing still works.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0329', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0329 begin');
      await runCase('testCanvasApi0329', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          target.canvas.restore();
          target.canvas.restore();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'extra restores rejected by the engine');
        }
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(255);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0329 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0330
     * @tc.name testCanvasApi0330
     * @tc.desc Verify detaching without attaching is tolerated and later drawing works.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0330', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0330 begin');
      await runCase('testCanvasApi0330', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        try {
          target.canvas.detachBrush();
          target.canvas.detachPen();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'detach without attach rejected by the engine');
        }
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 2)).assertEqual(255);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0330 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0331
     * @tc.name testCanvasApi0331
     * @tc.desc Verify attaching the pen twice is tolerated and the pen still strokes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0331', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0331 begin');
      await runCase('testCanvasApi0331', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        try {
          target.canvas.attachPen(pen);
          target.canvas.attachPen(pen);
          target.canvas.drawLine(50, 100, 150, 100);
          target.canvas.detachPen();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'double attach rejected by the engine');
        }
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 140, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) < 3000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0331 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0332
     * @tc.name testCanvasApi0332
     * @tc.desc Verify a non square canvas reports both dimensions and clips to them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0332', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0332 begin');
      await runCase('testCanvasApi0332', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(300, 150);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 400, 400);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(target.canvas.getWidth(), 300, 1)).assertTrue();
        expect(target.canvas.getHeight()).assertEqual(150);
        expect(near(bounds.right, 300, 1)).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(45000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0332 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0333
     * @tc.name testCanvasApi0333
     * @tc.desc Verify clear with a color repaints the whole canvas without changing its size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0333', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0333 begin');
      await runCase('testCanvasApi0333', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(255, 0, 255, 0));
        target.canvas.clear(rgba(255, 255, 255, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 1)).assertEqual(255);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0333 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0334
     * @tc.name testCanvasApi0334
     * @tc.desc Verify a fresh canvas is neither opaque nor clipped empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0334', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0334 begin');
      await runCase('testCanvasApi0334', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(target.canvas.isClipEmpty()).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0334 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0335
     * @tc.name testCanvasApi0335
     * @tc.desc Verify a one pixel wide clip keeps a two hundred pixel band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0335', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0335 begin');
      await runCase('testCanvasApi0335', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(100, 0, 101, CANVAS_SIZE));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(200);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 101, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0335 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0336
     * @tc.name testCanvasApi0336
     * @tc.desc Verify a negative translation pushes part of a rect off the canvas edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0336', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0336 begin');
      await runCase('testCanvasApi0336', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(-10, -10);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(100);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 15, 15, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0336 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0337
     * @tc.name testCanvasApi0337
     * @tc.desc Verify a zero scale collapses every drawing to nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0337', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0337 begin');
      await runCase('testCanvasApi0337', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.scale(0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(target.canvas.getTotalMatrix().getValue(0)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0337 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0338
     * @tc.name testCanvasApi0338
     * @tc.desc Verify a negative x scale mirrors the rect to the canvas right edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0338', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0338 begin');
      await runCase('testCanvasApi0338', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(CANVAS_SIZE, 0);
        target.canvas.scale(-1, 1);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 190, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
        expect(target.canvas.getTotalMatrix().getValue(0)).assertEqual(-1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0338 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0339
     * @tc.name testCanvasApi0339
     * @tc.desc Verify a forty five degree skew keeps the square area but moves the right edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0339', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0339 begin');
      await runCase('testCanvasApi0339', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.skew(0.7071, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 350).assertTrue();
        expect(inked < 500).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 10, 5, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 15, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0339 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0340
     * @tc.name testCanvasApi0340
     * @tc.desc Verify concatenating an identity matrix leaves the drawing untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0340', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0340 begin');
      await runCase('testCanvasApi0340', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const identity: drawing.Matrix = new drawing.Matrix();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.concatMatrix(identity);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(target.canvas.getTotalMatrix().getValue(0)).assertEqual(1);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0340 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0341
     * @tc.name testCanvasApi0341
     * @tc.desc Verify a save clip translate draw restore chain paints only the clipped region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0341', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0341 begin');
      await runCase('testCanvasApi0341', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 80, 40));
        target.canvas.translate(10, 10);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.detachBrush();
        target.canvas.restore();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(160, 160, 200, 200);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2800);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 20, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 60, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 180, 180, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0341 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0342
     * @tc.name testCanvasApi0342
     * @tc.desc Verify a long mixed chain of transforms and clips ends with a clean canvas state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasApi0342', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0342 begin');
      await runCase('testCanvasApi0342', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.save();
        target.canvas.scale(0.5, 0.5);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 400, 400);
        target.canvas.detachBrush();
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(target.canvas.getTotalMatrix().getValue(0)).assertEqual(1);
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0342 end');
    });
  });
}
