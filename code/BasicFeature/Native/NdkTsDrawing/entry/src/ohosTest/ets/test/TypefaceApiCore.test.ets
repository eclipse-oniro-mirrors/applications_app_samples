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
  applyTypeface,
  countGlyphs,
  createFont,
  glyphOutline,
  loadSystemTypeface,
  makeTypefaceFromCurrent,
  measureString,
  snapshotFont,
  snapshotMetrics,
  textOutline,
  typefaceVariation,
  FontMetricsSnapshot,
  FontSnapshot
} from '../../../main/ets/drawing/DrawingFontText';
import { DRAWING_TAG, runCase, throwsOn } from './DrawingTestRunner';

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
 * Build a typeface from the default one with a single variation axis.
 *
 * @param { string } axis - Variation axis tag.
 * @param { number } value - Axis value.
 * @returns { drawing.Typeface } Derived typeface.
 */
function varied(axis: string, value: number): drawing.Typeface {
  const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
  args.addVariation(axis, value);
  return loadSystemTypeface().makeFromCurrent(args);
}

/**
 * Build a font of the requested size carrying the given typeface.
 *
 * @param { drawing.Typeface } typeface - Typeface to install.
 * @param { number } size - Text size in px.
 * @returns { drawing.Font } Font bound to the typeface.
 */
function fontWithTypeface(typeface: drawing.Typeface, size: number): drawing.Font {
  const font: drawing.Font = newFont(size);
  font.setTypeface(typeface);
  return font;
}

