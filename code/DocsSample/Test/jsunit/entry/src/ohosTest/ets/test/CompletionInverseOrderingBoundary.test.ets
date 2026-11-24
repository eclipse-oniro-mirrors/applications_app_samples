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
import { beforeEach, describe, it } from '@ohos/hypium';
import { NumericRow, runNumericRows } from './AssertionCompletionSupport';
import { paceTurn } from './TestPace';

async function runAssertion0013(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'NotLargerEqualityAccepted',
      matcher: 'assertLarger',
      negate: true,
      passed: true,
      actual: -0,
      expected: 0,
      message: ''
    },
    {
      label: 'NotLargerEqualityRejected',
      matcher: 'assertLarger',
      negate: true,
      passed: false,
      actual: 0.125,
      expected: 0,
      message: 'expect not Larger, 0.125 is larger than 0'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0014(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'NotLessEqualityAccepted',
      matcher: 'assertLess',
      negate: true,
      passed: true,
      actual: -2.5,
      expected: -2.5,
      message: ''
    },
    {
      label: 'NotLessEqualityRejected',
      matcher: 'assertLess',
      negate: true,
      passed: false,
      actual: -2.75,
      expected: -2.5,
      message: 'expect not Less, -2.75 less than -2.5'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0015(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'NotLargerOrEqualEqualityAccepted',
      matcher: 'assertLargerOrEqual',
      negate: true,
      passed: true,
      actual: -128.25,
      expected: -128,
      message: ''
    },
    {
      label: 'NotLargerOrEqualEqualityRejected',
      matcher: 'assertLargerOrEqual',
      negate: true,
      passed: false,
      actual: -128,
      expected: -128,
      message: 'expect not LargerOrEqual, -128 larger than -128'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0016(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'NotLessOrEqualEqualityAccepted',
      matcher: 'assertLessOrEqual',
      negate: true,
      passed: true,
      actual: 65536.25,
      expected: 65536,
      message: ''
    },
    {
      label: 'NotLessOrEqualEqualityRejected',
      matcher: 'assertLessOrEqual',
      negate: true,
      passed: false,
      actual: 65536,
      expected: 65536,
      message: 'expect not LessOrEqual, 65536 is less than 65536'
    }
  ];
  await runNumericRows(rows);
}

export default function inverseOrderingBoundary(): void {
  describe('InverseOrderingBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0013
     * @tc.name testJsunitAssertion0013
     * @tc.desc NotLargerEquality: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0013', 0, async (): Promise<void> => {
      await runAssertion0013();
    });

    /**
     * @tc.number testJsunitAssertion0014
     * @tc.name testJsunitAssertion0014
     * @tc.desc NotLessEquality: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0014', 0, async (): Promise<void> => {
      await runAssertion0014();
    });

    /**
     * @tc.number testJsunitAssertion0015
     * @tc.name testJsunitAssertion0015
     * @tc.desc NotLargerOrEqualEquality: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0015', 0, async (): Promise<void> => {
      await runAssertion0015();
    });

    /**
     * @tc.number testJsunitAssertion0016
     * @tc.name testJsunitAssertion0016
     * @tc.desc NotLessOrEqualEquality: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0016', 0, async (): Promise<void> => {
      await runAssertion0016();
    });

  });
}
