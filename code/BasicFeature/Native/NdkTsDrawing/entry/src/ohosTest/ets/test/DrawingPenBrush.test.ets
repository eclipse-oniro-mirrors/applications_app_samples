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
  applyBrushEffects,
  applyPenEffects,
  BrushSnapshot,
  copyBrush,
  copyPen,
  createFillBrush,
  createStrokePen,
  paintPenBrushShowcase,
  PenSnapshot,
  resetBrush,
  resetPen,
  snapshotBrush,
  snapshotPen,
  strokeOutline
} from '../../../main/ets/drawing/DrawingPenBrush';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, readPixelBuffer, runCase } from './DrawingTestRunner';

function samplePath(): drawing.Path {
  const path: drawing.Path = new drawing.Path();
  path.addRect(ltrb(20, 20, 120, 80));
  return path;
}

export default function drawingPenBrushTest() {
  describe('DrawingPenBrushTest', () => {
    /**
     * @tc.number SUB_PEN_BRUSH_0100
     * @tc.name testPenBrush0001
     * @tc.desc Verify the stroke pen keeps the requested width and color channels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0001', 0, async (done: Function) => {
      await runCase('testPenBrush0001', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.width).assertEqual(5);
        expect(snapshot.red).assertEqual(0x11);
        expect(snapshot.green).assertEqual(0x44);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0200
     * @tc.name testPenBrush0002
     * @tc.desc Verify the stroke pen blue channel and anti alias flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0002', 0, async (done: Function) => {
      await runCase('testPenBrush0002', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.blue).assertEqual(0x88);
        expect(snapshot.alphaChannel).assertEqual(255);
        expect(snapshot.antiAlias).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0300
     * @tc.name testPenBrush0003
     * @tc.desc Build a stroke pen with a zero width.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0003', 0, async (done: Function) => {
      await runCase('testPenBrush0003', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x00, 0x00, 0xFF), 0);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.width).assertEqual(0);
        expect(snapshot.red).assertEqual(0x00);
        expect(snapshot.antiAlias).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0400
     * @tc.name testPenBrush0004
     * @tc.desc Verify the fill brush keeps the requested color.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0004', 0, async (done: Function) => {
      await runCase('testPenBrush0004', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x33, 0x66, 0x99));
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.red).assertEqual(0x33);
        expect(snapshot.green).assertEqual(0x66);
        expect(snapshot.blue).assertEqual(0x99);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0500
     * @tc.name testPenBrush0005
     * @tc.desc Verify the fill brush alpha channel and anti alias flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0005', 0, async (done: Function) => {
      await runCase('testPenBrush0005', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x80, 0x33, 0x66, 0x99));
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.alphaChannel).assertEqual(0x80);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.red).assertEqual(0x33);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0600
     * @tc.name testPenBrush0006
     * @tc.desc Read the default width of a fresh pen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0006', 0, async (done: Function) => {
      await runCase('testPenBrush0006', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.width).assertEqual(0);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.cap).assertEqual(drawing.CapStyle.FLAT_CAP);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0700
     * @tc.name testPenBrush0007
     * @tc.desc Verify the pen style setters change the readable values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0007', 0, async (done: Function) => {
      await runCase('testPenBrush0007', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(7);
        pen.setMiterLimit(9);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.width).assertEqual(7);
        expect(snapshot.miterLimit).assertEqual(9);
        expect(snapshot.antiAlias).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0800
     * @tc.name testPenBrush0008
     * @tc.desc Verify the pen miter limit set by the effect helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0008', 0, async (done: Function) => {
      await runCase('testPenBrush0008', async () => {
        const pen: drawing.Pen = applyPenEffects(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5));
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.miterLimit).assertEqual(6);
        expect(snapshot.width).assertEqual(5);
        expect(snapshot.alpha).assertEqual(180);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_0900
     * @tc.name testPenBrush0009
     * @tc.desc Verify the pen join style and cap style set by the effect helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0009', 0, async (done: Function) => {
      await runCase('testPenBrush0009', async () => {
        const pen: drawing.Pen = applyPenEffects(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5));
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.join).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(snapshot.cap).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(snapshot.antiAlias).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1000
     * @tc.name testPenBrush0010
     * @tc.desc Verify the pen alpha after the effect helper runs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0010', 0, async (done: Function) => {
      await runCase('testPenBrush0010', async () => {
        const pen: drawing.Pen = applyPenEffects(new drawing.Pen());
        expect(pen.getAlpha()).assertEqual(180);
        expect(pen.getMiterLimit()).assertEqual(6);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1100
     * @tc.name testPenBrush0011
     * @tc.desc Verify the brush alpha after the effect helper runs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0011', 0, async (done: Function) => {
      await runCase('testPenBrush0011', async () => {
        const brush: drawing.Brush = applyBrushEffects(createFillBrush(rgba(0x99, 0xFF, 0xDD, 0x00)));
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.alpha).assertEqual(160);
        expect(snapshot.antiAlias).assertTrue();
        expect(brush.getAlpha()).assertEqual(160);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1200
     * @tc.name testPenBrush0012
     * @tc.desc Verify the brush alpha channel stays readable after the effect helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0012', 0, async (done: Function) => {
      await runCase('testPenBrush0012', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.alpha).assertEqual(160);
        expect(snapshot.alphaChannel > 0).assertTrue();
        expect(snapshot.antiAlias).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1300
     * @tc.name testPenBrush0013
     * @tc.desc Reset a configured pen and verify the width falls back to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0013', 0, async (done: Function) => {
      await runCase('testPenBrush0013', async () => {
        const pen: drawing.Pen = applyPenEffects(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5));
        const snapshot: PenSnapshot = resetPen(pen);
        expect(snapshot.width).assertEqual(0);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.cap).assertEqual(drawing.CapStyle.FLAT_CAP);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1400
     * @tc.name testPenBrush0014
     * @tc.desc Reset a configured pen twice and verify the state stays stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0014', 0, async (done: Function) => {
      await runCase('testPenBrush0014', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5);
        resetPen(pen);
        const snapshot: PenSnapshot = resetPen(pen);
        expect(snapshot.width).assertEqual(0);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.join).assertEqual(drawing.JoinStyle.MITER_JOIN);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1500
     * @tc.name testPenBrush0015
     * @tc.desc Reset a configured brush and verify the anti alias flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0015', 0, async (done: Function) => {
      await runCase('testPenBrush0015', async () => {
        const brush: drawing.Brush = applyBrushEffects(createFillBrush(rgba(0x99, 0xFF, 0xDD, 0x00)));
        const snapshot: BrushSnapshot = resetBrush(brush);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.alphaChannel).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1600
     * @tc.name testPenBrush0016
     * @tc.desc Reset a configured brush twice and verify the same state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0016', 0, async (done: Function) => {
      await runCase('testPenBrush0016', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x33, 0x66, 0x99));
        resetBrush(brush);
        const snapshot: BrushSnapshot = resetBrush(brush);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.blue).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1700
     * @tc.name testPenBrush0017
     * @tc.desc Convert a rectangle path into its stroke outline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0017', 0, async (done: Function) => {
      await runCase('testPenBrush0017', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x44, 0x88), 4);
        const outline: drawing.Path = strokeOutline(pen, samplePath());
        expect(outline.isEmpty()).assertFalse();
        expect(outline.getLength(true)).assertLarger(0);
        expect(outline.getBounds().right).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1800
     * @tc.name testPenBrush0018
     * @tc.desc Verify a thicker pen produces a longer stroke outline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0018', 0, async (done: Function) => {
      await runCase('testPenBrush0018', async () => {
        const thin: drawing.Path = strokeOutline(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 2), samplePath());
        const thick: drawing.Path = strokeOutline(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 20), samplePath());
        expect(thin.getLength(true)).assertLarger(0);
        expect(thick.getLength(true)).assertLarger(thin.getLength(true));
        expect(thick.getBounds().top < thin.getBounds().top).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_1900
     * @tc.name testPenBrush0019
     * @tc.desc Copy a pen and compare every readable attribute.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0019', 0, async (done: Function) => {
      await runCase('testPenBrush0019', async () => {
        const source: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x44, 0x88), 9);
        const copy: PenSnapshot = snapshotPen(copyPen(source));
        expect(copy.width).assertEqual(9);
        expect(copy.red).assertEqual(0x11);
        expect(copy.antiAlias).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2000
     * @tc.name testPenBrush0020
     * @tc.desc Copy a brush and compare every readable attribute.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0020', 0, async (done: Function) => {
      await runCase('testPenBrush0020', async () => {
        const source: drawing.Brush = createFillBrush(rgba(255, 0x22, 0x44, 0x66));
        const copy: BrushSnapshot = snapshotBrush(copyBrush(source));
        expect(copy.red).assertEqual(0x22);
        expect(copy.green).assertEqual(0x44);
        expect(copy.antiAlias).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2100
     * @tc.name testPenBrush0021
     * @tc.desc Verify the pen copy is independent from the original pen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0021', 0, async (done: Function) => {
      await runCase('testPenBrush0021', async () => {
        const source: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5);
        const copy: drawing.Pen = copyPen(source);
        source.setStrokeWidth(20);
        expect(snapshotPen(copy).width).assertEqual(5);
        expect(snapshotPen(source).width).assertEqual(20);
        expect(snapshotPen(copy).red).assertEqual(0x11);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2200
     * @tc.name testPenBrush0022
     * @tc.desc Verify the brush copy is independent from the original brush.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0022', 0, async (done: Function) => {
      await runCase('testPenBrush0022', async () => {
        const source: drawing.Brush = createFillBrush(rgba(255, 0x22, 0x44, 0x66));
        const copy: drawing.Brush = copyBrush(source);
        source.setAlpha(10);
        expect(copy.getAlpha()).assertEqual(255);
        expect(source.getAlpha()).assertEqual(10);
        expect(snapshotBrush(copy).red).assertEqual(0x22);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2300
     * @tc.name testPenBrush0023
     * @tc.desc Draw the pen brush showcase and verify pixels appear.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPenBrush0023', 0, async (done: Function) => {
      await runCase('testPenBrush0023', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintPenBrushShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2400
     * @tc.name testPenBrush0024
     * @tc.desc Draw the pen brush showcase twice on one canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0024', 0, async (done: Function) => {
      await runCase('testPenBrush0024', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintPenBrushShowcase(target.canvas);
        paintPenBrushShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2500
     * @tc.name testPenBrush0025
     * @tc.desc Draw the pen brush showcase on a 240 square canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0025', 0, async (done: Function) => {
      await runCase('testPenBrush0025', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 240);
        paintPenBrushShowcase(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getWidth()).assertEqual(240);
        expect(target.canvas.getHeight()).assertEqual(240);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2600
     * @tc.name testPenBrush0026
     * @tc.desc Verify the pen color survives the copy constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0026', 0, async (done: Function) => {
      await runCase('testPenBrush0026', async () => {
        const source: drawing.Pen = createStrokePen(rgba(0x40, 0x10, 0x20, 0x30), 3);
        const snapshot: PenSnapshot = snapshotPen(copyPen(source));
        expect(snapshot.alphaChannel).assertEqual(0x40);
        expect(snapshot.red).assertEqual(0x10);
        expect(snapshot.blue).assertEqual(0x30);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2700
     * @tc.name testPenBrush0027
     * @tc.desc Verify the brush color survives the copy constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0027', 0, async (done: Function) => {
      await runCase('testPenBrush0027', async () => {
        const source: drawing.Brush = createFillBrush(rgba(0x40, 0x10, 0x20, 0x30));
        const snapshot: BrushSnapshot = snapshotBrush(copyBrush(source));
        expect(snapshot.alphaChannel).assertEqual(0x40);
        expect(snapshot.green).assertEqual(0x20);
        expect(snapshot.blue).assertEqual(0x30);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2800
     * @tc.name testPenBrush0028
     * @tc.desc Query the pen hex color of a configured pen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0028', 0, async (done: Function) => {
      await runCase('testPenBrush0028', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.hex > 0).assertTrue();
        expect(snapshot.floatAlpha > 0).assertTrue();
        expect(snapshot.alphaChannel).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_2900
     * @tc.name testPenBrush0029
     * @tc.desc Query the brush hex color of a configured brush.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0029', 0, async (done: Function) => {
      await runCase('testPenBrush0029', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x22, 0x44, 0x66));
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.hex > 0).assertTrue();
        expect(snapshot.floatAlpha > 0).assertTrue();
        expect(snapshot.alphaChannel).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_PEN_BRUSH_3000
     * @tc.name testPenBrush0030
     * @tc.desc Convert the star path into its stroke outline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPenBrush0030', 0, async (done: Function) => {
      await runCase('testPenBrush0030', async () => {
        const path: drawing.Path = new drawing.Path();
        path.addCircle(100, 100, 40);
        const pen: drawing.Pen = applyPenEffects(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 6));
        const outline: drawing.Path = strokeOutline(pen, path);
        expect(outline.isEmpty()).assertFalse();
        expect(outline.getBounds().right).assertLarger(100);
        expect(outline.getLength(true)).assertLarger(0);
      }, done);
    });
  });
}
