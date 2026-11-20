/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import {
  keySourceListData,
  numberSourceListData,
  symbolSourceListData,
  keySourceListType,
  sourceListType,
  MenuKey,
  SubMenuType,
  MenuType,
  KeyState
} from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodKeyTableInvariant]';

export default function KeyTableInvariantTestTest(): void {
  describe('KeyTableInvariantTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0001
     * @tc.name      testKeyTableInvariantTest_001
     * @tc.desc      Verify that the alphabet table follows the qwerty row order from q through m.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_001 begin');
      const letters: string[] = keySourceListData.map((entry: keySourceListType) => entry.content);

      // Table order is asserted directly because the page indexes rows positionally.
      expect(letters.join('')).assertEqual('qwertyuiopasdfghjklzxcvbnm');
      expect(letters[0]).assertEqual('q');
      expect(letters[9]).assertEqual('p');
      expect(letters[10]).assertEqual('a');
      expect(letters[19]).assertEqual('z');
      expect(letters[25]).assertEqual('m');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_001 end');
      // The case ends only after every asserted channel has stopped changing.
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0002
     * @tc.name      testKeyTableInvariantTest_002
     * @tc.desc      Verify that all twenty-six alphabet titles are present and distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_002 begin');
      const titles: Set<string> = new Set<string>();

      for (let i = 0; i < keySourceListData.length; i++) {
        const title: string = keySourceListData[i].title;
        expect(title.length > 0).assertTrue();
        titles.add(title);
      }
      expect(titles.size).assertEqual(26);
      expect(titles.has('1')).assertTrue();
      expect(titles.has('0')).assertTrue();
      expect(titles.has('?')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_002 end');
      // The final check covers the contract this case was written to protect.
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0003
     * @tc.name      testKeyTableInvariantTest_003
     * @tc.desc      Verify that the number page starts with the ten digits and then keeps seventeen symbols.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_003 begin');
      const contents: string[] = numberSourceListData.map((entry: sourceListType) => entry.content);
      const digits: string[] = contents.slice(0, 10);
      const symbols: string[] = contents.slice(10);

      expect(contents.length).assertEqual(27);
      expect(digits.join('')).assertEqual('1234567890');
      expect(symbols.join('')).assertEqual('@#$%&-+()/*"\':;!?');
      expect(symbols.length).assertEqual(17);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0004
     * @tc.name      testKeyTableInvariantTest_004
     * @tc.desc      Verify that the symbol page holds twenty-seven entries bounded by tilde and right bracket.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_004 begin');
      const contents: string[] = symbolSourceListData.map((entry: sourceListType) => entry.content);

      expect(contents.length).assertEqual(27);
      expect(contents[0]).assertEqual('~');
      expect(contents[1]).assertEqual('`');
      expect(contents[25]).assertEqual('[');
      expect(contents[26]).assertEqual(']');
      expect(contents.indexOf('=') >= 0).assertTrue();
      expect(contents.indexOf('€') >= 0).assertTrue();
      expect(contents.indexOf('©') >= 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0005
     * @tc.name      testKeyTableInvariantTest_005
     * @tc.desc      Verify that no entry in any of the three pages has an empty glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_005 begin');

      for (let i = 0; i < keySourceListData.length; i++) {
        // Resource identity matters because the UI consumes the handle directly.
        expect(keySourceListData[i].content.length > 0).assertTrue();
        expect(keySourceListData[i].upperContent.length > 0).assertTrue();
      }
      for (let i = 0; i < numberSourceListData.length; i++) {
        expect(numberSourceListData[i].content.length > 0).assertTrue();
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        expect(symbolSourceListData[i].content.length > 0).assertTrue();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_005 end');
      // The singleton must be left clean so the next suite starts from a known state.
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0006
     * @tc.name      testKeyTableInvariantTest_006
     * @tc.desc      Verify that the number and symbol pages share no glyph and each page is unique.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_006 begin');
      const numberSet: Set<string> = new Set<string>();
      const symbolSet: Set<string> = new Set<string>();

      for (let i = 0; i < numberSourceListData.length; i++) {
        numberSet.add(numberSourceListData[i].content);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolSet.add(symbolSourceListData[i].content);
      }
      expect(numberSet.size).assertEqual(27);
      expect(symbolSet.size).assertEqual(27);
      for (let i = 0; i < numberSourceListData.length; i++) {
        expect(symbolSet.has(numberSourceListData[i].content)).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0007
     * @tc.name      testKeyTableInvariantTest_007
     * @tc.desc      Verify that alphabet glyphs are all lowercase letters and their upper forms differ.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_007 begin');

      for (let i = 0; i < keySourceListData.length; i++) {
        const entry: keySourceListType = keySourceListData[i];
        expect(entry.content >= 'a' && entry.content <= 'z').assertTrue();
        expect(entry.upperContent).assertEqual(entry.content.toUpperCase());
        expect(entry.upperContent === entry.content).assertFalse();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_0008
     * @tc.name      testKeyTableInvariantTest_008
     * @tc.desc      Verify that the symbol page contains no digit glyph from the number page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableInvariantTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_008 begin');

      for (let i = 0; i < symbolSourceListData.length; i++) {
        const content: string = symbolSourceListData[i].content;
        expect(content >= '0' && content <= '9').assertFalse();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableInvariantTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0001
     * @tc.name      testKeyTableRowLayout_001
     * @tc.desc      Verify that the twenty-six letters split into rows of ten, nine and seven keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_001 begin');
      const rowBounds: number[] = [0, 10, 19, 26];
      const rowText: string[] = [];

      for (let i = 0; i < rowBounds.length - 1; i++) {
        const start: number = rowBounds[i];
        const end: number = rowBounds[i + 1];
        const cells: string[] = keySourceListData.slice(start, end)
          .map((entry: keySourceListType) => entry.content);
        rowText.push(cells.join(''));
      }
      expect(rowText.length).assertEqual(3);
      expect(rowText[0]).assertEqual('qwertyuiop');
      expect(rowText[1]).assertEqual('asdfghjkl');
      expect(rowText[2]).assertEqual('zxcvbnm');
      expect(rowText[0].length).assertEqual(10);
      expect(rowText[1].length).assertEqual(9);
      expect(rowText[2].length).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0002
     * @tc.name      testKeyTableRowLayout_002
     * @tc.desc      Verify that the top row is labelled by the ten digits in the order one through zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_002 begin');
      const topLabels: string[] = keySourceListData.slice(0, 10)
        .map((entry: keySourceListType) => entry.title);

      expect(topLabels.join('')).assertEqual('1234567890');
      expect(topLabels[0]).assertEqual('1');
      expect(topLabels[9]).assertEqual('0');
      // The zero label sits on the letter p rather than on a punctuation key.
      expect(keySourceListData[9].content).assertEqual('p');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0003
     * @tc.name      testKeyTableRowLayout_003
     * @tc.desc      Verify that the middle row carries nine symbol labels ending with the question mark.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_003 begin');
      const middleLabels: string[] = keySourceListData.slice(10, 19)
        .map((entry: keySourceListType) => entry.title);

      expect(middleLabels.length).assertEqual(9);
      expect(middleLabels.join('')).assertEqual("~!@#%'&*?");
      expect(middleLabels[0]).assertEqual('~');
      expect(middleLabels[middleLabels.length - 1]).assertEqual('?');
      for (let i = 0; i < middleLabels.length; i++) {
        expect(middleLabels[i].length).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0004
     * @tc.name      testKeyTableRowLayout_004
     * @tc.desc      Verify that the bottom row starts with capital H and I labels then switches to marks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_004 begin');
      const bottomLabels: string[] = keySourceListData.slice(19)
        .map((entry: keySourceListType) => entry.title);

      expect(bottomLabels.length).assertEqual(7);
      expect(bottomLabels[0]).assertEqual('H');
      expect(bottomLabels[1]).assertEqual('I');
      // The remaining five labels are the macron, underscore, colon, semicolon and slash.
      expect(bottomLabels[2].charCodeAt(0)).assertEqual(175);
      expect(bottomLabels[3]).assertEqual('_');
      expect(bottomLabels.slice(5).join('')).assertEqual(';/');
      const markCodes: number[] = [];
      for (let i = 2; i < 5; i++) {
        markCodes.push(bottomLabels[i].charCodeAt(0));
      }
      expect(markCodes.join(',')).assertEqual('175,95,58');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0005
     * @tc.name      testKeyTableRowLayout_005
     * @tc.desc      Verify that the alphabet glyphs form a complete permutation of the lowercase range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_005 begin');
      const glyphs: string[] = keySourceListData.map((entry: keySourceListType) => entry.content);
      const ordered: string[] = glyphs.slice();

      ordered.sort();
      expect(ordered.join('')).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(glyphs.length).assertEqual(ordered.length);
      const firstGlyph: string = glyphs[0];
      expect(firstGlyph).assertEqual('q');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0006
     * @tc.name      testKeyTableRowLayout_006
     * @tc.desc      Verify that every shifted glyph is exactly thirty-two code points above its base glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_006 begin');
      const deltas: number[] = [];

      for (let i = 0; i < keySourceListData.length; i++) {
        const baseCode: number = keySourceListData[i].content.charCodeAt(0);
        const shiftedCode: number = keySourceListData[i].upperContent.charCodeAt(0);
        deltas.push(shiftedCode - baseCode);
        expect(shiftedCode).assertEqual(baseCode - 32);
      }
      expect(deltas.length).assertEqual(26);
      let deltaSum: number = 0;
      for (let i = 0; i < deltas.length; i++) {
        deltaSum = deltaSum + deltas[i];
      }
      expect(deltaSum).assertEqual(-832);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0007
     * @tc.name      testKeyTableRowLayout_007
     * @tc.desc      Verify that every label and shifted glyph occupies a single UTF-16 code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_007 begin');
      const labelWidths: number[] = [];

      for (let i = 0; i < keySourceListData.length; i++) {
        const label: string = keySourceListData[i].title;
        const shifted: string = keySourceListData[i].upperContent;
        labelWidths.push(label.length);
        expect(label.length).assertEqual(1);
        expect(shifted.length).assertEqual(1);
      }
      expect(labelWidths.length).assertEqual(26);
      const widestLabel: number = labelWidths[12];
      expect(widestLabel).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0008
     * @tc.name      testKeyTableRowLayout_008
     * @tc.desc      Verify that the shifted glyphs are distinct and never reuse an unshifted glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_008 begin');
      const lower: Set<string> = new Set<string>();
      const upper: Set<string> = new Set<string>();

      for (let i = 0; i < keySourceListData.length; i++) {
        lower.add(keySourceListData[i].content);
        upper.add(keySourceListData[i].upperContent);
      }
      expect(upper.size).assertEqual(26);
      for (let i = 0; i < keySourceListData.length; i++) {
        expect(upper.has(keySourceListData[i].content)).assertFalse();
      }
      expect(lower.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0009
     * @tc.name      testKeyTableRowLayout_009
     * @tc.desc      Verify that no glyph is shared between two alphabet rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_009 begin');
      const firstRow: Set<string> = new Set<string>();
      const secondRow: Set<string> = new Set<string>();

      for (let i = 0; i < 10; i++) {
        firstRow.add(keySourceListData[i].content);
      }
      for (let i = 10; i < 19; i++) {
        secondRow.add(keySourceListData[i].content);
      }
      const overlap: string[] = [];
      for (let i = 19; i < 26; i++) {
        const glyph: string = keySourceListData[i].content;
        if (firstRow.has(glyph) || secondRow.has(glyph)) {
          overlap.push(glyph);
        }
      }
      expect(overlap.join('')).assertEqual('');
      expect(firstRow.size + secondRow.size).assertEqual(19);
      expect(firstRow.has('q') && secondRow.has('a')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0010
     * @tc.name      testKeyTableRowLayout_010
     * @tc.desc      Verify that digit labels only appear on the top row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_010 begin');
      const digits: Set<string> = new Set<string>();
      for (let i = 0; i < 10; i++) {
        digits.add(String.fromCharCode(48 + i));
      }
      for (let i = 10; i < 26; i++) {
        const label: string = keySourceListData[i].title;
        expect(digits.has(label)).assertFalse();
      }
      expect(digits.size).assertEqual(10);
      expect(digits.has(keySourceListData[0].title)).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0011
     * @tc.name      testKeyTableRowLayout_011
     * @tc.desc      Verify that every base glyph is a lowercase letter from the a through z range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_011 begin');
      const lowercase: Set<string> = new Set<string>();
      for (let i = 0; i < 26; i++) {
        lowercase.add(String.fromCharCode(97 + i));
      }
      const outside: string[] = [];
      for (let i = 0; i < keySourceListData.length; i++) {
        const glyph: string = keySourceListData[i].content;
        if (!lowercase.has(glyph)) {
          outside.push(glyph);
        }
      }
      expect(outside.join('')).assertEqual('');
      expect(lowercase.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ROW_0012
     * @tc.name      testKeyTableRowLayout_012
     * @tc.desc      Verify that shifting every row produces the same row layout in capital letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableRowLayout_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_012 begin');
      const capitalRows: string[] = [];

      for (let i = 0; i < 26; i++) {
        capitalRows.push(keySourceListData[i].upperContent);
      }
      const capitalText: string = capitalRows.join('');
      expect(capitalText).assertEqual('QWERTYUIOPASDFGHJKLZXCVBNM');
      expect(capitalText.charAt(0)).assertEqual('Q');
      expect(capitalText.charAt(25)).assertEqual('M');
      expect(capitalText.toLowerCase()).assertEqual(
        keySourceListData.map((entry: keySourceListType) => entry.content).join(''));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableRowLayout_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0001
     * @tc.name      testKeyTablePageShape_001
     * @tc.desc      Verify that each of the ten digits occurs exactly once in the leading number-page block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_001 begin');
      const digitCounts: Map<string, number> = new Map<string, number>();

      for (let i = 0; i < 10; i++) {
        const glyph: string = numberSourceListData[i].content;
        const previous: number | undefined = digitCounts.get(glyph);
        let nextCount: number = 1;
        if (previous !== undefined) {
          nextCount = previous + 1;
        }
        digitCounts.set(glyph, nextCount);
      }
      expect(digitCounts.size).assertEqual(10);
      for (let i = 0; i < 10; i++) {
        const digit: string = String.fromCharCode(48 + i);
        const count: number | undefined = digitCounts.get(digit);
        expect(count).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0002
     * @tc.name      testKeyTablePageShape_002
     * @tc.desc      Verify that the number page never carries a Latin letter glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_002 begin');
      const letters: Set<string> = new Set<string>();
      for (let i = 0; i < 26; i++) {
        const lower: string = String.fromCharCode(97 + i);
        letters.add(lower);
        letters.add(lower.toUpperCase());
      }
      let letterHits: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        if (letters.has(numberSourceListData[i].content)) {
          letterHits = letterHits + 1;
        }
      }
      expect(letterHits).assertEqual(0);
      expect(letters.size).assertEqual(52);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0003
     * @tc.name      testKeyTablePageShape_003
     * @tc.desc      Verify that every number-page glyph fits in one UTF-16 code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_003 begin');
      const widths: number[] = [];

      for (let i = 0; i < numberSourceListData.length; i++) {
        const glyph: string = numberSourceListData[i].content;
        widths.push(glyph.length);
        expect(glyph.length).assertEqual(1);
      }
      expect(widths.length).assertEqual(27);
      const widest: number = widths[26];
      expect(widest).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0004
     * @tc.name      testKeyTablePageShape_004
     * @tc.desc      Verify that the number page opens its symbol block with at-sign, hash, dollar, percent and ampersand.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_004 begin');
      const blockStart: number = 10;
      const expectedCodes: number[] = [64, 35, 36, 37, 38];

      for (let i = 0; i < expectedCodes.length; i++) {
        const glyph: string = numberSourceListData[blockStart + i].content;
        expect(glyph.charCodeAt(0)).assertEqual(expectedCodes[i]);
      }
      expect(numberSourceListData[15].content).assertEqual('-');
      expect(numberSourceListData[16].content).assertEqual('+');
      expect(numberSourceListData[9].content).assertEqual('0');
      const lastSymbol: string = numberSourceListData[numberSourceListData.length - 1].content;
      expect(lastSymbol).assertEqual('?');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0005
     * @tc.name      testKeyTablePageShape_005
     * @tc.desc      Verify that the symbol page splits into eleven ASCII entries and sixteen above ASCII.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_005 begin');
      let asciiCount: number = 0;
      let highCount: number = 0;

      for (let i = 0; i < symbolSourceListData.length; i++) {
        const code: number = symbolSourceListData[i].content.charCodeAt(0);
        if (code <= 127) {
          asciiCount = asciiCount + 1;
        } else {
          highCount = highCount + 1;
        }
      }
      expect(asciiCount).assertEqual(11);
      expect(highCount).assertEqual(16);
      expect(asciiCount + highCount).assertEqual(symbolSourceListData.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0006
     * @tc.name      testKeyTablePageShape_006
     * @tc.desc      Verify that the ASCII half of the symbol page is tilde, backtick, bar, caret, equals, braces, comma, backslash and brackets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_006 begin');
      const asciiGlyphs: string[] = ['~', '`', '|', '^', '=', '{', '}', ',', '\\', '[', ']'];
      const actual: Set<string> = new Set<string>();

      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        if (glyph.charCodeAt(0) <= 127) {
          actual.add(glyph);
        }
      }
      expect(actual.size).assertEqual(asciiGlyphs.length);
      for (let i = 0; i < asciiGlyphs.length; i++) {
        expect(actual.has(asciiGlyphs[i])).assertTrue();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0007
     * @tc.name      testKeyTablePageShape_007
     * @tc.desc      Verify that the symbol page pairs its curly braces at seventeen and eighteen and its brackets at twenty-five and twenty-six.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_007 begin');
      const openBrace: string = symbolSourceListData[17].content;
      const closeBrace: string = symbolSourceListData[18].content;
      const openBracket: string = symbolSourceListData[25].content;
      const closeBracket: string = symbolSourceListData[26].content;

      expect(openBrace).assertEqual('{');
      expect(closeBrace).assertEqual('}');
      expect(openBracket).assertEqual('[');
      expect(closeBracket).assertEqual(']');
      expect(openBrace.charCodeAt(0) + 2).assertEqual(closeBrace.charCodeAt(0));
      expect(openBracket.charCodeAt(0) + 2).assertEqual(closeBracket.charCodeAt(0));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0008
     * @tc.name      testKeyTablePageShape_008
     * @tc.desc      Verify that the four currency glyphs pound, euro, yen and cent occupy indices ten through thirteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_008 begin');
      const currencyCodes: number[] = [163, 8364, 165, 162];

      for (let i = 0; i < currencyCodes.length; i++) {
        const glyph: string = symbolSourceListData[10 + i].content;
        expect(glyph.charCodeAt(0)).assertEqual(currencyCodes[i]);
      }
      expect(symbolSourceListData[9].content.charCodeAt(0)).assertEqual(8710);
      expect(symbolSourceListData[14].content).assertEqual('^');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0009
     * @tc.name      testKeyTablePageShape_009
     * @tc.desc      Verify that the sole equals glyph sits at index sixteen between the degree sign and the open brace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_009 begin');
      const equalIndices: number[] = [];

      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content === '=') {
          equalIndices.push(i);
        }
      }
      expect(equalIndices.length).assertEqual(1);
      expect(equalIndices[0]).assertEqual(16);
      expect(symbolSourceListData[15].content.charCodeAt(0)).assertEqual(176);
      expect(symbolSourceListData[17].content.charCodeAt(0)).assertEqual(123);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0010
     * @tc.name      testKeyTablePageShape_010
     * @tc.desc      Verify that the symbol page contains no digit and no Latin letter glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_010 begin');
      const alphanumeric: Set<string> = new Set<string>();
      for (let i = 0; i < 10; i++) {
        alphanumeric.add(String.fromCharCode(48 + i));
      }
      for (let i = 0; i < 26; i++) {
        const lower: string = String.fromCharCode(97 + i);
        alphanumeric.add(lower);
        alphanumeric.add(lower.toUpperCase());
      }
      const hits: string[] = [];
      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        if (alphanumeric.has(glyph)) {
          hits.push(glyph);
        }
      }
      expect(hits.join('')).assertEqual('');
      expect(alphanumeric.size).assertEqual(62);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0011
     * @tc.name      testKeyTablePageShape_011
     * @tc.desc      Verify that no page uses a whitespace glyph as a key content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_011 begin');
      let trimmedChanges: number = 0;

      for (let i = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content.trim() !== keySourceListData[i].content) {
          trimmedChanges = trimmedChanges + 1;
        }
      }
      for (let i = 0; i < numberSourceListData.length; i++) {
        if (numberSourceListData[i].content.trim() !== numberSourceListData[i].content) {
          trimmedChanges = trimmedChanges + 1;
        }
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.trim() !== symbolSourceListData[i].content) {
          trimmedChanges = trimmedChanges + 1;
        }
      }
      expect(trimmedChanges).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0012
     * @tc.name      testKeyTablePageShape_012
     * @tc.desc      Verify that no alphabet glyph is reused on the number or symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_012 begin');
      const numberGlyphs: Set<string> = new Set<string>();
      const symbolGlyphs: Set<string> = new Set<string>();

      for (let i = 0; i < numberSourceListData.length; i++) {
        numberGlyphs.add(numberSourceListData[i].content);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolGlyphs.add(symbolSourceListData[i].content);
      }
      const reused: string[] = [];
      for (let i = 0; i < keySourceListData.length; i++) {
        const glyph: string = keySourceListData[i].content;
        if (numberGlyphs.has(glyph) || symbolGlyphs.has(glyph)) {
          reused.push(glyph);
        }
      }
      expect(reused.length).assertEqual(0);
      expect(numberGlyphs.size + symbolGlyphs.size).assertEqual(54);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0013
     * @tc.name      testKeyTablePageShape_013
     * @tc.desc      Verify that the number page is entirely ASCII while the symbol page is not.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_013 begin');
      let numberHigh: number = 0;
      let symbolHigh: number = 0;

      for (let i = 0; i < numberSourceListData.length; i++) {
        if (numberSourceListData[i].content.charCodeAt(0) > 127) {
          numberHigh = numberHigh + 1;
        }
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.charCodeAt(0) > 127) {
          symbolHigh = symbolHigh + 1;
        }
      }
      expect(numberHigh).assertEqual(0);
      expect(symbolHigh).assertEqual(16);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PAGE_0014
     * @tc.name      testKeyTablePageShape_014
     * @tc.desc      Verify that exactly four bracket glyphs appear and they form two adjacent open-close pairs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePageShape_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_014 begin');
      const bracketGlyphs: Set<string> = new Set<string>();
      bracketGlyphs.add('{');
      bracketGlyphs.add('}');
      bracketGlyphs.add('[');
      bracketGlyphs.add(']');
      const bracketIndices: number[] = [];

      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (bracketGlyphs.has(symbolSourceListData[i].content)) {
          bracketIndices.push(i);
        }
      }
      expect(bracketIndices.length).assertEqual(4);
      expect(bracketIndices[0]).assertEqual(17);
      expect(bracketIndices[1]).assertEqual(18);
      expect(bracketIndices[2]).assertEqual(25);
      expect(bracketIndices[3]).assertEqual(26);
      expect(bracketIndices[1] - bracketIndices[0]).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePageShape_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ENUM_0001
     * @tc.name      testKeyTableEnumContract_001
     * @tc.desc      Verify that the three menu labels name the number, letter and symbol pages with distinct text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableEnumContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_001 begin');

      expect(MenuKey.NUMBER_KEY).assertEqual('?123');
      expect(MenuKey.NORMAL_KEY).assertEqual('ABC');
      expect(MenuKey.NUMBER_KEY.charAt(0)).assertEqual('?');
      expect(MenuKey.SPECIAL_KEY.startsWith('=/')).assertTrue();
      expect(MenuKey.SPECIAL_KEY.endsWith('<')).assertTrue();
      expect(MenuKey.SPECIAL_KEY.charAt(0)).assertEqual('=');
      expect(MenuKey.SPECIAL_KEY.includes('<')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ENUM_0002
     * @tc.name      testKeyTableEnumContract_002
     * @tc.desc      Verify that every menu label is at least three characters long and none is empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableEnumContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_002 begin');
      const labels: string[] = [MenuKey.NUMBER_KEY, MenuKey.NORMAL_KEY, MenuKey.SPECIAL_KEY];
      const unique: Set<string> = new Set<string>();

      for (let i = 0; i < labels.length; i++) {
        unique.add(labels[i]);
        const label: string = labels[i];
        expect(label.trim()).assertEqual(label);
      }
      expect(unique.size).assertEqual(3);
      expect(labels[0].length).assertEqual(4);
      expect(labels[1].length).assertEqual(3);
      expect(labels[2].startsWith('=')).assertTrue();
      expect(labels[2].includes('<')).assertTrue();
      expect(labels[1]).assertEqual(labels[1].toUpperCase());

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ENUM_0003
     * @tc.name      testKeyTableEnumContract_003
     * @tc.desc      Verify that the menu type numbers the three pages as zero, one and two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableEnumContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_003 begin');

      expect(MenuType.NORMAL).assertEqual(0);
      expect(MenuType.NUMBER).assertEqual(1);
      expect(MenuType.SPECIAL).assertEqual(2);
      expect(MenuType.NUMBER).assertEqual(MenuType.NORMAL + 1);
      expect(MenuType.SPECIAL).assertEqual(MenuType.NUMBER + 1);
      expect(MenuType.NORMAL < MenuType.SPECIAL).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ENUM_0004
     * @tc.name      testKeyTableEnumContract_004
     * @tc.desc      Verify that the submenu type gives the edit page the third slot after normal and menu.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableEnumContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_004 begin');

      expect(SubMenuType.NORMAL).assertEqual(0);
      expect(SubMenuType.MENU).assertEqual(1);
      expect(SubMenuType.EDIT).assertEqual(2);
      expect(SubMenuType.EDIT).assertEqual(SubMenuType.MENU + 1);
      expect(SubMenuType.NORMAL < SubMenuType.EDIT).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_ENUM_0005
     * @tc.name      testKeyTableEnumContract_005
     * @tc.desc      Verify that the key state orders lower, once-upper and locked-upper as zero, one and two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableEnumContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_005 begin');
      const states: number[] = [KeyState.LOWER_CASE, KeyState.ONCE_UPPER_CASE, KeyState.UPPER_CASE];

      expect(states[0]).assertEqual(0);
      expect(states[1]).assertEqual(1);
      expect(states[2]).assertEqual(2);
      expect(KeyState.ONCE_UPPER_CASE).assertEqual(KeyState.LOWER_CASE + 1);
      expect(KeyState.UPPER_CASE).assertEqual(KeyState.ONCE_UPPER_CASE + 1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableEnumContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0001
     * @tc.name      testKeyTableCrossColumn_001
     * @tc.desc      Verify that eleven of the seventeen number-page symbols also label an alphabet key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_001 begin');
      const labels: Set<string> = new Set<string>();
      for (let i = 0; i < keySourceListData.length; i++) {
        labels.add(keySourceListData[i].title);
      }
      const shared: string[] = [];
      for (let i = 10; i < numberSourceListData.length; i++) {
        const glyph: string = numberSourceListData[i].content;
        if (labels.has(glyph)) {
          shared.push(glyph);
        }
      }
      expect(shared.length).assertEqual(11);
      expect(shared.join('')).assertEqual("@#%&/*':;!?");
      expect(labels.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0002
     * @tc.name      testKeyTableCrossColumn_002
     * @tc.desc      Verify that fourteen alphabet labels are non-alphanumeric marks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_002 begin');
      const alphanumeric: Set<string> = new Set<string>();
      for (let i = 0; i < 10; i++) {
        alphanumeric.add(String.fromCharCode(48 + i));
      }
      for (let i = 0; i < 26; i++) {
        const lower: string = String.fromCharCode(97 + i);
        alphanumeric.add(lower);
        alphanumeric.add(lower.toUpperCase());
      }
      let markLabels: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        if (!alphanumeric.has(keySourceListData[i].title)) {
          markLabels = markLabels + 1;
        }
      }
      expect(markLabels).assertEqual(14);
      expect(alphanumeric.size).assertEqual(62);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0003
     * @tc.name      testKeyTableCrossColumn_003
     * @tc.desc      Verify that eleven high symbol glyphs form a run at three through thirteen and five sit after it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_003 begin');
      const highIndices: number[] = [];
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.charCodeAt(0) > 127) {
          highIndices.push(i);
        }
      }
      expect(highIndices.length).assertEqual(16);
      expect(highIndices[0]).assertEqual(3);
      expect(highIndices[10]).assertEqual(13);
      let runLength: number = 0;
      for (let i = 0; i < highIndices.length; i++) {
        if (highIndices[i] >= 3 && highIndices[i] <= 13) {
          runLength = runLength + 1;
        }
      }
      expect(runLength).assertEqual(11);
      expect(highIndices.slice(11).join(',')).assertEqual('15,21,22,23,24');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0004
     * @tc.name      testKeyTableCrossColumn_004
     * @tc.desc      Verify that the two closing entries are the only ASCII glyphs after index twenty-four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_004 begin');
      let tailAscii: number = 0;

      for (let i = 25; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.charCodeAt(0) < 128) {
          tailAscii = tailAscii + 1;
        }
      }
      expect(tailAscii).assertEqual(2);
      expect(symbolSourceListData[24].content.charCodeAt(0)).assertEqual(8453);
      expect(symbolSourceListData[25].content).assertEqual('[');
      expect(symbolSourceListData[26].content).assertEqual(']');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0005
     * @tc.name      testKeyTableCrossColumn_005
     * @tc.desc      Verify that the square root, pi, divide and multiply signs occupy the four adjacent indices four through seven.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_005 begin');
      const operators: number[] = [8730, 928, 247, 215];
      const found: number[] = [];

      for (let i = 0; i < symbolSourceListData.length; i++) {
        const code: number = symbolSourceListData[i].content.charCodeAt(0);
        for (let j = 0; j < operators.length; j++) {
          if (code === operators[j]) {
            found.push(i);
          }
        }
      }
      expect(found.join(',')).assertEqual('4,5,6,7');
      expect(symbolSourceListData[8].content.charCodeAt(0)).assertEqual(182);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0006
     * @tc.name      testKeyTableCrossColumn_006
     * @tc.desc      Verify that the number page ends with six punctuation glyphs from quote through question mark.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_006 begin');
      const tail: number[] = [];

      for (let i = 21; i < numberSourceListData.length; i++) {
        tail.push(numberSourceListData[i].content.charCodeAt(0));
      }
      expect(tail.length).assertEqual(6);
      expect(tail.join(',')).assertEqual('34,39,58,59,33,63');
      expect(numberSourceListData[20].content).assertEqual('*');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0007
     * @tc.name      testKeyTableCrossColumn_007
     * @tc.desc      Verify that the ten digit labels all differ from the letter content they cover.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_007 begin');
      let mismatches: number = 0;

      for (let i = 0; i < 10; i++) {
        const entry: keySourceListType = keySourceListData[i];
        if (entry.title !== entry.content) {
          mismatches = mismatches + 1;
        }
        expect(entry.title).assertEqual(numberSourceListData[i].content);
      }
      expect(mismatches).assertEqual(10);
      expect(keySourceListData[9].title).assertEqual('0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0008
     * @tc.name      testKeyTableCrossColumn_008
     * @tc.desc      Verify that the symbol page uses single-unit glyphs throughout.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_008 begin');
      const widths: number[] = [];

      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        widths.push(glyph.length);
        expect(glyph.length).assertEqual(1);
      }
      expect(widths.length).assertEqual(27);
      const lastWidth: number = widths[26];
      expect(lastWidth).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0009
     * @tc.name      testKeyTableCrossColumn_009
     * @tc.desc      Verify that no alphabet key repeats its own label as its glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_009 begin');
      const collisions: string[] = [];

      for (let i = 0; i < keySourceListData.length; i++) {
        const entry: keySourceListType = keySourceListData[i];
        if (entry.title === entry.content) {
          collisions.push(entry.title);
        }
      }
      expect(collisions.join('')).assertEqual('');
      expect(collisions.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0010
     * @tc.name      testKeyTableCrossColumn_010
     * @tc.desc      Verify that the ASCII glyphs sit at the eleven expected positions on the symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_010 begin');
      const expected: number[] = [0, 1, 2, 14, 16, 17, 18, 19, 20, 25, 26];
      const actual: number[] = [];

      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.charCodeAt(0) < 128) {
          actual.push(i);
        }
      }
      expect(actual.join(',')).assertEqual(expected.join(','));
      expect(symbolSourceListData[3].content.charCodeAt(0)).assertEqual(8226);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0011
     * @tc.name      testKeyTableCrossColumn_011
     * @tc.desc      Verify that the bottom row carries exactly the two capital labels H and I.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_011 begin');
      const capitals: string[] = [];
      const upper: Set<string> = new Set<string>();
      for (let i = 0; i < 26; i++) {
        upper.add(String.fromCharCode(65 + i));
      }

      for (let i = 19; i < keySourceListData.length; i++) {
        const label: string = keySourceListData[i].title;
        if (upper.has(label)) {
          capitals.push(label);
        }
      }
      expect(capitals.length).assertEqual(2);
      expect(capitals.join('')).assertEqual('HI');
      expect(capitals[0]).assertEqual(keySourceListData[19].title);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0012
     * @tc.name      testKeyTableCrossColumn_012
     * @tc.desc      Verify that the apostrophe label sits at the sixth position of the middle row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_012 begin');
      const apostrophe: string = String.fromCharCode(39);
      const labelIndex: number = keySourceListData.slice(10, 19)
        .map((entry: keySourceListType) => entry.title)
        .indexOf(apostrophe);

      expect(labelIndex).assertEqual(5);
      expect(keySourceListData[15].title).assertEqual(apostrophe);
      expect(keySourceListData[15].content).assertEqual('h');
      expect(keySourceListData[14].title).assertEqual('%');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0013
     * @tc.name      testKeyTableCrossColumn_013
     * @tc.desc      Verify that the macron is the only label above ASCII and it labels c.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_013 begin');
      const highLabelIndices: number[] = [];

      for (let i = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].title.charCodeAt(0) > 127) {
          highLabelIndices.push(i);
        }
      }
      expect(highLabelIndices.length).assertEqual(1);
      expect(highLabelIndices[0]).assertEqual(21);
      expect(keySourceListData[21].title.charCodeAt(0)).assertEqual(175);
      expect(keySourceListData[21].content).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_CROSS_0014
     * @tc.name      testKeyTableCrossColumn_014
     * @tc.desc      Verify that the divide sign is followed immediately by the multiply sign on the symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableCrossColumn_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_014 begin');
      const divide: string = symbolSourceListData[6].content;
      const multiply: string = symbolSourceListData[7].content;

      expect(divide.charCodeAt(0)).assertEqual(247);
      expect(multiply.charCodeAt(0)).assertEqual(215);
      expect(divide === multiply).assertFalse();
      expect(symbolSourceListData[5].content.charCodeAt(0)).assertEqual(928);
      expect(symbolSourceListData[8].content.charCodeAt(0)).assertEqual(182);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableCrossColumn_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PRINTABLE_0001
     * @tc.name      testKeyTablePrintable_001
     * @tc.desc      Verify that every number-page glyph is a printable ASCII character between space and tilde.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePrintable_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePrintable_001 begin');
      let nonPrintable: number = 0;

      for (let i = 0; i < numberSourceListData.length; i++) {
        const code: number = numberSourceListData[i].content.charCodeAt(0);
        if (code < 32 || code > 126) {
          nonPrintable = nonPrintable + 1;
        }
      }
      expect(nonPrintable).assertEqual(0);
      expect(numberSourceListData[0].content.charCodeAt(0)).assertEqual(49);
      expect(numberSourceListData[9].content.charCodeAt(0)).assertEqual(48);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePrintable_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_PRINTABLE_0002
     * @tc.name      testKeyTablePrintable_002
     * @tc.desc      Verify that every high symbol glyph lies above one hundred sixty, clear of the control block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTablePrintable_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePrintable_002 begin');
      let belowThreshold: number = 0;
      let highSeen: number = 0;

      for (let i = 0; i < symbolSourceListData.length; i++) {
        const code: number = symbolSourceListData[i].content.charCodeAt(0);
        if (code > 127) {
          highSeen = highSeen + 1;
          if (code < 160) {
            belowThreshold = belowThreshold + 1;
          }
        }
      }
      expect(highSeen).assertEqual(16);
      expect(belowThreshold).assertEqual(0);
      expect(symbolSourceListData[13].content.charCodeAt(0)).assertEqual(162);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTablePrintable_002 end');
      await yieldToEventLoop();
    });

  });
}
