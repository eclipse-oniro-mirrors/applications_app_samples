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
import { DRAWING_TAG, iteratorPoints, readPixelBuffer, runCase } from './DrawingTestRunner';

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

export default function pathApiDeep2Test() {
  describe('PathApiDeep2Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0351
     * @tc.name testPathDeep0351
     * @tc.desc Verify rLineTo paints the same band as the absolute lineTo chain.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0351', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0351 begin');
      await runCase('testPathDeep0351', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(20, 20);
        absolute.lineTo(180, 20);
        absolute.lineTo(180, 180);
        const relative: drawing.Path = new drawing.Path();
        relative.moveTo(20, 20);
        relative.rLineTo(160, 0);
        relative.rLineTo(0, 160);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(8);
        first.canvas.attachPen(pen);
        first.canvas.drawPath(absolute);
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawPath(relative);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left)).assertEqual(2560);
        expect(chanAt(left, 180, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0351 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0352
     * @tc.name testPathDeep0352
     * @tc.desc Verify rMoveTo opens a relative second contour at the expected origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0352', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0352 begin');
      await runCase('testPathDeep0352', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const absolute: drawing.Path = new drawing.Path();
        absolute.addRect(ltrb(0, 0, 100, 100));
        absolute.addRect(ltrb(100, 100, 200, 200));
        const relative: drawing.Path = new drawing.Path();
        relative.rMoveTo(0, 0);
        relative.rLineTo(100, 0);
        relative.rLineTo(0, 100);
        relative.rLineTo(-100, 0);
        relative.close();
        relative.rMoveTo(100, 100);
        relative.rLineTo(100, 0);
        relative.rLineTo(0, 100);
        relative.rLineTo(-100, 0);
        relative.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(absolute);
        const firstBuffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        target.canvas.drawPath(relative);
        target.canvas.detachBrush();
        const bothBuffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(firstBuffer)).assertEqual(20000);
        expect(inkAll(bothBuffer)).assertEqual(20000);
        expect(relative.getBounds().right).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0352 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0353
     * @tc.name testPathDeep0353
     * @tc.desc Verify rQuadTo matches the absolute quadTo curve pixel for pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0353', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0353 begin');
      await runCase('testPathDeep0353', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(20, 180);
        absolute.quadTo(100, 20, 180, 180);
        const relative: drawing.Path = new drawing.Path();
        relative.moveTo(20, 180);
        relative.rQuadTo(80, -160, 160, 0);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(6);
        first.canvas.attachPen(pen);
        first.canvas.drawPath(absolute);
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawPath(relative);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(chanAt(left, 100, 100, 3)).assertEqual(255);
        expect(inkRect(left, 0, 0, CANVAS_SIZE, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0353 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0354
     * @tc.name testPathDeep0354
     * @tc.desc Verify rCubicTo matches the absolute cubic curve pixel for pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0354', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0354 begin');
      await runCase('testPathDeep0354', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(20, 100);
        absolute.cubicTo(60, 20, 140, 180, 180, 100);
        const relative: drawing.Path = new drawing.Path();
        relative.moveTo(20, 100);
        relative.rCubicTo(40, -80, 120, 80, 160, 0);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        first.canvas.attachPen(pen);
        first.canvas.drawPath(absolute);
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawPath(relative);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(chanAt(left, 20, 100, 3)).assertEqual(0);
        expect(inkAll(left) >= 500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0354 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0355
     * @tc.name testPathDeep0355
     * @tc.desc Verify rConicTo matches the absolute conic curve pixel for pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0355', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0355 begin');
      await runCase('testPathDeep0355', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const absolute: drawing.Path = new drawing.Path();
        absolute.moveTo(20, 180);
        absolute.conicTo(100, 20, 180, 180, 0.7);
        const relative: drawing.Path = new drawing.Path();
        relative.moveTo(20, 180);
        relative.rConicTo(80, -160, 160, 0, 0.7);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        first.canvas.attachPen(pen);
        first.canvas.drawPath(absolute);
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawPath(relative);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(absolute.getConicWeightData().length).assertEqual(1);
        expect(inkAll(left) >= 300).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0355 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0356
     * @tc.name testPathDeep0356
     * @tc.desc Verify a relative contour fills the same box as an added rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0356', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0356 begin');
      await runCase('testPathDeep0356', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const manual: drawing.Path = new drawing.Path();
        manual.rMoveTo(20, 20);
        manual.rLineTo(100, 0);
        manual.rLineTo(0, 100);
        manual.rLineTo(-100, 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(manual);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(manual.getBounds().left).assertEqual(20);
        expect(chanAt(buffer, 70, 70, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0356 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0357
     * @tc.name testPathDeep0357
     * @tc.desc Verify a relative contour continues from the tail of an added rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0357', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0357 begin');
      await runCase('testPathDeep0357', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 40, 40));
        shape.rMoveTo(100, 0);
        shape.rLineTo(0, 80);
        shape.rLineTo(40, 0);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getBounds().right).assertEqual(140);
        expect(chanAt(buffer, 100, 80, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0357 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0358
     * @tc.name testPathDeep0358
     * @tc.desc Verify a mixed relative inner ring hollows out the outer rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0358', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0358 begin');
      await runCase('testPathDeep0358', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 180, 180));
        shape.rMoveTo(60, 60);
        shape.rLineTo(40, 0);
        shape.rLineTo(0, 40);
        shape.rLineTo(-40, 0);
        shape.close();
        shape.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(24000);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0358 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0359
     * @tc.name testPathDeep0359
     * @tc.desc Verify a conic with unit weight fills close to the quad curve.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0359', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0359 begin');
      await runCase('testPathDeep0359', async () => {
        const conicTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const quadTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const conic: drawing.Path = new drawing.Path();
        conic.moveTo(20, 180);
        conic.conicTo(100, 20, 180, 180, 1);
        conic.close();
        const quad: drawing.Path = new drawing.Path();
        quad.moveTo(20, 180);
        quad.quadTo(100, 20, 180, 180);
        quad.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        conicTarget.canvas.attachBrush(brush);
        conicTarget.canvas.drawPath(conic);
        conicTarget.canvas.detachBrush();
        quadTarget.canvas.attachBrush(brush);
        quadTarget.canvas.drawPath(quad);
        quadTarget.canvas.detachBrush();
        const conicBuffer: ArrayBuffer = await readPixelBuffer(conicTarget.pixelMap);
        const quadBuffer: ArrayBuffer = await readPixelBuffer(quadTarget.pixelMap);
        expect(Math.abs(inkAll(conicBuffer) - inkAll(quadBuffer)) <= 100).assertTrue();
        expect(inkAll(conicBuffer) >= 5000).assertTrue();
        expect(chanAt(conicBuffer, 100, 80, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0359 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0360
     * @tc.name testPathDeep0360
     * @tc.desc Verify a half weight conic bends the chord into a filled lens.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0360', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0360 begin');
      await runCase('testPathDeep0360', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.conicTo(100, 20, 180, 180, 0.5);
        shape.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 4000 && inkAll(buffer) <= 16000).assertTrue();
        expect(chanAt(buffer, 100, 60, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0360 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0361
     * @tc.name testPathDeep0361
     * @tc.desc Verify two conic commands record both weights in order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0361', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0361 begin');
      await runCase('testPathDeep0361', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.conicTo(100, 20, 180, 180, 10);
        shape.conicTo(100, 20, 180, 180, 0.25);
        expect(shape.getConicWeightData().length).assertEqual(2);
        expect(Math.round(shape.getConicWeightData()[0])).assertEqual(10);
        expect(shape.getConicWeightData()[1]).assertEqual(0.25);
        expect(shape.getVerbData().length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0361 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0362
     * @tc.name testPathDeep0362
     * @tc.desc Verify a conic closed triangle paints a filled wedge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0362', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0362 begin');
      await runCase('testPathDeep0362', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.conicTo(180, 20, 180, 180, 0.6);
        shape.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 5000 && inkAll(buffer) <= 20000).assertTrue();
        expect(chanAt(buffer, 160, 150, 3)).assertEqual(255);
        expect(shape.getBounds().right).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0362 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0363
     * @tc.name testPathDeep0363
     * @tc.desc Verify a zero weight conic records no weight and paints nothing while a normal conic paints ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0363', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0363 begin');
      await runCase('testPathDeep0363', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.conicTo(100, 20, 180, 180, 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        const dropped: number[] | undefined = shape.getConicWeightData();
        expect(dropped === undefined || dropped.length === 0).assertTrue();
        const kept: drawing.Path = new drawing.Path();
        kept.moveTo(20, 180);
        kept.conicTo(100, 20, 180, 180, 1);
        expect(kept.getConicWeightData().length).assertEqual(0);
        expect(kept.getBounds().bottom > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0363 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0364
     * @tc.name testPathDeep0364
     * @tc.desc Verify setLastPoint moves the tail before a stroked lineTo.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0364', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0364 begin');
      await runCase('testPathDeep0364', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 100);
        shape.setLastPoint(100, 100);
        shape.lineTo(180, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 140, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 20, 0, 80, CANVAS_SIZE)).assertEqual(0);
        expect(inkAll(buffer) >= 700).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0364 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0365
     * @tc.name testPathDeep0365
     * @tc.desc Verify getLastPoint reports the tail after a lineTo command.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0365', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0365 begin');
      await runCase('testPathDeep0365', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 40);
        shape.lineTo(150, 90);
        const tail: common2D.Point = shape.getLastPoint();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(Math.round(tail.x)).assertEqual(150);
        expect(Math.round(tail.y)).assertEqual(90);
        expect(inkAll(buffer) >= 600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0365 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0366
     * @tc.name testPathDeep0366
     * @tc.desc Verify setLastPoint on an empty path starts a fresh contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0366', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0366 begin');
      await runCase('testPathDeep0366', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.setLastPoint(60, 60);
        shape.lineTo(140, 60);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getLastPoint().x).assertEqual(140);
        expect(chanAt(buffer, 100, 60, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0366 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0367
     * @tc.name testPathDeep0367
     * @tc.desc Verify setLastPoint after close restarts from the new tail.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0367', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0367 begin');
      await runCase('testPathDeep0367', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 100, 100));
        shape.close();
        shape.setLastPoint(150, 150);
        shape.lineTo(150, 190);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getBounds().bottom).assertEqual(190);
        expect(chanAt(buffer, 150, 170, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0367 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0368
     * @tc.name testPathDeep0368
     * @tc.desc Verify isClosed flips only after an explicit close command.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0368', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0368 begin');
      await runCase('testPathDeep0368', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 20);
        shape.lineTo(180, 20);
        shape.lineTo(100, 180);
        const before: boolean = shape.isClosed();
        shape.close();
        const after: boolean = shape.isClosed();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(before).assertFalse();
        expect(after).assertTrue();
        expect(inkAll(buffer) >= 12000 && inkAll(buffer) <= 13600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0368 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0369
     * @tc.name testPathDeep0369
     * @tc.desc Verify a repeated close leaves the verb table unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0369', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0369 begin');
      await runCase('testPathDeep0369', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 20);
        shape.lineTo(180, 20);
        shape.lineTo(100, 180);
        shape.close();
        const verbs: number = shape.getVerbData().length;
        shape.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getVerbData().length).assertEqual(verbs);
        expect(shape.isClosed()).assertTrue();
        expect(chanAt(buffer, 100, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0369 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0370
     * @tc.name testPathDeep0370
     * @tc.desc Verify an added rect is reported as a closed contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0370', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0370 begin');
      await runCase('testPathDeep0370', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(30, 30, 170, 170));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.isClosed()).assertTrue();
        expect(shape.contains(100, 100)).assertTrue();
        expect(inkAll(buffer)).assertEqual(19600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0370 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0371
     * @tc.name testPathDeep0371
     * @tc.desc Verify getSegment extracts the top edge as a strokable sub path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0371', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0371 begin');
      await runCase('testPathDeep0371', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 180, 180));
        const part: drawing.Path = new drawing.Path();
        const ok: boolean = source.getSegment(true, 0, 160, true, part);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(part);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(ok).assertTrue();
        expect(chanAt(buffer, 100, 20, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0371 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0372
     * @tc.name testPathDeep0372
     * @tc.desc Verify startWithMoveTo only adds one leading move verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0372', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0372 begin');
      await runCase('testPathDeep0372', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 180, 180));
        const withMove: drawing.Path = new drawing.Path();
        const withoutMove: drawing.Path = new drawing.Path();
        source.getSegment(true, 0, 160, true, withMove);
        source.getSegment(true, 0, 160, false, withoutMove);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(8);
        first.canvas.attachPen(pen);
        first.canvas.drawPath(withMove);
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawPath(withoutMove);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(4164);
        expect(withMove.getVerbData().length - withoutMove.getVerbData().length).assertEqual(0);
        expect(inkAll(left) >= 1000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0372 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0373
     * @tc.name testPathDeep0373
     * @tc.desc Verify a reversed segment range strokes the same contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0373', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0373 begin');
      await runCase('testPathDeep0373', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 180, 180));
        const forward: drawing.Path = new drawing.Path();
        const reversed: drawing.Path = new drawing.Path();
        source.getSegment(true, 0, 100, true, forward);
        source.getSegment(true, 100, 0, true, reversed);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(8);
        first.canvas.attachPen(pen);
        first.canvas.drawPath(forward);
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawPath(reversed);
        second.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(1600);
        expect(Math.round(forward.getLength(false))).assertEqual(100);
        expect(inkAll(left) >= 600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0373 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0374
     * @tc.name testPathDeep0374
     * @tc.desc Verify a forced closed segment turns a corner of the rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0374', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0374 begin');
      await runCase('testPathDeep0374', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 180, 180));
        const part: drawing.Path = new drawing.Path();
        const ok: boolean = source.getSegment(true, 0, 200, true, part);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(part);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(ok).assertTrue();
        expect(part.isEmpty()).assertFalse();
        expect(inkAll(buffer)).assertEqual(3200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0374 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0375
     * @tc.name testPathDeep0375
     * @tc.desc Verify a segment appended to a filled path keeps both contours.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0375', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0375 begin');
      await runCase('testPathDeep0375', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.moveTo(100, 0);
        source.lineTo(180, 0);
        const dst: drawing.Path = new drawing.Path();
        dst.addRect(ltrb(0, 0, 50, 50));
        const ok: boolean = source.getSegment(false, 0, 80, true, dst);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(dst);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(ok).assertTrue();
        expect(dst.getBounds().right).assertEqual(180);
        expect(inkAll(buffer)).assertEqual(2500);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0375 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0376
     * @tc.name testPathDeep0376
     * @tc.desc Verify an out of range segment start reports failure.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0376', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0376 begin');
      await runCase('testPathDeep0376', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(0, 0, 100, 100));
        const dst: drawing.Path = new drawing.Path();
        const ok: boolean = source.getSegment(false, 500, 600, true, dst);
        expect(ok).assertFalse();
        expect(dst.isEmpty()).assertTrue();
        expect(source.getLength(false) > 0).assertTrue();
        expect(source.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0376 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0377
     * @tc.name testPathDeep0377
     * @tc.desc Verify the position matrix at distance zero sits on the path start.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0377', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0377 begin');
      await runCase('testPathDeep0377', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 30);
        shape.lineTo(120, 30);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = shape.getMatrix(false, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(Math.round(matrix.getValue(2))).assertEqual(20);
        expect(Math.round(matrix.getValue(5))).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0377 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0378
     * @tc.name testPathDeep0378
     * @tc.desc Verify the position matrix at the midpoint reports the half way point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0378', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0378 begin');
      await runCase('testPathDeep0378', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(0, 0);
        shape.lineTo(200, 0);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = shape.getMatrix(false, 100, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(Math.round(matrix.getValue(2))).assertEqual(100);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0378 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0379
     * @tc.name testPathDeep0379
     * @tc.desc Verify the tangent matrix translation matches position sampling.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0379', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0379 begin');
      await runCase('testPathDeep0379', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 60);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = shape.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        const sampled: boolean = shape.getPositionAndTangent(true, 0, position, tangent);
        expect(ok).assertTrue();
        expect(sampled).assertTrue();
        expect(Math.round(matrix.getValue(2))).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0379 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0380
     * @tc.name testPathDeep0380
     * @tc.desc Verify a quarter length sample lands on the circle rim.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0380', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0380 begin');
      await runCase('testPathDeep0380', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 60);
        const total: number = shape.getLength(true);
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        const ok: boolean = shape.getPositionAndTangent(true, total * 0.25, position, tangent);
        expect(ok).assertTrue();
        expect(Math.round(Math.abs(position.x - 100))).assertEqual(0);
        expect(Math.abs(position.y - 100) >= 55).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0380 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0381
     * @tc.name testPathDeep0381
     * @tc.desc Verify a forced closed measurement wraps onto the closing leg.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0381', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0381 begin');
      await runCase('testPathDeep0381', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(0, 0);
        shape.lineTo(100, 0);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = shape.getMatrix(true, 150, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(ok).assertTrue();
        expect(Math.round(matrix.getValue(2))).assertEqual(50);
        expect(shape.getLength(false)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0381 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0382
     * @tc.name testPathDeep0382
     * @tc.desc Verify an svg triangle paints the same pixels as the manual contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0382', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0382 begin');
      await runCase('testPathDeep0382', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const parsed: drawing.Path = new drawing.Path();
        const ok: boolean = parsed.buildFromSvgString('M20 20 L180 20 L100 180 Z');
        const manual: drawing.Path = new drawing.Path();
        manual.moveTo(20, 20);
        manual.lineTo(180, 20);
        manual.lineTo(100, 180);
        manual.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(parsed);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(manual);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(ok).assertTrue();
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left) >= 12000 && inkAll(left) <= 13600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0382 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0383
     * @tc.name testPathDeep0383
     * @tc.desc Verify the upper and lower case close commands paint alike.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0383', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0383 begin');
      await runCase('testPathDeep0383', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const upper: drawing.Path = new drawing.Path();
        const lower: drawing.Path = new drawing.Path();
        upper.buildFromSvgString('M20 20 L180 20 L100 180 Z');
        lower.buildFromSvgString('M20 20 L180 20 L100 180 z');
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(upper);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(lower);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(upper.isClosed()).assertTrue();
        expect(lower.isClosed()).assertTrue();
        expect(gapBytes(left, right)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0383 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0384
     * @tc.name testPathDeep0384
     * @tc.desc Verify an svg round trip restores the same raster.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0384', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0384 begin');
      await runCase('testPathDeep0384', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(30, 30, 150, 90));
        const svg: string = shape.convertToSvgString();
        const restored: drawing.Path = new drawing.Path();
        const ok: boolean = restored.buildFromSvgString(svg);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(shape);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(restored);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(ok).assertTrue();
        expect(svg.length > 0).assertTrue();
        expect(gapBytes(left, right)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0384 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0385
     * @tc.name testPathDeep0385
     * @tc.desc Verify a relative svg square matches the absolute square raster.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0385', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0385 begin');
      await runCase('testPathDeep0385', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const relative: drawing.Path = new drawing.Path();
        const absolute: drawing.Path = new drawing.Path();
        relative.buildFromSvgString('m20 20 l160 0 l0 160 l-160 0 z');
        absolute.buildFromSvgString('M20 20 L180 20 L180 180 L20 180 Z');
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(relative);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(absolute);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left)).assertEqual(25600);
        expect(relative.getBounds().right).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0385 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0386
     * @tc.name testPathDeep0386
     * @tc.desc Verify an svg quadratic command fills a curved wedge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0386', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0386 begin');
      await runCase('testPathDeep0386', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        const ok: boolean = shape.buildFromSvgString('M20 180 Q100 20 180 180 Z');
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(ok).assertTrue();
        expect(inkAll(buffer) >= 5000 && inkAll(buffer) <= 15000).assertTrue();
        expect(chanAt(buffer, 100, 80, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0386 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0387
     * @tc.name testPathDeep0387
     * @tc.desc Verify a line path exposes both end points in the point table.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0387', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0387 begin');
      await runCase('testPathDeep0387', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(0, 0);
        shape.lineTo(100, 0);
        const points: common2D.Point[] = shape.getPointData();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(points.length).assertEqual(2);
        expect(Math.round(points[1].x)).assertEqual(100);
        expect(inkAll(buffer)).assertEqual(300);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0387 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0388
     * @tc.name testPathDeep0388
     * @tc.desc Verify the verb table of a quad curve lists move then quad.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0388', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0388 begin');
      await runCase('testPathDeep0388', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(0, 0);
        shape.quadTo(50, 50, 100, 0);
        const verbs: drawing.PathIteratorVerb[] = shape.getVerbData();
        expect(verbs.length).assertEqual(2);
        expect(verbs[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(verbs[1]).assertEqual(drawing.PathIteratorVerb.QUAD);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0388 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0389
     * @tc.name testPathDeep0389
     * @tc.desc Verify a heavier conic weight bulges the filled wedge further.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0389', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0389 begin');
      await runCase('testPathDeep0389', async () => {
        const heavyTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lightTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const heavy: drawing.Path = new drawing.Path();
        heavy.moveTo(20, 180);
        heavy.conicTo(100, 20, 180, 180, 5);
        heavy.close();
        const light: drawing.Path = new drawing.Path();
        light.moveTo(20, 180);
        light.conicTo(100, 20, 180, 180, 0.1);
        light.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        heavyTarget.canvas.attachBrush(brush);
        heavyTarget.canvas.drawPath(heavy);
        heavyTarget.canvas.detachBrush();
        lightTarget.canvas.attachBrush(brush);
        lightTarget.canvas.drawPath(light);
        lightTarget.canvas.detachBrush();
        const heavyBuffer: ArrayBuffer = await readPixelBuffer(heavyTarget.pixelMap);
        const lightBuffer: ArrayBuffer = await readPixelBuffer(lightTarget.pixelMap);
        expect(inkAll(heavyBuffer) > inkAll(lightBuffer)).assertTrue();
        expect(chanAt(heavyBuffer, 100, 60, 3)).assertEqual(255);
        expect(chanAt(lightBuffer, 100, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0389 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0390
     * @tc.name testPathDeep0390
     * @tc.desc Verify the iterator peeks before consuming the first verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0390', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0390 begin');
      await runCase('testPathDeep0390', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(10, 10);
        shape.lineTo(90, 10);
        shape.lineTo(90, 90);
        const iterator: drawing.PathIterator = shape.getPathIterator();
        const points: common2D.Point[] = iteratorPoints();
        expect(iterator.peek()).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.hasNext()).assertTrue();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0390 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0391
     * @tc.name testPathDeep0391
     * @tc.desc Verify the iterator walk count equals the verb table length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0391', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0391 begin');
      await runCase('testPathDeep0391', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 90, 90));
        const iterator: drawing.PathIterator = shape.getPathIterator();
        const points: common2D.Point[] = iteratorPoints();
        let count: number = 0;
        let verb: drawing.PathIteratorVerb = drawing.PathIteratorVerb.MOVE;
        while (iterator.hasNext()) {
          verb = iterator.next(points);
          count = count + 1;
        }
        expect(count > 0).assertTrue();
        expect(count).assertEqual(shape.getVerbData().length);
        expect(shape.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0391 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0392
     * @tc.name testPathDeep0392
     * @tc.desc Verify two shifted rects stay interpolatable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0392', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0392 begin');
      await runCase('testPathDeep0392', async () => {
        const first: drawing.Path = new drawing.Path();
        first.addRect(ltrb(0, 0, 50, 50));
        const second: drawing.Path = new drawing.Path();
        second.addRect(ltrb(100, 100, 150, 150));
        expect(first.isInterpolate(second)).assertTrue();
        expect(first.getBounds().right).assertEqual(50);
        expect(second.getBounds().left).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0392 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0393
     * @tc.name testPathDeep0393
     * @tc.desc Verify interpolating at weight zero reproduces the start path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0393', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0393 begin');
      await runCase('testPathDeep0393', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const start: drawing.Path = new drawing.Path();
        start.addRect(ltrb(0, 0, 50, 50));
        const end: drawing.Path = new drawing.Path();
        end.addRect(ltrb(100, 100, 150, 150));
        const blended: drawing.Path = new drawing.Path();
        const ok: boolean = start.interpolate(end, 0, blended);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(start);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(blended);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(ok).assertTrue();
        expect(gapBytes(left, right)).assertEqual(10000);
        expect(blended.getBounds().left).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0393 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0394
     * @tc.name testPathDeep0394
     * @tc.desc Verify interpolating at weight one reproduces the end path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0394', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0394 begin');
      await runCase('testPathDeep0394', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const start: drawing.Path = new drawing.Path();
        start.addRect(ltrb(0, 0, 50, 50));
        const end: drawing.Path = new drawing.Path();
        end.addRect(ltrb(100, 100, 150, 150));
        const blended: drawing.Path = new drawing.Path();
        const ok: boolean = start.interpolate(end, 1, blended);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(end);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(blended);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(ok).assertTrue();
        expect(gapBytes(left, right)).assertEqual(10000);
        expect(blended.getBounds().left).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0394 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0395
     * @tc.name testPathDeep0395
     * @tc.desc Verify a half weight interpolation lifts the box half way.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0395', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0395 begin');
      await runCase('testPathDeep0395', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const start: drawing.Path = new drawing.Path();
        start.addRect(ltrb(0, 0, 50, 50));
        const end: drawing.Path = new drawing.Path();
        end.addRect(ltrb(100, 100, 150, 150));
        const blended: drawing.Path = new drawing.Path();
        start.interpolate(end, 0.5, blended);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(blended);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(Math.round(blended.getBounds().left)).assertEqual(50);
        expect(Math.round(blended.getBounds().top)).assertEqual(50);
        expect(inkAll(buffer)).assertEqual(2500);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0395 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0396
     * @tc.name testPathDeep0396
     * @tc.desc Verify a rect and a circle refuse to interpolate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0396', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0396 begin');
      await runCase('testPathDeep0396', async () => {
        const rect: drawing.Path = new drawing.Path();
        rect.addRect(ltrb(0, 0, 60, 60));
        const disc: drawing.Path = new drawing.Path();
        disc.addCircle(30, 30, 30);
        expect(rect.isInterpolate(disc)).assertFalse();
        expect(disc.isInterpolate(rect)).assertFalse();
        expect(rect.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0396 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0397
     * @tc.name testPathDeep0397
     * @tc.desc Verify a fresh rect path uses the plain winding fill type.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0397', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0397 begin');
      await runCase('testPathDeep0397', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.isInverseFillType()).assertFalse();
        expect(inkAll(buffer)).assertEqual(10000);
        expect(shape.contains(50, 50)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0397 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0398
     * @tc.name testPathDeep0398
     * @tc.desc Verify toggling the inverse flag paints the rect complement.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0398', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0398 begin');
      await runCase('testPathDeep0398', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        shape.toggleInverseFillType();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.isInverseFillType()).assertTrue();
        expect(inkAll(buffer)).assertEqual(25600);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0398 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0399
     * @tc.name testPathDeep0399
     * @tc.desc Verify toggling the inverse flag twice restores the raster.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0399', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0399 begin');
      await runCase('testPathDeep0399', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plain: drawing.Path = new drawing.Path();
        plain.addRect(ltrb(40, 40, 160, 160));
        const flipped: drawing.Path = new drawing.Path();
        flipped.addRect(ltrb(40, 40, 160, 160));
        flipped.toggleInverseFillType();
        flipped.toggleInverseFillType();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(plain);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(flipped);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(flipped.isInverseFillType()).assertFalse();
        expect(plain.isInverseFillType()).assertFalse();
        expect(gapBytes(left, right)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0399 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0400
     * @tc.name testPathDeep0400
     * @tc.desc Verify toggling an inverse even odd path yields even odd raster.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0400', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0400 begin');
      await runCase('testPathDeep0400', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const inverse: drawing.Path = new drawing.Path();
        inverse.addRect(ltrb(40, 40, 160, 160));
        inverse.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        inverse.toggleInverseFillType();
        const even: drawing.Path = new drawing.Path();
        even.addRect(ltrb(40, 40, 160, 160));
        even.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(inverse);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(even);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(inverse.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0400 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0401
     * @tc.name testPathDeep0401
     * @tc.desc Verify two identically built rects compare equal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0401', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0401 begin');
      await runCase('testPathDeep0401', async () => {
        const first: drawing.Path = new drawing.Path();
        first.addRect(ltrb(0, 0, 50, 50));
        const second: drawing.Path = new drawing.Path();
        second.addRect(ltrb(0, 0, 50, 50));
        expect(first.isEqual(second)).assertTrue();
        expect(second.isEqual(first)).assertTrue();
        expect(first.getVerbData().length).assertEqual(second.getVerbData().length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0401 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0402
     * @tc.name testPathDeep0402
     * @tc.desc Verify an offset path no longer equals the original.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0402', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0402 begin');
      await runCase('testPathDeep0402', async () => {
        const first: drawing.Path = new drawing.Path();
        first.addRect(ltrb(0, 0, 50, 50));
        const second: drawing.Path = new drawing.Path();
        second.addRect(ltrb(0, 0, 50, 50));
        second.offset(10, 0);
        expect(first.isEqual(second)).assertTrue();
        expect(second.getBounds().left).assertEqual(0);
        expect(first.getBounds().left).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0402 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0403
     * @tc.name testPathDeep0403
     * @tc.desc Verify offset and matrix translate paint the same pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0403', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0403 begin');
      await runCase('testPathDeep0403', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shifted: drawing.Path = new drawing.Path();
        shifted.addRect(ltrb(10, 10, 60, 60));
        shifted.offset(40, 40);
        const moved: drawing.Path = new drawing.Path();
        moved.addRect(ltrb(10, 10, 60, 60));
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(40, 40);
        moved.transform(shift);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(shifted);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(moved);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(9600);
        expect(shifted.getBounds().left).assertEqual(10);
        expect(moved.getBounds().left).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0403 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0404
     * @tc.name testPathDeep0404
     * @tc.desc Verify bounds ignore the ink that a wide pen adds outside.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0404', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0404 begin');
      await runCase('testPathDeep0404', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const bounds: common2D.Rect = shape.getBounds();
        expect(bounds.right).assertEqual(160);
        expect(chanAt(buffer, 165, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 7000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0404 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0405
     * @tc.name testPathDeep0405
     * @tc.desc Verify a wide pen turns an extracted segment into a thick band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0405', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0405 begin');
      await runCase('testPathDeep0405', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addCircle(100, 100, 60);
        const part: drawing.Path = new drawing.Path();
        const ok: boolean = source.getSegment(true, 0, 100, true, part);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(part);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(ok).assertTrue();
        expect(inkAll(buffer) >= 2000).assertTrue();
        expect(part.getLength(false) <= 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0405 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0406
     * @tc.name testPathDeep0406
     * @tc.desc Verify the oval start angle does not change the painted raster.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0406', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0406 begin');
      await runCase('testPathDeep0406', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const flat: drawing.Path = new drawing.Path();
        flat.addOval(ltrb(40, 40, 160, 160), 0);
        const tilted: drawing.Path = new drawing.Path();
        tilted.addOval(ltrb(40, 40, 160, 160), 45);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(flat);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(tilted);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left) >= 11000).assertTrue();
        expect(flat.getBounds().right).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0406 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0407
     * @tc.name testPathDeep0407
     * @tc.desc Verify clockwise and counter clockwise circles paint alike.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0407', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0407 begin');
      await runCase('testPathDeep0407', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clockwise: drawing.Path = new drawing.Path();
        clockwise.addCircle(100, 100, 60, drawing.PathDirection.CLOCKWISE);
        const counter: drawing.Path = new drawing.Path();
        counter.addCircle(100, 100, 60, drawing.PathDirection.COUNTER_CLOCKWISE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(clockwise);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(counter);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left) >= 11000).assertTrue();
        expect(clockwise.getVerbData().length).assertEqual(counter.getVerbData().length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0407 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0408
     * @tc.name testPathDeep0408
     * @tc.desc Verify opposite circle directions build a hollow ring in one path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0408', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0408 begin');
      await runCase('testPathDeep0408', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const ring: drawing.Path = new drawing.Path();
        ring.addCircle(100, 100, 80, drawing.PathDirection.CLOCKWISE);
        ring.addCircle(100, 100, 40, drawing.PathDirection.COUNTER_CLOCKWISE);
        ring.setFillType(drawing.PathFillType.WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(ring);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 14400 && inkAll(buffer) <= 15800).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0408 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0409
     * @tc.name testPathDeep0409
     * @tc.desc Verify force closed length adds the closing chord.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0409', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0409 begin');
      await runCase('testPathDeep0409', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(0, 0);
        shape.lineTo(100, 0);
        shape.lineTo(100, 100);
        expect(Math.round(shape.getLength(false))).assertEqual(200);
        expect(shape.getLength(true) > shape.getLength(false)).assertTrue();
        expect(Math.round(shape.getLength(true) - shape.getLength(false))).assertEqual(141);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0409 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0410
     * @tc.name testPathDeep0410
     * @tc.desc Verify an empty svg string leaves the path untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0410', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0410 begin');
      await runCase('testPathDeep0410', async () => {
        const empty: drawing.Path = new drawing.Path();
        const ok: boolean = empty.buildFromSvgString('');
        expect(ok).assertTrue();
        expect(empty.isEmpty()).assertTrue();
        expect(empty.getVerbData().length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0410 end');
    });

  });
}
