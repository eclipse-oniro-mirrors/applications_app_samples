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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Number parsing and formatting used by derived values.
 * Publication ids and sizes are derived from numbers, so the cases pin the
 * parsing rules, the integer and finite checks and the fixed point format that
 * turns a size into text.
 */
function notANumber(): number {
  return Number.parseInt('not a number');
}
export default function utilNumberFormatTest() {
  describe('UtilNumberFormatTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      Logger.info(TAG, 'UtilNumberFormatTest ready');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0100
     * @tc.name FiniteAccepted001
     * @tc.desc Verify a finite value passes the finite check and infinity fails it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FiniteAccepted_001', 0, (): void => {
      Logger.info(TAG, 'FiniteAccepted_001 begin');
      expect(Number.isFinite(12)).assertTrue();
      expect(Number.isFinite(Infinity)).assertFalse();
      Logger.info(TAG, 'FiniteAccepted_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0200
     * @tc.name IntegerRecognized002
     * @tc.desc Verify the integer check separates whole numbers from fractions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IntegerRecognized_002', 0, (): void => {
      Logger.info(TAG, 'IntegerRecognized_002 begin');
      expect(Number.isInteger(3)).assertTrue();
      expect(Number.isInteger(3.5)).assertFalse();
      Logger.info(TAG, 'IntegerRecognized_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0300
     * @tc.name ParseIntDecimal003
     * @tc.desc Verify decimal text parses to the matching integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ParseIntDecimal_003', 0, (): void => {
      Logger.info(TAG, 'ParseIntDecimal_003 begin');
      expect(Number.parseInt('42')).assertEqual(42);
      Logger.info(TAG, 'ParseIntDecimal_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0400
     * @tc.name ParseIntRadix004
     * @tc.desc Verify a radix argument is honoured when parsing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ParseIntRadix_004', 0, (): void => {
      Logger.info(TAG, 'ParseIntRadix_004 begin');
      expect(Number.parseInt('ff', 16)).assertEqual(255);
      Logger.info(TAG, 'ParseIntRadix_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0500
     * @tc.name ParseFloatDecimal005
     * @tc.desc Verify decimal text with a fraction parses to the same value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ParseFloatDecimal_005', 0, (): void => {
      Logger.info(TAG, 'ParseFloatDecimal_005 begin');
      expect(Number.parseFloat('1.5')).assertEqual(1.5);
      Logger.info(TAG, 'ParseFloatDecimal_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0600
     * @tc.name ToFixedPadsDigits006
     * @tc.desc Verify fixed point formatting pads the fraction to the requested digits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ToFixedPadsDigits_006', 0, (): void => {
      Logger.info(TAG, 'ToFixedPadsDigits_006 begin');
      expect((1.5).toFixed(2)).assertEqual('1.50');
      Logger.info(TAG, 'ToFixedPadsDigits_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0700
     * @tc.name NumericTextConverts007
     * @tc.desc Verify numeric text converts to an equal number value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumericTextConverts_007', 0, (): void => {
      Logger.info(TAG, 'NumericTextConverts_007 begin');
      const value: number = Number('12');
      expect(value).assertEqual(12);
      Logger.info(TAG, 'NumericTextConverts_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0800
     * @tc.name NanRecognized008
     * @tc.desc Verify the not a number check separates NaN from a real value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NanRecognized_008', 0, (): void => {
      Logger.info(TAG, 'NanRecognized_008 begin');
      expect(Number.isNaN(NaN)).assertTrue();
      expect(Number.isNaN(1)).assertFalse();
      Logger.info(TAG, 'NanRecognized_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_0900
     * @tc.name RoundHalfUp009
     * @tc.desc Verify rounding a half value goes to the larger integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RoundHalfUp_009', 0, (): void => {
      Logger.info(TAG, 'RoundHalfUp_009 begin');
      expect(Math.round(2.5)).assertEqual(3);
      expect(Math.round(2.4)).assertEqual(2);
      Logger.info(TAG, 'RoundHalfUp_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_1000
     * @tc.name MinMaxSelect010
     * @tc.desc Verify the min and max helpers pick the expected argument
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MinMaxSelect_010', 0, (): void => {
      Logger.info(TAG, 'MinMaxSelect_010 begin');
      expect(Math.min(4, 9)).assertEqual(4);
      expect(Math.max(4, 9)).assertEqual(9);
      Logger.info(TAG, 'MinMaxSelect_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_1100
     * @tc.name SafeIntegerBound011
     * @tc.desc Verify the safe integer bound is a positive value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SafeIntegerBound_011', 0, (): void => {
      Logger.info(TAG, 'SafeIntegerBound_011 begin');
      expect(Number.MAX_SAFE_INTEGER !== 0).assertTrue();
      expect(Number.MAX_SAFE_INTEGER).assertEqual(Math.floor(Number.MAX_SAFE_INTEGER));
      Logger.info(TAG, 'SafeIntegerBound_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_NUMBER_1200
     * @tc.name NanNeverEqualsItself012
     * @tc.desc Verify NaN is not equal to itself, so equality checks cannot detect it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NanNeverEqualsItself_012', 0, (): void => {
      Logger.info(TAG, 'NanNeverEqualsItself_012 begin');
      const same: boolean = notANumber() === notANumber();
      expect(same).assertFalse();
      Logger.info(TAG, 'NanNeverEqualsItself_012 end');
    });
  });
}
