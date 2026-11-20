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
import { keyboardController } from '../../../../main/ets/InputMethodExtensionAbility/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodKeyPredicate]';

export default function keyPredicateTest(): void {
  describe('KeyPredicateTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_PREDICATE_0001
     * @tc.name      testKeyPredicateTest_001
     * @tc.desc      Verify that all twenty-six letter codes are accepted by the alphabet predicate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyPredicateTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_001 begin');

      for (let code = 2017; code <= 2042; code++) {
        expect(keyboardController.isKeyCodeAZ(code)).assertEqual(true);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_PREDICATE_0002
     * @tc.name      testKeyPredicateTest_002
     * @tc.desc      Verify that the alphabet predicate rejects the codes immediately outside A..Z.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyPredicateTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_002 begin');
      const outside: number[] = [0, 1999, 2000, 2016, 2043, 2103, 3000, -1];

      for (let i = 0; i < outside.length; i++) {
        expect(keyboardController.isKeyCodeAZ(outside[i])).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_PREDICATE_0003
     * @tc.name      testKeyPredicateTest_003
     * @tc.desc      Verify that digits, function keys and punctuation are not classified as letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyPredicateTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_003 begin');
      const nonLetters: number[] = [
        2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
        2010, 2011, 2012, 2013, 2014, 2015, 2016, 2043, 2044, 2047,
        2048, 2050, 2055, 2058, 2064, 2065, 2066, 2071, 2121, 2122,
        2103, 2104, 2105, 2106, 2107, 2108, 2109, 2110, 2111, 2112
      ];

      for (let i = 0; i < nonLetters.length; i++) {
        expect(keyboardController.isKeyCodeAZ(nonLetters[i])).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_PREDICATE_0004
     * @tc.name      testKeyPredicateTest_004
     * @tc.desc      Verify that the number predicate rejects codes on both sides of its two ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyPredicateTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_004 begin');
      const outside: number[] = [0, 1999, 2010, 2042, 2102, 2113, 3000];

      for (let i = 0; i < outside.length; i++) {
        expect(keyboardController.isKeyCodeNumber(outside[i])).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_PREDICATE_0005
     * @tc.name      testKeyPredicateTest_005
     * @tc.desc      Verify that no code in the mapped range is classified as both a letter and a number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyPredicateTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_005 begin');

      for (let code = 2000; code <= 2122; code++) {
        expect(keyboardController.isKeyCodeAZ(code) && keyboardController.isKeyCodeNumber(code)).assertEqual(false);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_PREDICATE_0006
     * @tc.name      testKeyPredicateTest_006
     * @tc.desc      Verify that keypad digits are numbers for classification but have no hard-key glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyPredicateTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_006 begin');

      // The glyph table covers 2000..2009 only; keypad codes stop at the predicate.
      for (let code = 2103; code <= 2112; code++) {
        expect(keyboardController.isKeyCodeNumber(code)).assertEqual(true);
        expect(GetHardKeyValue(code, false)).assertEqual('');
        expect(GetHardKeyValue(code, true)).assertEqual('');
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyPredicateTest_006 end');
      await yieldToEventLoop();
    });

  });

}
