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

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodHardKeySpecialMapping]';

interface MappingRow {
  code: number;
  lower: string;
  upper: string;
}

export default function hardKeySpecialMappingTest(): void {
  describe('HardKeySpecialMappingTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_SPECIAL_0001
     * @tc.name      testHardKeySpecialMappingTest_001
     * @tc.desc      Verify that punctuation and whitespace codes keep the same glyph with shift held.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeySpecialMappingTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_001 begin');
      const rows: MappingRow[] = [
        { code: 2010, lower: '*', upper: '*' },
        { code: 2011, lower: '#', upper: '#' },
        { code: 2043, lower: ',', upper: ',' },
        { code: 2044, lower: '.', upper: '.' },
        { code: 2050, lower: ' ', upper: ' ' },
        { code: 2058, lower: '=', upper: '=' },
        { code: 2064, lower: '/', upper: '/' },
        { code: 2065, lower: '@', upper: '@' },
        { code: 2066, lower: '+', upper: '+' },
        { code: 2121, lower: '(', upper: '(' },
        { code: 2122, lower: ')', upper: ')' }
      ];

      for (let i = 0; i < rows.length; i++) {
        expect(GetHardKeyValue(rows[i].code, false)).assertEqual(rows[i].lower);
        expect(GetHardKeyValue(rows[i].code, true)).assertEqual(rows[i].upper);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_SPECIAL_0002
     * @tc.name      testHardKeySpecialMappingTest_002
     * @tc.desc      Verify that every function key keeps its symbolic token regardless of shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeySpecialMappingTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_002 begin');
      const rows: MappingRow[] = [
        { code: 2012, lower: 'KEYCODE_DPAD_UP', upper: 'KEYCODE_DPAD_UP' },
        { code: 2013, lower: 'KEYCODE_DPAD_DOWN', upper: 'KEYCODE_DPAD_DOWN' },
        { code: 2014, lower: 'KEYCODE_DPAD_LEFT', upper: 'KEYCODE_DPAD_LEFT' },
        { code: 2015, lower: 'KEYCODE_DPAD_RIGHT', upper: 'KEYCODE_DPAD_RIGHT' },
        { code: 2016, lower: 'KEYCODE_DPAD_CENTER', upper: 'KEYCODE_DPAD_CENTER' },
        { code: 2055, lower: 'KEYCODE_DEL', upper: 'KEYCODE_DEL' },
        { code: 2071, lower: 'KEYCODE_FORWARD_DEL', upper: 'KEYCODE_FORWARD_DEL' }
      ];

      for (let i = 0; i < rows.length; i++) {
        expect(GetHardKeyValue(rows[i].code, false)).assertEqual(rows[i].lower);
        expect(GetHardKeyValue(rows[i].code, true)).assertEqual(rows[i].upper);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_SPECIAL_0003
     * @tc.name      testHardKeySpecialMappingTest_003
     * @tc.desc      Verify that both shift codes map to their own tokens in either shift state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeySpecialMappingTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_003 begin');

      expect(GetHardKeyValue(2047, false)).assertEqual('KEYCODE_SHIFT_LEFT');
      expect(GetHardKeyValue(2047, true)).assertEqual('KEYCODE_SHIFT_LEFT');
      expect(GetHardKeyValue(2048, false)).assertEqual('KEYCODE_SHIFT_RIGHT');
      expect(GetHardKeyValue(2048, true)).assertEqual('KEYCODE_SHIFT_RIGHT');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_SPECIAL_0004
     * @tc.name      testHardKeySpecialMappingTest_004
     * @tc.desc      Verify that codes absent from the table produce an empty token in both shift states.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeySpecialMappingTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_004 begin');
      const unknownCodes: number[] = [
        1999, 2045, 2046, 2049, 2051, 2052, 2053, 2054, 2056, 2057, 2059,
        2060, 2061, 2062, 2063, 2067, 2100, 2102, 2103, 2112, 2113, 3000
      ];

      for (let i = 0; i < unknownCodes.length; i++) {
        expect(GetHardKeyValue(unknownCodes[i], false)).assertEqual('');
        expect(GetHardKeyValue(unknownCodes[i], true)).assertEqual('');
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_SPECIAL_0005
     * @tc.name      testHardKeySpecialMappingTest_005
     * @tc.desc      Verify that code 2029 resolves to m, including its shifted form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeySpecialMappingTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_005 begin');
      const harnessValue: string = GetHardKeyValue(2029, false);
      const harnessShifted: string = GetHardKeyValue(2029, true);

      expect(harnessValue).assertEqual('m');
      expect(harnessShifted).assertEqual('M');
      expect(harnessValue.length).assertEqual(1);
      expect(harnessShifted.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_SPECIAL_0006
     * @tc.name      testHardKeySpecialMappingTest_006
     * @tc.desc      Verify that shift changes letters only, leaving digit and punctuation glyphs intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeySpecialMappingTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_006 begin');
      const letters: number[] = [2017, 2021, 2026, 2032, 2038, 2042];
      const stable: number[] = [2000, 2005, 2009, 2010, 2043, 2050, 2065];

      for (let i = 0; i < letters.length; i++) {
        const lower: string = GetHardKeyValue(letters[i], false);
        const upper: string = GetHardKeyValue(letters[i], true);
        expect(upper).assertEqual(lower.toUpperCase());
        expect(upper === lower).assertFalse();
      }
      for (let i = 0; i < stable.length; i++) {
        expect(GetHardKeyValue(stable[i], true)).assertEqual(GetHardKeyValue(stable[i], false));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_SPECIAL_0007
     * @tc.name      testHardKeySpecialMappingTest_007
     * @tc.desc      Verify that zero and negative codes return no token instead of a default glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeySpecialMappingTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_007 begin');
      const invalidCodes: number[] = [-1, 0, 1, 1000];

      for (let i = 0; i < invalidCodes.length; i++) {
        expect(GetHardKeyValue(invalidCodes[i], false)).assertEqual('');
        expect(GetHardKeyValue(invalidCodes[i], true)).assertEqual('');
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeySpecialMappingTest_007 end');
      await yieldToEventLoop();
    });

  });

}
