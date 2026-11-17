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

export default function matrixApiDeep1Test() {
  describe('MatrixApiDeep1Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0651
     * @tc.name testMatrixDeep0651
     * @tc.desc Verify a translation matrix applied to the canvas moves rectangle ink right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0651', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0651 begin');
      await runCase('testMatrixDeep0651', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(90, 0);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(10, 20, 60, 80));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 80, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
        expect(matrix.getValue(2)).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0651 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0652
     * @tc.name testMatrixDeep0652
     * @tc.desc Verify a half scale matrix quarters the filled area on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0652', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0652 begin');
      await runCase('testMatrixDeep0652', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shrunk: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawRect(ltrb(40, 40, 160, 160));
        plain.canvas.detachBrush();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0.5, 0.5, 0, 0);
        shrunk.canvas.setMatrix(matrix);
        shrunk.canvas.attachBrush(brush);
        shrunk.canvas.drawRect(ltrb(40, 40, 160, 160));
        shrunk.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(shrunk.pixelMap);
        expect(inkAll(right) < inkAll(left) / 2).assertTrue();
        expect(Math.abs(inkAll(right) * 4 - inkAll(left)) < inkAll(left) * 0.1).assertTrue();
        expect(matrix.getValue(0)).assertEqual(0.5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0652 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0653
     * @tc.name testMatrixDeep0653
     * @tc.desc Verify a doubled scale matrix quadruples the filled area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0653', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0653 begin');
      await runCase('testMatrixDeep0653', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const grown: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawRect(ltrb(40, 40, 80, 80));
        plain.canvas.detachBrush();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        grown.canvas.setMatrix(matrix);
        grown.canvas.attachBrush(brush);
        grown.canvas.drawRect(ltrb(40, 40, 80, 80));
        grown.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(grown.pixelMap);
        expect(inkAll(right) > inkAll(left) * 3).assertTrue();
        expect(inkAll(right) < inkAll(left) * 5).assertTrue();
        expect(matrix.getValue(0)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0653 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0654
     * @tc.name testMatrixDeep0654
     * @tc.desc Verify a quarter turn turns a flat strip into a vertical strip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0654', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0654 begin');
      await runCase('testMatrixDeep0654', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(40, 95, 160, 105));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 80, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 90, 0, 110, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, 30)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0654 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0655
     * @tc.name testMatrixDeep0655
     * @tc.desc Verify a horizontal skew shears the rectangle without changing its area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0655', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0655 begin');
      await runCase('testMatrixDeep0655', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const sheared: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawRect(ltrb(40, 20, 140, 80));
        plain.canvas.detachBrush();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        sheared.canvas.setMatrix(matrix);
        sheared.canvas.attachBrush(brush);
        sheared.canvas.drawRect(ltrb(40, 20, 140, 80));
        sheared.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(sheared.pixelMap);
        expect(inkRect(left, 170, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(right, 170, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
        expect(Math.abs(inkAll(right) - inkAll(left)) < inkAll(left) * 0.1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0655 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0656
     * @tc.name testMatrixDeep0656
     * @tc.desc Verify concat after setMatrix applies the shift in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0656', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0656 begin');
      await runCase('testMatrixDeep0656', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        target.canvas.setMatrix(matrix);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(20, 0);
        target.canvas.concatMatrix(shift);
        const total: drawing.Matrix = target.canvas.getTotalMatrix();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(10, 20, 40, 60));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(total.getValue(0)).assertEqual(2);
        expect(total.getValue(2)).assertEqual(40);
        expect(inkRect(buffer, 0, 0, 30, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0656 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0657
     * @tc.name testMatrixDeep0657
     * @tc.desc Verify a restored save slot drops the matrix set inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0657', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0657 begin');
      await runCase('testMatrixDeep0657', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(80, 0);
        target.canvas.concatMatrix(matrix);
        target.canvas.restore();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(10, 20, 60, 80));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.getTotalMatrix().isIdentity()).assertTrue();
        expect(inkRect(buffer, 0, 0, 70, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 120, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0657 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0658
     * @tc.name testMatrixDeep0658
     * @tc.desc Verify resetMatrix brings the canvas back to the plain frame.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0658', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0658 begin');
      await runCase('testMatrixDeep0658', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const cleared: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(60, 0);
        cleared.canvas.setMatrix(matrix);
        cleared.canvas.resetMatrix();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawRect(ltrb(20, 20, 80, 80));
        plain.canvas.detachBrush();
        cleared.canvas.attachBrush(brush);
        cleared.canvas.drawRect(ltrb(20, 20, 80, 80));
        cleared.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(cleared.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(cleared.canvas.getTotalMatrix().isIdentity()).assertTrue();
        expect(inkAll(left) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0658 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0659
     * @tc.name testMatrixDeep0659
     * @tc.desc Verify the canvas honours an inverted translation matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0659', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0659 begin');
      await runCase('testMatrixDeep0659', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const forward: drawing.Matrix = new drawing.Matrix();
        forward.setTranslation(40, 0);
        const backward: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = forward.invert(backward);
        target.canvas.setMatrix(backward);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(60, 40, 120, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(ok).assertTrue();
        expect(backward.getValue(2)).assertEqual(-40);
        expect(inkRect(buffer, 130, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0659 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0660
     * @tc.name testMatrixDeep0660
     * @tc.desc Verify the centre fit mode centres a square inside a larger box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0660', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0660 begin');
      await runCase('testMatrixDeep0660', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const fitted: boolean = matrix.setRectToRect(ltrb(0, 0, 100, 100), ltrb(40, 40, 160, 160),
          drawing.ScaleToFit.CENTER_SCALE_TO_FIT);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(fitted).assertTrue();
        expect(inkRect(buffer, 0, 0, 40, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 160, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 55, 55, 145, 145) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0660 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0661
     * @tc.name testMatrixDeep0661
     * @tc.desc Verify the start fit mode pins the square against the left edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0661', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0661 begin');
      await runCase('testMatrixDeep0661', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const fitted: boolean = matrix.setRectToRect(ltrb(0, 0, 100, 100), ltrb(40, 40, 160, 160),
          drawing.ScaleToFit.START_SCALE_TO_FIT);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(fitted).assertTrue();
        expect(inkRect(buffer, 0, 0, 40, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 45, 45, 135, 135) > 0).assertTrue();
        expect(inkRect(buffer, 150, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(1200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0661 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0662
     * @tc.name testMatrixDeep0662
     * @tc.desc Verify the end fit mode pins the square against the right edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0662', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0662 begin');
      await runCase('testMatrixDeep0662', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        const fitted: boolean = matrix.setRectToRect(ltrb(0, 0, 100, 100), ltrb(40, 40, 160, 160),
          drawing.ScaleToFit.END_SCALE_TO_FIT);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(fitted).assertTrue();
        expect(inkRect(buffer, 0, 0, 50, CANVAS_SIZE)).assertEqual(1200);
        expect(inkRect(buffer, 150, 0, 170, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 175, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0662 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0663
     * @tc.name testMatrixDeep0663
     * @tc.desc Verify a two point polygon mapping behaves as a pure translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0663', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0663 begin');
      await runCase('testMatrixDeep0663', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = matrix.setPolyToPoly([point(0, 0), point(1, 0)],
          [point(10, 20), point(11, 20)], 2);
        const mapped: common2D.Point[] = matrix.mapPoints([point(5, 5)]);
        expect(ok).assertTrue();
        expect(Math.abs(mapped[0].x - 15) < 0.001).assertTrue();
        expect(Math.abs(mapped[0].y - 25) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0663 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0664
     * @tc.name testMatrixDeep0664
     * @tc.desc Verify a four point polygon mapping scales a unit square onto a box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0664', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0664 begin');
      await runCase('testMatrixDeep0664', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const src: common2D.Point[] = [point(0, 0), point(1, 0), point(1, 1), point(0, 1)];
        const dst: common2D.Point[] = [point(100, 100), point(180, 100), point(180, 180), point(100, 180)];
        const ok: boolean = matrix.setPolyToPoly(src, dst, 4);
        const mapped: common2D.Point[] = matrix.mapPoints([point(0.5, 0.5)]);
        expect(ok).assertTrue();
        expect(Math.abs(mapped[0].x - 140) < 0.5).assertTrue();
        expect(Math.abs(mapped[0].y - 140) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0664 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0665
     * @tc.name testMatrixDeep0665
     * @tc.desc Verify a doubled path transform doubles every bounds edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0665', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0665 begin');
      await runCase('testMatrixDeep0665', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 40));
        const before: common2D.Rect = shape.getBounds();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.round(after.right)).assertEqual(Math.round(before.right * 2));
        expect(Math.round(after.bottom)).assertEqual(Math.round(before.bottom * 2));
        expect(Math.round(after.left)).assertEqual(Math.round(before.left * 2));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0665 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0666
     * @tc.name testMatrixDeep0666
     * @tc.desc Verify a quarter turn swaps the width and height of a path box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0666', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0666 begin');
      await runCase('testMatrixDeep0666', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 40));
        const before: common2D.Rect = shape.getBounds();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.abs((after.right - after.left) - (before.bottom - before.top)) < 1).assertTrue();
        expect(Math.abs((after.bottom - after.top) - (before.right - before.left)) < 1).assertTrue();
        expect(after.left < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0666 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0667
     * @tc.name testMatrixDeep0667
     * @tc.desc Verify a horizontal skew widens the path bounds on the right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0667', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0667 begin');
      await runCase('testMatrixDeep0667', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 40));
        const before: common2D.Rect = shape.getBounds();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.round(after.right)).assertEqual(80);
        expect(Math.round(after.left)).assertEqual(15);
        expect(Math.round(after.bottom)).assertEqual(Math.round(before.bottom));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0667 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0668
     * @tc.name testMatrixDeep0668
     * @tc.desc Verify transforming a path inverts back onto its original bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0668', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0668 begin');
      await runCase('testMatrixDeep0668', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 80, 80));
        const before: common2D.Rect = shape.getBounds();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(30, 0, 0);
        shape.transform(matrix);
        const inverse: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = matrix.invert(inverse);
        shape.transform(inverse);
        const after: common2D.Rect = shape.getBounds();
        expect(ok).assertTrue();
        expect(Math.abs(after.right - before.right) < 1).assertTrue();
        expect(Math.abs(after.bottom - before.bottom) < 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0668 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0669
     * @tc.name testMatrixDeep0669
     * @tc.desc Verify mapRect shifts a path box by the translation offsets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0669', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0669 begin');
      await runCase('testMatrixDeep0669', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 30, 70, 90));
        const box: common2D.Rect = shape.getBounds();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(50, 10);
        const dst: common2D.Rect = ltrb(0, 0, 0, 0);
        const ok: boolean = matrix.mapRect(dst, box);
        expect(ok).assertTrue();
        expect(Math.round(dst.left)).assertEqual(70);
        expect(Math.round(dst.right)).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0669 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0670
     * @tc.name testMatrixDeep0670
     * @tc.desc Verify mapPoints scales three points with independent axes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0670', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0670 begin');
      await runCase('testMatrixDeep0670', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 3, 0, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(1, 2), point(3, 4), point(-5, 6)]);
        expect(mapped.length).assertEqual(3);
        expect(mapped[0].x).assertEqual(2);
        expect(mapped[2].y).assertEqual(18);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0670 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0671
     * @tc.name testMatrixDeep0671
     * @tc.desc Verify mapRadius follows a uniform scale factor of three.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0671', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0671 begin');
      await runCase('testMatrixDeep0671', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(3, 3, 0, 0);
        expect(Math.abs(matrix.mapRadius(10) - 30) < 0.01).assertTrue();
        expect(Math.abs(matrix.mapRadius(7) - 21) < 0.01).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0671 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0672
     * @tc.name testMatrixDeep0672
     * @tc.desc Verify mapRadius under unequal axes follows the determinant root.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0672', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0672 begin');
      await runCase('testMatrixDeep0672', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 8, 0, 0);
        const radius: number = matrix.mapRadius(10);
        expect(radius > 39).assertTrue();
        expect(radius < 41).assertTrue();
        expect(matrix.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0672 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0673
     * @tc.name testMatrixDeep0673
     * @tc.desc Verify the nine values of a quarter turn carry the sine cosine slots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0673', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0673 begin');
      await runCase('testMatrixDeep0673', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 0, 0);
        const values: number[] = matrix.getAll();
        expect(values.length).assertEqual(9);
        expect(Math.abs(values[1] + 1) < 0.001).assertTrue();
        expect(Math.abs(values[3] - 1) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0673 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0674
     * @tc.name testMatrixDeep0674
     * @tc.desc Verify the skew slots expose both factors independently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0674', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0674 begin');
      await runCase('testMatrixDeep0674', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0.25, 0, 0);
        expect(matrix.getValue(0)).assertEqual(1);
        expect(Math.abs(matrix.getValue(1) - 0.5) < 0.001).assertTrue();
        expect(Math.abs(matrix.getValue(3) - 0.25) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0674 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0675
     * @tc.name testMatrixDeep0675
     * @tc.desc Verify equality rejects two rotations with different angles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0675', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0675 begin');
      await runCase('testMatrixDeep0675', async () => {
        const shallow: drawing.Matrix = new drawing.Matrix();
        shallow.setRotation(30, 0, 0);
        const steep: drawing.Matrix = new drawing.Matrix();
        steep.setRotation(60, 0, 0);
        expect(shallow.isEqual(steep)).assertFalse();
        expect(steep.isEqual(shallow)).assertFalse();
        expect(Math.abs(shallow.getValue(1) + 0.5) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0675 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0676
     * @tc.name testMatrixDeep0676
     * @tc.desc Verify a zero sine unit cosine pair keeps the identity state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0676', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0676 begin');
      await runCase('testMatrixDeep0676', async () => {
        const unit: drawing.Matrix = new drawing.Matrix();
        unit.setSinCos(0, 1, 0, 0);
        const quarter: drawing.Matrix = new drawing.Matrix();
        quarter.setSinCos(1, 0, 0, 0);
        expect(unit.isIdentity()).assertTrue();
        expect(quarter.isIdentity()).assertFalse();
        expect(Math.abs(quarter.getValue(1) + 1) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0676 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0677
     * @tc.name testMatrixDeep0677
     * @tc.desc Verify only right angle preserving builders report rectangles as stable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0677', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0677 begin');
      await runCase('testMatrixDeep0677', async () => {
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(90, 0, 0);
        const tilted: drawing.Matrix = new drawing.Matrix();
        tilted.setRotation(45, 0, 0);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        expect(turn.rectStaysRect()).assertTrue();
        expect(tilted.rectStaysRect()).assertFalse();
        expect(zoom.rectStaysRect()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0677 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0678
     * @tc.name testMatrixDeep0678
     * @tc.desc Verify a perspective matrix row is reported as not affine.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0678', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0678 begin');
      await runCase('testMatrixDeep0678', async () => {
        const perspective: drawing.Matrix = new drawing.Matrix();
        perspective.setMatrix([1, 0, 0, 0, 1, 0, 0.001, 0.001, 1]);
        const plain: drawing.Matrix = new drawing.Matrix();
        expect(perspective.isAffine()).assertFalse();
        expect(plain.isAffine()).assertTrue();
        expect(perspective.getValue(6) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0678 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0679
     * @tc.name testMatrixDeep0679
     * @tc.desc Verify inverting a collapsed matrix falls back to the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0679', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0679 begin');
      await runCase('testMatrixDeep0679', async () => {
        const singular: drawing.Matrix = new drawing.Matrix();
        singular.setScale(0, 0, 0, 0);
        const fallback: drawing.Matrix = new drawing.Matrix();
        singular.invert(fallback);
        expect(fallback.isIdentity()).assertTrue();
        expect(singular.isIdentity()).assertFalse();
        expect(fallback.getValue(0)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0679 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0680
     * @tc.name testMatrixDeep0680
     * @tc.desc Verify the inverse of a quarter turn rotates the edge backwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0680', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0680 begin');
      await runCase('testMatrixDeep0680', async () => {
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(90, 0, 0);
        const back: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = turn.invert(back);
        const mapped: common2D.Point[] = back.mapPoints([point(10, 0)]);
        expect(ok).assertTrue();
        expect(Math.abs(mapped[0].x) < 0.001).assertTrue();
        expect(Math.abs(mapped[0].y + 10) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0680 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0681
     * @tc.name testMatrixDeep0681
     * @tc.desc Verify the concat operand order changes the mapped coordinate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0681', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0681 begin');
      await runCase('testMatrixDeep0681', async () => {
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(10, 0);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        const shiftThenZoom: drawing.Matrix = new drawing.Matrix();
        shiftThenZoom.setConcat(zoom, shift);
        const zoomThenShift: drawing.Matrix = new drawing.Matrix();
        zoomThenShift.setConcat(shift, zoom);
        const first: common2D.Point[] = shiftThenZoom.mapPoints([point(1, 0)]);
        const second: common2D.Point[] = zoomThenShift.mapPoints([point(1, 0)]);
        expect(Math.abs(first[0].x - 22) < 0.001).assertTrue();
        expect(Math.abs(second[0].x - 12) < 0.001).assertTrue();
        expect(shiftThenZoom.isEqual(zoomThenShift)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0681 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0682
     * @tc.name testMatrixDeep0682
     * @tc.desc Verify postConcat and preConcat place the shift on opposite sides.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0682', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0682 begin');
      await runCase('testMatrixDeep0682', async () => {
        const base: drawing.Matrix = new drawing.Matrix();
        base.setScale(2, 2, 0, 0);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(10, 0);
        const post: drawing.Matrix = new drawing.Matrix(base);
        post.postConcat(shift);
        const pre: drawing.Matrix = new drawing.Matrix(base);
        pre.preConcat(shift);
        const postMapped: common2D.Point[] = post.mapPoints([point(0, 0)]);
        const preMapped: common2D.Point[] = pre.mapPoints([point(0, 0)]);
        expect(Math.abs(postMapped[0].x - 10) < 0.001).assertTrue();
        expect(Math.abs(preMapped[0].x - 20) < 0.001).assertTrue();
        expect(post.isEqual(pre)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0682 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0683
     * @tc.name testMatrixDeep0683
     * @tc.desc Verify postTranslate keeps the offset unscaled by the diagonal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0683', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0683 begin');
      await runCase('testMatrixDeep0683', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        matrix.postTranslate(5, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(0, 0)]);
        expect(matrix.getValue(2)).assertEqual(5);
        expect(mapped[0].x).assertEqual(5);
        expect(matrix.getValue(0)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0683 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0684
     * @tc.name testMatrixDeep0684
     * @tc.desc Verify preTranslate is amplified by the existing scale.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0684', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0684 begin');
      await runCase('testMatrixDeep0684', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(3, 3, 0, 0);
        matrix.preTranslate(10, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(0, 0)]);
        expect(matrix.getValue(2)).assertEqual(30);
        expect(mapped[0].x).assertEqual(30);
        expect(matrix.getValue(0)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0684 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0685
     * @tc.name testMatrixDeep0685
     * @tc.desc Verify postRotate turns the translated point in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0685', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0685 begin');
      await runCase('testMatrixDeep0685', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(10, 0);
        matrix.postRotate(90, 0, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(0, 0)]);
        expect(Math.abs(mapped[0].x) < 0.001).assertTrue();
        expect(Math.abs(mapped[0].y - 10) < 0.001).assertTrue();
        expect(Math.abs(matrix.getValue(2)) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0685 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0686
     * @tc.name testMatrixDeep0686
     * @tc.desc Verify preRotate turns the point before the translation applies.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0686', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0686 begin');
      await runCase('testMatrixDeep0686', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(10, 0);
        matrix.preRotate(90, 0, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(10, 0)]);
        expect(Math.abs(mapped[0].x - 10) < 0.001).assertTrue();
        expect(Math.abs(mapped[0].y - 10) < 0.001).assertTrue();
        expect(matrix.getValue(2)).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0686 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0687
     * @tc.name testMatrixDeep0687
     * @tc.desc Verify preScale keeps the existing translation in device space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0687', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0687 begin');
      await runCase('testMatrixDeep0687', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(10, 20);
        matrix.preScale(2, 2, 0, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(5, 5)]);
        expect(mapped[0].x).assertEqual(20);
        expect(mapped[0].y).assertEqual(30);
        expect(matrix.getValue(2)).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0687 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0688
     * @tc.name testMatrixDeep0688
     * @tc.desc Verify postScale multiplies the existing translation too.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0688', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0688 begin');
      await runCase('testMatrixDeep0688', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(10, 20);
        matrix.postScale(2, 2, 0, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(5, 5)]);
        expect(mapped[0].x).assertEqual(30);
        expect(mapped[0].y).assertEqual(50);
        expect(matrix.getValue(2)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0688 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0689
     * @tc.name testMatrixDeep0689
     * @tc.desc Verify postSkew shears a path rectangle to the right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0689', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0689 begin');
      await runCase('testMatrixDeep0689', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 10, 10));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.postSkew(0.5, 0, 0, 0);
        shape.transform(matrix);
        expect(Math.round(shape.getBounds().right)).assertEqual(15);
        expect(Math.round(shape.getBounds().left)).assertEqual(0);
        expect(Math.abs(matrix.getValue(1) - 0.5) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0689 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0690
     * @tc.name testMatrixDeep0690
     * @tc.desc Verify preSkew shears before the translation is added.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0690', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0690 begin');
      await runCase('testMatrixDeep0690', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(20, 0);
        matrix.preSkew(0.5, 0, 0, 0);
        const mapped: common2D.Point[] = matrix.mapPoints([point(0, 10)]);
        expect(mapped[0].x).assertEqual(25);
        expect(mapped[0].y).assertEqual(10);
        expect(matrix.getValue(2)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0690 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0691
     * @tc.name testMatrixDeep0691
     * @tc.desc Verify reset clears a three step transform chain.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0691', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0691 begin');
      await runCase('testMatrixDeep0691', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(30, 40);
        matrix.postRotate(45, 0, 0);
        matrix.postScale(2, 2, 0, 0);
        matrix.reset();
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(2)).assertEqual(0);
        expect(matrix.getAll().length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0691 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0692
     * @tc.name testMatrixDeep0692
     * @tc.desc Verify the copy constructor keeps its values when the source resets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0692', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0692 begin');
      await runCase('testMatrixDeep0692', async () => {
        const base: drawing.Matrix = new drawing.Matrix();
        base.setTranslation(10, 20);
        const copy: drawing.Matrix = new drawing.Matrix(base);
        base.reset();
        expect(copy.isIdentity()).assertFalse();
        expect(copy.getValue(2)).assertEqual(10);
        expect(base.isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0692 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0693
     * @tc.name testMatrixDeep0693
     * @tc.desc Verify setMatrix snapshots another matrix instead of aliasing it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0693', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0693 begin');
      await runCase('testMatrixDeep0693', async () => {
        const source: drawing.Matrix = new drawing.Matrix();
        source.setScale(3, 3, 0, 0);
        const clone: drawing.Matrix = new drawing.Matrix();
        clone.setMatrix(source);
        source.reset();
        expect(clone.getValue(0)).assertEqual(3);
        expect(clone.isIdentity()).assertFalse();
        expect(source.isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0693 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0694
     * @tc.name testMatrixDeep0694
     * @tc.desc Verify a translate scale rotate chain writes the expected slots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0694', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0694 begin');
      await runCase('testMatrixDeep0694', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(15, 25);
        matrix.postScale(2, 2, 0, 0);
        matrix.postRotate(90, 0, 0);
        expect(Math.abs(matrix.getValue(2) + 50) < 0.001).assertTrue();
        expect(Math.abs(matrix.getValue(5) - 30) < 0.001).assertTrue();
        expect(Math.abs(matrix.getValue(1) + 2) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0694 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0695
     * @tc.name testMatrixDeep0695
     * @tc.desc Verify the identity mapping keeps a single point in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixDeep0695', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0695 begin');
      await runCase('testMatrixDeep0695', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const mapped: common2D.Point[] = matrix.mapPoints([point(3, 4)]);
        expect(mapped.length).assertEqual(1);
        expect(mapped[0].x).assertEqual(3);
        expect(mapped[0].y).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0695 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0696
     * @tc.name testMatrixDeep0696
     * @tc.desc Verify mapRect under the identity returns the source edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0696', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0696 begin');
      await runCase('testMatrixDeep0696', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const box: common2D.Rect = ltrb(10, 20, 50, 60);
        const dst: common2D.Rect = ltrb(0, 0, 0, 0);
        const ok: boolean = matrix.mapRect(dst, box);
        expect(ok).assertTrue();
        expect(dst.left).assertEqual(10);
        expect(dst.bottom).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0696 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0697
     * @tc.name testMatrixDeep0697
     * @tc.desc Verify a mirrored scale returns a normalised rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0697', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0697 begin');
      await runCase('testMatrixDeep0697', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(-1, 1, 0, 0);
        const dst: common2D.Rect = ltrb(0, 0, 0, 0);
        const ok: boolean = matrix.mapRect(dst, ltrb(10, 10, 60, 50));
        expect(ok).assertTrue();
        expect(dst.left).assertEqual(-60);
        expect(dst.right).assertEqual(-10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0697 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0698
     * @tc.name testMatrixDeep0698
     * @tc.desc Verify a three point polygon mapping pins the source origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0698', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0698 begin');
      await runCase('testMatrixDeep0698', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const src: common2D.Point[] = [point(0, 0), point(100, 0), point(0, 100)];
        const dst: common2D.Point[] = [point(10, 10), point(120, 20), point(20, 130)];
        const ok: boolean = matrix.setPolyToPoly(src, dst, 3);
        const mapped: common2D.Point[] = matrix.mapPoints([point(0, 0)]);
        expect(ok).assertTrue();
        expect(Math.abs(mapped[0].x - 10) < 0.5).assertTrue();
        expect(Math.abs(mapped[0].y - 10) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0698 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0699
     * @tc.name testMatrixDeep0699
     * @tc.desc Verify a diagonal rotated path paints inside the canvas edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0699', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0699 begin');
      await runCase('testMatrixDeep0699', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(60, 30, 140, 70));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(45, 100, 50);
        shape.transform(matrix);
        const bounds: common2D.Rect = shape.getBounds();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(bounds.right - bounds.left > 80).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, 40, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 150, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0699 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0700
     * @tc.name testMatrixDeep0700
     * @tc.desc Verify a device space clip still bounds a translated rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0700', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0700 begin');
      await runCase('testMatrixDeep0700', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(80, 80, 160, 160));
        target.canvas.clipPath(clip);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(60, 60);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, 80, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 160, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0700 end');
    });

  });
}
