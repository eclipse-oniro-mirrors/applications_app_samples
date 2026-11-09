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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NumberPuzzleUtil } from './support/NumberPuzzleUtil';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_PUZZLE]';

interface DivisorCase {
  input: number;
  expected: number;
}

const DIVISOR_CASES: DivisorCase[] = [
  { input: 1, expected: 0 },
  { input: 2, expected: 1 },
  { input: 3, expected: 1 },
  { input: 4, expected: 3 },
  { input: 5, expected: 1 },
  { input: 6, expected: 6 },
  { input: 7, expected: 1 },
  { input: 8, expected: 7 },
  { input: 9, expected: 4 },
  { input: 10, expected: 8 },
  { input: 11, expected: 1 },
  { input: 12, expected: 16 },
  { input: 13, expected: 1 },
  { input: 14, expected: 10 },
  { input: 15, expected: 9 },
  { input: 16, expected: 15 },
  { input: 17, expected: 1 },
  { input: 18, expected: 21 },
  { input: 19, expected: 1 },
  { input: 20, expected: 22 },
  { input: 21, expected: 11 },
  { input: 22, expected: 14 },
  { input: 23, expected: 1 },
  { input: 24, expected: 36 },
  { input: 25, expected: 6 },
  { input: 26, expected: 16 },
  { input: 27, expected: 13 },
  { input: 28, expected: 28 },
  { input: 29, expected: 1 },
  { input: 30, expected: 42 },
  { input: 36, expected: 55 },
  { input: 48, expected: 76 },
  { input: 60, expected: 108 },
  { input: 100, expected: 117 },
  { input: 220, expected: 284 },
  { input: 284, expected: 220 },
  { input: 496, expected: 496 },
  { input: 8128, expected: 8128 },
];

interface ClassifyCase {
  input: number;
  expected: string;
}

const CLASSIFY_CASES: ClassifyCase[] = [
  { input: 1, expected: 'deficient' },
  { input: 2, expected: 'deficient' },
  { input: 3, expected: 'deficient' },
  { input: 4, expected: 'deficient' },
  { input: 5, expected: 'deficient' },
  { input: 6, expected: 'perfect' },
  { input: 7, expected: 'deficient' },
  { input: 8, expected: 'deficient' },
  { input: 9, expected: 'deficient' },
  { input: 10, expected: 'deficient' },
  { input: 11, expected: 'deficient' },
  { input: 12, expected: 'abundant' },
  { input: 13, expected: 'deficient' },
  { input: 14, expected: 'deficient' },
  { input: 15, expected: 'deficient' },
  { input: 16, expected: 'deficient' },
  { input: 17, expected: 'deficient' },
  { input: 18, expected: 'abundant' },
  { input: 19, expected: 'deficient' },
  { input: 20, expected: 'abundant' },
  { input: 21, expected: 'deficient' },
  { input: 22, expected: 'deficient' },
  { input: 23, expected: 'deficient' },
  { input: 24, expected: 'abundant' },
  { input: 25, expected: 'deficient' },
  { input: 26, expected: 'deficient' },
  { input: 27, expected: 'deficient' },
  { input: 28, expected: 'perfect' },
  { input: 29, expected: 'deficient' },
  { input: 30, expected: 'abundant' },
  { input: 36, expected: 'abundant' },
  { input: 48, expected: 'abundant' },
  { input: 60, expected: 'abundant' },
  { input: 100, expected: 'abundant' },
  { input: 496, expected: 'perfect' },
  { input: 8128, expected: 'perfect' },
];

interface CollatzCase {
  input: number;
  expected: number;
}

const COLLATZ_CASES: CollatzCase[] = [
  { input: 1, expected: 0 },
  { input: 2, expected: 1 },
  { input: 3, expected: 7 },
  { input: 4, expected: 2 },
  { input: 5, expected: 5 },
  { input: 6, expected: 8 },
  { input: 7, expected: 16 },
  { input: 8, expected: 3 },
  { input: 9, expected: 19 },
  { input: 10, expected: 6 },
  { input: 11, expected: 14 },
  { input: 12, expected: 9 },
  { input: 13, expected: 9 },
  { input: 14, expected: 17 },
  { input: 15, expected: 17 },
  { input: 16, expected: 4 },
  { input: 17, expected: 12 },
  { input: 18, expected: 20 },
  { input: 19, expected: 20 },
  { input: 20, expected: 7 },
  { input: 27, expected: 111 },
  { input: 97, expected: 118 },
  { input: 100, expected: 25 },
  { input: 1000, expected: 111 },
];

