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
import { linearGradientShader, radialGradientShader } from '../../../main/ets/drawing/DrawingEffects';
import { sweepGradientShader, conicalGradientShader } from '../../../main/ets/drawing/DrawingEffects';
import { composeShader, colorShader } from '../../../main/ets/drawing/DrawingEffects';
import { blurImageFilter, offsetImageFilter, composeImageFilter } from '../../../main/ets/drawing/DrawingEffects';
import { blurMaskFilter, dashPathEffect, shadowLayer } from '../../../main/ets/drawing/DrawingEffects';
import { blendColorFilter } from '../../../main/ets/drawing/DrawingEffects';
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

export default function penApiDeep3Test() {
  describe('PenApiDeep3Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0851
     * @tc.name testPenDeep0851
     * @tc.desc Verify a single colour shader paints the stroke in that colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0851', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0851 begin');
      await runCase('testPenDeep0851', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(colorShader(0xFF0000FF));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0851 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0852
     * @tc.name testPenDeep0852
     * @tc.desc Verify a single colour shader overrides the colour set on the pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0852', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0852 begin');
      await runCase('testPenDeep0852', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFFFF0000);
        pen.setStrokeWidth(20);
        pen.setShaderEffect(colorShader(0xFF00FF00));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(pen.getHexColor()).assertEqual(0xFFFF0000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0852 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0853
     * @tc.name testPenDeep0853
     * @tc.desc Verify clearing the shader falls back to the pen colour again.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0853', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0853 begin');
      await runCase('testPenDeep0853', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFFFF0000);
        pen.setStrokeWidth(20);
        pen.setShaderEffect(colorShader(0xFF00FF00));
        pen.setShaderEffect(null);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 1)).assertEqual(0);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0853 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0854
     * @tc.name testPenDeep0854
     * @tc.desc Verify a red to blue linear gradient splits the stroke end colours.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0854', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0854 begin');
      await runCase('testPenDeep0854', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createLinearGradient(
          point(0, 100), point(200, 100), colors, drawing.TileMode.CLAMP);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(shader);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(10, 100, 190, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 10, 100, 0) > 200).assertTrue();
        expect(chanAt(buffer, 190, 100, 2)).assertEqual(0);
        expect(chanAt(buffer, 190, 100, 0) < 80).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0854 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0855
     * @tc.name testPenDeep0855
     * @tc.desc Verify the middle of a two colour gradient blends both channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0855', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0855 begin');
      await runCase('testPenDeep0855', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createLinearGradient(
          point(0, 100), point(200, 100), colors, drawing.TileMode.CLAMP);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(shader);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(10, 100, 190, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0) > 60 && chanAt(buffer, 100, 100, 0) < 200).assertTrue();
        expect(chanAt(buffer, 100, 100, 2) > 60 && chanAt(buffer, 100, 100, 2) < 200).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0855 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0856
     * @tc.name testPenDeep0856
     * @tc.desc Verify swapping the gradient end points swaps the painted ends.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0856', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0856 begin');
      await runCase('testPenDeep0856', async () => {
        const forwardTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const reverseTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const forwardColors: number[] = [0xFFFF0000, 0xFF0000FF];
        const reverseColors: number[] = [0xFF0000FF, 0xFFFF0000];
        const forwardPen: drawing.Pen = new drawing.Pen();
        forwardPen.setStrokeWidth(20);
        forwardPen.setShaderEffect(drawing.ShaderEffect.createLinearGradient(point(0, 100),
          point(200, 100), forwardColors, drawing.TileMode.CLAMP));
        forwardTarget.canvas.attachPen(forwardPen);
        forwardTarget.canvas.drawLine(10, 100, 190, 100);
        forwardTarget.canvas.detachPen();
        const reversePen: drawing.Pen = new drawing.Pen();
        reversePen.setStrokeWidth(20);
        reversePen.setShaderEffect(drawing.ShaderEffect.createLinearGradient(point(0, 100),
          point(200, 100), reverseColors, drawing.TileMode.CLAMP));
        reverseTarget.canvas.attachPen(reversePen);
        reverseTarget.canvas.drawLine(10, 100, 190, 100);
        reverseTarget.canvas.detachPen();
        const forwardBuffer: ArrayBuffer = await readPixelBuffer(forwardTarget.pixelMap);
        const reverseBuffer: ArrayBuffer = await readPixelBuffer(reverseTarget.pixelMap);
        expect(chanAt(forwardBuffer, 20, 100, 0) > chanAt(reverseBuffer, 20, 100, 0)).assertTrue();
        expect(chanAt(forwardBuffer, 180, 100, 2) > chanAt(reverseBuffer, 180, 100, 2)).assertTrue();
        expect(gapBytes(forwardBuffer, reverseBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0856 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0857
     * @tc.name testPenDeep0857
     * @tc.desc Verify a three stop gradient hits the middle colour at the centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0857', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0857 begin');
      await runCase('testPenDeep0857', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: number[] = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF];
        const stops: number[] = [0, 0.5, 1];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createLinearGradient(
          point(0, 100), point(200, 100), colors, drawing.TileMode.CLAMP, stops);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(shader);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(10, 100, 190, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 1) > 200).assertTrue();
        expect(chanAt(buffer, 100, 100, 0) < 60).assertTrue();
        expect(chanAt(buffer, 20, 100, 0) > 150).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0857 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0858
     * @tc.name testPenDeep0858
     * @tc.desc Verify a vertical linear gradient varies along the y axis.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0858', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0858 begin');
      await runCase('testPenDeep0858', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createLinearGradient(
          point(100, 0), point(100, 200), colors, drawing.TileMode.CLAMP);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(shader);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 20, 100, 180);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 20, 0) > 150).assertTrue();
        expect(chanAt(buffer, 100, 180, 2)).assertEqual(0);
        expect(chanAt(buffer, 100, 100, 0) > 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0858 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0859
     * @tc.name testPenDeep0859
     * @tc.desc Verify a radial gradient shows its inner colour at the centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0859', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0859 begin');
      await runCase('testPenDeep0859', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createRadialGradient(
          point(100, 100), 80, colors, drawing.TileMode.CLAMP);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(16);
        pen.setShaderEffect(shader);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0) > 200).assertTrue();
        expect(chanAt(buffer, 175, 100, 2) > 150).assertTrue();
        expect(chanAt(buffer, 100, 100, 2) < 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0859 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0860
     * @tc.name testPenDeep0860
     * @tc.desc Verify the clamp tile mode keeps the last colour past the radius.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0860', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0860 begin');
      await runCase('testPenDeep0860', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const shader: drawing.ShaderEffect = drawing.ShaderEffect.createRadialGradient(
          point(100, 100), 60, colors, drawing.TileMode.CLAMP);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(16);
        pen.setShaderEffect(shader);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 195, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 195, 100, 2)).assertEqual(0);
        expect(chanAt(buffer, 195, 100, 0) < 100).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0860 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0861
     * @tc.name testPenDeep0861
     * @tc.desc Verify an off centre radial gradient moves its bright core.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0861', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0861 begin');
      await runCase('testPenDeep0861', async () => {
        const centerTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const offsetTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const colors: number[] = [0xFFFF0000, 0xFF0000FF];
        const centerShader: drawing.ShaderEffect = drawing.ShaderEffect.createRadialGradient(
          point(100, 100), 40, colors, drawing.TileMode.CLAMP);
        const offsetShader: drawing.ShaderEffect = drawing.ShaderEffect.createRadialGradient(
          point(60, 100), 40, colors, drawing.TileMode.CLAMP);
        const centerPen: drawing.Pen = new drawing.Pen();
        centerPen.setStrokeWidth(16);
        centerPen.setShaderEffect(centerShader);
        centerTarget.canvas.attachPen(centerPen);
        centerTarget.canvas.drawLine(20, 100, 180, 100);
        centerTarget.canvas.detachPen();
        const offsetPen: drawing.Pen = new drawing.Pen();
        offsetPen.setStrokeWidth(16);
        offsetPen.setShaderEffect(offsetShader);
        offsetTarget.canvas.attachPen(offsetPen);
        offsetTarget.canvas.drawLine(20, 100, 180, 100);
        offsetTarget.canvas.detachPen();
        const centerBuffer: ArrayBuffer = await readPixelBuffer(centerTarget.pixelMap);
        const offsetBuffer: ArrayBuffer = await readPixelBuffer(offsetTarget.pixelMap);
        expect(chanAt(offsetBuffer, 60, 100, 0) > chanAt(centerBuffer, 60, 100, 0)).assertTrue();
        expect(chanAt(centerBuffer, 100, 100, 0) > chanAt(offsetBuffer, 100, 100, 0)).assertTrue();
        expect(gapBytes(centerBuffer, offsetBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0861 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0862
     * @tc.name testPenDeep0862
     * @tc.desc Verify a sweep gradient paints the zero degree ray in the first colour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0862', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0862 begin');
      await runCase('testPenDeep0862', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(16);
        pen.setShaderEffect(sweepGradientShader());
        target.canvas.attachPen(pen);
        target.canvas.drawLine(105, 100, 195, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 150, 100, 0) > 150).assertTrue();
        expect(chanAt(buffer, 150, 100, 1) < 150).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0862 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0863
     * @tc.name testPenDeep0863
     * @tc.desc Verify a sweep gradient and a linear gradient paint the same area differently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0863', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0863 begin');
      await runCase('testPenDeep0863', async () => {
        const sweepTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const linearTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const sweepPen: drawing.Pen = new drawing.Pen();
        sweepPen.setStrokeWidth(16);
        sweepPen.setShaderEffect(sweepGradientShader());
        sweepTarget.canvas.attachPen(sweepPen);
        sweepTarget.canvas.drawLine(105, 100, 195, 100);
        sweepTarget.canvas.detachPen();
        const linearPen: drawing.Pen = new drawing.Pen();
        linearPen.setStrokeWidth(16);
        linearPen.setShaderEffect(linearGradientShader());
        linearTarget.canvas.attachPen(linearPen);
        linearTarget.canvas.drawLine(105, 100, 195, 100);
        linearTarget.canvas.detachPen();
        const sweepBuffer: ArrayBuffer = await readPixelBuffer(sweepTarget.pixelMap);
        const linearBuffer: ArrayBuffer = await readPixelBuffer(linearTarget.pixelMap);
        expect(gapBytes(sweepBuffer, linearBuffer) > 0).assertTrue();
        expect(inkAll(sweepBuffer) > 0).assertTrue();
        expect(inkAll(linearBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0863 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0864
     * @tc.name testPenDeep0864
     * @tc.desc Verify a conical gradient brightens between its two circles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0864', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0864 begin');
      await runCase('testPenDeep0864', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(16);
        pen.setShaderEffect(conicalGradientShader());
        target.canvas.attachPen(pen);
        target.canvas.drawLine(40, 40, 160, 160);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 50, 50, 0) < 0x60).assertTrue();
        expect(chanAt(buffer, 150, 150, 0)).assertEqual(0);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0864 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0865
     * @tc.name testPenDeep0865
     * @tc.desc Verify a composed shader paints both of its source colours.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0865', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0865 begin');
      await runCase('testPenDeep0865', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(composeShader());
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 0) > 0).assertTrue();
        expect(chanAt(buffer, 100, 100, 1) > 0).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0865 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0866
     * @tc.name testPenDeep0866
     * @tc.desc Verify a blur image filter spreads the stroke beyond its sharp edges.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0866', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0866 begin');
      await runCase('testPenDeep0866', async () => {
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
        blurPen.setImageFilter(blurImageFilter(3));
        blurTarget.canvas.attachPen(blurPen);
        blurTarget.canvas.drawLine(20, 100, 180, 100);
        blurTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const blurBuffer: ArrayBuffer = await readPixelBuffer(blurTarget.pixelMap);
        expect(inkAll(blurBuffer) > inkAll(plainBuffer)).assertTrue();
        expect(chanAt(blurBuffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0866 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0867
     * @tc.name testPenDeep0867
     * @tc.desc Verify a stronger image blur sigma widens the halo.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0867', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0867 begin');
      await runCase('testPenDeep0867', async () => {
        const smallTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const bigTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const smallPen: drawing.Pen = new drawing.Pen();
        smallPen.setColor(rgba(255, 0, 0, 255));
        smallPen.setStrokeWidth(20);
        smallPen.setImageFilter(blurImageFilter(2));
        smallTarget.canvas.attachPen(smallPen);
        smallTarget.canvas.drawLine(20, 100, 180, 100);
        smallTarget.canvas.detachPen();
        const bigPen: drawing.Pen = new drawing.Pen();
        bigPen.setColor(rgba(255, 0, 0, 255));
        bigPen.setStrokeWidth(20);
        bigPen.setImageFilter(blurImageFilter(8));
        bigTarget.canvas.attachPen(bigPen);
        bigTarget.canvas.drawLine(20, 100, 180, 100);
        bigTarget.canvas.detachPen();
        const smallBuffer: ArrayBuffer = await readPixelBuffer(smallTarget.pixelMap);
        const bigBuffer: ArrayBuffer = await readPixelBuffer(bigTarget.pixelMap);
        expect(inkAll(bigBuffer) > inkAll(smallBuffer)).assertTrue();
        expect(inkAll(smallBuffer) > 0).assertTrue();
        expect(chanAt(bigBuffer, 100, 100, 3)).assertEqual(206);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0867 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0868
     * @tc.name testPenDeep0868
     * @tc.desc Verify an offset image filter shifts the stroke twenty pixels right.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0868', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0868 begin');
      await runCase('testPenDeep0868', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shiftTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(100, 20, 100, 180);
        plainTarget.canvas.detachPen();
        const shiftPen: drawing.Pen = new drawing.Pen();
        shiftPen.setColor(rgba(255, 0, 0, 255));
        shiftPen.setStrokeWidth(20);
        shiftPen.setImageFilter(offsetImageFilter(20, 0));
        shiftTarget.canvas.attachPen(shiftPen);
        shiftTarget.canvas.drawLine(100, 20, 100, 180);
        shiftTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const shiftBuffer: ArrayBuffer = await readPixelBuffer(shiftTarget.pixelMap);
        expect(chanAt(shiftBuffer, 100, 100, 3)).assertEqual(0);
        expect(chanAt(shiftBuffer, 120, 100, 3)).assertEqual(255);
        expect(chanAt(plainBuffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0868 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0869
     * @tc.name testPenDeep0869
     * @tc.desc Verify a negative offset image filter shifts the stroke left.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0869', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0869 begin');
      await runCase('testPenDeep0869', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(20);
        pen.setImageFilter(offsetImageFilter(-20, 0));
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 20, 100, 180);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 80, 100, 3)).assertEqual(255);
        expect(chanAt(buffer, 120, 100, 3)).assertEqual(0);
        expect(inkAll(buffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0869 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0870
     * @tc.name testPenDeep0870
     * @tc.desc Verify a composed blur and offset filter spreads and shifts at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0870', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0870 begin');
      await runCase('testPenDeep0870', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const composedTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(60, 60, 140, 60);
        plainTarget.canvas.detachPen();
        const composedPen: drawing.Pen = new drawing.Pen();
        composedPen.setColor(rgba(255, 0, 0, 255));
        composedPen.setStrokeWidth(20);
        composedPen.setImageFilter(composeImageFilter());
        composedTarget.canvas.attachPen(composedPen);
        composedTarget.canvas.drawLine(60, 60, 140, 60);
        composedTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const composedBuffer: ArrayBuffer = await readPixelBuffer(composedTarget.pixelMap);
        expect(inkAll(composedBuffer) > inkAll(plainBuffer)).assertTrue();
        expect(chanAt(composedBuffer, 64, 64, 3) > 0).assertTrue();
        expect(chanAt(plainBuffer, 64, 64, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0870 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0871
     * @tc.name testPenDeep0871
     * @tc.desc Verify a zero sigma image blur is rejected while a plain pen still paints.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0871', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0871 begin');
      await runCase('testPenDeep0871', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const rejected: boolean = throwsOn(() => blurImageFilter(0));
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        expect(rejected).assertTrue();
        expect(chanAt(plainBuffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0871 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0872
     * @tc.name testPenDeep0872
     * @tc.desc Verify clearing the image filter restores the sharp stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0872', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0872 begin');
      await runCase('testPenDeep0872', async () => {
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
        clearedPen.setImageFilter(blurImageFilter(4));
        clearedPen.setImageFilter(null);
        clearedTarget.canvas.attachPen(clearedPen);
        clearedTarget.canvas.drawLine(20, 100, 180, 100);
        clearedTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const clearedBuffer: ArrayBuffer = await readPixelBuffer(clearedTarget.pixelMap);
        expect(gapBytes(plainBuffer, clearedBuffer)).assertEqual(0);
        expect(inkAll(plainBuffer) > 0).assertTrue();
        expect(chanAt(clearedBuffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0872 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0873
     * @tc.name testPenDeep0873
     * @tc.desc Verify image blur and mask blur both spread ink but differently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0873', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0873 begin');
      await runCase('testPenDeep0873', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const imageTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const maskTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(rgba(255, 0, 0, 255));
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const imagePen: drawing.Pen = new drawing.Pen();
        imagePen.setColor(rgba(255, 0, 0, 255));
        imagePen.setStrokeWidth(20);
        imagePen.setImageFilter(blurImageFilter(5));
        imageTarget.canvas.attachPen(imagePen);
        imageTarget.canvas.drawLine(20, 100, 180, 100);
        imageTarget.canvas.detachPen();
        const maskPen: drawing.Pen = new drawing.Pen();
        maskPen.setColor(rgba(255, 0, 0, 255));
        maskPen.setStrokeWidth(20);
        maskPen.setMaskFilter(blurMaskFilter(5));
        maskTarget.canvas.attachPen(maskPen);
        maskTarget.canvas.drawLine(20, 100, 180, 100);
        maskTarget.canvas.detachPen();
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        const imageBuffer: ArrayBuffer = await readPixelBuffer(imageTarget.pixelMap);
        const maskBuffer: ArrayBuffer = await readPixelBuffer(maskTarget.pixelMap);
        expect(inkAll(imageBuffer) > inkAll(plainBuffer)).assertTrue();
        expect(inkAll(maskBuffer) > inkAll(plainBuffer)).assertTrue();
        expect(gapBytes(imageBuffer, maskBuffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0873 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0874
     * @tc.name testPenDeep0874
     * @tc.desc Verify the image filter leaves every pen trait unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenDeep0874', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0874 begin');
      await runCase('testPenDeep0874', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF3366AA);
        pen.setStrokeWidth(20);
        pen.setImageFilter(blurImageFilter(3));
        expect(pen.getWidth()).assertEqual(20);
        expect(pen.getAlpha()).assertEqual(255);
        expect(pen.getHexColor()).assertEqual(0xFF3366AA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0874 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0875
     * @tc.name testPenDeep0875
     * @tc.desc Verify a shader and a dash effect combine on one stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0875', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0875 begin');
      await runCase('testPenDeep0875', async () => {
        const shaderTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dashTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shaderPen: drawing.Pen = new drawing.Pen();
        shaderPen.setStrokeWidth(16);
        shaderPen.setShaderEffect(linearGradientShader());
        shaderTarget.canvas.attachPen(shaderPen);
        shaderTarget.canvas.drawLine(10, 100, 190, 100);
        shaderTarget.canvas.detachPen();
        const dashPen: drawing.Pen = new drawing.Pen();
        dashPen.setStrokeWidth(16);
        dashPen.setShaderEffect(linearGradientShader());
        dashPen.setPathEffect(dashPathEffect());
        dashTarget.canvas.attachPen(dashPen);
        dashTarget.canvas.drawLine(10, 100, 190, 100);
        dashTarget.canvas.detachPen();
        const shaderBuffer: ArrayBuffer = await readPixelBuffer(shaderTarget.pixelMap);
        const dashBuffer: ArrayBuffer = await readPixelBuffer(dashTarget.pixelMap);
        expect(inkAll(dashBuffer) < inkAll(shaderBuffer)).assertTrue();
        expect(inkAll(dashBuffer) > 0).assertTrue();
        expect(gapBytes(dashBuffer, shaderBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0875 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0876
     * @tc.name testPenDeep0876
     * @tc.desc Verify a shader and a mask filter combine on one stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0876', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0876 begin');
      await runCase('testPenDeep0876', async () => {
        const shaderTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blurTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shaderPen: drawing.Pen = new drawing.Pen();
        shaderPen.setStrokeWidth(20);
        shaderPen.setShaderEffect(colorShader(0xFFFF0000));
        shaderTarget.canvas.attachPen(shaderPen);
        shaderTarget.canvas.drawLine(20, 100, 180, 100);
        shaderTarget.canvas.detachPen();
        const blurPen: drawing.Pen = new drawing.Pen();
        blurPen.setStrokeWidth(20);
        blurPen.setShaderEffect(colorShader(0xFFFF0000));
        blurPen.setMaskFilter(blurMaskFilter(5));
        blurTarget.canvas.attachPen(blurPen);
        blurTarget.canvas.drawLine(20, 100, 180, 100);
        blurTarget.canvas.detachPen();
        const shaderBuffer: ArrayBuffer = await readPixelBuffer(shaderTarget.pixelMap);
        const blurBuffer: ArrayBuffer = await readPixelBuffer(blurTarget.pixelMap);
        expect(inkAll(blurBuffer) > inkAll(shaderBuffer)).assertTrue();
        expect(chanAt(blurBuffer, 100, 100, 3)).assertEqual(250);
        expect(inkAll(shaderBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0876 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0877
     * @tc.name testPenDeep0877
     * @tc.desc Verify the pen alpha still limits a shader backed stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0877', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0877 begin');
      await runCase('testPenDeep0877', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(colorShader(0xFF0000FF));
        pen.setAlpha(120);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(120);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(120);
        expect(pen.getAlpha()).assertEqual(120);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0877 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0878
     * @tc.name testPenDeep0878
     * @tc.desc Verify a colour filter and a mask filter work together.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0878', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0878 begin');
      await runCase('testPenDeep0878', async () => {
        const filterTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blurTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const filterPen: drawing.Pen = new drawing.Pen();
        filterPen.setColor(0xFF00FF00);
        filterPen.setStrokeWidth(20);
        filterPen.setColorFilter(blendColorFilter(0xFFFF0000));
        filterTarget.canvas.attachPen(filterPen);
        filterTarget.canvas.drawLine(20, 100, 180, 100);
        filterTarget.canvas.detachPen();
        const blurPen: drawing.Pen = new drawing.Pen();
        blurPen.setColor(0xFF00FF00);
        blurPen.setStrokeWidth(20);
        blurPen.setColorFilter(blendColorFilter(0xFFFF0000));
        blurPen.setMaskFilter(blurMaskFilter(4));
        blurTarget.canvas.attachPen(blurPen);
        blurTarget.canvas.drawLine(20, 100, 180, 100);
        blurTarget.canvas.detachPen();
        const filterBuffer: ArrayBuffer = await readPixelBuffer(filterTarget.pixelMap);
        const blurBuffer: ArrayBuffer = await readPixelBuffer(blurTarget.pixelMap);
        expect(chanAt(filterBuffer, 100, 100, 0)).assertEqual(255);
        expect(inkAll(blurBuffer) > inkAll(filterBuffer)).assertTrue();
        expect(gapBytes(blurBuffer, filterBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0878 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0879
     * @tc.name testPenDeep0879
     * @tc.desc Verify a blend mode applies on top of a shader stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0879', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0879 begin');
      await runCase('testPenDeep0879', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(0xFFFF0000, drawing.BlendMode.SRC);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(20);
        pen.setShaderEffect(colorShader(0xFF0000FF));
        pen.setBlendMode(drawing.BlendMode.SRC);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 100, 180, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 0)).assertEqual(0);
        expect(chanAt(buffer, 100, 20, 0)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0879 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0880
     * @tc.name testPenDeep0880
     * @tc.desc Verify a dash effect and a blur filter combine on one stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0880', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0880 begin');
      await runCase('testPenDeep0880', async () => {
        const dashTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blurTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dashPen: drawing.Pen = new drawing.Pen();
        dashPen.setColor(rgba(255, 0, 0, 255));
        dashPen.setStrokeWidth(16);
        dashPen.setPathEffect(dashPathEffect());
        dashTarget.canvas.attachPen(dashPen);
        dashTarget.canvas.drawLine(10, 100, 190, 100);
        dashTarget.canvas.detachPen();
        const blurPen: drawing.Pen = new drawing.Pen();
        blurPen.setColor(rgba(255, 0, 0, 255));
        blurPen.setStrokeWidth(16);
        blurPen.setPathEffect(dashPathEffect());
        blurPen.setMaskFilter(blurMaskFilter(3));
        blurTarget.canvas.attachPen(blurPen);
        blurTarget.canvas.drawLine(10, 100, 190, 100);
        blurTarget.canvas.detachPen();
        const dashBuffer: ArrayBuffer = await readPixelBuffer(dashTarget.pixelMap);
        const blurBuffer: ArrayBuffer = await readPixelBuffer(blurTarget.pixelMap);
        expect(inkAll(blurBuffer) > inkAll(dashBuffer)).assertTrue();
        expect(inkAll(dashBuffer) > 0).assertTrue();
        expect(gapBytes(blurBuffer, dashBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0880 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0881
     * @tc.name testPenDeep0881
     * @tc.desc Verify every pen style set at once still produces a visible stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0881', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0881 begin');
      await runCase('testPenDeep0881', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(8);
        pen.setShaderEffect(linearGradientShader());
        pen.setPathEffect(dashPathEffect());
        pen.setMaskFilter(blurMaskFilter(2));
        pen.setColorFilter(blendColorFilter(0x88FF0000));
        pen.setBlendMode(drawing.BlendMode.SRC_OVER);
        pen.setShadowLayer(shadowLayer());
        target.canvas.attachPen(pen);
        target.canvas.drawLine(10, 100, 190, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(chanAt(buffer, 100, 100, 3) > 0).assertTrue();
        expect(pen.getWidth()).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0881 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0882
     * @tc.name testPenDeep0882
     * @tc.desc Verify cap join and dash settings coexist on a polyline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0882', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0882 begin');
      await runCase('testPenDeep0882', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 140);
        shape.lineTo(100, 60);
        shape.lineTo(160, 140);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 0, 255));
        pen.setStrokeWidth(14);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        pen.setPathEffect(dashPathEffect());
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0882 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0883
     * @tc.name testPenDeep0883
     * @tc.desc Verify a tight miter limit still trims the corner under a dash effect.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0883', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0883 begin');
      await runCase('testPenDeep0883', async () => {
        const tightTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const looseTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.lineTo(100, 50);
        shape.lineTo(170, 170);
        const tightPen: drawing.Pen = new drawing.Pen();
        tightPen.setColor(rgba(255, 0, 0, 255));
        tightPen.setStrokeWidth(16);
        tightPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        tightPen.setMiterLimit(1);
        tightPen.setPathEffect(dashPathEffect());
        tightTarget.canvas.attachPen(tightPen);
        tightTarget.canvas.drawPath(shape);
        tightTarget.canvas.detachPen();
        const loosePen: drawing.Pen = new drawing.Pen();
        loosePen.setColor(rgba(255, 0, 0, 255));
        loosePen.setStrokeWidth(16);
        loosePen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        loosePen.setMiterLimit(10);
        loosePen.setPathEffect(dashPathEffect());
        looseTarget.canvas.attachPen(loosePen);
        looseTarget.canvas.drawPath(shape);
        looseTarget.canvas.detachPen();
        const tightBuffer: ArrayBuffer = await readPixelBuffer(tightTarget.pixelMap);
        const looseBuffer: ArrayBuffer = await readPixelBuffer(looseTarget.pixelMap);
        expect(inkAll(tightBuffer)).assertEqual(2516);
        expect(tightPen.getMiterLimit()).assertEqual(1);
        expect(inkAll(tightBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0883 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0884
     * @tc.name testPenDeep0884
     * @tc.desc Verify two pens attached in turn keep their own stroke colours.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0884', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0884 begin');
      await runCase('testPenDeep0884', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const redPen: drawing.Pen = new drawing.Pen();
        redPen.setColor(0xFFFF0000);
        redPen.setStrokeWidth(8);
        target.canvas.attachPen(redPen);
        target.canvas.drawLine(20, 60, 180, 60);
        target.canvas.detachPen();
        const bluePen: drawing.Pen = new drawing.Pen();
        bluePen.setColor(0xFF0000FF);
        bluePen.setStrokeWidth(8);
        target.canvas.attachPen(bluePen);
        target.canvas.drawLine(20, 140, 180, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 60, 0)).assertEqual(255);
        expect(chanAt(buffer, 100, 140, 2)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0884 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0885
     * @tc.name testPenDeep0885
     * @tc.desc Verify three attach and detach cycles leave three separate bands.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0885', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0885 begin');
      await runCase('testPenDeep0885', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFFFF0000);
        pen.setStrokeWidth(12);
        for (let index: number = 0; index < 3; index++) {
          target.canvas.attachPen(pen);
          target.canvas.drawLine(20, 60 + index * 40, 180, 60 + index * 40);
          target.canvas.detachPen();
        }
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkRect(buffer, 0, 50, CANVAS_SIZE, 70) > 0).assertTrue();
        expect(inkRect(buffer, 0, 90, CANVAS_SIZE, 110) > 0).assertTrue();
        expect(inkRect(buffer, 0, 130, CANVAS_SIZE, 150) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0885 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0886
     * @tc.name testPenDeep0886
     * @tc.desc Verify one pen draws two bands inside a single attach.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0886', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0886 begin');
      await runCase('testPenDeep0886', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF00FF00);
        pen.setStrokeWidth(12);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 60, 180, 60);
        target.canvas.drawLine(20, 140, 180, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 60, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 140, 3)).assertEqual(255);
        expect(chanAt(buffer, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0886 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0887
     * @tc.name testPenDeep0887
     * @tc.desc Verify a pen border and a brush fill cover one rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0887', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0887 begin');
      await runCase('testPenDeep0887', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFFFF0000);
        pen.setStrokeWidth(10);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF0000FF);
        target.canvas.attachPen(pen);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(60, 60, 140, 140));
        target.canvas.detachBrush();
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 100, 100, 2)).assertEqual(255);
        expect(chanAt(buffer, 62, 100, 0)).assertEqual(255);
        expect(inkAll(buffer)).assertEqual(8100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0887 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0888
     * @tc.name testPenDeep0888
     * @tc.desc Verify a width change between two attaches changes the painted band.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0888', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0888 begin');
      await runCase('testPenDeep0888', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFFFF0000);
        pen.setStrokeWidth(6);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 60, 180, 60);
        target.canvas.detachPen();
        pen.setStrokeWidth(20);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(20, 140, 180, 140);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const thinBand: number = inkRect(buffer, 0, 50, CANVAS_SIZE, 70);
        const wideBand: number = inkRect(buffer, 0, 130, CANVAS_SIZE, 150);
        expect(wideBand > thinBand * 2).assertTrue();
        expect(thinBand > 0).assertTrue();
        expect(pen.getWidth()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0888 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0889
     * @tc.name testPenDeep0889
     * @tc.desc Verify a gradient dash and round cap combine into a dotted line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0889', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0889 begin');
      await runCase('testPenDeep0889', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(14);
        pen.setAntiAlias(true);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        pen.setShaderEffect(linearGradientShader());
        pen.setPathEffect(dashPathEffect());
        target.canvas.attachPen(pen);
        target.canvas.drawLine(10, 100, 190, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(chanAt(buffer, 20, 100, 0) > 100).assertTrue();
        expect(chanAt(buffer, 180, 100, 2) > 100).assertTrue();
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0889 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0890
     * @tc.name testPenDeep0890
     * @tc.desc Verify a two hundred pixel wide stroke covers the whole bitmap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0890', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0890 begin');
      await runCase('testPenDeep0890', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFFFF0000);
        pen.setStrokeWidth(CANVAS_SIZE);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(100, 0, 100, CANVAS_SIZE);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(pen.getWidth()).assertEqual(CANVAS_SIZE);
        expect(inkAll(buffer)).assertEqual(40000);
        expect(chanAt(buffer, 0, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0890 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0891
     * @tc.name testPenDeep0891
     * @tc.desc Verify a half pixel width draws like a one pixel width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0891', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0891 begin');
      await runCase('testPenDeep0891', async () => {
        const halfTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const oneTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const halfPen: drawing.Pen = new drawing.Pen();
        halfPen.setColor(0xFFFF0000);
        halfPen.setStrokeWidth(0.5);
        halfTarget.canvas.attachPen(halfPen);
        halfTarget.canvas.drawLine(100, 20, 100, 180);
        halfTarget.canvas.detachPen();
        const onePen: drawing.Pen = new drawing.Pen();
        onePen.setColor(0xFFFF0000);
        onePen.setStrokeWidth(1);
        oneTarget.canvas.attachPen(onePen);
        oneTarget.canvas.drawLine(100, 20, 100, 180);
        oneTarget.canvas.detachPen();
        const halfBuffer: ArrayBuffer = await readPixelBuffer(halfTarget.pixelMap);
        const oneBuffer: ArrayBuffer = await readPixelBuffer(oneTarget.pixelMap);
        expect(gapBytes(halfBuffer, oneBuffer)).assertEqual(320);
        expect(halfPen.getWidth()).assertEqual(0.5);
        expect(inkAll(halfBuffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0891 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0892
     * @tc.name testPenDeep0892
     * @tc.desc Verify a negative width paints a thin hairline like a zero width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0892', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0892 begin');
      await runCase('testPenDeep0892', async () => {
        const negTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const zeroTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const negPen: drawing.Pen = new drawing.Pen();
        negPen.setColor(0xFFFF0000);
        negPen.setStrokeWidth(-5);
        negTarget.canvas.attachPen(negPen);
        negTarget.canvas.drawLine(100, 20, 100, 180);
        negTarget.canvas.detachPen();
        const zeroPen: drawing.Pen = new drawing.Pen();
        zeroPen.setColor(0xFFFF0000);
        zeroPen.setStrokeWidth(0);
        zeroTarget.canvas.attachPen(zeroPen);
        zeroTarget.canvas.drawLine(100, 20, 100, 180);
        zeroTarget.canvas.detachPen();
        const negBuffer: ArrayBuffer = await readPixelBuffer(negTarget.pixelMap);
        const zeroBuffer: ArrayBuffer = await readPixelBuffer(zeroTarget.pixelMap);
        expect(gapBytes(negBuffer, zeroBuffer)).assertEqual(0);
        expect(inkAll(negBuffer) > 0).assertTrue();
        expect(inkAll(negBuffer) < 400).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0892 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0893
     * @tc.name testPenDeep0893
     * @tc.desc Verify a full bitmap width with full alpha fills every channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenDeep0893', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0893 begin');
      await runCase('testPenDeep0893', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF00AA88);
        pen.setAlpha(255);
        pen.setStrokeWidth(CANVAS_SIZE);
        target.canvas.attachPen(pen);
        target.canvas.drawLine(0, 100, CANVAS_SIZE, 100);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(chanAt(buffer, 10, 10, 3)).assertEqual(255);
        expect(chanAt(buffer, 10, 10, 1)).assertEqual(0xAA);
        expect(inkAll(buffer)).assertEqual(40000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0893 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0894
     * @tc.name testPenDeep0894
     * @tc.desc Verify a dash interval longer than the line keeps it solid.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0894', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0894 begin');
      await runCase('testPenDeep0894', async () => {
        const solidTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const longTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const intervals: number[] = [400, 400];
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(0xFFFF0000);
        solidPen.setStrokeWidth(16);
        solidTarget.canvas.attachPen(solidPen);
        solidTarget.canvas.drawLine(20, 100, 180, 100);
        solidTarget.canvas.detachPen();
        const longPen: drawing.Pen = new drawing.Pen();
        longPen.setColor(0xFFFF0000);
        longPen.setStrokeWidth(16);
        longPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 0));
        longTarget.canvas.attachPen(longPen);
        longTarget.canvas.drawLine(20, 100, 180, 100);
        longTarget.canvas.detachPen();
        const solidBuffer: ArrayBuffer = await readPixelBuffer(solidTarget.pixelMap);
        const longBuffer: ArrayBuffer = await readPixelBuffer(longTarget.pixelMap);
        expect(gapBytes(solidBuffer, longBuffer)).assertEqual(0);
        expect(inkAll(longBuffer) > 0).assertTrue();
        expect(chanAt(longBuffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0894 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0895
     * @tc.name testPenDeep0895
     * @tc.desc Verify a very short dash interval keeps roughly half the ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0895', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0895 begin');
      await runCase('testPenDeep0895', async () => {
        const solidTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shortTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const intervals: number[] = [2, 2];
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(0xFFFF0000);
        solidPen.setStrokeWidth(16);
        solidTarget.canvas.attachPen(solidPen);
        solidTarget.canvas.drawLine(20, 100, 180, 100);
        solidTarget.canvas.detachPen();
        const shortPen: drawing.Pen = new drawing.Pen();
        shortPen.setColor(0xFFFF0000);
        shortPen.setStrokeWidth(16);
        shortPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 0));
        shortTarget.canvas.attachPen(shortPen);
        shortTarget.canvas.drawLine(20, 100, 180, 100);
        shortTarget.canvas.detachPen();
        const solidBuffer: ArrayBuffer = await readPixelBuffer(solidTarget.pixelMap);
        const shortBuffer: ArrayBuffer = await readPixelBuffer(shortTarget.pixelMap);
        expect(inkAll(shortBuffer) < inkAll(solidBuffer) * 0.75).assertTrue();
        expect(inkAll(shortBuffer) > inkAll(solidBuffer) * 0.25).assertTrue();
        expect(inkAll(shortBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0895 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0896
     * @tc.name testPenDeep0896
     * @tc.desc Verify a one pixel dash pattern still breaks the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0896', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0896 begin');
      await runCase('testPenDeep0896', async () => {
        const solidTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const dotTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const intervals: number[] = [1, 1];
        const solidPen: drawing.Pen = new drawing.Pen();
        solidPen.setColor(0xFFFF0000);
        solidPen.setStrokeWidth(16);
        solidTarget.canvas.attachPen(solidPen);
        solidTarget.canvas.drawLine(20, 100, 180, 100);
        solidTarget.canvas.detachPen();
        const dotPen: drawing.Pen = new drawing.Pen();
        dotPen.setColor(0xFFFF0000);
        dotPen.setStrokeWidth(16);
        dotPen.setPathEffect(drawing.PathEffect.createDashPathEffect(intervals, 0));
        dotTarget.canvas.attachPen(dotPen);
        dotTarget.canvas.drawLine(20, 100, 180, 100);
        dotTarget.canvas.detachPen();
        const solidBuffer: ArrayBuffer = await readPixelBuffer(solidTarget.pixelMap);
        const dotBuffer: ArrayBuffer = await readPixelBuffer(dotTarget.pixelMap);
        expect(inkAll(dotBuffer) > 0).assertTrue();
        expect(inkAll(dotBuffer) < inkAll(solidBuffer)).assertTrue();
        expect(gapBytes(dotBuffer, solidBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0896 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0897
     * @tc.name testPenDeep0897
     * @tc.desc Verify an extreme miter limit matches a very large one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0897', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0897 begin');
      await runCase('testPenDeep0897', async () => {
        const thousandTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const hundredTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(30, 170);
        shape.lineTo(100, 50);
        shape.lineTo(170, 170);
        const thousandPen: drawing.Pen = new drawing.Pen();
        thousandPen.setColor(0xFFFF0000);
        thousandPen.setStrokeWidth(16);
        thousandPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        thousandPen.setMiterLimit(1000);
        thousandTarget.canvas.attachPen(thousandPen);
        thousandTarget.canvas.drawPath(shape);
        thousandTarget.canvas.detachPen();
        const hundredPen: drawing.Pen = new drawing.Pen();
        hundredPen.setColor(0xFFFF0000);
        hundredPen.setStrokeWidth(16);
        hundredPen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        hundredPen.setMiterLimit(100);
        hundredTarget.canvas.attachPen(hundredPen);
        hundredTarget.canvas.drawPath(shape);
        hundredTarget.canvas.detachPen();
        const thousandBuffer: ArrayBuffer = await readPixelBuffer(thousandTarget.pixelMap);
        const hundredBuffer: ArrayBuffer = await readPixelBuffer(hundredTarget.pixelMap);
        expect(gapBytes(thousandBuffer, hundredBuffer)).assertEqual(0);
        expect(thousandPen.getMiterLimit()).assertEqual(1000);
        expect(inkAll(thousandBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0897 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0898
     * @tc.name testPenDeep0898
     * @tc.desc Verify a zero sigma mask blur is rejected while a plain pen still paints.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0898', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0898 begin');
      await runCase('testPenDeep0898', async () => {
        const plainTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const plainPen: drawing.Pen = new drawing.Pen();
        plainPen.setColor(0xFFFF0000);
        plainPen.setStrokeWidth(20);
        plainTarget.canvas.attachPen(plainPen);
        plainTarget.canvas.drawLine(20, 100, 180, 100);
        plainTarget.canvas.detachPen();
        const rejected: boolean = throwsOn(() =>
          drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 0));
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plainTarget.pixelMap);
        expect(rejected).assertTrue();
        expect(chanAt(plainBuffer, 100, 100, 3)).assertEqual(255);
        expect(inkAll(plainBuffer) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0898 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0899
     * @tc.name testPenDeep0899
     * @tc.desc Verify a fully styled dashed polyline reaches pixels and outline together.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0899', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0899 begin');
      await runCase('testPenDeep0899', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shape: drawing.Path = new drawing.Path();
        shape.moveTo(40, 150);
        shape.lineTo(100, 60);
        shape.lineTo(160, 150);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(14);
        pen.setAntiAlias(true);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        pen.setShaderEffect(linearGradientShader());
        pen.setPathEffect(dashPathEffect());
        target.canvas.attachPen(pen);
        target.canvas.drawPath(shape);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const outline: drawing.Path = new drawing.Path();
        pen.getFillPath(shape, outline);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(outline.isEmpty()).assertFalse();
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(chanAt(buffer, 100, 90, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0899 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0900
     * @tc.name testPenDeep0900
     * @tc.desc Verify anti-aliasing softens a shader stroke along a diagonal line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenDeep0900', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0900 begin');
      await runCase('testPenDeep0900', async () => {
        const sharpTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const smoothTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const sharpPen: drawing.Pen = new drawing.Pen();
        sharpPen.setStrokeWidth(12);
        sharpPen.setAntiAlias(false);
        sharpPen.setShaderEffect(colorShader(0xFF3366FF));
        sharpTarget.canvas.attachPen(sharpPen);
        sharpTarget.canvas.drawLine(20, 20, 180, 180);
        sharpTarget.canvas.detachPen();
        const smoothPen: drawing.Pen = new drawing.Pen();
        smoothPen.setStrokeWidth(12);
        smoothPen.setAntiAlias(true);
        smoothPen.setShaderEffect(colorShader(0xFF3366FF));
        smoothTarget.canvas.attachPen(smoothPen);
        smoothTarget.canvas.drawLine(20, 20, 180, 180);
        smoothTarget.canvas.detachPen();
        const sharpBuffer: ArrayBuffer = await readPixelBuffer(sharpTarget.pixelMap);
        const smoothBuffer: ArrayBuffer = await readPixelBuffer(smoothTarget.pixelMap);
        expect(smoothPen.isAntiAlias()).assertTrue();
        expect(sharpPen.isAntiAlias()).assertFalse();
        expect(gapBytes(sharpBuffer, smoothBuffer) > 0).assertTrue();
        expect(chanAt(smoothBuffer, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenDeep0900 end');
    });

  });
}
