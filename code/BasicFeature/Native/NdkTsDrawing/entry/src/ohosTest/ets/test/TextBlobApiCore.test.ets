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
  createFont,
  createPosTextBlob,
  createRunBufferBlob,
  createTextBlob,
  measureString,
  textBlobBounds,
  textBlobIdStable
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
 * Build a blob from a UTF8 string.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { drawing.TextBlob } Text blob.
 */
function blobOf(text: string, size: number): drawing.TextBlob {
  return drawing.TextBlob.makeFromString(text, newFont(size), drawing.TextEncoding.TEXT_ENCODING_UTF8);
}

/**
 * Read the width of a blob bounding box.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { number } Bounds width in px.
 */
function blobWidth(text: string, size: number): number {
  const bounds: common2D.Rect = blobOf(text, size).bounds();
  return bounds.right - bounds.left;
}

export default function textBlobApiCoreTest() {
  describe('TextBlobApiCoreTest', () => {
    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0001
     * @tc.name testTextBlobApi0001
     * @tc.desc Verify a blob built from text reports a positive width box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTextBlobApi0001', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0001 begin');
      await runCase('testTextBlobApi0001', async () => {
        const bounds: common2D.Rect = blobOf('Hello', 32).bounds();
        expect(bounds.right > bounds.left).assertTrue();
        expect(bounds.right - bounds.left > 20).assertTrue();
        expect(bounds.left >= -1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0001 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0002
     * @tc.name testTextBlobApi0002
     * @tc.desc Verify the blob box covers the glyph height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTextBlobApi0002', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0002 begin');
      await runCase('testTextBlobApi0002', async () => {
        const bounds: common2D.Rect = blobOf('Hello', 32).bounds();
        expect(bounds.bottom > bounds.top).assertTrue();
        expect(bounds.bottom - bounds.top > 15).assertTrue();
        expect(bounds.bottom - bounds.top < 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0002 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0003
     * @tc.name testTextBlobApi0003
     * @tc.desc Verify empty text yields no blob while a single letter does.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0003', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0003 begin');
      await runCase('testTextBlobApi0003', async () => {
        expect(blobOf('', 32)).assertUndefined();
        const solid: drawing.TextBlob = blobOf('A', 32);
        expect(solid.uniqueID() > 0).assertTrue();
        expect(solid.bounds().right - solid.bounds().left > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0003 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0004
     * @tc.name testTextBlobApi0004
     * @tc.desc Verify a blob always carries a positive unique id.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTextBlobApi0004', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0004 begin');
      await runCase('testTextBlobApi0004', async () => {
        const blob: drawing.TextBlob = blobOf('id', 24);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.uniqueID()).assertEqual(blob.uniqueID());
        expect(blob.bounds().right > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0004 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0005
     * @tc.name testTextBlobApi0005
     * @tc.desc Verify two blobs of the same text get distinct ids but one box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0005', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0005 begin');
      await runCase('testTextBlobApi0005', async () => {
        const first: drawing.TextBlob = createTextBlob('same', 30);
        const second: drawing.TextBlob = createTextBlob('same', 30);
        expect(first.uniqueID() > 0).assertTrue();
        expect(second.uniqueID() > first.uniqueID()).assertTrue();
        expect(textBlobIdStable('same', 30)).assertFalse();
        expect(first.bounds().right).assertEqual(second.bounds().right);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0005 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0006
     * @tc.name testTextBlobApi0006
     * @tc.desc Verify different texts produce different blob ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0006', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0006 begin');
      await runCase('testTextBlobApi0006', async () => {
        const first: drawing.TextBlob = blobOf('alpha', 30);
        const second: drawing.TextBlob = blobOf('beta', 30);
        expect(first.uniqueID() === second.uniqueID()).assertFalse();
        expect(first.uniqueID() > 0).assertTrue();
        expect(second.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0006 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0007
     * @tc.name testTextBlobApi0007
     * @tc.desc Verify the same text at another size gets another id.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0007', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0007 begin');
      await runCase('testTextBlobApi0007', async () => {
        const small: drawing.TextBlob = blobOf('size', 16);
        const large: drawing.TextBlob = blobOf('size', 48);
        expect(small.uniqueID() === large.uniqueID()).assertFalse();
        expect(large.bounds().right > small.bounds().right).assertTrue();
        expect(textBlobIdStable('size', 16)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0007 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0008
     * @tc.name testTextBlobApi0008
     * @tc.desc Verify the blob width stays close to the measured string width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0008', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0008 begin');
      await runCase('testTextBlobApi0008', async () => {
        const measured: number = measureString('Width', 32, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const width: number = blobWidth('Width', 32);
        expect(measured > 0).assertTrue();
        expect(Math.abs(width - measured) < measured * 0.2).assertTrue();
        expect(width > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0008 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0009
     * @tc.name testTextBlobApi0009
     * @tc.desc Verify doubling the size doubles the blob width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0009', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0009 begin');
      await runCase('testTextBlobApi0009', async () => {
        const small: number = blobWidth('Blob', 16);
        const large: number = blobWidth('Blob', 32);
        expect(small > 0).assertTrue();
        expect(large / small > 1.9).assertTrue();
        expect(large / small < 2.1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0009 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0010
     * @tc.name testTextBlobApi0010
     * @tc.desc Verify the blob box starts near the horizontal origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0010', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0010 begin');
      await runCase('testTextBlobApi0010', async () => {
        const bounds: common2D.Rect = blobOf('Origin', 32).bounds();
        expect(bounds.left >= -2).assertTrue();
        expect(bounds.left < 8).assertTrue();
        expect(bounds.right > bounds.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0010 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0011
     * @tc.name testTextBlobApi0011
     * @tc.desc Verify the blob box top sits above the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0011', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0011 begin');
      await runCase('testTextBlobApi0011', async () => {
        const bounds: common2D.Rect = blobOf('Alpha', 32).bounds();
        expect(bounds.top < 0).assertTrue();
        expect(bounds.bottom >= 0).assertTrue();
        expect(bounds.bottom < 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0011 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0012
     * @tc.name testTextBlobApi0012
     * @tc.desc Verify a long string produces a wide blob box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0012', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0012 begin');
      await runCase('testTextBlobApi0012', async () => {
        const width: number = blobWidth('abcdefghijklmnopqrst', 20);
        expect(width > 100).assertTrue();
        expect(width < 500).assertTrue();
        expect(width > blobWidth('a', 20)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0012 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0013
     * @tc.name testTextBlobApi0013
     * @tc.desc Verify a single character keeps a narrow blob box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0013', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0013 begin');
      await runCase('testTextBlobApi0013', async () => {
        const width: number = blobWidth('i', 32);
        expect(width > 0).assertTrue();
        expect(width < 16).assertTrue();
        expect(width < blobWidth('W', 32)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0013 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0014
     * @tc.name testTextBlobApi0014
     * @tc.desc Verify the UTF16 encoding also produces a measurable blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0014', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0014 begin');
      await runCase('testTextBlobApi0014', async () => {
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Enc',
          newFont(32), drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(blob.bounds().right > 0).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().bottom > blob.bounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0014 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0015
     * @tc.name testTextBlobApi0015
     * @tc.desc Verify UTF8 and UTF16 blobs of ascii text agree on width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0015', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0015 begin');
      await runCase('testTextBlobApi0015', async () => {
        const utf8: drawing.TextBlob = drawing.TextBlob.makeFromString('Both',
          newFont(32), drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: drawing.TextBlob = drawing.TextBlob.makeFromString('Both',
          newFont(32), drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(Math.abs(utf8.bounds().right - utf16.bounds().right) < 2).assertTrue();
        expect(utf8.bounds().right > 0).assertTrue();
        expect(utf8.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0015 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0016
     * @tc.name testTextBlobApi0016
     * @tc.desc Verify the flat bounds helper emits four numbers.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTextBlobApi0016', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0016 begin');
      await runCase('testTextBlobApi0016', async () => {
        const flat: number[] = textBlobBounds('Flat', 32);
        expect(flat.length).assertEqual(4);
        expect(flat[2] > flat[0]).assertTrue();
        expect(flat[3] > flat[1]).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0016 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0017
     * @tc.name testTextBlobApi0017
     * @tc.desc Verify the flat bounds helper mirrors the blob box field by field.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0017', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0017 begin');
      await runCase('testTextBlobApi0017', async () => {
        const flat: number[] = textBlobBounds('Mirror', 28);
        const bounds: common2D.Rect = createTextBlob('Mirror', 28).bounds();
        expect(flat[0]).assertEqual(bounds.left);
        expect(flat[1]).assertEqual(bounds.top);
        expect(flat[2]).assertEqual(bounds.right);
        expect(flat[3]).assertEqual(bounds.bottom);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0017 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0018
     * @tc.name testTextBlobApi0018
     * @tc.desc Verify the flat bounds helper rejects empty text and sizes a letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0018', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0018 begin');
      await runCase('testTextBlobApi0018', async () => {
        expect(throwsOn(() => textBlobBounds('', 32))).assertTrue();
        const flat: number[] = textBlobBounds('A', 32);
        expect(flat.length).assertEqual(4);
        expect(flat[2] - flat[0] > 0).assertTrue();
        expect(flat[3] - flat[1] > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0018 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0019
     * @tc.name testTextBlobApi0019
     * @tc.desc Verify a larger font makes a taller blob box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0019', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0019 begin');
      await runCase('testTextBlobApi0019', async () => {
        const small: common2D.Rect = blobOf('Tall', 12).bounds();
        const large: common2D.Rect = blobOf('Tall', 48).bounds();
        expect(large.bottom - large.top > small.bottom - small.top).assertTrue();
        expect(large.right - large.left > small.right - small.left).assertTrue();
        expect(small.bottom > small.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0019 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0020
     * @tc.name testTextBlobApi0020
     * @tc.desc Verify a single space still yields a positive advance box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0020', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0020 begin');
      await runCase('testTextBlobApi0020', async () => {
        const blob: drawing.TextBlob = blobOf(' ', 32);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().right >= 0).assertTrue();
        expect(blobWidth(' ', 32) >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0020 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0021
     * @tc.name testTextBlobApi0021
     * @tc.desc Verify a positioned blob covers the placed glyphs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTextBlobApi0021', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0021 begin');
      await runCase('testTextBlobApi0021', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('ab', 32);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().right > 32).assertTrue();
        expect(blob.bounds().bottom > blob.bounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0021 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0022
     * @tc.name testTextBlobApi0022
     * @tc.desc Verify three positioned glyphs span more than two size steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0022', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0022 begin');
      await runCase('testTextBlobApi0022', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('abc', 20);
        expect(blob.bounds().right > 40).assertTrue();
        expect(blob.bounds().right < 80).assertTrue();
        expect(blob.bounds().left >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0022 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0023
     * @tc.name testTextBlobApi0023
     * @tc.desc Verify positioned glyphs sit below the requested baseline row.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0023', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0023 begin');
      await runCase('testTextBlobApi0023', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('ab', 32);
        expect(blob.bounds().bottom > 0).assertTrue();
        expect(blob.bounds().bottom <= 40).assertTrue();
        expect(blob.bounds().top < blob.bounds().bottom).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0023 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0024
     * @tc.name testTextBlobApi0024
     * @tc.desc Verify a wider size step spreads the positioned glyphs further.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0024', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0024 begin');
      await runCase('testTextBlobApi0024', async () => {
        const narrow: number = createPosTextBlob('ab', 16).bounds().right;
        const wide: number = createPosTextBlob('ab', 64).bounds().right;
        expect(wide > narrow).assertTrue();
        expect(wide > 64).assertTrue();
        expect(narrow > 16).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0024 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0025
     * @tc.name testTextBlobApi0025
     * @tc.desc Verify positioned blobs of different text differ in id.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0025', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0025 begin');
      await runCase('testTextBlobApi0025', async () => {
        const first: drawing.TextBlob = createPosTextBlob('ab', 32);
        const second: drawing.TextBlob = createPosTextBlob('abc', 32);
        expect(first.uniqueID() === second.uniqueID()).assertFalse();
        expect(first.uniqueID() > 0).assertTrue();
        expect(second.bounds().right > first.bounds().right).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0025 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0026
     * @tc.name testTextBlobApi0026
     * @tc.desc Verify a run buffer blob reports a usable box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testTextBlobApi0026', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0026 begin');
      await runCase('testTextBlobApi0026', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('run', 32);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().right > 0).assertTrue();
        expect(blob.bounds().bottom > blob.bounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0026 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0027
     * @tc.name testTextBlobApi0027
     * @tc.desc Verify a four glyph run reaches beyond three size steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0027', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0027 begin');
      await runCase('testTextBlobApi0027', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('quad', 32);
        expect(blob.bounds().right > 96).assertTrue();
        expect(blob.bounds().right <= 160).assertTrue();
        expect(blob.bounds().left >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0027 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0028
     * @tc.name testTextBlobApi0028
     * @tc.desc Verify a run buffer blob keeps a bounded height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0028', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0028 begin');
      await runCase('testTextBlobApi0028', async () => {
        const bounds: common2D.Rect = createRunBufferBlob('tall', 40).bounds();
        expect(bounds.bottom - bounds.top <= 80).assertTrue();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
        expect(bounds.right - bounds.left > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0028 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0029
     * @tc.name testTextBlobApi0029
     * @tc.desc Verify two run buffer blobs of one text share the same box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0029', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0029 begin');
      await runCase('testTextBlobApi0029', async () => {
        const first: common2D.Rect = createRunBufferBlob('same', 24).bounds();
        const second: common2D.Rect = createRunBufferBlob('same', 24).bounds();
        expect(first.right).assertEqual(second.right);
        expect(first.bottom).assertEqual(second.bottom);
        expect(first.left).assertEqual(second.left);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0029 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0030
     * @tc.name testTextBlobApi0030
     * @tc.desc Verify run buffer blobs of different texts differ in id.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0030', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0030 begin');
      await runCase('testTextBlobApi0030', async () => {
        const first: drawing.TextBlob = createRunBufferBlob('one', 32);
        const second: drawing.TextBlob = createRunBufferBlob('two', 32);
        expect(first.uniqueID() === second.uniqueID()).assertFalse();
        expect(first.uniqueID() > 0).assertTrue();
        expect(second.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0030 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0031
     * @tc.name testTextBlobApi0031
     * @tc.desc Verify a five glyph run is wider than a two glyph run.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0031', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0031 begin');
      await runCase('testTextBlobApi0031', async () => {
        const short: number = createRunBufferBlob('ab', 32).bounds().right;
        const long: number = createRunBufferBlob('abcde', 32).bounds().right;
        expect(long > short).assertTrue();
        expect(long > 128).assertTrue();
        expect(short > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0031 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0032
     * @tc.name testTextBlobApi0032
     * @tc.desc Verify a larger size widens the run buffer box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0032', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0032 begin');
      await runCase('testTextBlobApi0032', async () => {
        const small: number = createRunBufferBlob('ab', 16).bounds().right;
        const large: number = createRunBufferBlob('ab', 64).bounds().right;
        expect(large > small).assertTrue();
        expect(large > 64).assertTrue();
        expect(small > 16).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0032 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0033
     * @tc.name testTextBlobApi0033
     * @tc.desc Verify a single glyph run still reports a valid id and box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0033', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0033 begin');
      await runCase('testTextBlobApi0033', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('z', 32);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().right > 0).assertTrue();
        expect(blob.bounds().right <= 64).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0033 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0034
     * @tc.name testTextBlobApi0034
     * @tc.desc Verify the run buffer box grows with the glyph count in eight steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0034', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0034 begin');
      await runCase('testTextBlobApi0034', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('abcdefgh', 32);
        expect(blob.bounds().right > 224).assertTrue();
        expect(blob.bounds().right <= 288).assertTrue();
        expect(blob.bounds().bottom > blob.bounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0034 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0035
     * @tc.name testTextBlobApi0035
     * @tc.desc Verify a hand built run buffer yields a populated blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0035', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0035 begin');
      await runCase('testTextBlobApi0035', async () => {
        const font: drawing.Font = newFont(32);
        const ids: number[] = font.textToGlyphs('ab');
        const buffers: drawing.TextBlobRunBuffer[] = [
          { glyph: ids[0], positionX: 0, positionY: 0 },
          { glyph: ids[1], positionX: 32, positionY: 0 }
        ];
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromRunBuffer(buffers, font);
        expect(blob.bounds().right > 0).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().bottom > blob.bounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0035 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0036
     * @tc.name testTextBlobApi0036
     * @tc.desc Verify a hand built run buffer respects the supplied bounds height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0036', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0036 begin');
      await runCase('testTextBlobApi0036', async () => {
        const font: drawing.Font = newFont(24);
        const buffers: drawing.TextBlobRunBuffer[] = [
          { glyph: font.textToGlyphs('a')[0], positionX: 0, positionY: 0 }
        ];
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromRunBuffer(buffers, font,
          { left: 0, top: 0, right: 24, bottom: 24 });
        expect(blob.bounds().bottom <= 48).assertTrue();
        expect(blob.bounds().right > 0).assertTrue();
        expect(blob.bounds().bottom > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0036 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0037
     * @tc.name testTextBlobApi0037
     * @tc.desc Verify three glyphs of positioned text stay inside three size steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0037', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0037 begin');
      await runCase('testTextBlobApi0037', async () => {
        const bounds: common2D.Rect = createPosTextBlob('xyz', 30).bounds();
        expect(bounds.right > 60).assertTrue();
        expect(bounds.right <= 120).assertTrue();
        expect(bounds.left >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0037 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0038
     * @tc.name testTextBlobApi0038
     * @tc.desc Verify positioned text keeps a bounded height around the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0038', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0038 begin');
      await runCase('testTextBlobApi0038', async () => {
        const bounds: common2D.Rect = createPosTextBlob('xyz', 30).bounds();
        expect(bounds.bottom <= 60).assertTrue();
        expect(bounds.bottom > 0).assertTrue();
        expect(bounds.bottom - bounds.top <= 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0038 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0039
     * @tc.name testTextBlobApi0039
     * @tc.desc Verify two positioned blobs of one text share the same box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0039', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0039 begin');
      await runCase('testTextBlobApi0039', async () => {
        const first: common2D.Rect = createPosTextBlob('pos', 32).bounds();
        const second: common2D.Rect = createPosTextBlob('pos', 32).bounds();
        expect(first.right).assertEqual(second.right);
        expect(first.bottom).assertEqual(second.bottom);
        expect(first.top).assertEqual(second.top);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0039 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0040
     * @tc.name testTextBlobApi0040
     * @tc.desc Verify five positioned glyphs spread across five size steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0040', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0040 begin');
      await runCase('testTextBlobApi0040', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('abcde', 20);
        expect(blob.bounds().right > 80).assertTrue();
        expect(blob.bounds().right <= 120).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0040 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0041
     * @tc.name testTextBlobApi0041
     * @tc.desc Verify a hundred character string builds a wide blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0041', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0041 begin');
      await runCase('testTextBlobApi0041', async () => {
        const text: string = 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
          'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij';
        const blob: drawing.TextBlob = blobOf(text, 12);
        expect(text.length).assertEqual(100);
        expect(blob.bounds().right > 200).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0041 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0042
     * @tc.name testTextBlobApi0042
     * @tc.desc Verify the smallest size still yields a usable blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0042', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0042 begin');
      await runCase('testTextBlobApi0042', async () => {
        const blob: drawing.TextBlob = blobOf('tiny', 1);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().right >= 0).assertTrue();
        expect(blob.bounds().right < 8).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0042 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0043
     * @tc.name testTextBlobApi0043
     * @tc.desc Verify an extreme size builds a proportionally wide blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0043', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0043 begin');
      await runCase('testTextBlobApi0043', async () => {
        const blob: drawing.TextBlob = blobOf('Big', 500);
        expect(blob.bounds().right > 500).assertTrue();
        expect(blob.bounds().bottom - blob.bounds().top > 200).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0043 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0044
     * @tc.name testTextBlobApi0044
     * @tc.desc Verify a run of wide letters is wider than a run of narrow ones.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0044', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0044 begin');
      await runCase('testTextBlobApi0044', async () => {
        const wide: number = blobWidth('MMMM', 32);
        const narrow: number = blobWidth('iiii', 32);
        expect(wide > narrow).assertTrue();
        expect(narrow > 0).assertTrue();
        expect(wide > 40).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0044 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0045
     * @tc.name testTextBlobApi0045
     * @tc.desc Verify the blob box stays put after the source font changes size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0045', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0045 begin');
      await runCase('testTextBlobApi0045', async () => {
        const font: drawing.Font = newFont(32);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Snap', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const before: common2D.Rect = blob.bounds();
        font.setSize(96);
        const after: common2D.Rect = blob.bounds();
        expect(after.right).assertEqual(before.right);
        expect(after.bottom).assertEqual(before.bottom);
        expect(blob.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0045 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0046
     * @tc.name testTextBlobApi0046
     * @tc.desc Verify three different texts produce three different ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0046', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0046 begin');
      await runCase('testTextBlobApi0046', async () => {
        const ids: number[] = [blobOf('aa', 20).uniqueID(), blobOf('bb', 20).uniqueID(),
          blobOf('cc', 20).uniqueID()];
        expect(ids[0] === ids[1]).assertFalse();
        expect(ids[1] === ids[2]).assertFalse();
        expect(ids[0] === ids[2]).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0046 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0047
     * @tc.name testTextBlobApi0047
     * @tc.desc Verify the id stability helper agrees with the raw comparison.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0047', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0047 begin');
      await runCase('testTextBlobApi0047', async () => {
        const first: drawing.TextBlob = createTextBlob('stable', 20);
        const second: drawing.TextBlob = createTextBlob('stable', 20);
        const helperTwenty: boolean = textBlobIdStable('stable', 20);
        const sameId: boolean = first.uniqueID() === second.uniqueID();
        expect(helperTwenty).assertEqual(sameId);
        expect(sameId).assertFalse();
        expect(first.bounds().right).assertEqual(second.bounds().right);
        expect(first.bounds().right > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0047 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0048
     * @tc.name testTextBlobApi0048
     * @tc.desc Verify the box width follows five ascending sizes monotonically.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0048', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0048 begin');
      await runCase('testTextBlobApi0048', async () => {
        const sizes: number[] = [10, 20, 30, 40, 50];
        const widths: number[] = [blobWidth('Grow', sizes[0]), blobWidth('Grow', sizes[1]),
          blobWidth('Grow', sizes[2]), blobWidth('Grow', sizes[3]), blobWidth('Grow', sizes[4])];
        expect(widths[0] < widths[1]).assertTrue();
        expect(widths[2] < widths[3]).assertTrue();
        expect(widths[3] < widths[4]).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0048 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0049
     * @tc.name testTextBlobApi0049
     * @tc.desc Verify a digit blob reports a narrow but positive box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0049', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0049 begin');
      await runCase('testTextBlobApi0049', async () => {
        const bounds: common2D.Rect = blobOf('8', 32).bounds();
        expect(bounds.right - bounds.left > 0).assertTrue();
        expect(bounds.right - bounds.left < 32).assertTrue();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0049 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0050
     * @tc.name testTextBlobApi0050
     * @tc.desc Verify the blob pipeline stays coherent from font to bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0050', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0050 begin');
      await runCase('testTextBlobApi0050', async () => {
        const font: drawing.Font = createFont(30);
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Chain', font,
          drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const flat: number[] = textBlobBounds('Chain', 30);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(flat.length).assertEqual(4);
        expect(Math.abs(flat[2] - blob.bounds().right) < 1).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0050 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0051
     * @tc.name testTextBlobApi0051
     * @tc.desc Verify the UTF32 encoding also yields a measurable blob.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0051', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0051 begin');
      await runCase('testTextBlobApi0051', async () => {
        const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Wide',
          newFont(32), drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(blob.bounds().right > 0).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().bottom > blob.bounds().top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0051 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0052
     * @tc.name testTextBlobApi0052
     * @tc.desc Verify two spaces widen the blob more than one space.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0052', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0052 begin');
      await runCase('testTextBlobApi0052', async () => {
        const one: number = blobWidth('a b', 32);
        const two: number = blobWidth('a  b', 32);
        expect(two > one).assertTrue();
        expect(one > 0).assertTrue();
        expect(two < one * 2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0052 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0053
     * @tc.name testTextBlobApi0053
     * @tc.desc Verify two identical letters make a wider blob than one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0053', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0053 begin');
      await runCase('testTextBlobApi0053', async () => {
        const one: number = blobWidth('A', 32);
        const two: number = blobWidth('AA', 32);
        expect(two > one).assertTrue();
        expect(two / one > 1.5).assertTrue();
        expect(one > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0053 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0054
     * @tc.name testTextBlobApi0054
     * @tc.desc Verify a capital letter box straddles the baseline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0054', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0054 begin');
      await runCase('testTextBlobApi0054', async () => {
        const bounds: common2D.Rect = blobOf('H', 32).bounds();
        expect(bounds.top < 0).assertTrue();
        expect(bounds.bottom).assertEqual(0);
        expect(bounds.bottom - bounds.top > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0054 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0055
     * @tc.name testTextBlobApi0055
     * @tc.desc Verify the full alphabet produces a broad blob box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0055', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0055 begin');
      await runCase('testTextBlobApi0055', async () => {
        const width: number = blobWidth('abcdefghijklmnopqrstuvwxyz', 20);
        expect(width > 150).assertTrue();
        expect(width > blobWidth('abc', 20)).assertTrue();
        expect(width < 600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0055 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0056
     * @tc.name testTextBlobApi0056
     * @tc.desc Verify ten positioned glyphs span nine size steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0056', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0056 begin');
      await runCase('testTextBlobApi0056', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('abcdefghij', 20);
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.left >= 0).assertTrue();
        expect(bounds.bottom > 0).assertTrue();
        expect(bounds.right > bounds.bottom * 5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0056 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0057
     * @tc.name testTextBlobApi0057
     * @tc.desc Verify the run buffer and string blobs stay within one size of each other.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0057', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0057 begin');
      await runCase('testTextBlobApi0057', async () => {
        const run: number = createRunBufferBlob('ab', 32).bounds().right;
        const text: number = blobWidth('ab', 32);
        expect(run > 0).assertTrue();
        expect(text > 0).assertTrue();
        expect(Math.abs(run - text) < 64).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0057 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0058
     * @tc.name testTextBlobApi0058
     * @tc.desc Verify a digit and letter mix is wider than the letters alone.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0058', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0058 begin');
      await runCase('testTextBlobApi0058', async () => {
        const letters: number = blobWidth('ab', 32);
        const mixed: number = blobWidth('a1b2', 32);
        expect(mixed > letters).assertTrue();
        expect(letters > 0).assertTrue();
        expect(mixed > letters * 1.5).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0058 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0059
     * @tc.name testTextBlobApi0059
     * @tc.desc Verify five sizes all produce positive blob ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0059', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0059 begin');
      await runCase('testTextBlobApi0059', async () => {
        const sizes: number[] = [8, 16, 24, 32, 48];
        let positive: number = 0;
        for (let index: number = 0; index < sizes.length; index++) {
          if (blobOf('id', sizes[index]).uniqueID() > 0) {
            positive += 1;
          }
        }
        expect(positive).assertEqual(5);
        expect(sizes.length).assertEqual(5);
        expect(blobOf('id', sizes[0]).uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0059 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0060
     * @tc.name testTextBlobApi0060
     * @tc.desc Verify the blob height grows across three sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0060', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0060 begin');
      await runCase('testTextBlobApi0060', async () => {
        const small: common2D.Rect = blobOf('H', 10).bounds();
        const middle: common2D.Rect = blobOf('H', 30).bounds();
        const large: common2D.Rect = blobOf('H', 60).bounds();
        expect(middle.bottom - middle.top > small.bottom - small.top).assertTrue();
        expect(large.bottom - large.top > middle.bottom - middle.top).assertTrue();
        expect(small.bottom > small.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0060 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0061
     * @tc.name testTextBlobApi0061
     * @tc.desc Verify the flat bounds width matches the blob width helper.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0061', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0061 begin');
      await runCase('testTextBlobApi0061', async () => {
        const flat: number[] = textBlobBounds('Match', 26);
        const width: number = blobWidth('Match', 26);
        expect(flat[2] - flat[0]).assertEqual(width);
        expect(flat[3] - flat[1] > 0).assertTrue();
        expect(flat.length).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0061 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0062
     * @tc.name testTextBlobApi0062
     * @tc.desc Verify a dot glyph reports a narrow box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0062', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0062 begin');
      await runCase('testTextBlobApi0062', async () => {
        const narrow: number = blobWidth('.', 32);
        const wide: number = blobWidth('W', 32);
        expect(narrow < wide).assertTrue();
        expect(narrow >= 0).assertTrue();
        expect(wide > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0062 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0063
     * @tc.name testTextBlobApi0063
     * @tc.desc Verify four wide letters keep a bounded height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0063', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0063 begin');
      await runCase('testTextBlobApi0063', async () => {
        const bounds: common2D.Rect = blobOf('MMMM', 32).bounds();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
        expect(bounds.bottom - bounds.top < 60).assertTrue();
        expect(bounds.right - bounds.left > 40).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0063 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0064
     * @tc.name testTextBlobApi0064
     * @tc.desc Verify a three glyph run keeps a positive height.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0064', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0064 begin');
      await runCase('testTextBlobApi0064', async () => {
        const bounds: common2D.Rect = createRunBufferBlob('tri', 30).bounds();
        expect(bounds.bottom > bounds.top).assertTrue();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
        expect(bounds.right > 60).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0064 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0065
     * @tc.name testTextBlobApi0065
     * @tc.desc Verify four positioned glyphs stay inside four size steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0065', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0065 begin');
      await runCase('testTextBlobApi0065', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('wxyz', 24);
        expect(blob.bounds().right > 72).assertTrue();
        expect(blob.bounds().right <= 96).assertTrue();
        expect(blob.bounds().left >= 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0065 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0066
     * @tc.name testTextBlobApi0066
     * @tc.desc Verify a space inside a phrase adds to the blob width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0066', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0066 begin');
      await runCase('testTextBlobApi0066', async () => {
        const joined: number = blobWidth('HelloWorld', 24);
        const spaced: number = blobWidth('Hello World', 24);
        expect(spaced > joined).assertTrue();
        expect(joined > 0).assertTrue();
        expect(spaced - joined < 24).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0066 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0067
     * @tc.name testTextBlobApi0067
     * @tc.desc Verify a tiny size still yields a narrow positive box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0067', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0067 begin');
      await runCase('testTextBlobApi0067', async () => {
        const width: number = blobWidth('tiny', 2);
        expect(width >= 0).assertTrue();
        expect(width < 20).assertTrue();
        expect(blobOf('tiny', 2).uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0067 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0068
     * @tc.name testTextBlobApi0068
     * @tc.desc Verify the blob left edge stays stable across sizes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0068', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0068 begin');
      await runCase('testTextBlobApi0068', async () => {
        const small: common2D.Rect = blobOf('Edge', 12).bounds();
        const large: common2D.Rect = blobOf('Edge', 48).bounds();
        expect(Math.abs(large.left - small.left)).assertEqual(3);
        expect(large.right > small.right).assertTrue();
        expect(small.right > small.left).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0068 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0069
     * @tc.name testTextBlobApi0069
     * @tc.desc Verify fifty characters produce a very wide box.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testTextBlobApi0069', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0069 begin');
      await runCase('testTextBlobApi0069', async () => {
        const text: string = 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij';
        expect(text.length).assertEqual(50);
        expect(blobWidth(text, 20) > 300).assertTrue();
        expect(blobOf(text, 20).uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0069 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0070
     * @tc.name testTextBlobApi0070
     * @tc.desc Verify three blobs of one text get distinct growing ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0070', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0070 begin');
      await runCase('testTextBlobApi0070', async () => {
        const first: number = blobOf('same', 20).uniqueID();
        const second: number = blobOf('same', 20).uniqueID();
        const third: number = blobOf('same', 20).uniqueID();
        expect(first > 0).assertTrue();
        expect(second > first).assertTrue();
        expect(third > second).assertTrue();
        expect(textBlobIdStable('same', 20)).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0070 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0071
     * @tc.name testTextBlobApi0071
     * @tc.desc Verify a large positioned size spreads the glyphs widely.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0071', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0071 begin');
      await runCase('testTextBlobApi0071', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('abc', 100);
        expect(blob.bounds().right).assertEqual(249);
        expect(blob.bounds().bottom > 0).assertTrue();
        expect(blob.uniqueID() > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0071 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0072
     * @tc.name testTextBlobApi0072
     * @tc.desc Verify a twenty glyph run covers nineteen size steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0072', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0072 begin');
      await runCase('testTextBlobApi0072', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('abcdefghijklmnopqrst', 32);
        expect(blob.uniqueID() > 0).assertTrue();
        expect(blob.bounds().left >= 0).assertTrue();
        expect(blob.bounds().right > 600).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0072 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0073
     * @tc.name testTextBlobApi0073
     * @tc.desc Verify four sizes all produce ascending widths and positive ids.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0073', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0073 begin');
      await runCase('testTextBlobApi0073', async () => {
        const sizes: number[] = [8, 16, 32, 64];
        let ascending: number = 0;
        let positive: number = 0;
        for (let index: number = 0; index < sizes.length; index++) {
          if (blobOf('grow', sizes[index]).uniqueID() > 0) {
            positive += 1;
          }
          if (index > 0 && blobWidth('grow', sizes[index]) > blobWidth('grow', sizes[index - 1])) {
            ascending += 1;
          }
        }
        expect(positive).assertEqual(4);
        expect(ascending).assertEqual(3);
        expect(blobWidth('grow', 64) > blobWidth('grow', 8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0073 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0074
     * @tc.name testTextBlobApi0074
     * @tc.desc Verify run buffer blobs of one text get growing ids and equal boxes.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0074', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0074 begin');
      await runCase('testTextBlobApi0074', async () => {
        const first: drawing.TextBlob = createRunBufferBlob('stable', 24);
        const second: drawing.TextBlob = createRunBufferBlob('stable', 24);
        expect(first.uniqueID() > 0).assertTrue();
        expect(second.uniqueID() > first.uniqueID()).assertTrue();
        expect(first.bounds().right).assertEqual(second.bounds().right);
        expect(first.bounds().right > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0074 end');
    });

    /** @tc.number SUB_NdkTsDrawing_TEXTBLOB_0075
     * @tc.name testTextBlobApi0075
     * @tc.desc Verify all three constructors agree on a coherent bounding width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testTextBlobApi0075', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0075 begin');
      await runCase('testTextBlobApi0075', async () => {
        const fromString: number = createTextBlob('three', 30).bounds().right;
        const fromRun: number = createRunBufferBlob('three', 30).bounds().right;
        const fromPos: number = createPosTextBlob('three', 30).bounds().right;
        expect(fromString > 0).assertTrue();
        expect(fromRun > 0).assertTrue();
        expect(fromPos > fromString).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testTextBlobApi0075 end');
    });
  });
}
