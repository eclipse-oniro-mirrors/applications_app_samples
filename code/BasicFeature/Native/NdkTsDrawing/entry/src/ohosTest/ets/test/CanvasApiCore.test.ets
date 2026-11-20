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
import { countInkedPixels, DRAWING_TAG, maxChannel, readPixelBuffer, runCase, throwsOn } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const CANVAS_SIZE: number = 200;

/**
 * Read the alpha channel of one pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Alpha value of the pixel.
 */
function alphaAt(buffer: ArrayBuffer, width: number, x: number, y: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * width + x) * 4 + 3];
}

export default function canvasApiCoreTest() {
  describe('CanvasApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_CANVAS_0001
     * @tc.name testCanvasApi0001
     * @tc.desc Verify the four edge drawRect overload fills a red frame with exact pixel count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0001 begin');
      await runCase('testCanvasApi0001', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 10, 110, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(maxChannel(buffer, 0)).assertEqual(255);
        expect(maxChannel(buffer, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0002
     * @tc.name testCanvasApi0002
     * @tc.desc Verify the rect object overload matches the four edge overload on the same frame.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0002 begin');
      await runCase('testCanvasApi0002', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        const rect: common2D.Rect = ltrb(10, 10, 110, 110);
        target.canvas.drawRect(rect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(maxChannel(buffer, 2)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 10, 10)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0003
     * @tc.name testCanvasApi0003
     * @tc.desc Verify a zero width rect paints nothing and leaves the canvas size intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0003 begin');
      await runCase('testCanvasApi0003', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(100, 100, 100, 180);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0004
     * @tc.name testCanvasApi0004
     * @tc.desc Verify an inverted rect is normalised into the same 100 by 100 area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0004 begin');
      await runCase('testCanvasApi0004', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(150, 10, 50, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 60)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 40, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0005
     * @tc.name testCanvasApi0005
     * @tc.desc Verify a rect crossing the canvas edge keeps only the visible part.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0005 begin');
      await runCase('testCanvasApi0005', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(150, 150, 250, 250);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(alphaAt(buffer, CANVAS_SIZE, 199, 199)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 149, 149)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0006
     * @tc.name testCanvasApi0006
     * @tc.desc Verify a stroked rect inks only its border and leaves the interior empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0006 begin');
      await runCase('testCanvasApi0006', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(20, 20, 120, 120);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1500).assertTrue();
        expect(inked < 3500).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 70, 70)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0007
     * @tc.name testCanvasApi0007
     * @tc.desc Verify pen and brush together fill the frame plus a two pixel pen border.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0007 begin');
      await runCase('testCanvasApi0007', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachPen(pen);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(20, 20, 120, 120);
        target.canvas.detachBrush();
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10816);
        expect(maxChannel(buffer, 1)).assertEqual(255);
        expect(maxChannel(buffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0008
     * @tc.name testCanvasApi0008
     * @tc.desc Verify a full canvas rect inks every pixel with full alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0008 begin');
      await runCase('testCanvasApi0008', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(alphaAt(buffer, CANVAS_SIZE, 199, 199)).assertEqual(255);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0009
     * @tc.name testCanvasApi0009
     * @tc.desc Verify a one pixel high rect inks exactly one row of pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0009 begin');
      await runCase('testCanvasApi0009', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 100, CANVAS_SIZE, 101);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(200);
        expect(alphaAt(buffer, CANVAS_SIZE, 0, 100)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 0, 101)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0010
     * @tc.name testCanvasApi0010
     * @tc.desc Verify a half transparent brush keeps its alpha value on every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0010 begin');
      await runCase('testCanvasApi0010', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const half: drawing.Brush = new drawing.Brush();
        half.setColor(rgba(128, 255, 0, 0));
        target.canvas.attachBrush(half);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const quarter: drawing.Brush = new drawing.Brush();
        quarter.setColor(rgba(64, 255, 0, 0));
        target.canvas.attachBrush(quarter);
        target.canvas.drawRect(100, 100, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(alphaAt(buffer, CANVAS_SIZE, 10, 10)).assertEqual(128);
        expect(alphaAt(buffer, CANVAS_SIZE, 110, 110)).assertEqual(64);
        expect(countInkedPixels(buffer)).assertEqual(5000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0011
     * @tc.name testCanvasApi0011
     * @tc.desc Verify drawing the same frame twice does not accumulate extra ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0011 begin');
      await runCase('testCanvasApi0011', async () => {
        const twice: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const once: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const twiceBrush: drawing.Brush = new drawing.Brush();
        twiceBrush.setColor(rgba(255, 255, 0, 0));
        twice.canvas.attachBrush(twiceBrush);
        twice.canvas.drawRect(10, 10, 110, 110);
        twice.canvas.drawRect(10, 10, 110, 110);
        twice.canvas.detachBrush();
        const onceBrush: drawing.Brush = new drawing.Brush();
        onceBrush.setColor(rgba(255, 255, 0, 0));
        once.canvas.attachBrush(onceBrush);
        once.canvas.drawRect(10, 10, 110, 110);
        once.canvas.detachBrush();
        const twiceBuffer: ArrayBuffer = await readPixelBuffer(twice.pixelMap);
        const onceBuffer: ArrayBuffer = await readPixelBuffer(once.pixelMap);
        expect(countInkedPixels(twiceBuffer)).assertEqual(countInkedPixels(onceBuffer));
        expect(maxChannel(twiceBuffer, 3)).assertEqual(255);
        expect(alphaAt(twiceBuffer, CANVAS_SIZE, 110, 110)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0012
     * @tc.name testCanvasApi0012
     * @tc.desc Verify two disjoint frames sum their ink areas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0012 begin');
      await runCase('testCanvasApi0012', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.drawRect(100, 100, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(5000);
        expect(alphaAt(buffer, CANVAS_SIZE, 49, 49)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 50, 50)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0013
     * @tc.name testCanvasApi0013
     * @tc.desc Verify an extreme coordinate rect stays clipped and the canvas remains usable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0013 begin');
      await runCase('testCanvasApi0013', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 1000000000, 1000000000);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(39900);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0014
     * @tc.name testCanvasApi0014
     * @tc.desc Verify a NaN coordinate rect does not corrupt the canvas state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0014 begin');
      await runCase('testCanvasApi0014', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        try {
          target.canvas.drawRect(Number.NaN, 0, 100, 100);
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'NaN rect rejected by the engine');
        }
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(maxChannel(buffer, 0)).assertEqual(255);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0015
     * @tc.name testCanvasApi0015
     * @tc.desc Verify a filled circle covers an area close to the analytic circle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0015 begin');
      await runCase('testCanvasApi0015', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 7400).assertTrue();
        expect(inked < 8300).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0016
     * @tc.name testCanvasApi0016
     * @tc.desc Verify a zero radius circle paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0016 begin');
      await runCase('testCanvasApi0016', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 0);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0017
     * @tc.name testCanvasApi0017
     * @tc.desc Verify a circle centered on the canvas corner keeps only its visible quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0017 begin');
      await runCase('testCanvasApi0017', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(0, 0, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1200).assertTrue();
        expect(inked < 2600).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 40, 0)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 60, 60)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0018
     * @tc.name testCanvasApi0018
     * @tc.desc Verify a circle larger than the canvas fills every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0018 begin');
      await runCase('testCanvasApi0018', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 400);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(39900);
        expect(alphaAt(buffer, CANVAS_SIZE, 0, 0)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 199, 199)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0019
     * @tc.name testCanvasApi0019
     * @tc.desc Verify a negative radius circle paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0019 begin');
      await runCase('testCanvasApi0019', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, -50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0020
     * @tc.name testCanvasApi0020
     * @tc.desc Verify a filled oval covers an area close to the analytic ellipse area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0020 begin');
      await runCase('testCanvasApi0020', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(50, 75, 150, 125));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 3400).assertTrue();
        expect(inked < 4400).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0021
     * @tc.name testCanvasApi0021
     * @tc.desc Verify a zero height oval paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0021 begin');
      await runCase('testCanvasApi0021', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(50, 100, 150, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0022
     * @tc.name testCanvasApi0022
     * @tc.desc Verify an oval covering the whole canvas approaches the circle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0022 begin');
      await runCase('testCanvasApi0022', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 30500).assertTrue();
        expect(inked < 32000).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0023
     * @tc.name testCanvasApi0023
     * @tc.desc Verify an arc with zero sweep angle paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0023 begin');
      await runCase('testCanvasApi0023', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 0);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0024
     * @tc.name testCanvasApi0024
     * @tc.desc Verify a stroked quarter arc inks a non trivial number of pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0024 begin');
      await runCase('testCanvasApi0024', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 90);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 100).assertTrue();
        expect(inked < 3000).assertTrue();
        expect(maxChannel(buffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0025
     * @tc.name testCanvasApi0025
     * @tc.desc Verify a full sweep filled arc equals the filled circle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0025 begin');
      await runCase('testCanvasApi0025', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 7000).assertTrue();
        expect(inked < 8300).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0026
     * @tc.name testCanvasApi0026
     * @tc.desc Verify a negative sweep angle still paints a visible arc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0026 begin');
      await runCase('testCanvasApi0026', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArc(ltrb(50, 50, 150, 150), 0, -90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(500);
        expect(maxChannel(buffer, 0)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0027
     * @tc.name testCanvasApi0027
     * @tc.desc Verify a 720 degree sweep overlaps itself and keeps the circle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0027 begin');
      await runCase('testCanvasApi0027', async () => {
        const doubleTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const singleTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const doubleBrush: drawing.Brush = new drawing.Brush();
        doubleBrush.setColor(rgba(255, 255, 0, 0));
        doubleTarget.canvas.attachBrush(doubleBrush);
        doubleTarget.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 720);
        doubleTarget.canvas.detachBrush();
        const singleBrush: drawing.Brush = new drawing.Brush();
        singleBrush.setColor(rgba(255, 255, 0, 0));
        singleTarget.canvas.attachBrush(singleBrush);
        singleTarget.canvas.drawArc(ltrb(50, 50, 150, 150), 0, 360);
        singleTarget.canvas.detachBrush();
        const doubleBuffer: ArrayBuffer = await readPixelBuffer(doubleTarget.pixelMap);
        const singleBuffer: ArrayBuffer = await readPixelBuffer(singleTarget.pixelMap);
        const delta: number = Math.abs(countInkedPixels(doubleBuffer) - countInkedPixels(singleBuffer));
        expect(delta < 50).assertTrue();
        expect(countInkedPixels(doubleBuffer) > 7000).assertTrue();
        expect(alphaAt(doubleBuffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0028
     * @tc.name testCanvasApi0028
     * @tc.desc Verify a centered quarter arc fills a quarter of the circle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0028 begin');
      await runCase('testCanvasApi0028', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, true);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1200).assertTrue();
        expect(inked < 2600).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0029
     * @tc.name testCanvasApi0029
     * @tc.desc Verify an uncentered quarter arc excludes the center region.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0029 begin');
      await runCase('testCanvasApi0029', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, false);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 300).assertTrue();
        expect(inked < 1500).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0030
     * @tc.name testCanvasApi0030
     * @tc.desc Verify a centered arc inks more than the same arc without center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0030 begin');
      await runCase('testCanvasApi0030', async () => {
        const centered: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        centered.canvas.attachBrush(brush);
        centered.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, true);
        centered.canvas.detachBrush();
        const plainBrush: drawing.Brush = new drawing.Brush();
        plainBrush.setColor(rgba(255, 255, 0, 0));
        plain.canvas.attachBrush(plainBrush);
        plain.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, false);
        plain.canvas.detachBrush();
        const centeredBuffer: ArrayBuffer = await readPixelBuffer(centered.pixelMap);
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        expect(countInkedPixels(centeredBuffer)).assertLarger(countInkedPixels(plainBuffer));
        expect(maxChannel(centeredBuffer, 0)).assertEqual(255);
        expect(maxChannel(plainBuffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0031
     * @tc.name testCanvasApi0031
     * @tc.desc Verify a single point with a one pixel pen inks a tiny dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0031 begin');
      await runCase('testCanvasApi0031', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(1);
        target.canvas.attachPen(pen);
        target.canvas.drawPoint(100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 0).assertTrue();
        expect(inked < 10).assertTrue();
        expect(maxChannel(buffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0032
     * @tc.name testCanvasApi0032
     * @tc.desc Verify a single point with a twenty pixel pen inks a round dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0032 begin');
      await runCase('testCanvasApi0032', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawPoint(100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 250).assertTrue();
        expect(inked < 450).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0033
     * @tc.name testCanvasApi0033
     * @tc.desc Verify a point outside the canvas paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0033 begin');
      await runCase('testCanvasApi0033', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPoint(-50, -50);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0034
     * @tc.name testCanvasApi0034
     * @tc.desc Verify two isolated points in POINTS mode ink two dots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0034 begin');
      await runCase('testCanvasApi0034', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        const points: Array<common2D.Point> = [point(50, 50), point(150, 150)];
        target.canvas.drawPoints(points, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 100).assertTrue();
        expect(inked < 400).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 50, 50)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0035
     * @tc.name testCanvasApi0035
     * @tc.desc Verify two points in LINES mode ink a connecting stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0035 begin');
      await runCase('testCanvasApi0035', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        const points: Array<common2D.Point> = [point(50, 50), point(150, 150)];
        target.canvas.drawPoints(points, drawing.PointMode.LINES);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 400).assertTrue();
        expect(inked < 1200).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0036
     * @tc.name testCanvasApi0036
     * @tc.desc Verify three points in POLYGON mode ink a closed triangle outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0036 begin');
      await runCase('testCanvasApi0036', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        const points: Array<common2D.Point> = [point(50, 50), point(150, 50), point(100, 150)];
        target.canvas.drawPoints(points, drawing.PointMode.POLYGON);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertEqual(794);
        expect(inked < 2500).assertTrue();
        expect(maxChannel(buffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0037
     * @tc.name testCanvasApi0037
     * @tc.desc Verify an empty point array is rejected and paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0037 begin');
      await runCase('testCanvasApi0037', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        const points: Array<common2D.Point> = [];
        const rejected: boolean = throwsOn(() => target.canvas.drawPoints(points, drawing.PointMode.LINES));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(rejected).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0038
     * @tc.name testCanvasApi0038
     * @tc.desc Verify one point in LINES mode inks nothing because a line needs two points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0038 begin');
      await runCase('testCanvasApi0038', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        const points: Array<common2D.Point> = [point(100, 100)];
        target.canvas.drawPoints(points, drawing.PointMode.LINES);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0039
     * @tc.name testCanvasApi0039
     * @tc.desc Verify a horizontal line of ten pixel width inks one full row band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0039 begin');
      await runCase('testCanvasApi0039', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 100, CANVAS_SIZE, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1800).assertTrue();
        expect(inked < 2300).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0040
     * @tc.name testCanvasApi0040
     * @tc.desc Verify a vertical line of ten pixel width inks one full column band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0040 begin');
      await runCase('testCanvasApi0040', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 0, 100, CANVAS_SIZE);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 1800).assertTrue();
        expect(inked < 2300).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0041
     * @tc.name testCanvasApi0041
     * @tc.desc Verify a degenerate line with round cap still inks a dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0041 begin');
      await runCase('testCanvasApi0041', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(20);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 100, 100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 200).assertTrue();
        expect(inked < 600).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0042
     * @tc.name testCanvasApi0042
     * @tc.desc Verify a line fully outside the canvas paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0042 begin');
      await runCase('testCanvasApi0042', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(-50, -50, -10, -10);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0043
     * @tc.name testCanvasApi0043
     * @tc.desc Verify drawing a rect path fills the same area as drawRect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0043 begin');
      await runCase('testCanvasApi0043', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(10, 10, 110, 110));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(maxChannel(buffer, 0)).assertEqual(255);
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0044
     * @tc.name testCanvasApi0044
     * @tc.desc Verify drawing a circle path fills an area close to the circle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0044 begin');
      await runCase('testCanvasApi0044', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 50);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 7400).assertTrue();
        expect(inked < 8300).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0045
     * @tc.name testCanvasApi0045
     * @tc.desc Verify a closed triangle path strokes three edges and no interior.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0045 begin');
      await runCase('testCanvasApi0045', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(100, 40);
        path.lineTo(160, 160);
        path.lineTo(40, 160);
        path.close();
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 900).assertTrue();
        expect(inked < 5000).assertTrue();
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0046
     * @tc.name testCanvasApi0046
     * @tc.desc Verify an empty path paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0046 begin');
      await runCase('testCanvasApi0046', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0047
     * @tc.name testCanvasApi0047
     * @tc.desc Verify a four point polygon path fills its quad area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0047 begin');
      await runCase('testCanvasApi0047', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        const points: Array<common2D.Point> = [point(50, 50), point(150, 50), point(150, 150), point(50, 150)];
        path.addPolygon(points, true);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(maxChannel(buffer, 0)).assertEqual(255);
        expect(path.isClosed()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0048
     * @tc.name testCanvasApi0048
     * @tc.desc Verify the inverse fill type paints the area outside the path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0048 begin');
      await runCase('testCanvasApi0048', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(50, 50, 150, 150));
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(25000);
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(0);
        expect(path.getFillType()).assertEqual(drawing.PathFillType.INVERSE_WINDING);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0049
     * @tc.name testCanvasApi0049
     * @tc.desc Verify transforming a path moves both its ink and its containment result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0049 begin');
      await runCase('testCanvasApi0049', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 50, 50));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        path.transform(matrix);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(path.contains(25, 25)).assertFalse();
        expect(path.contains(125, 125)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0050
     * @tc.name testCanvasApi0050
     * @tc.desc Verify an arc added to a path inks a filled pie slice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0050 begin');
      await runCase('testCanvasApi0050', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addArc(ltrb(50, 50, 150, 150), 0, 90);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(500);
        expect(path.isEmpty()).assertFalse();
        expect(maxChannel(buffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0051
     * @tc.name testCanvasApi0051
     * @tc.desc Verify a cubic curve path strokes a visible outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0051 begin');
      await runCase('testCanvasApi0051', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 100);
        path.cubicTo(60, 20, 140, 180, 180, 100);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(300);
        expect(path.getLength(false) > 100).assertTrue();
        expect(maxChannel(buffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0052
     * @tc.name testCanvasApi0052
     * @tc.desc Verify a quadratic curve path strokes a visible outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0052 begin');
      await runCase('testCanvasApi0052', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(20, 150);
        path.quadTo(100, 20, 180, 150);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(300);
        expect(path.getLength(false) > 100).assertTrue();
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0053
     * @tc.name testCanvasApi0053
     * @tc.desc Verify a round rect path fills its frame minus the four corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0053 begin');
      await runCase('testCanvasApi0053', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 180, 180), 40, 40);
        const path: drawing.Path = new drawing.Path();
        path.addRoundRect(roundRect);
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 20000).assertTrue();
        expect(inked < 25600).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 20, 20)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0054
     * @tc.name testCanvasApi0054
     * @tc.desc Verify reset clears every segment so the path paints nothing afterwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0054 begin');
      await runCase('testCanvasApi0054', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(0, 0, 100, 100));
        expect(path.isEmpty()).assertFalse();
        path.reset();
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(path.isEmpty()).assertTrue();
        expect(path.getPointData().length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0055
     * @tc.name testCanvasApi0055
     * @tc.desc Verify a round rect with zero radius fills the same area as a plain rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0055 begin');
      await runCase('testCanvasApi0055', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 110, 110), 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(alphaAt(buffer, CANVAS_SIZE, 10, 10)).assertEqual(255);
        expect(maxChannel(buffer, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0056
     * @tc.name testCanvasApi0056
     * @tc.desc Verify a forty pixel radius round rect leaves the corner pixel empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0056 begin');
      await runCase('testCanvasApi0056', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 180, 180), 40, 40);
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(alphaAt(buffer, CANVAS_SIZE, 20, 20)).assertEqual(0);
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
        expect(inked < 25600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0057
     * @tc.name testCanvasApi0057
     * @tc.desc Verify a nested round rect pair paints an outer ring plus the inner round rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0057 begin');
      await runCase('testCanvasApi0057', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const outer: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 190, 190), 30, 30);
        const inner: drawing.RoundRect = new drawing.RoundRect(ltrb(60, 60, 140, 140), 20, 20);
        target.canvas.attachBrush(brush);
        target.canvas.drawNestedRoundRect(outer, inner);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 0).assertTrue();
        expect(inked < 32400).assertTrue();
        expect(alphaAt(buffer, CANVAS_SIZE, 10, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0058
     * @tc.name testCanvasApi0058
     * @tc.desc Verify the round rect corner radii survive construction and read back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0058 begin');
      await runCase('testCanvasApi0058', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 12, 18);
        const corner: common2D.Point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(corner.x).assertEqual(12);
        expect(corner.y).assertEqual(18);
        const bottom: common2D.Point = roundRect.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(bottom.x).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0059
     * @tc.name testCanvasApi0059
     * @tc.desc Verify offsetting a round rect keeps its radii unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0059 begin');
      await runCase('testCanvasApi0059', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 10, 10);
        roundRect.offset(30, 40);
        const corner: common2D.Point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(corner.x).assertEqual(10);
        expect(corner.y).assertEqual(10);
        expect(roundRect.getCorner(drawing.CornerPos.TOP_RIGHT_POS).x).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0060
     * @tc.name testCanvasApi0060
     * @tc.desc Verify a round rect built from a plain rect starts with zero radii.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0060 begin');
      await runCase('testCanvasApi0060', async () => {
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(5, 5, 95, 95), 0, 0);
        const corner: common2D.Point = roundRect.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(corner.x).assertEqual(0);
        expect(corner.y).assertEqual(0);
        expect(roundRect.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS).x).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0061
     * @tc.name testCanvasApi0061
     * @tc.desc Verify drawBackground paints the whole canvas with the brush color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0061 begin');
      await runCase('testCanvasApi0061', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawBackground(brush);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 2)).assertEqual(255);
        expect(alphaAt(buffer, CANVAS_SIZE, 100, 100)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0062
     * @tc.name testCanvasApi0062
     * @tc.desc Verify drawBackground overwrites previously painted content.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0062 begin');
      await runCase('testCanvasApi0062', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const red: drawing.Brush = new drawing.Brush();
        red.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(red);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const blue: drawing.Brush = new drawing.Brush();
        blue.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawBackground(blue);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 0)).assertEqual(0);
        expect(maxChannel(buffer, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0063
     * @tc.name testCanvasApi0063
     * @tc.desc Verify the color object drawColor overload fills the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0063 begin');
      await runCase('testCanvasApi0063', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 12, 34, 56));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 0)).assertEqual(12);
        expect(maxChannel(buffer, 1)).assertEqual(34);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0064
     * @tc.name testCanvasApi0064
     * @tc.desc Verify the four channel drawColor overload keeps every channel value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0064 begin');
      await runCase('testCanvasApi0064', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(255, 10, 20, 30);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 0)).assertEqual(10);
        expect(maxChannel(buffer, 1)).assertEqual(20);
        expect(maxChannel(buffer, 2)).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0065
     * @tc.name testCanvasApi0065
     * @tc.desc Verify a packed ARGB colour with an almost zero alpha stays invisible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0065 begin');
      await runCase('testCanvasApi0065', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const packed: number = 16843009;
        target.canvas.drawColor(packed);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 3) <= 1).assertTrue();
        expect(maxChannel(buffer, 0) <= 1).assertTrue();
        expect(maxChannel(buffer, 1) <= 1).assertTrue();
        expect(maxChannel(buffer, 2) <= 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0066
     * @tc.name testCanvasApi0066
     * @tc.desc Verify a CLEAR blend drawColor leaves every pixel transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0066 begin');
      await runCase('testCanvasApi0066', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 255, 0, 0));
        target.canvas.drawColor(rgba(255, 0, 0, 255), drawing.BlendMode.CLEAR);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0066 end');
    });
  });
}
