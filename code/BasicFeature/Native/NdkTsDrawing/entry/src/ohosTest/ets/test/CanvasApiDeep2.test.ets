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
import { DRAWING_TAG, near, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const CANVAS_SIZE: number = 200;

/**
 * Read one color channel of a pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function chanAt(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * CANVAS_SIZE + x) * 4 + channel];
}

/**
 * Count the pixels carrying a non zero alpha channel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of painted pixels.
 */
function inkAll(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > 0) {
      count++;
    }
  }
  return count;
}

/**
 * Count the painted pixels inside one axis aligned box.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of painted pixels inside the box.
 */
function inkRect(buffer: ArrayBuffer, left: number, top: number, right: number, bottom: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      if (bytes[(y * CANVAS_SIZE + x) * 4 + 3] > 0) {
        count++;
      }
    }
  }
  return count;
}

/**
 * Count the byte positions where two buffers differ.
 *
 * @param { ArrayBuffer } first - First raw RGBA_8888 buffer.
 * @param { ArrayBuffer } second - Second raw RGBA_8888 buffer.
 * @returns { number } Number of differing bytes.
 */
function gapBytes(first: ArrayBuffer, second: ArrayBuffer): number {
  const left: Uint8Array = new Uint8Array(first);
  const right: Uint8Array = new Uint8Array(second);
  let gap: number = 0;
  for (let index: number = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      gap++;
    }
  }
  return gap;
}

