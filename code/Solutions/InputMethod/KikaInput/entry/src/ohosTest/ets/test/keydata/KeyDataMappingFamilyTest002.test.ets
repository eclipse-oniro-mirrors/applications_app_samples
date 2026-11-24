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
import { numberSourceListData, sourceListType, symbolSourceListData, keySourceListData } from '../../../../main/ets/model/KeyboardKeyData';
import { GetHardKeyValue } from '../../../../main/ets/model/HardKeyUtils';

interface CharEntry {
  content: string;
  codePoint: number;
}

interface AlphaEntry {
  title: string;
  content: string;
  upper: string;
}

interface TitleEntry {
  title: string;
  codePoint: number;
}

interface NumberMember {
  name: string;
  value: number;
}

interface TextMember {
  name: string;
  value: string;
}

interface PairEntry {
  left: number;
  right: number;
}

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputKeyDataContractTest]';

function containsContent(list: sourceListType[], value: string): boolean {
  for (let i = 0; i < list.length; i++) {
    if (list[i].content === value) {
      return true;
    }
  }
  return false;
}

function buildReverse(from: number, to: number): Map<string, number> {
  const reverse: Map<string, number> = new Map<string, number>();
  for (let code = from; code <= to; code++) {
    const value: string = GetHardKeyValue(code, false);
    if (value !== '') {
      reverse.set(value, code);
    }
  }
  return reverse;
}