interface HappyCase {
  input: number;
  expected: boolean;
}

const HAPPY_CASES: HappyCase[] = [
  { input: 1, expected: true },
  { input: 2, expected: false },
  { input: 3, expected: false },
  { input: 4, expected: false },
  { input: 5, expected: false },
  { input: 6, expected: false },
  { input: 7, expected: true },
  { input: 8, expected: false },
  { input: 9, expected: false },
  { input: 10, expected: true },
  { input: 11, expected: false },
  { input: 12, expected: false },
  { input: 13, expected: true },
  { input: 14, expected: false },
  { input: 15, expected: false },
  { input: 16, expected: false },
  { input: 17, expected: false },
  { input: 18, expected: false },
  { input: 19, expected: true },
  { input: 20, expected: false },
  { input: 21, expected: false },
  { input: 22, expected: false },
  { input: 23, expected: true },
  { input: 24, expected: false },
  { input: 25, expected: false },
  { input: 26, expected: false },
  { input: 27, expected: false },
  { input: 28, expected: true },
  { input: 29, expected: false },
  { input: 30, expected: false },
  { input: 31, expected: true },
  { input: 32, expected: true },
  { input: 33, expected: false },
  { input: 34, expected: false },
  { input: 35, expected: false },
  { input: 36, expected: false },
  { input: 37, expected: false },
  { input: 38, expected: false },
  { input: 39, expected: false },
  { input: 40, expected: false },
  { input: 41, expected: false },
  { input: 42, expected: false },
  { input: 43, expected: false },
  { input: 44, expected: true },
  { input: 45, expected: false },
  { input: 46, expected: false },
  { input: 47, expected: false },
  { input: 48, expected: false },
  { input: 49, expected: true },
  { input: 50, expected: false },
];

interface TriangularCase {
  input: number;
  expected: number;
}

const TRIANGULAR_CASES: TriangularCase[] = [
  { input: 0, expected: 0 },
  { input: 1, expected: 1 },
  { input: 2, expected: 3 },
  { input: 3, expected: 6 },
  { input: 4, expected: 10 },
  { input: 5, expected: 15 },
  { input: 6, expected: 21 },
  { input: 7, expected: 28 },
  { input: 8, expected: 36 },
  { input: 9, expected: 45 },
  { input: 10, expected: 55 },
  { input: 11, expected: 66 },
  { input: 12, expected: 78 },
  { input: 13, expected: 91 },
  { input: 14, expected: 105 },
  { input: 15, expected: 120 },
  { input: 16, expected: 136 },
  { input: 17, expected: 153 },
  { input: 18, expected: 171 },
  { input: 19, expected: 190 },
  { input: 20, expected: 210 },
  { input: 50, expected: 1275 },
  { input: 100, expected: 5050 },
];

interface TriangularCheckCase {
  input: number;
  expected: boolean;
}

const TRIANGULAR_CHECK_CASES: TriangularCheckCase[] = [
  { input: 0, expected: true },
  { input: 1, expected: true },
  { input: 2, expected: false },
  { input: 3, expected: true },
  { input: 4, expected: false },
  { input: 5, expected: false },
  { input: 6, expected: true },
  { input: 7, expected: false },
  { input: 8, expected: false },
  { input: 9, expected: false },
  { input: 10, expected: true },
  { input: 11, expected: false },
  { input: 12, expected: false },
  { input: 13, expected: false },
  { input: 14, expected: false },
  { input: 15, expected: true },
  { input: 16, expected: false },
  { input: 17, expected: false },
  { input: 18, expected: false },
  { input: 19, expected: false },
  { input: 20, expected: false },
  { input: 21, expected: true },
  { input: 22, expected: false },
  { input: 23, expected: false },
  { input: 24, expected: false },
  { input: 25, expected: false },
  { input: 26, expected: false },
  { input: 27, expected: false },
  { input: 28, expected: true },
  { input: 29, expected: false },
  { input: 30, expected: false },
  { input: 31, expected: false },
  { input: 32, expected: false },
  { input: 33, expected: false },
  { input: 34, expected: false },
  { input: 35, expected: false },
  { input: 36, expected: true },
  { input: 37, expected: false },
  { input: 38, expected: false },
  { input: 39, expected: false },
  { input: 40, expected: false },
  { input: 45, expected: true },
  { input: 55, expected: true },
  { input: 66, expected: true },
  { input: 78, expected: true },
  { input: 91, expected: true },
];

