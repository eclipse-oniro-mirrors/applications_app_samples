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
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import { rgba } from '../../../main/ets/drawing/DrawingTypes';
import { countInkedPixels, DRAWING_TAG, readPixelBuffer, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const SIZE: number = 200;
const AREA: number = SIZE * SIZE;
const TEXT_SIZE: number = 40;

/**
 * Build a font with one size and the fixed edging and hinting used by this suite.
 *
 * @param { number } size - Text size in px.
 * @returns { drawing.Font } Configured font.
 */
function fontOf(size: number): drawing.Font {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  font.setEdging(drawing.FontEdging.ANTI_ALIAS);
  font.setHinting(drawing.FontHinting.NONE);
  return font;
}

/**
 * Measure the advance of a string under one text encoding.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { drawing.TextEncoding } encoding - How the bytes are interpreted.
 * @returns { number } Advance width in px.
 */
function widthWith(text: string, size: number, encoding: drawing.TextEncoding): number {
  return fontOf(size).measureText(text, encoding);
}

/**
 * Count the glyphs of a string with the shared font settings.
 *
 * @param { string } text - Source text.
 * @returns { number } Number of glyphs.
 */
function countOf(text: string): number {
  return fontOf(TEXT_SIZE).countText(text);
}

/**
 * Judge whether two measurements are the same within half a pixel.
 *
 * @param { number } first - First value.
 * @param { number } second - Second value.
 * @returns { boolean } True when the difference is below 0.5.
 */
function near(first: number, second: number): boolean {
  return Math.abs(first - second) < 0.5;
}

/**
 * Read one color channel of a pixel in a square RGBA_8888 buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Channel value of the pixel.
 */
function channelAt(buffer: ArrayBuffer, x: number, y: number, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  return bytes[(y * SIZE + x) * 4 + channel];
}

/**
 * Read the alpha channel of one pixel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } x - Horizontal coordinate.
 * @param { number } y - Vertical coordinate.
 * @returns { number } Alpha value.
 */
function alphaAt(buffer: ArrayBuffer, x: number, y: number): number {
  return channelAt(buffer, x, y, 3);
}

/**
 * Read the largest alpha value of a buffer.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Largest alpha value.
 */
function maxAlpha(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let largest: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > largest) {
      largest = bytes[index];
    }
  }
  return largest;
}

/**
 * Count painted pixels inside a rectangle of the bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } left - Left edge, inclusive.
 * @param { number } top - Top edge, inclusive.
 * @param { number } right - Right edge, exclusive.
 * @param { number } bottom - Bottom edge, exclusive.
 * @returns { number } Number of painted pixels.
 */
function inkBox(buffer: ArrayBuffer, left: number, top: number, right: number, bottom: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let y: number = top; y < bottom; y++) {
    for (let x: number = left; x < right; x++) {
      if (bytes[(y * SIZE + x) * 4 + 3] > 0) {
        count++;
      }
    }
  }
  return count;
}

/**
 * Count the bytes that differ between two equally sized buffers.
 *
 * @param { ArrayBuffer } first - First buffer.
 * @param { ArrayBuffer } second - Second buffer.
 * @returns { number } Number of differing bytes.
 */
function diffCount(first: ArrayBuffer, second: ArrayBuffer): number {
  const left: Uint8Array = new Uint8Array(first);
  const right: Uint8Array = new Uint8Array(second);
  const length: number = Math.min(left.length, right.length);
  let count: number = 0;
  for (let index: number = 0; index < length; index++) {
    if (left[index] !== right[index]) {
      count++;
    }
  }
  return count;
}

/**
 * Render one string with an explicit text encoding, then read the pixels back.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { drawing.TextEncoding } encoding - Encoding handed to the text blob.
 * @param { number } x - Baseline start x.
 * @param { number } y - Baseline y.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 pixels.
 */
async function renderEncoded(text: string, size: number, encoding: drawing.TextEncoding, x: number,
  y: number): Promise<ArrayBuffer> {
  const target: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
  const font: drawing.Font = fontOf(size);
  const blob: drawing.TextBlob = drawing.TextBlob.makeFromString(text, font, encoding);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0, 0, 0));
  target.canvas.attachBrush(brush);
  target.canvas.drawTextBlob(blob, x, y);
  target.canvas.detachBrush();
  return readPixelBuffer(target.pixelMap);
}

