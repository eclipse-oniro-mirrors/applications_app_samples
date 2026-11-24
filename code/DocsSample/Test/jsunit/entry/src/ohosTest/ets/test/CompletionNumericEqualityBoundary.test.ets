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

async function runAssertion0001(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'SignedZeroAccepted',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: -0,
      expected: 0,
      message: ''
    },
    {
      label: 'SignedZeroRejected',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: -0,
      expected: 0.25,
      message: 'expect 0 equals 0.25'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0002(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'BinaryFractionAccepted',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 0.125,
      expected: 0.125,
      message: ''
    },
    {
      label: 'BinaryFractionRejected',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 0.125,
      expected: 0.25,
      message: 'expect 0.125 equals 0.25'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0003(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'SafeIntegerEdgeAccepted',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 9007199254740991,
      expected: 9007199254740991,
      message: ''
    },
    {
      label: 'SafeIntegerEdgeRejected',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 9007199254740991,
      expected: 9007199254740990,
      message: 'expect 9007199254740991 equals 9007199254740990'
    }
  ];
  await runNumericRows(rows);
}

async function runAssertion0004(): Promise<void> {
  const rows: NumericRow[] = [
    {
      label: 'NegativeEqualityInversionAccepted',
      matcher: 'assertEqual',
      negate: true,
      passed: true,
      actual: -65536,
      expected: -65535,
      message: ''
    },
    {
      label: 'NegativeEqualityInversionRejected',
      matcher: 'assertEqual',
      negate: true,
      passed: false,
      actual: -65536,
      expected: -65536,
      message: 'expect not Equal, actualValue is -65536 equals -65536'
    }
  ];
  await runNumericRows(rows);
}

export default function numericEqualityBoundary(): void {
  describe('NumericEqualityBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0001
     * @tc.name testJsunitAssertion0001
     * @tc.desc SignedZero: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0001', 0, async (): Promise<void> => {
      await runAssertion0001();
    });

    /**
     * @tc.number testJsunitAssertion0002
     * @tc.name testJsunitAssertion0002
     * @tc.desc BinaryFraction: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0002', 0, async (): Promise<void> => {
      await runAssertion0002();
    });

    /**
     * @tc.number testJsunitAssertion0003
     * @tc.name testJsunitAssertion0003
     * @tc.desc SafeIntegerEdge: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0003', 0, async (): Promise<void> => {
      await runAssertion0003();
    });

    /**
     * @tc.number testJsunitAssertion0004
     * @tc.name testJsunitAssertion0004
     * @tc.desc NegativeEqualityInversion: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0004', 0, async (): Promise<void> => {
      await runAssertion0004();
    });

  });
}
