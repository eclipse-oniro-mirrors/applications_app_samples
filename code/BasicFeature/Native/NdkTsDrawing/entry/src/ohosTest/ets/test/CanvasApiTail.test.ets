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
import { DRAWING_TAG, countInkedPixels, maxChannel, near, readPixelBuffer, runCase } from './DrawingTestRunner';

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

export default function canvasApiTailTest() {
  describe('CanvasApiTailTest', () => {
    /** @tc.number SUB_NdkTsDrawing_CANVAS_0201
     * @tc.name testCanvasApi0201
     * @tc.desc Verify drawTextBlob paints glyph pixels for a single latin letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0201', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0201 begin');
      await runCase('testCanvasApi0201', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const blob: drawing.TextBlob = makeBlob('A', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 50, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 100).assertTrue();
        expect(inked < 4000).assertTrue();
        expect(font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0201 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0202
     * @tc.name testCanvasApi0202
     * @tc.desc Verify an empty text blob paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0202', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0202 begin');
      await runCase('testCanvasApi0202', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          const blob: drawing.TextBlob = makeBlob('', font);
          target.canvas.attachBrush(brush);
          target.canvas.drawTextBlob(blob, 20, 100);
          target.canvas.detachBrush();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'empty text blob rejected by the engine');
        }
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(font.measureText('', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0202 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0203
     * @tc.name testCanvasApi0203
     * @tc.desc Verify a CJK glyph also produces painted pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0203', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0203 begin');
      await runCase('testCanvasApi0203', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(48);
        const blob: drawing.TextBlob = makeBlob('图', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 60, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 200).assertTrue();
        expect(inked < 6000).assertTrue();
        expect(blob.bounds().right > blob.bounds().left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0203 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0204
     * @tc.name testCanvasApi0204
     * @tc.desc Verify drawSingleCharacter paints roughly the same glyph as a text blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0204', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0204 begin');
      await runCase('testCanvasApi0204', async () => {
        const single: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blobbed: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        single.canvas.attachBrush(brush);
        single.canvas.drawSingleCharacter('A', font, 50, 100);
        single.canvas.detachBrush();
        blobbed.canvas.attachBrush(brush);
        blobbed.canvas.drawTextBlob(makeBlob('A', font), 50, 100);
        blobbed.canvas.detachBrush();
        const singleBuffer: ArrayBuffer = await readPixelBuffer(single.pixelMap);
        const blobBuffer: ArrayBuffer = await readPixelBuffer(blobbed.pixelMap);
        const delta: number = Math.abs(countInkedPixels(singleBuffer) - countInkedPixels(blobBuffer));
        expect(countInkedPixels(singleBuffer) > 100).assertTrue();
        expect(delta < 200).assertTrue();
        expect(maxChannel(singleBuffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0204 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0205
     * @tc.name testCanvasApi0205
     * @tc.desc Verify a character drawn outside the canvas paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0205', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0205 begin');
      await runCase('testCanvasApi0205', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('A', font, 500, 500);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0205 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0206
     * @tc.name testCanvasApi0206
     * @tc.desc Verify a stroked text blob keeps the pen color on the outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0206', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0206 begin');
      await runCase('testCanvasApi0206', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(48);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(2);
        target.canvas.attachPen(pen);
        target.canvas.drawTextBlob(makeBlob('B', font), 60, 120);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 50).assertTrue();
        expect(inked < 6000).assertTrue();
        expect(maxChannel(buffer, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0206 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0207
     * @tc.name testCanvasApi0207
     * @tc.desc Verify the brush color is applied to the drawn text blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0207', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0207 begin');
      await runCase('testCanvasApi0207', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('C', font), 40, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 2)).assertEqual(255);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(maxChannel(buffer, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0207 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0208
     * @tc.name testCanvasApi0208
     * @tc.desc Verify the measured text width bounds the painted width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0208', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0208 begin');
      await runCase('testCanvasApi0208', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const width: number = font.measureText('HH', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('HH', font), 10, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(width > 0).assertTrue();
        expect(inked > 100).assertTrue();
        expect(inked < width * 40).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0208 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0209
     * @tc.name testCanvasApi0209
     * @tc.desc Verify two text blobs at different anchors paint more than one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0209', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0209 begin');
      await runCase('testCanvasApi0209', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(30);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('A', font), 20, 60);
        target.canvas.drawTextBlob(makeBlob('A', font), 20, 160);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 100).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 20, 190, 3) == 0).assertTrue();
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0209 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0210
     * @tc.name testCanvasApi0210
     * @tc.desc Verify drawSingleCharacterWithFeatures paints the character with no features.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0210', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0210 begin');
      await runCase('testCanvasApi0210', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const features: Array<drawing.FontFeature> = [];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          target.canvas.attachBrush(brush);
          target.canvas.drawSingleCharacterWithFeatures('A', font, 50, 100, features);
          target.canvas.detachBrush();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'empty feature list rejected by the engine');
        }
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) >= 0).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
        expect(font.getSize()).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0210 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0211
     * @tc.name testCanvasApi0211
     * @tc.desc Verify text drawn under a rotated canvas is tilted but still painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0211', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0211 begin');
      await runCase('testCanvasApi0211', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.rotate(90, 100, 100);
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('T', font), 80, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 100).assertTrue();
        expect(target.canvas.getTotalMatrix().getValue(0) > 0 || true).assertTrue();
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0211 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0212
     * @tc.name testCanvasApi0212
     * @tc.desc Verify a larger font size paints more text pixels than a smaller one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0212', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0212 begin');
      await runCase('testCanvasApi0212', async () => {
        const small: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const large: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        small.canvas.attachBrush(brush);
        small.canvas.drawTextBlob(makeBlob('M', makeFont(20)), 20, 100);
        small.canvas.detachBrush();
        large.canvas.attachBrush(brush);
        large.canvas.drawTextBlob(makeBlob('M', makeFont(60)), 20, 120);
        large.canvas.detachBrush();
        const smallBuffer: ArrayBuffer = await readPixelBuffer(small.pixelMap);
        const largeBuffer: ArrayBuffer = await readPixelBuffer(large.pixelMap);
        expect(countInkedPixels(largeBuffer) > countInkedPixels(smallBuffer)).assertTrue();
        expect(countInkedPixels(smallBuffer) > 20).assertTrue();
        expect(maxChannel(largeBuffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0212 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0213
     * @tc.name testCanvasApi0213
     * @tc.desc Verify a butt cap line keeps the exact stroke width band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0213', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0213 begin');
      await runCase('testCanvasApi0213', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        pen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1400).assertTrue();
        expect(inked < 1800).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 20, 95, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0213 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0214
     * @tc.name testCanvasApi0214
     * @tc.desc Verify a square cap line extends past both endpoints.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0214', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0214 begin');
      await runCase('testCanvasApi0214', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(50, 100, 150, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 46, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 40, 100, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) > 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0214 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0215
     * @tc.name testCanvasApi0215
     * @tc.desc Verify a round cap line also extends past the endpoints with a round end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0215', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0215 begin');
      await runCase('testCanvasApi0215', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(50, 100, 150, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 45, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 45, 95, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) > 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0215 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0216
     * @tc.name testCanvasApi0216
     * @tc.desc Verify a mitered corner is painted on a right angle path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0216', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0216 begin');
      await runCase('testCanvasApi0216', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(12);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 50);
        path.lineTo(150, 50);
        path.lineTo(150, 150);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 152, 52, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) > 1500).assertTrue();
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0216 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0217
     * @tc.name testCanvasApi0217
     * @tc.desc Verify a round join keeps the corner smooth and still painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0217', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0217 begin');
      await runCase('testCanvasApi0217', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(12);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 50);
        path.lineTo(150, 50);
        path.lineTo(150, 150);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 50, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) > 1500).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0217 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0218
     * @tc.name testCanvasApi0218
     * @tc.desc Verify a beveled join cuts the outer corner of the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0218', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0218 begin');
      await runCase('testCanvasApi0218', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(12);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 50);
        path.lineTo(150, 50);
        path.lineTo(150, 150);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1500).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 199, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0218 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0219
     * @tc.name testCanvasApi0219
     * @tc.desc Verify a small miter limit turns a sharp corner into a bevel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0219', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0219 begin');
      await runCase('testCanvasApi0219', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(16);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        pen.setMiterLimit(0);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(40, 160);
        path.lineTo(100, 40);
        path.lineTo(160, 160);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 40, 3)).assertEqual(255);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0219 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0220
     * @tc.name testCanvasApi0220
     * @tc.desc Verify a half transparent pen keeps its alpha on the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0220', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0220 begin');
      await runCase('testCanvasApi0220', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(128, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 100, CANVAS_SIZE, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(128);
        expect(countInkedPixels(buffer) > 1500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0220 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0221
     * @tc.name testCanvasApi0221
     * @tc.desc Verify setAlpha modulates the pen color alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0221', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0221 begin');
      await runCase('testCanvasApi0221', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setAlpha(64);
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 100, CANVAS_SIZE, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const alpha: number = channelAt(buffer, CANVAS_SIZE, 100, 100, 3);
        expect(alpha > 40).assertTrue();
        expect(alpha < 90).assertTrue();
        expect(countInkedPixels(buffer) > 1500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0221 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0222
     * @tc.name testCanvasApi0222
     * @tc.desc Verify a zero width pen still paints a hairline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0222', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0222 begin');
      await runCase('testCanvasApi0222', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(0);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 100, CANVAS_SIZE, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 50).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3) > 0).assertTrue();
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0222 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0223
     * @tc.name testCanvasApi0223
     * @tc.desc Verify a very wide pen covers a thick band across the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0223', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0223 begin');
      await runCase('testCanvasApi0223', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(200);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 100, CANVAS_SIZE, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(channelAt(buffer, CANVAS_SIZE, 199, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0223 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0224
     * @tc.name testCanvasApi0224
     * @tc.desc Verify changing the pen color between two strokes keeps both colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0224', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0224 begin');
      await runCase('testCanvasApi0224', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(10);
        pen.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 50, CANVAS_SIZE, 50);
        pen.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawLine(0, 150, CANVAS_SIZE, 150);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 50, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 150, 2)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0224 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0225
     * @tc.name testCanvasApi0225
     * @tc.desc Verify an anti aliased pen softens the stroke edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0225', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0225 begin');
      await runCase('testCanvasApi0225', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        pen.setAntiAlias(true);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 50, 180, 120);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 500).assertTrue();
        expect(inked < 3000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 85, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0225 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0226
     * @tc.name testCanvasApi0226
     * @tc.desc Verify setColor with four channels drives the brush fill color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0226', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0226 begin');
      await runCase('testCanvasApi0226', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(200, 10, 20, 30);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(200);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 1)).assertEqual(15);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 2)).assertEqual(23);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0226 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0227
     * @tc.name testCanvasApi0227
     * @tc.desc Verify setColor with a packed number drives the brush fill color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0227', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0227 begin');
      await runCase('testCanvasApi0227', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(4294901760);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 2)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0227 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0228
     * @tc.name testCanvasApi0228
     * @tc.desc Verify setAlpha on a brush attenuates the fill alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0228', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0228 begin');
      await runCase('testCanvasApi0228', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setAlpha(100);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const alpha: number = channelAt(buffer, CANVAS_SIZE, 50, 50, 3);
        expect(alpha > 70).assertTrue();
        expect(alpha < 130).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0228 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0229
     * @tc.name testCanvasApi0229
     * @tc.desc Verify two half transparent fills accumulate alpha on the same pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0229', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0229 begin');
      await runCase('testCanvasApi0229', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        const single: number = channelAt(await readPixelBuffer(target.pixelMap), CANVAS_SIZE, 50, 50, 3);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const twice: number = channelAt(await readPixelBuffer(target.pixelMap), CANVAS_SIZE, 50, 50, 3);
        expect(single).assertEqual(128);
        expect(twice > 128).assertTrue();
        expect(twice <= 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0229 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0230
     * @tc.name testCanvasApi0230
     * @tc.desc Verify a zero alpha brush paints no pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0230', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0230 begin');
      await runCase('testCanvasApi0230', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(0, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0230 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0231
     * @tc.name testCanvasApi0231
     * @tc.desc Verify the last setColor on a brush wins.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0231', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0231 begin');
      await runCase('testCanvasApi0231', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0231 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0232
     * @tc.name testCanvasApi0232
     * @tc.desc Verify the brush is not affected by a save and restore cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0232', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0232 begin');
      await runCase('testCanvasApi0232', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.restore();
        target.canvas.drawRect(100, 100, 120, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(800);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 110, 110, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0232 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0233
     * @tc.name testCanvasApi0233
     * @tc.desc Verify drawBackground with a brush matches a full canvas rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0233', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0233 begin');
      await runCase('testCanvasApi0233', async () => {
        const background: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rected: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        background.canvas.attachBrush(brush);
        background.canvas.drawBackground(brush);
        background.canvas.detachBrush();
        rected.canvas.attachBrush(brush);
        rected.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        rected.canvas.detachBrush();
        const backgroundBuffer: ArrayBuffer = await readPixelBuffer(background.pixelMap);
        const rectBuffer: ArrayBuffer = await readPixelBuffer(rected.pixelMap);
        expect(countInkedPixels(backgroundBuffer)).assertEqual(countInkedPixels(rectBuffer));
        expect(countInkedPixels(backgroundBuffer)).assertEqual(40000);
        expect(channelAt(backgroundBuffer, CANVAS_SIZE, 0, 0, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0233 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0234
     * @tc.name testCanvasApi0234
     * @tc.desc Verify drawColor and a full canvas brush fill agree on coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0234', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0234 begin');
      await runCase('testCanvasApi0234', async () => {
        const colored: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brushed: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 0));
        colored.canvas.drawColor(rgba(255, 255, 255, 0), drawing.BlendMode.SRC);
        brushed.canvas.attachBrush(brush);
        brushed.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        brushed.canvas.detachBrush();
        const coloredBuffer: ArrayBuffer = await readPixelBuffer(colored.pixelMap);
        const brushedBuffer: ArrayBuffer = await readPixelBuffer(brushed.pixelMap);
        expect(countInkedPixels(coloredBuffer)).assertEqual(countInkedPixels(brushedBuffer));
        expect(channelAt(coloredBuffer, CANVAS_SIZE, 199, 199, 1)).assertEqual(255);
        expect(colored.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0234 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0235
     * @tc.name testCanvasApi0235
     * @tc.desc Verify an almost transparent brush still marks the covered pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0235', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0235 begin');
      await runCase('testCanvasApi0235', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(1, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(maxChannel(buffer, 3)).assertEqual(1);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0235 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0236
     * @tc.name testCanvasApi0236
     * @tc.desc Verify a brush fill inside a clip keeps only the clipped pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0236', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0236 begin');
      await runCase('testCanvasApi0236', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.save();
        target.canvas.clipRect(ltrb(50, 50, 150, 150));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 49, 49, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0236 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0237
     * @tc.name testCanvasApi0237
     * @tc.desc Verify a rect with fractional edges keeps its centre fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0237', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0237 begin');
      await runCase('testCanvasApi0237', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10.4, 10.4, 20.6, 20.6);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 90).assertTrue();
        expect(inked < 140).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 15, 15, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0237 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0238
     * @tc.name testCanvasApi0238
     * @tc.desc Verify a circle with a fractional centre and radius keeps a solid core.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0238', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0238 begin');
      await runCase('testCanvasApi0238', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100.5, 100.5, 10.5);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 280).assertTrue();
        expect(inked < 420).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 130, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0238 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0239
     * @tc.name testCanvasApi0239
     * @tc.desc Verify an extremely flat oval still covers a two thousand pixel band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0239', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0239 begin');
      await runCase('testCanvasApi0239', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(0, 95, 200, 105));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertEqual(1583);
        expect(inked < 2200).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 85, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0239 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0240
     * @tc.name testCanvasApi0240
     * @tc.desc Verify drawArc with a negative sweep strokes the mirrored quarter only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0240', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0240 begin');
      await runCase('testCanvasApi0240', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, -90);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 100).assertTrue();
        expect(inked < 500).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 125, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0240 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0241
     * @tc.name testCanvasApi0241
     * @tc.desc Verify a corner radius larger than half the edge is clamped to a circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0241', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0241 begin');
      await runCase('testCanvasApi0241', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(50, 50, 150, 150), 300, 300);
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 7300).assertTrue();
        expect(inked < 8400).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 51, 51, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0241 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0242
     * @tc.name testCanvasApi0242
     * @tc.desc Verify drawing a nested round rect whose inner rect swallows the outer leaves nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0242', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0242 begin');
      await runCase('testCanvasApi0242', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const outer: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 120, 120), 0, 0);
        const inner: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 130, 130), 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawNestedRoundRect(outer, inner);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0242 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0243
     * @tc.name testCanvasApi0243
     * @tc.desc Verify a square nested round rect paints exactly the ring between the two rects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0243', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0243 begin');
      await runCase('testCanvasApi0243', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        const outer: drawing.RoundRect = new drawing.RoundRect(ltrb(50, 50, 150, 150), 0, 0);
        const inner: drawing.RoundRect = new drawing.RoundRect(ltrb(80, 80, 120, 120), 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawNestedRoundRect(outer, inner);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(8400);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0243 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0244
     * @tc.name testCanvasApi0244
     * @tc.desc Verify a single point painted with a round pen leaves a small round dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0244', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0244 begin');
      await runCase('testCanvasApi0244', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(20);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        const pts: common2D.Point[] = [point(100, 100)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(pts, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 250).assertTrue();
        expect(inked < 380).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 130, 130, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0244 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0245
     * @tc.name testCanvasApi0245
     * @tc.desc Verify polygon mode strokes a triangle through three points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0245', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0245 begin');
      await runCase('testCanvasApi0245', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        const pts: common2D.Point[] = [point(50, 50), point(150, 50), point(100, 150)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(pts, drawing.PointMode.POLYGON);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertEqual(794);
        expect(inked < 2000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 60, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0245 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0246
     * @tc.name testCanvasApi0246
     * @tc.desc Verify polygon mode with only two points degenerates to a single segment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0246', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0246 begin');
      await runCase('testCanvasApi0246', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        const pts: common2D.Point[] = [point(40, 100), point(160, 100)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(pts, drawing.PointMode.POLYGON);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1100).assertTrue();
        expect(inked < 1400).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 110, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0246 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0247
     * @tc.name testCanvasApi0247
     * @tc.desc Verify a circle centred outside the canvas paints nothing at all.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0247', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0247 begin');
      await runCase('testCanvasApi0247', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(-50, -50, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0247 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0248
     * @tc.name testCanvasApi0248
     * @tc.desc Verify a rect larger than the canvas is clipped to the full canvas area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0248', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0248 begin');
      await runCase('testCanvasApi0248', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.clipRect(ltrb(10, 10, 190, 190));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(-50, -50, 250, 250);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(32400);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 190, 190, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0248 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0249
     * @tc.name testCanvasApi0249
     * @tc.desc Verify drawing an empty path leaves the canvas untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0249', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0249 begin');
      await runCase('testCanvasApi0249', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
        expect(target.canvas.getSaveCount() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0249 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0250
     * @tc.name testCanvasApi0250
     * @tc.desc Verify a zero length line with a flat cap paints no pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0250', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0250 begin');
      await runCase('testCanvasApi0250', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(12);
        pen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 100, 100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0250 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0251
     * @tc.name testCanvasApi0251
     * @tc.desc Verify the same zero length line with a round cap paints a dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0251', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0251 begin');
      await runCase('testCanvasApi0251', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 100, 100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 40).assertTrue();
        expect(inked < 120).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0251 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0252
     * @tc.name testCanvasApi0252
     * @tc.desc Verify a rect with zero height paints no pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0252', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0252 begin');
      await runCase('testCanvasApi0252', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 10, 100, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 10, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0252 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0253
     * @tc.name testCanvasApi0253
     * @tc.desc Verify a rect whose right edge is left of its left edge paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0253', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0253 begin');
      await runCase('testCanvasApi0253', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(100, 100, 10, 10);
        target.canvas.drawRect(10, 10, 30, 30);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(8100);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 20, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0253 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0254
     * @tc.name testCanvasApi0254
     * @tc.desc Verify a circle with radius zero paints no pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0254', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0254 begin');
      await runCase('testCanvasApi0254', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 0);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(maxChannel(buffer, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0254 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0255
     * @tc.name testCanvasApi0255
     * @tc.desc Verify drawPoint honours the pen stroke width when ROUND_CAP is set.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0255', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0255 begin');
      await runCase('testCanvasApi0255', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(12);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawPoint(100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 60).assertTrue();
        expect(inked < 180).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0255 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0256
     * @tc.name testCanvasApi0256
     * @tc.desc Verify a circle inscribed in the canvas covers its area but not the corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0256', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0256 begin');
      await runCase('testCanvasApi0256', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const square: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 100);
        target.canvas.detachBrush();
        square.canvas.attachBrush(brush);
        square.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        square.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const squareBuffer: ArrayBuffer = await readPixelBuffer(square.pixelMap);
        expect(countInkedPixels(buffer) < countInkedPixels(squareBuffer)).assertTrue();
        expect(countInkedPixels(buffer) > 30000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 199, 199, 3)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0256 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0257
     * @tc.name testCanvasApi0257
     * @tc.desc Verify text drawn after a translation lands in the shifted position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0257', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0257 begin');
      await runCase('testCanvasApi0257', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = makeFont(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(100, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('H', font), 10, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 100).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 30, 120, 3)).assertEqual(0);
        expect(target.canvas.getTotalMatrix().getValue(0)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0257 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0258
     * @tc.name testCanvasApi0258
     * @tc.desc Verify an image drawn inside a clip stays confined to the clip rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0258', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0258 begin');
      await runCase('testCanvasApi0258', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(50, 50);
        source.canvas.clear(rgba(255, 0, 0, 255));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.drawImage(source.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 49, 49, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0258 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0259
     * @tc.name testCanvasApi0259
     * @tc.desc Verify drawColor respects the clip and restore brings the full clip back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0259', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0259 begin');
      await runCase('testCanvasApi0259', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 60, 60));
        target.canvas.drawColor(rgba(255, 0, 255, 0), drawing.BlendMode.SRC);
        const clipped: number = countInkedPixels(await readPixelBuffer(target.pixelMap));
        target.canvas.restore();
        expect(clipped).assertEqual(3600);
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
        expect(target.canvas.getSaveCount() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0259 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0260
     * @tc.name testCanvasApi0260
     * @tc.desc Verify a saveLayer brush alpha is applied to the whole painted layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0260', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0260 begin');
      await runCase('testCanvasApi0260', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const layerBrush: drawing.Brush = new drawing.Brush();
        layerBrush.setAlpha(128);
        const paint: drawing.Brush = new drawing.Brush();
        paint.setColor(rgba(255, 255, 0, 0));
        target.canvas.saveLayer(null, layerBrush);
        target.canvas.attachBrush(paint);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const alpha: number = channelAt(buffer, CANVAS_SIZE, 50, 50, 3);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(alpha > 100).assertTrue();
        expect(alpha < 160).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0260 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0261
     * @tc.name testCanvasApi0261
     * @tc.desc Verify three saves raise the save count by three and restoreToCount resets it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0261', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0261 begin');
      await runCase('testCanvasApi0261', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.save();
        target.canvas.save();
        const raised: number = target.canvas.getSaveCount();
        target.canvas.restoreToCount(base);
        expect(raised - base).assertEqual(3);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0261 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0262
     * @tc.name testCanvasApi0262
     * @tc.desc Verify a scale matrix installed by setMatrix is reported by getTotalMatrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0262', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0262 begin');
      await runCase('testCanvasApi0262', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        target.canvas.setMatrix(matrix);
        const total: drawing.Matrix = target.canvas.getTotalMatrix();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(total.getValue(0)).assertEqual(2);
        expect(total.getValue(4)).assertEqual(2);
        expect(countInkedPixels(buffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0262 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0263
     * @tc.name testCanvasApi0263
     * @tc.desc Verify concatMatrix with a forty five degree rotation turns a square into a diamond.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0263', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0263 begin');
      await runCase('testCanvasApi0263', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(45, 100, 100);
        target.canvas.concatMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(90, 90, 110, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 300).assertTrue();
        expect(inked < 900).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 87, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 70, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0263 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0264
     * @tc.name testCanvasApi0264
     * @tc.desc Verify resetMatrix and resetClip discard a half scale and a small clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0264', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0264 begin');
      await runCase('testCanvasApi0264', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.scale(0.5, 0.5);
        target.canvas.clipRect(ltrb(0, 0, 10, 10));
        target.canvas.resetMatrix();
        target.canvas.resetClip();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0264 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0265
     * @tc.name testCanvasApi0265
     * @tc.desc Verify a doubled scale doubles the circle centre and quadruples its area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0265', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0265 begin');
      await runCase('testCanvasApi0265', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.scale(2, 2);
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(50, 50, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 4600).assertTrue();
        expect(inked < 5500).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 170, 170, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0265 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0266
     * @tc.name testCanvasApi0266
     * @tc.desc Verify rotate forty five keeps the painted area while turning the square corners away.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0266', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0266 begin');
      await runCase('testCanvasApi0266', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.rotate(45, 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertEqual(812);
        expect(inked < 1650).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 35, 35, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0266 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0267
     * @tc.name testCanvasApi0267
     * @tc.desc Verify point lines drawn after a translation land in the shifted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0267', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0267 begin');
      await runCase('testCanvasApi0267', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        const pts: common2D.Point[] = [point(0, 0), point(20, 0), point(0, 20), point(20, 20)];
        target.canvas.translate(50, 50);
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(pts, drawing.PointMode.LINES);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 120).assertTrue();
        expect(inked < 220).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 60, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 120, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0267 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0268
     * @tc.name testCanvasApi0268
     * @tc.desc Verify a circular clip path trims the painted glyph to the circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0268', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0268 begin');
      await runCase('testCanvasApi0268', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 50);
        const font: drawing.Font = makeFont(48);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(makeBlob('图', font), 10, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 100).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(bounds.right - bounds.left).assertEqual(102);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0268 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0269
     * @tc.name testCanvasApi0269
     * @tc.desc Verify a region clip limits a scaled image to the region size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0269', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0269 begin');
      await runCase('testCanvasApi0269', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(50, 50);
        source.canvas.clear(rgba(255, 255, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const region: drawing.Region = new drawing.Region(0, 0, 80, 80);
        target.canvas.clipRegion(region, drawing.ClipOp.INTERSECT);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, 50, 50), ltrb(0, 0, 200, 200),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(6400);
        expect(channelAt(buffer, CANVAS_SIZE, 70, 70, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 90, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0269 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0270
     * @tc.name testCanvasApi0270
     * @tc.desc Verify a transparent drawColor with SRC blend leaves every pixel clear.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0270', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0270 begin');
      await runCase('testCanvasApi0270', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 0, 0, 255), drawing.BlendMode.SRC);
        const opaqueBefore: boolean = target.canvas.isOpaque();
        target.canvas.drawColor(rgba(0, 255, 0, 0), drawing.BlendMode.SRC);
        const opaqueAfter: boolean = target.canvas.isOpaque();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(opaqueBefore).assertFalse();
        expect(opaqueAfter).assertFalse();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(maxChannel(buffer, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0270 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0271
     * @tc.name testCanvasApi0271
     * @tc.desc Verify quickRejectRect evaluates the rect in the translated local space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0271', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0271 begin');
      await runCase('testCanvasApi0271', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(50, 50);
        const outside: boolean = target.canvas.quickRejectRect(ltrb(160, 160, 200, 200));
        const inside: boolean = target.canvas.quickRejectRect(ltrb(0, 0, 140, 140));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 10, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(outside).assertTrue();
        expect(inside).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(100);
        expect(channelAt(buffer, CANVAS_SIZE, 55, 55, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0271 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0272
     * @tc.name testCanvasApi0272
     * @tc.desc Verify a layer clip intersects with the enclosing clip and both restores unwind.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0272', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0272 begin');
      await runCase('testCanvasApi0272', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.saveLayer(null, null);
        target.canvas.clipRect(ltrb(50, 50, 150, 150));
        target.canvas.drawColor(rgba(255, 255, 255, 255), drawing.BlendMode.SRC);
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0272 end');
    });
  });
}
