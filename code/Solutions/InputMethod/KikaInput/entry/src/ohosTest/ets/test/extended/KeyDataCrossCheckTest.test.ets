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
import { GetHardKeyValue } from '../../../../main/ets/model/HardKeyUtils';
import {
  KeyState,
  MenuKey,
  MenuType,
  keySourceListData,
  numberSourceListData,
  symbolSourceListData
} from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputKeyDataCrossCheck]';

export default function keyDataCrossCheckTest(): void {
  describe('KeyDataCrossCheckTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0100
     * @tc.name      testKeyDataCrossCheck_001
     * @tc.desc      Verify every hard-key letter is present in the alphabet content set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_001 begin');
      const table: Set<string> = new Set<string>();
      let i: number = 0;
      while (i < keySourceListData.length) {
        table.add(keySourceListData[i].content);
        i = i + 1;
      }
      let missing: number = 0;
      for (let code = 2017; code <= 2042; code++) {
        if (!table.has(GetHardKeyValue(code, false))) {
          missing = missing + 1;
        }
      }
      expect(missing).assertEqual(0);
      expect(table.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0200
     * @tc.name      testKeyDataCrossCheck_002
     * @tc.desc      Verify every hard-key digit matches its index in the numeric page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_002 begin');
      let mismatched: number = 0;
      for (let digit = 1; digit <= 9; digit++) {
        const glyph: string = GetHardKeyValue(2000 + digit, false);
        if (numberSourceListData[digit - 1].content !== glyph) {
          mismatched = mismatched + 1;
        }
      }
      if (numberSourceListData[9].content !== GetHardKeyValue(2000, false)) {
        mismatched = mismatched + 1;
      }
      expect(mismatched).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0300
     * @tc.name      testKeyDataCrossCheck_003
     * @tc.desc      Verify the hard-key equals glyph only appears once in the symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_003 begin');
      const equals: string = GetHardKeyValue(2058, false);
      let occurrences: number = 0;
      let i: number = 0;
      while (i < symbolSourceListData.length) {
        if (symbolSourceListData[i].content === equals) {
          occurrences = occurrences + 1;
        }
        i = i + 1;
      }
      expect(occurrences).assertEqual(1);
      expect(equals).assertEqual('=');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0400
     * @tc.name      testKeyDataCrossCheck_004
     * @tc.desc      Verify the first ten alphabet titles are the decimal digits in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_004 begin');
      const expected: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
      let run: number = 0;
      for (let i = 0; i < 10; i++) {
        if (keySourceListData[i].title === expected[i]) {
          run = run + 1;
        }
      }
      expect(keySourceListData[10].title).assertEqual('~');
      expect(run).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0500
     * @tc.name      testKeyDataCrossCheck_005
     * @tc.desc      Verify the three row sums equal their table totals.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_005 begin');
      const keyRows: number[] = [10, 9, 7];
      const padRows: number[] = [10, 10, 7];
      let keySum: number = 0;
      let padSum: number = 0;
      let i: number = 0;
      while (i < keyRows.length) {
        keySum = keySum + keyRows[i];
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < padRows.length) {
        padSum = padSum + padRows[iW1];
        iW1 = iW1 + 1;
      }
      expect(padSum).assertEqual(numberSourceListData.length);
      expect(padSum).assertEqual(symbolSourceListData.length);
      expect(keySum).assertEqual(keySourceListData.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0600
     * @tc.name      testKeyDataCrossCheck_006
     * @tc.desc      Verify the alphabet content set equals the lowercase ASCII set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataCrossCheck_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_006 begin');
      const fromTable: Set<string> = new Set<string>();
      for (let i = 0; i < keySourceListData.length; i++) {
        fromTable.add(keySourceListData[i].content);
      }
      const fromAscii: Set<string> = new Set<string>();
      for (let i = 0; i < 26; i++) {
        fromAscii.add(String.fromCharCode(97 + i));
      }
      let same: boolean = fromTable.size === fromAscii.size;
      fromAscii.forEach((value: string) => {
        if (!fromTable.has(value)) {
          same = false;
        }
      });
      expect(same).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0700
     * @tc.name      testKeyDataCrossCheck_007
     * @tc.desc      Verify the alphabet upper set equals the uppercase ASCII set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataCrossCheck_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_007 begin');
      const uppers: Set<string> = new Set<string>();
      let i: number = 0;
      while (i < keySourceListData.length) {
        uppers.add(keySourceListData[i].upperContent);
        i = i + 1;
      }
      let missing: number = 0;
      let iW1: number = 0;
      while (iW1 < 26) {
        if (!uppers.has(String.fromCharCode(65 + iW1))) {
          missing = missing + 1;
        }
        iW1 = iW1 + 1;
      }
      expect(missing).assertEqual(0);
      expect(uppers.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0800
     * @tc.name      testKeyDataCrossCheck_008
     * @tc.desc      Verify the numeric and symbol pages share zero glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataCrossCheck_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_008 begin');
      let shared: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        for (let j = 0; j < symbolSourceListData.length; j++) {
          if (numberSourceListData[i].content === symbolSourceListData[j].content) {
            shared = shared + 1;
          }
        }
      }
      expect(shared).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_0900
     * @tc.name      testKeyDataCrossCheck_009
     * @tc.desc      Verify the enum identities through an array of pairs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_009 begin');
      const pairs: number[] = [MenuType.NORMAL, MenuType.NUMBER, MenuType.SPECIAL,
        KeyState.LOWER_CASE, KeyState.ONCE_UPPER_CASE, KeyState.UPPER_CASE];
      const expected: number[] = [0, 1, 2, 0, 1, 2];
      let matches: number = 0;
      let i: number = 0;
      while (i < pairs.length) {
        if (pairs[i] === expected[i]) {
          matches = matches + 1;
        }
        i = i + 1;
      }
      expect(MenuKey.NORMAL_KEY.length).assertEqual(3);
      expect(matches).assertEqual(6);
      expect(MenuKey.NUMBER_KEY.length).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_1000
     * @tc.name      testKeyDataCrossCheck_010
     * @tc.desc      Verify five documented symbol code points through a map lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataCrossCheck_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_010 begin');
      const points: Map<string, number> = new Map<string, number>();
      points.set('•', 8226);
      points.set('√', 8730);
      points.set('Π', 928);
      points.set('÷', 247);
      points.set('×', 215);
      let verified: number = 0;
      points.forEach((value: number, glyph: string) => {
        for (let i = 0; i < symbolSourceListData.length; i++) {
          if (symbolSourceListData[i].content === glyph) {
            expect(symbolSourceListData[i].content.charCodeAt(0)).assertEqual(value);
            verified = verified + 1;
          }
        }
      });
      expect(verified).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_1100
     * @tc.name      testKeyDataCrossCheck_011
     * @tc.desc      Verify each page has no duplicate content values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_011 begin');
      const keySet: Set<string> = new Set<string>();
      const numberSet: Set<string> = new Set<string>();
      const symbolSet: Set<string> = new Set<string>();
      let i: number = 0;
      while (i < keySourceListData.length) {
        keySet.add(keySourceListData[i].content);
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < numberSourceListData.length) {
        numberSet.add(numberSourceListData[iW1].content);
        iW1 = iW1 + 1;
      }
      let iW2: number = 0;
      while (iW2 < symbolSourceListData.length) {
        symbolSet.add(symbolSourceListData[iW2].content);
        iW2 = iW2 + 1;
      }
      expect(numberSet.size).assertEqual(27);
      expect(symbolSet.size).assertEqual(27);
      expect(keySet.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CROSS_CHECK_1200
     * @tc.name      testKeyDataCrossCheck_012
     * @tc.desc      Verify the bracket pair sits at the last two symbol slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCrossCheck_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_012 begin');
      const lastTwo: string[] = [];
      for (let i = symbolSourceListData.length - 2; i < symbolSourceListData.length; i++) {
        lastTwo.push(symbolSourceListData[i].content);
      }
      expect(lastTwo[1].charCodeAt(0)).assertEqual(93);
      expect(lastTwo.join('')).assertEqual('[]');
      expect(lastTwo[0].charCodeAt(0)).assertEqual(91);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCrossCheck_012 end');
      await yieldToEventLoop();
    });

  });

}