export default function typefaceApiCoreTest() {
  describe('TypefaceApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0001
     * @tc.name testTypefaceApi0001
     * @tc.desc Verify the default typeface reports a non empty family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTypefaceApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0001 begin');
      await runCase('testTypefaceApi0001', async () => {
        const typeface: drawing.Typeface = loadSystemTypeface();
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.getFamilyName().length < 64).assertTrue();
        expect(typeface.isBold()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0002
     * @tc.name testTypefaceApi0002
     * @tc.desc Verify the default typeface is upright and unbolded.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTypefaceApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0002 begin');
      await runCase('testTypefaceApi0002', async () => {
        const typeface: drawing.Typeface = loadSystemTypeface();
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
        expect(typeface.getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0003
     * @tc.name testTypefaceApi0003
     * @tc.desc Verify two independently loaded typefaces share one family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0003 begin');
      await runCase('testTypefaceApi0003', async () => {
        const first: string = loadSystemTypeface().getFamilyName();
        const second: string = loadSystemTypeface().getFamilyName();
        expect(first).assertEqual(second);
        expect(first.length > 0).assertTrue();
        expect(second).assertEqual(createFont(32).getTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0004
     * @tc.name testTypefaceApi0004
     * @tc.desc Verify the family name does not depend on the font size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0004 begin');
      await runCase('testTypefaceApi0004', async () => {
        const small: string = newFont(8).getTypeface().getFamilyName();
        const large: string = newFont(128).getTypeface().getFamilyName();
        expect(small).assertEqual(large);
        expect(small.length > 0).assertTrue();
        expect(createFont(0).getTypeface().getFamilyName()).assertEqual(small);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0005
     * @tc.name testTypefaceApi0005
     * @tc.desc Verify a fresh font carries a usable typeface before any setter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTypefaceApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0005 begin');
      await runCase('testTypefaceApi0005', async () => {
        const typeface: drawing.Typeface = new drawing.Font().getTypeface();
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0006
     * @tc.name testTypefaceApi0006
     * @tc.desc Verify repeated family reads on one typeface stay identical.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0006 begin');
      await runCase('testTypefaceApi0006', async () => {
        const typeface: drawing.Typeface = loadSystemTypeface();
        const first: string = typeface.getFamilyName();
        const second: string = typeface.getFamilyName();
        expect(second).assertEqual(first);
        expect(typeface.isBold()).assertEqual(typeface.isBold());
        expect(first.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0007
     * @tc.name testTypefaceApi0007
     * @tc.desc Verify the font snapshot reports the typeface family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0007 begin');
      await runCase('testTypefaceApi0007', async () => {
        const snapshot: FontSnapshot = snapshotFont(createFont(32));
        expect(snapshot.familyName).assertEqual(loadSystemTypeface().getFamilyName());
        expect(snapshot.bold).assertFalse();
        expect(snapshot.italic).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0008
     * @tc.name testTypefaceApi0008
     * @tc.desc Verify the snapshot family survives a size change.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0008 begin');
      await runCase('testTypefaceApi0008', async () => {
        const font: drawing.Font = newFont(16);
        const before: FontSnapshot = snapshotFont(font);
        font.setSize(72);
        const after: FontSnapshot = snapshotFont(font);
        expect(after.familyName).assertEqual(before.familyName);
        expect(after.size).assertEqual(72);
        expect(before.size).assertEqual(16);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0009
     * @tc.name testTypefaceApi0009
     * @tc.desc Verify the typeface stays usable after a style bundle is applied.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0009 begin');
      await runCase('testTypefaceApi0009', async () => {
        const font: drawing.Font = newFont(24);
        const before: string = font.getTypeface().getFamilyName();
        font.enableSubpixel(true);
        font.enableEmbolden(true);
        font.setScaleX(1.2);
        expect(font.getTypeface().getFamilyName()).assertEqual(before);
        expect(font.isEmbolden()).assertTrue();
        expect(font.getScaleX()).assertClose(1.2, 0.000001);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0010
     * @tc.name testTypefaceApi0010
     * @tc.desc Verify the embolden flag does not change the reported bold state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0010 begin');
      await runCase('testTypefaceApi0010', async () => {
        const font: drawing.Font = newFont(24);
        font.enableEmbolden(true);
        expect(font.isEmbolden()).assertTrue();
        expect(font.getTypeface().isBold()).assertFalse();
        expect(font.getTypeface().getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0011
     * @tc.name testTypefaceApi0011
     * @tc.desc Verify five fonts of different sizes share the same family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0011 begin');
      await runCase('testTypefaceApi0011', async () => {
        const sizes: number[] = [4, 12, 24, 48, 96];
        let matched: number = 0;
        for (let index: number = 0; index < sizes.length; index++) {
          if (newFont(sizes[index]).getTypeface().getFamilyName() === loadSystemTypeface().getFamilyName()) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(5);
        expect(sizes.length).assertEqual(5);
        expect(loadSystemTypeface().getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0012
     * @tc.name testTypefaceApi0012
     * @tc.desc Verify a hand built arguments object starts empty and accepts an axis.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0012 begin');
      await runCase('testTypefaceApi0012', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 400);
        const typeface: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0013
     * @tc.name testTypefaceApi0013
     * @tc.desc Verify a width axis keeps the family name unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0013 begin');
      await runCase('testTypefaceApi0013', async () => {
        const typeface: drawing.Typeface = varied('wdth', 100);
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.isBold()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0014
     * @tc.name testTypefaceApi0014
     * @tc.desc Verify two axes applied together keep the family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0014 begin');
      await runCase('testTypefaceApi0014', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 700);
        args.addVariation('wdth', 90);
        const typeface: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isItalic()).assertFalse();
        expect(typeface.isBold()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0015
     * @tc.name testTypefaceApi0015
     * @tc.desc Verify three axes applied together keep the family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0015 begin');
      await runCase('testTypefaceApi0015', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 300);
        args.addVariation('wdth', 110);
        args.addVariation('opsz', 14);
        const typeface: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isBold()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0016
     * @tc.name testTypefaceApi0016
     * @tc.desc Verify the light and heavy weights both derive from one family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0016 begin');
      await runCase('testTypefaceApi0016', async () => {
        const light: string = varied('wght', 100).getFamilyName();
        const heavy: string = varied('wght', 900).getFamilyName();
        expect(light).assertEqual(heavy);
        expect(light).assertEqual(loadSystemTypeface().getFamilyName());
        expect(light.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0017
     * @tc.name testTypefaceApi0017
     * @tc.desc Verify the same arguments applied twice give the same family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0017 begin');
      await runCase('testTypefaceApi0017', async () => {
        const first: drawing.Typeface = varied('wght', 500);
        const second: drawing.Typeface = varied('wght', 500);
        expect(first.getFamilyName()).assertEqual(second.getFamilyName());
        expect(first.isBold()).assertEqual(second.isBold());
        expect(first.isItalic()).assertEqual(second.isItalic());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0018
     * @tc.name testTypefaceApi0018
     * @tc.desc Verify a repeated axis entry does not break the derivation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0018 begin');
      await runCase('testTypefaceApi0018', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 400);
        args.addVariation('wght', 600);
        const typeface: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0019
     * @tc.name testTypefaceApi0019
     * @tc.desc Verify a zero axis value still derives a usable typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0019 begin');
      await runCase('testTypefaceApi0019', async () => {
        const typeface: drawing.Typeface = varied('wght', 0);
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isBold()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0020
     * @tc.name testTypefaceApi0020
     * @tc.desc Verify an extreme axis value still derives a usable typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0020 begin');
      await runCase('testTypefaceApi0020', async () => {
        const typeface: drawing.Typeface = varied('wght', 10000);
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.isBold()).assertTrue();
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0021
     * @tc.name testTypefaceApi0021
     * @tc.desc Verify a negative axis value still derives a usable typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0021 begin');
      await runCase('testTypefaceApi0021', async () => {
        const typeface: drawing.Typeface = varied('wght', -100);
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0022
     * @tc.name testTypefaceApi0022
     * @tc.desc Verify an unknown axis tag does not break the derivation.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0022 begin');
      await runCase('testTypefaceApi0022', async () => {
        const typeface: drawing.Typeface = varied('xxxx', 50);
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.isBold()).assertFalse();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0023
     * @tc.name testTypefaceApi0023
     * @tc.desc Verify an axis tag shorter than four characters is rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0023 begin');
      await runCase('testTypefaceApi0023', async () => {
        expect(throwsOn(() => varied('', 400))).assertTrue();
        expect(throwsOn(() => varied('wgh', 400))).assertTrue();
        const fallback: drawing.Typeface = loadSystemTypeface();
        expect(fallback.getFamilyName().length > 0).assertTrue();
        expect(fallback.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0024
     * @tc.name testTypefaceApi0024
     * @tc.desc Verify a fractional axis value keeps the family and size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0024 begin');
      await runCase('testTypefaceApi0024', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 400.5), 24);
        expect(font.getSize()).assertEqual(24);
        expect(font.getTypeface().getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(font.getTypeface().isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0025
     * @tc.name testTypefaceApi0025
     * @tc.desc Verify the main variation helper derives the default family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0025 begin');
      await runCase('testTypefaceApi0025', async () => {
        const typeface: drawing.Typeface = loadSystemTypeface().makeFromCurrent(typefaceVariation());
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0026
     * @tc.name testTypefaceApi0026
     * @tc.desc Verify the main factory derives a typeface of the default family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0026 begin');
      await runCase('testTypefaceApi0026', async () => {
        const typeface: drawing.Typeface = makeTypefaceFromCurrent();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0027
     * @tc.name testTypefaceApi0027
     * @tc.desc Verify applyTypeface reports the installed family and stays idempotent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0027 begin');
      await runCase('testTypefaceApi0027', async () => {
        const font: drawing.Font = newFont(32);
        const applied: string = applyTypeface(font);
        expect(applied.length > 0).assertTrue();
        expect(applied).assertEqual(loadSystemTypeface().getFamilyName());
        expect(applyTypeface(font)).assertEqual(applied);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0028
     * @tc.name testTypefaceApi0028
     * @tc.desc Verify the installed typeface keeps its upright and unbolded flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0028 begin');
      await runCase('testTypefaceApi0028', async () => {
        const font: drawing.Font = newFont(24);
        applyTypeface(font);
        const applied: drawing.Typeface = font.getTypeface();
        expect(applied.isBold()).assertFalse();
        expect(applied.isItalic()).assertFalse();
        expect(applied.getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0029
     * @tc.name testTypefaceApi0029
     * @tc.desc Verify installing a typeface leaves the size and scale untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0029 begin');
      await runCase('testTypefaceApi0029', async () => {
        const font: drawing.Font = newFont(40);
        const family: string = applyTypeface(font);
        expect(font.getSize()).assertEqual(40);
        expect(font.getScaleX()).assertEqual(1);
        expect(family).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0030
     * @tc.name testTypefaceApi0030
     * @tc.desc Verify a bold variation still measures close to the plain string width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0030 begin');
      await runCase('testTypefaceApi0030', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 700), 32);
        const width: number = font.measureText('Hello', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const reference: number = measureString('Hello', 32, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(width > 0).assertTrue();
        expect(reference > 0).assertTrue();
        expect(Math.abs(width - reference) < reference * 0.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0031
     * @tc.name testTypefaceApi0031
     * @tc.desc Verify a derived typeface keeps the glyph count of the string.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0031 begin');
      await runCase('testTypefaceApi0031', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 600), 32);
        const ids: number[] = font.textToGlyphs('Swift');
        expect(ids.length).assertEqual(5);
        expect(ids.length).assertEqual(countGlyphs('Swift'));
        expect(ids[0] >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0032
     * @tc.name testTypefaceApi0032
     * @tc.desc Verify a narrowed typeface still yields a drawable glyph outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0032 begin');
      await runCase('testTypefaceApi0032', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wdth', 90), 32);
        const ids: number[] = font.textToGlyphs('W');
        const outline: drawing.Path = font.createPathForGlyph(ids[0]);
        const bounds: common2D.Rect = outline.getBounds();
        expect(bounds.right - bounds.left > 0).assertTrue();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
        expect(outline.getLength(false) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0033
     * @tc.name testTypefaceApi0033
     * @tc.desc Verify the snapshot of a varied font keeps family and size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0033 begin');
      await runCase('testTypefaceApi0033', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 300), 28);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.familyName).assertEqual(loadSystemTypeface().getFamilyName());
        expect(snapshot.size).assertEqual(28);
        expect(snapshot.bold).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0034
     * @tc.name testTypefaceApi0034
     * @tc.desc Verify a blob built from a varied font keeps a non empty box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0034 begin');
      await runCase('testTypefaceApi0034', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 800), 32);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Blob', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.right - bounds.left > 0).assertTrue();
        expect(bounds.bottom > bounds.top).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0035
     * @tc.name testTypefaceApi0035
     * @tc.desc Verify two sizes sharing one typeface keep their own sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0035 begin');
      await runCase('testTypefaceApi0035', async () => {
        const typeface: drawing.Typeface = varied('wght', 500);
        const small: drawing.Font = fontWithTypeface(typeface, 12);
        const large: drawing.Font = fontWithTypeface(typeface, 48);
        expect(small.getTypeface().getFamilyName()).assertEqual(large.getTypeface().getFamilyName());
        expect(small.getSize()).assertEqual(12);
        expect(large.getSize()).assertEqual(48);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0036
     * @tc.name testTypefaceApi0036
     * @tc.desc Verify a minimum size font keeps a usable typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0036 begin');
      await runCase('testTypefaceApi0036', async () => {
        const font: drawing.Font = newFont(1);
        const family: string = font.getTypeface().getFamilyName();
        expect(family.length > 0).assertTrue();
        expect(family).assertEqual(loadSystemTypeface().getFamilyName());
        expect(applyTypeface(font)).assertEqual(family);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0037
     * @tc.name testTypefaceApi0037
     * @tc.desc Verify a maximum size font keeps a measurable typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0037 begin');
      await runCase('testTypefaceApi0037', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 400), 1000);
        expect(font.getSize()).assertEqual(1000);
        expect(font.getTypeface().getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(font.measureText('T', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0038
     * @tc.name testTypefaceApi0038
     * @tc.desc Verify installing a typeface keeps scale and skew values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0038 begin');
      await runCase('testTypefaceApi0038', async () => {
        const font: drawing.Font = newFont(32);
        font.setScaleX(1.3);
        font.setSkewX(0.2);
        const family: string = applyTypeface(font);
        expect(font.getScaleX()).assertClose(1.3, 0.000001);
        expect(font.getSkewX()).assertClose(0.20000000298023224, 0.01);
        expect(family.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0039
     * @tc.name testTypefaceApi0039
     * @tc.desc Verify installing a typeface keeps hinting and edging modes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0039 begin');
      await runCase('testTypefaceApi0039', async () => {
        const font: drawing.Font = newFont(32);
        font.setHinting(drawing.FontHinting.FULL);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        applyTypeface(font);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(font.getTypeface().getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0040
     * @tc.name testTypefaceApi0040
     * @tc.desc Verify installing a typeface keeps embolden and subpixel flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0040 begin');
      await runCase('testTypefaceApi0040', async () => {
        const font: drawing.Font = newFont(32);
        font.enableEmbolden(true);
        font.enableSubpixel(true);
        const family: string = applyTypeface(font);
        expect(font.isEmbolden()).assertTrue();
        expect(font.isSubpixel()).assertTrue();
        expect(family).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0041
     * @tc.name testTypefaceApi0041
     * @tc.desc Verify the full derive and install chain reports one family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0041 begin');
      await runCase('testTypefaceApi0041', async () => {
        const derived: drawing.Typeface = loadSystemTypeface().makeFromCurrent(typefaceVariation());
        const font: drawing.Font = newFont(24);
        font.setTypeface(derived);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.familyName).assertEqual(loadSystemTypeface().getFamilyName());
        expect(snapshot.size).assertEqual(24);
        expect(snapshot.bold).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0042
     * @tc.name testTypefaceApi0042
     * @tc.desc Verify ten weight steps all stay inside the default family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0042 begin');
      await runCase('testTypefaceApi0042', async () => {
        let matched: number = 0;
        for (let weight: number = 100; weight <= 1000; weight += 100) {
          if (varied('wght', weight).getFamilyName() === loadSystemTypeface().getFamilyName()) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(10);
        expect(loadSystemTypeface().getFamilyName().length > 0).assertTrue();
        expect(varied('wght', 1000).isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0043
     * @tc.name testTypefaceApi0043
     * @tc.desc Verify twenty axes stacked on one arguments object derive one family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0043 begin');
      await runCase('testTypefaceApi0043', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        for (let index: number = 0; index < 20; index++) {
          args.addVariation('wght', 100 + index * 40);
        }
        const typeface: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isBold()).assertTrue();
        expect(typeface.getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0044
     * @tc.name testTypefaceApi0044
     * @tc.desc Verify one arguments object can be applied twice with the same result.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0044 begin');
      await runCase('testTypefaceApi0044', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 550);
        const first: string = loadSystemTypeface().makeFromCurrent(args).getFamilyName();
        const second: string = loadSystemTypeface().makeFromCurrent(args).getFamilyName();
        expect(first).assertEqual(second);
        expect(first.length > 0).assertTrue();
        expect(first).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0045
     * @tc.name testTypefaceApi0045
     * @tc.desc Verify extending an arguments object keeps the derived family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0045 begin');
      await runCase('testTypefaceApi0045', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 450);
        const before: string = loadSystemTypeface().makeFromCurrent(args).getFamilyName();
        args.addVariation('wdth', 95);
        const after: string = loadSystemTypeface().makeFromCurrent(args).getFamilyName();
        expect(after).assertEqual(before);
        expect(before.length > 0).assertTrue();
        expect(after.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0046
     * @tc.name testTypefaceApi0046
     * @tc.desc Verify a million scale axis value still derives the default family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0046 begin');
      await runCase('testTypefaceApi0046', async () => {
        const huge: string = varied('wght', 1000000).getFamilyName();
        const tiny: string = varied('wght', 0.0001).getFamilyName();
        expect(huge).assertEqual(tiny);
        expect(huge).assertEqual(loadSystemTypeface().getFamilyName());
        expect(varied('wght', 1000000).isBold()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0047
     * @tc.name testTypefaceApi0047
     * @tc.desc Verify a negative slant axis keeps the derived family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0047 begin');
      await runCase('testTypefaceApi0047', async () => {
        const typeface: drawing.Typeface = varied('slnt', -12);
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isItalic()).assertFalse();
        expect(typeface.getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0048
     * @tc.name testTypefaceApi0048
     * @tc.desc Verify an italic axis keeps the reported upright flag.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0048 begin');
      await runCase('testTypefaceApi0048', async () => {
        const typeface: drawing.Typeface = varied('ital', 1);
        expect(typeface.isItalic()).assertFalse();
        expect(typeface.isBold()).assertFalse();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0049
     * @tc.name testTypefaceApi0049
     * @tc.desc Verify an upper case axis tag keeps a drawable font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0049 begin');
      await runCase('testTypefaceApi0049', async () => {
        const typeface: drawing.Typeface = varied('WGHT', 700);
        const font: drawing.Font = fontWithTypeface(typeface, 32);
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(font.getTypeface().getFamilyName()).assertEqual(typeface.getFamilyName());
        expect(font.measureText('Tag', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0050
     * @tc.name testTypefaceApi0050
     * @tc.desc Verify the four letter weight axis keeps the derived family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0050 begin');
      await runCase('testTypefaceApi0050', async () => {
        const typeface: drawing.Typeface = varied('wght', 700);
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0051
     * @tc.name testTypefaceApi0051
     * @tc.desc Verify a tiny axis value measures like the default font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0051 begin');
      await runCase('testTypefaceApi0051', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 0.0001), 32);
        const width: number = font.measureText('Tiny', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const reference: number = measureString('Tiny', 32, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(width > 0).assertTrue();
        expect(Math.abs(width - reference)).assertEqual(5);
        expect(font.getTypeface().getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0052
     * @tc.name testTypefaceApi0052
     * @tc.desc Verify two fonts installed separately report the same family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0052 begin');
      await runCase('testTypefaceApi0052', async () => {
        const first: drawing.Font = newFont(20);
        const second: drawing.Font = newFont(36);
        const firstName: string = applyTypeface(first);
        const secondName: string = applyTypeface(second);
        expect(firstName).assertEqual(secondName);
        expect(second.getSize()).assertEqual(36);
        expect(first.getTypeface().getFamilyName()).assertEqual(second.getTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0053
     * @tc.name testTypefaceApi0053
     * @tc.desc Verify a zero size font still accepts the system typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0053 begin');
      await runCase('testTypefaceApi0053', async () => {
        const font: drawing.Font = createFont(0);
        const family: string = applyTypeface(font);
        expect(family.length > 0).assertTrue();
        expect(font.getSize()).assertEqual(0);
        expect(family).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0054
     * @tc.name testTypefaceApi0054
     * @tc.desc Verify the family name carries no surrounding white space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0054 begin');
      await runCase('testTypefaceApi0054', async () => {
        const name: string = varied('wght', 350).getFamilyName();
        expect(name.trim()).assertEqual(name);
        expect(name.length > 0).assertTrue();
        expect(name).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0055
     * @tc.name testTypefaceApi0055
     * @tc.desc Verify three independent derivations all report the default family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0055 begin');
      await runCase('testTypefaceApi0055', async () => {
        const axes: string[] = ['wght', 'wdth', 'opsz'];
        const values: number[] = [650, 85, 20];
        let matched: number = 0;
        for (let index: number = 0; index < axes.length; index++) {
          if (varied(axes[index], values[index]).getFamilyName() === loadSystemTypeface().getFamilyName()) {
            matched += 1;
          }
        }
        expect(matched).assertEqual(3);
        expect(axes.length).assertEqual(3);
        expect(varied('opsz', 20).isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0056
     * @tc.name testTypefaceApi0056
     * @tc.desc Verify five derived typefaces all stay upright and unbolded.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0056 begin');
      await runCase('testTypefaceApi0056', async () => {
        let upright: number = 0;
        for (let weight: number = 200; weight <= 600; weight += 100) {
          const typeface: drawing.Typeface = varied('wght', weight);
          if (!typeface.isBold() && !typeface.isItalic()) {
            upright += 1;
          }
        }
        expect(upright).assertEqual(4);
        expect(varied('wght', 200).getFamilyName().length > 0).assertTrue();
        expect(varied('wght', 600).isBold()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0057
     * @tc.name testTypefaceApi0057
     * @tc.desc Verify empty arguments derive a font that still keeps its size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0057 begin');
      await runCase('testTypefaceApi0057', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        const typeface: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        expect(typeface.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(typeface.isItalic()).assertFalse();
        expect(fontWithTypeface(typeface, 32).getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0058
     * @tc.name testTypefaceApi0058
     * @tc.desc Verify a twice derived typeface remains measurable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0058 begin');
      await runCase('testTypefaceApi0058', async () => {
        const twice: drawing.Typeface = loadSystemTypeface()
          .makeFromCurrent(new drawing.TypefaceArguments())
          .makeFromCurrent(typefaceVariation());
        const font: drawing.Font = fontWithTypeface(twice, 32);
        expect(twice.getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(twice.isItalic()).assertFalse();
        expect(font.measureText('Chain', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0059
     * @tc.name testTypefaceApi0059
     * @tc.desc Verify a varied font scales its advance with the repeated glyph count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0059 begin');
      await runCase('testTypefaceApi0059', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 550), 32);
        const single: number = font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const triple: number = font.measureText('AAA', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(single > 0).assertTrue();
        expect(triple / single > 2.7).assertTrue();
        expect(triple / single < 3.3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0060
     * @tc.name testTypefaceApi0060
     * @tc.desc Verify glyph advances of a varied font match the glyph count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0060 begin');
      await runCase('testTypefaceApi0060', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 480), 30);
        const ids: number[] = font.textToGlyphs('Type');
        const widths: number[] = font.getWidths(ids);
        let total: number = 0;
        for (let index: number = 0; index < widths.length; index++) {
          total += widths[index];
        }
        expect(widths.length).assertEqual(ids.length);
        expect(ids.length).assertEqual(4);
        expect(total > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0061
     * @tc.name testTypefaceApi0061
     * @tc.desc Verify a varied typeface yields a glyph outline with height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0061 begin');
      await runCase('testTypefaceApi0061', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wdth', 105), 40);
        const ids: number[] = font.textToGlyphs('x');
        const outline: drawing.Path = font.createPathForGlyph(ids[0]);
        const bounds: common2D.Rect = outline.getBounds();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
        expect(bounds.right > bounds.left).assertTrue();
        expect(ids.length).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0062
     * @tc.name testTypefaceApi0062
     * @tc.desc Verify two blobs of a varied font get distinct ids and one width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0062 begin');
      await runCase('testTypefaceApi0062', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 420), 28);
        const first: drawing.TextBlob = drawing.TextBlob.makeFromString('Same', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const second: drawing.TextBlob = drawing.TextBlob.makeFromString('Same', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const firstWidth: number = first.bounds().right - first.bounds().left;
        const secondWidth: number = second.bounds().right - second.bounds().left;
        expect(first.uniqueID() > 0).assertTrue();
        expect(second.uniqueID() > first.uniqueID()).assertTrue();
        expect(firstWidth).assertEqual(secondWidth);
        expect(firstWidth > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0063
     * @tc.name testTypefaceApi0063
     * @tc.desc Verify metrics of a varied font keep their sign conventions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0063 begin');
      await runCase('testTypefaceApi0063', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 380), 32);
        const metrics: FontMetricsSnapshot = snapshotMetrics(font);
        expect(metrics.ascent <= 0).assertTrue();
        expect(metrics.descent >= 0).assertTrue();
        expect(metrics.leading >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0064
     * @tc.name testTypefaceApi0064
     * @tc.desc Verify a size change after installation keeps the installed family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0064 begin');
      await runCase('testTypefaceApi0064', async () => {
        const font: drawing.Font = newFont(16);
        applyTypeface(font);
        font.setSize(64);
        expect(font.getSize()).assertEqual(64);
        expect(font.getTypeface().getFamilyName()).assertEqual(loadSystemTypeface().getFamilyName());
        expect(font.measureText('Grow', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0065
     * @tc.name testTypefaceApi0065
     * @tc.desc Verify installing a typeface on one font leaves another font untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0065 begin');
      await runCase('testTypefaceApi0065', async () => {
        const touched: drawing.Font = newFont(18);
        const untouched: drawing.Font = newFont(54);
        const defaultFamily: string = loadSystemTypeface().getFamilyName();
        applyTypeface(touched);
        expect(untouched.getTypeface().getFamilyName()).assertEqual(defaultFamily);
        expect(touched.getTypeface().getFamilyName()).assertEqual(defaultFamily);
        expect(untouched.getSize()).assertEqual(54);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0066
     * @tc.name testTypefaceApi0066
     * @tc.desc Verify advances of one varied typeface grow with the text size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0066 begin');
      await runCase('testTypefaceApi0066', async () => {
        const typeface: drawing.Typeface = varied('wght', 450);
        const small: number = fontWithTypeface(typeface, 16)
          .measureText('Size', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const medium: number = fontWithTypeface(typeface, 32)
          .measureText('Size', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const large: number = fontWithTypeface(typeface, 64)
          .measureText('Size', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(medium > small).assertTrue();
        expect(large > medium).assertTrue();
        expect(Math.round(large / small)).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0067
     * @tc.name testTypefaceApi0067
     * @tc.desc Verify the main text outline helper returns a sized path.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0067 begin');
      await runCase('testTypefaceApi0067', async () => {
        const outline: drawing.Path = textOutline('Type', 32);
        const bounds: common2D.Rect = outline.getBounds();
        expect(bounds.right - bounds.left > 0).assertTrue();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
        expect(outline.getLength(false) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0068
     * @tc.name testTypefaceApi0068
     * @tc.desc Verify the main glyph outline helper returns a closed contour.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0068 begin');
      await runCase('testTypefaceApi0068', async () => {
        const outline: drawing.Path = glyphOutline('Type', 32, 0);
        const bounds: common2D.Rect = outline.getBounds();
        expect(outline.getLength(true) > 0).assertTrue();
        expect(bounds.right - bounds.left > 0).assertTrue();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0069
     * @tc.name testTypefaceApi0069
     * @tc.desc Verify installing a typeface keeps subpixel and linear metrics flags.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0069 begin');
      await runCase('testTypefaceApi0069', async () => {
        const font: drawing.Font = newFont(30);
        font.enableSubpixel(true);
        font.enableLinearMetrics(true);
        const family: string = applyTypeface(font);
        expect(font.isSubpixel()).assertTrue();
        expect(font.isLinearMetrics()).assertTrue();
        expect(family).assertEqual(font.getTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0070
     * @tc.name testTypefaceApi0070
     * @tc.desc Verify two factory calls report one family and one style.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0070 begin');
      await runCase('testTypefaceApi0070', async () => {
        const first: drawing.Typeface = makeTypefaceFromCurrent();
        const second: drawing.Typeface = makeTypefaceFromCurrent();
        expect(first.getFamilyName()).assertEqual(second.getFamilyName());
        expect(second.isItalic()).assertFalse();
        expect(first.isBold()).assertEqual(second.isBold());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0071
     * @tc.name testTypefaceApi0071
     * @tc.desc Verify a font built with the system typeface matches a plain font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTypefaceApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0071 begin');
      await runCase('testTypefaceApi0071', async () => {
        const built: drawing.Font = fontWithTypeface(loadSystemTypeface(), 32);
        const plain: drawing.Font = createFont(32);
        expect(built.getTypeface().getFamilyName()).assertEqual(plain.getTypeface().getFamilyName());
        expect(built.getSize()).assertEqual(plain.getSize());
        expect(built.getTypeface().isBold()).assertEqual(plain.getTypeface().isBold());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0072
     * @tc.name testTypefaceApi0072
     * @tc.desc Verify a varied typeface keeps a monotonic advance on longer text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0072 begin');
      await runCase('testTypefaceApi0072', async () => {
        const font: drawing.Font = fontWithTypeface(varied('wght', 640), 26);
        const short: number = font.measureText('Type', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const long: number = font.measureText('Typefaces', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(short > 0).assertTrue();
        expect(long > short).assertTrue();
        expect(long < short * 3).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0073
     * @tc.name testTypefaceApi0073
     * @tc.desc Verify a three axis typeface reaches the snapshot unchanged.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0073 begin');
      await runCase('testTypefaceApi0073', async () => {
        const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
        args.addVariation('wght', 620);
        args.addVariation('wdth', 92);
        args.addVariation('opsz', 18);
        const font: drawing.Font = fontWithTypeface(loadSystemTypeface().makeFromCurrent(args), 40);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.familyName).assertEqual(loadSystemTypeface().getFamilyName());
        expect(snapshot.size).assertEqual(40);
        expect(snapshot.italic).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0074
     * @tc.name testTypefaceApi0074
     * @tc.desc Verify the factory chain leaves every default style attribute intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0074 begin');
      await runCase('testTypefaceApi0074', async () => {
        const font: drawing.Font = newFont(24);
        font.setTypeface(makeTypefaceFromCurrent());
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.familyName).assertEqual(loadSystemTypeface().getFamilyName());
        expect(snapshot.embolden).assertFalse();
        expect(snapshot.scaleX).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TYPEFACE_0075
     * @tc.name testTypefaceApi0075
     * @tc.desc Verify blobs of one varied typeface scale with the text size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTypefaceApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0075 begin');
      await runCase('testTypefaceApi0075', async () => {
        const typeface: drawing.Typeface = varied('wght', 400);
        const narrow: drawing.TextBlob = drawing.TextBlob.makeFromString('Blob',
          fontWithTypeface(typeface, 24), drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const wide: drawing.TextBlob = drawing.TextBlob.makeFromString('Blob',
          fontWithTypeface(typeface, 48), drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const narrowWidth: number = narrow.bounds().right - narrow.bounds().left;
        const wideWidth: number = wide.bounds().right - wide.bounds().left;
        expect(wideWidth > narrowWidth * 1.8).assertTrue();
        expect(wideWidth < narrowWidth * 2.2).assertTrue();
        expect(narrow.uniqueID() === wide.uniqueID()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTypefaceApi0075 end');
    });
  });
}
