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
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { point, ltrb, rgba } from '../../../main/ets/drawing/DrawingTypes';
import { DRAWING_TAG, readPixelBuffer, runCase, throwsOn } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const CANVAS_SIZE: number = 200;

/**
 * Read one color channel of a pixel in a raw RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function chanAt(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * CANVAS_SIZE + x) * 4 + channel];
}

/**
 * Count the pixels carrying a non zero alpha channel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of painted pixels.
 */
function inkAll(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > 0) {
      count++;
    }
  }
  return count;
}

/**
 * Count the painted pixels inside one axis aligned box.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of painted pixels inside the box.
 */
function inkRect(buffer: ArrayBuffer, left: number, top: number, right: number, bottom: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      if (bytes[(y * CANVAS_SIZE + x) * 4 + 3] > 0) {
        count++;
      }
    }
  }
  return count;
}

export default function fontApiDeep2Test() {
  describe('FontApiDeep2Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0551
     * @tc.name testFontDeep0551
     * @tc.desc Verify subpixel rendering never changes the measured advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0551', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0551 begin');
      await runCase('testFontDeep0551', async () => {
        const plain: drawing.Font = new drawing.Font();
        plain.setSize(46);
        const smooth: drawing.Font = new drawing.Font();
        smooth.setSize(46);
        smooth.enableSubpixel(true);
        const plainWidth: number = plain.measureText('Pixel', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const smoothWidth: number = smooth.measureText('Pixel', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(smoothWidth).assertEqual(plainWidth);
        expect(smooth.isSubpixel()).assertTrue();
        expect(plain.isSubpixel()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0551 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0552
     * @tc.name testFontDeep0552
     * @tc.desc Verify embolden keeps the metrics window of a plain font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0552', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0552 begin');
      await runCase('testFontDeep0552', async () => {
        const plain: drawing.Font = new drawing.Font();
        plain.setSize(52);
        const bold: drawing.Font = new drawing.Font();
        bold.setSize(52);
        bold.enableEmbolden(true);
        expect(bold.getMetrics().bottom).assertEqual(plain.getMetrics().bottom);
        expect(bold.getMetrics().ascent).assertEqual(plain.getMetrics().ascent);
        expect(bold.isEmbolden()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0552 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0553
     * @tc.name testFontDeep0553
     * @tc.desc Verify all three edging modes measure the same advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0553', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0553 begin');
      await runCase('testFontDeep0553', async () => {
        const alias: drawing.Font = new drawing.Font();
        alias.setSize(42);
        alias.setEdging(drawing.FontEdging.ALIAS);
        const anti: drawing.Font = new drawing.Font();
        anti.setSize(42);
        anti.setEdging(drawing.FontEdging.ANTI_ALIAS);
        const sub: drawing.Font = new drawing.Font();
        sub.setSize(42);
        sub.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        const aliasWidth: number = alias.measureText('Edge', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const antiWidth: number = anti.measureText('Edge', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(alias.getEdging()).assertEqual(drawing.FontEdging.ALIAS);
        expect(antiWidth).assertEqual(aliasWidth);
        expect(sub.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0553 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0554
     * @tc.name testFontDeep0554
     * @tc.desc Verify every hinting level still produces a positive advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0554', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0554 begin');
      await runCase('testFontDeep0554', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(38);
        font.setHinting(drawing.FontHinting.NONE);
        const none: number = font.measureText('Hint', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setHinting(drawing.FontHinting.SLIGHT);
        const slight: number = font.measureText('Hint', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setHinting(drawing.FontHinting.NORMAL);
        const normal: number = font.measureText('Hint', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setHinting(drawing.FontHinting.FULL);
        const full: number = font.measureText('Hint', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(none > 0 && slight > 0).assertTrue();
        expect(normal > 0 && full > 0).assertTrue();
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0554 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0555
     * @tc.name testFontDeep0555
     * @tc.desc Verify baseline snapping toggles back to its default state.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0555', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0555 begin');
      await runCase('testFontDeep0555', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        font.setBaselineSnap(true);
        font.setBaselineSnap(false);
        expect(font.isBaselineSnap()).assertFalse();
        expect(font.getMetrics().descent > 0).assertTrue();
        expect(font.measureSingleCharacter('S') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0555 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0556
     * @tc.name testFontDeep0556
     * @tc.desc Verify two fonts can hold opposite embedded bitmap states.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0556', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0556 begin');
      await runCase('testFontDeep0556', async () => {
        const on: drawing.Font = new drawing.Font();
        on.setSize(30);
        on.setEmbeddedBitmaps(true);
        const off: drawing.Font = new drawing.Font();
        off.setSize(30);
        expect(on.isEmbeddedBitmaps()).assertTrue();
        expect(off.isEmbeddedBitmaps()).assertFalse();
        expect(on.getMetrics().bottom).assertEqual(off.getMetrics().bottom);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0556 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0557
     * @tc.name testFontDeep0557
     * @tc.desc Verify force auto hinting combines with anti alias edging.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0557', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0557 begin');
      await runCase('testFontDeep0557', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(44);
        font.setForceAutoHinting(true);
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        expect(font.isForceAutoHinting()).assertTrue();
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ANTI_ALIAS);
        expect(font.measureText('Auto', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0557 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0558
     * @tc.name testFontDeep0558
     * @tc.desc Verify theme following leaves the applied typeface family alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0558', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0558 begin');
      await runCase('testFontDeep0558', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(36);
        const family: string = font.getTypeface().getFamilyName();
        font.setThemeFontFollowed(true);
        expect(font.getTypeface().getFamilyName()).assertEqual(family);
        expect(font.isThemeFontFollowed()).assertTrue();
        expect(family.length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0558 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0559
     * @tc.name testFontDeep0559
     * @tc.desc Verify disabling every style switch restores all defaults.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0559', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0559 begin');
      await runCase('testFontDeep0559', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(34);
        font.enableSubpixel(true);
        font.enableEmbolden(true);
        font.enableLinearMetrics(true);
        font.enableSubpixel(false);
        font.enableEmbolden(false);
        font.enableLinearMetrics(false);
        expect(font.isSubpixel()).assertFalse();
        expect(font.isEmbolden()).assertFalse();
        expect(font.isLinearMetrics()).assertFalse();
        expect(font.getScaleX()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0559 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0560
     * @tc.name testFontDeep0560
     * @tc.desc Verify two fresh fonts share the same default typeface family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0560', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0560 begin');
      await runCase('testFontDeep0560', async () => {
        const first: drawing.Font = new drawing.Font();
        first.setSize(28);
        const second: drawing.Font = new drawing.Font();
        second.setSize(28);
        expect(second.getTypeface().getFamilyName()).assertEqual(first.getTypeface().getFamilyName());
        expect(first.getTypeface().isBold()).assertFalse();
        expect(first.measureSingleCharacter('T') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0560 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0561
     * @tc.name testFontDeep0561
     * @tc.desc Verify a glyph outline widens when the font size doubles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0561', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0561 begin');
      await runCase('testFontDeep0561', async () => {
        const small: drawing.Font = new drawing.Font();
        small.setSize(30);
        const large: drawing.Font = new drawing.Font();
        large.setSize(60);
        const smallOutline: drawing.Path = small.createPathForGlyph(small.textToGlyphs('K')[0]);
        const largeOutline: drawing.Path = large.createPathForGlyph(large.textToGlyphs('K')[0]);
        expect(largeOutline.getBounds().right > smallOutline.getBounds().right).assertTrue();
        expect(largeOutline.getLength(false) > smallOutline.getLength(false)).assertTrue();
        expect(smallOutline.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0561 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0562
     * @tc.name testFontDeep0562
     * @tc.desc Verify the text path length grows with the requested size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0562', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0562 begin');
      await runCase('testFontDeep0562', async () => {
        const small: drawing.Font = new drawing.Font();
        small.setSize(40);
        const large: drawing.Font = new drawing.Font();
        large.setSize(80);
        const smallPath: drawing.Path = small.getTextPath('Length', 6, 0, 150);
        const largePath: drawing.Path = large.getTextPath('Length', 6, 0, 150);
        expect(largePath.getLength(false) > smallPath.getLength(false)).assertTrue();
        expect(largePath.getBounds().right > smallPath.getBounds().right).assertTrue();
        expect(smallPath.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0562 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0563
     * @tc.name testFontDeep0563
     * @tc.desc Verify the glyph outline and the single character path agree in height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0563', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0563 begin');
      await runCase('testFontDeep0563', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const ids: number[] = font.textToGlyphs('H');
        const glyph: drawing.Path = font.createPathForGlyph(ids[0]);
        const text: drawing.Path = font.getTextPath('H', 1, 0, 100);
        const glyphHeight: number = glyph.getBounds().bottom - glyph.getBounds().top;
        const textHeight: number = text.getBounds().bottom - text.getBounds().top;
        expect(Math.abs(glyphHeight - textHeight) < glyphHeight * 0.2).assertTrue();
        expect(glyphHeight > 20).assertTrue();
        expect(glyph.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0563 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0564
     * @tc.name testFontDeep0564
     * @tc.desc Verify a glyph box stays inside the vertical metrics window.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0564', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0564 begin');
      await runCase('testFontDeep0564', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(72);
        const boxes: common2D.Rect[] = font.getBounds(font.textToGlyphs('H'));
        const window: number = font.getMetrics().bottom - font.getMetrics().top;
        const boxHeight: number = boxes[0].bottom - boxes[0].top;
        expect(boxHeight > 0).assertTrue();
        expect(boxHeight <= window).assertTrue();
        expect(boxes[0].right > boxes[0].left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0564 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0565
     * @tc.name testFontDeep0565
     * @tc.desc Verify digit counting matches the glyph conversion for five digits.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0565', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0565 begin');
      await runCase('testFontDeep0565', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(44);
        expect(font.countText('12345')).assertEqual(5);
        expect(font.textToGlyphs('12345').length).assertEqual(5);
        expect(font.measureText('12345', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0565 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0566
     * @tc.name testFontDeep0566
     * @tc.desc Verify a space glyph keeps a positive advance width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0566', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0566 begin');
      await runCase('testFontDeep0566', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(50);
        const ids: number[] = font.textToGlyphs(' ');
        expect(ids.length).assertEqual(1);
        expect(font.getWidths(ids)[0] > 0).assertTrue();
        expect(font.measureText(' ', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0566 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0567
     * @tc.name testFontDeep0567
     * @tc.desc Verify the narrow letter advances less than the wide letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0567', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0567 begin');
      await runCase('testFontDeep0567', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const narrow: number = font.measureText('i', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const wide: number = font.measureText('W', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(narrow > 0).assertTrue();
        expect(narrow < wide).assertTrue();
        expect(wide > narrow * 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0567 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0568
     * @tc.name testFontDeep0568
     * @tc.desc Verify the uppercase alphabet converts into positive glyph ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0568', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0568 begin');
      await runCase('testFontDeep0568', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const ids: number[] = font.textToGlyphs('ABCDEFGHIJ');
        expect(ids.length).assertEqual(10);
        expect(ids[0] >= 0).assertTrue();
        expect(font.measureText('ABCDEFGHIJ', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0568 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0569
     * @tc.name testFontDeep0569
     * @tc.desc Verify sixteen repeated letters scale the advance sixteen times.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0569', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0569 begin');
      await runCase('testFontDeep0569', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(32);
        const one: number = font.measureText('a', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const sixteen: number = font.measureText('aaaaaaaaaaaaaaaa', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(sixteen - one * 16) < one * 3).assertTrue();
        expect(font.countText('aaaaaaaaaaaaaaaa')).assertEqual(16);
        expect(one > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0569 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0570
     * @tc.name testFontDeep0570
     * @tc.desc Verify a triple horizontal scale triples the advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0570', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0570 begin');
      await runCase('testFontDeep0570', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(36);
        const base: number = font.measureText('Triple', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setScaleX(3);
        const scaled: number = font.measureText('Triple', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(scaled / base - 3) < 0.3).assertTrue();
        expect(scaled > base * 2.5).assertTrue();
        expect(font.getScaleX()).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0570 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0571
     * @tc.name testFontDeep0571
     * @tc.desc Verify a quarter horizontal scale quarters the advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0571', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0571 begin');
      await runCase('testFontDeep0571', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(58);
        const base: number = font.measureText('Quarter', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setScaleX(0.25);
        const scaled: number = font.measureText('Quarter', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(scaled / base - 0.25) < 0.05).assertTrue();
        expect(scaled < base * 0.4).assertTrue();
        expect(font.getScaleX()).assertEqual(0.25);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0571 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0572
     * @tc.name testFontDeep0572
     * @tc.desc Verify a zero skew keeps the measured advance untouched.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0572', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0572 begin');
      await runCase('testFontDeep0572', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const before: number = font.measureText('Flat', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setSkewX(0);
        expect(font.getSkewX()).assertEqual(0);
        expect(font.measureText('Flat', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(before);
        expect(before > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0572 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0573
     * @tc.name testFontDeep0573
     * @tc.desc Verify a negative skew factor round trips on the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0573', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0573 begin');
      await runCase('testFontDeep0573', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(44);
        font.setSkewX(-0.5);
        expect(font.getSkewX()).assertEqual(-0.5);
        expect(font.getSkewX() < 0).assertTrue();
        expect(font.measureSingleCharacter('N') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0573 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0574
     * @tc.name testFontDeep0574
     * @tc.desc Verify a two hundred pixel font keeps a tall metrics window.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0574', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0574 begin');
      await runCase('testFontDeep0574', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(200);
        const metrics: drawing.FontMetrics = font.getMetrics();
        expect(metrics.bottom).assertClose(54.20000076293945, 0.01);
        expect(metrics.ascent < -50).assertTrue();
        expect(font.measureText('Big', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0574 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0575
     * @tc.name testFontDeep0575
     * @tc.desc Verify a forty pixel font reaches above the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0575', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0575 begin');
      await runCase('testFontDeep0575', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const metrics: drawing.FontMetrics = font.getMetrics();
        expect(metrics.top < 0).assertTrue();
        expect(metrics.top <= metrics.ascent).assertTrue();
        expect(metrics.bottom).assertClose(10.84000015258789, 0.01);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0575 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0576
     * @tc.name testFontDeep0576
     * @tc.desc Verify ascent stays negative while descent and bottom stay positive.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0576', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0576 begin');
      await runCase('testFontDeep0576', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(54);
        const metrics: drawing.FontMetrics = font.getMetrics();
        expect(metrics.ascent < 0).assertTrue();
        expect(metrics.descent > 0).assertTrue();
        expect(metrics.bottom > metrics.descent).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0576 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0577
     * @tc.name testFontDeep0577
     * @tc.desc Verify repeated metrics reads return the same values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0577', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0577 begin');
      await runCase('testFontDeep0577', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(42);
        const first: drawing.FontMetrics = font.getMetrics();
        const second: drawing.FontMetrics = font.getMetrics();
        expect(second.top).assertEqual(first.top);
        expect(second.descent).assertEqual(first.descent);
        expect(second.leading).assertEqual(first.leading);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0577 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0578
     * @tc.name testFontDeep0578
     * @tc.desc Verify the metrics window triples with a tripled size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0578', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0578 begin');
      await runCase('testFontDeep0578', async () => {
        const small: drawing.Font = new drawing.Font();
        small.setSize(30);
        const large: drawing.Font = new drawing.Font();
        large.setSize(90);
        const smallHeight: number = small.getMetrics().bottom - small.getMetrics().top;
        const largeHeight: number = large.getMetrics().bottom - large.getMetrics().top;
        expect(Math.abs(largeHeight / smallHeight - 3) < 0.4).assertTrue();
        expect(largeHeight > smallHeight).assertTrue();
        expect(smallHeight > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0578 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0579
     * @tc.name testFontDeep0579
     * @tc.desc Verify an empty feature list measures like the plain call.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0579', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0579 begin');
      await runCase('testFontDeep0579', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const features: drawing.FontFeature[] = [];
        const featured: number = font.measureSingleCharacterWithFeatures('L', features);
        expect(featured).assertEqual(font.measureSingleCharacter('L'));
        expect(font.measureSingleCharacter('L') > 0).assertTrue();
        expect(font.getSize()).assertEqual(48);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0579 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0580
     * @tc.name testFontDeep0580
     * @tc.desc Verify a disabled feature value is accepted by the measurement.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0580', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0580 begin');
      await runCase('testFontDeep0580', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const features: drawing.FontFeature[] = [{ name: 'liga', value: 0 }];
        const width: number = font.measureSingleCharacterWithFeatures('V', features);
        expect(width > 0).assertTrue();
        expect(Math.abs(width - font.measureSingleCharacter('V')) < width * 0.2).assertTrue();
        expect(features.length).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0580 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0581
     * @tc.name testFontDeep0581
     * @tc.desc Verify drawing a single character paints a non empty pixel area.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0581', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0581 begin');
      await runCase('testFontDeep0581', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('M', font, 40, 140);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkAll(buffer) < CANVAS_SIZE * CANVAS_SIZE).assertTrue();
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0581 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0582
     * @tc.name testFontDeep0582
     * @tc.desc Verify the feature aware single character draw also paints ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0582', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0582 begin');
      await runCase('testFontDeep0582', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const features: drawing.FontFeature[] = [{ name: 'kern', value: 1 }];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacterWithFeatures('W', font, 30, 130, features);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 0, 10, CANVAS_SIZE)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0582 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0583
     * @tc.name testFontDeep0583
     * @tc.desc Verify drawing two glyphs at explicit positions paints ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0583', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0583 begin');
      await runCase('testFontDeep0583', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const ids: number[] = font.textToGlyphs('Hi');
        const positions: common2D.Point[] = [point(30, 140), point(100, 140)];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawGlyphs(ids, 0, positions, 0, ids.length, font);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 0, 150, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(ids.length).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0583 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0584
     * @tc.name testFontDeep0584
     * @tc.desc Verify a one glyph draw covers no more ink than the full run.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0584', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0584 begin');
      await runCase('testFontDeep0584', async () => {
        const one: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const all: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(58);
        const ids: number[] = font.textToGlyphs('MM');
        const positions: common2D.Point[] = [point(20, 140), point(100, 140)];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        one.canvas.attachBrush(brush);
        one.canvas.drawGlyphs(ids, 0, positions, 0, 1, font);
        one.canvas.detachBrush();
        all.canvas.attachBrush(brush);
        all.canvas.drawGlyphs(ids, 0, positions, 0, ids.length, font);
        all.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(one.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(all.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(left) < inkAll(right)).assertTrue();
        expect(chanAt(left, 150, 100, 3)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0584 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0585
     * @tc.name testFontDeep0585
     * @tc.desc Verify a text blob draw paints ink inside the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0585', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0585 begin');
      await runCase('testFontDeep0585', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(52);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Blob', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 20, 130);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(blob.bounds().right > 0).assertTrue();
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0585 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0586
     * @tc.name testFontDeep0586
     * @tc.desc Verify a clip confines the painted text blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0586', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0586 begin');
      await runCase('testFontDeep0586', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const clip: drawing.Path = new drawing.Path();
        clip.addRect(ltrb(0, 0, 100, CANVAS_SIZE));
        target.canvas.clipPath(clip);
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Clip', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        target.canvas.drawTextBlob(blob, 10, 140);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkRect(buffer, 100, 0, CANVAS_SIZE, CANVAS_SIZE)).assertEqual(0);
        expect(blob.bounds().right > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0586 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0587
     * @tc.name testFontDeep0587
     * @tc.desc Verify a larger font paints more ink than a smaller one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0587', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0587 begin');
      await runCase('testFontDeep0587', async () => {
        const smallTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const largeTarget: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const smallFont: drawing.Font = new drawing.Font();
        smallFont.setSize(24);
        const largeFont: drawing.Font = new drawing.Font();
        largeFont.setSize(96);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        smallTarget.canvas.attachBrush(brush);
        smallTarget.canvas.drawSingleCharacter('M', smallFont, 20, 150);
        smallTarget.canvas.detachBrush();
        largeTarget.canvas.attachBrush(brush);
        largeTarget.canvas.drawSingleCharacter('M', largeFont, 20, 150);
        largeTarget.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(smallTarget.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(largeTarget.pixelMap);
        expect(inkAll(left) > 0).assertTrue();
        expect(inkAll(right) > inkAll(left)).assertTrue();
        expect(smallFont.getSize()).assertEqual(24);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0587 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0588
     * @tc.name testFontDeep0588
     * @tc.desc Verify a translated canvas moves the text ink to the right half.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0588', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0588 begin');
      await runCase('testFontDeep0588', async () => {
        const plain: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const shifted: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        plain.canvas.attachBrush(brush);
        plain.canvas.drawSingleCharacter('D', font, 10, 140);
        plain.canvas.detachBrush();
        shifted.canvas.translate(100, 0);
        shifted.canvas.attachBrush(brush);
        shifted.canvas.drawSingleCharacter('D', font, 10, 140);
        shifted.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(plain.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(shifted.pixelMap);
        expect(inkRect(left, 0, 0, 60, CANVAS_SIZE) > 0).assertTrue();
        expect(inkRect(right, 0, 0, 60, CANVAS_SIZE)).assertEqual(0);
        expect(inkAll(right) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0588 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0589
     * @tc.name testFontDeep0589
     * @tc.desc Verify drawing the same character twice keeps the same pixel count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0589', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0589 begin');
      await runCase('testFontDeep0589', async () => {
        const once: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const twice: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 255, 0, 0));
        once.canvas.attachBrush(brush);
        once.canvas.drawSingleCharacter('R', font, 30, 140);
        once.canvas.detachBrush();
        twice.canvas.attachBrush(brush);
        twice.canvas.drawSingleCharacter('R', font, 30, 140);
        twice.canvas.drawSingleCharacter('R', font, 30, 140);
        twice.canvas.detachBrush();
        const left: ArrayBuffer = await readPixelBuffer(once.pixelMap);
        const right: ArrayBuffer = await readPixelBuffer(twice.pixelMap);
        expect(inkAll(right)).assertEqual(inkAll(left));
        expect(inkAll(left) > 0).assertTrue();
        expect(once.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0589 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0590
     * @tc.name testFontDeep0590
     * @tc.desc Verify a character drawn below the canvas paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0590', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0590 begin');
      await runCase('testFontDeep0590', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('M', font, 20, 320);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer)).assertEqual(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(CANVAS_SIZE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0590 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0591
     * @tc.name testFontDeep0591
     * @tc.desc Verify an empty glyph id list is rejected as a parameter error.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0591', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0591 begin');
      await runCase('testFontDeep0591', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const ids: number[] = [];
        const positions: common2D.Point[] = [];
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        const rejected: boolean = throwsOn(() => target.canvas.drawGlyphs(ids, 0, positions, 0, 0, font));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(rejected).assertTrue();
        expect(inkAll(buffer)).assertEqual(0);
        expect(target.canvas.getHeight()).assertEqual(CANVAS_SIZE);
        expect(ids.length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0591 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0592
     * @tc.name testFontDeep0592
     * @tc.desc Verify a text blob made from an empty string is rejected and paints nothing.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0592', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0592 begin');
      await runCase('testFontDeep0592', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 255, 0));
        target.canvas.attachBrush(brush);
        const rejected: boolean = throwsOn(() => target.canvas.drawTextBlob(blob, 20, 120));
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(rejected).assertTrue();
        expect(inkAll(buffer)).assertEqual(0);
        expect(font.countText('')).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0592 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0593
     * @tc.name testFontDeep0593
     * @tc.desc Verify filling a text outline path paints a solid glyph shape.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0593', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0593 begin');
      await runCase('testFontDeep0593', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(96);
        const outline: drawing.Path = font.getTextPath('A', 1, 40, 160);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawPath(outline);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 100).assertTrue();
        expect(inkRect(buffer, 0, 0, 10, CANVAS_SIZE)).assertEqual(0);
        expect(outline.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0593 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0594
     * @tc.name testFontDeep0594
     * @tc.desc Verify stroking a text outline path leaves a thin inked trace.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0594', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0594 begin');
      await runCase('testFontDeep0594', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(90);
        const outline: drawing.Path = font.getTextPath('O', 1, 50, 150);
        const pen: drawing.Pen = new drawing.Pen();
        pen.setColor(rgba(255, 0, 255, 0));
        pen.setStrokeWidth(3);
        target.canvas.attachPen(pen);
        target.canvas.drawPath(outline);
        target.canvas.detachPen();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(inkAll(buffer) > 0).assertTrue();
        expect(inkAll(buffer) < 9000).assertTrue();
        expect(outline.getLength(false) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0594 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0595
     * @tc.name testFontDeep0595
     * @tc.desc Verify a doubled matrix doubles the glyph outline bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0595', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0595 begin');
      await runCase('testFontDeep0595', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const ids: number[] = font.textToGlyphs('Z');
        const outline: drawing.Path = font.createPathForGlyph(ids[0]);
        const baseWidth: number = outline.getBounds().right - outline.getBounds().left;
        const zoom: drawing.Matrix = new drawing.Matrix();
        zoom.setScale(2, 2, 0, 0);
        outline.transform(zoom);
        const wideWidth: number = outline.getBounds().right - outline.getBounds().left;
        expect(Math.abs(wideWidth / baseWidth - 2) < 0.1).assertTrue();
        expect(wideWidth > baseWidth).assertTrue();
        expect(baseWidth > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0595 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0596
     * @tc.name testFontDeep0596
     * @tc.desc Verify the text blob box matches the measured advance closely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0596', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0596 begin');
      await runCase('testFontDeep0596', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Box', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const box: common2D.Rect = blob.bounds();
        const measured: number = font.measureText('Box', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(box.right > 0).assertTrue();
        expect(Math.abs(box.right - measured) < measured * 0.5).assertTrue();
        expect(box.bottom > box.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0596 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0597
     * @tc.name testFontDeep0597
     * @tc.desc Verify a text blob reports a non negative unique identifier.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0597', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0597 begin');
      await runCase('testFontDeep0597', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(36);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Id', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(blob.uniqueID() >= 0).assertTrue();
        expect(blob.bounds().right > 0).assertTrue();
        expect(font.countText('Id')).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0597 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0598
     * @tc.name testFontDeep0598
     * @tc.desc Verify three glyph ids each report their own bounding box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0598', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0598 begin');
      await runCase('testFontDeep0598', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(58);
        const ids: number[] = font.textToGlyphs('WMW');
        const boxes: common2D.Rect[] = font.getBounds(ids);
        expect(boxes.length).assertEqual(3);
        expect(boxes[0].right > boxes[0].left).assertTrue();
        expect(boxes[1].bottom > boxes[1].top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0598 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0599
     * @tc.name testFontDeep0599
     * @tc.desc Verify the narrow letter outline stays narrower than the wide one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0599', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0599 begin');
      await runCase('testFontDeep0599', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(70);
        const narrow: drawing.Path = font.getTextPath('i', 1, 0, 120);
        const wide: drawing.Path = font.getTextPath('W', 1, 0, 120);
        const narrowWidth: number = narrow.getBounds().right - narrow.getBounds().left;
        const wideWidth: number = wide.getBounds().right - wide.getBounds().left;
        expect(narrowWidth > 0).assertTrue();
        expect(narrowWidth < wideWidth).assertTrue();
        expect(wide.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0599 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0600
     * @tc.name testFontDeep0600
     * @tc.desc Verify a styled font measures and paints on one shared pipeline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0600', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0600 begin');
      await runCase('testFontDeep0600', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(CANVAS_SIZE, CANVAS_SIZE);
        const font: drawing.Font = new drawing.Font();
        font.setSize(72);
        font.enableSubpixel(true);
        font.enableEmbolden(true);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        font.setHinting(drawing.FontHinting.SLIGHT);
        const width: number = font.measureText('Style', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const brush: drawing.Brush = new drawing.Brush();
        brush.setColor(rgba(255, 0, 0, 255));
        target.canvas.attachBrush(brush);
        target.canvas.drawSingleCharacter('S', font, 20, 160);
        target.canvas.detachBrush();
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(width > 0).assertTrue();
        expect(inkAll(buffer) > 0).assertTrue();
        expect(font.isSubpixel() && font.isEmbolden()).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0600 end');
    });

  });
}
