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
 * Create an offscreen target with the whole canvas painted solid red.
 *
 * @param { number } size - Square edge length in px.
 * @returns { Promise<OffscreenTarget> } Target fully covered by opaque red.
 */
async function createSolidTarget(size: number): Promise<OffscreenTarget> {
  const target: OffscreenTarget = await createOffscreenTarget(size, size);
  target.canvas.clear(rgba(255, 255, 0, 0));
  return target;
}

export default function canvasApiAdvancedTest() {
  describe('CanvasApiAdvancedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_CANVAS_0133
     * @tc.name testCanvasApi0133
     * @tc.desc Verify clear with a transparent color empties the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0133 begin');
      await runCase('testCanvasApi0133', async () => {
        const target: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        target.canvas.clear(rgba(0, 0, 0, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0134
     * @tc.name testCanvasApi0134
     * @tc.desc Verify clear fills the whole canvas and a later rect overwrites part of it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0134 begin');
      await runCase('testCanvasApi0134', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.clear(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0135
     * @tc.name testCanvasApi0135
     * @tc.desc Verify clear replaces earlier content instead of blending with it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0135 begin');
      await runCase('testCanvasApi0135', async () => {
        const target: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        target.canvas.clear(rgba(255, 0, 0, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0136
     * @tc.name testCanvasApi0136
     * @tc.desc Verify clear with a half transparent color keeps that alpha everywhere.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0136 begin');
      await runCase('testCanvasApi0136', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(128, 255, 255, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 3)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 199, 0, 3)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0136 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0137
     * @tc.name testCanvasApi0137
     * @tc.desc Verify clearing twice with the same color does not accumulate alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0137 begin');
      await runCase('testCanvasApi0137', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(128, 0, 0, 255));
        target.canvas.clear(rgba(128, 0, 0, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 3)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 2)).assertEqual(128);
        expect(countInkedPixels(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0138
     * @tc.name testCanvasApi0138
     * @tc.desc Verify resetMatrix drops a translation applied before it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0138 begin');
      await runCase('testCanvasApi0138', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(100, 100);
        target.canvas.resetMatrix();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 110, 110, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0139
     * @tc.name testCanvasApi0139
     * @tc.desc Verify resetMatrix drops a scale applied before it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0139 begin');
      await runCase('testCanvasApi0139', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.scale(2, 2);
        target.canvas.resetMatrix();
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(matrix.getValue(0)).assertEqual(1);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0140
     * @tc.name testCanvasApi0140
     * @tc.desc Verify setMatrix replaces the canvas transform instead of composing with it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0140 begin');
      await runCase('testCanvasApi0140', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(30, 30);
        target.canvas.translate(100, 100);
        target.canvas.setMatrix(matrix);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 35, 35, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 105, 105, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0141
     * @tc.name testCanvasApi0141
     * @tc.desc Verify setMatrix with a scale matrix doubles a twenty pixel square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0141 begin');
      await runCase('testCanvasApi0141', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(2, 2, 0, 0);
        target.canvas.setMatrix(matrix);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(1600);
        expect(channelAt(buffer, CANVAS_SIZE, 39, 39, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 41, 41, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0142
     * @tc.name testCanvasApi0142
     * @tc.desc Verify resetClip restores the full canvas painting area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0142 begin');
      await runCase('testCanvasApi0142', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.resetClip();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0143
     * @tc.name testCanvasApi0143
     * @tc.desc Verify a fresh canvas reports a non empty clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0143 begin');
      await runCase('testCanvasApi0143', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        expect(target.canvas.isClipEmpty()).assertFalse();
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.right, CANVAS_SIZE, 1)).assertTrue();
        expect(near(bounds.bottom, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0143 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0144
     * @tc.name testCanvasApi0144
     * @tc.desc Verify a zero area clip makes the clip region empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0144 begin');
      await runCase('testCanvasApi0144', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(50, 50, 50, 50));
        expect(target.canvas.isClipEmpty()).assertTrue();
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.right - bounds.left, 0, 1)).assertTrue();
        expect(near(bounds.bottom - bounds.top, 0, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0145
     * @tc.name testCanvasApi0145
     * @tc.desc Verify resetClip makes an empty clip non empty again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0145 begin');
      await runCase('testCanvasApi0145', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(50, 50, 50, 50));
        target.canvas.resetClip();
        expect(target.canvas.isClipEmpty()).assertFalse();
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0146
     * @tc.name testCanvasApi0146
     * @tc.desc Verify quickRejectRect reports true for a rect outside the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0146 begin');
      await runCase('testCanvasApi0146', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        expect(target.canvas.quickRejectRect(ltrb(300, 300, 400, 400))).assertTrue();
        expect(target.canvas.quickRejectRect(ltrb(120, 120, 160, 160))).assertTrue();
        expect(near(target.canvas.getLocalClipBounds().right, 100, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0147
     * @tc.name testCanvasApi0147
     * @tc.desc Verify quickRejectRect reports false for a rect overlapping the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0147 begin');
      await runCase('testCanvasApi0147', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        expect(target.canvas.quickRejectRect(ltrb(90, 90, 200, 200))).assertFalse();
        expect(target.canvas.quickRejectRect(ltrb(10, 10, 20, 20))).assertFalse();
        expect(target.canvas.quickRejectRect(ltrb(0, 0, 100, 100))).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0148
     * @tc.name testCanvasApi0148
     * @tc.desc Verify quickRejectPath reports true for a path fully outside the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0148 begin');
      await runCase('testCanvasApi0148', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(500, 500, 600, 600));
        expect(target.canvas.quickRejectPath(path)).assertTrue();
        expect(path.isEmpty()).assertFalse();
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.left).assertEqual(500);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0149
     * @tc.name testCanvasApi0149
     * @tc.desc Verify quickRejectPath reports false for a path inside the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0149 begin');
      await runCase('testCanvasApi0149', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 40);
        expect(target.canvas.quickRejectPath(path)).assertFalse();
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.right - bounds.left).assertEqual(80);
        expect(bounds.bottom - bounds.top).assertEqual(80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0150
     * @tc.name testCanvasApi0150
     * @tc.desc Verify a clip rect without anti aliasing keeps exact integer edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0150 begin');
      await runCase('testCanvasApi0150', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(10, 10, 60, 60), drawing.ClipOp.INTERSECT, false);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 9, 9, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0150 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0151
     * @tc.name testCanvasApi0151
     * @tc.desc Verify an anti aliased fractional clip keeps an area close to the clip size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0151', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0151 begin');
      await runCase('testCanvasApi0151', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.clipRect(ltrb(10.5, 10.5, 60.5, 60.5), drawing.ClipOp.INTERSECT, true);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 2400).assertTrue();
        expect(inked < 2750).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 35, 35, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0151 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0152
     * @tc.name testCanvasApi0152
     * @tc.desc Verify resetClip recovers the full area after a difference clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0152', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0152 begin');
      await runCase('testCanvasApi0152', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 50);
        target.canvas.clipPath(path, drawing.ClipOp.DIFFERENCE);
        target.canvas.resetClip();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0152 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0153
     * @tc.name testCanvasApi0153
     * @tc.desc Verify drawImage with the nearest sampling option copies the source block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0153', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0153 begin');
      await runCase('testCanvasApi0153', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImage(source.pixelMap, 0, 0, options);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 199, 199, 0)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0153 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0154
     * @tc.name testCanvasApi0154
     * @tc.desc Verify nearest and linear sampling produce the same coverage for a solid source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0154', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0154 begin');
      await runCase('testCanvasApi0154', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const nearest: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const linear: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const nearestOptions: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        const linearOptions: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        nearest.canvas.drawImage(source.pixelMap, 0, 0, nearestOptions);
        linear.canvas.drawImage(source.pixelMap, 0, 0, linearOptions);
        const nearestBuffer: ArrayBuffer = await readPixelBuffer(nearest.pixelMap);
        const linearBuffer: ArrayBuffer = await readPixelBuffer(linear.pixelMap);
        expect(countInkedPixels(nearestBuffer)).assertEqual(countInkedPixels(linearBuffer));
        expect(countInkedPixels(linearBuffer)).assertEqual(40000);
        expect(channelAt(nearestBuffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0154 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0155
     * @tc.name testCanvasApi0155
     * @tc.desc Verify drawImageRect with nearest sampling scales the whole source down.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0155', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0155 begin');
      await runCase('testCanvasApi0155', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, 100, 100), options);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 2)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0155 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0156
     * @tc.name testCanvasApi0156
     * @tc.desc Verify drawImageRectWithSrc with the fast constraint fills the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0156', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0156 begin');
      await runCase('testCanvasApi0156', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions = new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, 100, 100),
          ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), options, drawing.SrcRectConstraint.FAST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 190, 0)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0156 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0157
     * @tc.name testCanvasApi0157
     * @tc.desc Verify drawImageNine paints the nine patches of a solid source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0157', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0157 begin');
      await runCase('testCanvasApi0157', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageNine(source.pixelMap, ltrb(50, 50, 150, 150),
          ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 20000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 199, 199, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0157 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0158
     * @tc.name testCanvasApi0158
     * @tc.desc Verify drawImageNine of a transparent source paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0158', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0158 begin');
      await runCase('testCanvasApi0158', async () => {
        const source: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageNine(source.pixelMap, ltrb(50, 50, 150, 150),
          ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE), drawing.FilterMode.FILTER_MODE_LINEAR);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0158 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0159
     * @tc.name testCanvasApi0159
     * @tc.desc Verify drawImageLattice stretches a one cell lattice over the destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0159', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0159 begin');
      await runCase('testCanvasApi0159', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([100], [100], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 30000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0159 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0160
     * @tc.name testCanvasApi0160
     * @tc.desc Verify drawImageLattice keeps the source color when the destination grows.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0160', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0160 begin');
      await runCase('testCanvasApi0160', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([50], [50], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, 400, 400),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 199, 0, 2)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0160 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0161
     * @tc.name testCanvasApi0161
     * @tc.desc Verify drawVertices fills a triangle from three colored vertices.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0161', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0161 begin');
      await runCase('testCanvasApi0161', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const positions: Array<common2D.Point> = [point(20, 20), point(180, 20), point(100, 180)];
        const colors: Array<number> = [0xFFFF0000, 0xFFFF0000, 0xFFFF0000];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, positions, null, colors, 0, null,
          drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 8000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 190, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0161 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0162
     * @tc.name testCanvasApi0162
     * @tc.desc Verify drawVertices in strip mode connects the vertex chain.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0162', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0162 begin');
      await runCase('testCanvasApi0162', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const positions: Array<common2D.Point> = [point(0, 0), point(200, 0), point(0, 200), point(200, 200)];
        const colors: Array<number> = [0xFF0000FF, 0xFF0000FF, 0xFF0000FF, 0xFF0000FF];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 4, positions, null, colors, 0, null,
          drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 15000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 199, 199, 3) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0162 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0163
     * @tc.name testCanvasApi0163
     * @tc.desc Verify drawVertices with no vertex is rejected without breaking the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0163', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0163 begin');
      await runCase('testCanvasApi0163', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const positions: Array<common2D.Point> = [];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          target.canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 0, positions, null, null, 0, null,
            drawing.BlendMode.SRC_OVER);
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'empty vertex array rejected by the engine');
        }
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(255);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0163 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0164
     * @tc.name testCanvasApi0164
     * @tc.desc Verify drawShadow with color objects keeps the canvas drawable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0164', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0164 begin');
      await runCase('testCanvasApi0164', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(40, 40, 140, 140));
        const plane: common2D.Point3d = { x: 0, y: 0, z: 0 };
        const light: common2D.Point3d = { x: 0, y: 0, z: 100 };
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          target.canvas.drawShadow(path, plane, light, 10, rgba(255, 0, 0, 0), rgba(255, 0, 0, 0),
            drawing.ShadowFlag.ALL);
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'shadow rejected by the engine');
        }
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) > 300).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0164 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0165
     * @tc.name testCanvasApi0165
     * @tc.desc Verify drawShadow with numeric colors keeps the canvas drawable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0165', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0165 begin');
      await runCase('testCanvasApi0165', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 40);
        const plane: common2D.Point3d = { x: 0, y: 0, z: 0 };
        const light: common2D.Point3d = { x: 20, y: 20, z: 120 };
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        try {
          target.canvas.drawShadow(path, plane, light, 8, 0xFF000000, 0xFF000000, drawing.ShadowFlag.NONE);
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'shadow rejected by the engine');
        }
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 1)).assertEqual(255);
        expect(countInkedPixels(buffer) > 300).assertTrue();
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0165 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0166
     * @tc.name testCanvasApi0166
     * @tc.desc Verify a transparent clear keeps the canvas non opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0166', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0166 begin');
      await runCase('testCanvasApi0166', async () => {
        const target: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        expect(target.canvas.isOpaque()).assertFalse();
        target.canvas.clear(rgba(0, 0, 0, 0));
        expect(target.canvas.isOpaque()).assertFalse();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0166 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0167
     * @tc.name testCanvasApi0167
     * @tc.desc Verify the four channel drawColor overload keeps the given alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0167', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0167 begin');
      await runCase('testCanvasApi0167', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(128, 255, 0, 0);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0167 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0168
     * @tc.name testCanvasApi0168
     * @tc.desc Verify a packed color number is decoded into the expected channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0168', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0168 begin');
      await runCase('testCanvasApi0168', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(4278255360);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0168 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0169
     * @tc.name testCanvasApi0169
     * @tc.desc Verify the SRC blend mode replaces the existing canvas content.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0169', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0169 begin');
      await runCase('testCanvasApi0169', async () => {
        const target: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 0, 0, 255), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0169 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0170
     * @tc.name testCanvasApi0170
     * @tc.desc Verify SRC_OVER blends a half transparent blue over the existing red.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0170', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0170 begin');
      await runCase('testCanvasApi0170', async () => {
        const target: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        target.canvas.drawColor(rgba(128, 0, 0, 255), drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const red: number = channelAt(buffer, CANVAS_SIZE, 100, 100, 0);
        const blue: number = channelAt(buffer, CANVAS_SIZE, 100, 100, 2);
        expect(red > 100).assertTrue();
        expect(blue > 100).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0170 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0171
     * @tc.name testCanvasApi0171
     * @tc.desc Verify detaching a brush that was never attached keeps the canvas drawable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0171', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0171 begin');
      await runCase('testCanvasApi0171', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.detachPen();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(255);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0171 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0172
     * @tc.name testCanvasApi0172
     * @tc.desc Verify the brush attached last defines the fill color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasApi0172', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0172 begin');
      await runCase('testCanvasApi0172', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const first: drawing.Brush = new drawing.Brush();
        first.setColor(rgba(255, 255, 0, 0));
        const second: drawing.Brush = new drawing.Brush();
        second.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(first);
        target.canvas.attachBrush(second);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0172 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0173
     * @tc.name testCanvasApi0173
     * @tc.desc Verify attaching the same brush twice changes nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0173', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0173 begin');
      await runCase('testCanvasApi0173', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 19, 19, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 21, 21, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0173 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0174
     * @tc.name testCanvasApi0174
     * @tc.desc Verify pen and brush can be attached and detached in an alternating order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0174', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0174 begin');
      await runCase('testCanvasApi0174', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(2);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachPen(pen);
        target.canvas.detachPen();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(100, 100, 150, 150);
        target.canvas.detachBrush();
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 100, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 125, 125, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0174 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0175
     * @tc.name testCanvasApi0175
     * @tc.desc Verify drawColor ignores the attached pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0175', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0175 begin');
      await runCase('testCanvasApi0175', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(30);
        target.canvas.attachPen(pen);
        target.canvas.drawColor(rgba(255, 0, 255, 0), drawing.BlendMode.SRC);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 1)).assertEqual(255);
        expect(maxChannel(buffer, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0175 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0176
     * @tc.name testCanvasApi0176
     * @tc.desc Verify a one pixel canvas reports a one pixel size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0176', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0176 begin');
      await runCase('testCanvasApi0176', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(1, 1);
        target.canvas.clear(rgba(255, 255, 0, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.getWidth()).assertEqual(1);
        expect(target.canvas.getHeight()).assertEqual(1);
        expect(countInkedPixels(buffer)).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0176 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0177
     * @tc.name testCanvasApi0177
     * @tc.desc Verify a wide canvas reports its own width and height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0177', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0177 begin');
      await runCase('testCanvasApi0177', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(300, 200);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.clipRect(ltrb(0, 0, 300, 200));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 300, 200);
        target.canvas.detachBrush();
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(near(bounds.right, 300, 1)).assertTrue();
        expect(near(target.canvas.getWidth(), 300, 1)).assertTrue();
        expect(countInkedPixels(buffer)).assertEqual(60000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0177 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0178
     * @tc.name testCanvasApi0178
     * @tc.desc Verify save returns the new save count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0178', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0178 begin');
      await runCase('testCanvasApi0178', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        const returned: number = target.canvas.save();
        expect(returned).assertEqual(2);
        expect(returned > 1).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0178 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0179
     * @tc.name testCanvasApi0179
     * @tc.desc Verify restoreToCount with the current count is a no op.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0179', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0179 begin');
      await runCase('testCanvasApi0179', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const count: number = target.canvas.getSaveCount();
        target.canvas.restoreToCount(count);
        expect(target.canvas.getSaveCount()).assertEqual(count);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(400);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0179 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0180
     * @tc.name testCanvasApi0180
     * @tc.desc Verify clipping does not change the reported canvas size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0180', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0180 begin');
      await runCase('testCanvasApi0180', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 10, 10));
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
        expect(near(target.canvas.getLocalClipBounds().right, 10, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0180 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0181
     * @tc.name testCanvasApi0181
     * @tc.desc Verify a huge scale factor still clips the fill to the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0181', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0181 begin');
      await runCase('testCanvasApi0181', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.scale(1000, 1000);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 1, 1);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(channelAt(buffer, CANVAS_SIZE, 0, 199, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0181 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0182
     * @tc.name testCanvasApi0182
     * @tc.desc Verify a forty five degree rotation still covers most of the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0182', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0182 begin');
      await runCase('testCanvasApi0182', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.rotate(45, 100, 100);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(-200, -200, 400, 400);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) > 20000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0182 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0183
     * @tc.name testCanvasApi0183
     * @tc.desc Verify save, translate, scale and clip compose into one quarter canvas block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0183', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0183 begin');
      await runCase('testCanvasApi0183', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.save();
        target.canvas.translate(50, 50);
        target.canvas.scale(2, 2);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.restore();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0183 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0184
     * @tc.name testCanvasApi0184
     * @tc.desc Verify nested layers keep only the content inside the outer layer bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0184', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0184 begin');
      await runCase('testCanvasApi0184', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.saveLayer(ltrb(0, 0, 100, 100));
        target.canvas.saveLayer(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 120, 120, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0184 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0185
     * @tc.name testCanvasApi0185
     * @tc.desc Verify a circular clip combined with drawColor and restore keeps the hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0185', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0185 begin');
      await runCase('testCanvasApi0185', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 50);
        target.canvas.save();
        target.canvas.clipPath(path);
        target.canvas.drawColor(rgba(255, 0, 255, 0), drawing.BlendMode.SRC);
        target.canvas.restore();
        target.canvas.drawRect(150, 150, 180, 180);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 7500).assertTrue();
        expect(inked < 9000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 160, 160, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0185 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0186
     * @tc.name testCanvasApi0186
     * @tc.desc Verify a translated drawImage lands on the translated origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0186', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0186 begin');
      await runCase('testCanvasApi0186', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(50, 50);
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, 50, 50));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(2500);
        expect(channelAt(buffer, CANVAS_SIZE, 75, 75, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 25, 25, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0186 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0187
     * @tc.name testCanvasApi0187
     * @tc.desc Verify a rotated drawImageRect keeps the destination area unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0187', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0187 begin');
      await runCase('testCanvasApi0187', async () => {
        const source: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.rotate(180, 100, 100);
        target.canvas.drawImageRect(source.pixelMap, ltrb(50, 50, 150, 150));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 9000).assertTrue();
        expect(inked < 11000).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0187 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0188
     * @tc.name testCanvasApi0188
     * @tc.desc Verify a clip rect is transformed by the matrix set on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0188', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0188 begin');
      await runCase('testCanvasApi0188', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(50, 50);
        target.canvas.setMatrix(matrix);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0188 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0189
     * @tc.name testCanvasApi0189
     * @tc.desc Verify a clear inside a layer keeps the content outside the layer bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0189', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0189 begin');
      await runCase('testCanvasApi0189', async () => {
        const target: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        target.canvas.saveLayer(ltrb(0, 0, 100, 100));
        target.canvas.clear(rgba(255, 0, 0, 255));
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0189 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0190
     * @tc.name testCanvasApi0190
     * @tc.desc Verify the canvas can be repainted from scratch after a clear.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0190', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0190 begin');
      await runCase('testCanvasApi0190', async () => {
        const target: OffscreenTarget = await createSolidTarget(CANVAS_SIZE);
        target.canvas.clear(rgba(0, 0, 0, 0));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0190 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0191
     * @tc.name testCanvasApi0191
     * @tc.desc Verify quickRejectRect follows the clip after it is narrowed twice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0191', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0191 begin');
      await runCase('testCanvasApi0191', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        expect(target.canvas.quickRejectRect(ltrb(60, 60, 80, 80))).assertTrue();
        expect(target.canvas.quickRejectRect(ltrb(10, 10, 40, 40))).assertFalse();
        expect(near(target.canvas.getLocalClipBounds().right, 50, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0191 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0192
     * @tc.name testCanvasApi0192
     * @tc.desc Verify a rounded clip with zero radius keeps a non empty clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0192', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0192 begin');
      await runCase('testCanvasApi0192', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 40, 40), 0, 0);
        target.canvas.clipRoundRect(roundRect);
        expect(target.canvas.isClipEmpty()).assertFalse();
        expect(near(target.canvas.getLocalClipBounds().right, 40, 1)).assertTrue();
        expect(target.canvas.quickRejectRect(ltrb(60, 60, 80, 80))).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0192 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0193
     * @tc.name testCanvasApi0193
     * @tc.desc Verify drawColor works without any attached brush or pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0193', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0193 begin');
      await runCase('testCanvasApi0193', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 255, 255, 0), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 1)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0193 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0194
     * @tc.name testCanvasApi0194
     * @tc.desc Verify a clear inside a bounded layer only paints inside the layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0194', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0194 begin');
      await runCase('testCanvasApi0194', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.saveLayer(ltrb(0, 0, 100, 100));
        target.canvas.clear(rgba(255, 0, 0, 255));
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(channelAt(buffer, CANVAS_SIZE, 99, 99, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 101, 101, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0194 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0195
     * @tc.name testCanvasApi0195
     * @tc.desc Verify resetClip recovers the full area after a region clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0195', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0195 begin');
      await runCase('testCanvasApi0195', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const region: drawing.Region = new drawing.Region(0, 0, 40, 40);
        target.canvas.clipRegion(region);
        target.canvas.resetClip();
        target.canvas.drawColor(rgba(255, 0, 255, 0), drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(channelAt(buffer, CANVAS_SIZE, 150, 150, 1)).assertEqual(255);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0195 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0196
     * @tc.name testCanvasApi0196
     * @tc.desc Verify a zero scale collapses the drawn rect to an invisible footprint.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0196', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0196 begin');
      await runCase('testCanvasApi0196', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        try {
          target.canvas.scale(0, 0);
          target.canvas.attachBrush(brush);
          target.canvas.drawRect(0, 0, 50, 50);
          target.canvas.detachBrush();
        } catch (error) {
          hilog.info(DOMAIN, DRAWING_TAG, 'zero scale rejected by the engine');
        }
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer) < 400).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0196 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0197
     * @tc.name testCanvasApi0197
     * @tc.desc Verify translate and scale compose by scaling the translated offset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasApi0197', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0197 begin');
      await runCase('testCanvasApi0197', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.translate(50, 50);
        target.canvas.scale(2, 2);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(1600);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 45, 45, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0197 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0198
     * @tc.name testCanvasApi0198
     * @tc.desc Verify a full turn rotation is equivalent to no rotation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0198', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0198 begin');
      await runCase('testCanvasApi0198', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.rotate(360, 100, 100);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 10, 60, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 2400).assertTrue();
        expect(inked < 2600).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0198 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0199
     * @tc.name testCanvasApi0199
     * @tc.desc Verify a zero skew keeps the total matrix diagonal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0199', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0199 begin');
      await runCase('testCanvasApi0199', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.skew(0, 0);
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(matrix.getValue(1)).assertEqual(0);
        expect(matrix.getValue(3)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0199 end');
    });

    /** @tc.number SUB_NdkTsDrawing_CANVAS_0200
     * @tc.name testCanvasApi0200
     * @tc.desc Verify opacity survives a save and restore cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasApi0200', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0200 begin');
      await runCase('testCanvasApi0200', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 255, 255));
        target.canvas.save();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasApi0200 end');
    });
  });
}
