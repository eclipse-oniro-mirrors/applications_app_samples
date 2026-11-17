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
import { drawing } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  blendColorFilter,
  colorShader,
  composeColorFilter,
  composePathEffect,
  composeShader,
  conicalGradientShader,
  cornerPathEffect,
  dashPathEffect,
  discretePathEffect,
  gammaColorFilters,
  lightingColorFilter,
  linearGradientShader,
  lumaColorFilter,
  matrixColorFilter,
  pathDashEffect,
  radialGradientShader,
  sumPathEffect,
  sweepGradientShader
} from '../../../main/ets/drawing/DrawingEffects';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 120;
const AREA: number = SIZE * SIZE;
const WIDE: number = 200;
const WIDE_AREA: number = WIDE * WIDE;

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
 * Create a brush that paints with the given shader.
 *
 * @param { drawing.ShaderEffect } shader - Shader effect.
 * @returns { drawing.Brush } Brush carrying the shader.
 */
function shaderBrush(shader: drawing.ShaderEffect): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setShaderEffect(shader);
  brush.setColor(rgba(255, 255, 255, 255));
  return brush;
}

/**
 * Create a white brush that paints through the given color filter.
 *
 * @param { drawing.ColorFilter } filter - Color filter.
 * @returns { drawing.Brush } Brush carrying the filter.
 */
function filterBrush(filter: drawing.ColorFilter): drawing.Brush {
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 255, 255, 255));
  brush.setColorFilter(filter);
  return brush;
}

/**
 * Fill a square canvas with one brush and read the pixels back.
 *
 * @param { number } size - Square edge length in px.
 * @param { drawing.Brush } brush - Fill brush.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function render(size: number, brush: drawing.Brush): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(size, size);
  target.canvas.attachBrush(brush);
  target.canvas.drawRect(ltrb(0, 0, size, size));
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Render one brush into a square canvas twice and keep both buffers.
 *
 * @param { number } size - Square edge length in px.
 * @param { drawing.Brush } brush - Fill brush.
 * @returns { Promise<ArrayBuffer[]> } Two raw pixel buffers.
 */
async function renderTwice(size: number, brush: drawing.Brush): Promise<ArrayBuffer[]> {
  const first: ArrayBuffer = await render(size, brush);
  const second: ArrayBuffer = await render(size, brush);
  const buffers: ArrayBuffer[] = [];
  buffers.push(first);
  buffers.push(second);
  return buffers;
}

