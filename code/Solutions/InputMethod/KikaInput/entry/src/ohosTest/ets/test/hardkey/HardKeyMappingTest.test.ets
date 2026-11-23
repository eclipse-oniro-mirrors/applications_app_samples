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

interface LowerEntry {
  code: number;
  lower: string;
  codePoint: number;
}

interface UpperEntry {
  code: number;
  upper: string;
  lower: string;
  codePoint: number;
}

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputHardKeyAlphabetMapping]';

interface MapEntry {
  code: number;
  expected: string;
  codePoint: number;
  length: number;
}

export default function hardKeyMappingTest(): void {
  describe('HardKeyMappingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_ALPHABET_MAPPING_0100
     * @tc.name      testHardKeyAlphabetMapping_001
     * @tc.desc      Verify that the full A-Z range maps to lowercase letters without shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyAlphabetMapping_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyAlphabetMapping_001 begin');

      const entries: LowerEntry[] = [
        { code: 2017, lower: "a", codePoint: 97 },
        { code: 2018, lower: "b", codePoint: 98 },
        { code: 2019, lower: "c", codePoint: 99 },
        { code: 2020, lower: "d", codePoint: 100 },
        { code: 2021, lower: "e", codePoint: 101 },
        { code: 2022, lower: "f", codePoint: 102 },
        { code: 2023, lower: "g", codePoint: 103 },
        { code: 2024, lower: "h", codePoint: 104 },
        { code: 2025, lower: "i", codePoint: 105 },
        { code: 2026, lower: "j", codePoint: 106 },
        { code: 2027, lower: "k", codePoint: 107 },
        { code: 2028, lower: "l", codePoint: 108 },
        { code: 2029, lower: "m", codePoint: 109 },
        { code: 2030, lower: "n", codePoint: 110 },
        { code: 2031, lower: "o", codePoint: 111 },
        { code: 2032, lower: "p", codePoint: 112 },
        { code: 2033, lower: "q", codePoint: 113 },
        { code: 2034, lower: "r", codePoint: 114 },
        { code: 2035, lower: "s", codePoint: 115 },
        { code: 2036, lower: "t", codePoint: 116 },
        { code: 2037, lower: "u", codePoint: 117 },
        { code: 2038, lower: "v", codePoint: 118 },
        { code: 2039, lower: "w", codePoint: 119 },
        { code: 2040, lower: "x", codePoint: 120 },
        { code: 2041, lower: "y", codePoint: 121 },
        { code: 2042, lower: "z", codePoint: 122 },
      ];

      let i: number = 0;
      while (i < entries.length) {
        const actual: string = GetHardKeyValue(entries[i].code, false);
        expect(actual).assertEqual(entries[i].lower);
        expect(actual.length).assertEqual(1);
        expect(actual.charCodeAt(0)).assertEqual(entries[i].codePoint);
        const shifted: string = GetHardKeyValue(entries[i].code, true);
        expect(shifted).assertEqual(actual.toUpperCase());
        i = i + 1;
      }

      expect(entries.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyAlphabetMapping_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_ALPHABET_MAPPING_0200
     * @tc.name      testHardKeyAlphabetMapping_002
     * @tc.desc      Verify that shift maps the full A-Z range to uppercase letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyAlphabetMapping_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyAlphabetMapping_002 begin');

      // Hardware codes 2017-2042 map to a-z sequentially.
      const entries: UpperEntry[] = [
        { code: 2017, upper: "A", lower: "a", codePoint: 65 },
        { code: 2018, upper: "B", lower: "b", codePoint: 66 },
        { code: 2019, upper: "C", lower: "c", codePoint: 67 },
        { code: 2020, upper: "D", lower: "d", codePoint: 68 },
        { code: 2021, upper: "E", lower: "e", codePoint: 69 },
        { code: 2022, upper: "F", lower: "f", codePoint: 70 },
        { code: 2023, upper: "G", lower: "g", codePoint: 71 },
        { code: 2024, upper: "H", lower: "h", codePoint: 72 },
        { code: 2025, upper: "I", lower: "i", codePoint: 73 },
        { code: 2026, upper: "J", lower: "j", codePoint: 74 },
        { code: 2027, upper: "K", lower: "k", codePoint: 75 },
        { code: 2028, upper: "L", lower: "l", codePoint: 76 },
        { code: 2029, upper: "M", lower: "m", codePoint: 77 },
        { code: 2030, upper: "N", lower: "n", codePoint: 78 },
        { code: 2031, upper: "O", lower: "o", codePoint: 79 },
        { code: 2032, upper: "P", lower: "p", codePoint: 80 },
        { code: 2033, upper: "Q", lower: "q", codePoint: 81 },
        { code: 2034, upper: "R", lower: "r", codePoint: 82 },
        { code: 2035, upper: "S", lower: "s", codePoint: 83 },
        { code: 2036, upper: "T", lower: "t", codePoint: 84 },
        { code: 2037, upper: "U", lower: "u", codePoint: 85 },
        { code: 2038, upper: "V", lower: "v", codePoint: 86 },
        { code: 2039, upper: "W", lower: "w", codePoint: 87 },
        { code: 2040, upper: "X", lower: "x", codePoint: 88 },
        { code: 2041, upper: "Y", lower: "y", codePoint: 89 },
        { code: 2042, upper: "Z", lower: "z", codePoint: 90 }
      ];

      for (let i = 0; i < entries.length; i++) {
        const actual: string = GetHardKeyValue(entries[i].code, true);
        const lower: string = GetHardKeyValue(entries[i].code, false);
        expect(actual.length).assertEqual(1);
        expect(actual.charCodeAt(0)).assertEqual(entries[i].codePoint);
        expect(lower).assertEqual(entries[i].lower);
        expect(actual).assertEqual(lower.toUpperCase());
        expect(actual).assertEqual(entries[i].upper);
      }

      expect(entries.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyAlphabetMapping_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CHARACTER_MAPPING_0100
     * @tc.name      testHardKeyCharacterMapping_001
     * @tc.desc      Verify that shift leaves the digit block unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyCharacterMapping_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_001 begin');

      const entries: MapEntry[] = [
        { code: 2000, expected: "0", codePoint: 48, length: 1 },
        { code: 2001, expected: "1", codePoint: 49, length: 1 },
        { code: 2002, expected: "2", codePoint: 50, length: 1 },
        { code: 2003, expected: "3", codePoint: 51, length: 1 },
        { code: 2004, expected: "4", codePoint: 52, length: 1 },
        { code: 2005, expected: "5", codePoint: 53, length: 1 },
        { code: 2006, expected: "6", codePoint: 54, length: 1 },
        { code: 2007, expected: "7", codePoint: 55, length: 1 },
        { code: 2008, expected: "8", codePoint: 56, length: 1 },
        { code: 2009, expected: "9", codePoint: 57, length: 1 },
      ];

      let i: number = 0;
      while (i < entries.length) {
        const actual: string = GetHardKeyValue(entries[i].code, false);
        expect(actual.charCodeAt(0)).assertEqual(entries[i].codePoint);
        expect(actual).assertEqual(entries[i].expected);
        expect(actual.length).assertEqual(entries[i].length);
        const shifted: string = GetHardKeyValue(entries[i].code, true);
        expect(shifted).assertEqual(actual);
        i = i + 1;
      }

      expect(entries.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CHARACTER_MAPPING_0200
     * @tc.name      testHardKeyCharacterMapping_002
     * @tc.desc      Verify that shift leaves the punctuation block unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyCharacterMapping_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_002 begin');

      const entries: MapEntry[] = [
        { code: 2043, expected: ",", codePoint: 44, length: 1 },
        { code: 2044, expected: ".", codePoint: 46, length: 1 },
        { code: 2050, expected: " ", codePoint: 32, length: 1 },
        { code: 2058, expected: "=", codePoint: 61, length: 1 },
        { code: 2064, expected: "/", codePoint: 47, length: 1 },
        { code: 2065, expected: "@", codePoint: 64, length: 1 },
        { code: 2066, expected: "+", codePoint: 43, length: 1 },
        { code: 2121, expected: "(", codePoint: 40, length: 1 },
        { code: 2122, expected: ")", codePoint: 41, length: 1 },
      ];

      for (let i = 0; i < entries.length; i++) {
        const actual: string = GetHardKeyValue(entries[i].code, false);
        expect(actual).assertEqual(entries[i].expected);
        expect(actual.length).assertEqual(entries[i].length);
        expect(actual.charCodeAt(0)).assertEqual(entries[i].codePoint);
        const shifted: string = GetHardKeyValue(entries[i].code, true);
        expect(shifted).assertEqual(actual);
      }

      expect(entries.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CHARACTER_MAPPING_0300
     * @tc.name      testHardKeyCharacterMapping_003
     * @tc.desc      Verify that shift leaves the star/hash block unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyCharacterMapping_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_003 begin');

      const entries: MapEntry[] = [
        { code: 2010, expected: "*", codePoint: 42, length: 1 },
        { code: 2011, expected: "#", codePoint: 35, length: 1 },
      ];

      let i: number = 0;
      while (i < entries.length) {
        const actual: string = GetHardKeyValue(entries[i].code, false);
        expect(actual.length).assertEqual(entries[i].length);
        expect(actual.charCodeAt(0)).assertEqual(entries[i].codePoint);
        expect(actual).assertEqual(entries[i].expected);
        const shifted: string = GetHardKeyValue(entries[i].code, true);
        expect(shifted).assertEqual(actual);
        i = i + 1;
      }

      expect(entries.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CHARACTER_MAPPING_0400
     * @tc.name      testHardKeyCharacterMapping_004
     * @tc.desc      Verify that every unmapped code, including boundary extremes, yields the empty translation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyCharacterMapping_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_004 begin');

      const codes: number[] = [1990, 1999, 2049, 2051, 2052, 2053, 2054, 2056, 2057, 2059, 2060, 2061, 2062, 2063, 2067, 2068, 2069, 2070, 2072, 2073, 2080, 2090, 2100, 2102, 2110, 2112, 2113, 2115, 2120, 2123, 2124, 2130, 2150, 2200, 3000, 65535, 100000, 999999, 0, 1, -1, -100, 2147483647, -2147483648];
      hilog.info(DOMAIN, TAG, '%{public}s', `entries=${codes.length}`);

      // Codes outside the 2000-2122 table must not produce text; the table holds every gap and boundary value.
      for (let i = 0; i < codes.length; i++) {
        const plain: string = GetHardKeyValue(codes[i], false);
        const shifted: string = GetHardKeyValue(codes[i], true);
        expect(plain.length).assertEqual(0);
        expect(plain).assertEqual('');
        expect(shifted).assertEqual('');
      }

      expect(codes.length).assertEqual(44);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCharacterMapping_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0100
     * @tc.name      testHardKeyContract_001
     * @tc.desc      Verify that shift keeps the editing block unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_001 begin');

      const entries: MapEntry[] = [
        { code: 2047, expected: "KEYCODE_SHIFT_LEFT", codePoint: 75, length: 18 },
        { code: 2048, expected: "KEYCODE_SHIFT_RIGHT", codePoint: 75, length: 19 },
        { code: 2055, expected: "KEYCODE_DEL", codePoint: 75, length: 11 },
        { code: 2071, expected: "KEYCODE_FORWARD_DEL", codePoint: 75, length: 19 },
      ];

      let i: number = 0;
      while (i < entries.length) {
        const actual: string = GetHardKeyValue(entries[i].code, false);
        expect(actual.charCodeAt(0)).assertEqual(entries[i].codePoint);
        expect(actual).assertContain('KEYCODE');
        expect(actual).assertEqual(entries[i].expected);
        expect(actual.length).assertEqual(entries[i].length);
        const shifted: string = GetHardKeyValue(entries[i].code, true);
        expect(shifted).assertEqual(actual);
        i = i + 1;
      }

      expect(entries.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0200
     * @tc.name      testHardKeyContract_002
     * @tc.desc      Verify that shift keeps the navigation block unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_002 begin');

      const entries: MapEntry[] = [
        { code: 2012, expected: "KEYCODE_DPAD_UP", codePoint: 75, length: 15 },
        { code: 2013, expected: "KEYCODE_DPAD_DOWN", codePoint: 75, length: 17 },
        { code: 2014, expected: "KEYCODE_DPAD_LEFT", codePoint: 75, length: 17 },
        { code: 2015, expected: "KEYCODE_DPAD_RIGHT", codePoint: 75, length: 18 },
        { code: 2016, expected: "KEYCODE_DPAD_CENTER", codePoint: 75, length: 19 },
      ];

      for (let i = 0; i < entries.length; i++) {
        const actual: string = GetHardKeyValue(entries[i].code, false);
        expect(actual).assertContain('KEYCODE');
        expect(actual).assertEqual(entries[i].expected);
        expect(actual.length).assertEqual(entries[i].length);
        expect(actual.charCodeAt(0)).assertEqual(entries[i].codePoint);
        const shifted: string = GetHardKeyValue(entries[i].code, true);
        expect(shifted).assertEqual(actual);
      }

      expect(entries.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0300
     * @tc.name      testHardKeyContract_003
     * @tc.desc      Verify that shift leaves all ten digit codes unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_003 begin');

      // Digits have no uppercase form, so both lookups must return the same character.
      for (let code = 2000; code <= 2009; code++) {
        const plain: string = GetHardKeyValue(code, false);
        const shifted: string = GetHardKeyValue(code, true);
        expect(shifted).assertEqual(plain);
        expect(plain.length).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0400
     * @tc.name      testHardKeyContract_004
     * @tc.desc      Verify that shift leaves star and hash unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_004 begin');
      const starHash: number[] = [2010, 2011];

      // The two dial-pad symbols are not letters and ignore the shift flag.
      for (let i = 0; i < starHash.length; i++) {
        expect(GetHardKeyValue(starHash[i], true)).assertEqual(GetHardKeyValue(starHash[i], false));
      }
      expect(GetHardKeyValue(2011, true)).assertEqual('#');
      expect(GetHardKeyValue(2010, true)).assertEqual('*');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0500
     * @tc.name      testHardKeyContract_005
     * @tc.desc      Verify that shift leaves comma, period, space and the arithmetic symbols unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_005 begin');
      const symbols: number[] = [2043, 2044, 2050, 2058, 2064, 2065, 2066, 2121, 2122];

      // Punctuation and brackets keep their literal form under shift.
      let i: number = 0;
      while (i < symbols.length) {
        expect(GetHardKeyValue(symbols[i], true)).assertEqual(GetHardKeyValue(symbols[i], false));
        i = i + 1;
      }
      expect(GetHardKeyValue(2050, true)).assertEqual(' ');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0600
     * @tc.name      testHardKeyContract_006
     * @tc.desc      Verify that shift keeps every function token spelling unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_006 begin');
      const functionCodes: number[] = [2012, 2013, 2014, 2015, 2016, 2055, 2071];

      // Function tokens are controller directives, not editor text.
      for (let i = 0; i < functionCodes.length; i++) {
        const plain: string = GetHardKeyValue(functionCodes[i], false);
        expect(plain.startsWith('KEYCODE_')).assertTrue();
        expect(GetHardKeyValue(functionCodes[i], true)).assertEqual(plain);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0700
     * @tc.name      testHardKeyContract_007
     * @tc.desc      Verify that both shift codes resolve to their own token with and without shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_007 begin');

      // The shift keys must not turn into text when the flag is set.
      expect(GetHardKeyValue(2047, true)).assertEqual('KEYCODE_SHIFT_LEFT');
      expect(GetHardKeyValue(2047, false)).assertEqual('KEYCODE_SHIFT_LEFT');
      expect(GetHardKeyValue(2048, true)).assertEqual('KEYCODE_SHIFT_RIGHT');
      expect(GetHardKeyValue(2048, false)).assertEqual('KEYCODE_SHIFT_RIGHT');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0800
     * @tc.name      testHardKeyContract_008
     * @tc.desc      Verify that unknown codes stay empty under shift while all letters still change.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_008 begin');
      const unknown: number[] = [200, 1999, 2045, 2046, 2049, 3000, 9999];
      let changedLetters: number = 0;

      // Unknown codes return an empty token for both shift states.
      for (let i = 0; i < unknown.length; i++) {
        expect(GetHardKeyValue(unknown[i], false)).assertEqual('');
        expect(GetHardKeyValue(unknown[i], true)).assertEqual('');
      }
      // Letters are the only family that reacts to shift.
      for (let code = 2017; code <= 2042; code++) {
        if (GetHardKeyValue(code, true) !== GetHardKeyValue(code, false)) {
          changedLetters = changedLetters + 1;
        }
      }
      expect(changedLetters).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_0900
     * @tc.name      testHardKeyContract_009
     * @tc.desc      Verify that codes 2000..2009 map to the ten decimal digits in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_009 begin');
      const expected: string = '0123456789';

      // The digit block is contiguous and ordered.
      let i: number = 0;
      while (i < 10) {
        expect(GetHardKeyValue(2000 + i, false)).assertEqual(expected.charAt(i));
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_1000
     * @tc.name      testHardKeyContract_010
     * @tc.desc      Verify that codes 2017..2042 map to the lowercase alphabet in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHardKeyContract_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_010 begin');

      // The letter block walks a..z without gaps.
      for (let i = 0; i < 26; i++) {
        expect(GetHardKeyValue(2017 + i, false)).assertEqual(String.fromCharCode(97 + i));
      }
      expect(GetHardKeyValue(2042, false)).assertEqual('z');
      expect(GetHardKeyValue(2017, false)).assertEqual('a');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_1100
     * @tc.name      testHardKeyContract_011
     * @tc.desc      Verify that shift uppercase equals the plain mapping uppercased for every letter code.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testHardKeyContract_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_011 begin');
      for (let code = 2017; code <= 2042; code++) {
        const lower: string = GetHardKeyValue(code, false);
        expect(GetHardKeyValue(code, true)).assertEqual(lower.toUpperCase());
        expect(lower.length).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_1200
     * @tc.name      testHardKeyContract_012
     * @tc.desc      Verify that the 2000..2122 range exposes exactly fifty-six mapped codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyContract_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_012 begin');
      let mapped: number = 0;

      // Every code in the table range either has a token or stays empty.
      for (let code = 2000; code <= 2122; code++) {
        if (GetHardKeyValue(code, false) !== '') {
          mapped = mapped + 1;
        }
      }
      expect(mapped).assertEqual(56);
      const unmappedCodes: number[] = [2045, 2046, 2049];
      for (let i = 0; i < unmappedCodes.length; i++) {
        expect(GetHardKeyValue(unmappedCodes[i], false)).assertEqual('');
      }
      expect(GetHardKeyValue(2016, false)).assertEqual('KEYCODE_DPAD_CENTER');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_HARD_KEY_CONTRACT_1300
     * @tc.name      testHardKeyContract_013
     * @tc.desc      Verify that both shift codes keep their token spelling and center keeps an empty token.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyContract_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_013 begin');
      expect(GetHardKeyValue(2048, true)).assertEqual('KEYCODE_SHIFT_RIGHT');
      expect(GetHardKeyValue(2016, true)).assertEqual('KEYCODE_DPAD_CENTER');
      expect(GetHardKeyValue(2047, false)).assertEqual('KEYCODE_SHIFT_LEFT');
      expect(GetHardKeyValue(2048, false)).assertEqual('KEYCODE_SHIFT_RIGHT');
      expect(GetHardKeyValue(2047, true)).assertEqual('KEYCODE_SHIFT_LEFT');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyContract_013 end');
      await yieldToEventLoop();
    });

  });

}
