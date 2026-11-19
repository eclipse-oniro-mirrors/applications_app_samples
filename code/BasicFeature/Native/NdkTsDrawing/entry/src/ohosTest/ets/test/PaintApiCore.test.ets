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
import { createStrokePen, snapshotPen, PenSnapshot } from '../../../main/ets/drawing/DrawingPenBrush';
import { rgba } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Build a fresh pen with the given width and a fixed color.
 *
 * @param { number } width - Stroke width.
 * @returns { drawing.Pen } Fresh pen.
 */
function freshPen(width: number): drawing.Pen {
  return createStrokePen(rgba(255, 0x11, 0x22, 0x33), width);
}

export default function paintApiCoreTest() {
  describe('PaintApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_PEN_0001
     * @tc.name testPenApi0001
     * @tc.desc Verify the stroke pen keeps the color, width and anti alias flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPenApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0001 begin');
      await runCase('testPenApi0001', async () => {
        const snapshot: PenSnapshot = snapshotPen(createStrokePen(rgba(255, 0x11, 0x44, 0x88), 5));
        expect(snapshot.width).assertEqual(5);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.red).assertEqual(0x11);
        expect(snapshot.hex).assertEqual(0xFF114488);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0002
     * @tc.name testPenApi0002
     * @tc.desc Verify a translucent stroke pen reports its alpha channel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0002 begin');
      await runCase('testPenApi0002', async () => {
        const snapshot: PenSnapshot = snapshotPen(createStrokePen(rgba(128, 0x20, 0x40, 0x60), 0));
        expect(snapshot.alpha).assertEqual(128);
        expect(snapshot.alphaChannel).assertEqual(128);
        expect(snapshot.width).assertEqual(0);
        expect(snapshot.hex).assertEqual(0x80204060);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0003
     * @tc.name testPenApi0003
     * @tc.desc Verify a black stroke pen keeps zero color channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0003 begin');
      await runCase('testPenApi0003', async () => {
        const snapshot: PenSnapshot = snapshotPen(createStrokePen(rgba(255, 0, 0, 0), 12));
        expect(snapshot.red).assertEqual(0);
        expect(snapshot.green).assertEqual(0);
        expect(snapshot.blue).assertEqual(0);
        expect(snapshot.width).assertEqual(12);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0004
     * @tc.name testPenApi0004
     * @tc.desc Verify two stroke pens built by the factory stay independent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0004 begin');
      await runCase('testPenApi0004', async () => {
        const first: drawing.Pen = freshPen(3);
        const second: drawing.Pen = freshPen(3);
        first.setStrokeWidth(11);
        expect(second.getWidth()).assertEqual(3);
        expect(first.getWidth()).assertEqual(11);
        expect(snapshotPen(second).antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0005
     * @tc.name testPenApi0005
     * @tc.desc Verify a fractional stroke width is kept without rounding.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0005 begin');
      await runCase('testPenApi0005', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0, 0, 0), 0.5);
        expect(pen.getWidth()).assertEqual(0.5);
        expect(snapshotPen(pen).width).assertEqual(0.5);
        expect(snapshotPen(pen).alphaChannel).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0006
     * @tc.name testPenApi0006
     * @tc.desc Verify the factory keeps the default join and cap styles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0006 begin');
      await runCase('testPenApi0006', async () => {
        const snapshot: PenSnapshot = snapshotPen(freshPen(4));
        expect(snapshot.join).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(snapshot.cap).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.width).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0007
     * @tc.name testPenApi0007
     * @tc.desc Verify the color object overload writes all four channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPenApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0007 begin');
      await runCase('testPenApi0007', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0x11, 0x22, 0x33));
        const color: common2D.Color = pen.getColor();
        expect(color.alpha).assertEqual(255);
        expect(color.red).assertEqual(0x11);
        expect(color.green).assertEqual(0x22);
        expect(color.blue).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0008
     * @tc.name testPenApi0008
     * @tc.desc Verify the four number overload sets a partial alpha color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0008 begin');
      await runCase('testPenApi0008', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(200, 0x11, 0x22, 0x33);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.alphaChannel).assertEqual(200);
        expect(snapshot.red).assertEqual(0x11);
        expect(snapshot.hex).assertEqual(0xC8112233);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0009
     * @tc.name testPenApi0009
     * @tc.desc Verify the packed number overload sets an opaque color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPenApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0009 begin');
      await runCase('testPenApi0009', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0xFF445566);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.hex).assertEqual(0xFF445566);
        expect(snapshot.alphaChannel).assertEqual(255);
        expect(snapshot.red).assertEqual(0x44);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0010
     * @tc.name testPenApi0010
     * @tc.desc Verify the last color overload call wins over the earlier ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0010 begin');
      await runCase('testPenApi0010', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0x11, 0x22, 0x33));
        pen.setColor(9, 9, 9, 9);
        pen.setColor(0xFF445566);
        expect(pen.getHexColor()).assertEqual(0xFF445566);
        expect(pen.getColor().blue).assertEqual(0x66);
        expect(pen.getColor().alpha).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0011
     * @tc.name testPenApi0011
     * @tc.desc Verify a fully transparent packed color keeps the rgb bytes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0011 begin');
      await runCase('testPenApi0011', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(0x00112233);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.alphaChannel).assertEqual(0);
        expect(snapshot.hex).assertEqual(0x00112233);
        expect(snapshot.blue).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0012
     * @tc.name testPenApi0012
     * @tc.desc Verify the extreme white color keeps every channel at the maximum.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0012 begin');
      await runCase('testPenApi0012', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 255, 255, 255));
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.hex).assertEqual(0xFFFFFFFF);
        expect(snapshot.red).assertEqual(255);
        expect(snapshot.green).assertEqual(255);
        expect(snapshot.blue).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0013
     * @tc.name testPenApi0013
     * @tc.desc Verify the hex color and the color object report the same alpha.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0013 begin');
      await runCase('testPenApi0013', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(170, 0x12, 0x34, 0x56));
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.hex).assertEqual(0xAA123456);
        expect((snapshot.hex >>> 24) & 0xFF).assertEqual(snapshot.alphaChannel);
        expect(snapshot.alpha).assertEqual(170);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0014
     * @tc.name testPenApi0014
     * @tc.desc Verify setting a color does not disturb width or anti alias.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0014 begin');
      await runCase('testPenApi0014', async () => {
        const pen: drawing.Pen = freshPen(3);
        pen.setColor(rgba(90, 0xAA, 0xBB, 0xCC));
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.width).assertEqual(3);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.alphaChannel).assertEqual(90);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0015
     * @tc.name testPenApi0015
     * @tc.desc Verify three packed colors each land in the hex getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0015 begin');
      await runCase('testPenApi0015', async () => {
        const packed: number[] = [0xFF000000, 0x80123456, 0x00FFFFFF];
        const pen: drawing.Pen = new drawing.Pen();
        let matched: number = 0;
        for (let index: number = 0; index < packed.length; index++) {
          pen.setColor(packed[index]);
          if (pen.getHexColor() === packed[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(packed.length).assertEqual(3);
        expect(pen.getHexColor()).assertEqual(0x00FFFFFF);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0016
     * @tc.name testPenApi0016
     * @tc.desc Verify high bit channels survive the color object round trip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0016 begin');
      await runCase('testPenApi0016', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(0xAA, 0xBB, 0xCC, 0xDD));
        const color: common2D.Color = pen.getColor();
        expect(color.alpha).assertEqual(0xAA);
        expect(color.red).assertEqual(0xBB);
        expect(color.green).assertEqual(0xCC);
        expect(color.blue).assertEqual(0xDD);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0017
     * @tc.name testPenApi0017
     * @tc.desc Verify both alpha aware overloads build the same packed color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0017 begin');
      await runCase('testPenApi0017', async () => {
        const first: drawing.Pen = new drawing.Pen();
        first.setColor(rgba(128, 0x11, 0x22, 0x33));
        const second: drawing.Pen = new drawing.Pen();
        second.setColor(128, 0x11, 0x22, 0x33);
        expect(first.getHexColor()).assertEqual(second.getHexColor());
        expect(first.getHexColor()).assertEqual(0x80112233);
        expect(first.getColor().blue).assertEqual(second.getColor().blue);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0018
     * @tc.name testPenApi0018
     * @tc.desc Verify repeated reads of the pen color return stable values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0018 begin');
      await runCase('testPenApi0018', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0x0A, 0x0B, 0x0C));
        const first: common2D.Color = pen.getColor();
        const second: common2D.Color = pen.getColor();
        expect(first.red).assertEqual(second.red);
        expect(first.green).assertEqual(second.green);
        expect(first.blue).assertEqual(second.blue);
        expect(first.red).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0019
     * @tc.name testPenApi0019
     * @tc.desc Verify the alpha setter drives both alpha getters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPenApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0019 begin');
      await runCase('testPenApi0019', async () => {
        const pen: drawing.Pen = freshPen(2);
        pen.setAlpha(128);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(pen.getAlpha()).assertEqual(128);
        expect(snapshot.alphaChannel).assertEqual(128);
        expect(snapshot.red).assertEqual(0x11);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0020
     * @tc.name testPenApi0020
     * @tc.desc Verify a zero alpha leaves the rgb channels untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0020 begin');
      await runCase('testPenApi0020', async () => {
        const pen: drawing.Pen = freshPen(2);
        pen.setAlpha(0);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.alpha).assertEqual(0);
        expect(snapshot.alphaChannel).assertEqual(0);
        expect(snapshot.green).assertEqual(0x22);
        expect(snapshot.blue).assertEqual(0x33);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0021
     * @tc.name testPenApi0021
     * @tc.desc Verify the maximum alpha restores full opacity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0021 begin');
      await runCase('testPenApi0021', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(10, 0x11, 0x22, 0x33), 1);
        pen.setAlpha(255);
        expect(pen.getAlpha()).assertEqual(255);
        expect(pen.getColor().alpha).assertEqual(255);
        expect(snapshotPen(pen).antiAlias).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0022
     * @tc.name testPenApi0022
     * @tc.desc Verify a later opaque color overrides an earlier alpha value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0022 begin');
      await runCase('testPenApi0022', async () => {
        const pen: drawing.Pen = freshPen(6);
        pen.setAlpha(20);
        pen.setColor(0xFF445566);
        expect(pen.getAlpha()).assertEqual(255);
        expect(pen.getColor().red).assertEqual(0x44);
        expect(pen.getWidth()).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0023
     * @tc.name testPenApi0023
     * @tc.desc Verify the alpha setter preserves the color channels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0023 begin');
      await runCase('testPenApi0023', async () => {
        const pen: drawing.Pen = freshPen(6);
        pen.setAlpha(100);
        const color: common2D.Color = pen.getColor();
        expect(color.red).assertEqual(0x11);
        expect(color.green).assertEqual(0x22);
        expect(color.alpha).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0024
     * @tc.name testPenApi0024
     * @tc.desc Verify three alpha values each land in the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0024 begin');
      await runCase('testPenApi0024', async () => {
        const levels: number[] = [0, 100, 255];
        const pen: drawing.Pen = freshPen(1);
        let matched: number = 0;
        for (let index: number = 0; index < levels.length; index++) {
          pen.setAlpha(levels[index]);
          if (pen.getAlpha() === levels[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(levels.length).assertEqual(3);
        expect(pen.getAlpha()).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0025
     * @tc.name testPenApi0025
     * @tc.desc Verify a fractional stroke width is readable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0025 begin');
      await runCase('testPenApi0025', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(7.5);
        expect(pen.getWidth()).assertEqual(7.5);
        expect(snapshotPen(pen).width).assertEqual(7.5);
        expect(pen.getWidth() > 7 && pen.getWidth() < 8).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0026
     * @tc.name testPenApi0026
     * @tc.desc Verify a hairline width of zero is accepted.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0026 begin');
      await runCase('testPenApi0026', async () => {
        const pen: drawing.Pen = freshPen(9);
        pen.setStrokeWidth(0);
        expect(pen.getWidth()).assertEqual(0);
        expect(snapshotPen(pen).width).assertEqual(0);
        expect(snapshotPen(pen).alphaChannel).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0027
     * @tc.name testPenApi0027
     * @tc.desc Verify a very large stroke width is stored verbatim.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0027 begin');
      await runCase('testPenApi0027', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setStrokeWidth(1000);
        expect(pen.getWidth()).assertEqual(1000);
        expect(snapshotPen(pen).width).assertEqual(1000);
        expect(pen.getWidth() / 1000).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0028
     * @tc.name testPenApi0028
     * @tc.desc Verify the last width setter call is the one that is read back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0028 begin');
      await runCase('testPenApi0028', async () => {
        const pen: drawing.Pen = freshPen(3);
        pen.setStrokeWidth(4);
        pen.setStrokeWidth(9);
        expect(pen.getWidth()).assertEqual(9);
        expect(snapshotPen(pen).width).assertEqual(9);
        expect(pen.getWidth() !== 4).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0029
     * @tc.name testPenApi0029
     * @tc.desc Verify the width setter leaves miter limit and alpha alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0029 begin');
      await runCase('testPenApi0029', async () => {
        const pen: drawing.Pen = freshPen(2);
        pen.setMiterLimit(8);
        pen.setAlpha(77);
        pen.setStrokeWidth(15);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.miterLimit).assertEqual(8);
        expect(snapshot.alpha).assertEqual(77);
        expect(snapshot.width).assertEqual(15);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0030
     * @tc.name testPenApi0030
     * @tc.desc Verify three stroke widths each land in the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0030 begin');
      await runCase('testPenApi0030', async () => {
        const widths: number[] = [0.5, 6, 400];
        const pen: drawing.Pen = new drawing.Pen();
        let matched: number = 0;
        for (let index: number = 0; index < widths.length; index++) {
          pen.setStrokeWidth(widths[index]);
          if (pen.getWidth() === widths[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(widths.length).assertEqual(3);
        expect(pen.getWidth()).assertEqual(400);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0031
     * @tc.name testPenApi0031
     * @tc.desc Verify the miter limit setter is readable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0031 begin');
      await runCase('testPenApi0031', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setMiterLimit(9);
        expect(pen.getMiterLimit()).assertEqual(9);
        expect(snapshotPen(pen).miterLimit).assertEqual(9);
        expect(pen.getMiterLimit() > 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0032
     * @tc.name testPenApi0032
     * @tc.desc Verify a zero miter limit is accepted as a lower bound.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0032 begin');
      await runCase('testPenApi0032', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setMiterLimit(0);
        expect(pen.getMiterLimit()).assertEqual(0);
        expect(snapshotPen(pen).miterLimit).assertEqual(0);
        expect(snapshotPen(pen).alpha).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0033
     * @tc.name testPenApi0033
     * @tc.desc Verify a fractional miter limit keeps its precision.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0033 begin');
      await runCase('testPenApi0033', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setMiterLimit(2.5);
        expect(pen.getMiterLimit()).assertEqual(2.5);
        expect(snapshotPen(pen).miterLimit).assertEqual(2.5);
        expect(pen.getMiterLimit() !== 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0034
     * @tc.name testPenApi0034
     * @tc.desc Verify the miter limit is stored beside a round join style.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0034 begin');
      await runCase('testPenApi0034', async () => {
        const pen: drawing.Pen = freshPen(5);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        pen.setMiterLimit(12);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.join).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(snapshot.miterLimit).assertEqual(12);
        expect(snapshot.width).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0035
     * @tc.name testPenApi0035
     * @tc.desc Verify the miter limit setter leaves the width untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0035 begin');
      await runCase('testPenApi0035', async () => {
        const pen: drawing.Pen = freshPen(7);
        pen.setMiterLimit(20);
        expect(pen.getWidth()).assertEqual(7);
        expect(pen.getMiterLimit()).assertEqual(20);
        expect(snapshotPen(pen).cap).assertEqual(drawing.CapStyle.FLAT_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0036
     * @tc.name testPenApi0036
     * @tc.desc Verify a fresh pen starts with anti alias disabled.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0036 begin');
      await runCase('testPenApi0036', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        expect(pen.isAntiAlias()).assertFalse();
        expect(snapshotPen(pen).antiAlias).assertFalse();
        expect(pen.getWidth()).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0037
     * @tc.name testPenApi0037
     * @tc.desc Verify the anti alias flag can be toggled both ways.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0037 begin');
      await runCase('testPenApi0037', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setAntiAlias(true);
        expect(pen.isAntiAlias()).assertTrue();
        pen.setAntiAlias(false);
        expect(pen.isAntiAlias()).assertFalse();
        expect(snapshotPen(pen).antiAlias).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0038
     * @tc.name testPenApi0038
     * @tc.desc Verify the anti alias setter keeps width and color.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0038 begin');
      await runCase('testPenApi0038', async () => {
        const pen: drawing.Pen = freshPen(8);
        pen.setAntiAlias(false);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.width).assertEqual(8);
        expect(snapshot.red).assertEqual(0x11);
        expect(snapshot.antiAlias).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0039
     * @tc.name testPenApi0039
     * @tc.desc Verify the factory pen anti alias flag can be cleared.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0039 begin');
      await runCase('testPenApi0039', async () => {
        const pen: drawing.Pen = createStrokePen(rgba(255, 0x01, 0x02, 0x03), 2);
        expect(pen.isAntiAlias()).assertTrue();
        pen.setAntiAlias(false);
        expect(snapshotPen(pen).antiAlias).assertFalse();
        expect(pen.getHexColor()).assertEqual(0xFF010203);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0040
     * @tc.name testPenApi0040
     * @tc.desc Verify the dither setter keeps the readable attributes stable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0040 begin');
      await runCase('testPenApi0040', async () => {
        const pen: drawing.Pen = freshPen(4);
        pen.setDither(true);
        const enabled: PenSnapshot = snapshotPen(pen);
        pen.setDither(false);
        const disabled: PenSnapshot = snapshotPen(pen);
        expect(enabled.alpha).assertEqual(disabled.alpha);
        expect(enabled.width).assertEqual(disabled.width);
        expect(disabled.width).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0041
     * @tc.name testPenApi0041
     * @tc.desc Verify dither and anti alias can be enabled at the same time.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0041 begin');
      await runCase('testPenApi0041', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        pen.setDither(true);
        pen.setAntiAlias(true);
        pen.setStrokeWidth(3);
        const snapshot: PenSnapshot = snapshotPen(pen);
        expect(snapshot.antiAlias).assertTrue();
        expect(snapshot.width).assertEqual(3);
        expect(snapshot.alpha).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0042
     * @tc.name testPenApi0042
     * @tc.desc Verify a fresh pen joins with a miter corner by default.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0042 begin');
      await runCase('testPenApi0042', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(snapshotPen(pen).join).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getJoinStyle() !== drawing.JoinStyle.ROUND_JOIN).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0043
     * @tc.name testPenApi0043
     * @tc.desc Verify the round join style is stored and read back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0043 begin');
      await runCase('testPenApi0043', async () => {
        const pen: drawing.Pen = freshPen(5);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(snapshotPen(pen).join).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(snapshotPen(pen).width).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0044
     * @tc.name testPenApi0044
     * @tc.desc Verify the bevel join style is stored and read back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0044 begin');
      await runCase('testPenApi0044', async () => {
        const pen: drawing.Pen = freshPen(1);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(snapshotPen(pen).join).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getJoinStyle() !== drawing.JoinStyle.MITER_JOIN).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0045
     * @tc.name testPenApi0045
     * @tc.desc Verify all three join styles survive a set then read cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0045 begin');
      await runCase('testPenApi0045', async () => {
        const styles: drawing.JoinStyle[] = [drawing.JoinStyle.MITER_JOIN, drawing.JoinStyle.ROUND_JOIN,
          drawing.JoinStyle.BEVEL_JOIN];
        const pen: drawing.Pen = new drawing.Pen();
        let matched: number = 0;
        for (let index: number = 0; index < styles.length; index++) {
          pen.setJoinStyle(styles[index]);
          if (pen.getJoinStyle() === styles[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(styles.length).assertEqual(3);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0046
     * @tc.name testPenApi0046
     * @tc.desc Verify the join style coexists with a custom miter limit.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0046 begin');
      await runCase('testPenApi0046', async () => {
        const pen: drawing.Pen = freshPen(2);
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        pen.setMiterLimit(9);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getMiterLimit()).assertEqual(9);
        expect(pen.getWidth()).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0047
     * @tc.name testPenApi0047
     * @tc.desc Verify a fresh pen uses the flat cap by default.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0047 begin');
      await runCase('testPenApi0047', async () => {
        const pen: drawing.Pen = new drawing.Pen();
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(snapshotPen(pen).cap).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(pen.getCapStyle() !== drawing.CapStyle.ROUND_CAP).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0048
     * @tc.name testPenApi0048
     * @tc.desc Verify the round cap style is stored and read back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0048 begin');
      await runCase('testPenApi0048', async () => {
        const pen: drawing.Pen = freshPen(3);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(snapshotPen(pen).cap).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(pen.getWidth()).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0049
     * @tc.name testPenApi0049
     * @tc.desc Verify the square cap style is stored and read back.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPenApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0049 begin');
      await runCase('testPenApi0049', async () => {
        const pen: drawing.Pen = freshPen(3);
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(snapshotPen(pen).cap).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(pen.getCapStyle() !== drawing.CapStyle.FLAT_CAP).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_PEN_0050
     * @tc.name testPenApi0050
     * @tc.desc Verify three cap styles cycle without touching the join style.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testPenApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0050 begin');
      await runCase('testPenApi0050', async () => {
        const caps: drawing.CapStyle[] = [drawing.CapStyle.FLAT_CAP, drawing.CapStyle.SQUARE_CAP,
          drawing.CapStyle.ROUND_CAP];
        const pen: drawing.Pen = new drawing.Pen();
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        let matched: number = 0;
        for (let index: number = 0; index < caps.length; index++) {
          pen.setCapStyle(caps[index]);
          if (pen.getCapStyle() === caps[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        expect(caps.length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testPenApi0050 end');
    });
  });
}
