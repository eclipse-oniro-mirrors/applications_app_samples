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
  createStrokePen,
  resetBrush,
  snapshotBrush,
  snapshotPen
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
 * Check whether a brush reports the same color through all three getters.
 *
 * @param { drawing.Brush } brush - Brush under test.
 * @param { number } hex - Expected packed color.
 * @returns { boolean } Whether the packed and structured colors agree.
 */
function colorAgrees(brush: drawing.Brush, hex: number): boolean {
  const color: common2D.Color = brush.getColor();
  return brush.getHexColor() === hex && color.alpha === byteOf(hex, 24) &&
    color.red === byteOf(hex, 16) && color.green === byteOf(hex, 8) && color.blue === byteOf(hex, 0);
}

export default function brushApiExtendedTest() {
  describe('BrushApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_BRUSH_0061
     * @tc.name testBrushApi0061
     * @tc.desc Verify five packed colors keep all four channels on the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0061 begin');
      await runCase('testBrushApi0061', async () => {
        const cases: number[] = [0xFF000000, 0xFF112233, 0x80445566, 0x00778899, 0xFFFFFFFF];
        let matched: number = 0;
        for (let index: number = 0; index < cases.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(cases[index]);
          if (colorAgrees(brush, cases[index])) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(cases.length).assertEqual(5);
        expect(byteOf(cases[2], 24)).assertEqual(0x80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0062
     * @tc.name testBrushApi0062
     * @tc.desc Verify the float color of an integer color is normalized per channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0062 begin');
      await runCase('testBrushApi0062', async () => {
        const channels: number[] = [0, 0x33, 0x66, 0x99, 0xCC, 0xFF];
        let matched: number = 0;
        for (let index: number = 0; index < channels.length; index++) {
          const value: number = channels[index];
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(255, value, value, value);
          if (close(brush.getColor4f().red, value / 255, 0.005)) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(6);
        expect(channels.length).assertEqual(6);
        expect(close(new drawing.Brush().getColor4f().alpha, 1, 0.005)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0063
     * @tc.name testBrushApi0063
     * @tc.desc Verify seven alpha levels land on the packed alpha byte.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0063 begin');
      await runCase('testBrushApi0063', async () => {
        const levels: number[] = [0, 1, 7, 63, 127, 200, 255];
        let matched: number = 0;
        for (let index: number = 0; index < levels.length; index++) {
          const brush: drawing.Brush = createFillBrush(rgba(255, 0x12, 0x34, 0x56));
          brush.setAlpha(levels[index]);
          if (byteOf(brush.getHexColor(), 24) === levels[index] && brush.getAlpha() === levels[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(7);
        expect(levels.length).assertEqual(7);
        expect(byteOf(createFillBrush(rgba(255, 1, 2, 3)).getHexColor(), 0)).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0064
     * @tc.name testBrushApi0064
     * @tc.desc Verify six red levels keep green and blue untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0064 begin');
      await runCase('testBrushApi0064', async () => {
        const levels: number[] = [0, 51, 102, 153, 204, 255];
        let matched: number = 0;
        for (let index: number = 0; index < levels.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(255, levels[index], 0x10, 0x20);
          const color: common2D.Color = brush.getColor();
          if (color.red === levels[index] && color.green === 0x10 && color.blue === 0x20) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(6);
        expect(levels.length).assertEqual(6);
        expect(levels[5]).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0065
     * @tc.name testBrushApi0065
     * @tc.desc Verify a complementary color replaces the previous palette entry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0065 begin');
      await runCase('testBrushApi0065', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF00FF00);
        brush.setColor(0xFFFF00FF);
        expect(brush.getColor().red).assertEqual(255);
        expect(brush.getColor().green).assertEqual(0);
        expect(brush.getColor().blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0066
     * @tc.name testBrushApi0066
     * @tc.desc Verify grey levels keep red, green and blue equal.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0066 begin');
      await runCase('testBrushApi0066', async () => {
        const levels: number[] = [0, 64, 128, 192, 255];
        let matched: number = 0;
        for (let index: number = 0; index < levels.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(255, levels[index], levels[index], levels[index]);
          const color: common2D.Color = brush.getColor();
          if (color.red === color.green && color.green === color.blue) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(levels.length).assertEqual(5);
        expect(byteOf(new drawing.Brush().getHexColor(), 16)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0067
     * @tc.name testBrushApi0067
     * @tc.desc Verify the lowest packed color zeroes every channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0067 begin');
      await runCase('testBrushApi0067', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0x00000000);
        expect(brush.getHexColor()).assertEqual(0);
        expect(brush.getAlpha()).assertEqual(0);
        expect(brush.getColor().blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0068
     * @tc.name testBrushApi0068
     * @tc.desc Verify the highest packed color saturates every channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0068 begin');
      await runCase('testBrushApi0068', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFFFFFFFF);
        expect(brush.getAlpha()).assertEqual(255);
        expect(brush.getColor().green).assertEqual(255);
        expect(brush.getHexColor()).assertEqual(0xFFFFFFFF);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0069
     * @tc.name testBrushApi0069
     * @tc.desc Verify three packed colors agree across all three getters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0069 begin');
      await runCase('testBrushApi0069', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0x10203040);
        expect(colorAgrees(brush, 0x10203040)).assertTrue();
        brush.setColor(0xAABBCCDD);
        expect(colorAgrees(brush, 0xAABBCCDD)).assertTrue();
        brush.setColor(0x01020304);
        expect(colorAgrees(brush, 0x01020304)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0070
     * @tc.name testBrushApi0070
     * @tc.desc Verify the snapshot equals the direct getters for three colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0070 begin');
      await runCase('testBrushApi0070', async () => {
        const cases: number[] = [0xFF010203, 0x40506070, 0x8090A0B0];
        let matched: number = 0;
        for (let index: number = 0; index < cases.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(cases[index]);
          const snapshot: BrushSnapshot = snapshotBrush(brush);
          if (snapshot.hex === brush.getHexColor() && snapshot.alpha === brush.getAlpha() &&
            snapshot.red === brush.getColor().red) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(cases.length).assertEqual(3);
        expect(snapshotBrush(new drawing.Brush()).antiAlias).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0071
     * @tc.name testBrushApi0071
     * @tc.desc Verify an alpha change keeps all three rgb bytes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0071 begin');
      await runCase('testBrushApi0071', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x12, 0x34, 0x56));
        const before: number = brush.getHexColor();
        brush.setAlpha(99);
        const after: number = brush.getHexColor();
        expect(byteOf(after, 16)).assertEqual(byteOf(before, 16));
        expect(byteOf(after, 8)).assertEqual(byteOf(before, 8));
        expect(byteOf(after, 0)).assertEqual(byteOf(before, 0));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0072
     * @tc.name testBrushApi0072
     * @tc.desc Verify five consecutive alpha values end on the last one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0072 begin');
      await runCase('testBrushApi0072', async () => {
        const levels: number[] = [9, 88, 177, 33, 244];
        const brush: drawing.Brush = createFillBrush(rgba(255, 7, 8, 9));
        for (let index: number = 0; index < levels.length; index++) {
          brush.setAlpha(levels[index]);
        }
        expect(brush.getAlpha()).assertEqual(244);
        expect(byteOf(brush.getHexColor(), 24)).assertEqual(244);
        expect(brush.getColor().blue).assertEqual(9);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0073
     * @tc.name testBrushApi0073
     * @tc.desc Verify interleaved color and alpha calls keep the last rgb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0073 begin');
      await runCase('testBrushApi0073', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF101010);
        brush.setAlpha(20);
        brush.setColor(0xFF202020);
        brush.setAlpha(21);
        expect(brush.getColor().red).assertEqual(0x20);
        expect(brush.getAlpha()).assertEqual(21);
        expect(byteOf(brush.getHexColor(), 0)).assertEqual(0x20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0074
     * @tc.name testBrushApi0074
     * @tc.desc Verify the float color wins when it is set after the packed color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0074 begin');
      await runCase('testBrushApi0074', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFF00FF00);
        brush.setColor4f({ alpha: 1, red: 1, green: 0, blue: 0 }, null);
        expect(brush.getColor().red).assertEqual(255);
        expect(brush.getColor().green).assertEqual(0);
        expect(brush.getHexColor()).assertEqual(0xFFFF0000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0075
     * @tc.name testBrushApi0075
     * @tc.desc Verify ten fresh brushes each start from the same defaults.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0075 begin');
      await runCase('testBrushApi0075', async () => {
        let matched: number = 0;
        for (let index: number = 0; index < 10; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          if (brush.getAlpha() === 255 && brush.getHexColor() === 0xFF000000 && !brush.isAntiAlias()) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(10);
        expect(snapshotBrush(new drawing.Brush()).floatAlpha).assertEqual(1);
        expect(snapshotBrush(new drawing.Brush()).hex).assertEqual(0xFF000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0076
     * @tc.name testBrushApi0076
     * @tc.desc Verify a brush and a pen fed the same color stay separate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0076 begin');
      await runCase('testBrushApi0076', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x40, 0x11, 0x22, 0x33));
        const pen: drawing.Pen = createStrokePen(rgba(0x40, 0x11, 0x22, 0x33), 3);
        brush.setAlpha(5);
        expect(pen.getAlpha()).assertEqual(0x40);
        expect(snapshotBrush(brush).alpha).assertEqual(5);
        expect(snapshotPen(pen).hex).assertEqual(0x40112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0077
     * @tc.name testBrushApi0077
     * @tc.desc Verify two reset and configure rounds land on the same state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0077 begin');
      await runCase('testBrushApi0077', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(9, 9, 9, 9));
        const first: BrushSnapshot = resetBrush(brush);
        brush.setColor(0xFF445566);
        brush.setAlpha(66);
        const configured: BrushSnapshot = snapshotBrush(brush);
        const second: BrushSnapshot = resetBrush(brush);
        expect(second.hex).assertEqual(first.hex);
        expect(second.alpha).assertEqual(first.alpha);
        expect(configured.alpha).assertEqual(66);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0078
     * @tc.name testBrushApi0078
     * @tc.desc Verify copying a reset brush keeps the defaults.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0078 begin');
      await runCase('testBrushApi0078', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(1, 2, 3, 4));
        resetBrush(brush);
        const copied: BrushSnapshot = snapshotBrush(copyBrush(brush));
        expect(copied.hex).assertEqual(0xFF000000);
        expect(copied.alpha).assertEqual(255);
        expect(copied.antiAlias).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0079
     * @tc.name testBrushApi0079
     * @tc.desc Verify resetting a copy keeps the source alpha untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0079 begin');
      await runCase('testBrushApi0079', async () => {
        const source: drawing.Brush = createFillBrush(rgba(0x5A, 0x10, 0x20, 0x30));
        const copied: drawing.Brush = copyBrush(source);
        resetBrush(copied);
        expect(copied.getAlpha()).assertEqual(255);
        expect(source.getAlpha()).assertEqual(0x5A);
        expect(source.getHexColor()).assertEqual(0x5A102030);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0080
     * @tc.name testBrushApi0080
     * @tc.desc Verify a three level brush copy keeps the same color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0080 begin');
      await runCase('testBrushApi0080', async () => {
        const source: drawing.Brush = createFillBrush(rgba(0x77, 0x88, 0x99, 0xAA));
        const copied: drawing.Brush = copyBrush(copyBrush(copyBrush(source)));
        expect(copied.getHexColor()).assertEqual(0x778899AA);
        expect(copied.getAlpha()).assertEqual(0x77);
        expect(copied.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0081
     * @tc.name testBrushApi0081
     * @tc.desc Verify a float color overrides the effect color after the preset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0081 begin');
      await runCase('testBrushApi0081', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        brush.setColor4f({ alpha: 1, red: 0, green: 1, blue: 0 }, null);
        expect(brush.getColor().green).assertEqual(255);
        expect(brush.getColor().red).assertEqual(0);
        expect(brush.getColor().blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0082
     * @tc.name testBrushApi0082
     * @tc.desc Verify anti aliasing can be disabled after the effect preset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0082 begin');
      await runCase('testBrushApi0082', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        brush.setAntiAlias(false);
        expect(brush.isAntiAlias()).assertFalse();
        expect(brush.getAlpha()).assertEqual(160);
        expect(snapshotBrush(brush).antiAlias).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0083
     * @tc.name testBrushApi0083
     * @tc.desc Verify a second effect round after reset reaches the same state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0083 begin');
      await runCase('testBrushApi0083', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const first: BrushSnapshot = snapshotBrush(brush);
        resetBrush(brush);
        const second: BrushSnapshot = snapshotBrush(applyBrushEffects(brush));
        expect(second.hex).assertEqual(first.hex);
        expect(second.alpha).assertEqual(first.alpha);
        expect(second.antiAlias).assertEqual(first.antiAlias);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0084
     * @tc.name testBrushApi0084
     * @tc.desc Verify two effect brushes keep identical but separate state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0084 begin');
      await runCase('testBrushApi0084', async () => {
        const first: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const second: drawing.Brush = applyBrushEffects(new drawing.Brush());
        first.setAlpha(11);
        expect(second.getAlpha()).assertEqual(160);
        expect(first.getHexColor()).assertEqual(0x0B334D66);
        expect(second.getColor4f().green > 0.2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0085
     * @tc.name testBrushApi0085
     * @tc.desc Verify an effect brush copy stays independent of its source.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0085 begin');
      await runCase('testBrushApi0085', async () => {
        const source: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const copied: drawing.Brush = copyBrush(source);
        copied.setColor(0xFFFFFFFF);
        expect(source.getHexColor()).assertEqual(0xA0334D66);
        expect(copied.getHexColor()).assertEqual(0xFFFFFFFF);
        expect(source.getAlpha()).assertEqual(160);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0086
     * @tc.name testBrushApi0086
     * @tc.desc Verify twenty alpha updates end on the last value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0086 begin');
      await runCase('testBrushApi0086', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        for (let index: number = 0; index < 20; index++) {
          brush.setAlpha(index * 10);
        }
        expect(brush.getAlpha()).assertEqual(190);
        expect(byteOf(brush.getHexColor(), 24)).assertEqual(190);
        expect(brush.getColor().red).assertEqual(0x11);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0087
     * @tc.name testBrushApi0087
     * @tc.desc Verify ten color updates end on the last packed color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0087 begin');
      await runCase('testBrushApi0087', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        for (let index: number = 0; index < 10; index++) {
          brush.setColor(0xFF000000 + index * 0x010101);
        }
        expect(brush.getHexColor()).assertEqual(0xFF090909);
        expect(brush.getColor().green).assertEqual(9);
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0088
     * @tc.name testBrushApi0088
     * @tc.desc Verify ten interleaved color and alpha rounds keep the last pair.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0088 begin');
      await runCase('testBrushApi0088', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        for (let index: number = 0; index < 10; index++) {
          brush.setColor(0xFF000000 + index * 0x020202);
          brush.setAlpha(100 + index);
        }
        expect(brush.getColor().red).assertEqual(0x12);
        expect(brush.getAlpha()).assertEqual(109);
        expect(byteOf(brush.getHexColor(), 0)).assertEqual(0x12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0089
     * @tc.name testBrushApi0089
     * @tc.desc Verify a new brush is not affected by an existing one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0089 begin');
      await runCase('testBrushApi0089', async () => {
        const configured: drawing.Brush = createFillBrush(rgba(1, 2, 3, 4));
        configured.setAntiAlias(false);
        const fresh: drawing.Brush = new drawing.Brush();
        expect(fresh.getHexColor()).assertEqual(0xFF000000);
        expect(fresh.getAlpha()).assertEqual(255);
        expect(fresh.isAntiAlias()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0090
     * @tc.name testBrushApi0090
     * @tc.desc Verify resetting another brush does not change this brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0090 begin');
      await runCase('testBrushApi0090', async () => {
        const keeper: drawing.Brush = createFillBrush(rgba(0x33, 0x44, 0x55, 0x66));
        keeper.setAlpha(0x33);
        resetBrush(createFillBrush(rgba(1, 2, 3, 4)));
        expect(keeper.getHexColor()).assertEqual(0x33445566);
        expect(keeper.isAntiAlias()).assertTrue();
        expect(snapshotBrush(keeper).alpha).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0091
     * @tc.name testBrushApi0091
     * @tc.desc Verify copying before and after the preset gives the same result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0091 begin');
      await runCase('testBrushApi0091', async () => {
        const before: drawing.Brush = copyBrush(applyBrushEffects(new drawing.Brush()));
        const source: drawing.Brush = new drawing.Brush();
        const after: drawing.Brush = applyBrushEffects(copyBrush(source));
        expect(before.getHexColor()).assertEqual(after.getHexColor());
        expect(before.getAlpha()).assertEqual(after.getAlpha());
        expect(source.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0092
     * @tc.name testBrushApi0092
     * @tc.desc Verify the effect preset always ends on the alpha 160 color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0092 begin');
      await runCase('testBrushApi0092', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(applyBrushEffects(createFillBrush(rgba(9, 9, 9, 9))));
        expect(snapshot.alpha).assertEqual(0xA0);
        expect(byteOf(snapshot.hex, 24)).assertEqual(0xA0);
        expect(snapshot.floatAlpha > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0093
     * @tc.name testBrushApi0093
     * @tc.desc Verify the two extreme alpha values map to the packed byte.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0093 begin');
      await runCase('testBrushApi0093', async () => {
        const zero: drawing.Brush = createFillBrush(rgba(255, 0xAA, 0xBB, 0xCC));
        zero.setAlpha(0);
        const full: drawing.Brush = createFillBrush(rgba(0, 0xAA, 0xBB, 0xCC));
        full.setAlpha(255);
        expect(zero.getHexColor()).assertEqual(0x00AABBCC);
        expect(full.getHexColor()).assertEqual(0xFFAABBCC);
        expect(zero.getHexColor() !== full.getHexColor()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0094
     * @tc.name testBrushApi0094
     * @tc.desc Verify four channel combinations round trip through the brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0094 begin');
      await runCase('testBrushApi0094', async () => {
        const cases: number[] = [0xFF000000, 0x00000000, 0xFFFFFFFF, 0x80FFFFFF];
        let matched: number = 0;
        for (let index: number = 0; index < cases.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(cases[index]);
          if (colorAgrees(brush, cases[index])) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(cases.length).assertEqual(4);
        expect(byteOf(cases[3], 24)).assertEqual(0x80);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0095
     * @tc.name testBrushApi0095
     * @tc.desc Verify the lowest non zero packed color keeps one in each channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0095 begin');
      await runCase('testBrushApi0095', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0x01020304);
        expect(brush.getAlpha()).assertEqual(1);
        expect(brush.getColor().red).assertEqual(2);
        expect(brush.getColor().blue).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0096
     * @tc.name testBrushApi0096
     * @tc.desc Verify a near maximum packed color keeps every channel distinct.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0096 begin');
      await runCase('testBrushApi0096', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0xFEFDFCFB);
        expect(brush.getAlpha()).assertEqual(0xFE);
        expect(brush.getColor().green).assertEqual(0xFC);
        expect(brush.getColor().blue).assertEqual(0xFB);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0097
     * @tc.name testBrushApi0097
     * @tc.desc Verify the packed value with alpha 127 keeps saturated rgb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0097 begin');
      await runCase('testBrushApi0097', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0x7FFFFFFF);
        expect(brush.getAlpha()).assertEqual(127);
        expect(brush.getColor().red).assertEqual(255);
        expect(brush.getHexColor()).assertEqual(0x7FFFFFFF);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0098
     * @tc.name testBrushApi0098
     * @tc.desc Verify the packed value with alpha 128 keeps zero rgb.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0098 begin');
      await runCase('testBrushApi0098', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(0x80000000);
        expect(brush.getAlpha()).assertEqual(128);
        expect(brush.getColor().green).assertEqual(0);
        expect(brush.getHexColor()).assertEqual(0x80000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0099
     * @tc.name testBrushApi0099
     * @tc.desc Verify alpha values 127 and 128 differ by exactly one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0099 begin');
      await runCase('testBrushApi0099', async () => {
        const low: drawing.Brush = createFillBrush(rgba(255, 1, 2, 3));
        const high: drawing.Brush = createFillBrush(rgba(255, 1, 2, 3));
        low.setAlpha(127);
        high.setAlpha(128);
        expect(high.getAlpha() - low.getAlpha()).assertEqual(1);
        expect(low.getHexColor()).assertEqual(0x7F010203);
        expect(high.getHexColor()).assertEqual(0x80010203);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0100
     * @tc.name testBrushApi0100
     * @tc.desc Verify five grey levels keep the three channels in step.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0100 begin');
      await runCase('testBrushApi0100', async () => {
        const levels: number[] = [1, 63, 127, 191, 254];
        let matched: number = 0;
        for (let index: number = 0; index < levels.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(255, levels[index], levels[index], levels[index]);
          const color: common2D.Color = brush.getColor();
          if (color.red === levels[index] && color.green === levels[index] && color.blue === levels[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(levels.length).assertEqual(5);
        expect(levels[4]).assertEqual(254);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0101
     * @tc.name testBrushApi0101
     * @tc.desc Verify a repeating decimal Color4f keeps its precision.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0101 begin');
      await runCase('testBrushApi0101', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 1, red: 0.333, green: 0.667, blue: 0.999 }, null);
        const color4f: common2D.Color4f = brush.getColor4f();
        expect(close(color4f.red, 0.333, 0.002)).assertTrue();
        expect(close(color4f.green, 0.667, 0.002)).assertTrue();
        expect(close(color4f.blue, 0.999, 0.002)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0102
     * @tc.name testBrushApi0102
     * @tc.desc Verify a nearly saturated float channel maps to a near maximum byte.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0102 begin');
      await runCase('testBrushApi0102', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 1, red: 0.999, green: 0.999, blue: 0.999 }, null);
        expect(brush.getColor().red >= 254).assertTrue();
        expect(brush.getColor().blue >= 254).assertTrue();
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0103
     * @tc.name testBrushApi0103
     * @tc.desc Verify the float half alpha matches the integer 128 alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0103 begin');
      await runCase('testBrushApi0103', async () => {
        const float: drawing.Brush = new drawing.Brush();
        float.setColor4f({ alpha: 0.5, red: 1, green: 1, blue: 1 }, null);
        const integer: drawing.Brush = createFillBrush(rgba(255, 1, 1, 1));
        integer.setAlpha(128);
        expect(close(float.getAlpha(), integer.getAlpha(), 1)).assertTrue();
        expect(float.getColor().red).assertEqual(255);
        expect(integer.getColor().green).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0104
     * @tc.name testBrushApi0104
     * @tc.desc Verify a brush and a pen report the same packed color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0104 begin');
      await runCase('testBrushApi0104', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x6C, 0x2A, 0x4B, 0x6D));
        const pen: drawing.Pen = createStrokePen(rgba(0x6C, 0x2A, 0x4B, 0x6D), 2);
        expect(brush.getHexColor()).assertEqual(pen.getHexColor());
        expect(brush.getAlpha()).assertEqual(pen.getAlpha());
        expect(snapshotBrush(brush).blue).assertEqual(snapshotPen(pen).blue);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0105
     * @tc.name testBrushApi0105
     * @tc.desc Verify the brush snapshot equals every direct getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0105 begin');
      await runCase('testBrushApi0105', async () => {
        const cases: number[] = [0x20112233, 0xF0445566];
        let matched: number = 0;
        for (let index: number = 0; index < cases.length; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(cases[index]);
          brush.setAntiAlias(index === 1);
          const snapshot: BrushSnapshot = snapshotBrush(brush);
          if (snapshot.hex === brush.getHexColor() && snapshot.alpha === brush.getAlpha() &&
            snapshot.antiAlias === brush.isAntiAlias() && snapshot.green === brush.getColor().green) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(2);
        expect(cases.length).assertEqual(2);
        expect(byteOf(cases[1], 8)).assertEqual(0x55);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0106
     * @tc.name testBrushApi0106
     * @tc.desc Verify an old snapshot does not follow later brush changes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0106 begin');
      await runCase('testBrushApi0106', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        const before: BrushSnapshot = snapshotBrush(brush);
        brush.setAlpha(4);
        expect(before.alpha).assertEqual(255);
        expect(before.hex).assertEqual(0xFF112233);
        expect(brush.getAlpha()).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0107
     * @tc.name testBrushApi0107
     * @tc.desc Verify two snapshots taken from different brushes stay separate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0107 begin');
      await runCase('testBrushApi0107', async () => {
        const first: BrushSnapshot = snapshotBrush(createFillBrush(rgba(255, 1, 2, 3)));
        const second: BrushSnapshot = snapshotBrush(createFillBrush(rgba(255, 4, 5, 6)));
        expect(first.hex).assertEqual(0xFF010203);
        expect(second.hex).assertEqual(0xFF040506);
        expect(first.hex !== second.hex).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0108
     * @tc.name testBrushApi0108
     * @tc.desc Verify the float alpha follows the integer alpha ratio.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0108 begin');
      await runCase('testBrushApi0108', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(51, 1, 2, 3));
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(close(snapshot.floatAlpha, 0.2, 0.01)).assertTrue();
        expect(snapshot.alpha).assertEqual(51);
        expect(close(snapshot.floatAlpha * 255, snapshot.alpha, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0109
     * @tc.name testBrushApi0109
     * @tc.desc Verify three brushes hold three different configurations.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0109 begin');
      await runCase('testBrushApi0109', async () => {
        const red: drawing.Brush = createFillBrush(rgba(255, 255, 0, 0));
        const green: drawing.Brush = createFillBrush(rgba(255, 0, 255, 0));
        const blue: drawing.Brush = createFillBrush(rgba(255, 0, 0, 255));
        expect(snapshotBrush(red).red).assertEqual(255);
        expect(snapshotBrush(green).green).assertEqual(255);
        expect(snapshotBrush(blue).blue).assertEqual(255);
        expect(snapshotBrush(red).blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0110
     * @tc.name testBrushApi0110
     * @tc.desc Verify the factory equals a manually configured brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0110 begin');
      await runCase('testBrushApi0110', async () => {
        const manual: drawing.Brush = new drawing.Brush();
        manual.setColor(0xFF112233);
        manual.setAntiAlias(true);
        const built: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        expect(manual.getHexColor()).assertEqual(built.getHexColor());
        expect(manual.isAntiAlias()).assertEqual(built.isAntiAlias());
        expect(manual.getAlpha()).assertEqual(built.getAlpha());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0111
     * @tc.name testBrushApi0111
     * @tc.desc Verify the factory enables anti aliasing unlike a raw brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testBrushApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0111 begin');
      await runCase('testBrushApi0111', async () => {
        expect(createFillBrush(rgba(255, 1, 1, 1)).isAntiAlias()).assertTrue();
        expect(new drawing.Brush().isAntiAlias()).assertFalse();
        expect(snapshotBrush(createFillBrush(rgba(255, 1, 1, 1))).antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0112
     * @tc.name testBrushApi0112
     * @tc.desc Verify the snapshot agrees with the getters after the preset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0112 begin');
      await runCase('testBrushApi0112', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.alpha).assertEqual(brush.getAlpha());
        expect(snapshot.hex).assertEqual(brush.getHexColor());
        expect(snapshot.antiAlias).assertEqual(brush.isAntiAlias());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0113
     * @tc.name testBrushApi0113
     * @tc.desc Verify a copied brush reports the same snapshot values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0113 begin');
      await runCase('testBrushApi0113', async () => {
        const source: drawing.Brush = createFillBrush(rgba(0x3C, 0x4D, 0x5E, 0x6F));
        const original: BrushSnapshot = snapshotBrush(source);
        const copied: BrushSnapshot = snapshotBrush(copyBrush(source));
        expect(copied.hex).assertEqual(original.hex);
        expect(copied.alpha).assertEqual(original.alpha);
        expect(copied.antiAlias).assertEqual(original.antiAlias);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0114
     * @tc.name testBrushApi0114
     * @tc.desc Verify a reset brush matches a newly allocated brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0114 begin');
      await runCase('testBrushApi0114', async () => {
        const recycled: drawing.Brush = createFillBrush(rgba(1, 2, 3, 4));
        recycled.setAlpha(8);
        const reset: BrushSnapshot = resetBrush(recycled);
        const fresh: BrushSnapshot = snapshotBrush(new drawing.Brush());
        expect(reset.hex).assertEqual(fresh.hex);
        expect(reset.alpha).assertEqual(fresh.alpha);
        expect(reset.antiAlias).assertEqual(fresh.antiAlias);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0115
     * @tc.name testBrushApi0115
     * @tc.desc Verify alternating snapshots of two brushes do not cross over.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0115 begin');
      await runCase('testBrushApi0115', async () => {
        const left: drawing.Brush = createFillBrush(rgba(255, 0x10, 0x20, 0x30));
        const right: drawing.Brush = createFillBrush(rgba(255, 0x40, 0x50, 0x60));
        let matched: number = 0;
        for (let index: number = 0; index < 4; index++) {
          const picked: BrushSnapshot = index % 2 === 0 ? snapshotBrush(left) : snapshotBrush(right);
          const wanted: number = index % 2 === 0 ? 0xFF102030 : 0xFF405060;
          if (picked.hex === wanted) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(snapshotBrush(left).red).assertEqual(0x10);
        expect(snapshotBrush(right).green).assertEqual(0x50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0116
     * @tc.name testBrushApi0116
     * @tc.desc Verify brush and pen presets stay on their own instances.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0116 begin');
      await runCase('testBrushApi0116', async () => {
        const brush: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x11, 0x22, 0x33), 5);
        expect(brush.getAlpha()).assertEqual(160);
        expect(pen.getHexColor()).assertEqual(0xFF112233);
        expect(pen.getWidth()).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0117
     * @tc.name testBrushApi0117
     * @tc.desc Verify a mixed configuration chain ends on the float color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0117 begin');
      await runCase('testBrushApi0117', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        brush.setAlpha(90);
        brush.setColor4f({ alpha: 1, red: 1, green: 0, blue: 0 }, null);
        const snapshot: BrushSnapshot = snapshotBrush(brush);
        expect(snapshot.hex).assertEqual(0xFFFF0000);
        expect(snapshot.red).assertEqual(255);
        expect(snapshot.antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0118
     * @tc.name testBrushApi0118
     * @tc.desc Verify copy then reset leaves the effect source intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0118 begin');
      await runCase('testBrushApi0118', async () => {
        const source: drawing.Brush = applyBrushEffects(new drawing.Brush());
        const copied: drawing.Brush = copyBrush(source);
        resetBrush(copied);
        expect(copied.getHexColor()).assertEqual(0xFF000000);
        expect(source.getHexColor()).assertEqual(0xA0334D66);
        expect(source.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0119
     * @tc.name testBrushApi0119
     * @tc.desc Verify ten distinct colors each stay on their own brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0119 begin');
      await runCase('testBrushApi0119', async () => {
        let matched: number = 0;
        for (let index: number = 0; index < 10; index++) {
          const brush: drawing.Brush = new drawing.Brush();
          brush.setColor(255, index * 20, index * 10, index * 5);
          if (brush.getColor().red === index * 20 && brush.getColor().green === index * 10) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(10);
        expect(9 * 20).assertEqual(180);
        expect(9 * 5).assertEqual(45);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_BRUSH_0120
     * @tc.name testBrushApi0120
     * @tc.desc Verify five configured brushes all return to defaults on reset.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testBrushApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0120 begin');
      await runCase('testBrushApi0120', async () => {
        let matched: number = 0;
        for (let index: number = 0; index < 5; index++) {
          const brush: drawing.Brush = createFillBrush(rgba(10 + index, 20, 30, 40));
          brush.setAlpha(5);
          const snapshot: BrushSnapshot = resetBrush(brush);
          if (snapshot.hex === 0xFF000000 && snapshot.alpha === 255 && !snapshot.antiAlias) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(resetBrush(createFillBrush(rgba(1, 1, 1, 1))).floatAlpha).assertEqual(1);
        expect(snapshotBrush(new drawing.Brush()).red).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testBrushApi0120 end');
    });
  });
}
