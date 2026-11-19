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
import { limitDisplayText, MAX_DISPLAY_LENGTH } from '../../../main/ets/utils/DisplayText';
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
function hasNewTerminalHighSurrogate(source: string, output: string): boolean {
  if (output.length === 0 || output.length >= source.length) {
    return false;
  }
  const last: number = output.charCodeAt(output.length - 1);
  const following: number = source.charCodeAt(output.length);
  return last >= 0xD800 && last <= 0xDBFF && following >= 0xDC00 && following <= 0xDFFF;
}
export default function DisplayLimitLogic(): void {
  describe('DisplayLimitLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => {
          resolve();
        }, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0001
     * @tc.desc empty
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0001';
        InterfaceTestLog.begin(name, 'empty');
        const input: string = '';
        const snapshot: string = input;
        const expected: string = '';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 0, actual.length);
        expect(actual.length).assertEqual(0);
        InterfaceTestLog.number(name, 'UTF16 source length', 0, input.length);
        expect(input.length).assertEqual(0);
        InterfaceTestLog.number(name, 'output scalar count', 0, countScalars(actual));
        expect(countScalars(actual)).assertEqual(0);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'a\u90BB\uD83D\uDE80\u00000';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0002
     * @tc.desc single ASCII
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0002';
        InterfaceTestLog.begin(name, 'single ASCII');
        const input: string = 'A';
        const snapshot: string = input;
        const expected: string = 'A';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'UTF16 source length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'A';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'b\u90BB\uD83D\uDE80\u00001';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0003
     * @tc.desc single BMP Han
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0003';
        InterfaceTestLog.begin(name, 'single BMP Han');
        const input: string = '\u4E2D';
        const snapshot: string = input;
        const expected: string = '\u4E2D';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'UTF16 source length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u4E2D';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'c\u90BB\uD83D\uDE80\u00002';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0004
     * @tc.desc single NUL
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0004';
        InterfaceTestLog.begin(name, 'single NUL');
        const input: string = '\u0000';
        const snapshot: string = input;
        const expected: string = '\u0000';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'UTF16 source length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0000';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'd\u90BB\uD83D\uDE80\u00003';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0005
     * @tc.desc existing zero width
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0005';
        InterfaceTestLog.begin(name, 'existing zero width');
        const input: string = '\u200B';
        const snapshot: string = input;
        const expected: string = '\u200B';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1, actual.length);
        expect(actual.length).assertEqual(1);
        InterfaceTestLog.number(name, 'UTF16 source length', 1, input.length);
        expect(input.length).assertEqual(1);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u200B';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'e\u90BB\uD83D\uDE80\u00004';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0006
     * @tc.desc combining sequence
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0006';
        InterfaceTestLog.begin(name, 'combining sequence');
        const input: string = 'e\u0301';
        const snapshot: string = input;
        const expected: string = 'e\u0301';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2, actual.length);
        expect(actual.length).assertEqual(2);
        InterfaceTestLog.number(name, 'UTF16 source length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'output scalar count', 2, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'e\u0301';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'f\u90BB\uD83D\uDE80\u00005';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0007
     * @tc.desc single supplementary scalar
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0007';
        InterfaceTestLog.begin(name, 'single supplementary scalar');
        const input: string = '\uD83D\uDE00';
        const snapshot: string = input;
        const expected: string = '\uD83D\uDE00';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2, actual.length);
        expect(actual.length).assertEqual(2);
        InterfaceTestLog.number(name, 'UTF16 source length', 2, input.length);
        expect(input.length).assertEqual(2);
        InterfaceTestLog.number(name, 'output scalar count', 1, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\uD83D\uDE00';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'g\u90BB\uD83D\uDE80\u00006';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0008
     * @tc.desc mixed controls
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0008';
        InterfaceTestLog.begin(name, 'mixed controls');
        const input: string = 'A\u0000\u0009\u000D\u000A\u4E2D';
        const snapshot: string = input;
        const expected: string = 'A\u0000\u0009\u000D\u000A\u4E2D';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 6, actual.length);
        expect(actual.length).assertEqual(6);
        InterfaceTestLog.number(name, 'UTF16 source length', 6, input.length);
        expect(input.length).assertEqual(6);
        InterfaceTestLog.number(name, 'output scalar count', 6, countScalars(actual));
        expect(countScalars(actual)).assertEqual(6);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'A\u0000\u0009\u000D\u000A\u4E2D';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'h\u90BB\uD83D\uDE80\u00007';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0009
     * @tc.desc ZWJ cluster
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0009';
        InterfaceTestLog.begin(name, 'ZWJ cluster');
        const input: string = '\uD83D\uDC69\u200D\uD83D\uDCBB';
        const snapshot: string = input;
        const expected: string = '\uD83D\uDC69\u200D\uD83D\uDCBB';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 5, actual.length);
        expect(actual.length).assertEqual(5);
        InterfaceTestLog.number(name, 'UTF16 source length', 5, input.length);
        expect(input.length).assertEqual(5);
        InterfaceTestLog.number(name, 'output scalar count', 3, countScalars(actual));
        expect(countScalars(actual)).assertEqual(3);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\uD83D\uDC69\u200D\uD83D\uDCBB';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'i\u90BB\uD83D\uDE80\u00008';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0010
     * @tc.desc repeated emoji cut at complete pair
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0010',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0010';
        InterfaceTestLog.begin(name, 'repeated emoji cut at complete pair');
        const input: string = '\uD83D\uDE80'.repeat(1001);
        const snapshot: string = input;
        const expected: string = '\uD83D\uDE80'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2002, input.length);
        expect(input.length).assertEqual(2002);
        InterfaceTestLog.number(name, 'output scalar count', 1000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\uD83D\uDE80\uD83D\uDE80\uD83D\uDE80\uD83D\uDE80';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'j\u90BB\uD83D\uDE80\u00009';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 6, neighborResult.length);
        expect(neighborResult.length).assertEqual(6);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0011
     * @tc.desc one BMP then repeated pairs cut inside pair
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0011',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0011';
        InterfaceTestLog.begin(name, 'one BMP then repeated pairs cut inside pair');
        const input: string =
          'Z' +
          '\uD801\uDC00'.repeat(1000);
        const snapshot: string = input;
        const expected: string =
          'Z' +
          '\uD801\uDC00'.repeat(999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\uD801\uDC00\uD801\uDC00\uD801\uDC00\uD801\uDC00';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'k\u90BB\uD83D\uDE80\u000010';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0012
     * @tc.desc combining mark after cap is not normalized
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0012',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0012';
        InterfaceTestLog.begin(name, 'combining mark after cap is not normalized');
        const input: string =
          'e'.repeat(2000) +
          '\u0301';
        const snapshot: string = input;
        const expected: string = 'e'.repeat(2000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'eeeeeeee';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'l\u90BB\uD83D\uDE80\u000011';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0013
     * @tc.desc motif 1, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0013',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0013';
        InterfaceTestLog.begin(name, 'motif 1, intact 1998 UTF16 units');
        const input: string = '\u6C49'.repeat(1998);
        const snapshot: string = input;
        const expected: string = '\u6C49'.repeat(1998);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'm\u90BB\uD83D\uDE80\u000012';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0014
     * @tc.desc motif 1, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0014',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0014';
        InterfaceTestLog.begin(name, 'motif 1, intact 1999 UTF16 units');
        const input: string = '\u6C49'.repeat(1999);
        const snapshot: string = input;
        const expected: string = '\u6C49'.repeat(1999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'n\u90BB\uD83D\uDE80\u000013';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0015
     * @tc.desc motif 1, intact 2000 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0015',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0015';
        InterfaceTestLog.begin(name, 'motif 1, intact 2000 UTF16 units');
        const input: string = '\u6C49'.repeat(2000);
        const snapshot: string = input;
        const expected: string = '\u6C49'.repeat(2000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'o\u90BB\uD83D\uDE80\u000014';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0016
     * @tc.desc motif 1, pair spans cap, input 2001
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0016',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0016';
        InterfaceTestLog.begin(name, 'motif 1, pair spans cap, input 2001');
        const input: string =
          '\u6C49'.repeat(1999) +
          '\uD83D\uDE42';
        const snapshot: string = input;
        const expected: string = '\u6C49'.repeat(1999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'p\u90BB\uD83D\uDE80\u000015';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0017
     * @tc.desc motif 1, pair ends at cap, input 4000
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0017',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0017';
        InterfaceTestLog.begin(name, 'motif 1, pair ends at cap, input 4000');
        const input: string =
          '\u6C49'.repeat(1998) +
          '\uD83D\uDE42' +
          'B'.repeat(2000);
        const snapshot: string = input;
        const expected: string =
          '\u6C49'.repeat(1998) +
          '\uD83D\uDE42';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\uD83D\uDE42';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'q\u90BB\uD83D\uDE80\u000016';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0018
     * @tc.desc motif 1, long tail, input 4097
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0018',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0018';
        InterfaceTestLog.begin(name, 'motif 1, long tail, input 4097');
        const input: string =
          '\u6C49'.repeat(2000) +
          '\u0001' +
          '\u000D\u000A'.repeat(1048);
        const snapshot: string = input;
        const expected: string = '\u6C49'.repeat(2000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4097, input.length);
        expect(input.length).assertEqual(4097);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49\u6C49';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'r\u90BB\uD83D\uDE80\u000017';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0019
     * @tc.desc motif 2, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0019',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0019';
        InterfaceTestLog.begin(name, 'motif 2, intact 1998 UTF16 units');
        const input: string = 'B'.repeat(1998);
        const snapshot: string = input;
        const expected: string = 'B'.repeat(1998);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'BBBBBBBB';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 's\u90BB\uD83D\uDE80\u000018';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0020
     * @tc.desc motif 2, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0020',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0020';
        InterfaceTestLog.begin(name, 'motif 2, intact 1999 UTF16 units');
        const input: string = 'B'.repeat(1999);
        const snapshot: string = input;
        const expected: string = 'B'.repeat(1999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'BBBBBBBB';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 't\u90BB\uD83D\uDE80\u000019';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0021
     * @tc.desc motif 2, intact 2000 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0021',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0021';
        InterfaceTestLog.begin(name, 'motif 2, intact 2000 UTF16 units');
        const input: string = 'B'.repeat(2000);
        const snapshot: string = input;
        const expected: string = 'B'.repeat(2000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'BBBBBBBB';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'u\u90BB\uD83D\uDE80\u000020';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0022
     * @tc.desc motif 2, pair spans cap, input 2001
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0022',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0022';
        InterfaceTestLog.begin(name, 'motif 2, pair spans cap, input 2001');
        const input: string =
          'B'.repeat(1999) +
          '\uD83D\uDE42';
        const snapshot: string = input;
        const expected: string = 'B'.repeat(1999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'BBBBBBBB';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'v\u90BB\uD83D\uDE80\u000021';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0023
     * @tc.desc motif 2, pair ends at cap, input 4000
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0023',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0023';
        InterfaceTestLog.begin(name, 'motif 2, pair ends at cap, input 4000');
        const input: string =
          'B'.repeat(1998) +
          '\uD83D\uDE42' +
          '\u0000\u0009'.repeat(1000);
        const snapshot: string = input;
        const expected: string =
          'B'.repeat(1998) +
          '\uD83D\uDE42';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'BBBBBB\uD83D\uDE42';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'w\u90BB\uD83D\uDE80\u000022';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0024
     * @tc.desc motif 2, long tail, input 4097
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0024',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0024';
        InterfaceTestLog.begin(name, 'motif 2, long tail, input 4097');
        const input: string =
          'B'.repeat(2000) +
          '\u0001' +
          '\u200B\u4E2D'.repeat(1048);
        const snapshot: string = input;
        const expected: string = 'B'.repeat(2000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4097, input.length);
        expect(input.length).assertEqual(4097);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'BBBBBBBB';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'x\u90BB\uD83D\uDE80\u000023';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0025
     * @tc.desc motif 3, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0025',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0025';
        InterfaceTestLog.begin(name, 'motif 3, intact 1998 UTF16 units');
        const input: string = '\u0000\u0009'.repeat(999);
        const snapshot: string = input;
        const expected: string = '\u0000\u0009'.repeat(999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0000\u0009\u0000\u0009\u0000\u0009\u0000\u0009';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'y\u90BB\uD83D\uDE80\u000024';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0026
     * @tc.desc motif 3, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0026',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0026';
        InterfaceTestLog.begin(name, 'motif 3, intact 1999 UTF16 units');
        const input: string =
          '\u0000\u0009'.repeat(999) +
          '~';
        const snapshot: string = input;
        const expected: string =
          '\u0000\u0009'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0009\u0000\u0009\u0000\u0009\u0000\u0009~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'z\u90BB\uD83D\uDE80\u000025';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0027
     * @tc.desc motif 3, intact 2000 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0027',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0027';
        InterfaceTestLog.begin(name, 'motif 3, intact 2000 UTF16 units');
        const input: string = '\u0000\u0009'.repeat(1000);
        const snapshot: string = input;
        const expected: string = '\u0000\u0009'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0000\u0009\u0000\u0009\u0000\u0009\u0000\u0009';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'a\u90BB\uD83D\uDE80\u000026';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0028
     * @tc.desc motif 3, pair spans cap, input 2001
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0028',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0028';
        InterfaceTestLog.begin(name, 'motif 3, pair spans cap, input 2001');
        const input: string =
          '\u0000\u0009'.repeat(999) +
          '~' +
          '\uD83D\uDE42';
        const snapshot: string = input;
        const expected: string =
          '\u0000\u0009'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0009\u0000\u0009\u0000\u0009\u0000\u0009~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'b\u90BB\uD83D\uDE80\u000027';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0029
     * @tc.desc motif 3, pair ends at cap, input 4000
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0029',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0029';
        InterfaceTestLog.begin(name, 'motif 3, pair ends at cap, input 4000');
        const input: string =
          '\u0000\u0009'.repeat(999) +
          '\uD83D\uDE42' +
          '\u000D\u000A'.repeat(1000);
        const snapshot: string = input;
        const expected: string =
          '\u0000\u0009'.repeat(999) +
          '\uD83D\uDE42';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0000\u0009\u0000\u0009\u0000\u0009\uD83D\uDE42';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'c\u90BB\uD83D\uDE80\u000028';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0030
     * @tc.desc motif 3, long tail, input 4097
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0030',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0030';
        InterfaceTestLog.begin(name, 'motif 3, long tail, input 4097');
        const input: string =
          '\u0000\u0009'.repeat(1000) +
          '\u0001' +
          'e\u0301'.repeat(1048);
        const snapshot: string = input;
        const expected: string = '\u0000\u0009'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4097, input.length);
        expect(input.length).assertEqual(4097);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0000\u0009\u0000\u0009\u0000\u0009\u0000\u0009';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'd\u90BB\uD83D\uDE80\u000029';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0031
     * @tc.desc motif 4, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0031',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0031';
        InterfaceTestLog.begin(name, 'motif 4, intact 1998 UTF16 units');
        const input: string = '\u000D\u000A'.repeat(999);
        const snapshot: string = input;
        const expected: string = '\u000D\u000A'.repeat(999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u000D\u000A\u000D\u000A\u000D\u000A\u000D\u000A';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'e\u90BB\uD83D\uDE80\u000030';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0032
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0032
     * @tc.desc motif 4, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0032',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0032';
        InterfaceTestLog.begin(name, 'motif 4, intact 1999 UTF16 units');
        const input: string =
          '\u000D\u000A'.repeat(999) +
          '~';
        const snapshot: string = input;
        const expected: string =
          '\u000D\u000A'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u000A\u000D\u000A\u000D\u000A\u000D\u000A~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'f\u90BB\uD83D\uDE80\u000031';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0033
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0033
     * @tc.desc motif 4, intact 2000 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0033',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0033';
        InterfaceTestLog.begin(name, 'motif 4, intact 2000 UTF16 units');
        const input: string = '\u000D\u000A'.repeat(1000);
        const snapshot: string = input;
        const expected: string = '\u000D\u000A'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u000D\u000A\u000D\u000A\u000D\u000A\u000D\u000A';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'g\u90BB\uD83D\uDE80\u000032';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0034
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0034
     * @tc.desc motif 4, pair spans cap, input 2001
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0034',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0034';
        InterfaceTestLog.begin(name, 'motif 4, pair spans cap, input 2001');
        const input: string =
          '\u000D\u000A'.repeat(999) +
          '~' +
          '\uD83D\uDE42';
        const snapshot: string = input;
        const expected: string =
          '\u000D\u000A'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u000A\u000D\u000A\u000D\u000A\u000D\u000A~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'h\u90BB\uD83D\uDE80\u000033';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0035
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0035
     * @tc.desc motif 4, pair ends at cap, input 4000
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0035',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0035';
        InterfaceTestLog.begin(name, 'motif 4, pair ends at cap, input 4000');
        const input: string =
          '\u000D\u000A'.repeat(999) +
          '\uD83D\uDE42' +
          '\u200B\u4E2D'.repeat(1000);
        const snapshot: string = input;
        const expected: string =
          '\u000D\u000A'.repeat(999) +
          '\uD83D\uDE42';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u000D\u000A\u000D\u000A\u000D\u000A\uD83D\uDE42';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'i\u90BB\uD83D\uDE80\u000034';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0036
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0036
     * @tc.desc motif 4, long tail, input 4097
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0036',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0036';
        InterfaceTestLog.begin(name, 'motif 4, long tail, input 4097');
        const input: string =
          '\u000D\u000A'.repeat(1000) +
          '\u0001' +
          '\u4E2D7'.repeat(1048);
        const snapshot: string = input;
        const expected: string = '\u000D\u000A'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4097, input.length);
        expect(input.length).assertEqual(4097);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u000D\u000A\u000D\u000A\u000D\u000A\u000D\u000A';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'j\u90BB\uD83D\uDE80\u000035';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0037
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0037
     * @tc.desc motif 5, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0037',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0037';
        InterfaceTestLog.begin(name, 'motif 5, intact 1998 UTF16 units');
        const input: string = '\u200B\u4E2D'.repeat(999);
        const snapshot: string = input;
        const expected: string = '\u200B\u4E2D'.repeat(999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'k\u90BB\uD83D\uDE80\u000036';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0038
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0038
     * @tc.desc motif 5, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0038',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0038';
        InterfaceTestLog.begin(name, 'motif 5, intact 1999 UTF16 units');
        const input: string =
          '\u200B\u4E2D'.repeat(999) +
          '~';
        const snapshot: string = input;
        const expected: string =
          '\u200B\u4E2D'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u4E2D\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'l\u90BB\uD83D\uDE80\u000037';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0039
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0039
     * @tc.desc motif 5, intact 2000 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0039',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0039';
        InterfaceTestLog.begin(name, 'motif 5, intact 2000 UTF16 units');
        const input: string = '\u200B\u4E2D'.repeat(1000);
        const snapshot: string = input;
        const expected: string = '\u200B\u4E2D'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'm\u90BB\uD83D\uDE80\u000038';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0040
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0040
     * @tc.desc motif 5, pair spans cap, input 2001
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0040',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0040';
        InterfaceTestLog.begin(name, 'motif 5, pair spans cap, input 2001');
        const input: string =
          '\u200B\u4E2D'.repeat(999) +
          '~' +
          '\uD83D\uDE42';
        const snapshot: string = input;
        const expected: string =
          '\u200B\u4E2D'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u4E2D\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'n\u90BB\uD83D\uDE80\u000039';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0041
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0041
     * @tc.desc motif 5, pair ends at cap, input 4000
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0041',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0041';
        InterfaceTestLog.begin(name, 'motif 5, pair ends at cap, input 4000');
        const input: string =
          '\u200B\u4E2D'.repeat(999) +
          '\uD83D\uDE42' +
          'e\u0301'.repeat(1000);
        const snapshot: string = input;
        const expected: string =
          '\u200B\u4E2D'.repeat(999) +
          '\uD83D\uDE42';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D\uD83D\uDE42';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'o\u90BB\uD83D\uDE80\u000040';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0042
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0042
     * @tc.desc motif 5, long tail, input 4097
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0042',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0042';
        InterfaceTestLog.begin(name, 'motif 5, long tail, input 4097');
        const input: string =
          '\u200B\u4E2D'.repeat(1000) +
          '\u0001' +
          '\u0308Q'.repeat(1048);
        const snapshot: string = input;
        const expected: string = '\u200B\u4E2D'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4097, input.length);
        expect(input.length).assertEqual(4097);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D\u200B\u4E2D';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'p\u90BB\uD83D\uDE80\u000041';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0043
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0043
     * @tc.desc motif 6, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0043',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0043';
        InterfaceTestLog.begin(name, 'motif 6, intact 1998 UTF16 units');
        const input: string = 'e\u0301'.repeat(999);
        const snapshot: string = input;
        const expected: string = 'e\u0301'.repeat(999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'e\u0301e\u0301e\u0301e\u0301';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'q\u90BB\uD83D\uDE80\u000042';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0044
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0044
     * @tc.desc motif 6, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0044',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0044';
        InterfaceTestLog.begin(name, 'motif 6, intact 1999 UTF16 units');
        const input: string =
          'e\u0301'.repeat(999) +
          '~';
        const snapshot: string = input;
        const expected: string =
          'e\u0301'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0301e\u0301e\u0301e\u0301~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'r\u90BB\uD83D\uDE80\u000043';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0045
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0045
     * @tc.desc motif 6, intact 2000 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0045',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0045';
        InterfaceTestLog.begin(name, 'motif 6, intact 2000 UTF16 units');
        const input: string = 'e\u0301'.repeat(1000);
        const snapshot: string = input;
        const expected: string = 'e\u0301'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'e\u0301e\u0301e\u0301e\u0301';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 's\u90BB\uD83D\uDE80\u000044';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0046
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0046
     * @tc.desc motif 6, pair spans cap, input 2001
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0046',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0046';
        InterfaceTestLog.begin(name, 'motif 6, pair spans cap, input 2001');
        const input: string =
          'e\u0301'.repeat(999) +
          '~' +
          '\uD83D\uDE42';
        const snapshot: string = input;
        const expected: string =
          'e\u0301'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0301e\u0301e\u0301e\u0301~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 't\u90BB\uD83D\uDE80\u000045';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0047
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0047
     * @tc.desc motif 6, pair ends at cap, input 4000
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0047',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0047';
        InterfaceTestLog.begin(name, 'motif 6, pair ends at cap, input 4000');
        const input: string =
          'e\u0301'.repeat(999) +
          '\uD83D\uDE42' +
          '\u4E2D7'.repeat(1000);
        const snapshot: string = input;
        const expected: string =
          'e\u0301'.repeat(999) +
          '\uD83D\uDE42';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'e\u0301e\u0301e\u0301\uD83D\uDE42';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'u\u90BB\uD83D\uDE80\u000046';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0048
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0048
     * @tc.desc motif 6, long tail, input 4097
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0048',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0048';
        InterfaceTestLog.begin(name, 'motif 6, long tail, input 4097');
        const input: string =
          'e\u0301'.repeat(1000) +
          '\u0001' +
          '\uD83D\uDE00'.repeat(1048);
        const snapshot: string = input;
        const expected: string = 'e\u0301'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4097, input.length);
        expect(input.length).assertEqual(4097);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'e\u0301e\u0301e\u0301e\u0301';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'v\u90BB\uD83D\uDE80\u000047';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0049
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0049
     * @tc.desc motif 7, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0049',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0049';
        InterfaceTestLog.begin(name, 'motif 7, intact 1998 UTF16 units');
        const input: string = '\u4E2D7'.repeat(999);
        const snapshot: string = input;
        const expected: string = '\u4E2D7'.repeat(999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u4E2D7\u4E2D7\u4E2D7\u4E2D7';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'w\u90BB\uD83D\uDE80\u000048';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0050
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0050
     * @tc.desc motif 7, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0050',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0050';
        InterfaceTestLog.begin(name, 'motif 7, intact 1999 UTF16 units');
        const input: string =
          '\u4E2D7'.repeat(999) +
          '~';
        const snapshot: string = input;
        const expected: string =
          '\u4E2D7'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '7\u4E2D7\u4E2D7\u4E2D7~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'x\u90BB\uD83D\uDE80\u000049';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0051
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0051
     * @tc.desc motif 7, intact 2000 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0051',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0051';
        InterfaceTestLog.begin(name, 'motif 7, intact 2000 UTF16 units');
        const input: string = '\u4E2D7'.repeat(1000);
        const snapshot: string = input;
        const expected: string = '\u4E2D7'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 2000, input.length);
        expect(input.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u4E2D7\u4E2D7\u4E2D7\u4E2D7';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'y\u90BB\uD83D\uDE80\u000050';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0052
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0052
     * @tc.desc motif 7, pair spans cap, input 2001
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0052',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0052';
        InterfaceTestLog.begin(name, 'motif 7, pair spans cap, input 2001');
        const input: string =
          '\u4E2D7'.repeat(999) +
          '~' +
          '\uD83D\uDE42';
        const snapshot: string = input;
        const expected: string =
          '\u4E2D7'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 2001, input.length);
        expect(input.length).assertEqual(2001);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '7\u4E2D7\u4E2D7\u4E2D7~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'z\u90BB\uD83D\uDE80\u000051';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0053
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0053
     * @tc.desc motif 7, pair ends at cap, input 4000
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0053',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0053';
        InterfaceTestLog.begin(name, 'motif 7, pair ends at cap, input 4000');
        const input: string =
          '\u4E2D7'.repeat(999) +
          '\uD83D\uDE42' +
          '\u0308Q'.repeat(1000);
        const snapshot: string = input;
        const expected: string =
          '\u4E2D7'.repeat(999) +
          '\uD83D\uDE42';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4000, input.length);
        expect(input.length).assertEqual(4000);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u4E2D7\u4E2D7\u4E2D7\uD83D\uDE42';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'a\u90BB\uD83D\uDE80\u000052';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0054
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0054
     * @tc.desc motif 7, long tail, input 4097
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0054',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0054';
        InterfaceTestLog.begin(name, 'motif 7, long tail, input 4097');
        const input: string =
          '\u4E2D7'.repeat(1000) +
          '\u0001' +
          '\u4E2D\uD83D\uDE80'.repeat(698) +
          '~'.repeat(2);
        const snapshot: string = input;
        const expected: string = '\u4E2D7'.repeat(1000);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 2000, actual.length);
        expect(actual.length).assertEqual(2000);
        InterfaceTestLog.number(name, 'UTF16 source length', 4097, input.length);
        expect(input.length).assertEqual(4097);
        InterfaceTestLog.number(name, 'output scalar count', 2000, countScalars(actual));
        expect(countScalars(actual)).assertEqual(2000);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u4E2D7\u4E2D7\u4E2D7\u4E2D7';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'b\u90BB\uD83D\uDE80\u000053';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0055
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0055
     * @tc.desc motif 8, intact 1998 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0055',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0055';
        InterfaceTestLog.begin(name, 'motif 8, intact 1998 UTF16 units');
        const input: string = '\u0308Q'.repeat(999);
        const snapshot: string = input;
        const expected: string = '\u0308Q'.repeat(999);
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1998, actual.length);
        expect(actual.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'UTF16 source length', 1998, input.length);
        expect(input.length).assertEqual(1998);
        InterfaceTestLog.number(name, 'output scalar count', 1998, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1998);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = '\u0308Q\u0308Q\u0308Q\u0308Q';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'c\u90BB\uD83D\uDE80\u000054';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0056
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0056
     * @tc.desc motif 8, intact 1999 UTF16 units
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0056',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
        const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_TEXT_LIMIT_0056';
        InterfaceTestLog.begin(name, 'motif 8, intact 1999 UTF16 units');
        const input: string =
          '\u0308Q'.repeat(999) +
          '~';
        const snapshot: string = input;
        const expected: string =
          '\u0308Q'.repeat(999) +
          '~';
        const actual: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'complete oracle', expected, actual);
        expect(actual).assertEqual(expected);
        InterfaceTestLog.number(name, 'UTF16 output length', 1999, actual.length);
        expect(actual.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'UTF16 source length', 1999, input.length);
        expect(input.length).assertEqual(1999);
        InterfaceTestLog.number(name, 'output scalar count', 1999, countScalars(actual));
        expect(countScalars(actual)).assertEqual(1999);
        InterfaceTestLog.flag(name, 'within display cap', actual.length <= MAX_DISPLAY_LENGTH);
        expect(actual.length <= MAX_DISPLAY_LENGTH).assertTrue();
        InterfaceTestLog.flag(name, 'no new split pair', !hasNewTerminalHighSurrogate(input, actual));
        expect(!hasNewTerminalHighSurrogate(input, actual)).assertTrue();
        InterfaceTestLog.value(name, 'source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        const last: string = 'Q\u0308Q\u0308Q\u0308Q~';
        InterfaceTestLog.value(name, 'exact trailing units', last, actual.substring(Math.max(0, actual.length - 8)));
        expect(actual.substring(Math.max(0, actual.length - 8))).assertEqual(last);
        const again: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'repeat complete oracle', expected, again);
        expect(again).assertEqual(expected);
        const idempotent: string = limitDisplayText(actual);
        InterfaceTestLog.value(name, 'already limited stays exact', expected, idempotent);
        expect(idempotent).assertEqual(expected);
        const empty: string = limitDisplayText('');
        InterfaceTestLog.value(name, 'empty does not inherit state', '', empty);
        expect(empty).assertEqual('');
        const neighbor: string = 'd\u90BB\uD83D\uDE80\u000055';
        const neighborResult: string = limitDisplayText(neighbor);
        InterfaceTestLog.value(name, 'adjacent independent input', neighbor, neighborResult);
        expect(neighborResult).assertEqual(neighbor);
        InterfaceTestLog.number(name, 'neighbor UTF16 length', 7, neighborResult.length);
        expect(neighborResult.length).assertEqual(7);
        const afterNeighbor: string = limitDisplayText(input);
        InterfaceTestLog.value(name, 'no adjacent call pollution', expected, afterNeighbor);
        expect(afterNeighbor).assertEqual(expected);
        InterfaceTestLog.value(name, 'final source immutable', snapshot, input);
        expect(input).assertEqual(snapshot);
        InterfaceTestLog.flag(name, 'post-call pair boundary', !hasNewTerminalHighSurrogate(input, afterNeighbor));
        expect(!hasNewTerminalHighSurrogate(input, afterNeighbor)).assertTrue();
        InterfaceTestLog.end(name);
      });