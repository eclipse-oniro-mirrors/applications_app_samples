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

export default function fontApiDeep3Test() {
  describe('FontApiDeep3Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0601
     * @tc.name testFontDeep0601
     * @tc.desc Verify a character drawn near the left edge inks the left band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0601', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0601 begin');
      await runCase('testFontDeep0601', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('L', font, 10, 140);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 80, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 120, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(font.getSize()).assertEqual(60);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0601 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0602
     * @tc.name testFontDeep0602
     * @tc.desc Verify a character drawn near the right edge leaves the left band clear.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0602', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0602 begin');
      await runCase('testFontDeep0602', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('R', font, 130, 140);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 100, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 120, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
        expect(font.measureSingleCharacter('R') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0602 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0603
     * @tc.name testFontDeep0603
     * @tc.desc Verify two characters placed far apart ink both halves.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0603', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0603 begin');
      await runCase('testFontDeep0603', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('A', font, 20, 130);
        target.canvas.drawSingleCharacter('B', font, 120, 130);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 100, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
        expect(font.countText('AB')).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0603 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0604
     * @tc.name testFontDeep0604
     * @tc.desc Verify a position offset skips the first glyph slot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0604', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0604 begin');
      await runCase('testFontDeep0604', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(50);
        const ids: number[] = font.textToGlyphs('XX');
        const positions: common2D.Point[] = [point(20, 130), point(120, 130)];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawGlyphs(ids, 0, positions, 1, 1, font);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 100, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
        expect(positions[0].x).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0604 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0605
     * @tc.name testFontDeep0605
     * @tc.desc Verify drawing zero of the available glyphs is rejected as out of range.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0605', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0605 begin');
      await runCase('testFontDeep0605', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(50);
        const ids: number[] = font.textToGlyphs('QQ');
        const positions: common2D.Point[] = [point(30, 130), point(110, 130)];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        const rejected: boolean = throwsOn(() => target.canvas.drawGlyphs(ids, 0, positions, 0, 0, font));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(rejected).assertTrue();
        expect(inkAll(buffer)).assertEqual(0);
        expect(ids.length).assertEqual(2);
        expect(positions.length).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0605 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0606
     * @tc.name testFontDeep0606
     * @tc.desc Verify text drawn on a rotated canvas is still inked.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0606', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0606 begin');
      await runCase('testFontDeep0606', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.rotate(45, 100, 100);
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('T', font, 60, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(font.getSize()).assertEqual(64);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0606 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0607
     * @tc.name testFontDeep0607
     * @tc.desc Verify a half scale canvas paints less text ink than the plain frame.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0607', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0607 begin');
      await runCase('testFontDeep0607', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shrunk: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(90);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawSingleCharacter('S', font, 40, 160);
        plain.canvas.detachBrush();
        shrunk.canvas.scale(0.5, 0.5);
        shrunk.canvas.attachBrush(brush);
        shrunk.canvas.drawSingleCharacter('S', font, 40, 160);
        shrunk.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(shrunk.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(right) < inkAll(left)).assertTrue();
        expect(font.getSize()).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0607 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0608
     * @tc.name testFontDeep0608
     * @tc.desc Verify a doubled canvas paints more text ink than the plain frame.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0608', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0608 begin');
      await runCase('testFontDeep0608', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const grown: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(32);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawSingleCharacter('G', font, 20, 80);
        plain.canvas.detachBrush();
        grown.canvas.scale(2, 2);
        grown.canvas.attachBrush(brush);
        grown.canvas.drawSingleCharacter('G', font, 20, 80);
        grown.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(grown.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(right) > inkAll(left)).assertTrue();
        expect(font.getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0608 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0609
     * @tc.name testFontDeep0609
     * @tc.desc Verify translate plus rotate keeps the drawn text inside the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0609', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0609 begin');
      await runCase('testFontDeep0609', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(60, 40);
        target.canvas.rotate(30, 0, 0);
        const font: drawing.Font = new drawing.Font();
        font.setSize(52);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('Y', font, 0, 100);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, 20, 20)).assertEqual(0);
        expect(font.getSize()).assertEqual(52);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0609 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0610
     * @tc.name testFontDeep0610
     * @tc.desc Verify a right half clip hides the left half of a centred character.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0610', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0610 begin');
      await runCase('testFontDeep0610', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(100, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.clipPath(clip);
        const font: drawing.Font = new drawing.Font();
        font.setSize(90);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('M', font, 60, 160);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 100, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
        expect(clip.getBounds().left).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0610 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0611
     * @tc.name testFontDeep0611
     * @tc.desc Verify two stacked clips confine text to their intersection box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0611', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0611 begin');
      await runCase('testFontDeep0611', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const first: drawing.Path = new drawing.Path();
        first.addRect(ltrb(0, 0, 120, CANVAS_SIZE));
        const second: drawing.Path = new drawing.Path();
        second.addRect(ltrb(0, 0, CANVAS_SIZE, 100));
        target.canvas.clipPath(first);
        target.canvas.clipPath(second);
        const font: drawing.Font = new drawing.Font();
        font.setSize(80);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('H', font, 30, 90);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 120, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 0, 100, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0611 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0612
     * @tc.name testFontDeep0612
     * @tc.desc Verify a translucent layer keeps the drawn text visible.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0612', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0612 begin');
      await runCase('testFontDeep0612', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const veil: drawing.Brush = new drawing.Brush();
        veil.setColor(rgba(128, 255, 255, 255));
        target.canvas.saveLayer(null, veil);
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('C', font, 40, 140);
        target.canvas.detachBrush();
        target.canvas.restore();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(font.getSize()).assertEqual(64);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0612 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0613
     * @tc.name testFontDeep0613
     * @tc.desc Verify drawing translucent text twice keeps the same covered pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0613', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0613 begin');
      await runCase('testFontDeep0613', async () => {
        const once: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const twice: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(70);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(128, 0, 255, 0));
        once.canvas.attachBrush(brush);
        once.canvas.drawSingleCharacter('P', font, 30, 150);
        once.canvas.detachBrush();
        twice.canvas.attachBrush(brush);
        twice.canvas.drawSingleCharacter('P', font, 30, 150);
        twice.canvas.drawSingleCharacter('P', font, 30, 150);
        twice.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(once.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(twice.pixelMap);
        expect(inkAll(right)).assertEqual(inkAll(left));
        expect(inkAll(left) > 0).assertTrue();
        expect(font.getSize()).assertEqual(70);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0613 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0614
     * @tc.name testFontDeep0614
     * @tc.desc Verify the two canvas halves partition the inked text pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0614', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0614 begin');
      await runCase('testFontDeep0614', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('K', font, 70, 130);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const left: number = inkRect(buffer, 0, 0, 100, CANVAS_SIZE);
        const right: number = inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE);
        expect(left + right).assertEqual(inkAll(buffer));
        expect(inkAll(buffer) > 0).assertTrue();
        expect(right > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0614 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0615
     * @tc.name testFontDeep0615
     * @tc.desc Verify a filled glyph outline covers more than its stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0615', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0615 begin');
      await runCase('testFontDeep0615', async () => {
        const filled: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const stroked: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(110);
        const outline: drawing.Path = font.getTextPath('B', 1, 40, 160);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        filled.canvas.attachBrush(brush);
        filled.canvas.drawPath(outline);
        filled.canvas.detachBrush();
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(3);
        stroked.canvas.attachPen(pen);
        stroked.canvas.drawPath(outline);
        stroked.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(filled.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(stroked.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(left) > inkAll(right)).assertTrue();
        expect(outline.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0615 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0616
     * @tc.name testFontDeep0616
     * @tc.desc Verify a thicker pen inks more of the glyph outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0616', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0616 begin');
      await runCase('testFontDeep0616', async () => {
        const thin: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const thick: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(84);
        const outline: drawing.Path = font.getTextPath('U', 1, 40, 150);
        const thinPen: drawing.Pen = new drawing.Pen();
        thinPen.setColor(rgba(255, 255, 0, 0));
        thinPen.setStrokeWidth(2);
        const thickPen: drawing.Pen = new drawing.Pen();
        thickPen.setColor(rgba(255, 255, 0, 0));
        thickPen.setStrokeWidth(10);
        thin.canvas.attachPen(thinPen);
        thin.canvas.drawPath(outline);
        thin.canvas.detachPen();
        thick.canvas.attachPen(thickPen);
        thick.canvas.drawPath(outline);
        thick.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(thin.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(thick.pixelMap);
        expect(inkAll(right) > inkAll(left)).assertTrue();
        expect(inkAll(left) > 0).assertTrue();
        expect(outline.getLength(false) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0616 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0617
     * @tc.name testFontDeep0617
     * @tc.desc Verify a wide letter outline runs longer than a narrow one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0617', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0617 begin');
      await runCase('testFontDeep0617', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(96);
        const wide: drawing.Path = font.getTextPath('W', 1, 0, 160);
        const narrow: drawing.Path = font.getTextPath('i', 1, 0, 160);
        expect(wide.getLength(false) > narrow.getLength(false)).assertTrue();
        expect(narrow.getLength(false) > 0).assertTrue();
        expect(wide.getBounds().right > narrow.getBounds().right).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0617 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0618
     * @tc.name testFontDeep0618
     * @tc.desc Verify a two letter outline carries more verbs than one letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0618', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0618 begin');
      await runCase('testFontDeep0618', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(72);
        const single: drawing.Path = font.getTextPath('N', 1, 0, 140);
        const pair: drawing.Path = font.getTextPath('NN', 2, 0, 140);
        expect(pair.getVerbData().length > single.getVerbData().length).assertTrue();
        expect(single.getVerbData().length >= 2).assertTrue();
        expect(pair.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0618 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0619
     * @tc.name testFontDeep0619
     * @tc.desc Verify appending two glyph outlines doubles the covered ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0619', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0619 begin');
      await runCase('testFontDeep0619', async () => {
        const single: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const doubled: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(72);
        const first: drawing.Path = font.getTextPath('L', 1, 20, 150);
        const second: drawing.Path = font.getTextPath('L', 1, 90, 150);
        const merged: drawing.Path = new drawing.Path();
        merged.addPath(first, null);
        merged.addPath(second, null);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        single.canvas.attachBrush(brush);
        single.canvas.drawPath(first);
        single.canvas.detachBrush();
        doubled.canvas.attachBrush(brush);
        doubled.canvas.drawPath(merged);
        doubled.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(single.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(doubled.pixelMap);
        expect(inkAll(right) > inkAll(left)).assertTrue();
        expect(inkAll(left) > 0).assertTrue();
        expect(merged.getVerbData().length > first.getVerbData().length).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0619 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0620
     * @tc.name testFontDeep0620
     * @tc.desc Verify a translated outline moves its ink into the shifted band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0620', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0620 begin');
      await runCase('testFontDeep0620', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(80);
        const outline: drawing.Path = font.getTextPath('F', 1, 0, 150);
        const shift: drawing.Matrix = new drawing.Matrix();
        shift.setTranslation(110, 0);
        outline.transform(shift);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(outline);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 100, CANVAS_SIZE)).assertEqual(0);
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE) > 0).assertTrue();
        expect(outline.getBounds().left >= 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0620 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0621
     * @tc.name testFontDeep0621
     * @tc.desc Verify a quarter turn swaps the outline bounds width and height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0621', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0621 begin');
      await runCase('testFontDeep0621', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(70);
        const outline: drawing.Path = font.getTextPath('E', 1, 0, 100);
        const base: common2D.Rect = outline.getBounds();
        const baseWidth: number = base.right - base.left;
        const baseHeight: number = base.bottom - base.top;
        const turn: drawing.Matrix = new drawing.Matrix();
        turn.setRotation(90, 0, 0);
        outline.transform(turn);
        const turned: common2D.Rect = outline.getBounds();
        expect(Math.abs((turned.right - turned.left) - baseHeight) < 2).assertTrue();
        expect(Math.abs((turned.bottom - turned.top) - baseWidth) < 2).assertTrue();
        expect(outline.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0621 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0622
     * @tc.name testFontDeep0622
     * @tc.desc Verify a half scale matrix halves the outline length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0622', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0622 begin');
      await runCase('testFontDeep0622', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(90);
        const outline: drawing.Path = font.getTextPath('A', 1, 0, 160);
        const before: number = outline.getLength(false);
        const shrink: drawing.Matrix = new drawing.Matrix();
        shrink.setScale(0.5, 0.5, 0, 0);
        outline.transform(shrink);
        const after: number = outline.getLength(false);
        expect(Math.abs(after / before - 0.5) < 0.05).assertTrue();
        expect(after < before).assertTrue();
        expect(before > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0622 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0623
     * @tc.name testFontDeep0623
     * @tc.desc Verify the even odd fill of a ring letter differs from the winding fill.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0623', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0623 begin');
      await runCase('testFontDeep0623', async () => {
        const winding: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const evenOdd: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(120);
        const windingPath: drawing.Path = font.getTextPath('O', 1, 40, 170);
        windingPath.setFillType(drawing.PathFillType.WINDING);
        const evenPath: drawing.Path = font.getTextPath('O', 1, 40, 170);
        evenPath.setFillType(drawing.PathFillType.EVEN_ODD);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        winding.canvas.attachBrush(brush);
        winding.canvas.drawPath(windingPath);
        winding.canvas.detachBrush();
        evenOdd.canvas.attachBrush(brush);
        evenOdd.canvas.drawPath(evenPath);
        evenOdd.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(winding.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(evenOdd.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(right) > 0).assertTrue();
        expect(windingPath.getBounds().right > 40).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0623 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0624
     * @tc.name testFontDeep0624
     * @tc.desc Verify the measured advance bounds the glyph outline width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0624', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0624 begin');
      await runCase('testFontDeep0624', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const measured: number = font.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const outline: drawing.Path = font.getTextPath('M', 1, 0, 140);
        const width: number = outline.getBounds().right - outline.getBounds().left;
        expect(width <= measured + 1).assertTrue();
        expect(width > 0).assertTrue();
        expect(measured > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0624 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0625
     * @tc.name testFontDeep0625
     * @tc.desc Verify the glyph box height doubles with the font size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0625', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0625 begin');
      await runCase('testFontDeep0625', async () => {
        const small: drawing.Font = new drawing.Font();
        small.setSize(40);
        const large: drawing.Font = new drawing.Font();
        large.setSize(80);
        const smallBox: common2D.Rect[] = small.getBounds(small.textToGlyphs('E'));
        const largeBox: common2D.Rect[] = large.getBounds(large.textToGlyphs('E'));
        const smallHeight: number = smallBox[0].bottom - smallBox[0].top;
        const largeHeight: number = largeBox[0].bottom - largeBox[0].top;
        expect(Math.abs(largeHeight / smallHeight - 2) < 0.2).assertTrue();
        expect(largeHeight > smallHeight).assertTrue();
        expect(largeBox.length).assertEqual(large.textToGlyphs('E').length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0625 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0626
     * @tc.name testFontDeep0626
     * @tc.desc Verify a run of wide letters outlines wider than a run of narrow ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0626', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0626 begin');
      await runCase('testFontDeep0626', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const wide: drawing.Path = font.getTextPath('MM', 2, 0, 140);
        const narrow: drawing.Path = font.getTextPath('ii', 2, 0, 140);
        expect(wide.getBounds().right > narrow.getBounds().right).assertTrue();
        expect(narrow.getLength(false) > 0).assertTrue();
        expect(wide.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0626 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0627
     * @tc.name testFontDeep0627
     * @tc.desc Verify a digit outline has real geometry and a stable box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0627', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0627 begin');
      await runCase('testFontDeep0627', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(88);
        const digit: drawing.Path = font.getTextPath('8', 1, 20, 160);
        const box: common2D.Rect = digit.getBounds();
        expect(digit.isEmpty()).assertFalse();
        expect(box.right > 20).assertTrue();
        expect(box.bottom > box.top).assertTrue();
        expect(digit.getVerbData().length >= 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0627 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0628
     * @tc.name testFontDeep0628
     * @tc.desc Verify a tiny font still produces a non empty outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0628', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0628 begin');
      await runCase('testFontDeep0628', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(8);
        const ids: number[] = font.textToGlyphs('a');
        const outline: drawing.Path = font.createPathForGlyph(ids[0]);
        expect(outline.isEmpty()).assertFalse();
        expect(outline.getLength(false) > 0).assertTrue();
        expect(font.getSize()).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0628 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0629
     * @tc.name testFontDeep0629
     * @tc.desc Verify a very large font produces a tall glyph outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0629', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0629 begin');
      await runCase('testFontDeep0629', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(128);
        const ids: number[] = font.textToGlyphs('T');
        const outline: drawing.Path = font.createPathForGlyph(ids[0]);
        const box: common2D.Rect = outline.getBounds();
        expect(box.bottom - box.top > 60).assertTrue();
        expect(box.right - box.left > 20).assertTrue();
        expect(outline.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0629 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0630
     * @tc.name testFontDeep0630
     * @tc.desc Verify a small font still paints visible ink on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0630', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0630 begin');
      await runCase('testFontDeep0630', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(16);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('o', font, 60, 110);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkAll(buffer) < 2000).assertTrue();
        expect(font.getSize()).assertEqual(16);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0630 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0631
     * @tc.name testFontDeep0631
     * @tc.desc Verify a text blob drawn on a rotated canvas still inks pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0631', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0631 begin');
      await runCase('testFontDeep0631', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.rotate(20, 100, 100);
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Rot', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 30, 130);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(blob.bounds().right > 0).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0631 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0632
     * @tc.name testFontDeep0632
     * @tc.desc Verify a translated text blob moves its ink out of the left band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0632', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0632 begin');
      await runCase('testFontDeep0632', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.translate(90, 0);
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Move', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 10, 140);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 0, 60, CANVAS_SIZE)).assertEqual(0);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(font.getSize()).assertEqual(56);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0632 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0633
     * @tc.name testFontDeep0633
     * @tc.desc Verify a longer text blob inks more pixels than a short one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0633', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0633 begin');
      await runCase('testFontDeep0633', async () => {
        const brief: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const wordy: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const shortBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('I', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const longBlob: drawing.TextBlob = drawing.TextBlob.makeFromString('WIDE', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        brief.canvas.attachBrush(brush);
        brief.canvas.drawTextBlob(shortBlob, 20, 120);
        brief.canvas.detachBrush();
        wordy.canvas.attachBrush(brush);
        wordy.canvas.drawTextBlob(longBlob, 20, 120);
        wordy.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(brief.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(wordy.pixelMap);
        expect(inkAll(right) > inkAll(left)).assertTrue();
        expect(inkAll(left) > 0).assertTrue();
        expect(longBlob.bounds().right > shortBlob.bounds().right).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0633 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0634
     * @tc.name testFontDeep0634
     * @tc.desc Verify the brush alpha level does not change the covered pixel count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0634', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0634 begin');
      await runCase('testFontDeep0634', async () => {
        const opaque: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const faint: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const solidBrush: drawing.Brush = new drawing.Brush();
        solidBrush.setColor(rgba(255, 0, 0, 255));
        const faintBrush: drawing.Brush = new drawing.Brush();
        faintBrush.setColor(rgba(64, 0, 0, 255));
        opaque.canvas.attachBrush(solidBrush);
        opaque.canvas.drawSingleCharacter('A', font, 30, 140);
        opaque.canvas.detachBrush();
        faint.canvas.attachBrush(faintBrush);
        faint.canvas.drawSingleCharacter('A', font, 30, 140);
        faint.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(opaque.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(faint.pixelMap);
        expect(inkAll(right)).assertEqual(707);
        expect(inkAll(left) > 0).assertTrue();
        expect(font.getSize()).assertEqual(64);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0634 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0635
     * @tc.name testFontDeep0635
     * @tc.desc Verify an identity matrix outline draw matches the plain draw.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0635', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0635 begin');
      await runCase('testFontDeep0635', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const mapped: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(76);
        const shape: drawing.Path = font.getTextPath('D', 1, 40, 150);
        const identity: drawing.Path = new drawing.Path();
        identity.addPath(shape, new drawing.Matrix());
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawPath(shape);
        plain.canvas.detachBrush();
        mapped.canvas.attachBrush(brush);
        mapped.canvas.drawPath(identity);
        mapped.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(mapped.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(right)).assertEqual(inkAll(left));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0635 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0636
     * @tc.name testFontDeep0636
     * @tc.desc Verify a dashed pen inks less of the glyph outline than a solid pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0636', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0636 begin');
      await runCase('testFontDeep0636', async () => {
        const solid: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dashed: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(90);
        const outline: drawing.Path = font.getTextPath('S', 1, 40, 160);
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(rgba(255, 0, 255, 0));
        solidPen.setStrokeWidth(4);
        const dashedPen: drawing.Pen = new drawing.Pen();
        dashedPen.setColor(rgba(255, 0, 255, 0));
        dashedPen.setStrokeWidth(4);
        dashedPen.setPathEffect(drawing.PathEffect.createDashPathEffect([12, 12], 0));
        solid.canvas.attachPen(solidPen);
        solid.canvas.drawPath(outline);
        solid.canvas.detachPen();
        dashed.canvas.attachPen(dashedPen);
        dashed.canvas.drawPath(outline);
        dashed.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(solid.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(dashed.pixelMap);
        expect(inkAll(left) > inkAll(right)).assertTrue();
        expect(inkAll(right) > 0).assertTrue();
        expect(outline.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0636 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0637
     * @tc.name testFontDeep0637
     * @tc.desc Verify a blur mask filter still inks the glyph outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0637', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0637 begin');
      await runCase('testFontDeep0637', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(96);
        const outline: drawing.Path = font.getTextPath('Z', 1, 40, 160);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(6);
        pen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 6));
        target.canvas.attachPen(pen);
        target.canvas.drawPath(outline);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(outline.getLength(false) > 0).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0637 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0638
     * @tc.name testFontDeep0638
     * @tc.desc Verify hinting toggles keep the painted ink within a narrow band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0638', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0638 begin');
      await runCase('testFontDeep0638', async () => {
        const hinted: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const hintedFont: drawing.Font = new drawing.Font();
        hintedFont.setSize(58);
        hintedFont.setHinting(drawing.FontHinting.FULL);
        const plainFont: drawing.Font = new drawing.Font();
        plainFont.setSize(58);
        plainFont.setHinting(drawing.FontHinting.NONE);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        hinted.canvas.attachBrush(brush);
        hinted.canvas.drawSingleCharacter('H', hintedFont, 40, 140);
        hinted.canvas.detachBrush();
        plain.canvas.attachBrush(brush);
        plain.canvas.drawSingleCharacter('H', plainFont, 40, 140);
        plain.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(hinted.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(right) > inkAll(left) * 0.6).assertTrue();
        expect(inkAll(right) < inkAll(left) * 1.6).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0638 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0639
     * @tc.name testFontDeep0639
     * @tc.desc Verify an emboldened font paints more ink than the plain text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0639', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0639 begin');
      await runCase('testFontDeep0639', async () => {
        const bold: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const boldFont: drawing.Font = new drawing.Font();
        boldFont.setSize(64);
        boldFont.enableEmbolden(true);
        const plainFont: drawing.Font = new drawing.Font();
        plainFont.setSize(64);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        bold.canvas.attachBrush(brush);
        bold.canvas.drawSingleCharacter('L', boldFont, 40, 140);
        bold.canvas.detachBrush();
        plain.canvas.attachBrush(brush);
        plain.canvas.drawSingleCharacter('L', plainFont, 40, 140);
        plain.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(bold.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(right) > 0).assertTrue();
        expect(boldFont.isEmbolden()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0639 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0640
     * @tc.name testFontDeep0640
     * @tc.desc Verify a widened font paints ink further to the right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0640', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0640 begin');
      await runCase('testFontDeep0640', async () => {
        const wide: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const wideFont: drawing.Font = new drawing.Font();
        wideFont.setSize(40);
        wideFont.setScaleX(2);
        const plainFont: drawing.Font = new drawing.Font();
        plainFont.setSize(40);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        wide.canvas.attachBrush(brush);
        wide.canvas.drawSingleCharacter('I', wideFont, 20, 130);
        wide.canvas.detachBrush();
        plain.canvas.attachBrush(brush);
        plain.canvas.drawSingleCharacter('I', plainFont, 20, 130);
        plain.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(wide.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkRect(left, 60, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(Math.abs(wideFont.getScaleX() - 2) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0640 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0641
     * @tc.name testFontDeep0641
     * @tc.desc Verify a skewed font still paints ink in the expected band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0641', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0641 begin');
      await runCase('testFontDeep0641', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        font.setSkewX(0.2);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('N', font, 40, 140);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 160, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(Math.abs(font.getSkewX() - 0.2) < 0.01).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0641 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0642
     * @tc.name testFontDeep0642
     * @tc.desc Verify a merged outline of two letters spans a wider box than one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0642', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0642 begin');
      await runCase('testFontDeep0642', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const one: drawing.Path = font.getTextPath('C', 1, 0, 140);
        const two: drawing.Path = font.getTextPath('C', 1, 100, 140);
        const merged: drawing.Path = new drawing.Path();
        merged.addPath(one, null);
        merged.addPath(two, null);
        const oneWidth: number = one.getBounds().right - one.getBounds().left;
        const mergedWidth: number = merged.getBounds().right - merged.getBounds().left;
        expect(mergedWidth > oneWidth).assertTrue();
        expect(oneWidth > 0).assertTrue();
        expect(merged.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0642 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0643
     * @tc.name testFontDeep0643
     * @tc.desc Verify a full text pipeline measures outlines transforms and paints.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0643', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0643 begin');
      await runCase('testFontDeep0643', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(58);
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        const measured: number = font.measureText('Pipe', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const outline: drawing.Path = font.getTextPath('Pipe', 4, 10, 150);
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(1.4, 1.4, 0, 0);
        outline.transform(zoom);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.clipPath(clip);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(outline);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(measured > 0).assertTrue();
        expect(outline.getBounds().right > 10).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0643 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0644
     * @tc.name testFontDeep0644
     * @tc.desc Verify a zero glyph limit is rejected as a parameter error.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0644', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0644 begin');
      await runCase('testFontDeep0644', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(42);
        expect(throwsOn(() => font.textToGlyphs('ABC', 0))).assertTrue();
        expect(font.countText('ABC')).assertEqual(3);
        expect(font.measureText('ABC', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0644 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0645
     * @tc.name testFontDeep0645
     * @tc.desc Verify two glyph conversions of the same word stay identical.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0645', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0645 begin');
      await runCase('testFontDeep0645', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(46);
        const first: number[] = font.textToGlyphs('Stable');
        const second: number[] = font.textToGlyphs('Stable');
        expect(second.length).assertEqual(first.length);
        expect(second[0]).assertEqual(first[0]);
        expect(font.getWidths(second)[0]).assertEqual(font.getWidths(first)[0]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0645 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0646
     * @tc.name testFontDeep0646
     * @tc.desc Verify three glyph boxes keep the glyph order and stay non degenerate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0646', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0646 begin');
      await runCase('testFontDeep0646', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(58);
        const ids: number[] = font.textToGlyphs('ILW');
        const boxes: common2D.Rect[] = font.getBounds(ids);
        expect(boxes.length).assertEqual(3);
        expect(boxes[2].right > boxes[1].right).assertTrue();
        expect(boxes[0].bottom > boxes[0].top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0646 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0647
     * @tc.name testFontDeep0647
     * @tc.desc Verify a period outline is far shorter than a capital ring outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0647', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0647 begin');
      await runCase('testFontDeep0647', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(90);
        const dot: drawing.Path = font.getTextPath('.', 1, 0, 150);
        const ring: drawing.Path = font.getTextPath('O', 1, 0, 150);
        expect(dot.getLength(false) > 0).assertTrue();
        expect(ring.getLength(false) > dot.getLength(false)).assertTrue();
        expect(ring.getBounds().top < dot.getBounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0647 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0648
     * @tc.name testFontDeep0648
     * @tc.desc Verify two identical text draws produce the same frame bytes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0648', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0648 begin');
      await runCase('testFontDeep0648', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(52);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        first.canvas.attachBrush(brush);
        first.canvas.drawSingleCharacter('D', font, 40, 140);
        first.canvas.detachBrush();
        second.canvas.attachBrush(brush);
        second.canvas.drawSingleCharacter('D', font, 40, 140);
        second.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(right)).assertEqual(inkAll(left));
        expect(inkAll(left) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0648 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0649
     * @tc.name testFontDeep0649
     * @tc.desc Verify the last assigned size wins over earlier assignments.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0649', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0649 begin');
      await runCase('testFontDeep0649', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(12);
        font.setSize(48);
        font.setSize(30);
        const narrow: number = font.measureText('Size', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setSize(60);
        const wide: number = font.measureText('Size', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(font.getSize()).assertEqual(60);
        expect(Math.abs(wide / narrow - 2) < 0.15).assertTrue();
        expect(narrow > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0649 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0650
     * @tc.name testFontDeep0650
     * @tc.desc Verify two sizes keep the metrics sign pattern and grow downward.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0650', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0650 begin');
      await runCase('testFontDeep0650', async () => {
        const small: drawing.Font = new drawing.Font();
        small.setSize(30);
        const large: drawing.Font = new drawing.Font();
        large.setSize(90);
        expect(small.getMetrics().ascent < 0).assertTrue();
        expect(large.getMetrics().descent > 0).assertTrue();
        expect(large.getMetrics().bottom > small.getMetrics().bottom).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0650 end');
    });

  });
}
