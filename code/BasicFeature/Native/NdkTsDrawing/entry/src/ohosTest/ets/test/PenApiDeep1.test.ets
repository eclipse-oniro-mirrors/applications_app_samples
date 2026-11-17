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
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
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

export default function penApiDeep1Test() {
  describe('PenApiDeep1Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0751
     * @tc.name testPenDeep0751
     * @tc.desc Verify a two pixel stroke covers a narrow band on the offscreen canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0751', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0751 begin');
      await runCase('testPenDeep0751', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(2);
        pen.setAntiAlias(false);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 20, 100, 180);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getWidth()).assertEqual(2);
        expect(inkAll(buffer) >= 280 && inkAll(buffer) <= 440).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 40, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0751 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0752
     * @tc.name testPenDeep0752
     * @tc.desc Verify an eight pixel horizontal stroke fills its band and nothing below it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0752', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0752 begin');
      await runCase('testPenDeep0752', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(8);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getWidth()).assertEqual(8);
        expect(inkRect(buffer, 20, 96, 180, 104) > 1000).assertTrue();
        expect(inkRect(buffer, 20, 104, 180, CANVAS_SIZE)).assertEqual(0);
        expect(chanAt(buffer, 100, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0752 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0753
     * @tc.name testPenDeep0753
     * @tc.desc Verify doubling the stroke width roughly doubles the painted area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0753', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0753 begin');
      await runCase('testPenDeep0753', async () => {
        const thinTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const thickTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const thinPen: drawing.Pen = new drawing.Pen();
        thinPen.setColor(rgba(255, 0, 0, 255));
        thinPen.setStrokeWidth(4);
        thinTarget.canvas.attachPen(thinPen);
        thinTarget.canvas.drawLine(100, 20, 100, 180);
        thinTarget.canvas.detachPen();
        const thickPen: drawing.Pen = new drawing.Pen();
        thickPen.setColor(rgba(255, 0, 0, 255));
        thickPen.setStrokeWidth(8);
        thickTarget.canvas.attachPen(thickPen);
        thickTarget.canvas.drawLine(100, 20, 100, 180);
        thickTarget.canvas.detachPen();
        const thinBuffer: ArrayBuffer = await readPixelBuffer(thinTarget.pixelMap);
        const thickBuffer: ArrayBuffer = await readPixelBuffer(thickTarget.pixelMap);
        expect(thickPen.getWidth() > thinPen.getWidth()).assertTrue();
        expect(inkAll(thickBuffer) > inkAll(thinBuffer) * 1.6).assertTrue();
        expect(inkAll(thickBuffer) < inkAll(thinBuffer) * 2.4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0753 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0754
     * @tc.name testPenDeep0754
     * @tc.desc Verify a zero width stroke keeps the hairline thin and the width getter at zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0754', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0754 begin');
      await runCase('testPenDeep0754', async () => {
        const hairTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const wideTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const hairPen: drawing.Pen = new drawing.Pen();
        hairPen.setColor(rgba(255, 0, 0, 255));
        hairPen.setStrokeWidth(0);
        hairTarget.canvas.attachPen(hairPen);
        hairTarget.canvas.drawLine(100, 20, 100, 180);
        hairTarget.canvas.detachPen();
        const widePen: drawing.Pen = new drawing.Pen();
        widePen.setColor(rgba(255, 0, 0, 255));
        widePen.setStrokeWidth(10);
        wideTarget.canvas.attachPen(widePen);
        wideTarget.canvas.drawLine(100, 20, 100, 180);
        wideTarget.canvas.detachPen();
        const hairBuffer: ArrayBuffer = await readPixelBuffer(hairTarget.pixelMap);
        const wideBuffer: ArrayBuffer = await readPixelBuffer(wideTarget.pixelMap);
        expect(hairPen.getWidth()).assertEqual(0);
        expect(inkAll(hairBuffer) > 0).assertTrue();
        expect(inkAll(hairBuffer) < inkAll(wideBuffer) / 4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0754 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0755
     * @tc.name testPenDeep0755
     * @tc.desc Verify a stroked rectangle leaves its interior completely empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0755', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0755 begin');
      await runCase('testPenDeep0755', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 0, 0));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(ltrb(60, 60, 140, 140));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 80, 80, 120, 120)).assertEqual(0);
        expect(inkRect(buffer, 60, 60, 140, 140) > 0).assertTrue();
        expect(chanAt(buffer, 62, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0755 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0756
     * @tc.name testPenDeep0756
     * @tc.desc Verify a doubled outline width raises the border ring area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0756', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0756 begin');
      await runCase('testPenDeep0756', async () => {
        const slimTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const boldTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const slimPen: drawing.Pen = new drawing.Pen();
        slimPen.setColor(rgba(255, 0, 255, 0));
        slimPen.setStrokeWidth(5);
        slimTarget.canvas.attachPen(slimPen);
        slimTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        slimTarget.canvas.detachPen();
        const boldPen: drawing.Pen = new drawing.Pen();
        boldPen.setColor(rgba(255, 0, 255, 0));
        boldPen.setStrokeWidth(10);
        boldTarget.canvas.attachPen(boldPen);
        boldTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        boldTarget.canvas.detachPen();
        const slimBuffer: ArrayBuffer = await readPixelBuffer(slimTarget.pixelMap);
        const boldBuffer: ArrayBuffer = await readPixelBuffer(boldTarget.pixelMap);
        expect(inkAll(boldBuffer) > inkAll(slimBuffer) * 1.7).assertTrue();
        expect(inkAll(boldBuffer) < inkAll(slimBuffer) * 2.6).assertTrue();
        expect(inkRect(boldBuffer, 80, 80, 120, 120)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0756 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0757
     * @tc.name testPenDeep0757
     * @tc.desc Verify a stroked circle keeps its inner disc untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0757', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0757 begin');
      await runCase('testPenDeep0757', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(10);
        target.canvas.attachPen(pen);
        target.canvas.drawCircle(100, 100, 60);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 80, 80, 120, 120)).assertEqual(0);
        expect(chanAt(buffer, 160, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0757 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0758
     * @tc.name testPenDeep0758
     * @tc.desc Verify the fill outline of a thick stroke grows by half the width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0758', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0758 begin');
      await runCase('testPenDeep0758', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(60, 60, 140, 140));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        const outline: drawing.Path = new drawing.Path();
        const ok: boolean = pen.getFillPath(source, outline);
        const bounds: common2D.Rect = outline.getBounds();
        expect(ok).assertTrue();
        expect(Math.round(bounds.left)).assertEqual(50);
        expect(Math.round(bounds.top)).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0758 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0759
     * @tc.name testPenDeep0759
     * @tc.desc Verify a forty pixel outline extends the box by twenty on each far side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0759', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0759 begin');
      await runCase('testPenDeep0759', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(60, 60, 140, 140));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(40);
        const outline: drawing.Path = new drawing.Path();
        const ok: boolean = pen.getFillPath(source, outline);
        const bounds: common2D.Rect = outline.getBounds();
        expect(ok).assertTrue();
        expect(Math.round(bounds.right)).assertEqual(160);
        expect(Math.round(bounds.bottom)).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0759 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0760
     * @tc.name testPenDeep0760
     * @tc.desc Verify a centred stroke paints the same pixel count on both halves.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0760', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0760 begin');
      await runCase('testPenDeep0760', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(12);
        pen.setAntiAlias(false);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 20, 100, 180);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const leftBand: number = inkRect(buffer, 0, 20, 100, 180);
        const rightBand: number = inkRect(buffer, 100, 20, CANVAS_SIZE, 180);
        expect(Math.abs(leftBand - rightBand) < 40).assertTrue();
        expect(inkRect(buffer, 90, 100, 110, 110) > 0).assertTrue();
        expect(pen.getWidth()).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0760 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0761
     * @tc.name testPenDeep0761
     * @tc.desc Verify a flat cap stops the stroke exactly at the line end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0761', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0761 begin');
      await runCase('testPenDeep0761', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(40, 100, 160, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(inkRect(buffer, 165, 80, CANVAS_SIZE, 120)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0761 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0762
     * @tc.name testPenDeep0762
     * @tc.desc Verify a square cap adds a half width block beyond the line end.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0762', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0762 begin');
      await runCase('testPenDeep0762', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(40, 100, 160, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(inkRect(buffer, 165, 80, 172, 120) > 0).assertTrue();
        expect(inkRect(buffer, 175, 80, CANVAS_SIZE, 120)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0762 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0763
     * @tc.name testPenDeep0763
     * @tc.desc Verify a round cap covers less area than a square cap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0763', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0763 begin');
      await runCase('testPenDeep0763', async () => {
        const roundTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const squareTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 0, 0, 255));
        roundPen.setStrokeWidth(20);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        roundTarget.canvas.attachPen(roundPen);
        roundTarget.canvas.drawLine(40, 100, 160, 100);
        roundTarget.canvas.detachPen();
        const squarePen: drawing.Pen = new drawing.Pen();
        squarePen.setColor(rgba(255, 0, 0, 255));
        squarePen.setStrokeWidth(20);
        squarePen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        squareTarget.canvas.attachPen(squarePen);
        squareTarget.canvas.drawLine(40, 100, 160, 100);
        squareTarget.canvas.detachPen();
        const roundBuffer: ArrayBuffer = await readPixelBuffer(roundTarget.pixelMap);
        const squareBuffer: ArrayBuffer = await readPixelBuffer(squareTarget.pixelMap);
        expect(inkAll(roundBuffer) < inkAll(squareBuffer)).assertTrue();
        expect(inkAll(roundBuffer) > inkAll(squareBuffer) * 0.6).assertTrue();
        expect(inkRect(roundBuffer, 165, 80, 172, 120) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0763 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0764
     * @tc.name testPenDeep0764
     * @tc.desc Verify the square cap adds one width squared of paint over the flat cap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0764', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0764 begin');
      await runCase('testPenDeep0764', async () => {
        const flatTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const squareTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setColor(rgba(255, 0, 255, 0));
        flatPen.setStrokeWidth(20);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        flatTarget.canvas.attachPen(flatPen);
        flatTarget.canvas.drawLine(40, 100, 160, 100);
        flatTarget.canvas.detachPen();
        const squarePen: drawing.Pen = new drawing.Pen();
        squarePen.setColor(rgba(255, 0, 255, 0));
        squarePen.setStrokeWidth(20);
        squarePen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        squareTarget.canvas.attachPen(squarePen);
        squareTarget.canvas.drawLine(40, 100, 160, 100);
        squareTarget.canvas.detachPen();
        const flatBuffer: ArrayBuffer = await readPixelBuffer(flatTarget.pixelMap);
        const squareBuffer: ArrayBuffer = await readPixelBuffer(squareTarget.pixelMap);
        const extra: number = inkAll(squareBuffer) - inkAll(flatBuffer);
        expect(extra > 300).assertTrue();
        expect(extra < 500).assertTrue();
        expect(inkAll(flatBuffer) > 2000).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0764 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0765
     * @tc.name testPenDeep0765
     * @tc.desc Verify the round cap adds roughly three quarters of one width squared.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0765', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0765 begin');
      await runCase('testPenDeep0765', async () => {
        const flatTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setColor(rgba(255, 255, 0, 0));
        flatPen.setStrokeWidth(20);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        flatTarget.canvas.attachPen(flatPen);
        flatTarget.canvas.drawLine(40, 100, 160, 100);
        flatTarget.canvas.detachPen();
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 255, 0, 0));
        roundPen.setStrokeWidth(20);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        roundTarget.canvas.attachPen(roundPen);
        roundTarget.canvas.drawLine(40, 100, 160, 100);
        roundTarget.canvas.detachPen();
        const flatBuffer: ArrayBuffer = await readPixelBuffer(flatTarget.pixelMap);
        const roundBuffer: ArrayBuffer = await readPixelBuffer(roundTarget.pixelMap);
        const extra: number = inkAll(roundBuffer) - inkAll(flatBuffer);
        expect(extra > 200).assertTrue();
        expect(extra < 450).assertTrue();
        expect(extra > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0765 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0766
     * @tc.name testPenDeep0766
     * @tc.desc Verify the outline bounds follow the cap style at the segment ends.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0766', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0766 begin');
      await runCase('testPenDeep0766', async () => {
        const source: drawing.Path = new drawing.Path();
        source.moveTo(40, 100);
        source.lineTo(160, 100);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setStrokeWidth(20);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const squarePen: drawing.Pen = new drawing.Pen();
        squarePen.setStrokeWidth(20);
        squarePen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        const flatOutline: drawing.Path = new drawing.Path();
        const squareOutline: drawing.Path = new drawing.Path();
        flatPen.getFillPath(source, flatOutline);
        squarePen.getFillPath(source, squareOutline);
        const flatBounds: common2D.Rect = flatOutline.getBounds();
        const squareBounds: common2D.Rect = squareOutline.getBounds();
        expect(Math.round(flatBounds.left)).assertEqual(40);
        expect(Math.round(squareBounds.left)).assertEqual(30);
        expect(Math.round(flatBounds.right)).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0766 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0767
     * @tc.name testPenDeep0767
     * @tc.desc Verify a round cap outline reaches half the width past the flat cap outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0767', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0767 begin');
      await runCase('testPenDeep0767', async () => {
        const source: drawing.Path = new drawing.Path();
        source.moveTo(40, 100);
        source.lineTo(160, 100);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setStrokeWidth(20);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setStrokeWidth(20);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        const flatOutline: drawing.Path = new drawing.Path();
        const roundOutline: drawing.Path = new drawing.Path();
        flatPen.getFillPath(source, flatOutline);
        roundPen.getFillPath(source, roundOutline);
        const flatBounds: common2D.Rect = flatOutline.getBounds();
        const roundBounds: common2D.Rect = roundOutline.getBounds();
        expect(Math.round(roundBounds.left) <= 31).assertTrue();
        expect(Math.round(roundBounds.right) >= 169).assertTrue();
        expect(roundBounds.left < flatBounds.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0767 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0768
     * @tc.name testPenDeep0768
     * @tc.desc Verify the cap style getter returns every enumeration member.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0768', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0768 begin');
      await runCase('testPenDeep0768', async () => {
        const flat: drawing.Pen = new drawing.Pen();
        flat.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const square: drawing.Pen = new drawing.Pen();
        square.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        const round: drawing.Pen = new drawing.Pen();
        round.setCapStyle(drawing.CapStyle.ROUND_CAP);
        expect(flat.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(square.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(round.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0768 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0769
     * @tc.name testPenDeep0769
     * @tc.desc Verify three lines with different caps keep independent end blocks.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0769', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0769 begin');
      await runCase('testPenDeep0769', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setColor(rgba(255, 0, 0, 255));
        flatPen.setStrokeWidth(16);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        target.canvas.attachPen(flatPen);
        target.canvas.drawLine(20, 50, 180, 50);
        target.canvas.detachPen();
        const squarePen: drawing.Pen = new drawing.Pen();
        squarePen.setColor(rgba(255, 0, 255, 0));
        squarePen.setStrokeWidth(16);
        squarePen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        target.canvas.attachPen(squarePen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 182, 92, 190, 108) > 0).assertTrue();
        expect(inkRect(buffer, 182, 42, 190, 58)).assertEqual(0);
        expect(inkRect(buffer, 100, 40, 120, 60) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0769 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0770
     * @tc.name testPenDeep0770
     * @tc.desc Verify the cap style has no effect on a closed rectangle outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0770', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0770 begin');
      await runCase('testPenDeep0770', async () => {
        const flatTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const squareTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setColor(rgba(255, 255, 0, 0));
        flatPen.setStrokeWidth(16);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        flatTarget.canvas.attachPen(flatPen);
        flatTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        flatTarget.canvas.detachPen();
        const squarePen: drawing.Pen = new drawing.Pen();
        squarePen.setColor(rgba(255, 255, 0, 0));
        squarePen.setStrokeWidth(16);
        squarePen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        squareTarget.canvas.attachPen(squarePen);
        squareTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        squareTarget.canvas.detachPen();
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 255, 0, 0));
        roundPen.setStrokeWidth(16);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        roundTarget.canvas.attachPen(roundPen);
        roundTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        roundTarget.canvas.detachPen();
        const flatBuffer: ArrayBuffer = await readPixelBuffer(flatTarget.pixelMap);
        const squareBuffer: ArrayBuffer = await readPixelBuffer(squareTarget.pixelMap);
        const roundBuffer: ArrayBuffer = await readPixelBuffer(roundTarget.pixelMap);
        expect(gapBytes(flatBuffer, squareBuffer)).assertEqual(0);
        expect(gapBytes(squareBuffer, roundBuffer)).assertEqual(0);
        expect(inkAll(flatBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0770 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0771
     * @tc.name testPenDeep0771
     * @tc.desc Verify a miter join grows a spike above the corner of a right angle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0771', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0771 begin');
      await runCase('testPenDeep0771', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 100);
        shape.lineTo(100, 40);
        shape.lineTo(160, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setAntiAlias(false);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(inkRect(buffer, 92, 25, 108, 34) > 0).assertTrue();
        expect(chanAt(buffer, 100, 30, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0771 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0772
     * @tc.name testPenDeep0772
     * @tc.desc Verify a bevel join cuts the spike off the same right angle corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0772', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0772 begin');
      await runCase('testPenDeep0772', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 100);
        shape.lineTo(100, 40);
        shape.lineTo(160, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setAntiAlias(false);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 96, 20, 104, 28)).assertEqual(0);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0772 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0773
     * @tc.name testPenDeep0773
     * @tc.desc Verify the painted area grows from bevel through round to miter on one corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0773', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0773 begin');
      await runCase('testPenDeep0773', async () => {
        const miterTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const bevelTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const miterPen: drawing.Pen = new drawing.Pen();
        miterPen.setColor(rgba(255, 0, 255, 0));
        miterPen.setStrokeWidth(20);
        miterPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        const bevelPen: drawing.Pen = new drawing.Pen();
        bevelPen.setColor(rgba(255, 0, 255, 0));
        bevelPen.setStrokeWidth(20);
        bevelPen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 0, 255, 0));
        roundPen.setStrokeWidth(20);
        roundPen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 100);
        shape.lineTo(100, 40);
        shape.lineTo(160, 100);
        miterTarget.canvas.attachPen(miterPen);
        miterTarget.canvas.drawPath(shape);
        miterTarget.canvas.detachPen();
        bevelTarget.canvas.attachPen(bevelPen);
        bevelTarget.canvas.drawPath(shape);
        bevelTarget.canvas.detachPen();
        roundTarget.canvas.attachPen(roundPen);
        roundTarget.canvas.drawPath(shape);
        roundTarget.canvas.detachPen();
        const miterBuffer: ArrayBuffer = await readPixelBuffer(miterTarget.pixelMap);
        const bevelBuffer: ArrayBuffer = await readPixelBuffer(bevelTarget.pixelMap);
        const roundBuffer: ArrayBuffer = await readPixelBuffer(roundTarget.pixelMap);
        expect(inkAll(bevelBuffer) < inkAll(roundBuffer)).assertTrue();
        expect(inkAll(roundBuffer) < inkAll(miterBuffer)).assertTrue();
        expect(inkAll(bevelBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0773 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0774
     * @tc.name testPenDeep0774
     * @tc.desc Verify the join style getter returns every enumeration member.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0774', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0774 begin');
      await runCase('testPenDeep0774', async () => {
        const miter: drawing.Pen = new drawing.Pen();
        miter.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        const bevel: drawing.Pen = new drawing.Pen();
        bevel.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        const round: drawing.Pen = new drawing.Pen();
        round.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        expect(miter.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(bevel.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(round.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0774 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0775
     * @tc.name testPenDeep0775
     * @tc.desc Verify the outline bounds rank miter above bevel above round at the corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0775', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0775 begin');
      await runCase('testPenDeep0775', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 100);
        shape.lineTo(100, 40);
        shape.lineTo(160, 100);
        const miterPen: drawing.Pen = new drawing.Pen();
        miterPen.setStrokeWidth(20);
        miterPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        const bevelPen: drawing.Pen = new drawing.Pen();
        bevelPen.setStrokeWidth(20);
        bevelPen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setStrokeWidth(20);
        roundPen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        const miterOutline: drawing.Path = new drawing.Path();
        const bevelOutline: drawing.Path = new drawing.Path();
        const roundOutline: drawing.Path = new drawing.Path();
        miterPen.getFillPath(shape, miterOutline);
        bevelPen.getFillPath(shape, bevelOutline);
        roundPen.getFillPath(shape, roundOutline);
        const miterBounds: common2D.Rect = miterOutline.getBounds();
        const bevelBounds: common2D.Rect = bevelOutline.getBounds();
        const roundBounds: common2D.Rect = roundOutline.getBounds();
        expect(miterBounds.top < bevelBounds.top).assertTrue();
        expect(roundBounds.top).assertClose(25.857864379882813, 0.01);
        expect(miterBounds.top < 35).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0775 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0776
     * @tc.name testPenDeep0776
     * @tc.desc Verify the right angle miter outline stops about fourteen pixels above the corner.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0776', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0776 begin');
      await runCase('testPenDeep0776', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 100);
        shape.lineTo(100, 40);
        shape.lineTo(160, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        const outline: drawing.Path = new drawing.Path();
        pen.getFillPath(shape, outline);
        const bounds: common2D.Rect = outline.getBounds();
        expect(bounds.top < 30).assertTrue();
        expect(bounds.top > 18).assertTrue();
        expect(Math.round(bounds.left)).assertEqual(33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0776 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0777
     * @tc.name testPenDeep0777
     * @tc.desc Verify a tight miter limit bevels a sharp corner that a loose limit keeps spiked.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0777', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0777 begin');
      await runCase('testPenDeep0777', async () => {
        const tightTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const looseTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.lineTo(100, 40);
        shape.lineTo(180, 180);
        const tightPen: drawing.Pen = new drawing.Pen();
        tightPen.setColor(rgba(255, 0, 0, 255));
        tightPen.setStrokeWidth(20);
        tightPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        tightPen.setMiterLimit(1);
        tightTarget.canvas.attachPen(tightPen);
        tightTarget.canvas.drawPath(shape);
        tightTarget.canvas.detachPen();
        const loosePen: drawing.Pen = new drawing.Pen();
        loosePen.setColor(rgba(255, 0, 0, 255));
        loosePen.setStrokeWidth(20);
        loosePen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        loosePen.setMiterLimit(10);
        looseTarget.canvas.attachPen(loosePen);
        looseTarget.canvas.drawPath(shape);
        looseTarget.canvas.detachPen();
        const tightBuffer: ArrayBuffer = await readPixelBuffer(tightTarget.pixelMap);
        const looseBuffer: ArrayBuffer = await readPixelBuffer(looseTarget.pixelMap);
        expect(inkAll(tightBuffer) < inkAll(looseBuffer)).assertTrue();
        expect(inkRect(tightBuffer, 96, 20, 104, 33)).assertEqual(0);
        expect(tightPen.getMiterLimit()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0777 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0778
     * @tc.name testPenDeep0778
     * @tc.desc Verify a hundredfold miter limit paints the same pixels as a tenfold limit.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0778', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0778 begin');
      await runCase('testPenDeep0778', async () => {
        const tenTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const hundredTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.lineTo(100, 40);
        shape.lineTo(180, 180);
        const tenPen: drawing.Pen = new drawing.Pen();
        tenPen.setColor(rgba(255, 0, 255, 0));
        tenPen.setStrokeWidth(16);
        tenPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        tenPen.setMiterLimit(10);
        tenTarget.canvas.attachPen(tenPen);
        tenTarget.canvas.drawPath(shape);
        tenTarget.canvas.detachPen();
        const hundredPen: drawing.Pen = new drawing.Pen();
        hundredPen.setColor(rgba(255, 0, 255, 0));
        hundredPen.setStrokeWidth(16);
        hundredPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        hundredPen.setMiterLimit(100);
        hundredTarget.canvas.attachPen(hundredPen);
        hundredTarget.canvas.drawPath(shape);
        hundredTarget.canvas.detachPen();
        const tenBuffer: ArrayBuffer = await readPixelBuffer(tenTarget.pixelMap);
        const hundredBuffer: ArrayBuffer = await readPixelBuffer(hundredTarget.pixelMap);
        expect(gapBytes(tenBuffer, hundredBuffer)).assertEqual(0);
        expect(hundredPen.getMiterLimit()).assertEqual(100);
        expect(tenPen.getMiterLimit()).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0778 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0779
     * @tc.name testPenDeep0779
     * @tc.desc Verify the join style is irrelevant on a single straight segment.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0779', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0779 begin');
      await runCase('testPenDeep0779', async () => {
        const miterTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const bevelTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const miterPen: drawing.Pen = new drawing.Pen();
        miterPen.setColor(rgba(255, 0, 0, 255));
        miterPen.setStrokeWidth(18);
        miterPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        miterPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        miterTarget.canvas.attachPen(miterPen);
        miterTarget.canvas.drawLine(30, 100, 170, 100);
        miterTarget.canvas.detachPen();
        const bevelPen: drawing.Pen = new drawing.Pen();
        bevelPen.setColor(rgba(255, 0, 0, 255));
        bevelPen.setStrokeWidth(18);
        bevelPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        bevelPen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        bevelTarget.canvas.attachPen(bevelPen);
        bevelTarget.canvas.drawLine(30, 100, 170, 100);
        bevelTarget.canvas.detachPen();
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 0, 0, 255));
        roundPen.setStrokeWidth(18);
        roundPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        roundPen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        roundTarget.canvas.attachPen(roundPen);
        roundTarget.canvas.drawLine(30, 100, 170, 100);
        roundTarget.canvas.detachPen();
        const miterBuffer: ArrayBuffer = await readPixelBuffer(miterTarget.pixelMap);
        const bevelBuffer: ArrayBuffer = await readPixelBuffer(bevelTarget.pixelMap);
        const roundBuffer: ArrayBuffer = await readPixelBuffer(roundTarget.pixelMap);
        expect(gapBytes(miterBuffer, bevelBuffer)).assertEqual(0);
        expect(gapBytes(miterBuffer, roundBuffer)).assertEqual(0);
        expect(inkAll(miterBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0779 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0780
     * @tc.name testPenDeep0780
     * @tc.desc Verify every corner of a zigzag polyline reacts to the join style.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0780', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0780 begin');
      await runCase('testPenDeep0780', async () => {
        const miterTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const bevelTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 160);
        shape.lineTo(65, 60);
        shape.lineTo(110, 160);
        shape.lineTo(155, 60);
        const miterPen: drawing.Pen = new drawing.Pen();
        miterPen.setColor(rgba(255, 255, 0, 0));
        miterPen.setStrokeWidth(12);
        miterPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        miterTarget.canvas.attachPen(miterPen);
        miterTarget.canvas.drawPath(shape);
        miterTarget.canvas.detachPen();
        const bevelPen: drawing.Pen = new drawing.Pen();
        bevelPen.setColor(rgba(255, 255, 0, 0));
        bevelPen.setStrokeWidth(12);
        bevelPen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        bevelTarget.canvas.attachPen(bevelPen);
        bevelTarget.canvas.drawPath(shape);
        bevelTarget.canvas.detachPen();
        const miterBuffer: ArrayBuffer = await readPixelBuffer(miterTarget.pixelMap);
        const bevelBuffer: ArrayBuffer = await readPixelBuffer(bevelTarget.pixelMap);
        const miterOutline: drawing.Path = new drawing.Path();
        const bevelOutline: drawing.Path = new drawing.Path();
        miterPen.getFillPath(shape, miterOutline);
        bevelPen.getFillPath(shape, bevelOutline);
        expect(inkAll(miterBuffer) > inkAll(bevelBuffer)).assertTrue();
        expect(inkAll(bevelBuffer) > 0).assertTrue();
        expect(miterOutline.getBounds().top < bevelOutline.getBounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0780 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0781
     * @tc.name testPenDeep0781
     * @tc.desc Verify the miter limit getter reports the stored value and leaves other traits alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0781', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0781 begin');
      await runCase('testPenDeep0781', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setMiterLimit(6);
        expect(pen.getMiterLimit()).assertEqual(6);
        expect(pen.getWidth()).assertEqual(0);
        expect(pen.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0781 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0782
     * @tc.name testPenDeep0782
     * @tc.desc Verify a negative miter limit paints like the documented fallback of four.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0782', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0782 begin');
      await runCase('testPenDeep0782', async () => {
        const negTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const fourTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(20, 180);
        shape.lineTo(100, 40);
        shape.lineTo(180, 180);
        const negPen: drawing.Pen = new drawing.Pen();
        negPen.setColor(rgba(255, 0, 0, 255));
        negPen.setStrokeWidth(20);
        negPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        negPen.setMiterLimit(-3);
        negTarget.canvas.attachPen(negPen);
        negTarget.canvas.drawPath(shape);
        negTarget.canvas.detachPen();
        const fourPen: drawing.Pen = new drawing.Pen();
        fourPen.setColor(rgba(255, 0, 0, 255));
        fourPen.setStrokeWidth(20);
        fourPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        fourPen.setMiterLimit(4);
        fourTarget.canvas.attachPen(fourPen);
        fourTarget.canvas.drawPath(shape);
        fourTarget.canvas.detachPen();
        const negBuffer: ArrayBuffer = await readPixelBuffer(negTarget.pixelMap);
        const fourBuffer: ArrayBuffer = await readPixelBuffer(fourTarget.pixelMap);
        expect(gapBytes(negBuffer, fourBuffer)).assertEqual(0);
        expect(negPen.getMiterLimit() < 0).assertTrue();
        expect(fourPen.getMiterLimit()).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0782 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0783
     * @tc.name testPenDeep0783
     * @tc.desc Verify raising the miter limit on a sharp corner adds the spike back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0783', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0783 begin');
      await runCase('testPenDeep0783', async () => {
        const tightTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const looseTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.lineTo(100, 50);
        shape.lineTo(170, 170);
        const tightPen: drawing.Pen = new drawing.Pen();
        tightPen.setColor(rgba(255, 0, 255, 0));
        tightPen.setStrokeWidth(18);
        tightPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        tightPen.setMiterLimit(1.2);
        tightTarget.canvas.attachPen(tightPen);
        tightTarget.canvas.drawPath(shape);
        tightTarget.canvas.detachPen();
        const loosePen: drawing.Pen = new drawing.Pen();
        loosePen.setColor(rgba(255, 0, 255, 0));
        loosePen.setStrokeWidth(18);
        loosePen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        loosePen.setMiterLimit(6);
        looseTarget.canvas.attachPen(loosePen);
        looseTarget.canvas.drawPath(shape);
        looseTarget.canvas.detachPen();
        const tightBuffer: ArrayBuffer = await readPixelBuffer(tightTarget.pixelMap);
        const looseBuffer: ArrayBuffer = await readPixelBuffer(looseTarget.pixelMap);
        const tightOutline: drawing.Path = new drawing.Path();
        const looseOutline: drawing.Path = new drawing.Path();
        tightPen.getFillPath(shape, tightOutline);
        loosePen.getFillPath(shape, looseOutline);
        expect(inkAll(looseBuffer) > inkAll(tightBuffer)).assertTrue();
        expect(looseOutline.getBounds().top < tightOutline.getBounds().top).assertTrue();
        expect(tightPen.getMiterLimit()).assertClose(1.2, 0.000001);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0783 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0784
     * @tc.name testPenDeep0784
     * @tc.desc Verify a limit of one and a limit of zero bevel the corner identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0784', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0784 begin');
      await runCase('testPenDeep0784', async () => {
        const oneTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const zeroTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.lineTo(100, 50);
        shape.lineTo(170, 170);
        const onePen: drawing.Pen = new drawing.Pen();
        onePen.setColor(rgba(255, 0, 0, 255));
        onePen.setStrokeWidth(18);
        onePen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        onePen.setMiterLimit(1);
        oneTarget.canvas.attachPen(onePen);
        oneTarget.canvas.drawPath(shape);
        oneTarget.canvas.detachPen();
        const zeroPen: drawing.Pen = new drawing.Pen();
        zeroPen.setColor(rgba(255, 0, 0, 255));
        zeroPen.setStrokeWidth(18);
        zeroPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        zeroPen.setMiterLimit(0);
        zeroTarget.canvas.attachPen(zeroPen);
        zeroTarget.canvas.drawPath(shape);
        zeroTarget.canvas.detachPen();
        const oneBuffer: ArrayBuffer = await readPixelBuffer(oneTarget.pixelMap);
        const zeroBuffer: ArrayBuffer = await readPixelBuffer(zeroTarget.pixelMap);
        expect(gapBytes(oneBuffer, zeroBuffer)).assertEqual(0);
        expect(onePen.getMiterLimit()).assertEqual(1);
        expect(zeroPen.getMiterLimit()).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0784 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0785
     * @tc.name testPenDeep0785
     * @tc.desc Verify a fractional miter limit survives a round trip on the pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0785', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0785 begin');
      await runCase('testPenDeep0785', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setMiterLimit(2.5);
        pen.setStrokeWidth(9);
        pen.setAlpha(200);
        expect(pen.getMiterLimit()).assertEqual(2.5);
        expect(pen.getWidth()).assertEqual(9);
        expect(pen.getAlpha()).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0785 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0786
     * @tc.name testPenDeep0786
     * @tc.desc Verify the outline length and top bound both grow with the miter limit.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0786', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0786 begin');
      await runCase('testPenDeep0786', async () => {
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.lineTo(100, 50);
        shape.lineTo(170, 170);
        const tightPen: drawing.Pen = new drawing.Pen();
        tightPen.setStrokeWidth(18);
        tightPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        tightPen.setMiterLimit(1.2);
        const loosePen: drawing.Pen = new drawing.Pen();
        loosePen.setStrokeWidth(18);
        loosePen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        loosePen.setMiterLimit(6);
        const tightOutline: drawing.Path = new drawing.Path();
        const looseOutline: drawing.Path = new drawing.Path();
        tightPen.getFillPath(shape, tightOutline);
        loosePen.getFillPath(shape, looseOutline);
        expect(looseOutline.getLength(true) > tightOutline.getLength(true)).assertTrue();
        expect(looseOutline.isEmpty()).assertFalse();
        expect(Math.round(looseOutline.getBounds().top) < Math.round(tightOutline.getBounds().top)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0786 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0787
     * @tc.name testPenDeep0787
     * @tc.desc Verify touching the miter limit keeps width colour and alpha untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0787', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0787 begin');
      await runCase('testPenDeep0787', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(14);
        pen.setColor(0xFF3366AA);
        pen.setMiterLimit(7);
        expect(pen.getWidth()).assertEqual(14);
        expect(pen.getHexColor()).assertEqual(0xFF3366AA);
        expect(pen.getMiterLimit()).assertEqual(7);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0787 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0788
     * @tc.name testPenDeep0788
     * @tc.desc Verify a fresh pen joins miters like an explicit limit of four.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0788', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0788 begin');
      await runCase('testPenDeep0788', async () => {
        const freshTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const fourTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.lineTo(100, 50);
        shape.lineTo(170, 170);
        const freshPen: drawing.Pen = new drawing.Pen();
        freshPen.setColor(rgba(255, 255, 0, 0));
        freshPen.setStrokeWidth(18);
        freshPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        freshTarget.canvas.attachPen(freshPen);
        freshTarget.canvas.drawPath(shape);
        freshTarget.canvas.detachPen();
        const fourPen: drawing.Pen = new drawing.Pen();
        fourPen.setColor(rgba(255, 255, 0, 0));
        fourPen.setStrokeWidth(18);
        fourPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        fourPen.setMiterLimit(4);
        fourTarget.canvas.attachPen(fourPen);
        fourTarget.canvas.drawPath(shape);
        fourTarget.canvas.detachPen();
        const freshBuffer: ArrayBuffer = await readPixelBuffer(freshTarget.pixelMap);
        const fourBuffer: ArrayBuffer = await readPixelBuffer(fourTarget.pixelMap);
        expect(gapBytes(freshBuffer, fourBuffer)).assertEqual(0);
        expect(freshPen.getWidth()).assertEqual(18);
        expect(fourPen.getMiterLimit()).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0788 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0789
     * @tc.name testPenDeep0789
     * @tc.desc Verify the miter limit has no effect once the join style is round.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0789', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0789 begin');
      await runCase('testPenDeep0789', async () => {
        const tightTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const looseTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.lineTo(100, 50);
        shape.lineTo(170, 170);
        const tightPen: drawing.Pen = new drawing.Pen();
        tightPen.setColor(rgba(255, 0, 0, 255));
        tightPen.setStrokeWidth(18);
        tightPen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        tightPen.setMiterLimit(1);
        tightTarget.canvas.attachPen(tightPen);
        tightTarget.canvas.drawPath(shape);
        tightTarget.canvas.detachPen();
        const loosePen: drawing.Pen = new drawing.Pen();
        loosePen.setColor(rgba(255, 0, 0, 255));
        loosePen.setStrokeWidth(18);
        loosePen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        loosePen.setMiterLimit(20);
        looseTarget.canvas.attachPen(loosePen);
        looseTarget.canvas.drawPath(shape);
        looseTarget.canvas.detachPen();
        const tightBuffer: ArrayBuffer = await readPixelBuffer(tightTarget.pixelMap);
        const looseBuffer: ArrayBuffer = await readPixelBuffer(looseTarget.pixelMap);
        expect(gapBytes(tightBuffer, looseBuffer)).assertEqual(0);
        expect(tightPen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(tightPen.getMiterLimit()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0789 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0790
     * @tc.name testPenDeep0790
     * @tc.desc Verify the last miter limit written wins over earlier writes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0790', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0790 begin');
      await runCase('testPenDeep0790', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setMiterLimit(2);
        pen.setMiterLimit(5);
        pen.setMiterLimit(9);
        pen.setStrokeWidth(5);
        expect(pen.getMiterLimit()).assertEqual(9);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getWidth()).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0790 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0791
     * @tc.name testPenDeep0791
     * @tc.desc Verify an empty source path produces an empty outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0791', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0791 begin');
      await runCase('testPenDeep0791', async () => {
        const source: drawing.Path = new drawing.Path();
        const outline: drawing.Path = new drawing.Path();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(8);
        pen.getFillPath(source, outline);
        expect(outline.isEmpty()).assertTrue();
        expect(outline.getLength(true)).assertEqual(0);
        expect(outline.getBounds().right).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0791 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0792
     * @tc.name testPenDeep0792
     * @tc.desc Verify a flat cap segment outline spans exactly the source end points.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0792', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0792 begin');
      await runCase('testPenDeep0792', async () => {
        const source: drawing.Path = new drawing.Path();
        source.moveTo(40, 100);
        source.lineTo(160, 100);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(4);
        pen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const outline: drawing.Path = new drawing.Path();
        pen.getFillPath(source, outline);
        const bounds: common2D.Rect = outline.getBounds();
        const length: number = outline.getLength(true);
        expect(Math.round(bounds.left)).assertEqual(40);
        expect(Math.round(bounds.right)).assertEqual(160);
        expect(length >= 230 && length <= 265).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0792 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0793
     * @tc.name testPenDeep0793
     * @tc.desc Verify a round cap lengthens the segment outline by the two end arcs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0793', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0793 begin');
      await runCase('testPenDeep0793', async () => {
        const source: drawing.Path = new drawing.Path();
        source.moveTo(40, 100);
        source.lineTo(160, 100);
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setStrokeWidth(20);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setStrokeWidth(20);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        const flatOutline: drawing.Path = new drawing.Path();
        const roundOutline: drawing.Path = new drawing.Path();
        flatPen.getFillPath(source, flatOutline);
        roundPen.getFillPath(source, roundOutline);
        const flatLength: number = flatOutline.getLength(true);
        const roundLength: number = roundOutline.getLength(true);
        expect(roundLength > flatLength).assertTrue();
        expect(roundLength).assertClose(302.427001953125, 0.01);
        expect(roundLength < flatLength + 250).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0793 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0794
     * @tc.name testPenDeep0794
     * @tc.desc Verify the rectangle outline length matches its outer and inner perimeters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0794', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0794 begin');
      await runCase('testPenDeep0794', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(60, 60, 140, 140));
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(10);
        const outline: drawing.Path = new drawing.Path();
        pen.getFillPath(source, outline);
        const length: number = outline.getLength(true);
        const bounds: common2D.Rect = outline.getBounds();
        expect(length).assertEqual(360);
        expect(Math.round(bounds.left)).assertEqual(55);
        expect(Math.round(bounds.right)).assertEqual(145);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0794 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0795
     * @tc.name testPenDeep0795
     * @tc.desc Verify a circle outline keeps its centre while growing by the half width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0795', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0795 begin');
      await runCase('testPenDeep0795', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addCircle(110, 90, 30);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(12);
        const outline: drawing.Path = new drawing.Path();
        pen.getFillPath(source, outline);
        const bounds: common2D.Rect = outline.getBounds();
        expect(Math.abs((bounds.left + bounds.right) / 2 - 110) < 1.5).assertTrue();
        expect(Math.abs((bounds.top + bounds.bottom) / 2 - 90) < 1.5).assertTrue();
        expect(bounds.right > 140).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0795 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0796
     * @tc.name testPenDeep0796
     * @tc.desc Verify the circle outline box grows by eight on every side.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0796', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0796 begin');
      await runCase('testPenDeep0796', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addCircle(100, 100, 50);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(16);
        const outline: drawing.Path = new drawing.Path();
        pen.getFillPath(source, outline);
        const bounds: common2D.Rect = outline.getBounds();
        expect(Math.round(bounds.left)).assertEqual(42);
        expect(Math.round(bounds.top)).assertEqual(42);
        expect(Math.round(bounds.right)).assertEqual(158);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0796 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0797
     * @tc.name testPenDeep0797
     * @tc.desc Verify filling the outline reproduces the directly stroked band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0797', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0797 begin');
      await runCase('testPenDeep0797', async () => {
        const strokeTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const fillTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rect: common2D.Rect = ltrb(60, 60, 140, 140);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(10);
        strokeTarget.canvas.attachPen(pen);
        strokeTarget.canvas.drawRect(rect);
        strokeTarget.canvas.detachPen();
        const source: drawing.Path = new drawing.Path();
        source.addRect(rect);
        const outline: drawing.Path = new drawing.Path();
        pen.getFillPath(source, outline);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        fillTarget.canvas.attachBrush(brush);
        fillTarget.canvas.drawPath(outline);
        fillTarget.canvas.detachBrush();
        const strokeBuffer: ArrayBuffer = await readPixelBuffer(strokeTarget.pixelMap);
        const fillBuffer: ArrayBuffer = await readPixelBuffer(fillTarget.pixelMap);
        expect(inkAll(fillBuffer) > 0).assertTrue();
        expect(Math.abs(inkAll(strokeBuffer) - inkAll(fillBuffer)) < inkAll(strokeBuffer) * 0.12).assertTrue();
        expect(chanAt(strokeBuffer, 62, 100, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0797 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0798
     * @tc.name testPenDeep0798
     * @tc.desc Verify two destinations filled from the same source share their bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0798', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0798 begin');
      await runCase('testPenDeep0798', async () => {
        const source: drawing.Path = new drawing.Path();
        source.moveTo(40, 60);
        source.lineTo(140, 60);
        source.lineTo(140, 140);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(14);
        const first: drawing.Path = new drawing.Path();
        const second: drawing.Path = new drawing.Path();
        pen.getFillPath(source, first);
        pen.getFillPath(source, second);
        const firstBounds: common2D.Rect = first.getBounds();
        const secondBounds: common2D.Rect = second.getBounds();
        expect(Math.round(firstBounds.left)).assertEqual(Math.round(secondBounds.left));
        expect(Math.round(firstBounds.bottom)).assertEqual(Math.round(secondBounds.bottom));
        expect(Math.round(firstBounds.right)).assertEqual(Math.round(secondBounds.right));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0798 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0799
     * @tc.name testPenDeep0799
     * @tc.desc Verify the segment outline length rises with the stroke width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0799', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0799 begin');
      await runCase('testPenDeep0799', async () => {
        const widths: number[] = [2, 6, 14];
        const lengths: number[] = [];
        for (let index: number = 0; index < widths.length; index++) {
          const source: drawing.Path = new drawing.Path();
          source.moveTo(60, 100);
          source.lineTo(140, 100);
          const pen: drawing.Pen = new drawing.Pen();
          pen.setStrokeWidth(widths[index]);
          pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
          const outline: drawing.Path = new drawing.Path();
          pen.getFillPath(source, outline);
          lengths.push(outline.getLength(true));
        }
        expect(lengths[0] < lengths[1]).assertTrue();
        expect(lengths[1] < lengths[2]).assertTrue();
        expect(lengths.length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0799 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0800
     * @tc.name testPenDeep0800
     * @tc.desc Verify a square capped miter polyline matches across pixels outline and traits.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0800', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0800 begin');
      await runCase('testPenDeep0800', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 150);
        shape.lineTo(100, 50);
        shape.lineTo(160, 150);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(12);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const outline: drawing.Path = new drawing.Path();
        const ok: boolean = pen.getFillPath(shape, outline);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(Math.round(outline.getBounds().left) <= 36).assertTrue();
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(ok).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0800 end');
    });

  });
}
