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
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import {
  describeTransform,
  localClipBounds,
  paintWithLayers,
  paintWithMatrix,
  paintWithSaveRestore,
  paintWithTransforms,
  SaveStateSnapshot
} from '../../../main/ets/drawing/DrawingCanvasState';
import { countInkedPixels, near, readPixelBuffer, runCase } from './DrawingTestRunner';

export default function drawingCanvasStateTest() {
  describe('DrawingCanvasStateTest', () => {
    /**
     * @tc.number SUB_CANVAS_STATE_0100
     * @tc.name testCanvasState0001
     * @tc.desc Verify the save count transitions around a save and restore pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasState0001', 0, async (done: Function) => {
      await runCase('testCanvasState0001', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const snapshot: SaveStateSnapshot = paintWithSaveRestore(target.canvas);
        expect(snapshot.before).assertEqual(1);
        expect(snapshot.afterSave).assertEqual(2);
        expect(snapshot.afterRestore).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0200
     * @tc.name testCanvasState0002
     * @tc.desc Verify the saved drawing is restored and the canvas state is clean.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasState0002', 0, async (done: Function) => {
      await runCase('testCanvasState0002', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const snapshot: SaveStateSnapshot = paintWithSaveRestore(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(snapshot.layerCount).assertEqual(1);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(countInkedPixels(buffer)).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0300
     * @tc.name testCanvasState0003
     * @tc.desc Read the total matrix of a fresh canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasState0003', 0, async (done: Function) => {
      await runCase('testCanvasState0003', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const values: number[] = describeTransform(target.canvas);
        expect(values.length).assertEqual(9);
        expect(values[0]).assertEqual(1);
        expect(values[4]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0400
     * @tc.name testCanvasState0004
     * @tc.desc Verify translate scale rotate and skew change the total matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasState0004', 0, async (done: Function) => {
      await runCase('testCanvasState0004', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const values: number[] = paintWithTransforms(target.canvas);
        expect(values.length).assertEqual(9);
        expect(values[8]).assertEqual(1);
        expect(values[1] === 0).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0500
     * @tc.name testCanvasState0005
     * @tc.desc Verify the matrix is reset after drawing with a prepared matrix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasState0005', 0, async (done: Function) => {
      await runCase('testCanvasState0005', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const values: number[] = paintWithMatrix(target.canvas);
        expect(values.length).assertEqual(9);
        expect(values[0]).assertEqual(1);
        expect(values[4]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0600
     * @tc.name testCanvasState0006
     * @tc.desc Verify every off diagonal value of the reset matrix is zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasState0006', 0, async (done: Function) => {
      await runCase('testCanvasState0006', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const values: number[] = paintWithMatrix(target.canvas);
        expect(values[1]).assertEqual(0);
        expect(values[2]).assertEqual(0);
        expect(values[5]).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0700
     * @tc.name testCanvasState0007
     * @tc.desc Verify a saved layer reports a positive save count and paints pixels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0007', 0, async (done: Function) => {
      await runCase('testCanvasState0007', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const layerCount: number = paintWithLayers(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(layerCount).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(countInkedPixels(buffer)).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0800
     * @tc.name testCanvasState0008
     * @tc.desc Save two layers in a row and verify the canvas is still balanced.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0008', 0, async (done: Function) => {
      await runCase('testCanvasState0008', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const first: number = paintWithLayers(target.canvas);
        const second: number = paintWithLayers(target.canvas);
        expect(first).assertLarger(0);
        expect(second).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_0900
     * @tc.name testCanvasState0009
     * @tc.desc Read the local clip bounds of a fresh canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasState0009', 0, async (done: Function) => {
      await runCase('testCanvasState0009', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const bounds: common2D.Rect = localClipBounds(target.canvas);
        expect(near(bounds.left, 0, 1)).assertTrue();
        expect(bounds.top).assertEqual(-1);
        expect(bounds.right).assertEqual(201);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1000
     * @tc.name testCanvasState0010
     * @tc.desc Verify the clip bounds height matches the canvas height.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0010', 0, async (done: Function) => {
      await runCase('testCanvasState0010', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(120, 80);
        const bounds: common2D.Rect = localClipBounds(target.canvas);
        expect(near(bounds.right, 120, 1)).assertTrue();
        expect(bounds.bottom).assertEqual(81);
        expect(target.canvas.getWidth()).assertEqual(120);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1100
     * @tc.name testCanvasState0011
     * @tc.desc Apply the transform sequence twice and verify the values stay finite.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0011', 0, async (done: Function) => {
      await runCase('testCanvasState0011', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintWithTransforms(target.canvas);
        const values: number[] = describeTransform(target.canvas);
        expect(values.length).assertEqual(9);
        expect(values[8]).assertEqual(1);
        expect(values[0] > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1200
     * @tc.name testCanvasState0012
     * @tc.desc Run the save restore pair on a small canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0012', 0, async (done: Function) => {
      await runCase('testCanvasState0012', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        const snapshot: SaveStateSnapshot = paintWithSaveRestore(target.canvas);
        expect(snapshot.before).assertEqual(1);
        expect(snapshot.afterSave).assertEqual(2);
        expect(snapshot.layerCount).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1300
     * @tc.name testCanvasState0013
     * @tc.desc Apply transforms on a 240 square canvas and read the matrix back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0013', 0, async (done: Function) => {
      await runCase('testCanvasState0013', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 240);
        const values: number[] = paintWithTransforms(target.canvas);
        expect(target.canvas.getWidth()).assertEqual(240);
        expect(values.length).assertEqual(9);
        expect(values[1] === 0).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1400
     * @tc.name testCanvasState0014
     * @tc.desc Reset the canvas matrix on a small square canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0014', 0, async (done: Function) => {
      await runCase('testCanvasState0014', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        const values: number[] = paintWithMatrix(target.canvas);
        expect(values[0]).assertEqual(1);
        expect(values[4]).assertEqual(1);
        expect(values[8]).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1500
     * @tc.name testCanvasState0015
     * @tc.desc Verify the clip bounds of a rectangular canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0015', 0, async (done: Function) => {
      await runCase('testCanvasState0015', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        const bounds: common2D.Rect = localClipBounds(target.canvas);
        expect(near(bounds.left, 0, 1)).assertTrue();
        expect(bounds.right).assertEqual(101);
        expect(bounds.bottom).assertEqual(101);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1600
     * @tc.name testCanvasState0016
     * @tc.desc Verify the canvas save count stays one after drawing into a layer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0016', 0, async (done: Function) => {
      await runCase('testCanvasState0016', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(160, 160);
        paintWithLayers(target.canvas);
        paintWithSaveRestore(target.canvas);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(160);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1700
     * @tc.name testCanvasState0017
     * @tc.desc Combine the save restore pair with the transform sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0017', 0, async (done: Function) => {
      await runCase('testCanvasState0017', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const snapshot: SaveStateSnapshot = paintWithSaveRestore(target.canvas);
        const values: number[] = paintWithTransforms(target.canvas);
        expect(snapshot.afterRestore).assertEqual(1);
        expect(values.length).assertEqual(9);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_STATE_1800
     * @tc.name testCanvasState0018
     * @tc.desc Read the clip bounds of a minimal canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasState0018', 0, async (done: Function) => {
      await runCase('testCanvasState0018', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(50, 50);
        const bounds: common2D.Rect = localClipBounds(target.canvas);
        expect(near(bounds.right, 50, 1)).assertTrue();
        expect(bounds.bottom).assertEqual(51);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });
  });
}
