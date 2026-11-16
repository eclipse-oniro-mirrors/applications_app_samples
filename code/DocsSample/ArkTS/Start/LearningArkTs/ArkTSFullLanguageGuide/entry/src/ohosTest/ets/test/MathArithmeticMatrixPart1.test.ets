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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { add, multiply } from '../../../main/ets/common/Math';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function MathArithmeticMatrixPart1Test(): void {
  describe('MathArithmeticMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0100
     * @tc.name      testMathPair0001
     * @tc.desc      Verify add/multiply for operands 5 and 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0001 begin');
      const actualAdd: number = add(5, 5);
      expect(Math.abs(actualAdd - (10.0)) <= Math.abs(10.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 5);
      expect(Math.abs(actualMul - (25.0)) <= Math.abs(25.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0200
     * @tc.name      testMathPair0002
     * @tc.desc      Verify add/multiply for operands 5 and -5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0002 begin');
      const actualAdd: number = add(5, -5);
      expect(Math.abs(actualAdd - (0.0)) <= Math.abs(0.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -5);
      expect(Math.abs(actualMul - (-25.0)) <= Math.abs(-25.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0300
     * @tc.name      testMathPair0003
     * @tc.desc      Verify add/multiply for operands 5 and 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0003 begin');
      const actualAdd: number = add(5, 9);
      expect(Math.abs(actualAdd - (14.0)) <= Math.abs(14.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 9);
      expect(Math.abs(actualMul - (45.0)) <= Math.abs(45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0400
     * @tc.name      testMathPair0004
     * @tc.desc      Verify add/multiply for operands 5 and -9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0004 begin');
      const actualAdd: number = add(5, -9);
      expect(Math.abs(actualAdd - (-4.0)) <= Math.abs(-4.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -9);
      expect(Math.abs(actualMul - (-45.0)) <= Math.abs(-45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0500
     * @tc.name      testMathPair0005
     * @tc.desc      Verify add/multiply for operands 5 and 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0005 begin');
      const actualAdd: number = add(5, 11);
      expect(Math.abs(actualAdd - (16.0)) <= Math.abs(16.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 11);
      expect(Math.abs(actualMul - (55.0)) <= Math.abs(55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0600
     * @tc.name      testMathPair0006
     * @tc.desc      Verify add/multiply for operands 5 and -11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0006 begin');
      const actualAdd: number = add(5, -11);
      expect(Math.abs(actualAdd - (-6.0)) <= Math.abs(-6.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -11);
      expect(Math.abs(actualMul - (-55.0)) <= Math.abs(-55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0700
     * @tc.name      testMathPair0007
     * @tc.desc      Verify add/multiply for operands 5 and 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0007 begin');
      const actualAdd: number = add(5, 13);
      expect(Math.abs(actualAdd - (18.0)) <= Math.abs(18.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 13);
      expect(Math.abs(actualMul - (65.0)) <= Math.abs(65.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0800
     * @tc.name      testMathPair0008
     * @tc.desc      Verify add/multiply for operands 5 and -13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0008 begin');
      const actualAdd: number = add(5, -13);
      expect(Math.abs(actualAdd - (-8.0)) <= Math.abs(-8.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -13);
      expect(Math.abs(actualMul - (-65.0)) <= Math.abs(-65.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_0900
     * @tc.name      testMathPair0009
     * @tc.desc      Verify add/multiply for operands 5 and 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0009 begin');
      const actualAdd: number = add(5, 25);
      expect(Math.abs(actualAdd - (30.0)) <= Math.abs(30.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 25);
      expect(Math.abs(actualMul - (125.0)) <= Math.abs(125.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1000
     * @tc.name      testMathPair0010
     * @tc.desc      Verify add/multiply for operands 5 and -25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0010 begin');
      const actualAdd: number = add(5, -25);
      expect(Math.abs(actualAdd - (-20.0)) <= Math.abs(-20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -25);
      expect(Math.abs(actualMul - (-125.0)) <= Math.abs(-125.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1100
     * @tc.name      testMathPair0011
     * @tc.desc      Verify add/multiply for operands 5 and 0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0011 begin');
      const actualAdd: number = add(5, 0.25);
      expect(Math.abs(actualAdd - (5.25)) <= Math.abs(5.25) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 0.25);
      expect(Math.abs(actualMul - (1.25)) <= Math.abs(1.25) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1200
     * @tc.name      testMathPair0012
     * @tc.desc      Verify add/multiply for operands 5 and -0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0012 begin');
      const actualAdd: number = add(5, -0.35);
      expect(Math.abs(actualAdd - (4.65)) <= Math.abs(4.65) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -0.35);
      expect(Math.abs(actualMul - (-1.75)) <= Math.abs(-1.75) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1300
     * @tc.name      testMathPair0013
     * @tc.desc      Verify add/multiply for operands 5 and 2.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0013 begin');
      const actualAdd: number = add(5, 2.5);
      expect(Math.abs(actualAdd - (7.5)) <= Math.abs(7.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 2.5);
      expect(Math.abs(actualMul - (12.5)) <= Math.abs(12.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1400
     * @tc.name      testMathPair0014
     * @tc.desc      Verify add/multiply for operands 5 and -3.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0014 begin');
      const actualAdd: number = add(5, -3.5);
      expect(Math.abs(actualAdd - (1.5)) <= Math.abs(1.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -3.5);
      expect(Math.abs(actualMul - (-17.5)) <= Math.abs(-17.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1500
     * @tc.name      testMathPair0015
     * @tc.desc      Verify add/multiply for operands 5 and 10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0015 begin');
      const actualAdd: number = add(5, 10000);
      expect(Math.abs(actualAdd - (10005.0)) <= Math.abs(10005.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 10000);
      expect(Math.abs(actualMul - (50000.0)) <= Math.abs(50000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1600
     * @tc.name      testMathPair0016
     * @tc.desc      Verify add/multiply for operands 5 and -10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0016 begin');
      const actualAdd: number = add(5, -10000);
      expect(Math.abs(actualAdd - (-9995.0)) <= Math.abs(-9995.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -10000);
      expect(Math.abs(actualMul - (-50000.0)) <= Math.abs(-50000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1700
     * @tc.name      testMathPair0017
     * @tc.desc      Verify add/multiply for operands 5 and 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0017 begin');
      const actualAdd: number = add(5, 123);
      expect(Math.abs(actualAdd - (128.0)) <= Math.abs(128.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 123);
      expect(Math.abs(actualMul - (615.0)) <= Math.abs(615.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1800
     * @tc.name      testMathPair0018
     * @tc.desc      Verify add/multiply for operands 5 and -123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0018 begin');
      const actualAdd: number = add(5, -123);
      expect(Math.abs(actualAdd - (-118.0)) <= Math.abs(-118.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -123);
      expect(Math.abs(actualMul - (-615.0)) <= Math.abs(-615.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_1900
     * @tc.name      testMathPair0019
     * @tc.desc      Verify add/multiply for operands 5 and 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0019 begin');
      const actualAdd: number = add(5, 999);
      expect(Math.abs(actualAdd - (1004.0)) <= Math.abs(1004.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 999);
      expect(Math.abs(actualMul - (4995.0)) <= Math.abs(4995.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2000
     * @tc.name      testMathPair0020
     * @tc.desc      Verify add/multiply for operands 5 and -999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0020 begin');
      const actualAdd: number = add(5, -999);
      expect(Math.abs(actualAdd - (-994.0)) <= Math.abs(-994.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -999);
      expect(Math.abs(actualMul - (-4995.0)) <= Math.abs(-4995.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2100
     * @tc.name      testMathPair0021
     * @tc.desc      Verify add/multiply for operands 5 and 7.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0021 begin');
      const actualAdd: number = add(5, 7.5);
      expect(Math.abs(actualAdd - (12.5)) <= Math.abs(12.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 7.5);
      expect(Math.abs(actualMul - (37.5)) <= Math.abs(37.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2200
     * @tc.name      testMathPair0022
     * @tc.desc      Verify add/multiply for operands 5 and -8.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0022 begin');
      const actualAdd: number = add(5, -8.5);
      expect(Math.abs(actualAdd - (-3.5)) <= Math.abs(-3.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -8.5);
      expect(Math.abs(actualMul - (-42.5)) <= Math.abs(-42.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2300
     * @tc.name      testMathPair0023
     * @tc.desc      Verify add/multiply for operands 5 and 0.125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0023 begin');
      const actualAdd: number = add(5, 0.125);
      expect(Math.abs(actualAdd - (5.125)) <= Math.abs(5.125) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 0.125);
      expect(Math.abs(actualMul - (0.625)) <= Math.abs(0.625) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2400
     * @tc.name      testMathPair0024
     * @tc.desc      Verify add/multiply for operands 5 and -0.625.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0024 begin');
      const actualAdd: number = add(5, -0.625);
      expect(Math.abs(actualAdd - (4.375)) <= Math.abs(4.375) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -0.625);
      expect(Math.abs(actualMul - (-3.125)) <= Math.abs(-3.125) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2500
     * @tc.name      testMathPair0025
     * @tc.desc      Verify add/multiply for operands 5 and 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0025 begin');
      const actualAdd: number = add(5, 6);
      expect(Math.abs(actualAdd - (11.0)) <= Math.abs(11.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 6);
      expect(Math.abs(actualMul - (30.0)) <= Math.abs(30.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2600
     * @tc.name      testMathPair0026
     * @tc.desc      Verify add/multiply for operands 5 and -6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0026 begin');
      const actualAdd: number = add(5, -6);
      expect(Math.abs(actualAdd - (-1.0)) <= Math.abs(-1.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -6);
      expect(Math.abs(actualMul - (-30.0)) <= Math.abs(-30.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2700
     * @tc.name      testMathPair0027
     * @tc.desc      Verify add/multiply for operands 5 and 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0027 begin');
      const actualAdd: number = add(5, 15);
      expect(Math.abs(actualAdd - (20.0)) <= Math.abs(20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, 15);
      expect(Math.abs(actualMul - (75.0)) <= Math.abs(75.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2800
     * @tc.name      testMathPair0028
     * @tc.desc      Verify add/multiply for operands 5 and -15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0028 begin');
      const actualAdd: number = add(5, -15);
      expect(Math.abs(actualAdd - (-10.0)) <= Math.abs(-10.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(5, -15);
      expect(Math.abs(actualMul - (-75.0)) <= Math.abs(-75.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_2900
     * @tc.name      testMathPair0029
     * @tc.desc      Verify add/multiply for operands -5 and 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0029 begin');
      const actualAdd: number = add(-5, 5);
      expect(Math.abs(actualAdd - (0.0)) <= Math.abs(0.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 5);
      expect(Math.abs(actualMul - (-25.0)) <= Math.abs(-25.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3000
     * @tc.name      testMathPair0030
     * @tc.desc      Verify add/multiply for operands -5 and -5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0030 begin');
      const actualAdd: number = add(-5, -5);
      expect(Math.abs(actualAdd - (-10.0)) <= Math.abs(-10.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -5);
      expect(Math.abs(actualMul - (25.0)) <= Math.abs(25.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3100
     * @tc.name      testMathPair0031
     * @tc.desc      Verify add/multiply for operands -5 and 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0031 begin');
      const actualAdd: number = add(-5, 9);
      expect(Math.abs(actualAdd - (4.0)) <= Math.abs(4.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 9);
      expect(Math.abs(actualMul - (-45.0)) <= Math.abs(-45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3200
     * @tc.name      testMathPair0032
     * @tc.desc      Verify add/multiply for operands -5 and -9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0032 begin');
      const actualAdd: number = add(-5, -9);
      expect(Math.abs(actualAdd - (-14.0)) <= Math.abs(-14.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -9);
      expect(Math.abs(actualMul - (45.0)) <= Math.abs(45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3300
     * @tc.name      testMathPair0033
     * @tc.desc      Verify add/multiply for operands -5 and 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0033 begin');
      const actualAdd: number = add(-5, 11);
      expect(Math.abs(actualAdd - (6.0)) <= Math.abs(6.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 11);
      expect(Math.abs(actualMul - (-55.0)) <= Math.abs(-55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3400
     * @tc.name      testMathPair0034
     * @tc.desc      Verify add/multiply for operands -5 and -11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0034 begin');
      const actualAdd: number = add(-5, -11);
      expect(Math.abs(actualAdd - (-16.0)) <= Math.abs(-16.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -11);
      expect(Math.abs(actualMul - (55.0)) <= Math.abs(55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3500
     * @tc.name      testMathPair0035
     * @tc.desc      Verify add/multiply for operands -5 and 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0035 begin');
      const actualAdd: number = add(-5, 13);
      expect(Math.abs(actualAdd - (8.0)) <= Math.abs(8.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 13);
      expect(Math.abs(actualMul - (-65.0)) <= Math.abs(-65.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3600
     * @tc.name      testMathPair0036
     * @tc.desc      Verify add/multiply for operands -5 and -13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0036 begin');
      const actualAdd: number = add(-5, -13);
      expect(Math.abs(actualAdd - (-18.0)) <= Math.abs(-18.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -13);
      expect(Math.abs(actualMul - (65.0)) <= Math.abs(65.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3700
     * @tc.name      testMathPair0037
     * @tc.desc      Verify add/multiply for operands -5 and 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0037 begin');
      const actualAdd: number = add(-5, 25);
      expect(Math.abs(actualAdd - (20.0)) <= Math.abs(20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 25);
      expect(Math.abs(actualMul - (-125.0)) <= Math.abs(-125.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3800
     * @tc.name      testMathPair0038
     * @tc.desc      Verify add/multiply for operands -5 and -25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0038 begin');
      const actualAdd: number = add(-5, -25);
      expect(Math.abs(actualAdd - (-30.0)) <= Math.abs(-30.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -25);
      expect(Math.abs(actualMul - (125.0)) <= Math.abs(125.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_3900
     * @tc.name      testMathPair0039
     * @tc.desc      Verify add/multiply for operands -5 and 0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0039 begin');
      const actualAdd: number = add(-5, 0.25);
      expect(Math.abs(actualAdd - (-4.75)) <= Math.abs(-4.75) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 0.25);
      expect(Math.abs(actualMul - (-1.25)) <= Math.abs(-1.25) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4000
     * @tc.name      testMathPair0040
     * @tc.desc      Verify add/multiply for operands -5 and -0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0040 begin');
      const actualAdd: number = add(-5, -0.35);
      expect(Math.abs(actualAdd - (-5.35)) <= Math.abs(-5.35) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -0.35);
      expect(Math.abs(actualMul - (1.75)) <= Math.abs(1.75) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4100
     * @tc.name      testMathPair0041
     * @tc.desc      Verify add/multiply for operands -5 and 2.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0041 begin');
      const actualAdd: number = add(-5, 2.5);
      expect(Math.abs(actualAdd - (-2.5)) <= Math.abs(-2.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 2.5);
      expect(Math.abs(actualMul - (-12.5)) <= Math.abs(-12.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4200
     * @tc.name      testMathPair0042
     * @tc.desc      Verify add/multiply for operands -5 and -3.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0042 begin');
      const actualAdd: number = add(-5, -3.5);
      expect(Math.abs(actualAdd - (-8.5)) <= Math.abs(-8.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -3.5);
      expect(Math.abs(actualMul - (17.5)) <= Math.abs(17.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4300
     * @tc.name      testMathPair0043
     * @tc.desc      Verify add/multiply for operands -5 and 10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0043 begin');
      const actualAdd: number = add(-5, 10000);
      expect(Math.abs(actualAdd - (9995.0)) <= Math.abs(9995.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 10000);
      expect(Math.abs(actualMul - (-50000.0)) <= Math.abs(-50000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4400
     * @tc.name      testMathPair0044
     * @tc.desc      Verify add/multiply for operands -5 and -10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0044 begin');
      const actualAdd: number = add(-5, -10000);
      expect(Math.abs(actualAdd - (-10005.0)) <= Math.abs(-10005.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -10000);
      expect(Math.abs(actualMul - (50000.0)) <= Math.abs(50000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4500
     * @tc.name      testMathPair0045
     * @tc.desc      Verify add/multiply for operands -5 and 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0045 begin');
      const actualAdd: number = add(-5, 123);
      expect(Math.abs(actualAdd - (118.0)) <= Math.abs(118.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 123);
      expect(Math.abs(actualMul - (-615.0)) <= Math.abs(-615.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4600
     * @tc.name      testMathPair0046
     * @tc.desc      Verify add/multiply for operands -5 and -123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0046 begin');
      const actualAdd: number = add(-5, -123);
      expect(Math.abs(actualAdd - (-128.0)) <= Math.abs(-128.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -123);
      expect(Math.abs(actualMul - (615.0)) <= Math.abs(615.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4700
     * @tc.name      testMathPair0047
     * @tc.desc      Verify add/multiply for operands -5 and 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0047 begin');
      const actualAdd: number = add(-5, 999);
      expect(Math.abs(actualAdd - (994.0)) <= Math.abs(994.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 999);
      expect(Math.abs(actualMul - (-4995.0)) <= Math.abs(-4995.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4800
     * @tc.name      testMathPair0048
     * @tc.desc      Verify add/multiply for operands -5 and -999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0048 begin');
      const actualAdd: number = add(-5, -999);
      expect(Math.abs(actualAdd - (-1004.0)) <= Math.abs(-1004.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -999);
      expect(Math.abs(actualMul - (4995.0)) <= Math.abs(4995.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_4900
     * @tc.name      testMathPair0049
     * @tc.desc      Verify add/multiply for operands -5 and 7.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0049 begin');
      const actualAdd: number = add(-5, 7.5);
      expect(Math.abs(actualAdd - (2.5)) <= Math.abs(2.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 7.5);
      expect(Math.abs(actualMul - (-37.5)) <= Math.abs(-37.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5000
     * @tc.name      testMathPair0050
     * @tc.desc      Verify add/multiply for operands -5 and -8.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0050 begin');
      const actualAdd: number = add(-5, -8.5);
      expect(Math.abs(actualAdd - (-13.5)) <= Math.abs(-13.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -8.5);
      expect(Math.abs(actualMul - (42.5)) <= Math.abs(42.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5100
     * @tc.name      testMathPair0051
     * @tc.desc      Verify add/multiply for operands -5 and 0.125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0051 begin');
      const actualAdd: number = add(-5, 0.125);
      expect(Math.abs(actualAdd - (-4.875)) <= Math.abs(-4.875) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 0.125);
      expect(Math.abs(actualMul - (-0.625)) <= Math.abs(-0.625) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5200
     * @tc.name      testMathPair0052
     * @tc.desc      Verify add/multiply for operands -5 and -0.625.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0052 begin');
      const actualAdd: number = add(-5, -0.625);
      expect(Math.abs(actualAdd - (-5.625)) <= Math.abs(-5.625) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -0.625);
      expect(Math.abs(actualMul - (3.125)) <= Math.abs(3.125) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5300
     * @tc.name      testMathPair0053
     * @tc.desc      Verify add/multiply for operands -5 and 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0053 begin');
      const actualAdd: number = add(-5, 6);
      expect(Math.abs(actualAdd - (1.0)) <= Math.abs(1.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 6);
      expect(Math.abs(actualMul - (-30.0)) <= Math.abs(-30.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5400
     * @tc.name      testMathPair0054
     * @tc.desc      Verify add/multiply for operands -5 and -6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0054 begin');
      const actualAdd: number = add(-5, -6);
      expect(Math.abs(actualAdd - (-11.0)) <= Math.abs(-11.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -6);
      expect(Math.abs(actualMul - (30.0)) <= Math.abs(30.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5500
     * @tc.name      testMathPair0055
     * @tc.desc      Verify add/multiply for operands -5 and 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0055 begin');
      const actualAdd: number = add(-5, 15);
      expect(Math.abs(actualAdd - (10.0)) <= Math.abs(10.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, 15);
      expect(Math.abs(actualMul - (-75.0)) <= Math.abs(-75.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5600
     * @tc.name      testMathPair0056
     * @tc.desc      Verify add/multiply for operands -5 and -15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0056 begin');
      const actualAdd: number = add(-5, -15);
      expect(Math.abs(actualAdd - (-20.0)) <= Math.abs(-20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-5, -15);
      expect(Math.abs(actualMul - (75.0)) <= Math.abs(75.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5700
     * @tc.name      testMathPair0057
     * @tc.desc      Verify add/multiply for operands 9 and 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0057 begin');
      const actualAdd: number = add(9, 5);
      expect(Math.abs(actualAdd - (14.0)) <= Math.abs(14.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 5);
      expect(Math.abs(actualMul - (45.0)) <= Math.abs(45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5800
     * @tc.name      testMathPair0058
     * @tc.desc      Verify add/multiply for operands 9 and -5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0058 begin');
      const actualAdd: number = add(9, -5);
      expect(Math.abs(actualAdd - (4.0)) <= Math.abs(4.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -5);
      expect(Math.abs(actualMul - (-45.0)) <= Math.abs(-45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_5900
     * @tc.name      testMathPair0059
     * @tc.desc      Verify add/multiply for operands 9 and 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0059 begin');
      const actualAdd: number = add(9, 9);
      expect(Math.abs(actualAdd - (18.0)) <= Math.abs(18.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 9);
      expect(Math.abs(actualMul - (81.0)) <= Math.abs(81.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6000
     * @tc.name      testMathPair0060
     * @tc.desc      Verify add/multiply for operands 9 and -9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0060 begin');
      const actualAdd: number = add(9, -9);
      expect(Math.abs(actualAdd - (0.0)) <= Math.abs(0.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -9);
      expect(Math.abs(actualMul - (-81.0)) <= Math.abs(-81.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6100
     * @tc.name      testMathPair0061
     * @tc.desc      Verify add/multiply for operands 9 and 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0061 begin');
      const actualAdd: number = add(9, 11);
      expect(Math.abs(actualAdd - (20.0)) <= Math.abs(20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 11);
      expect(Math.abs(actualMul - (99.0)) <= Math.abs(99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6200
     * @tc.name      testMathPair0062
     * @tc.desc      Verify add/multiply for operands 9 and -11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0062 begin');
      const actualAdd: number = add(9, -11);
      expect(Math.abs(actualAdd - (-2.0)) <= Math.abs(-2.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -11);
      expect(Math.abs(actualMul - (-99.0)) <= Math.abs(-99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6300
     * @tc.name      testMathPair0063
     * @tc.desc      Verify add/multiply for operands 9 and 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0063 begin');
      const actualAdd: number = add(9, 13);
      expect(Math.abs(actualAdd - (22.0)) <= Math.abs(22.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 13);
      expect(Math.abs(actualMul - (117.0)) <= Math.abs(117.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6400
     * @tc.name      testMathPair0064
     * @tc.desc      Verify add/multiply for operands 9 and -13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0064 begin');
      const actualAdd: number = add(9, -13);
      expect(Math.abs(actualAdd - (-4.0)) <= Math.abs(-4.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -13);
      expect(Math.abs(actualMul - (-117.0)) <= Math.abs(-117.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6500
     * @tc.name      testMathPair0065
     * @tc.desc      Verify add/multiply for operands 9 and 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0065 begin');
      const actualAdd: number = add(9, 25);
      expect(Math.abs(actualAdd - (34.0)) <= Math.abs(34.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 25);
      expect(Math.abs(actualMul - (225.0)) <= Math.abs(225.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6600
     * @tc.name      testMathPair0066
     * @tc.desc      Verify add/multiply for operands 9 and -25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0066 begin');
      const actualAdd: number = add(9, -25);
      expect(Math.abs(actualAdd - (-16.0)) <= Math.abs(-16.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -25);
      expect(Math.abs(actualMul - (-225.0)) <= Math.abs(-225.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6700
     * @tc.name      testMathPair0067
     * @tc.desc      Verify add/multiply for operands 9 and 0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0067 begin');
      const actualAdd: number = add(9, 0.25);
      expect(Math.abs(actualAdd - (9.25)) <= Math.abs(9.25) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 0.25);
      expect(Math.abs(actualMul - (2.25)) <= Math.abs(2.25) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6800
     * @tc.name      testMathPair0068
     * @tc.desc      Verify add/multiply for operands 9 and -0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0068 begin');
      const actualAdd: number = add(9, -0.35);
      expect(Math.abs(actualAdd - (8.65)) <= Math.abs(8.65) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -0.35);
      expect(Math.abs(actualMul - (-3.15)) <= Math.abs(-3.15) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_6900
     * @tc.name      testMathPair0069
     * @tc.desc      Verify add/multiply for operands 9 and 2.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0069 begin');
      const actualAdd: number = add(9, 2.5);
      expect(Math.abs(actualAdd - (11.5)) <= Math.abs(11.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 2.5);
      expect(Math.abs(actualMul - (22.5)) <= Math.abs(22.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_7000
     * @tc.name      testMathPair0070
     * @tc.desc      Verify add/multiply for operands 9 and -3.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0070 begin');
      const actualAdd: number = add(9, -3.5);
      expect(Math.abs(actualAdd - (5.5)) <= Math.abs(5.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -3.5);
      expect(Math.abs(actualMul - (-31.5)) <= Math.abs(-31.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_7100
     * @tc.name      testMathPair0071
     * @tc.desc      Verify add/multiply for operands 9 and 10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0071 begin');
      const actualAdd: number = add(9, 10000);
      expect(Math.abs(actualAdd - (10009.0)) <= Math.abs(10009.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 10000);
      expect(Math.abs(actualMul - (90000.0)) <= Math.abs(90000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_7200
     * @tc.name      testMathPair0072
     * @tc.desc      Verify add/multiply for operands 9 and -10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0072 begin');
      const actualAdd: number = add(9, -10000);
      expect(Math.abs(actualAdd - (-9991.0)) <= Math.abs(-9991.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -10000);
      expect(Math.abs(actualMul - (-90000.0)) <= Math.abs(-90000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_7300
     * @tc.name      testMathPair0073
     * @tc.desc      Verify add/multiply for operands 9 and 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0073 begin');
      const actualAdd: number = add(9, 123);
      expect(Math.abs(actualAdd - (132.0)) <= Math.abs(132.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 123);
      expect(Math.abs(actualMul - (1107.0)) <= Math.abs(1107.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_7400
     * @tc.name      testMathPair0074
     * @tc.desc      Verify add/multiply for operands 9 and -123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0074 begin');
      const actualAdd: number = add(9, -123);
      expect(Math.abs(actualAdd - (-114.0)) <= Math.abs(-114.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -123);
      expect(Math.abs(actualMul - (-1107.0)) <= Math.abs(-1107.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP1_7500
     * @tc.name      testMathPair0075
     * @tc.desc      Verify add/multiply for operands 9 and 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0075 begin');
      const actualAdd: number = add(9, 999);
      expect(Math.abs(actualAdd - (1008.0)) <= Math.abs(1008.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 999);
      expect(Math.abs(actualMul - (8991.0)) <= Math.abs(8991.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0075 end');
    })

  })
}
