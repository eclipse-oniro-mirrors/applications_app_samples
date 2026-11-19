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
import { blendColorFilter, blurMaskFilter, colorShader } from '../../../main/ets/drawing/DrawingEffects';
import { dashPathEffect, lumaColorFilter } from '../../../main/ets/drawing/DrawingEffects';
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

export default function penApiDeep2Test() {
  describe('PenApiDeep2Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0801
     * @tc.name testPenDeep0801
     * @tc.desc Verify a half alpha stroke writes the matching alpha channel value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0801', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0801 begin');
      await runCase('testPenDeep0801', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setAntiAlias(false);
        pen.setAlpha(128);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getAlpha()).assertEqual(128);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(128);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0801 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0802
     * @tc.name testPenDeep0802
     * @tc.desc Verify a zero alpha stroke paints nothing at all.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0802', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0802 begin');
      await runCase('testPenDeep0802', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(24);
        pen.setAlpha(0);
        target.canvas.attachPen(pen);
        target.canvas.drawRect(ltrb(40, 40, 160, 160));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getAlpha()).assertEqual(0);
        expect(inkAll(buffer)).assertEqual(0);
        expect(inkRect(buffer, 40, 40, 160, 160)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0802 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0803
     * @tc.name testPenDeep0803
     * @tc.desc Verify a lower alpha leaves a weaker alpha channel behind.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0803', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0803 begin');
      await runCase('testPenDeep0803', async () => {
        const faintTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const strongTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const faintPen: drawing.Pen = new drawing.Pen();
        faintPen.setColor(rgba(255, 0, 0, 255));
        faintPen.setStrokeWidth(20);
        faintPen.setAlpha(64);
        faintTarget.canvas.attachPen(faintPen);
        faintTarget.canvas.drawLine(20, 100, 180, 100);
        faintTarget.canvas.detachPen();
        const strongPen: drawing.Pen = new drawing.Pen();
        strongPen.setColor(rgba(255, 0, 0, 255));
        strongPen.setStrokeWidth(20);
        strongPen.setAlpha(192);
        strongTarget.canvas.attachPen(strongPen);
        strongTarget.canvas.drawLine(20, 100, 180, 100);
        strongTarget.canvas.detachPen();
        const faintBuffer: ArrayBuffer = await readPixelBuffer(faintTarget.pixelMap);
        const strongBuffer: ArrayBuffer = await readPixelBuffer(strongTarget.pixelMap);
        expect(chanAt(faintBuffer, 100, 100, 3)).assertEqual(64);
        expect(chanAt(strongBuffer, 100, 100, 3)).assertEqual(192);
        expect(chanAt(strongBuffer, 100, 100, 3) > chanAt(faintBuffer, 100, 100, 3)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0803 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0804
     * @tc.name testPenDeep0804
     * @tc.desc Verify the alpha value changes no pixel coverage count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0804', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0804 begin');
      await runCase('testPenDeep0804', async () => {
        const opaqueTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const fadedTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const opaquePen: drawing.Pen = new drawing.Pen();
        opaquePen.setColor(rgba(255, 0, 0, 255));
        opaquePen.setStrokeWidth(20);
        opaqueTarget.canvas.attachPen(opaquePen);
        opaqueTarget.canvas.drawLine(20, 100, 180, 100);
        opaqueTarget.canvas.detachPen();
        const fadedPen: drawing.Pen = new drawing.Pen();
        fadedPen.setColor(rgba(255, 0, 0, 255));
        fadedPen.setStrokeWidth(20);
        fadedPen.setAlpha(1);
        fadedTarget.canvas.attachPen(fadedPen);
        fadedTarget.canvas.drawLine(20, 100, 180, 100);
        fadedTarget.canvas.detachPen();
        const opaqueBuffer: ArrayBuffer = await readPixelBuffer(opaqueTarget.pixelMap);
        const fadedBuffer: ArrayBuffer = await readPixelBuffer(fadedTarget.pixelMap);
        expect(inkAll(fadedBuffer)).assertEqual(inkAll(opaqueBuffer));
        expect(chanAt(fadedBuffer, 100, 100, 3)).assertEqual(1);
        expect(inkAll(opaqueBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0804 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0805
     * @tc.name testPenDeep0805
     * @tc.desc Verify the four argument colour setter fills every channel of the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0805', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0805 begin');
      await runCase('testPenDeep0805', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(200, 17, 34, 51);
        const color: common2D.Color = pen.getColor();
        expect(color.alpha).assertEqual(200);
        expect(color.red).assertEqual(17);
        expect(color.green).assertEqual(34);
        expect(color.blue).assertEqual(51);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0805 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0806
     * @tc.name testPenDeep0806
     * @tc.desc Verify the packed colour setter round trips through the hex getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0806', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0806 begin');
      await runCase('testPenDeep0806', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF3366AA);
        const color: common2D.Color = pen.getColor();
        expect(pen.getHexColor()).assertEqual(0xFF3366AA);
        expect(color.red).assertEqual(0x33);
        expect(color.blue).assertEqual(0xAA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0806 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0807
     * @tc.name testPenDeep0807
     * @tc.desc Verify a later alpha setter overrides the alpha packed in the colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0807', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0807 begin');
      await runCase('testPenDeep0807', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0x40FF0000);
        pen.setAlpha(0xCC);
        expect(pen.getAlpha()).assertEqual(0xCC);
        expect(pen.getColor().red).assertEqual(0xFF);
        expect(pen.getHexColor()).assertEqual(0xCCFF0000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0807 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0808
     * @tc.name testPenDeep0808
     * @tc.desc Verify a later colour setter overrides the previous alpha setter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0808', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0808 begin');
      await runCase('testPenDeep0808', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setAlpha(30);
        pen.setColor(0x80AABBCC);
        expect(pen.getAlpha()).assertEqual(0x80);
        expect(pen.getHexColor()).assertEqual(0x80AABBCC);
        expect(pen.getColor().blue).assertEqual(0xCC);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0808 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0809
     * @tc.name testPenDeep0809
     * @tc.desc Verify two translucent strokes over one spot stack to a darker alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0809', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0809 begin');
      await runCase('testPenDeep0809', async () => {
        const onceTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const twiceTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setAntiAlias(false);
        pen.setAlpha(100);
        onceTarget.canvas.attachPen(pen);
        onceTarget.canvas.drawLine(20, 100, 180, 100);
        onceTarget.canvas.detachPen();
        twiceTarget.canvas.attachPen(pen);
        twiceTarget.canvas.drawLine(20, 100, 180, 100);
        twiceTarget.canvas.drawLine(20, 100, 180, 100);
        twiceTarget.canvas.detachPen();
        const onceBuffer: ArrayBuffer = await readPixelBuffer(onceTarget.pixelMap);
        const twiceBuffer: ArrayBuffer = await readPixelBuffer(twiceTarget.pixelMap);
        expect(chanAt(onceBuffer, 100, 100, 3)).assertEqual(100);
        expect(chanAt(twiceBuffer, 100, 100, 3) > chanAt(onceBuffer, 100, 100, 3)).assertTrue();
        expect(chanAt(twiceBuffer, 100, 100, 3) < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0809 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0810
     * @tc.name testPenDeep0810
     * @tc.desc Verify a fresh pen reports full alpha and miter joins.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPenDeep0810', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0810 begin');
      await runCase('testPenDeep0810', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        expect(pen.getAlpha()).assertEqual(255);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(pen.isAntiAlias()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0810 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0811
     * @tc.name testPenDeep0811
     * @tc.desc Verify alpha can be driven to zero and restored to full strength.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0811', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0811 begin');
      await runCase('testPenDeep0811', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setAlpha(0);
        pen.setAlpha(255);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getAlpha()).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0811 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0812
     * @tc.name testPenDeep0812
     * @tc.desc Verify the float colour setter keeps its channels in the float getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0812', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0812 begin');
      await runCase('testPenDeep0812', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        const color4f: common2D.Color4f = { alpha: 0.8, red: 0.4, green: 0.6, blue: 0.9 };
        pen.setColor4f(color4f, null);
        const readBack: common2D.Color4f = pen.getColor4f();
        expect(Math.abs(readBack.alpha - 0.8) < 0.01).assertTrue();
        expect(Math.abs(readBack.red - 0.4) < 0.01).assertTrue();
        expect(pen.getAlpha()).assertEqual(204);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0812 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0813
     * @tc.name testPenDeep0813
     * @tc.desc Verify the source blend mode replaces the backdrop under the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0813', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0813 begin');
      await runCase('testPenDeep0813', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.SRC);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 20, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0813 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0814
     * @tc.name testPenDeep0814
     * @tc.desc Verify the destination blend mode leaves the backdrop untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0814', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0814 begin');
      await runCase('testPenDeep0814', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.DST);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0814 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0815
     * @tc.name testPenDeep0815
     * @tc.desc Verify multiplying blue over red darkens the overlap to black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0815', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0815 begin');
      await runCase('testPenDeep0815', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.MULTIPLY);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0815 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0816
     * @tc.name testPenDeep0816
     * @tc.desc Verify screening blue over red produces magenta.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0816', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0816 begin');
      await runCase('testPenDeep0816', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.SCREEN);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0816 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0817
     * @tc.name testPenDeep0817
     * @tc.desc Verify the plus blend saturates both channels on the overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0817', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0817 begin');
      await runCase('testPenDeep0817', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFF200040, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF100020);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.PLUS);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0x30);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(0x60);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0817 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0818
     * @tc.name testPenDeep0818
     * @tc.desc Verify the xor blend cancels two opaque layers to transparency.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0818', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0818 begin');
      await runCase('testPenDeep0818', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.XOR);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(buffer, 100, 20, 3)).assertEqual(255);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0818 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0819
     * @tc.name testPenDeep0819
     * @tc.desc Verify the clear blend erases the whole stroke band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0819', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0819 begin');
      await runCase('testPenDeep0819', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.CLEAR);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 40, 90, 160, 110)).assertEqual(0);
        expect(chanAt(buffer, 100, 20, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0819 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0820
     * @tc.name testPenDeep0820
     * @tc.desc Verify destination over keeps every pixel of the opaque backdrop.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0820', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0820 begin');
      await runCase('testPenDeep0820', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setBlendMode(drawing.BlendMode.DST_OVER);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0820 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0821
     * @tc.name testPenDeep0821
     * @tc.desc Verify an explicit source over pen paints like the default pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0821', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0821 begin');
      await runCase('testPenDeep0821', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const explicitTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        plainTarget.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        explicitTarget.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(0xFF0000FF);
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const explicitPen: drawing.Pen = new drawing.Pen();
        explicitPen.setColor(0xFF0000FF);
        explicitPen.setStrokeWidth(20);
        explicitPen.setBlendMode(drawing.BlendMode.SRC_OVER);
        explicitTarget.canvas.attachPen(explicitPen);
        explicitTarget.canvas.drawLine(20, 100, 180, 100);
        explicitTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const explicitBuffer: ArrayBuffer = await readPixelBuffer(explicitTarget.pixelMap);
        expect(gapBytes(plainBuffer, explicitBuffer)).assertEqual(0);
        expect(chanAt(plainBuffer, 100, 100, 2)).assertEqual(255);
        expect(inkAll(plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0821 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0822
     * @tc.name testPenDeep0822
     * @tc.desc Verify the blend mode touches only the pixels covered by the pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0822', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0822 begin');
      await runCase('testPenDeep0822', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFF00AA00, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(16);
        pen.setBlendMode(drawing.BlendMode.SRC);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 10, 10, 1)).assertEqual(0xAA);
        expect(chanAt(buffer, 10, 10, 2)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0822 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0823
     * @tc.name testPenDeep0823
     * @tc.desc Verify two canvases with different blend modes disagree on the overlap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0823', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0823 begin');
      await runCase('testPenDeep0823', async () => {
        const srcTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dstTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        srcTarget.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        dstTarget.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const srcPen: drawing.Pen = new drawing.Pen();
        srcPen.setColor(0xFF0000FF);
        srcPen.setStrokeWidth(20);
        srcPen.setBlendMode(drawing.BlendMode.SRC);
        srcTarget.canvas.attachPen(srcPen);
        srcTarget.canvas.drawLine(20, 100, 180, 100);
        srcTarget.canvas.detachPen();
        const dstPen: drawing.Pen = new drawing.Pen();
        dstPen.setColor(0xFF0000FF);
        dstPen.setStrokeWidth(20);
        dstPen.setBlendMode(drawing.BlendMode.DST);
        dstTarget.canvas.attachPen(dstPen);
        dstTarget.canvas.drawLine(20, 100, 180, 100);
        dstTarget.canvas.detachPen();
        const srcBuffer: ArrayBuffer = await readPixelBuffer(srcTarget.pixelMap);
        const dstBuffer: ArrayBuffer = await readPixelBuffer(dstTarget.pixelMap);
        expect(gapBytes(srcBuffer, dstBuffer) > 0).assertTrue();
        expect(chanAt(srcBuffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(dstBuffer, 100, 100, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0823 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0824
     * @tc.name testPenDeep0824
     * @tc.desc Verify dithering a solid stroke changes no pixel of the result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0824', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0824 begin');
      await runCase('testPenDeep0824', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const ditherTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(0xFF3366AA);
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const ditherPen: drawing.Pen = new drawing.Pen();
        ditherPen.setColor(0xFF3366AA);
        ditherPen.setStrokeWidth(20);
        ditherPen.setDither(true);
        ditherTarget.canvas.attachPen(ditherPen);
        ditherTarget.canvas.drawLine(20, 100, 180, 100);
        ditherTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const ditherBuffer: ArrayBuffer = await readPixelBuffer(ditherTarget.pixelMap);
        expect(gapBytes(plainBuffer, ditherBuffer)).assertEqual(0);
        expect(inkAll(plainBuffer)).assertEqual(inkAll(ditherBuffer));
        expect(chanAt(ditherBuffer, 100, 100, 2)).assertEqual(0xAA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0824 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0825
     * @tc.name testPenDeep0825
     * @tc.desc Verify the dither flag leaves width alpha and colour alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0825', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0825 begin');
      await runCase('testPenDeep0825', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF112233);
        pen.setStrokeWidth(12);
        pen.setDither(true);
        expect(pen.getWidth()).assertEqual(12);
        expect(pen.getAlpha()).assertEqual(255);
        expect(pen.getHexColor()).assertEqual(0xFF112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0825 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0826
     * @tc.name testPenDeep0826
     * @tc.desc Verify switching dithering on and off again restores the plain stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0826', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0826 begin');
      await runCase('testPenDeep0826', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setDither(true);
        pen.setDither(false);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const roundTrip: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        roundTrip.canvas.attachPen(pen);
        roundTrip.canvas.drawLine(20, 100, 180, 100);
        roundTrip.canvas.detachPen();
        const left: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(roundTrip.pixelMap);
        expect(gapBytes(left, right)).assertEqual(0);
        expect(inkAll(left) > 0).assertTrue();
        expect(chanAt(left, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0826 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0827
     * @tc.name testPenDeep0827
     * @tc.desc Verify dithering a translucent stroke keeps the same alpha byte.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0827', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0827 begin');
      await runCase('testPenDeep0827', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const ditherTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainPen.setAlpha(80);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const ditherPen: drawing.Pen = new drawing.Pen();
        ditherPen.setColor(rgba(255, 0, 0, 255));
        ditherPen.setStrokeWidth(20);
        ditherPen.setAlpha(80);
        ditherPen.setDither(true);
        ditherTarget.canvas.attachPen(ditherPen);
        ditherTarget.canvas.drawLine(20, 100, 180, 100);
        ditherTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const ditherBuffer: ArrayBuffer = await readPixelBuffer(ditherTarget.pixelMap);
        expect(chanAt(plainBuffer, 100, 100, 3)).assertEqual(80);
        expect(chanAt(ditherBuffer, 100, 100, 3)).assertEqual(80);
        expect(inkAll(plainBuffer)).assertEqual(inkAll(ditherBuffer));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0827 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0828
     * @tc.name testPenDeep0828
     * @tc.desc Verify the dash effect removes ink compared with a solid stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0828', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0828 begin');
      await runCase('testPenDeep0828', async () => {
        const solidTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dashTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(rgba(255, 0, 0, 255));
        solidPen.setStrokeWidth(10);
        solidTarget.canvas.attachPen(solidPen);
        solidTarget.canvas.drawLine(10, 100, 190, 100);
        solidTarget.canvas.detachPen();
        const dashPen: drawing.Pen = new drawing.Pen();
        dashPen.setColor(rgba(255, 0, 0, 255));
        dashPen.setStrokeWidth(10);
        dashPen.setPathEffect(dashPathEffect());
        dashTarget.canvas.attachPen(dashPen);
        dashTarget.canvas.drawLine(10, 100, 190, 100);
        dashTarget.canvas.detachPen();
        const solidBuffer: ArrayBuffer = await readPixelBuffer(solidTarget.pixelMap);
        const dashBuffer: ArrayBuffer = await readPixelBuffer(dashTarget.pixelMap);
        expect(inkAll(dashBuffer) < inkAll(solidBuffer)).assertTrue();
        expect(inkAll(dashBuffer) > inkAll(solidBuffer) / 3).assertTrue();
        expect(inkAll(solidBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0828 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0829
     * @tc.name testPenDeep0829
     * @tc.desc Verify an even on off dash interval halves the painted band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0829', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0829 begin');
      await runCase('testPenDeep0829', async () => {
        const solidTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dashTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const intervals: number[] = [10, 10];
        const effect: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(intervals, 0);
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(rgba(255, 0, 0, 255));
        solidPen.setStrokeWidth(18);
        solidTarget.canvas.attachPen(solidPen);
        solidTarget.canvas.drawLine(10, 100, 190, 100);
        solidTarget.canvas.detachPen();
        const dashPen: drawing.Pen = new drawing.Pen();
        dashPen.setColor(rgba(255, 0, 0, 255));
        dashPen.setStrokeWidth(18);
        dashPen.setPathEffect(effect);
        dashTarget.canvas.attachPen(dashPen);
        dashTarget.canvas.drawLine(10, 100, 190, 100);
        dashTarget.canvas.detachPen();
        const solidBuffer: ArrayBuffer = await readPixelBuffer(solidTarget.pixelMap);
        const dashBuffer: ArrayBuffer = await readPixelBuffer(dashTarget.pixelMap);
        const ratio: number = inkAll(dashBuffer) / inkAll(solidBuffer);
        expect(ratio > 0.35).assertTrue();
        expect(ratio < 0.65).assertTrue();
        expect(inkAll(dashBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0829 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0830
     * @tc.name testPenDeep0830
     * @tc.desc Verify the dash phase shifts where the gaps land on the line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0830', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0830 begin');
      await runCase('testPenDeep0830', async () => {
        const zeroTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shiftedTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const zeroIntervals: number[] = [10, 10];
        const zeroEffect: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(zeroIntervals, 0);
        const shiftedEffect: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(zeroIntervals, 10);
        const zeroPen: drawing.Pen = new drawing.Pen();
        zeroPen.setColor(rgba(255, 0, 0, 255));
        zeroPen.setStrokeWidth(18);
        zeroPen.setPathEffect(zeroEffect);
        zeroTarget.canvas.attachPen(zeroPen);
        zeroTarget.canvas.drawLine(10, 100, 190, 100);
        zeroTarget.canvas.detachPen();
        const shiftedPen: drawing.Pen = new drawing.Pen();
        shiftedPen.setColor(rgba(255, 0, 0, 255));
        shiftedPen.setStrokeWidth(18);
        shiftedPen.setPathEffect(shiftedEffect);
        shiftedTarget.canvas.attachPen(shiftedPen);
        shiftedTarget.canvas.drawLine(10, 100, 190, 100);
        shiftedTarget.canvas.detachPen();
        const zeroBuffer: ArrayBuffer = await readPixelBuffer(zeroTarget.pixelMap);
        const shiftedBuffer: ArrayBuffer = await readPixelBuffer(shiftedTarget.pixelMap);
        expect(gapBytes(zeroBuffer, shiftedBuffer) > 0).assertTrue();
        expect(inkAll(zeroBuffer) > 0).assertTrue();
        expect(inkAll(shiftedBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0830 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0831
     * @tc.name testPenDeep0831
     * @tc.desc Verify a long on interval paints more than a short on interval.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0831', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0831 begin');
      await runCase('testPenDeep0831', async () => {
        const denseTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const sparseTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const denseIntervals: number[] = [30, 10];
        const sparseIntervals: number[] = [10, 30];
        const densePen: drawing.Pen = new drawing.Pen();
        densePen.setColor(rgba(255, 0, 0, 255));
        densePen.setStrokeWidth(16);
        densePen.setPathEffect(drawing.PathEffect.createDashPathEffect(denseIntervals, 0));
        denseTarget.canvas.attachPen(densePen);
        denseTarget.canvas.drawLine(10, 100, 190, 100);
        denseTarget.canvas.detachPen();
        const sparsePen: drawing.Pen = new drawing.Pen();
        sparsePen.setColor(rgba(255, 0, 0, 255));
        sparsePen.setStrokeWidth(16);
        sparsePen.setPathEffect(drawing.PathEffect.createDashPathEffect(sparseIntervals, 0));
        sparseTarget.canvas.attachPen(sparsePen);
        sparseTarget.canvas.drawLine(10, 100, 190, 100);
        sparseTarget.canvas.detachPen();
        const denseBuffer: ArrayBuffer = await readPixelBuffer(denseTarget.pixelMap);
        const sparseBuffer: ArrayBuffer = await readPixelBuffer(sparseTarget.pixelMap);
        expect(inkAll(denseBuffer) > inkAll(sparseBuffer) * 2).assertTrue();
        expect(inkAll(sparseBuffer) > 0).assertTrue();
        expect(inkAll(denseBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0831 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0832
     * @tc.name testPenDeep0832
     * @tc.desc Verify the dash effect breaks the ring of a stroked rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0832', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0832 begin');
      await runCase('testPenDeep0832', async () => {
        const solidTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dashTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const intervals: number[] = [8, 8];
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(rgba(255, 0, 0, 255));
        solidPen.setStrokeWidth(10);
        solidTarget.canvas.attachPen(solidPen);
        solidTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        solidTarget.canvas.detachPen();
        const dashPen: drawing.Pen = new drawing.Pen();
        dashPen.setColor(rgba(255, 0, 0, 255));
        dashPen.setStrokeWidth(10);
        dashPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 0));
        dashTarget.canvas.attachPen(dashPen);
        dashTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        dashTarget.canvas.detachPen();
        const solidBuffer: ArrayBuffer = await readPixelBuffer(solidTarget.pixelMap);
        const dashBuffer: ArrayBuffer = await readPixelBuffer(dashTarget.pixelMap);
        expect(inkAll(dashBuffer) < inkAll(solidBuffer)).assertTrue();
        expect(inkRect(dashBuffer, 80, 80, 120, 120)).assertEqual(0);
        expect(inkAll(dashBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0832 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0833
     * @tc.name testPenDeep0833
     * @tc.desc Verify the corner effect cuts the spike off a right angle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0833', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0833 begin');
      await runCase('testPenDeep0833', async () => {
        const sharpTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 100);
        shape.lineTo(100, 40);
        shape.lineTo(160, 100);
        const sharpPen: drawing.Pen = new drawing.Pen();
        sharpPen.setColor(rgba(255, 0, 0, 255));
        sharpPen.setStrokeWidth(16);
        sharpPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        sharpTarget.canvas.attachPen(sharpPen);
        sharpTarget.canvas.drawPath(shape);
        sharpTarget.canvas.detachPen();
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 0, 0, 255));
        roundPen.setStrokeWidth(16);
        roundPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        roundPen.setPathEffect(drawing.PathEffect.createCornerPathEffect(10));
        roundTarget.canvas.attachPen(roundPen);
        roundTarget.canvas.drawPath(shape);
        roundTarget.canvas.detachPen();
        const sharpBuffer: ArrayBuffer = await readPixelBuffer(sharpTarget.pixelMap);
        const roundBuffer: ArrayBuffer = await readPixelBuffer(roundTarget.pixelMap);
        expect(inkAll(roundBuffer) < inkAll(sharpBuffer)).assertTrue();
        expect(inkRect(roundBuffer, 92, 40, 108, 48)).assertEqual(128);
        expect(inkAll(roundBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0833 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0834
     * @tc.name testPenDeep0834
     * @tc.desc Verify round caps fatten every dash segment compared with flat caps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0834', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0834 begin');
      await runCase('testPenDeep0834', async () => {
        const flatTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const roundTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const intervals: number[] = [10, 10];
        const flatPen: drawing.Pen = new drawing.Pen();
        flatPen.setColor(rgba(255, 0, 0, 255));
        flatPen.setStrokeWidth(16);
        flatPen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        flatPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 0));
        flatTarget.canvas.attachPen(flatPen);
        flatTarget.canvas.drawLine(10, 100, 190, 100);
        flatTarget.canvas.detachPen();
        const roundPen: drawing.Pen = new drawing.Pen();
        roundPen.setColor(rgba(255, 0, 0, 255));
        roundPen.setStrokeWidth(16);
        roundPen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        roundPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 0));
        roundTarget.canvas.attachPen(roundPen);
        roundTarget.canvas.drawLine(10, 100, 190, 100);
        roundTarget.canvas.detachPen();
        const flatBuffer: ArrayBuffer = await readPixelBuffer(flatTarget.pixelMap);
        const roundBuffer: ArrayBuffer = await readPixelBuffer(roundTarget.pixelMap);
        expect(inkAll(roundBuffer) > inkAll(flatBuffer)).assertTrue();
        expect(inkAll(flatBuffer) > 0).assertTrue();
        expect(roundPen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0834 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0835
     * @tc.name testPenDeep0835
     * @tc.desc Verify clearing the path effect restores the solid stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0835', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0835 begin');
      await runCase('testPenDeep0835', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clearedTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(16);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(10, 100, 190, 100);
        plainTarget.canvas.detachPen();
        const clearedPen: drawing.Pen = new drawing.Pen();
        clearedPen.setColor(rgba(255, 0, 0, 255));
        clearedPen.setStrokeWidth(16);
        clearedPen.setPathEffect(dashPathEffect());
        clearedPen.setPathEffect(null);
        clearedTarget.canvas.attachPen(clearedPen);
        clearedTarget.canvas.drawLine(10, 100, 190, 100);
        clearedTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const clearedBuffer: ArrayBuffer = await readPixelBuffer(clearedTarget.pixelMap);
        expect(gapBytes(plainBuffer, clearedBuffer)).assertEqual(0);
        expect(inkAll(plainBuffer) > 0).assertTrue();
        expect(chanAt(plainBuffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0835 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0836
     * @tc.name testPenDeep0836
     * @tc.desc Verify the second path effect replaces the first one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0836', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0836 begin');
      await runCase('testPenDeep0836', async () => {
        const firstTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const secondTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const denseIntervals: number[] = [30, 10];
        const sparseIntervals: number[] = [10, 30];
        const firstPen: drawing.Pen = new drawing.Pen();
        firstPen.setColor(rgba(255, 0, 0, 255));
        firstPen.setStrokeWidth(16);
        firstPen.setPathEffect(drawing.PathEffect.createDashPathEffect(denseIntervals, 0));
        firstTarget.canvas.attachPen(firstPen);
        firstTarget.canvas.drawLine(10, 100, 190, 100);
        firstTarget.canvas.detachPen();
        const secondPen: drawing.Pen = new drawing.Pen();
        secondPen.setColor(rgba(255, 0, 0, 255));
        secondPen.setStrokeWidth(16);
        secondPen.setPathEffect(drawing.PathEffect.createDashPathEffect(denseIntervals, 0));
        secondPen.setPathEffect(drawing.PathEffect.createDashPathEffect(sparseIntervals, 0));
        secondTarget.canvas.attachPen(secondPen);
        secondTarget.canvas.drawLine(10, 100, 190, 100);
        secondTarget.canvas.detachPen();
        const firstBuffer: ArrayBuffer = await readPixelBuffer(firstTarget.pixelMap);
        const secondBuffer: ArrayBuffer = await readPixelBuffer(secondTarget.pixelMap);
        expect(inkAll(secondBuffer) < inkAll(firstBuffer)).assertTrue();
        expect(inkAll(secondBuffer) > 0).assertTrue();
        expect(gapBytes(firstBuffer, secondBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0836 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0837
     * @tc.name testPenDeep0837
     * @tc.desc Verify two dash phases keep comparable ink totals but differ locally.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0837', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0837 begin');
      await runCase('testPenDeep0837', async () => {
        const startTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const midTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const intervals: number[] = [12, 12];
        const startPen: drawing.Pen = new drawing.Pen();
        startPen.setColor(rgba(255, 0, 0, 255));
        startPen.setStrokeWidth(14);
        startPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 0));
        startTarget.canvas.attachPen(startPen);
        startTarget.canvas.drawLine(10, 100, 190, 100);
        startTarget.canvas.detachPen();
        const midPen: drawing.Pen = new drawing.Pen();
        midPen.setColor(rgba(255, 0, 0, 255));
        midPen.setStrokeWidth(14);
        midPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 12));
        midTarget.canvas.attachPen(midPen);
        midTarget.canvas.drawLine(10, 100, 190, 100);
        midTarget.canvas.detachPen();
        const startBuffer: ArrayBuffer = await readPixelBuffer(startTarget.pixelMap);
        const midBuffer: ArrayBuffer = await readPixelBuffer(midTarget.pixelMap);
        expect(Math.abs(inkAll(startBuffer) - inkAll(midBuffer)) < inkAll(startBuffer) * 0.15).assertTrue();
        expect(gapBytes(startBuffer, midBuffer) > 0).assertTrue();
        expect(inkAll(startBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0837 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0838
     * @tc.name testPenDeep0838
     * @tc.desc Verify a blur mask filter spreads the stroke beyond its sharp edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0838', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0838 begin');
      await runCase('testPenDeep0838', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blurTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const blurPen: drawing.Pen = new drawing.Pen();
        blurPen.setColor(rgba(255, 0, 0, 255));
        blurPen.setStrokeWidth(20);
        blurPen.setMaskFilter(blurMaskFilter(5));
        blurTarget.canvas.attachPen(blurPen);
        blurTarget.canvas.drawLine(20, 100, 180, 100);
        blurTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const blurBuffer: ArrayBuffer = await readPixelBuffer(blurTarget.pixelMap);
        expect(inkAll(blurBuffer) > inkAll(plainBuffer)).assertTrue();
        expect(chanAt(blurBuffer, 100, 100, 3)).assertEqual(250);
        expect(inkAll(plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0838 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0839
     * @tc.name testPenDeep0839
     * @tc.desc Verify a larger blur sigma widens the painted halo.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0839', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0839 begin');
      await runCase('testPenDeep0839', async () => {
        const smallTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const bigTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const smallPen: drawing.Pen = new drawing.Pen();
        smallPen.setColor(rgba(255, 0, 0, 255));
        smallPen.setStrokeWidth(20);
        smallPen.setMaskFilter(blurMaskFilter(2));
        smallTarget.canvas.attachPen(smallPen);
        smallTarget.canvas.drawLine(20, 100, 180, 100);
        smallTarget.canvas.detachPen();
        const bigPen: drawing.Pen = new drawing.Pen();
        bigPen.setColor(rgba(255, 0, 0, 255));
        bigPen.setStrokeWidth(20);
        bigPen.setMaskFilter(blurMaskFilter(8));
        bigTarget.canvas.attachPen(bigPen);
        bigTarget.canvas.drawLine(20, 100, 180, 100);
        bigTarget.canvas.detachPen();
        const smallBuffer: ArrayBuffer = await readPixelBuffer(smallTarget.pixelMap);
        const bigBuffer: ArrayBuffer = await readPixelBuffer(bigTarget.pixelMap);
        expect(inkAll(bigBuffer) > inkAll(smallBuffer)).assertTrue();
        expect(inkAll(smallBuffer) > 0).assertTrue();
        expect(chanAt(bigBuffer, 100, 100, 3)).assertEqual(206);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0839 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0840
     * @tc.name testPenDeep0840
     * @tc.desc Verify the blurred core stays opaque while the halo fades out.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0840', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0840 begin');
      await runCase('testPenDeep0840', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setMaskFilter(blurMaskFilter(6));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(238);
        expect(chanAt(buffer, 100, 88, 3) < 255).assertTrue();
        expect(chanAt(buffer, 100, 88, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0840 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0841
     * @tc.name testPenDeep0841
     * @tc.desc Verify clearing the mask filter restores the sharp stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0841', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0841 begin');
      await runCase('testPenDeep0841', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clearedTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const clearedPen: drawing.Pen = new drawing.Pen();
        clearedPen.setColor(rgba(255, 0, 0, 255));
        clearedPen.setStrokeWidth(20);
        clearedPen.setMaskFilter(blurMaskFilter(4));
        clearedPen.setMaskFilter(null);
        clearedTarget.canvas.attachPen(clearedPen);
        clearedTarget.canvas.drawLine(20, 100, 180, 100);
        clearedTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const clearedBuffer: ArrayBuffer = await readPixelBuffer(clearedTarget.pixelMap);
        expect(gapBytes(plainBuffer, clearedBuffer)).assertEqual(0);
        expect(inkAll(plainBuffer) > 0).assertTrue();
        expect(chanAt(clearedBuffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0841 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0842
     * @tc.name testPenDeep0842
     * @tc.desc Verify the blurred halo count stays within a bounded multiple.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0842', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0842 begin');
      await runCase('testPenDeep0842', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blurTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        plainTarget.canvas.detachPen();
        const blurPen: drawing.Pen = new drawing.Pen();
        blurPen.setColor(rgba(255, 0, 0, 255));
        blurPen.setStrokeWidth(20);
        blurPen.setMaskFilter(blurMaskFilter(10));
        blurTarget.canvas.attachPen(blurPen);
        blurTarget.canvas.drawRect(ltrb(60, 60, 140, 140));
        blurTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const blurBuffer: ArrayBuffer = await readPixelBuffer(blurTarget.pixelMap);
        expect(inkAll(blurBuffer) > inkAll(plainBuffer) * 1.2).assertTrue();
        expect(inkAll(blurBuffer) < inkAll(plainBuffer) * 6).assertTrue();
        expect(inkAll(plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0842 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0843
     * @tc.name testPenDeep0843
     * @tc.desc Verify the outer blur type clears the core of the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0843', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0843 begin');
      await runCase('testPenDeep0843', async () => {
        const normalTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const outerTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const normalPen: drawing.Pen = new drawing.Pen();
        normalPen.setColor(rgba(255, 0, 0, 255));
        normalPen.setStrokeWidth(20);
        normalPen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 8));
        normalTarget.canvas.attachPen(normalPen);
        normalTarget.canvas.drawLine(20, 100, 180, 100);
        normalTarget.canvas.detachPen();
        const outerPen: drawing.Pen = new drawing.Pen();
        outerPen.setColor(rgba(255, 0, 0, 255));
        outerPen.setStrokeWidth(20);
        outerPen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 8));
        outerTarget.canvas.attachPen(outerPen);
        outerTarget.canvas.drawLine(20, 100, 180, 100);
        outerTarget.canvas.detachPen();
        const normalBuffer: ArrayBuffer = await readPixelBuffer(normalTarget.pixelMap);
        const outerBuffer: ArrayBuffer = await readPixelBuffer(outerTarget.pixelMap);
        expect(inkAll(outerBuffer) < inkAll(normalBuffer)).assertTrue();
        expect(chanAt(normalBuffer, 100, 100, 3)).assertEqual(206);
        expect(chanAt(outerBuffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0843 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0844
     * @tc.name testPenDeep0844
     * @tc.desc Verify a blend colour filter repaints the stroke in the filter colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0844', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0844 begin');
      await runCase('testPenDeep0844', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF00FF00);
        pen.setStrokeWidth(20);
        pen.setColorFilter(blendColorFilter(0xFFFF0000));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0844 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0845
     * @tc.name testPenDeep0845
     * @tc.desc Verify clearing the colour filter restores the pen colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0845', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0845 begin');
      await runCase('testPenDeep0845', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clearedTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(0xFF00FF00);
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const clearedPen: drawing.Pen = new drawing.Pen();
        clearedPen.setColor(0xFF00FF00);
        clearedPen.setStrokeWidth(20);
        clearedPen.setColorFilter(blendColorFilter(0xFFFF0000));
        clearedPen.setColorFilter(null);
        clearedTarget.canvas.attachPen(clearedPen);
        clearedTarget.canvas.drawLine(20, 100, 180, 100);
        clearedTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const clearedBuffer: ArrayBuffer = await readPixelBuffer(clearedTarget.pixelMap);
        expect(gapBytes(plainBuffer, clearedBuffer)).assertEqual(0);
        expect(chanAt(plainBuffer, 100, 100, 1)).assertEqual(255);
        expect(inkAll(plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0845 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0846
     * @tc.name testPenDeep0846
     * @tc.desc Verify a luma filter flattens the blue stroke into grey.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0846', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0846 begin');
      await runCase('testPenDeep0846', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF0000FF);
        pen.setStrokeWidth(20);
        pen.setColorFilter(lumaColorFilter());
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(Math.abs(chanAt(buffer, 100, 100, 0) - chanAt(buffer, 100, 100, 1)) <= 2).assertTrue();
        expect(Math.abs(chanAt(buffer, 100, 100, 1) - chanAt(buffer, 100, 100, 2)) <= 2).assertTrue();
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(18);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0846 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0847
     * @tc.name testPenDeep0847
     * @tc.desc Verify the shader effect wins over the plain pen colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0847', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0847 begin');
      await runCase('testPenDeep0847', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF00FF00);
        pen.setStrokeWidth(20);
        pen.setShaderEffect(colorShader(0xFF0000FF));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(pen.getHexColor()).assertEqual(0xFF00FF00);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0847 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0848
     * @tc.name testPenDeep0848
     * @tc.desc Verify a colour filter still applies on top of a shader effect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0848', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0848 begin');
      await runCase('testPenDeep0848', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(colorShader(0xFF00FF00));
        pen.setColorFilter(blendColorFilter(0xFFFF0000));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0848 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0849
     * @tc.name testPenDeep0849
     * @tc.desc Verify resetting a fully configured pen restores every default trait.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0849', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0849 begin');
      await runCase('testPenDeep0849', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(18);
        pen.setAlpha(90);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        pen.setMiterLimit(9);
        pen.reset();
        expect(pen.getWidth()).assertEqual(0);
        expect(pen.getAlpha()).assertEqual(255);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0849 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0850
     * @tc.name testPenDeep0850
     * @tc.desc Verify a reset pen accepts fresh settings that change the pixels again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0850', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0850 begin');
      await runCase('testPenDeep0850', async () => {
        const thickTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const freshTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(30);
        pen.setAlpha(40);
        pen.reset();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(10);
        thickTarget.canvas.attachPen(pen);
        thickTarget.canvas.drawLine(20, 100, 180, 100);
        thickTarget.canvas.detachPen();
        const freshPen: drawing.Pen = new drawing.Pen();
        freshPen.setColor(rgba(255, 0, 0, 255));
        freshPen.setStrokeWidth(10);
        freshTarget.canvas.attachPen(freshPen);
        freshTarget.canvas.drawLine(20, 100, 180, 100);
        freshTarget.canvas.detachPen();
        const thickBuffer: ArrayBuffer = await readPixelBuffer(thickTarget.pixelMap);
        const freshBuffer: ArrayBuffer = await readPixelBuffer(freshTarget.pixelMap);
        expect(gapBytes(thickBuffer, freshBuffer)).assertEqual(0);
        expect(chanAt(thickBuffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(thickBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0850 end');
    });

  });
}