interface DigitalRootCase {
  input: number;
  expected: number;
}

const DIGITAL_ROOT_CASES: DigitalRootCase[] = [
  { input: 0, expected: 0 },
  { input: 1, expected: 1 },
  { input: 2, expected: 2 },
  { input: 3, expected: 3 },
  { input: 4, expected: 4 },
  { input: 5, expected: 5 },
  { input: 6, expected: 6 },
  { input: 7, expected: 7 },
  { input: 8, expected: 8 },
  { input: 9, expected: 9 },
  { input: 10, expected: 1 },
  { input: 11, expected: 2 },
  { input: 12, expected: 3 },
  { input: 13, expected: 4 },
  { input: 14, expected: 5 },
  { input: 15, expected: 6 },
  { input: 16, expected: 7 },
  { input: 17, expected: 8 },
  { input: 18, expected: 9 },
  { input: 19, expected: 1 },
  { input: 20, expected: 2 },
  { input: 21, expected: 3 },
  { input: 22, expected: 4 },
  { input: 23, expected: 5 },
  { input: 24, expected: 6 },
  { input: 25, expected: 7 },
  { input: 26, expected: 8 },
  { input: 27, expected: 9 },
  { input: 28, expected: 1 },
  { input: 29, expected: 2 },
  { input: 30, expected: 3 },
  { input: 99, expected: 9 },
  { input: 100, expected: 1 },
  { input: 12345, expected: 6 },
  { input: 99999, expected: 9 },
];

interface PowerTwoCase {
  input: number;
  expected: boolean;
}

const POWER_TWO_CASES: PowerTwoCase[] = [
  { input: 1, expected: true },
  { input: 2, expected: true },
  { input: 3, expected: false },
  { input: 4, expected: true },
  { input: 5, expected: false },
  { input: 6, expected: false },
  { input: 7, expected: false },
  { input: 8, expected: true },
  { input: 9, expected: false },
  { input: 10, expected: false },
  { input: 11, expected: false },
  { input: 12, expected: false },
  { input: 13, expected: false },
  { input: 14, expected: false },
  { input: 15, expected: false },
  { input: 16, expected: true },
  { input: 17, expected: false },
  { input: 18, expected: false },
  { input: 19, expected: false },
  { input: 20, expected: false },
  { input: 21, expected: false },
  { input: 22, expected: false },
  { input: 23, expected: false },
  { input: 24, expected: false },
  { input: 25, expected: false },
  { input: 26, expected: false },
  { input: 27, expected: false },
  { input: 28, expected: false },
  { input: 29, expected: false },
  { input: 30, expected: false },
  { input: 31, expected: false },
  { input: 32, expected: true },
  { input: 33, expected: false },
  { input: 34, expected: false },
  { input: 35, expected: false },
  { input: 36, expected: false },
  { input: 37, expected: false },
  { input: 38, expected: false },
  { input: 39, expected: false },
  { input: 40, expected: false },
  { input: 41, expected: false },
  { input: 42, expected: false },
  { input: 43, expected: false },
  { input: 44, expected: false },
  { input: 45, expected: false },
  { input: 46, expected: false },
  { input: 47, expected: false },
  { input: 48, expected: false },
  { input: 49, expected: false },
  { input: 50, expected: false },
  { input: 51, expected: false },
  { input: 52, expected: false },
  { input: 53, expected: false },
  { input: 54, expected: false },
  { input: 55, expected: false },
  { input: 56, expected: false },
  { input: 57, expected: false },
  { input: 58, expected: false },
  { input: 59, expected: false },
  { input: 60, expected: false },
  { input: 61, expected: false },
  { input: 62, expected: false },
  { input: 63, expected: false },
  { input: 64, expected: true },
  { input: 100, expected: false },
  { input: 128, expected: true },
  { input: 1024, expected: true },
];

interface NextPowerCase {
  input: number;
  expected: number;
}

const NEXT_POWER_CASES: NextPowerCase[] = [
  { input: 0, expected: 1 },
  { input: 1, expected: 1 },
  { input: 2, expected: 2 },
  { input: 3, expected: 4 },
  { input: 4, expected: 4 },
  { input: 5, expected: 8 },
  { input: 6, expected: 8 },
  { input: 7, expected: 8 },
  { input: 8, expected: 8 },
  { input: 9, expected: 16 },
  { input: 10, expected: 16 },
  { input: 11, expected: 16 },
  { input: 12, expected: 16 },
  { input: 13, expected: 16 },
  { input: 14, expected: 16 },
  { input: 15, expected: 16 },
  { input: 16, expected: 16 },
  { input: 17, expected: 32 },
  { input: 18, expected: 32 },
  { input: 19, expected: 32 },
  { input: 20, expected: 32 },
  { input: 100, expected: 128 },
  { input: 1000, expected: 1024 },
  { input: 4096, expected: 4096 },
];