/**
 * Stroke one horizontal line with the given pen and read the pixels back.
 *
 * @param { drawing.Pen } pen - Stroke pen.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderStroke(pen: drawing.Pen): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  target.canvas.attachPen(pen);
  target.canvas.drawLine(20, 60, 100, 60);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

/**
 * Stroke a line with the given path effect.
 *
 * @param { drawing.PathEffect | null } effect - Path effect, null for none.
 * @param { number } width - Stroke width in px.
 * @param { number } alpha - Stroke alpha.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderEffect(effect: drawing.PathEffect | null, width: number,
  alpha: number): Promise<ArrayBuffer> {
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(alpha, 255, 255, 255));
  pen.setStrokeWidth(width);
  pen.setPathEffect(effect);
  return renderStroke(pen);
}

/**
 * Stroke a V shaped polyline with the given path effect.
 *
 * @param { drawing.PathEffect | null } effect - Path effect, null for none.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderPolyline(effect: drawing.PathEffect | null): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const path: drawing.Path = new drawing.Path();
  path.moveTo(10, 90);
  path.lineTo(60, 30);
  path.lineTo(110, 90);
  const pen: drawing.Pen = new drawing.Pen();
  pen.setColor(rgba(255, 255, 255, 255));
  pen.setStrokeWidth(6);
  pen.setPathEffect(effect);
  target.canvas.attachPen(pen);
  target.canvas.drawPath(path);
  target.canvas.detachPen();
  return readPixelBuffer(target.pixelMap);
}

export default function filterApiCoreTest() {
  describe('FilterApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_FILTER_0001
     * @tc.name testFilterApi0001
     * @tc.desc Verify a red color shader fills the whole canvas with red.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFilterApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0001 begin');
      await runCase('testFilterApi0001', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0xFFFF0000)));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0002
     * @tc.name testFilterApi0002
     * @tc.desc Verify a green color shader fills the whole canvas with green.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFilterApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0002 begin');
      await runCase('testFilterApi0002', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0xFF00FF00)));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 10, 110, 1)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 10, 110, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0003
     * @tc.name testFilterApi0003
     * @tc.desc Verify a blue color shader fills the whole canvas with blue.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFilterApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0003 begin');
      await runCase('testFilterApi0003', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0xFF0000FF)));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 100, 20, 2)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 100, 20, 1)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 100, 20, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0004
     * @tc.name testFilterApi0004
     * @tc.desc Verify a half transparent color shader keeps half alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0004 begin');
      await runCase('testFilterApi0004', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0x80FF0000)));
        const alpha: number = channelAt(buffer, SIZE, 60, 60, 3);
        expect(alpha > 100 && alpha < 160).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(128);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0005
     * @tc.name testFilterApi0005
     * @tc.desc Verify a fully transparent color shader leaves the canvas empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0005 begin');
      await runCase('testFilterApi0005', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0x00FF0000)));
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 0, 0, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0006
     * @tc.name testFilterApi0006
     * @tc.desc Verify one color shader object paints two canvases identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0006 begin');
      await runCase('testFilterApi0006', async () => {
        const shader: drawing.ShaderEffect = colorShader(0xFF123456);
        const first: ArrayBuffer = await render(SIZE, shaderBrush(shader));
        const second: ArrayBuffer = await render(SIZE, shaderBrush(shader));
        expect(channelAt(first, SIZE, 30, 90, 0)).assertEqual(0x12);
        expect(channelAt(second, SIZE, 30, 90, 1)).assertEqual(0x34);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(channelAt(first, SIZE, 30, 90, 2)).assertEqual(channelAt(second, SIZE, 30, 90, 2));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0007
     * @tc.name testFilterApi0007
     * @tc.desc Verify two shader instances of one color render the same pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0007 begin');
      await runCase('testFilterApi0007', async () => {
        const first: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0xFF204080)));
        const second: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0xFF204080)));
        expect(countInkedPixels(first)).assertEqual(AREA);
        expect(channelAt(first, SIZE, 90, 30, 0)).assertEqual(channelAt(second, SIZE, 90, 30, 0));
        expect(channelAt(second, SIZE, 90, 30, 2)).assertEqual(0x80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0008
     * @tc.name testFilterApi0008
     * @tc.desc Verify the linear gradient starts red near the start point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0008 begin');
      await runCase('testFilterApi0008', async () => {
        const buffer: ArrayBuffer = await render(WIDE, shaderBrush(linearGradientShader()));
        expect(channelAt(buffer, WIDE, 2, 2, 0) > 200).assertTrue();
        expect(channelAt(buffer, WIDE, 2, 2, 2) < 60).assertTrue();
        expect(channelAt(buffer, WIDE, 2, 2, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0009
     * @tc.name testFilterApi0009
     * @tc.desc Verify the linear gradient ends blue near the end point.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0009 begin');
      await runCase('testFilterApi0009', async () => {
        const buffer: ArrayBuffer = await render(WIDE, shaderBrush(linearGradientShader()));
        const startRed: number = channelAt(buffer, WIDE, 2, 2, 0);
        const endRed: number = channelAt(buffer, WIDE, 197, 197, 0);
        const endBlue: number = channelAt(buffer, WIDE, 197, 197, 2);
        expect(endBlue > 200).assertTrue();
        expect(endBlue).assertEqual(249);
        expect(endRed < startRed).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0010
     * @tc.name testFilterApi0010
     * @tc.desc Verify the linear gradient middle stop is green.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0010 begin');
      await runCase('testFilterApi0010', async () => {
        const buffer: ArrayBuffer = await render(WIDE, shaderBrush(linearGradientShader()));
        expect(channelAt(buffer, WIDE, 100, 100, 1) > 200).assertTrue();
        expect(channelAt(buffer, WIDE, 100, 100, 0) < 60).assertTrue();
        expect(channelAt(buffer, WIDE, 100, 100, 2) < 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0011
     * @tc.name testFilterApi0011
     * @tc.desc Verify the linear gradient covers the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0011 begin');
      await runCase('testFilterApi0011', async () => {
        const buffer: ArrayBuffer = await render(WIDE, shaderBrush(linearGradientShader()));
        expect(countInkedPixels(buffer)).assertEqual(WIDE_AREA);
        expect(channelAt(buffer, WIDE, 0, 0, 3)).assertEqual(255);
        expect(channelAt(buffer, WIDE, 199, 199, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0012
     * @tc.name testFilterApi0012
     * @tc.desc Verify the red channel falls monotonically along the gradient axis.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0012 begin');
      await runCase('testFilterApi0012', async () => {
        const buffer: ArrayBuffer = await render(WIDE, shaderBrush(linearGradientShader()));
        const start: number = channelAt(buffer, WIDE, 20, 20, 0);
        const middle: number = channelAt(buffer, WIDE, 100, 100, 0);
        const end: number = channelAt(buffer, WIDE, 180, 180, 0);
        expect(start > middle).assertTrue();
        expect(middle).assertEqual(0);
        expect(end < 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0013
     * @tc.name testFilterApi0013
     * @tc.desc Verify the radial gradient centre uses the first stop color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0013 begin');
      await runCase('testFilterApi0013', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(radialGradientShader()));
        expect(channelAt(buffer, SIZE, 100, 100, 0) > 250).assertTrue();
        expect(channelAt(buffer, SIZE, 100, 100, 1) > 160).assertTrue();
        expect(channelAt(buffer, SIZE, 100, 100, 3)).assertEqual(253);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0014
     * @tc.name testFilterApi0014
     * @tc.desc Verify the radial gradient centre is fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0014 begin');
      await runCase('testFilterApi0014', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(radialGradientShader()));
        const centre: number = channelAt(buffer, SIZE, 100, 100, 3);
        const inner: number = channelAt(buffer, SIZE, 110, 100, 3);
        const rim: number = channelAt(buffer, SIZE, 118, 100, 3);
        expect(centre).assertEqual(253);
        expect(inner < centre).assertTrue();
        expect(rim < inner).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0015
     * @tc.name testFilterApi0015
     * @tc.desc Verify the radial gradient outer corner is translucent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0015 begin');
      await runCase('testFilterApi0015', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(radialGradientShader()));
        const corner: number = channelAt(buffer, SIZE, 5, 5, 3);
        expect(corner < 255).assertTrue();
        expect(corner > 0).assertTrue();
        expect(channelAt(buffer, SIZE, 5, 5, 0) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0016
     * @tc.name testFilterApi0016
     * @tc.desc Verify the repeating radial gradient leaves no fully empty pixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0016 begin');
      await runCase('testFilterApi0016', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(radialGradientShader()));
        expect(countInkedPixels(buffer) >= AREA - SIZE).assertTrue();
        expect(channelAt(buffer, SIZE, 0, 0, 3) > 0).assertTrue();
        expect(channelAt(buffer, SIZE, 119, 119, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0017
     * @tc.name testFilterApi0017
     * @tc.desc Verify the sweep gradient starts red towards the positive x axis.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0017 begin');
      await runCase('testFilterApi0017', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(sweepGradientShader()));
        expect(channelAt(buffer, SIZE, 150, 100, 0)).assertEqual(2);
        expect(channelAt(buffer, SIZE, 150, 100, 1)).assertEqual(253);
        expect(channelAt(buffer, SIZE, 150, 100, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0018
     * @tc.name testFilterApi0018
     * @tc.desc Verify the sweep gradient reaches the green to blue segment above the centre.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0018 begin');
      await runCase('testFilterApi0018', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(sweepGradientShader()));
        expect(channelAt(buffer, SIZE, 100, 50, 0) < 30).assertTrue();
        expect(channelAt(buffer, SIZE, 100, 50, 1) > 90).assertTrue();
        expect(channelAt(buffer, SIZE, 100, 50, 2) > 90).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0019
     * @tc.name testFilterApi0019
     * @tc.desc Verify the mirrored sweep gradient covers the whole canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0019 begin');
      await runCase('testFilterApi0019', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(sweepGradientShader()));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 2, 100, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 118, 2, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0020
     * @tc.name testFilterApi0020
     * @tc.desc Verify two sweep positions hold different colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0020 begin');
      await runCase('testFilterApi0020', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(sweepGradientShader()));
        const east: number = channelAt(buffer, SIZE, 150, 100, 0);
        const north: number = channelAt(buffer, SIZE, 100, 50, 0);
        expect(east > north).assertTrue();
        expect(east - north).assertEqual(2);
        expect(north < 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0021
     * @tc.name testFilterApi0021
     * @tc.desc Verify the conical gradient centre uses the first stop color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0021 begin');
      await runCase('testFilterApi0021', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(conicalGradientShader()));
        expect(channelAt(buffer, SIZE, 40, 40, 0) > 25).assertTrue();
        expect(channelAt(buffer, SIZE, 40, 40, 0)).assertEqual(45);
        expect(channelAt(buffer, SIZE, 40, 40, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0022
     * @tc.name testFilterApi0022
     * @tc.desc Verify the decal conical gradient leaves far pixels transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0022 begin');
      await runCase('testFilterApi0022', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(conicalGradientShader()));
        expect(channelAt(buffer, SIZE, 115, 115, 3)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 119, 119, 3)).assertEqual(0);
        expect(countInkedPixels(buffer) < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0023
     * @tc.name testFilterApi0023
     * @tc.desc Verify the conical gradient paints a non empty inner disc.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0023 begin');
      await runCase('testFilterApi0023', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(conicalGradientShader()));
        expect(countInkedPixels(buffer) > AREA / 4).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 20, 40, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0024
     * @tc.name testFilterApi0024
     * @tc.desc Verify the composed shader shows the foreground color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0024 begin');
      await runCase('testFilterApi0024', async () => {
        const buffer: ArrayBuffer = await render(SIZE, shaderBrush(composeShader()));
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(0x99);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(0x66);
        expect(channelAt(buffer, SIZE, 60, 60, 2)).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0025
     * @tc.name testFilterApi0025
     * @tc.desc Verify the composed shader is not equal to its background shader.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0025 begin');
      await runCase('testFilterApi0025', async () => {
        const composed: ArrayBuffer = await render(SIZE, shaderBrush(composeShader()));
        const background: ArrayBuffer = await render(SIZE, shaderBrush(colorShader(0xFF336699)));
        expect(channelAt(composed, SIZE, 60, 60, 2)).assertEqual(0x33);
        expect(channelAt(background, SIZE, 60, 60, 2)).assertEqual(0x99);
        expect(channelAt(composed, SIZE, 60, 60, 2) !== channelAt(background, SIZE, 60, 60, 2)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0026
     * @tc.name testFilterApi0026
     * @tc.desc Verify the composed shader renders the same pixels twice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0026 begin');
      await runCase('testFilterApi0026', async () => {
        const buffers: ArrayBuffer[] = await renderTwice(SIZE, shaderBrush(composeShader()));
        expect(countInkedPixels(buffers[0])).assertEqual(AREA);
        expect(channelAt(buffers[0], SIZE, 10, 10, 1)).assertEqual(channelAt(buffers[1], SIZE, 10, 10, 1));
        expect(channelAt(buffers[1], SIZE, 10, 10, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0027
     * @tc.name testFilterApi0027
     * @tc.desc Verify the blend color filter replaces white with red.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0027 begin');
      await runCase('testFilterApi0027', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFFFF0000)));
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0028
     * @tc.name testFilterApi0028
     * @tc.desc Verify the blend color filter replaces white with green.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0028 begin');
      await runCase('testFilterApi0028', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFF00FF00)));
        expect(channelAt(buffer, SIZE, 20, 20, 1)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 20, 20, 0)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 20, 20, 2)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0029
     * @tc.name testFilterApi0029
     * @tc.desc Verify the blend color filter replaces white with blue.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0029 begin');
      await runCase('testFilterApi0029', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFF0000FF)));
        expect(channelAt(buffer, SIZE, 90, 90, 2)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 90, 90, 0)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 90, 90, 1)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0030
     * @tc.name testFilterApi0030
     * @tc.desc Verify a translucent blend filter lowers the painted alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0030 begin');
      await runCase('testFilterApi0030', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0x80FF0000)));
        const alpha: number = channelAt(buffer, SIZE, 60, 60, 3);
        expect(alpha > 100).assertTrue();
        expect(alpha < 160).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0031
     * @tc.name testFilterApi0031
     * @tc.desc Verify the black blend filter turns white into black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0031 begin');
      await runCase('testFilterApi0031', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFF000000)));
        expect(channelAt(buffer, SIZE, 30, 30, 0)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 30, 30, 1)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 30, 30, 2)).assertEqual(0);
        expect(channelAt(buffer, SIZE, 30, 30, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0032
     * @tc.name testFilterApi0032
     * @tc.desc Verify the blend filter does not change painted coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0032 begin');
      await runCase('testFilterApi0032', async () => {
        const filtered: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFF336699)));
        const plain: ArrayBuffer = await render(SIZE, filterBrush(matrixColorFilter()));
        expect(countInkedPixels(filtered)).assertEqual(AREA);
        expect(countInkedPixels(plain)).assertEqual(AREA);
        expect(channelAt(filtered, SIZE, 5, 115, 2)).assertEqual(0x99);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0033
     * @tc.name testFilterApi0033
     * @tc.desc Verify one blend filter object renders twice identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0033 begin');
      await runCase('testFilterApi0033', async () => {
        const filter: drawing.ColorFilter = blendColorFilter(0xFF804020);
        const buffers: ArrayBuffer[] = await renderTwice(SIZE, filterBrush(filter));
        expect(channelAt(buffers[0], SIZE, 60, 60, 0)).assertEqual(0x80);
        expect(channelAt(buffers[0], SIZE, 60, 60, 1)).assertEqual(channelAt(buffers[1], SIZE, 60, 60, 1));
        expect(countInkedPixels(buffers[1])).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0034
     * @tc.name testFilterApi0034
     * @tc.desc Verify two blend filters of one color render the same pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0034 begin');
      await runCase('testFilterApi0034', async () => {
        const first: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFF123456)));
        const second: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFF123456)));
        expect(channelAt(first, SIZE, 40, 40, 1)).assertEqual(0x34);
        expect(channelAt(first, SIZE, 40, 40, 2)).assertEqual(channelAt(second, SIZE, 40, 40, 2));
        expect(channelAt(second, SIZE, 40, 40, 2)).assertEqual(0x56);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0035
     * @tc.name testFilterApi0035
     * @tc.desc Verify the luma filter turns white into an opaque gray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0035 begin');
      await runCase('testFilterApi0035', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(lumaColorFilter()));
        const red: number = channelAt(buffer, SIZE, 60, 60, 0);
        expect(red).assertEqual(channelAt(buffer, SIZE, 60, 60, 1));
        expect(red).assertEqual(channelAt(buffer, SIZE, 60, 60, 2));
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0036
     * @tc.name testFilterApi0036
     * @tc.desc Verify the luma filter turns a saturated red into gray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0036 begin');
      await runCase('testFilterApi0036', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        brush.setColorFilter(lumaColorFilter());
        const buffer: ArrayBuffer = await render(SIZE, brush);
        const red: number = channelAt(buffer, SIZE, 60, 60, 0);
        expect(red).assertEqual(channelAt(buffer, SIZE, 60, 60, 2));
        expect(red).assertEqual(0);
        expect(red < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0037
     * @tc.name testFilterApi0037
     * @tc.desc Verify blue luma is darker than red luma.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0037 begin');
      await runCase('testFilterApi0037', async () => {
        const redBrush: drawing.Brush = new drawing.Brush();
        redBrush.setColor(rgba(255, 255, 0, 0));
        redBrush.setColorFilter(lumaColorFilter());
        const blueBrush: drawing.Brush = new drawing.Brush();
        blueBrush.setColor(rgba(255, 0, 0, 255));
        blueBrush.setColorFilter(lumaColorFilter());
        const redBuffer: ArrayBuffer = await render(SIZE, redBrush);
        const blueBuffer: ArrayBuffer = await render(SIZE, blueBrush);
        const red: number = channelAt(redBuffer, SIZE, 60, 60, 0);
        const blue: number = channelAt(blueBuffer, SIZE, 60, 60, 0);
        expect(blue).assertEqual(0);
        expect(blue).assertEqual(channelAt(blueBuffer, SIZE, 60, 60, 1));
        expect(blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0038
     * @tc.name testFilterApi0038
     * @tc.desc Verify the luma filter keeps the painted coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0038 begin');
      await runCase('testFilterApi0038', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(lumaColorFilter()));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 0, 0, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 119, 0, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0039
     * @tc.name testFilterApi0039
     * @tc.desc Verify the identity matrix filter leaves white unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0039 begin');
      await runCase('testFilterApi0039', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(matrixColorFilter()));
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0040
     * @tc.name testFilterApi0040
     * @tc.desc Verify the identity matrix filter keeps a colored fill unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0040 begin');
      await runCase('testFilterApi0040', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0x33, 0x66, 0x99));
        brush.setColorFilter(matrixColorFilter());
        const buffer: ArrayBuffer = await render(SIZE, brush);
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(0x33);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(0x66);
        expect(channelAt(buffer, SIZE, 60, 60, 2)).assertEqual(0x99);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0041
     * @tc.name testFilterApi0041
     * @tc.desc Verify the identity matrix filter keeps the painted coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0041 begin');
      await runCase('testFilterApi0041', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(matrixColorFilter()));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 118, 118, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 118, 118, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0042
     * @tc.name testFilterApi0042
     * @tc.desc Verify both gamma filters can be created and applied.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0042 begin');
      await runCase('testFilterApi0042', async () => {
        const filters: drawing.ColorFilter[] = gammaColorFilters();
        expect(filters.length).assertEqual(2);
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(filters[0]));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0043
     * @tc.name testFilterApi0043
     * @tc.desc Verify the linear to sRGB gamma filter brightens mid gray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0043 begin');
      await runCase('testFilterApi0043', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 128, 128, 128));
        brush.setColorFilter(gammaColorFilters()[0]);
        const buffer: ArrayBuffer = await render(SIZE, brush);
        const gray: number = channelAt(buffer, SIZE, 60, 60, 0);
        expect(gray).assertEqual(channelAt(buffer, SIZE, 60, 60, 1));
        expect(gray > 128).assertTrue();
        expect(gray < 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0044
     * @tc.name testFilterApi0044
     * @tc.desc Verify the sRGB to linear gamma filter darkens mid gray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0044 begin');
      await runCase('testFilterApi0044', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 128, 128, 128));
        brush.setColorFilter(gammaColorFilters()[1]);
        const buffer: ArrayBuffer = await render(SIZE, brush);
        const gray: number = channelAt(buffer, SIZE, 60, 60, 0);
        expect(gray).assertEqual(channelAt(buffer, SIZE, 60, 60, 2));
        expect(gray < 128).assertTrue();
        expect(gray > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0045
     * @tc.name testFilterApi0045
     * @tc.desc Verify the two gamma filters transform mid gray differently.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0045 begin');
      await runCase('testFilterApi0045', async () => {
        const brighten: drawing.Brush = new drawing.Brush();
        brighten.setColor(rgba(255, 128, 128, 128));
        brighten.setColorFilter(gammaColorFilters()[0]);
        const darken: drawing.Brush = new drawing.Brush();
        darken.setColor(rgba(255, 128, 128, 128));
        darken.setColorFilter(gammaColorFilters()[1]);
        const brightBuffer: ArrayBuffer = await render(SIZE, brighten);
        const darkBuffer: ArrayBuffer = await render(SIZE, darken);
        expect(channelAt(brightBuffer, SIZE, 60, 60, 1) > channelAt(darkBuffer, SIZE, 60, 60, 1)).assertTrue();
        expect(countInkedPixels(brightBuffer)).assertEqual(countInkedPixels(darkBuffer));
        expect(channelAt(darkBuffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0046
     * @tc.name testFilterApi0046
     * @tc.desc Verify the gamma filters keep the painted coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0046 begin');
      await runCase('testFilterApi0046', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(gammaColorFilters()[0]));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0047
     * @tc.name testFilterApi0047
     * @tc.desc Verify the composed filter applies the inner blend then the outer luma.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0047 begin');
      await runCase('testFilterApi0047', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(composeColorFilter()));
        const red: number = channelAt(buffer, SIZE, 60, 60, 0);
        expect(red).assertEqual(channelAt(buffer, SIZE, 60, 60, 1));
        expect(red).assertEqual(channelAt(buffer, SIZE, 60, 60, 2));
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(95);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0048
     * @tc.name testFilterApi0048
     * @tc.desc Verify the composed filter output is darker than the blend color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0048 begin');
      await runCase('testFilterApi0048', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(composeColorFilter()));
        const gray: number = channelAt(buffer, SIZE, 60, 60, 0);
        const blended: ArrayBuffer = await render(SIZE, filterBrush(blendColorFilter(0xFF336699)));
        expect(gray < channelAt(blended, SIZE, 60, 60, 2)).assertTrue();
        expect(gray).assertEqual(0);
        expect(countInkedPixels(buffer)).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0049
     * @tc.name testFilterApi0049
     * @tc.desc Verify the composed filter renders twice identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0049 begin');
      await runCase('testFilterApi0049', async () => {
        const buffers: ArrayBuffer[] = await renderTwice(SIZE, filterBrush(composeColorFilter()));
        expect(channelAt(buffers[0], SIZE, 20, 100, 1)).assertEqual(channelAt(buffers[1], SIZE, 20, 100, 1));
        expect(channelAt(buffers[1], SIZE, 20, 100, 1)).assertEqual(channelAt(buffers[1], SIZE, 20, 100, 2));
        expect(countInkedPixels(buffers[0])).assertEqual(AREA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0050
     * @tc.name testFilterApi0050
     * @tc.desc Verify the lighting filter scales white into the highlight color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0050 begin');
      await runCase('testFilterApi0050', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(lightingColorFilter()));
        const red: number = channelAt(buffer, SIZE, 60, 60, 0);
        expect(red > 145).assertTrue();
        expect(red < 165).assertTrue();
        expect(red > channelAt(buffer, SIZE, 60, 60, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0051
     * @tc.name testFilterApi0051
     * @tc.desc Verify the lighting filter keeps the green above blue on white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0051 begin');
      await runCase('testFilterApi0051', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(lightingColorFilter()));
        const green: number = channelAt(buffer, SIZE, 60, 60, 1);
        const blue: number = channelAt(buffer, SIZE, 60, 60, 2);
        expect(green > 90).assertTrue();
        expect(blue > 75).assertTrue();
        expect(green > blue).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0052
     * @tc.name testFilterApi0052
     * @tc.desc Verify the lighting filter leaves the additive term on black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0052 begin');
      await runCase('testFilterApi0052', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 0));
        brush.setColorFilter(lightingColorFilter());
        const buffer: ArrayBuffer = await render(SIZE, brush);
        expect(channelAt(buffer, SIZE, 60, 60, 0) < 25).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 1) > 25).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 2) > 40).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0053
     * @tc.name testFilterApi0053
     * @tc.desc Verify the lighting filter additive term grows from red to blue.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0053 begin');
      await runCase('testFilterApi0053', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 0));
        brush.setColorFilter(lightingColorFilter());
        const buffer: ArrayBuffer = await render(SIZE, brush);
        const red: number = channelAt(buffer, SIZE, 60, 60, 0);
        const green: number = channelAt(buffer, SIZE, 60, 60, 1);
        const blue: number = channelAt(buffer, SIZE, 60, 60, 2);
        expect(green > red).assertTrue();
        expect(blue > green).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0054
     * @tc.name testFilterApi0054
     * @tc.desc Verify the lighting filter keeps the painted coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0054 begin');
      await runCase('testFilterApi0054', async () => {
        const buffer: ArrayBuffer = await render(SIZE, filterBrush(lightingColorFilter()));
        expect(countInkedPixels(buffer)).assertEqual(AREA);
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 119, 119, 2) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0055
     * @tc.name testFilterApi0055
     * @tc.desc Verify the blend filter also tints a pen stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0055 begin');
      await runCase('testFilterApi0055', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setColorFilter(blendColorFilter(0xFF00FF00));
        const buffer: ArrayBuffer = await renderStroke(pen);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0056
     * @tc.name testFilterApi0056
     * @tc.desc Verify the identity filter keeps a pen stroke white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0056 begin');
      await runCase('testFilterApi0056', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setColorFilter(matrixColorFilter());
        const buffer: ArrayBuffer = await renderStroke(pen);
        expect(channelAt(buffer, SIZE, 60, 60, 0)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 1)).assertEqual(255);
        expect(channelAt(buffer, SIZE, 60, 60, 2)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0057
     * @tc.name testFilterApi0057
     * @tc.desc Verify a plain stroke paints a non empty straight line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFilterApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0057 begin');
      await runCase('testFilterApi0057', async () => {
        const buffer: ArrayBuffer = await renderEffect(null, 6, 255);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 300).assertTrue();
        expect(inked < AREA).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 3)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0058
     * @tc.name testFilterApi0058
     * @tc.desc Verify the dash effect removes pixels from a solid stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0058 begin');
      await runCase('testFilterApi0058', async () => {
        const plain: number = countInkedPixels(await renderEffect(null, 6, 255));
        const dashed: number = countInkedPixels(await renderEffect(dashPathEffect(), 6, 255));
        expect(dashed > 0).assertTrue();
        expect(dashed < plain).assertTrue();
        expect(plain - dashed > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0059
     * @tc.name testFilterApi0059
     * @tc.desc Verify the dash effect keeps a plausible duty cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0059 begin');
      await runCase('testFilterApi0059', async () => {
        const buffer: ArrayBuffer = await renderEffect(dashPathEffect(), 6, 255);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 120).assertTrue();
        expect(inked < 400).assertTrue();
        expect(channelAt(buffer, SIZE, 60, 60, 3) === 0 ||
          channelAt(buffer, SIZE, 60, 60, 3) === 255).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0060
     * @tc.name testFilterApi0060
     * @tc.desc Verify the dash effect renders twice identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0060 begin');
      await runCase('testFilterApi0060', async () => {
        const first: ArrayBuffer = await renderEffect(dashPathEffect(), 6, 255);
        const second: ArrayBuffer = await renderEffect(dashPathEffect(), 6, 255);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countInkedPixels(first) > 0).assertTrue();
        expect(channelAt(first, SIZE, 30, 60, 3)).assertEqual(channelAt(second, SIZE, 30, 60, 3));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0061
     * @tc.name testFilterApi0061
     * @tc.desc Verify one dash object shared by two pens keeps the same coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0061 begin');
      await runCase('testFilterApi0061', async () => {
        const effect: drawing.PathEffect = dashPathEffect();
        const first: ArrayBuffer = await renderEffect(effect, 6, 255);
        const second: ArrayBuffer = await renderEffect(effect, 6, 255);
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countInkedPixels(first) < AREA).assertTrue();
        expect(channelAt(first, SIZE, 30, 60, 3)).assertEqual(channelAt(second, SIZE, 30, 60, 3));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0062
     * @tc.name testFilterApi0062
     * @tc.desc Verify a wider dashed stroke paints more pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0062 begin');
      await runCase('testFilterApi0062', async () => {
        const thin: number = countInkedPixels(await renderEffect(dashPathEffect(), 4, 255));
        const thick: number = countInkedPixels(await renderEffect(dashPathEffect(), 10, 255));
        expect(thick > thin).assertTrue();
        expect(thin > 0).assertTrue();
        expect(thick < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0063
     * @tc.name testFilterApi0063
     * @tc.desc Verify a translucent dashed stroke keeps its alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0063 begin');
      await runCase('testFilterApi0063', async () => {
        const buffer: ArrayBuffer = await renderEffect(dashPathEffect(), 6, 128);
        const inked: number = countInkedPixels(buffer);
        expect(inked > 0).assertTrue();
        expect(channelAt(buffer, SIZE, 25, 60, 3) < 255).assertTrue();
        expect(channelAt(buffer, SIZE, 25, 60, 3) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0064
     * @tc.name testFilterApi0064
     * @tc.desc Verify clearing the path effect restores the solid stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0064 begin');
      await runCase('testFilterApi0064', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        pen.setStrokeWidth(6);
        pen.setPathEffect(dashPathEffect());
        const dashed: number = countInkedPixels(await renderStroke(pen));
        pen.setPathEffect(null);
        const solid: number = countInkedPixels(await renderStroke(pen));
        expect(solid > dashed).assertTrue();
        expect(dashed > 0).assertTrue();
        expect(solid < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0065
     * @tc.name testFilterApi0065
     * @tc.desc Verify the corner effect changes the polyline coverage.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0065 begin');
      await runCase('testFilterApi0065', async () => {
        const plain: number = countInkedPixels(await renderPolyline(null));
        const rounded: number = countInkedPixels(await renderPolyline(cornerPathEffect(20)));
        expect(plain > 0).assertTrue();
        expect(rounded > 0).assertTrue();
        expect(plain !== rounded).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0066
     * @tc.name testFilterApi0066
     * @tc.desc Verify the corner effect renders twice identically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFilterApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0066 begin');
      await runCase('testFilterApi0066', async () => {
        const first: ArrayBuffer = await renderPolyline(cornerPathEffect(10));
        const second: ArrayBuffer = await renderPolyline(cornerPathEffect(10));
        expect(countInkedPixels(first)).assertEqual(countInkedPixels(second));
        expect(countInkedPixels(first) > 0).assertTrue();
        expect(channelAt(first, SIZE, 60, 28, 3)).assertEqual(channelAt(second, SIZE, 60, 28, 3));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0067
     * @tc.name testFilterApi0067
     * @tc.desc Verify the discrete effect jitters a solid stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0067 begin');
      await runCase('testFilterApi0067', async () => {
        const plain: number = countInkedPixels(await renderEffect(null, 6, 255));
        const jittered: number = countInkedPixels(await renderEffect(discretePathEffect(), 6, 255));
        expect(jittered > 0).assertTrue();
        expect(jittered !== plain).assertTrue();
        expect(jittered < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0068
     * @tc.name testFilterApi0068
     * @tc.desc Verify the path dash effect stamps shapes along the stroke.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFilterApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0068 begin');
      await runCase('testFilterApi0068', async () => {
        const plain: number = countInkedPixels(await renderEffect(null, 6, 255));
        const stamped: number = countInkedPixels(await renderEffect(pathDashEffect(), 6, 255));
        expect(stamped > 0).assertTrue();
        expect(stamped < plain).assertTrue();
        expect(stamped < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0069
     * @tc.name testFilterApi0069
     * @tc.desc Verify the composed effect differs from the dash effect alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0069 begin');
      await runCase('testFilterApi0069', async () => {
        const dashed: number = countInkedPixels(await renderEffect(dashPathEffect(), 6, 255));
        const composed: number = countInkedPixels(await renderEffect(composePathEffect(), 6, 255));
        expect(composed > 0).assertTrue();
        expect(dashed > 0).assertTrue();
        expect(composed !== dashed).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FILTER_0070
     * @tc.name testFilterApi0070
     * @tc.desc Verify the summed effect overlays both strokes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFilterApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0070 begin');
      await runCase('testFilterApi0070', async () => {
        const dashed: number = countInkedPixels(await renderEffect(dashPathEffect(), 6, 255));
        const summed: number = countInkedPixels(await renderEffect(sumPathEffect(), 6, 255));
        const plain: number = countInkedPixels(await renderEffect(null, 6, 255));
        expect(summed >= dashed).assertTrue();
        expect(summed <= plain + 40).assertTrue();
        expect(summed > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFilterApi0070 end');
    });
  });
}
