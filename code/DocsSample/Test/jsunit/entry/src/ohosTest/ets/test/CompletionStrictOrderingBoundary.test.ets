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

async function runAssertion0005(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LargerAtZeroAccepted',
      matcher: 'assertLarger',
      negate: false,
      passed: true,
      actual: 0.25,
      expected: 0,
      message: ''
    },
    {
      label: 'LargerAtZeroRejected',
      matcher: 'assertLarger',
      negate: false,
      passed: false,
      actual: 0,
      expected: 0,
      message: '0 is not larger than 0'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0006(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LessBelowZeroAccepted',
      matcher: 'assertLess',
      negate: false,
      passed: true,
      actual: -0.125,
      expected: 0,
      message: ''
    },
    {
      label: 'LessBelowZeroRejected',
      matcher: 'assertLess',
      negate: false,
      passed: false,
      actual: 0,
      expected: 0,
      message: '0 is not less than 0'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0007(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LargerNegativeRangeAccepted',
      matcher: 'assertLarger',
      negate: false,
      passed: true,
      actual: -1023,
      expected: -1024,
      message: ''
    },
    {
      label: 'LargerNegativeRangeRejected',
      matcher: 'assertLarger',
      negate: false,
      passed: false,
      actual: -1025,
      expected: -1024,
      message: '-1025 is not larger than -1024'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0008(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LessWideRangeAccepted',
      matcher: 'assertLess',
      negate: false,
      passed: true,
      actual: 1099511627775,
      expected: 1099511627776,
      message: ''
    },
    {
      label: 'LessWideRangeRejected',
      matcher: 'assertLess',
      negate: false,
      passed: false,
      actual: 1099511627777,
      expected: 1099511627776,
      message: '1099511627777 is not less than 1099511627776'
    }
  ];
  await runNumericRows(rows);
}

export default function strictOrderingBoundary(): void {
  describe('StrictOrderingBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0005
     * @tc.name testJsunitAssertion0005
     * @tc.desc LargerAtZero: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0005', 0, async (): Promise<void> => {
      await runAssertion0005();
    });

    /**
     * @tc.number testJsunitAssertion0006
     * @tc.name testJsunitAssertion0006
     * @tc.desc LessBelowZero: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0006', 0, async (): Promise<void> => {
      await runAssertion0006();
    });

    /**
     * @tc.number testJsunitAssertion0007
     * @tc.name testJsunitAssertion0007
     * @tc.desc LargerNegativeRange: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0007', 0, async (): Promise<void> => {
      await runAssertion0007();
    });

    /**
     * @tc.number testJsunitAssertion0008
     * @tc.name testJsunitAssertion0008
     * @tc.desc LessWideRange: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0008', 0, async (): Promise<void> => {
      await runAssertion0008();
    });

  });
}
