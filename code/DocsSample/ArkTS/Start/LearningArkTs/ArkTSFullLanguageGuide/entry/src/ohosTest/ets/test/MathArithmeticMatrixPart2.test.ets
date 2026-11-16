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

export default function MathArithmeticMatrixPart2Test(): void {
  describe('MathArithmeticMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_7600
     * @tc.name      testMathPair0076
     * @tc.desc      Verify add/multiply for operands 9 and -999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0076 begin');
      const actualAdd: number = add(9, -999);
      expect(Math.abs(actualAdd - (-990.0)) <= Math.abs(-990.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -999);
      expect(Math.abs(actualMul - (-8991.0)) <= Math.abs(-8991.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_7700
     * @tc.name      testMathPair0077
     * @tc.desc      Verify add/multiply for operands 9 and 7.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0077 begin');
      const actualAdd: number = add(9, 7.5);
      expect(Math.abs(actualAdd - (16.5)) <= Math.abs(16.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 7.5);
      expect(Math.abs(actualMul - (67.5)) <= Math.abs(67.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_7800
     * @tc.name      testMathPair0078
     * @tc.desc      Verify add/multiply for operands 9 and -8.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0078 begin');
      const actualAdd: number = add(9, -8.5);
      expect(Math.abs(actualAdd - (0.5)) <= Math.abs(0.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -8.5);
      expect(Math.abs(actualMul - (-76.5)) <= Math.abs(-76.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_7900
     * @tc.name      testMathPair0079
     * @tc.desc      Verify add/multiply for operands 9 and 0.125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0079 begin');
      const actualAdd: number = add(9, 0.125);
      expect(Math.abs(actualAdd - (9.125)) <= Math.abs(9.125) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 0.125);
      expect(Math.abs(actualMul - (1.125)) <= Math.abs(1.125) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8000
     * @tc.name      testMathPair0080
     * @tc.desc      Verify add/multiply for operands 9 and -0.625.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0080 begin');
      const actualAdd: number = add(9, -0.625);
      expect(Math.abs(actualAdd - (8.375)) <= Math.abs(8.375) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -0.625);
      expect(Math.abs(actualMul - (-5.625)) <= Math.abs(-5.625) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8100
     * @tc.name      testMathPair0081
     * @tc.desc      Verify add/multiply for operands 9 and 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0081 begin');
      const actualAdd: number = add(9, 6);
      expect(Math.abs(actualAdd - (15.0)) <= Math.abs(15.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 6);
      expect(Math.abs(actualMul - (54.0)) <= Math.abs(54.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8200
     * @tc.name      testMathPair0082
     * @tc.desc      Verify add/multiply for operands 9 and -6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0082 begin');
      const actualAdd: number = add(9, -6);
      expect(Math.abs(actualAdd - (3.0)) <= Math.abs(3.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -6);
      expect(Math.abs(actualMul - (-54.0)) <= Math.abs(-54.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8300
     * @tc.name      testMathPair0083
     * @tc.desc      Verify add/multiply for operands 9 and 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0083 begin');
      const actualAdd: number = add(9, 15);
      expect(Math.abs(actualAdd - (24.0)) <= Math.abs(24.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, 15);
      expect(Math.abs(actualMul - (135.0)) <= Math.abs(135.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8400
     * @tc.name      testMathPair0084
     * @tc.desc      Verify add/multiply for operands 9 and -15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0084 begin');
      const actualAdd: number = add(9, -15);
      expect(Math.abs(actualAdd - (-6.0)) <= Math.abs(-6.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(9, -15);
      expect(Math.abs(actualMul - (-135.0)) <= Math.abs(-135.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8500
     * @tc.name      testMathPair0085
     * @tc.desc      Verify add/multiply for operands -9 and 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0085 begin');
      const actualAdd: number = add(-9, 5);
      expect(Math.abs(actualAdd - (-4.0)) <= Math.abs(-4.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 5);
      expect(Math.abs(actualMul - (-45.0)) <= Math.abs(-45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8600
     * @tc.name      testMathPair0086
     * @tc.desc      Verify add/multiply for operands -9 and -5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0086 begin');
      const actualAdd: number = add(-9, -5);
      expect(Math.abs(actualAdd - (-14.0)) <= Math.abs(-14.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -5);
      expect(Math.abs(actualMul - (45.0)) <= Math.abs(45.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8700
     * @tc.name      testMathPair0087
     * @tc.desc      Verify add/multiply for operands -9 and 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0087 begin');
      const actualAdd: number = add(-9, 9);
      expect(Math.abs(actualAdd - (0.0)) <= Math.abs(0.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 9);
      expect(Math.abs(actualMul - (-81.0)) <= Math.abs(-81.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8800
     * @tc.name      testMathPair0088
     * @tc.desc      Verify add/multiply for operands -9 and -9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0088 begin');
      const actualAdd: number = add(-9, -9);
      expect(Math.abs(actualAdd - (-18.0)) <= Math.abs(-18.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -9);
      expect(Math.abs(actualMul - (81.0)) <= Math.abs(81.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_8900
     * @tc.name      testMathPair0089
     * @tc.desc      Verify add/multiply for operands -9 and 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0089 begin');
      const actualAdd: number = add(-9, 11);
      expect(Math.abs(actualAdd - (2.0)) <= Math.abs(2.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 11);
      expect(Math.abs(actualMul - (-99.0)) <= Math.abs(-99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9000
     * @tc.name      testMathPair0090
     * @tc.desc      Verify add/multiply for operands -9 and -11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0090 begin');
      const actualAdd: number = add(-9, -11);
      expect(Math.abs(actualAdd - (-20.0)) <= Math.abs(-20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -11);
      expect(Math.abs(actualMul - (99.0)) <= Math.abs(99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9100
     * @tc.name      testMathPair0091
     * @tc.desc      Verify add/multiply for operands -9 and 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0091 begin');
      const actualAdd: number = add(-9, 13);
      expect(Math.abs(actualAdd - (4.0)) <= Math.abs(4.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 13);
      expect(Math.abs(actualMul - (-117.0)) <= Math.abs(-117.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9200
     * @tc.name      testMathPair0092
     * @tc.desc      Verify add/multiply for operands -9 and -13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0092 begin');
      const actualAdd: number = add(-9, -13);
      expect(Math.abs(actualAdd - (-22.0)) <= Math.abs(-22.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -13);
      expect(Math.abs(actualMul - (117.0)) <= Math.abs(117.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9300
     * @tc.name      testMathPair0093
     * @tc.desc      Verify add/multiply for operands -9 and 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0093 begin');
      const actualAdd: number = add(-9, 25);
      expect(Math.abs(actualAdd - (16.0)) <= Math.abs(16.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 25);
      expect(Math.abs(actualMul - (-225.0)) <= Math.abs(-225.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9400
     * @tc.name      testMathPair0094
     * @tc.desc      Verify add/multiply for operands -9 and -25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0094 begin');
      const actualAdd: number = add(-9, -25);
      expect(Math.abs(actualAdd - (-34.0)) <= Math.abs(-34.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -25);
      expect(Math.abs(actualMul - (225.0)) <= Math.abs(225.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9500
     * @tc.name      testMathPair0095
     * @tc.desc      Verify add/multiply for operands -9 and 0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0095 begin');
      const actualAdd: number = add(-9, 0.25);
      expect(Math.abs(actualAdd - (-8.75)) <= Math.abs(-8.75) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 0.25);
      expect(Math.abs(actualMul - (-2.25)) <= Math.abs(-2.25) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9600
     * @tc.name      testMathPair0096
     * @tc.desc      Verify add/multiply for operands -9 and -0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0096 begin');
      const actualAdd: number = add(-9, -0.35);
      expect(Math.abs(actualAdd - (-9.35)) <= Math.abs(-9.35) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -0.35);
      expect(Math.abs(actualMul - (3.15)) <= Math.abs(3.15) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9700
     * @tc.name      testMathPair0097
     * @tc.desc      Verify add/multiply for operands -9 and 2.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0097 begin');
      const actualAdd: number = add(-9, 2.5);
      expect(Math.abs(actualAdd - (-6.5)) <= Math.abs(-6.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 2.5);
      expect(Math.abs(actualMul - (-22.5)) <= Math.abs(-22.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9800
     * @tc.name      testMathPair0098
     * @tc.desc      Verify add/multiply for operands -9 and -3.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0098 begin');
      const actualAdd: number = add(-9, -3.5);
      expect(Math.abs(actualAdd - (-12.5)) <= Math.abs(-12.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -3.5);
      expect(Math.abs(actualMul - (31.5)) <= Math.abs(31.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_9900
     * @tc.name      testMathPair0099
     * @tc.desc      Verify add/multiply for operands -9 and 10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0099 begin');
      const actualAdd: number = add(-9, 10000);
      expect(Math.abs(actualAdd - (9991.0)) <= Math.abs(9991.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 10000);
      expect(Math.abs(actualMul - (-90000.0)) <= Math.abs(-90000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10000
     * @tc.name      testMathPair0100
     * @tc.desc      Verify add/multiply for operands -9 and -10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0100 begin');
      const actualAdd: number = add(-9, -10000);
      expect(Math.abs(actualAdd - (-10009.0)) <= Math.abs(-10009.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -10000);
      expect(Math.abs(actualMul - (90000.0)) <= Math.abs(90000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0100 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10100
     * @tc.name      testMathPair0101
     * @tc.desc      Verify add/multiply for operands -9 and 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0101 begin');
      const actualAdd: number = add(-9, 123);
      expect(Math.abs(actualAdd - (114.0)) <= Math.abs(114.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 123);
      expect(Math.abs(actualMul - (-1107.0)) <= Math.abs(-1107.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0101 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10200
     * @tc.name      testMathPair0102
     * @tc.desc      Verify add/multiply for operands -9 and -123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0102 begin');
      const actualAdd: number = add(-9, -123);
      expect(Math.abs(actualAdd - (-132.0)) <= Math.abs(-132.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -123);
      expect(Math.abs(actualMul - (1107.0)) <= Math.abs(1107.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0102 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10300
     * @tc.name      testMathPair0103
     * @tc.desc      Verify add/multiply for operands -9 and 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0103 begin');
      const actualAdd: number = add(-9, 999);
      expect(Math.abs(actualAdd - (990.0)) <= Math.abs(990.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 999);
      expect(Math.abs(actualMul - (-8991.0)) <= Math.abs(-8991.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0103 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10400
     * @tc.name      testMathPair0104
     * @tc.desc      Verify add/multiply for operands -9 and -999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0104 begin');
      const actualAdd: number = add(-9, -999);
      expect(Math.abs(actualAdd - (-1008.0)) <= Math.abs(-1008.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -999);
      expect(Math.abs(actualMul - (8991.0)) <= Math.abs(8991.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0104 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10500
     * @tc.name      testMathPair0105
     * @tc.desc      Verify add/multiply for operands -9 and 7.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0105 begin');
      const actualAdd: number = add(-9, 7.5);
      expect(Math.abs(actualAdd - (-1.5)) <= Math.abs(-1.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 7.5);
      expect(Math.abs(actualMul - (-67.5)) <= Math.abs(-67.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0105 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10600
     * @tc.name      testMathPair0106
     * @tc.desc      Verify add/multiply for operands -9 and -8.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0106 begin');
      const actualAdd: number = add(-9, -8.5);
      expect(Math.abs(actualAdd - (-17.5)) <= Math.abs(-17.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -8.5);
      expect(Math.abs(actualMul - (76.5)) <= Math.abs(76.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0106 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10700
     * @tc.name      testMathPair0107
     * @tc.desc      Verify add/multiply for operands -9 and 0.125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0107 begin');
      const actualAdd: number = add(-9, 0.125);
      expect(Math.abs(actualAdd - (-8.875)) <= Math.abs(-8.875) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 0.125);
      expect(Math.abs(actualMul - (-1.125)) <= Math.abs(-1.125) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0107 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10800
     * @tc.name      testMathPair0108
     * @tc.desc      Verify add/multiply for operands -9 and -0.625.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0108 begin');
      const actualAdd: number = add(-9, -0.625);
      expect(Math.abs(actualAdd - (-9.625)) <= Math.abs(-9.625) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -0.625);
      expect(Math.abs(actualMul - (5.625)) <= Math.abs(5.625) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0108 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_10900
     * @tc.name      testMathPair0109
     * @tc.desc      Verify add/multiply for operands -9 and 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0109 begin');
      const actualAdd: number = add(-9, 6);
      expect(Math.abs(actualAdd - (-3.0)) <= Math.abs(-3.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 6);
      expect(Math.abs(actualMul - (-54.0)) <= Math.abs(-54.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0109 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11000
     * @tc.name      testMathPair0110
     * @tc.desc      Verify add/multiply for operands -9 and -6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0110 begin');
      const actualAdd: number = add(-9, -6);
      expect(Math.abs(actualAdd - (-15.0)) <= Math.abs(-15.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -6);
      expect(Math.abs(actualMul - (54.0)) <= Math.abs(54.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0110 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11100
     * @tc.name      testMathPair0111
     * @tc.desc      Verify add/multiply for operands -9 and 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0111 begin');
      const actualAdd: number = add(-9, 15);
      expect(Math.abs(actualAdd - (6.0)) <= Math.abs(6.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, 15);
      expect(Math.abs(actualMul - (-135.0)) <= Math.abs(-135.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0111 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11200
     * @tc.name      testMathPair0112
     * @tc.desc      Verify add/multiply for operands -9 and -15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0112 begin');
      const actualAdd: number = add(-9, -15);
      expect(Math.abs(actualAdd - (-24.0)) <= Math.abs(-24.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-9, -15);
      expect(Math.abs(actualMul - (135.0)) <= Math.abs(135.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0112 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11300
     * @tc.name      testMathPair0113
     * @tc.desc      Verify add/multiply for operands 11 and 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0113 begin');
      const actualAdd: number = add(11, 5);
      expect(Math.abs(actualAdd - (16.0)) <= Math.abs(16.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 5);
      expect(Math.abs(actualMul - (55.0)) <= Math.abs(55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0113 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11400
     * @tc.name      testMathPair0114
     * @tc.desc      Verify add/multiply for operands 11 and -5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0114 begin');
      const actualAdd: number = add(11, -5);
      expect(Math.abs(actualAdd - (6.0)) <= Math.abs(6.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -5);
      expect(Math.abs(actualMul - (-55.0)) <= Math.abs(-55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0114 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11500
     * @tc.name      testMathPair0115
     * @tc.desc      Verify add/multiply for operands 11 and 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0115 begin');
      const actualAdd: number = add(11, 9);
      expect(Math.abs(actualAdd - (20.0)) <= Math.abs(20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 9);
      expect(Math.abs(actualMul - (99.0)) <= Math.abs(99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0115 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11600
     * @tc.name      testMathPair0116
     * @tc.desc      Verify add/multiply for operands 11 and -9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0116 begin');
      const actualAdd: number = add(11, -9);
      expect(Math.abs(actualAdd - (2.0)) <= Math.abs(2.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -9);
      expect(Math.abs(actualMul - (-99.0)) <= Math.abs(-99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0116 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11700
     * @tc.name      testMathPair0117
     * @tc.desc      Verify add/multiply for operands 11 and 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0117 begin');
      const actualAdd: number = add(11, 11);
      expect(Math.abs(actualAdd - (22.0)) <= Math.abs(22.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 11);
      expect(Math.abs(actualMul - (121.0)) <= Math.abs(121.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0117 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11800
     * @tc.name      testMathPair0118
     * @tc.desc      Verify add/multiply for operands 11 and -11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0118 begin');
      const actualAdd: number = add(11, -11);
      expect(Math.abs(actualAdd - (0.0)) <= Math.abs(0.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -11);
      expect(Math.abs(actualMul - (-121.0)) <= Math.abs(-121.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0118 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_11900
     * @tc.name      testMathPair0119
     * @tc.desc      Verify add/multiply for operands 11 and 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0119 begin');
      const actualAdd: number = add(11, 13);
      expect(Math.abs(actualAdd - (24.0)) <= Math.abs(24.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 13);
      expect(Math.abs(actualMul - (143.0)) <= Math.abs(143.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0119 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12000
     * @tc.name      testMathPair0120
     * @tc.desc      Verify add/multiply for operands 11 and -13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0120 begin');
      const actualAdd: number = add(11, -13);
      expect(Math.abs(actualAdd - (-2.0)) <= Math.abs(-2.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -13);
      expect(Math.abs(actualMul - (-143.0)) <= Math.abs(-143.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0120 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12100
     * @tc.name      testMathPair0121
     * @tc.desc      Verify add/multiply for operands 11 and 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0121 begin');
      const actualAdd: number = add(11, 25);
      expect(Math.abs(actualAdd - (36.0)) <= Math.abs(36.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 25);
      expect(Math.abs(actualMul - (275.0)) <= Math.abs(275.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0121 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12200
     * @tc.name      testMathPair0122
     * @tc.desc      Verify add/multiply for operands 11 and -25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0122 begin');
      const actualAdd: number = add(11, -25);
      expect(Math.abs(actualAdd - (-14.0)) <= Math.abs(-14.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -25);
      expect(Math.abs(actualMul - (-275.0)) <= Math.abs(-275.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0122 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12300
     * @tc.name      testMathPair0123
     * @tc.desc      Verify add/multiply for operands 11 and 0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0123 begin');
      const actualAdd: number = add(11, 0.25);
      expect(Math.abs(actualAdd - (11.25)) <= Math.abs(11.25) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 0.25);
      expect(Math.abs(actualMul - (2.75)) <= Math.abs(2.75) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0123 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12400
     * @tc.name      testMathPair0124
     * @tc.desc      Verify add/multiply for operands 11 and -0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0124 begin');
      const actualAdd: number = add(11, -0.35);
      expect(Math.abs(actualAdd - (10.65)) <= Math.abs(10.65) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -0.35);
      expect(Math.abs(actualMul - (-3.8499999999999996)) <= Math.abs(-3.8499999999999996) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0124 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12500
     * @tc.name      testMathPair0125
     * @tc.desc      Verify add/multiply for operands 11 and 2.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0125 begin');
      const actualAdd: number = add(11, 2.5);
      expect(Math.abs(actualAdd - (13.5)) <= Math.abs(13.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 2.5);
      expect(Math.abs(actualMul - (27.5)) <= Math.abs(27.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0125 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12600
     * @tc.name      testMathPair0126
     * @tc.desc      Verify add/multiply for operands 11 and -3.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0126 begin');
      const actualAdd: number = add(11, -3.5);
      expect(Math.abs(actualAdd - (7.5)) <= Math.abs(7.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -3.5);
      expect(Math.abs(actualMul - (-38.5)) <= Math.abs(-38.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0126 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12700
     * @tc.name      testMathPair0127
     * @tc.desc      Verify add/multiply for operands 11 and 10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0127 begin');
      const actualAdd: number = add(11, 10000);
      expect(Math.abs(actualAdd - (10011.0)) <= Math.abs(10011.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 10000);
      expect(Math.abs(actualMul - (110000.0)) <= Math.abs(110000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0127 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12800
     * @tc.name      testMathPair0128
     * @tc.desc      Verify add/multiply for operands 11 and -10000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0128 begin');
      const actualAdd: number = add(11, -10000);
      expect(Math.abs(actualAdd - (-9989.0)) <= Math.abs(-9989.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -10000);
      expect(Math.abs(actualMul - (-110000.0)) <= Math.abs(-110000.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0128 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_12900
     * @tc.name      testMathPair0129
     * @tc.desc      Verify add/multiply for operands 11 and 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0129 begin');
      const actualAdd: number = add(11, 123);
      expect(Math.abs(actualAdd - (134.0)) <= Math.abs(134.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 123);
      expect(Math.abs(actualMul - (1353.0)) <= Math.abs(1353.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0129 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13000
     * @tc.name      testMathPair0130
     * @tc.desc      Verify add/multiply for operands 11 and -123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0130 begin');
      const actualAdd: number = add(11, -123);
      expect(Math.abs(actualAdd - (-112.0)) <= Math.abs(-112.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -123);
      expect(Math.abs(actualMul - (-1353.0)) <= Math.abs(-1353.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0130 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13100
     * @tc.name      testMathPair0131
     * @tc.desc      Verify add/multiply for operands 11 and 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0131 begin');
      const actualAdd: number = add(11, 999);
      expect(Math.abs(actualAdd - (1010.0)) <= Math.abs(1010.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 999);
      expect(Math.abs(actualMul - (10989.0)) <= Math.abs(10989.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0131 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13200
     * @tc.name      testMathPair0132
     * @tc.desc      Verify add/multiply for operands 11 and -999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0132 begin');
      const actualAdd: number = add(11, -999);
      expect(Math.abs(actualAdd - (-988.0)) <= Math.abs(-988.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -999);
      expect(Math.abs(actualMul - (-10989.0)) <= Math.abs(-10989.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0132 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13300
     * @tc.name      testMathPair0133
     * @tc.desc      Verify add/multiply for operands 11 and 7.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0133 begin');
      const actualAdd: number = add(11, 7.5);
      expect(Math.abs(actualAdd - (18.5)) <= Math.abs(18.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 7.5);
      expect(Math.abs(actualMul - (82.5)) <= Math.abs(82.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0133 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13400
     * @tc.name      testMathPair0134
     * @tc.desc      Verify add/multiply for operands 11 and -8.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0134 begin');
      const actualAdd: number = add(11, -8.5);
      expect(Math.abs(actualAdd - (2.5)) <= Math.abs(2.5) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -8.5);
      expect(Math.abs(actualMul - (-93.5)) <= Math.abs(-93.5) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0134 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13500
     * @tc.name      testMathPair0135
     * @tc.desc      Verify add/multiply for operands 11 and 0.125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0135 begin');
      const actualAdd: number = add(11, 0.125);
      expect(Math.abs(actualAdd - (11.125)) <= Math.abs(11.125) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 0.125);
      expect(Math.abs(actualMul - (1.375)) <= Math.abs(1.375) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0135 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13600
     * @tc.name      testMathPair0136
     * @tc.desc      Verify add/multiply for operands 11 and -0.625.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0136 begin');
      const actualAdd: number = add(11, -0.625);
      expect(Math.abs(actualAdd - (10.375)) <= Math.abs(10.375) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -0.625);
      expect(Math.abs(actualMul - (-6.875)) <= Math.abs(-6.875) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0136 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13700
     * @tc.name      testMathPair0137
     * @tc.desc      Verify add/multiply for operands 11 and 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0137 begin');
      const actualAdd: number = add(11, 6);
      expect(Math.abs(actualAdd - (17.0)) <= Math.abs(17.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 6);
      expect(Math.abs(actualMul - (66.0)) <= Math.abs(66.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0137 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13800
     * @tc.name      testMathPair0138
     * @tc.desc      Verify add/multiply for operands 11 and -6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0138 begin');
      const actualAdd: number = add(11, -6);
      expect(Math.abs(actualAdd - (5.0)) <= Math.abs(5.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -6);
      expect(Math.abs(actualMul - (-66.0)) <= Math.abs(-66.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0138 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_13900
     * @tc.name      testMathPair0139
     * @tc.desc      Verify add/multiply for operands 11 and 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0139 begin');
      const actualAdd: number = add(11, 15);
      expect(Math.abs(actualAdd - (26.0)) <= Math.abs(26.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, 15);
      expect(Math.abs(actualMul - (165.0)) <= Math.abs(165.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0139 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14000
     * @tc.name      testMathPair0140
     * @tc.desc      Verify add/multiply for operands 11 and -15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0140 begin');
      const actualAdd: number = add(11, -15);
      expect(Math.abs(actualAdd - (-4.0)) <= Math.abs(-4.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(11, -15);
      expect(Math.abs(actualMul - (-165.0)) <= Math.abs(-165.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0140 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14100
     * @tc.name      testMathPair0141
     * @tc.desc      Verify add/multiply for operands -11 and 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0141 begin');
      const actualAdd: number = add(-11, 5);
      expect(Math.abs(actualAdd - (-6.0)) <= Math.abs(-6.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, 5);
      expect(Math.abs(actualMul - (-55.0)) <= Math.abs(-55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0141 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14200
     * @tc.name      testMathPair0142
     * @tc.desc      Verify add/multiply for operands -11 and -5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0142 begin');
      const actualAdd: number = add(-11, -5);
      expect(Math.abs(actualAdd - (-16.0)) <= Math.abs(-16.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, -5);
      expect(Math.abs(actualMul - (55.0)) <= Math.abs(55.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0142 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14300
     * @tc.name      testMathPair0143
     * @tc.desc      Verify add/multiply for operands -11 and 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0143 begin');
      const actualAdd: number = add(-11, 9);
      expect(Math.abs(actualAdd - (-2.0)) <= Math.abs(-2.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, 9);
      expect(Math.abs(actualMul - (-99.0)) <= Math.abs(-99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0143 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14400
     * @tc.name      testMathPair0144
     * @tc.desc      Verify add/multiply for operands -11 and -9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0144 begin');
      const actualAdd: number = add(-11, -9);
      expect(Math.abs(actualAdd - (-20.0)) <= Math.abs(-20.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, -9);
      expect(Math.abs(actualMul - (99.0)) <= Math.abs(99.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0144 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14500
     * @tc.name      testMathPair0145
     * @tc.desc      Verify add/multiply for operands -11 and 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0145 begin');
      const actualAdd: number = add(-11, 11);
      expect(Math.abs(actualAdd - (0.0)) <= Math.abs(0.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, 11);
      expect(Math.abs(actualMul - (-121.0)) <= Math.abs(-121.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0145 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14600
     * @tc.name      testMathPair0146
     * @tc.desc      Verify add/multiply for operands -11 and -11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0146 begin');
      const actualAdd: number = add(-11, -11);
      expect(Math.abs(actualAdd - (-22.0)) <= Math.abs(-22.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, -11);
      expect(Math.abs(actualMul - (121.0)) <= Math.abs(121.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0146 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14700
     * @tc.name      testMathPair0147
     * @tc.desc      Verify add/multiply for operands -11 and 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0147 begin');
      const actualAdd: number = add(-11, 13);
      expect(Math.abs(actualAdd - (2.0)) <= Math.abs(2.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, 13);
      expect(Math.abs(actualMul - (-143.0)) <= Math.abs(-143.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0147 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14800
     * @tc.name      testMathPair0148
     * @tc.desc      Verify add/multiply for operands -11 and -13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0148 begin');
      const actualAdd: number = add(-11, -13);
      expect(Math.abs(actualAdd - (-24.0)) <= Math.abs(-24.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, -13);
      expect(Math.abs(actualMul - (143.0)) <= Math.abs(143.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0148 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_14900
     * @tc.name      testMathPair0149
     * @tc.desc      Verify add/multiply for operands -11 and 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0149 begin');
      const actualAdd: number = add(-11, 25);
      expect(Math.abs(actualAdd - (14.0)) <= Math.abs(14.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, 25);
      expect(Math.abs(actualMul - (-275.0)) <= Math.abs(-275.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0149 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MATHARP2_15000
     * @tc.name      testMathPair0150
     * @tc.desc      Verify add/multiply for operands -11 and -25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMathPair0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0150 begin');
      const actualAdd: number = add(-11, -25);
      expect(Math.abs(actualAdd - (-36.0)) <= Math.abs(-36.0) * 1e-12 + 1e-9).assertTrue();
      const actualMul: number = multiply(-11, -25);
      expect(Math.abs(actualMul - (275.0)) <= Math.abs(275.0) * 1e-12 + 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMathPair0150 end');
    })

  })
}
