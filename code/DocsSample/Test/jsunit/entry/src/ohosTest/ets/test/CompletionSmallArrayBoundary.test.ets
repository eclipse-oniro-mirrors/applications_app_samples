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
import { ArrayRow, runArrayRows } from './AssertionCompletionSupport';
import { paceTurn } from './TestPace';

async function runAssertion0129(): Promise<void> {
  const rows: ArrayRow[] = [
    {
      label: 'EmptyLengthAccepted',
      matcher: 'assertDeepEquals',
      negate: false,
      passed: true,
      actual: [
      ],
      expected: [
      ],
      message: ''
    },
    {
      label: 'EmptyLengthRejected',
      matcher: 'assertDeepEquals',
      negate: false,
      passed: false,
      actual: [
        0
      ],
      expected: [
      ],
      message: 'expect [0] deep equals []'
    }
  ];
  await runArrayRows(rows);
}

async function runAssertion0130(): Promise<void> {
  const rows: ArrayRow[] = [
    {
      label: 'SingletonSignedZeroAccepted',
      matcher: 'assertDeepEquals',
      negate: false,
      passed: true,
      actual: [
        -0
      ],
      expected: [
        -0
      ],
      message: ''
    },
    {
      label: 'SingletonSignedZeroRejected',
      matcher: 'assertDeepEquals',
      negate: false,
      passed: false,
      actual: [
        -0
      ],
      expected: [
        0
      ],
      message: 'expect [0] deep equals [0]'
    }
  ];
  await runArrayRows(rows);
}

async function runAssertion0131(): Promise<void> {
  const rows: ArrayRow[] = [
    {
      label: 'DuplicateOrderAccepted',
      matcher: 'assertDeepEquals',
      negate: false,
      passed: true,
      actual: [
        1,
        1,
        2
      ],
      expected: [
        1,
        1,
        2
      ],
      message: ''
    },
    {
      label: 'DuplicateOrderRejected',
      matcher: 'assertDeepEquals',
      negate: false,
      passed: false,
      actual: [
        1,
        2,
        1
      ],
      expected: [
        1,
        1,
        2
      ],
      message: 'expect [1,2,1] deep equals [1,1,2]'
    }
  ];
  await runArrayRows(rows);
}

async function runAssertion0132(): Promise<void> {
  const rows: ArrayRow[] = [
    {
      label: 'NotQuarterSignAccepted',
      matcher: 'assertDeepEquals',
      negate: true,
      passed: true,
      actual: [
        0.25,
        -0.5
      ],
      expected: [
        0.25,
        0.5
      ],
      message: ''
    },
    {
      label: 'NotQuarterSignRejected',
      matcher: 'assertDeepEquals',
      negate: true,
      passed: false,
      actual: [
        0.25,
        -0.5
      ],
      expected: [
        0.25,
        -0.5
      ],
      message: 'expect [0.25,-0.5] deep equals [0.25,-0.5]'
    }
  ];
  await runArrayRows(rows);
}

export default function smallArrayBoundary(): void {
  describe('SmallArrayBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0129
     * @tc.name testJsunitAssertion0129
     * @tc.desc EmptyLength: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0129', 0, async (): Promise<void> => {
      await runAssertion0129();
    });

    /**
     * @tc.number testJsunitAssertion0130
     * @tc.name testJsunitAssertion0130
     * @tc.desc SingletonSignedZero: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0130', 0, async (): Promise<void> => {
      await runAssertion0130();
    });

    /**
     * @tc.number testJsunitAssertion0131
     * @tc.name testJsunitAssertion0131
     * @tc.desc DuplicateOrder: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0131', 0, async (): Promise<void> => {
      await runAssertion0131();
    });

    /**
     * @tc.number testJsunitAssertion0132
     * @tc.name testJsunitAssertion0132
     * @tc.desc NotQuarterSign: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0132', 0, async (): Promise<void> => {
      await runAssertion0132();
    });

  });
}
