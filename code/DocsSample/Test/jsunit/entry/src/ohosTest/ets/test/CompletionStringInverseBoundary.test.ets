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

async function runAssertion0029(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'CaseSensitiveNotEqual',
      matcher: 'assertEqual',
      negate: true,
      passed: false,
      actual: 'Custom',
      expected: 'Custom',
      message: 'expect not Equal, actualValue is Custom equals Custom'
    },
    {
      label: 'CaseSensitiveNotDifferent',
      matcher: 'assertEqual',
      negate: true,
      passed: true,
      actual: 'Custom',
      expected: 'custom',
      message: ''
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0030(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'NewlineNotEqual',
      matcher: 'assertEqual',
      negate: true,
      passed: false,
      actual: 'line' + String.fromCharCode(10) + 'end',
      expected: 'line' + String.fromCharCode(10) + 'end',
      message:
        'expect not Equal, actualValue is line' + String.fromCharCode(10) + 'end equals line' +
        String.fromCharCode(10) + 'end'
    },
    {
      label: 'NewlineNotDifferent',
      matcher: 'assertEqual',
      negate: true,
      passed: true,
      actual: 'line' + String.fromCharCode(10) + 'end',
      expected: 'lineend',
      message: ''
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0031(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'EmptyNotEqual',
      matcher: 'assertEqual',
      negate: true,
      passed: false,
      actual: '',
      expected: '',
      message: 'expect not Equal, actualValue is  equals '
    },
    {
      label: 'EmptyNotDifferent',
      matcher: 'assertEqual',
      negate: true,
      passed: true,
      actual: '',
      expected: String.fromCharCode(0),
      message: ''
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0032(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'ZeroWidthNotEqual',
      matcher: 'assertEqual',
      negate: true,
      passed: false,
      actual: 'ab​c',
      expected: 'ab​c',
      message: 'expect not Equal, actualValue is ab​c equals ab​c'
    },
    {
      label: 'ZeroWidthNotDifferent',
      matcher: 'assertEqual',
      negate: true,
      passed: true,
      actual: 'ab​c',
      expected: 'abc',
      message: ''
    }
  ];
  await runStringRows(rows);
}

export default function stringInverseBoundary(): void {
  describe('StringInverseBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0029
     * @tc.name testJsunitAssertion0029
     * @tc.desc CaseSensitiveNot: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0029', 0, async (): Promise<void> => {
      await runAssertion0029();
    });

    /**
     * @tc.number testJsunitAssertion0030
     * @tc.name testJsunitAssertion0030
     * @tc.desc NewlineNot: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0030', 0, async (): Promise<void> => {
      await runAssertion0030();
    });

    /**
     * @tc.number testJsunitAssertion0031
     * @tc.name testJsunitAssertion0031
     * @tc.desc EmptyNot: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0031', 0, async (): Promise<void> => {
      await runAssertion0031();
    });

    /**
     * @tc.number testJsunitAssertion0032
     * @tc.name testJsunitAssertion0032
     * @tc.desc ZeroWidthNot: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0032', 0, async (): Promise<void> => {
      await runAssertion0032();
    });

  });
}
