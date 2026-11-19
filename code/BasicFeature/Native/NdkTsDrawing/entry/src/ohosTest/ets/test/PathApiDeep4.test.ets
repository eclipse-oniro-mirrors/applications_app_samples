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

export default function pathApiDeep4Test() {
  describe('PathApiDeep4Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0471
     * @tc.name testPathDeep0471
     * @tc.desc Verify set copies the geometry so later source edits stay invisible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0471', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0471 begin');
      await runCase('testPathDeep0471', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 120, 120));
        const copy: drawing.Path = new drawing.Path();
        copy.set(source);
        source.addRect(ltrb(140, 140, 180, 180));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(copy);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(copy.getBounds().right).assertEqual(120);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 170, 170, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0471 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0472
     * @tc.name testPathDeep0472
     * @tc.desc Verify set carries the fill type of the source path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0472', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0472 begin');
      await runCase('testPathDeep0472', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 180, 180));
        source.addCircle(100, 100, 40);
        source.setFillType(drawing.PathFillType.EVEN_ODD);
        const copy: drawing.Path = new drawing.Path();
        copy.set(source);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(copy);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(copy.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 20000 && inkAll(buffer) <= 21200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0472 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0473
     * @tc.name testPathDeep0473
     * @tc.desc Verify approximate returns verb and coordinate triplets whose chords trace the circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0473', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0473 begin');
      await runCase('testPathDeep0473', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        const flat: number[] = shape.approximate(0.25);
        let chords: number = 0;
        for (let index: number = 3; index + 1 < flat.length; index += 3) {
          const dx: number = flat[index + 1] - flat[index - 2];
          const dy: number = flat[index + 2] - flat[index - 1];
          chords += Math.sqrt(dx * dx + dy * dy);
        }
        const perimeter: number = shape.getLength(true);
        expect(flat.length % 3).assertEqual(0);
        expect(flat.length >= 24).assertTrue();
        expect(chords > perimeter * 0.97).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0473 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0474
     * @tc.name testPathDeep0474
     * @tc.desc Verify getPositionAndTangent reports the top edge of a rect outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0474', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0474 begin');
      await runCase('testPathDeep0474', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 200, 100));
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        expect(shape.getPositionAndTangent(false, 50, position, tangent)).assertTrue();
        expect(Math.round(position.x)).assertEqual(50);
        expect(Math.round(position.y)).assertEqual(0);
        expect(Math.abs(Math.sqrt(tangent.x * tangent.x + tangent.y * tangent.y) - 1) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0474 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0475
     * @tc.name testPathDeep0475
     * @tc.desc Verify the position matrix translation equals getPositionAndTangent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0475', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0475 begin');
      await runCase('testPathDeep0475', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addCircle(100, 100, 50);
        const quarter: number = shape.getLength(true) * 0.25;
        const matrix: drawing.Matrix = new drawing.Matrix();
        const position: common2D.Point = point(0, 0);
        const tangent: common2D.Point = point(0, 0);
        expect(shape.getMatrix(true, quarter, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX)).assertTrue();
        expect(shape.getPositionAndTangent(true, quarter, position, tangent)).assertTrue();
        expect(Math.round(matrix.getValue(2))).assertEqual(Math.round(position.x));
        expect(Math.round(matrix.getValue(5))).assertEqual(Math.round(position.y));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0475 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0476
     * @tc.name testPathDeep0476
     * @tc.desc Verify the path iterator opens a rect with a move verb then lines.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0476', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0476 begin');
      await runCase('testPathDeep0476', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(10, 10, 90, 90));
        const iterator: drawing.PathIterator = shape.getPathIterator();
        const points: common2D.Point[] = iteratorPoints();
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(iterator.next(points)).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.peek()).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(iterator.hasNext()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0476 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0477
     * @tc.name testPathDeep0477
     * @tc.desc Verify a full iterator walk converges to the done verb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0477', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0477 begin');
      await runCase('testPathDeep0477', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 20);
        shape.lineTo(180, 20);
        shape.lineTo(100, 180);
        shape.close();
        const iterator: drawing.PathIterator = shape.getPathIterator();
        const points: common2D.Point[] = iteratorPoints();
        let verbs: number = 0;
        while (iterator.hasNext()) {
          const verb: drawing.PathIteratorVerb = iterator.next(points);
          if (verb === drawing.PathIteratorVerb.DONE) {
            break;
          }
          verbs++;
        }
        expect(verbs >= 4).assertTrue();
        expect(iterator.hasNext()).assertFalse();
        expect(iterator.peek()).assertEqual(drawing.PathIteratorVerb.DONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0477 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0478
     * @tc.name testPathDeep0478
     * @tc.desc Verify an svg round trip keeps geometry and repaints the same ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0478', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0478 begin');
      await runCase('testPathDeep0478', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(30, 30, 150, 90));
        shape.addCircle(100, 130, 25);
        const svg: string = shape.convertToSvgString();
        const restored: drawing.Path = new drawing.Path();
        expect(restored.buildFromSvgString(svg)).assertTrue();
        expect(restored.isEqual(shape)).assertFalse();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(restored);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 5000).assertTrue();
        expect(chanAt(buffer, 100, 130, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0478 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0479
     * @tc.name testPathDeep0479
     * @tc.desc Verify an svg quadratic command keeps a curved verb and its span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0479', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0479 begin');
      await runCase('testPathDeep0479', async () => {
        const shape: drawing.Path = new drawing.Path();
        expect(shape.buildFromSvgString('M10 100 Q100 10 190 100')).assertTrue();
        expect(shape.getVerbData().length >= 2).assertTrue();
        expect(shape.getLength(false) > 100).assertTrue();
        expect(shape.getBounds().right >= 189).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0479 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0480
     * @tc.name testPathDeep0480
     * @tc.desc Verify an unparsable svg string is rejected and leaves the path empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0480', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0480 begin');
      await runCase('testPathDeep0480', async () => {
        const shape: drawing.Path = new drawing.Path();
        expect(shape.buildFromSvgString('not a path at all')).assertFalse();
        expect(shape.isEmpty()).assertTrue();
        expect(shape.getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0480 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0481
     * @tc.name testPathDeep0481
     * @tc.desc Verify toggling the inverse flag twice restores the original pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0481', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0481 begin');
      await runCase('testPathDeep0481', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(shape);
        first.canvas.detachBrush();
        shape.toggleInverseFillType();
        shape.toggleInverseFillType();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(shape);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(shape.isInverseFillType()).assertFalse();
        expect(inkAll(left)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0481 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0482
     * @tc.name testPathDeep0482
     * @tc.desc Verify isInverseFillType follows both inverse fill enumerators.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0482', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0482 begin');
      await runCase('testPathDeep0482', async () => {
        const even: drawing.Path = new drawing.Path();
        even.addRect(ltrb(0, 0, 100, 100));
        even.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        const winding: drawing.Path = new drawing.Path();
        winding.addRect(ltrb(0, 0, 100, 100));
        winding.setFillType(drawing.PathFillType.INVERSE_WINDING);
        const plain: drawing.Path = new drawing.Path();
        plain.addRect(ltrb(0, 0, 100, 100));
        expect(even.isInverseFillType()).assertTrue();
        expect(winding.isInverseFillType()).assertTrue();
        expect(plain.isInverseFillType()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0482 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0483
     * @tc.name testPathDeep0483
     * @tc.desc Verify a closed polygon strokes one more edge than an open one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0483', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0483 begin');
      await runCase('testPathDeep0483', async () => {
        const closedTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const openTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const closed: drawing.Path = new drawing.Path();
        closed.addPolygon([point(20, 20), point(180, 20), point(100, 180)], true);
        const open: drawing.Path = new drawing.Path();
        open.addPolygon([point(20, 20), point(180, 20), point(100, 180)], false);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(6);
        closedTarget.canvas.attachPen(pen);
        closedTarget.canvas.drawPath(closed);
        closedTarget.canvas.detachPen();
        openTarget.canvas.attachPen(pen);
        openTarget.canvas.drawPath(open);
        openTarget.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(closedTarget.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(openTarget.pixelMap);
        expect(inkAll(left) > inkAll(right)).assertTrue();
        expect(chanAt(left, 100, 60, 3)).assertEqual(0);
        expect(closed.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0483 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0484
     * @tc.name testPathDeep0484
     * @tc.desc Verify a five point star fills its core under the winding rule.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0484', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0484 begin');
      await runCase('testPathDeep0484', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const star: drawing.Path = new drawing.Path();
        star.addPolygon([point(100, 20), point(160, 180), point(20, 70), point(180, 70), point(40, 180)], true);
        star.setFillType(drawing.PathFillType.WINDING);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(star);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 8000).assertTrue();
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0484 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0485
     * @tc.name testPathDeep0485
     * @tc.desc Verify addPath with a scale matrix matches a transform of a copy.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0485', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0485 begin');
      await runCase('testPathDeep0485', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: drawing.Path = new drawing.Path();
        base.addRect(ltrb(20, 20, 120, 80));
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(1.5, 1.5, 0, 0);
        const viaAdd: drawing.Path = new drawing.Path();
        viaAdd.addPath(base, zoom);
        const viaTransform: drawing.Path = new drawing.Path();
        viaTransform.set(base);
        viaTransform.transform(zoom);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawPath(viaAdd);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawPath(viaTransform);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(Math.round(viaAdd.getBounds().right)).assertEqual(180);
        expect(inkAll(left)).assertEqual(13500);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0485 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0486
     * @tc.name testPathDeep0486
     * @tc.desc Verify offset returns a shifted copy and leaves the source in place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0486', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0486 begin');
      await runCase('testPathDeep0486', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(0, 0, 40, 40));
        const shifted: drawing.Path = source.offset(100, 50);
        expect(source.getBounds().right).assertEqual(40);
        expect(shifted.getBounds().left).assertEqual(100);
        expect(shifted.getBounds().top).assertEqual(50);
        expect(shifted.isEqual(source)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0486 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0487
     * @tc.name testPathDeep0487
     * @tc.desc Verify intersecting two offset circles keeps only the lens.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0487', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0487 begin');
      await runCase('testPathDeep0487', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: drawing.Path = new drawing.Path();
        base.addCircle(90, 100, 60);
        const other: drawing.Path = new drawing.Path();
        other.addCircle(130, 100, 60);
        base.op(other, drawing.PathOp.INTERSECT);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(base);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 5900 && inkAll(buffer) <= 7300).assertTrue();
        expect(chanAt(buffer, 110, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0487 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0488
     * @tc.name testPathDeep0488
     * @tc.desc Verify the exclusive or of two rects drops their overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0488', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0488 begin');
      await runCase('testPathDeep0488', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: drawing.Path = new drawing.Path();
        base.addRect(ltrb(20, 20, 120, 120));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(80, 80, 180, 180));
        base.op(other, drawing.PathOp.XOR);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(base);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(16800);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0488 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0489
     * @tc.name testPathDeep0489
     * @tc.desc Verify a segment over the full length reproduces the whole circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0489', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0489 begin');
      await runCase('testPathDeep0489', async () => {
        const circle: drawing.Path = new drawing.Path();
        circle.addCircle(100, 100, 50);
        const total: number = circle.getLength(true);
        const whole: drawing.Path = new drawing.Path();
        expect(circle.getSegment(true, 0, total, true, whole)).assertTrue();
        expect(whole.isEmpty()).assertFalse();
        expect(whole.getLength(false) <= total * 1.02).assertTrue();
        expect(whole.getBounds().right >= 149).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0489 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0490
     * @tc.name testPathDeep0490
     * @tc.desc Verify four quarter segments accumulate to the circle length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0490', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0490 begin');
      await runCase('testPathDeep0490', async () => {
        const circle: drawing.Path = new drawing.Path();
        circle.addCircle(100, 100, 50);
        const total: number = circle.getLength(true);
        let covered: number = 0;
        for (let index: number = 0; index < 4; index++) {
          const slice: drawing.Path = new drawing.Path();
          circle.getSegment(true, total * index / 4, total * (index + 1) / 4, true, slice);
          covered += slice.getLength(false);
        }
        expect(covered >= total * 0.95).assertTrue();
        expect(covered <= total * 1.06).assertTrue();
        expect(circle.getLength(true)).assertEqual(total);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0490 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0491
     * @tc.name testPathDeep0491
     * @tc.desc Verify the mid weight interpolation stays between both endpoints.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0491', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0491 begin');
      await runCase('testPathDeep0491', async () => {
        const start: drawing.Path = new drawing.Path();
        start.addCircle(60, 100, 40);
        const end: drawing.Path = new drawing.Path();
        end.addCircle(140, 100, 40);
        const middle: drawing.Path = new drawing.Path();
        expect(start.interpolate(end, 0.5, middle)).assertTrue();
        const bounds: common2D.Rect = middle.getBounds();
        expect(bounds.left > start.getBounds().left).assertTrue();
        expect(bounds.left < end.getBounds().left).assertTrue();
        expect(middle.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0491 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0492
     * @tc.name testPathDeep0492
     * @tc.desc Verify the endpoint weights of interpolate land on each source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0492', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0492 begin');
      await runCase('testPathDeep0492', async () => {
        const start: drawing.Path = new drawing.Path();
        start.addCircle(60, 100, 40);
        const end: drawing.Path = new drawing.Path();
        end.addCircle(140, 100, 40);
        const blend0: drawing.Path = new drawing.Path();
        const blend1: drawing.Path = new drawing.Path();
        expect(start.interpolate(end, 0, blend0)).assertTrue();
        expect(start.interpolate(end, 1, blend1)).assertTrue();
        expect(Math.round(blend0.getBounds().left)).assertEqual(100);
        expect(Math.round(blend1.getBounds().left)).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0492 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0493
     * @tc.name testPathDeep0493
     * @tc.desc Verify isInterpolate discriminates matching and mismatching verb shapes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0493', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0493 begin');
      await runCase('testPathDeep0493', async () => {
        const line: drawing.Path = new drawing.Path();
        line.moveTo(0, 0);
        line.lineTo(100, 0);
        const otherLine: drawing.Path = new drawing.Path();
        otherLine.moveTo(0, 50);
        otherLine.lineTo(100, 50);
        const rect: drawing.Path = new drawing.Path();
        rect.addRect(ltrb(0, 0, 100, 100));
        expect(line.isInterpolate(otherLine)).assertTrue();
        expect(rect.isInterpolate(line)).assertFalse();
        expect(line.isInterpolate(rect)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0493 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0494
     * @tc.name testPathDeep0494
     * @tc.desc Verify a second contour doubles the point and verb data counts.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPathDeep0494', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0494 begin');
      await runCase('testPathDeep0494', async () => {
        const single: drawing.Path = new drawing.Path();
        single.addRect(ltrb(0, 0, 50, 50));
        const double: drawing.Path = new drawing.Path();
        double.addRect(ltrb(0, 0, 50, 50));
        double.addRect(ltrb(60, 60, 110, 110));
        expect(single.getPointData().length >= 4).assertTrue();
        expect(double.getPointData().length >= single.getPointData().length * 2).assertTrue();
        expect(double.getVerbData().length > single.getVerbData().length).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0494 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0495
     * @tc.name testPathDeep0495
     * @tc.desc Verify forcing a closure adds the hypotenuse to an open polyline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0495', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0495 begin');
      await runCase('testPathDeep0495', async () => {
        const open: drawing.Path = new drawing.Path();
        open.moveTo(0, 0);
        open.lineTo(100, 0);
        open.lineTo(100, 100);
        expect(Math.round(open.getLength(false))).assertEqual(200);
        expect(Math.round(open.getLength(true))).assertEqual(341);
        expect(open.isClosed()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0495 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0496
     * @tc.name testPathDeep0496
     * @tc.desc Verify rewind drops the old contour but keeps the path reusable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0496', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0496 begin');
      await runCase('testPathDeep0496', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 50, 50));
        shape.rewind();
        shape.addRect(ltrb(100, 100, 150, 150));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 25, 25, 3)).assertEqual(0);
        expect(shape.getBounds().left).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0496 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0497
     * @tc.name testPathDeep0497
     * @tc.desc Verify setLastPoint discards the pending segment of a stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0497', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0497 begin');
      await runCase('testPathDeep0497', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 100);
        shape.lineTo(150, 100);
        shape.setLastPoint(100, 100);
        shape.lineTo(180, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 180, 100, 3)).assertEqual(0);
        expect(inkRect(buffer, 20, 0, 90, CANVAS_SIZE)).assertEqual(700);
        expect(shape.getLastPoint().x).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0497 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0498
     * @tc.name testPathDeep0498
     * @tc.desc Verify contains honours the inverse winding fill of a rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0498', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0498 begin');
      await runCase('testPathDeep0498', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(40, 40, 160, 160));
        shape.setFillType(drawing.PathFillType.INVERSE_WINDING);
        expect(shape.contains(100, 100)).assertFalse();
        expect(shape.contains(5, 5)).assertTrue();
        expect(shape.isInverseFillType()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0498 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0499
     * @tc.name testPathDeep0499
     * @tc.desc Verify a quarter turn swaps the width and height of the bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPathDeep0499', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0499 begin');
      await runCase('testPathDeep0499', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(0, 0, 160, 40));
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(90, 0, 0);
        shape.transform(turn);
        const bounds: common2D.Rect = shape.getBounds();
        expect(Math.round(bounds.right - bounds.left)).assertEqual(40);
        expect(Math.round(bounds.bottom - bounds.top)).assertEqual(160);
        expect(shape.getLength(false) >= 350).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0499 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0500
     * @tc.name testPathDeep0500
     * @tc.desc Verify a union plus scale plus clip composes into one visible shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPathDeep0500', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0500 begin');
      await runCase('testPathDeep0500', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: drawing.Path = new drawing.Path();
        base.addRect(ltrb(0, 0, 100, 200));
        const other: drawing.Path = new drawing.Path();
        other.addRect(ltrb(60, 40, 160, 120));
        base.op(other, drawing.PathOp.UNION);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(0.5, 0.5, 0, 0);
        base.transform(zoom);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, 100, 100));
        target.canvas.clipPath(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(base);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 5900 && inkAll(buffer) <= 6500).assertTrue();
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
        expect(chanAt(buffer, 95, 95, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPathDeep0500 end');
    });

  });
}
