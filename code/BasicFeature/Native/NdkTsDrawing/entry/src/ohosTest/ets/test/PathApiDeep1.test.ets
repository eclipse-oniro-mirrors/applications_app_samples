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

export default function pathApiDeep1Test() {
  describe('PathApiDeep1Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0301
     * @tc.name testPathDeep0301
     * @tc.desc Verify a filled rect path covers exactly one hundred square pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPathDeep0301', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0301 begin');
      await runCase('testPathDeep0301', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0301 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0302
     * @tc.name testPathDeep0302
     * @tc.desc Verify a rect path crossing the right edge is clipped to the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0302', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0302 begin');
      await runCase('testPathDeep0302', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(100, 0, 300, 100));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 199, 50, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 100, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0302 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0303
     * @tc.name testPathDeep0303
     * @tc.desc Verify a rect path with negative edges keeps only the visible quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0303', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0303 begin');
      await runCase('testPathDeep0303', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(-50, -50, 50, 50));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0303 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0304
     * @tc.name testPathDeep0304
     * @tc.desc Verify a circle path fills a round disc of the expected size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0304', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0304 begin');
      await runCase('testPathDeep0304', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7700 && inkAll(buffer) <= 8000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 55, 55, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0304 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0305
     * @tc.name testPathDeep0305
     * @tc.desc Verify an oval path fills an ellipse wider than it is tall.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0305', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0305 begin');
      await runCase('testPathDeep0305', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addOval(ltrb(0, 50, 200, 150), 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getBounds().bottom).assertEqual(150);
        expect(inkAll(buffer) >= 15000 && inkAll(buffer) <= 16500).assertTrue();
        expect(inkRect(buffer, 0, 0, 20, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0305 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0306
     * @tc.name testPathDeep0306
     * @tc.desc Verify a zero height oval path fills nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0306', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0306 begin');
      await runCase('testPathDeep0306', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addOval(ltrb(0, 100, 200, 100), 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(shape.isEmpty()).assertFalse();
        expect(shape.getBounds().bottom - shape.getBounds().top).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0306 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0307
     * @tc.name testPathDeep0307
     * @tc.desc Verify a rounded rect path trims its four corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0307', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0307 begin');
      await runCase('testPathDeep0307', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRoundRect(new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 40, 40));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 38200 && inkAll(buffer) <= 39000).assertTrue();
        expect(chanAt(buffer, 2, 2, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0307 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0308
     * @tc.name testPathDeep0308
     * @tc.desc Verify a rounded rect path with zero radii fills the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0308', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0308 begin');
      await runCase('testPathDeep0308', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRoundRect(new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 0, 0));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0308 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0309
     * @tc.name testPathDeep0309
     * @tc.desc Verify a half arc path fills a half ellipse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0309', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0309 begin');
      await runCase('testPathDeep0309', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addArc(ltrb(0, 50, 200, 150), 0, 180);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7600 && inkAll(buffer) <= 8100).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0309 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0310
     * @tc.name testPathDeep0310
     * @tc.desc Verify a full arc path closes into a complete ellipse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0310', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0310 begin');
      await runCase('testPathDeep0310', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addArc(ltrb(0, 50, 200, 150), 0, 360);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 15000 && inkAll(buffer) <= 16500).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, 40)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0310 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0311
     * @tc.name testPathDeep0311
     * @tc.desc Verify a polygon triangle path fills its half box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0311', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0311 begin');
      await runCase('testPathDeep0311', async () => {
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
        expect(shape.contains(100, 100)).assertTrue();
        expect(inkAll(buffer) >= 12000 && inkAll(buffer) <= 13600).assertTrue();
        expect(chanAt(buffer, 30, 170, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0311 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0312
     * @tc.name testPathDeep0312
     * @tc.desc Verify a square polygon path fills its full box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0312', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0312 begin');
      await runCase('testPathDeep0312', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        const corners: Array<common2D.Point> = [point(20, 20), point(180, 20), point(180, 180), point(20, 180)];
        shape.addPolygon(corners, true);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(25600);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, 20, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0312 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0313
     * @tc.name testPathDeep0313
     * @tc.desc Verify two disjoint subpaths both fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0313', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0313 begin');
      await runCase('testPathDeep0313', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        shape.addRect(ltrb(100, 100, 200, 200));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0313 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0314
     * @tc.name testPathDeep0314
     * @tc.desc Verify overlapping subpaths fill once under the winding rule.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0314', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0314 begin');
      await runCase('testPathDeep0314', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        shape.addRect(ltrb(50, 50, 150, 150));
        shape.setFillType(drawing.PathFillType.WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(17500);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 120, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0314 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0315
     * @tc.name testPathDeep0315
     * @tc.desc Verify the even odd rule leaves the overlap of two subpaths empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0315', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0315 begin');
      await runCase('testPathDeep0315', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        shape.addRect(ltrb(50, 50, 150, 150));
        shape.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(15000);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0315 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0316
     * @tc.name testPathDeep0316
     * @tc.desc Verify a union of two rect paths fills their combined area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0316', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0316 begin');
      await runCase('testPathDeep0316', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(50, 50, 150, 150));
        shape.op(other, drawing.PathOp.UNION);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(17500);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(255);
        expect(chanAt(buffer, 120, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0316 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0317
     * @tc.name testPathDeep0317
     * @tc.desc Verify an intersection of two rect paths fills only the overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0317', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0317 begin');
      await runCase('testPathDeep0317', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(50, 50, 150, 150));
        shape.op(other, drawing.PathOp.INTERSECT);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(inkRect(buffer, 50, 50, 100, 100)).assertEqual(2500);
        expect(shape.getBounds().left).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0317 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0318
     * @tc.name testPathDeep0318
     * @tc.desc Verify a difference of two rect paths removes the overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0318', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0318 begin');
      await runCase('testPathDeep0318', async () => {
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
        expect(inkRect(buffer, 50, 50, 100, 100)).assertEqual(0);
        expect(shape.contains(20, 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0318 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0319
     * @tc.name testPathDeep0319
     * @tc.desc Verify a reverse difference keeps only the right operand tail.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0319', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0319 begin');
      await runCase('testPathDeep0319', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(50, 50, 150, 150));
        shape.op(other, drawing.PathOp.REVERSE_DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(7500);
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0319 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0320
     * @tc.name testPathDeep0320
     * @tc.desc Verify contains agrees with the painted pixels inside a rect path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0320', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0320 begin');
      await runCase('testPathDeep0320', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 120, 120));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.contains(70, 70)).assertTrue();
        expect(chanAt(buffer, 70, 70, 3)).assertEqual(255);
        expect(inkAll(buffer)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0320 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0321
     * @tc.name testPathDeep0321
     * @tc.desc Verify contains rejects a point outside the rect path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0321', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0321 begin');
      await runCase('testPathDeep0321', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 120, 120));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.contains(10, 70)).assertFalse();
        expect(chanAt(buffer, 10, 70, 3)).assertEqual(0);
        expect(chanAt(buffer, 110, 110, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0321 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0322
     * @tc.name testPathDeep0322
     * @tc.desc Verify contains follows the disc of a circle path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0322', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0322 begin');
      await runCase('testPathDeep0322', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.contains(100, 100)).assertTrue();
        expect(shape.contains(160, 160)).assertFalse();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0322 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0323
     * @tc.name testPathDeep0323
     * @tc.desc Verify a stroked rect path paints a ring of the pen width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0323', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0323 begin');
      await runCase('testPathDeep0323', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 180, 180));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(5120);
        expect(chanAt(buffer, 100, 20, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0323 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0324
     * @tc.name testPathDeep0324
     * @tc.desc Verify a stroked circle path paints a ring around the disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0324', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0324 begin');
      await runCase('testPathDeep0324', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 2800 && inkAll(buffer) <= 3600).assertTrue();
        expect(chanAt(buffer, 100, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0324 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0325
     * @tc.name testPathDeep0325
     * @tc.desc Verify a stroked line path paints a band as wide as the pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0325', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0325 begin');
      await runCase('testPathDeep0325', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 100);
        shape.lineTo(120, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(12);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1100 && inkAll(buffer) <= 1400).assertTrue();
        expect(chanAt(buffer, 70, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 70, 130, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0325 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0326
     * @tc.name testPathDeep0326
     * @tc.desc Verify a stroked triangle path outlines all three edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0326', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0326 begin');
      await runCase('testPathDeep0326', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.lineTo(100, 40);
        shape.lineTo(180, 180);
        shape.close();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 2400 && inkAll(buffer) <= 3400).assertTrue();
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0326 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0327
     * @tc.name testPathDeep0327
     * @tc.desc Verify a doubled canvas scale blows a rect path up to the full canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0327', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0327 begin');
      await runCase('testPathDeep0327', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.scale(2, 2);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(255);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0327 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0328
     * @tc.name testPathDeep0328
     * @tc.desc Verify a translated rect path lands on the shifted origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0328', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0328 begin');
      await runCase('testPathDeep0328', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(100, 100);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(255);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0328 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0329
     * @tc.name testPathDeep0329
     * @tc.desc Verify offsetting a rect path moves its filled box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0329', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0329 begin');
      await runCase('testPathDeep0329', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        shape.offset(100, 100);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(shape.getBounds().left).assertEqual(0);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0329 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0330
     * @tc.name testPathDeep0330
     * @tc.desc Verify a path transform matches the same canvas transform.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0330', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0330 begin');
      await runCase('testPathDeep0330', async () => {
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(30, 40);
        const viaPath: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const moved: drawing.Path = new drawing.Path();
        moved.addRect(ltrb(10, 10, 60, 60));
        moved.transform(shift);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        viaPath.canvas.attachBrush(brush);
        viaPath.canvas.drawPath(moved);
        viaPath.canvas.detachBrush();
        const viaCanvas: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plain: drawing.Path = new drawing.Path();
        plain.addRect(ltrb(10, 10, 60, 60));
        viaCanvas.canvas.translate(30, 40);
        viaCanvas.canvas.attachBrush(brush);
        viaCanvas.canvas.drawPath(plain);
        viaCanvas.canvas.detachBrush();
        const pathBuffer: ArrayBuffer = await readPixelBuffer(viaPath.pixelMap);
        const canvasBuffer: ArrayBuffer = await readPixelBuffer(viaCanvas.pixelMap);
        expect(gapBytes(pathBuffer, canvasBuffer)).assertEqual(0);
        expect(inkAll(pathBuffer)).assertEqual(2500);
        expect(chanAt(pathBuffer, 50, 50, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0330 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0331
     * @tc.name testPathDeep0331
     * @tc.desc Verify set copies a path into an independent object.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0331', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0331 begin');
      await runCase('testPathDeep0331', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(0, 0, 50, 50));
        const copy: drawing.Path = new drawing.Path();
        copy.set(source);
        source.addRect(ltrb(100, 100, 150, 150));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(copy);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(copy.contains(25, 25)).assertTrue();
        expect(copy.contains(125, 125)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0331 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0332
     * @tc.name testPathDeep0332
     * @tc.desc Verify reset empties a drawn path completely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0332', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0332 begin');
      await runCase('testPathDeep0332', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 120, 120));
        shape.reset();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.isEmpty()).assertTrue();
        expect(Math.round(shape.getLength(false))).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0332 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0333
     * @tc.name testPathDeep0333
     * @tc.desc Verify rewind keeps a path usable for the next contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0333', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0333 begin');
      await runCase('testPathDeep0333', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 80, 80));
        shape.rewind();
        shape.addCircle(100, 100, 40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 4800 && inkAll(buffer) <= 5300).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0333 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0334
     * @tc.name testPathDeep0334
     * @tc.desc Verify addPath with a matrix shifts only the appended contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0334', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0334 begin');
      await runCase('testPathDeep0334', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: drawing.Path = new drawing.Path();
        base.addRect(ltrb(0, 0, 50, 50));
        const extra: drawing.Path = new drawing.Path();
        extra.addRect(ltrb(0, 0, 50, 50));
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(100, 100);
        base.addPath(extra, shift);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(base);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(5000);
        expect(base.getBounds().right).assertEqual(150);
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0334 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0335
     * @tc.name testPathDeep0335
     * @tc.desc Verify nested circles stay solid under the winding rule.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0335', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0335 begin');
      await runCase('testPathDeep0335', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 70);
        shape.addCircle(100, 100, 30);
        shape.setFillType(drawing.PathFillType.WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(shape.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(inkAll(buffer) >= 15200 && inkAll(buffer) <= 16100).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0335 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0336
     * @tc.name testPathDeep0336
     * @tc.desc Verify inverse winding fills everything outside the rect contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0336', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0336 begin');
      await runCase('testPathDeep0336', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        shape.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(25600);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0336 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0337
     * @tc.name testPathDeep0337
     * @tc.desc Verify inverse even odd leaves the inner rect transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0337', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0337 begin');
      await runCase('testPathDeep0337', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 180, 180));
        shape.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(14400);
        expect(inkRect(buffer, 20, 20, 180, 180)).assertEqual(0);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0337 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0338
     * @tc.name testPathDeep0338
     * @tc.desc Verify a circle path reports winding fill and non rect contours.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0338', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0338 begin');
      await runCase('testPathDeep0338', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        expect(shape.getFillType()).assertEqual(drawing.PathFillType.WINDING);
        expect(shape.isRect(null)).assertFalse();
        expect(shape.approximate(1).length >= 8).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0338 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0339
     * @tc.name testPathDeep0339
     * @tc.desc Verify the measured length of a rect path matches its perimeter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0339', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0339 begin');
      await runCase('testPathDeep0339', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 50));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(Math.round(shape.getLength(false))).assertEqual(300);
        expect(inkAll(buffer)).assertEqual(5000);
        expect(chanAt(buffer, 50, 25, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0339 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0340
     * @tc.name testPathDeep0340
     * @tc.desc Verify isRect reports the contour bounds of a painted rect path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0340', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0340 begin');
      await runCase('testPathDeep0340', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(30, 40, 130, 140));
        const out: common2D.Rect = ltrb(0, 0, 0, 0);
        expect(shape.isRect(out)).assertTrue();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(out.right).assertEqual(130);
        expect(inkAll(buffer)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0340 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0341
     * @tc.name testPathDeep0341
     * @tc.desc Verify a tangent arc stroke starts at the current point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0341', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0341 begin');
      await runCase('testPathDeep0341', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 100);
        shape.arcTo(20, 20, 180, 20, 0, 90);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 20, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, 15)).assertEqual(0);
        expect(inkAll(buffer) >= 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0341 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0342
     * @tc.name testPathDeep0342
     * @tc.desc Verify a quadratic curve stroke passes through its apex.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0342', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0342 begin');
      await runCase('testPathDeep0342', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.quadTo(100, 20, 180, 180);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 500 && inkAll(buffer) <= 2000).assertTrue();
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0342 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0343
     * @tc.name testPathDeep0343
     * @tc.desc Verify a negative sweep arc keeps the contour in the upper half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0343', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0343 begin');
      await runCase('testPathDeep0343', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addArc(ltrb(0, 50, 200, 150), 0, -180);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 60, 3)).assertEqual(255);
        expect(shape.getBounds().top).assertEqual(50);
        expect(inkRect(buffer, 0, 100, CANVAS_SIZE, 150)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0343 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0344
     * @tc.name testPathDeep0344
     * @tc.desc Verify a large corner radius rounds a canvas rect path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0344', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0344 begin');
      await runCase('testPathDeep0344', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRoundRect(new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 100, 100));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 2, 2, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 30000 && inkAll(buffer) <= 33000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0344 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0345
     * @tc.name testPathDeep0345
     * @tc.desc Verify a scale matrix enlarges a rect path in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0345', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0345 begin');
      await runCase('testPathDeep0345', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 60));
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        shape.transform(zoom);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(shape.getBounds().right).assertEqual(120);
        expect(chanAt(buffer, 110, 110, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0345 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0346
     * @tc.name testPathDeep0346
     * @tc.desc Verify addPath without a matrix keeps the contour position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0346', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0346 begin');
      await runCase('testPathDeep0346', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: drawing.Path = new drawing.Path();
        base.addRect(ltrb(0, 0, 50, 50));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(100, 0, 150, 50));
        base.addPath(other);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(base);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(base.getBounds().right).assertEqual(150);
        expect(inkAll(buffer)).assertEqual(5000);
        expect(chanAt(buffer, 125, 25, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0346 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0347
     * @tc.name testPathDeep0347
     * @tc.desc Verify a circle and oval on the same box cancel under even odd.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0347', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0347 begin');
      await runCase('testPathDeep0347', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 60);
        shape.addOval(ltrb(40, 40, 160, 160), 0);
        shape.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(shape.isEmpty()).assertFalse();
        expect(shape.contains(100, 100)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0347 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0348
     * @tc.name testPathDeep0348
     * @tc.desc Verify a closed manual triangle paints its interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0348', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0348 begin');
      await runCase('testPathDeep0348', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(100, 20);
        shape.lineTo(180, 180);
        shape.lineTo(20, 180);
        shape.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 12000 && inkAll(buffer) <= 13600).assertTrue();
        expect(chanAt(buffer, 100, 120, 3)).assertEqual(255);
        expect(shape.contains(100, 150)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0348 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0349
     * @tc.name testPathDeep0349
     * @tc.desc Verify a cubic curve stroke spans the whole width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0349', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0349 begin');
      await runCase('testPathDeep0349', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 100);
        shape.cubicTo(60, 20, 140, 180, 180, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 20, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 180, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, 20, CANVAS_SIZE)).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0349 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0350
     * @tc.name testPathDeep0350
     * @tc.desc Verify a sweep beyond a full turn clamps to one ellipse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0350', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0350 begin');
      await runCase('testPathDeep0350', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addArc(ltrb(0, 50, 200, 150), 0, 720);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 15000 && inkAll(buffer) <= 16500).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(shape.getBounds().right).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0350 end');
    });

  });
}
