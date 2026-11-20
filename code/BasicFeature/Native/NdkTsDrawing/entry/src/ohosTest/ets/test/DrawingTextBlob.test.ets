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
  createPosTextBlob,
  createRunBufferBlob,
  createTextBlob,
  paintTextBlob,
  textBlobBounds,
  textBlobIdStable
} from '../../../main/ets/drawing/DrawingFontText';
import { rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, maxChannel, readPixelBuffer, runCase } from './DrawingTestRunner';

export default function drawingTextBlobTest() {
  describe('DrawingTextBlobTest', () => {
    /**
     * @tc.number SUB_TEXT_BLOB_0100
     * @tc.name testTextBlob0001
     * @tc.desc Verify the text blob bounds of a normal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTextBlob0001', 0, async (done: Function) => {
      await runCase('testTextBlob0001', async () => {
        const bounds: number[] = textBlobBounds('Hello', 40);
        expect(bounds.length).assertEqual(4);
        expect(bounds[2] > bounds[0]).assertTrue();
        expect(bounds[3] > bounds[1]).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0200
     * @tc.name testTextBlob0002
     * @tc.desc Verify a larger font size produces a wider text blob.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTextBlob0002', 0, async (done: Function) => {
      await runCase('testTextBlob0002', async () => {
        const small: number[] = textBlobBounds('Hello', 20);
        const large: number[] = textBlobBounds('Hello', 40);
        expect(small.length).assertEqual(4);
        expect(large.length).assertEqual(4);
        expect(large[2] - large[0] > small[2] - small[0]).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0300
     * @tc.name testTextBlob0003
     * @tc.desc Verify a longer string produces a wider text blob.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTextBlob0003', 0, async (done: Function) => {
      await runCase('testTextBlob0003', async () => {
        const short: number[] = textBlobBounds('Hi', 40);
        const long: number[] = textBlobBounds('Hi Hi Hi', 40);
        expect(short[2] - short[0] > 0).assertTrue();
        expect(long[3] > long[1]).assertTrue();
        expect(long[2] - long[0] > short[2] - short[0]).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0400
     * @tc.name testTextBlob0004
     * @tc.desc Verify the text blob bounds stay inside a reasonable range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTextBlob0004', 0, async (done: Function) => {
      await runCase('testTextBlob0004', async () => {
        const bounds: number[] = textBlobBounds('Wg', 40);
        expect(bounds[2] - bounds[0] > 0).assertTrue();
        expect(bounds[2] - bounds[0] < 400).assertTrue();
        expect(bounds[3] - bounds[1] < 400).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0500
     * @tc.name testTextBlob0005
     * @tc.desc Verify two blobs of the same text report the same unique id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTextBlob0005', 0, async (done: Function) => {
      await runCase('testTextBlob0005', async () => {
        expect(textBlobIdStable('Hello', 40)).assertFalse();
        expect(textBlobIdStable('Hello', 20)).assertFalse();
        expect(textBlobIdStable('A', 40)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0600
     * @tc.name testTextBlob0006
     * @tc.desc Verify a text blob reports a positive id and non empty bounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTextBlob0006', 0, async (done: Function) => {
      await runCase('testTextBlob0006', async () => {
        const blob: drawing.TextBlob = createTextBlob('Hello', 40);
        const repeat: drawing.TextBlob = createTextBlob('Hello', 40);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(repeat.uniqueID() > blob.uniqueID()).assertTrue();
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.right > bounds.left).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0700
     * @tc.name testTextBlob0007
     * @tc.desc Verify the bounds supplied to the run buffer blob are kept.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTextBlob0007', 0, async (done: Function) => {
      await runCase('testTextBlob0007', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('Hello', 40);
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.left).assertEqual(0);
        expect(bounds.top).assertEqual(0);
        expect(bounds.right).assertEqual(200);
        expect(bounds.bottom >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0800
     * @tc.name testTextBlob0008
     * @tc.desc Verify a single glyph run buffer blob covers one advance width.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTextBlob0008', 0, async (done: Function) => {
      await runCase('testTextBlob0008', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('A', 40);
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.right).assertEqual(40);
        expect(bounds.right > bounds.left).assertTrue();
        expect(typeof blob).assertEqual('object');
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_0900
     * @tc.name testTextBlob0009
     * @tc.desc Verify the blob built from positioned text has valid bounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTextBlob0009', 0, async (done: Function) => {
      await runCase('testTextBlob0009', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('Hi', 40);
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.right > bounds.left).assertTrue();
        expect(bounds.bottom > bounds.top).assertTrue();
        expect(bounds.right < 400).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_1000
     * @tc.name testTextBlob0010
     * @tc.desc Verify more positioned characters produce a wider blob.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTextBlob0010', 0, async (done: Function) => {
      await runCase('testTextBlob0010', async () => {
        const one: common2D.Rect = createPosTextBlob('H', 40).bounds();
        const three: common2D.Rect = createPosTextBlob('HHH', 40).bounds();
        expect(one.right > one.left).assertTrue();
        expect(three.right > three.left).assertTrue();
        expect(three.right - three.left > one.right - one.left).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_1100
     * @tc.name testTextBlob0011
     * @tc.desc Verify painting a text blob leaves opaque ink on the canvas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTextBlob0011', 0, async (done: Function) => {
      await runCase('testTextBlob0011', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 200);
        paintTextBlob(target.canvas, 'Hello');
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertLarger(0);
        expect(inked < 240 * 200).assertTrue();
        expect(maxChannel(buffer, 3)).assertEqual(255);
      }, done);
    });

    /**
     * @tc.number SUB_TEXT_BLOB_1200
     * @tc.name testTextBlob0012
     * @tc.desc Verify a run buffer blob can be painted by the canvas directly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTextBlob0012', 0, async (done: Function) => {
      await runCase('testTextBlob0012', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 200);
        const blob: drawing.TextBlob = createRunBufferBlob('HH', 48);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0x00, 0x44, 0x88));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 20, 120);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        const inked: number = countInkedPixels(buffer);
        expect(inked).assertLarger(0);
        expect(inked < 240 * 200).assertTrue();
        expect(maxChannel(buffer, 0)).assertEqual(0);
      }, done);
    });
  });
}