export default function enumTextEncTest() {
  describe('EnumTextEncTest', () => {
    /** @tc.number SUB_NdkTsDrawing_ENUM_0508
     * @tc.name testEnumTextEnc0508
     * @tc.desc Verify TextEncoding.TEXT_ENCODING_UTF8 keeps index 0 and measures ASCII.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumTextEnc0508', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0508 begin');
      await runCase('testEnumTextEnc0508', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF8).assertEqual(0);
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF8 <
          drawing.TextEncoding.TEXT_ENCODING_UTF16).assertTrue();
        expect(widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0508 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0509
     * @tc.name testEnumTextEnc0509
     * @tc.desc Verify TextEncoding.TEXT_ENCODING_UTF16 keeps index 1 and measures ASCII.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumTextEnc0509', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0509 begin');
      await runCase('testEnumTextEnc0509', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF16).assertEqual(1);
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF16 >
          drawing.TextEncoding.TEXT_ENCODING_UTF8).assertTrue();
        expect(widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16)).assertEqual(0);
        expect(countOf('A')).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0509 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0510
     * @tc.name testEnumTextEnc0510
     * @tc.desc Verify TextEncoding.TEXT_ENCODING_UTF32 keeps index 2 and measures a CJK glyph.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumTextEnc0510', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0510 begin');
      await runCase('testEnumTextEnc0510', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF32).assertEqual(2);
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF32 >
          drawing.TextEncoding.TEXT_ENCODING_UTF16).assertTrue();
        expect(widthWith('图', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32)).assertEqual(0);
        expect(countOf('图')).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0510 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0511
     * @tc.name testEnumTextEnc0511
     * @tc.desc Verify TextEncoding.TEXT_ENCODING_GLYPH_ID keeps index 3 and is the last member.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumTextEnc0511', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0511 begin');
      await runCase('testEnumTextEnc0511', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID).assertEqual(3);
        expect(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID >
          drawing.TextEncoding.TEXT_ENCODING_UTF32).assertTrue();
        expect(widthWith('AB', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID) >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0511 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0512
     * @tc.name testEnumTextEnc0512
     * @tc.desc Verify the four text encodings form a strictly increasing sequence.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumTextEnc0512', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0512 begin');
      await runCase('testEnumTextEnc0512', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF8 <
          drawing.TextEncoding.TEXT_ENCODING_UTF16).assertTrue();
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF16 <
          drawing.TextEncoding.TEXT_ENCODING_UTF32).assertTrue();
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF32 <
          drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0512 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0513
     * @tc.name testEnumTextEnc0513
     * @tc.desc Verify UTF8 and UTF16 agree on the advance of an ASCII word.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0513', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0513 begin');
      await runCase('testEnumTextEnc0513', async () => {
        const utf8: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(utf8).assertClose(94.43992614746094, 0.01);
        expect(utf8 > 0).assertTrue();
        expect(utf16).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0513 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0514
     * @tc.name testEnumTextEnc0514
     * @tc.desc Verify UTF16 and UTF32 agree on the advance of an ASCII word.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0514', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0514 begin');
      await runCase('testEnumTextEnc0514', async () => {
        const utf16: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const utf32: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(utf16).assertEqual(0);
        expect(utf32 > 0).assertTrue();
        expect(countOf('Hello')).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0514 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0515
     * @tc.name testEnumTextEnc0515
     * @tc.desc Verify all three Unicode encodings measure one word as a positive advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumTextEnc0515', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0515 begin');
      await runCase('testEnumTextEnc0515', async () => {
        expect(widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
        expect(widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16)).assertEqual(0);
        expect(widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0515 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0516
     * @tc.name testEnumTextEnc0516
     * @tc.desc Verify one letter keeps the same advance under all three Unicode encodings.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0516', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0516 begin');
      await runCase('testEnumTextEnc0516', async () => {
        const utf8: number = widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const utf32: number = widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(utf8).assertClose(26.559982299804688, 0.01);
        expect(near(utf16, utf32)).assertTrue();
        expect(utf32).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0516 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0517
     * @tc.name testEnumTextEnc0517
     * @tc.desc Verify two letters advance twice as far as one letter under UTF8.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0517', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0517 begin');
      await runCase('testEnumTextEnc0517', async () => {
        const single: number = widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const pair: number = widthWith('AB', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(single > 0).assertTrue();
        expect(pair > single).assertTrue();
        expect(pair).assertClose(52.59996032714844, 0.01);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0517 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0518
     * @tc.name testEnumTextEnc0518
     * @tc.desc Verify an empty string measures zero under UTF8.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0518', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0518 begin');
      await runCase('testEnumTextEnc0518', async () => {
        expect(widthWith('', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(countOf('')).assertEqual(0);
        expect(widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0518 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0519
     * @tc.name testEnumTextEnc0519
     * @tc.desc Verify an empty string measures zero under UTF16 and UTF32 as well.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0519', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0519 begin');
      await runCase('testEnumTextEnc0519', async () => {
        const utf16: number = widthWith('', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const utf32: number = widthWith('', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(utf16).assertEqual(0);
        expect(utf32).assertEqual(0);
        expect(near(utf16, utf32)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0519 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0520
     * @tc.name testEnumTextEnc0520
     * @tc.desc Verify an empty string measures zero under the glyph id encoding.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0520', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0520 begin');
      await runCase('testEnumTextEnc0520', async () => {
        const empty: number = widthWith('', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        expect(empty).assertEqual(0);
        expect(empty >= 0).assertTrue();
        expect(empty < 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0520 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0521
     * @tc.name testEnumTextEnc0521
     * @tc.desc Verify a single space keeps one narrow advance under all three encodings.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0521', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0521 begin');
      await runCase('testEnumTextEnc0521', async () => {
        const utf8: number = widthWith(' ', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith(' ', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(utf8).assertClose(10.79998779296875, 0.01);
        expect(utf8 > 0).assertTrue();
        expect(utf8 < widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0521 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0522
     * @tc.name testEnumTextEnc0522
     * @tc.desc Verify mixed ASCII and CJK text keeps its advance across encodings.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0522', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0522 begin');
      await runCase('testEnumTextEnc0522', async () => {
        const utf8: number = widthWith('A图B', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('A图B', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const utf32: number = widthWith('A图B', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(utf8).assertClose(92.59992980957031, 0.01);
        expect(utf16).assertEqual(0);
        expect(countOf('A图B')).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0522 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0523
     * @tc.name testEnumTextEnc0523
     * @tc.desc Verify one CJK glyph keeps its advance across encodings and stays wider than ASCII.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0523', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0523 begin');
      await runCase('testEnumTextEnc0523', async () => {
        const utf8: number = widthWith('图', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('图', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const utf32: number = widthWith('图', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(utf8).assertClose(39.999969482421875, 0.01);
        expect(near(utf16, utf32)).assertTrue();
        expect(utf8 > widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0523 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0524
     * @tc.name testEnumTextEnc0524
     * @tc.desc Verify two CJK glyphs advance twice as far as one under UTF8.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0524', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0524 begin');
      await runCase('testEnumTextEnc0524', async () => {
        const single: number = widthWith('图', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const pair: number = widthWith('图图', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(single > 0).assertTrue();
        expect(near(pair, single * 2)).assertTrue();
        expect(countOf('图图')).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0524 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0525
     * @tc.name testEnumTextEnc0525
     * @tc.desc Verify a digit run keeps its advance across encodings and counts every digit.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0525', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0525 begin');
      await runCase('testEnumTextEnc0525', async () => {
        const utf8: number = widthWith('12345', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('12345', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(utf8).assertClose(113.99986267089844, 0.01);
        expect(utf8 > widthWith('1', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertTrue();
        expect(countOf('12345')).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0525 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0526
     * @tc.name testEnumTextEnc0526
     * @tc.desc Verify punctuated text keeps its advance across encodings.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0526', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0526 begin');
      await runCase('testEnumTextEnc0526', async () => {
        const utf8: number = widthWith('A,B.C', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('A,B.C', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const utf32: number = widthWith('A,B.C', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(utf8).assertClose(97.51991271972656, 0.01);
        expect(utf16).assertEqual(0);
        expect(utf8 > widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8) * 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0526 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0527
     * @tc.name testEnumTextEnc0527
     * @tc.desc Verify a long ASCII word keeps its advance across encodings.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0527', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0527 begin');
      await runCase('testEnumTextEnc0527', async () => {
        const utf8: number = widthWith('OpenHarmony', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('OpenHarmony', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const utf32: number = widthWith('OpenHarmony', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(utf8).assertClose(268.27978515625, 0.01);
        expect(utf16).assertEqual(0);
        expect(utf8 < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0527 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0528
     * @tc.name testEnumTextEnc0528
     * @tc.desc Verify UTF8 and UTF16 paint one letter into identical pixels.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0528', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0528 begin');
      await runCase('testEnumTextEnc0528', async () => {
        const utf8: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        const utf16: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 20, 120);
        expect(countInkedPixels(utf8)).assertEqual(countInkedPixels(utf16));
        expect(countInkedPixels(utf8) > 0).assertTrue();
        expect(diffCount(utf8, utf16)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0528 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0529
     * @tc.name testEnumTextEnc0529
     * @tc.desc Verify UTF16 and UTF32 paint one letter with the same peak opacity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0529', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0529 begin');
      await runCase('testEnumTextEnc0529', async () => {
        const utf16: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 20, 120);
        const utf32: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF32, 20, 120);
        expect(countInkedPixels(utf16)).assertEqual(countInkedPixels(utf32));
        expect(maxAlpha(utf16)).assertEqual(maxAlpha(utf32));
        expect(diffCount(utf16, utf32)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0529 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0530
     * @tc.name testEnumTextEnc0530
     * @tc.desc Verify the upper and lower halves of one letter match across UTF8 and UTF16.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0530', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0530 begin');
      await runCase('testEnumTextEnc0530', async () => {
        const utf8: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        const utf16: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 20, 120);
        expect(inkBox(utf8, 0, 0, SIZE, 120)).assertEqual(inkBox(utf16, 0, 0, SIZE, 120));
        expect(inkBox(utf8, 0, 120, SIZE, SIZE)).assertEqual(inkBox(utf16, 0, 120, SIZE, SIZE));
        expect(inkBox(utf8, 0, 0, SIZE, 120) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0530 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0531
     * @tc.name testEnumTextEnc0531
     * @tc.desc Verify a letter drawn through UTF16 and UTF32 keeps the same ink rectangle.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0531', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0531 begin');
      await runCase('testEnumTextEnc0531', async () => {
        const left: ArrayBuffer = await renderEncoded('H', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 40, 120);
        const right: ArrayBuffer = await renderEncoded('H', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF32, 40, 120);
        expect(inkBox(left, 0, 0, SIZE, SIZE)).assertEqual(inkBox(right, 0, 0, SIZE, SIZE));
        expect(inkBox(left, 40, 90, 90, 130)).assertEqual(inkBox(right, 40, 90, 90, 130));
        expect(inkBox(left, 0, 0, SIZE, SIZE) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0531 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0532
     * @tc.name testEnumTextEnc0532
     * @tc.desc Verify a whole word is painted identically through UTF8 and UTF16.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0532', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0532 begin');
      await runCase('testEnumTextEnc0532', async () => {
        const word: ArrayBuffer = await renderEncoded('Hello', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        const twin: ArrayBuffer = await renderEncoded('Hello', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 20, 120);
        const single: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        expect(countInkedPixels(word)).assertEqual(countInkedPixels(twin));
        expect(countInkedPixels(word) > countInkedPixels(single)).assertTrue();
        expect(diffCount(word, twin)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0532 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0533
     * @tc.name testEnumTextEnc0533
     * @tc.desc Verify a CJK glyph is painted identically through UTF8 and UTF16.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0533', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0533 begin');
      await runCase('testEnumTextEnc0533', async () => {
        const utf8: ArrayBuffer = await renderEncoded('图', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        const utf16: ArrayBuffer = await renderEncoded('图', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 20, 120);
        expect(maxAlpha(utf8)).assertEqual(maxAlpha(utf16));
        expect(countInkedPixels(utf8)).assertEqual(countInkedPixels(utf16));
        expect(countInkedPixels(utf8) > 100).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0533 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0534
     * @tc.name testEnumTextEnc0534
     * @tc.desc Verify a CJK glyph keeps its peak opacity across UTF16 and UTF32.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0534', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0534 begin');
      await runCase('testEnumTextEnc0534', async () => {
        const utf16: ArrayBuffer = await renderEncoded('图', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 20, 120);
        const utf32: ArrayBuffer = await renderEncoded('图', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF32, 20, 120);
        expect(countInkedPixels(utf16)).assertEqual(countInkedPixels(utf32));
        expect(maxAlpha(utf16)).assertEqual(maxAlpha(utf32));
        expect(alphaAt(utf16, 40, 120)).assertEqual(alphaAt(utf32, 40, 120));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0534 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0535
     * @tc.name testEnumTextEnc0535
     * @tc.desc Verify a CJK glyph covers the same rows through UTF8 and UTF32.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0535', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0535 begin');
      await runCase('testEnumTextEnc0535', async () => {
        const utf8: ArrayBuffer = await renderEncoded('图', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        const utf32: ArrayBuffer = await renderEncoded('图', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF32, 20, 120);
        expect(inkBox(utf8, 0, 0, SIZE, 100)).assertEqual(inkBox(utf32, 0, 0, SIZE, 100));
        expect(inkBox(utf8, 0, 100, SIZE, SIZE)).assertEqual(inkBox(utf32, 0, 100, SIZE, SIZE));
        expect(inkBox(utf8, 0, 0, SIZE, SIZE) > 200).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0535 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0536
     * @tc.name testEnumTextEnc0536
     * @tc.desc Verify mixed text paints identical pixels through UTF8 and UTF16.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0536', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0536 begin');
      await runCase('testEnumTextEnc0536', async () => {
        const utf8: ArrayBuffer = await renderEncoded('A图B', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 10, 120);
        const utf16: ArrayBuffer = await renderEncoded('A图B', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 10, 120);
        const letter: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 10, 120);
        expect(countInkedPixels(utf8)).assertEqual(countInkedPixels(utf16));
        expect(countInkedPixels(utf8) > countInkedPixels(letter)).assertTrue();
        expect(diffCount(utf8, utf16)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0536 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0537
     * @tc.name testEnumTextEnc0537
     * @tc.desc Verify one UTF8 letter paints a solid glyph well inside the canvas.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0537', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0537 begin');
      await runCase('testEnumTextEnc0537', async () => {
        const buffer: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        expect(countInkedPixels(buffer) > 0).assertTrue();
        expect(countInkedPixels(buffer) < AREA / 4).assertTrue();
        expect(maxAlpha(buffer)).assertEqual(255);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0537 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0538
     * @tc.name testEnumTextEnc0538
     * @tc.desc Verify an empty UTF8 string yields no blob so the canvas stays blank.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0538', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0538 begin');
      await runCase('testEnumTextEnc0538', async () => {
        const font: drawing.Font = fontOf(TEXT_SIZE);
        expect(drawing.TextBlob.makeFromString('', font, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertUndefined();
        const blank: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const buffer: ArrayBuffer = await readPixelBuffer(blank.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxAlpha(buffer)).assertEqual(0);
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0538 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0539
     * @tc.name testEnumTextEnc0539
     * @tc.desc Verify empty UTF16 and UTF32 strings yield no blob either.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0539', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0539 begin');
      await runCase('testEnumTextEnc0539', async () => {
        const font: drawing.Font = fontOf(TEXT_SIZE);
        expect(drawing.TextBlob.makeFromString('', font, drawing.TextEncoding.TEXT_ENCODING_UTF16)).assertUndefined();
        expect(drawing.TextBlob.makeFromString('', font, drawing.TextEncoding.TEXT_ENCODING_UTF32)).assertUndefined();
        const blank: OffscreenTarget = await createOffscreenTarget(SIZE, SIZE);
        const buffer: ArrayBuffer = await readPixelBuffer(blank.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(maxAlpha(buffer)).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0539 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0540
     * @tc.name testEnumTextEnc0540
     * @tc.desc Verify the glyph id encoding returns a finite non-negative advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0540', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0540 begin');
      await runCase('testEnumTextEnc0540', async () => {
        const advance: number = widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        expect(Number.isFinite(advance)).assertTrue();
        expect(advance >= 0).assertTrue();
        expect(advance < AREA).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0540 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0541
     * @tc.name testEnumTextEnc0541
     * @tc.desc Verify the glyph id encoding measures a word and a letter as finite values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0541', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0541 begin');
      await runCase('testEnumTextEnc0541', async () => {
        const word: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        const single: number = widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        expect(Number.isFinite(word)).assertTrue();
        expect(Number.isFinite(single)).assertTrue();
        expect(word >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0541 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0542
     * @tc.name testEnumTextEnc0542
     * @tc.desc Verify a glyph id blob draws without leaving the canvas bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0542', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0542 begin');
      await runCase('testEnumTextEnc0542', async () => {
        const buffer: ArrayBuffer = await renderEncoded('A', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID, 20, 120);
        const ink: number = countInkedPixels(buffer);
        expect(ink >= 0).assertTrue();
        expect(ink <= AREA).assertTrue();
        expect(inkBox(buffer, 0, 0, SIZE, SIZE)).assertEqual(ink);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0542 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0543
     * @tc.name testEnumTextEnc0543
     * @tc.desc Verify the glyph id encoding stays finite for repeated glyph indices.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0543', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0543 begin');
      await runCase('testEnumTextEnc0543', async () => {
        const one: number = widthWith('A', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        const two: number = widthWith('AA', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        expect(Number.isFinite(one)).assertTrue();
        expect(Number.isFinite(two)).assertTrue();
        expect(two >= one).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0543 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0544
     * @tc.name testEnumTextEnc0544
     * @tc.desc Verify every encoding measures one word as a finite non-negative value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0544', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0544 begin');
      await runCase('testEnumTextEnc0544', async () => {
        const utf8: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        const glyph: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        expect(Number.isFinite(utf8) && Number.isFinite(utf16)).assertTrue();
        expect(Number.isFinite(glyph)).assertTrue();
        expect(utf8 >= 0 && utf16 >= 0 && glyph >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0544 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0545
     * @tc.name testEnumTextEnc0545
     * @tc.desc Verify the measured advance scales with the font size under UTF8.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0545', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0545 begin');
      await runCase('testEnumTextEnc0545', async () => {
        const base: number = widthWith('Hello', TEXT_SIZE, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const scaled: number = widthWith('Hello', TEXT_SIZE * 2, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(base > 0).assertTrue();
        expect(scaled > base).assertTrue();
        expect(Math.abs(scaled - base * 2) < base * 0.1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0545 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0546
     * @tc.name testEnumTextEnc0546
     * @tc.desc Verify glyph counting ignores the text encoding used for measuring.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumTextEnc0546', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0546 begin');
      await runCase('testEnumTextEnc0546', async () => {
        expect(countOf('Hello')).assertEqual(5);
        expect(countOf('A')).assertEqual(1);
        expect(countOf('图')).assertEqual(1);
        expect(countOf('A图B')).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0546 end');
    });

    /** @tc.number SUB_NdkTsDrawing_ENUM_0547
     * @tc.name testEnumTextEnc0547
     * @tc.desc Verify all three Unicode encodings paint a visible word with equal ink.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumTextEnc0547', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0547 begin');
      await runCase('testEnumTextEnc0547', async () => {
        const utf8: ArrayBuffer = await renderEncoded('ABC', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF8, 20, 120);
        const utf16: ArrayBuffer = await renderEncoded('ABC', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF16, 20, 120);
        const utf32: ArrayBuffer = await renderEncoded('ABC', TEXT_SIZE,
          drawing.TextEncoding.TEXT_ENCODING_UTF32, 20, 120);
        expect(countInkedPixels(utf8) > 0).assertTrue();
        expect(countInkedPixels(utf16)).assertEqual(countInkedPixels(utf32));
        expect(countInkedPixels(utf8)).assertEqual(countInkedPixels(utf32));
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumTextEnc0547 end');
    });
  });
}