export default function KeyDataMappingFamilyTest002Test(): void {
  describe('KeyDataMappingFamilyTest002', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0300
     * @tc.name      testKeyDataReverseMap_003
     * @tc.desc      Verify that every mapped punctuation glyph reverses to a unique code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataReverseMap_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_003 begin');

      const codes: number[] = [2010, 2011, 2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];
      const reverse: Map<string, number> = new Map<string, number>();
      let i: number = 0;
      while (i < codes.length) {
        const glyph: string = GetHardKeyValue(codes[i], false);
        expect(glyph.length).assertEqual(1);
        expect(reverse.has(glyph)).assertFalse();
        reverse.set(glyph, codes[i]);
        i = i + 1;
      }
      expect(reverse.size).assertEqual(11);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0400
     * @tc.name      testKeyDataReverseMap_004
     * @tc.desc      Verify that the nine function tokens reverse to distinct codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataReverseMap_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_004 begin');

      const codes: number[] = [2012, 2013, 2014, 2015, 2016, 2047, 2048, 2055, 2071];
      const reverse: Map<string, number> = buildReverse(2000, 2122);
      for (let i = 0; i < codes.length; i++) {
        const token: string = GetHardKeyValue(codes[i], false);
        expect(reverse.get(token)).assertEqual(codes[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0500
     * @tc.name      testKeyDataReverseMap_005
     * @tc.desc      Verify the glyph and token partition of the mapped window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataReverseMap_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_005 begin');

      let glyphs: number = 0;
      let tokens: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value === '') {
          continue;
        }
        if (value.indexOf('KEYCODE_') === 0) {
          tokens = tokens + 1;
        } else {
          glyphs = glyphs + 1;
        }
      }
      expect(glyphs).assertEqual(47);
      expect(tokens).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0600
     * @tc.name      testKeyDataReverseMap_006
     * @tc.desc      Verify that the reverse map contains exactly forty-seven distinct glyph keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataReverseMap_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_006 begin');

      const reverse: Map<string, number> = buildReverse(2000, 2122);
      let glyphKeys: number = 0;
      let tokenKeys: number = 0;
      reverse.forEach((code: number, key: string) => {
        if (key.indexOf('KEYCODE_') === 0) {
          tokenKeys = tokenKeys + 1;
        } else {
          glyphKeys = glyphKeys + 1;
        }
      });
      expect(reverse.size).assertEqual(56);
      expect(glyphKeys).assertEqual(47);
      expect(tokenKeys).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0700
     * @tc.name      testKeyDataReverseMap_007
     * @tc.desc      Verify that shifted letters reverse to the same codes as their lowercase forms.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataReverseMap_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_007 begin');

      const reverse: Map<string, number> = buildReverse(2017, 2042);
      for (let code = 2017; code <= 2042; code++) {
        const upper: string = GetHardKeyValue(code, true);
        const lower: string = GetHardKeyValue(code, false);
        expect(upper).assertEqual(lower.toUpperCase());
        expect(reverse.get(lower)).assertEqual(code);
        expect(reverse.has(upper)).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0800
     * @tc.name      testKeyDataReverseMap_008
     * @tc.desc      Verify that every lowercase key-table glyph appears in the hard-key reverse map.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataReverseMap_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_008 begin');

      const reverse: Map<string, number> = buildReverse(2000, 2122);
      for (let i = 0; i < keySourceListData.length; i++) {
        expect(reverse.has(keySourceListData[i].content)).assertTrue();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0900
     * @tc.name      testKeyDataReverseMap_009
     * @tc.desc      Verify that the hard-key digit glyphs occupy the first ten number-table slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataReverseMap_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_009 begin');

      for (let code = 2001; code <= 2009; code++) {
        const glyph: string = GetHardKeyValue(code, false);
        let index: number = -1;
        let i: number = 0;
        while (i < numberSourceListData.length) {
          if (numberSourceListData[i].content === glyph) {
            index = i;
            break;
          }
          i = i + 1;
        }
        expect(index).assertEqual(code - 2001);
      }
      let zeroIndex: number = -1;
      let iW1: number = 0;
      while (iW1 < numberSourceListData.length) {
        if (numberSourceListData[iW1].content === '0') {
          zeroIndex = iW1;
          break;
        }
        iW1 = iW1 + 1;
      }
      expect(zeroIndex).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_1000
     * @tc.name      testKeyDataReverseMap_010
     * @tc.desc      Verify that unmapped gap codes never enter the reverse map.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataReverseMap_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_010 begin');

      const gaps: number[] = [2045, 2046, 2049, 2100, 2103, 2112, 2123];
      const reverse: Map<string, number> = buildReverse(2000, 2122);
      for (let i = 0; i < gaps.length; i++) {
        expect(GetHardKeyValue(gaps[i], false)).assertEqual('');
      }
      expect(reverse.has('')).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_1100
     * @tc.name      testKeyDataReverseMap_011
     * @tc.desc      Verify that every key-table content is a unique lowercase letter at its own index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataReverseMap_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_011 begin');

      const seen: Set<string> = new Set<string>();
      let i: number = 0;
      while (i < keySourceListData.length) {
        const content: string = keySourceListData[i].content;
        expect(content).assertEqual(content.toLowerCase());
        expect(seen.has(content)).assertFalse();
        seen.add(content);
        i = i + 1;
      }
      expect(seen.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_1200
     * @tc.name      testKeyDataReverseMap_012
     * @tc.desc      Verify that the reverse map round-trips every mapped code back to its glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataReverseMap_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_012 begin');

      const reverse: Map<string, number> = buildReverse(2000, 2122);
      let roundTrips: number = 0;
      reverse.forEach((code: number, key: string) => {
        expect(GetHardKeyValue(code, false)).assertEqual(key);
        roundTrips = roundTrips + 1;
      });
      expect(roundTrips).assertEqual(56);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0100
     * @tc.name      testKeyDataMappingBridge_001
     * @tc.desc      Verify that the alphabetical hardware order lands on the QWERTY layout permutation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_001 begin');

      // Codes advance a,b,c... while the page stores q,w,e..., so the indices form a permutation.
      const letters: string = 'abcdef';
      const expected: number[] = [10, 23, 21, 12, 2, 13];
      for (let i = 0; i < expected.length; i++) {
        const glyph: string = GetHardKeyValue(2017 + i, false);
        expect(glyph).assertEqual(letters.charAt(i));
        let pageIndex: number = -1;
        for (let k = 0; k < keySourceListData.length; k++) {
          if (keySourceListData[k].content === glyph) {
            pageIndex = k;
          }
        }
        expect(pageIndex).assertEqual(expected[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0200
     * @tc.name      testKeyDataMappingBridge_002
     * @tc.desc      Verify that mapped punctuation lands on its documented number-page slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataMappingBridge_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_002 begin');

      // Each punctuation code has one page slot inside the two symbol rows of the number page.
      const slots: number[][] = [[2011, 11], [2065, 10], [2066, 16], [2121, 17], [2122, 18], [2064, 19], [2010, 20]];
      for (let i = 0; i < slots.length; i++) {
        const glyph: string = GetHardKeyValue(slots[i][0], false);
        expect(glyph.length).assertEqual(1);
        expect(numberSourceListData[slots[i][1]].content).assertEqual(glyph);
      }
      expect(slots.length).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0300
     * @tc.name      testKeyDataMappingBridge_003
     * @tc.desc      Verify that the comma has a symbol slot while the period has no page slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_003 begin');

      // Both keys are mapped, but only the comma is rendered on a page.
      const comma: string = GetHardKeyValue(2043, false);
      const period: string = GetHardKeyValue(2044, false);
      expect(comma).assertEqual(String.fromCharCode(44));
      expect(period).assertEqual(String.fromCharCode(46));
      expect(symbolSourceListData[19].content).assertEqual(comma);
      let periodSlots: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        if (numberSourceListData[i].content === period) {
          periodSlots = periodSlots + 1;
        }
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content === period) {
          periodSlots = periodSlots + 1;
        }
      }
      expect(periodSlots).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0400
     * @tc.name      testKeyDataMappingBridge_004
     * @tc.desc      Verify how many number-page glyphs are reachable from a hardware code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_004 begin');

      // Ten digits and seven punctuation marks are mapped; the remaining ten are page-only.
      const mapped: Set<string> = new Set<string>();
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value !== '') {
          mapped.add(value);
        }
      }
      let reachable: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        if (mapped.has(numberSourceListData[i].content)) {
          reachable = reachable + 1;
        }
      }
      expect(reachable).assertEqual(17);
      expect(numberSourceListData.length - reachable).assertEqual(10);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0500
     * @tc.name      testKeyDataMappingBridge_005
     * @tc.desc      Verify that exactly two symbol-page glyphs carry a hardware code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_005 begin');

      // Only the comma and the equals sign bridge the symbol page and the hardware map.
      const mapped: Set<string> = new Set<string>();
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value !== '') {
          mapped.add(value);
        }
      }
      const reachable: string[] = [];
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (mapped.has(symbolSourceListData[i].content)) {
          reachable.push(symbolSourceListData[i].content);
        }
      }
      expect(reachable.length).assertEqual(2);
      expect(reachable[0]).assertEqual(String.fromCharCode(61));
      expect(reachable[1]).assertEqual(String.fromCharCode(44));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0600
     * @tc.name      testKeyDataMappingBridge_006
     * @tc.desc      Verify the split of the eleven mapped punctuation values across the two pages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_006 begin');

      // Seven punctuation marks sit on the number page, two on the symbol page and two on neither.
      const codes: number[] = [2010, 2011, 2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];
      let onNumber: number = 0;
      let onSymbol: number = 0;
      let onNeither: number = 0;
      for (let k = 0; k < codes.length; k++) {
        const value: string = GetHardKeyValue(codes[k], false);
        if (containsContent(numberSourceListData, value)) {
          onNumber = onNumber + 1;
        } else if (containsContent(symbolSourceListData, value)) {
          onSymbol = onSymbol + 1;
        } else {
          onNeither = onNeither + 1;
        }
      }
      expect(onNumber).assertEqual(7);
      expect(onSymbol).assertEqual(2);
      expect(onNeither).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0700
     * @tc.name      testKeyDataMappingBridge_007
     * @tc.desc      Verify the digit, letter and punctuation partition of the mapped glyph values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_007 begin');

      // Every one-unit mapped value belongs to exactly one of the three glyph families.
      let digits: number = 0;
      let letters: number = 0;
      let punctuation: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value.length !== 1) {
          continue;
        }
        const point: number = value.charCodeAt(0);
        if (point >= 48 && point <= 57) {
          digits = digits + 1;
        } else if (point >= 97 && point <= 122) {
          letters = letters + 1;
        } else {
          punctuation = punctuation + 1;
        }
      }
      expect(digits).assertEqual(10);
      expect(letters).assertEqual(26);
      expect(punctuation).assertEqual(11);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0800
     * @tc.name      testKeyDataMappingBridge_008
     * @tc.desc      Verify that every function token is spelled with capitals and underscores only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_008 begin');

      // The nine tokens are an internal vocabulary, not user-visible glyphs.
      const codes: number[] = [2012, 2013, 2014, 2015, 2016, 2047, 2048, 2055, 2071];
      let unexpectedChars: number = 0;
      for (let i = 0; i < codes.length; i++) {
        const token: string = GetHardKeyValue(codes[i], false);
        expect(token.indexOf('KEYCODE_')).assertEqual(0);
        expect(token.length > 1).assertTrue();
        for (let k = 0; k < token.length; k++) {
          const point: number = token.charCodeAt(k);
          if (point !== 95 && (point < 65 || point > 90)) {
            unexpectedChars = unexpectedChars + 1;
          }
        }
      }
      expect(codes.length).assertEqual(9);
      expect(unexpectedChars).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_0900
     * @tc.name      testKeyDataMappingBridge_009
     * @tc.desc      Verify the number of mapped codes between the last digit and the first letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_009 begin');

      // Star, hash and five navigation tokens bridge the digit and letter blocks.
      let mappedInGap: number = 0;
      for (let code = 2010; code < 2017; code++) {
        if (GetHardKeyValue(code, false) !== '') {
          mappedInGap = mappedInGap + 1;
        }
      }
      expect(mappedInGap).assertEqual(7);
      expect(GetHardKeyValue(2010, false)).assertEqual(String.fromCharCode(42));
      expect(GetHardKeyValue(2011, false)).assertEqual(String.fromCharCode(35));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1000
     * @tc.name      testKeyDataMappingBridge_010
     * @tc.desc      Verify how many codes are mapped in the tail after the alphabet block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_010 begin');

      // Four edit tokens, four punctuation keys and five shifted-range codes fill the tail.
      let mappedTail: number = 0;
      for (let code = 2043; code <= 2122; code++) {
        if (GetHardKeyValue(code, false) !== '') {
          mappedTail = mappedTail + 1;
        }
      }
      expect(mappedTail).assertEqual(13);
      expect(GetHardKeyValue(2058, false)).assertEqual(String.fromCharCode(61));
      expect(GetHardKeyValue(2066, false)).assertEqual(String.fromCharCode(43));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1100
     * @tc.name      testKeyDataMappingBridge_011
     * @tc.desc      Verify that no unshifted mapping yields an uppercase letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_011 begin');

      // Uppercase output is produced by the shift flag, never by the base table.
      let uppercaseValues: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value.length === 1) {
          const point: number = value.charCodeAt(0);
          if (point >= 65 && point <= 90) {
            uppercaseValues = uppercaseValues + 1;
          }
        }
      }
      expect(uppercaseValues).assertEqual(0);
      expect(GetHardKeyValue(2017, false)).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1300
     * @tc.name      testKeyDataMappingBridge_013
     * @tc.desc      Verify that the space key yields one whitespace unit that no page renders.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_013 begin');

      // Space is editor input; it is intentionally absent from both rendering pages.
      const space: string = GetHardKeyValue(2050, false);
      expect(space).assertEqual(' ');
      expect(space.length).assertEqual(1);
      expect(space.charCodeAt(0)).assertEqual(32);
      expect(containsContent(numberSourceListData, space)).assertFalse();
      expect(containsContent(symbolSourceListData, space)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1400
     * @tc.name      testKeyDataMappingBridge_014
     * @tc.desc      Verify the ordered navigation family and its separation from the edit tokens.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_014 begin');

      // The five navigation tokens follow the physical direction order and contain no edit verb.
      const tokens: string[] = [];
      for (let code = 2012; code <= 2016; code++) {
        tokens.push(GetHardKeyValue(code, false));
      }
      expect(tokens.join('|'))
          .assertEqual('KEYCODE_DPAD_UP|KEYCODE_DPAD_DOWN|KEYCODE_DPAD_LEFT|KEYCODE_DPAD_RIGHT|KEYCODE_DPAD_CENTER');
      expect(tokens[0].indexOf('DPAD')).assertEqual(8);
      const editCodes: number[] = [2047, 2048, 2055, 2071];
      for (let i = 0; i < editCodes.length; i++) {
        const editToken: string = GetHardKeyValue(editCodes[i], false);
        expect(editToken.indexOf('DPAD')).assertEqual(-1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1500
     * @tc.name      testKeyDataMappingBridge_015
     * @tc.desc      Verify the boundaries of the alphabet code block against its neighbours.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataMappingBridge_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_015 begin');

      // Just outside 2017..2042 the mapping switches from letters to tokens and punctuation.
      expect(GetHardKeyValue(2017, false)).assertEqual('a');
      expect(GetHardKeyValue(2042, false)).assertEqual('z');
      expect(GetHardKeyValue(2016, false).indexOf('KEYCODE_')).assertEqual(0);
      expect(GetHardKeyValue(2043, false).length).assertEqual(1);
      expect(GetHardKeyValue(2042, true)).assertEqual('Z');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1600
     * @tc.name      testKeyDataMappingBridge_016
     * @tc.desc      Verify that every mapped punctuation key is placed below the digit row of the number page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_016 begin');

      // Punctuation never pushes a decimal digit from the first numeric row.
      const codes: number[] = [2010, 2011, 2064, 2065, 2066, 2121, 2122];
      let checked: number = 0;
      for (let k = 0; k < codes.length; k++) {
        const glyph: string = GetHardKeyValue(codes[k], false);
        let slot: number = -1;
        for (let i = 0; i < numberSourceListData.length; i++) {
          if (numberSourceListData[i].content === glyph) {
            slot = i;
          }
        }
        expect(slot >= 10).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(7);
      expect(numberSourceListData[0].content).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1700
     * @tc.name      testKeyDataMappingBridge_017
     * @tc.desc      Verify that the four edit tokens live after the alphabet block and name an edit verb.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_017 begin');

      // Shift, delete and forward-delete are routed by token name rather than by a glyph.
      const codes: number[] = [2047, 2048, 2055, 2071];
      let namedEdits: number = 0;
      for (let i = 0; i < codes.length; i++) {
        expect(codes[i] > 2042).assertTrue();
        const token: string = GetHardKeyValue(codes[i], false);
        if (token.indexOf('SHIFT') >= 0 || token.indexOf('DEL') >= 0) {
          namedEdits = namedEdits + 1;
        }
      }
      expect(namedEdits).assertEqual(4);
      expect(GetHardKeyValue(2055, false)).assertEqual('KEYCODE_DEL');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1800
     * @tc.name      testKeyDataMappingBridge_018
     * @tc.desc      Verify the four unmapped slots that split the mapped punctuation run on the number page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_018 begin');

      // Dollar, percent, ampersand and hyphen have no hardware code, leaving a gap after slot eleven.
      const mapped: Set<string> = new Set<string>();
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value !== '' && !(value.charCodeAt(0) >= 48 && value.charCodeAt(0) <= 57)) {
          mapped.add(value);
        }
      }
      const gaps: number[] = [];
      for (let i = 10; i <= 20; i++) {
        if (!mapped.has(numberSourceListData[i].content)) {
          gaps.push(i);
        }
      }
      expect(gaps.join('|')).assertEqual('12|13|14|15');
      expect(gaps.length).assertEqual(4);
      expect(numberSourceListData[12].content).assertEqual(String.fromCharCode(36));
      expect(numberSourceListData[15].content).assertEqual(String.fromCharCode(45));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_1900
     * @tc.name      testKeyDataMappingBridge_019
     * @tc.desc      Verify the two symbol-page positions that are reachable from a hardware code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_019 begin');

      // Equals sits in the second row and the comma closes that same row.
      const mapped: Set<string> = new Set<string>();
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value !== '') {
          mapped.add(value);
        }
      }
      const positions: number[] = [];
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (mapped.has(symbolSourceListData[i].content)) {
          positions.push(i);
        }
      }
      expect(positions.join('|')).assertEqual('16|19');
      expect(symbolSourceListData[positions[0]].content).assertEqual('=');
      expect(symbolSourceListData[positions[1]].content).assertEqual(String.fromCharCode(44));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_2000
     * @tc.name      testKeyDataMappingBridge_020
     * @tc.desc      Verify that the hardware punctuation vocabulary holds parentheses but no square brackets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_020 begin');

      // Square brackets remain page-only glyphs and never enter the hardware map.
      const glyphs: string[] = [];
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value.length === 1) {
          glyphs.push(value);
        }
      }
      let openParens: number = 0;
      let squareBrackets: number = 0;
      for (let i = 0; i < glyphs.length; i++) {
        if (glyphs[i] === String.fromCharCode(40)) {
          openParens = openParens + 1;
        }
        if (glyphs[i] === '[' || glyphs[i] === ']') {
          squareBrackets = squareBrackets + 1;
        }
      }
      expect(openParens).assertEqual(1);
      expect(squareBrackets).assertEqual(0);
      expect(glyphs.length).assertEqual(47);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_2100
     * @tc.name      testKeyDataMappingBridge_021
     * @tc.desc      Verify that the mapped letter set equals the alphabet page content set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_021 begin');

      // The same twenty-six lowercase letters exist on both sides of the bridge.
      const pageSet: Set<string> = new Set<string>();
      for (let i = 0; i < keySourceListData.length; i++) {
        pageSet.add(keySourceListData[i].content);
      }
      const mapSet: Set<string> = new Set<string>();
      for (let code = 2017; code <= 2042; code++) {
        mapSet.add(GetHardKeyValue(code, false));
      }
      expect(mapSet.size).assertEqual(pageSet.size);
      let missing: number = 0;
      mapSet.forEach((glyph: string) => {
        if (!pageSet.has(glyph)) {
          missing = missing + 1;
        }
      });
      expect(missing).assertEqual(0);
      expect(mapSet.has('q')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_2200
     * @tc.name      testKeyDataMappingBridge_022
     * @tc.desc      Verify that plus, star and slash are mapped once while the minus sign is unmapped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_022 begin');

      // The hardware arithmetic vocabulary is incomplete: no code yields the minus sign.
      const glyphs: string[] = [];
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value.length === 1) {
          glyphs.push(value);
        }
      }
      const operators: string[] = [String.fromCharCode(43), String.fromCharCode(42),
        String.fromCharCode(47), String.fromCharCode(45)];
      const expectedHits: number[] = [1, 1, 1, 0];
      let present: number = 0;
      for (let k = 0; k < operators.length; k++) {
        let hits: number = 0;
        for (let i = 0; i < glyphs.length; i++) {
          if (glyphs[i] === operators[k]) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(expectedHits[k]);
        if (expectedHits[k] === 1) {
          present = present + 1;
        }
      }
      expect(present).assertEqual(3);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_MAPPING_BRIDGE_2300
     * @tc.name      testKeyDataMappingBridge_023
     * @tc.desc      Verify that mapped glyph values contain no control character and one space.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataMappingBridge_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_023 begin');

      // The lowest value is the plain space; everything else is printable and user-visible.
      let controlValues: number = 0;
      let spaceValues: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value.length !== 1) {
          continue;
        }
        const point: number = value.charCodeAt(0);
        if (point < 32) {
          controlValues = controlValues + 1;
        }
        if (point === 32) {
          spaceValues = spaceValues + 1;
        }
      }
      expect(controlValues).assertEqual(0);
      expect(spaceValues).assertEqual(1);
      expect(GetHardKeyValue(2050, false).charCodeAt(0)).assertEqual(32);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataMappingBridge_023 end');
      await yieldToEventLoop();
    });

  });
}