export default function canvasApiDeep2Test() {
  describe('CanvasApiDeep2Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0071
     * @tc.name testCanvasDeep0071
     * @tc.desc Verify a quarter arc paints a small piece of the disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0071 begin');
      await runCase('testCanvasDeep0071', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 600).assertTrue();
        expect(inkAll(buffer) <= 2100).assertTrue();
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0072
     * @tc.name testCanvasDeep0072
     * @tc.desc Verify a half arc paints half of the disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0072 begin');
      await runCase('testCanvasDeep0072', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 180);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 3700).assertTrue();
        expect(inkAll(buffer) <= 4000).assertTrue();
        expect(chanAt(buffer, 100, 45, 3)).assertEqual(0);
        expect(brush.getColor().green).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0073
     * @tc.name testCanvasDeep0073
     * @tc.desc Verify a full arc equals a full circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0073 begin');
      await runCase('testCanvasDeep0073', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7600).assertTrue();
        expect(inkAll(buffer) <= 8100).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 50, 50, 150, 150)).assertEqual(inkAll(buffer));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0074
     * @tc.name testCanvasDeep0074
     * @tc.desc Verify a two turn sweep paints the same disc as one turn.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0074 begin');
      await runCase('testCanvasDeep0074', async () => {
        const once: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const twice: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        once.canvas.attachBrush(brush);
        once.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        once.canvas.detachBrush();
        twice.canvas.attachBrush(brush);
        twice.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 720);
        twice.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(once.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(twice.pixelMap);
        expect(inkAll(left)).assertEqual(inkAll(right));
        expect(inkAll(left) >= 7600).assertTrue();
        expect(chanAt(right, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0075
     * @tc.name testCanvasDeep0075
     * @tc.desc Verify a negative sweep paints the mirrored quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0075 begin');
      await runCase('testCanvasDeep0075', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, -90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 600).assertTrue();
        expect(inkAll(buffer) <= 2100).assertTrue();
        expect(chanAt(buffer, 100, 190, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0076
     * @tc.name testCanvasDeep0076
     * @tc.desc Verify an arc with zero sweep paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0076 begin');
      await runCase('testCanvasDeep0076', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 45, 0);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0077
     * @tc.name testCanvasDeep0077
     * @tc.desc Verify a one degree sweep paints far less than a quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0077 begin');
      await runCase('testCanvasDeep0077', async () => {
        const tiny: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const wide: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        tiny.canvas.attachBrush(brush);
        tiny.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 1);
        tiny.canvas.detachBrush();
        wide.canvas.attachBrush(brush);
        wide.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 90);
        wide.canvas.detachBrush();
        const small: ArrayBuffer = await readPixelBuffer(tiny.pixelMap);
        const large: ArrayBuffer = await readPixelBuffer(wide.pixelMap);
        expect(inkAll(small) <= 120).assertTrue();
        expect(inkAll(large) > inkAll(small)).assertTrue();
        expect(inkAll(large) <= 2100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0078
     * @tc.name testCanvasDeep0078
     * @tc.desc Verify a quarter arc with anti alias disabled stays solid.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0078 begin');
      await runCase('testCanvasDeep0078', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setAntiAlias(false);
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(brush.isAntiAlias()).assertFalse();
        expect(inkAll(buffer) >= 600).assertTrue();
        expect(inkAll(buffer) <= 2100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0079
     * @tc.name testCanvasDeep0079
     * @tc.desc Verify a stroked quarter arc leaves the centre empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0079 begin');
      await runCase('testCanvasDeep0079', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 90);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 200).assertTrue();
        expect(inkAll(buffer) <= 900).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0080
     * @tc.name testCanvasDeep0080
     * @tc.desc Verify an arc with zero radius paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0080 begin');
      await runCase('testCanvasDeep0080', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        const box: common2D.Rect = ltrb(100, 100, 100, 100);
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(box, 0, 90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(box.right).assertEqual(box.left);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0081
     * @tc.name testCanvasDeep0081
     * @tc.desc Verify an arc centred on the origin paints a small wedge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0081 begin');
      await runCase('testCanvasDeep0081', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(-50, -50, 50, 50), 0, 90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) <= 2100).assertTrue();
        expect(inkAll(buffer) >= 0).assertTrue();
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0082
     * @tc.name testCanvasDeep0082
     * @tc.desc Verify an arc from ninety to one eighty paints the lower left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0082 begin');
      await runCase('testCanvasDeep0082', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 90, 90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 600).assertTrue();
        expect(inkAll(buffer) <= 2100).assertTrue();
        expect(inkRect(buffer, 150, 0, 200, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0083
     * @tc.name testCanvasDeep0083
     * @tc.desc Verify four quarter arcs paint a full disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0083 begin');
      await runCase('testCanvasDeep0083', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        const box: common2D.Rect = ltrb(50, 50, 150, 150);
        for (let quarter: number = 0; quarter < 4; quarter++) {
          target.canvas.drawArc(box, quarter * 90, 90);
        }
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2856);
        expect(inkAll(buffer) <= 8100).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0084
     * @tc.name testCanvasDeep0084
     * @tc.desc Verify a three hundred forty degree arc falls short of a full disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0084 begin');
      await runCase('testCanvasDeep0084', async () => {
        const almost: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const full: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        almost.canvas.attachBrush(brush);
        almost.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 340);
        almost.canvas.detachBrush();
        full.canvas.attachBrush(brush);
        full.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        full.canvas.detachBrush();
        const short: ArrayBuffer = await readPixelBuffer(almost.pixelMap);
        const whole: ArrayBuffer = await readPixelBuffer(full.pixelMap);
        expect(inkAll(short) < inkAll(whole)).assertTrue();
        expect(inkAll(short) >= 7000).assertTrue();
        expect(gapBytes(short, whole) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0085
     * @tc.name testCanvasDeep0085
     * @tc.desc Verify the pie mode quarter arc fills a wedge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0085 begin');
      await runCase('testCanvasDeep0085', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, true);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1800).assertTrue();
        expect(inkAll(buffer) <= 2100).assertTrue();
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0086
     * @tc.name testCanvasDeep0086
     * @tc.desc Verify the chord mode quarter arc fills less than the pie.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0086 begin');
      await runCase('testCanvasDeep0086', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, false);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 600).assertTrue();
        expect(inkAll(buffer) <= 900).assertTrue();
        expect(chanAt(buffer, 112, 112, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0087
     * @tc.name testCanvasDeep0087
     * @tc.desc Verify the pie mode with zero sweep paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0087 begin');
      await runCase('testCanvasDeep0087', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(20, 20, 180, 180), 30, 0, true);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0088
     * @tc.name testCanvasDeep0088
     * @tc.desc Verify the chord mode half arc keeps a flat edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0088 begin');
      await runCase('testCanvasDeep0088', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 180, false);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 3700).assertTrue();
        expect(inkAll(buffer) <= 4000).assertTrue();
        expect(chanAt(buffer, 100, 45, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0089
     * @tc.name testCanvasDeep0089
     * @tc.desc Verify the stroked chord arc paints only the rim.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0089 begin');
      await runCase('testCanvasDeep0089', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 180, 180, false);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 55, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0090
     * @tc.name testCanvasDeep0090
     * @tc.desc Verify the pie mode full turn fills the disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0090 begin');
      await runCase('testCanvasDeep0090', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 360, true);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7600).assertTrue();
        expect(inkAll(buffer) <= 8100).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, 50, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0091
     * @tc.name testCanvasDeep0091
     * @tc.desc Verify two half pies paint a full disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0091 begin');
      await runCase('testCanvasDeep0091', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(40, 40, 160, 160), 0, 180, true);
        target.canvas.drawArcWithCenter(ltrb(40, 40, 160, 160), 180, 180, true);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 11000).assertTrue();
        expect(inkAll(buffer) <= 11700).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0092
     * @tc.name testCanvasDeep0092
     * @tc.desc Verify a rectangle path fills its box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0092 begin');
      await runCase('testCanvasDeep0092', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 120, 120));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0093
     * @tc.name testCanvasDeep0093
     * @tc.desc Verify a triangle path fills its area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0093 begin');
      await runCase('testCanvasDeep0093', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(110, 10);
        path.lineTo(10, 110);
        path.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 4800 && inkAll(buffer) <= 5200).assertTrue();
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0094
     * @tc.name testCanvasDeep0094
     * @tc.desc Verify a circle path fills a disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0094 begin');
      await runCase('testCanvasDeep0094', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 50);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7700 && inkAll(buffer) <= 8000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0095
     * @tc.name testCanvasDeep0095
     * @tc.desc Verify an empty path paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0095 begin');
      await runCase('testCanvasDeep0095', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0096
     * @tc.name testCanvasDeep0096
     * @tc.desc Verify two rect contours in one path paint a union.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0096 begin');
      await runCase('testCanvasDeep0096', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 50, 50));
        path.addRect(ltrb(70, 70, 110, 110));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(3200);
        expect(chanAt(buffer, 30, 30, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0097
     * @tc.name testCanvasDeep0097
     * @tc.desc Verify the even odd fill leaves the inner rect empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0097 begin');
      await runCase('testCanvasDeep0097', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 180, 180));
        path.addRect(ltrb(60, 60, 140, 140));
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(19200);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0098
     * @tc.name testCanvasDeep0098
     * @tc.desc Verify the inverse winding fill covers the outside of the contours.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0098 begin');
      await runCase('testCanvasDeep0098', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 180, 180));
        path.addRect(ltrb(60, 60, 140, 140));
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(14400);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0099
     * @tc.name testCanvasDeep0099
     * @tc.desc Verify an offset path paints the shifted box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0099 begin');
      await runCase('testCanvasDeep0099', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 60, 60));
        path.offset(90, 90);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0100
     * @tc.name testCanvasDeep0100
     * @tc.desc Verify a scaled path paints a bigger box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0100 begin');
      await runCase('testCanvasDeep0100', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 60, 60));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        path.transform(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 15, 15, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0101
     * @tc.name testCanvasDeep0101
     * @tc.desc Verify a round rect path trims the corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0101 begin');
      await runCase('testCanvasDeep0101', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 180, 180), 30, 30);
        path.addRoundRect(roundRect);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) > 22000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0102
     * @tc.name testCanvasDeep0102
     * @tc.desc Verify an oval path fills an ellipse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0102 begin');
      await runCase('testCanvasDeep0102', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addOval(ltrb(20, 60, 180, 140), 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 9500 && inkAll(buffer) <= 10300).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 25, 65, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0103
     * @tc.name testCanvasDeep0103
     * @tc.desc Verify a stroked path outline leaves the centre empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0103 begin');
      await runCase('testCanvasDeep0103', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(50, 50, 150, 150));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 50, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 700).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0104
     * @tc.name testCanvasDeep0104
     * @tc.desc Verify two separate contours keep their own areas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0104 begin');
      await runCase('testCanvasDeep0104', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 50, 200));
        path.addRect(ltrb(150, 0, 200, 200));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 50, 200)).assertEqual(10000);
        expect(inkRect(buffer, 150, 0, 200, 200)).assertEqual(10000);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0105
     * @tc.name testCanvasDeep0105
     * @tc.desc Verify drawing the same path twice keeps the same coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0105 begin');
      await runCase('testCanvasDeep0105', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(30, 30, 170, 170));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(path);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(path);
        second.canvas.drawPath(path);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left)).assertEqual(19600);
        expect(chanAt(left, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0106
     * @tc.name testCanvasDeep0106
     * @tc.desc Verify a text blob paints a glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasDeep0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0106 begin');
      await runCase('testCanvasDeep0106', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('H', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 20, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 20).assertTrue();
        expect(inkAll(buffer) < 8000).assertTrue();
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0107
     * @tc.name testCanvasDeep0107
     * @tc.desc Verify a text blob at another offset paints elsewhere.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0107 begin');
      await runCase('testCanvasDeep0107', async () => {
        const left: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const right: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('H', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        left.canvas.attachBrush(brush);
        left.canvas.drawTextBlob(blob, 10, 100);
        left.canvas.detachBrush();
        right.canvas.attachBrush(brush);
        right.canvas.drawTextBlob(blob, 120, 100);
        right.canvas.detachBrush();
        const near: ArrayBuffer = await readPixelBuffer(left.pixelMap);
        const far: ArrayBuffer = await readPixelBuffer(right.pixelMap);
        expect(inkAll(near) > 0).assertTrue();
        expect(gapBytes(near, far) > 0).assertTrue();
        expect(chanAt(far, 195, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0108
     * @tc.name testCanvasDeep0108
     * @tc.desc Verify a single character paints a glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0108 begin');
      await runCase('testCanvasDeep0108', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('A', font, 30, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 20).assertTrue();
        expect(chanAt(buffer, 100, 100, 3) >= 0).assertTrue();
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0109
     * @tc.name testCanvasDeep0109
     * @tc.desc Verify a larger font paints more ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0109 begin');
      await runCase('testCanvasDeep0109', async () => {
        const small: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const large: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const tiny: drawing.Font = new drawing.Font();
        tiny.setSize(20);
        const big: drawing.Font = new drawing.Font();
        big.setSize(60);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        small.canvas.attachBrush(brush);
        small.canvas.drawSingleCharacter('A', tiny, 20, 120);
        small.canvas.detachBrush();
        large.canvas.attachBrush(brush);
        large.canvas.drawSingleCharacter('A', big, 20, 120);
        large.canvas.detachBrush();
        const few: ArrayBuffer = await readPixelBuffer(small.pixelMap);
        const many: ArrayBuffer = await readPixelBuffer(large.pixelMap);
        expect(inkAll(many) > inkAll(few)).assertTrue();
        expect(inkAll(few) > 0).assertTrue();
        expect(big.getSize()).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0110
     * @tc.name testCanvasDeep0110
     * @tc.desc Verify a stroked text blob paints an outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0110 begin');
      await runCase('testCanvasDeep0110', async () => {
        const stroked: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const filled: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('B', font);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(2);
        stroked.canvas.attachPen(pen);
        stroked.canvas.drawTextBlob(blob, 40, 120);
        stroked.canvas.detachPen();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        filled.canvas.attachBrush(brush);
        filled.canvas.drawTextBlob(blob, 40, 120);
        filled.canvas.detachBrush();
        const thin: ArrayBuffer = await readPixelBuffer(stroked.pixelMap);
        const solid: ArrayBuffer = await readPixelBuffer(filled.pixelMap);
        expect(inkAll(thin) > 0).assertTrue();
        expect(inkAll(solid)).assertEqual(544);
        expect(pen.getColor().red).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0111
     * @tc.name testCanvasDeep0111
     * @tc.desc Verify a semi transparent text blob differs from an opaque one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0111 begin');
      await runCase('testCanvasDeep0111', async () => {
        const solid: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const faded: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('C', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        solid.canvas.attachBrush(brush);
        solid.canvas.drawTextBlob(blob, 40, 120);
        solid.canvas.detachBrush();
        brush.setAlpha(128);
        faded.canvas.attachBrush(brush);
        faded.canvas.drawTextBlob(blob, 40, 120);
        faded.canvas.detachBrush();
        const full: ArrayBuffer = await readPixelBuffer(solid.pixelMap);
        const half: ArrayBuffer = await readPixelBuffer(faded.pixelMap);
        expect(brush.getAlpha()).assertEqual(128);
        expect(gapBytes(full, half) > 0).assertTrue();
        expect(inkAll(full) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0112
     * @tc.name testCanvasDeep0112
     * @tc.desc Verify a text path built by the font paints ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0112 begin');
      await runCase('testCanvasDeep0112', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const outline: drawing.Path = font.getTextPath('Hi', 2, 10, 120);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(outline);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 20).assertTrue();
        expect(outline.isEmpty()).assertFalse();
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0113
     * @tc.name testCanvasDeep0113
     * @tc.desc Verify two identical text blobs paint the same coverage as one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0113 begin');
      await runCase('testCanvasDeep0113', async () => {
        const once: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const twice: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('D', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        once.canvas.attachBrush(brush);
        once.canvas.drawTextBlob(blob, 60, 120);
        once.canvas.detachBrush();
        twice.canvas.attachBrush(brush);
        twice.canvas.drawTextBlob(blob, 60, 120);
        twice.canvas.drawTextBlob(blob, 60, 120);
        twice.canvas.detachBrush();
        const single: ArrayBuffer = await readPixelBuffer(once.pixelMap);
        const pair: ArrayBuffer = await readPixelBuffer(twice.pixelMap);
        expect(Math.abs(inkAll(single) - inkAll(pair)) <= 40).assertTrue();
        expect(inkAll(single) > 20).assertTrue();
        expect(inkAll(pair) > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0114
     * @tc.name testCanvasDeep0114
     * @tc.desc Verify a text blob outside the canvas paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0114 begin');
      await runCase('testCanvasDeep0114', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('E', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 600, 600);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0115
     * @tc.name testCanvasDeep0115
     * @tc.desc Verify a text blob with a transparent brush paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0115 begin');
      await runCase('testCanvasDeep0115', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('F', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(0, 0, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 40, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(0);
        expect(chanAt(buffer, 60, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0116
     * @tc.name testCanvasDeep0116
     * @tc.desc Verify two characters paint more ink than one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0116 begin');
      await runCase('testCanvasDeep0116', async () => {
        const one: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const two: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        one.canvas.attachBrush(brush);
        one.canvas.drawTextBlob(drawing.TextBlob.makeFromString('H', font), 20, 120);
        one.canvas.detachBrush();
        two.canvas.attachBrush(brush);
        two.canvas.drawTextBlob(drawing.TextBlob.makeFromString('HH', font), 20, 120);
        two.canvas.detachBrush();
        const single: ArrayBuffer = await readPixelBuffer(one.pixelMap);
        const both: ArrayBuffer = await readPixelBuffer(two.pixelMap);
        expect(inkAll(both) > inkAll(single)).assertTrue();
        expect(inkAll(single) > 20).assertTrue();
        expect(font.getSize()).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0117
     * @tc.name testCanvasDeep0117
     * @tc.desc Verify save raises the save count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0117 begin');
      await runCase('testCanvasDeep0117', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        const saved: number = target.canvas.save();
        expect(target.canvas.getSaveCount()).assertEqual(base + 1);
        expect(saved).assertEqual(1);
        expect(base >= 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0118
     * @tc.name testCanvasDeep0118
     * @tc.desc Verify each restore drops exactly one level of translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0118 begin');
      await runCase('testCanvasDeep0118', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.translate(100, 0);
        target.canvas.save();
        target.canvas.translate(0, 100);
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.restore();
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.restore();
        target.canvas.drawRect(0, 0, 10, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2100);
        expect(chanAt(buffer, 110, 110, 3)).assertEqual(255);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0119
     * @tc.name testCanvasDeep0119
     * @tc.desc Verify a translation inside save does not leak past restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0119 begin');
      await runCase('testCanvasDeep0119', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.translate(100, 100);
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.restore();
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(3200);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0120
     * @tc.name testCanvasDeep0120
     * @tc.desc Verify saveLayer raises the save count as well.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0120 begin');
      await runCase('testCanvasDeep0120', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.saveLayer(ltrb(0, 0, 100, 100));
        expect(target.canvas.getSaveCount()).assertEqual(base + 1);
        target.canvas.restore();
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0121
     * @tc.name testCanvasDeep0121
     * @tc.desc Verify restoreToCount returns to the base level.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0121 begin');
      await runCase('testCanvasDeep0121', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.save();
        target.canvas.save();
        const deep: number = target.canvas.getSaveCount();
        target.canvas.restoreToCount(base);
        expect(deep).assertEqual(base + 3);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(base >= 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0122
     * @tc.name testCanvasDeep0122
     * @tc.desc Verify a translation moves the painted box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0122 begin');
      await runCase('testCanvasDeep0122', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.translate(50, 50);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 70, 70, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0123
     * @tc.name testCanvasDeep0123
     * @tc.desc Verify a scale doubles the painted box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0123 begin');
      await runCase('testCanvasDeep0123', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.scale(2, 2);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 110, 110, 3)).assertEqual(255);
        expect(chanAt(buffer, 15, 15, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0124
     * @tc.name testCanvasDeep0124
     * @tc.desc Verify a rotation about the centre turns the square into a diamond.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0124 begin');
      await runCase('testCanvasDeep0124', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.translate(100, 100);
        target.canvas.rotate(45, 0, 0);
        target.canvas.drawRect(-20, -20, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1400 && inkAll(buffer) <= 1800).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0125
     * @tc.name testCanvasDeep0125
     * @tc.desc Verify a skew shifts the painted rows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0125 begin');
      await runCase('testCanvasDeep0125', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.skew(1, 0);
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1400 && inkAll(buffer) <= 1800).assertTrue();
        expect(chanAt(buffer, 55, 20, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 90, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0126
     * @tc.name testCanvasDeep0126
     * @tc.desc Verify a concatenated matrix translates the box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0126 begin');
      await runCase('testCanvasDeep0126', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(30, 40);
        target.canvas.concatMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 60, 70, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0127
     * @tc.name testCanvasDeep0127
     * @tc.desc Verify the total matrix reports a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0127 begin');
      await runCase('testCanvasDeep0127', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(25, 35);
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(matrix.getValue(2)).assertEqual(25);
        expect(matrix.getValue(5)).assertEqual(35);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0128
     * @tc.name testCanvasDeep0128
     * @tc.desc Verify resetting the matrix returns the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0128 begin');
      await runCase('testCanvasDeep0128', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(40, 40);
        target.canvas.scale(2, 2);
        target.canvas.resetMatrix();
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(2)).assertEqual(0);
        expect(matrix.getValue(0)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0129
     * @tc.name testCanvasDeep0129
     * @tc.desc Verify three nested saves stack on top of the base level.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0129 begin');
      await runCase('testCanvasDeep0129', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.translate(10, 10);
        target.canvas.save();
        target.canvas.scale(2, 2);
        target.canvas.save();
        target.canvas.rotate(15, 0, 0);
        expect(target.canvas.getSaveCount()).assertEqual(base + 3);
        target.canvas.restoreToCount(base);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(target.canvas.getTotalMatrix().isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0130
     * @tc.name testCanvasDeep0130
     * @tc.desc Verify restoring every level brings the identity back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0130 begin');
      await runCase('testCanvasDeep0130', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.translate(60, 60);
        target.canvas.save();
        target.canvas.rotate(30, 0, 0);
        target.canvas.restore();
        target.canvas.restore();
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0131
     * @tc.name testCanvasDeep0131
     * @tc.desc Verify drawing after restore uses the original origin again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0131 begin');
      await runCase('testCanvasDeep0131', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.translate(100, 0);
        target.canvas.restore();
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(400);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(chanAt(buffer, 110, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0132
     * @tc.name testCanvasDeep0132
     * @tc.desc Verify a clip rect limits the painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0132 begin');
      await runCase('testCanvasDeep0132', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(20, 20, 120, 120));
        target.canvas.clear(rgba(255, 255, 0, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0133
     * @tc.name testCanvasDeep0133
     * @tc.desc Verify resetting the clip restores the full canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0133 begin');
      await runCase('testCanvasDeep0133', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(20, 20, 120, 120));
        target.canvas.resetClip();
        target.canvas.clear(rgba(255, 0, 0, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(target.canvas.isClipEmpty()).assertFalse();
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0134
     * @tc.name testCanvasDeep0134
     * @tc.desc Verify an empty clip rect paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0134 begin');
      await runCase('testCanvasDeep0134', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 0, 0));
        target.canvas.clear(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.isClipEmpty()).assertTrue();
        expect(inkAll(buffer)).assertEqual(0);
        expect(near(target.canvas.getLocalClipBounds().right, 0, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0135
     * @tc.name testCanvasDeep0135
     * @tc.desc Verify a circular clip intersects the paint area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0135 begin');
      await runCase('testCanvasDeep0135', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addCircle(100, 100, 50);
        target.canvas.clipPath(clip);
        target.canvas.clear(rgba(255, 0, 0, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7700 && inkAll(buffer) <= 8000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0136
     * @tc.name testCanvasDeep0136
     * @tc.desc Verify a round rect clip keeps its corners empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0136 begin');
      await runCase('testCanvasDeep0136', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 180, 180), 30, 30);
        target.canvas.clipRoundRect(roundRect);
        target.canvas.clear(rgba(255, 255, 0, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) > 22000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0136 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0137
     * @tc.name testCanvasDeep0137
     * @tc.desc Verify a region clip limits the paint area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0137 begin');
      await runCase('testCanvasDeep0137', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const region: drawing.Region = new drawing.Region();
        region.setRect(50, 50, 150, 150);
        target.canvas.clipRegion(region);
        target.canvas.clear(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0138
     * @tc.name testCanvasDeep0138
     * @tc.desc Verify two clips intersect each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0138 begin');
      await runCase('testCanvasDeep0138', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 200));
        target.canvas.clipRect(ltrb(50, 0, 200, 200));
        target.canvas.clear(rgba(255, 0, 0, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(near(target.canvas.getLocalClipBounds().left, 50, 1)).assertTrue();
        expect(near(target.canvas.getLocalClipBounds().right, 100, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0139
     * @tc.name testCanvasDeep0139
     * @tc.desc Verify the clip bounds report the clipped box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0139 begin');
      await runCase('testCanvasDeep0139', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(20, 30, 120, 130));
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.left, 20, 1)).assertTrue();
        expect(near(bounds.top, 30, 1)).assertTrue();
        expect(near(bounds.right, 120, 1)).assertTrue();
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0140
     * @tc.name testCanvasDeep0140
     * @tc.desc Verify a background brush fills the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0140 begin');
      await runCase('testCanvasDeep0140', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.drawBackground(brush);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 0)).assertEqual(255);
        expect(chanAt(buffer, 199, 199, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0141
     * @tc.name testCanvasDeep0141
     * @tc.desc Verify a semi transparent background keeps its alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0141 begin');
      await runCase('testCanvasDeep0141', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 0, 255, 0));
        target.canvas.drawBackground(brush);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 3) >= 120 && chanAt(buffer, 100, 100, 3) <= 136).assertTrue();
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0142
     * @tc.name testCanvasDeep0142
     * @tc.desc Verify drawColor over existing content blends.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0142 begin');
      await runCase('testCanvasDeep0142', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(255, 0, 0, 255));
        target.canvas.drawColor(128, 255, 0, 0);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(128);
        expect(inkAll(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0143
     * @tc.name testCanvasDeep0143
     * @tc.desc Verify a source blend replaces the existing content.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0143 begin');
      await runCase('testCanvasDeep0143', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(255, 255, 0, 0));
        target.canvas.drawColor(rgba(255, 0, 0, 255), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0143 end');
    });

  });
}
