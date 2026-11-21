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

async function runAssertion0009(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LargerOrEqualSignedZeroAccepted',
      matcher: 'assertLargerOrEqual',
      negate: false,
      passed: true,
      actual: -0,
      expected: 0,
      message: ''
    },
    {
      label: 'LargerOrEqualSignedZeroRejected',
      matcher: 'assertLargerOrEqual',
      negate: false,
      passed: false,
      actual: -0.25,
      expected: 0,
      message: '-0.25 is not larger than 0'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0010(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LessOrEqualQuarterAccepted',
      matcher: 'assertLessOrEqual',
      negate: false,
      passed: true,
      actual: 0.25,
      expected: 0.25,
      message: ''
    },
    {
      label: 'LessOrEqualQuarterRejected',
      matcher: 'assertLessOrEqual',
      negate: false,
      passed: false,
      actual: 0.5,
      expected: 0.25,
      message: '0.5 is not less than 0.25'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0011(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LargerOrEqualNegativeEdgeAccepted',
      matcher: 'assertLargerOrEqual',
      negate: false,
      passed: true,
      actual: -2147483648,
      expected: -2147483648,
      message: ''
    },
    {
      label: 'LargerOrEqualNegativeEdgeRejected',
      matcher: 'assertLargerOrEqual',
      negate: false,
      passed: false,
      actual: -2147483649,
      expected: -2147483648,
      message: '-2147483649 is not larger than -2147483648'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0012(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'LessOrEqualSafeEdgeAccepted',
      matcher: 'assertLessOrEqual',
      negate: false,
      passed: true,
      actual: 9007199254740990,
      expected: 9007199254740990,
      message: ''
    },
    {
      label: 'LessOrEqualSafeEdgeRejected',
      matcher: 'assertLessOrEqual',
      negate: false,
      passed: false,
      actual: 9007199254740991,
      expected: 9007199254740990,
      message: '9007199254740991 is not less than 9007199254740990'
    }
  ];
  await runNumericRows(rows);
}

export default function inclusiveOrderingBoundary(): void {
  describe('InclusiveOrderingBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
