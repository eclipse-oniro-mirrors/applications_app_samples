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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { add, multiply } from '../../../main/ets/common/Math';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_MATH]';

const LEFT: number[] = [
  -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000, -1000,
  -100, -100, -100, -100, -100, -100, -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
  -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
  7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
  50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,
  100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
  1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000,
  0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
  -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25, -0.25,
  1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0
];

const RIGHT: number[] = [
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0,
  -1000, -100, -7, -1, 0, 1, 2, 3, 7, 10, 50, 100, 1000, 0.5, -0.25, 1000000.0
];

function pad4(value: number): string {
  let text: string = value.toString();
  while (text.length < 4) {
    text = '0' + text;
  }
  return text;
}

/**
 * @tc.number    SUB_ARKTS_GUIDE_MATH_testMathMatrix
 * @tc.name      testMathMatrix
 * @tc.desc      add/multiply commutativity and additive inverse over the documented operand matrix
 * @tc.type      FUNCTION
 * @tc.size      SMALLTEST
 * @tc.level     LEVEL1
 */
export default function MathMatrixTest(): void {
  describe('MathMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

    LEFT.forEach((left: number, index: number): void => {
      const right: number = RIGHT[index];
      const name: string = 'testMathMatrix' + pad4(index + 1);
      it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin, left=' + left.toString() + ', right=' + right.toString());
        const expectedAdd: number = left + right;
        expect(add(left, right)).assertEqual(expectedAdd);
        expect(add(right, left)).assertEqual(expectedAdd);
        const expectedMul: number = left * right;
        expect(multiply(left, right)).assertEqual(expectedMul);
        expect(multiply(right, left)).assertEqual(expectedMul);
        expect(add(left, right) - right).assertEqual(left);
        hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
      })
    })
  })
}
