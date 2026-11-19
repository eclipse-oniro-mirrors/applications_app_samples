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
  applyPenEffects,
  BrushSnapshot,
  copyBrush,
  copyPen,
  createFillBrush,
  createStrokePen,
  PenSnapshot,
  resetBrush,
  resetPen,
  snapshotBrush,
  snapshotPen,
  strokeOutline
} from '../../../main/ets/drawing/DrawingPenBrush';
import { ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
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
 * Build a fresh stroke pen with a fixed color.
 *
 * @param { number } width - Stroke width.
 * @returns { drawing.Pen } Fresh pen.
 */
function freshPen(width: number): drawing.Pen {
  return createStrokePen(rgba(255, 0x11, 0x22, 0x33), width);
}

/**
 * Build a pen whose color channels come from a floating point color.
 *
 * @param { number } alpha - Alpha in [0, 1].
 * @param { number } red - Red in [0, 1].
 * @param { number } green - Green in [0, 1].
 * @param { number } blue - Blue in [0, 1].
 * @returns { drawing.Pen } Pen with the floating point color applied.
 */
function color4fPen(alpha: number, red: number, green: number, blue: number): drawing.Pen {
  const pen: drawing.Pen = new drawing.Pen();
  const color4f: common2D.Color4f = { alpha: alpha, red: red, green: green, blue: blue };
  pen.setColor4f(color4f, null);
  return pen;
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

export default function paintApiExtendedTest() {
  describe('PaintApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_PEN_0051
     * @tc.name testPenApi0051
     * @tc.desc Verify a fractional Color4f keeps all four channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPenApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0051 begin');
      await runCase('testPenApi0051', async () => {
        const color4f: common2D.Color4f = color4fPen(0.5, 0.25, 0.5, 0.75).getColor4f();
        expect(close(color4f.alpha, 0.5, 0.001)).assertTrue();
        expect(close(color4f.red, 0.25, 0.001)).assertTrue();
        expect(close(color4f.green, 0.5, 0.001)).assertTrue();
        expect(close(color4f.blue, 0.75, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0052
     * @tc.name testPenApi0052
     * @tc.desc Verify an all zero Color4f maps to a fully transparent black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0052 begin');
      await runCase('testPenApi0052', async () => {
        const pen: drawing.Pen = color4fPen(0, 0, 0, 0);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.alphaChannel).assertEqual(0);
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.hex).assertEqual(0x00000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0053
     * @tc.name testPenApi0053
     * @tc.desc Verify an all one Color4f maps to opaque white.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0053 begin');
      await runCase('testPenApi0053', async () => {
        const pen: drawing.Pen = color4fPen(1, 1, 1, 1);
        const color4f: common2D.Color4f = pen.getColor4f();
        expect(close(color4f.red, 1, 0.001)).assertTrue();
        expect(pen.getHexColor()).assertEqual(0xFFFFFFFF);
        expect(pen.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0054
     * @tc.name testPenApi0054
     * @tc.desc Verify out of range Color4f channels are clamped to the unit range.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0054 begin');
      await runCase('testPenApi0054', async () => {
        const color4f: common2D.Color4f = color4fPen(1.5, -0.5, 2, -2).getColor4f();
        expect(close(color4f.alpha, 1, 0.001)).assertTrue();
        expect(close(color4f.red, 0, 0.001)).assertTrue();
        expect(close(color4f.green, 1, 0.001)).assertTrue();
        expect(close(color4f.blue, 0, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0055
     * @tc.name testPenApi0055
     * @tc.desc Verify the integer color reports the same color as the float color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0055 begin');
      await runCase('testPenApi0055', async () => {
        const pen: drawing.Pen = color4fPen(0.5, 0.25, 0.5, 0.75);
        const color: common2D.Color = pen.getColor();
        expect(close(color.alpha, 128, 1)).assertTrue();
        expect(close(color.red, 64, 1)).assertTrue();
        expect(close(color.blue, 191, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0056
     * @tc.name testPenApi0056
     * @tc.desc Verify the packed color keeps the same alpha as the float color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0056 begin');
      await runCase('testPenApi0056', async () => {
        const pen: drawing.Pen = color4fPen(0.6, 0.2, 0.4, 0.8);
        const hex: number = pen.getHexColor();
        expect(close(byteOf(hex, 24), 153, 1)).assertTrue();
        expect(close(byteOf(hex, 16), 51, 1)).assertTrue();
        expect(close(byteOf(hex, 8), 102, 1)).assertTrue();
        expect(close(byteOf(hex, 0), 204, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0057
     * @tc.name testPenApi0057
     * @tc.desc Verify the float color overload replaces an integer color set earlier.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0057 begin');
      await runCase('testPenApi0057', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF445566);
        pen.setColor4f({ alpha: 1, red: 0, green: 0, blue: 1 }, null);
        const color: common2D.Color = pen.getColor();
        expect(color.red).assertEqual(0);
        expect(color.green).assertEqual(0);
        expect(color.blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0058
     * @tc.name testPenApi0058
     * @tc.desc Verify an integer color is exposed as a normalized float color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0058 begin');
      await runCase('testPenApi0058', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0x66AABBCC);
        const color4f: common2D.Color4f = pen.getColor4f();
        expect(close(color4f.alpha, 0.4, 0.01)).assertTrue();
        expect(close(color4f.red, 0.6667, 0.01)).assertTrue();
        expect(close(color4f.blue, 0.8, 0.01)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0059
     * @tc.name testPenApi0059
     * @tc.desc Verify the last float color call wins over the earlier ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0059 begin');
      await runCase('testPenApi0059', async () => {
        const pen: drawing.Pen = color4fPen(0.1, 0.2, 0.3, 0.4);
        pen.setColor4f({ alpha: 0.9, red: 0.8, green: 0.7, blue: 0.6 }, null);
        const color4f: common2D.Color4f = pen.getColor4f();
        expect(close(color4f.red, 0.8, 0.001)).assertTrue();
        expect(close(color4f.green, 0.7, 0.001)).assertTrue();
        expect(close(color4f.blue, 0.6, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0060
     * @tc.name testPenApi0060
     * @tc.desc Verify setting a float color keeps width and line styles untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0060 begin');
      await runCase('testPenApi0060', async () => {
        const pen: drawing.Pen = freshPen(7);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        pen.setColor4f({ alpha: 1, red: 1, green: 0, blue: 0 }, null);
        expect(pen.getWidth()).assertEqual(7);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0061
     * @tc.name testPenApi0061
     * @tc.desc Verify two pens keep independent float colors.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0061 begin');
      await runCase('testPenApi0061', async () => {
        const first: drawing.Pen = color4fPen(1, 1, 0, 0);
        const second: drawing.Pen = color4fPen(1, 0, 0, 1);
        expect(first.getColor().red).assertEqual(255);
        expect(first.getColor().blue).assertEqual(0);
        expect(second.getColor().red).assertEqual(0);
        expect(second.getColor().blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0062
     * @tc.name testPenApi0062
     * @tc.desc Verify the copy constructor keeps the float color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0062 begin');
      await runCase('testPenApi0062', async () => {
        const source: drawing.Pen = color4fPen(0.4, 0.2, 0.6, 0.8);
        const copied: common2D.Color4f = new drawing.Pen(source).getColor4f();
        expect(close(copied.alpha, 0.4, 0.001)).assertTrue();
        expect(close(copied.green, 0.6, 0.001)).assertTrue();
        expect(close(copied.blue, 0.8, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0063
     * @tc.name testPenApi0063
     * @tc.desc Verify setAlpha replaces only the alpha of a float color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0063 begin');
      await runCase('testPenApi0063', async () => {
        const pen: drawing.Pen = color4fPen(1, 0.2, 0.4, 0.6);
        pen.setAlpha(90);
        const color: common2D.Color = pen.getColor();
        expect(color.alpha).assertEqual(90);
        expect(close(color.red, 51, 1)).assertTrue();
        expect(close(color.blue, 153, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0064
     * @tc.name testPenApi0064
     * @tc.desc Verify a tiny float alpha is kept with its precision.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testPenApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0064 begin');
      await runCase('testPenApi0064', async () => {
        const color4f: common2D.Color4f = color4fPen(0.001, 1, 1, 1).getColor4f();
        expect(close(color4f.alpha, 0.001, 0.001)).assertTrue();
        expect(close(color4f.red, 1, 0.001)).assertTrue();
        expect(close(color4f.blue, 1, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0065
     * @tc.name testPenApi0065
     * @tc.desc Verify changing the blue channel leaves the other channels intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0065 begin');
      await runCase('testPenApi0065', async () => {
        const pen: drawing.Pen = color4fPen(1, 0.5, 0.5, 0.5);
        pen.setColor4f({ alpha: 1, red: 0.5, green: 0.5, blue: 0.1 }, null);
        const color4f: common2D.Color4f = pen.getColor4f();
        expect(close(color4f.blue, 0.1, 0.001)).assertTrue();
        expect(close(color4f.red, 0.5, 0.001)).assertTrue();
        expect(pen.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0066
     * @tc.name testPenApi0066
     * @tc.desc Verify changing the alpha channel leaves the color channels intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0066 begin');
      await runCase('testPenApi0066', async () => {
        const pen: drawing.Pen = color4fPen(1, 0.25, 0.5, 0.75);
        pen.setColor4f({ alpha: 0.2, red: 0.25, green: 0.5, blue: 0.75 }, null);
        const color4f: common2D.Color4f = pen.getColor4f();
        expect(close(color4f.alpha, 0.2, 0.001)).assertTrue();
        expect(close(color4f.red, 0.25, 0.001)).assertTrue();
        expect(close(color4f.green, 0.5, 0.001)).assertTrue();
        expect(close(color4f.blue, 0.75, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0067
     * @tc.name testPenApi0067
     * @tc.desc Verify the packed color and the integer color agree on every channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0067 begin');
      await runCase('testPenApi0067', async () => {
        const pen: drawing.Pen = color4fPen(0.3, 0.35, 0.45, 0.55);
        const color: common2D.Color = pen.getColor();
        const hex: number = pen.getHexColor();
        expect(byteOf(hex, 16)).assertEqual(color.red);
        expect(byteOf(hex, 8)).assertEqual(color.green);
        expect(byteOf(hex, 0)).assertEqual(color.blue);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0068
     * @tc.name testPenApi0068
     * @tc.desc Verify five float colors each map back to their own value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0068 begin');
      await runCase('testPenApi0068', async () => {
        const wanted: number[] = [0.1, 0.3, 0.5, 0.7, 0.9];
        let matched: number = 0;
        for (let index: number = 0; index < wanted.length; index++) {
          const value: number = wanted[index];
          if (close(color4fPen(1, value, value, value).getColor4f().red, value, 0.001)) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(wanted.length).assertEqual(5);
        expect(close(color4fPen(1, 0.9, 0.9, 0.9).getColor4f().blue, 0.9, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0069
     * @tc.name testPenApi0069
     * @tc.desc Verify the packed color overload and a float color agree.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0069 begin');
      await runCase('testPenApi0069', async () => {
        const packed: drawing.Pen = new drawing.Pen();
        packed.setColor(0x66AABBCC);
        const float: drawing.Pen = color4fPen(0x66 / 255, 0xAA / 255, 0xBB / 255, 0xCC / 255);
        expect(close(packed.getColor4f().green, float.getColor4f().green, 0.01)).assertTrue();
        expect(close(packed.getColor4f().blue, float.getColor4f().blue, 0.01)).assertTrue();
        expect(packed.getHexColor()).assertEqual(0x66AABBCC);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0070
     * @tc.name testPenApi0070
     * @tc.desc Verify reset clears a float color back to opaque black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0070 begin');
      await runCase('testPenApi0070', async () => {
        const pen: drawing.Pen = color4fPen(0.2, 1, 0.5, 0.5);
        const snapshot: PenSnapshot = resetPen(pen);
        expect(snapshot.hex).assertEqual(0xFF000000);
        expect(snapshot.alphaChannel).assertEqual(255);
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0071
     * @tc.name testPenApi0071
     * @tc.desc Verify the pen effect preset applies the miter limit of six.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0071 begin');
      await runCase('testPenApi0071', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(5));
        expect(pen.getMiterLimit()).assertEqual(6);
        expect(snapshotPen(pen).miterLimit).assertEqual(6);
        expect(pen.getWidth()).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0072
     * @tc.name testPenApi0072
     * @tc.desc Verify the pen effect preset applies round joins and round caps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0072 begin');
      await runCase('testPenApi0072', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(5));
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(pen.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0073
     * @tc.name testPenApi0073
     * @tc.desc Verify the pen effect preset ends on alpha 180.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0073 begin');
      await runCase('testPenApi0073', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(3));
        expect(pen.getAlpha()).assertEqual(180);
        expect(pen.getColor().alpha).assertEqual(180);
        expect(byteOf(pen.getHexColor(), 24)).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0074
     * @tc.name testPenApi0074
     * @tc.desc Verify the pen effect preset keeps the configured width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0074 begin');
      await runCase('testPenApi0074', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(12));
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.width).assertEqual(12);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.floatAlpha > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0075
     * @tc.name testPenApi0075
     * @tc.desc Verify the pen effect preset ends on the fractional rgb color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0075 begin');
      await runCase('testPenApi0075', async () => {
        const color4f: common2D.Color4f = applyPenEffects(freshPen(4)).getColor4f();
        expect(close(color4f.red, 0.4, 0.01)).assertTrue();
        expect(close(color4f.green, 0.6, 0.01)).assertTrue();
        expect(close(color4f.blue, 0.9, 0.02)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0075 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0076
     * @tc.name testPenApi0076
     * @tc.desc Verify the effect preset returns the very same pen instance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0076 begin');
      await runCase('testPenApi0076', async () => {
        const source: drawing.Pen = freshPen(6);
        const applied: drawing.Pen = applyPenEffects(source);
        expect(applied === source).assertTrue();
        expect(applied.getWidth()).assertEqual(6);
        expect(applied.getMiterLimit()).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0077
     * @tc.name testPenApi0077
     * @tc.desc Verify applying the pen effects twice is idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0077 begin');
      await runCase('testPenApi0077', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(5));
        const once: PenSnapshot = snapshotPen(pen);
        const twice: PenSnapshot = snapshotPen(applyPenEffects(pen));
        expect(twice.alpha).assertEqual(once.alpha);
        expect(twice.miterLimit).assertEqual(once.miterLimit);
        expect(twice.hex).assertEqual(once.hex);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0078
     * @tc.name testPenApi0078
     * @tc.desc Verify two pens with effects applied stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0078 begin');
      await runCase('testPenApi0078', async () => {
        const first: drawing.Pen = applyPenEffects(freshPen(2));
        const second: drawing.Pen = applyPenEffects(freshPen(9));
        expect(first.getWidth()).assertEqual(2);
        expect(second.getWidth()).assertEqual(9);
        expect(second.getAlpha()).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0079
     * @tc.name testPenApi0079
     * @tc.desc Verify widening a pen after the effects keeps the effect color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0079 begin');
      await runCase('testPenApi0079', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(4));
        pen.setStrokeWidth(18);
        expect(pen.getWidth()).assertEqual(18);
        expect(pen.getAlpha()).assertEqual(180);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0080
     * @tc.name testPenApi0080
     * @tc.desc Verify a later alpha call overrides the effect alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0080 begin');
      await runCase('testPenApi0080', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(4));
        pen.setAlpha(60);
        expect(pen.getAlpha()).assertEqual(60);
        expect(pen.getColor().alpha).assertEqual(60);
        expect(pen.getWidth()).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0081
     * @tc.name testPenApi0081
     * @tc.desc Verify reset restores every default after the effects.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0081 begin');
      await runCase('testPenApi0081', async () => {
        const snapshot: PenSnapshot = resetPen(applyPenEffects(freshPen(9)));
        expect(snapshot.width).assertEqual(0);
        expect(snapshot.join).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(snapshot.alpha).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0082
     * @tc.name testPenApi0082
     * @tc.desc Verify recoloring after the effects keeps join and cap styles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0082 begin');
      await runCase('testPenApi0082', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(5));
        pen.setColor(0xFF010203);
        expect(pen.getHexColor()).assertEqual(0xFF010203);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0083
     * @tc.name testPenApi0083
     * @tc.desc Verify a copy keeps every effect attribute.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0083 begin');
      await runCase('testPenApi0083', async () => {
        const copied: PenSnapshot = snapshotPen(copyPen(applyPenEffects(freshPen(7))));
        expect(copied.join).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(copied.cap).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(copied.alpha).assertEqual(180);
        expect(copied.miterLimit).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0084
     * @tc.name testPenApi0084
     * @tc.desc Verify the effect color leans to blue over red.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0084 begin');
      await runCase('testPenApi0084', async () => {
        const color: common2D.Color = applyPenEffects(freshPen(5)).getColor();
        expect(color.blue > color.red).assertTrue();
        expect(color.green > color.red).assertTrue();
        expect(color.blue > color.green).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0085
     * @tc.name testPenApi0085
     * @tc.desc Verify a later join style call overrides the effect join style.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0085 begin');
      await runCase('testPenApi0085', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(5));
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(pen.getAlpha()).assertEqual(180);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0086
     * @tc.name testPenApi0086
     * @tc.desc Verify the float and integer colors of the effect agree.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0086 begin');
      await runCase('testPenApi0086', async () => {
        const pen: drawing.Pen = applyPenEffects(freshPen(5));
        expect(close(pen.getColor4f().red * 255, pen.getColor().red, 1)).assertTrue();
        expect(close(pen.getColor4f().blue * 255, pen.getColor().blue, 1)).assertTrue();
        expect(pen.getMiterLimit()).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0087
     * @tc.name testPenApi0087
     * @tc.desc Verify reset sets the stroke width back to zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0087 begin');
      await runCase('testPenApi0087', async () => {
        const pen: drawing.Pen = freshPen(15);
        expect(pen.getWidth()).assertEqual(15);
        expect(resetPen(pen).width).assertEqual(0);
        expect(pen.getWidth()).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0088
     * @tc.name testPenApi0088
     * @tc.desc Verify reset restores the opaque black default color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0088 begin');
      await runCase('testPenApi0088', async () => {
        const snapshot: PenSnapshot = resetPen(freshPen(5));
        expect(snapshot.alpha).assertEqual(255);
        expect(snapshot.hex).assertEqual(0xFF000000);
        expect(snapshot.green).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0089
     * @tc.name testPenApi0089
     * @tc.desc Verify reset disables anti aliasing on the pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0089 begin');
      await runCase('testPenApi0089', async () => {
        const pen: drawing.Pen = freshPen(5);
        expect(pen.isAntiAlias()).assertTrue();
        expect(resetPen(pen).antiAlias).assertFalse();
        expect(pen.isAntiAlias()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0090
     * @tc.name testPenApi0090
     * @tc.desc Verify reset restores the default join and cap styles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0090 begin');
      await runCase('testPenApi0090', async () => {
        const pen: drawing.Pen = freshPen(5);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        const snapshot: PenSnapshot = resetPen(pen);
        expect(snapshot.join).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(snapshot.cap).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0091
     * @tc.name testPenApi0091
     * @tc.desc Verify resetting twice keeps the same defaults.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0091 begin');
      await runCase('testPenApi0091', async () => {
        const pen: drawing.Pen = freshPen(8);
        const once: PenSnapshot = resetPen(pen);
        const twice: PenSnapshot = resetPen(pen);
        expect(twice.width).assertEqual(once.width);
        expect(twice.hex).assertEqual(once.hex);
        expect(twice.join).assertEqual(once.join);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0092
     * @tc.name testPenApi0092
     * @tc.desc Verify a reset pen accepts a new configuration.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0092 begin');
      await runCase('testPenApi0092', async () => {
        const pen: drawing.Pen = freshPen(8);
        resetPen(pen);
        pen.setStrokeWidth(3);
        pen.setColor(0xFF204060);
        expect(pen.getWidth()).assertEqual(3);
        expect(pen.getHexColor()).assertEqual(0xFF204060);
        expect(pen.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0093
     * @tc.name testPenApi0093
     * @tc.desc Verify resetting one pen leaves the other pen untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0093 begin');
      await runCase('testPenApi0093', async () => {
        const victim: drawing.Pen = freshPen(6);
        const keeper: drawing.Pen = freshPen(6);
        resetPen(victim);
        expect(keeper.getWidth()).assertEqual(6);
        expect(keeper.isAntiAlias()).assertTrue();
        expect(keeper.getHexColor()).assertEqual(0xFF112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0094
     * @tc.name testPenApi0094
     * @tc.desc Verify resetting a brush restores alpha and anti aliasing defaults.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0094 begin');
      await runCase('testPenApi0094', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x80, 1, 2, 3));
        const snapshot: BrushSnapshot = resetBrush(brush);
        expect(snapshot.alpha).assertEqual(255);
        expect(snapshot.antiAlias).assertFalse();
        expect(brush.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0095
     * @tc.name testPenApi0095
     * @tc.desc Verify resetting a brush clears its color to opaque black.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0095 begin');
      await runCase('testPenApi0095', async () => {
        const snapshot: BrushSnapshot = resetBrush(createFillBrush(rgba(1, 2, 3, 4)));
        expect(snapshot.hex).assertEqual(0xFF000000);
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.blue).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0096
     * @tc.name testPenApi0096
     * @tc.desc Verify resetting a brush twice keeps the same defaults.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0096 begin');
      await runCase('testPenApi0096', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(9, 9, 9, 9));
        const once: BrushSnapshot = resetBrush(brush);
        const twice: BrushSnapshot = resetBrush(brush);
        expect(twice.hex).assertEqual(once.hex);
        expect(twice.alpha).assertEqual(once.alpha);
        expect(twice.antiAlias).assertEqual(once.antiAlias);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0097
     * @tc.name testPenApi0097
     * @tc.desc Verify a reset brush accepts a new color and alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0097 begin');
      await runCase('testPenApi0097', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(9, 9, 9, 9));
        resetBrush(brush);
        brush.setColor(0xFF00FF00);
        brush.setAlpha(128);
        expect(brush.getHexColor()).assertEqual(0x8000FF00);
        expect(brush.getAlpha()).assertEqual(128);
        expect(brush.getColor().green).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0098
     * @tc.name testPenApi0098
     * @tc.desc Verify resetting one brush leaves the other brush untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0098 begin');
      await runCase('testPenApi0098', async () => {
        const victim: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        const keeper: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        resetBrush(victim);
        expect(keeper.getHexColor()).assertEqual(0xFF112233);
        expect(keeper.isAntiAlias()).assertTrue();
        expect(victim.getHexColor()).assertEqual(0xFF000000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0099
     * @tc.name testPenApi0099
     * @tc.desc Verify the copy constructor keeps width and miter limit.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0099 begin');
      await runCase('testPenApi0099', async () => {
        const source: drawing.Pen = freshPen(13);
        source.setMiterLimit(9);
        const copied: drawing.Pen = copyPen(source);
        expect(copied.getWidth()).assertEqual(13);
        expect(copied.getMiterLimit()).assertEqual(9);
        expect(copied === source).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0100
     * @tc.name testPenApi0100
     * @tc.desc Verify a copy keeps color and alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0100 begin');
      await runCase('testPenApi0100', async () => {
        const source: drawing.Pen = createStrokePen(rgba(0x55, 0x11, 0x22, 0x33), 4);
        const snapshot: PenSnapshot = snapshotPen(copyPen(source));
        expect(snapshot.hex).assertEqual(0x55112233);
        expect(snapshot.alpha).assertEqual(0x55);
        expect(snapshot.width).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0101
     * @tc.name testPenApi0101
     * @tc.desc Verify a copy keeps the join and cap styles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0101 begin');
      await runCase('testPenApi0101', async () => {
        const source: drawing.Pen = freshPen(5);
        source.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        source.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        const snapshot: PenSnapshot = snapshotPen(copyPen(source));
        expect(snapshot.join).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(snapshot.cap).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(snapshot.antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0102
     * @tc.name testPenApi0102
     * @tc.desc Verify changing the copy does not change the source pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0102 begin');
      await runCase('testPenApi0102', async () => {
        const source: drawing.Pen = freshPen(6);
        const copied: drawing.Pen = copyPen(source);
        copied.setStrokeWidth(20);
        copied.setColor(0xFF00FFFF);
        expect(source.getWidth()).assertEqual(6);
        expect(source.getHexColor()).assertEqual(0xFF112233);
        expect(copied.getWidth()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0103
     * @tc.name testPenApi0103
     * @tc.desc Verify changing the source does not change the copied pen.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0103 begin');
      await runCase('testPenApi0103', async () => {
        const source: drawing.Pen = freshPen(6);
        const copied: drawing.Pen = copyPen(source);
        source.setAlpha(10);
        source.setCapStyle(drawing.CapStyle.ROUND_CAP);
        expect(copied.getAlpha()).assertEqual(255);
        expect(copied.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(copied.getWidth()).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0104
     * @tc.name testPenApi0104
     * @tc.desc Verify copying a copy keeps every readable attribute.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0104 begin');
      await runCase('testPenApi0104', async () => {
        const source: drawing.Pen = applyPenEffects(freshPen(11));
        const twice: PenSnapshot = snapshotPen(copyPen(copyPen(source)));
        expect(twice.width).assertEqual(11);
        expect(twice.alpha).assertEqual(180);
        expect(twice.join).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(twice.miterLimit).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0105
     * @tc.name testPenApi0105
     * @tc.desc Verify resetting a copy leaves the source pen configured.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0105 begin');
      await runCase('testPenApi0105', async () => {
        const source: drawing.Pen = freshPen(8);
        const copied: drawing.Pen = copyPen(source);
        resetPen(copied);
        expect(copied.getWidth()).assertEqual(0);
        expect(source.getWidth()).assertEqual(8);
        expect(source.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0106
     * @tc.name testPenApi0106
     * @tc.desc Verify copying a default pen keeps the default state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0106 begin');
      await runCase('testPenApi0106', async () => {
        const snapshot: PenSnapshot = snapshotPen(copyPen(new drawing.Pen()));
        expect(snapshot.width).assertEqual(0);
        expect(snapshot.alpha).assertEqual(255);
        expect(snapshot.antiAlias).assertFalse();
        expect(snapshot.cap).assertEqual(drawing.CapStyle.FLAT_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0107
     * @tc.name testPenApi0107
     * @tc.desc Verify a brush copy keeps color, alpha and anti aliasing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0107 begin');
      await runCase('testPenApi0107', async () => {
        const source: drawing.Brush = createFillBrush(rgba(0x70, 0x11, 0x22, 0x33));
        const snapshot: BrushSnapshot = snapshotBrush(copyBrush(source));
        expect(snapshot.hex).assertEqual(0x70112233);
        expect(snapshot.alpha).assertEqual(0x70);
        expect(snapshot.antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0108
     * @tc.name testPenApi0108
     * @tc.desc Verify changing the brush copy does not change the source brush.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0108 begin');
      await runCase('testPenApi0108', async () => {
        const source: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        const copied: drawing.Brush = copyBrush(source);
        copied.setColor(0xFF0000FF);
        copied.setAlpha(12);
        expect(source.getHexColor()).assertEqual(0xFF112233);
        expect(source.getAlpha()).assertEqual(255);
        expect(copied.getAlpha()).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0109
     * @tc.name testPenApi0109
     * @tc.desc Verify changing the source brush does not change the copy.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0109 begin');
      await runCase('testPenApi0109', async () => {
        const source: drawing.Brush = createFillBrush(rgba(255, 0x11, 0x22, 0x33));
        const copied: drawing.Brush = copyBrush(source);
        source.setColor(0xFF00FF00);
        source.setAntiAlias(false);
        expect(copied.getHexColor()).assertEqual(0xFF112233);
        expect(copied.isAntiAlias()).assertTrue();
        expect(source.isAntiAlias()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0110
     * @tc.name testPenApi0110
     * @tc.desc Verify a brush copy of a copy stays equal and reset isolated.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0110 begin');
      await runCase('testPenApi0110', async () => {
        const source: drawing.Brush = createFillBrush(rgba(0x33, 0x44, 0x55, 0x66));
        const copied: drawing.Brush = copyBrush(copyBrush(source));
        resetBrush(copied);
        expect(copied.getHexColor()).assertEqual(0xFF000000);
        expect(source.getHexColor()).assertEqual(0x33445566);
        expect(source.isAntiAlias()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0111
     * @tc.name testPenApi0111
     * @tc.desc Verify the stroke outline of a rectangle grows around every edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0111 begin');
      await runCase('testPenApi0111', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 120, 80));
        const outline: drawing.Path = strokeOutline(freshPen(6), source);
        expect(outline.isEmpty()).assertFalse();
        expect(close(outline.getBounds().left, 17, 1)).assertTrue();
        expect(close(outline.getBounds().right, 123, 1)).assertTrue();
        expect(outline.getLength(true) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0112
     * @tc.name testPenApi0112
     * @tc.desc Verify the outline bounds on both vertical sides of a rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0112 begin');
      await runCase('testPenApi0112', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 120, 80));
        const bounds: common2D.Rect = strokeOutline(freshPen(6), source).getBounds();
        expect(close(bounds.top, 17, 1)).assertTrue();
        expect(close(bounds.bottom, 83, 1)).assertTrue();
        expect(bounds.left < 20).assertTrue();
        expect(bounds.bottom > 80).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0113
     * @tc.name testPenApi0113
     * @tc.desc Verify a wider pen produces a wider outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0113 begin');
      await runCase('testPenApi0113', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 120, 80));
        const thin: common2D.Rect = strokeOutline(freshPen(6), source).getBounds();
        const thick: common2D.Rect = strokeOutline(freshPen(20), source).getBounds();
        expect(thick.left < thin.left).assertTrue();
        expect(close(thick.left, 10, 1)).assertTrue();
        expect(close(thin.left, 17, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0114
     * @tc.name testPenApi0114
     * @tc.desc Verify a hairline wide pen still produces a usable outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0114 begin');
      await runCase('testPenApi0114', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 120, 80));
        const outline: drawing.Path = strokeOutline(freshPen(1), source);
        expect(outline.isEmpty()).assertFalse();
        expect(outline.getBounds().right > 120).assertTrue();
        expect(outline.getLength(true) > 300).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0115
     * @tc.name testPenApi0115
     * @tc.desc Verify the stroke outline of a circle surrounds the source circle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0115 begin');
      await runCase('testPenApi0115', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addCircle(100, 100, 40);
        const bounds: common2D.Rect = strokeOutline(freshPen(8), source).getBounds();
        expect(bounds.left < 60).assertTrue();
        expect(bounds.right > 140).assertTrue();
        expect(bounds.top < 60).assertTrue();
        expect(bounds.bottom > 140).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0116
     * @tc.name testPenApi0116
     * @tc.desc Verify a flat cap line outline only grows across the line.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0116 begin');
      await runCase('testPenApi0116', async () => {
        const source: drawing.Path = new drawing.Path();
        source.moveTo(50, 50);
        source.lineTo(150, 50);
        const bounds: common2D.Rect = strokeOutline(freshPen(10), source).getBounds();
        expect(close(bounds.left, 50, 1)).assertTrue();
        expect(close(bounds.top, 45, 1)).assertTrue();
        expect(close(bounds.bottom, 55, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0117
     * @tc.name testPenApi0117
     * @tc.desc Verify a round cap extends the line outline on both ends.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0117 begin');
      await runCase('testPenApi0117', async () => {
        const pen: drawing.Pen = freshPen(10);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        const source: drawing.Path = new drawing.Path();
        source.moveTo(50, 50);
        source.lineTo(150, 50);
        const bounds: common2D.Rect = strokeOutline(pen, source).getBounds();
        expect(bounds.left < 50).assertTrue();
        expect(bounds.right > 150).assertTrue();
        expect(close(bounds.top, 45, 1)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0118
     * @tc.name testPenApi0118
     * @tc.desc Verify building an outline leaves the source path unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0118 begin');
      await runCase('testPenApi0118', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 120, 80));
        const before: number = source.getLength(true);
        strokeOutline(freshPen(12), source);
        expect(source.getLength(true)).assertEqual(before);
        expect(source.getBounds().left).assertEqual(20);
        expect(source.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0119
     * @tc.name testPenApi0119
     * @tc.desc Verify getFillPath reports success and fills the destination.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0119 begin');
      await runCase('testPenApi0119', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(30, 30, 130, 90));
        const destination: drawing.Path = new drawing.Path();
        expect(freshPen(6).getFillPath(source, destination)).assertTrue();
        expect(destination.isEmpty()).assertFalse();
        expect(destination.getLength(true) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0120
     * @tc.name testPenApi0120
     * @tc.desc Verify filling the same destination twice keeps the same bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0120 begin');
      await runCase('testPenApi0120', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(30, 30, 130, 90));
        const destination: drawing.Path = new drawing.Path();
        const pen: drawing.Pen = freshPen(6);
        pen.getFillPath(source, destination);
        const first: common2D.Rect = destination.getBounds();
        pen.getFillPath(source, destination);
        const second: common2D.Rect = destination.getBounds();
        expect(second.left).assertEqual(first.left);
        expect(second.right).assertEqual(first.right);
        expect(second.bottom).assertEqual(first.bottom);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0121
     * @tc.name testPenApi0121
     * @tc.desc Verify the outline length grows with the stroke width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0121 begin');
      await runCase('testPenApi0121', async () => {
        const widths: number[] = [2, 6, 12, 24];
        const lengths: number[] = [];
        for (let index: number = 0; index < widths.length; index++) {
          const source: drawing.Path = new drawing.Path();
          source.addRect(ltrb(20, 20, 120, 80));
          lengths.push(strokeOutline(freshPen(widths[index]), source).getLength(true));
        }
        expect(lengths[0] < lengths[1]).assertTrue();
        expect(lengths[1] < lengths[2]).assertTrue();
        expect(lengths[2] < lengths[3]).assertTrue();
        expect(lengths.length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0122
     * @tc.name testPenApi0122
     * @tc.desc Verify an empty source path yields an empty outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0122 begin');
      await runCase('testPenApi0122', async () => {
        const outline: drawing.Path = strokeOutline(freshPen(6), new drawing.Path());
        expect(outline.isEmpty()).assertTrue();
        expect(outline.getLength(true)).assertEqual(0);
        expect(outline.getBounds().right).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0123
     * @tc.name testPenApi0123
     * @tc.desc Verify the circle outline keeps the circle center.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0123 begin');
      await runCase('testPenApi0123', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addCircle(120, 90, 30);
        const bounds: common2D.Rect = strokeOutline(freshPen(6), source).getBounds();
        expect(close((bounds.left + bounds.right) / 2, 120, 1)).assertTrue();
        expect(close((bounds.top + bounds.bottom) / 2, 90, 1)).assertTrue();
        expect(bounds.right > 150).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0124
     * @tc.name testPenApi0124
     * @tc.desc Verify the outline is a normal path that accepts more geometry.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0124 begin');
      await runCase('testPenApi0124', async () => {
        const source: drawing.Path = new drawing.Path();
        source.addRect(ltrb(20, 20, 120, 80));
        const outline: drawing.Path = strokeOutline(freshPen(4), source);
        const before: number = outline.getLength(true);
        outline.addRect(ltrb(200, 200, 260, 240));
        expect(outline.getLength(true)).assertEqual(336);
        expect(outline.getBounds().right > 200).assertTrue();
        expect(outline.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0125
     * @tc.name testPenApi0125
     * @tc.desc Verify the fill brush factory keeps color and anti aliasing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPenApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0125 begin');
      await runCase('testPenApi0125', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(255, 0x0A, 0x0B, 0x0C)));
        expect(snapshot.hex).assertEqual(0xFF0A0B0C);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.alpha).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0126
     * @tc.name testPenApi0126
     * @tc.desc Verify a translucent fill brush reports its alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0126 begin');
      await runCase('testPenApi0126', async () => {
        const snapshot: BrushSnapshot = snapshotBrush(createFillBrush(rgba(0x40, 0x11, 0x22, 0x33)));
        expect(snapshot.alpha).assertEqual(0x40);
        expect(snapshot.alphaChannel).assertEqual(0x40);
        expect(snapshot.hex).assertEqual(0x40112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0127
     * @tc.name testPenApi0127
     * @tc.desc Verify two fill brushes stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0127 begin');
      await runCase('testPenApi0127', async () => {
        const first: drawing.Brush = createFillBrush(rgba(255, 0x11, 0, 0));
        const second: drawing.Brush = createFillBrush(rgba(255, 0, 0, 0x22));
        first.setAlpha(30);
        expect(second.getAlpha()).assertEqual(255);
        expect(second.getHexColor()).assertEqual(0xFF000022);
        expect(first.getHexColor()).assertEqual(0x1E110000);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0128
     * @tc.name testPenApi0128
     * @tc.desc Verify setting the brush alpha only changes the packed alpha byte.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0128 begin');
      await runCase('testPenApi0128', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(255, 0x12, 0x34, 0x56));
        brush.setAlpha(200);
        expect(brush.getHexColor()).assertEqual(0xC8123456);
        expect(brush.getAlpha()).assertEqual(200);
        expect(brush.getColor().red).assertEqual(0x12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0129
     * @tc.name testPenApi0129
     * @tc.desc Verify the brush keeps a fractional Color4f.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0129 begin');
      await runCase('testPenApi0129', async () => {
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor4f({ alpha: 0.6, red: 0.2, green: 0.4, blue: 0.8 }, null);
        const color4f: common2D.Color4f = brush.getColor4f();
        expect(close(color4f.alpha, 0.6, 0.001)).assertTrue();
        expect(close(color4f.green, 0.4, 0.001)).assertTrue();
        expect(close(color4f.blue, 0.8, 0.001)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0130
     * @tc.name testPenApi0130
     * @tc.desc Verify the brush float and integer colors agree on the channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0130 begin');
      await runCase('testPenApi0130', async () => {
        const brush: drawing.Brush = createFillBrush(rgba(0x66, 0x11, 0x22, 0x33));
        const color4f: common2D.Color4f = brush.getColor4f();
        const color: common2D.Color = brush.getColor();
        expect(close(color4f.red * 255, color.red, 1)).assertTrue();
        expect(close(color4f.blue * 255, color.blue, 1)).assertTrue();
        expect(brush.getAlpha()).assertEqual(0x66);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0130 end');
    });
  });
}
