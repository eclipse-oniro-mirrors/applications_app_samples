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
import { StringRow, runStringRows } from './AssertionCompletionSupport';
import { paceTurn } from './TestPace';

async function runAssertion0021(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'CjkDistinctEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: '断言恢复',
      expected: '断言恢复',
      message: ''
    },
    {
      label: 'CjkDistinctDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: '断言恢复',
      expected: '断言记录',
      message: 'expect 断言恢复 equals 断言记录'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0022(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'CanonicalCompositionEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'é',
      expected: 'é',
      message: ''
    },
    {
      label: 'CanonicalCompositionDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'é',
      expected: 'é',
      message: 'expect é equals é'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0023(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'FullWidthLatinEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'ＡBC',
      expected: 'ＡBC',
      message: ''
    },
    {
      label: 'FullWidthLatinDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'ＡBC',
      expected: 'ABC',
      message: 'expect ＡBC equals ABC'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0024(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'SurrogatePairSuffixEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: '𝄞音',
      expected: '𝄞音',
      message: ''
    },
    {
      label: 'SurrogatePairSuffixDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: '𝄞音',
      expected: '𝄞',
      message: 'expect 𝄞音 equals 𝄞'
    }
  ];
  await runStringRows(rows);
}

export default function stringUnicodeBoundary(): void {
  describe('StringUnicodeBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0021
     * @tc.name testJsunitAssertion0021
     * @tc.desc CjkDistinct: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0021', 0, async (): Promise<void> => {
      await runAssertion0021();
    });

    /**
     * @tc.number testJsunitAssertion0022
     * @tc.name testJsunitAssertion0022
     * @tc.desc CanonicalComposition: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0022', 0, async (): Promise<void> => {
      await runAssertion0022();
    });

    /**
     * @tc.number testJsunitAssertion0023
     * @tc.name testJsunitAssertion0023
     * @tc.desc FullWidthLatin: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0023', 0, async (): Promise<void> => {
      await runAssertion0023();
    });

    /**
     * @tc.number testJsunitAssertion0024
     * @tc.name testJsunitAssertion0024
     * @tc.desc SurrogatePairSuffix: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0024', 0, async (): Promise<void> => {
      await runAssertion0024();
    });

  });
}
