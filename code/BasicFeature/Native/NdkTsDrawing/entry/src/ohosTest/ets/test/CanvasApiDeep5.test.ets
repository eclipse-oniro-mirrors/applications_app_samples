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

export default function canvasApiDeep5Test() {
  describe('CanvasApiDeep5Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0263
     * @tc.name testCanvasDeep0263
     * @tc.desc Verify a path union of two bars paints both bars.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0263', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0263 begin');
      await runCase('testCanvasDeep0263', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const left: drawing.Path = new drawing.Path();
        left.addRect(ltrb(0, 0, 90, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(110, 0, 200, 100));
        left.op(other, drawing.PathOp.UNION);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(left);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(18000);
        expect(chanAt(buffer, 100, 50, 3)).assertEqual(0);
        expect(chanAt(buffer, 150, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0263 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0264
     * @tc.name testCanvasDeep0264
     * @tc.desc Verify a path intersect keeps only the overlap box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0264', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0264 begin');
      await runCase('testCanvasDeep0264', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(50, 50, 150, 150));
        shape.op(other, drawing.PathOp.INTERSECT);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0264 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0265
     * @tc.name testCanvasDeep0265
     * @tc.desc Verify a path difference removes the right operand.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0265', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0265 begin');
      await runCase('testCanvasDeep0265', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(50, 50, 150, 150));
        shape.op(other, drawing.PathOp.DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(7500);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0265 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0266
     * @tc.name testCanvasDeep0266
     * @tc.desc Verify a path xor drops the shared overlap twice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0266', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0266 begin');
      await runCase('testCanvasDeep0266', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(50, 50, 150, 150));
        shape.op(other, drawing.PathOp.XOR);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(15000);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(0);
        expect(chanAt(buffer, 10, 90, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0266 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0267
     * @tc.name testCanvasDeep0267
     * @tc.desc Verify EVEN_ODD fill type turns nested rects into a ring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0267', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0267 begin');
      await runCase('testCanvasDeep0267', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        shape.addRect(ltrb(40, 40, 160, 160));
        shape.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(25600);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0267 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0268
     * @tc.name testCanvasDeep0268
     * @tc.desc Verify WINDING fill type fills nested rects solid.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0268', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0268 begin');
      await runCase('testCanvasDeep0268', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        shape.addRect(ltrb(40, 40, 160, 160));
        shape.setFillType(drawing.PathFillType.WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 40, 40, 160, 160)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0268 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0269
     * @tc.name testCanvasDeep0269
     * @tc.desc Verify a closed polygon fills a triangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0269', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0269 begin');
      await runCase('testCanvasDeep0269', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        const corners: Array<common2D.Point> = [point(20, 20), point(180, 20), point(100, 180)];
        shape.addPolygon(corners, true);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 12000 && inkAll(buffer) <= 13600).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 30, 170, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0269 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0270
     * @tc.name testCanvasDeep0270
     * @tc.desc Verify an open polygon only strokes its segments.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0270', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0270 begin');
      await runCase('testCanvasDeep0270', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        const corners: Array<common2D.Point> = [point(20, 180), point(100, 40), point(180, 180)];
        shape.addPolygon(corners, false);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1600 && inkAll(buffer) <= 2300).assertTrue();
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0270 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0271
     * @tc.name testCanvasDeep0271
     * @tc.desc Verify an oval path fills an ellipse inside its box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0271', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0271 begin');
      await runCase('testCanvasDeep0271', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addOval(ltrb(0, 50, 200, 150), 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 15000 && inkAll(buffer) <= 16500).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0271 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0272
     * @tc.name testCanvasDeep0272
     * @tc.desc Verify two circles with EVEN_ODD fill build a donut.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0272', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0272 begin');
      await runCase('testCanvasDeep0272', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const ring: drawing.Path = new drawing.Path();
        ring.addCircle(100, 100, 80);
        ring.addCircle(100, 100, 40);
        ring.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(ring);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 14400 && inkAll(buffer) <= 15800).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0272 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0273
     * @tc.name testCanvasDeep0273
     * @tc.desc Verify offsetting a circle path moves its filled disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0273', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0273 begin');
      await runCase('testCanvasDeep0273', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const disc: drawing.Path = new drawing.Path();
        disc.addCircle(100, 100, 30);
        disc.offset(50, 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(disc);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 2600 && inkAll(buffer) <= 3100).assertTrue();
        expect(chanAt(buffer, 150, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0273 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0274
     * @tc.name testCanvasDeep0274
     * @tc.desc Verify a quadratic curve peaks at half its control height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0274', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0274 begin');
      await runCase('testCanvasDeep0274', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 160);
        shape.quadTo(100, 20, 180, 160);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1324);
        expect(chanAt(buffer, 100, 90, 3)).assertEqual(255);
        expect(shape.getBounds().top).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0274 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0275
     * @tc.name testCanvasDeep0275
     * @tc.desc Verify a closed triangle path fills its interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0275', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0275 begin');
      await runCase('testCanvasDeep0275', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.lineTo(180, 180);
        shape.lineTo(100, 20);
        shape.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 12000 && inkAll(buffer) <= 13600).assertTrue();
        expect(shape.isClosed()).assertTrue();
        expect(chanAt(buffer, 100, 150, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0275 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0276
     * @tc.name testCanvasDeep0276
     * @tc.desc Verify drawImage copies a source canvas at the given origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0276', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0276 begin');
      await runCase('testCanvasDeep0276', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        source.canvas.attachBrush(brush);
        source.canvas.drawRect(0, 0, 100, 100);
        source.canvas.detachBrush();
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 50, 50);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 60, 60, 0)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0276 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0277
     * @tc.name testCanvasDeep0277
     * @tc.desc Verify drawImageRect shrinks the source into a smaller box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0277', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0277 begin');
      await runCase('testCanvasDeep0277', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        source.canvas.attachBrush(brush);
        source.canvas.drawRect(0, 0, 100, 100);
        source.canvas.detachBrush();
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, 50, 50));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 20, 20, 2)).assertEqual(255);
        expect(chanAt(buffer, 80, 80, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0277 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0278
     * @tc.name testCanvasDeep0278
     * @tc.desc Verify drawImage follows a canvas translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0278', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0278 begin');
      await runCase('testCanvasDeep0278', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        source.canvas.attachBrush(brush);
        source.canvas.drawRect(0, 0, 100, 100);
        source.canvas.detachBrush();
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(80, 20);
        target.canvas.drawImage(source.pixelMap, 0, 0);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 90, 30, 1)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0278 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0279
     * @tc.name testCanvasDeep0279
     * @tc.desc Verify drawImageRectWithSrc magnifies a source window.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0279', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0279 begin');
      await runCase('testCanvasDeep0279', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        source.canvas.attachBrush(brush);
        source.canvas.drawRect(0, 0, 100, 100);
        source.canvas.detachBrush();
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, 50, 50), ltrb(0, 0, 100, 100));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 50, 50, 0)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0279 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0280
     * @tc.name testCanvasDeep0280
     * @tc.desc Verify a linear gradient brush fades across the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0280', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0280 begin');
      await runCase('testCanvasDeep0280', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: Array<number> = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createLinearGradient(point(20, 100),
          point(180, 100), colors, drawing.TileMode.CLAMP);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(shader);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 30, 100, 0) > chanAt(buffer, 170, 100, 0)).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0280 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0281
     * @tc.name testCanvasDeep0281
     * @tc.desc Verify a radial gradient keeps its centre colour focal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0281', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0281 begin');
      await runCase('testCanvasDeep0281', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: Array<number> = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createRadialGradient(point(100, 100),
          80, colors, drawing.TileMode.CLAMP);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(shader);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(253);
        expect(chanAt(buffer, 5, 5, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0281 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0282
     * @tc.name testCanvasDeep0282
     * @tc.desc Verify a sweep gradient varies its colour around the centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0282', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0282 begin');
      await runCase('testCanvasDeep0282', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: Array<number> = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createSweepGradient(point(100, 100),
          colors, drawing.TileMode.CLAMP, 0, 360);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setShaderEffect(shader);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 150, 100, 0) > chanAt(buffer, 50, 100, 0)).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0282 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0283
     * @tc.name testCanvasDeep0283
     * @tc.desc Verify a blend colour filter repaints the brush colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0283', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0283 begin');
      await runCase('testCanvasDeep0283', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const filter: drawing.ColorFilter = drawing.ColorFilter.createBlendModeColorFilter(
          rgba(255, 0, 255, 0), drawing.BlendMode.SRC_IN);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setColorFilter(filter);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0283 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0284
     * @tc.name testCanvasDeep0284
     * @tc.desc Verify a blur mask filter spreads the filled edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0284', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0284 begin');
      await runCase('testCanvasDeep0284', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 4));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(80, 80, 120, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 1600).assertTrue();
        expect(inkAll(buffer) < 6400).assertTrue();
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0284 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0285
     * @tc.name testCanvasDeep0285
     * @tc.desc Verify a blurred pen stroke widens the painted band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0285', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0285 begin');
      await runCase('testCanvasDeep0285', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 6));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 3200).assertTrue();
        expect(inkAll(buffer) < 9000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(238);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0285 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0286
     * @tc.name testCanvasDeep0286
     * @tc.desc Verify drawImageNine stretches the nine patches over the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0286', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0286 begin');
      await runCase('testCanvasDeep0286', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        source.canvas.attachBrush(brush);
        source.canvas.drawRect(0, 0, 100, 100);
        source.canvas.detachBrush();
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageNine(source.pixelMap, ltrb(20, 20, 80, 80),
          ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), drawing.FilterMode.FILTER_MODE_LINEAR);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(255);
        expect(chanAt(buffer, 0, 0, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0286 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0287
     * @tc.name testCanvasDeep0287
     * @tc.desc Verify an active clip trims a scaled image draw.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0287', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0287 begin');
      await runCase('testCanvasDeep0287', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        source.canvas.attachBrush(brush);
        source.canvas.drawRect(0, 0, 100, 100);
        source.canvas.detachBrush();
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 50, 50, 0)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0287 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0288
     * @tc.name testCanvasDeep0288
     * @tc.desc Verify drawSingleCharacter paints one glyph only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0288', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0288 begin');
      await runCase('testCanvasDeep0288', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('A', font, 50, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 100).assertTrue();
        expect(inkAll(buffer) < 6000).assertTrue();
        expect(inkRect(buffer, 0, 0, 50, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0288 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0289
     * @tc.name testCanvasDeep0289
     * @tc.desc Verify a fully transparent text blob leaves the canvas empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0289', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0289 begin');
      await runCase('testCanvasDeep0289', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Blob', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setAlpha(0);
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 20, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 40, 90, 3)).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0289 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0290
     * @tc.name testCanvasDeep0290
     * @tc.desc Verify a larger font size paints a larger glyph area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0290', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0290 begin');
      await runCase('testCanvasDeep0290', async () => {
        const smallFont: drawing.Font = new drawing.Font();
        smallFont.setSize(20);
        const bigFont: drawing.Font = new drawing.Font();
        bigFont.setSize(60);
        const smallBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('G', smallFont);
        const bigBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('G', bigFont);
        const small: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const big: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        small.canvas.attachBrush(brush);
        small.canvas.drawTextBlob(smallBlob, 40, 120);
        small.canvas.detachBrush();
        big.canvas.attachBrush(brush);
        big.canvas.drawTextBlob(bigBlob, 40, 120);
        big.canvas.detachBrush();
        const smallBuffer: ArrayBuffer = await readPixelBuffer(small.pixelMap);
        const bigBuffer: ArrayBuffer = await readPixelBuffer(big.pixelMap);
        expect(inkAll(bigBuffer) > inkAll(smallBuffer)).assertTrue();
        expect(gapBytes(bigBuffer, smallBuffer) > 0).assertTrue();
        expect(bigFont.measureText('G', drawing.TextEncoding.TEXT_ENCODING_UTF8) >
          smallFont.measureText('G', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0290 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0291
     * @tc.name testCanvasDeep0291
     * @tc.desc Verify two INTERSECT region clips keep their overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0291', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0291 begin');
      await runCase('testCanvasDeep0291', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const first: drawing.Region = new drawing.Region(0, 0, 150, 150);
        const second: drawing.Region = new drawing.Region(50, 50, 200, 200);
        target.canvas.clipRegion(first, drawing.ClipOp.INTERSECT);
        target.canvas.clipRegion(second, drawing.ClipOp.INTERSECT);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0291 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0292
     * @tc.name testCanvasDeep0292
     * @tc.desc Verify a region clip is unaffected by a later translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0292', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0292 begin');
      await runCase('testCanvasDeep0292', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Region = new drawing.Region(0, 0, 100, 100);
        target.canvas.clipRegion(clip);
        target.canvas.translate(50, 50);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0292 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0293
     * @tc.name testCanvasDeep0293
     * @tc.desc Verify a triangle fan fills the quad it wraps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0293', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0293 begin');
      await runCase('testCanvasDeep0293', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const quad: Array<common2D.Point> = [point(20, 20), point(180, 20), point(180, 180), point(20, 180)];
        const colors: Array<number> = [0xFFFF0000, 0xFFFF0000, 0xFFFF0000, 0xFFFF0000];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE, 4, quad, null, colors, 0, null,
          drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 24000 && inkAll(buffer) <= 25600).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0293 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0294
     * @tc.name testCanvasDeep0294
     * @tc.desc Verify vertices drawn over a fill blend into it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0294', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0294 begin');
      await runCase('testCanvasDeep0294', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const triangle: Array<common2D.Point> = [point(20, 20), point(180, 20), point(100, 180)];
        const colors: Array<number> = [0xFFFFFF00, 0xFFFFFF00, 0xFFFFFF00];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, triangle, null, colors, 0, null,
          drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 60, 1)).assertEqual(255);
        expect(chanAt(buffer, 5, 195, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0294 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0295
     * @tc.name testCanvasDeep0295
     * @tc.desc Verify nested save and scale restore the original frame.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0295', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0295 begin');
      await runCase('testCanvasDeep0295', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.translate(60, 60);
        target.canvas.save();
        target.canvas.scale(2, 2);
        target.canvas.restore();
        target.canvas.restore();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0295 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0296
     * @tc.name testCanvasDeep0296
     * @tc.desc Verify a translation preserves the painted area of a rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0296', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0296 begin');
      await runCase('testCanvasDeep0296', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawRect(20, 20, 80, 80);
        plain.canvas.detachBrush();
        const moved: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        moved.canvas.translate(50, 0);
        moved.canvas.attachBrush(brush);
        moved.canvas.drawRect(20, 20, 80, 80);
        moved.canvas.detachBrush();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const movedBuffer: ArrayBuffer = await readPixelBuffer(moved.pixelMap);
        expect(inkAll(movedBuffer)).assertEqual(inkAll(plainBuffer));
        expect(chanAt(movedBuffer, 80, 50, 3)).assertEqual(255);
        expect(gapBytes(plainBuffer, movedBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0296 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0297
     * @tc.name testCanvasDeep0297
     * @tc.desc Verify a brush fill survives detaching the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0297', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0297 begin');
      await runCase('testCanvasDeep0297', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 10200 && inkAll(buffer) <= 11000).assertTrue();
        expect(chanAt(buffer, 50, 50, 0)).assertEqual(0);
        expect(chanAt(buffer, 100, 50, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0297 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0298
     * @tc.name testCanvasDeep0298
     * @tc.desc Verify a full save clip fill and stroke pipeline lands inside the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0298', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0298 begin');
      await runCase('testCanvasDeep0298', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.clipRect(ltrb(10, 10, 150, 150));
        target.canvas.translate(10, 10);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 50, 100, 50);
        target.canvas.detachPen();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 60, 60, 0)).assertEqual(0);
        expect(chanAt(buffer, 60, 60, 2)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0298 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0299
     * @tc.name testCanvasDeep0299
     * @tc.desc Verify a save layer keeps a stroked outline inside its bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0299', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0299 begin');
      await runCase('testCanvasDeep0299', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.saveLayer(ltrb(40, 40, 160, 160));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachPen();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(0);
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0299 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0300
     * @tc.name testCanvasDeep0300
     * @tc.desc Verify a rotated clip keeps its local coordinates.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0300', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0300 begin');
      await runCase('testCanvasDeep0300', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.rotate(90, 100, 100);
        target.canvas.clipRect(ltrb(60, 60, 140, 140));
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(60, 60, 140, 140);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(bounds.right - bounds.left).assertEqual(82);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0300 end');
    });

  });
}
