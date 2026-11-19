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
import { DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

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

export default function pathApiDeep3Test() {
  describe('PathApiDeep3Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0411
     * @tc.name testPathDeep0411
     * @tc.desc Verify clipping with a path keeps the fill inside the same path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0411', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0411 begin');
      await runCase('testPathDeep0411', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addCircle(100, 100, 60);
        target.canvas.clipPath(clip);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 10800 && inkAll(buffer) <= 11800).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0411 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0412
     * @tc.name testPathDeep0412
     * @tc.desc Verify a difference clip punches a hole in the filled rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0412', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0412 begin');
      await runCase('testPathDeep0412', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const hole: drawing.Path = new drawing.Path();
        hole.addRect(ltrb(60, 60, 140, 140));
        target.canvas.clipPath(hole, drawing.ClipOp.DIFFERENCE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000 - 6400);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 30, 30, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0412 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0413
     * @tc.name testPathDeep0413
     * @tc.desc Verify intersecting clips with two circles keep only the lens.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0413', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0413 begin');
      await runCase('testPathDeep0413', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const left: drawing.Path = new drawing.Path();
        left.addCircle(80, 100, 60);
        const right: drawing.Path = new drawing.Path();
        right.addCircle(120, 100, 60);
        target.canvas.clipPath(left);
        target.canvas.clipPath(right);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 30, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 3000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0413 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0414
     * @tc.name testPathDeep0414
     * @tc.desc Verify a stroked path stays inside its own clip region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0414', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0414 begin');
      await runCase('testPathDeep0414', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        target.canvas.clipPath(shape);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 55, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 2500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0414 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0415
     * @tc.name testPathDeep0415
     * @tc.desc Verify quickRejectPath answers inside and outside the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0415', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0415 begin');
      await runCase('testPathDeep0415', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, 100, 100));
        target.canvas.clipPath(clip);
        const inside: drawing.Path = new drawing.Path();
        inside.addRect(ltrb(20, 20, 80, 80));
        const outside: drawing.Path = new drawing.Path();
        outside.addRect(ltrb(120, 120, 180, 180));
        expect(target.canvas.quickRejectPath(inside)).assertFalse();
        expect(target.canvas.quickRejectPath(outside)).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0415 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0416
     * @tc.name testPathDeep0416
     * @tc.desc Verify restoring the canvas drops the temporary clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0416', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0416 begin');
      await runCase('testPathDeep0416', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.save();
        const clip: drawing.Path = new drawing.Path();
        clip.addCircle(100, 100, 40);
        target.canvas.clipPath(clip);
        target.canvas.restore();
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0416 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0417
     * @tc.name testPathDeep0417
     * @tc.desc Verify an even odd ring clip leaves a hollow centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0417', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0417 begin');
      await runCase('testPathDeep0417', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const ring: drawing.Path = new drawing.Path();
        ring.addCircle(100, 100, 70);
        ring.addCircle(100, 100, 30);
        ring.setFillType(drawing.PathFillType.EVEN_ODD);
        target.canvas.clipPath(ring);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 45, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 12500 && inkAll(buffer) <= 13800).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0417 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0418
     * @tc.name testPathDeep0418
     * @tc.desc Verify a clip plus saveLayer keeps the clip after restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0418', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0418 begin');
      await runCase('testPathDeep0418', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, 100, CANVAS_SIZE));
        target.canvas.clipPath(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        const layer: drawing.Brush = new drawing.Brush();
        layer.setColor(rgba(255, 0, 0, 255));
        target.canvas.saveLayer(null, layer);
        target.canvas.attachBrush(brush);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(chanAt(buffer, 150, 100, 3)).assertEqual(0);
        expect(shape.getBounds().right).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0418 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0419
     * @tc.name testPathDeep0419
     * @tc.desc Verify a rotated path lands on the expected diagonal band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0419', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0419 begin');
      await runCase('testPathDeep0419', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 140, 30));
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(45, 0, 0);
        shape.transform(turn);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 3500 && inkAll(buffer) <= 4600).assertTrue();
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0419 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0420
     * @tc.name testPathDeep0420
     * @tc.desc Verify a half scale matrix quarters the filled area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0420', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0420 begin');
      await runCase('testPathDeep0420', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const shrink: drawing.Matrix = new drawing.Matrix();
        shrink.setScale(0.5, 0.5, 0, 0);
        shape.transform(shrink);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(shape.getBounds().right).assertEqual(50);
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0420 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0421
     * @tc.name testPathDeep0421
     * @tc.desc Verify a skew matrix slants the rect into a parallelogram.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0421', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0421 begin');
      await runCase('testPathDeep0421', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 140, 140));
        const slant: drawing.Matrix = new drawing.Matrix();
        slant.setSkew(0.5, 0, 0, 0);
        shape.transform(slant);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 9500 && inkAll(buffer) <= 11000).assertTrue();
        expect(shape.getBounds().right).assertEqual(210);
        expect(chanAt(buffer, 150, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0421 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0422
     * @tc.name testPathDeep0422
     * @tc.desc Verify a canvas rotation matches an equivalent path transform.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0422', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0422 begin');
      await runCase('testPathDeep0422', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(30, 30, 130, 90));
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(30, 100, 100);
        const copied: drawing.Path = new drawing.Path();
        copied.set(shape);
        copied.transform(turn);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        first.canvas.rotate(30, 100, 100);
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(shape);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(copied);
        second.canvas.detachBrush();
        const leftBuffer: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const rightBuffer: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(leftBuffer, rightBuffer)).assertEqual(0);
        expect(inkAll(rightBuffer)).assertEqual(5997);
        expect(first.canvas.getSaveCount()).assertEqual(second.canvas.getSaveCount());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0422 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0423
     * @tc.name testPathDeep0423
     * @tc.desc Verify preScale and postScale place the same rect differently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0423', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0423 begin');
      await runCase('testPathDeep0423', async () => {
        const pre: drawing.Path = new drawing.Path();
        pre.addRect(ltrb(10, 10, 60, 60));
        const preMatrix: drawing.Matrix = new drawing.Matrix();
        preMatrix.setTranslation(40, 0);
        preMatrix.preScale(2, 2, 0, 0);
        pre.transform(preMatrix);
        const post: drawing.Path = new drawing.Path();
        post.addRect(ltrb(10, 10, 60, 60));
        const postMatrix: drawing.Matrix = new drawing.Matrix();
        postMatrix.setTranslation(40, 0);
        postMatrix.postScale(2, 2, 0, 0);
        post.transform(postMatrix);
        expect(pre.getBounds().left).assertEqual(60);
        expect(post.getBounds().left).assertEqual(100);
        expect(pre.getBounds().right).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0423 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0424
     * @tc.name testPathDeep0424
     * @tc.desc Verify nested canvas transforms compose before drawing a path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0424', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0424 begin');
      await runCase('testPathDeep0424', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 40, 40));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.save();
        target.canvas.translate(50, 50);
        target.canvas.scale(2, 2);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0424 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0425
     * @tc.name testPathDeep0425
     * @tc.desc Verify transforming with the identity matrix changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0425', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0425 begin');
      await runCase('testPathDeep0425', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        const before: common2D.Rect = shape.getBounds();
        const same: drawing.Matrix = new drawing.Matrix();
        shape.transform(same);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getBounds().left).assertEqual(Math.round(before.left));
        expect(shape.getBounds().right).assertEqual(Math.round(before.right));
        expect(inkAll(buffer) >= 7700 && inkAll(buffer) <= 8000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0425 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0426
     * @tc.name testPathDeep0426
     * @tc.desc Verify inverting a translate matrix restores the original bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0426', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0426 begin');
      await runCase('testPathDeep0426', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 120, 120));
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(60, 60);
        shape.transform(shift);
        expect(shape.getBounds().left).assertEqual(80);
        const back: drawing.Matrix = new drawing.Matrix();
        back.setTranslation(-60, -60);
        shape.transform(back);
        expect(shape.getBounds().left).assertEqual(20);
        expect(shape.getBounds().right).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0426 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0427
     * @tc.name testPathDeep0427
     * @tc.desc Verify a dashed pen paints less than the solid pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0427', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0427 begin');
      await runCase('testPathDeep0427', async () => {
        const dashed: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const solid: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 50, 180, 150));
        const dashPen: drawing.Pen = new drawing.Pen();
        dashPen.setColor(rgba(255, 0, 0, 255));
        dashPen.setStrokeWidth(8);
        dashPen.setPathEffect(drawing.PathEffect.createDashPathEffect([10, 10], 0));
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(rgba(255, 0, 0, 255));
        solidPen.setStrokeWidth(8);
        dashed.canvas.attachPen(dashPen);
        dashed.canvas.drawPath(shape);
        dashed.canvas.detachPen();
        solid.canvas.attachPen(solidPen);
        solid.canvas.drawPath(shape);
        solid.canvas.detachPen();
        const dashedBuffer: ArrayBuffer = await readPixelBuffer(dashed.pixelMap);
        const solidBuffer: ArrayBuffer = await readPixelBuffer(solid.pixelMap);
        expect(inkAll(dashedBuffer) < inkAll(solidBuffer)).assertTrue();
        expect(inkAll(dashedBuffer) >= 2000).assertTrue();
        expect(inkAll(solidBuffer)).assertEqual(4160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0427 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0428
     * @tc.name testPathDeep0428
     * @tc.desc Verify a dash phase shift moves the ink but keeps the total.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0428', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0428 begin');
      await runCase('testPathDeep0428', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 50, 180, 150));
        const plain: drawing.Pen = new drawing.Pen();
        plain.setColor(rgba(255, 0, 255, 0));
        plain.setStrokeWidth(8);
        plain.setPathEffect(drawing.PathEffect.createDashPathEffect([20, 20], 0));
        const shifted: drawing.Pen = new drawing.Pen();
        shifted.setColor(rgba(255, 0, 255, 0));
        shifted.setStrokeWidth(8);
        shifted.setPathEffect(drawing.PathEffect.createDashPathEffect([20, 20], 10));
        first.canvas.attachPen(plain);
        first.canvas.drawPath(shape);
        first.canvas.detachPen();
        second.canvas.attachPen(shifted);
        second.canvas.drawPath(shape);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right) > 0).assertTrue();
        expect(Math.abs(inkAll(left) - inkAll(right)) <= 200).assertTrue();
        expect(inkAll(left) >= 2000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0428 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0429
     * @tc.name testPathDeep0429
     * @tc.desc Verify a round cap extends the stroked line past its end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0429', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0429 begin');
      await runCase('testPathDeep0429', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(60, 100);
        shape.lineTo(140, 100);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setColor(rgba(255, 0, 0, 255));
        flatPen.setStrokeWidth(20);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 0, 0, 255));
        roundPen.setStrokeWidth(20);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        first.canvas.attachPen(flatPen);
        first.canvas.drawPath(shape);
        first.canvas.detachPen();
        second.canvas.attachPen(roundPen);
        second.canvas.drawPath(shape);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(inkAll(right) > inkAll(left)).assertTrue();
        expect(chanAt(right, 148, 100, 3)).assertEqual(255);
        expect(roundPen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0429 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0430
     * @tc.name testPathDeep0430
     * @tc.desc Verify a square cap adds a box beyond the line end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0430', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0430 begin');
      await runCase('testPathDeep0430', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(50, 100);
        shape.lineTo(150, 100);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setColor(rgba(255, 0, 255, 0));
        flatPen.setStrokeWidth(16);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const squarePen: drawing.Pen = new drawing.Pen();
        squarePen.setColor(rgba(255, 0, 255, 0));
        squarePen.setStrokeWidth(16);
        squarePen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        first.canvas.attachPen(flatPen);
        first.canvas.drawPath(shape);
        first.canvas.detachPen();
        second.canvas.attachPen(squarePen);
        second.canvas.drawPath(shape);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(inkAll(right) > inkAll(left)).assertTrue();
        expect(chanAt(right, 157, 100, 3)).assertEqual(255);
        expect(squarePen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0430 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0431
     * @tc.name testPathDeep0431
     * @tc.desc Verify a miter join grows a spike at the path corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0431', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0431 begin');
      await runCase('testPathDeep0431', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(50, 150);
        shape.lineTo(100, 50);
        shape.lineTo(150, 150);
        const miterPen: drawing.Pen = new drawing.Pen();
        miterPen.setColor(rgba(255, 255, 0, 0));
        miterPen.setStrokeWidth(16);
        miterPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        const bevelPen: drawing.Pen = new drawing.Pen();
        bevelPen.setColor(rgba(255, 255, 0, 0));
        bevelPen.setStrokeWidth(16);
        bevelPen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        first.canvas.attachPen(miterPen);
        first.canvas.drawPath(shape);
        first.canvas.detachPen();
        second.canvas.attachPen(bevelPen);
        second.canvas.drawPath(shape);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(chanAt(left, 100, 40, 3)).assertEqual(255);
        expect(chanAt(right, 100, 40, 3)).assertEqual(0);
        expect(inkAll(left) > inkAll(right)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0431 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0432
     * @tc.name testPathDeep0432
     * @tc.desc Verify a round join softens the corner into an arc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0432', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0432 begin');
      await runCase('testPathDeep0432', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 160);
        shape.lineTo(100, 40);
        shape.lineTo(160, 160);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(12);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(chanAt(buffer, 100, 46, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 2500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0432 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0433
     * @tc.name testPathDeep0433
     * @tc.desc Verify a blur mask filter enlarges the stroked footprint.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0433', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0433 begin');
      await runCase('testPathDeep0433', async () => {
        const sharpTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blurredTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 40);
        const sharpPen: drawing.Pen = new drawing.Pen();
        sharpPen.setColor(rgba(255, 0, 0, 255));
        sharpPen.setStrokeWidth(6);
        const blurredPen: drawing.Pen = new drawing.Pen();
        blurredPen.setColor(rgba(255, 0, 0, 255));
        blurredPen.setStrokeWidth(6);
        blurredPen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 6));
        sharpTarget.canvas.attachPen(sharpPen);
        sharpTarget.canvas.drawPath(shape);
        sharpTarget.canvas.detachPen();
        blurredTarget.canvas.attachPen(blurredPen);
        blurredTarget.canvas.drawPath(shape);
        blurredTarget.canvas.detachPen();
        const sharpBuffer: ArrayBuffer = await readPixelBuffer(sharpTarget.pixelMap);
        const blurredBuffer: ArrayBuffer = await readPixelBuffer(blurredTarget.pixelMap);
        expect(inkAll(blurredBuffer) > inkAll(sharpBuffer)).assertTrue();
        expect(chanAt(blurredBuffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(sharpBuffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0433 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0434
     * @tc.name testPathDeep0434
     * @tc.desc Verify a half alpha pen keeps the stroke colour partial.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0434', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0434 begin');
      await runCase('testPathDeep0434', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(128, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 40, 3) >= 120 && chanAt(buffer, 100, 40, 3) <= 136).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 4000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0434 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0435
     * @tc.name testPathDeep0435
     * @tc.desc Verify two overlapping alpha strokes double the coverage alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0435', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0435 begin');
      await runCase('testPathDeep0435', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 100);
        shape.lineTo(160, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(128, 255, 0, 0));
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3) > 180).assertTrue();
        expect(chanAt(buffer, 100, 100, 3) < 200).assertTrue();
        expect(chanAt(buffer, 30, 30, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0435 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0436
     * @tc.name testPathDeep0436
     * @tc.desc Verify a three rect union chain fills the whole span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0436', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0436 begin');
      await runCase('testPathDeep0436', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 70, 100));
        const second: drawing.Path = new drawing.Path();
        second.addRect(ltrb(60, 0, 130, 100));
        shape.op(second, drawing.PathOp.UNION);
        const third: drawing.Path = new drawing.Path();
        third.addRect(ltrb(120, 0, 190, 100));
        shape.op(third, drawing.PathOp.UNION);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(19000);
        expect(shape.getBounds().right).assertEqual(190);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0436 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0437
     * @tc.name testPathDeep0437
     * @tc.desc Verify op with an empty path keeps the original contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0437', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0437 begin');
      await runCase('testPathDeep0437', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 120, 120));
        const empty: drawing.Path = new drawing.Path();
        const ok: boolean = shape.op(empty, drawing.PathOp.UNION);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(shape.isEmpty()).assertFalse();
        expect(ok).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0437 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0438
     * @tc.name testPathDeep0438
     * @tc.desc Verify an op result survives a later transform.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0438', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0438 begin');
      await runCase('testPathDeep0438', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 80, 80));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(40, 40, 120, 120));
        shape.op(other, drawing.PathOp.INTERSECT);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(60, 60);
        shape.transform(shift);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(shape.getBounds().left).assertEqual(100);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0438 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0439
     * @tc.name testPathDeep0439
     * @tc.desc Verify an op result can be sampled as a segment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0439', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0439 begin');
      await runCase('testPathDeep0439', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(50, 0, 150, 100));
        shape.op(other, drawing.PathOp.UNION);
        const part: drawing.Path = new drawing.Path();
        const ok: boolean = shape.getSegment(false, 0, 100, true, part);
        expect(ok).assertTrue();
        expect(part.isEmpty()).assertFalse();
        expect(Math.round(part.getLength(false))).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0439 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0440
     * @tc.name testPathDeep0440
     * @tc.desc Verify a circle minus a rect keeps the crescent pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0440', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0440 begin');
      await runCase('testPathDeep0440', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const disc: drawing.Path = new drawing.Path();
        disc.addCircle(100, 100, 60);
        const bite: drawing.Path = new drawing.Path();
        bite.addRect(ltrb(100, 0, 200, 200));
        disc.op(bite, drawing.PathOp.DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(disc);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 60, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 140, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 5000 && inkAll(buffer) <= 5900).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0440 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0441
     * @tc.name testPathDeep0441
     * @tc.desc Verify three nested circles under even odd leave two rings.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0441', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0441 begin');
      await runCase('testPathDeep0441', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rings: drawing.Path = new drawing.Path();
        rings.addCircle(100, 100, 90);
        rings.addCircle(100, 100, 60);
        rings.addCircle(100, 100, 30);
        rings.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(rings);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 45, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 15, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0441 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0442
     * @tc.name testPathDeep0442
     * @tc.desc Verify two touching rects under even odd drop the seam.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0442', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0442 begin');
      await runCase('testPathDeep0442', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 100, 180));
        shape.addRect(ltrb(100, 20, 180, 180));
        shape.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(25600);
        expect(shape.getBounds().right).assertEqual(180);
        expect(chanAt(buffer, 140, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0442 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0443
     * @tc.name testPathDeep0443
     * @tc.desc Verify three concentric rects under even odd leave two frames.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0443', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0443 begin');
      await runCase('testPathDeep0443', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const frames: drawing.Path = new drawing.Path();
        frames.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        frames.addRect(ltrb(40, 40, 160, 160));
        frames.addRect(ltrb(80, 80, 120, 120));
        frames.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(frames);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000 - 14400 + 1600);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0443 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0444
     * @tc.name testPathDeep0444
     * @tc.desc Verify a rect plus circle under even odd keeps the outside band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0444', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0444 begin');
      await runCase('testPathDeep0444', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 180, 180));
        shape.addCircle(100, 100, 50);
        shape.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 30, 30, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 16000 && inkAll(buffer) <= 19000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0444 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0445
     * @tc.name testPathDeep0445
     * @tc.desc Verify same direction rings stay solid under the winding rule.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0445', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0445 begin');
      await runCase('testPathDeep0445', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rings: drawing.Path = new drawing.Path();
        rings.addCircle(100, 100, 70, drawing.PathDirection.CLOCKWISE);
        rings.addCircle(100, 100, 35, drawing.PathDirection.CLOCKWISE);
        rings.setFillType(drawing.PathFillType.WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(rings);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 15200 && inkAll(buffer) <= 16100).assertTrue();
        expect(rings.getBounds().right).assertEqual(170);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0445 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0446
     * @tc.name testPathDeep0446
     * @tc.desc Verify inverse fill over nested rings keeps the outer field.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0446', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0446 begin');
      await runCase('testPathDeep0446', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rings: drawing.Path = new drawing.Path();
        rings.addCircle(100, 100, 70);
        rings.addCircle(100, 100, 35);
        rings.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(rings);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 48, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 23000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0446 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0447
     * @tc.name testPathDeep0447
     * @tc.desc Verify bounds follow a chain of path offsets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0447', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0447 begin');
      await runCase('testPathDeep0447', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 40, 40));
        shape.offset(20, 10);
        shape.offset(30, 20);
        expect(shape.getBounds().left).assertEqual(0);
        expect(shape.getBounds().top).assertEqual(0);
        expect(shape.getBounds().right).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0447 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0448
     * @tc.name testPathDeep0448
     * @tc.desc Verify a scaled circle keeps its vertex count but doubles the length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0448', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0448 begin');
      await runCase('testPathDeep0448', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 40);
        const before: number = shape.getLength(true);
        const verbs: number = shape.getVerbData().length;
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        shape.transform(zoom);
        expect(shape.getVerbData().length).assertEqual(verbs);
        expect(shape.getLength(true) > before).assertTrue();
        expect(Math.round(shape.getBounds().right)).assertEqual(280);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0448 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0449
     * @tc.name testPathDeep0449
     * @tc.desc Verify the bounds of an arc exclude the missing cap area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0449', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0449 begin');
      await runCase('testPathDeep0449', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addArc(ltrb(20, 40, 180, 160), 0, 90);
        const bounds: common2D.Rect = shape.getBounds();
        expect(bounds.right).assertEqual(180);
        expect(Math.round(bounds.top)).assertEqual(100);
        expect(shape.getLength(false) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0449 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0450
     * @tc.name testPathDeep0450
     * @tc.desc Verify a union of two stacked rects reports merged bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0450', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0450 begin');
      await runCase('testPathDeep0450', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 120, 80));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(20, 80, 120, 140));
        shape.op(other, drawing.PathOp.UNION);
        expect(shape.getBounds().top).assertEqual(20);
        expect(shape.getBounds().bottom).assertEqual(140);
        expect(shape.getBounds().right).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0450 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0451
     * @tc.name testPathDeep0451
     * @tc.desc Verify a closed arc measures longer than the open arc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0451', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0451 begin');
      await runCase('testPathDeep0451', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addArc(ltrb(0, 50, 200, 150), 0, 180);
        const open: number = shape.getLength(false);
        const closed: number = shape.getLength(true);
        expect(closed > open).assertTrue();
        expect(Math.round(closed - open)).assertEqual(200);
        expect(shape.isClosed()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0451 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0452
     * @tc.name testPathDeep0452
     * @tc.desc Verify an svg rect scaled by two covers four times the area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0452', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0452 begin');
      await runCase('testPathDeep0452', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.buildFromSvgString('M10 10 L60 10 L60 60 L10 60 Z');
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        shape.transform(zoom);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getBounds().left).assertEqual(20);
        expect(shape.getBounds().right).assertEqual(120);
        expect(inkAll(buffer)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0452 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0453
     * @tc.name testPathDeep0453
     * @tc.desc Verify an svg with two subpaths fills both under winding.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0453', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0453 begin');
      await runCase('testPathDeep0453', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.buildFromSvgString('M10 10 L90 10 L90 90 L10 90 Z M110 110 L190 110 L190 190 L110 190 Z');
        shape.setFillType(drawing.PathFillType.WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(12800);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0453 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0454
     * @tc.name testPathDeep0454
     * @tc.desc Verify an svg square offset by twenty shifts its ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0454', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0454 begin');
      await runCase('testPathDeep0454', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.buildFromSvgString('M0 0 L80 0 L80 80 L0 80 Z');
        shape.offset(20, 20);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getBounds().left).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0454 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0455
     * @tc.name testPathDeep0455
     * @tc.desc Verify drawing the same path twice with one brush is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0455', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0455 begin');
      await runCase('testPathDeep0455', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 45);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        const firstBuffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const bothBuffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(gapBytes(firstBuffer, bothBuffer)).assertEqual(0);
        expect(inkAll(bothBuffer) >= 6100 && inkAll(bothBuffer) <= 6600).assertTrue();
        expect(chanAt(bothBuffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0455 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0456
     * @tc.name testPathDeep0456
     * @tc.desc Verify a half alpha brush leaves partial coverage inside the path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0456', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0456 begin');
      await runCase('testPathDeep0456', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(50, 50, 150, 150));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 1) >= 120 && chanAt(buffer, 100, 100, 1) <= 136).assertTrue();
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0456 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0457
     * @tc.name testPathDeep0457
     * @tc.desc Verify a stroke over a fill keeps both inks in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0457', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0457 begin');
      await runCase('testPathDeep0457', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(chanAt(buffer, 100, 40, 0)).assertEqual(0);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0457 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0458
     * @tc.name testPathDeep0458
     * @tc.desc Verify a SRC blend overwrites the path pixels entirely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0458', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0458 begin');
      await runCase('testPathDeep0458', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(50, 50, 150, 150));
        const base: drawing.Brush = new drawing.Brush();
        base.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(base);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const overlay: drawing.Brush = new drawing.Brush();
        overlay.setColor(rgba(255, 0, 0, 255));
        overlay.setBlendMode(drawing.BlendMode.SRC);
        target.canvas.attachBrush(overlay);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(inkAll(buffer)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0458 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0459
     * @tc.name testPathDeep0459
     * @tc.desc Verify a rewound path can be rebuilt and painted again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0459', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0459 begin');
      await runCase('testPathDeep0459', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 200, 60));
        shape.rewind();
        shape.addRect(ltrb(60, 60, 140, 140));
        shape.addCircle(100, 170, 25);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 8300 && inkAll(buffer) <= 8600).assertTrue();
        expect(chanAt(buffer, 100, 170, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0459 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0460
     * @tc.name testPathDeep0460
     * @tc.desc Verify an isEqual check ignores paint and only compares geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0460', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0460 begin');
      await runCase('testPathDeep0460', async () => {
        const first: drawing.Path = new drawing.Path();
        first.addCircle(100, 100, 40);
        first.setFillType(drawing.PathFillType.EVEN_ODD);
        const second: drawing.Path = new drawing.Path();
        second.addCircle(100, 100, 40);
        second.setFillType(drawing.PathFillType.EVEN_ODD);
        expect(first.isEqual(second)).assertTrue();
        second.setFillType(drawing.PathFillType.WINDING);
        expect(first.isEqual(second)).assertFalse();
        expect(first.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0460 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0461
     * @tc.name testPathDeep0461
     * @tc.desc Verify a path built twice at different scales stays unequal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0461', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0461 begin');
      await runCase('testPathDeep0461', async () => {
        const first: drawing.Path = new drawing.Path();
        first.buildFromSvgString('M0 0 L40 0 L40 40 Z');
        const second: drawing.Path = new drawing.Path();
        second.buildFromSvgString('M0 0 L80 0 L80 80 Z');
        expect(first.isEqual(second)).assertFalse();
        expect(first.getBounds().right).assertEqual(40);
        expect(second.getBounds().right).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0461 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0462
     * @tc.name testPathDeep0462
     * @tc.desc Verify a transformed path keeps its verb table intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0462', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0462 begin');
      await runCase('testPathDeep0462', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRoundRect(new drawing.RoundRect(ltrb(20, 20, 120, 120), 20, 20));
        const verbs: number = shape.getVerbData().length;
        const points: number = shape.getPointData().length;
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(1.5, 1.5, 0, 0);
        shape.transform(zoom);
        expect(shape.getVerbData().length).assertEqual(verbs);
        expect(shape.getPointData().length).assertEqual(points);
        expect(shape.getBounds().right).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0462 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0463
     * @tc.name testPathDeep0463
     * @tc.desc Verify a path offset does not change its verb count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0463', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0463 begin');
      await runCase('testPathDeep0463', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addPolygon([point(20, 20), point(180, 20), point(100, 180)], true);
        const verbs: number = shape.getVerbData().length;
        shape.offset(30, 30);
        expect(shape.getVerbData().length).assertEqual(verbs);
        expect(shape.getBounds().left).assertEqual(20);
        expect(shape.getBounds().bottom).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0463 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0464
     * @tc.name testPathDeep0464
     * @tc.desc Verify opacity blending two path layers keeps both colours visible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0464', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0464 begin');
      await runCase('testPathDeep0464', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const left: drawing.Path = new drawing.Path();
        left.addRect(ltrb(20, 60, 120, 140));
        const right: drawing.Path = new drawing.Path();
        right.addRect(ltrb(80, 60, 180, 140));
        const low: drawing.Brush = new drawing.Brush();
        low.setColor(rgba(128, 255, 0, 0));
        target.canvas.attachBrush(low);
        target.canvas.drawPath(left);
        target.canvas.detachBrush();
        const high: drawing.Brush = new drawing.Brush();
        high.setColor(rgba(128, 0, 0, 255));
        target.canvas.attachBrush(high);
        target.canvas.drawPath(right);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 2) > 100).assertTrue();
        expect(chanAt(buffer, 100, 100, 0) > 40).assertTrue();
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0464 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0465
     * @tc.name testPathDeep0465
     * @tc.desc Verify a clip rect combined with a path fill respects both limits.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0465', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0465 begin');
      await runCase('testPathDeep0465', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, CANVAS_SIZE));
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 60);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 60, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 140, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 5000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0465 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0466
     * @tc.name testPathDeep0466
     * @tc.desc Verify a path measured after reset reports zero length again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0466', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0466 begin');
      await runCase('testPathDeep0466', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 60, 60));
        const before: number = shape.getLength(true);
        shape.reset();
        shape.addRect(ltrb(0, 0, 120, 40));
        expect(before > 200).assertTrue();
        expect(shape.getLength(true)).assertEqual(320);
        expect(shape.getVerbData().length >= 4).assertTrue();
        expect(shape.getBounds().right).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0466 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0467
     * @tc.name testPathDeep0467
     * @tc.desc Verify a difference clip trims the outer half of a stroked rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0467', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0467 begin');
      await runCase('testPathDeep0467', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const hole: drawing.Path = new drawing.Path();
        hole.addCircle(100, 100, 50);
        target.canvas.clipPath(hole, drawing.ClipOp.DIFFERENCE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 2500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0467 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0468
     * @tc.name testPathDeep0468
     * @tc.desc Verify a negatively offset path keeps only the visible corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0468', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0468 begin');
      await runCase('testPathDeep0468', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 80, 80));
        shape.offset(-40, -40);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0468 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0469
     * @tc.name testPathDeep0469
     * @tc.desc Verify a reverse difference of two circles keeps the right disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0469', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0469 begin');
      await runCase('testPathDeep0469', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: drawing.Path = new drawing.Path();
        base.addCircle(100, 100, 60);
        const other: drawing.Path = new drawing.Path();
        other.addCircle(120, 100, 60);
        base.op(other, drawing.PathOp.REVERSE_DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(base);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 155, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 60, 100, 3)).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(2388);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0469 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0470
     * @tc.name testPathDeep0470
     * @tc.desc Verify a quarter segment of a circle stays short.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0470', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0470 begin');
      await runCase('testPathDeep0470', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 60);
        const total: number = shape.getLength(true);
        const part: drawing.Path = new drawing.Path();
        const ok: boolean = shape.getSegment(true, 0, total * 0.25, true, part);
        expect(ok).assertTrue();
        expect(part.isEmpty()).assertFalse();
        expect(part.getLength(false) <= total * 0.26).assertTrue();
        expect(part.getVerbData().length >= 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0470 end');
    });

  });
}
