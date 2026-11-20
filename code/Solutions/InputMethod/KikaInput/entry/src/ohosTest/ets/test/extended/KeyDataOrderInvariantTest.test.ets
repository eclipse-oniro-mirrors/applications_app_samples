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
  keySourceListType,
  numberSourceListData,
  symbolSourceListData
} from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputKeyDataOrderInvariant]';

function alphabetText(): string {
  let text: string = '';
  for (let i = 0; i < keySourceListData.length; i++) {
    text = text + keySourceListData[i].content;
  }
  return text;
}

function numberText(): string {
  let text: string = '';
  for (let i = 0; i < numberSourceListData.length; i++) {
    text = text + numberSourceListData[i].content;
  }
  return text;
}

function symbolText(): string {
  let text: string = '';
  for (let i = 0; i < symbolSourceListData.length; i++) {
    text = text + symbolSourceListData[i].content;
  }
  return text;
}

export default function KeyDataOrderInvariantTestTest(): void {
  describe('KeyDataOrderInvariantTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0100
     * @tc.name      testKeyDataOrderInvariant_001
     * @tc.desc      Verify the alphabet page spells the QWERTY row order exactly once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_001 begin');
      const expected: string = 'qwertyuiopasdfghjklzxcvbnm';
      expect(alphabetText()).assertEqual(expected);
      expect(alphabetText().length).assertEqual(26);
      expect(alphabetText().charAt(0)).assertEqual('q');
      expect(alphabetText().charAt(25)).assertEqual('m');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0200
     * @tc.name      testKeyDataOrderInvariant_002
     * @tc.desc      Verify the uppercase column mirrors the alphabet in the same positions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_002 begin');
      let upper: string = '';
      for (let i = 0; i < keySourceListData.length; i++) {
        upper = upper + keySourceListData[i].upperContent;
      }
      expect(upper.length).assertEqual(alphabetText().length);
      expect(upper.charAt(10)).assertEqual('A');
      expect(upper.indexOf('Z')).assertEqual(19);
      expect(upper).assertEqual('QWERTYUIOPASDFGHJKLZXCVBNM');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0300
     * @tc.name      testKeyDataOrderInvariant_003
     * @tc.desc      Verify the number page keeps ten digits first and seventeen symbols after them.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_003 begin');
      const digits: string = numberText().substring(0, 10);
      const symbols: string = numberText().substring(10);
      expect(numberText().length).assertEqual(digits.length + symbols.length);
      expect(numberText().charAt(9)).assertEqual('0');
      expect(digits).assertEqual('1234567890');
      expect(symbols.length).assertEqual(17);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0400
     * @tc.name      testKeyDataOrderInvariant_004
     * @tc.desc      Verify the symbol page keeps its documented opening and closing order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_004 begin');
      const text: string = symbolText();
      expect(text.indexOf('=')).assertEqual(16);
      expect(text.indexOf('•')).assertEqual(3);
      expect(text.length).assertEqual(27);
      expect(text.substring(0, 3)).assertEqual('~`|');
      expect(text.substring(25)).assertEqual('[]');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0500
     * @tc.name      testKeyDataOrderInvariant_005
     * @tc.desc      Verify every stored glyph occupies exactly one UTF-16 code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_005 begin');
      let longEntries: number = 0;
      let i: number = 0;
      while (i < keySourceListData.length) {
        if (keySourceListData[i].content.length !== 1) {
          longEntries = longEntries + 1;
        }
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < numberSourceListData.length) {
        if (numberSourceListData[iW1].content.length !== 1) {
          longEntries = longEntries + 1;
        }
        iW1 = iW1 + 1;
      }
      let iW2: number = 0;
      while (iW2 < symbolSourceListData.length) {
        if (symbolSourceListData[iW2].content.length !== 1) {
          longEntries = longEntries + 1;
        }
        iW2 = iW2 + 1;
      }
      expect(longEntries).assertEqual(0);
      expect(alphabetText().length + numberText().length + symbolText().length).assertEqual(80);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0600
     * @tc.name      testKeyDataOrderInvariant_006
     * @tc.desc      Verify every alphabet title is a single character and never repeats its letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_006 begin');
      let badLength: number = 0;
      let selfTitled: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const entry: keySourceListType = keySourceListData[i];
        if (entry.title.length !== 1) {
          badLength = badLength + 1;
        }
        if (entry.title === entry.content) {
          selfTitled = selfTitled + 1;
        }
      }
      expect(keySourceListData.length).assertEqual(26);
      expect(badLength).assertEqual(0);
      expect(selfTitled).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0700
     * @tc.name      testKeyDataOrderInvariant_007
     * @tc.desc      Verify the alphabet page splits into rows of ten, nine and seven letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_007 begin');
      const rowLengths: number[] = [10, 9, 7];
      const starts: number[] = [0, 10, 19];
      let r: number = 0;
      while (r < rowLengths.length) {
        const slice: string = alphabetText().substring(starts[r], starts[r] + rowLengths[r]);
        expect(slice.length).assertEqual(rowLengths[r]);
        r = r + 1;
      }
      expect(alphabetText().substring(0, 10)).assertEqual('qwertyuiop');
      expect(alphabetText().substring(10, 19)).assertEqual('asdfghjkl');
      expect(alphabetText().substring(19)).assertEqual('zxcvbnm');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0800
     * @tc.name      testKeyDataOrderInvariant_008
     * @tc.desc      Verify index arithmetic locates the corner letters on the alphabet page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_008 begin');
      const text: string = alphabetText();
      expect(text.indexOf('p')).assertEqual(9);
      expect(text.indexOf('m')).assertEqual(25);
      expect(text.indexOf('a') + text.indexOf('m')).assertEqual(35);
      expect(text.indexOf('a')).assertEqual(10);
      expect(text.indexOf('z')).assertEqual(19);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_0900
     * @tc.name      testKeyDataOrderInvariant_009
     * @tc.desc      Verify the first nine number glyphs ascend by one code point from '1'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_009 begin');
      let mismatched: number = 0;
      let i: number = 0;
      while (i < 9) {
        if (numberSourceListData[i].content.charCodeAt(0) !== 49 + i) {
          mismatched = mismatched + 1;
        }
        i = i + 1;
      }
      expect(mismatched).assertEqual(0);
      expect(numberSourceListData[0].content.charCodeAt(0)).assertEqual(49);
      expect(numberSourceListData[8].content).assertEqual('9');
      expect(numberSourceListData[9].content).assertEqual('0');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1000
     * @tc.name      testKeyDataOrderInvariant_010
     * @tc.desc      Verify the symbol code point total matches the sixteen documented glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_010 begin');
      let sum: number = 0;
      for (let i = 0; i < symbolSourceListData.length; i++) {
        sum = sum + symbolSourceListData[i].content.charCodeAt(0);
      }
      expect(sum).assertEqual(54615);
      expect(sum > symbolSourceListData.length * 1000).assertEqual(true);
      expect(symbolSourceListData[23].content.charCodeAt(0)).assertEqual(8482);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1100
     * @tc.name      testKeyDataOrderInvariant_011
     * @tc.desc      Verify the alphabet code point total stays fixed at the QWERTY sum.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_011 begin');
      let sum: number = 0;
      let i: number = 0;
      while (i < alphabetText().length) {
        sum = sum + alphabetText().charCodeAt(i);
        i = i + 1;
      }
      expect(sum - 26 * 100).assertEqual(247);
      expect(alphabetText().charCodeAt(0) + alphabetText().charCodeAt(25)).assertEqual(222);
      expect(sum).assertEqual(2847);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1200
     * @tc.name      testKeyDataOrderInvariant_012
     * @tc.desc      Verify the number page code point total stays fixed across a fresh traversal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_012 begin');
      let sum: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        sum = sum + numberSourceListData[i].content.charCodeAt(0);
      }
      expect(numberText().length).assertEqual(27);
      expect(sum).assertEqual(1279);
      expect(sum - 1279).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1300
     * @tc.name      testKeyDataOrderInvariant_013
     * @tc.desc      Verify the exported arrays keep reference identity across repeated reads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_013 begin');
      const alphabetRef: keySourceListType[] = keySourceListData;
      const alphabetAgain: keySourceListType[] = keySourceListData;
      expect(alphabetRef === alphabetAgain).assertEqual(true);
      expect(alphabetRef[0] === keySourceListData[0]).assertEqual(true);
      expect(alphabetRef.length).assertEqual(alphabetAgain.length);
      expect(alphabetRef[25].title).assertEqual(keySourceListData[25].title);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1400
     * @tc.name      testKeyDataOrderInvariant_014
     * @tc.desc      Verify three consecutive traversals produce byte-identical joined strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_014 begin');
      const snapshots: string[] = [];
      const separator: string = String.fromCharCode(10);
      for (let round = 0; round < 3; round++) {
        snapshots.push(alphabetText() + separator + numberText() + separator + symbolText());
      }
      expect(snapshots[1]).assertEqual(snapshots[2]);
      expect(snapshots[0].split(separator).length).assertEqual(3);
      expect(snapshots[2].length).assertEqual(80 + 2);
      expect(snapshots[0]).assertEqual(snapshots[1]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1500
     * @tc.name      testKeyDataOrderInvariant_015
     * @tc.desc      Verify the last alphabet title is the slash while its glyph stays 'm'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_015 begin');
      const last: keySourceListType = keySourceListData[25];
      expect(last.title.charCodeAt(0)).assertEqual(47);
      expect(last.title).assertEqual('/');
      expect(last.content).assertEqual('m');
      expect(last.upperContent).assertEqual('M');
      expect(last.title === last.content).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1600
     * @tc.name      testKeyDataOrderInvariant_016
     * @tc.desc      Verify the ten alphabet titles start with the digit sequence and then a tilde.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_016 begin');
      let titles: string = '';
      for (let i = 0; i < 11; i++) {
        titles = titles + keySourceListData[i].title;
      }
      expect(keySourceListData[9].title).assertEqual('0');
      expect(titles).assertEqual('1234567890~');
      expect(keySourceListData[10].title).assertEqual('~');
      expect(keySourceListData[10].content).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1700
     * @tc.name      testKeyDataOrderInvariant_017
     * @tc.desc      Verify the number page tail keeps its exact sixteen-symbol sequence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_017 begin');
      const tail: string = numberText().substring(10);
      const expected: string[] = ['@', '#', '$', '%', '&', '-', '+', '(', ')', '/', '*', '"', "'", ':', ';', '!', '?'];
      let mismatches: number = 0;
      let i: number = 0;
      while (i < expected.length) {
        if (tail.charAt(i) !== expected[i]) {
          mismatches = mismatches + 1;
        }
        i = i + 1;
      }
      expect(tail.charAt(16)).assertEqual('?');
      expect(tail.charAt(0)).assertEqual('@');
      expect(mismatches).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ORDER_INVARIANT_1800
     * @tc.name      testKeyDataOrderInvariant_018
     * @tc.desc      Verify the symbol page puts the two trademark glyphs side by side before brackets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataOrderInvariant_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_018 begin');
      const text: string = symbolText();
      expect(text.substring(23, 25)).assertEqual('™℅');
      expect(text.indexOf('™')).assertEqual(23);
      expect(text.indexOf('℅')).assertEqual(24);
      expect(text.indexOf(']') - text.indexOf('[')).assertEqual(1);
      expect(text.charCodeAt(23) > 8000).assertTrue();
      expect(text.charCodeAt(24) < 9000).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataOrderInvariant_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0100
     * @tc.name      testKeyDataExtra_001
     * @tc.desc      Verify the three page code point sums add up to the documented grand total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_001 begin');
      let grand: number = 0;
      let i: number = 0;
      while (i < alphabetText().length) {
        grand = grand + alphabetText().charCodeAt(i);
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < numberText().length) {
        grand = grand + numberText().charCodeAt(iW1);
        iW1 = iW1 + 1;
      }
      let iW2: number = 0;
      while (iW2 < symbolText().length) {
        grand = grand + symbolText().charCodeAt(iW2);
        iW2 = iW2 + 1;
      }
      expect(grand).assertEqual(58741);
      expect(grand - 2847 - 1279).assertEqual(54615);
      expect(grand > 58000).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0200
     * @tc.name      testKeyDataExtra_002
     * @tc.desc      Verify the symbol page mixes eleven ASCII glyphs with sixteen non-ASCII glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_002 begin');
      const text: string = symbolText();
      let ascii: number = 0;
      let wide: number = 0;
      for (let i = 0; i < text.length; i++) {
        if (text.charCodeAt(i) < 128) {
          ascii = ascii + 1;
        } else {
          wide = wide + 1;
        }
      }
      expect(wide).assertEqual(16);
      expect(ascii + wide).assertEqual(27);
      expect(ascii).assertEqual(11);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0300
     * @tc.name      testKeyDataExtra_003
     * @tc.desc      Verify the equals sign and both braces sit at consecutive symbol positions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_003 begin');
      const text: string = symbolText();
      expect(text.indexOf('=')).assertEqual(16);
      expect(text.indexOf('{')).assertEqual(17);
      expect(text.indexOf('}')).assertEqual(18);
      expect(text.indexOf('{') - text.indexOf('=')).assertEqual(1);
      expect(text.indexOf('}') - text.indexOf('{')).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0400
     * @tc.name      testKeyDataExtra_004
     * @tc.desc      Verify the number page contains exactly ten digits and seventeen other glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_004 begin');
      const text: string = numberText();
      let digits: number = 0;
      for (let i = 0; i < text.length; i++) {
        const code: number = text.charCodeAt(i);
        if (code >= 48 && code <= 57) {
          digits = digits + 1;
        }
      }
      expect(digits).assertEqual(10);
      expect(text.length - digits).assertEqual(17);
      expect(numberSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0500
     * @tc.name      testKeyDataExtra_005
     * @tc.desc      Verify the zero glyph closes the digit prefix with code point forty-eight.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_005 begin');
      expect(numberSourceListData[0].content.charCodeAt(0) - 1).assertEqual(48);
      expect(numberSourceListData[8].content.charCodeAt(0) - 9).assertEqual(48);
      expect(numberSourceListData[9].content).assertEqual('0');
      expect(numberSourceListData[9].content.charCodeAt(0)).assertEqual(48);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0600
     * @tc.name      testKeyDataExtra_006
     * @tc.desc      Verify the alphabet titles split into three fixed groups of ten, ten and six.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_006 begin');
      let titles: string = '';
      for (let i = 0; i < keySourceListData.length; i++) {
        titles = titles + keySourceListData[i].title;
      }
      expect(titles.substring(20).length).assertEqual(6);
      expect(titles.substring(0, 10)).assertEqual('1234567890');
      expect(titles.substring(10, 20)).assertEqual("~!@#%'&*?H");
      expect(titles.substring(20)).assertEqual('I¯_:;/');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0700
     * @tc.name      testKeyDataExtra_007
     * @tc.desc      Verify every alphabet glyph code lies inside the lowercase ASCII range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_007 begin');
      const text: string = alphabetText();
      let outside: number = 0;
      let i: number = 0;
      while (i < text.length) {
        const code: number = text.charCodeAt(i);
        if (code < 97 || code > 122) {
          outside = outside + 1;
        }
        i = i + 1;
      }
      expect(outside).assertEqual(0);
      expect(text.charCodeAt(0)).assertEqual(113);
      expect(text.charCodeAt(25)).assertEqual(109);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0800
     * @tc.name      testKeyDataExtra_008
     * @tc.desc      Verify each uppercase glyph code is exactly thirty-two below its lowercase glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_008 begin');
      let deltas: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const lower: number = keySourceListData[i].content.charCodeAt(0);
        const upper: number = keySourceListData[i].upperContent.charCodeAt(0);
        if (upper - lower !== -32) {
          deltas = deltas + 1;
        }
      }
      expect(keySourceListData[25].upperContent.charCodeAt(0)).assertEqual(77);
      expect(keySourceListData[25].upperContent.charCodeAt(0) - 32).assertEqual(45);
      expect(deltas).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_0900
     * @tc.name      testKeyDataExtra_009
     * @tc.desc      Verify three documented symbol code points keep their exact numeric values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_009 begin');
      const text: string = symbolText();
      const indexes: number[] = [8, 10, 12];
      const codePoints: number[] = [];
      let i: number = 0;
      while (i < indexes.length) {
        codePoints.push(text.charCodeAt(indexes[i]));
        i = i + 1;
      }
      expect(codePoints.join('|')).assertEqual('182|163|165');
      expect(text.charAt(indexes[0]) + text.charAt(indexes[1])).assertEqual('¶£');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_1000
     * @tc.name      testKeyDataExtra_010
     * @tc.desc      Verify the number tail opens at the at sign and closes at the question mark.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_010 begin');
      const tail: string = numberText().substring(10);
      expect(tail.charAt(0)).assertEqual('@');
      expect(tail.charAt(tail.length - 1)).assertEqual('?');
      expect(tail.length).assertEqual(17);
      expect(tail.charCodeAt(0)).assertEqual(64);
      expect(tail.charCodeAt(tail.length - 1)).assertEqual(63);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_1100
     * @tc.name      testKeyDataExtra_011
     * @tc.desc      Verify the first three symbol codes sum to three hundred forty-six.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_011 begin');
      const text: string = symbolText();
      const sum: number = text.charCodeAt(0) + text.charCodeAt(1) + text.charCodeAt(2);
      expect(sum / 3 > 115).assertTrue();
      expect(text.charCodeAt(0) - text.charCodeAt(1)).assertEqual(30);
      expect(sum).assertEqual(346);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_1200
     * @tc.name      testKeyDataExtra_012
     * @tc.desc      Verify the final bracket pair codes differ by exactly two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_012 begin');
      const text: string = symbolText();
      expect(text.length - 27).assertEqual(0);
      expect(text.charCodeAt(25)).assertEqual(91);
      expect(text.charCodeAt(26)).assertEqual(93);
      expect(text.charCodeAt(26) - text.charCodeAt(25)).assertEqual(2);
      expect(text.substring(25, 27)).assertEqual('[]');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_1300
     * @tc.name      testKeyDataExtra_013
     * @tc.desc      Verify the two late alphabet titles keep their documented code points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_013 begin');
      expect(keySourceListData[20].title).assertEqual('I');
      expect(keySourceListData[20].title.charCodeAt(0)).assertEqual(73);
      expect(keySourceListData[21].title).assertEqual('¯');
      expect(keySourceListData[21].title.charCodeAt(0)).assertEqual(175);
      expect(keySourceListData[21].content).assertEqual('c');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_EXTRA_1400
     * @tc.name      testKeyDataExtra_014
     * @tc.desc      Verify every symbol code is either printable ASCII or above one hundred sixty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataExtra_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_014 begin');
      const text: string = symbolText();
      let forbidden: number = 0;
      for (let i = 0; i < text.length; i++) {
        const code: number = text.charCodeAt(i);
        if (code < 32 || (code >= 127 && code <= 160)) {
          forbidden = forbidden + 1;
        }
      }
      expect(text.length).assertEqual(27);
      expect(forbidden).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataExtra_014 end');
      await yieldToEventLoop();
    });

  });
}
