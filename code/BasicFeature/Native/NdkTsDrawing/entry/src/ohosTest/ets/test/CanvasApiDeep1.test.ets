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
import { DRAWING_TAG, readPixelBuffer, runCase, throwsOn } from './DrawingTestRunner';

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

export default function canvasApiDeep1Test() {
  describe('CanvasApiDeep1Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0001
     * @tc.name testCanvasDeep0001
     * @tc.desc Verify a rect covering the canvas fills every pixel with opaque red.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasDeep0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0001 begin');
      await runCase('testCanvasDeep0001', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(255);
        expect(chanAt(buffer, 199, 199, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0002
     * @tc.name testCanvasDeep0002
     * @tc.desc Verify an inset rect paints exactly its own area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0002 begin');
      await runCase('testCanvasDeep0002', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(20, 30, 120, 80);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(5000);
        expect(inkRect(buffer, 20, 30, 120, 80)).assertEqual(5000);
        expect(inkRect(buffer, 0, 0, 20, 30)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0003
     * @tc.name testCanvasDeep0003
     * @tc.desc Verify a one pixel rect paints a single pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0003 begin');
      await runCase('testCanvasDeep0003', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 10, 11, 11);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(chanAt(buffer, 11, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0004
     * @tc.name testCanvasDeep0004
     * @tc.desc Verify a rect crossing the right edge is clipped to the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0004 begin');
      await runCase('testCanvasDeep0004', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(100, 100, 300, 160);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(6000);
        expect(inkRect(buffer, 100, 100, CANVAS_SIZE, 160)).assertEqual(6000);
        expect(inkRect(buffer, 0, 0, 100, 100)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0005
     * @tc.name testCanvasDeep0005
     * @tc.desc Verify a rect crossing the top left corner is clipped to a quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0005 begin');
      await runCase('testCanvasDeep0005', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(-50, -50, 50, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(255);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0006
     * @tc.name testCanvasDeep0006
     * @tc.desc Verify a rect supplied as a Rect object paints its box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0006 begin');
      await runCase('testCanvasDeep0006', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        const box: common2D.Rect = ltrb(10, 10, 60, 110);
        target.canvas.drawRect(box);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(5000);
        expect(chanAt(buffer, 59, 109, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 110, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0007
     * @tc.name testCanvasDeep0007
     * @tc.desc Verify a rect with zero height paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0007 begin');
      await runCase('testCanvasDeep0007', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(10, 10, 110, 10);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 50, 10, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0008
     * @tc.name testCanvasDeep0008
     * @tc.desc Verify a rect with zero width paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0008 begin');
      await runCase('testCanvasDeep0008', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(80, 10, 80, 190);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 80, 100, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0009
     * @tc.name testCanvasDeep0009
     * @tc.desc Verify two overlapping rects merge into their union.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0009 begin');
      await runCase('testCanvasDeep0009', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(17500);
        expect(chanAt(buffer, 75, 75, 3)).assertEqual(255);
        expect(chanAt(buffer, 125, 25, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0010
     * @tc.name testCanvasDeep0010
     * @tc.desc Verify a semi transparent rect keeps its alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0010 begin');
      await runCase('testCanvasDeep0010', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 3) >= 120 && chanAt(buffer, 100, 100, 3) <= 136).assertTrue();
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0011
     * @tc.name testCanvasDeep0011
     * @tc.desc Verify two semi transparent rects stack their alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0011 begin');
      await runCase('testCanvasDeep0011', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 200);
        target.canvas.drawRect(100, 0, 200, 200);
        target.canvas.drawRect(50, 0, 150, 200);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 3) > chanAt(buffer, 20, 100, 3)).assertTrue();
        expect(chanAt(buffer, 20, 100, 3) >= 120 && chanAt(buffer, 20, 100, 3) <= 136).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0012
     * @tc.name testCanvasDeep0012
     * @tc.desc Verify an opaque rect over a semi transparent base stays opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0012 begin');
      await runCase('testCanvasDeep0012', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(128, 0, 0, 255));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 3) >= 120 && chanAt(buffer, 10, 10, 3) <= 136).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0013
     * @tc.name testCanvasDeep0013
     * @tc.desc Verify a rect drawn without an attached brush paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0013 begin');
      await runCase('testCanvasDeep0013', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0014
     * @tc.name testCanvasDeep0014
     * @tc.desc Verify a small opaque rect overwrites part of a full canvas rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0014 begin');
      await runCase('testCanvasDeep0014', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawRect(80, 80, 120, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(0);
        expect(chanAt(buffer, 20, 20, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0015
     * @tc.name testCanvasDeep0015
     * @tc.desc Verify a round rect trims the four corners.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0015 begin');
      await runCase('testCanvasDeep0015', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 200, 200), 40, 40);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) < 40000).assertTrue();
        expect(inkAll(buffer) > 33000).assertTrue();
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0016
     * @tc.name testCanvasDeep0016
     * @tc.desc Verify a round rect with zero radii equals a plain rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0016 begin');
      await runCase('testCanvasDeep0016', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 120, 120), 0, 0);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(10000);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(255);
        expect(chanAt(buffer, 19, 19, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0017
     * @tc.name testCanvasDeep0017
     * @tc.desc Verify an inset round rect paints its inner area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0017 begin');
      await runCase('testCanvasDeep0017', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(50, 50, 150, 150), 10, 10);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 50, 60, 150, 140)).assertEqual(8000);
        expect(chanAt(buffer, 50, 50, 3)).assertEqual(0);
        expect(inkAll(buffer) > 9500 && inkAll(buffer) < 10000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0018
     * @tc.name testCanvasDeep0018
     * @tc.desc Verify a round rect with maximum radii turns into a circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0018 begin');
      await runCase('testCanvasDeep0018', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 200, 200), 100, 100);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 30500 && inkAll(buffer) <= 32500).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 2, 2, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0019
     * @tc.name testCanvasDeep0019
     * @tc.desc Verify a round rect with unequal radii stays asymmetric.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0019 begin');
      await runCase('testCanvasDeep0019', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 60, 180, 140), 60, 10);
        const corner: common2D.Point = roundRect.getCorner(0);
        expect(corner.x).assertEqual(60);
        expect(corner.y).assertEqual(10);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) < 12800).assertTrue();
        expect(inkAll(buffer) > 10000).assertTrue();
        expect(chanAt(buffer, 20, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0020
     * @tc.name testCanvasDeep0020
     * @tc.desc Verify an offset round rect moves its painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0020 begin');
      await runCase('testCanvasDeep0020', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 60, 60), 0, 0);
        roundRect.offset(50, 100);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(2500);
        expect(inkRect(buffer, 60, 110, 110, 160)).assertEqual(2500);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0021
     * @tc.name testCanvasDeep0021
     * @tc.desc Verify a semi transparent round rect keeps its alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0021 begin');
      await runCase('testCanvasDeep0021', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 0, 0, 255));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(20, 20, 180, 180), 20, 20);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3) >= 120 && chanAt(buffer, 100, 100, 3) <= 136).assertTrue();
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(128);
        expect(chanAt(buffer, 20, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0022
     * @tc.name testCanvasDeep0022
     * @tc.desc Verify a full rect repaints the corners cut by a round rect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0022 begin');
      await runCase('testCanvasDeep0022', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 200, 200), 40, 40);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.drawRect(0, 0, 200, 200);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(255);
        expect(chanAt(buffer, 1, 1, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0023
     * @tc.name testCanvasDeep0023
     * @tc.desc Verify oversized radii are clamped to a pill shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0023 begin');
      await runCase('testCanvasDeep0023', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 40, 40), 100, 100);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1100 && inkAll(buffer) <= 1400).assertTrue();
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(0);
        expect(inkRect(buffer, 0, 0, 40, 40)).assertEqual(inkAll(buffer));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0024
     * @tc.name testCanvasDeep0024
     * @tc.desc Verify the corner radii of a round rect are readable before drawing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0024 begin');
      await runCase('testCanvasDeep0024', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(30, 30, 170, 170), 24, 18);
        const corner: common2D.Point = roundRect.getCorner(0);
        target.canvas.attachBrush(brush);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(corner.x).assertEqual(24);
        expect(corner.y).assertEqual(18);
        expect(inkAll(buffer) > 18000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0025
     * @tc.name testCanvasDeep0025
     * @tc.desc Verify a nested round rect leaves the inner area empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0025 begin');
      await runCase('testCanvasDeep0025', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        const outer: drawing.RoundRect = new drawing.RoundRect(ltrb(10, 10, 190, 190), 20, 20);
        const inner: drawing.RoundRect = new drawing.RoundRect(ltrb(60, 60, 140, 140), 12, 12);
        target.canvas.drawNestedRoundRect(outer, inner);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 10, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) > 0 && inkAll(buffer) < 40000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0026
     * @tc.name testCanvasDeep0026
     * @tc.desc Verify a nested round rect made of identical shapes paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0026 begin');
      await runCase('testCanvasDeep0026', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        const shape: drawing.RoundRect = new drawing.RoundRect(ltrb(40, 40, 160, 160), 16, 16);
        target.canvas.drawNestedRoundRect(shape, shape);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0027
     * @tc.name testCanvasDeep0027
     * @tc.desc Verify shifting a round rect with offset paints a second copy.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0027 begin');
      await runCase('testCanvasDeep0027', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(80, 80, 120, 120), 8, 8);
        target.canvas.drawRoundRect(roundRect);
        roundRect.offset(-40, 0);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(3088);
        expect(chanAt(buffer, 60, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 140, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0028
     * @tc.name testCanvasDeep0028
     * @tc.desc Verify a round rect with one pixel radii nearly fills its box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0028 begin');
      await runCase('testCanvasDeep0028', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        const roundRect: drawing.RoundRect = new drawing.RoundRect(ltrb(0, 0, 200, 200), 1, 1);
        target.canvas.drawRoundRect(roundRect);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 39500).assertTrue();
        expect(inkAll(buffer) <= 40000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0029
     * @tc.name testCanvasDeep0029
     * @tc.desc Verify a circle of radius fifty covers a disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCanvasDeep0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0029 begin');
      await runCase('testCanvasDeep0029', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 7700 && inkAll(buffer) <= 8000).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkRect(buffer, 50, 50, 151, 151)).assertEqual(inkAll(buffer));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0030
     * @tc.name testCanvasDeep0030
     * @tc.desc Verify a circle with zero radius paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0030 begin');
      await runCase('testCanvasDeep0030', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 0);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0031
     * @tc.name testCanvasDeep0031
     * @tc.desc Verify a circle with radius one paints a tiny dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0031 begin');
      await runCase('testCanvasDeep0031', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 1);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1 && inkAll(buffer) <= 9).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0032
     * @tc.name testCanvasDeep0032
     * @tc.desc Verify a circle centred on the origin paints one quadrant.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0032 begin');
      await runCase('testCanvasDeep0032', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(0, 0, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1800 && inkAll(buffer) <= 2150).assertTrue();
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0033
     * @tc.name testCanvasDeep0033
     * @tc.desc Verify a circle larger than the canvas covers every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0033 begin');
      await runCase('testCanvasDeep0033', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 400);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(255);
        expect(chanAt(buffer, 199, 199, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0034
     * @tc.name testCanvasDeep0034
     * @tc.desc Verify a wide oval paints an ellipse.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0034 begin');
      await runCase('testCanvasDeep0034', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(0, 50, 200, 150));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 15000 && inkAll(buffer) <= 16200).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0035
     * @tc.name testCanvasDeep0035
     * @tc.desc Verify a flat oval paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0035 begin');
      await runCase('testCanvasDeep0035', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawOval(ltrb(20, 100, 180, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0036
     * @tc.name testCanvasDeep0036
     * @tc.desc Verify a tall oval matches a wide oval in ink count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0036 begin');
      await runCase('testCanvasDeep0036', async () => {
        const wide: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const tall: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        wide.canvas.attachBrush(brush);
        wide.canvas.drawOval(ltrb(0, 50, 200, 150));
        wide.canvas.detachBrush();
        tall.canvas.attachBrush(brush);
        tall.canvas.drawOval(ltrb(50, 0, 150, 200));
        tall.canvas.detachBrush();
        const first: ArrayBuffer = await readPixelBuffer(wide.pixelMap);
        const second: ArrayBuffer = await readPixelBuffer(tall.pixelMap);
        expect(Math.abs(inkAll(first) - inkAll(second)) <= 40).assertTrue();
        expect(inkAll(first) > 15000).assertTrue();
        expect(inkAll(second) > 15000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0037
     * @tc.name testCanvasDeep0037
     * @tc.desc Verify two overlapping discs merge into one blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0037 begin');
      await runCase('testCanvasDeep0037', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(70, 100, 40);
        target.canvas.drawCircle(130, 100, 40);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) < 10048).assertTrue();
        expect(inkAll(buffer) > 5024).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0038
     * @tc.name testCanvasDeep0038
     * @tc.desc Verify a semi transparent disc keeps its alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0038 begin');
      await runCase('testCanvasDeep0038', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3) >= 120 && chanAt(buffer, 100, 100, 3) <= 136).assertTrue();
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(128);
        expect(inkAll(buffer) >= 7700).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0039
     * @tc.name testCanvasDeep0039
     * @tc.desc Verify a disc followed by a full rect covers the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0039 begin');
      await runCase('testCanvasDeep0039', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 60);
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.drawRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 5, 5, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0040
     * @tc.name testCanvasDeep0040
     * @tc.desc Verify a stroked circle leaves the centre empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0040 begin');
      await runCase('testCanvasDeep0040', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawCircle(100, 100, 50);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 150, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 1500 && inkAll(buffer) <= 2400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0041
     * @tc.name testCanvasDeep0041
     * @tc.desc Verify a circle with anti alias disabled still paints a disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0041 begin');
      await runCase('testCanvasDeep0041', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setAntiAlias(false);
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(brush.isAntiAlias()).assertFalse();
        expect(inkAll(buffer) >= 7500 && inkAll(buffer) <= 8100).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0042
     * @tc.name testCanvasDeep0042
     * @tc.desc Verify concentric discs keep the outer ink count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0042 begin');
      await runCase('testCanvasDeep0042', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawCircle(100, 100, 80);
        target.canvas.drawCircle(100, 100, 40);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 19800 && inkAll(buffer) <= 20400).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 20, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0043
     * @tc.name testCanvasDeep0043
     * @tc.desc Verify a single point paints at most a small dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0043 begin');
      await runCase('testCanvasDeep0043', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachPen(pen);
        target.canvas.drawPoint(100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1 && inkAll(buffer) <= 9).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 120, 120, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0044
     * @tc.name testCanvasDeep0044
     * @tc.desc Verify a wide pen point paints a small square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0044 begin');
      await runCase('testCanvasDeep0044', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawPoint(100, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1 && inkAll(buffer) <= 100).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 160, 160, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0045
     * @tc.name testCanvasDeep0045
     * @tc.desc Verify four points in point mode paint four dots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0045 begin');
      await runCase('testCanvasDeep0045', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(2);
        const points: common2D.Point[] = [point(40, 40), point(120, 40), point(40, 120), point(120, 120)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(points, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 4 && inkAll(buffer) <= 36).assertTrue();
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(255);
        expect(chanAt(buffer, 80, 80, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0046
     * @tc.name testCanvasDeep0046
     * @tc.desc Verify two points in lines mode paint one segment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0046 begin');
      await runCase('testCanvasDeep0046', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(4);
        const points: common2D.Point[] = [point(20, 100), point(180, 100)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(points, drawing.PointMode.LINES);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 500).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 20, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0047
     * @tc.name testCanvasDeep0047
     * @tc.desc Verify four points in lines mode paint two segments.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0047 begin');
      await runCase('testCanvasDeep0047', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(4);
        const points: common2D.Point[] = [point(20, 40), point(180, 40), point(20, 160), point(180, 160)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(points, drawing.PointMode.LINES);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 160, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0048
     * @tc.name testCanvasDeep0048
     * @tc.desc Verify three points in polygon mode paint a filled triangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0048 begin');
      await runCase('testCanvasDeep0048', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const points: common2D.Point[] = [point(100, 20), point(180, 180), point(20, 180)];
        target.canvas.attachBrush(brush);
        target.canvas.drawPoints(points, drawing.PointMode.POLYGON);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(320);
        expect(chanAt(buffer, 100, 150, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0049
     * @tc.name testCanvasDeep0049
     * @tc.desc Verify four points in polygon mode paint a square.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0049 begin');
      await runCase('testCanvasDeep0049', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        const points: common2D.Point[] = [point(50, 50), point(150, 50), point(150, 150), point(50, 150)];
        target.canvas.attachBrush(brush);
        target.canvas.drawPoints(points, drawing.PointMode.POLYGON);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(300);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 40, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0050
     * @tc.name testCanvasDeep0050
     * @tc.desc Verify an empty point array is rejected and paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0050 begin');
      await runCase('testCanvasDeep0050', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        const points: common2D.Point[] = [];
        target.canvas.attachPen(pen);
        const rejected: boolean = throwsOn(() => target.canvas.drawPoints(points, drawing.PointMode.POINTS));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(rejected).assertTrue();
        expect(inkAll(buffer)).assertEqual(0);
        expect(points.length).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0051
     * @tc.name testCanvasDeep0051
     * @tc.desc Verify one point in point mode paints one dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0051 begin');
      await runCase('testCanvasDeep0051', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        const points: common2D.Point[] = [point(150, 60)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(points, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1 && inkAll(buffer) <= 9).assertTrue();
        expect(chanAt(buffer, 150, 60, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0052
     * @tc.name testCanvasDeep0052
     * @tc.desc Verify duplicated points paint a single dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0052 begin');
      await runCase('testCanvasDeep0052', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        const points: common2D.Point[] = [point(80, 80), point(80, 80), point(80, 80)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(points, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 1 && inkAll(buffer) <= 9).assertTrue();
        expect(chanAt(buffer, 80, 80, 3)).assertEqual(255);
        expect(chanAt(buffer, 90, 90, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0053
     * @tc.name testCanvasDeep0053
     * @tc.desc Verify points outside the canvas paint nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0053 begin');
      await runCase('testCanvasDeep0053', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(8);
        const points: common2D.Point[] = [point(-40, -40), point(-20, -80), point(300, 300)];
        target.canvas.attachPen(pen);
        target.canvas.drawPoints(points, drawing.PointMode.POINTS);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(points.length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0054
     * @tc.name testCanvasDeep0054
     * @tc.desc Verify a horizontal line paints a single row band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0054 begin');
      await runCase('testCanvasDeep0054', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(2);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(10, 110, 110, 110);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 100 && inkAll(buffer) <= 320).assertTrue();
        expect(chanAt(buffer, 60, 110, 3)).assertEqual(255);
        expect(chanAt(buffer, 60, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0055
     * @tc.name testCanvasDeep0055
     * @tc.desc Verify a diagonal line paints a thin band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0055 begin');
      await runCase('testCanvasDeep0055', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(3);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 0, 199, 199);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(993);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 20, 3)).assertEqual(0);
        expect(pen.getColor().green).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0056
     * @tc.name testCanvasDeep0056
     * @tc.desc Verify a zero length line paints at most a dot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0056 begin');
      await runCase('testCanvasDeep0056', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(2);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(50, 50, 50, 50);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) <= 9).assertTrue();
        expect(inkAll(buffer) >= 0).assertTrue();
        expect(chanAt(buffer, 150, 150, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0057
     * @tc.name testCanvasDeep0057
     * @tc.desc Verify a disc and a rect side by side cover their own areas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0057 begin');
      await runCase('testCanvasDeep0057', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 200);
        target.canvas.drawCircle(150, 100, 50);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) >= 27500 && inkAll(buffer) <= 28200).assertTrue();
        expect(inkAll(buffer) > inkRect(buffer, 0, 0, 100, 200)).assertTrue();
        expect(inkRect(buffer, 0, 0, 100, 200)).assertEqual(20000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0058
     * @tc.name testCanvasDeep0058
     * @tc.desc Verify two half canvases keep their own colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0058 begin');
      await runCase('testCanvasDeep0058', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 200);
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawRect(100, 0, 200, 200);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 50, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 150, 100, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0059
     * @tc.name testCanvasDeep0059
     * @tc.desc Verify detaching the brush stops further painting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0059 begin');
      await runCase('testCanvasDeep0059', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 100, 100);
        target.canvas.detachBrush();
        target.canvas.drawRect(100, 0, 200, 100);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(20000);
        expect(chanAt(buffer, 150, 50, 3)).assertEqual(255);
        expect(inkRect(buffer, 0, 0, 100, 100)).assertEqual(10000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0060
     * @tc.name testCanvasDeep0060
     * @tc.desc Verify a stroked rect leaves the centre empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0060 begin');
      await runCase('testCanvasDeep0060', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 50, 100, 3)).assertEqual(255);
        expect(inkAll(buffer)).assertEqual(1600);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0061
     * @tc.name testCanvasDeep0061
     * @tc.desc Verify a wide stroked rect grows the ink count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0061 begin');
      await runCase('testCanvasDeep0061', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(8000);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 55, 55, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0062
     * @tc.name testCanvasDeep0062
     * @tc.desc Verify a filled rect with a stroked border keeps both colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0062 begin');
      await runCase('testCanvasDeep0062', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(4);
        target.canvas.attachBrush(brush);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(50, 50, 150, 150);
        target.canvas.detachPen();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 50, 100, 1)).assertEqual(255);
        expect(inkAll(buffer) >= 2500).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0063
     * @tc.name testCanvasDeep0063
     * @tc.desc Verify clear with alpha 128 paints the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testCanvasDeep0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0063 begin');
      await runCase('testCanvasDeep0063', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(128, 255, 0, 0));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 3) >= 120 && chanAt(buffer, 0, 0, 3) <= 136).assertTrue();
        expect(chanAt(buffer, 199, 199, 0)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0064
     * @tc.name testCanvasDeep0064
     * @tc.desc Verify drawColor with alpha 128 tints every pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0064 begin');
      await runCase('testCanvasDeep0064', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(128, 0, 255, 0);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(128);
        expect(chanAt(buffer, 100, 100, 3) >= 120 && chanAt(buffer, 100, 100, 3) <= 136).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0065
     * @tc.name testCanvasDeep0065
     * @tc.desc Verify three vertical stripes split the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0065 begin');
      await runCase('testCanvasDeep0065', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 60, 200);
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.drawRect(70, 0, 130, 200);
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.drawRect(140, 0, 200, 200);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(36000);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(chanAt(buffer, 65, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0066
     * @tc.name testCanvasDeep0066
     * @tc.desc Verify four quadrant rects leave a gap in the middle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0066 begin');
      await runCase('testCanvasDeep0066', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(0, 0, 90, 90);
        target.canvas.drawRect(110, 0, 200, 90);
        target.canvas.drawRect(0, 110, 90, 200);
        target.canvas.drawRect(110, 110, 200, 110 + 90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(32400);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 45, 45, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0067
     * @tc.name testCanvasDeep0067
     * @tc.desc Verify repeated identical draws produce identical buffers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testCanvasDeep0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0067 begin');
      await runCase('testCanvasDeep0067', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        first.canvas.attachBrush(brush);
        first.canvas.drawRect(40, 40, 160, 160);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawRect(40, 40, 160, 160);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left)).assertEqual(14400);
        expect(inkAll(right)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0068
     * @tc.name testCanvasDeep0068
     * @tc.desc Verify different colors produce different buffers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0068 begin');
      await runCase('testCanvasDeep0068', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        first.canvas.clear(rgba(255, 255, 0, 0));
        second.canvas.clear(rgba(255, 0, 0, 255));
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right) > 0).assertTrue();
        expect(chanAt(left, 100, 100, 0)).assertEqual(255);
        expect(chanAt(right, 100, 100, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0069
     * @tc.name testCanvasDeep0069
     * @tc.desc Verify ten small rects paint one thousand pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testCanvasDeep0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0069 begin');
      await runCase('testCanvasDeep0069', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        for (let index: number = 0; index < 10; index++) {
          target.canvas.drawRect(10, index * 10, 20, index * 10 + 10);
        }
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(1000);
        expect(inkRect(buffer, 10, 0, 20, 100)).assertEqual(1000);
        expect(chanAt(buffer, 15, 95, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0070
     * @tc.name testCanvasDeep0070
     * @tc.desc Verify a source blend with a transparent color punches a hole.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testCanvasDeep0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0070 begin');
      await runCase('testCanvasDeep0070', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clear(rgba(255, 255, 0, 0));
        const brush: drawing.Brush = new drawing.Brush();
        brush.setBlendMode(drawing.BlendMode.SRC);
        brush.setColor(rgba(0, 0, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(90, 90, 110, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(inkAll(buffer) >= 39500 && inkAll(buffer) <= 39600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testCanvasDeep0070 end');
    });

  });
}
