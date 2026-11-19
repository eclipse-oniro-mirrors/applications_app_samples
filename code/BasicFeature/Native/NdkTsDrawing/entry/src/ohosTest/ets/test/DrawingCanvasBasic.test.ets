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
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import {
  paintArcs,
  paintBasicShapes,
  paintCirclesAndOvals,
  paintColorAndBackground,
  paintPointsAndLines,
  paintRects,
  paintRegion,
  paintRoundRects
} from '../../../main/ets/drawing/DrawingCanvasBasic';
import { countInkedPixels, maxChannel, readPixelBuffer, runCase } from './DrawingTestRunner';

export default function drawingCanvasBasicTest() {
  describe('DrawingCanvasBasicTest', () => {
    /**
     * @tc.number SUB_CANVAS_BASIC_0100
     * @tc.name testCanvasBasic0001
     * @tc.desc Query the size and save count of a fresh offscreen canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0001', 0, async (done: Function) => {
      await runCase('testCanvasBasic0001', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const canvas: drawing.Canvas = target.canvas;
        expect(canvas.getWidth()).assertEqual(200);
        expect(canvas.getHeight()).assertEqual(200);
        expect(canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0200
     * @tc.name testCanvasBasic0002
     * @tc.desc Verify a fresh canvas holds no painted pixel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0002', 0, async (done: Function) => {
      await runCase('testCanvasBasic0002', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxChannel(buffer, 3)).assertEqual(0);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0300
     * @tc.name testCanvasBasic0003
     * @tc.desc Verify two offscreen canvases keep independent sizes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0003', 0, async (done: Function) => {
      await runCase('testCanvasBasic0003', async () => {
        const first: OffscreenTarget = await createOffscreenTarget(200, 200);
        const second: OffscreenTarget = await createOffscreenTarget(100, 60);
        expect(first.canvas.getWidth()).assertEqual(200);
        expect(second.canvas.getWidth()).assertEqual(100);
        expect(second.canvas.getHeight()).assertEqual(60);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0400
     * @tc.name testCanvasBasic0004
     * @tc.desc Draw rectangles and verify pixels appear while the save count keeps.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0004', 0, async (done: Function) => {
      await runCase('testCanvasBasic0004', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintRects(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0500
     * @tc.name testCanvasBasic0005
     * @tc.desc Verify the rectangles drawn by the fill brush stay fully opaque.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0005', 0, async (done: Function) => {
      await runCase('testCanvasBasic0005', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintRects(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getHeight()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0600
     * @tc.name testCanvasBasic0006
     * @tc.desc Draw rectangles on a small canvas and keep the canvas size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0006', 0, async (done: Function) => {
      await runCase('testCanvasBasic0006', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        paintRects(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.getWidth()).assertEqual(100);
        expect(target.canvas.getHeight()).assertEqual(100);
        expect(countInkedPixels(buffer)).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0700
     * @tc.name testCanvasBasic0007
     * @tc.desc Draw rectangles twice and verify the canvas state is not leaking.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0007', 0, async (done: Function) => {
      await runCase('testCanvasBasic0007', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintRects(target.canvas);
        paintRects(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0800
     * @tc.name testCanvasBasic0008
     * @tc.desc Draw rounded rectangles and verify opaque pixels are produced.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0008', 0, async (done: Function) => {
      await runCase('testCanvasBasic0008', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintRoundRects(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_0900
     * @tc.name testCanvasBasic0009
     * @tc.desc Draw rounded rectangles on a small canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0009', 0, async (done: Function) => {
      await runCase('testCanvasBasic0009', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(50, 50);
        paintRoundRects(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getWidth()).assertEqual(50);
        expect(target.canvas.getHeight()).assertEqual(50);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1000
     * @tc.name testCanvasBasic0010
     * @tc.desc Draw circles and ovals and verify green pixels of the brush exist.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0010', 0, async (done: Function) => {
      await runCase('testCanvasBasic0010', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintCirclesAndOvals(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(maxChannel(buffer, 1)).assertLarger(0);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1100
     * @tc.name testCanvasBasic0011
     * @tc.desc Draw circles and ovals on a 240 square canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0011', 0, async (done: Function) => {
      await runCase('testCanvasBasic0011', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 240);
        paintCirclesAndOvals(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.getWidth()).assertEqual(240);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1200
     * @tc.name testCanvasBasic0012
     * @tc.desc Draw arcs with the plain and centered variants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0012', 0, async (done: Function) => {
      await runCase('testCanvasBasic0012', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintArcs(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1300
     * @tc.name testCanvasBasic0013
     * @tc.desc Draw arcs on a 120 square canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0013', 0, async (done: Function) => {
      await runCase('testCanvasBasic0013', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(120, 120);
        paintArcs(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getWidth()).assertEqual(120);
        expect(target.canvas.getHeight()).assertEqual(120);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1400
     * @tc.name testCanvasBasic0014
     * @tc.desc Draw points and lines with every point mode.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0014', 0, async (done: Function) => {
      await runCase('testCanvasBasic0014', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintPointsAndLines(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1500
     * @tc.name testCanvasBasic0015
     * @tc.desc Draw points and lines twice on the same canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0015', 0, async (done: Function) => {
      await runCase('testCanvasBasic0015', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintPointsAndLines(target.canvas);
        paintPointsAndLines(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getWidth()).assertEqual(200);
        expect(target.canvas.getHeight()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1600
     * @tc.name testCanvasBasic0016
     * @tc.desc Fill the whole canvas with colors and a background brush.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0016', 0, async (done: Function) => {
      await runCase('testCanvasBasic0016', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintColorAndBackground(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1700
     * @tc.name testCanvasBasic0017
     * @tc.desc Fill a 100 square canvas with colors and verify the pixel count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0017', 0, async (done: Function) => {
      await runCase('testCanvasBasic0017', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        paintColorAndBackground(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(maxChannel(buffer, 0)).assertLarger(0);
        expect(target.canvas.getWidth()).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1800
     * @tc.name testCanvasBasic0018
     * @tc.desc Draw a region shape with the attached brush.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0018', 0, async (done: Function) => {
      await runCase('testCanvasBasic0018', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintRegion(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(maxChannel(buffer, 3)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_1900
     * @tc.name testCanvasBasic0019
     * @tc.desc Draw a region shape on a canvas smaller than the region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0019', 0, async (done: Function) => {
      await runCase('testCanvasBasic0019', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(60, 60);
        paintRegion(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getWidth()).assertEqual(60);
        expect(target.canvas.getHeight()).assertEqual(60);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_2000
     * @tc.name testCanvasBasic0020
     * @tc.desc Draw every basic shape in one pass and fill the canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasBasic0020', 0, async (done: Function) => {
      await runCase('testCanvasBasic0020', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintBasicShapes(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 0)).assertEqual(255);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_2100
     * @tc.name testCanvasBasic0021
     * @tc.desc Draw every basic shape on a 120 square canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0021', 0, async (done: Function) => {
      await runCase('testCanvasBasic0021', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(120, 120);
        paintBasicShapes(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(14400);
        expect(target.canvas.getWidth()).assertEqual(120);
        expect(target.canvas.getHeight()).assertEqual(120);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_2200
     * @tc.name testCanvasBasic0022
     * @tc.desc Draw rectangles on a minimal one pixel canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0022', 0, async (done: Function) => {
      await runCase('testCanvasBasic0022', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(1, 1);
        paintRects(target.canvas);
        expect(target.canvas.getWidth()).assertEqual(1);
        expect(target.canvas.getHeight()).assertEqual(1);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_2300
     * @tc.name testCanvasBasic0023
     * @tc.desc Draw circles on a two pixel canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0023', 0, async (done: Function) => {
      await runCase('testCanvasBasic0023', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(2, 2);
        paintCirclesAndOvals(target.canvas);
        expect(target.canvas.getWidth()).assertEqual(2);
        expect(target.canvas.getHeight()).assertEqual(2);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_2400
     * @tc.name testCanvasBasic0024
     * @tc.desc Draw three shape groups in sequence on one canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0024', 0, async (done: Function) => {
      await runCase('testCanvasBasic0024', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintRects(target.canvas);
        paintRoundRects(target.canvas);
        paintCirclesAndOvals(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getHeight()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_2500
     * @tc.name testCanvasBasic0025
     * @tc.desc Draw every basic shape twice and verify the canvas stays usable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0025', 0, async (done: Function) => {
      await runCase('testCanvasBasic0025', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintBasicShapes(target.canvas);
        paintBasicShapes(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_BASIC_2600
     * @tc.name testCanvasBasic0026
     * @tc.desc Draw arcs on a non square canvas and keep both edges.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasBasic0026', 0, async (done: Function) => {
      await runCase('testCanvasBasic0026', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 100);
        paintArcs(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(target.canvas.getWidth()).assertEqual(200);
        expect(target.canvas.getHeight()).assertEqual(100);
        expect(countInkedPixels(buffer)).assertLarger(0);
      }, done);
    });
  });
}
