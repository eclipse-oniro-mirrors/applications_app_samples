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
  countGlyphs, createFont, measureString, snapshotMetrics, FontMetricsSnapshot
} from '../../../main/ets/drawing/DrawingFontText';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

/**
 * Build a font with the requested text size.
 *
 * @param { number } size - Text size in px.
 * @returns { drawing.Font } Font object.
 */
function newFont(size: number): drawing.Font {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  return font;
}

/**
 * Measure the UTF8 width of a string with a font of the given size.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { number } Width in px.
 */
function widthOf(text: string, size: number): number {
  const font: drawing.Font = newFont(size);
  return font.measureText(text, drawing.TextEncoding.TEXT_ENCODING_UTF8);
}

export default function fontApiCoreTest() {
  describe('FontApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_FONT_0001
     * @tc.name testFontApi0001
     * @tc.desc Verify the size setter round trips for a common body size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0001 begin');
      await runCase('testFontApi0001', async () => {
        const font: drawing.Font = newFont(12);
        expect(font.getSize()).assertEqual(12);
        expect(font.getSize() > 0).assertTrue();
        expect(font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0002
     * @tc.name testFontApi0002
     * @tc.desc Verify the smallest positive size still produces a positive advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0002 begin');
      await runCase('testFontApi0002', async () => {
        const font: drawing.Font = newFont(1);
        expect(font.getSize()).assertEqual(1);
        expect(font.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
        expect(font.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8) < 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0003
     * @tc.name testFontApi0003
     * @tc.desc Verify a zero size keeps an empty advance while metrics fall back to a default.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0003 begin');
      await runCase('testFontApi0003', async () => {
        const font: drawing.Font = newFont(0);
        expect(font.getSize()).assertEqual(0);
        expect(font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(font.getMetrics().bottom - font.getMetrics().top < 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0004
     * @tc.name testFontApi0004
     * @tc.desc Verify a large display size keeps a proportionally wide advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0004 begin');
      await runCase('testFontApi0004', async () => {
        const font: drawing.Font = newFont(1000);
        expect(font.getSize()).assertEqual(1000);
        expect(font.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 500).assertTrue();
        expect(font.getMetrics().bottom - font.getMetrics().top > 900).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0005
     * @tc.name testFontApi0005
     * @tc.desc Verify the main helper produces the requested size on a fresh object.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0005 begin');
      await runCase('testFontApi0005', async () => {
        const font: drawing.Font = createFont(24);
        expect(font.getSize()).assertEqual(24);
        expect(font.isSubpixel()).assertFalse();
        expect(font.getScaleX()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0006
     * @tc.name testFontApi0006
     * @tc.desc Verify two font objects keep independent sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0006 begin');
      await runCase('testFontApi0006', async () => {
        const small: drawing.Font = newFont(10);
        const large: drawing.Font = newFont(40);
        expect(small.getSize()).assertEqual(10);
        expect(large.getSize()).assertEqual(40);
        expect(small.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8) <
          large.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0007
     * @tc.name testFontApi0007
     * @tc.desc Verify the last size setter call wins on the same object.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0007 begin');
      await runCase('testFontApi0007', async () => {
        const font: drawing.Font = newFont(8);
        font.setSize(56);
        expect(font.getSize()).assertEqual(56);
        expect(font.getSize() > 8).assertTrue();
        expect(font.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0008
     * @tc.name testFontApi0008
     * @tc.desc Verify the advance scales with a four times size step.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0008 begin');
      await runCase('testFontApi0008', async () => {
        const small: number = widthOf('M', 8);
        const large: number = widthOf('M', 32);
        expect(small > 0).assertTrue();
        expect(large > small).assertTrue();
        expect(Math.abs(large / small - 4) < 0.6).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0009
     * @tc.name testFontApi0009
     * @tc.desc Verify measured width grows monotonically across four sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0009 begin');
      await runCase('testFontApi0009', async () => {
        const sizes: number[] = [10, 20, 30, 40];
        const widths: number[] = [widthOf('text', sizes[0]), widthOf('text', sizes[1]),
          widthOf('text', sizes[2]), widthOf('text', sizes[3])];
        expect(widths[0] < widths[1]).assertTrue();
        expect(widths[1] < widths[2]).assertTrue();
        expect(widths[2] < widths[3]).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0010
     * @tc.name testFontApi0010
     * @tc.desc Verify the style bundle leaves the text size untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0010 begin');
      await runCase('testFontApi0010', async () => {
        const font: drawing.Font = newFont(36);
        font.enableEmbolden(true);
        font.enableSubpixel(true);
        font.enableLinearMetrics(true);
        expect(font.getSize()).assertEqual(36);
        expect(font.isEmbolden()).assertTrue();
        expect(font.isSubpixel()).assertTrue();
        expect(font.isLinearMetrics()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0011
     * @tc.name testFontApi0011
     * @tc.desc Verify subpixel rendering can be switched on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0011 begin');
      await runCase('testFontApi0011', async () => {
        const font: drawing.Font = newFont(20);
        font.enableSubpixel(true);
        expect(font.isSubpixel()).assertTrue();
        expect(font.isEmbolden()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0012
     * @tc.name testFontApi0012
     * @tc.desc Verify subpixel rendering can be switched back off.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0012 begin');
      await runCase('testFontApi0012', async () => {
        const font: drawing.Font = newFont(20);
        font.enableSubpixel(true);
        font.enableSubpixel(false);
        expect(font.isSubpixel()).assertFalse();
        expect(font.isLinearMetrics()).assertFalse();
        expect(newFont(20).isSubpixel()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0013
     * @tc.name testFontApi0013
     * @tc.desc Verify embolden can be switched on without touching subpixel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0013 begin');
      await runCase('testFontApi0013', async () => {
        const font: drawing.Font = newFont(20);
        font.enableEmbolden(true);
        expect(font.isEmbolden()).assertTrue();
        expect(font.isSubpixel()).assertFalse();
        expect(font.getScaleX()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0014
     * @tc.name testFontApi0014
     * @tc.desc Verify embolden can be switched back off.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0014 begin');
      await runCase('testFontApi0014', async () => {
        const font: drawing.Font = newFont(20);
        font.enableEmbolden(true);
        font.enableEmbolden(false);
        expect(font.isEmbolden()).assertFalse();
        expect(font.isSubpixel()).assertFalse();
        expect(font.measureText('B', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0015
     * @tc.name testFontApi0015
     * @tc.desc Verify linear metrics can be switched on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0015 begin');
      await runCase('testFontApi0015', async () => {
        const font: drawing.Font = newFont(20);
        font.enableLinearMetrics(true);
        expect(font.isLinearMetrics()).assertTrue();
        expect(font.isEmbolden()).assertFalse();
        expect(font.getSkewX()).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0016
     * @tc.name testFontApi0016
     * @tc.desc Verify linear metrics can be switched back off.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0016 begin');
      await runCase('testFontApi0016', async () => {
        const font: drawing.Font = newFont(20);
        font.enableLinearMetrics(true);
        font.enableLinearMetrics(false);
        expect(font.isLinearMetrics()).assertFalse();
        expect(font.isSubpixel()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0017
     * @tc.name testFontApi0017
     * @tc.desc Verify baseline snapping can be switched on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0017 begin');
      await runCase('testFontApi0017', async () => {
        const font: drawing.Font = newFont(20);
        font.setBaselineSnap(true);
        expect(font.isBaselineSnap()).assertTrue();
        expect(font.isEmbeddedBitmaps()).assertFalse();
        expect(font.isForceAutoHinting()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0018
     * @tc.name testFontApi0018
     * @tc.desc Verify baseline snapping can be switched back off.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0018 begin');
      await runCase('testFontApi0018', async () => {
        const font: drawing.Font = newFont(20);
        font.setBaselineSnap(true);
        expect(font.isBaselineSnap()).assertTrue();
        font.setBaselineSnap(false);
        expect(font.isBaselineSnap()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0019
     * @tc.name testFontApi0019
     * @tc.desc Verify embedded bitmap usage round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0019 begin');
      await runCase('testFontApi0019', async () => {
        const font: drawing.Font = newFont(20);
        font.setEmbeddedBitmaps(true);
        expect(font.isEmbeddedBitmaps()).assertTrue();
        font.setEmbeddedBitmaps(false);
        expect(font.isEmbeddedBitmaps()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0020
     * @tc.name testFontApi0020
     * @tc.desc Verify embedded bitmap usage can be switched back off.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0020 begin');
      await runCase('testFontApi0020', async () => {
        const font: drawing.Font = newFont(20);
        font.setEmbeddedBitmaps(true);
        font.setEmbeddedBitmaps(false);
        expect(font.isEmbeddedBitmaps()).assertFalse();
        font.setEmbeddedBitmaps(true);
        expect(font.isEmbeddedBitmaps()).assertTrue();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0021
     * @tc.name testFontApi0021
     * @tc.desc Verify forced auto hinting can be switched on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0021 begin');
      await runCase('testFontApi0021', async () => {
        const font: drawing.Font = newFont(20);
        font.setForceAutoHinting(true);
        expect(font.isForceAutoHinting()).assertTrue();
        font.setForceAutoHinting(false);
        expect(font.isForceAutoHinting()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0022
     * @tc.name testFontApi0022
     * @tc.desc Verify forced auto hinting can be switched back off.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0022 begin');
      await runCase('testFontApi0022', async () => {
        const font: drawing.Font = newFont(20);
        font.setForceAutoHinting(true);
        font.setForceAutoHinting(false);
        expect(font.isForceAutoHinting()).assertFalse();
        expect(font.isEmbeddedBitmaps()).assertFalse();
        expect(font.measureText('C', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0023
     * @tc.name testFontApi0023
     * @tc.desc Verify theme font following round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0023 begin');
      await runCase('testFontApi0023', async () => {
        const font: drawing.Font = newFont(20);
        font.setThemeFontFollowed(true);
        expect(font.isThemeFontFollowed()).assertTrue();
        font.setThemeFontFollowed(false);
        expect(font.isThemeFontFollowed()).assertFalse();
        expect(font.isEmbolden()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0024
     * @tc.name testFontApi0024
     * @tc.desc Verify theme font following can be turned back on.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0024 begin');
      await runCase('testFontApi0024', async () => {
        const font: drawing.Font = newFont(20);
        font.setThemeFontFollowed(false);
        font.setThemeFontFollowed(true);
        expect(font.isThemeFontFollowed()).assertTrue();
        expect(font.isSubpixel()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0025
     * @tc.name testFontApi0025
     * @tc.desc Verify three boolean switches keep independent states.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0025 begin');
      await runCase('testFontApi0025', async () => {
        const font: drawing.Font = newFont(20);
        font.enableSubpixel(true);
        font.enableEmbolden(false);
        font.enableLinearMetrics(false);
        expect(font.isSubpixel()).assertTrue();
        expect(font.isEmbolden()).assertFalse();
        expect(font.isLinearMetrics()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0026
     * @tc.name testFontApi0026
     * @tc.desc Verify all boolean switches on then all off leaves a clean font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0026 begin');
      await runCase('testFontApi0026', async () => {
        const font: drawing.Font = newFont(20);
        font.enableSubpixel(true);
        font.enableEmbolden(true);
        font.enableLinearMetrics(true);
        font.setBaselineSnap(true);
        font.setEmbeddedBitmaps(true);
        font.setForceAutoHinting(true);
        expect(font.isSubpixel() && font.isEmbolden() && font.isLinearMetrics()).assertTrue();
        font.enableSubpixel(false);
        font.enableEmbolden(false);
        font.enableLinearMetrics(false);
        font.setBaselineSnap(false);
        font.setEmbeddedBitmaps(false);
        font.setForceAutoHinting(false);
        expect(font.isSubpixel() || font.isEmbolden() || font.isLinearMetrics()).assertFalse();
        expect(font.isBaselineSnap() || font.isEmbeddedBitmaps() || font.isForceAutoHinting()).assertFalse();
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0027
     * @tc.name testFontApi0027
     * @tc.desc Verify the render toggles end up enabled after the style bundle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0027 begin');
      await runCase('testFontApi0027', async () => {
        const font: drawing.Font = newFont(28);
        font.enableSubpixel(true);
        font.enableEmbolden(true);
        font.enableLinearMetrics(true);
        expect(font.isSubpixel()).assertTrue();
        expect(font.isEmbolden()).assertTrue();
        expect(font.isLinearMetrics()).assertTrue();
        expect(font.getSize()).assertEqual(28);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0028
     * @tc.name testFontApi0028
     * @tc.desc Verify the horizontal scale survives a style bundle round trip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0028 begin');
      await runCase('testFontApi0028', async () => {
        const font: drawing.Font = newFont(28);
        font.setScaleX(1.1);
        expect(font.getScaleX() > 1.05).assertTrue();
        expect(font.getScaleX() < 1.15).assertTrue();
        expect(font.getSize()).assertEqual(28);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0029
     * @tc.name testFontApi0029
     * @tc.desc Verify the skew survives a style bundle round trip.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0029 begin');
      await runCase('testFontApi0029', async () => {
        const font: drawing.Font = newFont(28);
        font.setSkewX(0.1);
        expect(font.getSkewX() > 0.05).assertTrue();
        expect(font.getSkewX() < 0.15).assertTrue();
        expect(font.getScaleX()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0030
     * @tc.name testFontApi0030
     * @tc.desc Verify the bundle applies subpixel edging together with full hinting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0030 begin');
      await runCase('testFontApi0030', async () => {
        const font: drawing.Font = newFont(28);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        font.setHinting(drawing.FontHinting.FULL);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
        expect(font.getSize()).assertEqual(28);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0031
     * @tc.name testFontApi0031
     * @tc.desc Verify the bundle enables baseline snap, bitmaps and auto hinting.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0031 begin');
      await runCase('testFontApi0031', async () => {
        const font: drawing.Font = newFont(28);
        font.setBaselineSnap(true);
        font.setEmbeddedBitmaps(true);
        font.setForceAutoHinting(true);
        expect(font.isBaselineSnap()).assertTrue();
        expect(font.isEmbeddedBitmaps()).assertTrue();
        expect(font.isForceAutoHinting()).assertTrue();
        expect(font.getSize()).assertEqual(28);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0032
     * @tc.name testFontApi0032
     * @tc.desc Verify the bundle stops following the theme font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0032 begin');
      await runCase('testFontApi0032', async () => {
        const font: drawing.Font = newFont(28);
        font.setThemeFontFollowed(false);
        expect(font.isThemeFontFollowed()).assertFalse();
        expect(font.isSubpixel()).assertFalse();
        expect(font.getScaleX()).assertEqual(1);
        expect(font.getSize()).assertEqual(28);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0033
     * @tc.name testFontApi0033
     * @tc.desc Verify a scale of two doubles the measured advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0033 begin');
      await runCase('testFontApi0033', async () => {
        const plain: number = widthOf('Hello', 20);
        const font: drawing.Font = newFont(20);
        font.setScaleX(2);
        const scaled: number = font.measureText('Hello', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(font.getScaleX()).assertEqual(2);
        expect(Math.abs(scaled / plain - 2) < 0.1).assertTrue();
        expect(scaled > plain).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0034
     * @tc.name testFontApi0034
     * @tc.desc Verify a scale of one half halves the measured advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0034 begin');
      await runCase('testFontApi0034', async () => {
        const plain: number = widthOf('Hello', 20);
        const font: drawing.Font = newFont(20);
        font.setScaleX(0.5);
        const scaled: number = font.measureText('Hello', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(font.getScaleX()).assertEqual(0.5);
        expect(Math.abs(scaled / plain - 0.5) < 0.05).assertTrue();
        expect(scaled < plain).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0035
     * @tc.name testFontApi0035
     * @tc.desc Verify a zero horizontal scale collapses the advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0035 begin');
      await runCase('testFontApi0035', async () => {
        const font: drawing.Font = newFont(20);
        font.setScaleX(0);
        expect(font.getScaleX()).assertEqual(0);
        expect(font.measureText('World', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(font.getSize()).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0036
     * @tc.name testFontApi0036
     * @tc.desc Verify a unit horizontal scale keeps the plain advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0036 begin');
      await runCase('testFontApi0036', async () => {
        const plain: number = widthOf('Scale', 24);
        const font: drawing.Font = newFont(24);
        font.setScaleX(1);
        expect(font.getScaleX()).assertEqual(1);
        expect(font.measureText('Scale', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(plain);
        expect(plain > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0037
     * @tc.name testFontApi0037
     * @tc.desc Verify a positive skew value round trips exactly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0037 begin');
      await runCase('testFontApi0037', async () => {
        const font: drawing.Font = newFont(24);
        font.setSkewX(0.25);
        expect(font.getSkewX()).assertEqual(0.25);
        expect(font.getScaleX()).assertEqual(1);
        expect(font.getSize()).assertEqual(24);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0038
     * @tc.name testFontApi0038
     * @tc.desc Verify a negative skew value is preserved for back slanting text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0038 begin');
      await runCase('testFontApi0038', async () => {
        const font: drawing.Font = newFont(24);
        font.setSkewX(-0.5);
        expect(font.getSkewX()).assertEqual(-0.5);
        expect(font.getSkewX() < 0).assertTrue();
        expect(font.isEmbolden()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0039
     * @tc.name testFontApi0039
     * @tc.desc Verify clearing the skew returns the font to an upright shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0039 begin');
      await runCase('testFontApi0039', async () => {
        const font: drawing.Font = newFont(24);
        font.setSkewX(0.3);
        font.setSkewX(0);
        expect(font.getSkewX()).assertEqual(0);
        expect(font.getScaleX()).assertEqual(1);
        expect(font.measureText('Skew', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0040
     * @tc.name testFontApi0040
     * @tc.desc Verify a later size change keeps the earlier horizontal scale.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0040 begin');
      await runCase('testFontApi0040', async () => {
        const font: drawing.Font = newFont(16);
        font.setScaleX(1.5);
        font.setSize(48);
        expect(font.getSize()).assertEqual(48);
        expect(font.getScaleX()).assertEqual(1.5);
        expect(font.measureText('Width', drawing.TextEncoding.TEXT_ENCODING_UTF8) >
          widthOf('Width', 16)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0041
     * @tc.name testFontApi0041
     * @tc.desc Verify aliased edging round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0041 begin');
      await runCase('testFontApi0041', async () => {
        const font: drawing.Font = newFont(22);
        font.setEdging(drawing.FontEdging.ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
        font.setHinting(drawing.FontHinting.NONE);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NONE);
        expect(font.getSize()).assertEqual(22);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0042
     * @tc.name testFontApi0042
     * @tc.desc Verify plain anti aliased edging round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0042 begin');
      await runCase('testFontApi0042', async () => {
        const font: drawing.Font = newFont(22);
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ANTI_ALIAS);
        expect(font.getEdging()).assertEqual(1);
        expect(font.isSubpixel()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0043
     * @tc.name testFontApi0043
     * @tc.desc Verify subpixel anti aliased edging round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0043 begin');
      await runCase('testFontApi0043', async () => {
        const font: drawing.Font = newFont(22);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(font.getEdging()).assertEqual(2);
        expect(font.getSize()).assertEqual(22);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0044
     * @tc.name testFontApi0044
     * @tc.desc Verify the edging getter follows every value in a full cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0044 begin');
      await runCase('testFontApi0044', async () => {
        const font: drawing.Font = newFont(22);
        const modes: drawing.FontEdging[] = [drawing.FontEdging.ALIAS, drawing.FontEdging.ANTI_ALIAS,
          drawing.FontEdging.SUBPIXEL_ANTI_ALIAS, drawing.FontEdging.ALIAS];
        let matched: number = 0;
        for (let index: number = 0; index < modes.length; index++) {
          font.setEdging(modes[index]);
          if (font.getEdging() === modes[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
        expect(font.getSize()).assertEqual(22);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0045
     * @tc.name testFontApi0045
     * @tc.desc Verify edging and hinting are stored in independent slots.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0045 begin');
      await runCase('testFontApi0045', async () => {
        const font: drawing.Font = newFont(22);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        font.setHinting(drawing.FontHinting.SLIGHT);
        font.setEdging(drawing.FontEdging.ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.SLIGHT);
        expect(font.getSize()).assertEqual(22);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0046
     * @tc.name testFontApi0046
     * @tc.desc Verify disabling hinting round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0046 begin');
      await runCase('testFontApi0046', async () => {
        const font: drawing.Font = newFont(18);
        font.setHinting(drawing.FontHinting.NONE);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NONE);
        expect(font.getHinting()).assertEqual(0);
        font.setEdging(drawing.FontEdging.ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0047
     * @tc.name testFontApi0047
     * @tc.desc Verify slight hinting round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0047 begin');
      await runCase('testFontApi0047', async () => {
        const font: drawing.Font = newFont(18);
        font.setHinting(drawing.FontHinting.SLIGHT);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.SLIGHT);
        expect(font.getHinting()).assertEqual(1);
        expect(font.getSize()).assertEqual(18);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0048
     * @tc.name testFontApi0048
     * @tc.desc Verify normal hinting round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0048 begin');
      await runCase('testFontApi0048', async () => {
        const font: drawing.Font = newFont(18);
        font.setHinting(drawing.FontHinting.NORMAL);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NORMAL);
        expect(font.getHinting()).assertEqual(2);
        expect(font.isSubpixel()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0049
     * @tc.name testFontApi0049
     * @tc.desc Verify full hinting round trips through the getter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0049 begin');
      await runCase('testFontApi0049', async () => {
        const font: drawing.Font = newFont(18);
        font.setHinting(drawing.FontHinting.FULL);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
        expect(font.getHinting()).assertEqual(3);
        expect(font.measureText('Hint', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0050
     * @tc.name testFontApi0050
     * @tc.desc Verify the hinting getter follows every value in a full cycle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0050 begin');
      await runCase('testFontApi0050', async () => {
        const font: drawing.Font = newFont(18);
        const levels: drawing.FontHinting[] = [drawing.FontHinting.NONE, drawing.FontHinting.SLIGHT,
          drawing.FontHinting.NORMAL, drawing.FontHinting.FULL];
        let matched: number = 0;
        for (let index: number = 0; index < levels.length; index++) {
          font.setHinting(levels[index]);
          if (font.getHinting() === levels[index]) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(4);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
        expect(font.getSize()).assertEqual(18);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0051
     * @tc.name testFontApi0051
     * @tc.desc Verify the three edging members carry the documented numeric values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0051 begin');
      await runCase('testFontApi0051', async () => {
        expect(drawing.FontEdging.ALIAS).assertEqual(0);
        expect(drawing.FontEdging.ANTI_ALIAS).assertEqual(1);
        expect(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0052
     * @tc.name testFontApi0052
     * @tc.desc Verify the four hinting members carry the documented numeric values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0052 begin');
      await runCase('testFontApi0052', async () => {
        expect(drawing.FontHinting.NONE).assertEqual(0);
        expect(drawing.FontHinting.SLIGHT).assertEqual(1);
        expect(drawing.FontHinting.NORMAL).assertEqual(2);
        expect(drawing.FontHinting.FULL).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0053
     * @tc.name testFontApi0053
     * @tc.desc Verify the metrics box has a bottom below its top edge.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0053 begin');
      await runCase('testFontApi0053', async () => {
        const metrics: drawing.FontMetrics = newFont(32).getMetrics();
        expect(metrics.bottom > metrics.top).assertTrue();
        expect(metrics.bottom - metrics.top > 20).assertTrue();
        expect(metrics.top < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0054
     * @tc.name testFontApi0054
     * @tc.desc Verify the ascent sits at or above the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0054 begin');
      await runCase('testFontApi0054', async () => {
        const metrics: drawing.FontMetrics = newFont(32).getMetrics();
        expect(metrics.ascent <= 0).assertTrue();
        expect(metrics.ascent < metrics.descent).assertTrue();
        expect(metrics.top <= metrics.ascent).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0055
     * @tc.name testFontApi0055
     * @tc.desc Verify the descent sits at or below the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0055 begin');
      await runCase('testFontApi0055', async () => {
        const metrics: drawing.FontMetrics = newFont(32).getMetrics();
        expect(metrics.descent >= 0).assertTrue();
        expect(metrics.bottom >= metrics.descent).assertTrue();
        expect(metrics.bottom > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0056
     * @tc.name testFontApi0056
     * @tc.desc Verify the ascent magnitude and the descent gap stay in a plausible range.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0056 begin');
      await runCase('testFontApi0056', async () => {
        const metrics: drawing.FontMetrics = newFont(32).getMetrics();
        expect(-metrics.ascent > 0).assertTrue();
        expect(metrics.leading >= 0).assertTrue();
        expect(metrics.descent - metrics.ascent > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0057
     * @tc.name testFontApi0057
     * @tc.desc Verify the metrics box grows with the text size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0057 begin');
      await runCase('testFontApi0057', async () => {
        const small: drawing.FontMetrics = newFont(10).getMetrics();
        const large: drawing.FontMetrics = newFont(40).getMetrics();
        expect(large.bottom - large.top > small.bottom - small.top).assertTrue();
        expect(large.descent > small.descent).assertTrue();
        expect(-large.ascent > -small.ascent).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0058
     * @tc.name testFontApi0058
     * @tc.desc Verify the leading value is never negative.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0058 begin');
      await runCase('testFontApi0058', async () => {
        const sizes: number[] = [8, 16, 32, 64];
        let nonNegative: number = 0;
        for (let index: number = 0; index < sizes.length; index++) {
          if (newFont(sizes[index]).getMetrics().leading >= 0) {
            nonNegative += 1;
          }
        }
        expect(nonNegative).assertEqual(4);
        expect(newFont(32).getMetrics().leading >= 0).assertTrue();
        expect(newFont(8).getMetrics().leading <= newFont(64).getMetrics().leading + 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0059
     * @tc.name testFontApi0059
     * @tc.desc Verify the main metrics snapshot mirrors the raw font metrics field by field.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0059 begin');
      await runCase('testFontApi0059', async () => {
        const font: drawing.Font = newFont(30);
        const raw: drawing.FontMetrics = font.getMetrics();
        const snapshot: FontMetricsSnapshot = snapshotMetrics(font);
        expect(snapshot.top).assertEqual(raw.top);
        expect(snapshot.ascent).assertEqual(raw.ascent);
        expect(snapshot.descent).assertEqual(raw.descent);
        expect(snapshot.leading).assertEqual(raw.leading);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0060
     * @tc.name testFontApi0060
     * @tc.desc Verify the metrics box at thirty two px sits in a plausible pixel range.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0060 begin');
      await runCase('testFontApi0060', async () => {
        const metrics: drawing.FontMetrics = newFont(32).getMetrics();
        expect(metrics.bottom - metrics.top > 20).assertTrue();
        expect(metrics.bottom - metrics.top < 60).assertTrue();
        expect(metrics.top < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0061
     * @tc.name testFontApi0061
     * @tc.desc Verify repeated metrics reads on one font report the same numbers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0061 begin');
      await runCase('testFontApi0061', async () => {
        const font: drawing.Font = newFont(30);
        const first: drawing.FontMetrics = font.getMetrics();
        font.enableSubpixel(true);
        const second: drawing.FontMetrics = font.getMetrics();
        expect(second.top).assertEqual(first.top);
        expect(second.descent).assertEqual(first.descent);
        expect(second.bottom).assertEqual(first.bottom);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0062
     * @tc.name testFontApi0062
     * @tc.desc Verify a zero size font falls back to a usable default metrics box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0062 begin');
      await runCase('testFontApi0062', async () => {
        const metrics: drawing.FontMetrics = newFont(0).getMetrics();
        expect(metrics.bottom - metrics.top < 100).assertTrue();
        expect(metrics.descent - metrics.ascent < 100).assertTrue();
        expect(metrics.leading >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0063
     * @tc.name testFontApi0063
     * @tc.desc Verify an empty string measures zero width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0063 begin');
      await runCase('testFontApi0063', async () => {
        const font: drawing.Font = newFont(32);
        expect(font.measureText('', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(font.measureText('', drawing.TextEncoding.TEXT_ENCODING_UTF16)).assertEqual(0);
        expect(font.getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0064
     * @tc.name testFontApi0064
     * @tc.desc Verify a single latin letter measures a positive width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0064 begin');
      await runCase('testFontApi0064', async () => {
        const font: drawing.Font = newFont(32);
        const width: number = font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(width > 0).assertTrue();
        expect(width < 32).assertTrue();
        expect(font.measureText('AA', drawing.TextEncoding.TEXT_ENCODING_UTF8) > width).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0065
     * @tc.name testFontApi0065
     * @tc.desc Verify two letters measure wider than one letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0065 begin');
      await runCase('testFontApi0065', async () => {
        const one: number = widthOf('A', 32);
        const two: number = widthOf('AB', 32);
        expect(two > one).assertTrue();
        expect(two > one * 1.2).assertTrue();
        expect(two < one * 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0066
     * @tc.name testFontApi0066
     * @tc.desc Verify four identical letters measure wider than a single one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0066 begin');
      await runCase('testFontApi0066', async () => {
        const one: number = widthOf('a', 32);
        const four: number = widthOf('aaaa', 32);
        expect(four > one * 3).assertTrue();
        expect(four < one * 5).assertTrue();
        expect(one > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0067
     * @tc.name testFontApi0067
     * @tc.desc Verify a ten letter word is roughly ten times a single letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0067 begin');
      await runCase('testFontApi0067', async () => {
        const one: number = widthOf('m', 20);
        const ten: number = widthOf('mmmmmmmmmm', 20);
        expect(ten / one > 8).assertTrue();
        expect(ten / one < 12).assertTrue();
        expect(ten > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0068
     * @tc.name testFontApi0068
     * @tc.desc Verify UTF8 and UTF16 encodings agree on ascii text width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0068 begin');
      await runCase('testFontApi0068', async () => {
        const font: drawing.Font = newFont(24);
        const utf8: number = font.measureText('Code', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = font.measureText('Code', drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(utf8 > 0).assertTrue();
        expect(Math.abs(utf8 - utf16)).assertEqual(58);
        expect(font.getSize()).assertEqual(24);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0069
     * @tc.name testFontApi0069
     * @tc.desc Verify the main measure helper matches a directly configured font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0069 begin');
      await runCase('testFontApi0069', async () => {
        const helper: number = measureString('Sample', 26, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const font: drawing.Font = new drawing.Font();
        font.setSize(26);
        expect(helper).assertEqual(font.measureText('Sample', drawing.TextEncoding.TEXT_ENCODING_UTF8));
        expect(helper > 0).assertTrue();
        expect(helper).assertEqual(widthOf('Sample', 26));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0070
     * @tc.name testFontApi0070
     * @tc.desc Verify doubling the size doubles the measured word width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0070 begin');
      await runCase('testFontApi0070', async () => {
        const small: number = widthOf('Hello', 20);
        const large: number = widthOf('Hello', 40);
        expect(large / small > 1.9).assertTrue();
        expect(large / small < 2.1).assertTrue();
        expect(large > small).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0071
     * @tc.name testFontApi0071
     * @tc.desc Verify a wide character measures wider than a narrow one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0071 begin');
      await runCase('testFontApi0071', async () => {
        const font: drawing.Font = newFont(32);
        const wide: number = font.measureSingleCharacter('W');
        const narrow: number = font.measureSingleCharacter('i');
        expect(wide > narrow).assertTrue();
        expect(narrow > 0).assertTrue();
        expect(wide > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0072
     * @tc.name testFontApi0072
     * @tc.desc Verify the feature aware measurement returns a positive width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0072 begin');
      await runCase('testFontApi0072', async () => {
        const font: drawing.Font = newFont(32);
        const features: drawing.FontFeature[] = [{ name: 'liga', value: 1 }, { name: 'kern', value: 1 }];
        const width: number = font.measureSingleCharacterWithFeatures('A', features);
        expect(width > 0).assertTrue();
        expect(width < 40).assertTrue();
        expect(font.getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0073
     * @tc.name testFontApi0073
     * @tc.desc Verify ligature and kerning features keep the plain character width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0073 begin');
      await runCase('testFontApi0073', async () => {
        const font: drawing.Font = newFont(32);
        const plain: number = font.measureSingleCharacter('A');
        const features: drawing.FontFeature[] = [{ name: 'liga', value: 1 }];
        const featured: number = font.measureSingleCharacterWithFeatures('A', features);
        expect(Math.abs(featured - plain) < plain * 0.2).assertTrue();
        expect(plain > 0).assertTrue();
        expect(featured > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0074
     * @tc.name testFontApi0074
     * @tc.desc Verify an empty string counts zero characters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0074 begin');
      await runCase('testFontApi0074', async () => {
        const font: drawing.Font = newFont(32);
        expect(font.countText('')).assertEqual(0);
        expect(font.textToGlyphs('').length).assertEqual(0);
        expect(font.getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0075
     * @tc.name testFontApi0075
     * @tc.desc Verify the main counter agrees with raw glyph conversion on short words.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0075 begin');
      await runCase('testFontApi0075', async () => {
        const font: drawing.Font = newFont(32);
        expect(font.countText('abc')).assertEqual(3);
        expect(font.textToGlyphs('abc').length).assertEqual(3);
        expect(countGlyphs('abc')).assertEqual(3);
        expect(countGlyphs('abcdef')).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0075 end');
    });
  });
}
