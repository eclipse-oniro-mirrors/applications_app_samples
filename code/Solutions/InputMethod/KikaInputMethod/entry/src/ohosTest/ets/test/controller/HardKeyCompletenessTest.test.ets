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
const TAG: string = '[Sample_KikaInputMethodHardKeyCompleteness]';

interface CodeRow {
  code: number;
  value: string;
}

export default function hardKeyCompletenessTest(): void {
  describe('HardKeyCompletenessTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_COMPLETE_0001
     * @tc.name      testHardKeyCompletenessTest_001
     * @tc.desc      Verify the mapped codes below 2030 and that other codes up to 2029 stay empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyCompletenessTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_001 begin');
      const rows: CodeRow[] = [
        { code: 2000, value: '0' },
        { code: 2001, value: '1' },
        { code: 2002, value: '2' },
        { code: 2003, value: '3' },
        { code: 2004, value: '4' },
        { code: 2005, value: '5' },
        { code: 2006, value: '6' },
        { code: 2007, value: '7' },
        { code: 2008, value: '8' },
        { code: 2009, value: '9' },
        { code: 2010, value: '*' },
        { code: 2011, value: '#' },
        { code: 2012, value: 'KEYCODE_DPAD_UP' },
        { code: 2013, value: 'KEYCODE_DPAD_DOWN' },
        { code: 2014, value: 'KEYCODE_DPAD_LEFT' },
        { code: 2015, value: 'KEYCODE_DPAD_RIGHT' },
        { code: 2016, value: 'KEYCODE_DPAD_CENTER' },
        { code: 2017, value: 'a' },
        { code: 2018, value: 'b' },
        { code: 2019, value: 'c' },
        { code: 2020, value: 'd' },
        { code: 2021, value: 'e' },
        { code: 2022, value: 'f' },
        { code: 2023, value: 'g' },
        { code: 2024, value: 'h' },
        { code: 2025, value: 'i' },
        { code: 2026, value: 'j' },
        { code: 2027, value: 'k' },
        { code: 2028, value: 'l' },
        { code: 2029, value: 'm' }
      ];
      const mapped: Set<number> = new Set<number>();
      expect(rows.length).assertEqual(30);
      for (let i = 0; i < rows.length; i++) {
        expect(GetHardKeyValue(rows[i].code, false)).assertEqual(rows[i].value);
        mapped.add(rows[i].code);
      }
      for (let code = 2000; code <= 2029; code++) {
        if (!mapped.has(code)) {
          expect(GetHardKeyValue(code, false)).assertEqual('');
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_COMPLETE_0004
     * @tc.name      testHardKeyCompletenessTest_004
     * @tc.desc      Verify the mapped codes from 2030 upward and that the remaining range stays empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyCompletenessTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_004 begin');
      const rows: CodeRow[] = [
        { code: 2030, value: 'n' },
        { code: 2031, value: 'o' },
        { code: 2032, value: 'p' },
        { code: 2033, value: 'q' },
        { code: 2034, value: 'r' },
        { code: 2035, value: 's' },
        { code: 2036, value: 't' },
        { code: 2037, value: 'u' },
        { code: 2038, value: 'v' },
        { code: 2039, value: 'w' },
        { code: 2040, value: 'x' },
        { code: 2041, value: 'y' },
        { code: 2042, value: 'z' },
        { code: 2043, value: ',' },
        { code: 2044, value: '.' },
        { code: 2047, value: 'KEYCODE_SHIFT_LEFT' },
        { code: 2048, value: 'KEYCODE_SHIFT_RIGHT' },
        { code: 2050, value: ' ' },
        { code: 2055, value: 'KEYCODE_DEL' },
        { code: 2058, value: '=' },
        { code: 2064, value: '/' },
        { code: 2065, value: '@' },
        { code: 2066, value: '+' },
        { code: 2071, value: 'KEYCODE_FORWARD_DEL' },
        { code: 2121, value: '(' },
        { code: 2122, value: ')' }
      ];
      const mapped: Set<number> = new Set<number>();
      expect(rows.length).assertEqual(26);
      for (let i = 0; i < rows.length; i++) {
        expect(GetHardKeyValue(rows[i].code, false)).assertEqual(rows[i].value);
        mapped.add(rows[i].code);
      }
      for (let code = 2030; code <= 2200; code++) {
        if (!mapped.has(code)) {
          expect(GetHardKeyValue(code, false)).assertEqual('');
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_COMPLETE_0002
     * @tc.name      testHardKeyCompletenessTest_002
     * @tc.desc      Verify that shift uppercases only one-letter alphabet tokens and leaves all others alone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testHardKeyCompletenessTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_002 begin');
      const rows: CodeRow[] = [
        { code: 2000, value: '0' }, { code: 2010, value: '*' },
        { code: 2012, value: 'KEYCODE_DPAD_UP' }, { code: 2017, value: 'a' },
        { code: 2029, value: 'm' }, { code: 2042, value: 'z' },
        { code: 2043, value: ',' }, { code: 2050, value: ' ' },
        { code: 2055, value: 'KEYCODE_DEL' }, { code: 2122, value: ')' }
      ];

      for (let i = 0; i < rows.length; i++) {
        const shifted: string = GetHardKeyValue(rows[i].code, true);
        if (rows[i].value >= 'a' && rows[i].value <= 'z') {
          expect(shifted).assertEqual(rows[i].value.toUpperCase());
        } else {
          expect(shifted).assertEqual(rows[i].value);
        }
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_HARD_KEY_COMPLETE_0003
     * @tc.name      testHardKeyCompletenessTest_003
     * @tc.desc      Verify that the fifty-six mapped codes have fifty-six distinct tokens.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testHardKeyCompletenessTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_003 begin');
      const tokens: Set<string> = new Set<string>();

      for (let code = 2000; code <= 2200; code++) {
        const value: string = GetHardKeyValue(code, false);
        if (value !== '') {
          tokens.add(value);
        }
      }
      expect(tokens.size).assertEqual(56);
      expect(tokens.has('a')).assertTrue();
      expect(tokens.has('z')).assertTrue();
      expect(tokens.has('KEYCODE_FORWARD_DEL')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testHardKeyCompletenessTest_003 end');
      await yieldToEventLoop();
    });

  });

}
