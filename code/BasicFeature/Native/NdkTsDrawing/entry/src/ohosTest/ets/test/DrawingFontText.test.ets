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
import { common2D, drawing } from '@kit.ArkGraphics2D';
import { createOffscreenTarget, OffscreenTarget } from '../../../main/ets/drawing/DrawingCanvasFactory';
import {
  applyFontStyle,
  countGlyphs,
  createFont,
  createPosTextBlob,
  createRunBufferBlob,
  FontMetricsSnapshot,
  FontSnapshot,
  glyphBounds,
  glyphIds,
  glyphIdsLimited,
  glyphOutline,
  glyphWidths,
  measureCharacter,
  measureCharacterWithFeatures,
  measureString,
  paintGlyphs,
  paintSingleCharacter,
  paintTextBlob,
  snapshotFont,
  snapshotMetrics,
  textBlobBounds,
  textBlobIdStable,
  textOutline,
  textOutlineWithFallback
} from '../../../main/ets/drawing/DrawingFontText';
import { countInkedPixels, readPixelBuffer, runCase, throwsOn } from './DrawingTestRunner';

export default function drawingFontTextTest() {
  describe('DrawingFontTextTest', () => {
    /**
     * @tc.number SUB_FONT_TEXT_0100
     * @tc.name testFontText0001
     * @tc.desc Verify the font keeps the requested size.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0001', 0, async (done: Function) => {
      await runCase('testFontText0001', async () => {
        const snapshot: FontSnapshot = snapshotFont(createFont(40));
        expect(snapshot.size).assertEqual(40);
        expect(snapshot.scaleX).assertEqual(1);
        expect(snapshot.skewX).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0200
     * @tc.name testFontText0002
     * @tc.desc Verify the default typeface of a fresh font.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0002', 0, async (done: Function) => {
      await runCase('testFontText0002', async () => {
        const snapshot: FontSnapshot = snapshotFont(createFont(32));
        expect(snapshot.familyName.length).assertLarger(0);
        expect(snapshot.bold).assertFalse();
        expect(snapshot.italic).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0300
     * @tc.name testFontText0003
     * @tc.desc Verify the boolean font switches applied by the style helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0003', 0, async (done: Function) => {
      await runCase('testFontText0003', async () => {
        const font: drawing.Font = createFont(30);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.subpixel).assertTrue();
        expect(snapshot.embolden).assertTrue();
        expect(snapshot.linearMetrics).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0400
     * @tc.name testFontText0004
     * @tc.desc Verify the scale and skew factors applied by the style helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0004', 0, async (done: Function) => {
      await runCase('testFontText0004', async () => {
        const font: drawing.Font = createFont(30);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(Math.abs(snapshot.scaleX - 1.1) < 0.001).assertTrue();
        expect(Math.abs(snapshot.skewX - 0.1) < 0.001).assertTrue();
        expect(snapshot.size).assertEqual(30);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0500
     * @tc.name testFontText0005
     * @tc.desc Verify the edging and hinting modes applied by the style helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0005', 0, async (done: Function) => {
      await runCase('testFontText0005', async () => {
        const font: drawing.Font = createFont(30);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.edging).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(snapshot.hinting).assertEqual(drawing.FontHinting.FULL);
        expect(snapshot.subpixel).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0600
     * @tc.name testFontText0006
     * @tc.desc Verify the hinting switches applied by the style helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0006', 0, async (done: Function) => {
      await runCase('testFontText0006', async () => {
        const font: drawing.Font = createFont(30);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.baselineSnap).assertTrue();
        expect(snapshot.embeddedBitmaps).assertTrue();
        expect(snapshot.forceAutoHinting).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0700
     * @tc.name testFontText0007
     * @tc.desc Verify the theme following switch is disabled by the style helper.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0007', 0, async (done: Function) => {
      await runCase('testFontText0007', async () => {
        const font: drawing.Font = createFont(30);
        applyFontStyle(font);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.themeFollowed).assertFalse();
        expect(snapshot.subpixel).assertTrue();
        expect(snapshot.embolden).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0800
     * @tc.name testFontText0008
     * @tc.desc Verify the ascent of the font metrics is above the baseline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0008', 0, async (done: Function) => {
      await runCase('testFontText0008', async () => {
        const metrics: FontMetricsSnapshot = snapshotMetrics(createFont(40));
        expect(metrics.ascent < 0).assertTrue();
        expect(metrics.top <= metrics.ascent).assertTrue();
        expect(metrics.descent > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_0900
     * @tc.name testFontText0009
     * @tc.desc Verify the descent and bottom values of the font metrics.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0009', 0, async (done: Function) => {
      await runCase('testFontText0009', async () => {
        const metrics: FontMetricsSnapshot = snapshotMetrics(createFont(40));
        expect(metrics.bottom >= metrics.descent).assertTrue();
        expect(metrics.descent > 0).assertTrue();
        expect(metrics.leading >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1000
     * @tc.name testFontText0010
     * @tc.desc Verify a normal string has a positive measured width.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0010', 0, async (done: Function) => {
      await runCase('testFontText0010', async () => {
        const width: number = measureString('Hello', 40, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(width).assertLarger(0);
        expect(width < 400).assertTrue();
        expect(measureString('Hello', 20, drawing.TextEncoding.TEXT_ENCODING_UTF8) < width).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1100
     * @tc.name testFontText0011
     * @tc.desc Verify an empty string measures zero width.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0011', 0, async (done: Function) => {
      await runCase('testFontText0011', async () => {
        expect(measureString('', 40, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(measureString('A', 40, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertLarger(0);
        expect(measureString('AA', 40, drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1200
     * @tc.name testFontText0012
     * @tc.desc Verify a longer string measures a larger width.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0012', 0, async (done: Function) => {
      await runCase('testFontText0012', async () => {
        const short: number = measureString('Hi', 40, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const long: number = measureString('Hi Hi Hi', 40, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(long > short).assertTrue();
        expect(short).assertLarger(0);
        expect(long).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1300
     * @tc.name testFontText0013
     * @tc.desc Verify the single character measurement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0013', 0, async (done: Function) => {
      await runCase('testFontText0013', async () => {
        const width: number = measureCharacter('A', 40);
        expect(width).assertLarger(0);
        expect(width < 100).assertTrue();
        expect(measureCharacter('A', 40)).assertEqual(width);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1400
     * @tc.name testFontText0014
     * @tc.desc Verify the single character measurement with font features.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0014', 0, async (done: Function) => {
      await runCase('testFontText0014', async () => {
        const width: number = measureCharacterWithFeatures('A', 40);
        expect(width).assertLarger(0);
        expect(width < 100).assertTrue();
        expect(measureCharacterWithFeatures('B', 40)).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1500
     * @tc.name testFontText0015
     * @tc.desc Verify the character count of a plain string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0015', 0, async (done: Function) => {
      await runCase('testFontText0015', async () => {
        expect(countGlyphs('Hello')).assertEqual(5);
        expect(countGlyphs('')).assertEqual(0);
        expect(countGlyphs('Hi')).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1600
     * @tc.name testFontText0016
     * @tc.desc Verify the glyph ids of a plain string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0016', 0, async (done: Function) => {
      await runCase('testFontText0016', async () => {
        const ids: number[] = glyphIds('Hello');
        expect(ids.length).assertEqual(5);
        expect(ids[0] >= 0).assertTrue();
        expect(glyphIds('').length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1700
     * @tc.name testFontText0017
     * @tc.desc Verify the limited glyph id conversion rejects a count that does not match the text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0017', 0, async (done: Function) => {
      await runCase('testFontText0017', async () => {
        const rejectedShort: boolean = throwsOn(() => glyphIdsLimited('Hello', 2));
        const rejectedZero: boolean = throwsOn(() => glyphIdsLimited('Hello', 0));
        expect(rejectedShort).assertTrue();
        expect(rejectedZero).assertTrue();
        expect(glyphIdsLimited('Hello', 5).length).assertEqual(5);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1800
     * @tc.name testFontText0018
     * @tc.desc Verify the glyph advance widths.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0018', 0, async (done: Function) => {
      await runCase('testFontText0018', async () => {
        const widths: number[] = glyphWidths('Hello');
        expect(widths.length).assertEqual(5);
        expect(widths[0]).assertLarger(0);
        expect(glyphIds('').length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_1900
     * @tc.name testFontText0019
     * @tc.desc Verify the glyph bounding boxes are flattened to four numbers each.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0019', 0, async (done: Function) => {
      await runCase('testFontText0019', async () => {
        const bounds: number[] = glyphBounds('Hello', 40);
        expect(bounds.length).assertEqual(20);
        expect(bounds[2] > bounds[0]).assertTrue();
        expect(glyphBounds('', 40).length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2000
     * @tc.name testFontText0020
     * @tc.desc Verify the text outline path of a plain string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0020', 0, async (done: Function) => {
      await runCase('testFontText0020', async () => {
        const path: drawing.Path = textOutline('Hello', 40);
        expect(path.isEmpty()).assertFalse();
        expect(path.getLength(true)).assertLarger(0);
        expect(path.getBounds().right > path.getBounds().left).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2100
     * @tc.name testFontText0021
     * @tc.desc Verify the fallback text outline path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0021', 0, async (done: Function) => {
      await runCase('testFontText0021', async () => {
        const path: drawing.Path = textOutlineWithFallback('Hello', 40);
        expect(path.isEmpty()).assertFalse();
        expect(path.getLength(true)).assertLarger(0);
        expect(textOutlineWithFallback('', 40).isEmpty()).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2200
     * @tc.name testFontText0022
     * @tc.desc Verify the glyph outline of a valid and invalid index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0022', 0, async (done: Function) => {
      await runCase('testFontText0022', async () => {
        const outline: drawing.Path = glyphOutline('Hello', 40, 0);
        expect(outline.isEmpty()).assertFalse();
        expect(glyphOutline('Hello', 40, 99).isEmpty()).assertTrue();
        expect(glyphOutline('Hello', 40, -1).isEmpty()).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2300
     * @tc.name testFontText0023
     * @tc.desc Verify the text blob bounds of a plain string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0023', 0, async (done: Function) => {
      await runCase('testFontText0023', async () => {
        const bounds: number[] = textBlobBounds('Hello', 40);
        expect(bounds.length).assertEqual(4);
        expect(bounds[2] > bounds[0]).assertTrue();
        expect(bounds[3] > bounds[1]).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2400
     * @tc.name testFontText0024
     * @tc.desc Verify two text blobs of the same text report distinct ids but one box.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0024', 0, async (done: Function) => {
      await runCase('testFontText0024', async () => {
        const stableFirst: boolean = textBlobIdStable('Hello', 40);
        const stableSecond: boolean = textBlobIdStable('Hello', 40);
        expect(stableFirst).assertFalse();
        expect(stableSecond).assertEqual(stableFirst);
        expect(textBlobBounds('Hello', 40)[2] > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2500
     * @tc.name testFontText0025
     * @tc.desc Verify the text blob built from a run buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0025', 0, async (done: Function) => {
      await runCase('testFontText0025', async () => {
        const blob: drawing.TextBlob = createRunBufferBlob('Hi', 40);
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.right).assertLarger(0);
        expect(bounds.bottom).assertLarger(0);
        expect(blob.uniqueID() >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2600
     * @tc.name testFontText0026
     * @tc.desc Verify the text blob built from explicit points.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0026', 0, async (done: Function) => {
      await runCase('testFontText0026', async () => {
        const blob: drawing.TextBlob = createPosTextBlob('Hi', 40);
        const bounds: common2D.Rect = blob.bounds();
        expect(bounds.right).assertLarger(0);
        expect(bounds.bottom).assertLarger(0);
        expect(bounds.left >= 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2700
     * @tc.name testFontText0027
     * @tc.desc Verify drawing a single character paints pixels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0027', 0, async (done: Function) => {
      await runCase('testFontText0027', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintSingleCharacter(target.canvas, 'A');
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getWidth()).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2800
     * @tc.name testFontText0028
     * @tc.desc Verify drawing glyphs with explicit positions paints pixels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0028', 0, async (done: Function) => {
      await runCase('testFontText0028', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintGlyphs(target.canvas, 'Hi');
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.isClipEmpty()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_2900
     * @tc.name testFontText0029
     * @tc.desc Verify drawing a text blob paints pixels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFontText0029', 0, async (done: Function) => {
      await runCase('testFontText0029', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(240, 240);
        paintTextBlob(target.canvas, 'Hello World');
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertLarger(0);
        expect(target.canvas.getWidth()).assertEqual(240);
        expect(target.canvas.getSaveCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_FONT_TEXT_3000
     * @tc.name testFontText0030
     * @tc.desc Verify an empty glyph list draws nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFontText0030', 0, async (done: Function) => {
      await runCase('testFontText0030', async () => {
        const target: OffscreenTarget = await createOffscreenTarget(200, 200);
        paintGlyphs(target.canvas, '');
        const buffer: ArrayBuffer = await readPixelBuffer(target.pixelMap);
        expect(countInkedPixels(buffer)).assertEqual(0);
        expect(target.canvas.getSaveCount()).assertEqual(1);
        expect(target.canvas.getHeight()).assertEqual(200);
      }, done);
    });
  });
}
