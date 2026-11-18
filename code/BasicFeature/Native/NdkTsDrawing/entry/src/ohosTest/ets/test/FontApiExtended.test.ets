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
  applyFontStyle,
  applyTypeface,
  createFont,
  glyphBounds,
  glyphIds,
  glyphIdsLimited,
  glyphOutline,
  glyphWidths,
  loadSystemTypeface,
  makeTypefaceFromCurrent,
  snapshotFont,
  textOutline,
  textOutlineWithFallback,
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
 * Sum every advance reported for the glyphs of a string.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { number } Total advance in px.
 */
function advanceSum(text: string, size: number): number {
  const font: drawing.Font = newFont(size);
  const ids: number[] = font.textToGlyphs(text);
  const widths: number[] = font.getWidths(ids);
  let total: number = 0;
  for (let index: number = 0; index < widths.length; index++) {
    total += widths[index];
  }
  return total;
}

export default function fontApiExtendedTest() {
  describe('FontApiExtendedTest', () => {
    /** @tc.number SUB_NdkTsDrawing_FONT_0076
     * @tc.name testFontApi0076
     * @tc.desc Verify a four letter word converts into four glyph ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0076', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0076 begin');
      await runCase('testFontApi0076', async () => {
        const font: drawing.Font = newFont(32);
        const ids: number[] = font.textToGlyphs('abcd');
        expect(ids.length).assertEqual(4);
        expect(font.countText('abcd')).assertEqual(4);
        expect(ids[0] >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0076 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0077
     * @tc.name testFontApi0077
     * @tc.desc Verify a five letter word converts into five glyph ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0077', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0077 begin');
      await runCase('testFontApi0077', async () => {
        const font: drawing.Font = newFont(32);
        const ids: number[] = font.textToGlyphs('abcde');
        expect(ids.length).assertEqual(5);
        expect(ids.length).assertEqual(font.countText('abcde'));
        expect(ids[4] >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0077 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0078
     * @tc.name testFontApi0078
     * @tc.desc Verify a glyph count below the text length is rejected while the exact count converts every glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0078', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0078 begin');
      await runCase('testFontApi0078', async () => {
        const font: drawing.Font = newFont(32);
        const rejected: boolean = throwsOn(() => font.textToGlyphs('abcdef', 2));
        const ids: number[] = font.textToGlyphs('abcdef', 6);
        expect(rejected).assertTrue();
        expect(ids.length).assertEqual(6);
        expect(ids[0]).assertEqual(font.textToGlyphs('abcdef')[0]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0078 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0079
     * @tc.name testFontApi0079
     * @tc.desc Verify a zero glyph count is rejected because it must match the text length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0079', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0079 begin');
      await runCase('testFontApi0079', async () => {
        const font: drawing.Font = newFont(32);
        const rejected: boolean = throwsOn(() => font.textToGlyphs('abcdef', 0));
        expect(rejected).assertTrue();
        expect(font.countText('abcdef')).assertEqual(6);
        expect(font.getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0079 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0080
     * @tc.name testFontApi0080
     * @tc.desc Verify a glyph count above the text length is rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0080', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0080 begin');
      await runCase('testFontApi0080', async () => {
        const font: drawing.Font = newFont(32);
        const rejected: boolean = throwsOn(() => font.textToGlyphs('abc', 100));
        const ids: number[] = font.textToGlyphs('abc', 3);
        expect(rejected).assertTrue();
        expect(ids.length).assertEqual(3);
        expect(font.textToGlyphs('abc').length).assertEqual(ids.length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0080 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0081
     * @tc.name testFontApi0081
     * @tc.desc Verify the same text converts to the same glyph ids twice.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0081', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0081 begin');
      await runCase('testFontApi0081', async () => {
        const font: drawing.Font = newFont(32);
        const first: number[] = font.textToGlyphs('stable');
        const second: number[] = font.textToGlyphs('stable');
        expect(first.length).assertEqual(second.length);
        expect(first[0]).assertEqual(second[0]);
        expect(first[5]).assertEqual(second[5]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0081 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0082
     * @tc.name testFontApi0082
     * @tc.desc Verify two different letters map to different glyph ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0082', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0082 begin');
      await runCase('testFontApi0082', async () => {
        const font: drawing.Font = newFont(32);
        expect(font.textToGlyphs('a')[0] === font.textToGlyphs('b')[0]).assertFalse();
        expect(font.textToGlyphs('a')[0] >= 0).assertTrue();
        expect(font.textToGlyphs('b')[0] >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0082 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0083
     * @tc.name testFontApi0083
     * @tc.desc Verify letter case maps to distinct glyph ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0083', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0083 begin');
      await runCase('testFontApi0083', async () => {
        const font: drawing.Font = newFont(32);
        const upper: number = font.textToGlyphs('A')[0];
        const lower: number = font.textToGlyphs('a')[0];
        expect(upper === lower).assertFalse();
        expect(upper >= 0).assertTrue();
        expect(lower >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0083 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0084
     * @tc.name testFontApi0084
     * @tc.desc Verify every converted glyph id is a non negative number.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0084', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0084 begin');
      await runCase('testFontApi0084', async () => {
        const font: drawing.Font = newFont(32);
        const ids: number[] = font.textToGlyphs('Glyph');
        let nonNegative: number = 0;
        for (let index: number = 0; index < ids.length; index++) {
          if (ids[index] >= 0) {
            nonNegative += 1;
          }
        }
        expect(nonNegative).assertEqual(ids.length);
        expect(ids.length).assertEqual(5);
        expect(nonNegative > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0084 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0085
     * @tc.name testFontApi0085
     * @tc.desc Verify the ten digits convert into ten distinct glyph ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0085', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0085 begin');
      await runCase('testFontApi0085', async () => {
        const font: drawing.Font = newFont(32);
        const ids: number[] = font.textToGlyphs('0123456789');
        const distinct: number[] = [];
        for (let index: number = 0; index < ids.length; index++) {
          if (distinct.indexOf(ids[index]) < 0) {
            distinct.push(ids[index]);
          }
        }
        expect(ids.length).assertEqual(10);
        expect(distinct.length).assertEqual(10);
        expect(font.countText('0123456789')).assertEqual(10);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0085 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0086
     * @tc.name testFontApi0086
     * @tc.desc Verify the main glyph helper matches the raw conversion.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0086', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0086 begin');
      await runCase('testFontApi0086', async () => {
        const ids: number[] = glyphIds('helper');
        const font: drawing.Font = newFont(32);
        const raw: number[] = font.textToGlyphs('helper');
        expect(ids.length).assertEqual(raw.length);
        expect(ids[0]).assertEqual(raw[0]);
        expect(ids.length).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0086 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0087
     * @tc.name testFontApi0087
     * @tc.desc Verify the limited glyph helper rejects a count that differs from the shaped glyphs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0087', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0087 begin');
      await runCase('testFontApi0087', async () => {
        const rejected: boolean = throwsOn(() => glyphIdsLimited('abcdefgh', 3));
        const limited: number[] = glyphIdsLimited('abcdefgh', 8);
        expect(rejected).assertTrue();
        expect(limited.length).assertEqual(glyphIds('abcdefgh').length);
        expect(limited[0]).assertEqual(glyphIds('abcdefgh')[0]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0087 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0088
     * @tc.name testFontApi0088
     * @tc.desc Verify a space still counts as one character and one glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0088', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0088 begin');
      await runCase('testFontApi0088', async () => {
        const font: drawing.Font = newFont(32);
        expect(font.countText(' ')).assertEqual(1);
        expect(font.textToGlyphs(' ').length).assertEqual(1);
        expect(font.measureText(' ', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0088 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0089
     * @tc.name testFontApi0089
     * @tc.desc Verify the limited helper rejects counts that differ from the shaped glyph count.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0089', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0089 begin');
      await runCase('testFontApi0089', async () => {
        const rejectedMismatch: boolean = throwsOn(() => glyphIdsLimited('ab', 0));
        const rejectedEmpty: boolean = throwsOn(() => glyphIdsLimited('', 5));
        expect(rejectedMismatch).assertTrue();
        expect(rejectedEmpty).assertTrue();
        expect(glyphIds('').length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0089 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0090
     * @tc.name testFontApi0090
     * @tc.desc Verify a long run of letters converts one glyph per character.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0090', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0090 begin');
      await runCase('testFontApi0090', async () => {
        const text: string = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijkl';
        const ids: number[] = glyphIds(text);
        expect(text.length).assertEqual(64);
        expect(ids.length).assertEqual(64);
        expect(ids[63] >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0090 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0091
     * @tc.name testFontApi0091
     * @tc.desc Verify the width array carries one entry per glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0091', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0091 begin');
      await runCase('testFontApi0091', async () => {
        const font: drawing.Font = newFont(32);
        const ids: number[] = font.textToGlyphs('width');
        const widths: number[] = font.getWidths(ids);
        expect(widths.length).assertEqual(ids.length);
        expect(widths.length).assertEqual(5);
        expect(widths[0] > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0091 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0092
     * @tc.name testFontApi0092
     * @tc.desc Verify every letter advance is positive.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0092', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0092 begin');
      await runCase('testFontApi0092', async () => {
        const font: drawing.Font = newFont(32);
        const widths: number[] = font.getWidths(font.textToGlyphs('letters'));
        let positive: number = 0;
        for (let index: number = 0; index < widths.length; index++) {
          if (widths[index] > 0) {
            positive += 1;
          }
        }
        expect(positive).assertEqual(widths.length);
        expect(widths.length).assertEqual(7);
        expect(positive > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0092 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0093
     * @tc.name testFontApi0093
     * @tc.desc Verify the advance sum matches the measured string width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0093', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0093 begin');
      await runCase('testFontApi0093', async () => {
        const font: drawing.Font = newFont(32);
        const total: number = advanceSum('abc', 32);
        const measured: number = font.measureText('abc', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(total - measured) < measured * 0.1).assertTrue();
        expect(total > 0).assertTrue();
        expect(measured > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0093 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0094
     * @tc.name testFontApi0094
     * @tc.desc Verify a wide letter advances further than a narrow one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0094', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0094 begin');
      await runCase('testFontApi0094', async () => {
        const font: drawing.Font = newFont(32);
        const wide: number = font.getWidths(font.textToGlyphs('W'))[0];
        const narrow: number = font.getWidths(font.textToGlyphs('i'))[0];
        expect(wide > narrow).assertTrue();
        expect(narrow > 0).assertTrue();
        expect(wide > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0094 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0095
     * @tc.name testFontApi0095
     * @tc.desc Verify repeated identical letters report identical advances.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0095', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0095 begin');
      await runCase('testFontApi0095', async () => {
        const font: drawing.Font = newFont(24);
        const widths: number[] = font.getWidths(font.textToGlyphs('aaa'));
        expect(widths.length).assertEqual(3);
        expect(widths[0]).assertEqual(widths[1]);
        expect(widths[1]).assertEqual(widths[2]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0095 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0096
     * @tc.name testFontApi0096
     * @tc.desc Verify the glyph bounds array carries one rectangle per glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0096', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0096 begin');
      await runCase('testFontApi0096', async () => {
        const font: drawing.Font = newFont(32);
        const ids: number[] = font.textToGlyphs('box');
        const rects: common2D.Rect[] = font.getBounds(ids);
        expect(rects.length).assertEqual(ids.length);
        expect(rects.length).assertEqual(3);
        expect(rects[0].right > rects[0].left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0096 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0097
     * @tc.name testFontApi0097
     * @tc.desc Verify a letter box has a positive width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0097', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0097 begin');
      await runCase('testFontApi0097', async () => {
        const font: drawing.Font = newFont(32);
        const rects: common2D.Rect[] = font.getBounds(font.textToGlyphs('A'));
        expect(rects[0].right > rects[0].left).assertTrue();
        expect(rects[0].right - rects[0].left < 32).assertTrue();
        expect(rects[0].left >= -2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0097 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0098
     * @tc.name testFontApi0098
     * @tc.desc Verify a letter box has a positive height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0098', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0098 begin');
      await runCase('testFontApi0098', async () => {
        const font: drawing.Font = newFont(32);
        const rects: common2D.Rect[] = font.getBounds(font.textToGlyphs('B'));
        expect(rects[0].bottom > rects[0].top).assertTrue();
        expect(rects[0].bottom - rects[0].top > 10).assertTrue();
        expect(rects[0].bottom - rects[0].top < 48).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0098 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0099
     * @tc.name testFontApi0099
     * @tc.desc Verify the flat bounds helper emits four numbers per glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0099', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0099 begin');
      await runCase('testFontApi0099', async () => {
        const flat: number[] = glyphBounds('abc', 32);
        expect(flat.length).assertEqual(12);
        expect(flat[2] > flat[0]).assertTrue();
        expect(flat[3] > flat[1]).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0099 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0100
     * @tc.name testFontApi0100
     * @tc.desc Verify the flat bounds helper returns nothing for empty text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0100', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0100 begin');
      await runCase('testFontApi0100', async () => {
        expect(glyphBounds('', 32).length).assertEqual(0);
        expect(glyphBounds('a', 32).length).assertEqual(4);
        expect(glyphBounds('ab', 32).length).assertEqual(8);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0100 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0101
     * @tc.name testFontApi0101
     * @tc.desc Verify the glyph box grows with the text size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0101', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0101 begin');
      await runCase('testFontApi0101', async () => {
        const small: number[] = glyphBounds('H', 16);
        const large: number[] = glyphBounds('H', 64);
        expect(large[3] - large[1] > small[3] - small[1]).assertTrue();
        expect(large[2] - large[0] > small[2] - small[0]).assertTrue();
        expect(small[2] > small[0]).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0101 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0102
     * @tc.name testFontApi0102
     * @tc.desc Verify advances grow with the text size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0102', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0102 begin');
      await runCase('testFontApi0102', async () => {
        const font: drawing.Font = newFont(16);
        const small: number[] = font.getWidths(font.textToGlyphs('Scale'));
        font.setSize(48);
        const large: number[] = font.getWidths(font.textToGlyphs('Scale'));
        expect(large[0] > small[0]).assertTrue();
        expect(large.length).assertEqual(small.length);
        expect(small[0] > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0102 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0103
     * @tc.name testFontApi0103
     * @tc.desc Verify the main width helper agrees with the raw advance array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0103', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0103 begin');
      await runCase('testFontApi0103', async () => {
        const helper: number[] = glyphWidths('size');
        const font: drawing.Font = newFont(32);
        const raw: number[] = font.getWidths(font.textToGlyphs('size'));
        expect(helper.length).assertEqual(raw.length);
        expect(helper[0]).assertEqual(raw[0]);
        expect(helper.length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0103 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0104
     * @tc.name testFontApi0104
     * @tc.desc Verify the main width helper returns nothing for empty text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0104', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0104 begin');
      await runCase('testFontApi0104', async () => {
        expect(glyphWidths('')).assertUndefined();
        expect(glyphWidths('ab').length).assertEqual(2);
        expect(glyphWidths('ab')[0] > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0104 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0105
     * @tc.name testFontApi0105
     * @tc.desc Verify a glyph outline path is not empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0105', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0105 begin');
      await runCase('testFontApi0105', async () => {
        const path: drawing.Path = glyphOutline('A', 32, 0);
        expect(path.isEmpty()).assertFalse();
        expect(path.getLength(false) > 0).assertTrue();
        expect(path.getVerbData().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0105 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0106
     * @tc.name testFontApi0106
     * @tc.desc Verify the second glyph outline is also populated.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0106', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0106 begin');
      await runCase('testFontApi0106', async () => {
        const first: drawing.Path = glyphOutline('AB', 32, 0);
        const second: drawing.Path = glyphOutline('AB', 32, 1);
        expect(first.isEmpty()).assertFalse();
        expect(second.isEmpty()).assertFalse();
        expect(second.getPointData().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0106 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0107
     * @tc.name testFontApi0107
     * @tc.desc Verify a negative glyph index yields an empty outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0107', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0107 begin');
      await runCase('testFontApi0107', async () => {
        const path: drawing.Path = glyphOutline('A', 32, -1);
        expect(path.isEmpty()).assertTrue();
        expect(path.getLength(false)).assertEqual(0);
        expect(glyphOutline('A', 32, 0).isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0107 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0108
     * @tc.name testFontApi0108
     * @tc.desc Verify an index past the glyph count yields an empty outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0108', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0108 begin');
      await runCase('testFontApi0108', async () => {
        const path: drawing.Path = glyphOutline('A', 32, 1);
        expect(path.isEmpty()).assertTrue();
        expect(path.getBounds().right).assertEqual(0);
        expect(glyphOutline('AB', 32, 1).isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0108 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0109
     * @tc.name testFontApi0109
     * @tc.desc Verify the glyph outline height sits inside the em box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0109', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0109 begin');
      await runCase('testFontApi0109', async () => {
        const bounds: common2D.Rect = glyphOutline('H', 32, 0).getBounds();
        expect(bounds.bottom - bounds.top > 10).assertTrue();
        expect(bounds.bottom - bounds.top < 40).assertTrue();
        expect(bounds.right > bounds.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0109 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0110
     * @tc.name testFontApi0110
     * @tc.desc Verify a round glyph outline carries real curve length.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0110', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0110 begin');
      await runCase('testFontApi0110', async () => {
        const path: drawing.Path = glyphOutline('o', 32, 0);
        expect(path.getLength(false) > 20).assertTrue();
        expect(path.getVerbData()[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0110 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0111
     * @tc.name testFontApi0111
     * @tc.desc Verify the text outline path is populated for a single letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0111', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0111 begin');
      await runCase('testFontApi0111', async () => {
        const path: drawing.Path = textOutline('A', 32);
        expect(path.isEmpty()).assertFalse();
        expect(path.getBounds().right > 0).assertTrue();
        expect(path.getLength(false) > 10).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0111 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0112
     * @tc.name testFontApi0112
     * @tc.desc Verify the text outline starts at the requested horizontal origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0112', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0112 begin');
      await runCase('testFontApi0112', async () => {
        const bounds: common2D.Rect = textOutline('H', 32).getBounds();
        expect(bounds.left >= 9).assertTrue();
        expect(bounds.left < 20).assertTrue();
        expect(bounds.right < 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0112 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0113
     * @tc.name testFontApi0113
     * @tc.desc Verify the text outline sits above the baseline at y one hundred.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0113', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0113 begin');
      await runCase('testFontApi0113', async () => {
        const bounds: common2D.Rect = textOutline('H', 32).getBounds();
        expect(bounds.top < 100).assertTrue();
        expect(bounds.bottom <= 101).assertTrue();
        expect(bounds.bottom > 70).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0113 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0114
     * @tc.name testFontApi0114
     * @tc.desc Verify two letters outline wider than one letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0114', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0114 begin');
      await runCase('testFontApi0114', async () => {
        const one: common2D.Rect = textOutline('A', 32).getBounds();
        const two: common2D.Rect = textOutline('AB', 32).getBounds();
        expect(two.right > one.right).assertTrue();
        expect(Math.round(two.left)).assertEqual(Math.round(one.left));
        expect(two.bottom > two.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0114 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0115
     * @tc.name testFontApi0115
     * @tc.desc Verify the fallback outline variant is populated as well.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0115', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0115 begin');
      await runCase('testFontApi0115', async () => {
        const path: drawing.Path = textOutlineWithFallback('AB', 32);
        expect(path.isEmpty()).assertFalse();
        expect(path.getBounds().right > 0).assertTrue();
        expect(path.getBounds().bottom > path.getBounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0115 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0116
     * @tc.name testFontApi0116
     * @tc.desc Verify the fallback outline keeps the same width as the plain outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0116', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0116 begin');
      await runCase('testFontApi0116', async () => {
        const plain: common2D.Rect = textOutline('AB', 32).getBounds();
        const fallback: common2D.Rect = textOutlineWithFallback('AB', 32).getBounds();
        expect(Math.abs(fallback.right - plain.right) < 2).assertTrue();
        expect(Math.abs(fallback.bottom - plain.bottom) < 2).assertTrue();
        expect(fallback.right > fallback.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0116 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0117
     * @tc.name testFontApi0117
     * @tc.desc Verify an empty string yields an empty text outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0117', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0117 begin');
      await runCase('testFontApi0117', async () => {
        expect(textOutline('', 32).isEmpty()).assertTrue();
        expect(textOutlineWithFallback('', 32).isEmpty()).assertTrue();
        expect(textOutline('', 32).getLength(false)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0117 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0118
     * @tc.name testFontApi0118
     * @tc.desc Verify a larger size produces a taller text outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0118', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0118 begin');
      await runCase('testFontApi0118', async () => {
        const small: common2D.Rect = textOutline('H', 16).getBounds();
        const large: common2D.Rect = textOutline('H', 64).getBounds();
        expect(large.bottom - large.top > small.bottom - small.top).assertTrue();
        expect(large.right - large.left > small.right - small.left).assertTrue();
        expect(small.bottom > small.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0118 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0119
     * @tc.name testFontApi0119
     * @tc.desc Verify the default typeface reports a non empty family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0119', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0119 begin');
      await runCase('testFontApi0119', async () => {
        const typeface: drawing.Typeface = newFont(32).getTypeface();
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0119 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0120
     * @tc.name testFontApi0120
     * @tc.desc Verify two fresh fonts share the same default family.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0120', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0120 begin');
      await runCase('testFontApi0120', async () => {
        const first: string = newFont(16).getTypeface().getFamilyName();
        const second: string = newFont(48).getTypeface().getFamilyName();
        expect(first).assertEqual(second);
        expect(first.length > 0).assertTrue();
        expect(first).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0120 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0121
     * @tc.name testFontApi0121
     * @tc.desc Verify the typeface apply helper confirms the family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0121', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0121 begin');
      await runCase('testFontApi0121', async () => {
        const font: drawing.Font = newFont(32);
        const family: string = applyTypeface(font);
        expect(family.length > 0).assertTrue();
        expect(family).assertEqual(font.getTypeface().getFamilyName());
        expect(font.getSize()).assertEqual(32);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0121 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0122
     * @tc.name testFontApi0122
     * @tc.desc Verify the variation based typeface keeps the base family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0122', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0122 begin');
      await runCase('testFontApi0122', async () => {
        const varied: drawing.Typeface = makeTypefaceFromCurrent();
        const base: drawing.Typeface = loadSystemTypeface();
        expect(varied.getFamilyName().length > 0).assertTrue();
        expect(varied.getFamilyName()).assertEqual(base.getFamilyName());
        expect(varied.isBold()).assertEqual(base.isBold());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0122 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0123
     * @tc.name testFontApi0123
     * @tc.desc Verify a font keeps measuring text after a typeface swap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0123', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0123 begin');
      await runCase('testFontApi0123', async () => {
        const font: drawing.Font = newFont(30);
        font.setTypeface(loadSystemTypeface());
        expect(font.measureText('Swap', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
        expect(font.textToGlyphs('Swap').length).assertEqual(4);
        expect(font.getTypeface().getFamilyName().length > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0123 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0124
     * @tc.name testFontApi0124
     * @tc.desc Verify the font snapshot mirrors the typeface family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0124', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0124 begin');
      await runCase('testFontApi0124', async () => {
        const font: drawing.Font = newFont(30);
        const snapshot: FontSnapshot = snapshotFont(font);
        const typeface: drawing.Typeface = font.getTypeface();
        expect(snapshot.familyName).assertEqual(typeface.getFamilyName());
        expect(snapshot.bold).assertEqual(typeface.isBold());
        expect(snapshot.italic).assertEqual(typeface.isItalic());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0124 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0125
     * @tc.name testFontApi0125
     * @tc.desc Verify two fonts sharing a typeface keep separate sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0125', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0125 begin');
      await runCase('testFontApi0125', async () => {
        const shared: drawing.Typeface = loadSystemTypeface();
        const small: drawing.Font = newFont(12);
        const large: drawing.Font = newFont(48);
        small.setTypeface(shared);
        large.setTypeface(shared);
        expect(small.getSize()).assertEqual(12);
        expect(large.getSize()).assertEqual(48);
        expect(small.getTypeface().getFamilyName()).assertEqual(large.getTypeface().getFamilyName());
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0125 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0126
     * @tc.name testFontApi0126
     * @tc.desc Verify the snapshot reports the size configured by the main helper.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0126', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0126 begin');
      await runCase('testFontApi0126', async () => {
        const snapshot: FontSnapshot = snapshotFont(createFont(42));
        expect(snapshot.size).assertEqual(42);
        expect(snapshot.familyName.length > 0).assertTrue();
        expect(snapshot.scaleX).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0126 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0127
     * @tc.name testFontApi0127
     * @tc.desc Verify the snapshot reports the default horizontal scale.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testFontApi0127', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0127 begin');
      await runCase('testFontApi0127', async () => {
        const snapshot: FontSnapshot = snapshotFont(newFont(20));
        expect(snapshot.scaleX).assertEqual(1);
        expect(snapshot.skewX).assertEqual(0);
        expect(snapshot.subpixel).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0127 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0128
     * @tc.name testFontApi0128
     * @tc.desc Verify the snapshot reports the default edging and hinting modes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0128', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0128 begin');
      await runCase('testFontApi0128', async () => {
        const snapshot: FontSnapshot = snapshotFont(newFont(20));
        expect(snapshot.edging).assertEqual(1);
        expect(snapshot.hinting).assertEqual(2);
        expect(snapshot.themeFollowed).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0128 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0129
     * @tc.name testFontApi0129
     * @tc.desc Verify the snapshot follows a manual subpixel switch.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0129', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0129 begin');
      await runCase('testFontApi0129', async () => {
        const font: drawing.Font = newFont(20);
        font.enableSubpixel(true);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.subpixel).assertTrue();
        expect(snapshot.embolden).assertFalse();
        expect(snapshot.linearMetrics).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0129 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0130
     * @tc.name testFontApi0130
     * @tc.desc Verify the snapshot follows a manual hinting switch.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0130', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0130 begin');
      await runCase('testFontApi0130', async () => {
        const font: drawing.Font = newFont(20);
        font.setHinting(drawing.FontHinting.FULL);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.hinting).assertEqual(drawing.FontHinting.FULL);
        expect(snapshot.edging).assertEqual(1);
        expect(snapshot.size).assertEqual(20);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0130 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0131
     * @tc.name testFontApi0131
     * @tc.desc Verify the style bundle turns the three render flags on in the snapshot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0131', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0131 begin');
      await runCase('testFontApi0131', async () => {
        const font: drawing.Font = newFont(26);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.subpixel).assertTrue();
        expect(snapshot.embolden).assertTrue();
        expect(snapshot.linearMetrics).assertTrue();
        expect(snapshot.size).assertEqual(26);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0131 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0132
     * @tc.name testFontApi0132
     * @tc.desc Verify the style bundle applies the horizontal scale in the snapshot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0132', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0132 begin');
      await runCase('testFontApi0132', async () => {
        const font: drawing.Font = newFont(26);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.scaleX > 1.05).assertTrue();
        expect(snapshot.scaleX < 1.15).assertTrue();
        expect(snapshot.scaleX > 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0132 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0133
     * @tc.name testFontApi0133
     * @tc.desc Verify the style bundle applies the skew in the snapshot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0133', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0133 begin');
      await runCase('testFontApi0133', async () => {
        const font: drawing.Font = newFont(26);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.skewX > 0.05).assertTrue();
        expect(snapshot.skewX < 0.15).assertTrue();
        expect(snapshot.skewX > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0133 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0134
     * @tc.name testFontApi0134
     * @tc.desc Verify the style bundle applies edging and hinting in the snapshot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0134', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0134 begin');
      await runCase('testFontApi0134', async () => {
        const font: drawing.Font = newFont(26);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.edging).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(snapshot.hinting).assertEqual(drawing.FontHinting.FULL);
        expect(snapshot.size).assertEqual(26);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0134 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0135
     * @tc.name testFontApi0135
     * @tc.desc Verify the style bundle applies the three layout flags in the snapshot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0135', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0135 begin');
      await runCase('testFontApi0135', async () => {
        const font: drawing.Font = newFont(26);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.baselineSnap).assertTrue();
        expect(snapshot.embeddedBitmaps).assertTrue();
        expect(snapshot.forceAutoHinting).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0135 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0136
     * @tc.name testFontApi0136
     * @tc.desc Verify the style bundle stops following the theme font in the snapshot.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0136', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0136 begin');
      await runCase('testFontApi0136', async () => {
        const font: drawing.Font = newFont(26);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.themeFollowed).assertFalse();
        expect(snapshot.familyName.length > 0).assertTrue();
        expect(snapshot.size).assertEqual(26);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0136 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0137
     * @tc.name testFontApi0137
     * @tc.desc Verify the style bundle keeps the typeface family and size intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0137', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0137 begin');
      await runCase('testFontApi0137', async () => {
        const font: drawing.Font = newFont(26);
        const before: string = font.getTypeface().getFamilyName();
        applyFontStyle(font);
        expect(font.getTypeface().getFamilyName()).assertEqual(before);
        expect(font.getSize()).assertEqual(26);
        expect(font.textToGlyphs('Style').length).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0137 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0138
     * @tc.name testFontApi0138
     * @tc.desc Verify a zero size font still carries a usable typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0138', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0138 begin');
      await runCase('testFontApi0138', async () => {
        const font: drawing.Font = createFont(0);
        expect(font.getTypeface().getFamilyName().length > 0).assertTrue();
        expect(font.measureText('A', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(font.textToGlyphs('A').length).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0138 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0139
     * @tc.name testFontApi0139
     * @tc.desc Verify glyph ids stay the same across text sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0139', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0139 begin');
      await runCase('testFontApi0139', async () => {
        const small: drawing.Font = newFont(10);
        const large: drawing.Font = newFont(90);
        const a: number[] = small.textToGlyphs('Q');
        const b: number[] = large.textToGlyphs('Q');
        expect(a.length).assertEqual(1);
        expect(a[0]).assertEqual(b[0]);
        expect(a[0] >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0139 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0140
     * @tc.name testFontApi0140
     * @tc.desc Verify advances double when the size doubles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0140', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0140 begin');
      await runCase('testFontApi0140', async () => {
        const small: number = advanceSum('Q', 16);
        const large: number = advanceSum('Q', 32);
        expect(large / small > 1.9).assertTrue();
        expect(large / small < 2.1).assertTrue();
        expect(small > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0140 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0141
     * @tc.name testFontApi0141
     * @tc.desc Verify a wide glyph outline is longer than a narrow one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0141', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0141 begin');
      await runCase('testFontApi0141', async () => {
        const wide: number = glyphOutline('W', 48, 0).getLength(false);
        const narrow: number = glyphOutline('i', 48, 0).getLength(false);
        expect(wide > narrow).assertTrue();
        expect(narrow > 0).assertTrue();
        expect(wide > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0141 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0142
     * @tc.name testFontApi0142
     * @tc.desc Verify the alphabet outline spans a wide box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0142', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0142 begin');
      await runCase('testFontApi0142', async () => {
        const path: drawing.Path = textOutline('abcdefghijklmnopqrstuvwxyz', 24);
        const bounds: common2D.Rect = path.getBounds();
        expect(bounds.right - bounds.left > 200).assertTrue();
        expect(path.getLength(false)).assertClose(59.930328369140625, 0.01);
        expect(path.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0142 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0143
     * @tc.name testFontApi0143
     * @tc.desc Verify a hundred character outline remains non empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0143', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0143 begin');
      await runCase('testFontApi0143', async () => {
        const text: string = 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
          'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij';
        const path: drawing.Path = textOutline(text, 12);
        expect(text.length).assertEqual(100);
        expect(path.isEmpty()).assertFalse();
        expect(path.getBounds().right > 300).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0143 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0144
     * @tc.name testFontApi0144
     * @tc.desc Verify a descender glyph outline reaches below the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0144', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0144 begin');
      await runCase('testFontApi0144', async () => {
        const bowl: common2D.Rect = glyphOutline('g', 32, 0).getBounds();
        const flat: common2D.Rect = glyphOutline('H', 32, 0).getBounds();
        expect(bowl.bottom > 0).assertTrue();
        expect(bowl.bottom > flat.bottom).assertTrue();
        expect(bowl.top < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0144 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0145
     * @tc.name testFontApi0145
     * @tc.desc Verify the full font pipeline keeps every stage consistent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0145', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0145 begin');
      await runCase('testFontApi0145', async () => {
        const font: drawing.Font = createFont(30);
        applyFontStyle(font);
        const ids: number[] = font.textToGlyphs('Pipe');
        const widths: number[] = font.getWidths(ids);
        const path: drawing.Path = font.getTextPath('Pipe', 4, 0, 0);
        expect(ids.length).assertEqual(4);
        expect(widths.length).assertEqual(4);
        expect(path.isEmpty()).assertFalse();
        expect(path.getBounds().right > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0145 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0146
     * @tc.name testFontApi0146
     * @tc.desc Verify two snapshots of an untouched font agree field by field.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0146', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0146 begin');
      await runCase('testFontApi0146', async () => {
        const font: drawing.Font = newFont(22);
        const first: FontSnapshot = snapshotFont(font);
        const second: FontSnapshot = snapshotFont(font);
        expect(second.size).assertEqual(first.size);
        expect(second.scaleX).assertEqual(first.scaleX);
        expect(second.edging).assertEqual(first.edging);
        expect(second.familyName).assertEqual(first.familyName);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0146 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0147
     * @tc.name testFontApi0147
     * @tc.desc Verify the snapshot family follows an applied typeface.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0147', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0147 begin');
      await runCase('testFontApi0147', async () => {
        const font: drawing.Font = newFont(22);
        const family: string = applyTypeface(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.familyName).assertEqual(family);
        expect(snapshot.bold).assertFalse();
        expect(snapshot.size).assertEqual(22);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0147 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0148
     * @tc.name testFontApi0148
     * @tc.desc Verify single character measurement stays near the glyph advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0148', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0148 begin');
      await runCase('testFontApi0148', async () => {
        const font: drawing.Font = newFont(32);
        const single: number = font.measureSingleCharacter('M');
        const advance: number = font.getWidths(font.textToGlyphs('M'))[0];
        expect(Math.abs(single - advance) < 1).assertTrue();
        expect(single > 0).assertTrue();
        expect(advance > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0148 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0149
     * @tc.name testFontApi0149
     * @tc.desc Verify a glyph box stays inside a plausible em wide range.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontApi0149', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0149 begin');
      await runCase('testFontApi0149', async () => {
        const rects: common2D.Rect[] = newFont(32).getBounds(glyphIds('W'));
        const width: number = rects[0].right - rects[0].left;
        expect(width > 5).assertTrue();
        expect(width < 40).assertTrue();
        expect(rects[0].bottom > rects[0].top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0149 end');
    });

    /** @tc.number SUB_NdkTsDrawing_FONT_0150
     * @tc.name testFontApi0150
     * @tc.desc Verify the extreme size keeps glyph, outline and metrics coherent.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontApi0150', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0150 begin');
      await runCase('testFontApi0150', async () => {
        const font: drawing.Font = createFont(200);
        const metrics: drawing.FontMetrics = font.getMetrics();
        const outline: drawing.Path = font.getTextPath('T', 1, 0, 0);
        expect(metrics.bottom - metrics.top > 150).assertTrue();
        expect(font.getWidths(font.textToGlyphs('T'))[0] > 50).assertTrue();
        expect(outline.getBounds().bottom - outline.getBounds().top > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontApi0150 end');
    });
  });
}
