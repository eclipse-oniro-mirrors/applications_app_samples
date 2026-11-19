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

export default function canvasApiDeep3Test() {
  describe('CanvasApiDeep3Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0144
     * @tc.name testCanvasDeep0144
     * @tc.desc Verify a fully painted offscreen canvas still reports isOpaque as false.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0144 begin');
      await runCase('testCanvasDeep0144', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(255, 0, 0, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0145
     * @tc.name testCanvasDeep0145
     * @tc.desc Verify a transparent canvas does not report itself opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0145 begin');
      await runCase('testCanvasDeep0145', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(0, 0, 0, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.isOpaque()).assertFalse();
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0146
     * @tc.name testCanvasDeep0146
     * @tc.desc Verify a clip rect trims a full canvas fill to its own box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0146 begin');
      await runCase('testCanvasDeep0146', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(50, 50, 150, 150));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(255);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0147
     * @tc.name testCanvasDeep0147
     * @tc.desc Verify restoring a clip brings the full canvas back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0147 begin');
      await runCase('testCanvasDeep0147', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.save();
        target.canvas.clipRect(ltrb(50, 50, 100, 100));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0148
     * @tc.name testCanvasDeep0148
     * @tc.desc Verify two intersecting clips keep only the overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0148 begin');
      await runCase('testCanvasDeep0148', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 120, 120));
        target.canvas.clipRect(ltrb(80, 80, 200, 200));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(chanAt(buffer, 90, 90, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0149
     * @tc.name testCanvasDeep0149
     * @tc.desc Verify a disc shaped clip keeps the fill round.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0149 begin');
      await runCase('testCanvasDeep0149', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addCircle(100, 100, 50);
        target.canvas.clipPath(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7700 && inkAll(buffer) <= 8000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 55, 55, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0150
     * @tc.name testCanvasDeep0150
     * @tc.desc Verify two rect clips through one path keep both boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0150 begin');
      await runCase('testCanvasDeep0150', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, 60, 200));
        clip.addRect(ltrb(140, 0, 200, 200));
        target.canvas.clipPath(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 60, 200)).assertEqual(12000);
        expect(inkRect(buffer, 140, 0, 200, 200)).assertEqual(12000);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0150 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0151
     * @tc.name testCanvasDeep0151
     * @tc.desc Verify a round rect clip trims the corners of the fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0151', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0151 begin');
      await runCase('testCanvasDeep0151', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 200, 200), 40, 40);
        target.canvas.clipRoundRect(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(0);
        expect(inkAll(buffer) > 33000).assertTrue();
        expect(inkAll(buffer) < 40000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0151 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0152
     * @tc.name testCanvasDeep0152
     * @tc.desc Verify a region clip limits the fill to the region box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0152', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0152 begin');
      await runCase('testCanvasDeep0152', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Region = new drawing.Region(20, 20, 120, 120);
        target.canvas.clipRegion(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(near(target.canvas.getLocalClipBounds().left, 20, 1)).assertTrue();
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0152 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0153
     * @tc.name testCanvasDeep0153
     * @tc.desc Verify a difference region clip punches a hole in the fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0153', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0153 begin');
      await runCase('testCanvasDeep0153', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        const hole: drawing.Region = new drawing.Region(50, 50, 100, 100);
        target.canvas.clipRegion(hole, drawing.ClipOp.DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(37500);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0153 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0154
     * @tc.name testCanvasDeep0154
     * @tc.desc Verify resetClip widens a narrowed clip again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0154', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0154 begin');
      await runCase('testCanvasDeep0154', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(50, 50, 100, 100));
        const narrow: number = target.canvas.getLocalClipBounds().right;
        target.canvas.resetClip();
        const wide: number = target.canvas.getLocalClipBounds().right;
        expect(near(narrow, 100, 1)).assertTrue();
        expect(near(wide, CANVAS_SIZE, 1)).assertTrue();
        expect(wide > narrow).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0154 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0155
     * @tc.name testCanvasDeep0155
     * @tc.desc Verify the local clip bounds follow a clip rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0155', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0155 begin');
      await runCase('testCanvasDeep0155', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(30, 40, 130, 160));
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.left, 30, 1)).assertTrue();
        expect(bounds.right - bounds.left).assertEqual(102);
        expect(bounds.bottom - bounds.top).assertEqual(122);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0155 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0156
     * @tc.name testCanvasDeep0156
     * @tc.desc Verify an empty clip rect makes the clip empty and paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0156', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0156 begin');
      await runCase('testCanvasDeep0156', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        expect(target.canvas.isClipEmpty()).assertFalse();
        target.canvas.clipRect(ltrb(0, 0, 0, 0));
        expect(target.canvas.isClipEmpty()).assertTrue();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0156 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0157
     * @tc.name testCanvasDeep0157
     * @tc.desc Verify quickRejectRect rejects a rect outside the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0157', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0157 begin');
      await runCase('testCanvasDeep0157', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        expect(target.canvas.quickRejectRect(ltrb(120, 120, 160, 160))).assertTrue();
        expect(target.canvas.quickRejectRect(ltrb(10, 10, 50, 50))).assertFalse();
        expect(near(target.canvas.getLocalClipBounds().right, 100, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0157 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0158
     * @tc.name testCanvasDeep0158
     * @tc.desc Verify quickRejectPath accepts a rect that overlaps the clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0158', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0158 begin');
      await runCase('testCanvasDeep0158', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        const inside: drawing.Path = new drawing.Path();
        inside.addRect(ltrb(20, 20, 60, 60));
        const outside: drawing.Path = new drawing.Path();
        outside.addRect(ltrb(150, 150, 190, 190));
        expect(target.canvas.quickRejectPath(inside)).assertFalse();
        expect(target.canvas.quickRejectPath(outside)).assertTrue();
        expect(inside.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0158 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0159
     * @tc.name testCanvasDeep0159
     * @tc.desc Verify a save layer keeps the drawing after it is restored.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0159', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0159 begin');
      await runCase('testCanvasDeep0159', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.saveLayer(ltrb(50, 50, 150, 150));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(buffer.byteLength).assertEqual(160000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0159 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0160
     * @tc.name testCanvasDeep0160
     * @tc.desc Verify a save layer outside the canvas paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0160', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0160 begin');
      await runCase('testCanvasDeep0160', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.saveLayer(ltrb(300, 300, 400, 400));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(buffer.byteLength).assertEqual(160000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0160 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0161
     * @tc.name testCanvasDeep0161
     * @tc.desc Verify two stacked save layers both pop with one restore pair.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0161', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0161 begin');
      await runCase('testCanvasDeep0161', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        target.canvas.saveLayer(ltrb(0, 0, 200, 200));
        target.canvas.saveLayer(ltrb(0, 0, 100, 100));
        expect(target.canvas.getSaveCount()).assertEqual(base + 2);
        target.canvas.restore();
        target.canvas.restore();
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0161 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0162
     * @tc.name testCanvasDeep0162
     * @tc.desc Verify drawRegion fills exactly the region rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0162', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0162 begin');
      await runCase('testCanvasDeep0162', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRegion(new drawing.Region(20, 30, 120, 130));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 25, 35, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0162 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0163
     * @tc.name testCanvasDeep0163
     * @tc.desc Verify an empty region fills nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0163', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0163 begin');
      await runCase('testCanvasDeep0163', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const empty: drawing.Region = new drawing.Region(0, 0, 0, 0);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRegion(empty);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(empty.isEmpty()).assertTrue();
        expect(inkAll(buffer)).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0163 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0164
     * @tc.name testCanvasDeep0164
     * @tc.desc Verify drawVertices fills a triangle from three vertices.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0164', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0164 begin');
      await runCase('testCanvasDeep0164', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const positions: Array<common2D.Point> = [point(20, 20), point(180, 20), point(100, 180)];
        const colors: Array<number> = [0xFFFF0000, 0xFFFF0000, 0xFFFF0000];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, positions, null, colors, 0, null,
          drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 9000).assertTrue();
        expect(chanAt(buffer, 100, 60, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 190, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0164 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0165
     * @tc.name testCanvasDeep0165
     * @tc.desc Verify drawVertices in strip mode connects the vertex chain.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0165', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0165 begin');
      await runCase('testCanvasDeep0165', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const strip: Array<common2D.Point> = [point(20, 20), point(180, 20), point(20, 180), point(180, 180)];
        const colors: Array<number> = [0xFF0000FF, 0xFF0000FF, 0xFF0000FF, 0xFF0000FF];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 4, strip, null, colors, 0, null,
          drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 12000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, 10, 10)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0165 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0166
     * @tc.name testCanvasDeep0166
     * @tc.desc Verify setMatrix moves the following drawing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0166', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0166 begin');
      await runCase('testCanvasDeep0166', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(40, 60);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 60, 80, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0166 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0167
     * @tc.name testCanvasDeep0167
     * @tc.desc Verify setMatrix replaces an earlier translation instead of adding to it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0167', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0167 begin');
      await runCase('testCanvasDeep0167', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(100, 100);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setTranslation(10, 10);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(400);
        expect(chanAt(buffer, 15, 15, 3)).assertEqual(255);
        expect(chanAt(buffer, 110, 110, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0167 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0168
     * @tc.name testCanvasDeep0168
     * @tc.desc Verify setSinCos rotates the drawing about the canvas origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0168', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0168 begin');
      await runCase('testCanvasDeep0168', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setSinCos(1, 0, 100, 100);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(80, 80, 120, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1400 && inkAll(buffer) <= 1800).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0168 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0169
     * @tc.name testCanvasDeep0169
     * @tc.desc Verify setRectToRect scales the drawing into the target box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0169', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0169 begin');
      await runCase('testCanvasDeep0169', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRectToRect(ltrb(0, 0, 50, 50), ltrb(0, 0, 100, 100), drawing.ScaleToFit.FILL_SCALE_TO_FIT);
        target.canvas.setMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 90, 90, 3)).assertEqual(255);
        expect(matrix.getValue(0)).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0169 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0170
     * @tc.name testCanvasDeep0170
     * @tc.desc Verify concatMatrix applies two translations in order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0170', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0170 begin');
      await runCase('testCanvasDeep0170', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const first: drawing.Matrix = new drawing.Matrix();
        first.setTranslation(30, 0);
        const second: drawing.Matrix = new drawing.Matrix();
        second.setTranslation(0, 40);
        target.canvas.concatMatrix(first);
        target.canvas.concatMatrix(second);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 30, 30);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 40, 50, 1)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
        expect(target.canvas.getTotalMatrix().getValue(2)).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0170 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0171
     * @tc.name testCanvasDeep0171
     * @tc.desc Verify a clip rect also limits a stroked rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0171', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0171 begin');
      await runCase('testCanvasDeep0171', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(50, 50, 150, 150));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 50, CANVAS_SIZE)).assertEqual(0);
        expect(chanAt(buffer, 50, 100, 3)).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0171 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0172
     * @tc.name testCanvasDeep0172
     * @tc.desc Verify a clip path also limits a stroked path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0172', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0172 begin');
      await runCase('testCanvasDeep0172', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, 100, 100));
        target.canvas.clipPath(clip);
        const shape: drawing.Path = new drawing.Path();
        shape.addRect(ltrb(50, 50, 150, 150));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 120, 55, 3)).assertEqual(0);
        expect(inkRect(buffer, 0, 0, 100, 100) > 0).assertTrue();
        expect(pen.getColor().green).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0172 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0173
     * @tc.name testCanvasDeep0173
     * @tc.desc Verify a clip rect limits a filled circle to the box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0173', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0173 begin');
      await runCase('testCanvasDeep0173', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(100, 100, 200, 200));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 60);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 2700 && inkAll(buffer) <= 3000).assertTrue();
        expect(chanAt(buffer, 110, 110, 3)).assertEqual(255);
        expect(chanAt(buffer, 90, 90, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0173 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0174
     * @tc.name testCanvasDeep0174
     * @tc.desc Verify three nested clip rects report the smallest bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0174', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0174 begin');
      await runCase('testCanvasDeep0174', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(10, 10, 190, 190));
        target.canvas.clipRect(ltrb(20, 20, 180, 180));
        target.canvas.clipRect(ltrb(40, 40, 120, 160));
        const bounds: common2D.Rect = target.canvas.getLocalClipBounds();
        expect(near(bounds.left, 40, 1)).assertTrue();
        expect(near(bounds.right, 120, 1)).assertTrue();
        expect(near(bounds.bottom, 160, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0174 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0175
     * @tc.name testCanvasDeep0175
     * @tc.desc Verify save and restore around two clips restores each level.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0175', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0175 begin');
      await runCase('testCanvasDeep0175', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        const inner: number = target.canvas.getLocalClipBounds().right;
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        const deepest: number = target.canvas.getLocalClipBounds().right;
        target.canvas.restore();
        const back: number = target.canvas.getLocalClipBounds().right;
        target.canvas.restore();
        const outer: number = target.canvas.getLocalClipBounds().right;
        expect(near(deepest, 50, 1)).assertTrue();
        expect(near(back, inner, 1)).assertTrue();
        expect(near(outer, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0175 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0176
     * @tc.name testCanvasDeep0176
     * @tc.desc Verify a clip set after a translation follows the local space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0176', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0176 begin');
      await runCase('testCanvasDeep0176', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(50, 50);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(-50, -50, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(255);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0176 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0177
     * @tc.name testCanvasDeep0177
     * @tc.desc Verify a clip under a scale keeps its local size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0177', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0177 begin');
      await runCase('testCanvasDeep0177', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.scale(2, 2);
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 95, 95, 3)).assertEqual(255);
        expect(chanAt(buffer, 105, 105, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0177 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0178
     * @tc.name testCanvasDeep0178
     * @tc.desc Verify a clipped line paints only the visible band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0178', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0178 begin');
      await runCase('testCanvasDeep0178', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(50, 0, 150, CANVAS_SIZE));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 100, CANVAS_SIZE, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 20, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(pen.getColor().blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0178 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0179
     * @tc.name testCanvasDeep0179
     * @tc.desc Verify a clipped text blob keeps only its visible part.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0179', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0179 begin');
      await runCase('testCanvasDeep0179', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 20, CANVAS_SIZE));
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('H', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 60, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 20, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(near(target.canvas.getLocalClipBounds().right, 20, 1)).assertTrue();
        expect(font.getSize()).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0179 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0180
     * @tc.name testCanvasDeep0180
     * @tc.desc Verify a rect with negative edges paints its normalized box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0180', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0180 begin');
      await runCase('testCanvasDeep0180', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(100, 100, -20, -20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(255);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0180 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0181
     * @tc.name testCanvasDeep0181
     * @tc.desc Verify a rect larger than the canvas is clipped to the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0181', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0181 begin');
      await runCase('testCanvasDeep0181', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(-500, -500, 900, 900);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(inkRect(buffer, 0, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(inkAll(buffer));
        expect(chanAt(buffer, 199, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0181 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0182
     * @tc.name testCanvasDeep0182
     * @tc.desc Verify a circle centred on the edge paints a half disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0182', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0182 begin');
      await runCase('testCanvasDeep0182', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(0, 100, 40);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 2400 && inkAll(buffer) <= 2700).assertTrue();
        expect(chanAt(buffer, 5, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 40, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0182 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0183
     * @tc.name testCanvasDeep0183
     * @tc.desc Verify an oval outside the canvas paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0183', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0183 begin');
      await runCase('testCanvasDeep0183', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(300, 300, 400, 400));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 199, 199, 3)).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0183 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0184
     * @tc.name testCanvasDeep0184
     * @tc.desc Verify a long polyline path fills its closed area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0184', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0184 begin');
      await runCase('testCanvasDeep0184', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.moveTo(10, 10);
        path.lineTo(190, 10);
        path.lineTo(190, 190);
        path.lineTo(10, 190);
        path.close();
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(32400);
        expect(path.isClosed()).assertTrue();
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0184 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0185
     * @tc.name testCanvasDeep0185
     * @tc.desc Verify six points in point mode paint six dots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0185', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0185 begin');
      await runCase('testCanvasDeep0185', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dots: Array<common2D.Point> =
          [point(20, 20), point(60, 20), point(100, 20), point(20, 60), point(60, 60), point(100, 60)];
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(dots, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 100 && inkAll(buffer) <= 400).assertTrue();
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
        expect(dots.length).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0185 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0186
     * @tc.name testCanvasDeep0186
     * @tc.desc Verify four points in lines mode paint two bands.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0186', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0186 begin');
      await runCase('testCanvasDeep0186', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const seam: Array<common2D.Point> = [point(30, 30), point(170, 30), point(170, 170), point(30, 170)];
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(seam, drawing.PointMode.LINES);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 500).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(seam.length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0186 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0187
     * @tc.name testCanvasDeep0187
     * @tc.desc Verify a round rect with radius 0 keeps all four corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0187', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0187 begin');
      await runCase('testCanvasDeep0187', async () => {
        const sharp: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const soft: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        sharp.canvas.attachBrush(brush);
        sharp.canvas.drawRoundRect(new drawing.RoundRect(ltrb(20, 20, 180, 180), 0, 0));
        sharp.canvas.detachBrush();
        soft.canvas.attachBrush(brush);
        soft.canvas.drawRoundRect(new drawing.RoundRect(ltrb(20, 20, 180, 180), 60, 60));
        soft.canvas.detachBrush();
        const plain: ArrayBuffer = await readPixelBuffer(sharp.pixelMap);
        const rounded: ArrayBuffer = await readPixelBuffer(soft.pixelMap);
        expect(inkAll(plain)).assertEqual(25600);
        expect(inkAll(rounded) < inkAll(plain)).assertTrue();
        expect(chanAt(rounded, 21, 21, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0187 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0188
     * @tc.name testCanvasDeep0188
     * @tc.desc Verify two half transparent layers stack to near opaque alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0188', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0188 begin');
      await runCase('testCanvasDeep0188', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3) >= 180).assertTrue();
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(192);
        expect(inkAll(buffer)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0188 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0189
     * @tc.name testCanvasDeep0189
     * @tc.desc Verify an opaque clear covers every pixel with full alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0189', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0189 begin');
      await runCase('testCanvasDeep0189', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(255, 0, 255, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 1)).assertEqual(255);
        expect(chanAt(buffer, 199, 199, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0189 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0190
     * @tc.name testCanvasDeep0190
     * @tc.desc Verify a fully transparent clear leaves no ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0190', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0190 begin');
      await runCase('testCanvasDeep0190', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.clear(rgba(0, 0, 0, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(target.canvas.isOpaque()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0190 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0191
     * @tc.name testCanvasDeep0191
     * @tc.desc Verify drawBackground fills the whole canvas with the brush colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0191', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0191 begin');
      await runCase('testCanvasDeep0191', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawBackground(brush);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 30, 30, 2)).assertEqual(255);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0191 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0192
     * @tc.name testCanvasDeep0192
     * @tc.desc Verify five saves raise the count by five.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0192', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0192 begin');
      await runCase('testCanvasDeep0192', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const base: number = target.canvas.getSaveCount();
        for (let depth: number = 0; depth < 5; depth++) {
          target.canvas.save();
        }
        expect(target.canvas.getSaveCount()).assertEqual(base + 5);
        target.canvas.restoreToCount(base);
        expect(target.canvas.getSaveCount()).assertEqual(base);
        expect(base >= 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0192 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0193
     * @tc.name testCanvasDeep0193
     * @tc.desc Verify restoreToCount deeper than the stack lands on the base.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0193', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0193 begin');
      await runCase('testCanvasDeep0193', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.save();
        const deep: number = target.canvas.getSaveCount();
        target.canvas.restoreToCount(1);
        const shallow: number = target.canvas.getSaveCount();
        expect(deep > shallow).assertTrue();
        expect(shallow).assertEqual(1);
        expect(deep).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0193 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0194
     * @tc.name testCanvasDeep0194
     * @tc.desc Verify the total matrix reports a scale.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0194', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0194 begin');
      await runCase('testCanvasDeep0194', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.scale(3, 4);
        const matrix: drawing.Matrix = target.canvas.getTotalMatrix();
        expect(matrix.getValue(0)).assertEqual(3);
        expect(matrix.getValue(4)).assertEqual(4);
        expect(matrix.isIdentity()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0194 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0195
     * @tc.name testCanvasDeep0195
     * @tc.desc Verify resetMatrix clears a scale as well as a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0195', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0195 begin');
      await runCase('testCanvasDeep0195', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.scale(2, 2);
        const scaled: number = target.canvas.getTotalMatrix().getValue(0);
        target.canvas.resetMatrix();
        const flat: number = target.canvas.getTotalMatrix().getValue(0);
        expect(scaled).assertEqual(2);
        expect(flat).assertEqual(1);
        expect(target.canvas.getTotalMatrix().isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0195 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0196
     * @tc.name testCanvasDeep0196
     * @tc.desc Verify a path offset by a negative vector moves left and up.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0196', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0196 begin');
      await runCase('testCanvasDeep0196', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(100, 100, 160, 160));
        path.offset(-70, -70);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(3600);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0196 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0197
     * @tc.name testCanvasDeep0197
     * @tc.desc Verify a path scaled by half shrinks its box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0197', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0197 begin');
      await runCase('testCanvasDeep0197', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 120, 120));
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setScale(0.5, 0.5, 0, 0);
        path.transform(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 80, 80, 3)).assertEqual(0);
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0197 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0198
     * @tc.name testCanvasDeep0198
     * @tc.desc Verify an empty clip path makes the clip empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0198', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0198 begin');
      await runCase('testCanvasDeep0198', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        target.canvas.clipPath(clip);
        expect(target.canvas.isClipEmpty()).assertTrue();
        expect(near(target.canvas.getLocalClipBounds().right, 0, 1)).assertTrue();
        expect(clip.isEmpty()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0198 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0199
     * @tc.name testCanvasDeep0199
     * @tc.desc Verify quickRejectRect follows a translation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0199', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0199 begin');
      await runCase('testCanvasDeep0199', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        target.canvas.translate(50, 50);
        const rejected: boolean = target.canvas.quickRejectRect(ltrb(60, 60, 80, 80));
        const kept: boolean = target.canvas.quickRejectRect(ltrb(0, 0, 40, 40));
        expect(rejected).assertTrue();
        expect(kept).assertFalse();
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0199 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0200
     * @tc.name testCanvasDeep0200
     * @tc.desc Verify a pen draws only the region border.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0200', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0200 begin');
      await runCase('testCanvasDeep0200', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawRegion(new drawing.Region(40, 40, 140, 140));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 90, 90, 3)).assertEqual(0);
        expect(chanAt(buffer, 40, 90, 3)).assertEqual(255);
        expect(pen.getColor().blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0200 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0201
     * @tc.name testCanvasDeep0201
     * @tc.desc Verify drawVertices with the SRC blend keeps its vertex colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0201', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0201 begin');
      await runCase('testCanvasDeep0201', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(255, 255, 0, 0));
        const corners: Array<common2D.Point> = [point(40, 40), point(160, 40), point(100, 160)];
        const colors: Array<number> = [0xFF0000FF, 0xFF0000FF, 0xFF0000FF];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, corners, null, colors, 0, null,
          drawing.BlendMode.SRC);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 70, 2)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(255);
        expect(colors.length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0201 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0202
     * @tc.name testCanvasDeep0202
     * @tc.desc Verify a rotation about the centre turns a square into a diamond.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0202', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0202 begin');
      await runCase('testCanvasDeep0202', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.rotate(45, 100, 100);
        target.canvas.drawRect(80, 80, 120, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1400 && inkAll(buffer) <= 1800).assertTrue();
        expect(chanAt(buffer, 100, 75, 3)).assertEqual(255);
        expect(chanAt(buffer, 80, 80, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0202 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0203
     * @tc.name testCanvasDeep0203
     * @tc.desc Verify a skew shifts the painted rows without resizing them.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0203', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0203 begin');
      await runCase('testCanvasDeep0203', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.skew(1, 0);
        target.canvas.drawRect(0, 0, 20, 20);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(400);
        expect(chanAt(buffer, 15, 10, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0203 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0204
     * @tc.name testCanvasDeep0204
     * @tc.desc Verify a clip inside save does not outlive the restore.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0204', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0204 begin');
      await runCase('testCanvasDeep0204', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 50, 50));
        target.canvas.restore();
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(255);
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0204 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0205
     * @tc.name testCanvasDeep0205
     * @tc.desc Verify two difference clips leave two separate holes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0205', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0205 begin');
      await runCase('testCanvasDeep0205', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRegion(new drawing.Region(20, 20, 60, 60), drawing.ClipOp.DIFFERENCE);
        target.canvas.clipRegion(new drawing.Region(120, 120, 160, 160), drawing.ClipOp.DIFFERENCE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(36800);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
        expect(chanAt(buffer, 140, 140, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0205 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0206
     * @tc.name testCanvasDeep0206
     * @tc.desc Verify an intersect clip region narrows the default clip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0206', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0206 begin');
      await runCase('testCanvasDeep0206', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRegion(new drawing.Region(50, 50, 150, 150), drawing.ClipOp.INTERSECT);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(near(target.canvas.getLocalClipBounds().top, 50, 1)).assertTrue();
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0206 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0207
     * @tc.name testCanvasDeep0207
     * @tc.desc Verify a round rect clip also limits a stroked border.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0207', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0207 begin');
      await runCase('testCanvasDeep0207', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRoundRect(new drawing.RoundRect(ltrb(40, 40, 160, 160), 30, 30));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(40, 40, 160, 160);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
        expect(inkAll(buffer) >= 900).assertTrue();
        expect(inkAll(buffer) <= 1400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0207 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0208
     * @tc.name testCanvasDeep0208
     * @tc.desc Verify a half transparent text blob keeps its soft edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0208', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0208 begin');
      await runCase('testCanvasDeep0208', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('M', font);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 40, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 20).assertTrue();
        expect(brush.getAlpha()).assertEqual(128);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0208 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0209
     * @tc.name testCanvasDeep0209
     * @tc.desc Verify an oval and a rect in one path paint both areas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0209', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0209 begin');
      await runCase('testCanvasDeep0209', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addOval(ltrb(10, 10, 90, 50), 0);
        path.addRect(ltrb(110, 10, 190, 50));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 110, 10, 190, 50)).assertEqual(3200);
        expect(inkAll(buffer) > 5000).assertTrue();
        expect(chanAt(buffer, 150, 30, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0209 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0210
     * @tc.name testCanvasDeep0210
     * @tc.desc Verify moving a circle by offset paints the shifted disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0210', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0210 begin');
      await runCase('testCanvasDeep0210', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const path: drawing.Path = new drawing.Path();
        path.addCircle(60, 60, 40);
        path.offset(80, 80);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(path);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 4900 && inkAll(buffer) <= 5200).assertTrue();
        expect(chanAt(buffer, 140, 140, 3)).assertEqual(0);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0210 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0211
     * @tc.name testCanvasDeep0211
     * @tc.desc Verify a pie arc paints a bigger wedge than a chord arc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0211', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0211 begin');
      await runCase('testCanvasDeep0211', async () => {
        const pie: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const chord: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        pie.canvas.attachBrush(brush);
        pie.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, true);
        pie.canvas.detachBrush();
        chord.canvas.attachBrush(brush);
        chord.canvas.drawArcWithCenter(ltrb(50, 50, 150, 150), 0, 90, false);
        chord.canvas.detachBrush();
        const filled: ArrayBuffer = await readPixelBuffer(pie.pixelMap);
        const trimmed: ArrayBuffer = await readPixelBuffer(chord.pixelMap);
        expect(inkAll(filled) > inkAll(trimmed)).assertTrue();
        expect(chanAt(trimmed, 100, 100, 3)).assertEqual(0);
        expect(chanAt(filled, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0211 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0212
     * @tc.name testCanvasDeep0212
     * @tc.desc Verify a clip inside a save layer is dropped with the layer.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0212', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0212 begin');
      await runCase('testCanvasDeep0212', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.saveLayer(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.clipRect(ltrb(0, 0, 20, 20));
        target.canvas.restore();
        expect(near(target.canvas.getLocalClipBounds().right, CANVAS_SIZE, 1)).assertTrue();
        expect(target.canvas.isClipEmpty()).assertFalse();
        expect(target.canvas.getSaveCount() >= 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0212 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0213
     * @tc.name testCanvasDeep0213
     * @tc.desc Verify setMatrix with the identity keeps the drawing unshifted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0213', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0213 begin');
      await runCase('testCanvasDeep0213', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.setMatrix(new drawing.Matrix());
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 40, 40);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1600);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
        expect(target.canvas.getTotalMatrix().isIdentity()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0213 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0214
     * @tc.name testCanvasDeep0214
     * @tc.desc Verify a concatenated rotation matrix turns the box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0214', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0214 begin');
      await runCase('testCanvasDeep0214', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const matrix: drawing.Matrix = new drawing.Matrix();
        matrix.setRotation(45, 100, 100);
        target.canvas.concatMatrix(matrix);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(80, 80, 120, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1400 && inkAll(buffer) <= 1800).assertTrue();
        expect(chanAt(buffer, 100, 76, 3)).assertEqual(255);
        expect(inkRect(buffer, 70, 70, 130, 130)).assertEqual(inkAll(buffer));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0214 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0215
     * @tc.name testCanvasDeep0215
     * @tc.desc Verify a region built from setRect fills the new rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0215', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0215 begin');
      await runCase('testCanvasDeep0215', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const region: drawing.Region = new drawing.Region(0, 0, 10, 10);
        region.setRect(60, 60, 140, 140);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRegion(region);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(6400);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0215 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0216
     * @tc.name testCanvasDeep0216
     * @tc.desc Verify a clip still applies to vertices painting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0216', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0216 begin');
      await runCase('testCanvasDeep0216', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 100, 100));
        const corners: Array<common2D.Point> = [point(0, 0), point(200, 0), point(100, 200)];
        const colors: Array<number> = [0xFF00FF00, 0xFF00FF00, 0xFF00FF00];
        target.canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, corners, null, colors, 0, null,
          drawing.BlendMode.SRC_OVER);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(chanAt(buffer, 50, 20, 3)).assertEqual(255);
        expect(near(target.canvas.getLocalClipBounds().right, 100, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0216 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0217
     * @tc.name testCanvasDeep0217
     * @tc.desc Verify a full pipeline combines clip, path and pen safely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0217', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0217 begin');
      await runCase('testCanvasDeep0217', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.save();
        target.canvas.clipRect(ltrb(20, 20, 180, 180));
        target.canvas.translate(10, 10);
        const path: drawing.Path = new drawing.Path();
        path.addRect(ltrb(20, 20, 80, 80));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(path);
        target.canvas.detachPen();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 900).assertTrue();
        expect(inkAll(buffer) <= 1400).assertTrue();
        expect(chanAt(buffer, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0217 end');
    });

  });
}