interface KaprekarCase {
  input: number;
  expected: number;
}

const KAPREKAR_CASES: KaprekarCase[] = [
  { input: 6174, expected: 0 },
  { input: 3524, expected: 3 },
  { input: 2111, expected: 5 },
  { input: 1000, expected: 5 },
  { input: 9998, expected: 5 },
  { input: 1111, expected: -1 },
  { input: 1234, expected: 3 },
  { input: 9876, expected: 3 },
  { input: 100, expected: -1 },
  { input: 9999, expected: -1 },
  { input: 2000, expected: 4 },
  { input: 3000, expected: 6 },
];

export default function numberPuzzleMatrixTest() {
  describe('NumberPuzzleMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberPuzzleMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberPuzzleMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0100
     * @tc.name      testDivisorSum0001
     * @tc.desc      Verify divisorSum matches the proper divisor sums of normal, prime and perfect numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDivisorSum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDivisorSum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < DIVISOR_CASES.length; i++) {
        const row: DivisorCase = DIVISOR_CASES[i];
        expect(NumberPuzzleUtil.divisorSum(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(DIVISOR_CASES.length);
      expect(DIVISOR_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'divisorSum rows checked: ' + checked);
      expect(NumberPuzzleUtil.divisorSum(0)).assertEqual(0);
      expect(NumberPuzzleUtil.divisorSum(1)).assertEqual(0);
      expect(NumberPuzzleUtil.divisorSum(-8)).assertEqual(0);
      expect(NumberPuzzleUtil.divisorSum(2)).assertEqual(1);
      expect(NumberPuzzleUtil.divisorSum(4)).assertEqual(3);
      expect(NumberPuzzleUtil.divisorSum(6)).assertEqual(6);
      expect(NumberPuzzleUtil.divisorSum(28)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0200
     * @tc.name      testClassifyNumber0002
     * @tc.desc      Verify classifyNumber reports perfect, abundant, deficient and invalid numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClassifyNumber0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClassifyNumber0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < CLASSIFY_CASES.length; i++) {
        const row: ClassifyCase = CLASSIFY_CASES[i];
        expect(NumberPuzzleUtil.classifyNumber(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(CLASSIFY_CASES.length);
      expect(CLASSIFY_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'classifyNumber rows checked: ' + checked);
      expect(NumberPuzzleUtil.classifyNumber(0)).assertEqual('invalid');
      expect(NumberPuzzleUtil.classifyNumber(-1)).assertEqual('invalid');
      expect(NumberPuzzleUtil.classifyNumber(6)).assertEqual('perfect');
      expect(NumberPuzzleUtil.classifyNumber(12)).assertEqual('abundant');
      expect(NumberPuzzleUtil.classifyNumber(13)).assertEqual('deficient');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0300
     * @tc.name      testCollatzSteps0003
     * @tc.desc      Verify collatzSteps counts every halving and tripling step until the value reaches one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollatzSteps0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCollatzSteps0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < COLLATZ_CASES.length; i++) {
        const row: CollatzCase = COLLATZ_CASES[i];
        expect(NumberPuzzleUtil.collatzSteps(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(COLLATZ_CASES.length);
      expect(COLLATZ_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'collatzSteps rows checked: ' + checked);
      expect(NumberPuzzleUtil.collatzSteps(0)).assertEqual(0);
      expect(NumberPuzzleUtil.collatzSteps(1)).assertEqual(0);
      expect(NumberPuzzleUtil.collatzSteps(-3)).assertEqual(0);
      expect(NumberPuzzleUtil.collatzSteps(2)).assertEqual(1);
      expect(NumberPuzzleUtil.collatzSteps(4)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0400
     * @tc.name      testHappyNumber0004
     * @tc.desc      Verify isHappyNumber accepts happy values and rejects unhappy values in the small range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHappyNumber0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testHappyNumber0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < HAPPY_CASES.length; i++) {
        const row: HappyCase = HAPPY_CASES[i];
        expect(NumberPuzzleUtil.isHappyNumber(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(HAPPY_CASES.length);
      expect(HAPPY_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'isHappyNumber rows checked: ' + checked);
      expect(NumberPuzzleUtil.isHappyNumber(0)).assertFalse();
      expect(NumberPuzzleUtil.isHappyNumber(-7)).assertFalse();
      expect(NumberPuzzleUtil.isHappyNumber(1)).assertTrue();
      expect(NumberPuzzleUtil.isHappyNumber(7)).assertTrue();
      expect(NumberPuzzleUtil.isHappyNumber(2)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0500
     * @tc.name      testTriangularNumber0005
     * @tc.desc      Verify triangularNumber returns the n-th triangular number and zero for invalid input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTriangularNumber0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTriangularNumber0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < TRIANGULAR_CASES.length; i++) {
        const row: TriangularCase = TRIANGULAR_CASES[i];
        expect(NumberPuzzleUtil.triangularNumber(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(TRIANGULAR_CASES.length);
      expect(TRIANGULAR_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'triangularNumber rows checked: ' + checked);
      expect(NumberPuzzleUtil.triangularNumber(-1)).assertEqual(0);
      expect(NumberPuzzleUtil.triangularNumber(0)).assertEqual(0);
      expect(NumberPuzzleUtil.triangularNumber(1)).assertEqual(1);
      expect(NumberPuzzleUtil.triangularNumber(2)).assertEqual(3);
      expect(NumberPuzzleUtil.triangularNumber(10)).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0600
     * @tc.name      testIsTriangular0006
     * @tc.desc      Verify isTriangular accepts triangular values and rejects negative or non triangular values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsTriangular0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIsTriangular0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < TRIANGULAR_CHECK_CASES.length; i++) {
        const row: TriangularCheckCase = TRIANGULAR_CHECK_CASES[i];
        expect(NumberPuzzleUtil.isTriangular(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(TRIANGULAR_CHECK_CASES.length);
      expect(TRIANGULAR_CHECK_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'isTriangular rows checked: ' + checked);
      expect(NumberPuzzleUtil.isTriangular(-1)).assertFalse();
      expect(NumberPuzzleUtil.isTriangular(0)).assertTrue();
      expect(NumberPuzzleUtil.isTriangular(1)).assertTrue();
      expect(NumberPuzzleUtil.isTriangular(2)).assertFalse();
      expect(NumberPuzzleUtil.isTriangular(3)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0700
     * @tc.name      testDigitalRoot0007
     * @tc.desc      Verify digitalRoot reduces values to a single digit and returns zero for non positive input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitalRoot0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDigitalRoot0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < DIGITAL_ROOT_CASES.length; i++) {
        const row: DigitalRootCase = DIGITAL_ROOT_CASES[i];
        expect(NumberPuzzleUtil.digitalRoot(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(DIGITAL_ROOT_CASES.length);
      expect(DIGITAL_ROOT_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'digitalRoot rows checked: ' + checked);
      expect(NumberPuzzleUtil.digitalRoot(0)).assertEqual(0);
      expect(NumberPuzzleUtil.digitalRoot(-12)).assertEqual(0);
      expect(NumberPuzzleUtil.digitalRoot(9)).assertEqual(9);
      expect(NumberPuzzleUtil.digitalRoot(10)).assertEqual(1);
      expect(NumberPuzzleUtil.digitalRoot(999999)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0800
     * @tc.name      testPowerOfTwo0008
     * @tc.desc      Verify isPowerOfTwo accepts powers of two and rejects other values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPowerOfTwo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPowerOfTwo0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < POWER_TWO_CASES.length; i++) {
        const row: PowerTwoCase = POWER_TWO_CASES[i];
        expect(NumberPuzzleUtil.isPowerOfTwo(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(POWER_TWO_CASES.length);
      expect(POWER_TWO_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'isPowerOfTwo rows checked: ' + checked);
      expect(NumberPuzzleUtil.isPowerOfTwo(0)).assertFalse();
      expect(NumberPuzzleUtil.isPowerOfTwo(-2)).assertFalse();
      expect(NumberPuzzleUtil.isPowerOfTwo(1)).assertTrue();
      expect(NumberPuzzleUtil.isPowerOfTwo(2)).assertTrue();
      expect(NumberPuzzleUtil.isPowerOfTwo(3)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_0900
     * @tc.name      testNextPowerOfTwo0009
     * @tc.desc      Verify nextPowerOfTwo returns the smallest power of two not below the input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNextPowerOfTwo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNextPowerOfTwo0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < NEXT_POWER_CASES.length; i++) {
        const row: NextPowerCase = NEXT_POWER_CASES[i];
        expect(NumberPuzzleUtil.nextPowerOfTwo(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(NEXT_POWER_CASES.length);
      expect(NEXT_POWER_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'nextPowerOfTwo rows checked: ' + checked);
      expect(NumberPuzzleUtil.nextPowerOfTwo(0)).assertEqual(1);
      expect(NumberPuzzleUtil.nextPowerOfTwo(-9)).assertEqual(1);
      expect(NumberPuzzleUtil.nextPowerOfTwo(1)).assertEqual(1);
      expect(NumberPuzzleUtil.nextPowerOfTwo(2)).assertEqual(2);
      expect(NumberPuzzleUtil.nextPowerOfTwo(3)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_1000
     * @tc.name      testKaprekarSteps0010
     * @tc.desc      Verify kaprekarSteps reaches the 6174 constant and rejects invalid or repeated digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testKaprekarSteps0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testKaprekarSteps0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < KAPREKAR_CASES.length; i++) {
        const row: KaprekarCase = KAPREKAR_CASES[i];
        expect(NumberPuzzleUtil.kaprekarSteps(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(KAPREKAR_CASES.length);
      expect(KAPREKAR_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'kaprekarSteps rows checked: ' + checked);
      expect(NumberPuzzleUtil.kaprekarSteps(6174)).assertEqual(0);
      expect(NumberPuzzleUtil.kaprekarSteps(999)).assertEqual(-1);
      expect(NumberPuzzleUtil.kaprekarSteps(10000)).assertEqual(-1);
      expect(NumberPuzzleUtil.kaprekarSteps(1111)).assertEqual(-1);
      expect(NumberPuzzleUtil.kaprekarSteps(2222)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_1100
     * @tc.name      testPuzzleInvariants0011
     * @tc.desc      Verify cross method invariants between triangular numbers, digital roots and powers of two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPuzzleInvariants0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPuzzleInvariants0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let triangularChecked: number = 0;
      for (let n = 1; n <= 120; n++) {
        const value: number = NumberPuzzleUtil.triangularNumber(n);
        expect(NumberPuzzleUtil.isTriangular(value)).assertTrue();
        triangularChecked = triangularChecked + 1;
      }
      expect(triangularChecked).assertEqual(120);
      let rootChecked: number = 0;
      for (let n = 1; n <= 200; n++) {
        const root: number = NumberPuzzleUtil.digitalRoot(n);
        expect(root >= 1).assertTrue();
        expect(root <= 9).assertTrue();
        expect(root % 9).assertEqual(n % 9);
        rootChecked = rootChecked + 1;
      }
      expect(rootChecked).assertEqual(200);
      let powerChecked: number = 0;
      for (let n = 1; n <= 64; n++) {
        if (NumberPuzzleUtil.isPowerOfTwo(n)) {
          expect(NumberPuzzleUtil.nextPowerOfTwo(n)).assertEqual(n);
          powerChecked = powerChecked + 1;
        }
      }
      expect(powerChecked).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'invariants checked');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_PUZZLE_1200
     * @tc.name      testPuzzleBoundaries0012
     * @tc.desc      Verify every puzzle helper handles zero, negative and large boundary inputs without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPuzzleBoundaries0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPuzzleBoundaries0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // ponytail: bound the O(sqrt(n)) SmallTest scan at 2^31-1; larger inputs need a faster algorithm.
      const largePrime: number = 2147483647;
      expect(NumberPuzzleUtil.divisorSum(largePrime)).assertEqual(1);
      expect(NumberPuzzleUtil.classifyNumber(largePrime)).assertEqual('deficient');
      expect(NumberPuzzleUtil.collatzSteps(1)).assertEqual(0);
      expect(NumberPuzzleUtil.isHappyNumber(1)).assertTrue();
      expect(NumberPuzzleUtil.triangularNumber(1000)).assertEqual(500500);
      expect(NumberPuzzleUtil.isTriangular(500500)).assertTrue();
      expect(NumberPuzzleUtil.digitalRoot(Number.MAX_SAFE_INTEGER)).assertEqual(4);
      expect(NumberPuzzleUtil.isPowerOfTwo(Number.MAX_SAFE_INTEGER)).assertFalse();
      expect(NumberPuzzleUtil.nextPowerOfTwo(Number.MAX_SAFE_INTEGER)).assertLarger(0);
      expect(NumberPuzzleUtil.kaprekarSteps(-6174)).assertEqual(-1);
      expect(NumberPuzzleUtil.divisorSum(1)).assertEqual(0);
      expect(NumberPuzzleUtil.divisorSum(2)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
