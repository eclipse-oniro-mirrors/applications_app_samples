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
  BrushSnapshot,
  copyBrush,
  createFillBrush,
  resetBrush,
  snapshotBrush
} from '../../../main/ets/drawing/DrawingPenBrush';
import { rgba } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Check whether a double is close to an expected value.
 *
 * @param { number } actual - Measured value.
 * @param { number } wanted - Expected value.
 * @param { number } tolerance - Allowed distance.
 * @returns { boolean } Whether the distance is inside the tolerance.
 */
function close(actual: number, wanted: number, tolerance: number): boolean {
  return Math.abs(actual - wanted) < tolerance;
}

/**
 * Extract one byte out of a packed ARGB color.
 *
 * @param { number } hex - Packed color.
 * @param { number } shift - Bit offset of the byte.
 * @returns { number } Byte value in [0, 255].
 */
function byteOf(hex: number, shift: number): number {
  return (hex >>> shift) & 0xFF;
}

/**
 * Build a fresh brush with a fixed color.
 *
 * @returns { drawing.Brush } Fresh brush.
 */
function freshBrush(): drawing.Brush {
  return createFillBrush(rgba(255, 0x11, 0x22, 0x33));
}

export default function brushApiCoreTest() {
  describe('BrushApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_BRUSH_0001
     * @tc.name testBrushApi0001
     * @tc.desc Verify the fill brush factory keeps color, alpha and anti aliasing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testBrushApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0001 begin');
      await runCase('testBrushApi0001', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(255, 0x11, 0x44, 0x88)));
        expect(snapshot.hex).assertEqual(0xFF114488);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.alpha).assertEqual(255);
        expect(snapshot.red).assertEqual(0x11);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0002
     * @tc.name testBrushApi0002
     * @tc.desc Verify a translucent fill brush reports its alpha channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0002 begin');
      await runCase('testBrushApi0002', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(0x66, 0x20, 0x40, 0x60)));
        expect(snapshot.alpha).assertEqual(0x66);
        expect(snapshot.alphaChannel).assertEqual(0x66);
        expect(snapshot.hex).assertEqual(0x66204060);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0003
     * @tc.name testBrushApi0003
     * @tc.desc Verify a black fill brush keeps zero color channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0003 begin');
      await runCase('testBrushApi0003', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(255, 0, 0, 0)));
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.green).assertEqual(0);
        expect(snapshot.blue).assertEqual(0);
        expect(snapshot.hex).assertEqual(0xFF000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0004
     * @tc.name testBrushApi0004
     * @tc.desc Verify two fill brushes built by the factory stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0004 begin');
      await runCase('testBrushApi0004', async () => {
        const first: drawing.Brush = freshBrush();
        const second: drawing.Brush = freshBrush();
        first.setAlpha(10);
        expect(second.getAlpha()).assertEqual(255);
        expect(first.getAlpha()).assertEqual(10);
        expect(second.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0005
     * @tc.name testBrushApi0005
     * @tc.desc Verify the snapshot float alpha matches the float color alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0005 begin');
      await runCase('testBrushApi0005', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x33, 0x44, 0x55, 0x66));
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(close(snapshot.floatAlpha, brush.getColor4f().alpha, 0.0001)).assertTrue();
        expect(snapshot.alpha).assertEqual(0x33);
        expect(snapshot.blue).assertEqual(0x66);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0006
     * @tc.name testBrushApi0006
     * @tc.desc Verify the packed alpha byte matches the color alpha channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0006 begin');
      await runCase('testBrushApi0006', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(0x7F, 0x01, 0x02, 0x03)));
        expect(byteOf(snapshot.hex, 24)).assertEqual(snapshot.alphaChannel);
        expect(snapshot.hex).assertEqual(0x7F010203);
        expect(snapshot.alpha).assertEqual(0x7F);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0007
     * @tc.name testBrushApi0007
     * @tc.desc Verify a white fill brush keeps every channel at the maximum.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0007 begin');
      await runCase('testBrushApi0007', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(255, 255, 255, 255)));
        expect(snapshot.hex).assertEqual(0xFFFFFFFF);
        expect(snapshot.green).assertEqual(255);
        expect(snapshot.alphaChannel).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0008
     * @tc.name testBrushApi0008
     * @tc.desc Verify a raw brush starts opaque with anti aliasing disabled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0008 begin');
      await runCase('testBrushApi0008', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(new drawing.Brush());
        expect(snapshot.alpha).assertEqual(255);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.hex).assertEqual(0xFF000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0009
     * @tc.name testBrushApi0009
     * @tc.desc Verify a fully transparent brush keeps the rgb bytes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0009 begin');
      await runCase('testBrushApi0009', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(0, 0xAA, 0xBB, 0xCC)));
        expect(snapshot.alphaChannel).assertEqual(0);
        expect(snapshot.hex).assertEqual(0x00AABBCC);
        expect(snapshot.red).assertEqual(0xAA);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0010
     * @tc.name testBrushApi0010
     * @tc.desc Verify two factory calls with different colors do not interfere.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0010 begin');
      await runCase('testBrushApi0010', async () => {
        const first: drawing.Brush = createFillBrush(rgba(255, 1, 2, 3));
        const second: drawing.Brush = createFillBrush(rgba(255, 4, 5, 6));
        expect(first.getHexColor()).assertEqual(0xFF010203);
        expect(second.getHexColor()).assertEqual(0xFF040506);
        expect(first === second).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0011
     * @tc.name testBrushApi0011
     * @tc.desc Verify the brush color object exposes all four channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0011 begin');
      await runCase('testBrushApi0011', async () => {
        const color: common2D.Color = createFillBrush(rgba(0x10, 0x20, 0x30, 0x40)).getColor();
        expect(color.alpha).assertEqual(0x10);
        expect(color.red).assertEqual(0x20);
        expect(color.green).assertEqual(0x30);
        expect(color.blue).assertEqual(0x40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0012
     * @tc.name testBrushApi0012
     * @tc.desc Verify the snapshot fields agree with each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0012 begin');
      await runCase('testBrushApi0012', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(0x9A, 0xBC, 0xDE, 0xF0)));
        expect(byteOf(snapshot.hex, 16)).assertEqual(snapshot.red);
        expect(byteOf(snapshot.hex, 8)).assertEqual(snapshot.green);
        expect(byteOf(snapshot.hex, 0)).assertEqual(snapshot.blue);
        expect(byteOf(snapshot.hex, 24)).assertEqual(snapshot.alpha);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0013
     * @tc.name testBrushApi0013
     * @tc.desc Verify the color object overload writes all four channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testBrushApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0013 begin');
      await runCase('testBrushApi0013', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0x11, 0x22, 0x33));
        const color: common2D.Color = brush.getColor();
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(0x11);
        expect(color.green).assertEqual(0x22);
        expect(color.blue).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0014
     * @tc.name testBrushApi0014
     * @tc.desc Verify the four number overload sets a partial alpha color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0014 begin');
      await runCase('testBrushApi0014', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(200, 0x11, 0x22, 0x33);
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.alphaChannel).assertEqual(200);
        expect(snapshot.red).assertEqual(0x11);
        expect(snapshot.hex).assertEqual(0xC8112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0015
     * @tc.name testBrushApi0015
     * @tc.desc Verify the packed overload sets an opaque color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testBrushApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0015 begin');
      await runCase('testBrushApi0015', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF445566);
        expect(brush.getHexColor()).assertEqual(0xFF445566);
        expect(brush.getAlpha()).assertEqual(255);
        expect(brush.getColor().blue).assertEqual(0x66);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0016
     * @tc.name testBrushApi0016
     * @tc.desc Verify the last color overload call wins.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0016 begin');
      await runCase('testBrushApi0016', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(1, 2, 3, 4));
        brush.setColor(7, 8, 9, 10);
        brush.setColor(0xFF010203);
        expect(brush.getHexColor()).assertEqual(0xFF010203);
        expect(brush.getColor().red).assertEqual(1);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0017
     * @tc.name testBrushApi0017
     * @tc.desc Verify a color call overrides the factory color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0017 begin');
      await runCase('testBrushApi0017', async () => {
        const brush: drawing.Brush = freshBrush();
        brush.setColor(rgba(255, 0xAA, 0xBB, 0xCC));
        expect(brush.getHexColor()).assertEqual(0xFFAABBCC);
        expect(brush.isAntiAlias()).assertTrue();
        expect(brush.getColor().green).assertEqual(0xBB);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0018
     * @tc.name testBrushApi0018
     * @tc.desc Verify a fully transparent packed color keeps the rgb bytes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0018 begin');
      await runCase('testBrushApi0018', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0x00112233);
        expect(brush.getHexColor()).assertEqual(0x00112233);
        expect(brush.getAlpha()).assertEqual(0);
        expect(brush.getColor().blue).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0019
     * @tc.name testBrushApi0019
     * @tc.desc Verify the white color keeps every channel saturated.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0019 begin');
      await runCase('testBrushApi0019', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFFFFFFFF);
        expect(brush.getHexColor()).assertEqual(0xFFFFFFFF);
        expect(brush.getColor().red).assertEqual(255);
        expect(brush.getColor().blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0020
     * @tc.name testBrushApi0020
     * @tc.desc Verify the four number and packed overloads agree on the same color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0020 begin');
      await runCase('testBrushApi0020', async () => {
        const numbers: drawing.Brush = new drawing.Brush();
        const packed: drawing.Brush = new drawing.Brush();
        numbers.setColor(0x80, 0x24, 0x68, 0xAC);
        packed.setColor(0x802468AC);
        expect(numbers.getHexColor()).assertEqual(packed.getHexColor());
        expect(numbers.getColor().green).assertEqual(packed.getColor().green);
        expect(numbers.getAlpha()).assertEqual(0x80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0021
     * @tc.name testBrushApi0021
     * @tc.desc Verify a color call does not reset the anti alias flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0021 begin');
      await runCase('testBrushApi0021', async () => {
        const brush: drawing.Brush = freshBrush();
        brush.setColor(0xFF00FF00);
        expect(brush.isAntiAlias()).assertTrue();
        expect(brush.getHexColor()).assertEqual(0xFF00FF00);
        expect(brush.getColor().green).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0022
     * @tc.name testBrushApi0022
     * @tc.desc Verify setting the same color twice is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0022 begin');
      await runCase('testBrushApi0022', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF123456);
        const first: number = brush.getHexColor();
        brush.setColor(0xFF123456);
        expect(brush.getHexColor()).assertEqual(first);
        expect(brush.getColor().red).assertEqual(0x12);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0023
     * @tc.name testBrushApi0023
     * @tc.desc Verify three packed colors each round trip through the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0023 begin');
      await runCase('testBrushApi0023', async () => {
        const wanted: number[] = [0xFF112233, 0x80445566, 0x00112233];
        let matched: number = 0;
        for (let index: number = 0; index < wanted.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(wanted[index]);
          if (brush.getHexColor() === wanted[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(wanted.length).assertEqual(3);
        expect(byteOf(wanted[1], 24)).assertEqual(0x80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0024
     * @tc.name testBrushApi0024
     * @tc.desc Verify the color object and the packed color agree.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0024 begin');
      await runCase('testBrushApi0024', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(0x40, 0x50, 0x60, 0x70));
        const color: common2D.Color = brush.getColor();
        expect(byteOf(brush.getHexColor(), 16)).assertEqual(color.red);
        expect(byteOf(brush.getHexColor(), 8)).assertEqual(color.green);
        expect(byteOf(brush.getHexColor(), 0)).assertEqual(color.blue);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0025
     * @tc.name testBrushApi0025
     * @tc.desc Verify zero channels in the four number overload are kept.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0025 begin');
      await runCase('testBrushApi0025', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(255, 0, 128, 0);
        expect(brush.getHexColor()).assertEqual(0xFF008000);
        expect(brush.getColor().red).assertEqual(0);
        expect(brush.getColor().green).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0026
     * @tc.name testBrushApi0026
     * @tc.desc Verify recoloring a copy does not change the source brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0026 begin');
      await runCase('testBrushApi0026', async () => {
        const source: drawing.Brush = freshBrush();
        const copied: drawing.Brush = copyBrush(source);
        copied.setColor(0xFF0000FF);
        expect(source.getHexColor()).assertEqual(0xFF112233);
        expect(copied.getHexColor()).assertEqual(0xFF0000FF);
        expect(source.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0027
     * @tc.name testBrushApi0027
     * @tc.desc Verify setAlpha zero makes the brush fully transparent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0027 begin');
      await runCase('testBrushApi0027', async () => {
        const brush: drawing.Brush = freshBrush();
        brush.setAlpha(0);
        expect(brush.getAlpha()).assertEqual(0);
        expect(brush.getHexColor()).assertEqual(0x00112233);
        expect(brush.getColor().red).assertEqual(0x11);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0028
     * @tc.name testBrushApi0028
     * @tc.desc Verify a mid range alpha lands on the packed alpha byte.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0028 begin');
      await runCase('testBrushApi0028', async () => {
        const brush: drawing.Brush = freshBrush();
        brush.setAlpha(128);
        expect(brush.getAlpha()).assertEqual(128);
        expect(byteOf(brush.getHexColor(), 24)).assertEqual(128);
        expect(brush.getColor().alpha).assertEqual(128);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0029
     * @tc.name testBrushApi0029
     * @tc.desc Verify setAlpha 255 keeps the brush fully opaque.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0029 begin');
      await runCase('testBrushApi0029', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(10, 0x11, 0x22, 0x33));
        brush.setAlpha(255);
        expect(brush.getAlpha()).assertEqual(255);
        expect(brush.getHexColor()).assertEqual(0xFF112233);
        expect(brush.getColor().alpha).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0030
     * @tc.name testBrushApi0030
     * @tc.desc Verify a later alpha call overrides the earlier one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0030 begin');
      await runCase('testBrushApi0030', async () => {
        const brush: drawing.Brush = freshBrush();
        brush.setAlpha(30);
        brush.setAlpha(210);
        expect(brush.getAlpha()).assertEqual(210);
        expect(byteOf(brush.getHexColor(), 24)).assertEqual(210);
        expect(brush.getColor().red).assertEqual(0x11);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0031
     * @tc.name testBrushApi0031
     * @tc.desc Verify an alpha call keeps the rgb channels of the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0031 begin');
      await runCase('testBrushApi0031', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF102030);
        brush.setAlpha(45);
        expect(brush.getColor().red).assertEqual(0x10);
        expect(brush.getColor().green).assertEqual(0x20);
        expect(brush.getColor().blue).assertEqual(0x30);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0032
     * @tc.name testBrushApi0032
     * @tc.desc Verify fractional alpha values are truncated to integers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0032 begin');
      await runCase('testBrushApi0032', async () => {
        const input: number[] = [10.2, 99.9, 254.9];
        const wanted: number[] = [10, 99, 254];
        let matched: number = 0;
        for (let index: number = 0; index < input.length; index++) {
          const brush: drawing.Brush = freshBrush();
          brush.setAlpha(input[index]);
          if (brush.getAlpha() === wanted[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(wanted.length).assertEqual(3);
        expect(freshBrush().getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0033
     * @tc.name testBrushApi0033
     * @tc.desc Verify setting the same alpha twice is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0033 begin');
      await runCase('testBrushApi0033', async () => {
        const brush: drawing.Brush = freshBrush();
        brush.setAlpha(77);
        const first: number = brush.getHexColor();
        brush.setAlpha(77);
        expect(brush.getHexColor()).assertEqual(first);
        expect(brush.getAlpha()).assertEqual(77);
        expect(first).assertEqual(0x4D112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0034
     * @tc.name testBrushApi0034
     * @tc.desc Verify a new alpha does not affect another brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0034 begin');
      await runCase('testBrushApi0034', async () => {
        const victim: drawing.Brush = freshBrush();
        const keeper: drawing.Brush = freshBrush();
        victim.setAlpha(1);
        expect(keeper.getAlpha()).assertEqual(255);
        expect(keeper.getHexColor()).assertEqual(0xFF112233);
        expect(victim.getAlpha()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0035
     * @tc.name testBrushApi0035
     * @tc.desc Verify anti aliasing can be turned off on a fill brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0035 begin');
      await runCase('testBrushApi0035', async () => {
        const brush: drawing.Brush = freshBrush();
        expect(brush.isAntiAlias()).assertTrue();
        brush.setAntiAlias(false);
        expect(brush.isAntiAlias()).assertFalse();
        expect(snapshotBrush(brush).antiAlias).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0036
     * @tc.name testBrushApi0036
     * @tc.desc Verify anti aliasing can be turned on for a raw brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0036 begin');
      await runCase('testBrushApi0036', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        expect(brush.isAntiAlias()).assertFalse();
        brush.setAntiAlias(true);
        expect(brush.isAntiAlias()).assertTrue();
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0037
     * @tc.name testBrushApi0037
     * @tc.desc Verify repeated anti alias toggles end on the last value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0037 begin');
      await runCase('testBrushApi0037', async () => {
        const brush: drawing.Brush = freshBrush();
        brush.setAntiAlias(false);
        brush.setAntiAlias(true);
        brush.setAntiAlias(false);
        expect(brush.isAntiAlias()).assertFalse();
        brush.setAntiAlias(true);
        expect(brush.isAntiAlias()).assertTrue();
        expect(brush.getHexColor()).assertEqual(0xFF112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0038
     * @tc.name testBrushApi0038
     * @tc.desc Verify an anti alias change does not touch the color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0038 begin');
      await runCase('testBrushApi0038', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x44, 0x55, 0x66, 0x77));
        brush.setAntiAlias(false);
        expect(brush.getHexColor()).assertEqual(0x44556677);
        expect(brush.getAlpha()).assertEqual(0x44);
        expect(brush.getColor().green).assertEqual(0x66);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0039
     * @tc.name testBrushApi0039
     * @tc.desc Verify a fractional Color4f keeps all four channels on the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0039 begin');
      await runCase('testBrushApi0039', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 0.5, red: 0.25, green: 0.5, blue: 0.75 }, null);
        const color4f: common2D.Color4f = brush.getColor4f();
        expect(close(color4f.alpha, 0.5, 0.001)).assertTrue();
        expect(close(color4f.red, 0.25, 0.001)).assertTrue();
        expect(close(color4f.blue, 0.75, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0040
     * @tc.name testBrushApi0040
     * @tc.desc Verify an all zero Color4f makes the brush transparent black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0040 begin');
      await runCase('testBrushApi0040', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 0, red: 0, green: 0, blue: 0 }, null);
        expect(brush.getHexColor()).assertEqual(0x00000000);
        expect(brush.getAlpha()).assertEqual(0);
        expect(brush.getColor().blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0041
     * @tc.name testBrushApi0041
     * @tc.desc Verify an all one Color4f makes the brush opaque white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0041 begin');
      await runCase('testBrushApi0041', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 1, red: 1, green: 1, blue: 1 }, null);
        expect(brush.getHexColor()).assertEqual(0xFFFFFFFF);
        expect(brush.getAlpha()).assertEqual(255);
        expect(close(brush.getColor4f().blue, 1, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0042
     * @tc.name testBrushApi0042
     * @tc.desc Verify out of range Color4f channels are clamped.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testBrushApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0042 begin');
      await runCase('testBrushApi0042', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 2, red: -1, green: 1.5, blue: -0.2 }, null);
        const color4f: common2D.Color4f = brush.getColor4f();
        expect(close(color4f.alpha, 1, 0.001)).assertTrue();
        expect(close(color4f.red, 0, 0.001)).assertTrue();
        expect(close(color4f.blue, 0, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0043
     * @tc.name testBrushApi0043
     * @tc.desc Verify a float color replaces a packed color set earlier.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0043 begin');
      await runCase('testBrushApi0043', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF445566);
        brush.setColor4f({ alpha: 1, red: 1, green: 0, blue: 0 }, null);
        expect(brush.getColor().red).assertEqual(255);
        expect(brush.getColor().green).assertEqual(0);
        expect(brush.getColor().blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0044
     * @tc.name testBrushApi0044
     * @tc.desc Verify the float and integer brush colors agree.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0044 begin');
      await runCase('testBrushApi0044', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 0.4, red: 0.2, green: 0.6, blue: 0.8 }, null);
        const color4f: common2D.Color4f = brush.getColor4f();
        const color: common2D.Color = brush.getColor();
        expect(close(color4f.red * 255, color.red, 1)).assertTrue();
        expect(close(color4f.green * 255, color.green, 1)).assertTrue();
        expect(color.blue > color.red).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0045
     * @tc.name testBrushApi0045
     * @tc.desc Verify the brush effect preset ends on alpha 160.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0045 begin');
      await runCase('testBrushApi0045', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        expect(brush.getAlpha()).assertEqual(160);
        expect(brush.getColor().alpha).assertEqual(160);
        expect(byteOf(brush.getHexColor(), 24)).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0046
     * @tc.name testBrushApi0046
     * @tc.desc Verify the brush effect preset enables anti aliasing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0046 begin');
      await runCase('testBrushApi0046', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        expect(brush.isAntiAlias()).assertFalse();
        applyBrushEffects(brush);
        expect(brush.isAntiAlias()).assertTrue();
        expect(snapshotBrush(brush).antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0047
     * @tc.name testBrushApi0047
     * @tc.desc Verify the brush effect preset ends on the fractional color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0047 begin');
      await runCase('testBrushApi0047', async () => {
        const color4f: common2D.Color4f = applyBrushEffects(new drawing.Brush()).getColor4f();
        expect(close(color4f.red, 0.2, 0.01)).assertTrue();
        expect(close(color4f.green, 0.3, 0.01)).assertTrue();
        expect(close(color4f.blue, 0.4, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0048
     * @tc.name testBrushApi0048
     * @tc.desc Verify the brush effect preset returns the same instance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0048 begin');
      await runCase('testBrushApi0048', async () => {
        const source: drawing.Brush = freshBrush();
        const applied: drawing.Brush = applyBrushEffects(source);
        expect(applied === source).assertTrue();
        expect(applied.getAlpha()).assertEqual(160);
        expect(applied.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0049
     * @tc.name testBrushApi0049
     * @tc.desc Verify applying the brush effects twice is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0049 begin');
      await runCase('testBrushApi0049', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const once: BrushSnapshot = snapshotBrush(brush);
        const twice: BrushSnapshot = snapshotBrush(applyBrushEffects(brush));
        expect(twice.alpha).assertEqual(once.alpha);
        expect(twice.hex).assertEqual(once.hex);
        expect(twice.antiAlias).assertEqual(once.antiAlias);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0050
     * @tc.name testBrushApi0050
     * @tc.desc Verify a later color call overrides the effect color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0050 begin');
      await runCase('testBrushApi0050', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        brush.setColor(0xFF00FF00);
        expect(brush.getHexColor()).assertEqual(0xFF00FF00);
        expect(brush.getColor().green).assertEqual(255);
        expect(brush.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0051
     * @tc.name testBrushApi0051
     * @tc.desc Verify a later alpha call overrides the effect alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0051 begin');
      await runCase('testBrushApi0051', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        brush.setAlpha(80);
        expect(brush.getAlpha()).assertEqual(80);
        expect(byteOf(brush.getHexColor(), 24)).assertEqual(80);
        expect(close(brush.getColor().red, 51, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0052
     * @tc.name testBrushApi0052
     * @tc.desc Verify the brush effects stay on the target instance only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0052 begin');
      await runCase('testBrushApi0052', async () => {
        const victim: drawing.Brush = freshBrush();
        const keeper: drawing.Brush = freshBrush();
        applyBrushEffects(victim);
        expect(victim.getAlpha()).assertEqual(160);
        expect(keeper.getAlpha()).assertEqual(255);
        expect(keeper.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0053
     * @tc.name testBrushApi0053
     * @tc.desc Verify reset restores every default after the brush effects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0053 begin');
      await runCase('testBrushApi0053', async () => {
        const snapshot: BrushSnapshot = resetBrush(applyBrushEffects(new drawing.Brush()));
        expect(snapshot.alpha).assertEqual(255);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.hex).assertEqual(0xFF000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0054
     * @tc.name testBrushApi0054
     * @tc.desc Verify a copy keeps the brush effect attributes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0054 begin');
      await runCase('testBrushApi0054', async () => {
        const copied: BrushSnapshot = snapshotBrush(copyBrush(applyBrushEffects(new drawing.Brush())));
        expect(copied.alpha).assertEqual(160);
        expect(copied.antiAlias).assertTrue();
        expect(copied.red).assertEqual(51);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0055
     * @tc.name testBrushApi0055
     * @tc.desc Verify the packed alpha byte follows the brush alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0055 begin');
      await runCase('testBrushApi0055', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        expect(byteOf(brush.getHexColor(), 24)).assertEqual(brush.getAlpha());
        expect(brush.getColor().alpha).assertEqual(160);
        expect(brush.getColor4f().blue > 0.3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0056
     * @tc.name testBrushApi0056
     * @tc.desc Verify reset restores alpha and the anti alias flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0056 begin');
      await runCase('testBrushApi0056', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x20, 1, 2, 3));
        const snapshot: BrushSnapshot = resetBrush(brush);
        expect(snapshot.alpha).assertEqual(255);
        expect(snapshot.antiAlias).assertFalse();
        expect(brush.isAntiAlias()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0057
     * @tc.name testBrushApi0057
     * @tc.desc Verify reset clears the brush color to opaque black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0057 begin');
      await runCase('testBrushApi0057', async () => {
        const snapshot: BrushSnapshot = resetBrush(freshBrush());
        expect(snapshot.hex).assertEqual(0xFF000000);
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.green).assertEqual(0);
        expect(snapshot.blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0058
     * @tc.name testBrushApi0058
     * @tc.desc Verify resetting a brush twice keeps the same defaults.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0058 begin');
      await runCase('testBrushApi0058', async () => {
        const brush: drawing.Brush = freshBrush();
        const once: BrushSnapshot = resetBrush(brush);
        const twice: BrushSnapshot = resetBrush(brush);
        expect(twice.hex).assertEqual(once.hex);
        expect(twice.alpha).assertEqual(once.alpha);
        expect(twice.antiAlias).assertEqual(once.antiAlias);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0059
     * @tc.name testBrushApi0059
     * @tc.desc Verify a brush copy keeps color, alpha and anti aliasing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0059 begin');
      await runCase('testBrushApi0059', async () => {
        const source: drawing.Brush = createFillBrush(rgba(0x90, 0x0A, 0x0B, 0x0C));
        const snapshot: BrushSnapshot = snapshotBrush(copyBrush(source));
        expect(snapshot.hex).assertEqual(0x900A0B0C);
        expect(snapshot.alpha).assertEqual(0x90);
        expect(snapshot.antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0060
     * @tc.name testBrushApi0060
     * @tc.desc Verify a brush copy and its source stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0060 begin');
      await runCase('testBrushApi0060', async () => {
        const source: drawing.Brush = freshBrush();
        const copied: drawing.Brush = copyBrush(source);
        copied.setAlpha(3);
        source.setColor(0xFF777777);
        expect(copied.getAlpha()).assertEqual(3);
        expect(copied.getHexColor()).assertEqual(0x03112233);
        expect(source.getHexColor()).assertEqual(0xFF777777);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0060 end');
    });
  });
}
