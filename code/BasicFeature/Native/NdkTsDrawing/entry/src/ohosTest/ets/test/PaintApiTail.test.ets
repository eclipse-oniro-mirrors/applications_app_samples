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
import {
  applyBrushEffects,
  applyPenEffects,
  createFillBrush,
  createStrokePen,
  paintPenBrushShowcase,
  snapshotBrush,
  snapshotPen
} from '../../../main/ets/drawing/DrawingPenBrush';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { defaultSamplingOptions, samplingOptions } from '../../../main/ets/drawing/DrawingGeometryUtils';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, maxChannel, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const CANVAS_SIZE: number = 120;
const RECT_AREA: number = 80 * 80;

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
 * Create an offscreen target with the whole canvas painted solid.
 *
 * @param { number } size - Square edge length in px.
 * @param { common2D.Color } color - Fill color.
 * @returns { Promise<OffscreenTarget> } Target fully covered by the color.
 */
async function solidSource(size: number, color: common2D.Color): Promise<OffscreenTarget> {
  const source: OffscreenTarget = await createOffscreenTarget(size, size);
  source.canvas.drawColor(color, drawing.BlendMode.SRC);
  return source;
}

/**
 * Create a brush that fills with a fully opaque color.
 *
 * @param { number } red - Red channel.
 * @param { number } green - Green channel.
 * @param { number } blue - Blue channel.
 * @returns { drawing.Brush } Opaque fill brush.
 */
function opaqueBrush(red: number, green: number, blue: number): drawing.Brush {
  return createFillBrush(rgba(255, red, green, blue));
}

/**
 * Create a pen that strokes with a fully opaque color.
 *
 * @param { number } red - Red channel.
 * @param { number } green - Green channel.
 * @param { number } blue - Blue channel.
 * @param { number } width - Stroke width.
 * @returns { drawing.Pen } Opaque stroke pen.
 */
function opaquePen(red: number, green: number, blue: number, width: number): drawing.Pen {
  return createStrokePen(rgba(255, red, green, blue), width);
}

