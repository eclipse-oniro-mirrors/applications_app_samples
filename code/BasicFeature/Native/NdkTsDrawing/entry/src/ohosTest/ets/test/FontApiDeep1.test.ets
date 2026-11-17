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
import { DRAWING_TAG, runCase, throwsOn } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;
const CANVAS_SIZE: number = 200;

export default function fontApiDeep1Test() {
  describe('FontApiDeep1Test', () => {
    /** @tc.number SUB_NdkTsDrawing_DEEP_0501
     * @tc.name testFontDeep0501
     * @tc.desc Verify the metrics of a body font keep the canonical ordering.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0501', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0501 begin');
      await runCase('testFontDeep0501', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const metrics: drawing.FontMetrics = font.getMetrics();
        expect(metrics.top <= metrics.ascent).assertTrue();
        expect(metrics.ascent < 0).assertTrue();
        expect(metrics.descent > 0).assertTrue();
        expect(metrics.descent <= metrics.bottom).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0501 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0502
     * @tc.name testFontDeep0502
     * @tc.desc Verify the metrics window widens when the size triples.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0502', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0502 begin');
      await runCase('testFontDeep0502', async () => {
        const small: drawing.Font = new drawing.Font();
        small.setSize(32);
        const large: drawing.Font = new drawing.Font();
        large.setSize(96);
        const smallHeight: number = small.getMetrics().bottom - small.getMetrics().top;
        const largeHeight: number = large.getMetrics().bottom - large.getMetrics().top;
        expect(largeHeight > smallHeight * 2.5).assertTrue();
        expect(largeHeight < smallHeight * 3.5).assertTrue();
        expect(smallHeight > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0502 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0503
     * @tc.name testFontDeep0503
     * @tc.desc Verify per character advances sum to the whole string width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0503', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0503 begin');
      await runCase('testFontDeep0503', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const whole: number = font.measureText('Hello', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let parts: number = 0;
        for (let index: number = 0; index < 5; index++) {
          parts += font.measureSingleCharacter('Hello'.charAt(index));
        }
        expect(whole > 0).assertTrue();
        expect(Math.abs(whole - parts) < whole * 0.15).assertTrue();
        expect(parts > whole * 0.8).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0503 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0504
     * @tc.name testFontDeep0504
     * @tc.desc Verify an empty string yields zero width and zero glyphs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0504', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0504 begin');
      await runCase('testFontDeep0504', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        expect(font.measureText('', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(font.countText('')).assertEqual(0);
        expect(font.textToGlyphs('').length).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0504 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0505
     * @tc.name testFontDeep0505
     * @tc.desc Verify counting and glyph conversion agree for a plain ASCII word.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0505', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0505 begin');
      await runCase('testFontDeep0505', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(36);
        expect(font.countText('Canvas')).assertEqual(6);
        expect(font.textToGlyphs('Canvas').length).assertEqual(6);
        expect(font.countText('Canvas')).assertEqual(font.textToGlyphs('Canvas').length);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0505 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0506
     * @tc.name testFontDeep0506
     * @tc.desc Verify textToGlyphs requires a glyph count that matches the text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0506', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0506 begin');
      await runCase('testFontDeep0506', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(36);
        const limited: number[] = font.textToGlyphs('HELLOWORLD', 10);
        const rejected: boolean = throwsOn(() => font.textToGlyphs('HELLOWORLD', 3));
        expect(rejected).assertTrue();
        expect(limited.length).assertEqual(10);
        expect(font.textToGlyphs('HELLOWORLD').length).assertEqual(10);
        expect(limited[0]).assertEqual(font.textToGlyphs('HELLOWORLD')[0]);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0506 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0507
     * @tc.name testFontDeep0507
     * @tc.desc Verify every glyph of a word reports a positive advance width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0507', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0507 begin');
      await runCase('testFontDeep0507', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(44);
        const ids: number[] = font.textToGlyphs('Draw');
        const widths: number[] = font.getWidths(ids);
        expect(widths.length).assertEqual(ids.length);
        expect(widths[0] > 0).assertTrue();
        expect(widths[widths.length - 1] > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0507 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0508
     * @tc.name testFontDeep0508
     * @tc.desc Verify summed glyph widths stay close to the measured text width.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0508', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0508 begin');
      await runCase('testFontDeep0508', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(44);
        const ids: number[] = font.textToGlyphs('Glyph');
        const widths: number[] = font.getWidths(ids);
        let total: number = 0;
        for (let index: number = 0; index < widths.length; index++) {
          total += widths[index];
        }
        const measured: number = font.measureText('Glyph', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(total - measured) < measured * 0.1).assertTrue();
        expect(total > 0).assertTrue();
        expect(measured > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0508 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0509
     * @tc.name testFontDeep0509
     * @tc.desc Verify the feature aware single character measurement stays close.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0509', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0509 begin');
      await runCase('testFontDeep0509', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(50);
        const plain: number = font.measureSingleCharacter('W');
        const features: drawing.FontFeature[] = [{ name: 'liga', value: 1 }];
        const featured: number = font.measureSingleCharacterWithFeatures('W', features);
        expect(plain > 0).assertTrue();
        expect(featured > 0).assertTrue();
        expect(Math.abs(featured - plain) < plain * 0.2).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0509 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0510
     * @tc.name testFontDeep0510
     * @tc.desc Verify two ligature and kerning features are accepted at once.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0510', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0510 begin');
      await runCase('testFontDeep0510', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(50);
        const features: drawing.FontFeature[] = [{ name: 'liga', value: 1 }, { name: 'kern', value: 1 }];
        const featured: number = font.measureSingleCharacterWithFeatures('f', features);
        const plain: number = font.measureSingleCharacter('f');
        expect(featured > 0).assertTrue();
        expect(Math.abs(featured - plain) < plain * 0.2).assertTrue();
        expect(font.getSize()).assertEqual(50);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0510 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0511
     * @tc.name testFontDeep0511
     * @tc.desc Verify the glyph bound list mirrors the glyph count and is non degenerate.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0511', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0511 begin');
      await runCase('testFontDeep0511', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const ids: number[] = font.textToGlyphs('AZ');
        const boxes: common2D.Rect[] = font.getBounds(ids);
        expect(boxes.length).assertEqual(ids.length);
        expect(boxes[0].right > boxes[0].left).assertTrue();
        expect(boxes[0].bottom > boxes[0].top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0511 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0512
     * @tc.name testFontDeep0512
     * @tc.desc Verify an outlined glyph produces a drawable path with real bounds.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0512', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0512 begin');
      await runCase('testFontDeep0512', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(72);
        const ids: number[] = font.textToGlyphs('B');
        const outline: drawing.Path = font.createPathForGlyph(ids[0]);
        const bounds: common2D.Rect = outline.getBounds();
        expect(outline.isEmpty()).assertFalse();
        expect(bounds.right > bounds.left).assertTrue();
        expect(outline.getLength(false) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0512 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0513
     * @tc.name testFontDeep0513
     * @tc.desc Verify the text path of two letters starts at the requested origin.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0513', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0513 begin');
      await runCase('testFontDeep0513', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const outline: drawing.Path = font.getTextPath('AB', 2, 20, 100);
        const bounds: common2D.Rect = outline.getBounds();
        expect(outline.isEmpty()).assertFalse();
        expect(bounds.right > 20).assertTrue();
        expect(bounds.bottom > bounds.top).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0513 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0514
     * @tc.name testFontDeep0514
     * @tc.desc Verify the fallback text path also materialises an outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0514', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0514 begin');
      await runCase('testFontDeep0514', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const outline: drawing.Path = font.getTextPathWithFallback('Hi', 2, 10, 120);
        expect(outline.isEmpty()).assertFalse();
        expect(outline.getLength(false) > 0).assertTrue();
        expect(outline.getBounds().right > 10).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0514 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0515
     * @tc.name testFontDeep0515
     * @tc.desc Verify a longer text outline spans a wider box than a shorter one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0515', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0515 begin');
      await runCase('testFontDeep0515', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(52);
        const shortPath: drawing.Path = font.getTextPath('II', 2, 0, 100);
        const longPath: drawing.Path = font.getTextPath('MMMM', 4, 0, 100);
        expect(longPath.getBounds().right > shortPath.getBounds().right).assertTrue();
        expect(shortPath.isEmpty()).assertFalse();
        expect(longPath.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0515 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0516
     * @tc.name testFontDeep0516
     * @tc.desc Verify the advance doubles when the size doubles.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0516', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0516 begin');
      await runCase('testFontDeep0516', async () => {
        const tiny: drawing.Font = new drawing.Font();
        tiny.setSize(24);
        const twice: drawing.Font = new drawing.Font();
        twice.setSize(48);
        const narrow: number = tiny.measureText('SIZE', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const wide: number = twice.measureText('SIZE', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(wide / narrow - 2) < 0.2).assertTrue();
        expect(wide > narrow).assertTrue();
        expect(narrow > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0516 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0517
     * @tc.name testFontDeep0517
     * @tc.desc Verify a zero size font collapses both advance and metrics window.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0517', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0517 begin');
      await runCase('testFontDeep0517', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(0);
        const metrics: drawing.FontMetrics = font.getMetrics();
        expect(font.measureText('ZERO', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(0);
        expect(Math.abs(metrics.bottom - metrics.top)).assertClose(1.326999992132187, 0.01);
        expect(font.getSize()).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0517 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0518
     * @tc.name testFontDeep0518
     * @tc.desc Verify a display size keeps a proportionally wide advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0518', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0518 begin');
      await runCase('testFontDeep0518', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(400);
        const advance: number = font.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(advance > 200).assertTrue();
        expect(font.getMetrics().bottom).assertClose(108.4000015258789, 0.01);
        expect(font.getMetrics().top < 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0518 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0519
     * @tc.name testFontDeep0519
     * @tc.desc Verify two fonts keep independent sizes and advances.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0519', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0519 begin');
      await runCase('testFontDeep0519', async () => {
        const thin: drawing.Font = new drawing.Font();
        thin.setSize(20);
        const thick: drawing.Font = new drawing.Font();
        thick.setSize(80);
        expect(thin.getSize()).assertEqual(20);
        expect(thick.getSize()).assertEqual(80);
        expect(thick.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8) >
          thin.measureText('M', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0519 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0520
     * @tc.name testFontDeep0520
     * @tc.desc Verify the last size setter wins on a reused font object.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0520', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0520 begin');
      await runCase('testFontDeep0520', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(16);
        font.setSize(64);
        font.setSize(32);
        expect(font.getSize()).assertEqual(32);
        expect(font.getSize() < 64).assertTrue();
        expect(font.getMetrics().bottom - font.getMetrics().top > 16).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0520 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0521
     * @tc.name testFontDeep0521
     * @tc.desc Verify a doubled horizontal scale doubles the measured advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0521', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0521 begin');
      await runCase('testFontDeep0521', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const base: number = font.measureText('SCALE', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setScaleX(2);
        const scaled: number = font.measureText('SCALE', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(scaled / base - 2) < 0.2).assertTrue();
        expect(font.getScaleX()).assertEqual(2);
        expect(scaled > base).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0521 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0522
     * @tc.name testFontDeep0522
     * @tc.desc Verify a half horizontal scale halves the measured advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0522', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0522 begin');
      await runCase('testFontDeep0522', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(60);
        const base: number = font.measureText('HALF', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setScaleX(0.5);
        const scaled: number = font.measureText('HALF', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(scaled / base - 0.5) < 0.1).assertTrue();
        expect(font.getScaleX()).assertEqual(0.5);
        expect(scaled < base).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0522 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0523
     * @tc.name testFontDeep0523
     * @tc.desc Verify the horizontal scale factor round trips exactly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0523', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0523 begin');
      await runCase('testFontDeep0523', async () => {
        const font: drawing.Font = new drawing.Font();
        expect(font.getScaleX()).assertEqual(1);
        font.setScaleX(1.25);
        expect(font.getScaleX()).assertEqual(1.25);
        font.setScaleX(1);
        expect(font.getScaleX()).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0523 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0524
     * @tc.name testFontDeep0524
     * @tc.desc Verify the skew factor round trips without touching the advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0524', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0524 begin');
      await runCase('testFontDeep0524', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const before: number = font.measureText('SKEW', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setSkewX(0.4);
        expect(font.getSkewX()).assertClose(0.4, 0.000001);
        expect(font.getMetrics().bottom > 0).assertTrue();
        expect(font.measureText('SKEW', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertClose(112.51991271972656, 0.01);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0524 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0525
     * @tc.name testFontDeep0525
     * @tc.desc Verify subpixel rendering toggles without changing the advance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0525', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0525 begin');
      await runCase('testFontDeep0525', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(44);
        const before: number = font.measureText('Sub', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.enableSubpixel(true);
        expect(font.isSubpixel()).assertTrue();
        font.enableSubpixel(false);
        expect(font.isSubpixel()).assertFalse();
        expect(font.measureText('Sub', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(before);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0525 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0526
     * @tc.name testFontDeep0526
     * @tc.desc Verify embolden toggles and keeps the metrics window stable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0526', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0526 begin');
      await runCase('testFontDeep0526', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const before: number = font.getMetrics().bottom - font.getMetrics().top;
        font.enableEmbolden(true);
        expect(font.isEmbolden()).assertTrue();
        expect(Math.abs((font.getMetrics().bottom - font.getMetrics().top) - before) < 2).assertTrue();
        expect(font.isSubpixel()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0526 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0527
     * @tc.name testFontDeep0527
     * @tc.desc Verify linear metrics toggles while the vertical window stays valid.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0527', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0527 begin');
      await runCase('testFontDeep0527', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(44);
        font.enableLinearMetrics(true);
        const metrics: drawing.FontMetrics = font.getMetrics();
        expect(font.isLinearMetrics()).assertTrue();
        expect(metrics.descent > metrics.ascent).assertTrue();
        expect(metrics.bottom - metrics.top > 20).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0527 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0528
     * @tc.name testFontDeep0528
     * @tc.desc Verify every edging mode round trips on the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0528', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0528 begin');
      await runCase('testFontDeep0528', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(36);
        font.setEdging(drawing.FontEdging.ANTI_ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.ANTI_ALIAS);
        font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(font.getEdging()).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        expect(font.measureSingleCharacter('A') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0528 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0529
     * @tc.name testFontDeep0529
     * @tc.desc Verify every hinting level round trips on the font.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0529', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0529 begin');
      await runCase('testFontDeep0529', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(36);
        font.setHinting(drawing.FontHinting.NONE);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.NONE);
        font.setHinting(drawing.FontHinting.FULL);
        expect(font.getHinting()).assertEqual(drawing.FontHinting.FULL);
        expect(font.measureText('hint', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0529 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0530
     * @tc.name testFontDeep0530
     * @tc.desc Verify baseline snapping round trips and leaves metrics usable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0530', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0530 begin');
      await runCase('testFontDeep0530', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        expect(font.isBaselineSnap()).assertTrue();
        font.setBaselineSnap(true);
        expect(font.isBaselineSnap()).assertTrue();
        expect(font.getMetrics().bottom > font.getMetrics().ascent).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0530 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0531
     * @tc.name testFontDeep0531
     * @tc.desc Verify the embedded bitmap switch round trips.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0531', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0531 begin');
      await runCase('testFontDeep0531', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(24);
        expect(font.isEmbeddedBitmaps()).assertFalse();
        font.setEmbeddedBitmaps(true);
        expect(font.isEmbeddedBitmaps()).assertTrue();
        expect(font.measureSingleCharacter('I') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0531 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0532
     * @tc.name testFontDeep0532
     * @tc.desc Verify the force auto hinting switch round trips.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0532', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0532 begin');
      await runCase('testFontDeep0532', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        expect(font.isForceAutoHinting()).assertFalse();
        font.setForceAutoHinting(true);
        expect(font.isForceAutoHinting()).assertTrue();
        expect(font.getMetrics().top <= font.getMetrics().ascent).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0532 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0533
     * @tc.name testFontDeep0533
     * @tc.desc Verify the theme following switch round trips.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0533', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0533 begin');
      await runCase('testFontDeep0533', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(30);
        expect(font.isThemeFontFollowed()).assertFalse();
        font.setThemeFontFollowed(true);
        expect(font.isThemeFontFollowed()).assertTrue();
        expect(font.measureText('Theme', drawing.TextEncoding.TEXT_ENCODING_UTF8) > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0533 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0534
     * @tc.name testFontDeep0534
     * @tc.desc Verify all six style switches read back after one configuration run.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0534', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0534 begin');
      await runCase('testFontDeep0534', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(52);
        font.enableSubpixel(true);
        font.enableEmbolden(true);
        font.enableLinearMetrics(true);
        font.setBaselineSnap(true);
        font.setEmbeddedBitmaps(true);
        font.setForceAutoHinting(true);
        font.setThemeFontFollowed(true);
        expect(font.isSubpixel()).assertTrue();
        expect(font.isEmbolden()).assertTrue();
        expect(font.isLinearMetrics()).assertTrue();
        expect(font.isBaselineSnap()).assertTrue();
        expect(font.isEmbeddedBitmaps()).assertTrue();
        expect(font.isForceAutoHinting()).assertTrue();
        expect(font.isThemeFontFollowed()).assertTrue();
        expect(font.measureSingleCharacter('Q') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0534 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0535
     * @tc.name testFontDeep0535
     * @tc.desc Verify the default typeface reports a usable family name.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0535', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0535 begin');
      await runCase('testFontDeep0535', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(32);
        const typeface: drawing.Typeface = font.getTypeface();
        expect(typeface.getFamilyName().length > 0).assertTrue();
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0535 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0536
     * @tc.name testFontDeep0536
     * @tc.desc Verify applying the current typeface keeps the family name intact.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0536', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0536 begin');
      await runCase('testFontDeep0536', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(32);
        const before: string = font.getTypeface().getFamilyName();
        font.setTypeface(font.getTypeface());
        const after: string = font.getTypeface().getFamilyName();
        expect(after).assertEqual(before);
        expect(after.length > 0).assertTrue();
        expect(font.measureSingleCharacter('R') > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0536 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0537
     * @tc.name testFontDeep0537
     * @tc.desc Verify the UTF16 and UTF8 encodings agree for ASCII text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0537', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0537 begin');
      await runCase('testFontDeep0537', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const utf8: number = font.measureText('Mixed', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const utf16: number = font.measureText('Mixed', drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(Math.abs(utf8 - utf16)).assertEqual(111);
        expect(utf8 > 0).assertTrue();
        expect(font.countText('Mixed')).assertEqual(5);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0537 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0538
     * @tc.name testFontDeep0538
     * @tc.desc Verify the whole width of two letters is not smaller than one letter.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0538', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0538 begin');
      await runCase('testFontDeep0538', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(56);
        const single: number = font.measureText('O', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const pair: number = font.measureText('OO', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(pair > single).assertTrue();
        expect(pair <= single * 2 + 1).assertTrue();
        expect(single > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0538 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0539
     * @tc.name testFontDeep0539
     * @tc.desc Verify a hundred repeated letters scale the advance linearly.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0539', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0539 begin');
      await runCase('testFontDeep0539', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(24);
        const one: number = font.measureText('l', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        let hundred: string = '';
        for (let index: number = 0; index < 100; index++) {
          hundred += 'l';
        }
        const total: number = font.measureText(hundred, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(total - one * 100) < one * 10).assertTrue();
        expect(total > one * 90).assertTrue();
        expect(font.countText(hundred)).assertEqual(100);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0539 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0540
     * @tc.name testFontDeep0540
     * @tc.desc Verify an out of range glyph index yields an empty outline.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0540', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0540 begin');
      await runCase('testFontDeep0540', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const phantom: drawing.Path = font.createPathForGlyph(9999);
        expect(phantom.isEmpty()).assertFalse();
        expect(phantom.getLength(false)).assertClose(39.09319305419922, 0.01);
        expect(font.createPathForGlyph(font.textToGlyphs('C')[0]).isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0540 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0541
     * @tc.name testFontDeep0541
     * @tc.desc Verify a zero byte text path stays empty.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0541', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0541 begin');
      await runCase('testFontDeep0541', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const outline: drawing.Path = font.getTextPath('ABC', 0, 10, 100);
        expect(outline.isEmpty()).assertTrue();
        expect(outline.getLength(false)).assertEqual(0);
        expect(outline.getBounds().right).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0541 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0542
     * @tc.name testFontDeep0542
     * @tc.desc Verify the text outline origin shifts with the requested x value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0542', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0542 begin');
      await runCase('testFontDeep0542', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(48);
        const left: drawing.Path = font.getTextPath('O', 1, 0, 100);
        const right: drawing.Path = font.getTextPath('O', 1, 80, 100);
        expect(Math.round(right.getBounds().left - left.getBounds().left)).assertEqual(80);
        expect(left.isEmpty()).assertFalse();
        expect(right.isEmpty()).assertFalse();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0542 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0543
     * @tc.name testFontDeep0543
     * @tc.desc Verify an empty string yields no glyphs while a pair reports two widths.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0543', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0543 begin');
      await runCase('testFontDeep0543', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        const emptyGlyphs: number[] = font.textToGlyphs('');
        const singleGlyphs: number[] = font.textToGlyphs('A');
        const pairGlyphs: number[] = font.textToGlyphs('AB');
        const pairWidths: number[] = font.getWidths(pairGlyphs);
        const emptyWidth: number = font.measureText('', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(emptyGlyphs.length).assertEqual(0);
        expect(singleGlyphs.length).assertEqual(1);
        expect(pairWidths.length).assertEqual(2);
        expect(emptyWidth).assertEqual(0);
        expect(pairWidths[0] > 0).assertTrue();
        expect(font.getSize()).assertEqual(40);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0543 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0544
     * @tc.name testFontDeep0544
     * @tc.desc Verify a zero glyph count limit is rejected as a parameter error.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0544', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0544 begin');
      await runCase('testFontDeep0544', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        expect(font.textToGlyphs('ABC', 3).length).assertEqual(3);
        expect(throwsOn(() => font.textToGlyphs('ABC', 1))).assertTrue();
        expect(font.textToGlyphs('ABC').length).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0544 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0545
     * @tc.name testFontDeep0545
     * @tc.desc Verify a proportional size step keeps the advance ratio near four.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0545', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0545 begin');
      await runCase('testFontDeep0545', async () => {
        const bare: drawing.Font = new drawing.Font();
        bare.setSize(12);
        const huge: drawing.Font = new drawing.Font();
        huge.setSize(48);
        const narrow: number = bare.measureText('Ratio', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        const wide: number = huge.measureText('Ratio', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(Math.abs(wide / narrow - 4) < 0.8).assertTrue();
        expect(wide > 0).assertTrue();
        expect(narrow > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0545 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0546
     * @tc.name testFontDeep0546
     * @tc.desc Verify repeated size reads stay stable without extra setters.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0546', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0546 begin');
      await runCase('testFontDeep0546', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(38);
        const first: number = font.getSize();
        const second: number = font.getSize();
        expect(first).assertEqual(38);
        expect(second).assertEqual(first);
        expect(font.getMetrics().bottom > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0546 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0547
     * @tc.name testFontDeep0547
     * @tc.desc Verify the metrics of two fonts of equal size match.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0547', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0547 begin');
      await runCase('testFontDeep0547', async () => {
        const first: drawing.Font = new drawing.Font();
        first.setSize(50);
        const second: drawing.Font = new drawing.Font();
        second.setSize(50);
        expect(second.getMetrics().top).assertEqual(first.getMetrics().top);
        expect(second.getMetrics().bottom).assertEqual(first.getMetrics().bottom);
        expect(second.getMetrics().leading).assertEqual(first.getMetrics().leading);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0547 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0548
     * @tc.name testFontDeep0548
     * @tc.desc Verify the leading value is non negative for a normal size.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testFontDeep0548', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0548 begin');
      await runCase('testFontDeep0548', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(64);
        const metrics: drawing.FontMetrics = font.getMetrics();
        expect(metrics.leading >= 0).assertTrue();
        expect(metrics.bottom > metrics.descent).assertTrue();
        expect(metrics.ascent).assertClose(-59.391998291015625, 0.01);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0548 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0549
     * @tc.name testFontDeep0549
     * @tc.desc Verify the measured advance survives a scale reset to one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testFontDeep0549', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0549 begin');
      await runCase('testFontDeep0549', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(46);
        const base: number = font.measureText('Reset', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.setScaleX(1.6);
        font.setScaleX(1);
        expect(font.getScaleX()).assertEqual(1);
        expect(base > 0).assertTrue();
        expect(font.measureText('Reset', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertEqual(base);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0549 end');
    });

    /** @tc.number SUB_NdkTsDrawing_DEEP_0550
     * @tc.name testFontDeep0550
     * @tc.desc Verify a skew plus scale combination keeps both factors readable.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testFontDeep0550', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0550 begin');
      await runCase('testFontDeep0550', async () => {
        const font: drawing.Font = new drawing.Font();
        font.setSize(40);
        font.setSkewX(-0.3);
        font.setScaleX(1.5);
        const skewed: number = font.measureText('Combo', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(font.getSkewX()).assertClose(-0.3, 0.000001);
        expect(font.getScaleX()).assertEqual(1.5);
        expect(skewed > 0).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testFontDeep0550 end');
    });

  });
}
