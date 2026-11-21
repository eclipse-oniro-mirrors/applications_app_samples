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

async function runAssertion0017(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'EmptyVersusSpaceEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: '',
      expected: '',
      message: ''
    },
    {
      label: 'EmptyVersusSpaceDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: '',
      expected: ' ',
      message: 'expect  equals  '
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0018(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'TrailingSpaceEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'custom ',
      expected: 'custom ',
      message: ''
    },
    {
      label: 'TrailingSpaceDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'custom ',
      expected: 'custom',
      message: 'expect custom  equals custom'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0019(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'LeadingTabEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: String.fromCharCode(9) + 'custom',
      expected: String.fromCharCode(9) + 'custom',
      message: ''
    },
    {
      label: 'LeadingTabDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: String.fromCharCode(9) + 'custom',
      expected: 'custom',
      message: 'expect ' + String.fromCharCode(9) + 'custom equals custom'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0020(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'CarriageLineFeedEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'a' + String.fromCharCode(13) + String.fromCharCode(10) + 'b',
      expected: 'a' + String.fromCharCode(13) + String.fromCharCode(10) + 'b',
      message: ''
    },
    {
      label: 'CarriageLineFeedDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'a' + String.fromCharCode(13) + String.fromCharCode(10) + 'b',
      expected: 'a' + String.fromCharCode(10) + 'b',
      message:
        'expect a' + String.fromCharCode(13) + String.fromCharCode(10) + 'b equals a' +
        String.fromCharCode(10) + 'b'
    }
  ];
  await runStringRows(rows);
}

export default function stringWhitespaceBoundary(): void {
  describe('StringWhitespaceBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0017
     * @tc.name testJsunitAssertion0017
     * @tc.desc EmptyVersusSpace: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0017', 0, async (): Promise<void> => {
      await runAssertion0017();
    });

    /**
     * @tc.number testJsunitAssertion0018
     * @tc.name testJsunitAssertion0018
     * @tc.desc TrailingSpace: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0018', 0, async (): Promise<void> => {
      await runAssertion0018();
    });

    /**
     * @tc.number testJsunitAssertion0019
     * @tc.name testJsunitAssertion0019
     * @tc.desc LeadingTab: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0019', 0, async (): Promise<void> => {
      await runAssertion0019();
    });

    /**
     * @tc.number testJsunitAssertion0020
     * @tc.name testJsunitAssertion0020
     * @tc.desc CarriageLineFeed: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0020', 0, async (): Promise<void> => {
      await runAssertion0020();
    });

  });
}
