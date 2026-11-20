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
import { common2D } from '@kit.ArkGraphics2D';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import {
  clipWithPath,
  clipWithRect,
  clipWithRegion,
  clipWithRoundRect,
  probeOpaque,
  readCanvasSize,
  rejectOutsidePath,
  rejectOutsideRect,
  resetAllClips
} from '../../../main/ets/drawing/DrawingCanvasClip';
import { localClipBounds } from '../../../main/ets/drawing/DrawingCanvasState';
import { paintRects } from '../../../main/ets/drawing/DrawingCanvasBasic';
import { countInkedPixels, maxChannel, near, readPixelBuffer, runCase } from './DrawingTestRunner';

export default function drawingCanvasClipTest() {
  describe('DrawingCanvasClipTest', () => {
    /**
     * @tc.number SUB_CANVAS_CLIP_0100
     * @tc.name testCanvasClip0001
     * @tc.desc Clip the canvas with a rectangle and verify the clip is not empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0001', 0, async (done: Function) => {
      await runCase('testCanvasClip0001', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const empty: boolean = clipWithRect(target.canvas);
        expect(empty).assertFalse();
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(near(localClipBounds(target.canvas).left, 20, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0200
     * @tc.name testCanvasClip0002
     * @tc.desc Verify the rectangle clip narrows every edge of the clip bounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0002', 0, async (done: Function) => {
      await runCase('testCanvasClip0002', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithRect(target.canvas);
        const bounds: common2D.Rect = localClipBounds(target.canvas);
        expect(near(bounds.top, 20, 1)).assertTrue();
        expect(near(bounds.right, 180, 1)).assertTrue();
        expect(near(bounds.bottom, 180, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0300
     * @tc.name testCanvasClip0003
     * @tc.desc Clip the canvas with a circle path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0003', 0, async (done: Function) => {
      await runCase('testCanvasClip0003', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const empty: boolean = clipWithPath(target.canvas);
        expect(empty).assertFalse();
        expect(near(localClipBounds(target.canvas).left, 40, 1)).assertTrue();
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0400
     * @tc.name testCanvasClip0004
     * @tc.desc Verify the circle clip bounds match the circle geometry.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0004', 0, async (done: Function) => {
      await runCase('testCanvasClip0004', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithPath(target.canvas);
        const bounds: common2D.Rect = localClipBounds(target.canvas);
        expect(near(bounds.top, 40, 1)).assertTrue();
        expect(near(bounds.right, 160, 1)).assertTrue();
        expect(near(bounds.bottom, 160, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0500
     * @tc.name testCanvasClip0005
     * @tc.desc Clip the canvas with a region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0005', 0, async (done: Function) => {
      await runCase('testCanvasClip0005', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const empty: boolean = clipWithRegion(target.canvas);
        expect(empty).assertFalse();
        expect(near(localClipBounds(target.canvas).left, 10, 1)).assertTrue();
        expect(near(localClipBounds(target.canvas).right, 150, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0600
     * @tc.name testCanvasClip0006
     * @tc.desc Verify the region clip keeps the canvas size and save count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0006', 0, async (done: Function) => {
      await runCase('testCanvasClip0006', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithRegion(target.canvas);
        expect(near(localClipBounds(target.canvas).bottom, 150, 1)).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(200);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0700
     * @tc.name testCanvasClip0007
     * @tc.desc Clip the canvas with a rounded rectangle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0007', 0, async (done: Function) => {
      await runCase('testCanvasClip0007', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const empty: boolean = clipWithRoundRect(target.canvas);
        expect(empty).assertFalse();
        expect(near(localClipBounds(target.canvas).left, 10, 1)).assertTrue();
        expect(near(localClipBounds(target.canvas).right, 190, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0800
     * @tc.name testCanvasClip0008
     * @tc.desc Verify the rounded rectangle clip keeps the clip non empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0008', 0, async (done: Function) => {
      await runCase('testCanvasClip0008', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithRoundRect(target.canvas);
        expect(near(localClipBounds(target.canvas).bottom, 190, 1)).assertTrue();
        expect(target.canvas.getHeight()).assertEqual(200);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_0900
     * @tc.name testCanvasClip0009
     * @tc.desc Reset every clip and verify the clip returns to the canvas size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0009', 0, async (done: Function) => {
      await runCase('testCanvasClip0009', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const empty: boolean = resetAllClips(target.canvas);
        expect(empty).assertFalse();
        expect(near(localClipBounds(target.canvas).left, 0, 1)).assertTrue();
        expect(near(localClipBounds(target.canvas).right, 200, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1000
     * @tc.name testCanvasClip0010
     * @tc.desc Verify the reset clip keeps the bottom edge and save count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0010', 0, async (done: Function) => {
      await runCase('testCanvasClip0010', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        resetAllClips(target.canvas);
        expect(near(localClipBounds(target.canvas).bottom, 200, 1)).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(near(target.canvas.getHeight(), 200, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1100
     * @tc.name testCanvasClip0011
     * @tc.desc Read the opaque flag before filling the whole canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0011', 0, async (done: Function) => {
      await runCase('testCanvasClip0011', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const opaque: boolean = probeOpaque(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(opaque).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1200
     * @tc.name testCanvasClip0012
     * @tc.desc Verify the opaque probe fills a small canvas completely.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0012', 0, async (done: Function) => {
      await runCase('testCanvasClip0012', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        const opaque: boolean = probeOpaque(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(opaque).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(10000);
        expect(target.canvas.getWidth()).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1300
     * @tc.name testCanvasClip0013
     * @tc.desc Verify a path far outside the clip can be rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0013', 0, async (done: Function) => {
      await runCase('testCanvasClip0013', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const rejected: boolean = rejectOutsidePath(target.canvas);
        expect(rejected).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1400
     * @tc.name testCanvasClip0014
     * @tc.desc Verify a rectangle far outside the clip can be rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0014', 0, async (done: Function) => {
      await runCase('testCanvasClip0014', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const rejected: boolean = rejectOutsideRect(target.canvas);
        expect(rejected).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getHeight()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1500
     * @tc.name testCanvasClip0015
     * @tc.desc Reject an outside path on a small canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0015', 0, async (done: Function) => {
      await runCase('testCanvasClip0015', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        const rejected: boolean = rejectOutsidePath(target.canvas);
        expect(rejected).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(100);
        expect(target.canvas.getHeight()).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1600
     * @tc.name testCanvasClip0016
     * @tc.desc Read the size of a square canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0016', 0, async (done: Function) => {
      await runCase('testCanvasClip0016', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const size: number[] = readCanvasSize(target.canvas);
        expect(size.length).assertEqual(2);
        expect(size[0]).assertEqual(200);
        expect(size[1]).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1700
     * @tc.name testCanvasClip0017
     * @tc.desc Read the size of a rectangular canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0017', 0, async (done: Function) => {
      await runCase('testCanvasClip0017', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 60);
        const size: number[] = readCanvasSize(target.canvas);
        expect(size[0]).assertEqual(100);
        expect(size[1]).assertEqual(60);
        expect(size[0] > size[1]).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1800
     * @tc.name testCanvasClip0018
     * @tc.desc Clip with a rectangle and reset it afterwards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0018', 0, async (done: Function) => {
      await runCase('testCanvasClip0018', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithRect(target.canvas);
        const empty: boolean = resetAllClips(target.canvas);
        expect(empty).assertFalse();
        expect(near(localClipBounds(target.canvas).left, 0, 1)).assertTrue();
        expect(near(localClipBounds(target.canvas).right, 200, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_1900
     * @tc.name testCanvasClip0019
     * @tc.desc Combine a rectangle clip with a circle clip.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0019', 0, async (done: Function) => {
      await runCase('testCanvasClip0019', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        const first: boolean = clipWithRect(target.canvas);
        const second: boolean = clipWithPath(target.canvas);
        expect(first).assertFalse();
        expect(second).assertFalse();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_2000
     * @tc.name testCanvasClip0020
     * @tc.desc Verify drawing under a rectangle clip only paints inside the clip.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCanvasClip0020', 0, async (done: Function) => {
      await runCase('testCanvasClip0020', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithRect(target.canvas);
        paintRects(target.canvas);
        const inked: number = countInkedPixels(await readPixelBuffer(target.pixelMap));
        expect(inked).assertLarger(0);
        expect(inked < 40000).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_2100
     * @tc.name testCanvasClip0021
     * @tc.desc Verify drawing under a circle clip stays inside the circle area.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0021', 0, async (done: Function) => {
      await runCase('testCanvasClip0021', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithPath(target.canvas);
        paintRects(target.canvas);
        const inked: number = countInkedPixels(await readPixelBuffer(target.pixelMap));
        expect(inked).assertLarger(0);
        expect(inked < 40000).assertTrue();
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_2200
     * @tc.name testCanvasClip0022
     * @tc.desc Reset a region clip and verify the full canvas is available again.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0022', 0, async (done: Function) => {
      await runCase('testCanvasClip0022', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        clipWithRegion(target.canvas);
        resetAllClips(target.canvas);
        expect(near(localClipBounds(target.canvas).right, 200, 1)).assertTrue();
        expect(near(localClipBounds(target.canvas).bottom, 200, 1)).assertTrue();
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_2300
     * @tc.name testCanvasClip0023
     * @tc.desc Clip a rounded rectangle larger than a small canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0023', 0, async (done: Function) => {
      await runCase('testCanvasClip0023', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(100, 100);
        const empty: boolean = clipWithRoundRect(target.canvas);
        const bounds: common2D.Rect = localClipBounds(target.canvas);
        expect(empty).assertFalse();
        expect(near(bounds.left, 10, 1)).assertTrue();
        expect(near(bounds.right, 100, 1)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_2400
     * @tc.name testCanvasClip0024
     * @tc.desc Read the size of a minimal one pixel canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0024', 0, async (done: Function) => {
      await runCase('testCanvasClip0024', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(1, 1);
        const size: number[] = readCanvasSize(target.canvas);
        expect(size[0]).assertEqual(1);
        expect(size[1]).assertEqual(1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_2500
     * @tc.name testCanvasClip0025
     * @tc.desc Verify the fixed probe rectangle paints 200 square pixels inside a 240 square canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0025', 0, async (done: Function) => {
      await runCase('testCanvasClip0025', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 240);
        const opaque: boolean = probeOpaque(target.canvas);
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(opaque).assertFalse();
        expect(countInkedPixels(buffer)).assertEqual(40000);
        expect(maxChannel(buffer, 0)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_CANVAS_CLIP_2600
     * @tc.name testCanvasClip0026
     * @tc.desc Clip a small canvas with the default rectangle clip.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCanvasClip0026', 0, async (done: Function) => {
      await runCase('testCanvasClip0026', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(50, 50);
        const empty: boolean = clipWithRect(target.canvas);
        expect(empty).assertFalse();
        expect(near(localClipBounds(target.canvas).right, 50, 1)).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });
  });
}
