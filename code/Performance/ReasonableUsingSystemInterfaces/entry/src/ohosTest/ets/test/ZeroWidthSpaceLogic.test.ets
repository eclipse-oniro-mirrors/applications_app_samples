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
import { describe, it, expect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { InterfaceTestLog } from '../utils/InterfaceTestLog';
import { insertZeroWidthSpaces } from '../../../main/ets/utils/DisplayText';
function countScalars(text: string): number {
  let count: number = text.length;
  for (let index: number = 1; index < text.length; index++) {
    const previous: number = text.charCodeAt(index - 1);
    const current: number = text.charCodeAt(index);
    if (previous >= 0xD800 && previous <= 0xDBFF && current >= 0xDC00 && current <= 0xDFFF) {
      count--;
    }
  }
  return count;
}
function countOccurrences(text: string, unit: string): number {
  let count: number = 0;
  let offset: number = 0;
  while (offset < text.length) {
    const found: number = text.indexOf(unit, offset);
    if (found < 0) {
      break;
    }
    count++;
    offset = found + unit.length;
  }
  return count;
}
export default function ZeroWidthSpaceLogic(): void {
  describe('ZeroWidthSpaceLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => {
          resolve();
        }, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0001
     * @tc.desc explicit short sequence 1
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0001';
        InterfaceTestLog.begin(name, 'explicit short sequence 1');
        const input: string = '';
        const snapshot: string = input;
        const expected: string = '';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 0, input.length);
        expect(input.length).assertEqual(0);
        InterfaceTestLog.number(name, 'source scalar count', 0, countScalars(input));
        expect(countScalars(input)).assertEqual(0);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 0, actual.length);
        expect(actual.length).assertEqual(0);
        InterfaceTestLog.number(name, 'output scalar count', 0, countScalars(actual));
        expect(countScalars(actual)).assertEqual(0);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 0, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(0);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '';
        const last: string = '';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NA\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BA\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0002
     * @tc.desc explicit short sequence 2
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0002';
        InterfaceTestLog.begin(name, 'explicit short sequence 2');
        const input: string = 'A';
        const snapshot: string = input;
        const expected: string = 'A';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'source scalar count', 1, countScalars(input));
        expect(countScalars(input)).assertEqual(1);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 0, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(0);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'A';
        const last: string = 'A';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NB\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BB\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0003
     * @tc.desc explicit short sequence 3
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0003';
        InterfaceTestLog.begin(name, 'explicit short sequence 3');
        const input: string = '\u4E2D';
        const snapshot: string = input;
        const expected: string = '\u4E2D';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'source scalar count', 1, countScalars(input));
        expect(countScalars(input)).assertEqual(1);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 0, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(0);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u4E2D';
        const last: string = '\u4E2D';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NC\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BC\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0004
     * @tc.desc explicit short sequence 4
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0004';
        InterfaceTestLog.begin(name, 'explicit short sequence 4');
        const input: string = '\u0000';
        const snapshot: string = input;
        const expected: string = '\u0000';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'source scalar count', 1, countScalars(input));
        expect(countScalars(input)).assertEqual(1);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 0, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(0);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0000';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'ND\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BD\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0005
     * @tc.desc explicit short sequence 5
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0005';
        InterfaceTestLog.begin(name, 'explicit short sequence 5');
        const input: string = '\u200B';
        const snapshot: string = input;
        const expected: string = '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'source scalar count', 1, countScalars(input));
        expect(countScalars(input)).assertEqual(1);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.number(name, 'source existing separators', 1, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(1);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NE\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BE\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0006
     * @tc.desc explicit short sequence 6
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0006';
        InterfaceTestLog.begin(name, 'explicit short sequence 6');
        const input: string = '\uD83D\uDE00';
        const snapshot: string = input;
        const expected: string = '\uD83D\uDE00';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 1, countScalars(input));
        expect(countScalars(input)).assertEqual(1);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 2, actual.length);
        expect(actual.length).assertEqual(2);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 0, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(0);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\uD83D\uDE00';
        const last: string = '\uD83D\uDE00';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const pair0: string = '\uD83D\uDE00';
        InterfaceTestLog.number(name, 'intact supplementary 0', 1, countOccurrences(actual, pair0));
        expect(countOccurrences(actual, pair0)).assertEqual(1);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NF\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BF\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0007
     * @tc.desc explicit short sequence 7
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0007';
        InterfaceTestLog.begin(name, 'explicit short sequence 7');
        const input: string = 'e\u0301';
        const snapshot: string = input;
        const expected: string = 'e\u200B\u0301';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'e';
        const last: string = '\u0301';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NG\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BG\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0008
     * @tc.desc explicit short sequence 8
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0008';
        InterfaceTestLog.begin(name, 'explicit short sequence 8');
        const input: string = 'A\u200BB';
        const snapshot: string = input;
        const expected: string = 'A\u200B\u200B\u200BB';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 3, input.length);
        expect(input.length).assertEqual(3);
        InterfaceTestLog.number(name, 'source scalar count', 3, countScalars(input));
        expect(countScalars(input)).assertEqual(3);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 5, actual.length);
        expect(actual.length).assertEqual(5);
        InterfaceTestLog.number(name, 'output scalar count', 5, countScalars(actual));
        expect(countScalars(actual)).assertEqual(5);
        InterfaceTestLog.number(name, 'source existing separators', 1, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(1);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'A';
        const last: string = 'B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NH\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BH\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0009
     * @tc.desc explicit short sequence 9
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0009';
        InterfaceTestLog.begin(name, 'explicit short sequence 9');
        const input: string = '\u200BA';
        const snapshot: string = input;
        const expected: string = '\u200B\u200BA';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 1, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(1);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 2, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(2);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = 'A';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NI\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BI\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0010
     * @tc.desc explicit short sequence 10
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0010',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0010';
        InterfaceTestLog.begin(name, 'explicit short sequence 10');
        const input: string = 'A\u200B';
        const snapshot: string = input;
        const expected: string = 'A\u200B\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 1, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(1);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 2, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(2);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'A';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NJ\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BJ\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0011
     * @tc.desc explicit short sequence 11
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0011',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0011';
        InterfaceTestLog.begin(name, 'explicit short sequence 11');
        const input: string = '\u200B\u200B\u200B\u200B';
        const snapshot: string = input;
        const expected: string = '\u200B\u200B\u200B\u200B\u200B\u200B\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4, input.length);
        expect(input.length).assertEqual(4);
        InterfaceTestLog.number(name, 'source scalar count', 4, countScalars(input));
        expect(countScalars(input)).assertEqual(4);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7, actual.length);
        expect(actual.length).assertEqual(7);
        InterfaceTestLog.number(name, 'output scalar count', 7, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7);
        InterfaceTestLog.number(name, 'source existing separators', 4, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(4);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 7, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(7);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NK\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BK\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0012
     * @tc.desc explicit short sequence 12
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0012',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0012';
        InterfaceTestLog.begin(name, 'explicit short sequence 12');
        const input: string = '\u000D\u000A';
        const snapshot: string = input;
        const expected: string = '\u000D\u000A';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 1, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(1);
        InterfaceTestLog.number(name, 'output UTF16 length', 2, actual.length);
        expect(actual.length).assertEqual(2);
        InterfaceTestLog.number(name, 'output scalar count', 2, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 0, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(0);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u000D';
        const last: string = '\u000A';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NL\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BL\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0013
     * @tc.desc explicit short sequence 13
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0013',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0013';
        InterfaceTestLog.begin(name, 'explicit short sequence 13');
        const input: string = '\uD83D\uDE00\uD83D\uDE80';
        const snapshot: string = input;
        const expected: string = '\uD83D\uDE00\u200B\uD83D\uDE80';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4, input.length);
        expect(input.length).assertEqual(4);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 5, actual.length);
        expect(actual.length).assertEqual(5);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\uD83D\uDE00';
        const last: string = '\uD83D\uDE80';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const pair0: string = '\uD83D\uDE00';
        InterfaceTestLog.number(name, 'intact supplementary 0', 1, countOccurrences(actual, pair0));
        expect(countOccurrences(actual, pair0)).assertEqual(1);
        const pair1: string = '\uD83D\uDE80';
        InterfaceTestLog.number(name, 'intact supplementary 1', 1, countOccurrences(actual, pair1));
        expect(countOccurrences(actual, pair1)).assertEqual(1);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NM\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BM\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0014
     * @tc.desc explicit short sequence 14
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0014',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0014';
        InterfaceTestLog.begin(name, 'explicit short sequence 14');
        const input: string = '\u0301\u0308';
        const snapshot: string = input;
        const expected: string = '\u0301\u200B\u0308';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0301';
        const last: string = '\u0308';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NN\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BN\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0015
     * @tc.desc explicit short sequence 15
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0015',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0015';
        InterfaceTestLog.begin(name, 'explicit short sequence 15');
        const input: string = '\uD800';
        const snapshot: string = input;
        const expected: string = '\uD800';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'source scalar count', 1, countScalars(input));
        expect(countScalars(input)).assertEqual(1);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 0, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(0);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\uD800';
        const last: string = '\uD800';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NO\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BO\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0016
     * @tc.desc explicit short sequence 16
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0016',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0016';
        InterfaceTestLog.begin(name, 'explicit short sequence 16');
        const input: string = '\uDC00X';
        const snapshot: string = input;
        const expected: string = '\uDC00\u200BX';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\uDC00';
        const last: string = 'X';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NP\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BP\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0017
     * @tc.desc ASCII, 2 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0017',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0017';
        InterfaceTestLog.begin(name, 'ASCII, 2 known units');
        const input: string = 'K'.repeat(2);
        const snapshot: string = input;
        const expected: string =
          'K\u200B' +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NQ\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BQ\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0018
     * @tc.desc ASCII, 3 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0018',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0018';
        InterfaceTestLog.begin(name, 'ASCII, 3 known units');
        const input: string = 'K'.repeat(3);
        const snapshot: string = input;
        const expected: string =
          'K\u200B'.repeat(2) +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 3, input.length);
        expect(input.length).assertEqual(3);
        InterfaceTestLog.number(name, 'source scalar count', 3, countScalars(input));
        expect(countScalars(input)).assertEqual(3);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 5, actual.length);
        expect(actual.length).assertEqual(5);
        InterfaceTestLog.number(name, 'output scalar count', 5, countScalars(actual));
        expect(countScalars(actual)).assertEqual(5);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 2, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(2);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NR\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BR\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0019
     * @tc.desc ASCII, 17 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0019',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0019';
        InterfaceTestLog.begin(name, 'ASCII, 17 known units');
        const input: string = 'K'.repeat(17);
        const snapshot: string = input;
        const expected: string =
          'K\u200B'.repeat(16) +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 17, input.length);
        expect(input.length).assertEqual(17);
        InterfaceTestLog.number(name, 'source scalar count', 17, countScalars(input));
        expect(countScalars(input)).assertEqual(17);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 33, actual.length);
        expect(actual.length).assertEqual(33);
        InterfaceTestLog.number(name, 'output scalar count', 33, countScalars(actual));
        expect(countScalars(actual)).assertEqual(33);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 16, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(16);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NS\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BS\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0020
     * @tc.desc ASCII, 1998 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0020',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0020';
        InterfaceTestLog.begin(name, 'ASCII, 1998 known units');
        const input: string = 'K'.repeat(1998);
        const snapshot: string = input;
        const expected: string =
          'K\u200B'.repeat(1997) +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'source scalar count', 1998, countScalars(input));
        expect(countScalars(input)).assertEqual(1998);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3995, actual.length);
        expect(actual.length).assertEqual(3995);
        InterfaceTestLog.number(name, 'output scalar count', 3995, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3995);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1997, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1997);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NT\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BT\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0021
     * @tc.desc ASCII, 1999 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0021',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0021';
        InterfaceTestLog.begin(name, 'ASCII, 1999 known units');
        const input: string = 'K'.repeat(1999);
        const snapshot: string = input;
        const expected: string =
          'K\u200B'.repeat(1998) +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'source scalar count', 1999, countScalars(input));
        expect(countScalars(input)).assertEqual(1999);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3997, actual.length);
        expect(actual.length).assertEqual(3997);
        InterfaceTestLog.number(name, 'output scalar count', 3997, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3997);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1998, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1998);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NU\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BU\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0022
     * @tc.desc ASCII, 2000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0022',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0022';
        InterfaceTestLog.begin(name, 'ASCII, 2000 known units');
        const input: string = 'K'.repeat(2000);
        const snapshot: string = input;
        const expected: string =
          'K\u200B'.repeat(1999) +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'source scalar count', 2000, countScalars(input));
        expect(countScalars(input)).assertEqual(2000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3999, actual.length);
        expect(actual.length).assertEqual(3999);
        InterfaceTestLog.number(name, 'output scalar count', 3999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3999);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NV\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BV\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0023
     * @tc.desc ASCII, 2001 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0023',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0023';
        InterfaceTestLog.begin(name, 'ASCII, 2001 known units');
        const input: string = 'K'.repeat(2001);
        const snapshot: string = input;
        const expected: string =
          'K\u200B'.repeat(2000) +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'source scalar count', 2001, countScalars(input));
        expect(countScalars(input)).assertEqual(2001);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 4001, actual.length);
        expect(actual.length).assertEqual(4001);
        InterfaceTestLog.number(name, 'output scalar count', 4001, countScalars(actual));
        expect(countScalars(actual)).assertEqual(4001);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 2000, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(2000);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NW\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BW\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0024
     * @tc.desc ASCII, 4000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0024',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0024';
        InterfaceTestLog.begin(name, 'ASCII, 4000 known units');
        const input: string = 'K'.repeat(4000);
        const snapshot: string = input;
        const expected: string =
          'K\u200B'.repeat(3999) +
          'K';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'source scalar count', 4000, countScalars(input));
        expect(countScalars(input)).assertEqual(4000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7999, actual.length);
        expect(actual.length).assertEqual(7999);
        InterfaceTestLog.number(name, 'output scalar count', 7999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7999);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'K';
        const last: string = 'K';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NX\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BX\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0025
     * @tc.desc Han, 2 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0025',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0025';
        InterfaceTestLog.begin(name, 'Han, 2 known units');
        const input: string = '\u6587'.repeat(2);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B' +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NY\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BY\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0026
     * @tc.desc Han, 3 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0026',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0026';
        InterfaceTestLog.begin(name, 'Han, 3 known units');
        const input: string = '\u6587'.repeat(3);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B'.repeat(2) +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 3, input.length);
        expect(input.length).assertEqual(3);
        InterfaceTestLog.number(name, 'source scalar count', 3, countScalars(input));
        expect(countScalars(input)).assertEqual(3);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 5, actual.length);
        expect(actual.length).assertEqual(5);
        InterfaceTestLog.number(name, 'output scalar count', 5, countScalars(actual));
        expect(countScalars(actual)).assertEqual(5);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 2, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(2);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NZ\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BZ\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0027
     * @tc.desc Han, 17 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0027',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0027';
        InterfaceTestLog.begin(name, 'Han, 17 known units');
        const input: string = '\u6587'.repeat(17);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B'.repeat(16) +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 17, input.length);
        expect(input.length).assertEqual(17);
        InterfaceTestLog.number(name, 'source scalar count', 17, countScalars(input));
        expect(countScalars(input)).assertEqual(17);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 33, actual.length);
        expect(actual.length).assertEqual(33);
        InterfaceTestLog.number(name, 'output scalar count', 33, countScalars(actual));
        expect(countScalars(actual)).assertEqual(33);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 16, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(16);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NA\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BA\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0028
     * @tc.desc Han, 1998 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0028',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0028';
        InterfaceTestLog.begin(name, 'Han, 1998 known units');
        const input: string = '\u6587'.repeat(1998);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B'.repeat(1997) +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'source scalar count', 1998, countScalars(input));
        expect(countScalars(input)).assertEqual(1998);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3995, actual.length);
        expect(actual.length).assertEqual(3995);
        InterfaceTestLog.number(name, 'output scalar count', 3995, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3995);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1997, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1997);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NB\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BB\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0029
     * @tc.desc Han, 1999 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0029',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0029';
        InterfaceTestLog.begin(name, 'Han, 1999 known units');
        const input: string = '\u6587'.repeat(1999);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B'.repeat(1998) +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'source scalar count', 1999, countScalars(input));
        expect(countScalars(input)).assertEqual(1999);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3997, actual.length);
        expect(actual.length).assertEqual(3997);
        InterfaceTestLog.number(name, 'output scalar count', 3997, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3997);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1998, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1998);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NC\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BC\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0030
     * @tc.desc Han, 2000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0030',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0030';
        InterfaceTestLog.begin(name, 'Han, 2000 known units');
        const input: string = '\u6587'.repeat(2000);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B'.repeat(1999) +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'source scalar count', 2000, countScalars(input));
        expect(countScalars(input)).assertEqual(2000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3999, actual.length);
        expect(actual.length).assertEqual(3999);
        InterfaceTestLog.number(name, 'output scalar count', 3999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3999);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 1999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(1999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'ND\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BD\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0031
     * @tc.desc Han, 2001 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0031',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0031';
        InterfaceTestLog.begin(name, 'Han, 2001 known units');
        const input: string = '\u6587'.repeat(2001);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B'.repeat(2000) +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'source scalar count', 2001, countScalars(input));
        expect(countScalars(input)).assertEqual(2001);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 4001, actual.length);
        expect(actual.length).assertEqual(4001);
        InterfaceTestLog.number(name, 'output scalar count', 4001, countScalars(actual));
        expect(countScalars(actual)).assertEqual(4001);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 2000, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(2000);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NE\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BE\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0032
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0032
     * @tc.desc Han, 4000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0032',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0032';
        InterfaceTestLog.begin(name, 'Han, 4000 known units');
        const input: string = '\u6587'.repeat(4000);
        const snapshot: string = input;
        const expected: string =
          '\u6587\u200B'.repeat(3999) +
          '\u6587';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'source scalar count', 4000, countScalars(input));
        expect(countScalars(input)).assertEqual(4000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7999, actual.length);
        expect(actual.length).assertEqual(7999);
        InterfaceTestLog.number(name, 'output scalar count', 7999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7999);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u6587';
        const last: string = '\u6587';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NF\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BF\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0033
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0033
     * @tc.desc NUL TAB, 2 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0033',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0033';
        InterfaceTestLog.begin(name, 'NUL TAB, 2 known units');
        const input: string = '\u0000\u0009'.repeat(2);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B' +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4, input.length);
        expect(input.length).assertEqual(4);
        InterfaceTestLog.number(name, 'source scalar count', 4, countScalars(input));
        expect(countScalars(input)).assertEqual(4);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7, actual.length);
        expect(actual.length).assertEqual(7);
        InterfaceTestLog.number(name, 'output scalar count', 7, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NG\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BG\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0034
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0034
     * @tc.desc NUL TAB, 3 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0034',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0034';
        InterfaceTestLog.begin(name, 'NUL TAB, 3 known units');
        const input: string = '\u0000\u0009'.repeat(3);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B'.repeat(2) +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 6, input.length);
        expect(input.length).assertEqual(6);
        InterfaceTestLog.number(name, 'source scalar count', 6, countScalars(input));
        expect(countScalars(input)).assertEqual(6);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 11, actual.length);
        expect(actual.length).assertEqual(11);
        InterfaceTestLog.number(name, 'output scalar count', 11, countScalars(actual));
        expect(countScalars(actual)).assertEqual(11);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 5, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(5);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NH\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BH\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0035
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0035
     * @tc.desc NUL TAB, 17 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0035',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0035';
        InterfaceTestLog.begin(name, 'NUL TAB, 17 known units');
        const input: string = '\u0000\u0009'.repeat(17);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B'.repeat(16) +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 34, input.length);
        expect(input.length).assertEqual(34);
        InterfaceTestLog.number(name, 'source scalar count', 34, countScalars(input));
        expect(countScalars(input)).assertEqual(34);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 67, actual.length);
        expect(actual.length).assertEqual(67);
        InterfaceTestLog.number(name, 'output scalar count', 67, countScalars(actual));
        expect(countScalars(actual)).assertEqual(67);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 33, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(33);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NI\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BI\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0036
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0036
     * @tc.desc NUL TAB, 1998 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0036',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0036';
        InterfaceTestLog.begin(name, 'NUL TAB, 1998 known units');
        const input: string = '\u0000\u0009'.repeat(1998);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B'.repeat(1997) +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 3996, input.length);
        expect(input.length).assertEqual(3996);
        InterfaceTestLog.number(name, 'source scalar count', 3996, countScalars(input));
        expect(countScalars(input)).assertEqual(3996);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7991, actual.length);
        expect(actual.length).assertEqual(7991);
        InterfaceTestLog.number(name, 'output scalar count', 7991, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7991);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3995, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3995);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NJ\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BJ\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0037
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0037
     * @tc.desc NUL TAB, 1999 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0037',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0037';
        InterfaceTestLog.begin(name, 'NUL TAB, 1999 known units');
        const input: string = '\u0000\u0009'.repeat(1999);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B'.repeat(1998) +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 3998, input.length);
        expect(input.length).assertEqual(3998);
        InterfaceTestLog.number(name, 'source scalar count', 3998, countScalars(input));
        expect(countScalars(input)).assertEqual(3998);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7995, actual.length);
        expect(actual.length).assertEqual(7995);
        InterfaceTestLog.number(name, 'output scalar count', 7995, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7995);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3997, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3997);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NK\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BK\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0038
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0038
     * @tc.desc NUL TAB, 2000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0038',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0038';
        InterfaceTestLog.begin(name, 'NUL TAB, 2000 known units');
        const input: string = '\u0000\u0009'.repeat(2000);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B'.repeat(1999) +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'source scalar count', 4000, countScalars(input));
        expect(countScalars(input)).assertEqual(4000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7999, actual.length);
        expect(actual.length).assertEqual(7999);
        InterfaceTestLog.number(name, 'output scalar count', 7999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7999);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NL\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BL\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0039
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0039
     * @tc.desc NUL TAB, 2001 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0039',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0039';
        InterfaceTestLog.begin(name, 'NUL TAB, 2001 known units');
        const input: string = '\u0000\u0009'.repeat(2001);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B'.repeat(2000) +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4002, input.length);
        expect(input.length).assertEqual(4002);
        InterfaceTestLog.number(name, 'source scalar count', 4002, countScalars(input));
        expect(countScalars(input)).assertEqual(4002);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 8003, actual.length);
        expect(actual.length).assertEqual(8003);
        InterfaceTestLog.number(name, 'output scalar count', 8003, countScalars(actual));
        expect(countScalars(actual)).assertEqual(8003);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 4001, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(4001);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NM\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BM\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0040
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0040
     * @tc.desc NUL TAB, 4000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0040',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0040';
        InterfaceTestLog.begin(name, 'NUL TAB, 4000 known units');
        const input: string = '\u0000\u0009'.repeat(4000);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u200B\u0009\u200B'.repeat(3999) +
          '\u0000\u200B\u0009';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 8000, input.length);
        expect(input.length).assertEqual(8000);
        InterfaceTestLog.number(name, 'source scalar count', 8000, countScalars(input));
        expect(countScalars(input)).assertEqual(8000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 15999, actual.length);
        expect(actual.length).assertEqual(15999);
        InterfaceTestLog.number(name, 'output scalar count', 15999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(15999);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 7999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(7999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u0000';
        const last: string = '\u0009';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NN\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BN\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0041
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0041
     * @tc.desc existing separator, 2 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0041',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0041';
        InterfaceTestLog.begin(name, 'existing separator, 2 known units');
        const input: string = '\u200B'.repeat(2);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B' +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'source scalar count', 2, countScalars(input));
        expect(countScalars(input)).assertEqual(2);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3, actual.length);
        expect(actual.length).assertEqual(3);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.number(name, 'source existing separators', 2, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(2);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NO\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BO\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0042
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0042
     * @tc.desc existing separator, 3 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0042',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0042';
        InterfaceTestLog.begin(name, 'existing separator, 3 known units');
        const input: string = '\u200B'.repeat(3);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B'.repeat(2) +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 3, input.length);
        expect(input.length).assertEqual(3);
        InterfaceTestLog.number(name, 'source scalar count', 3, countScalars(input));
        expect(countScalars(input)).assertEqual(3);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 5, actual.length);
        expect(actual.length).assertEqual(5);
        InterfaceTestLog.number(name, 'output scalar count', 5, countScalars(actual));
        expect(countScalars(actual)).assertEqual(5);
        InterfaceTestLog.number(name, 'source existing separators', 3, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(3);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 5, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(5);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NP\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BP\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0043
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0043
     * @tc.desc existing separator, 17 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0043',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0043';
        InterfaceTestLog.begin(name, 'existing separator, 17 known units');
        const input: string = '\u200B'.repeat(17);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B'.repeat(16) +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 17, input.length);
        expect(input.length).assertEqual(17);
        InterfaceTestLog.number(name, 'source scalar count', 17, countScalars(input));
        expect(countScalars(input)).assertEqual(17);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 33, actual.length);
        expect(actual.length).assertEqual(33);
        InterfaceTestLog.number(name, 'output scalar count', 33, countScalars(actual));
        expect(countScalars(actual)).assertEqual(33);
        InterfaceTestLog.number(name, 'source existing separators', 17, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(17);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 33, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(33);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NQ\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BQ\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0044
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0044
     * @tc.desc existing separator, 1998 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0044',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0044';
        InterfaceTestLog.begin(name, 'existing separator, 1998 known units');
        const input: string = '\u200B'.repeat(1998);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B'.repeat(1997) +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'source scalar count', 1998, countScalars(input));
        expect(countScalars(input)).assertEqual(1998);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3995, actual.length);
        expect(actual.length).assertEqual(3995);
        InterfaceTestLog.number(name, 'output scalar count', 3995, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3995);
        InterfaceTestLog.number(name, 'source existing separators', 1998, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(1998);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3995, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3995);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NR\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BR\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0045
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0045
     * @tc.desc existing separator, 1999 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0045',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0045';
        InterfaceTestLog.begin(name, 'existing separator, 1999 known units');
        const input: string = '\u200B'.repeat(1999);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B'.repeat(1998) +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'source scalar count', 1999, countScalars(input));
        expect(countScalars(input)).assertEqual(1999);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3997, actual.length);
        expect(actual.length).assertEqual(3997);
        InterfaceTestLog.number(name, 'output scalar count', 3997, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3997);
        InterfaceTestLog.number(name, 'source existing separators', 1999, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(1999);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3997, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3997);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NS\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BS\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0046
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0046
     * @tc.desc existing separator, 2000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0046',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0046';
        InterfaceTestLog.begin(name, 'existing separator, 2000 known units');
        const input: string = '\u200B'.repeat(2000);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B'.repeat(1999) +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'source scalar count', 2000, countScalars(input));
        expect(countScalars(input)).assertEqual(2000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 3999, actual.length);
        expect(actual.length).assertEqual(3999);
        InterfaceTestLog.number(name, 'output scalar count', 3999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3999);
        InterfaceTestLog.number(name, 'source existing separators', 2000, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(2000);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NT\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BT\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0047
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0047
     * @tc.desc existing separator, 2001 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0047',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0047';
        InterfaceTestLog.begin(name, 'existing separator, 2001 known units');
        const input: string = '\u200B'.repeat(2001);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B'.repeat(2000) +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'source scalar count', 2001, countScalars(input));
        expect(countScalars(input)).assertEqual(2001);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 4001, actual.length);
        expect(actual.length).assertEqual(4001);
        InterfaceTestLog.number(name, 'output scalar count', 4001, countScalars(actual));
        expect(countScalars(actual)).assertEqual(4001);
        InterfaceTestLog.number(name, 'source existing separators', 2001, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(2001);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 4001, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(4001);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NU\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BU\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0048
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0048
     * @tc.desc existing separator, 4000 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0048',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0048';
        InterfaceTestLog.begin(name, 'existing separator, 4000 known units');
        const input: string = '\u200B'.repeat(4000);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u200B'.repeat(3999) +
          '\u200B';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'source scalar count', 4000, countScalars(input));
        expect(countScalars(input)).assertEqual(4000);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7999, actual.length);
        expect(actual.length).assertEqual(7999);
        InterfaceTestLog.number(name, 'output scalar count', 7999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7999);
        InterfaceTestLog.number(name, 'source existing separators', 4000, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(4000);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 7999, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(7999);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = '\u200B';
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NV\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BV\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';
        const mixedExpected: string =
          'A\u200B\u000D\u000A\u200BB\u200B' +
          '\u000A\u200B\u000D\u200BC\u200B' +
          '\u000D\u200B\u200B\u200B\u000A\u200BD';
        const mixedActual: string = insertZeroWidthSpaces(mixedInput);
        InterfaceTestLog.value(name, 'fixed mixed CRLF LFCR existing ZWSP', mixedExpected, mixedActual);
        expect(mixedActual).assertEqual(mixedExpected);
        InterfaceTestLog.number(name, 'mixed UTF16 length', 20, mixedActual.length);
        expect(mixedActual.length).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed scalar count', 20, countScalars(mixedActual));
        expect(countScalars(mixedActual)).assertEqual(20);
        InterfaceTestLog.number(name, 'mixed original plus inserted ZWSP', 10, countOccurrences(mixedActual, '\u200B'));
        expect(countOccurrences(mixedActual, '\u200B')).assertEqual(10);
        InterfaceTestLog.value(name, 'mixed source immutable',
          'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD', mixedInput);
        expect(mixedInput).assertEqual('A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD');
        InterfaceTestLog.value(name, 'no neighbor pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final original preserved', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0049
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0049
     * @tc.desc combining accent, 2 known units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0049',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_ZEROWIDTH_0049';
        InterfaceTestLog.begin(name, 'combining accent, 2 known units');
        const input: string = 'e\u0301'.repeat(2);
        const snapshot: string = input;
        const expected: string =
          'e\u200B\u0301\u200B' +
          'e\u200B\u0301';
        const actual: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'independent sequence oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'source UTF16 length', 4, input.length);
        expect(input.length).assertEqual(4);
        InterfaceTestLog.number(name, 'source scalar count', 4, countScalars(input));
        expect(countScalars(input)).assertEqual(4);
        InterfaceTestLog.number(name, 'source CRLF pairs', 0, countOccurrences(input, '\r\n'));
        expect(countOccurrences(input, '\r\n')).assertEqual(0);
        InterfaceTestLog.number(name, 'output UTF16 length', 7, actual.length);
        expect(actual.length).assertEqual(7);
        InterfaceTestLog.number(name, 'output scalar count', 7, countScalars(actual));
        expect(countScalars(actual)).assertEqual(7);
        InterfaceTestLog.number(name, 'source existing separators', 0, countOccurrences(input, '\u200B'));
        expect(countOccurrences(input, '\u200B')).assertEqual(0);
        InterfaceTestLog.number(name, 'existing plus inserted separators', 3, countOccurrences(actual, '\u200B'));
        expect(countOccurrences(actual, '\u200B')).assertEqual(3);
        InterfaceTestLog.value(name, 'source characters retained', snapshot, input);
        expect(input).assertEqual(snapshot);
        const first: string = 'e';
        const last: string = '\u0301';
        InterfaceTestLog.value(name, 'no new leading separator', first, actual.substring(0, first.length));
        expect(actual.substring(0, first.length)).assertEqual(first);
        InterfaceTestLog.value(name, 'no new trailing separator', last, actual.substring(actual.length - last.length));
        expect(actual.substring(actual.length - last.length)).assertEqual(last);
        const repeat: string = insertZeroWidthSpaces(input);
        InterfaceTestLog.value(name, 'same input repeat oracle', expected, repeat);
        expect(repeat).assertEqual(expected);
        const empty: string = insertZeroWidthSpaces('');
        InterfaceTestLog.value(name, 'empty isolation', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'NW\uD83D\uDE80';
        const neighborExpected: string = 'N\u200BW\u200B\uD83D\uDE80';
        const neighborOutput: string = insertZeroWidthSpaces(neighbor);
        InterfaceTestLog.value(name, 'independent neighbor oracle', neighborExpected, neighborOutput);
        expect(neighborOutput).assertEqual(neighborExpected);
        InterfaceTestLog.number(name, 'neighbor scalar count', 5, countScalars(neighborOutput));
        expect(countScalars(neighborOutput)).assertEqual(5);
        const afterNeighbor: string = insertZeroWidthSpaces(input);
        const mixedInput: string = 'A\u000D\u000AB\u000A\u000DC\u000D\u200B\u000AD';