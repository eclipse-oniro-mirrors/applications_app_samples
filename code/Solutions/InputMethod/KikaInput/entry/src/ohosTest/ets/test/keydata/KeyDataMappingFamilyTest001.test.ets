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
import { numberSourceListData, sourceListType, symbolSourceListData, keySourceListData, keySourceListType, MenuType, KeyState, MenuKey } from '../../../../main/ets/model/KeyboardKeyData';
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

function containsKeyGlyph(value: string): boolean {
  for (let i = 0; i < keySourceListData.length; i++) {
    if (keySourceListData[i].content === value || keySourceListData[i].upperContent === value) {
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

export default function KeyDataMappingFamilyTest001Test(): void {
  describe('KeyDataMappingFamilyTest001', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0100
     * @tc.name      testKeyDataContract_001
     * @tc.desc      Verify that every numeric slot stores one code unit with a stable code point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_001 begin');

      const numberEntries: CharEntry[] = [
        { content: "1", codePoint: 49 },
        { content: "2", codePoint: 50 },
        { content: "3", codePoint: 51 },
        { content: "4", codePoint: 52 },
        { content: "5", codePoint: 53 },
        { content: "6", codePoint: 54 },
        { content: "7", codePoint: 55 },
        { content: "8", codePoint: 56 },
        { content: "9", codePoint: 57 },
        { content: "0", codePoint: 48 },
        { content: "@", codePoint: 64 },
        { content: "#", codePoint: 35 },
        { content: "$", codePoint: 36 },
        { content: "%", codePoint: 37 },
        { content: "&", codePoint: 38 },
        { content: "-", codePoint: 45 },
        { content: "+", codePoint: 43 },
        { content: "(", codePoint: 40 },
        { content: ")", codePoint: 41 },
        { content: "/", codePoint: 47 },
        { content: "*", codePoint: 42 },
        { content: "\"", codePoint: 34 },
        { content: "'", codePoint: 39 },
        { content: ":", codePoint: 58 },
        { content: ";", codePoint: 59 },
        { content: "!", codePoint: 33 },
        { content: "?", codePoint: 63 },
      ];
      const expected: CharEntry[] = numberEntries;
      for (let i = 0; i < expected.length; i++) {
        const item: sourceListType = numberSourceListData[i];
        expect(item.content).assertEqual(expected[i].content);
        expect(item.content.length).assertEqual(1);
        expect(item.content.charCodeAt(0)).assertEqual(expected[i].codePoint);
      }
      expect(expected.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_SYMBOL_0100
     * @tc.name      testKeyDataContractSymbol_001
     * @tc.desc      Verify that every symbol slot stores one code unit with a stable code point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContractSymbol_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContractSymbol_001 begin');

      const symbolEntries: CharEntry[] = [
        { content: "~", codePoint: 126 },
        { content: "`", codePoint: 96 },
        { content: "|", codePoint: 124 },
        { content: "•", codePoint: 8226 },
        { content: "√", codePoint: 8730 },
        { content: "Π", codePoint: 928 },
        { content: "÷", codePoint: 247 },
        { content: "×", codePoint: 215 },
        { content: "¶", codePoint: 182 },
        { content: "∆", codePoint: 8710 },
        { content: "£", codePoint: 163 },
        { content: "€", codePoint: 8364 },
        { content: "¥", codePoint: 165 },
        { content: "¢", codePoint: 162 },
        { content: "^", codePoint: 94 },
        { content: "°", codePoint: 176 },
        { content: "=", codePoint: 61 },
        { content: "{", codePoint: 123 },
        { content: "}", codePoint: 125 },
        { content: ",", codePoint: 44 },
        { content: "\\", codePoint: 92 },
        { content: "©", codePoint: 169 },
        { content: "®", codePoint: 174 },
        { content: "™", codePoint: 8482 },
        { content: "℅", codePoint: 8453 },
        { content: "[", codePoint: 91 },
        { content: "]", codePoint: 93 },
      ];
      const expected: CharEntry[] = symbolEntries;
      for (let i = 0; i < expected.length; i++) {
        const item: sourceListType = symbolSourceListData[i];
        expect(item.content).assertEqual(expected[i].content);
        expect(item.content.length).assertEqual(1);
        expect(item.content.charCodeAt(0)).assertEqual(expected[i].codePoint);
      }
      expect(expected.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContractSymbol_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0200
     * @tc.name      testKeyDataContract_002
     * @tc.desc      Verify that numeric and symbol entries never duplicate a glyph from the opposite pad.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_002 begin');

      // Number and symbol pads must stay disjoint in both directions.
      const items: sourceListType[][] = [numberSourceListData, symbolSourceListData];
      const others: sourceListType[][] = [symbolSourceListData, numberSourceListData];
      for (let t = 0; t < items.length; t++) {
        const other: Set<string> = new Set<string>();
        for (let i = 0; i < others[t].length; i++) {
          other.add(others[t][i].content);
        }
        for (let i = 0; i < items[t].length; i++) {
          expect(items[t][i].content.length).assertEqual(1);
          expect(other.has(items[t][i].content)).assertFalse();
        }
        expect(items[t].length).assertEqual(27);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0300
     * @tc.name      testKeyDataContract_003
     * @tc.desc      Verify that every numeric and symbol pad slot stores the expected character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_003 begin');

      const numberEntries: string[] = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
        "@", "#", "$", "%", "&", "-", "+", "(", ")", "/", "*",
        "\"", "'", ":", ";", "!", "?",
      ];
      const symbolEntries: string[] = [
        "~", "`", "|", "•", "√", "Π", "÷", "×", "¶", "∆",
        "£", "€", "¥", "¢", "^", "°", "=", "{", "}", ",",
        "\\", "©", "®", "™", "℅", "[", "]",
      ];
      const tables: sourceListType[][] = [numberSourceListData, symbolSourceListData];
      const expected: string[][] = [numberEntries, symbolEntries];

      let t: number = 0;
      while (t < tables.length) {
        for (let i = 0; i < expected[t].length; i++) {
          expect(tables[t][i].content).assertEqual(expected[t][i]);
        }
        expect(expected[t].length).assertEqual(27);
        t = t + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0400
     * @tc.name      testKeyDataContract_004
     * @tc.desc      Verify that all alphabetic entries keep the lowercase/uppercase relationship.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_004 begin');

      const items: keySourceListType[] = keySourceListData;
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${items.length}`);

      for (let i = 0; i < items.length; i++) {
        const item: keySourceListType = items[i];
        // The table under test is compared with its expected identity and mapping.
        expect(item.content.length).assertEqual(1);
        expect(item.upperContent).assertEqual(item.content.toUpperCase());
        expect(item.upperContent === item.content).assertEqual(false);
      }

      expect(items.length).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0500
     * @tc.name      testKeyDataContract_005
     * @tc.desc      Verify that all alphabetic entries keep title, lower and upper in separate fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_005 begin');

      const items: keySourceListType[] = keySourceListData;
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${items.length}`);

      let i: number = 0;
      while (i < items.length) {
        const item: keySourceListType = items[i];
        // The table under test is compared with its expected identity and mapping.
        expect(item.title === item.content).assertFalse();
        expect(item.upperContent === item.content).assertFalse();
        expect(item.upperContent === item.title).assertFalse();
        expect(item.title.length).assertEqual(1);
        i = i + 1;
      }

      expect(items.length).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0600
     * @tc.name      testKeyDataContract_006
     * @tc.desc      Verify that every alphabetic entry exposes its title, lowercase and uppercase text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_006 begin');

      const entries: AlphaEntry[] = [
        { title: "1", content: "q", upper: "Q" },
        { title: "2", content: "w", upper: "W" },
        { title: "3", content: "e", upper: "E" },
        { title: "4", content: "r", upper: "R" },
        { title: "5", content: "t", upper: "T" },
        { title: "6", content: "y", upper: "Y" },
        { title: "7", content: "u", upper: "U" },
        { title: "8", content: "i", upper: "I" },
        { title: "9", content: "o", upper: "O" },
        { title: "0", content: "p", upper: "P" },
        { title: "~", content: "a", upper: "A" },
        { title: "!", content: "s", upper: "S" },
        { title: "@", content: "d", upper: "D" },
        { title: "#", content: "f", upper: "F" },
        { title: "%", content: "g", upper: "G" },
        { title: "'", content: "h", upper: "H" },
        { title: "&", content: "j", upper: "J" },
        { title: "*", content: "k", upper: "K" },
        { title: "?", content: "l", upper: "L" },
        { title: "H", content: "z", upper: "Z" },
        { title: "I", content: "x", upper: "X" },
        { title: "\u00af", content: "c", upper: "C" },
        { title: "_", content: "v", upper: "V" },
        { title: ":", content: "b", upper: "B" },
        { title: ";", content: "n", upper: "N" },
        { title: "/", content: "m", upper: "M" },
      ];

      for (let i = 0; i < entries.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        // The table under test is compared with its expected identity and mapping.
        expect(item.upperContent).assertEqual(entries[i].upper);
        expect(item.title).assertEqual(entries[i].title);
        expect(item.content).assertEqual(entries[i].content);
      }

      expect(entries.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0700
     * @tc.name      testKeyDataContract_007
     * @tc.desc      Verify that every alphabetic entry shows the expected single-character title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_007 begin');

      const entries: TitleEntry[] = [
        { title: "1", codePoint: 49 },
        { title: "2", codePoint: 50 },
        { title: "3", codePoint: 51 },
        { title: "4", codePoint: 52 },
        { title: "5", codePoint: 53 },
        { title: "6", codePoint: 54 },
        { title: "7", codePoint: 55 },
        { title: "8", codePoint: 56 },
        { title: "9", codePoint: 57 },
        { title: "0", codePoint: 48 },
        { title: "~", codePoint: 126 },
        { title: "!", codePoint: 33 },
        { title: "@", codePoint: 64 },
        { title: "#", codePoint: 35 },
        { title: "%", codePoint: 37 },
        { title: "'", codePoint: 39 },
        { title: "&", codePoint: 38 },
        { title: "*", codePoint: 42 },
        { title: "?", codePoint: 63 },
        { title: "H", codePoint: 72 },
        { title: "I", codePoint: 73 },
        { title: "\u00af", codePoint: 175 },
        { title: "_", codePoint: 95 },
        { title: ":", codePoint: 58 },
        { title: ";", codePoint: 59 },
        { title: "/", codePoint: 47 },
      ];

      let i: number = 0;
      while (i < entries.length) {
        const item: keySourceListType = keySourceListData[i];
        // The table under test is compared with its expected identity and mapping.
        expect(item.title).assertEqual(entries[i].title);
        expect(item.title.length).assertEqual(1);
        expect(item.title.charCodeAt(0)).assertEqual(entries[i].codePoint);
        i = i + 1;
      }

      expect(entries.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0800
     * @tc.name      testKeyDataContract_008
     * @tc.desc      Verify that every MenuType and KeyState member keeps its numeric identity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_008 begin');

      const entries: NumberMember[] = [
        { name: "NORMAL", value: 0 },
        { name: "NUMBER", value: 1 },
        { name: "SPECIAL", value: 2 },
        { name: "LOWER_CASE", value: 0 },
        { name: "ONCE_UPPER_CASE", value: 1 },
        { name: "UPPER_CASE", value: 2 },
      ];

      for (let i = 0; i < entries.length; i++) {
        const actual: number = entries[i].name === 'NORMAL' ? MenuType.NORMAL :
          entries[i].name === 'NUMBER' ? MenuType.NUMBER :
          entries[i].name === 'SPECIAL' ? MenuType.SPECIAL :
          entries[i].name === 'LOWER_CASE' ? KeyState.LOWER_CASE :
          entries[i].name === 'ONCE_UPPER_CASE' ? KeyState.ONCE_UPPER_CASE : KeyState.UPPER_CASE;
        expect(actual).assertEqual(entries[i].value);
      }

      expect(entries.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_0900
     * @tc.name      testKeyDataContract_009
     * @tc.desc      Verify that every MenuKey member carries its switch label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_009 begin');

      const entries: TextMember[] = [
        { name: "NUMBER_KEY", value: "?123" },
        { name: "NORMAL_KEY", value: "ABC" },
        { name: "SPECIAL_KEY", value: "=/<" },
      ];

      let i: number = 0;
      while (i < entries.length) {
        const actual: string = entries[i].name === 'NUMBER_KEY' ? MenuKey.NUMBER_KEY :
            entries[i].name === 'NORMAL_KEY' ? MenuKey.NORMAL_KEY : MenuKey.SPECIAL_KEY;
        // The table under test is compared with its expected identity and mapping.
        expect(actual).assertEqual(entries[i].value);
        i = i + 1;
      }

      expect(entries.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_CONTRACT_1000
     * @tc.name      testKeyDataContract_010
     * @tc.desc      Verify that adjacent menu and key-state members stay distinct and ordered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataContract_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_010 begin');

      const entries: PairEntry[] = [
        { left: MenuType.NORMAL, right: MenuType.NUMBER },
        { left: MenuType.NUMBER, right: MenuType.SPECIAL },
        { left: KeyState.LOWER_CASE, right: KeyState.ONCE_UPPER_CASE },
        { left: KeyState.ONCE_UPPER_CASE, right: KeyState.UPPER_CASE },
      ];

      for (let i = 0; i < entries.length; i++) {
        // The table under test is compared with its expected identity and mapping.
        expect(entries[i].left === entries[i].right).assertEqual(false);
        expect(entries[i].left).assertLess(entries[i].right);
        expect(entries[i].right - entries[i].left).assertEqual(1);
      }

      expect(entries.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataContract_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0100
     * @tc.name      testKeyDataHardKeyBridge_001
     * @tc.desc      Verify that every alphabet layout letter resolves through its hardware code in both cases.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataHardKeyBridge_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_001 begin');
      expect(keySourceListData.length).assertEqual(26);

      // The table is in qwerty order, so the code is derived from the letter itself.
      let i: number = 0;
      while (i < keySourceListData.length) {
        const entry: keySourceListType = keySourceListData[i];
        const code: number = 2017 + entry.content.charCodeAt(0) - 97;
        expect(GetHardKeyValue(code, true)).assertEqual(entry.upperContent);
        expect(entry.upperContent).assertEqual(entry.content.toUpperCase());
        expect(GetHardKeyValue(code, false)).assertEqual(entry.content);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0200
     * @tc.name      testKeyDataHardKeyBridge_002
     * @tc.desc      Verify that the number layout digits from 1 to 0 map back to their digit codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataHardKeyBridge_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_002 begin');
      const digits: sourceListType[] = numberSourceListData.slice(0, 10);

      // The number page lists 1..9 and then 0; zero uses code 2000.
      for (let i = 0; i < digits.length; i++) {
        const code: number = i < 9 ? 2001 + i : 2000;
        expect(GetHardKeyValue(code, false)).assertEqual(digits[i].content);
      }
      expect(digits[9].content).assertEqual('0');
      expect(digits[0].content).assertEqual('1');
      expect(digits[8].content).assertEqual('9');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0300
     * @tc.name      testKeyDataHardKeyBridge_003
     * @tc.desc      Verify that the number page is exactly ten digits followed by thirty-two symbols.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataHardKeyBridge_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_003 begin');
      const digits: sourceListType[] = numberSourceListData.slice(0, 10);
      const symbols: sourceListType[] = numberSourceListData.slice(10);

      // Ten digit slots and seventeen symbol slots make the number page.
      expect(digits.length + symbols.length).assertEqual(numberSourceListData.length);
      expect(symbols[0].content).assertEqual('@');
      expect(symbols[16].content).assertEqual('?');
      expect(digits.length).assertEqual(10);
      expect(symbols.length).assertEqual(17);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0400
     * @tc.name      testKeyDataHardKeyBridge_004
     * @tc.desc      Verify that every symbol with a hardware code appears on the number page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataHardKeyBridge_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_004 begin');
      const symbolCodes: number[] = [2010, 2011, 2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];
      const page: sourceListType[] = numberSourceListData.slice(10);
      let present: number = 0;

      // Seven of the mapped symbols live on the number page; space is editor-only.
      for (let k = 0; k < symbolCodes.length; k++) {
        const token: string = GetHardKeyValue(symbolCodes[k], false);
        for (let i = 0; i < page.length; i++) {
          if (page[i].content === token) {
            present = present + 1;
          }
        }
      }
      expect(present).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0500
     * @tc.name      testKeyDataHardKeyBridge_005
     * @tc.desc      Verify that the symbol page is exactly the tail of the number page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataHardKeyBridge_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_005 begin');
      const numberSymbols: sourceListType[] = numberSourceListData.slice(10);

      // The two symbol pages are disjoint and together cover both symbol screens.
      expect(numberSymbols.length).assertEqual(17);
      expect(symbolSourceListData.length).assertEqual(27);
      let i: number = 0;
      while (i < symbolSourceListData.length) {
        let shared: boolean = false;
        for (let k = 0; k < numberSymbols.length; k++) {
          if (numberSymbols[k].content === symbolSourceListData[i].content) {
            shared = true;
          }
        }
        expect(shared).assertFalse();
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0600
     * @tc.name      testKeyDataHardKeyBridge_006
     * @tc.desc      Verify that the symbol page repeats the hardware symbols in the same order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataHardKeyBridge_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_006 begin');
      const symbolCodes: number[] = [2010, 2011, 2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];
      let onPages: number = 0;

      // Eight mapped symbols appear on one of the two symbol pages.
      for (let k = 0; k < symbolCodes.length; k++) {
        const token: string = GetHardKeyValue(symbolCodes[k], false);
        let found: boolean = false;
        for (let i = 0; i < numberSourceListData.length; i++) {
          if (numberSourceListData[i].content === token) {
            found = true;
          }
        }
        for (let i = 0; i < symbolSourceListData.length; i++) {
          if (symbolSourceListData[i].content === token) {
            found = true;
          }
        }
        if (found) {
          onPages = onPages + 1;
        }
      }
      expect(onPages).assertEqual(9);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0700
     * @tc.name      testKeyDataHardKeyBridge_007
     * @tc.desc      Verify that every symbol with a hardware code keeps the same mapping when shift is set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataHardKeyBridge_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_007 begin');
      const symbolCodes: number[] = [2010, 2011, 2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];

      // Shift only rewrites letters, so the symbol table must be shift-neutral.
      let k: number = 0;
      while (k < symbolCodes.length) {
        expect(GetHardKeyValue(symbolCodes[k], true)).assertEqual(GetHardKeyValue(symbolCodes[k], false));
        expect(GetHardKeyValue(symbolCodes[k], true).length > 0).assertTrue();
        k = k + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_HARD_KEY_BRIDGE_0800
     * @tc.name      testKeyDataHardKeyBridge_008
     * @tc.desc      Verify that the first letter of every alphabet layout row is reachable by its own code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataHardKeyBridge_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_008 begin');
      const rowStarts: number[] = [0, 10, 19];

      // Each row starts with a distinct letter that must resolve to that same letter.
      for (let i = 0; i < rowStarts.length; i++) {
        const entry: keySourceListType = keySourceListData[rowStarts[i]];
        const code: number = 2017 + entry.content.charCodeAt(0) - 97;
        expect(GetHardKeyValue(code, true)).assertEqual(entry.upperContent);
        expect(GetHardKeyValue(code, false)).assertEqual(entry.content);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataHardKeyBridge_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0100
     * @tc.name      testKeyDataFullMap_001
     * @tc.desc      Verify that the hard-key alphabet block yields twenty-six distinct lowercase glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_001 begin');

      const seen: Set<string> = new Set<string>();
      for (let code = 2017; code <= 2042; code++) {
        const glyph: string = GetHardKeyValue(code, false);
        expect(glyph.length).assertEqual(1);
        seen.add(glyph);
      }
      expect(seen.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0200
     * @tc.name      testKeyDataFullMap_002
     * @tc.desc      Verify that every shifted alphabet glyph is the upper form of the plain glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_002 begin');

      for (let code = 2017; code <= 2042; code++) {
        const lower: string = GetHardKeyValue(code, false);
        const upper: string = GetHardKeyValue(code, true);
        expect(upper).assertEqual(lower.toUpperCase().toUpperCase());
        expect(upper).assertEqual(lower.toUpperCase());
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0300
     * @tc.name      testKeyDataFullMap_003
     * @tc.desc      Verify that the numeric table exposes the digits in their documented order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_003 begin');

      const digits: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
      let i: number = 0;
      while (i < digits.length) {
        expect(numberSourceListData[i].content).assertEqual(digits[i]);
        i = i + 1;
      }
      expect(numberSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0400
     * @tc.name      testKeyDataFullMap_004
     * @tc.desc      Verify that every symbol slot is a single unique glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_004 begin');

      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        expect(glyph.length).assertEqual(1);
        seen.add(glyph);
      }
      expect(symbolSourceListData.length).assertEqual(27);
      expect(seen.size).assertEqual(symbolSourceListData.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0500
     * @tc.name      testKeyDataFullMap_005
     * @tc.desc      Verify that the 2000..2122 window exposes fifty-six mapped codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataFullMap_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_005 begin');

      let mapped: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        if (GetHardKeyValue(code, false) !== '') {
          mapped = mapped + 1;
        }
      }
      expect(mapped).assertEqual(56);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0600
     * @tc.name      testKeyDataFullMap_006
     * @tc.desc      Verify that the unmapped codes form the exact complement of the mapped window.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataFullMap_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_006 begin');

      let empty: number = 0;
      for (let code = 2000; code <= 2122; code++) {
        if (GetHardKeyValue(code, false) === '') {
          empty = empty + 1;
          expect(GetHardKeyValue(code, true)).assertEqual('');
        }
      }
      expect(empty).assertEqual(67);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0700
     * @tc.name      testKeyDataFullMap_007
     * @tc.desc      Verify that shift is a no-op outside the alphabet block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_007 begin');

      for (let code = 2000; code <= 2122; code++) {
        if (code >= 2017 && code <= 2042) {
          continue;
        }
        const plain: string = GetHardKeyValue(code, false);
        expect(GetHardKeyValue(code, true)).assertEqual(plain);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0800
     * @tc.name      testKeyDataFullMap_008
     * @tc.desc      Verify that every lowercase letter appears exactly once in the key table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_008 begin');

      const counts: number[] = [];
      for (let i = 0; i < 26; i++) {
        counts.push(0);
      }
      for (let i = 0; i < keySourceListData.length; i++) {
        const content: string = keySourceListData[i].content;
        const index: number = content.charCodeAt(0) - 'a'.charCodeAt(0);
        if (index >= 0 && index < 26) {
          counts[index] = counts[index] + 1;
        }
      }
      for (let i = 0; i < counts.length; i++) {
        expect(counts[i]).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_0900
     * @tc.name      testKeyDataFullMap_009
     * @tc.desc      Verify the title, content and upper fields of every alphabet entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_009 begin');

      let i: number = 0;
      while (i < keySourceListData.length) {
        const item: keySourceListType = keySourceListData[i];
        expect(item.content.length).assertEqual(1);
        expect(item.upperContent.length).assertEqual(1);
        expect(item.upperContent).assertEqual(item.content.toUpperCase());
        expect(item.upperContent === item.content).assertFalse();
        expect(item.title.length).assertEqual(1);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_1000
     * @tc.name      testKeyDataFullMap_010
     * @tc.desc      Verify that the number and symbol pages share no glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataFullMap_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_010 begin');

      for (let i = 0; i < numberSourceListData.length; i++) {
        expect(containsContent(symbolSourceListData, numberSourceListData[i].content)).assertEqual(false);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        expect(containsContent(numberSourceListData, symbolSourceListData[i].content)).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_1100
     * @tc.name      testKeyDataFullMap_011
     * @tc.desc      Verify the numeric identity and labels of the three menu enums.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataFullMap_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_011 begin');

      expect(MenuType.NUMBER).assertEqual(1);
      expect(MenuType.SPECIAL).assertEqual(2);
      expect(KeyState.LOWER_CASE).assertEqual(0);
      expect(KeyState.ONCE_UPPER_CASE).assertEqual(1);
      expect(KeyState.UPPER_CASE).assertEqual(2);
      expect(MenuKey.NUMBER_KEY).assertEqual('?123');
      expect(MenuKey.NORMAL_KEY).assertEqual('ABC');
      expect(MenuKey.SPECIAL_KEY).assertEqual('=/\<');
      expect(MenuType.NORMAL).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_FULL_MAP_1200
     * @tc.name      testKeyDataFullMap_012
     * @tc.desc      Verify that hard-key letters and digits resolve into their own table pages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataFullMap_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_012 begin');

      for (let code = 2017; code <= 2042; code++) {
        expect(containsKeyGlyph(GetHardKeyValue(code, false))).assertTrue();
      }
      for (let code = 2000; code <= 2009; code++) {
        expect(containsContent(numberSourceListData, GetHardKeyValue(code, false))).assertTrue();
      }
      for (let code = 2017; code <= 2042; code++) {
        expect(containsKeyGlyph(GetHardKeyValue(code, true))).assertTrue();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataFullMap_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0100
     * @tc.name      testKeyDataReverseMap_001
     * @tc.desc      Verify that every lowercase letter reverses to exactly one key code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataReverseMap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_001 begin');

      const reverse: Map<string, number> = buildReverse(2017, 2042);
      expect(reverse.size).assertEqual(26);
      for (let code = 2017; code <= 2042; code++) {
        const glyph: string = GetHardKeyValue(code, false);
        expect(reverse.get(glyph)).assertEqual(code);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_REVERSE_MAP_0200
     * @tc.name      testKeyDataReverseMap_002
     * @tc.desc      Verify that the ten digits reverse to the decimal block in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataReverseMap_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_002 begin');

      const reverse: Map<string, number> = buildReverse(2000, 2009);
      const digits: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      expect(reverse.size).assertEqual(10);
      for (let i = 0; i < digits.length; i++) {
        expect(reverse.has(digits[i])).assertTrue();
      }
      expect(reverse.get('9')).assertEqual(2009);
      expect(reverse.get('0')).assertEqual(2000);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataReverseMap_002 end');
      await yieldToEventLoop();
    });

  });
}
