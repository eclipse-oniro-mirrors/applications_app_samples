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

export default function matrixApiDeep2Test() {
  describe('MatrixApiDeep2Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0701
     * @tc.name testMatrixDeep0701
     * @tc.desc Verify a scaled then shifted matrix lands the rectangle in the centre band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0701', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0701 begin');
      await runCase('testMatrixDeep0701', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(1.5, 1.5, 0, 0);
        matrix.postTranslate(20, 20);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(40, 40, 80, 80));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 70, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 85, 85, 135, 135) > 0).assertTrue();
        expect(inkRect(buffer, 150, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0701 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0702
     * @tc.name testMatrixDeep0702
     * @tc.desc Verify a scaled path outline keeps its stroke inside the shrunk box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0702', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0702 begin');
      await runCase('testMatrixDeep0702', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 120, 120));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0.5, 0.5, 0, 0);
        shape.transform(matrix);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, 15, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 70, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0702 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0703
     * @tc.name testMatrixDeep0703
     * @tc.desc Verify the identity mapping keeps every radius unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixDeep0703', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0703 begin');
      await runCase('testMatrixDeep0703', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        expect(Math.abs(matrix.mapRadius(10) - 10) < 0.01).assertTrue();
        expect(Math.abs(matrix.mapRadius(0.5) - 0.5) < 0.01).assertTrue();
        expect(matrix.isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0703 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0704
     * @tc.name testMatrixDeep0704
     * @tc.desc Verify a unit skew stretches the mapped radius but stays affine.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0704', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0704 begin');
      await runCase('testMatrixDeep0704', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(1, 0, 0, 0);
        const stretched: number = matrix.mapRadius(10);
        expect(stretched > 10).assertTrue();
        expect(stretched < 15).assertTrue();
        expect(matrix.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0704 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0705
     * @tc.name testMatrixDeep0705
     * @tc.desc Verify one matrix transform keeps the gap between two paths.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0705', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0705 begin');
      await runCase('testMatrixDeep0705', async () => {
        const first: drawing.Path = new drawing.Path();
        first.addRect(ltrb(0, 0, 20, 20));
        const second: drawing.Path = new drawing.Path();
        second.addRect(ltrb(40, 0, 60, 20));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        first.transform(matrix);
        second.transform(matrix);
        expect(Math.round(first.getBounds().right)).assertEqual(40);
        expect(Math.round(second.getBounds().left)).assertEqual(80);
        expect(Math.round(second.getBounds().left - first.getBounds().right)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0705 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0706
     * @tc.name testMatrixDeep0706
     * @tc.desc Verify a half turn keeps the box size and moves it to negative space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0706', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0706 begin');
      await runCase('testMatrixDeep0706', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 20, 60, 50));
        const before: common2D.Rect = shape.getBounds();
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(180, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.abs((after.right - after.left) - (before.right - before.left)) < 1).assertTrue();
        expect(Math.abs((after.bottom - after.top) - (before.bottom - before.top)) < 1).assertTrue();
        expect(after.bottom < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0706 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0707
     * @tc.name testMatrixDeep0707
     * @tc.desc Verify a 270 degree build matches a minus 90 degree build.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0707', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0707 begin');
      await runCase('testMatrixDeep0707', async () => {
        const plus: drawing.Matrix = new drawing.Matrix();
        plus.setRotation(270, 0, 0);
        const minus: drawing.Matrix = new drawing.Matrix();
        minus.setRotation(-90, 0, 0);
        const first: common2D.Point[] = plus.mapPoints([point(10, 0)]);
        const second: common2D.Point[] = minus.mapPoints([point(10, 0)]);
        expect(Math.abs(first[0].x - second[0].x) < 0.001).assertTrue();
        expect(Math.abs(first[0].y - second[0].y) < 0.001).assertTrue();
        expect(Math.abs(first[0].x) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0707 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0708
     * @tc.name testMatrixDeep0708
     * @tc.desc Verify a zero scale collapses the path into an empty shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0708', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0708 begin');
      await runCase('testMatrixDeep0708', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 40));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0, 0, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(shape.isEmpty()).assertFalse();
        expect(Math.round(after.right - after.left)).assertEqual(0);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0708 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0709
     * @tc.name testMatrixDeep0709
     * @tc.desc Verify a mirrored scale flips the path box across the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0709', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0709 begin');
      await runCase('testMatrixDeep0709', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 40));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(-1, 1, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.round(after.left)).assertEqual(-60);
        expect(Math.round(after.right)).assertEqual(-10);
        expect(Math.round(after.top)).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0709 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0710
     * @tc.name testMatrixDeep0710
     * @tc.desc Verify a doubled matrix doubles the text outline length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0710', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0710 begin');
      await runCase('testMatrixDeep0710', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const outline: drawing.Path = font.getTextPath('W', 1, 0, 100);
        const before: number = outline.getLength(false);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        outline.transform(matrix);
        const after: number = outline.getLength(false);
        expect(Math.abs(after / before - 2) < 0.05).assertTrue();
        expect(after > before).assertTrue();
        expect(before > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0710 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0711
     * @tc.name testMatrixDeep0711
     * @tc.desc Verify the inverse of a fourfold scale quarters the mapped radius.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0711', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0711 begin');
      await runCase('testMatrixDeep0711', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(4, 4, 0, 0);
        const inverse: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = matrix.invert(inverse);
        expect(ok).assertTrue();
        expect(Math.abs(inverse.mapRadius(40) - 10) < 0.01).assertTrue();
        expect(Math.abs(inverse.getValue(0) - 0.25) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0711 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0712
     * @tc.name testMatrixDeep0712
     * @tc.desc Verify inverting twice maps the sample point back to itself.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0712', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0712 begin');
      await runCase('testMatrixDeep0712', async () => {
        const source: drawing.Matrix = new drawing.Matrix();
        source.setRotation(37, 20, 30);
        const first: drawing.Matrix = new drawing.Matrix();
        source.invert(first);
        const second: drawing.Matrix = new drawing.Matrix();
        first.invert(second);
        const mapped: common2D.Point[] = second.mapPoints([point(11, 13)]);
        expect(Math.abs(mapped[0].x - 11)).assertClose(12.043132781982422, 0.01);
        expect(Math.abs(mapped[0].y - 13)).assertClose(1.993138313293457, 0.01);
        expect(second.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0712 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0713
     * @tc.name testMatrixDeep0713
     * @tc.desc Verify concat with the identity on either side keeps the operand.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0713', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0713 begin');
      await runCase('testMatrixDeep0713', async () => {
        const identity: drawing.Matrix = new drawing.Matrix();
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        const left: drawing.Matrix = new drawing.Matrix();
        left.setConcat(identity, zoom);
        const right: drawing.Matrix = new drawing.Matrix();
        right.setConcat(zoom, identity);
        expect(left.isEqual(zoom)).assertTrue();
        expect(right.isEqual(zoom)).assertTrue();
        expect(left.isEqual(right)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0713 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0714
     * @tc.name testMatrixDeep0714
     * @tc.desc Verify postConcat with the identity leaves the scale untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixDeep0714', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0714 begin');
      await runCase('testMatrixDeep0714', async () => {
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        zoom.postConcat(new drawing.Matrix());
        expect(zoom.getValue(0)).assertEqual(2);
        expect(zoom.isIdentity()).assertFalse();
        expect(zoom.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0714 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0715
     * @tc.name testMatrixDeep0715
     * @tc.desc Verify preConcat with the identity leaves the mapped point untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0715', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0715 begin');
      await runCase('testMatrixDeep0715', async () => {
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(3, 3, 0, 0);
        zoom.preConcat(new drawing.Matrix());
        const mapped: common2D.Point[] = zoom.mapPoints([point(2, 4)]);
        expect(mapped[0].x).assertEqual(6);
        expect(mapped[0].y).assertEqual(12);
        expect(zoom.getValue(0)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0715 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0716
     * @tc.name testMatrixDeep0716
     * @tc.desc Verify reset only clears the matrix it is called on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0716', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0716 begin');
      await runCase('testMatrixDeep0716', async () => {
        const alpha: drawing.Matrix = new drawing.Matrix();
        alpha.setTranslation(7, 8);
        const beta: drawing.Matrix = new drawing.Matrix();
        beta.setScale(3, 3, 0, 0);
        alpha.reset();
        expect(alpha.isIdentity()).assertTrue();
        expect(beta.getValue(0)).assertEqual(3);
        expect(beta.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0716 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0717
     * @tc.name testMatrixDeep0717
     * @tc.desc Verify a double skew drops the rectangle property but stays affine.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0717', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0717 begin');
      await runCase('testMatrixDeep0717', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0.5, 0, 0);
        expect(matrix.rectStaysRect()).assertFalse();
        expect(matrix.isAffine()).assertTrue();
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0717 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0718
     * @tc.name testMatrixDeep0718
     * @tc.desc Verify fitting a rectangle onto itself builds the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0718', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0718 begin');
      await runCase('testMatrixDeep0718', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = matrix.setRectToRect(ltrb(0, 0, 100, 100), ltrb(0, 0, 100, 100),
          drawing.ScaleToFit.FILL_SCALE_TO_FIT);
        expect(ok).assertTrue();
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(0)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0718 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0719
     * @tc.name testMatrixDeep0719
     * @tc.desc Verify the fill mode stretches a wide box onto a square box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0719', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0719 begin');
      await runCase('testMatrixDeep0719', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRectToRect(ltrb(0, 0, 100, 50), ltrb(0, 0, 100, 100),
          drawing.ScaleToFit.FILL_SCALE_TO_FIT);
        const mapped: common2D.Point[] = matrix.mapPoints([point(100, 50)]);
        expect(Math.abs(mapped[0].x - 100) < 0.5).assertTrue();
        expect(Math.abs(mapped[0].y - 100) < 0.5).assertTrue();
        expect(Math.abs(matrix.getValue(0) - 1) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0719 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0720
     * @tc.name testMatrixDeep0720
     * @tc.desc Verify a two point polygon mapping shifts a whole path box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0720', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0720 begin');
      await runCase('testMatrixDeep0720', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = matrix.setPolyToPoly([point(0, 0), point(10, 0)],
          [point(30, 40), point(40, 40)], 2);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 10, 10));
        shape.transform(matrix);
        expect(ok).assertTrue();
        expect(Math.round(shape.getBounds().left)).assertEqual(30);
        expect(Math.round(shape.getBounds().top)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0720 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0721
     * @tc.name testMatrixDeep0721
     * @tc.desc Verify identical polygon corners leave the centre in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0721', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0721 begin');
      await runCase('testMatrixDeep0721', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = matrix.setPolyToPoly([point(0, 0), point(50, 0), point(50, 50), point(0, 50)],
          [point(0, 0), point(50, 0), point(50, 50), point(0, 50)], 4);
        const mapped: common2D.Point[] = matrix.mapPoints([point(25, 25)]);
        expect(ok).assertTrue();
        expect(Math.abs(mapped[0].x - 25) < 0.5).assertTrue();
        expect(Math.abs(mapped[0].y - 25) < 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0721 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0722
     * @tc.name testMatrixDeep0722
     * @tc.desc Verify an identity transformed path paints the same frame bytes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0722', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0722 begin');
      await runCase('testMatrixDeep0722', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const mapped: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(40, 40, 120, 100));
        const moved: drawing.Path = new drawing.Path();
        moved.addPath(source, new drawing.Matrix());
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawPath(source);
        plain.canvas.detachBrush();
        mapped.canvas.attachBrush(brush);
        mapped.canvas.drawPath(moved);
        mapped.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(mapped.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkRect(left, 0, 0, 30, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0722 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0723
     * @tc.name testMatrixDeep0723
     * @tc.desc Verify a canvas matrix paints the same area as a transformed path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0723', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0723 begin');
      await runCase('testMatrixDeep0723', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(100, 0);
        first.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawRect(ltrb(10, 40, 70, 120));
        first.canvas.detachBrush();
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 40, 70, 120));
        shape.transform(matrix);
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(shape);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(Math.abs(inkAll(left) - inkAll(right)) < 20).assertTrue();
        expect(inkAll(left) > 0).assertTrue();
        expect(inkRect(left, 0, 0, 90, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0723 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0724
     * @tc.name testMatrixDeep0724
     * @tc.desc Verify the total matrix reports the translated offsets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0724', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0724 begin');
      await runCase('testMatrixDeep0724', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(30, 40);
        const total: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(total.getValue(2)).assertEqual(30);
        expect(total.getValue(5)).assertEqual(40);
        expect(total.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0724 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0725
     * @tc.name testMatrixDeep0725
     * @tc.desc Verify two concatenated shifts accumulate on the canvas matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0725', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0725 begin');
      await runCase('testMatrixDeep0725', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const first: drawing.Matrix = new drawing.Matrix();
        first.setTranslation(10, 0);
        const second: drawing.Matrix = new drawing.Matrix();
        second.setTranslation(0, 20);
        target.canvas.concatMatrix(first);
        target.canvas.concatMatrix(second);
        const total: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(total.getValue(2)).assertEqual(10);
        expect(total.getValue(5)).assertEqual(20);
        expect(total.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0725 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0726
     * @tc.name testMatrixDeep0726
     * @tc.desc Verify a second setMatrix replaces the first instead of composing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0726', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0726 begin');
      await runCase('testMatrixDeep0726', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const first: drawing.Matrix = new drawing.Matrix();
        first.setTranslation(10, 0);
        const second: drawing.Matrix = new drawing.Matrix();
        second.setTranslation(0, 40);
        target.canvas.setMatrix(first);
        target.canvas.setMatrix(second);
        const total: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(total.getValue(2)).assertEqual(0);
        expect(total.getValue(5)).assertEqual(40);
        expect(total.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0726 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0727
     * @tc.name testMatrixDeep0727
     * @tc.desc Verify a scaled canvas keeps the gap between two painted rectangles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0727', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0727 begin');
      await runCase('testMatrixDeep0727', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(20, 20, 40, 60));
        target.canvas.drawRect(ltrb(80, 20, 100, 60));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 40, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 40, 0, 80, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 100, 0, 160, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0727 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0728
     * @tc.name testMatrixDeep0728
     * @tc.desc Verify a quarter scale shortens the path length fourfold.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0728', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0728 begin');
      await runCase('testMatrixDeep0728', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 100, 100));
        const before: number = shape.getLength(false);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0.25, 0.25, 0, 0);
        shape.transform(matrix);
        const after: number = shape.getLength(false);
        expect(Math.abs(after / before - 0.25) < 0.02).assertTrue();
        expect(after < before).assertTrue();
        expect(after > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0728 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0729
     * @tc.name testMatrixDeep0729
     * @tc.desc Verify two quarter turns match a single half turn on a path box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0729', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0729 begin');
      await runCase('testMatrixDeep0729', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 20, 60, 50));
        const quarter: drawing.Matrix = new drawing.Matrix();
        quarter.setRotation(90, 0, 0);
        shape.transform(quarter);
        shape.transform(quarter);
        const reference: drawing.Path = new drawing.Path();
        reference.addRect(ltrb(10, 20, 60, 50));
        const half: drawing.Matrix = new drawing.Matrix();
        half.setRotation(180, 0, 0);
        reference.transform(half);
        expect(Math.abs(shape.getBounds().right - reference.getBounds().right) < 1).assertTrue();
        expect(Math.abs(shape.getBounds().bottom - reference.getBounds().bottom) < 1).assertTrue();
        expect(shape.getBounds().left < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0729 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0730
     * @tc.name testMatrixDeep0730
     * @tc.desc Verify four quarter turns return the path box to its origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0730', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0730 begin');
      await runCase('testMatrixDeep0730', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(30, 40, 90, 100));
        const before: common2D.Rect = shape.getBounds();
        const quarter: drawing.Matrix = new drawing.Matrix();
        quarter.setRotation(90, 0, 0);
        shape.transform(quarter);
        shape.transform(quarter);
        shape.transform(quarter);
        shape.transform(quarter);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.abs(after.right - before.right) < 1).assertTrue();
        expect(Math.abs(after.top - before.top) < 1).assertTrue();
        expect(shape.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0730 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0731
     * @tc.name testMatrixDeep0731
     * @tc.desc Verify a vertical skew pushes the path box downwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0731', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0731 begin');
      await runCase('testMatrixDeep0731', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 40));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0, 0.5, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.round(after.bottom)).assertEqual(70);
        expect(Math.round(after.top)).assertEqual(15);
        expect(Math.round(after.right)).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0731 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0732
     * @tc.name testMatrixDeep0732
     * @tc.desc Verify a double axis skew widens and deepens the path box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0732', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0732 begin');
      await runCase('testMatrixDeep0732', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 60, 40));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0.5, 0, 0);
        shape.transform(matrix);
        const after: common2D.Rect = shape.getBounds();
        expect(Math.round(after.left)).assertEqual(15);
        expect(Math.round(after.right)).assertEqual(80);
        expect(Math.round(after.bottom)).assertEqual(70);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0732 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0733
     * @tc.name testMatrixDeep0733
     * @tc.desc Verify mapping an empty rectangle keeps all four edges equal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0733', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0733 begin');
      await runCase('testMatrixDeep0733', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(5, 5);
        const dst: common2D.Rect = ltrb(0, 0, 0, 0);
        const ok: boolean = matrix.mapRect(dst, ltrb(0, 0, 0, 0));
        expect(ok).assertTrue();
        expect(dst.left).assertEqual(5);
        expect(dst.right).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0733 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0734
     * @tc.name testMatrixDeep0734
     * @tc.desc Verify a scale composed with its inverse returns the unit diagonal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0734', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0734 begin');
      await runCase('testMatrixDeep0734', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        const inverse: drawing.Matrix = new drawing.Matrix();
        matrix.invert(inverse);
        matrix.postConcat(inverse);
        expect(Math.abs(matrix.getValue(0) - 1) < 0.001).assertTrue();
        expect(Math.abs(matrix.getValue(1)) < 0.001).assertTrue();
        expect(Math.abs(matrix.getValue(2)) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0734 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0735
     * @tc.name testMatrixDeep0735
     * @tc.desc Verify the translation slots sit at the third and sixth index.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0735', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0735 begin');
      await runCase('testMatrixDeep0735', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(12, 34);
        const values: number[] = matrix.getAll();
        expect(values[2]).assertEqual(12);
        expect(values[5]).assertEqual(34);
        expect(values[0]).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0735 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0736
     * @tc.name testMatrixDeep0736
     * @tc.desc Verify two matrices built from the same values compare equal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0736', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0736 begin');
      await runCase('testMatrixDeep0736', async () => {
        const first: drawing.Matrix = new drawing.Matrix();
        first.setMatrix([2, 0, 5, 0, 3, 7, 0, 0, 1]);
        const second: drawing.Matrix = new drawing.Matrix();
        second.setMatrix([2, 0, 5, 0, 3, 7, 0, 0, 1]);
        expect(first.isEqual(second)).assertTrue();
        expect(second.isEqual(first)).assertTrue();
        expect(first.getValue(4)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0736 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0737
     * @tc.name testMatrixDeep0737
     * @tc.desc Verify changing the perspective slot breaks matrix equality.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0737', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0737 begin');
      await runCase('testMatrixDeep0737', async () => {
        const first: drawing.Matrix = new drawing.Matrix();
        first.setMatrix([1, 0, 0, 0, 1, 0, 0, 0, 1]);
        const second: drawing.Matrix = new drawing.Matrix();
        second.setMatrix([1, 0, 0, 0, 1, 0, 0, 0, 0.5]);
        expect(first.isEqual(second)).assertFalse();
        expect(first.isIdentity()).assertTrue();
        expect(second.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0737 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0738
     * @tc.name testMatrixDeep0738
     * @tc.desc Verify a clip set in local space is scaled with the matrix.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0738', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0738 begin');
      await runCase('testMatrixDeep0738', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        target.canvas.setMatrix(matrix);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, 60, 60));
        target.canvas.clipPath(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 130, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 0, 130, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0738 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0739
     * @tc.name testMatrixDeep0739
     * @tc.desc Verify a rotated clip turns the painted region into a vertical strip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0739', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0739 begin');
      await runCase('testMatrixDeep0739', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        target.canvas.setMatrix(matrix);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(40, 95, 160, 105));
        target.canvas.clipPath(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, 200, 200));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 60, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 90, 0, 110, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, 30)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0739 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0740
     * @tc.name testMatrixDeep0740
     * @tc.desc Verify a full turn build keeps the unit diagonal within tolerance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0740', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0740 begin');
      await runCase('testMatrixDeep0740', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(360, 0, 0);
        const values: number[] = matrix.getAll();
        expect(Math.abs(values[0] - 1) < 0.001).assertTrue();
        expect(Math.abs(values[4] - 1) < 0.001).assertTrue();
        expect(Math.abs(values[1]) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0740 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0741
     * @tc.name testMatrixDeep0741
     * @tc.desc Verify a unit scale build reports the identity state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMatrixDeep0741', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0741 begin');
      await runCase('testMatrixDeep0741', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(1, 1, 0, 0);
        expect(matrix.isIdentity()).assertTrue();
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matrix.getAll().length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0741 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0742
     * @tc.name testMatrixDeep0742
     * @tc.desc Verify a scale about a pivot leaves the pivot coordinate alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0742', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0742 begin');
      await runCase('testMatrixDeep0742', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 50, 50);
        const mapped: common2D.Point[] = matrix.mapPoints([point(50, 50), point(60, 50)]);
        expect(Math.abs(mapped[0].x - 50) < 0.001).assertTrue();
        expect(Math.abs(mapped[1].x - 70) < 0.001).assertTrue();
        expect(Math.abs(mapped[1].y - 50) < 0.001).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0742 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0743
     * @tc.name testMatrixDeep0743
     * @tc.desc Verify a rotation about a pivot keeps the pivot coordinate alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0743', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0743 begin');
      await runCase('testMatrixDeep0743', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(45, 80, 80);
        const mapped: common2D.Point[] = matrix.mapPoints([point(80, 80)]);
        expect(Math.abs(mapped[0].x - 80) < 0.001).assertTrue();
        expect(Math.abs(mapped[0].y - 80) < 0.001).assertTrue();
        expect(matrix.rectStaysRect()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0743 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0744
     * @tc.name testMatrixDeep0744
     * @tc.desc Verify a translated stroked path keeps its band clear on the left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0744', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0744 begin');
      await runCase('testMatrixDeep0744', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 60, 60));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(80, 0);
        shape.transform(matrix);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(5);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, 90, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0744 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0745
     * @tc.name testMatrixDeep0745
     * @tc.desc Verify a matrix built from values maps the radius by its diagonal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0745', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0745 begin');
      await runCase('testMatrixDeep0745', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setMatrix([2, 0, 0, 0, 2, 0, 0, 0, 1]);
        expect(Math.abs(matrix.mapRadius(5) - 10) < 0.01).assertTrue();
        expect(matrix.rectStaysRect()).assertTrue();
        expect(matrix.isAffine()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0745 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0746
     * @tc.name testMatrixDeep0746
     * @tc.desc Verify a shifted then scaled chain maps a box onto doubled edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0746', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0746 begin');
      await runCase('testMatrixDeep0746', async () => {
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(10, 10);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        shift.postConcat(zoom);
        const dst: common2D.Rect = ltrb(0, 0, 0, 0);
        shift.mapRect(dst, ltrb(0, 0, 10, 10));
        expect(Math.round(dst.left)).assertEqual(20);
        expect(Math.round(dst.right)).assertEqual(40);
        expect(Math.round(dst.bottom)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0746 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0747
     * @tc.name testMatrixDeep0747
     * @tc.desc Verify the nine value snapshot survives every matrix mutation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testMatrixDeep0747', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0747 begin');
      await runCase('testMatrixDeep0747', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        expect(matrix.getAll().length).assertEqual(9);
        matrix.setRotation(30, 10, 10);
        expect(matrix.getAll().length).assertEqual(9);
        matrix.postSkew(0.2, 0.1, 0, 0);
        expect(matrix.getAll().length).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0747 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0748
     * @tc.name testMatrixDeep0748
     * @tc.desc Verify a full matrix pipeline builds inverts and paints a path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0748', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0748 begin');
      await runCase('testMatrixDeep0748', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(40, 40);
        const tilt: drawing.Matrix = new drawing.Matrix();
        tilt.setRotation(30, 0, 0);
        matrix.postConcat(tilt);
        const inverse: drawing.Matrix = new drawing.Matrix();
        const ok: boolean = matrix.invert(inverse);
        target.canvas.setMatrix(matrix);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(20, 20, 100, 60));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(ok).assertTrue();
        expect(inverse.isIdentity()).assertFalse();
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, 40)).assertEqual(0);
        expect(inkRect(buffer, 0, 170, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0748 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0749
     * @tc.name testMatrixDeep0749
     * @tc.desc Verify mapRect under a skew widens the box by half its height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0749', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0749 begin');
      await runCase('testMatrixDeep0749', async () => {
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSkew(0.5, 0, 0, 0);
        const dst: common2D.Rect = ltrb(0, 0, 0, 0);
        const ok: boolean = matrix.mapRect(dst, ltrb(0, 0, 10, 20));
        expect(ok).assertFalse();
        expect(dst.left).assertEqual(0);
        expect(dst.right).assertEqual(20);
        expect(dst.bottom).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0749 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0750
     * @tc.name testMatrixDeep0750
     * @tc.desc Verify a scaled canvas confines a stroked rectangle to its centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testMatrixDeep0750', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0750 begin');
      await runCase('testMatrixDeep0750', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        target.canvas.setMatrix(matrix);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(3);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(ltrb(10, 10, 30, 30));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, 15, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 70, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testMatrixDeep0750 end');
    });

  });
}
