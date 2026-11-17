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
import { image } from '@kit.ImageKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { point, ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, countInkedPixels, maxChannel, near, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const CANVAS_SIZE: number = 200;

/**
 * Read one color channel of a pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } width - Buffer width in px.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function channelAt(buffer: ArrayBuffer, width: number, x: number, y: number, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * width + x) * 4 + channel];
}

/**
 * Draw a solid red square into a fresh offscreen target, used as an image source.
 *
 * @param { number } size - Square edge length in px.
 * @returns { Promise<OffscreenTarget> } Target whose top left square is solid red.
 */
async function createRedSource(size: number): Promise<OffscreenTarget> {
  const source: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 0, 0));
  source.canvas.attachBrush(brush);
  source.canvas.drawRect(0, 0, size, size);
  source.canvas.detachBrush();
  return source;
}

export default function canvasApiExtendedTest() {
  describe('CanvasApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_CANVAS_0067
     * @tc.name testCanvasApi0067
     * @tc.desc Verify save raises the save count by one and restore brings it back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0067 begin');
      await runCase('testCanvasApi0067', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const before: number = target.canvas.getSaveCount();
        const saved: number = target.canvas.save();
        const afterSave: number = target.canvas.getSaveCount();
        target.canvas.restore();
        const afterRestore: number = target.canvas.getSaveCount();
        expect(afterSave).assertEqual(before + 1);
        expect(saved).assertEqual(1);
        expect(afterRestore).assertEqual(before);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0068
     * @tc.name testCanvasApi0068
     * @tc.desc Verify two nested saves raise the count twice and each restore pops one level.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0068 begin');
      await runCase('testCanvasApi0068', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.save();
        expect(target.canvas.getSaveCount()).assertEqual(base + 2);
        target.canvas.restore();
        expect(target.canvas.getSaveCount()).assertEqual(base + 1);
        target.canvas.restore();
        expect(target.canvas.getSaveCount()).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0069
     * @tc.name testCanvasApi0069
     * @tc.desc Verify an extra restore on the base state keeps the save count and the canvas usable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0069 begin');
      await runCase('testCanvasApi0069', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.restore();
        target.canvas.restore();
        expect(target.canvas.getSaveCount()).assertEqual(base);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0070
     * @tc.name testCanvasApi0070
     * @tc.desc Verify restoreToCount pops every nested level at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0070 begin');
      await runCase('testCanvasApi0070', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.save();
        target.canvas.save();
        target.canvas.save();
        expect(target.canvas.getSaveCount()).assertEqual(base + 3);
        target.canvas.restoreToCount(base);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0071
     * @tc.name testCanvasApi0071
     * @tc.desc Verify a translation inside a save block stops applying after restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0071 begin');
      await runCase('testCanvasApi0071', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.translate(100, 100);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.restore();
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(800);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 110, 110, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0072
     * @tc.name testCanvasApi0072
     * @tc.desc Verify a clip rect inside a save block stops applying after restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0072 begin');
      await runCase('testCanvasApi0072', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.restore();
        target.canvas.drawRect(100, 100, 120, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(800);
        expect(channelAt(buffer, CANVAS_SIZE, 110, 110, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 110, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0073
     * @tc.name testCanvasApi0073
     * @tc.desc Verify a nested clip narrows the outer clip and the outer clip returns after restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0073 begin');
      await runCase('testCanvasApi0073', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.save();
        target.canvas.clipRect(ltrb(50, 50, 150, 150));
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.restore();
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.restore();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 125, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0074
     * @tc.name testCanvasApi0074
     * @tc.desc Verify translate and clip compose inside one save block and both are reverted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0074 begin');
      await runCase('testCanvasApi0074', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.translate(50, 50);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.restore();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 55, 55, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 45, 45, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0075
     * @tc.name testCanvasApi0075
     * @tc.desc Verify a layer bounded by a rect keeps only the content inside that rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0075 begin');
      await runCase('testCanvasApi0075', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.saveLayer(ltrb(0, 0, 100, 100));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0076
     * @tc.name testCanvasApi0076
     * @tc.desc Verify a layer without bounds covers the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0076 begin');
      await runCase('testCanvasApi0076', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.saveLayer();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(channelAt(buffer, CANVAS_SIZE, 0, 199, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0077
     * @tc.name testCanvasApi0077
     * @tc.desc Verify the alpha of a layer brush attenuates the composited content.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0077 begin');
      await runCase('testCanvasApi0077', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const layerBrush: drawing.Brush = new drawing.Brush();
        layerBrush.setColor(rgba(128, 255, 255, 255));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.saveLayer(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), layerBrush);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const alpha: number = channelAt(buffer, CANVAS_SIZE, 50, 50, 3);
        expect(alpha > 100).assertTrue();
        expect(alpha < 160).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0078
     * @tc.name testCanvasApi0078
     * @tc.desc Verify translate shifts a twenty pixel square by fifty pixels on both axes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0078 begin');
      await runCase('testCanvasApi0078', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.translate(50, 50);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 55, 55, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0079
     * @tc.name testCanvasApi0079
     * @tc.desc Verify a zero translation keeps the drawn area equal to an untranslated canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0079 begin');
      await runCase('testCanvasApi0079', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const baseline: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.translate(0, 0);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        baseline.canvas.attachBrush(brush);
        baseline.canvas.drawRect(10, 10, 60, 60);
        baseline.canvas.detachBrush();
        const shifted: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const plain: ArrayBuffer = await readPixelBuffer(baseline.pixelMap);
        expect(countInkedPixels(shifted)).assertEqual(countInkedPixels(plain));
        expect(countInkedPixels(shifted)).assertEqual(2500);
        expect(channelAt(shifted, CANVAS_SIZE, 30, 30, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0080
     * @tc.name testCanvasApi0080
     * @tc.desc Verify a negative translation pulls an off canvas square back into view.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0080 begin');
      await runCase('testCanvasApi0080', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.translate(-100, -100);
        target.canvas.drawRect(100, 100, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 125, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0081
     * @tc.name testCanvasApi0081
     * @tc.desc Verify an extreme translation moves the square fully off canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0081 begin');
      await runCase('testCanvasApi0081', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.translate(1000000, 1000000);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0082
     * @tc.name testCanvasApi0082
     * @tc.desc Verify a double scale turns a fifty pixel square into a hundred pixel square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0082 begin');
      await runCase('testCanvasApi0082', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.scale(2, 2);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0083
     * @tc.name testCanvasApi0083
     * @tc.desc Verify a half scale shrinks a hundred pixel square to fifty pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0083 begin');
      await runCase('testCanvasApi0083', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.scale(0.5, 0.5);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(matrix.getValue(0)).assertEqual(0.5);
        expect(matrix.getValue(4)).assertEqual(0.5);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 49, 49, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0084
     * @tc.name testCanvasApi0084
     * @tc.desc Verify a mirrored scale combined with a translation keeps the mirrored square visible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0084 begin');
      await runCase('testCanvasApi0084', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.translate(CANVAS_SIZE, 0);
        target.canvas.scale(-1, 1);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 165, 30, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0085
     * @tc.name testCanvasApi0085
     * @tc.desc Verify a unit scale leaves the total matrix as the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0085 begin');
      await runCase('testCanvasApi0085', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.scale(1, 1);
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matrix.getValue(4)).assertEqual(1);
        expect(matrix.getValue(2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0086
     * @tc.name testCanvasApi0086
     * @tc.desc Verify a ninety degree rotation around the canvas center moves the square to the left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0086 begin');
      await runCase('testCanvasApi0086', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.rotate(90, 100, 100);
        target.canvas.drawRect(100, 100, 110, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 60).assertTrue();
        expect(inked < 140).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 95, 105, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 105, 105, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0087
     * @tc.name testCanvasApi0087
     * @tc.desc Verify a one hundred eighty degree rotation around the square center keeps its footprint.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0087 begin');
      await runCase('testCanvasApi0087', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.rotate(180, 100, 100);
        target.canvas.drawRect(90, 90, 110, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 300).assertTrue();
        expect(inked < 500).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0088
     * @tc.name testCanvasApi0088
     * @tc.desc Verify a zero degree rotation keeps the square at its original place.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0088 begin');
      await runCase('testCanvasApi0088', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.rotate(0, 100, 100);
        target.canvas.drawRect(90, 90, 110, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 95, 95, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 85, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0089
     * @tc.name testCanvasApi0089
     * @tc.desc Verify a horizontal skew slides each row of the square to the right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0089 begin');
      await runCase('testCanvasApi0089', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.skew(1, 0);
        target.canvas.drawRect(0, 0, 10, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 70).assertTrue();
        expect(inked < 130).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 0, 5, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 15, 5, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0090
     * @tc.name testCanvasApi0090
     * @tc.desc Verify a vertical skew slides each column of the square downwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0090 begin');
      await runCase('testCanvasApi0090', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.skew(0, 1);
        target.canvas.drawRect(0, 0, 10, 10);
        target.canvas.detachBrush();
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(matrix.getValue(3)).assertEqual(1);
        expect(matrix.getValue(1)).assertEqual(0);
        expect(inked > 70).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 5, 15, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0091
     * @tc.name testCanvasApi0091
     * @tc.desc Verify a translation matrix concatenated on the canvas moves the square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0091 begin');
      await runCase('testCanvasApi0091', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(50, 50);
        target.canvas.attachBrush(brush);
        target.canvas.concatMatrix(matrix);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 55, 55, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0092
     * @tc.name testCanvasApi0092
     * @tc.desc Verify an identity matrix concatenated on the canvas changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0092 begin');
      await runCase('testCanvasApi0092', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.reset();
        target.canvas.attachBrush(brush);
        target.canvas.concatMatrix(matrix);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0093
     * @tc.name testCanvasApi0093
     * @tc.desc Verify a matrix translation adds up with a canvas translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0093 begin');
      await runCase('testCanvasApi0093', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(60, 0);
        target.canvas.attachBrush(brush);
        target.canvas.translate(40, 40);
        target.canvas.concatMatrix(matrix);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 105, 45, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 45, 45, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0094
     * @tc.name testCanvasApi0094
     * @tc.desc Verify the total matrix of a fresh canvas is the identity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0094 begin');
      await runCase('testCanvasApi0094', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(matrix.getValue(0)).assertEqual(1);
        expect(matrix.getValue(4)).assertEqual(1);
        expect(matrix.getValue(5)).assertEqual(0);
        expect(matrix.getValue(8)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0095
     * @tc.name testCanvasApi0095
     * @tc.desc Verify the total matrix exposes a translation on the x and y slots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0095 begin');
      await runCase('testCanvasApi0095', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(30, 40);
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(matrix.getValue(2)).assertEqual(30);
        expect(matrix.getValue(5)).assertEqual(40);
        expect(matrix.getValue(0)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0096
     * @tc.name testCanvasApi0096
     * @tc.desc Verify filling the canvas under a clip rect keeps only the clipped square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0096 begin');
      await runCase('testCanvasApi0096', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0097
     * @tc.name testCanvasApi0097
     * @tc.desc Verify a clip rect and a drawn rect keep only their overlapping square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0097 begin');
      await runCase('testCanvasApi0097', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(25, 25, 75, 75);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(625);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0098
     * @tc.name testCanvasApi0098
     * @tc.desc Verify a difference clip removes the clipped square from the painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0098 begin');
      await runCase('testCanvasApi0098', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 50, 50), drawing.ClipOp.DIFFERENCE);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(37500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 125, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0099
     * @tc.name testCanvasApi0099
     * @tc.desc Verify a zero area clip rect rejects every pixel of a full canvas fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0099 begin');
      await runCase('testCanvasApi0099', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(100, 100, 100, 180));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0100
     * @tc.name testCanvasApi0100
     * @tc.desc Verify two stacked clip rects keep only their intersection.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0100 begin');
      await runCase('testCanvasApi0100', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.clipRect(ltrb(50, 50, 150, 150), drawing.ClipOp.INTERSECT);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0101
     * @tc.name testCanvasApi0101
     * @tc.desc Verify an oversized clip rect is limited by the canvas bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0101 begin');
      await runCase('testCanvasApi0101', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(-100, -100, 100, 100));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 99, 99, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 101, 101, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0102
     * @tc.name testCanvasApi0102
     * @tc.desc Verify a clip rect covering the canvas keeps the fill complete.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0102 begin');
      await runCase('testCanvasApi0102', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.clipRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(channelAt(buffer, CANVAS_SIZE, 199, 199, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0103
     * @tc.name testCanvasApi0103
     * @tc.desc Verify a triangle clip keeps an area close to the analytic triangle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0103 begin');
      await runCase('testCanvasApi0103', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.moveTo(50, 50);
        path.lineTo(150, 50);
        path.lineTo(100, 150);
        path.close();
        target.canvas.clipPath(path);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 4500).assertTrue();
        expect(inked < 5500).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0104
     * @tc.name testCanvasApi0104
     * @tc.desc Verify a circle clip keeps an area close to the analytic circle area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0104 begin');
      await runCase('testCanvasApi0104', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 50);
        target.canvas.clipPath(path);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 7300).assertTrue();
        expect(inked < 8300).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0105
     * @tc.name testCanvasApi0105
     * @tc.desc Verify an empty path clip rejects every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0105 begin');
      await runCase('testCanvasApi0105', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        expect(path.isEmpty()).assertTrue();
        target.canvas.clipPath(path);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0106
     * @tc.name testCanvasApi0106
     * @tc.desc Verify a difference circle clip punches a hole in the painted canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0106 begin');
      await runCase('testCanvasApi0106', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 50);
        target.canvas.clipPath(path, drawing.ClipOp.DIFFERENCE);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 31300).assertTrue();
        expect(inked < 33000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0107
     * @tc.name testCanvasApi0107
     * @tc.desc Verify a rounded clip removes the four corner pixels of the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0107 begin');
      await runCase('testCanvasApi0107', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), 40, 40);
        target.canvas.clipRoundRect(roundRect);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 37500).assertTrue();
        expect(inked < 39900).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0108
     * @tc.name testCanvasApi0108
     * @tc.desc Verify a rounded clip with zero radius behaves like a plain rect clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0108 begin');
      await runCase('testCanvasApi0108', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 100, 100), 0, 0);
        target.canvas.clipRoundRect(roundRect);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0109
     * @tc.name testCanvasApi0109
     * @tc.desc Verify a region clip keeps only the region square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0109 begin');
      await runCase('testCanvasApi0109', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const region: drawing.Region = new drawing.Region(0, 0, 50, 50);
        target.canvas.clipRegion(region);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0110
     * @tc.name testCanvasApi0110
     * @tc.desc Verify two intersecting region clips keep only their overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0110 begin');
      await runCase('testCanvasApi0110', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const first: drawing.Region = new drawing.Region(0, 0, 100, 100);
        const second: drawing.Region = new drawing.Region(50, 50, 150, 150);
        target.canvas.clipRegion(first);
        target.canvas.clipRegion(second, drawing.ClipOp.INTERSECT);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 40, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0111
     * @tc.name testCanvasApi0111
     * @tc.desc Verify a difference region clip removes its own square from the fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0111 begin');
      await runCase('testCanvasApi0111', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const region: drawing.Region = new drawing.Region(0, 0, 50, 50);
        target.canvas.clipRegion(region, drawing.ClipOp.DIFFERENCE);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(37500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0112
     * @tc.name testCanvasApi0112
     * @tc.desc Verify the local clip bounds of a fresh canvas equal the canvas size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0112 begin');
      await runCase('testCanvasApi0112', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.left, 0, 1)).assertTrue();
        expect(bounds.right - bounds.left).assertEqual(202);
        expect(bounds.bottom - bounds.top).assertEqual(202);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0113
     * @tc.name testCanvasApi0113
     * @tc.desc Verify the local clip bounds shrink to the clip rect after clipping.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0113 begin');
      await runCase('testCanvasApi0113', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(10, 10, 60, 60));
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.left, 10, 1)).assertTrue();
        expect(near(bounds.top, 10, 1)).assertTrue();
        expect(near(bounds.right, 60, 1)).assertTrue();
        expect(near(bounds.bottom, 60, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0114
     * @tc.name testCanvasApi0114
     * @tc.desc Verify drawImage copies the source red square to the canvas origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0114 begin');
      await runCase('testCanvasApi0114', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0115
     * @tc.name testCanvasApi0115
     * @tc.desc Verify two drawImage calls place the source block at both offsets.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0115 begin');
      await runCase('testCanvasApi0115', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0);
        target.canvas.drawImage(source.pixelMap, 100, 100);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(5000);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 125, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0116
     * @tc.name testCanvasApi0116
     * @tc.desc Verify drawImage of a fully transparent source paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0116 begin');
      await runCase('testCanvasApi0116', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0117
     * @tc.name testCanvasApi0117
     * @tc.desc Verify drawImageRect scales the whole source into a half size destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0117 begin');
      await runCase('testCanvasApi0117', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, 100, 100));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(625);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 40, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0118
     * @tc.name testCanvasApi0118
     * @tc.desc Verify two drawImageRect calls with growing destinations end up clipped by the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0118 begin');
      await runCase('testCanvasApi0118', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, 100, 100));
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, 400, 400));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0119
     * @tc.name testCanvasApi0119
     * @tc.desc Verify a destination outside the canvas together with a clip rect keeps the visible part.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0119 begin');
      await runCase('testCanvasApi0119', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 160, 160));
        target.canvas.drawImageRect(source.pixelMap, ltrb(150, 150, 250, 250));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(100);
        expect(channelAt(buffer, CANVAS_SIZE, 155, 155, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 140, 140, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0120
     * @tc.name testCanvasApi0120
     * @tc.desc Verify drawImageRectWithSrc magnifies a red source region to the full canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0120 begin');
      await runCase('testCanvasApi0120', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, 50, 50), ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0121
     * @tc.name testCanvasApi0121
     * @tc.desc Verify drawImageRectWithSrc under the STRICT constraint keeps the destination size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0121 begin');
      await runCase('testCanvasApi0121', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, 50, 50), ltrb(50, 50, 150, 150),
          new drawing.SamplingOptions(), drawing.SrcRectConstraint.STRICT);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0122
     * @tc.name testCanvasApi0122
     * @tc.desc Verify drawImageRectWithSrc of an empty source square paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0122 begin');
      await runCase('testCanvasApi0122', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(50, 50, 50, 50), ltrb(0, 0, 100, 100));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0123
     * @tc.name testCanvasApi0123
     * @tc.desc Verify a rect drawn after drawImage replaces the source color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0123 begin');
      await runCase('testCanvasApi0123', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawImage(source.pixelMap, 0, 0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 2)).assertEqual(255);
        expect(countInkedPixels(buffer)).assertEqual(2500);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0124
     * @tc.name testCanvasApi0124
     * @tc.desc Verify a reversed destination rect is rejected without corrupting the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0124 begin');
      await runCase('testCanvasApi0124', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          target.canvas.drawImageRect(source.pixelMap, ltrb(150, 150, 100, 100));
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'reversed destination rect rejected by the engine');
        }
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 0)).assertEqual(255);
        expect(countInkedPixels(buffer) > 2400).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0125
     * @tc.name testCanvasApi0125
     * @tc.desc Verify a one cell pixel map mesh keeps the canvas drawable afterwards.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0125 begin');
      await runCase('testCanvasApi0125', async () => {
        const source: OffscreenTarget = await createRedSource(50);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const vertices: Array<number> = [0, 0, 100, 0, 0, 100, 100, 100];
        try {
          target.canvas.drawPixelMapMesh(source.pixelMap, 1, 1, vertices, 0, null, 0);
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'pixel map mesh rejected by the engine');
        }
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(150, 150, 170, 170);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 160, 160, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) > 300).assertTrue();
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0126
     * @tc.name testCanvasApi0126
     * @tc.desc Verify drawRegion paints exactly the region square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0126 begin');
      await runCase('testCanvasApi0126', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const region: drawing.Region = new drawing.Region(10, 10, 60, 60);
        target.canvas.attachBrush(brush);
        target.canvas.drawRegion(region);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0127
     * @tc.name testCanvasApi0127
     * @tc.desc Verify drawRegion of an empty region paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0127 begin');
      await runCase('testCanvasApi0127', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const region: drawing.Region = new drawing.Region();
        expect(region.isEmpty()).assertTrue();
        target.canvas.attachBrush(brush);
        target.canvas.drawRegion(region);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0128
     * @tc.name testCanvasApi0128
     * @tc.desc Verify drawRegion under a pen inks only the region border.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0128 begin');
      await runCase('testCanvasApi0128', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        const region: drawing.Region = new drawing.Region(20, 20, 120, 120);
        target.canvas.attachPen(pen);
        target.canvas.drawRegion(region);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 700).assertTrue();
        expect(inked < 1700).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 70, 70, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0129
     * @tc.name testCanvasApi0129
     * @tc.desc Verify drawColor respects the active clip rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0129 begin');
      await runCase('testCanvasApi0129', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.drawColor(rgba(255, 255, 0, 0), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0130
     * @tc.name testCanvasApi0130
     * @tc.desc Verify the offscreen canvas keeps isOpaque as false while it is painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0130 begin');
      await runCase('testCanvasApi0130', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        expect(target.canvas.isOpaque()).assertFalse();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        expect(target.canvas.isOpaque()).assertFalse();
        target.canvas.drawColor(rgba(255, 0, 255, 0), drawing.BlendMode.SRC);
        expect(target.canvas.isOpaque()).assertFalse();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0131
     * @tc.name testCanvasApi0131
     * @tc.desc Verify a non square offscreen canvas reports its own width and height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0131 begin');
      await runCase('testCanvasApi0131', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(160, 120);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 160, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.getWidth()).assertEqual(160);
        expect(target.canvas.getHeight()).assertEqual(120);
        expect(countInkedPixels(buffer)).assertEqual(19200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0132
     * @tc.name testCanvasApi0132
     * @tc.desc Verify a background drawn before save survives a save and restore cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0132 begin');
      await runCase('testCanvasApi0132', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawBackground(brush);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.restore();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 2)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0132 end');
    });
  });
}