export default function paintApiTailTest() {
  describe('PaintApiTailTest', () => {
    /** @tc.number SUB_NdkTsDrawing_PAINT_0001
     * @tc.name testPaintApi0001
     * @tc.desc Verify the default sampling options copy the whole solid source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPaintApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0001 begin');
      await runCase('testPaintApi0001', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 0, 0, 255));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0, new drawing.SamplingOptions());
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(CANVAS_SIZE * CANVAS_SIZE);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0002
     * @tc.name testPaintApi0002
     * @tc.desc Verify explicit nearest sampling copies the source block.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPaintApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0002 begin');
      await runCase('testPaintApi0002', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 10, 20, 30));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImage(source.pixelMap, 0, 0, options);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 1)).assertEqual(20);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0003
     * @tc.name testPaintApi0003
     * @tc.desc Verify the default constructor matches explicit nearest sampling.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPaintApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0003 begin');
      await runCase('testPaintApi0003', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 0, 200, 0));
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const nearest: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        plain.canvas.drawImage(source.pixelMap, 0, 0, new drawing.SamplingOptions());
        nearest.canvas.drawImage(source.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const plainBuffer: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const nearestBuffer: ArrayBuffer = await readPixelBuffer(nearest.pixelMap);
        expect(countInkedPixels(plainBuffer)).assertEqual(countInkedPixels(nearestBuffer));
        expect(channelAt(plainBuffer, CANVAS_SIZE, 30, 90, 1)).assertEqual(200);
        expect(channelAt(nearestBuffer, CANVAS_SIZE, 30, 90, 1)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0004
     * @tc.name testPaintApi0004
     * @tc.desc Verify nearest and linear sampling agree on a solid source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0004 begin');
      await runCase('testPaintApi0004', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 40, 50, 60));
        const nearest: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const linear: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        nearest.canvas.drawImage(source.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        linear.canvas.drawImage(source.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        const nearestBuffer: ArrayBuffer = await readPixelBuffer(nearest.pixelMap);
        const linearBuffer: ArrayBuffer = await readPixelBuffer(linear.pixelMap);
        expect(countInkedPixels(nearestBuffer)).assertEqual(14400);
        expect(countInkedPixels(linearBuffer)).assertEqual(14400);
        expect(channelAt(linearBuffer, CANVAS_SIZE, 10, 110, 0)).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0005
     * @tc.name testPaintApi0005
     * @tc.desc Verify linear sampling stretches the source over the whole destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0005 begin');
      await runCase('testPaintApi0005', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 0, 90, 180));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 1, 1, 2)).assertEqual(180);
        expect(channelAt(buffer, CANVAS_SIZE, 118, 118, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0006
     * @tc.name testPaintApi0006
     * @tc.desc Verify nearest sampling shrinks the source into the destination rect only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0006 begin');
      await runCase('testPaintApi0006', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 200, 100, 50));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRect(source.pixelMap, ltrb(20, 20, 80, 80),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(3600);
        expect(channelAt(buffer, CANVAS_SIZE, 5, 5, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 0)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0007
     * @tc.name testPaintApi0007
     * @tc.desc Verify one sampling option object can drive two draws on the same canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0007 begin');
      await runCase('testPaintApi0007', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 1, 2, 3));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImage(source.pixelMap, 0, 0, options);
        target.canvas.drawImage(source.pixelMap, 0, 0, options);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 70, 70, 1)).assertEqual(2);
        expect(channelAt(buffer, CANVAS_SIZE, 70, 70, 2)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0008
     * @tc.name testPaintApi0008
     * @tc.desc Verify one sampling option object works on two independent canvases.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0008 begin');
      await runCase('testPaintApi0008', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 90, 80, 70));
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        first.canvas.drawImage(source.pixelMap, 0, 0, options);
        second.canvas.drawImage(source.pixelMap, 0, 0, options);
        const firstBuffer: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const secondBuffer: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(countInkedPixels(firstBuffer)).assertEqual(14400);
        expect(countInkedPixels(secondBuffer)).assertEqual(14400);
        expect(channelAt(firstBuffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0009
     * @tc.name testPaintApi0009
     * @tc.desc Verify two sampling option objects stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0009 begin');
      await runCase('testPaintApi0009', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 12, 34, 56));
        const first: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        const second: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0, first);
        target.canvas.drawImage(source.pixelMap, 0, 0, second);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(first === second).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 50, 50, 2)).assertEqual(56);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0010
     * @tc.name testPaintApi0010
     * @tc.desc Verify a magnified source region covers the whole destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0010 begin');
      await runCase('testPaintApi0010', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 7, 77, 177));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(0, 0, 60, 60),
          ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 110, 10, 1)).assertEqual(77);
        expect(channelAt(buffer, CANVAS_SIZE, 110, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0011
     * @tc.name testPaintApi0011
     * @tc.desc Verify linear sampling on a magnified source region keeps coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0011 begin');
      await runCase('testPaintApi0011', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 33, 66, 99));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRectWithSrc(source.pixelMap, ltrb(10, 10, 70, 70),
          ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(33);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 119, 2)).assertEqual(99);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0012
     * @tc.name testPaintApi0012
     * @tc.desc Verify nearest sampling of a transparent source paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0012 begin');
      await runCase('testPaintApi0012', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(0, 0, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0013
     * @tc.name testPaintApi0013
     * @tc.desc Verify linear sampling of a transparent source paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0013 begin');
      await runCase('testPaintApi0013', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(0, 0, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageRect(source.pixelMap, ltrb(0, 0, 60, 60),
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 3)).assertEqual(0);
        expect(maxChannel(buffer, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0014
     * @tc.name testPaintApi0014
     * @tc.desc Verify the sampling options factory drives a drawImage call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0014 begin');
      await runCase('testPaintApi0014', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 240, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions = samplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        target.canvas.drawImage(source.pixelMap, 0, 0, options);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(240);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0015
     * @tc.name testPaintApi0015
     * @tc.desc Verify the default sampling factory matches the plain constructor.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0015 begin');
      await runCase('testPaintApi0015', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 5, 105, 205));
        const fromFactory: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const fromCtor: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        fromFactory.canvas.drawImage(source.pixelMap, 0, 0, defaultSamplingOptions());
        fromCtor.canvas.drawImage(source.pixelMap, 0, 0, new drawing.SamplingOptions());
        const factoryBuffer: ArrayBuffer = await readPixelBuffer(fromFactory.pixelMap);
        const ctorBuffer: ArrayBuffer = await readPixelBuffer(fromCtor.pixelMap);
        expect(countInkedPixels(factoryBuffer)).assertEqual(countInkedPixels(ctorBuffer));
        expect(countInkedPixels(factoryBuffer)).assertEqual(14400);
        expect(channelAt(factoryBuffer, CANVAS_SIZE, 40, 40, 2)).assertEqual(205);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0016
     * @tc.name testPaintApi0016
     * @tc.desc Verify two factory calls return separate sampling objects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0016 begin');
      await runCase('testPaintApi0016', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 9, 8, 7));
        const first: drawing.SamplingOptions = samplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        const second: drawing.SamplingOptions = samplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0, first);
        target.canvas.drawImage(source.pixelMap, 0, 0, second);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(first === second).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 30, 1)).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0017
     * @tc.name testPaintApi0017
     * @tc.desc Verify a nearest draw at an offset leaves the origin transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0017 begin');
      await runCase('testPaintApi0017', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 222, 111, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 60, 60,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(3600);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 0)).assertEqual(222);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0018
     * @tc.name testPaintApi0018
     * @tc.desc Verify a linear draw at an offset clips at the canvas edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0018 begin');
      await runCase('testPaintApi0018', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 0, 111, 222));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 60, 60,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(3600);
        expect(channelAt(buffer, CANVAS_SIZE, 119, 119, 2)).assertEqual(222);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0019
     * @tc.name testPaintApi0019
     * @tc.desc Verify the two filter mode members keep their documented values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPaintApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0019 begin');
      await runCase('testPaintApi0019', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 4, 4, 4));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImage(source.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(drawing.FilterMode.FILTER_MODE_NEAREST).assertEqual(0);
        expect(drawing.FilterMode.FILTER_MODE_LINEAR).assertEqual(1);
        expect(countInkedPixels(buffer)).assertEqual(14400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0020
     * @tc.name testPaintApi0020
     * @tc.desc Verify three offset draws with one option object cover three blocks.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0020 begin');
      await runCase('testPaintApi0020', async () => {
        const source: OffscreenTarget = await solidSource(60, rgba(255, 0, 0, 255));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const options: drawing.SamplingOptions =
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImage(source.pixelMap, 0, 0, options);
        target.canvas.drawImage(source.pixelMap, 60, 0, options);
        target.canvas.drawImage(source.pixelMap, 0, 60, options);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10800);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 119, 119, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0021
     * @tc.name testPaintApi0021
     * @tc.desc Verify a one cell lattice stretched over the source size fills the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPaintApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0021 begin');
      await runCase('testPaintApi0021', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 20, 40, 60));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(20);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0022
     * @tc.name testPaintApi0022
     * @tc.desc Verify a one cell lattice matches a plain image draw.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0022 begin');
      await runCase('testPaintApi0022', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 15, 25, 35));
        const viaLattice: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const viaImage: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        viaLattice.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        viaImage.canvas.drawImage(source.pixelMap, 0, 0,
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        const latticeBuffer: ArrayBuffer = await readPixelBuffer(viaLattice.pixelMap);
        const imageBuffer: ArrayBuffer = await readPixelBuffer(viaImage.pixelMap);
        expect(countInkedPixels(latticeBuffer)).assertEqual(countInkedPixels(imageBuffer));
        expect(channelAt(latticeBuffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(255);
        expect(channelAt(imageBuffer, CANVAS_SIZE, 119, 119, 1)).assertEqual(25);
        expect(channelAt(latticeBuffer, CANVAS_SIZE, 119, 119, 1)).assertEqual(25);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0023
     * @tc.name testPaintApi0023
     * @tc.desc Verify a lattice squeezed into a smaller destination stays inside it.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0023 begin');
      await runCase('testPaintApi0023', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 240, 10, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, 60, 60),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(3600);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 0)).assertEqual(240);
        expect(channelAt(buffer, CANVAS_SIZE, 100, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0024
     * @tc.name testPaintApi0024
     * @tc.desc Verify a lattice enlarged past the source size paints from the origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0024 begin');
      await runCase('testPaintApi0024', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 100, 150, 200));
        const first: OffscreenTarget = await createOffscreenTarget(200, 200);
        const second: OffscreenTarget = await createOffscreenTarget(200, 200);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        first.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, 200, 200),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        second.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, 200, 200),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const firstBuffer: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const secondBuffer: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        const firstInked: number = countInkedPixels(firstBuffer);
        expect(firstInked).assertLarger(0);
        expect(countInkedPixels(secondBuffer)).assertEqual(firstInked);
        expect(channelAt(firstBuffer, 200, 0, 0, 3)).assertEqual(255);
        expect(maxChannel(firstBuffer, 0)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0025
     * @tc.name testPaintApi0025
     * @tc.desc Verify lattice creation leaves the division arrays untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0025 begin');
      await runCase('testPaintApi0025', async () => {
        const xDivs: number[] = [30, 90];
        const yDivs: number[] = [45];
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, 2, 1);
        expect(xDivs.length).assertEqual(2);
        expect(xDivs[0]).assertEqual(30);
        expect(yDivs.length).assertEqual(1);
        expect(yDivs[0]).assertEqual(45);
        expect(lattice !== null).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0026
     * @tc.name testPaintApi0026
     * @tc.desc Verify two lattices built from the same divisions are separate objects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0026 begin');
      await runCase('testPaintApi0026', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 11, 22, 33));
        const first: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        const second: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawImageLattice(source.pixelMap, first, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImageLattice(source.pixelMap, second, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(first === second).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0027
     * @tc.name testPaintApi0027
     * @tc.desc Verify one lattice object can serve two independent canvases.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0027 begin');
      await runCase('testPaintApi0027', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 77, 88, 99));
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([40], [40], 1, 1);
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        first.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        second.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        const firstBuffer: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const secondBuffer: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(countInkedPixels(firstBuffer)).assertEqual(14400);
        expect(countInkedPixels(secondBuffer)).assertEqual(14400);
        expect(channelAt(secondBuffer, CANVAS_SIZE, 80, 20, 1)).assertEqual(88);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0028
     * @tc.name testPaintApi0028
     * @tc.desc Verify a three by three lattice covers the whole destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0028 begin');
      await runCase('testPaintApi0028', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 12, 240, 36));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([40, 80], [40, 80], 2, 2);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 0, 0, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 119, 119, 1)).assertEqual(240);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0029
     * @tc.name testPaintApi0029
     * @tc.desc Verify a lattice with explicit source bounds still covers the destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0029 begin');
      await runCase('testPaintApi0029', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 55, 66, 77));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice =
          drawing.Lattice.createImageLattice([30], [30], 1, 1, ltrb(0, 0, 60, 60));
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 1)).assertEqual(66);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0030
     * @tc.name testPaintApi0030
     * @tc.desc Verify both filter modes paint the same solid lattice result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0030 begin');
      await runCase('testPaintApi0030', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 88, 99, 111));
        const nearest: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const linear: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([50], [70], 1, 1);
        nearest.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        linear.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_LINEAR);
        const nearestBuffer: ArrayBuffer = await readPixelBuffer(nearest.pixelMap);
        const linearBuffer: ArrayBuffer = await readPixelBuffer(linear.pixelMap);
        expect(countInkedPixels(nearestBuffer)).assertEqual(14400);
        expect(countInkedPixels(linearBuffer)).assertEqual(14400);
        expect(channelAt(linearBuffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(88);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0031
     * @tc.name testPaintApi0031
     * @tc.desc Verify transparent rect types leave two lattice cells unpainted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0031 begin');
      await runCase('testPaintApi0031', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 44, 55, 66));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rectTypes: drawing.RectType[] = [
          drawing.RectType.DEFAULT,
          drawing.RectType.TRANSPARENT,
          drawing.RectType.TRANSPARENT,
          drawing.RectType.DEFAULT
        ];
        const lattice: drawing.Lattice =
          drawing.Lattice.createImageLattice([60], [60], 1, 1, null, rectTypes, null);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 30, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 90, 3)).assertEqual(0);
        expect(inked < 14400 && inked > 3600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0032
     * @tc.name testPaintApi0032
     * @tc.desc Verify an all transparent lattice paints nothing at all.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0032 begin');
      await runCase('testPaintApi0032', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 99, 88, 77));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rectTypes: drawing.RectType[] = [
          drawing.RectType.TRANSPARENT,
          drawing.RectType.TRANSPARENT,
          drawing.RectType.TRANSPARENT,
          drawing.RectType.TRANSPARENT
        ];
        const lattice: drawing.Lattice =
          drawing.Lattice.createImageLattice([60], [60], 1, 1, null, rectTypes, null);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0033
     * @tc.name testPaintApi0033
     * @tc.desc Verify fixed color rect types paint the given structured colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0033 begin');
      await runCase('testPaintApi0033', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 44, 55, 66));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rectTypes: drawing.RectType[] = [
          drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR
        ];
        const colors: common2D.Color[] = [
          rgba(255, 0, 255, 0),
          rgba(255, 0, 255, 0),
          rgba(255, 0, 255, 0),
          rgba(255, 0, 255, 0)
        ];
        const lattice: drawing.Lattice =
          drawing.Lattice.createImageLattice([60], [60], 1, 1, null, rectTypes, colors);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 0)).assertEqual(0);
        expect(maxChannel(buffer, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0034
     * @tc.name testPaintApi0034
     * @tc.desc Verify fixed color rect types accept the packed color overload.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0034 begin');
      await runCase('testPaintApi0034', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 44, 55, 66));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const rectTypes: drawing.RectType[] = [
          drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR,
          drawing.RectType.FIXEDCOLOR
        ];
        const colors: number[] = [0xFF00FF00, 0xFF00FF00, 0xFF00FF00, 0xFF00FF00];
        const lattice: drawing.Lattice =
          drawing.Lattice.createImageLattice([60], [60], 1, 1, null, rectTypes, colors);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 90, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 90, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 90, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0035
     * @tc.name testPaintApi0035
     * @tc.desc Verify a lattice of a transparent source paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0035 begin');
      await runCase('testPaintApi0035', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(0, 0, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(maxChannel(buffer, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0036
     * @tc.name testPaintApi0036
     * @tc.desc Verify lattice drawing leaves the source bitmap untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0036 begin');
      await runCase('testPaintApi0036', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 33, 99, 144));
        const before: ArrayBuffer = await readPixelBuffer(source.pixelMap);
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const after: ArrayBuffer = await readPixelBuffer(source.pixelMap);
        expect(countInkedPixels(before)).assertEqual(14400);
        expect(countInkedPixels(after)).assertEqual(14400);
        expect(channelAt(after, CANVAS_SIZE, 60, 60, 2)).assertEqual(144);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0037
     * @tc.name testPaintApi0037
     * @tc.desc Verify a brush rect drawn after a lattice covers its own quarter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0037 begin');
      await runCase('testPaintApi0037', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 200, 0, 0));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.drawRect(ltrb(0, 0, 60, 60));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 90, 0)).assertEqual(200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0038
     * @tc.name testPaintApi0038
     * @tc.desc Verify two lattice draws land on their own destination rects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0038 begin');
      await runCase('testPaintApi0038', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 0, 120, 240));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, 60, 60),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(60, 60, 120, 120),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(7200);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 1)).assertEqual(120);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 90, 2)).assertEqual(240);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0039
     * @tc.name testPaintApi0039
     * @tc.desc Verify a clip rect limits how much of the lattice is painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0039 begin');
      await runCase('testPaintApi0039', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 60, 30, 15));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.clipRect(ltrb(0, 0, 60, CANVAS_SIZE));
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(7200);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 60, 0)).assertEqual(60);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0040
     * @tc.name testPaintApi0040
     * @tc.desc Verify restore lifts the clip so the second lattice draw is complete.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0040 begin');
      await runCase('testPaintApi0040', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 6, 66, 126));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.save();
        target.canvas.clipRect(ltrb(0, 0, 60, CANVAS_SIZE));
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        target.canvas.restore();
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 60, 1)).assertEqual(66);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0041
     * @tc.name testPaintApi0041
     * @tc.desc Verify a lattice destination offset leaves the top left corner empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0041 begin');
      await runCase('testPaintApi0041', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 18, 36, 54));
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([60], [60], 1, 1);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(40, 40, 160, 160),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, 200, 100, 100, 0)).assertEqual(18);
        expect(channelAt(buffer, 200, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0042
     * @tc.name testPaintApi0042
     * @tc.desc Verify an empty division list creates a single cell lattice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0042 begin');
      await runCase('testPaintApi0042', async () => {
        const source: OffscreenTarget = await solidSource(CANVAS_SIZE, rgba(255, 111, 122, 133));
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const lattice: drawing.Lattice = drawing.Lattice.createImageLattice([], [], 0, 0);
        target.canvas.drawImageLattice(source.pixelMap, lattice, ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE),
          drawing.FilterMode.FILTER_MODE_NEAREST);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(111);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0043
     * @tc.name testPaintApi0043
     * @tc.desc Verify an attached pen strokes the border only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPaintApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0043 begin');
      await runCase('testPaintApi0043', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 6));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) < RECT_AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0044
     * @tc.name testPaintApi0044
     * @tc.desc Verify an attached pen paints every sampled border position.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0044 begin');
      await runCase('testPaintApi0044', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(0, 128, 0, 6));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const xs: number[] = [20, 60, 99, 60];
        const ys: number[] = [60, 20, 60, 99];
        let inked: number = 0;
        for (let index: number = 0; index < xs.length; index++) {
          if (channelAt(buffer, CANVAS_SIZE, xs[index], ys[index], 3) === 255) {
            inked += 1;
          }
        }
        expect(inked).assertEqual(4);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 1)).assertEqual(128);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0045
     * @tc.name testPaintApi0045
     * @tc.desc Verify a detached pen leaves the default black fill behind.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0045 begin');
      await runCase('testPaintApi0045', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 6));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        target.canvas.drawRect(ltrb(0, 0, 20, 20));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0046
     * @tc.name testPaintApi0046
     * @tc.desc Verify an attached brush fills the whole rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPaintApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0046 begin');
      await runCase('testPaintApi0046', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachBrush(opaqueBrush(255, 0, 0));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(RECT_AREA);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0047
     * @tc.name testPaintApi0047
     * @tc.desc Verify a detached brush falls back to the default black brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0047 begin');
      await runCase('testPaintApi0047', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachBrush(opaqueBrush(0, 255, 0));
        target.canvas.detachBrush();
        target.canvas.drawRect(ltrb(0, 0, 20, 20));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0048
     * @tc.name testPaintApi0048
     * @tc.desc Verify a pen and a brush together fill and stroke the rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0048 begin');
      await runCase('testPaintApi0048', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 6));
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachBrush();
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 0)).assertEqual(255);
        expect(countInkedPixels(buffer) >= RECT_AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0049
     * @tc.name testPaintApi0049
     * @tc.desc Verify detaching the brush keeps the pen stroke active.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0049 begin');
      await runCase('testPaintApi0049', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 6));
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.detachBrush();
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 3)).assertEqual(255);
        expect(countInkedPixels(buffer) < RECT_AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0050
     * @tc.name testPaintApi0050
     * @tc.desc Verify detaching the pen keeps the brush fill active.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0050 begin');
      await runCase('testPaintApi0050', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 6));
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.detachPen();
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(RECT_AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0051
     * @tc.name testPaintApi0051
     * @tc.desc Verify a translucent brush blends with the backdrop color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0051 begin');
      await runCase('testPaintApi0051', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 255, 255, 255), drawing.BlendMode.SRC);
        target.canvas.attachBrush(createFillBrush(rgba(128, 0, 0, 255)));
        target.canvas.drawRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2) > 200).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0) < 140).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0052
     * @tc.name testPaintApi0052
     * @tc.desc Verify the showcase paints a red dominant result on the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0052 begin');
      await runCase('testPaintApi0052', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintPenBrushShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(maxChannel(buffer, 3)).assertLarger(0);
        expect(maxChannel(buffer, 0) > maxChannel(buffer, 2)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0053
     * @tc.name testPaintApi0053
     * @tc.desc Verify the showcase stays inside its rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0053 begin');
      await runCase('testPaintApi0053', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintPenBrushShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, 200, 100, 80, 3)).assertLarger(0);
        expect(channelAt(buffer, 200, 5, 5, 3)).assertEqual(0);
        expect(channelAt(buffer, 200, 190, 190, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0054
     * @tc.name testPaintApi0054
     * @tc.desc Verify two showcase runs paint the same number of pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0054 begin');
      await runCase('testPaintApi0054', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(200, 200);
        const second: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintPenBrushShowcase(first.canvas);
        paintPenBrushShowcase(second.canvas);
        const firstBuffer: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const secondBuffer: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(countInkedPixels(firstBuffer)).assertEqual(countInkedPixels(secondBuffer));
        expect(maxChannel(firstBuffer, 3)).assertEqual(maxChannel(secondBuffer, 3));
        expect(channelAt(secondBuffer, 200, 100, 80, 3)).assertLarger(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0055
     * @tc.name testPaintApi0055
     * @tc.desc Verify a wider pen paints more border pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0055 begin');
      await runCase('testPaintApi0055', async () => {
        const thin: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const thick: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        thin.canvas.attachPen(opaquePen(255, 0, 0, 2));
        thin.canvas.drawRect(ltrb(20, 20, 100, 100));
        thin.canvas.detachPen();
        thick.canvas.attachPen(opaquePen(255, 0, 0, 12));
        thick.canvas.drawRect(ltrb(20, 20, 100, 100));
        thick.canvas.detachPen();
        const thinBuffer: ArrayBuffer = await readPixelBuffer(thin.pixelMap);
        const thickBuffer: ArrayBuffer = await readPixelBuffer(thick.pixelMap);
        expect(countInkedPixels(thinBuffer)).assertLarger(0);
        expect(countInkedPixels(thickBuffer) > countInkedPixels(thinBuffer)).assertTrue();
        expect(channelAt(thickBuffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0056
     * @tc.name testPaintApi0056
     * @tc.desc Verify two pens with different colors paint different channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0056 begin');
      await runCase('testPaintApi0056', async () => {
        const redTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const blueTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        redTarget.canvas.attachPen(opaquePen(255, 0, 0, 6));
        redTarget.canvas.drawRect(ltrb(20, 20, 100, 100));
        redTarget.canvas.detachPen();
        blueTarget.canvas.attachPen(opaquePen(0, 0, 255, 6));
        blueTarget.canvas.drawRect(ltrb(20, 20, 100, 100));
        blueTarget.canvas.detachPen();
        const redBuffer: ArrayBuffer = await readPixelBuffer(redTarget.pixelMap);
        const blueBuffer: ArrayBuffer = await readPixelBuffer(blueTarget.pixelMap);
        expect(countInkedPixels(redBuffer)).assertEqual(countInkedPixels(blueBuffer));
        expect(channelAt(redBuffer, CANVAS_SIZE, 20, 60, 0)).assertEqual(255);
        expect(channelAt(redBuffer, CANVAS_SIZE, 20, 60, 2)).assertEqual(0);
        expect(channelAt(blueBuffer, CANVAS_SIZE, 20, 60, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0057
     * @tc.name testPaintApi0057
     * @tc.desc Verify brush alpha controls the painted alpha while covering the same area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0057 begin');
      await runCase('testPaintApi0057', async () => {
        const opaque: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const translucent: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        opaque.canvas.attachBrush(opaqueBrush(255, 0, 0));
        opaque.canvas.drawRect(ltrb(20, 20, 100, 100));
        opaque.canvas.detachBrush();
        translucent.canvas.attachBrush(createFillBrush(rgba(128, 0, 0, 255)));
        translucent.canvas.drawRect(ltrb(20, 20, 100, 100));
        translucent.canvas.detachBrush();
        const opaqueBuffer: ArrayBuffer = await readPixelBuffer(opaque.pixelMap);
        const translucentBuffer: ArrayBuffer = await readPixelBuffer(translucent.pixelMap);
        expect(countInkedPixels(opaqueBuffer)).assertEqual(countInkedPixels(translucentBuffer));
        expect(maxChannel(opaqueBuffer, 3)).assertEqual(255);
        expect(maxChannel(translucentBuffer, 3)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0058
     * @tc.name testPaintApi0058
     * @tc.desc Verify a second attached brush replaces the first one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0058 begin');
      await runCase('testPaintApi0058', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachBrush(opaqueBrush(255, 0, 0));
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0059
     * @tc.name testPaintApi0059
     * @tc.desc Verify a second attached pen replaces the first one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0059 begin');
      await runCase('testPaintApi0059', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 6));
        target.canvas.attachPen(opaquePen(0, 0, 255, 6));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 0)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0060
     * @tc.name testPaintApi0060
     * @tc.desc Verify detaching paint on a clean canvas keeps the default brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0060 begin');
      await runCase('testPaintApi0060', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.detachBrush();
        target.canvas.detachPen();
        target.canvas.drawRect(ltrb(0, 0, 20, 20));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 0)).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0061
     * @tc.name testPaintApi0061
     * @tc.desc Verify the brush attached at draw time decides the fill color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0061 begin');
      await runCase('testPaintApi0061', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachBrush(opaqueBrush(255, 0, 0));
        target.canvas.drawRect(ltrb(0, 0, 60, 60));
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.drawRect(ltrb(60, 60, 120, 120));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 30, 2)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 90, 2)).assertEqual(255);
        expect(countInkedPixels(buffer)).assertEqual(7200);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0062
     * @tc.name testPaintApi0062
     * @tc.desc Verify detaching both paints restores the default black brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0062 begin');
      await runCase('testPaintApi0062', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 6));
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.detachPen();
        target.canvas.detachBrush();
        target.canvas.drawRect(ltrb(0, 0, 20, 20));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 3)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 1)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 10, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0063
     * @tc.name testPaintApi0063
     * @tc.desc Verify a wide stroke spans a narrow band around the rectangle edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0063 begin');
      await runCase('testPaintApi0063', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(255, 0, 0, 10));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        let band: number = 0;
        for (let x: number = 0; x < 40; x++) {
          if (channelAt(buffer, CANVAS_SIZE, x, 60, 3) === 255) {
            band += 1;
          }
        }
        expect(band > 7).assertTrue();
        expect(band < 15).assertTrue();
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0064
     * @tc.name testPaintApi0064
     * @tc.desc Verify pen and brush paints keep their own colors on one rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0064 begin');
      await runCase('testPaintApi0064', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachBrush(opaqueBrush(255, 0, 0));
        target.canvas.attachPen(opaquePen(0, 0, 255, 8));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(0);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0065
     * @tc.name testPaintApi0065
     * @tc.desc Verify the brush effect preset blends over a white backdrop.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0065 begin');
      await runCase('testPaintApi0065', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.drawColor(rgba(255, 255, 255, 255), drawing.BlendMode.SRC);
        const brush: drawing.Brush = applyBrushEffects(createFillBrush(rgba(0x99, 255, 221, 0)));
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const red: number = channelAt(buffer, CANVAS_SIZE, 60, 60, 0);
        const blue: number = channelAt(buffer, CANVAS_SIZE, 60, 60, 2);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 3)).assertEqual(255);
        expect(blue).assertEqual(191);
        expect(red).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0066
     * @tc.name testPaintApi0066
     * @tc.desc Verify the pen effect preset strokes with its alpha and channel order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0066 begin');
      await runCase('testPaintApi0066', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const pen: drawing.Pen = applyPenEffects(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5));
        target.canvas.attachPen(pen);
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const red: number = channelAt(buffer, CANVAS_SIZE, 20, 60, 0);
        const green: number = channelAt(buffer, CANVAS_SIZE, 20, 60, 1);
        const blue: number = channelAt(buffer, CANVAS_SIZE, 20, 60, 2);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 60, 3)).assertEqual(38);
        expect(red).assertEqual(0);
        expect(blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0067
     * @tc.name testPaintApi0067
     * @tc.desc Verify drawing does not mutate the attached paint objects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0067 begin');
      await runCase('testPaintApi0067', async () => {
        const pen: drawing.Pen = applyPenEffects(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5));
        const brush: drawing.Brush = applyBrushEffects(createFillBrush(rgba(0x99, 255, 221, 0)));
        const penBefore: number = snapshotPen(pen).hex;
        const brushBefore: number = snapshotBrush(brush).hex;
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(pen);
        target.canvas.attachBrush(brush);
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachBrush();
        target.canvas.detachPen();
        expect(snapshotPen(pen).hex).assertEqual(penBefore);
        expect(snapshotBrush(brush).hex).assertEqual(brushBefore);
        expect(snapshotBrush(brush).alpha).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0068
     * @tc.name testPaintApi0068
     * @tc.desc Verify one pen paints the same result on two canvases.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0068 begin');
      await runCase('testPaintApi0068', async () => {
        const pen: drawing.Pen = opaquePen(255, 64, 128, 4);
        const first: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const second: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        first.canvas.attachPen(pen);
        first.canvas.drawRect(ltrb(20, 20, 100, 100));
        first.canvas.detachPen();
        second.canvas.attachPen(pen);
        second.canvas.drawRect(ltrb(20, 20, 100, 100));
        second.canvas.detachPen();
        const firstBuffer: ArrayBuffer = await readPixelBuffer(first.pixelMap);
        const secondBuffer: ArrayBuffer = await readPixelBuffer(second.pixelMap);
        expect(countInkedPixels(firstBuffer)).assertEqual(countInkedPixels(secondBuffer));
        expect(channelAt(secondBuffer, CANVAS_SIZE, 20, 60, 1)).assertEqual(64);
        expect(channelAt(secondBuffer, CANVAS_SIZE, 20, 60, 2)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0069
     * @tc.name testPaintApi0069
     * @tc.desc Verify clear replaces everything a brush has painted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0069 begin');
      await runCase('testPaintApi0069', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachBrush(opaqueBrush(255, 0, 0));
        target.canvas.drawRect(ltrb(20, 20, 100, 100));
        target.canvas.detachBrush();
        target.canvas.clear(rgba(255, 0, 0, 255));
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 2)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 60, 60, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0070
     * @tc.name testPaintApi0070
     * @tc.desc Verify a clip rect limits how much a brush fills.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0070 begin');
      await runCase('testPaintApi0070', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.clipRect(ltrb(0, 0, 60, CANVAS_SIZE));
        target.canvas.attachBrush(opaqueBrush(255, 0, 0));
        target.canvas.drawRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(7200);
        expect(channelAt(buffer, CANVAS_SIZE, 30, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 90, 60, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0071
     * @tc.name testPaintApi0071
     * @tc.desc Verify a fully transparent brush paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPaintApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0071 begin');
      await runCase('testPaintApi0071', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachBrush(createFillBrush(rgba(0, 255, 0, 0)));
        target.canvas.drawRect(ltrb(0, 0, CANVAS_SIZE, CANVAS_SIZE));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 1)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PAINT_0072
     * @tc.name testPaintApi0072
     * @tc.desc Verify three paints leave three independent marks on one canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPaintApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0072 begin');
      await runCase('testPaintApi0072', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        target.canvas.attachPen(opaquePen(0, 255, 0, 6));
        target.canvas.drawRect(ltrb(10, 10, 50, 50));
        target.canvas.detachPen();
        target.canvas.attachBrush(opaqueBrush(255, 0, 0));
        target.canvas.drawRect(ltrb(60, 60, 110, 110));
        target.canvas.attachBrush(opaqueBrush(0, 0, 255));
        target.canvas.drawRect(ltrb(0, 90, 40, 119));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(channelAt(buffer, CANVAS_SIZE, 10, 30, 1)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 80, 80, 0)).assertEqual(255);
        expect(channelAt(buffer, CANVAS_SIZE, 20, 100, 2)).assertEqual(255);
        expect(countInkedPixels(buffer)).assertLarger(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPaintApi0072 end');
    });
  });
}
