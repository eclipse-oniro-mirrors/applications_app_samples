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
import {
  applyTypeface,
  createFont,
  FontSnapshot,
  loadSystemTypeface,
  makeTypefaceFromCurrent,
  snapshotFont,
  typefaceVariation
} from '../../../main/ets/drawing/DrawingFontText';
import { runCase } from './DrawingTestRunner';

export default function drawingTypefaceTest() {
  describe('DrawingTypefaceTest', () => {
    /**
     * @tc.number SUB_TYPEFACE_0100
     * @tc.name testTypeface0001
     * @tc.desc Verify the default system typeface reports a valid family name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTypeface0001', 0, async (done: Function) => {
      await runCase('testTypeface0001', async () => {
        const typeface: drawing.Typeface = loadSystemTypeface();
        expect(typeof typeface).assertEqual('object');
        expect(typeface.getFamilyName().length).assertLarger(0);
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TYPEFACE_0200
     * @tc.name testTypeface0002
     * @tc.desc Verify the default typeface family name is stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTypeface0002', 0, async (done: Function) => {
      await runCase('testTypeface0002', async () => {
        const first: drawing.Typeface = loadSystemTypeface();
        const second: drawing.Typeface = loadSystemTypeface();
        expect(first.getFamilyName()).assertEqual(second.getFamilyName());
        expect(first.getFamilyName().length).assertLarger(0);
        expect(first.getFamilyName().length < 200).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TYPEFACE_0300
     * @tc.name testTypeface0003
     * @tc.desc Verify applying a typeface on a sized font reports the same family.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTypeface0003', 0, async (done: Function) => {
      await runCase('testTypeface0003', async () => {
        const font: drawing.Font = createFont(30);
        const family: string = applyTypeface(font);
        expect(family.length).assertLarger(0);
        expect(family).assertEqual(font.getTypeface().getFamilyName());
        expect(family).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
    });

    /**
     * @tc.number SUB_TYPEFACE_0400
     * @tc.name testTypeface0004
     * @tc.desc Verify applying a typeface on a default font is repeatable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTypeface0004', 0, async (done: Function) => {
      await runCase('testTypeface0004', async () => {
        const family: string = applyTypeface(new drawing.Font());
        expect(family.length).assertLarger(0);
        expect(family).assertEqual(applyTypeface(new drawing.Font()));
        expect(family).assertEqual(loadSystemTypeface().getFamilyName());
      }, done);
    });

    /**
     * @tc.number SUB_TYPEFACE_0500
     * @tc.name testTypeface0005
     * @tc.desc Verify the typeface built from the current one keeps a valid family.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTypeface0005', 0, async (done: Function) => {
      await runCase('testTypeface0005', async () => {
        const typeface: drawing.Typeface = makeTypefaceFromCurrent();
        expect(typeof typeface).assertEqual('object');
        expect(typeface.getFamilyName().length).assertLarger(0);
        expect(typeface.isBold()).assertFalse();
        expect(typeface.isItalic()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TYPEFACE_0600
     * @tc.name testTypeface0006
     * @tc.desc Verify the typeface built from the current one is deterministic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTypeface0006', 0, async (done: Function) => {
      await runCase('testTypeface0006', async () => {
        const first: drawing.Typeface = makeTypefaceFromCurrent();
        const second: drawing.Typeface = makeTypefaceFromCurrent();
        expect(first.getFamilyName()).assertEqual(second.getFamilyName());
        expect(first.getFamilyName().length).assertLarger(0);
        expect(first.isItalic()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TYPEFACE_0700
     * @tc.name testTypeface0007
     * @tc.desc Verify the variation arguments can build a typeface.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testTypeface0007', 0, async (done: Function) => {
      await runCase('testTypeface0007', async () => {
        const args: drawing.TypefaceArguments = typefaceVariation();
        expect(typeof args).assertEqual('object');
        const applied: drawing.Typeface = loadSystemTypeface().makeFromCurrent(args);
        const font: drawing.Font = createFont(40);
        font.setTypeface(applied);
        expect(font.measureText('Hello', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertLarger(0);
        expect(applied.getFamilyName().length).assertLarger(0);
      }, done);
    });

    /**
     * @tc.number SUB_TYPEFACE_0800
     * @tc.name testTypeface0008
     * @tc.desc Verify a font keeps measuring text after the typeface is replaced.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTypeface0008', 0, async (done: Function) => {
      await runCase('testTypeface0008', async () => {
        const font: drawing.Font = createFont(40);
        font.setTypeface(loadSystemTypeface());
        expect(font.measureText('Hello', drawing.TextEncoding.TEXT_ENCODING_UTF8)).assertLarger(0);
        const snapshot: FontSnapshot = snapshotFont(font);
        expect(snapshot.familyName.length).assertLarger(0);
        expect(snapshot.size).assertEqual(40);
      }, done);
    });
  });
}
