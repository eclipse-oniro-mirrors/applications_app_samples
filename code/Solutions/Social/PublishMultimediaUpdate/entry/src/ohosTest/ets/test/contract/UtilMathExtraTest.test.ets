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
 * Numeric helpers used by layout arithmetic.
 * Pixel positions are derived with rounding, truncation and clamping. The cases
 * pin each of these helpers for positive, negative and zero inputs so a layout
 * that flips to a negative coordinate is caught by its building blocks.
 */
export default function utilMathExtraTest() {
  describe('UtilMathExtraTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      Logger.info(TAG, 'UtilMathExtraTest ready');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0100
     * @tc.name TruncPositive001
     * @tc.desc Verify truncation drops the fraction of a positive value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TruncPositive_001', 0, (): void => {
      Logger.info(TAG, 'TruncPositive_001 begin');
      expect(Math.trunc(3.9)).assertEqual(3);
      Logger.info(TAG, 'TruncPositive_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0200
     * @tc.name TruncNegative002
     * @tc.desc Verify truncation of a negative value moves toward zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TruncNegative_002', 0, (): void => {
      Logger.info(TAG, 'TruncNegative_002 begin');
      expect(Math.trunc(-3.9)).assertEqual(-3);
      Logger.info(TAG, 'TruncNegative_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0300
     * @tc.name SignReportsDirection003
     * @tc.desc Verify the sign helper reports positive, negative and zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SignReportsDirection_003', 0, (): void => {
      Logger.info(TAG, 'SignReportsDirection_003 begin');
      expect(Math.sign(5)).assertEqual(1);
      expect(Math.sign(-5)).assertEqual(-1);
      expect(Math.sign(0)).assertEqual(0);
      Logger.info(TAG, 'SignReportsDirection_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0400
     * @tc.name AbsDropsSign004
     * @tc.desc Verify the absolute value of a negative input
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbsDropsSign_004', 0, (): void => {
      Logger.info(TAG, 'AbsDropsSign_004 begin');
      expect(Math.abs(-12)).assertEqual(12);
      Logger.info(TAG, 'AbsDropsSign_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0500
     * @tc.name PowScales005
     * @tc.desc Verify exponentiation scales a value by the requested power
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PowScales_005', 0, (): void => {
      Logger.info(TAG, 'PowScales_005 begin');
      expect(Math.pow(2, 10)).assertEqual(1024);
      Logger.info(TAG, 'PowScales_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0600
     * @tc.name SqrtReturnsRoot006
     * @tc.desc Verify the square root of a perfect square
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SqrtReturnsRoot_006', 0, (): void => {
      Logger.info(TAG, 'SqrtReturnsRoot_006 begin');
      expect(Math.sqrt(144)).assertEqual(12);
      Logger.info(TAG, 'SqrtReturnsRoot_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0700
     * @tc.name CeilNegative007
     * @tc.desc Verify ceiling of a negative fraction moves toward zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CeilNegative_007', 0, (): void => {
      Logger.info(TAG, 'CeilNegative_007 begin');
      expect(Math.ceil(-2.1)).assertEqual(-2);
      Logger.info(TAG, 'CeilNegative_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0800
     * @tc.name FloorNegative008
     * @tc.desc Verify flooring a negative fraction moves away from zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FloorNegative_008', 0, (): void => {
      Logger.info(TAG, 'FloorNegative_008 begin');
      expect(Math.floor(-2.1)).assertEqual(-3);
      Logger.info(TAG, 'FloorNegative_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_0900
     * @tc.name MinSeveralArgs009
     * @tc.desc Verify the minimum helper considers every argument
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MinSeveralArgs_009', 0, (): void => {
      Logger.info(TAG, 'MinSeveralArgs_009 begin');
      expect(Math.min(7, 3, 9)).assertEqual(3);
      Logger.info(TAG, 'MinSeveralArgs_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MATHEXTRA_1000
     * @tc.name MaxSeveralArgs010
     * @tc.desc Verify the maximum helper considers every argument, as covered by the util math extra test suite - MaxSeveralArgs_1000
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MaxSeveralArgs_010', 0, (): void => {
      Logger.info(TAG, 'MaxSeveralArgs_010 begin');
      expect(Math.max(7, 3, 9)).assertEqual(9);
      Logger.info(TAG, 'MaxSeveralArgs_010 end');
    });
  });
}
