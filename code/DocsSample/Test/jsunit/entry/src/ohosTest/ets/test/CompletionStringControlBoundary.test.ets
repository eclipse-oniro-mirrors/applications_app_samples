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

async function runAssertion0025(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'EmbeddedNulEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'pre' + String.fromCharCode(0) + 'post',
      expected: 'pre' + String.fromCharCode(0) + 'post',
      message: ''
    },
    {
      label: 'EmbeddedNulDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'pre' + String.fromCharCode(0) + 'post',
      expected: 'prepost',
      message: 'expect pre' + String.fromCharCode(0) + 'post equals prepost'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0026(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'BackslashAndQuoteEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'a\\\'b',
      expected: 'a\\\'b',
      message: ''
    },
    {
      label: 'BackslashAndQuoteDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'a\\\'b',
      expected: 'a\'b',
      message: 'expect a\\\'b equals a\'b'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0027(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'UnicodeLineSeparatorEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'a' + String.fromCharCode(8232) + 'b',
      expected: 'a' + String.fromCharCode(8232) + 'b',
      message: ''
    },
    {
      label: 'UnicodeLineSeparatorDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'a' + String.fromCharCode(8232) + 'b',
      expected: 'a' + String.fromCharCode(8233) + 'b',
      message: 'expect a' + String.fromCharCode(8232) + 'b equals a' + String.fromCharCode(8233) + 'b'
    }
  ];
  await runStringRows(rows);
}

async function runAssertion0028(): Promise<void> {
  const rows: StringRow[] = [
    {
      label: 'DeleteCharacterEqual',
      matcher: 'assertEqual',
      negate: false,
      passed: true,
      actual: 'x' + String.fromCharCode(127) + 'y',
      expected: 'x' + String.fromCharCode(127) + 'y',
      message: ''
    },
    {
      label: 'DeleteCharacterDifferent',
      matcher: 'assertEqual',
      negate: false,
      passed: false,
      actual: 'x' + String.fromCharCode(127) + 'y',
      expected: 'xy',
      message: 'expect x' + String.fromCharCode(127) + 'y equals xy'
    }
  ];
  await runStringRows(rows);
}

export default function stringControlBoundary(): void {
  describe('StringControlBoundary', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitAssertion0025
     * @tc.name testJsunitAssertion0025
     * @tc.desc EmbeddedNul: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0025', 0, async (): Promise<void> => {
      await runAssertion0025();
    });

    /**
     * @tc.number testJsunitAssertion0026
     * @tc.name testJsunitAssertion0026
     * @tc.desc BackslashAndQuote: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0026', 0, async (): Promise<void> => {
      await runAssertion0026();
    });

    /**
     * @tc.number testJsunitAssertion0027
     * @tc.name testJsunitAssertion0027
     * @tc.desc UnicodeLineSeparator: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0027', 0, async (): Promise<void> => {
      await runAssertion0027();
    });

    /**
     * @tc.number testJsunitAssertion0028
     * @tc.name testJsunitAssertion0028
     * @tc.desc DeleteCharacter: observe acceptance, rejection and record recovery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitAssertion0028', 0, async (): Promise<void> => {
      await runAssertion0028();
    });

  });
}
