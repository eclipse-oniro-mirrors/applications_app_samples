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

export default function canvasApiDeep4Test() {
  describe('CanvasApiDeep4Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0218
     * @tc.name testCanvasDeep0218
     * @tc.desc Verify a wide pen outlines a rect as a ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0218', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0218 begin');
      await runCase('testCanvasDeep0218', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(20, 20, 180, 180);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 6200 && inkAll(buffer) <= 6600).assertTrue();
        expect(chanAt(buffer, 100, 22, 3)).assertEqual(255);
        expect(inkRect(buffer, 90, 90, 110, 110)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0218 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0219
     * @tc.name testCanvasDeep0219
     * @tc.desc Verify a pen stroke paints over an attached brush fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0219', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0219 begin');
      await runCase('testCanvasDeep0219', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(10, 10, 190, 190);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 10, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0219 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0220
     * @tc.name testCanvasDeep0220
     * @tc.desc Verify one save layer matches a direct draw pixel for pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0220', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0220 begin');
      await runCase('testCanvasDeep0220', async () => {
        const layered: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        layered.canvas.saveLayer(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        layered.canvas.attachBrush(brush);
        layered.canvas.drawRect(20, 20, 180, 180);
        layered.canvas.detachBrush();
        layered.canvas.restore();
        const direct: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        direct.canvas.attachBrush(brush);
        direct.canvas.drawRect(20, 20, 180, 180);
        direct.canvas.detachBrush();
        const layeredBuffer: ArrayBuffer = await readPixelBuffer(layered.pixelMap);
        const directBuffer: ArrayBuffer = await readPixelBuffer(direct.pixelMap);
        expect(gapBytes(layeredBuffer, directBuffer)).assertEqual(0);
        expect(inkAll(layeredBuffer)).assertEqual(25600);
        expect(chanAt(layeredBuffer, 100, 100, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0220 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0221
     * @tc.name testCanvasDeep0221
     * @tc.desc Verify two nested save layers leave the same pixels as one layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0221', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0221 begin');
      await runCase('testCanvasDeep0221', async () => {
        const nested: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = nested.canvas.getSaveCount();
        nested.canvas.saveLayer(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        nested.canvas.saveLayer(ltrb(0, 0, 150, 150));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        nested.canvas.attachBrush(brush);
        nested.canvas.drawRect(0, 0, 100, 100);
        nested.canvas.detachBrush();
        nested.canvas.restore();
        nested.canvas.restore();
        const flat: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        flat.canvas.attachBrush(brush);
        flat.canvas.drawRect(0, 0, 100, 100);
        flat.canvas.detachBrush();
        const nestedBuffer: ArrayBuffer = await readPixelBuffer(nested.pixelMap);
        const flatBuffer: ArrayBuffer = await readPixelBuffer(flat.pixelMap);
        expect(gapBytes(nestedBuffer, flatBuffer)).assertEqual(0);
        expect(inkAll(nestedBuffer)).assertEqual(10000);
        expect(nested.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0221 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0222
     * @tc.name testCanvasDeep0222
     * @tc.desc Verify an explicit INTERSECT clip rect bounds the fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0222', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0222 begin');
      await runCase('testCanvasDeep0222', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(20, 20, 120, 120), drawing.ClipOp.INTERSECT, false);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 30, 30, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0222 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0223
     * @tc.name testCanvasDeep0223
     * @tc.desc Verify a DIFFERENCE clip rect keeps the right half only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0223', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0223 begin');
      await runCase('testCanvasDeep0223', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, CANVAS_SIZE), drawing.ClipOp.DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(chanAt(buffer, 50, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 150, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0223 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0224
     * @tc.name testCanvasDeep0224
     * @tc.desc Verify a DIFFERENCE clip path punches a square hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0224', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0224 begin');
      await runCase('testCanvasDeep0224', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const hole: drawing.Path = new drawing.Path();
        hole.addRect(ltrb(50, 50, 130, 130));
        target.canvas.clipPath(hole, drawing.ClipOp.DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(33600);
        expect(chanAt(buffer, 90, 90, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0224 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0225
     * @tc.name testCanvasDeep0225
     * @tc.desc Verify an INTERSECT clip path keeps a disc of ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0225', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0225 begin');
      await runCase('testCanvasDeep0225', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const disc: drawing.Path = new drawing.Path();
        disc.addCircle(100, 100, 60);
        target.canvas.clipPath(disc, drawing.ClipOp.INTERSECT, false);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 11000 && inkAll(buffer) <= 11600).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 30, 30, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0225 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0226
     * @tc.name testCanvasDeep0226
     * @tc.desc Verify a round rect with zero radius behaves like a plain rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0226', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0226 begin');
      await runCase('testCanvasDeep0226', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 0, 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0226 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0227
     * @tc.name testCanvasDeep0227
     * @tc.desc Verify a fully rounded rect turns into a disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0227', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0227 begin');
      await runCase('testCanvasDeep0227', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 30800 && inkAll(buffer) <= 31800).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 2, 2, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0227 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0228
     * @tc.name testCanvasDeep0228
     * @tc.desc Verify a nested round rect paints the ring between both boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0228', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0228 begin');
      await runCase('testCanvasDeep0228', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const outer: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 0, 0);
        const inner: drawing.RoundRect = new drawing.RoundRect(ltrb(40, 40, 160, 160), 0, 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawNestedRoundRect(outer, inner);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(25600);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0228 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0229
     * @tc.name testCanvasDeep0229
     * @tc.desc Verify a rounded nested round rect trims both corner sets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0229', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0229 begin');
      await runCase('testCanvasDeep0229', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const outer: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 30, 30);
        const inner: drawing.RoundRect = new drawing.RoundRect(ltrb(40, 40, 160, 160), 20, 20);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawNestedRoundRect(outer, inner);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 23000 && inkAll(buffer) <= 26200).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 2, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0229 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0230
     * @tc.name testCanvasDeep0230
     * @tc.desc Verify a translated round rect keeps its rounded shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0230', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0230 begin');
      await runCase('testCanvasDeep0230', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(80, 40);
        const shape: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 60, 60), 20, 20);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 3100 && inkAll(buffer) <= 3400).assertTrue();
        expect(chanAt(buffer, 110, 70, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0230 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0231
     * @tc.name testCanvasDeep0231
     * @tc.desc Verify a half scale transform halves the filled area twice over.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0231', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0231 begin');
      await runCase('testCanvasDeep0231', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.scale(0.5, 0.5);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0231 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0232
     * @tc.name testCanvasDeep0232
     * @tc.desc Verify a quarter turn maps a tall bar to a wide bar.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0232', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0232 begin');
      await runCase('testCanvasDeep0232', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.rotate(90, 100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(80, 20, 120, 180);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 6200 && inkAll(buffer) <= 6600).assertTrue();
        expect(chanAt(buffer, 40, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0232 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0233
     * @tc.name testCanvasDeep0233
     * @tc.desc Verify a horizontal skew shears the rect with the row height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0233', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0233 begin');
      await runCase('testCanvasDeep0233', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.skew(1, 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 2000 && inkAll(buffer) <= 3000).assertTrue();
        expect(chanAt(buffer, 75, 25, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 45, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0233 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0234
     * @tc.name testCanvasDeep0234
     * @tc.desc Verify concatenated scale and shift compose in call order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0234', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0234 begin');
      await runCase('testCanvasDeep0234', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(20, 0);
        target.canvas.concatMatrix(zoom);
        target.canvas.concatMatrix(shift);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(255);
        expect(target.canvas.getTotalMatrix().getValue(2)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0234 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0235
     * @tc.name testCanvasDeep0235
     * @tc.desc Verify replacing the matrix with the identity drops a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0235', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0235 begin');
      await runCase('testCanvasDeep0235', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(100, 100);
        target.canvas.setMatrix(new drawing.Matrix());
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 30, 30);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(900);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(target.canvas.getTotalMatrix().isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0235 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0236
     * @tc.name testCanvasDeep0236
     * @tc.desc Verify restoreToCount drops two clips at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0236', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0236 begin');
      await runCase('testCanvasDeep0236', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.restoreToCount(1);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0236 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0237
     * @tc.name testCanvasDeep0237
     * @tc.desc Verify four POINT mode vertices paint four separate dots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0237', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0237 begin');
      await runCase('testCanvasDeep0237', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dots: Array<common2D.Point> = [point(30, 30), point(90, 30), point(30, 90), point(90, 90)];
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(dots, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 180 && inkAll(buffer) <= 420).assertTrue();
        expect(chanAt(buffer, 30, 30, 3)).assertEqual(255);
        expect(inkRect(buffer, 45, 45, 75, 75)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0237 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0238
     * @tc.name testCanvasDeep0238
     * @tc.desc Verify POLYGON point mode closes the outline of a triangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0238', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0238 begin');
      await runCase('testCanvasDeep0238', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const corners: Array<common2D.Point> = [point(100, 40), point(160, 160), point(40, 160)];
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(corners, drawing.PointMode.POLYGON);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 700 && inkAll(buffer) <= 1100).assertTrue();
        expect(chanAt(buffer, 100, 120, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0238 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0239
     * @tc.name testCanvasDeep0239
     * @tc.desc Verify a text blob paints inside its measured advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0239', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0239 begin');
      await runCase('testCanvasDeep0239', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Wide', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 20, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const advance: number = font.measureText("Wide", drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(inkAll(buffer) > 300).assertTrue();
        expect(inkRect(buffer, 0, 0, 20, CANVAS_SIZE)).assertEqual(0);
        expect(advance > 40).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0239 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0240
     * @tc.name testCanvasDeep0240
     * @tc.desc Verify a stroked V path paints both arms only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0240', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0240 begin');
      await runCase('testCanvasDeep0240', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.lineTo(100, 40);
        shape.lineTo(180, 180);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1920);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0240 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0241
     * @tc.name testCanvasDeep0241
     * @tc.desc Verify a full arc strokes the whole ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0241', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0241 begin');
      await runCase('testCanvasDeep0241', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 2300 && inkAll(buffer) <= 2700).assertTrue();
        expect(chanAt(buffer, 100, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0241 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0242
     * @tc.name testCanvasDeep0242
     * @tc.desc Verify a pie fill covers the quarter sector.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0242', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0242 begin');
      await runCase('testCanvasDeep0242', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, true);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1700 && inkAll(buffer) <= 2200).assertTrue();
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(255);
        expect(chanAt(buffer, 80, 80, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0242 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0243
     * @tc.name testCanvasDeep0243
     * @tc.desc Verify a chord fill leaves the centre empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0243', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0243 begin');
      await runCase('testCanvasDeep0243', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, false);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(688);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(inkRect(buffer, 50, 50, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0243 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0244
     * @tc.name testCanvasDeep0244
     * @tc.desc Verify a clip halves a stroked ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0244', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0244 begin');
      await runCase('testCanvasDeep0244', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, CANVAS_SIZE));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(941);
        expect(chanAt(buffer, 100, 52, 3)).assertEqual(0);
        expect(chanAt(buffer, 150, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0244 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0245
     * @tc.name testCanvasDeep0245
     * @tc.desc Verify a wide horizontal stroke keeps a solid band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0245', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0245 begin');
      await runCase('testCanvasDeep0245', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 3000 && inkAll(buffer) <= 3400).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, 80)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0245 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0246
     * @tc.name testCanvasDeep0246
     * @tc.desc Verify a thin vertical stroke paints one narrow column.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0246', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0246 begin');
      await runCase('testCanvasDeep0246', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 20, 100, 180);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 580 && inkAll(buffer) <= 700).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, 97, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0246 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0247
     * @tc.name testCanvasDeep0247
     * @tc.desc Verify a half transparent brush keeps a uniform alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0247', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0247 begin');
      await runCase('testCanvasDeep0247', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setAlpha(128);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 3) >= 120 && chanAt(buffer, 100, 100, 3) <= 136).assertTrue();
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0247 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0248
     * @tc.name testCanvasDeep0248
     * @tc.desc Verify two half transparent fills stack into a denser alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0248', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0248 begin');
      await runCase('testCanvasDeep0248', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 3) >= 180 && chanAt(buffer, 100, 100, 3) <= 205).assertTrue();
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(192);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0248 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0249
     * @tc.name testCanvasDeep0249
     * @tc.desc Verify SRC blend overwrites the pixels it covers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0249', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0249 begin');
      await runCase('testCanvasDeep0249', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        brush.setColor(rgba(255, 0, 255, 0));
        brush.setBlendMode(drawing.BlendMode.SRC);
        target.canvas.drawRect(0, 0, 100, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 50, 100, 1)).assertEqual(0);
        expect(chanAt(buffer, 50, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 150, 100, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0249 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0250
     * @tc.name testCanvasDeep0250
     * @tc.desc Verify CLEAR blend erases the half it covers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0250', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0250 begin');
      await runCase('testCanvasDeep0250', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        brush.setBlendMode(drawing.BlendMode.CLEAR);
        target.canvas.drawRect(0, 0, 100, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 50, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0250 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0251
     * @tc.name testCanvasDeep0251
     * @tc.desc Verify a brush fill covers a drawColor background.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0251', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0251 begin');
      await runCase('testCanvasDeep0251', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 255, 0, 0), drawing.BlendMode.SRC);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(chanAt(buffer, 10, 10, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0251 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0252
     * @tc.name testCanvasDeep0252
     * @tc.desc Verify drawColor respects an active clip rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0252', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0252 begin');
      await runCase('testCanvasDeep0252', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.drawColor(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 50, 50, 1)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0252 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0253
     * @tc.name testCanvasDeep0253
     * @tc.desc Verify a clip inside a save layer stays inside the layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0253', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0253 begin');
      await runCase('testCanvasDeep0253', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.saveLayer(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.clipRect(ltrb(0, 0, 80, 80));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0253 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0254
     * @tc.name testCanvasDeep0254
     * @tc.desc Verify quickRejectRect follows the translated clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0254', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0254 begin');
      await runCase('testCanvasDeep0254', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(50, 50);
        target.canvas.clipRect(ltrb(0, 0, 60, 60));
        expect(target.canvas.quickRejectRect(ltrb(120, 120, 140, 140))).assertTrue();
        expect(target.canvas.quickRejectRect(ltrb(60, 60, 100, 100))).assertFalse();
        expect(near(target.canvas.getLocalClipBounds().right, 60, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0254 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0255
     * @tc.name testCanvasDeep0255
     * @tc.desc Verify the local clip bounds ignore the translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0255', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0255 begin');
      await runCase('testCanvasDeep0255', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(30, 40);
        target.canvas.clipRect(ltrb(10, 10, 70, 90));
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.left, 10, 1)).assertTrue();
        expect(near(bounds.top, 10, 1)).assertTrue();
        expect(bounds.right - bounds.left).assertEqual(62);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0255 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0256
     * @tc.name testCanvasDeep0256
     * @tc.desc Verify a cubic path stays inside its endpoint bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0256', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0256 begin');
      await runCase('testCanvasDeep0256', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.cubicTo(30, 60, 170, 60, 170, 170);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1467);
        expect(shape.getBounds().left).assertEqual(30);
        expect(shape.getBounds().right).assertEqual(170);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0256 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0257
     * @tc.name testCanvasDeep0257
     * @tc.desc Verify a path with a rect and a circle fills both parts.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0257', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0257 begin');
      await runCase('testCanvasDeep0257', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        shape.addCircle(150, 50, 50);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 17400 && inkAll(buffer) <= 18200).assertTrue();
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0257 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0258
     * @tc.name testCanvasDeep0258
     * @tc.desc Verify offsetting a path moves the filled pixels with it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0258', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0258 begin');
      await runCase('testCanvasDeep0258', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 50, 50));
        shape.offset(80, 60);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 100, 80, 3)).assertEqual(0);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0258 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0259
     * @tc.name testCanvasDeep0259
     * @tc.desc Verify transforming a path scales its filled area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0259', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0259 begin');
      await runCase('testCanvasDeep0259', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 40, 40));
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        shape.transform(zoom);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(255);
        expect(shape.getBounds().right).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0259 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0260
     * @tc.name testCanvasDeep0260
     * @tc.desc Verify drawRegion follows a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0260', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0260 begin');
      await runCase('testCanvasDeep0260', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(50, 50);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRegion(new drawing.Region(0, 0, 50, 50));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 70, 70, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0260 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0261
     * @tc.name testCanvasDeep0261
     * @tc.desc Verify filling an empty path paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0261', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0261 begin');
      await runCase('testCanvasDeep0261', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.isEmpty()).assertTrue();
        expect(inkAll(buffer)).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0261 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0262
     * @tc.name testCanvasDeep0262
     * @tc.desc Verify the save count returns to its base after paired calls.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0262', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0262 begin');
      await runCase('testCanvasDeep0262', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.save();
        const inner: number = target.canvas.getSaveCount();
        target.canvas.restore();
        const after: number = target.canvas.getSaveCount();
        target.canvas.restore();
        expect(inner).assertEqual(base + 2);
        expect(after).assertEqual(base + 1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0262 end');
    });

  });
}
